#include "menu.h"

Context context;

/*-----( SETUP: RUNS ONCE )-----*/
void setup()
{
  Serial.begin(9600);  // Used to type in characters

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

  delay(100);
}


