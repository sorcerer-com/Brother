#include <Wire.h>
// https://arduino-info.wikispaces.com/LCD-Blue-I2C
// https://bitbucket.org/fmalpartida/new-liquidcrystal/downloads
#include <LiquidCrystal_I2C.h>

#include "menu.h"

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);  // Set the LCD I2C address
Context context(lcd);

/*-----( SETUP: RUNS ONCE )-----*/
void setup()
{
  Serial.begin(9600);  // Used to type in characters

  // set pins mode
  for (int i = 0; i < context.buttonsCount; i++)
  {
#ifdef DEBUG
    String str = "Setup button" + String(i) + " pin " + String(context.buttonsPins[i]);
    Serial.println(str.c_str());
#endif
    pinMode(context.buttonsPins[i], INPUT_PULLUP);
  }

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


