#ifndef MENU_H
#define MENU_H

#include "texts.h"

void selectMenu(Context& context);
bool enableDisable(const Context& context, bool newValue);
void test(const Context& context, int relayIdx);
void printTotal(const Context& context, unsigned long total);
void setCoinTable(Context& context);
void readCreditTable(const Context& context, int tableIdx);
void setCreditTable(Context& context, int tableIdx);
void setAutostartValue(Context& context);
int buttonPressed(const Context& context, int idx);
void waitEsc(const Context& context);


void checkMenu(Context& context)
{
  if (context.menuIndex == -1) // menu is not opened
  {
    int pressed = buttonPressed(context, -1);
    if (pressed > /* TODO: 3 */0) // enter pressed for 3 sec - open menu
    {
#ifdef DEBUG
      Serial.println(F("Open Menu"));
#endif
      context.menuIndex = 0;
      context.refreshDisplay();
    }
    else if (pressed > 0) // show total
    {
      unsigned long total = context.totals[context.buttonsCount];
#ifdef DEBUG
      String str = String(F("Print Total Counter: ")) + String(total);
      Serial.println(str);
#endif
      context.lcd.setCursor(0, 0);
      context.lcd.print(Menu(18));
      printTotal(context, total);
      waitEsc(context);
      context.refreshDisplay();
    }
  }

  if (context.menuIndex != -1) // menu is opened
  {
    if (buttonPressed(context, 0)) // up pressed
    {
#ifdef DEBUG
      Serial.println(F("Up Menu"));
#endif
      context.menuIndex++;
      if (context.menuIndex >= MenuCount) context.menuIndex = 0;
    }
    if (buttonPressed(context, 1)) // down pressed
    {
#ifdef DEBUG
      Serial.println(F("Down Menu"));
#endif
      context.menuIndex--;
      if (context.menuIndex < 0) context.menuIndex = MenuCount - 1;
    }
    if (buttonPressed(context, 2)) // exit pressed
    {
#ifdef DEBUG
      Serial.println(F("Exit Menu"));
#endif
      context.menuIndex = -1;
    }
    if (buttonPressed(context, -1)) // enter pressed
    {
#ifdef DEBUG
      String str = String(F("Select Menu: ")) + String(Menu(context.menuIndex));
      Serial.println(str);
#endif
      selectMenu(context);
    }
    else
      context.refreshDisplay();
  }
}

