#include <EEPROM.h>

void setup() {
  Serial.begin(9600);

  String str = String(EEPROM.length()) + "\n";
  Serial.write(str.c_str());
  
  Serial.write("    ");
  for (int i = 0; i < 0x10; i++)
  {
    str = String("0") + String(i, HEX) + " ";
    Serial.write(str.c_str());
  }
  Serial.write("\n\n");
  
  for (int i = 0; i < EEPROM.length() / 0x10; i++)
  {
    str = (i < 0x10 ? "0" : "") + String(i, HEX) + "0 ";
    Serial.write(str.c_str());
    for (int j = 0; j < 0x10; j++)
    {
      int value = EEPROM[i * 0x10 + j];
      str = String(value, HEX) + " ";
      if (value < 0x10) str = "0" + str;
      Serial.write(str.c_str());
    }
    Serial.write("\n");
  }

  // clear EEPROM
  //Serial.write("\nClear EEPROM\n");
  //for (int i = 0; i < EEPROM.length(); i++)
  //  EEPROM.write(i, 0xff);
}

void loop() {
  // put your main code here, to run repeatedly:

}
