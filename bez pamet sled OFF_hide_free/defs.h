/*----------- DEFINISIONS ---------------*/

#define FLAG			0xFF
#define FLAG_POS		0x0F			

/* ASCII definitions */

#define NULL			0x00		// NULL
#define TAB				0x09		// TAB
#define LF				0x0A		// <LF>
#define CR				0x0D		// <CR>
#define SPACE			0x20		// SPACE
#define DOT				0x2E		// .

/* EEPROM definitions */

#define eeprom_start	0x00		// EEPROM start
#define emult_timeH		0x0E
#define emult_timeL		0x0F
#define emult_cr		0x1F
#define eCounterH		0xDA
#define eCounterL		0xDB
#define eHour			0xDC
#define eAUTOSTART		0xDF
#define etime1H			0xE0
#define etime1M			0xE1
#define etime2H			0xE2
#define etime2M			0xE3
#define etime3H			0xC0
#define etime3M			0xC1
#define etime4H			0xC2
#define etime4M			0xC3
#define etime6H			0xC4
#define etime6M			0xC5
#define eNONpayH		0xE4
#define eNONpayM		0xE5
#define eNONpayL		0xE6
#define eoverH			0xE7
#define eoverM			0xE8
#define eoverL			0xE9
#define etotal1H		0xEA
#define etotal1M		0xEB
#define etotal1L		0xEC
#define etotal2H		0xED
#define etotal2M		0xEE
#define etotal2L		0xEF
#define etotal3H		0xCA
#define etotal3M		0xCB
#define etotal3L		0xCC
#define etotal4H		0xCD
#define etotal4M		0xCE
#define etotal4L		0xCF
#define etotal6H		0xBA
#define etotal6M		0xBB
#define etotal6L		0xBC
#define eOPA			0xF5
#define eOPB			0xF4
#define eOPC			0xF3
#define eOPD			0xF2
#define eOPE			0xF1
#define eOPF			0xF0
#define eEN1			0xF6
#define eEN2			0xF7
#define eEN3			0xC6
#define eEN4			0xC7
#define eEN6			0xC8
//#define eZumer			0xF8
//#define eOpto1			0xF9
//#define eOpto2			0xFA
#define eBL				0xFB
#define eComm			0xFE
#define eINH			0xFF
#define OP_limit		3
#define OUT_PC_ON		4
#define OP_PC_limit		60

const char CODE[]	= "16031406";
