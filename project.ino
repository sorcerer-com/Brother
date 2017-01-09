#include <avr/wdt.h>
#include "menu.h"

Context context;
unsigned long timer = 0;
int reinitLCDCounter = 0;

/*-----( SETUP: RUNS ONCE )-----*/
void setup()
{
  wdt_disable(); // disable watchdog timer
  
  context.setupPins();
  context.readEEPROM();
  context.initDisplay();
  context.refreshDisplay();
  
  wdt_enable(WDTO_2S); // set watchdog timer to 2 sec
}

/*-----( LOOP: RUNS CONSTANTLY )-----*/
void loop()
{
  wdt_reset(); // reset watchdog timer
  
  // re-init LCD every 60 sec
  if (reinitLCDCounter == 60 * 100)
  {
    reinitLCDCounter = 0;
    context.lcd.LCD::begin(16, 2, LCD_5x8DOTS);
    context.refreshDisplay();
  }
  else
    reinitLCDCounter++;
    
  // TODO: cyrellic
  checkMenu(context); // menu.h

  // check for inserted coin
  int coin = context.checkForCoin();
  if (coin != -1) // coin inserted
  {
#ifdef DEBUG
      String str = String(F("Coin Inserted: ")) + String(context.coinTable[coin]);
      Serial.println(str);
#endif
    context.credit += context.coinTable[coin];
    context.totals[context.buttonsCount] += context.coinTable[coin]; // total counter
    context.writeToEEPROM(context.eeprom.totals[context.buttonsCount], context.totals[context.buttonsCount]);
    if (context.work != -1)
    {
      context.totals[context.work] += context.credit;
      context.writeToEEPROM(context.eeprom.totals[context.work], context.totals[context.work]);
      int temp = context.credit;
      context.timeToCredit(context.work);
      context.credit += temp;
      context.creditToTime(context.work);
#ifdef DEBUG
      String str = String(F("Time: ")) + String(context.time) + F(" sec");
      Serial.println(str);
#endif
    }
    context.refreshDisplay();
  }

  if (context.work != -1 && buttonPressed(context, -2, false)) // pause button pressed
  {
    if (context.paused)
      while (digitalRead(context.pauseButtonPin) == LOW) delay(100); // wait to release pause button
    context.paused = !context.paused;
    context.relayOnOff(context.work, !context.paused);
    context.refreshDisplay();
    if (context.paused)
    {
      //while (digitalRead(context.pauseButtonPin) == LOW) delay(100); // wait to release pause button
      int freeCounter = 0;
      while (digitalRead(context.pauseButtonPin) == LOW) // wait to release pause button
      {
          if (buttonPressed(context, 0))
            freeCounter++;
          if (freeCounter == 3)
          {
            context.time += 60; // add minute
#ifdef DEBUG
      Serial.println(F("Add 60 seconds free time"));
#endif
            freeCounter = 0;
          }
          delay(100);
      }
    }
#ifdef DEBUG
      Serial.println(context.paused ? F("Paused") : F("Resumed"));
#endif
  }

  int button = -1; // button pressed
  if (context.menuIndex == -1 && (context.credit != 0 || context.time != 0)) // not in the menu and there are credits or time
  {
    for (int i = 0; i < context.buttonsCount; i++)
    {
      if (context.buttonsEnabled[i] && buttonPressed(context, i, false)) // if wait for button release it will block the timer
      {
        button = i;
        break;
      }
    }
  }
  
  if (context.work == -1 && context.autostartValue != 0 && context.credit >= context.autostartValue) // start first button if autostart credit is reached
  {
#ifdef DEBUG
    Serial.println(F("Autostart"));
#endif
    button = 0;
  }
    
  if (button != -1 && context.work != button)
  {
    if (context.work != -1) // change button
    {
      context.timeToCredit(context.work);
      context.totals[context.work] -= context.credit;
      context.writeToEEPROM(context.eeprom.totals[context.work], context.totals[context.work]);
      context.relayOnOff(context.work, false);
      context.work = -1;
#ifdef DEBUG
      String str = String(F("Credit: ")) + String(context.credit);
      Serial.println(str);
#endif
    }
    if (context.work == -1 && context.credit != 0)
    {
#ifdef DEBUG
      String str = String(F("Button ")) + String(button) + F(" Activated");
      Serial.println(str);
#endif
      context.paused = false;
      context.work = button;
      context.totals[context.work] += context.credit;
      if (!context.creditToTime(context.work))
      {
        context.work = -1;
        context.totals[context.work] -= context.credit;
      }
      else
      {
#ifdef DEBUG
      String str = String(F("Time: ")) + String(context.time) + F(" sec");
      Serial.println(str);
#endif
        context.writeToEEPROM(context.eeprom.totals[context.work], context.totals[context.work]);
        context.relayOnOff(context.work, true);
      }
    }
    context.refreshDisplay();
  }

  // timer
  if (context.work != -1 && !context.paused)
  {
    int deltaTime = (millis() - timer) / 100;
    if (deltaTime >= 10) // at least one second passed
    {
      timer += (unsigned long)(deltaTime / 10) * 1000;
      context.time -= deltaTime / 10;
      if (context.time <= 0) // times up
      {
        context.relayOnOff(context.work, false);
        context.work = -1;
        context.time = 0;
      }
      context.refreshDisplay();
    }
    if (context.time > 0 && context.time < 30)
    {
      if (deltaTime < 5)
        context.lcd.backlight();
      else
        context.lcd.noBacklight();
    }
    else
        context.lcd.backlight();
  }
  else
    timer = millis();
  
  delay(10);
}


