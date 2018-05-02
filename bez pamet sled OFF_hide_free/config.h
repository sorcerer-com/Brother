#pragma chip PIC18F4520

/*--------- PIC ASSIGNMENTS -------------*/

#pragma bit EBUT4	@ PORTA.0	
#pragma bit EBUT3	@ PORTA.1
#pragma bit LCD1	@ PORTA.2	
#pragma bit LCD2	@ PORTA.3
#pragma bit LCD3	@ PORTA.4	
#pragma bit LCD4	@ PORTA.5	

#pragma bit OPA 	@ PORTB.0		
#pragma bit OPB 	@ PORTB.1	
#pragma bit OPC 	@ PORTB.2	
#pragma bit INHALL 	@ PORTB.3	
#pragma bit ERR		@ PORTB.4	
#pragma bit OPD  	@ PORTB.5	//new	
#pragma bit OPE		@ PORTB.6	//new
#pragma bit OPF 	@ PORTB.7	//new	

#pragma bit REL6	@ PORTC.0  //new_REL6???MMC
#pragma bit REL1	@ PORTC.1
#pragma bit REL2	@ PORTC.2		
#pragma bit IN_PC	@ PORTC.3  //new_IN_PC???MMC	
#pragma bit OUT_PC	@ PORTC.4  //new_OUT_PC???MMC
#pragma bit EBUT6	@ PORTC.5  //new_EBUT6???MMC	
#pragma bit REL3	@ PORTC.6		
#pragma bit REL4	@ PORTC.7	

#pragma bit REL5	@ PORTD.0  //new_REL5???MMC
#pragma bit EBUT5	@ PORTD.1	
#pragma bit ESC		@ PORTD.2		
#pragma bit DOWN	@ PORTD.3	
#pragma bit UP		@ PORTD.4
#pragma bit ENTER	@ PORTD.5	
#pragma bit EBUT1	@ PORTD.6		
#pragma bit EBUT2	@ PORTD.7		

#pragma bit LCD_EN	@ PORTE.0	
#pragma bit LCD_RS	@ PORTE.1		
#pragma bit EBUT_COUNTER	@ PORTE.2	

/*-----------------------------------------*/

#pragma rambank 1
uns8 mmc[512];

#pragma rambank 0
// MBR def
uns16 sec_mbr;								// # of Sector between MBR and Partition
uns24 sec_part;								// # of Sectors in the partition
// BRT def
 uns8 Sec_per_cluster;						// Number of sectors per cluster
uns16 Res_sec;					    		// Number of reserved sectors
uns16 Max_Root_Dir;							// Maximum Root Direcory Entries
uns16 Sec_Per_FAT; 							// The number of sectors per FAT Table
// FAT defs
uns16 Fat_Start1;							// FAT1 start sector
uns16 Fat_Start2;							// FAT2 start sector
uns16 Root_Dir_Entry;						// Root Directory Entry sector
uns16 Data_area;							// Data area sector

uns16 index;
uns16 SECcount;
uns16 ADC_value;
uns16 credit;
uns24 temp;
uns16 addr_H;
uns16 addr_L;
uns24 cred1;
uns24 cred2;
uns24 cred3;
uns24 cred4;
uns24 cred6;
uns24 value;
uns24 tot;
uns24 total1;
uns24 total2;
uns24 total3;
uns24 total4;
uns24 total6;
uns24 overpay;
uns24 NONpay;
uns24 Data;

uns16 CONFIG_H;
uns16 CONFIG_L;

uns16 START_DATA_H;
uns16 START_DATA_L;
uns16 FINAL_DATA_H;
uns16 FINAL_DATA_L;

uns24 wHour;

#pragma rambank -
char rem1;
char rem2;
char rem3;
char rem4;
char rem6;
char err1;
char err2;
char err3;
char err4;
char err6;
char ind;
char card;
char hour;
char min;
char sec;
char stot;
char lev;
char check;
char vINH;
char vComm;
char vEN1;
char vEN2;
char vEN3;
char vEN4;
char vEN6;
char vBL;
char vZumer;
char vOpto1;
char vOpto2;
char size[5];
uns8 vAUTOSTART;
uns8 sysD;
uns8 sysB;
uns8 retvalue;
uns8 vOPA;
uns8 vOPB;
uns8 vOPC;
uns8 vOPD;
uns8 vOPE;
uns8 vOPF;
uns8 ubyte;
uns8 overTIME;
uns16 wTIME;
uns16 vCounter;
uns8 pause;
uns8 WORK;

uns8 OPA_count;
uns8 OPB_count;
uns8 OPC_count;
uns8 OPD_count;
uns8 OPE_count;
uns8 OPF_count;

uns24 credit_tmp;
char OUT_PC_count;
uns8 PC_count;
uns8 PC;
uns8 free_flag;
