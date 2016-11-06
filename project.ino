#include "menu.h"

Context context;

/*-----( SETUP: RUNS ONCE )-----*/
void setup()
{
  Serial.begin(9600);  // Used to type in characters

  // set pins mode
#ifdef DEBUG
    String str = "Setup main button pin " + String(context.menuButtonPin);
    Serial.println(str.c_str());
#endif
  pinMode(context.menuButtonPin, INPUT_PULLUP);
  for (int i = 0; i < context.buttonsCount; i++)
  {
#ifdef DEBUG
    String str = "Setup button" + String(i + 1) + " pin " + String(context.buttonsPins[i]);
    Serial.println(str.c_str());
#endif
    pinMode(context.buttonsPins[i], INPUT_PULLUP);
  }

  context.readEEPROM();
  context.initDisplay();
  context.refreshDisplay();
}


/*-----( LOOP: RUNS CONSTANTLY )-----*/
void loop()
{
  // TODO: reinit display in some time
  checkMenu(context); // menu.h

  delay(100);
}


