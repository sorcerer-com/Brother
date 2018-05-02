const char Welc[]		= "   EASY WASH    ";
const char Ready[]		= "Ready           ";
const char Choice[]		= "Make your choice";
const char MMCerr[]		= "MMC card error  ";
const char Credit[]		= "Credit: ";
const char Time[]		= "Time: ";
const char Time1[]		= "Time1: ";
const char Time2[]		= "Time2: ";
const char Time3[]		= "Time3: ";
const char Time4[]		= "Time4: ";
const char Time6[]		= "Time5: ";
const char BGN[]		= "LV";
const char OUT[]		= "Out of service  ";
const char TESTS[]		= "Test started    ";
const char TESTF[]		= "Test finished   ";
const char CLEAR[]		= "Cleared";
const char Cash[]		= "Cash: ";
const char Serial[]		= "SerNum: ";
const char Insert[]		= "Insert coin:";
const char Save[]		= "Settings saved  ";
const char MENU[]		= "MENU            ";
const char NOTH[]		= "                ";
const char Enable[]		= "Enabled         ";
const char Disable[]	= "Disabled        ";
const char EN[]			= "Enabled/Disable?";
const char DIS[]		= "Disabled/Enable?";
const char Error[]		= "ERROR           ";
const char nError[]		= "NO ERRORS       ";
const char Cont[]		= "Continue?       ";
const char Chan1[]		= "Channel 1: ";
const char Chan2[]		= "Channel 2: ";
const char Chan3[]		= "Channel 3: ";
const char Chan4[]		= "Channel 4: ";
const char Chan6[]		= "Channel 5: ";
const char Over[]		= " Time over 100h ";
const char Wait[]		= "Please wait     ";
const char Set[]		= "Settings -> MMC ";
const char Pause_LCD[]  = "     PAUSE      ";
const char Time1_cyr[]	= "    Preparat    ";
const char Time2_cyr[]	= "   Vodostru>ka  ";
const char Time3_cyr[]	= "   Parostru>ka  ";
const char Time4_cyr[]	= "     Yetka      ";
const char Time6_cyr[]	= "     Pwna       "; 
//const char Time6_cyr[]	= "     Vaksa      "; 
const char Ready_cyr[]	= " PUSNETE JETON  ";
// const char Ready_cyr[]	= " PUSNETE MONETA ";
const char Credit_cyr[]	= "KREDIT";
const char Choice_cyr[]	= "NAPRAVETE IZBOR ";
const char BGN_cyr[]	= "LV";
const char Pause_LCD_cyr[]  = "     PAUZA      ";
const char Space[]		= "    ";


/*-----------------------------------------------------*/

const struct
	{
	const size2 char *com;
	}Menu[] = 
		{
		"---MENU START---",
		"VT code         ",	// 1
		"Button 1 Activ? ",	// 2
		"Button 2 Activ? ",	// 3
		"Button 3 Activ? ",	// 4
		"Button 4 Activ? ",	// 5
		"Button 5 Activ? ",	// 6
		"Test Relay 1    ",	// 7
		"Test Relay 2    ",	// 8
		"Test Relay 3    ",	// 9
		"Test Relay 4    ",	// 10
		"Test Relay 5    ",	// 11
		"Sale preparat   ",	// 12
		"Sale vodostruika",	// 13
		"Sale parostruika",	// 14
		"Sale chetka     ",	// 15
		"Sale pqna       ",	// 16
//		"Sale vaksa      ",	// 16
//		"Sale Channel 1: ",	// 12
//		"Sale Channel 2: ",	// 13
//		"Sale Channel 3: ",	// 14
//		"Sale Channel 4: ",	// 15
//		"Sale Channel 5: ",	// 16
		"Sale all:       ",	// 17
		"Overpay:        ",	// 18
		"Total counter   ",	// 19
		"Clear STAT CH1? ",	// 20
		"Clear STAT CH2? ",	// 21
		"Clear STAT CH3? ",	// 22
		"Clear STAT CH4? ",	// 23
		"Clear STAT CH5? ",	// 24
		"Clear All STAT? ",	// 25
		"AUDIT  -> MMC/SD",	// 26
		"MMC/SD -> EEPROM",	// 27
		"EEPROM -> CONFIG",	// 28
		"Set coin table  ",	// 29
//		"Read table 1    ",	// 30
//		"Read table 2    ",	// 31
//		"Read table 3    ",	// 32
//		"Read table 4    ",	// 33
//		"Read table 5    ",	// 34
		"Read preparat   ",	// 30
		"Read vodostruika",	// 31
		"Read parostruika",	// 32
		"Read chetka     ",	// 33
		"Read pqna       ",	// 34
//		"Read vaksa      ",	// 34
//		"Set table 1     ",	// 35
//		"Set table 2     ",	// 36
//		"Set table 3     ",	// 37
//		"Set table 4     ",	// 38
//		"Set table 5     ",	// 39
		"Set preparat    ",	// 35
		"Set vodostrukia ",	// 36
		"Set parostrukia ",	// 37
		"Set chetka      ",	// 38
		"Set pqna        ",	// 39
//		"Set vaksa       ",	// 39
		"Inhibit settings",	// 40
		"Start settings  ",	// 41
		"BL settings     ",	// 42
		"AUTOSTART value ",	// 43
		"Error log       ",	// 44
		"Clear Error log ",	// 45
		"Clear credit 1  ",	// 46
		"Clear credit 2  ",	// 47
		"Clear credit 3  ",	// 48
		"Clear credit 4  ",	// 49
		"Clear credit 5  ",	// 50
		"Clear overpay   ",	// 51
		"----MENU END----"
	};
/*		"---MENU START---",
		"VT code         ",	// 1
		"Zumer           ",	// 2
		"Button 1 Activ? ",	// 3
		"Button 2 Activ? ",	// 4
		"Opto 1 tracking?",	// 5
		"Opto 2 tracking?",	// 6
		"Test Relay 1    ",	// 7
		"Test Relay 2    ",	// 8
		"Sale Channel 1: ",	// 9
		"Sale Channel 2: ",	// 10
		"Sale all:       ",	// 11
		"Overpay:        ",	// 12
		"Total counter   ",	// 13
		"Clear STAT CH1? ",	// 14
		"Clear STAT CH2? ",	// 15
		"Clear All STAT? ",	// 16
		"AUDIT  -> MMC/SD",	// 17
		"MMC/SD -> EEPROM",	// 18
		"EEPROM -> CONFIG",	// 19
		"Set coin table  ",	// 20
		"Read table 1    ",	// 21
		"Read table 2    ",	// 22
		"Set table 1     ",	// 23
		"Set table 2     ",	// 24
		"Inhibit settings",	// 25
		"Start settings  ",	// 26
		"BL settings     ",	// 27
		"AUTOSTART value ",	// 28
		"Error log       ",	// 29
		"Clear Error log ",	// 30
		"Clear credit 1  ",	// 31
		"Clear credit 2  ",	// 32
		"Clear overpay   ",	// 33
		"----MENU END----"
*/
	

/*-----------------------------------------------------*/