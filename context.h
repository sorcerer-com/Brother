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
    const int buttonsEnabled[5] = { 0x00, 0x01, 0x02, 0x03, 0x04 }; // 1 byte
    const int totals[6] = { 0x20, 0x30, 0x40, 0x50, 0x60, 0x70 }; // 4 byte
    const int coinTable[3] = { 0x06, 0x07, 0x08 }; // 1 byte
    const int creditTables[5] = { 0x25, 0x2B, 0x90, 0x95, 0x9B }; // 2 + 3 * 1 = 5 byte 
  } eeprom;

  bool buttonsEnabled[5] = { true, true, true, true, true};
  unsigned long totals[6] = { 0, 0, 0, 0, 0, 0 }; // last value is total counter
  byte coinTable[3] = { 0, 0, 0 };
  struct
  {
    int credit = 0;
    byte hour = 0, min = 0, sec = 0;
  } creditTables[5*5];
  
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
          EEPROM.get(eeprom.creditTables[i] + j * 0x10, creditTables[idx].credit);
          EEPROM.get(eeprom.creditTables[i] + sizeof(creditTables[idx].credit) + j * 0x10, creditTables[idx].hour);
          EEPROM.get(eeprom.creditTables[i] + sizeof(creditTables[idx].hour) + j * 0x10, creditTables[idx].min);
          EEPROM.get(eeprom.creditTables[i] + sizeof(creditTables[idx].min) + j * 0x10, creditTables[idx].sec);
#ifdef DEBUG
        Serial.print(String(creditTables[idx].credit) + " " + String(creditTables[idx].hour) + ":" + String(creditTables[idx].min) + ":" + String(creditTables[idx].sec));
#endif
        }
      }
#ifdef DEBUG
      Serial.println();
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

  void setCoinTable()
  {
    for (int i = 0; i < 3; i++)
    {
      lcd.setCursor(0, 1);
      lcd.print(Insert);
      String msg = String("TK") + String(i + 1);
      lcd.print(msg);
      // TODO: wait to insert coin
      delay(1000); // TODO: remove
      writeToEEPROM(eeprom.coinTable[i], coinTable[i]);
    }
    lcd.setCursor(0, 1);
    lcd.print(Save);
  }

  void readCreditTable(int tableIdx)
  {
    int i = 0;
    while(true)
    {
      int idx = tableIdx * 5 + i;
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print(String(i + 1));
      lcd.print(Credit);
      int a = creditTables[idx].credit / 100;
      int b = creditTables[idx].credit % 100;
      String msg = String(a / 10) + String(a % 10) + "." + String(b / 10) + String(b % 10) + " " + BGN;
      lcd.print(msg);
      lcd.setCursor(0, 1);
      lcd.print(Time);
      msg = String(creditTables[idx].hour / 10) + String(creditTables[idx].hour % 10) + ":" + 
        String(creditTables[idx].min / 10) + String(creditTables[idx].min % 10) + ":" + 
        String(creditTables[idx].sec / 10) + String(creditTables[idx].sec % 10);
      lcd.print(msg);

      delay(100);
      if (digitalRead(buttonsPins[0]) == LOW) // down pressed
      {
        while (digitalRead(buttonsPins[0]) == LOW) delay(100); // wait to release the button
        i++;
        if (i > 4) i = 0;
      }
      if (digitalRead(buttonsPins[1]) == LOW) // up pressed
      {
        while (digitalRead(buttonsPins[1]) == LOW) delay(100); // wait to release the button
        i--;
        if (i < 0) i = 4;
      }
      if (digitalRead(buttonsPins[2]) == LOW) // exit pressed
      {
        while (digitalRead(buttonsPins[2]) == LOW) delay(100); // wait to release the button
        break;
      }
    }
  }

};

#endif // CONTEXT_H

