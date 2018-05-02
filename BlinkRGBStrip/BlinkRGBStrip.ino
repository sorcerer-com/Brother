#include "RGBdriver.h"

#define CLK 2 //pins definitions for the driver        
#define DIO 3
#define IN  4

RGBdriver Driver(CLK, DIO);

void setup() {
  pinMode(IN, INPUT_PULLUP);
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int sleep = 2000;
  if (digitalRead(IN) == HIGH) {
    Driver.begin(); // begin
    Driver.SetColor(255, 0, 0); //Red
    Driver.end();
    Serial.println("Red");
  }
  else {
    Driver.begin(); // begin
    Driver.SetColor(0, 255, 0); //Green
    Driver.end();
    Serial.println("Green");
    sleep = 1000;
  }
  digitalWrite(LED_BUILTIN, HIGH);
  delay(sleep);

  Driver.begin();
  Driver.SetColor(0, 0, 0); //Off
  Driver.end();
  digitalWrite(LED_BUILTIN, LOW);
  delay(sleep);
}
