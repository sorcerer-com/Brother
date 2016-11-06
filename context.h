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
  const int buttonsCount = 6;
  const int buttonsPins[6] = { 3, 4, 5, 6, 7, 8 };
  const int relayPins[6] = { 9, 10, 11, 12, 13, 14 };

  const struct
  {
    const int buttonsEnabled[6] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05 };
  } eeprom;

  bool buttonsEnabled[6] = { true, true, true, true, true, true };
  
  const LiquidCrystal_I2C lcd;
  int menuIndex = -1;


  Context():
    lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE)  // Set the LCD I2C address
  {
  }
  
  void initDisplay() const
  {
#ifdef DEBUG
    Serial.println("Initialize LCD");
#endif
    // initialize the lcd for 16 chars 2 lines, turn on backlight
    this->lcd.begin(16, 2);
    this->lcd.backlight();
  }
  
  void refreshDisplay() const
  {
    this->lcd.clear();
    this->lcd.setCursor(0, 0); // Cursor Position: (CHAR, LINE) start at 0
    if (this->menuIndex == -1)
    {
      this->lcd.print(Welcome);
      this->lcd.setCursor(0, 1);
      this->lcd.print(Ready_cyr);
    }
    else
      this->lcd.print(Menu(this->menuIndex));
  }
  
  
  void readEEPROM() const
  {
#ifdef DEBUG
    Serial.println("Read EEPROM");
#endif
    for (int i = 0; i < this->buttonsCount; i++)
    {
      if (EEPROM[this->eeprom.buttonsEnabled[i]] != 0xff)
        EEPROM.get(this->eeprom.buttonsEnabled[i], this->buttonsEnabled[i]);
#ifdef DEBUG
      Serial.println("Read Button enabled " + String(i + 1) + " " + String(this->buttonsEnabled[i]));
#endif
    }
  }
  
  template< typename T > 
  void writeToEEPROM(int address, const T& t ) const
  {
    EEPROM.put(address, t);
  }

};

#endif // CONTEXT_H

