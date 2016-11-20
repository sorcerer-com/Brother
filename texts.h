#ifndef TEXTS_H
#define TEXTS_H

#include <avr/pgmspace.h>

const char CODE[] = "16031406";

const char Welcome[]          = "   EASY WASH    ";

const char Credit[]           = "Credit: ";
const char Time[]             = "Time: ";

const char BGN[]              = "LV";
const char OUT[]              = "Out of service  ";

const char TESTS[]            = "Test started    ";
const char TESTF[]            = "Test finished   ";
const char CLEAR[]            = "Cleared         ";

const char Cash[]             = "Cash: ";

const char Insert[]           = "Insert coin: ";
const char Save[]             = "Settings saved  ";

const char Enabled[]          = "Enabled         ";
const char Disabled[]         = "Disabled        ";
const char EN[]               = "    Enable?     ";
const char DIS[]              = "    Disable?    ";

const char Cont[]             = "Continue?       ";

const char Ready_cyr[]        = " PUSNETE JETON  ";
const char Credit_cyr[]       = "KREDIT: ";
const char Choice_cyr[]       = "NAPRAVETE IZBOR ";
const char Pause_cyr[]        = "     PAUZA      ";
const char* Time_cyr[]        = { "    Preparat    ", "   Vodostru>ka  ", "   Parostru>ka  ", "     Yetka      ", "     Pwna       " };

const char menu_00[] PROGMEM  = "----- MENU -----";
const char menu_01[] PROGMEM  = "VT code         ";
const char menu_02[] PROGMEM  = "Button 1 Activ? ";
const char menu_03[] PROGMEM  = "Button 2 Activ? ";
const char menu_04[] PROGMEM  = "Button 3 Activ? ";
const char menu_05[] PROGMEM  = "Button 4 Activ? ";
const char menu_06[] PROGMEM  = "Button 5 Activ? ";
const char menu_07[] PROGMEM  = "Test Relay 1    ";
const char menu_08[] PROGMEM  = "Test Relay 2    ";
const char menu_09[] PROGMEM  = "Test Relay 3    ";
const char menu_10[] PROGMEM  = "Test Relay 4    ";
const char menu_11[] PROGMEM  = "Test Relay 5    ";
const char menu_12[] PROGMEM  = "Sale preparat   ";
const char menu_13[] PROGMEM  = "Sale vodostruika";
const char menu_14[] PROGMEM  = "Sale parostruika";
const char menu_15[] PROGMEM  = "Sale chetka     ";
const char menu_16[] PROGMEM  = "Sale pqna       ";
const char menu_17[] PROGMEM  = "Sale all:       ";
const char menu_18[] PROGMEM  = "Total counter   ";
const char menu_19[] PROGMEM  = "Clear STAT CH1? ";
const char menu_20[] PROGMEM  = "Clear STAT CH2? ";
const char menu_21[] PROGMEM  = "Clear STAT CH3? ";
const char menu_22[] PROGMEM  = "Clear STAT CH4? ";
const char menu_23[] PROGMEM  = "Clear STAT CH5? ";
const char menu_24[] PROGMEM  = "Clear All STAT? ";
const char menu_25[] PROGMEM  = "Set coin table  ";
const char menu_26[] PROGMEM  = "Read preparat   ";
const char menu_27[] PROGMEM  = "Read vodostruika";
const char menu_28[] PROGMEM  = "Read parostruika";
const char menu_29[] PROGMEM  = "Read chetka     ";
const char menu_30[] PROGMEM  = "Read pqna       ";
const char menu_31[] PROGMEM  = "Set preparat    ";
const char menu_32[] PROGMEM  = "Set vodostrukia ";
const char menu_33[] PROGMEM  = "Set parostrukia ";
const char menu_34[] PROGMEM  = "Set chetka      ";
const char menu_35[] PROGMEM  = "Set pqna        ";
const char menu_36[] PROGMEM  = "AUTOSTART value ";
const char menu_37[] PROGMEM  = "Clear credit    ";

const int MenuCount = 38;
const char* const menu[] PROGMEM = 
	{ menu_00, menu_01, menu_02, menu_03, menu_04, menu_05, menu_06, menu_07, menu_08, menu_09,
	  menu_10, menu_11, menu_12, menu_13, menu_14, menu_15, menu_16, menu_17, menu_18, menu_19,
	  menu_20, menu_21, menu_22, menu_23, menu_24, menu_25, menu_26, menu_27, menu_28, menu_29,
	  menu_30, menu_31, menu_32, menu_33, menu_34, menu_35, menu_36, menu_37 };


char buffer[20];
char* Menu(int idx)
{
  strcpy_P(buffer, (char*)pgm_read_word(&(menu[idx])));
  return buffer;
}

#endif // TEXTS_H

