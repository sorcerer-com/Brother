#ifndef CYR_H
#define CYR_H

#include <avr/pgmspace.h>

//Б
const byte cyr_B[8] PROGMEM = {
  0b11111,
  0b10000,
  0b10000,
  0b11110,
  0b10001,
  0b10001,
  0b11110,
  0b00000
};

//Г
const byte cyr_G[8] PROGMEM = {
  0b11111,
  0b10000,
  0b10000,
  0b10000,
  0b10000,
  0b10000,
  0b10000,
  0b00000
};

//Д
const byte cyr_D[8] PROGMEM = {
  0b00110,
  0b01010,
  0b01010,
  0b01010,
  0b01010,
  0b01010,
  0b11111,
  0b10001
};

//Ж
const byte cyr_ZH[8] PROGMEM = {
  0b10101,
  0b10101,
  0b10101,
  0b01110,
  0b10101,
  0b10101,
  0b10101,
  0b00000
};

//З
const byte cyr_Z[8] PROGMEM = {
  0b01110,
  0b10001,
  0b00001,
  0b00110,
  0b00001,
  0b10001,
  0b01110,
  0b00000
};

//И
const byte cyr_I[8] PROGMEM = {
  0b10001,
  0b10001,
  0b10001,
  0b10011,
  0b10101,
  0b11001,
  0b10001,
  0b00000
};

//Й
const byte cyr_II[8] PROGMEM = {
  0b10101,
  0b10001,
  0b10001,
  0b10011,
  0b10101,
  0b11001,
  0b10001,
  0b00000
};

//Л
const byte cyr_L[8] PROGMEM = {
  0b00111,
  0b01001,
  0b01001,
  0b01001,
  0b01001,
  0b01001,
  0b10001,
  0b00000
};

//П
const byte cyr_P[8] PROGMEM = {
  0b11111,
  0b10001,
  0b10001,
  0b10001,
  0b10001,
  0b10001,
  0b10001,
  0b00000
};

//У
const byte cyr_U[8] PROGMEM = {
  0b10001,
  0b10001,
  0b10001,
  0b01111,
  0b00001,
  0b10001,
  0b01110,
  0b00000
};

//Ф
const byte cyr_F[8] PROGMEM = {
  0b00100,
  0b01110,
  0b10101,
  0b10101,
  0b10101,
  0b01110,
  0b00100,
  0b00000
};

//Ц
const byte cyr_TS[8] PROGMEM = {
  0b10010,
  0b10010,
  0b10010,
  0b10010,
  0b10010,
  0b10010,
  0b11111,
  0b00001
};

//Ч
const byte cyr_CH[8] PROGMEM = {
  0b10001,
  0b10001,
  0b10001,
  0b01111,
  0b00001,
  0b00001,
  0b00001,
  0b00000
};

//Ш
const byte cyr_SH[8] PROGMEM = {
  0b10001,
  0b10001,
  0b10001,
  0b10101,
  0b10101,
  0b10101,
  0b11111,
  0b00000
};

//Щ
const byte cyr_SHT[8] PROGMEM = {
  0b10001,
  0b10001,
  0b10001,
  0b10101,
  0b10101,
  0b10101,
  0b11111,
  0b00001
};

//Ъ
const byte cyr_ER_GOL[8] PROGMEM = {
  0b11000,
  0b01000,
  0b01000,
  0b01110,
  0b01001,
  0b01001,
  0b01110,
  0b00000
};

//Ю
const byte cyr_YU[8] PROGMEM = {
  0b10010,
  0b10101,
  0b10101,
  0b11101,
  0b10101,
  0b10101,
  0b10010,
  0b00000
};

//Я
const byte cyr_YA[8] PROGMEM = {
  0b01111,
  0b10001,
  0b10001,
  0b01111,
  0b00101,
  0b01001,
  0b10001,
  0b00000
};

const byte cyr_b[8] PROGMEM = {
  0b00011,
  0b01100,
  0b10000,
  0b11110,
  0b10001,
  0b10001,
  0b01110,
  0b00000
};//б