void selectMenu(Context& context)
{
  if (context.menuIndex == 1)                                   // VT code
  {
#ifdef DEBUG
    String str = String(F("VT CODE: ")) + CODE;
    Serial.println(str);
#endif
    context.lcd.setCursor(0, 1);
    context.lcd.print(CODE);
    waitEsc(context);
  } 
  else if (context.menuIndex >= 2 && context.menuIndex <= 6)    // Button 1/2/3/4/5 Activ?
  {
    int btnIdx = context.menuIndex - 2;
    context.buttonsEnabled[btnIdx] = enableDisable(context, context.buttonsEnabled[btnIdx]);
    context.writeToEEPROM(context.eeprom.buttonsEnabled[btnIdx], context.buttonsEnabled[btnIdx]);
#ifdef DEBUG
    String str = String(context.buttonsEnabled[btnIdx] ? F("Enable") : F("Disable")) + F(" Button ") + String(btnIdx);
    Serial.println(str);
#endif
  }
  else if (context.menuIndex >= 7 && context.menuIndex <= 11)   // Test Relay 1/2/3/4/5
  {
    int relayIdx = context.menuIndex - 7;
#ifdef DEBUG
    String str = String(F("Test Relay ")) + String(relayIdx);
    Serial.println(str);
#endif
    test(context, relayIdx);
    waitEsc(context);
  }
  else if (context.menuIndex >= 12 && context.menuIndex <= 16) // Sale Channel 1/2/3/4/5
  {
    int totalIdx = context.menuIndex - 12;
    unsigned long total = context.totals[totalIdx];
#ifdef DEBUG
    String str = String(F("Print Total ")) + String(totalIdx) + F(": ") + String(total);
    Serial.println(str);
#endif
    printTotal(context, total);
    waitEsc(context);
  }
  else if (context.menuIndex == 17)                             // Sale All
  {
    unsigned long total = 0;
    for (int i = 0; i < context.buttonsCount; i++)
      total += context.totals[i];
#ifdef DEBUG
    String str = String(F("Print Total: ")) + String(total);
    Serial.println(str);
#endif
    printTotal(context, total);
    waitEsc(context);
  }
  else if (context.menuIndex == 18)                             // Total counter
  {
    unsigned long total = context.totals[context.buttonsCount];
#ifdef DEBUG
    String str = String(F("Print Total Counter: ")) + String(total);
    Serial.println(str);
#endif
    printTotal(context, total);
    waitEsc(context);
  }
  else if (context.menuIndex >= 19 && context.menuIndex <= 23) // Clear STAT CH1/2/3/4/5
  {
    int totalIdx = context.menuIndex - 19;
    context.totals[totalIdx] = 0;
    context.writeToEEPROM(context.eeprom.totals[totalIdx], context.totals[totalIdx]);
    context.lcd.setCursor(0, 1);
    context.lcd.print(CLEAR);
    waitEsc(context);
#ifdef DEBUG
    String str = String(F("Clear Total ")) + String(totalIdx);
    Serial.println(str);
#endif
  }
  else if (context.menuIndex == 24)                             // Clear All STAT
  {
    for (int i = 0; i < context.buttonsCount; i++)
    {
      context.totals[i] = 0;
      context.writeToEEPROM(context.eeprom.totals[i], context.totals[i]);
    }
    context.lcd.setCursor(0, 1);
    context.lcd.print(CLEAR);
    waitEsc(context);
#ifdef DEBUG
    String str = String(F("Clear All Totals"));
    Serial.println(str);
#endif
  }
  else if (context.menuIndex == 25)                             // Set coin table
  {
#ifdef DEBUG
    String str = String(F("Set Coin Table"));
    Serial.println(str);
#endif
    setCoinTable(context);
    waitEsc(context);
  }
  else if (context.menuIndex >= 26 && context.menuIndex <= 30) // Read credit table 1/2/3/4/5
  {
    int tableIdx = context.menuIndex - 26;
#ifdef DEBUG
    String str = String(F("Read Credit Table ")) + String(tableIdx);
    Serial.println(str);
#endif
    readCreditTable(context, tableIdx);
  }
  else if (context.menuIndex >= 31 && context.menuIndex <= 35) // Set credit table 1/2/3/4/5
  {
    int tableIdx = context.menuIndex - 31;
#ifdef DEBUG
    String str = String(F("Set Credit Table ")) + String(tableIdx);
    Serial.println(str);
#endif
    setCreditTable(context, tableIdx);
  }
  else if (context.menuIndex == 36)                             // AUTOSTART value
  {
#ifdef DEBUG
    String str = String(F("Set Autostart value"));
    Serial.println(str);
#endif
    setAutostartValue(context);
  }
  else if (context.menuIndex == 37)                             // Clear credit
  {
#ifdef DEBUG
    String str = String(F("Clear credit"));
    Serial.println(str);
#endif
    context.credit = 0;
    context.time = 0;
    context.work = -1;
    context.lcd.setCursor(0, 1);
    context.lcd.print(CLEAR);
    waitEsc(context);
  }
}


bool enableDisable(const Context& context, bool newValue)
{
  context.lcd.setCursor(0, 1);
  if (!newValue)
    context.lcd.print(EN);
  else
    context.lcd.print(DIS);

  for (int i = 0; i < 30*100; i++)
  {
    if (buttonPressed(context, -1)) // enter pressed
    {
      newValue = !newValue;
      context.lcd.setCursor(0, 1);
      if (newValue)
        context.lcd.print(Enabled);
      else
        context.lcd.print(Disabled);
      delay(500);
      break;
    }
    if (buttonPressed(context, 2)) // exit pressed
      break;

    delay(100);
  }

  return newValue;
}

void test(const Context& context, int relayIdx)
{
  context.relayOnOff(relayIdx, true);
  context.lcd.setCursor(0, 1);
  context.lcd.print(TESTS);
  delay(3000);
  context.relayOnOff(relayIdx, false);
  context.lcd.setCursor(0, 1);
  context.lcd.print(TESTF);
}

void printTotal(const Context& context, unsigned long total)
{
  context.lcd.setCursor(0, 1);
  context.lcd.print(Cash);
  long a = total / 10000;
  int a1 = a / 100;
  int a2 = a % 100;
  long b = total % 10000;
  int b1 = b / 100;
  int b2 = b % 100;
  String msg = /*String(a1 / 10) + */String(a1 % 10) + String(a2 / 10) + String(a2 % 10) + 
    String(b1 / 10) + String(b1 % 10) + F(".") + String(b2 / 10) + String(b2 % 10);
  context.lcd.print(msg);
  context.lcd.print(BGN);
}

void setCoinTable(Context& context)
{
  for (int i = 0; i < 6; i++)
  {
    context.lcd.setCursor(0, 1);
    context.lcd.print(Insert);
    String msg = String(F("TK")) + String(i + 1);
    context.lcd.print(msg);
    int coin = -1;
    while(coin == -1)
    {
      coin = context.checkForCoin();
      delay(10);
    }
#ifdef DEBUG
    String str = String(F("Coin ")) + String(coin) + F(" Inserted");
    Serial.println(str);
#endif
    context.coinTable[i] = 100;
    context.writeToEEPROM(context.eeprom.coinTable[coin], context.coinTable[coin]);
  }
  context.lcd.setCursor(0, 1);
  context.lcd.print(Save);
}

