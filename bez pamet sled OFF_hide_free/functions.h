/*----------- FUNCTIONS ---------------*/

void SYSTEM_setup(void);	// system ini routine
void ini(void);				// Load ini values
void ADC(char);				// ADC config routine
void delay(char);			// delay 1ms
void delaySec(char);		// delay 1s
void uart(void);			// USART ini routine
void conv(uns24);			// convert sec to hh/mm/ss
void start_int(void);		// start interrupts
void ESCbut(void);			// press ESC
char hex2dec(char hex);		// convert hsx to dec
void scan(void);
void REL1_ON(void);		//puska nqkolko triaka na 1 buton void REL1_ON(void);
void REL2_ON(void);
void REL3_ON(void);
void REL4_ON(void);
void REL6_ON(void);
void REL_OFF(void);

/*----------------------------------------*/

void SYSTEM_setup(void)
{
PORTA = 0;				// Initialization port A
PORTB = 0;				// Initialization port B
PORTC = 0;				// Initialization port C
PORTD = 0;				// Initialization port D
PORTE = 0;				// Initialization port E

TRISA = 0b11000011;		// configure I/O port A 1 - Input
TRISB = 0b11110111;		// configure I/O port B	0 - Output
TRISC = 0b00101000;		// configure I/O port C
TRISD = 0b11111110;		// configure I/O port D
TRISE = 0b00000100;		// configure I/O port E


ADCON1 = 0x0F;			// all digital
ADCON0 = 0b00000000;	// turn off ADC module
CMCON  = 0b00000111;	// comparator off

T0CON = 0b10000101;		// enable TMR0; 1:64 prescaler
T1CON = 0b00110001;		// enable TMR1; 1:8  prescaler 
T2CON = 0b00000111;		// enable TMR2; 1:16 prescaler
T3CON = 0b00110001;		// enable TMR3; 1:8  prescaler 

INTCON  = 0;			// disable all unmasked and peripheral interrupts
INTCON2 = 0xC0;			// PORTB pull up disabled; 
INTCON3 = 0;

PIE1 = 0;				// disable peripheral interrupts
PIE2 = 0;			
PIR1 = 0;
PIR2 = 0;
IPR1 = 0;				
IPR2 = 0;	
IPEN = 1;				// enable interrupt priority
GIEL = 1;				// enable low priority interrupts
GIEH = 1;				// enable high priority interrupts
STATUS = 0;
}

/*----------------------------------------*/

void ini(void)
{
//BLCTRL = 1;
SECcount = 0;
credit = 0;
credit_tmp = 0;
if(vINH) INHALL = 1;
else INHALL = 0;
OUT_PC_count = 0;
free_flag = 0;
}

/*----------------------------------------*/

void ADC(char ch)
{
ADRESL = 0;					// resetting ADRES register
ADRESH = 0;
if(ch) ADCON0 = 0b00000101;
else ADCON0 = 0b00000001;
GO = 1;
while(GO);
ADC_value.high8 = ADRESH;
ADC_value.low8  = ADRESL;
}

/*-----------------------------------------*/

void delay(char count)			// 1ms at 12MHz
{
do  
   {
    TMR2 = 0;					// used TMR2
    while(TMR2 < 187);
   } 
while(--count>0);
}

/*-----------------------------------------*/

void delaySec(char second)			// 1s at 12MHz
{
do  
   {
	delay(250);
	delay(250);
	delay(250);
	delay(250);
   } 
while(--second>0);
}

/*-----------------------------------------*/

/*				!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
void uart(void)
{
 SPBRG = 38;			// 19200bps @ 12MHz
 BRGH = 1;				// high speed clock
 SYNC = 0;				// asynchronous serial i/o
 SPEN = 1;				// enable serial port
 TX9 = 0;				// transmit 8 data bits
 RX9 = 0;				// receive 8 data bits
 RCIE = 1;				// enable USART receive interrupt
 CREN = 1;				// enable serial receive
 TXEN = 1;				// enable serial transmit
}

*/
/*-----------------------------------------*/

