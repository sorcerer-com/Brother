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
  const int menuButtonPin   = 2;
  const int buttonsCount    = 5;
  const int buttonsPins[5]  = { 3, 4, 5, 6, 7 };
  const int relaysPins[5]   = { 8, 9, 10, 11, 12 };

  const struct
  {
    const int buttonsEnabled[5] = { 0x00, 0x01, 0x02, 0x03, 0x04 }; // 1 byte
    const int totals[6]         = { 0x20, 0x30, 0x40, 0x50, 0x60, 0x70 }; // 4 byte
    const int coinTable[3]      = { 0x06, 0x07, 0x08 }; // 1 byte
    const int creditTables[5]   = { 0x25, 0x2B, 0x90, 0x95, 0x9B }; // 2 + 3 * 1 = 5 byte 
    const int autostartValue    = 0x0A; // 1 byte
  } eeprom;

  bool buttonsEnabled[5]  = { true, true, true, true, true};
  unsigned long totals[6] = { 0, 0, 0, 0, 0, 0 }; // last value is total counter
  byte coinTable[3]       = { 0, 0, 0 };
  struct
  {
    int credit = 0;
    byte hour = 0, min = 0, sec = 0;
  } creditTables[5 * 5];
  byte autostartValue     = 0;
  
  const LiquidCrystal_I2C lcd;
  int menuIndex = -1;


  Context():
    lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE)  // Set the LCD I2C address
  {
  }

  void setupPins() const
  {
  #ifdef DEBUG
    String str = "Setup main button pin: " + String(menuButtonPin);
    Serial.println(str);
  #endif
    pinMode(menuButtonPin, INPUT_PULLUP);
    
    for (int i = 0; i < buttonsCount; i++)
    {
  #ifdef DEBUG
      String str = "Setup button " + String(i + 1) + " pin: " + String(buttonsPins[i]);
      Serial.println(str);
  #endif
      pinMode(buttonsPins[i], INPUT_PULLUP);
    }
    
    for (int i = 0; i < buttonsCount; i++)
    {
  #ifdef DEBUG
      String str = "Setup relay " + String(i + 1) + " pin: " + String(relaysPins[i]);
      Serial.println(str);
  #endif
      pinMode(relaysPins[i], OUTPUT);
      digitalWrite(relaysPins[i], LOW);
    }
  }

  
  void initDisplay() const
  {
#ifdef DEBUG
    Serial.println("Initialize LCD");
#endif
    // initialize the lcd for 16 chars 2 lines, turn on backlight
    lcd.begin(16, 2);
    lcd.backlight();
  }
  
  void refreshDisplay() const
  {
    lcd.clear();
    lcd.setCursor(0, 0); // Cursor Position: (CHAR, LINE) start at 0
    if (menuIndex == -1)
    {
      lcd.print(Welcome);
      lcd.setCursor(0, 1);
      lcd.print(Ready_cyr);
    }
    else
      lcd.print(Menu(menuIndex));
  }
  
  
  void readEEPROM() const
  {
#ifdef DEBUG
    Serial.println("Read EEPROM");
#endif
    // buttons enabled
    for (int i = 0; i < buttonsCount; i++)
    {
      if (EEPROM[eeprom.buttonsEnabled[i]] != 0xff)
        EEPROM.get(eeprom.buttonsEnabled[i], buttonsEnabled[i]);
#ifdef DEBUG
      Serial.println("Read Button " + String(i + 1) + " enabled: " + String(buttonsEnabled[i]));
#endif
    }
    // totals
    for (int i = 0; i <= buttonsCount; i++) // last value is total counter
    {
      if (EEPROM[eeprom.totals[i]] != 0xff)
        EEPROM.get(eeprom.totals[i], totals[i]);
#ifdef DEBUG
      Serial.println("Read Total " + String(i + 1) + ": " + String(totals[i]));
#endif
    }
    // coint table
    for (int i = 0; i < 3; i++)
    {
      if (EEPROM[eeprom.coinTable[i]] != 0xff)
        EEPROM.get(eeprom.coinTable[i], coinTable[i]);
#ifdef DEBUG
      Serial.println("Read Coin Table " + String(i + 1) + ": " + String(coinTable[i]));
#endif
    }
    // credit tables
    for (int i = 0; i < buttonsCount; i++)
    {
#ifdef DEBUG
      Serial.print("Read Credit Table " + String(i + 1));
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
        Serial.print(" " + String(creditTables[idx].credit) + " " + String(creditTables[idx].hour) + ":" + String(creditTables[idx].min) + ":" + String(creditTables[idx].sec));
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
    Serial.println("Read Autostart Value: " + String(autostartValue));
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
    String str = String("Relay ") + (on ? "On" : "Off");
    Serial.println(str);
#endif
    digitalWrite(relaysPins[relayIdx], on ? HIGH : LOW); 
  }


  void printCredit(int credit)
  {
    int a = credit / 100;
    int b = credit % 100;
    String msg = String(a / 10) + String(a % 10) + "." + String(b / 10) + String(b % 10) + " " + BGN;
    lcd.print(msg);
  }

  void printTime(byte hour, byte min, byte sec)
  {
    String msg = String(hour / 10) + String(hour % 10) + ":" + 
      String(min / 10) + String(min % 10) + ":" + 
      String(sec / 10) + String(sec % 10);
    lcd.print(msg);
  }
  
};

#endif // CONTEXT_H