void readCreditTable(const Context& context, int tableIdx)
{
  int i = 0;
  while(true)
  {
    int idx = tableIdx * 5 + i;
    context.lcd.clear();
    context.lcd.setCursor(0, 0);
    context.lcd.print(Credit);
    context.printCredit(context.creditTables[idx].credit);
    context.lcd.setCursor(0, 1);
    context.lcd.print(Time);
    context.printTime(context.creditTables[idx].hour, context.creditTables[idx].min, context.creditTables[idx].sec);

    if (buttonPressed(context, 0)) // up pressed
    {
      i++;
      if (i > 4) i = 0;
    }
    if (buttonPressed(context, 1)) // down pressed
    {
      i--;
      if (i < 0) i = 4;
    }
    if (buttonPressed(context, 2)) // exit pressed
      break;
    delay(100);
  }
}

void setCreditTable(Context& context, int tableIdx)
{
  int i;
  for (i = 0; i < 5; i++)
  {
    int idx = tableIdx * 5 + i;
    context.lcd.clear();
    context.lcd.setCursor(0, 0);
    context.lcd.print(Cont);
    bool esc = false;
    while(true)
    {
      if (buttonPressed(context, 2)) // exit pressed
      {
        esc = true;
        break;
      }
      if (buttonPressed(context, -1)) // enter pressed
      {
        esc = false;
        break;
      }
      delay(100);
    }
    if (esc) break;

    context.lcd.clear();
    context.lcd.cursor();
    byte curPos = strlen(Credit);
    bool change = true;
    while(curPos != 16 + 14) // until end of second line
    {
      if (change)
      {
        context.lcd.setCursor(0, 0);
        context.lcd.print(Credit);
        context.printCredit(context.creditTables[idx].credit);
        context.lcd.setCursor(0, 1);
        context.lcd.print(Time);
        context.printTime(context.creditTables[idx].hour, context.creditTables[idx].min, context.creditTables[idx].sec);
        change = false;
      }
      
      if (buttonPressed(context, -1)) // enter pressed
      {
        change = true;
        if (curPos == strlen(Credit) + 1 || curPos == 16 + strlen(Time) + 1 || curPos == 16 + strlen(Time) + 4) curPos++;
        if (curPos == strlen(Credit) + 4) curPos = 16 + 5; // go to second line
        if (curPos == 16 + strlen(Time) + 7) // last digit
        {
          int adr = context.eeprom.creditTables[tableIdx] + i * 0x10;
          context.writeToEEPROM(adr, context.creditTables[idx].credit);
          adr += sizeof(context.creditTables[idx].credit);
          context.writeToEEPROM(adr, context.creditTables[idx].hour);
          adr +=  sizeof(context.creditTables[idx].hour);
          context.writeToEEPROM(adr, context.creditTables[idx].min);
          adr +=  sizeof(context.creditTables[idx].min);
          context.writeToEEPROM(adr, context.creditTables[idx].sec);
        }
        curPos++;
      } // end enter

      if (buttonPressed(context, 0)) // up pressed
      {
        change = true;
        if (curPos == strlen(Credit) + 0 && (context.creditTables[idx].credit / 1000) % 10 != 9) context.creditTables[idx].credit += 1000;
        if (curPos == strlen(Credit) + 1 && (context.creditTables[idx].credit / 100 ) % 10 != 9) context.creditTables[idx].credit += 100;
        if (curPos == strlen(Credit) + 3 && (context.creditTables[idx].credit / 10  ) % 10 != 9) context.creditTables[idx].credit += 10;
        if (curPos == strlen(Credit) + 4 && (context.creditTables[idx].credit / 1   ) % 10 != 9) context.creditTables[idx].credit += 1;
        if (curPos == 16 + strlen(Time) + 0 && (context.creditTables[idx].hour / 10 ) % 10 != 9) context.creditTables[idx].hour += 10;
        if (curPos == 16 + strlen(Time) + 1 && (context.creditTables[idx].hour / 1  ) % 10 != 9) context.creditTables[idx].hour += 1;
        if (curPos == 16 + strlen(Time) + 3 && (context.creditTables[idx].min / 10  ) % 10 != 5) context.creditTables[idx].min += 10;
        if (curPos == 16 + strlen(Time) + 4 && (context.creditTables[idx].min / 1   ) % 10 != 9) context.creditTables[idx].min += 1;
        if (curPos == 16 + strlen(Time) + 6 && (context.creditTables[idx].sec / 10  ) % 10 != 5) context.creditTables[idx].sec += 10;
        if (curPos == 16 + strlen(Time) + 7 && (context.creditTables[idx].sec / 1   ) % 10 != 9) context.creditTables[idx].sec += 1;
      }

      if (buttonPressed(context, 1)) // down pressed
      {
        change = true;
        if (curPos == strlen(Credit) + 0 && (context.creditTables[idx].credit / 1000) % 10 != 0) context.creditTables[idx].credit -= 1000;
        if (curPos == strlen(Credit) + 1 && (context.creditTables[idx].credit / 100 ) % 10 != 0) context.creditTables[idx].credit -= 100;
        if (curPos == strlen(Credit) + 3 && (context.creditTables[idx].credit / 10  ) % 10 != 0) context.creditTables[idx].credit -= 10;
        if (curPos == strlen(Credit) + 4 && (context.creditTables[idx].credit / 1   ) % 10 != 0) context.creditTables[idx].credit -= 1;
        if (curPos == 16 + strlen(Time) + 0 && (context.creditTables[idx].hour / 10 ) % 10 != 0) context.creditTables[idx].hour -= 10;
        if (curPos == 16 + strlen(Time) + 1 && (context.creditTables[idx].hour / 1  ) % 10 != 0) context.creditTables[idx].hour -= 1;
        if (curPos == 16 + strlen(Time) + 3 && (context.creditTables[idx].min / 10  ) % 10 != 0) context.creditTables[idx].min -= 10;
        if (curPos == 16 + strlen(Time) + 4 && (context.creditTables[idx].min / 1   ) % 10 != 0) context.creditTables[idx].min -= 1;
        if (curPos == 16 + strlen(Time) + 6 && (context.creditTables[idx].sec / 10  ) % 10 != 0) context.creditTables[idx].sec -= 10;
        if (curPos == 16 + strlen(Time) + 7 && (context.creditTables[idx].sec / 1   ) % 10 != 0) context.creditTables[idx].sec -= 1;
      }

      context.lcd.setCursor(curPos % 16, curPos / 16);
      delay(100);
    }
    
    context.lcd.noCursor();
  }
  // clear not used records
  for (; i < 5; i++)
  {
    int idx = tableIdx * 5 + i;
    context.creditTables[idx].credit = 0;
    context.creditTables[idx].hour = 0;
    context.creditTables[idx].min = 0;
    context.creditTables[idx].sec = 0;

    int adr = context.eeprom.creditTables[tableIdx] + i * 0x10;
    context.writeToEEPROM(adr, context.creditTables[idx].credit);
    adr += sizeof(context.creditTables[idx].credit);
    context.writeToEEPROM(adr, context.creditTables[idx].hour);
    adr +=  sizeof(context.creditTables[idx].hour);
    context.writeToEEPROM(adr, context.creditTables[idx].min);
    adr +=  sizeof(context.creditTables[idx].min);
    context.writeToEEPROM(adr, context.creditTables[idx].sec);
  }
}

