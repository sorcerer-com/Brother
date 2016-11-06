#ifndef MENU_H
#define MENU_H

#include "texts.h"

void selectMenu(Context& context);
bool enableDisable(const Context& context, bool newValue);
void waitEsc(const Context& context);

void checkMenu(Context& context)
{
  if (context.menuIndex == -1 && digitalRead(context.buttonsPins[0]) == LOW) // open menu
  {
#ifdef DEBUG
    Serial.println("Open Menu");
#endif
    while (digitalRead(context.buttonsPins[0]) == LOW) delay(100); // wait to release the button
    context.menuIndex = 0;
    context.refreshDisplay();
  }
  
  if (context.menuIndex != -1) // menu is opened
  {
    if (digitalRead(context.buttonsPins[1]) == LOW) // down pressed
    {
#ifdef DEBUG
      Serial.println("Down Menu");
#endif
      while (digitalRead(context.buttonsPins[1]) == LOW) delay(100); // wait to release the button
      context.menuIndex++;
      if (context.menuIndex > MenuCount) context.menuIndex = 0;
    }
    if (digitalRead(context.buttonsPins[2]) == LOW) // up pressed
    {
#ifdef DEBUG
      Serial.println("Up Menu");
#endif
      while (digitalRead(context.buttonsPins[2]) == LOW) delay(100); // wait to release the button
      context.menuIndex--;
      if (context.menuIndex < 0) context.menuIndex = MenuCount - 1;
    }
    if (digitalRead(context.buttonsPins[3]) == LOW) // exit pressed
    {
#ifdef DEBUG
      Serial.println("Exit Menu");
#endif
      while (digitalRead(context.buttonsPins[3]) == LOW) delay(100); // wait to release the button
      context.menuIndex = -1;
    }
    if (digitalRead(context.buttonsPins[0]) == LOW) // enter pressed
    {
#ifdef DEBUG
      String str = "Select Menu " + String(context.menuIndex);
      Serial.println(str.c_str());
#endif
      while (digitalRead(context.buttonsPins[0]) == LOW) delay(100); // wait to release the button
      selectMenu(context);
    }
    else
      context.refreshDisplay();
  }
}

void selectMenu(Context& context)
{
  if (context.menuIndex == 1) // VT code
  {
    context.lcd.setCursor(0, 1);
    context.lcd.print(CODE);
    waitEsc(context);
#ifdef DEBUG
    String str = String("VT CODE ") + CODE + "\n";
    Serial.println(str.c_str());
#endif
  } 
  else if (context.menuIndex >= 2 && context.menuIndex <= 6) // Button 1/2/3/4/5 Activ?
  {
    int btnIdx = context.menuIndex - 1;
    context.buttonsEnabled[btnIdx] = enableDisable(context, context.buttonsEnabled[btnIdx]);
    context.writeToEEPROM(context.eeprom.buttonsEnabled[btnIdx], context.buttonsEnabled[btnIdx]);
    // TODO: if(vEN3 && (cred3 != 0)) rem3 = 1;
#ifdef DEBUG
    String str = String(context.buttonsEnabled[btnIdx] ? "Enable" : "Disable") + " Button " + String(btnIdx);
    Serial.println(str);
#endif
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
    if (digitalRead(context.buttonsPins[0]) == LOW) // enter pressed
    {
      while (digitalRead(context.buttonsPins[0]) == LOW) delay(100); // wait to release the button
      newValue = !newValue;
      context.lcd.setCursor(0, 1);
      if (newValue)
        context.lcd.print(Enabled);
      else
        context.lcd.print(Disabled);
      delay(100);
      break;
    }
    if (digitalRead(context.buttonsPins[3]) == LOW) // exit pressed
    {
      while (digitalRead(context.buttonsPins[3]) == LOW) delay(100); // wait to release the button
      break;
    }

    delay(10);
  }

  return newValue;
}
  
void waitEsc(const Context& context)
{
  while (digitalRead(context.buttonsPins[3]) == HIGH) delay(100); // wait to press Exit
  while (digitalRead(context.buttonsPins[3]) == LOW) delay(100); // wait to release Exit
}

#endif // MENU_H

