// U8g2 2.34.22
#include <U8g2lib.h>
// GFX for Arduino 1.4.0
#include <Arduino_GFX_Library.h>
// https://lvgl.io/tools/imageconverter

#include <map>

#include <WiFi.h>
#include <WebServer.h>
#include <HTTPUpdateServer.h>

#include <FFat.h>

#include "FSBrowser.h"
#include "Font/font.c"
#include "Font/font_7segm.c"

#define GFX_BL DF_GFX_BL  // default backlight pin, you may replace DF_GFX_BL to actual backlight pin
#define TFT_BL 2

#define BACKGROUND BLACK
#define BACKLIGHT 256  // 0 - 256

std::map<char, String> lat_cyr = {
  { 'a', "а" },
  { 'A', "А" },
  { 'b', "б" },
  { 'B', "Б" },
  { 'v', "в" },
  { 'V', "В" },
  { 'g', "г" },
  { 'G', "Г" },
  { 'd', "д" },
  { 'D', "Д" },
  { 'e', "е" },
  { 'E', "Е" },
  { 'j', "ж" },
  { 'J', "Ж" },
  { 'z', "з" },
  { 'Z', "З" },
  { 'i', "и" },
  { 'I', "И" },
  { '>', "й" },
  { '<', "Й" },
  { 'k', "к" },
  { 'K', "К" },
  { 'l', "л" },
  { 'L', "Л" },
  { 'm', "м" },
  { 'M', "М" },
  { 'n', "н" },
  { 'N', "Н" },
  { 'o', "о" },
  { 'O', "О" },
  { 'p', "п" },
  { 'P', "П" },
  { 'r', "р" },
  { 'R', "Р" },
  { 's', "с" },
  { 'S', "С" },
  { 't', "т" },
  { 'T', "Т" },
  { 'u', "у" },
  { 'U', "У" },
  { 'f', "ф" },
  { 'F', "Ф" },
  { 'h', "х" },
  { 'H', "Х" },
  { 'c', "ц" },
  { 'C', "Ц" },
  { 'y', "ч" },
  { 'Y', "Ч" },
  { '/', "ш" },
  { '?', "Ш" },
  { '%', "щ" },
  { '&', "Щ" },
  { 'x', "ъ" },
  { 'X', "Ъ" },
  { '#', "ь" },
  { '$', "ѝ" },
  { 'q', "ю" },
  { 'Q', "Ю" },
  { 'w', "я" },
  { 'W', "Я" },
};

WebServer httpServer(80);
HTTPUpdateServer httpUpdater;

String fsName;
FsBrowser fsBrowser(httpServer, fsName, &FFat);

Arduino_ESP32RGBPanel *rgbpanel = new Arduino_ESP32RGBPanel(
  41 /* DE */, 40 /* VSYNC */, 39 /* HSYNC */, 42 /* PCLK */,
  14 /* R0 */, 21 /* R1 */, 47 /* R2 */, 48 /* R3 */, 45 /* R4 */,
  9 /* G0 */, 46 /* G1 */, 3 /* G2 */, 8 /* G3 */, 16 /* G4 */, 1 /* G5 */,
  15 /* B0 */, 7 /* B1 */, 6 /* B2 */, 5 /* B3 */, 4 /* B4 */,
  0 /* hsync_polarity */, 210 /* hsync_front_porch */, 30 /* hsync_pulse_width */, 16 /* hsync_back_porch */,
  0 /* vsync_polarity */, 22 /* vsync_front_porch */, 13 /* vsync_pulse_width */, 10 /* vsync_back_porch */,
  1 /* pclk_active_neg */, 16000000 /* prefer_speed */);

Arduino_RGB_Display *gfx = new Arduino_RGB_Display(
  800 /* width */, 480 /* height */, rgbpanel);

void setup() {
  Serial.begin(115200);
  Serial.println("Start");

  // Filesystem
  fsName = FFat.begin(true) ? "FFat" : "";
  Serial.println(fsName != "" ? F("Filesystem initialized.") : F("Filesystem init failed!"));

  // WiFi
  WiFi.disconnect(false, true);
  delay(100);
  WiFi.mode(WIFI_STA);
  delay(100);
  WiFi.persistent(false);
  delay(100);

  // HTTP server
  httpUpdater.setup(&httpServer);
  httpServer.begin();

  gfx->begin();
  gfx->fillScreen(BACKGROUND);

#ifdef TFT_BL
  pinMode(TFT_BL, OUTPUT);
  analogWrite(TFT_BL, BACKLIGHT);
#endif
}

// image buffer
const uint16_t *image = new uint16_t[800 * 600];

