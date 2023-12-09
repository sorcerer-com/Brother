#ifndef FSBROWSER_H
#define FSBROWSER_H

#include <WebServer.h>
#include <FS.h>

#ifdef FSBROWSER_DEBUG
#define DBG_PRINT(...) Serial.print(__VA_ARGS__)
#define DBG_PRINTLN(...) Serial.println(__VA_ARGS__)
#else
#define DBG_PRINT(...)
#define DBG_PRINTLN(...)
#endif

#define INCLUDE_FALLBACK_INDEX_HTM

#ifdef INCLUDE_FALLBACK_INDEX_HTM
#include "FSBrowser_index_htm.h"
#endif

static const char TEXT_PLAIN[] PROGMEM = "text/plain";
static const char FS_INIT_ERROR[] PROGMEM = "FS INIT ERROR";
static const char FILE_NOT_FOUND[] PROGMEM = "FileNotFound";

class FsBrowser {
private:
  WebServer& server;
  String& fsName;  // empty if FS is not OK
  FS* fileSystem;

  File uploadFile;

public:
  FsBrowser(WebServer& _server, String& _fsName, FS* _fileSystem)
    : server(_server), fsName(_fsName), fileSystem(_fileSystem) {

    // WEB SERVER INIT
    // Filesystem status
    server.on("/status", HTTP_GET, [&]() {
      handleStatus();
    });

    // List directory
    server.on("/list", HTTP_GET, [&]() {
      handleFileList();
    });

    // Load editor
    server.on("/edit", HTTP_GET, [&]() {
      handleGetEdit();
    });

    // Create file
    server.on("/edit", HTTP_PUT, [&]() {
      handleFileCreate();
    });

    // Delete file
    server.on("/edit", HTTP_DELETE, [&]() {
      handleFileDelete();
    });

    // Upload file
    // - first callback is called after the request has ended with all parsed arguments
    // - second callback handles file upload at that location
    server.on(
      "/edit", HTTP_POST, [&]() {
        replyOK();
      },
      [&]() {
        handleFileUpload();
      });

    // Default handler for all URIs not defined above
    // Use it to read files from filesystem
    server.onNotFound([&]() {
      handleNotFound();
    });
  }

private:
  ////////////////////////////////
  // Utils to return HTTP codes, and determine content-type

  void replyOK() {
    server.send(200, FPSTR(TEXT_PLAIN), "");
  }

  void replyOKWithMsg(String msg) {
    server.send(200, FPSTR(TEXT_PLAIN), msg);
  }

  void replyNotFound(String msg) {
    server.send(404, FPSTR(TEXT_PLAIN), msg);
  }

  void replyBadRequest(String msg) {
    DBG_PRINTLN(msg);
    server.send(400, FPSTR(TEXT_PLAIN), msg + "\r\n");
  }

  void replyServerError(String msg) {
    DBG_PRINTLN(msg);
    server.send(500, FPSTR(TEXT_PLAIN), msg + "\r\n");
  }


  ////////////////////////////////
  // Request handlers

  /*
       Return the FS type, status and size info
    */
  void handleStatus() {
    DBG_PRINTLN("handleStatus");
    String json;
    json.reserve(128);

    json = "{\"type\":\"";
    json += fsName;
    json += "\", \"isOk\":";
    if (fsName != "") {
      fs::F_Fat* ffat = (fs::F_Fat*)fileSystem;
      json += F("\"true\", \"totalBytes\":\"");
      json += ffat->totalBytes();
      json += F("\", \"usedBytes\":\"");
      json += ffat->usedBytes();
      json += "\"";
    } else {
      json += "\"false\"";
    }
    json += "}";

    server.send(200, "application/json", json);
  }


  /*
       Return the list of files in the directory specified by the "dir" query string parameter.
       Also demonstrates the use of chunked responses.
    */
  void handleFileList() {
    if (fsName == "") { return replyServerError(FPSTR(FS_INIT_ERROR)); }

    if (!server.hasArg("dir")) { return replyBadRequest(F("DIR ARG MISSING")); }

    String path = server.arg("dir");
    if (path != "/" && !fileSystem->exists(path)) { return replyBadRequest("BAD PATH"); }

    DBG_PRINTLN(String("handleFileList: ") + path);
    File root = fileSystem->open(path);
    path = String();

    String output = "[";
    if (root.isDirectory()) {
      File file = root.openNextFile();
      while (file) {
        if (output != "[") {
          output += ',';
        }
        output += "{\"type\":\"";
        if (file.isDirectory()) {
          output += "dir";
        } else {
          output += F("file\",\"size\":\"");
          output += file.size();
        }
        output += "\",\"name\":\"";
        output += String(file.path()).substring(1);
        output += "\"}";
        file = root.openNextFile();
      }
    }
    output += "]";
    server.send(200, "text/json", output);
  }


