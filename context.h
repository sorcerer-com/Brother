#ifndef CONTEXT_H
#define CONTEXT_H

#define DEBUG

#include <Wire.h>
// https://arduino-info.wikispaces.com/LCD-Blue-I2C
// https://bitbucket.org/fmalpartida/new-liquidcrystal/downloads
#include <LiquidCrystal_I2C.h>
#include <EEPROM.h>

#include "texts.h"

class Context
{
public:
  // Pin
  const int menuButtonPin     = 2;
  const int buttonsCount      = 5;
  const int buttonsPins[5]    = { 3, 4, 5, 6, 7 };
  const int relaysPins[5][2]  = { { 8, 9 }, { 10, -1 },  { 11, -1 }, { 12, -1 }, { 13, -1 } };
  const int coinAcceptorPins[6] = { A0, A0, A0, A0, A0, A0 };

  // EEPROM
  const struct
  {
    const int buttonsEnabled[5] = { 0x00, 0x01, 0x02, 0x03, 0x04 }; // 1 byte
    const int totals[6]         = { 0x20, 0x30, 0x40, 0x50, 0x60, 0x70 }; // 4 byte
    const int coinTable[6]      = { 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B }; // 1 byte
    const int creditTables[5]   = { 0x25, 0x2B, 0x90, 0x95, 0x9B }; // 2 + 3 * 1 = 5 byte 
    const int autostartValue    = 0x0D; // 1 byte
  } eeprom;

  // Current State
  bool buttonsEnabled[5]  = { true, true, true, true, true};
  unsigned long totals[6] = { 0, 0, 0, 0, 0, 0 }; // last value is total counter
  byte coinTable[6]       = { 100, 100, 100, 100, 100, 100 };
  struct
  {
    int credit = 0;
    byte hour = 0, min = 0, sec = 0;
  } creditTables[5 * 5];
  byte autostartValue     = 0;

  
  const LiquidCrystal_I2C lcd;
  int menuIndex = -1;
  int credit = 0;
  int work = -1;
  long time = 0;