void loop() {
  httpServer.handleClient();

  while (Serial.available() > 0) {
    String cmnd = Serial.readStringUntil('\n');
    cmnd.trim();

    // wifi [<ssid> <pass>]
    if (cmnd.startsWith("wifi")) {
      if (cmnd.indexOf(' ') != -1) {  // STA
        cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
        String ssid = cmnd.substring(0, cmnd.indexOf(' '));
        cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
        String pass = cmnd;

        WiFi.begin(ssid, pass);
        Serial.print("Connecting");
        while (WiFi.status() != WL_CONNECTED) {
          delay(500);
          Serial.print(".");
        }
        Serial.println(WiFi.localIP().toString());
      } else {  // AP
        delay(100);
        char ssid[23];
        snprintf(ssid, 23, "ESP-%llX", ESP.getEfuseMac());
        if (WiFi.softAP(ssid)) {
          delay(100);
          IPAddress ip = WiFi.softAPIP();
          Serial.printf("AP %s IP address: %s\n", ssid, ip.toString());
        }
      }
    }

    // clear [<color:ffffff>]
    if (cmnd.startsWith("clear")) {
      if (cmnd.indexOf(' ') != -1) {
        cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
        String color = cmnd.substring(0, cmnd.indexOf(' '));

        int r = strtol(color.substring(0, 2).c_str(), 0, 16);
        int g = strtol(color.substring(2, 4).c_str(), 0, 16);
        int b = strtol(color.substring(3, 6).c_str(), 0, 16);

        gfx->fillScreen(RGB565(r, g, b));
        Serial.printf("clear %s\n", color);
      } else {
        gfx->fillScreen(BACKGROUND);
        Serial.println("clear");
      }
    }

    // backlight <value:0-256>
    if (cmnd.startsWith("backlight")) {
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int value = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      analogWrite(TFT_BL, max(0, min(256, value)));
      Serial.printf("backlight %d\n", value);
    }

    // text <x> <y> <scale> <color:ffffff> <text>
    if (cmnd.startsWith("text")) {
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int x = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int y = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int scale = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String color = cmnd.substring(0, cmnd.indexOf(' '));
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String text = cmnd;
      Serial.printf("text:%s x:%d y:%d scale:%d color:%s\n", text, x, y, scale, color);

      int r = strtol(color.substring(0, 2).c_str(), 0, 16);
      int g = strtol(color.substring(2, 4).c_str(), 0, 16);
      int b = strtol(color.substring(3, 6).c_str(), 0, 16);

      gfx->setCursor(x, y);
      gfx->setTextSize(scale);
      gfx->setTextColor(RGB565(r, g, b));
      gfx->setUTF8Print(true);
      //gfx->setFont(u8g2_font_unifont_t_cyrillic);
      gfx->setFont(custom_cyrillic);
      //gfx->setFont(custom_7_segm);
      gfx->println(text);
    }

    // segmtext <x> <y> <scale> <color:ffffff> <segmtext>
    if (cmnd.startsWith("segmtext")) {
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int x = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int y = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int scale = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String color = cmnd.substring(0, cmnd.indexOf(' '));
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String segmtext = cmnd;
      Serial.printf("segmtext:%s x:%d y:%d scale:%d color:%s\n", segmtext, x, y, scale, color);

      int r = strtol(color.substring(0, 2).c_str(), 0, 16);
      int g = strtol(color.substring(2, 4).c_str(), 0, 16);
      int b = strtol(color.substring(3, 6).c_str(), 0, 16);

      gfx->setCursor(x, y);
      gfx->setTextSize(scale);
      gfx->setTextColor(RGB565(r, g, b));
      gfx->setUTF8Print(true);
      //gfx->setFont(u8g2_font_unifont_t_cyrillic);
      //gfx->setFont(custom_cyrillic);
      gfx->setFont(custom_7_segm);
      gfx->println(segmtext);
    }

    // cyrtext <x> <y> <scale> <color:ffffff> <text>
    if (cmnd.startsWith("cyrtext")) {
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int x = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int y = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int scale = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String color = cmnd.substring(0, cmnd.indexOf(' '));
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String text = cmnd;
      Serial.printf("cyrtext:%s x:%d y:%d scale:%d color:%s\n", text, x, y, scale, color);

      int r = strtol(color.substring(0, 2).c_str(), 0, 16);
      int g = strtol(color.substring(2, 4).c_str(), 0, 16);
      int b = strtol(color.substring(3, 6).c_str(), 0, 16);

      gfx->setCursor(x, y);
      gfx->setTextSize(scale);
      gfx->setTextColor(RGB565(r, g, b));
      gfx->setUTF8Print(true);
      //gfx->setFont(u8g2_font_unifont_t_cyrillic);
      gfx->setFont(custom_cyrillic);
      //gfx->setFont(custom_7_segm);
      String cyrText;
      for (int i = 0; i < text.length(); i++) {  // convert lat characters to cyr
        if (lat_cyr.find(text[i]) != lat_cyr.end())
          cyrText += lat_cyr[text[i]];
        else
          cyrText += text[i];
      }
      gfx->println(cyrText);
    }


    // image <x> <y> <width> <height> <img.bin>
    if (cmnd.startsWith("image")) {
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int x = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int y = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int width = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      int height = cmnd.substring(0, cmnd.indexOf(' ')).toInt();
      cmnd = cmnd.substring(cmnd.indexOf(' ') + 1);
      String filename = cmnd;
      Serial.printf("image:%s x:%d y:%d width:%d height:%d\n", filename.c_str(), x, y, width, height);

      File file = FFat.open("/" + filename);
      if (file.size() == 0) {
        Serial.println("Invalid file name");
      } else {
        file.read((uint8_t *)image, width * height * 2);

        gfx->draw16bitRGBBitmap(x, y, (uint16_t *)image, width, height);
      }
      file.close();
    }
  }
}
