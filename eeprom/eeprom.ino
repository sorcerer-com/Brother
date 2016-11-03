#include <EEPROM.h>

void setup() {
  Serial.begin(9600);

  String str = String(EEPROM.length()) + "\n";
  Serial.write(str.c_str());

  int dim = sqrt(EEPROM.length());
  
  Serial.write("    ");
  for (int i = 0; i < dim; i++)
  {
    str = String(i, HEX) + " ";
    if (i < 0x10) str = "0" + str;
    Serial.write(str.c_str());
  }
  Serial.write("\n\n");
  
  for (int i = 0; i < dim; i++)
  {
    str = String(i, HEX) + (i < 0x10 ? "0  " : "  ");
    Serial.write(str.c_str());
    for (int j = 0; j < dim; j++)
    {
      int value = EEPROM[i * dim + j];
      str = String(value, HEX) + " ";
      if (value < 0x10) str = "0" + str;
      Serial.write(str.c_str());
    }
    Serial.write("\n");
  }

}

void loop() {
  // put your main code here, to run repeatedly:

}