const byte cyr_v[8] PROGMEM = {
  0b00000,
  0b00000,
  0b11110,
  0b10001,
  0b11110,
  0b10001,
  0b11110,
  0b00000
};//в

const byte cyr_g[8] PROGMEM = {
  0b00000,
  0b00000,
  0b11110,
  0b10000,
  0b10000,
  0b10000,
  0b10000,
  0b00000
};//г

const byte cyr_d[8] PROGMEM = {
  0b00000,
  0b00000,
  0b00110,
  0b01010,
  0b01010,
  0b01010,
  0b11111,
  0b10001
};//д

const byte cyr_zh[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10101,
  0b10101,
  0b01110,
  0b10101,
  0b10101,
  0b00000
};//ж

const byte cyr_z[8] PROGMEM = {
  0b00000,
  0b00000,
  0b01110,
  0b10001,
  0b00110,
  0b10001,
  0b01110,
  0b00000
};//з

const byte cyr_i[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10001,
  0b10011,
  0b10101,
  0b11001,
  0b10001,
  0b00000
};//и

const byte cyr_ii[8] PROGMEM = {
  0b01010,
  0b00100,
  0b10001,
  0b10011,
  0b10101,
  0b11001,
  0b10001,
  0b00000
};//й

const byte cyr_k[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10010,
  0b10100,
  0b11000,
  0b10100,
  0b10010,
  0b00000
};//к

const byte cyr_l[8] PROGMEM = {
  0b00000,
  0b00000,
  0b00111,
  0b01001,
  0b01001,
  0b01001,
  0b10001,
  0b00000
};//л

const byte cyr_m[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10001,
  0b11011,
  0b10101,
  0b10001,
  0b10001,
  0b00000
};//м

const byte cyr_n[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10001,
  0b10001,
  0b11111,
  0b10001,
  0b10001,
  0b00000
};//н

const byte cyr_p[8] PROGMEM = {
  0b00000,
  0b00000,
  0b11111,
  0b10001,
  0b10001,
  0b10001,
  0b10001,
  0b00000
};//п

const byte cyr_t[8] PROGMEM = {
  0b00000,
  0b00000,
  0b11111,
  0b00100,
  0b00100,
  0b00100,
  0b00100,
  0b00000
};//т

const byte cyr_f[8] PROGMEM = {
  0b00000,
  0b00000,
  0b00100,
  0b01110,
  0b10101,
  0b01110,
  0b00100,
  0b00000
};//ф

const byte cyr_ts[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10010,
  0b10010,
  0b10010,
  0b10010,
  0b11111,
  0b00001
};//ц

const byte cyr_ch[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10001,
  0b10001,
  0b01111,
  0b00001,
  0b00001,
  0b00000
};//ч

const byte cyr_sh[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10101,
  0b10101,
  0b10101,
  0b10101,
  0b11111,
  0b00000
};//ш

const byte cyr_sht[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10101,
  0b10101,
  0b10101,
  0b10101,
  0b11111,
  0b00001
};//щ

const byte cyr_er_gol[8] PROGMEM = {
  0b00000,
  0b00000,
  0b11000,
  0b01000,
  0b01110,
  0b01001,
  0b01110,
  0b00000
};//ъ

const byte cyr_er_mal[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10000,
  0b10000,
  0b11110,
  0b10001,
  0b11110,
  0b00000
};//ь

const byte cyr_yu[8] PROGMEM = {
  0b00000,
  0b00000,
  0b10010,
  0b10101,
  0b11101,
  0b10101,
  0b10010,
  0b00000
};//ю

const byte cyr_ya[8] PROGMEM = {
  0b00000,
  0b00000,
  0b01111,
  0b10001,
  0b01111,
  0b00101,
  0b01001,
  0b00000
};//я