void conv(uns24 pr)
{
uns24 pr_n;

hour = pr / 3600;
temp = (uns16)hour * 60;
pr_n = (uns24)temp * 60;
temp = pr - pr_n;
min  = temp / 60;
sec = temp % 60;
}

/*-----------------------------------------*/

void start_int(void)
{
// INTEDG0 = 0;
// INTEDG1 = 0;
// INTEDG2 = 0;

TMR0IP = 0;
TMR0IF = 0;
TMR0IE = 1;

TMR1IP = 0;	
TMR1IF = 0;	
TMR1IE = 1;	

// INT0IF = 1;
// INT0IE = 1;

// INT1IP = 1;
// INT1IF = 0;
// INT1IE = 1;

// INT2IP = 1;
// INT2IF = 0;
// INT2IE = 1;

// RBIP = 1;
// RBIF = 0;
// RBIE = 1;
}

/*-----------------------------------------*/

void ESCbut(void)
{
while(ESC); delay(100);
while(!ESC); delay(100);
}

/*--------------------------------------*/

char hex2dec(char hex)
{
char dec;

dec = hex >> 4;
dec *= 10;
hex &= 0x0F;
dec += hex;
return dec;
}

/*-----------------------------------------*/

void scan(void)
{
if(!OPA) OPA_count ++;
else OPA_count = 0;
if(!OPB) OPB_count ++;
else OPB_count = 0;
if(!OPC) OPC_count ++;
else OPC_count = 0;
if(!OPD) OPD_count ++;
else OPD_count = 0;
if(!OPE) OPE_count ++;
else OPE_count = 0;
if(!OPF) OPF_count ++;
else OPF_count = 0;
if(PC == 1)
	{
	if(!IN_PC) PC_count ++;     //PC_in
	else PC_count = 0;			//PC_in
	}

if(OPA_count > OP_limit) { sysB = 0x77; check = 1; }
if(OPB_count > OP_limit) { sysB = 0xB7; check = 1; }
if(OPC_count > OP_limit) { sysB = 0xD7; check = 1; }
if(OPD_count > OP_limit) { sysB = 0xF3; check = 1; }
if(OPE_count > OP_limit) { sysB = 0xF5; check = 1; }
if(OPF_count > OP_limit) { sysB = 0xF6; check = 1; }
if(PC_count > OP_PC_limit) { sysB = 0xA5; check = 1; }    //PC_in
}

/*-----------------------------------------*/


void REL1_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
{
	REL1 = 0;			// kontaktor vodostuika
	REL2 = 0;			// klapan topla H20
	REL3 = 1;			// prepatar
	REL4 = 0; 			// klapan studena H20 
	REL5 = 0; 			// chetka
	REL6 = 0;		    // vaksa
}
void REL2_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
{
	REL1 = 1;			// kontaktor vodostuika
	REL2 = 1;			// klapan topla H20
	REL3 = 0;			// prepatar
	REL4 = 0; 			// klapan studena H20 
	REL5 = 0; 			// chetka
	REL6 = 0;		    // vaksa
}
void REL3_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
{
	REL1 = 1;			// kontaktor vodostuika
	REL2 = 0;			// klapan topla H20
	REL3 = 0;			// prepatar
	REL4 = 1; 			// klapan studena H20 
	REL5 = 0; 			// chetka
	REL6 = 0;		    // vaksa
}
void REL4_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
{
	REL1 = 0;			// kontaktor vodostuika
	REL2 = 0;			// klapan topla H20
	REL3 = 0;			// prepatar
	REL4 = 0; 			// klapan studena H20 
	REL5 = 1; 			// chetka
	REL6 = 0;		    // vaksa
}
void REL6_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
{
	REL1 = 0;			// kontaktor vodostuika
	REL2 = 0;			// klapan topla H20
	REL3 = 0;			// prepatar
	REL4 = 0; 			// klapan studena H20 
	REL5 = 0; 			// chetka
	REL6 = 1;		    // vaksa
}
void REL_OFF(void)
{
	REL1 = 0;
	REL2 = 0;
	REL3 = 0;
	REL4 = 0;
	REL5 = 0; 
	REL6 = 0; 
}

/*-----------------------------------------*/

