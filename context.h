#ifndef CONTEXT_H
#define CONTEXT_H

#define DEBUG

#include <LiquidCrystal_I2C.h>
#include <EEPROM.h>

#include "texts.h"

class Context
{
public:
  const struct
  {
    const int buttonsEnabled[6] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05 };
  } eeprom;
  
  const int buttonsCount = 6;
  const int buttonsPins[6] = { 2, 3, 4, 5, 6, 7 };

  const LiquidCrystal_I2C& lcd;

  int menuIndex = -1;

  bool buttonsEnabled[6] = { true, true, true, true, true, true };


  Context(const LiquidCrystal_I2C& _lcd):
    lcd(_lcd)
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
      this->lcd.print(Menu[this->menuIndex]);
  }
  
  
  void readEEPROM() const
  {
#ifdef DEBUG
    Serial.println("Read EEPROM");
#endif
    for (int i = 0; i < this->buttonsCount; i++)
    {
      EEPROM.get(context.eeprom.buttonsEnabled[i], context.buttonsEnabled[i]);
#ifdef DEBUG
      Serial.println("Read Button enabled " + String(i) + " " + String(context.buttonsEnabled[i]));
#endif
    }
  }
  
  template< typename T > 
  void writeEEPROM(int address, const T& t ) const
  {
    EEPROM.put(address, t);
  }
  
  
  void waitEsc() const
  {
    while (digitalRead(this->buttonsPins[3]) == HIGH) delay(100); // wait to press Exit
    while (digitalRead(this->buttonsPins[3]) == LOW) delay(100); // wait to release Exit
  }

};

#endif // CONTEXT_H

