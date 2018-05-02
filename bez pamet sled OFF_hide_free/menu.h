void scan_menu(char);
char en_to_dis(char,uns8);
void test(char);

/*-----------------------------------------------------*/

void scan_menu(char point)
{
char k;
char change;
char esc;
char digit;
char dmax;
uns8 lcd_adr;
uns8 eadr;

switch(point)
	{
	case 1:			// VT code
		{
		lcd_goto(LINE2);
		lcd_puts(Serial);
		for(ind=0;ind<8;ind++)
			{
			retvalue = CODE[ind];
			lcd_write(retvalue);
			eadr++;
			}
		ESCbut();
		break;
		}
	case 2:			// Button 1 Activ?
		{
		vEN1 = en_to_dis(vEN1,eEN1);
		ESCbut();
		if(vEN1 && (cred1 != 0)) rem1 = 1;
		break;
		}
	case 3:			// Button 2 Activ?
		{
		vEN2 = en_to_dis(vEN2,eEN2);
		ESCbut();
		if(vEN2 && (cred2 != 0)) rem2 = 1;
		break;
		}
	case 4:			// Button 3 Activ?
		{
		vEN3 = en_to_dis(vEN3,eEN3);
		ESCbut();
		if(vEN3 && (cred3 != 0)) rem3 = 1;				
		break;
		}
	case 5:			// Button 4 Activ?
		{
		vEN4 = en_to_dis(vEN4,eEN4);
		ESCbut();
		if(vEN4 && (cred4 != 0)) rem4 = 1;				
		break;
		}
	case 6:			// Button 6 Activ?
		{
		vEN6 = en_to_dis(vEN6,eEN6);
		ESCbut();
		if(vEN6 && (cred6 != 0)) rem6 = 1;				
		break;
		}
	case 7:			// Test Relay 1
		{
		if(WORK != 1) test(1);
		break;
		}
	case 8:			// Test Relay 2
		{
		if(WORK != 2) test(2);	
		break;
		}
	case 9:			// Test Relay 3
		{
		if(WORK != 3) test(3);
		break;
		}
	case 10:			// Test Relay 4
		{
		if(WORK != 4) test(4);	
		break;
		}
	case 11:			// Test Relay 6
		{
		if(WORK != 6) test(6);	
		break;
		}
	case 12:		// Sale Channel 1
		{
		tot = total1;
		print_total();
		break;
		}
	case 13:		// Sale Channel 2
		{
		tot = total2;
		print_total();			
		break;
		}
	case 14:		// Sale Channel 3
		{
		tot = total3;
		print_total();
		break;
		}
	case 15:		// Sale Channel 4
		{
		tot = total4;
		print_total();			
		break;
		}
	case 16:		// Sale Channel 6
		{
		tot = total6;
		print_total();			
		break;
		}
	case 17:		// Sale All
		{
		tot = total1 + total2;
		tot += total3;
		tot += total4;
		tot += total6;
		tot += overpay;
		print_total();
		break;
		}
	case 18:		// Overpay
		{
		tot = overpay;
		print_total();	
		break;
		}
	case 19:		//Total counter
		{
		tot = NONpay;
		print_total();
		break;
		}
	case 20:		// Clear STAT CH1
		{
		total1 = 0;
		writeEEPROM(NULL,etotal1H); delay(10);
		writeEEPROM(NULL,etotal1M); delay(10);
		writeEEPROM(NULL,etotal1L); delay(10);	
		st_clear();
		break;
		}
	case 21:		// Clear STAT CH2
		{
		total2 = 0;
		writeEEPROM(NULL,etotal2H); delay(10);
		writeEEPROM(NULL,etotal2M); delay(10);
		writeEEPROM(NULL,etotal2L); delay(10);	
		st_clear();			
		break;
		}
	case 22:		// Clear STAT CH3
		{
		total3 = 0;
		writeEEPROM(NULL,etotal3H); delay(10);
		writeEEPROM(NULL,etotal3M); delay(10);
		writeEEPROM(NULL,etotal3L); delay(10);	
		st_clear();
		break;
		}
	case 23:		// Clear STAT CH4
		{
		total4 = 0;
		writeEEPROM(NULL,etotal4H); delay(10);
		writeEEPROM(NULL,etotal4M); delay(10);
		writeEEPROM(NULL,etotal4L); delay(10);	
		st_clear();			
		break;
		}
	case 24:		// Clear STAT CH6
		{
		total6 = 0;
		writeEEPROM(NULL,etotal6H); delay(10);
		writeEEPROM(NULL,etotal6M); delay(10);
		writeEEPROM(NULL,etotal6L); delay(10);	
		st_clear();			
		break;
		}
	case 25:		// Clear All STAT
		{
		total1 = 0;
		writeEEPROM(NULL,etotal1H); delay(10);
		writeEEPROM(NULL,etotal1M); delay(10);
		writeEEPROM(NULL,etotal1L); delay(10);
		total2 = 0;
		writeEEPROM(NULL,etotal2H); delay(10);
		writeEEPROM(NULL,etotal2M); delay(10);
		writeEEPROM(NULL,etotal2L); delay(10);
		total3 = 0;
		writeEEPROM(NULL,etotal3H); delay(10);
		writeEEPROM(NULL,etotal3M); delay(10);
		writeEEPROM(NULL,etotal3L); delay(10);
		total4 = 0;
		writeEEPROM(NULL,etotal4H); delay(10);
		writeEEPROM(NULL,etotal4M); delay(10);
		writeEEPROM(NULL,etotal4L); delay(10);
		total6 = 0;
		writeEEPROM(NULL,etotal6H); delay(10);
		writeEEPROM(NULL,etotal6M); delay(10);
		writeEEPROM(NULL,etotal6L); delay(10);
		overpay = 0;
		writeEEPROM(NULL,eoverH); delay(10);
		writeEEPROM(NULL,eoverM); delay(10);
		writeEEPROM(NULL,eoverL); delay(10);
		st_clear();
		break;
		}
	case 26:		// MMC/SD -> EEPROM   MOJE DA NE RABOTI
		{
/*		CardDetect();
		lcd_goto(LINE2);
		if(!card) lcd_puts(MMCerr);
		else
			{
			lcd_puts(Wait);
			MMC_Read(CONFIG_H,CONFIG_L);
			eadr = eeprom_start;
			for(index=0;index<256;index++)
				{
				retvalue = mmc[index];
				writeEEPROM(retvalue,eadr);
				delay(10);
				eadr ++;
				}
			lcd_goto(LINE2);
			lcd_puts(Ready);
			}
		Load();
		if(vBL) BLCTRL = 1;
		else BLCTRL = 0;
		ESCbut();
		break;    */
		}
	case 27:		// AUDIT -> MMC/SD		MOJE DA NE RABOTI
	case 28:		// EEPROM-> CONFIG		MOJE DA NE RABOTI
		{
		break;
		}
/*		{
		CardDetect();
		lcd_goto(LINE2);
		if(!card) lcd_puts(MMCerr);
		else
			{
			lcd_puts(Wait);
			if(point == 17) SecSearch();
			else
				{
				addr_H = CONFIG_H;
				addr_L = CONFIG_L;
				}
*/	//		vCounter ++;
//			writeEEPROM(vCounter.high8,eCounterH); delay(10);
 /*			writeEEPROM(vCounter.low8,eCounterL); delay(10);
			eadr = eeprom_start;
			for(index=0;index<256;index++)
				{
				retvalue = readEEPROM(eadr);
				mmc[index] = retvalue;
				eadr ++;
				}
			for(index=256;index<503;index++) mmc[index] = NULL;
			ind = 0;
			for(index=504;index<512;index++)
				{
				retvalue = CODE[ind];
				mmc[index] = retvalue;
				ind ++;
				}
			retvalue = MMC_Write(addr_H,addr_L); delay(100);
			if(retvalue)
				{
				UpdateFAT(); delay(100);
				lcd_goto(LINE2);
				lcd_puts(Ready);
				}
			else
				{
				lcd_goto(LINE2);
				lcd_puts(MMCerr);
				}
			}
		ESCbut();
//		break; 		
		}     */
	case 29:		// Set coin table
		{
		for(ind=0;ind<3;ind++)
			{
			check = 0;
			lcd_goto(LINE2);
			lcd_puts(Insert);
			switch(ind)
				{
				case 0:
					{
					lcd_write('T');
					lcd_write('o');
					lcd_write('k');
					lcd_write('e');
					lcd_write('n');
					lcd_write(' ');
					lcd_write('1');
					retvalue = readEEPROM(eOPA); delay(1);
					break;
					}
				case 1:
					{
					lcd_write('T');
					lcd_write('o');
					lcd_write('k');
					lcd_write('e');
					lcd_write('n');
					lcd_write(' ');
					lcd_write('2');
					retvalue = readEEPROM(eOPB); delay(1);
					break;
					}
				case 2:
					{
					lcd_write('T');
					lcd_write('o');
					lcd_write('k');
					lcd_write('e');
					lcd_write('n');
					lcd_write(' ');
					lcd_write('3');
					retvalue = readEEPROM(eOPC); delay(1);
					break;
					}
		/*
				case 3:
					{
					lcd_write('2');
					lcd_write('0');
					retvalue = 20;
					break;
					}
				case 4:
					{
					lcd_write('5');
					lcd_write('0');
					retvalue = 50;
					break;
					}
				case 5:
					{
					lcd_write('1');
					lcd_write('0');
					lcd_write('0');
					retvalue = 100;
					break;
					}
	*/	
			}
			while(!check);
			check = 0;
			switch(sysB)
				{
				case 0x77:
					{
					writeEEPROM(retvalue,eOPA);
					delay(10);
					break;
					}
				case 0xB7:
					{
					writeEEPROM(retvalue,eOPB);
					delay(10);
					break;
					}
				case 0xD7:
					{
					writeEEPROM(retvalue,eOPC);
					delay(10);
					break;
					}
				case 0xF3:
					{
					writeEEPROM(retvalue,eOPD);
					delay(10);
					break;
					}
				case 0xF5:
					{
					writeEEPROM(retvalue,eOPE);
					delay(10);
					break;
					}
				case 0xF6:
					{
					writeEEPROM(retvalue,eOPF);
					delay(10);
					break;
					}
				case 0xE7:
					{		
					lcd_goto(LINE2);
					lcd_puts(Error);
					break;
					}
				}
			delay(250);
			}
		check = 0;
		lcd_goto(LINE2);
		lcd_puts(Save);
		ESCbut();
		break;
		}
	case 30:			// Read cred table 1
	case 31:			// Read cred table 2
	case 32:			// Read cred table 3
	case 33:			// Read cred table 4
	case 34:			// Read cred table 6
		{
		if(point == 30) eadr = eeprom_start;
		if(point == 31) eadr = eeprom_start + 5;
		if(point == 32) eadr = eeprom_start + 0x60;
		if(point == 33) 
			{
			eadr = eeprom_start + 0x60;
			eadr = eadr + 5;
			}
		if(point == 34) eadr = eeprom_start + 0x0B; 
		lcd_clear();		
		k = 0;
		esc = 1;
		while(esc)
			{
			retvalue = readEEPROM(eadr);
			credit = (uns16)retvalue * 100;
			retvalue = readEEPROM(eadr+1);
			credit += retvalue;
			if(retvalue != 0xFF)
				{
				lcd_goto(LINE1);
				lcd_puts(Credit);
				lcd_credit();
				lcd_goto(LINE2);
				lcd_puts(Time);
				hour = readEEPROM(eadr+2);
				min  = readEEPROM(eadr+3);
				sec  = readEEPROM(eadr+4);
				lcd_time();	
				}
			else
				{
				lcd_goto(LINE2);
				lcd_puts(CLEAR);
				while(ESC);	 delay(100);
				while(!ESC); delay(100);
				break;
				}

			if(!DOWN)		// Press DOWN
				{
				if(k<5)
					{
					retvalue = readEEPROM(eadr+0x10);
					if(retvalue != 0xFF) 
						{
						k ++;
						eadr += 0x10;
						}
					}
				while(!DOWN);
				delay(100);
				}

			if(!UP)			// Press UP
				{
				if(k > 0) 
					{
					k --;
					eadr -= 0x10;
					}
				while(!UP);
				delay(100);
				}

			if(!ESC) 		// Press ESC
				{
				credit = 0;
				while(!ESC);
				esc = 0;
				delay(100);
				}	
			}
		break;
		}
	case 35:		// Set credit table 1
	case 36:		// Set credit table 2
	case 37:		// Set credit table 3
	case 38:		// Set credit table 4
	case 39:		// Set credit table 6
		{
		if(point == 35) eadr = eeprom_start;
		if(point == 36) eadr = eeprom_start + 5;
		if(point == 37) eadr = eeprom_start + 0x60;
		if(point == 38) 
			{
			eadr = eeprom_start + 0x60;
			eadr = eadr + 5;
			}
		if(point == 39) eadr = eeprom_start + 0x0B; //new
		for(ind=0;ind<5;ind++)
			{
			for(k=0;k<10;k++) 
				{
				writeEEPROM(0xFF,eadr+k); 
				delay(10);
				}
			eadr += 0x10;
			}
		delay(100);
		lcd_setup(1);
		for(ind=0;ind<5;ind++)
			{
			lcd_clear();
			lcd_goto(LINE1);
			lcd_puts(Cont);
			while(1)
				{
				if(!ESC) 
					{
					esc = 1;
					while(!ESC);
					delay(100);
					break;
					}
				if(!ENTER)
					{
					esc = 0;
					while(!ENTER);
					delay(100);
					break;
					}
				}
			if(esc) break;
			retvalue = 0;
			if(point == 35) eadr = ind * 16;
	 		if(point == 36) eadr = ind * 16 + 5;
			if(point == 37) eadr = ind * 16 + 0x60;
			if(point == 38) 
			{
			eadr = ind * 16 + 0x60;
			eadr = eadr + 5;
			}
			if(point == 39) eadr = ind * 16 + 0x0B; //new

	//		if(point == 23) eadr = ind * 16;
	//		else eadr = ind * 16 + 5;
			lcd_clear();
			lcd_adr = LINE1 + 8;
			credit = 0;
			hour = 0;
			min = 0;
			sec = 0;
			change = 1;
			k = 0;
			dmax = 9;

			while(k<10)
				{
				if(change) 
					{
					lcd_goto(LINE1);
					lcd_puts(Credit);
					lcd_credit();
					lcd_goto(LINE2);
					lcd_puts(Time);
					lcd_time();
					lcd_goto(lcd_adr);
					change = 0;
					}

				if(!ENTER)
					{
					while(!ENTER);
					delay(100);
					k ++;
					digit = 0;
					change = 1;
					if((lcd_adr==0x89) || (lcd_adr==0xC7) || (lcd_adr==0xCA)) lcd_adr ++;
					if(lcd_adr==0x8C) lcd_adr = LINE2 + 5;	
					if(lcd_adr==0xCD)
						{
						writeEEPROM(lev,eadr);		delay(10);
						writeEEPROM(stot,eadr+1);	delay(10);
						writeEEPROM(hour,eadr+2);	delay(10);
						writeEEPROM(min,eadr+3);	delay(10);
						writeEEPROM(sec,eadr+4);	delay(10);
						}
					lcd_adr ++;
					if((lcd_adr==0xC9) || (lcd_adr==0xCC)) dmax = 5;
					else dmax = 9;
					}	// end if(ENTER)

				if(!UP)
					{
					if(digit < dmax) 
						{
						digit ++;
						change = 1;
						}
					else change = 0;
					while(!UP);
					delay(100);
					if(change)
						{
						switch(lcd_adr)
							{
							case 0x88:
								{
								credit += 1000;
								break;
								}
							case 0x89:
								{
								credit += 100;
								break;
								}
							case 0x8B:
								{
								credit += 10;
								break;
								}
							case 0x8C:
								{
								credit ++;
								break;
								}
							case 0xC6:
								{
								hour += 10;
								break;
								}
							case 0xC7:
								{
								hour ++;
								break;
								}
							case 0xC9:
								{
								min += 10;
								break;
								}
							case 0xCA:
								{
								min ++;
								break;
								}
							case 0xCC:
								{
								sec += 10;
								break;
								}
							case 0xCD:
								{
								sec ++;
								break;
								}
							}	// end switch(lcd_adr)
						}	// end if
					}	// end if(UP)

				if(!DOWN)
					{
					if(digit > 0) 
						{
						digit --;
						change = 1;
						}
					else change = 0;
					while(!DOWN);
					delay(100);
					if(change)
						{
						switch(lcd_adr)
							{
							case 0x88:
								{
								credit -= 1000;
								break;
								}
							case 0x89:
								{
								credit -= 100;
								break;
								}
							case 0x8B:
								{
								credit -= 10;
								break;
								}
							case 0x8C:
								{
								credit --;
								break;
								}
							case 0xC6:
								{
								hour -= 10;
								break;
								}
							case 0xC7:
								{
								hour --;
								break;
								}
							case 0xC9:
								{
								min -= 10;
								break;
								}
							case 0xCA:
								{
								min --;
								break;
								}
							case 0xCC:
								{
								sec -= 10;
								break;
								}
							case 0xCD:
								{
								sec --;
								break;
								}
							}	// end switch(lcd_adr)
						}	// end if(change)
					}	// end if(DOWN) 
				}	// end while(k)
			}	// end for(ind)
		delay(100);
		lcd_setup(0);
		lcd_clear();
		credit = 0;
		while(!ESC); delay(100);
		while(!ENTER); delay(100);
		break;
		}
	case 40:		// Inhibit settings
		{
		vINH = en_to_dis(vINH,eINH);
		break;
		}
	case 41:		// Start settings
		{
		vComm = en_to_dis(vComm,eComm);
		break;
		}
	case 42:		// BL settings
		{
		vBL = en_to_dis(vBL,eBL);
		break;
		}
	case 43:		// AUTOSTART value 
		{
		change = 1;
		while(1)
			{
			if(change)
				{
				change = 0;
				hour = 0;
				min = vAUTOSTART / 60;
				sec = vAUTOSTART % 60;
				lcd_goto(LINE2);
				lcd_puts(Time);
				lcd_time();
				}
			if(!DOWN)
				{
				if(vAUTOSTART > 0) 
					{
					vAUTOSTART --;
					change = 1;
					}
				while(!DOWN);
				delay(100);
				}
			if(!UP)
				{
				if(vAUTOSTART < 240) 
					{
					vAUTOSTART ++;
					change = 1;
					}
				while(!UP);
				delay(100);
				}
			if(!ENTER)
				{
				writeEEPROM(vAUTOSTART,eAUTOSTART);
				while(!ENTER);
				delay(100);
				lcd_goto(LINE2);
				lcd_puts(Save);
				break;
				}
			if(!ESC) break;
			}
		ESCbut();
		break;
		}
	case 44:		// Error log
		{
		lcd_clear();
		if(err1)
			{
			lcd_goto(LINE1);
			lcd_puts(Chan1);
			lcd_goto(LINE2);
			lcd_puts(Error);
			ESCbut();
			}
		if(err2)
			{
			lcd_goto(LINE1);
			lcd_puts(Chan2);
			lcd_goto(LINE2);
			lcd_puts(Error);
			ESCbut();
			}
		if(err3)
			{
			lcd_goto(LINE1);
			lcd_puts(Chan3);
			lcd_goto(LINE2);
			lcd_puts(Error);
			ESCbut();
			}
		if(err4)
			{
			lcd_goto(LINE1);
			lcd_puts(Chan4);
			lcd_goto(LINE2);
			lcd_puts(Error);
			ESCbut();
			}
		if(err6)
			{
			lcd_goto(LINE1);
			lcd_puts(Chan6);
			lcd_goto(LINE2);
			lcd_puts(Error);
			ESCbut();
			}
		if(!err1 && !err2 && !err3 && !err4 && !err6)
			{
			lcd_goto(LINE1);
			lcd_puts(nError);
			ESCbut();
			}
		break;
		}
	case 45:		// Clear Error log
		{
		err1 = 0;
		err2 = 0;
		err3 = 0;
		err4 = 0;
		lcd_goto(LINE2);
		lcd_puts(CLEAR);
		ESCbut();
		break;
		}
	case 46:		// Clear credit 1
		{
		cred1 = 0;
//		REL1_OFF();
		writeEEPROM(NULL,etime1H); delay(10);
		writeEEPROM(NULL,etime1M);  delay(10);
		lcd_goto(LINE2);
		lcd_puts(CLEAR);
		ESCbut();
		break;
		}
	case 47:		// clear credit 2
		{
		cred2 = 0;
//		REL2_OFF();
		writeEEPROM(NULL,etime2H); delay(10);
		writeEEPROM(NULL,etime2M);  delay(10);
		lcd_goto(LINE2);
		lcd_puts(CLEAR);
		ESCbut();
		break;
		}
	case 48:		// Clear credit 3
		{
		cred3 = 0;
//		REL3_OFF();
		writeEEPROM(NULL,etime3H); delay(10);
		writeEEPROM(NULL,etime3M);  delay(10);
		lcd_goto(LINE2);
		lcd_puts(CLEAR);
		ESCbut();
		break;
		}
	case 49:		// clear credit 4
		{
		cred4 = 0;
//		REL4_OFF();
		writeEEPROM(NULL,etime4H); delay(10);
		writeEEPROM(NULL,etime4M);  delay(10);
		lcd_goto(LINE2);
		lcd_puts(CLEAR);
		ESCbut();
		break;
		}
	case 50:		// clear credit 6
		{
		cred6 = 0;
//		REL4_OFF();
		writeEEPROM(NULL,etime6H); delay(10);
		writeEEPROM(NULL,etime6M);  delay(10);
		lcd_goto(LINE2);
		lcd_puts(CLEAR);
		ESCbut();
		break;
		}
	case 51:		// clear overpay
		{
		overpay = 0;
		writeEEPROM(NULL,eoverH); delay(10);
		writeEEPROM(NULL,eoverM); delay(10);
		writeEEPROM(NULL,eoverL); delay(10);	
		st_clear();
		break;
		}
	default: break;
	}
}

