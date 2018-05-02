#include "int18xxx.h"
#include <defs.h>
#include <config.h>
#include <print.h>
#include <interrupt.h>
#include <spi.h>
#include <pc.h>
#include <math16.h>
#include <functions.h>
//#include <mmc.h>
//#include <fat16.h>
#include <eeprom.h>
#include <lcd.h>
#include <menu.h>

void main(void)
{
uns8 pp;
uns16 val_tmp;
uns16 x2_tmp;
uns8 pause_flag;

clearRAM();						// clear RAM
SYSTEM_setup();delay(100);		// system config
// uart(); delay(100);				// uart ini 
SPI_setup(); delay(100);		// spi ini
lcd_setup(0); delay(100);		// LCD ini routine
lcd_clear();			
start_int();					// Start interrupts
Load();							// Load epprom values
ini();							// Load ini values
pause = 0;
WORK = 0;
pause_flag = 0;
OUT_PC = 1;
PC = 0;							//1 - ON PC comunication; 0 - OFF PC comunication
//if(vBL) BLCTRL = 1;
//else BLCTRL = 0;

lcd_clear();
lcd_goto(LINE1);
lcd_puts(Welc);
//lcd_goto(LINE2);
//lcd_puts(NOTH);
lcd_goto(LINE2);
lcd_puts_cyr(Ready_cyr);

if(vComm != 0) 
	{
	if(vEN1) cred1 = vAUTOSTART;
	if(vEN2) cred2 = vAUTOSTART;
	if(vEN3) cred3 = vAUTOSTART;
	if(vEN4) cred4 = vAUTOSTART;
	if(vEN6) cred6 = vAUTOSTART;

	}
else
	{
	if(cred1 != 0) rem1 = 1;
	if(cred2 != 0) rem2 = 1;
	if(cred3 != 0) rem3 = 1;
	if(cred4 != 0) rem4 = 1;
	if(cred6 != 0) rem6 = 1;
	}

MODE:

lcd_setup(0);

if(rem1 && (cred1 != 0) && pause == 0) 
	{	
	REL1_ON();
	WORK = 1;
	}
if(rem2 && (cred2 != 0) && pause == 0)
	{
	REL2_ON();
	WORK = 2;
	}
if(rem3 && (cred3 != 0) && pause == 0) 
	{
	REL3_ON();
	WORK = 3;
	}
if(rem4 && (cred4 != 0) && pause == 0) 
	{
	REL4_ON();
	WORK = 4;
	}	
if(rem6 && (cred6 != 0) && pause == 0) 
	{
	REL6_ON();
	WORK = 6;
	}	

if(check)
	{
	delay(200);
	check = 0;
	switch(sysB)
		{
		case 0x77:
			{
			credit += vOPA;
			if(PC == 1) OUT_PC_count += OUT_PC_ON;
			break;
			}
		case 0xB7:
			{
			credit += vOPB;
			if(PC == 1) OUT_PC_count += OUT_PC_ON;
			break;
			}
		case 0xD7:
			{
			credit += vOPC;
			if(PC == 1) OUT_PC_count += OUT_PC_ON;
			break;
			}
		case 0xF3:
			{
			credit += vOPD;
			if(PC == 1) OUT_PC_count += OUT_PC_ON;
			break;
			}
		case 0xF5:
			{
			credit += vOPE;
			if(PC == 1) OUT_PC_count += OUT_PC_ON;
			break;
			}
		case 0xF6:
			{
			credit += vOPF;
			if(PC == 1) OUT_PC_count += OUT_PC_ON;
			break;
			}
		case 0xA5:
			{
			credit += vOPE;
			break;
			}



		case 0xE7:
			{		
			break;
			}
		}

	lcd_clear();
	lcd_goto(LINE1);
	lcd_puts_cyr(Credit_cyr);
	lcd_puts(": ");
//	lcd_goto(LINE2);
//	lcd_puts(Space);
	lcd_credit();
	lcd_goto(LINE2);
	lcd_puts_cyr(Choice_cyr);

	delay(250);
	overTIME = 0;
	sysB = PORTB;
/*
	if(OUT_PC_count != 0)
		{
		OUT_PC = 1;
		delaySec(3);
		OUT_PC = 0;
		delaySec(1);
		OUT_PC_count --;
		}
*/
	}

if((overTIME > 180) && (credit != 0))
	{
	overpay += credit;
	NONpay += credit;
	credit = 0;
	writeEEPROM(overpay.high8,eoverH); delay(10);
	writeEEPROM(overpay.mid8,eoverM); delay(10);
	writeEEPROM(overpay.low8,eoverL); delay(10);

	writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	}

if((!vEN1 && !vEN2 && !vEN3 && !vEN4 && !vEN6) && !vComm)
	{
	lcd_out();
	ESCbut();
	goto M;
	}

if(!EBUT_COUNTER)
	{
	tot = NONpay;
	lcd_goto(LINE2);
	lcd_puts(Cash);
	lcd_money();
	lcd_puts(BGN);
	while(!EBUT_COUNTER);
	delay(100);
	}

if(((cred1 == 0) || !vEN1) && ((cred2 == 0) || !vEN2) && ((cred3 == 0) || !vEN3) && ((cred4 == 0) || !vEN4) && ((cred6 == 0) || !vEN6)) 	WORK = 0;

if((credit == 0) && ((cred1 == 0) || !vEN1) && ((cred2 == 0) || !vEN2) && ((cred3 == 0) || !vEN3) && ((cred4 == 0) || !vEN4) && ((cred6 == 0) || !vEN6))
	{
	lcd_goto(LINE1);
	lcd_puts(Welc);
//	lcd_goto(LINE2);
//	lcd_puts(NOTH);
	lcd_goto(LINE2);
	lcd_puts_cyr(Ready_cyr);
	free_flag = 0;

	goto M;
	}

if((credit == 0) && ((cred1 != 0) || (cred2 != 0) || (cred3 != 0) || (cred4 != 0) || (cred6 != 0)))
	{
	if(vEN1 && (cred1 != 0))
		{
		if (pause == 0)
			{
			lcd_goto(LINE1);
			lcd_puts_cyr(Time1_cyr);
//			lcd_goto(LINE2);
//			lcd_puts(NOTH);
			conv(cred1);
			lcd_goto(LINE2);
			if(hour > 99) lcd_puts(Over);
			else 
				{
				lcd_puts(Space);
				lcd_time();
				lcd_puts(Space);
				}
			}
			
		if(!EBUT5 && pause == 0)
			{
			pause = 1;
			pause_flag = 1;
			lcd_clear();
			lcd_goto(LINE1);
			lcd_puts_cyr(Pause_LCD_cyr);
								

			while (!EBUT5)
				{
				if(!EBUT1) 						//Free add 2lv
					{
					free_flag ++;
					while (!EBUT1);
					delay(100);
					}
					if(free_flag == 3)
						{
						cred1 += 120;
						free_flag = 0;
						}
				}
			delay(100);
			}

		if(!EBUT5 && pause == 1 && pause_flag == 1)
			{
			pause = 0;
			pause_flag = 0;
			while (!EBUT5);
			delay(100);
			}
		}

	if(vEN2 && (cred2 != 0))
		{
		if (pause == 0)
			{
			lcd_goto(LINE1);
			lcd_puts_cyr(Time2_cyr);
//			lcd_goto(LINE2);
//			lcd_puts(NOTH);
			conv(cred2);
			lcd_goto(LINE2);
			if(hour > 99) lcd_puts(Over);
			else 
				{
				lcd_puts(Space);
				lcd_time();
				lcd_puts(Space);
				}
			}
			
		if(!EBUT5 && pause == 0)
			{
			pause = 1;
			pause_flag = 2;
			lcd_clear();
			lcd_goto(LINE1);
			lcd_puts_cyr(Pause_LCD_cyr);
			while (!EBUT5);
			delay(100);
			}

		if(!EBUT5 && pause == 1 && pause_flag == 2)
			{
			pause = 0;
			pause_flag = 0;
			while (!EBUT5);
			delay(100);
			}	
		}

	if(vEN3 && (cred3 != 0))
		{
		if (pause == 0)
			{
			lcd_goto(LINE1);
			lcd_puts_cyr(Time3_cyr);
//			lcd_goto(LINE2);
//			lcd_puts(NOTH);
			conv(cred3);
			lcd_goto(LINE2);
			if(hour > 99) lcd_puts(Over);
			else 
				{
				lcd_puts(Space);
				lcd_time();
				lcd_puts(Space);
				}
			}
			
		if(!EBUT5 && pause == 0)
			{
			pause = 1;
			pause_flag = 3;
			lcd_clear();
			lcd_goto(LINE1);
			lcd_puts_cyr(Pause_LCD_cyr);
			while (!EBUT5);
			delay(100);
			}

		if(!EBUT5 && pause == 1  && pause_flag == 3)
			{
			pause = 0;
			pause_flag = 0;
			while (!EBUT5);
			delay(100);
			}
		}

	if(vEN4 && (cred4 != 0))
		{
		if (pause == 0)
			{
			lcd_goto(LINE1);
			lcd_puts_cyr(Time4_cyr);
//			lcd_goto(LINE2);
//			lcd_puts(NOTH);
			conv(cred4);
			lcd_goto(LINE2);
			if(hour > 99) lcd_puts(Over);
			else 
				{
				lcd_puts(Space);
				lcd_time();
				lcd_puts(Space);
				}
			}
			
		if(!EBUT5 && pause == 0)
			{
			pause = 1;
			pause_flag = 4;
			lcd_clear();
			lcd_goto(LINE1);
			lcd_puts_cyr(Pause_LCD_cyr);
			while (!EBUT5);
			delay(100);
			}

		if(!EBUT5 && pause == 1 && pause_flag == 4)
			{
			pause = 0;
			pause_flag = 0;
			while (!EBUT5);
			delay(100);
			}	
		}

	if(vEN6 && (cred6 != 0))
		{
		if (pause == 0)
			{
			lcd_goto(LINE1);
			lcd_puts_cyr(Time6_cyr);
//			lcd_goto(LINE2);
//			lcd_puts(NOTH);
			conv(cred6);
			lcd_goto(LINE2);
			if(hour > 99) lcd_puts(Over);
			else 
				{
				lcd_puts(Space);
				lcd_time();
				lcd_puts(Space);
				}
			}
			
		if(!EBUT5 && pause == 0)
			{
			pause = 1;
			pause_flag = 6;
			lcd_clear();
			lcd_goto(LINE1);
			lcd_puts_cyr(Pause_LCD_cyr);
			while (!EBUT5);
			delay(100);
			}

		if(!EBUT5 && pause == 1  && pause_flag == 6)
			{
			pause = 0;
			pause_flag = 0;
			while (!EBUT5);
			delay(100);
			}
		}
		
/*-------------------------------------------------------------*/
		if(OUT_PC_count > 0)				/////PC_OUT_counter
			{
			OUT_PC = 0;
			delay(250);
			OUT_PC_count --;
			if (!(OUT_PC_count % 4))
				{
				OUT_PC = 1;
				delay(250);
				delay(250);
				}
			} 
		else OUT_PC = 1;

/*-------------------------------------------------------------*/
	
	}


if((WORK == 0 || WORK == 1) && (((!EBUT1 && vEN1) && ((credit != 0) || rem1)) || (vComm != 0)))
	{
	val_tmp = readEEPROM(0x00);	
	x2_tmp = (uns16)val_tmp * 100;
	val_tmp = readEEPROM(0x01);	
	x2_tmp +=(uns16)val_tmp;
	if(x2_tmp<=credit)
		{
		WORK = 1;
		rem1 = 0;
		SECcount = 0;
		cr_to_time(1);
		cred1 += value;
		total1 += credit;
		NONpay += credit;
		value = 0;
		credit = 0;
		if(cred1 != 0 && pause == 0)
			{
			SECcount = 60;
			REL1_ON(); 
			}
		writeEEPROM(total1.high8,etotal1H); delay(10);
		writeEEPROM(total1.mid8,etotal1M);  delay(10);
		writeEEPROM(total1.low8,etotal1L);  delay(10);
	
		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
		while(!EBUT1);
		delay(100);
		}
	else 
		{
		lcd_clear();
		lcd_goto(LINE1);
		lcd_puts_cyr(Credit_cyr);
		lcd_puts(": ");
//		lcd_goto(LINE2);
//		lcd_puts(Space);
		lcd_credit();
		lcd_goto(LINE2);
		lcd_puts_cyr(Choice_cyr);
		}
	}

if((WORK == 0 || WORK == 2) && (((!EBUT2 && vEN2)  && ((credit != 0) || rem2)) || (vComm != 0))) 
	{
	val_tmp = readEEPROM(0x05);	
	x2_tmp = (uns16)val_tmp * 100;
	val_tmp = readEEPROM(0x06);	
	x2_tmp +=(uns16)val_tmp;
	if(x2_tmp<=credit)
		{
		WORK = 2;
		rem2 = 0;
		SECcount = 0;
		cr_to_time(2);
		cred2 += value;
		total2 += credit;
		NONpay += credit;
		value = 0;
		credit = 0;
		if(cred2 != 0 && pause == 0)
			{
			SECcount = 60;
			REL2_ON(); 
			}
		writeEEPROM(total2.high8,etotal2H); delay(10);
		writeEEPROM(total2.mid8,etotal2M);  delay(10);
		writeEEPROM(total2.low8,etotal2L);  delay(10);
	
		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
		while(!EBUT2);
		delay(100);
		}
	else 
		{
		lcd_clear();
		lcd_goto(LINE1);
		lcd_puts_cyr(Credit_cyr);
		lcd_puts(": ");
//		lcd_goto(LINE2);
//		lcd_puts(Space);
		lcd_credit();
		lcd_goto(LINE2);
		lcd_puts_cyr(Choice_cyr);
		}
	}

if((WORK == 0 || WORK == 3) && (((!EBUT3 && vEN3) && ((credit != 0) || rem3)) || (vComm != 0)))
	{
	val_tmp = readEEPROM(0x60);	
	x2_tmp = (uns16)val_tmp * 100;
	val_tmp = readEEPROM(0x61);	
	x2_tmp +=(uns16)val_tmp;
	if(x2_tmp<=credit)
		{
		WORK = 3;
		rem3 = 0;
		SECcount = 0;
		cr_to_time(3);
		cred3 += value;
		total3 += credit;
		NONpay += credit;
		value = 0;
		credit = 0;
		if(cred3 != 0 && pause == 0)
			{
			SECcount = 60;
			REL3_ON(); 
			}
		writeEEPROM(total3.high8,etotal3H); delay(10);
		writeEEPROM(total3.mid8,etotal3M);  delay(10);
		writeEEPROM(total3.low8,etotal3L);  delay(10);
	
		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
		while(!EBUT3);
		delay(100);
		}
	else 
		{
		lcd_clear();
		lcd_goto(LINE1);
		lcd_puts_cyr(Credit_cyr);
		lcd_puts(": ");
//		lcd_goto(LINE2);
//		lcd_puts(Space);
		lcd_credit();
		lcd_goto(LINE2);
		lcd_puts_cyr(Choice_cyr);
		}
	}

if((WORK == 0 || WORK == 4) && (((!EBUT4 && vEN4)  && ((credit != 0) || rem4)) || (vComm != 0))) 
	{
	val_tmp = readEEPROM(0x65);	
	x2_tmp = (uns16)val_tmp * 100;
	val_tmp = readEEPROM(0x66);	
	x2_tmp +=(uns16)val_tmp;
	if(x2_tmp<=credit)
		{
		WORK = 4;
		rem4 = 0;
		SECcount = 0;
		cr_to_time(4);
		cred4 += value;
		total4 += credit;
		NONpay += credit;
		value = 0;
		credit = 0;
		if(cred4 != 0 && pause == 0)
			{
			SECcount = 60;
			REL4_ON(); 
			}
		writeEEPROM(total4.high8,etotal4H); delay(10);
		writeEEPROM(total4.mid8,etotal4M);  delay(10);
		writeEEPROM(total4.low8,etotal4L);  delay(10);
	
		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
		while(!EBUT4);
		delay(100);
		}
	else 
		{
		lcd_clear();
		lcd_goto(LINE1);
		lcd_puts_cyr(Credit_cyr);
		lcd_puts(": ");
//		lcd_goto(LINE2);
//		lcd_puts(Space);
		lcd_credit();
		lcd_goto(LINE2);
		lcd_puts_cyr(Choice_cyr);
		}
	}

if((WORK == 0 || WORK == 6) && (((!EBUT6 && vEN6)  && ((credit != 0) || rem6)) || (vComm != 0))) 
	{
	val_tmp = readEEPROM(0x0B);	//new
	x2_tmp = (uns16)val_tmp * 100;
	val_tmp = readEEPROM(0x0C);	 //new
	x2_tmp +=(uns16)val_tmp;
	if(x2_tmp<=credit)
		{
		WORK = 6;
		rem6 = 0;
		SECcount = 0;
		cr_to_time(6);
		cred6 += value;
		total6 += credit;
		NONpay += credit;
		value = 0;
		credit = 0;
		if(cred6 != 0 && pause == 0)
			{
			SECcount = 60;
			REL6_ON(); 
			}
		writeEEPROM(total6.high8,etotal6H); delay(10);
		writeEEPROM(total6.mid8,etotal6M);  delay(10);
		writeEEPROM(total6.low8,etotal6L);  delay(10);
	
		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
		while(!EBUT6);
		delay(100);
		}
	else 
		{
		lcd_clear();
		lcd_goto(LINE1);
		lcd_puts_cyr(Credit_cyr);
		lcd_puts(": ");
//		lcd_goto(LINE2);
//		lcd_puts(Space);
		lcd_credit();
		lcd_goto(LINE2);
		lcd_puts_cyr(Choice_cyr);
		}
	}

if((WORK != 0))				// prehvarlqne ot 1 BUT na dr.
	{
	if((!EBUT1) && WORK !=1)
		{
		if (pause == 1)
			{
			pause = 0;
			pause_flag = 0;
			}
		credit_tmp = credit;
		credit = 0;
		time_to_cr(WORK);
		if (credit_tmp!=0) credit+=credit_tmp;
		cr_to_time(1);
		cred1 = value;
		WORK = 1;
		value = 0;
		credit = 0;
		if(cred1 != 0 && pause == 0)
			{
			SECcount = 60;
			REL1_ON(); 
			}
		while(!EBUT1);
		delay(100);		
		}
	else 
		if((!EBUT1) && pause == 1)
		{
		pause = 0;
		pause_flag = 0;
		}

	if((!EBUT2) && WORK !=2)
		{
		if (pause == 1)
			{
			pause = 0;
			pause_flag = 0;
			}
		credit_tmp = credit;
		credit = 0;
		time_to_cr(WORK);
		if (credit_tmp!=0) credit+=credit_tmp;
		cr_to_time(2);
		cred2 = value;
		WORK = 2;
		value = 0;
		credit = 0;
		if(cred2 != 0 && pause == 0)
			{
			SECcount = 60;
			REL2_ON(); 
			}
		while(!EBUT2);
		delay(100);		
		}
	else 
		if((!EBUT2) && pause == 1)
		{
		pause = 0;
		pause_flag = 0;
		}


	if((!EBUT3) && WORK !=3)
		{
		if (pause == 1)
			{
			pause = 0;
			pause_flag = 0;
			}
		credit_tmp = credit;
		credit = 0;
		time_to_cr(WORK);
		if (credit_tmp!=0) credit+=credit_tmp;
		cr_to_time(3);
		cred3 = value;
		WORK = 3;
		value = 0;
		credit = 0;
		if(cred3 != 0 && pause == 0)
			{
			SECcount = 60;
			REL3_ON(); 
			}
		while(!EBUT3);
		delay(100);		
		}
	else 
		if((!EBUT3) && pause == 1)
		{
		pause = 0;
		pause_flag = 0;
		}


	if((!EBUT4) && WORK !=4)
		{
		if (pause == 1)
			{
			pause = 0;
			pause_flag = 0;
			}
		credit_tmp = credit;
		credit = 0;
		time_to_cr(WORK);
		if (credit_tmp!=0) credit+=credit_tmp;
		cr_to_time(4);
		cred4 = value;
		WORK = 4;
		value = 0;
		credit = 0;
		if(cred4 != 0 && pause == 0)
			{
			SECcount = 60;
			REL4_ON(); 
			}
		while(!EBUT4);
		delay(100);		
		}
	else 
		if((!EBUT4) && pause == 1)
		{
		pause = 0;
		pause_flag = 0;
		}


	if((!EBUT6) && WORK !=6)
		{
		if (pause == 1)
			{
			pause = 0;
			pause_flag = 0;
			}
		credit_tmp = credit;
		credit = 0;
		time_to_cr(WORK);
		if (credit_tmp!=0) credit+=credit_tmp;
		cr_to_time(6);
		cred6 = value;
		WORK = 6;
		value = 0;
		credit = 0;
		if(cred6 != 0 && pause == 0)
			{
			SECcount = 60;
			REL6_ON(); 
			}
		while(!EBUT6);
		delay(100);		
		}
	else 
		if((!EBUT6) && pause == 1)
		{
		pause = 0;
		pause_flag = 0;
		}

	}


/*

if((SECcount > 60) && ((cred1 != 0) || (cred2 != 0) || (cred3 != 0) || (cred4 != 0) || (cred6 != 0)))
	{
	SECcount = 0;
	if(vEN1)
		{
		conv(cred1);
		writeEEPROM(hour,etime1H); delay(10);
		writeEEPROM(min,etime1M);  delay(10);
		}
	if(vEN2)
		{
		conv(cred2);
		writeEEPROM(hour,etime2H); delay(10);
		writeEEPROM(min,etime2M);  delay(10);
		}
	if(vEN3)
		{
		conv(cred3);
		writeEEPROM(hour,etime3H); delay(10);
		writeEEPROM(min,etime3M);  delay(10);
		}
	if(vEN4)
		{
		conv(cred4);
		writeEEPROM(hour,etime4H); delay(10);
		writeEEPROM(min,etime4M);  delay(10);
		}
	if(vEN6)
		{
		conv(cred6);
		writeEEPROM(hour,etime6H); delay(10);
		writeEEPROM(min,etime6M);  delay(10);
		}
	}

*/

if(wTIME > 3600)
	{
	wHour ++;
	wTIME = 0;
	writeEEPROM(wHour.high8,eHour);  delay(10);
	writeEEPROM(wHour.mid8,eHour+1); delay(10);
	writeEEPROM(wHour.low8,eHour+2); delay(10);
	}

M:
if(!ENTER)
	{
	lcd_clear();
	while(!ENTER);
	delay(100);
	pp = 0;
	SECcount = 0;
	while(SECcount < 120)
		{
		lcd_goto(LINE1);
		lcd_puts(Menu[pp].com);
		lcd_goto(LINE2);
		lcd_puts(NOTH);
		if(!DOWN)		// Press DOWN
			{
			if(pp < 52) pp ++;
			while(!DOWN);
			delay(200);
			SECcount = 0;
			}
		if(!UP)			// Press UP
			{
			if(pp > 0) pp --;
			while(!UP);
			delay(200);
			SECcount = 0;
			}
		if(!ESC) 		// Press ESC
			{
			while(!ESC);
			delay(200);
			lcd_clear();
			break;
			}
		if(!ENTER)		// Press Enter
			{
			while(!ENTER);
			delay(200);
			scan_menu(pp);
			SECcount = 0;
			}
		}	// end while
	}	// end if

goto MODE;
}

/*-----------------------------------------------------*/