uint32_t charSetPtrs[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
uint8_t charSetAges[8] = { 100, 100, 100, 100, 100, 100, 100 };
bool charToLCD(const LiquidCrystal_I2C& lcd, uint8_t col, uint8_t row, uint32_t charPtr)
{
  for (int i = 0; i < 8; i++)
    charSetAges[i]++;

  uint8_t maxAge = 0;
  uint8_t idx = 0;
  for (int i = 0; i < 8; i++)
  {
    if (charSetPtrs[i] == charPtr) // the char is already in the set
    {
      lcd.write(byte(i));
      charSetAges[i] = 0;
      return false;
    }
    if (maxAge < charSetAges[i])
    {
      maxAge = charSetAges[i];
      idx = i;
    }
  }

  uint8_t cyr[8];
  memcpy_PF(cyr, charPtr, 8);
  lcd.createChar(idx, cyr);
  lcd.setCursor(col, row);
  lcd.write(byte(idx));
  charSetPtrs[idx] = charPtr;
  charSetAges[idx] = 0;
  return true;
}

void print_cyr(const LiquidCrystal_I2C& lcd, uint8_t col, uint8_t row, const char* str)
{
  int currChar  = 0;
  int size = strlen(str);
  while(currChar < size)
  {
    switch(str[currChar])
    {
      case 'A':
        lcd.print("A");
      break;
      case 'B':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_B);
      break;
      case 'V':
        lcd.print("B");
      break;
      case 'G':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_G);
      break;
      case 'D':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_D);
      break;
      case 'E':
        lcd.print("E");
      break;
      case 'J':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_ZH);
      break;
      case 'Z':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_Z);
      break;
      case 'I':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_I);
      break;
      case '<': //Й
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_II);
      break;
      case 'K':
        lcd.print("K");
      break;
      case 'L':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_L);
      break;
      case 'M':
        lcd.print("M");
      break;
      case 'N':
        lcd.print("H");
      break;
      case 'O':
        lcd.print("O");
      break;
      case 'P':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_P);
      break;
      case 'R':
        lcd.print("P");
      break;
      case 'S':
        lcd.print("C");
      break;
      case 'T':
        lcd.print("T");
      break;
      case 'U':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_U);
      break;
      case 'F':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_F);
      break;
      case 'H':
        lcd.print("X");
      break;
      case 'C':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_TS);
      break;
      case 'Y': //Ч
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_CH);
      break;
      case '?': //Ш
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_SH);
      break;
      case '&': //Щ
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_SHT);
      break;
      case 'X': //Ъ
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_ER_GOL);
      break;
      case 'Q': //Ю
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_YU);
      break;
      case 'W': //Я
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_YA);
      break;
      case 'a':
        lcd.print("a");
      break;
      case 'b':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_b);
      break;
      case 'v':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_v);
      break;
      case 'g':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_g);
      break;
      case 'd':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_d);
      break;
      case 'e':
        lcd.print("e");
      break;
      case 'j':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_zh);
      break;
      case 'z':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_z);
      break;
      case 'i':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_i);
      break;
      case '>': //й
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_ii);
      break;
      case 'k':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_k);
      break;
      case 'l':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_l);
      break;
      case 'm':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_m);
      break;
      case 'n':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_n);
      break;
      case 'o':
        lcd.print("o");
      break;
      case 'p':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_p);
      break;
      case 'r':
        lcd.print("p");
      break;
      case 's':
        lcd.print("c");
      break;
      case 't':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_t);
      break;
      case 'u':
        lcd.print("y");
      break;
      case 'f':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_f);
      break;
      case 'h':
        lcd.print("x");
      break;
      case 'c':
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_ts);
      break;
      case 'y': //ч
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_ch);
      break;
      case '/': //ш
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_sh);
      break;
      case '%': //щ
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_sht);
      break;
      case 'x': //ъ
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_er_gol);
      break;
      case '#': //ь
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_er_mal);
      break;
      case 'q': //ю
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_yu);
      break;
      case 'w': //я
        charToLCD(lcd, col + currChar, row,  (uint32_t)cyr_ya);
      break;
      default:
        lcd.print((char)str[currChar]);
      break;
    }
    currChar++;
  }
}

#endif // CYR_H

