void lcd_write(uns8);				// write a byte to LCD in 4 bit mode 
void lcd_setup(char);				// intialize the LCD - call before anything else 
void lcd_goto(uns8 pos);			// Go to the specified position
void lcd_clear(void);				// Clear and home the LCD
void lcd_puts(const char *);		// write a string of characters to the LCD
void lcd_credit(void);				// write credit
void lcd_time(void);				// write remaining time
void lcd_money(void);
void lcd_out(void);					// out of service
void st_clear(void);
void print_total(void);
void lcd_puts_cyr(const char *);	// write a CYR string of characters to the LCD
uns8 lat2cyr(char symb);			// convert LAT 2 CYR

/*----------------------------------------*/

#define LINE1   0x80
#define LINE2   0xC0
//#define LINE3   0x90
//#define LINE4   0xD0

const uns8 CYR[26] = {0x41, 0xA0, 0xE1, 0xE0, 0x45, 0xAA, 0xA1, 0x58, 0xA5, 0xA3, 0x4B, 0xA7, 0x4D, 0x48, 0x4F, 0xA8, 0xB0, 0x50, 0x43, 0x54, 0xA9, 0x42, 0xB1, 0xAD, 0xAB, 0xA4};  
const uns8 cyr[26] = {0x61, 0xB2, 0xE5, 0xE3, 0x65, 0xE4, 0xb4, 0x78, 0xB8, 0xB6, 0xBA, 0xBB, 0xBC, 0xBD, 0x6F, 0xBE, 0xC6, 0x70, 0x63, 0xBF, 0x79, 0xB3, 0xC7, 0xC2, 0xC0, 0xB7};


/*
                   16-char display   
                   ===============   

1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16

80	81	82	83	84	85	86	87	88	89	8A	8B	8C	8D	8E	8F
C0	C1	C2	C3	C4	C5	C6	C7	C8	C9	CA	CB	CC	CD	CE	CF
90	91	92	93	94	95	96	97	98	99	9A	9B	9C	9D	9E	9F
D0	D1	D2	D3	D4	D5	D6	D7	D8	D9	DA	DB	DC	DD	DE	DF

*/

/*----------------------------------------*/

void lcd_write(uns8 c)
{
char tmp;
	
tmp = c & 0xF0;
tmp >>= 2;
PORTA = tmp;
LCD_EN = 1;
nop2();
nop2();
LCD_EN = 0;

tmp = c & 0x0F;
tmp <<= 2;
PORTA = tmp;
LCD_EN = 1;
nop2();
nop2();
LCD_EN = 0;
delay(3);
}

/*--------------------------------------*/

void lcd_setup(char mode)
{
LCD_RS = 0;							// write control bytes
lcd_write(0x28); delay(4);			// 4 bit mode, 2 lines, 5x8 font	
if(mode) lcd_write(0x0F);			// blink on; cursor on
else lcd_write(0x0C); 				// blink off, cursor off
delay(4);							// config display
// lcd_write(0x01); delay(4);			// clear display
lcd_write(0x06); delay(4);			// entry mode
// lcd_write(0x01); delay(20);			// clear display
}

/*--------------------------------------*/

void lcd_goto(uns8 pos)
{
	LCD_RS = 0;
	lcd_write(pos);
}

/*--------------------------------------*/

void lcd_clear(void)
{
	LCD_RS = 0;
	lcd_write(0x01);
	delay(1);
}

/*--------------------------------------*/

void lcd_puts(const char *s)
{
	LCD_RS = 1;						// write characters
	while(*s) lcd_write(*s++);
}


/*--------------------------------------*/


uns8 lat2cyr(char symb)
{
char elem;
uns8 scyr;

if((symb >= 'A') && (symb <= 'Z'))
	{
	elem = symb - 0x41;
	scyr = CYR[elem];
	}	
if(symb == '<') scyr = 0xA6;
if(symb == '?') scyr = 0xAC;
if(symb == '&') scyr = 0xE2;
if(symb == '$') scyr = 0xC4;
if((symb >= 'a') && (symb <= 'z'))
	{
	elem = symb - 0x61;
	scyr = cyr[elem];
	}
if(symb == '>') scyr = 0xB9;
if(symb == '/') scyr = 0xC1;
if(symb == '%') scyr = 0xE6;
if(symb == '#') scyr = 0xC4;
if(symb == ' ') scyr = 0x20;
return scyr;
}

/*--------------------------------------*/

void lcd_puts_cyr(const char *s)
{
	char cyr_tmp;
	LCD_RS = 1;						// write characters
	while(*s)
		{
		cyr_tmp = lat2cyr(*s++);	
		lcd_write(cyr_tmp);
		}
}


/*--------------------------------------*/

void lcd_credit(void)
{
stot = credit % 100;
lev = credit / 100;
lcd_write(lev/10 + 0x30);
lcd_write(lev%10 + 0x30);
lcd_write(DOT);
lcd_write(stot/10 + 0x30);
lcd_write(stot%10 + 0x30);
lcd_puts_cyr(BGN_cyr);
}

/*--------------------------------------*/

void lcd_time(void)
{
lcd_write(hour/10 + 0x30);
lcd_write(hour%10 + 0x30);
lcd_write(':');
lcd_write(min/10 + 0x30);
lcd_write(min%10 + 0x30);
lcd_write(':');
lcd_write(sec/10 + 0x30);
lcd_write(sec%10 + 0x30);
//lcd_write('s');
}

/*--------------------------------------*/

void lcd_money(void)
{
uns24 x;
uns16 a;
uns16 b;
uns8 a1;
uns8 b1;
uns8 a2;
uns8 b2;

x = tot;
a = x / 10000;
b = x % 10000;
a1 = a / 100;
a2 = a % 100;
b1 = b / 100;
b2 = b % 100;
// lcd_write(a1/10 + 0x30);
lcd_write(a1%10 + 0x30);
lcd_write(a2/10 + 0x30);
lcd_write(a2%10 + 0x30);
lcd_write(b1/10 + 0x30);
lcd_write(b1%10 + 0x30);
lcd_write('.');
lcd_write(b2/10 + 0x30);
lcd_write(b2%10 + 0x30);

/*
char xtmp;

temp = tot / 100;
lev  = temp / 10;
xtmp = temp / 100 + 0x30; 	lcd_write(xtmp);	
xtmp = lev % 10 + 0x30; 	lcd_write(xtmp);
xtmp = temp % 10 + 0x30;	lcd_write(xtmp);
lcd_write('.');
stot = tot % 100;
xtmp = stot / 10 + 0x30;	lcd_write(xtmp);
xtmp = stot % 10 + 0x30;	lcd_write(xtmp);		
*/	
}

/*--------------------------------------*/

void lcd_out(void)
{
lcd_clear();
lcd_goto(LINE1);
lcd_puts(Welc);
lcd_goto(LINE2);
lcd_puts(OUT);
INHALL ^= 1;
}

/*--------------------------------------*/

void st_clear(void)
{
lcd_goto(LINE2);
lcd_puts(CLEAR);
ESCbut();
}

/*--------------------------------------*/

void print_total(void)
{
lcd_goto(LINE2);
lcd_puts(Cash);
lcd_money();
lcd_puts(BGN);
ESCbut();	
}

/*--------------------------------------*/
