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
  const int menuButtonPin = 2;
  const int buttonsCount = 5;
  const int buttonsPins[5] = { 3, 4, 5, 6, 7 };
  const int relaysPins[5] = { 8, 9, 10, 11, 12 };

  const struct
  {
    const int buttonsEnabled[5] = { 0x00, 0x01, 0x02, 0x03, 0x04 };
    const int totals[6] = { 0x06, 0x0B, 0x10, 0x15, 0x1A, 0x1F };
  } eeprom;

  bool buttonsEnabled[5] = { true, true, true, true, true}; // 1 byte
  unsigned long totals[6] = { 0, 0, 0, 0, 0, 0 }; // 4 byte, last value is total counter
  
  const LiquidCrystal_I2C lcd;
  int menuIndex = -1;


  Context():
    lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE)  // Set the LCD I2C address
  {
  }

  void setupPins() const
  {
  #ifdef DEBUG
    String str = "Setup main button pin " + String(menuButtonPin);
    Serial.println(str.c_str());
  #endif
    pinMode(menuButtonPin, INPUT_PULLUP);
    
    for (int i = 0; i < buttonsCount; i++)
    {
  #ifdef DEBUG
      String str = "Setup button" + String(i + 1) + " pin " + String(buttonsPins[i]);
      Serial.println(str.c_str());
  #endif
      pinMode(buttonsPins[i], INPUT_PULLUP);
    }
    
    for (int i = 0; i < buttonsCount; i++)
    {
  #ifdef DEBUG
      String str = "Setup relay" + String(i + 1) + " pin " + String(relaysPins[i]);
      Serial.println(str.c_str());
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

    for (int i = 0; i < buttonsCount; i++)
    {
      if (EEPROM[eeprom.buttonsEnabled[i]] != 0xff)
        EEPROM.get(eeprom.buttonsEnabled[i], buttonsEnabled[i]);
#ifdef DEBUG
      Serial.println("Read Button" + String(i + 1) + " enabled: " + String(buttonsEnabled[i]));
#endif
    }
    
    for (int i = 0; i <= buttonsCount; i++)
    {
      if (EEPROM[eeprom.totals[i]] != 0xff)
        EEPROM.get(eeprom.totals[i], totals[i]);
#ifdef DEBUG
      Serial.println("Read Total" + String(i + 1) + ": " + String(totals[i]));
#endif
    }
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
  
  void test(int relayIdx)
  {
    // TODO: credit[relayIdx] = 30; ?
    relayOnOff(relayIdx, true);
    lcd.setCursor(0, 1);
    lcd.print(TESTS);
    delay(10000);
    // TODO: while (credit[relayIdx] > 0) ...
    relayOnOff(relayIdx, false);
    // TODO: credit[relayIdx] = 0;
    lcd.setCursor(0, 1);
    lcd.print(TESTF);
  }

  void printTotal(unsigned long total)
  {
    lcd.setCursor(0, 1);
    lcd.print(Cash);
    long a = total / 10000;
    int a1 = a / 100;
    int a2 = a % 100;
    long b = total % 10000;
    int b1 = b / 100;
    int b2 = b % 100;
    String msg = /*String(a1 / 10) + */String(a1 % 10) + String(a2 / 10) + String(a2 % 10) + 
      String(b1 / 10) + String(b1 % 10) + "." + String(b2 / 10) + String(b2 % 10);
    lcd.print(msg);
    lcd.print(BGN);
  }

};

#endif // CONTEXT_H