  /*
       Read the given file from the filesystem and stream it back to the client
    */
  bool handleFileRead(String path) {
    DBG_PRINTLN(String("handleFileRead: ") + path);
    if (fsName == "") {
      replyServerError(FPSTR(FS_INIT_ERROR));
      return true;
    }

    if (path.endsWith("/")) { path += "index.htm"; }

    String contentType;
    if (server.hasArg("download")) {
      contentType = F("application/octet-stream");
    } else {
      contentType = getContentType(path);
    }

    if (!fileSystem->exists(path)) {
      // File not found, try gzip version
      path = path + ".gz";
    }
    if (fileSystem->exists(path)) {
      File file = fileSystem->open(path, "r");
      if (server.streamFile(file, contentType) != file.size()) { DBG_PRINTLN("Sent less data than expected!"); }
      file.close();
      return true;
    }

    return false;
  }

  String getContentType(String filename) {
    if (server.hasArg("download")) {
      return "application/octet-stream";
    } else if (filename.endsWith(".htm")) {
      return "text/html";
    } else if (filename.endsWith(".html")) {
      return "text/html";
    } else if (filename.endsWith(".css")) {
      return "text/css";
    } else if (filename.endsWith(".js")) {
      return "application/javascript";
    } else if (filename.endsWith(".png")) {
      return "image/png";
    } else if (filename.endsWith(".gif")) {
      return "image/gif";
    } else if (filename.endsWith(".jpg")) {
      return "image/jpeg";
    } else if (filename.endsWith(".ico")) {
      return "image/x-icon";
    } else if (filename.endsWith(".xml")) {
      return "text/xml";
    } else if (filename.endsWith(".pdf")) {
      return "application/x-pdf";
    } else if (filename.endsWith(".zip")) {
      return "application/x-zip";
    } else if (filename.endsWith(".gz")) {
      return "application/x-gzip";
    }
    return "text/plain";
  }


  /*
       As some FS (e.g. LittleFS) delete the parent folder when the last child has been removed,
       return the path of the closest parent still existing
    */
  String lastExistingParent(String path) {
    while (!path.isEmpty() && !fileSystem->exists(path)) {
      if (path.lastIndexOf('/') > 0) {
        path = path.substring(0, path.lastIndexOf('/'));
      } else {
        path = String();  // No slash => the top folder does not exist
      }
    }
    DBG_PRINTLN(String("Last existing parent: ") + path);
    return path;
  }

  /*
       Handle the creation/rename of a new file
       Operation      | req.responseText
       ---------------+--------------------------------------------------------------
       Create file    | parent of created file
       Create folder  | parent of created folder
       Rename file    | parent of source file
       Move file      | parent of source file, or remaining ancestor
       Rename folder  | parent of source folder
       Move folder    | parent of source folder, or remaining ancestor
    */
  void handleFileCreate() {
    if (fsName == "") { return replyServerError(FPSTR(FS_INIT_ERROR)); }

    String path = server.arg("path");
    if (path.isEmpty()) { return replyBadRequest(F("PATH ARG MISSING")); }

    if (path == "/") { return replyBadRequest("BAD PATH"); }
    if (fileSystem->exists(path)) { return replyBadRequest(F("PATH FILE EXISTS")); }

    String src = server.arg("src");
    if (src.isEmpty()) {
      // No source specified: creation
      DBG_PRINTLN(String("handleFileCreate: ") + path);
      if (path.endsWith("/")) {
        // Create a folder
        path.remove(path.length() - 1);
        if (!fileSystem->mkdir(path)) { return replyServerError(F("MKDIR FAILED")); }
      } else {
        // Create a file
        File file = fileSystem->open(path, "w");
        if (file) {
          file.write(0);
          file.close();
        } else {
          return replyServerError(F("CREATE FAILED"));
        }
      }
      if (path.lastIndexOf('/') > -1) { path = path.substring(0, path.lastIndexOf('/')); }
      replyOKWithMsg(path);
    } else {
      // Source specified: rename
      if (src == "/") { return replyBadRequest("BAD SRC"); }
      if (!fileSystem->exists(src)) { return replyBadRequest(F("SRC FILE NOT FOUND")); }

      DBG_PRINTLN(String("handleFileCreate: ") + path + " from " + src);

      if (path.endsWith("/")) { path.remove(path.length() - 1); }
      if (src.endsWith("/")) { src.remove(src.length() - 1); }
      if (!fileSystem->rename(src, path)) { return replyServerError(F("RENAME FAILED")); }
      replyOKWithMsg(lastExistingParent(src));
    }
  }