  Context():
    lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE)  // Set the LCD I2C address
  {
  }

  void setupPins() const
  {
  #ifdef DEBUG
    Serial.begin(9600);
    
    String str = String(F("Setup main button pin: ")) + String(menuButtonPin);
    Serial.println(str);
  #endif
    // Menu/Enter Button Pin
    pinMode(menuButtonPin, INPUT_PULLUP);

    // Buttons Pins
    for (int i = 0; i < buttonsCount; i++)
    {
  #ifdef DEBUG
      String str = String(F("Setup button ")) + String(i + 1) + F(" pin: ") + String(buttonsPins[i]);
      Serial.println(str);
  #endif
      pinMode(buttonsPins[i], INPUT_PULLUP);
    }

    // Relays Pins
    for (int i = 0; i < buttonsCount; i++)
    {
      for (int j = 0; j < 2; j++)
      {
        if (relaysPins[i][j] == -1)
          continue;
  #ifdef DEBUG
        String str = String(F("Setup relay ")) + String(i + 1) + F(" pin: ") + String(relaysPins[i][j]);
        Serial.println(str);
  #endif
        pinMode(relaysPins[i][j], OUTPUT);
        digitalWrite(relaysPins[i][j], LOW);
      }
    }

    // Coin Acceptor Pins
    for (int i = 0; i < 6; i++)
    {
  #ifdef DEBUG
      String str = String(F("Setup coin acceptor ")) + String(i + 1) + F(" pin: ") + String(coinAcceptorPins[i]);
      Serial.println(str);
  #endif
      pinMode(coinAcceptorPins[i], INPUT_PULLUP);
    }
  }

  
  void initDisplay() const
  {
#ifdef DEBUG
    Serial.println(F("Initialize LCD"));
#endif
    // initialize the lcd for 16 chars 2 lines, turn on backlight
    lcd.begin(16, 2);
    lcd.backlight();
  }
  
  void refreshDisplay() const
  {
    lcd.clear();
    lcd.setCursor(0, 0); // Cursor Position: (CHAR, LINE) start at 0
    if (menuIndex == -1) // menu is not opened
    {
      bool outOfService = (autostartValue == 0);
      for (int i = 0; i < buttonsCount; i++)
        outOfService &= !buttonsEnabled[i];
      if (outOfService)
      {
        lcd.print(Welcome);
        lcd.setCursor(0, 1);
        lcd.print(OUT);        
      }
      else if (time != 0)
      {
        lcd.print(Time_cyr[work]);
        lcd.setCursor(0, 1);
        byte hour = time / 3600;
        int temp = time - ((int)hour * 3600);
        byte min = temp / 60;
        byte sec = temp % 60;
        lcd.print(F("    "));
        printTime(hour, min, sec);
        lcd.print(F("    "));
      }
      else if (credit != 0)
      {
        lcd.print(Credit_cyr);
        printCredit(credit);
        lcd.setCursor(0, 1);
        lcd.print(Choice_cyr);
      }
      else
      {
        lcd.print(Welcome);
        lcd.setCursor(0, 1);
        lcd.print(Ready_cyr);
      }
    }
    else
      lcd.print(Menu(menuIndex));
  }
  
  
  void readEEPROM() const
  {
#ifdef DEBUG
    Serial.println(F("Read EEPROM"));
#endif
    // buttons enabled
    for (int i = 0; i < buttonsCount; i++)
    {
      if (EEPROM[eeprom.buttonsEnabled[i]] != 0xff)
        EEPROM.get(eeprom.buttonsEnabled[i], buttonsEnabled[i]);
#ifdef DEBUG
      Serial.println(String(F("Read Button ")) + String(i + 1) + F(" enabled: ") + String(buttonsEnabled[i]));
#endif
    }
    // totals
    for (int i = 0; i <= buttonsCount; i++) // last value is total counter
    {
      if (EEPROM[eeprom.totals[i]] != 0xff)
        EEPROM.get(eeprom.totals[i], totals[i]);
#ifdef DEBUG
      Serial.println(String(F("Read Total ")) + String(i + 1) + F(": ") + String(totals[i]));
#endif
    }
    // coint table
    for (int i = 0; i < 6; i++)
    {
      if (EEPROM[eeprom.coinTable[i]] != 0xff)
        EEPROM.get(eeprom.coinTable[i], coinTable[i]);
#ifdef DEBUG
      Serial.println(String(F("Read Coin Table ")) + String(i + 1) + F(": ") + String(coinTable[i]));
#endif
    }
    // credit tables
    for (int i = 0; i < buttonsCount; i++)
    {
#ifdef DEBUG
      Serial.print(String(F("Read Credit Table ")) + String(i + 1));
#endif
      if (EEPROM[eeprom.creditTables[i]] != 0xff)
      {
        for (int j = 0; j < 5; j++)
        {
          int idx = i * 5 + j;
          int adr = eeprom.creditTables[i] + j * 0x10;
          EEPROM.get(adr, creditTables[idx].credit);
          adr += sizeof(creditTables[idx].credit);
          EEPROM.get(adr, creditTables[idx].hour);
          adr +=  sizeof(creditTables[idx].hour);
          EEPROM.get(adr, creditTables[idx].min);
          adr +=  sizeof(creditTables[idx].min);
          EEPROM.get(adr, creditTables[idx].sec);
#ifdef DEBUG
        Serial.print(String(F(" ")) + String(creditTables[idx].credit) + F(" ") + String(creditTables[idx].hour) + F(":") + 
          String(creditTables[idx].min) + F(":") + String(creditTables[idx].sec));
#endif
        }
      }
#ifdef DEBUG
      Serial.println();
#endif
    }
    // autostart value
    if (EEPROM[eeprom.autostartValue] != 0xff)
      EEPROM.get(eeprom.autostartValue, autostartValue);
#ifdef DEBUG
    Serial.println(String(F("Read Autostart Value: ")) + String(autostartValue));
#endif

  }
  
  template< typename T > 
  void writeToEEPROM(int address, const T& t ) const
  {
    EEPROM.put(address, t);
  }


  void relayOnOff(int relayIdx, bool on)
  {
#ifdef DEBUG
    String str = String(F("Relay ")) + String(relayIdx) + F(" ") + (on ? F("On") : F("Off"));
    Serial.println(str);
#endif
    for (int i = 0; i < 2; i++)
    {
      if (relaysPins[relayIdx][i] != -1)
        digitalWrite(relaysPins[relayIdx][i], on ? HIGH : LOW);
    }
  }

  int checkForCoin()
  {
    for (int i = 0; i < 6; i++)
    {
      if (digitalRead(coinAcceptorPins[i]) == LOW)
      {
        bool res = true;
        for (int j = 0; j < 3; j++) // check for consistent signal
        {
          delay(10);
          if (digitalRead(coinAcceptorPins[i]) != LOW)
          {
            res = false;
            break;
          }
        }
        if (res)
        {
          while (digitalRead(coinAcceptorPins[i]) == LOW) delay(10); // wait for signals end
          return i;
        }
      }
    }
    return -1;
  }


  void printCredit(int credit)
  {
    int a = credit / 100;
    int b = credit % 100;
    String msg = String(a / 10) + String(a % 10) + F(".") + String(b / 10) + String(b % 10) + F(" ") + BGN;
    lcd.print(msg);
  }

  void printTime(byte hour, byte min, byte sec)
  {
    String msg = String(hour / 10) + String(hour % 10) + F(":") + 
      String(min / 10) + String(min % 10) + F(":") + 
      String(sec / 10) + String(sec % 10);
    lcd.print(msg);
  }


  void creditToTime(int channel)
  {
    if (credit == 0)
    {
      time = 0;
      return;
    }

    int idx = -1;
    for (int i = 0; i < 5; i++)
    {
      idx = channel * 5 + i;
      if (credit <= creditTables[idx].credit)
        break;
    }
    if (idx == -1)
      return;
    
    long temp = creditTables[idx].hour * 3600 + creditTables[idx].min * 60 + creditTables[idx].sec;
    int a = temp / creditTables[idx].credit;
    int b = temp % creditTables[idx].credit;
    time = (long)a * credit;
    temp = (long)b * credit;
    temp /= creditTables[idx].credit;
    time += temp;
    credit = 0;
  }
};

#endif // CONTEXT_H

