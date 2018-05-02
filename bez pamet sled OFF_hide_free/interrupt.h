extern void scan(void);
extern void REL1_ON(void);
extern void REL2_ON(void);
extern void REL3_ON(void);
extern void REL4_ON(void);
extern void REL6_ON(void);
extern void REL_OFF(void);

void _highPriorityInt(void);

/*-----------------------------------------*/

#pragma origin 0x8
interrupt highPriorityIntServer(void)
{
 _highPriorityInt();
 #pragma fastMode
}

/*-----------------------------------------*/

#pragma origin 0x18
interrupt lowPriorityIntServer(void)
{
low_save_registers						// back up W, STATUS and BSR

if(TMR1IF)								
	{
	TMR1H = 0xF1;						// delay 10ms		
	TMR1L = 0x5C;
	if(!check) scan();
	TMR1IF = 0;
	}

if(TMR0IF)
	{
	TMR0H = 0x48;						// overflow after 1000ms
	TMR0L = 0xE4;
	SECcount ++;
	wTIME ++;
	overTIME ++;
	if((cred1 > 0) && (vEN1) && pause == 0) 
		{		
		cred1 --;
		REL1_ON();
		}
//	else REL1_OFF();
	if((cred2 > 0) && (vEN2) && pause == 0) 
		{		
		cred2 --;
		REL2_ON();
		}
//	else REL2_OFF();
	if((cred3 > 0) && (vEN3) && pause == 0) 
		{		
		cred3 --;
		REL3_ON();
		}
//	else REL3_OFF();
	if((cred4 > 0) && (vEN4) && pause == 0) 
		{		
		cred4 --;
		REL4_ON();
		}
//	else REL4_OFF();
	if((cred6 > 0) && (vEN6) && pause == 0) 
		{		
		cred6 --;
		REL6_ON();
		}
//	else REL4_OFF();
	
	if (pause == 1)	REL_OFF();

	if((cred1 == 0) && (cred2 == 0) && (cred3 == 0) && (cred4 == 0) && (cred6 == 0))	REL_OFF();
	if(cred1 == 0)	rem1 = 0;
	if(cred2 == 0)	rem2 = 0;
	if(cred3 == 0)	rem3 = 0;
	if(cred4 == 0) 	rem4 = 0;
	if(cred6 == 0) 	rem6 = 0;
	clrwdt();
	TMR0IF = 0;							// clear bit
	}

/*
if(TMR1IF)								//!!!!!!!!!
	{
	TMR1H = 0x06;						// delay 170ms		
	TMR1L = 0xF9;
//	if(vOpto1 && vEN1) comp1 = C1OUT;
//	else comp1 = 1;
//	if(vOpto2 && vEN2) comp2 = C2OUT;
//	else comp2 = 1;
	TMR1IF = 0;
	}
*/

if(RCIF)								//!!!!!!!!!
	{
	ubyte = RCREG;
	}


low_restore_registers 		// restore W, STATUS and BSR
}

/*-----------------------------------------*/

void _highPriorityInt(void)
{
// sysB = PORTB;
// sysB |= 0x10;
// sysB &= 0xF7;

INT0IF = 0;
INT1IF = 0;
INT2IF = 0;
// RBIF = 0;

// check = 1;
}

/*-----------------------------------------*/