  /*
       Delete the file or folder designed by the given path.
       If it's a file, delete it.
       If it's a folder, delete all nested contents first then the folder itself
       IMPORTANT NOTE: using recursion is generally not recommended on embedded devices and can lead to crashes (stack overflow errors).
       This use is just for demonstration purpose, and FSBrowser might crash in case of deeply nested filesystems.
       Please don't do this on a production system.
    */
  void deleteRecursive(String path) {
    File file = fileSystem->open(path, "r");
    bool isDir = file.isDirectory();
    file.close();

    // If it's a plain file, delete it
    if (!isDir) {
      fileSystem->remove(path);
      return;
    }

    File f = file.openNextFile();
    while (f) { deleteRecursive(path + '/' + f.name()); }

    // Then delete the folder itself
    fileSystem->rmdir(path);
  }


  /*
       Handle a file deletion request
       Operation      | req.responseText
       ---------------+--------------------------------------------------------------
       Delete file    | parent of deleted file, or remaining ancestor
       Delete folder  | parent of deleted folder, or remaining ancestor
    */
  void handleFileDelete() {
    if (fsName == "") { return replyServerError(FPSTR(FS_INIT_ERROR)); }

    String path = server.arg(0);
    if (path.isEmpty() || path == "/") { return replyBadRequest("BAD PATH"); }

    DBG_PRINTLN(String("handleFileDelete: ") + path);
    if (!fileSystem->exists(path)) { return replyNotFound(FPSTR(FILE_NOT_FOUND)); }
    deleteRecursive(path);

    replyOKWithMsg(lastExistingParent(path));
  }

  /*
       Handle a file upload request
    */
  void handleFileUpload() {
    if (fsName == "") { return replyServerError(FPSTR(FS_INIT_ERROR)); }
    if (server.uri() != "/edit") { return; }
    HTTPUpload& upload = server.upload();
    if (upload.status == UPLOAD_FILE_START) {
      String filename = upload.filename;
      // Make sure paths always start with "/"
      if (!filename.startsWith("/")) { filename = "/" + filename; }
      DBG_PRINTLN(String("handleFileUpload Name: ") + filename);
      uploadFile = fileSystem->open(filename, "w");
      if (!uploadFile) { return replyServerError(F("CREATE FAILED")); }
      DBG_PRINTLN(String("Upload: START, filename: ") + filename);
    } else if (upload.status == UPLOAD_FILE_WRITE) {
      if (uploadFile) {
        size_t bytesWritten = uploadFile.write(upload.buf, upload.currentSize);
        if (bytesWritten != upload.currentSize) { return replyServerError(F("WRITE FAILED")); }
      }
      DBG_PRINTLN(String("Upload: WRITE, Bytes: ") + upload.currentSize);
    } else if (upload.status == UPLOAD_FILE_END) {
      if (uploadFile) { uploadFile.close(); }
      DBG_PRINTLN(String("Upload: END, Size: ") + upload.totalSize);
    }
  }


  /*
       The "Not Found" handler catches all URI not explicitly declared in code
       First try to find and return the requested file from the filesystem,
       and if it fails, return a 404 page with debug information
    */
  void handleNotFound() {
    if (fsName == "") { return replyServerError(FPSTR(FS_INIT_ERROR)); }

    String uri = WebServer::urlDecode(server.uri());  // required to read paths with blanks

    if (handleFileRead(uri)) { return; }

    // Dump debug data
    String message;
    message.reserve(100);
    message = F("Error: File not found\n\nURI: ");
    message += uri;
    message += F("\nMethod: ");
    message += (server.method() == HTTP_GET) ? "GET" : "POST";
    message += F("\nArguments: ");
    message += server.args();
    message += '\n';
    for (uint8_t i = 0; i < server.args(); i++) {
      message += F(" NAME:");
      message += server.argName(i);
      message += F("\n VALUE:");
      message += server.arg(i);
      message += '\n';
    }
    message += "path=";
    message += server.arg("path");
    message += '\n';
    DBG_PRINT(message);

    return replyNotFound(message);
  }

  /*
       This specific handler returns the index.htm (or a gzipped version) from the /edit folder.
       If the file is not present but the flag INCLUDE_FALLBACK_INDEX_HTM has been set, falls back to the version
       embedded in the program code.
       Otherwise, fails with a 404 page with debug information
    */
  void handleGetEdit() {
    if (handleFileRead(F("/edit/index.htm"))) { return; }

#ifdef INCLUDE_FALLBACK_INDEX_HTM
    server.sendHeader(F("Content-Encoding"), "gzip");
    server.send(200, "text/html", String(index_htm_gz, index_htm_gz_len));
#else
    replyNotFound(FPSTR(FILE_NOT_FOUND));
#endif
  }
};

#endif