/*-----------------------------------------------------*/

char en_to_dis(char ENbit,uns8 ENaddr)
{
char new_value;

new_value = ENbit;
lcd_goto(LINE2);
if(ENbit) lcd_puts(EN);
else lcd_puts(DIS);
SECcount = 0;
while(SECcount < 30)
	{
	if(!ENTER) 
		{
		new_value ^= 1;
		writeEEPROM(new_value,ENaddr); 
		delay(10);
		lcd_goto(LINE2);
		if(new_value) lcd_puts(Enable);
		else lcd_puts(Disable);
		while(!ENTER);	delay(100);
		break;
		}
	if(!ESC) break;
	}
return (new_value);
}

/*-----------------------------------------------------*/

void test(char en)
{
if(en == 1)
	{
	cred1 = 30;
	REL1_ON();
	}
if(en == 2)
	{
	cred2 = 30;
	REL2_ON();
	}
if(en == 3)
	{
	cred3 = 30;
	REL3_ON();
	}
if(en == 4)
	{
	cred4 = 30;
	REL4_ON();
	}
if(en == 6)
	{
	cred6 = 30;
	REL6_ON();
	}
lcd_goto(LINE1);
lcd_puts(TESTS);
while((cred1 > 0) || (cred2 > 0) || (cred3 > 0) || (cred4 > 0) || (cred6 > 0))
	{
	lcd_goto(LINE2);
	if(en == 1) 
		{
		conv(cred1);
		lcd_puts(Time1);
		}
	if(en == 2)
		{
		conv(cred2);
		lcd_puts(Time2);
		}
	if(en == 3) 
		{
		conv(cred3);
		lcd_puts(Time3);
		}
	if(en == 4)
		{
		conv(cred4);
		lcd_puts(Time4);
		}
	if(en == 6)
		{
		conv(cred6);
		lcd_puts(Time6);
		}
	lcd_time();
	delay(100);
	if(!ESC) break;
	}
if(en == 1)  
	{
	REL_OFF();
	cred1 = 0;
	}
if(en == 2)
	{
	REL_OFF();
	cred2 = 0;
	}
if(en == 3)  
	{
	REL_OFF();
	cred3 = 0;
	}
if(en == 4)
	{
	REL_OFF();
	cred4 = 0;
	}
if(en == 6)
	{
	REL_OFF();
	cred6 = 0;
	}
lcd_goto(LINE1);
lcd_puts(TESTF);
lcd_goto(LINE2);
lcd_puts(NOTH);
ESCbut();
}

/*-----------------------------------------------------*/