void setAutostartValue(Context& context)
{
  bool change = true;
  while(true)
  {
    if (change)
    {
      change = false;
      context.lcd.setCursor(0, 1);
      context.lcd.print(Time);
      byte min = context.autostartValue / 60;
      byte sec = context.autostartValue % 60;
      context.printTime(0, min, sec);
    }
    if (buttonPressed(context, 0)) // up pressed
    {
      change = true;
      if (context.autostartValue < 240)
        context.autostartValue++;
    }
    if (buttonPressed(context, 1)) // down pressed
    {
      change = true;
      if (context.autostartValue > 0)
        context.autostartValue--;
    }
    if (buttonPressed(context, -1)) // enter pressed
    {
      context.writeToEEPROM(context.eeprom.autostartValue, context.autostartValue);
      context.lcd.setCursor(0, 1);
      context.lcd.print(Save);
      waitEsc(context);
      break;
    }
    if (buttonPressed(context, 2)) // exit pressed
      break;
  }
}

int buttonPressed(const Context& context, int idx)
{
  int buttonPin = (idx < 0 || idx >= context.buttonsCount) ? context.menuButtonPin : context.buttonsPins[idx];
  if (digitalRead(buttonPin) == LOW) // button pressed
  {
    int res = 1;
    while (digitalRead(buttonPin) == LOW) { delay(100); res++; } // wait to release the button
    return res;
  }
  return 0;
}

void waitEsc(const Context& context)
{
  while (digitalRead(context.buttonsPins[2]) == HIGH) delay(100); // wait to press Exit
  while (digitalRead(context.buttonsPins[2]) == LOW) delay(100); // wait to release Exit
}

#endif // MENU_H

