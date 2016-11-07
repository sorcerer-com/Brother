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
  } eeprom;

  bool buttonsEnabled[6] = { true, true, true, true, true, true };
  
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
      Serial.println("Read Button enabled " + String(i + 1) + " " + String(buttonsEnabled[i]));
#endif
    }
  }
  
  template< typename T > 
  void writeToEEPROM(int address, const T& t ) const
  {
    EEPROM.put(address, t);
  }


  void test(int relayIdx)
  {
    // TODO: credit[relayIdx] = 30; ?
    relayOnOff(relayIdx, true);
    lcd.setCursor(0, 1);
    lcd.print(TESTS);
    delay(1000); // TODO: remove
    // TODO: while (credit[relayIdx] > 0) ...
    relayOnOff(relayIdx, false);
    // TODO: credit[relayIdx] = 0;
    lcd.setCursor(0, 1);
    lcd.print(TESTF);
  }

  void relayOnOff(int relayIdx, bool on)
  {
#ifdef DEBUG
    String str = String("Relay ") + (on ? "On" : "Off");
    Serial.println(str);
#endif
    digitalWrite(relaysPins[relayIdx], on ? HIGH : LOW); 
  }

};

#endif // CONTEXT_H

