#include "menu.h"

Context context;
int secCounter = 0;

/*-----( SETUP: RUNS ONCE )-----*/
void setup()
{
  context.setupPins();
  context.readEEPROM();
  context.initDisplay();
  context.refreshDisplay();
}


/*-----( LOOP: RUNS CONSTANTLY )-----*/
void loop()
{
  // TODO: reinit display in some time
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
      long temp = context.time;
      context.creditToTime(context.work);
      context.time += temp;
    }
    context.refreshDisplay();
  }

  // TODO: pause button?

  int button = -1; // button pressed
  for (int i = 0; i < context.buttonsCount; i++)
  {
    if (context.buttonsEnabled[i] && buttonPressed(context, i))
    {
      button = i;
      break;
    }
  }
  // TODO: autostart
  if (button != -1 && context.work != button)
  {
    if (context.work == -1 && context.credit != 0) // start from beginning
    {
#ifdef DEBUG
      String str = String(F("Button ")) + String(button) + F(" Activated");
      Serial.println(str);
#endif
      context.work = button;
      context.totals[context.work] += context.credit; // TODO: change button
      if (!context.creditToTime(context.work))
      {
        context.work = -1;
        context.totals[context.work] -= context.credit;
      }
      else
      {
        context.writeToEEPROM(context.eeprom.totals[context.work], context.totals[context.work]);
        context.relayOnOff(context.work, true);
        context.refreshDisplay();
      }
    }
  }

  // timer
  if (context.work != -1)
  {
    if (secCounter == 10) // one second pass
    {
      secCounter = 0;
      context.time--;
      if (context.time == 0) // times up
      {
        context.relayOnOff(context.work, false);
        context.work = -1;
      }
      context.refreshDisplay();
    }
    else
      secCounter++;
  }
  
  delay(100);
}


