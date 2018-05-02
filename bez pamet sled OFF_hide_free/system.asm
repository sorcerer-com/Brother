
; CC8E Version 1.1E, Copyright (c) B Knudsen Data
; C compiler for the PIC18 microcontrollers
; ************  17. Mar 2016   2:04  *************

	processor  PIC18F4520
	radix  DEC

TBLPTR      EQU   0xFF6
TABLAT      EQU   0xFF5
PRODH       EQU   0xFF4
PRODL       EQU   0xFF3
INTCON      EQU   0xFF2
INTCON2     EQU   0xFF1
INTCON3     EQU   0xFF0
POSTINC0    EQU   0xFEE
FSR0H       EQU   0xFEA
FSR0        EQU   0xFE9
BSR         EQU   0xFE0
STATUS      EQU   0xFD8
Carry       EQU   0
Zero_       EQU   2
TMR0H       EQU   0xFD7
TMR0L       EQU   0xFD6
T0CON       EQU   0xFD5
TMR1H       EQU   0xFCF
TMR1L       EQU   0xFCE
T1CON       EQU   0xFCD
TMR2        EQU   0xFCC
T2CON       EQU   0xFCA
SSPBUF      EQU   0xFC9
SSPCON1     EQU   0xFC6
ADRESH      EQU   0xFC4
ADRESL      EQU   0xFC3
ADCON0      EQU   0xFC2
ADCON1      EQU   0xFC1
CMCON       EQU   0xFB4
T3CON       EQU   0xFB1
RCREG       EQU   0xFAE
TXREG       EQU   0xFAD
EEADR       EQU   0xFA9
EEDATA      EQU   0xFA8
EECON2      EQU   0xFA7
IPR2        EQU   0xFA2
PIR2        EQU   0xFA1
PIE2        EQU   0xFA0
IPR1        EQU   0xF9F
PIR1        EQU   0xF9E
PIE1        EQU   0xF9D
TRISE       EQU   0xF96
TRISD       EQU   0xF95
TRISC       EQU   0xF94
TRISB       EQU   0xF93
TRISA       EQU   0xF92
PORTE       EQU   0xF84
PORTD       EQU   0xF83
PORTC       EQU   0xF82
PORTB       EQU   0xF81
PORTA       EQU   0xF80
INT0IF      EQU   1
TMR0IF      EQU   2
TMR0IE      EQU   5
GIEL        EQU   6
GIEH        EQU   7
TMR0IP      EQU   2
INT1IF      EQU   0
INT2IF      EQU   1
IPEN        EQU   7
BF          EQU   0
CKE         EQU   6
SMP         EQU   7
CKP         EQU   4
SSPEN       EQU   5
GO          EQU   1
TRMT        EQU   1
RD          EQU   0
WR          EQU   1
WREN        EQU   2
CFGS        EQU   6
EEPGD       EQU   7
TMR1IP      EQU   0
TMR1IF      EQU   0
RCIF        EQU   5
TMR1IE      EQU   0
EBUT4       EQU   0
EBUT3       EQU   1
OPA         EQU   0
OPB         EQU   1
OPC         EQU   2
INHALL      EQU   3
OPD         EQU   5
OPE         EQU   6
OPF         EQU   7
REL6        EQU   0
REL1        EQU   1
REL2        EQU   2
IN_PC       EQU   3
OUT_PC      EQU   4
EBUT6       EQU   5
REL3        EQU   6
REL4        EQU   7
REL5        EQU   0
EBUT5       EQU   1
ESC         EQU   2
DOWN        EQU   3
UP          EQU   4
ENTER       EQU   5
EBUT1       EQU   6
EBUT2       EQU   7
LCD_EN      EQU   0
LCD_RS      EQU   1
EBUT_COUNTER EQU   2
SECcount    EQU   0x96
ADC_value   EQU   0x98
credit      EQU   0x9A
temp        EQU   0x9C
cred1       EQU   0xA3
cred2       EQU   0xA6
cred3       EQU   0xA9
cred4       EQU   0xAC
cred6       EQU   0xAF
value       EQU   0xB2
tot         EQU   0xB5
total1      EQU   0xB8
total2      EQU   0xBB
total3      EQU   0xBE
total4      EQU   0xC1
total6      EQU   0xC4
overpay     EQU   0xC7
NONpay      EQU   0xCA
wHour       EQU   0xDC
rem1        EQU   0x22
rem2        EQU   0x23
rem3        EQU   0x24
rem4        EQU   0x25
rem6        EQU   0x26
err1        EQU   0x27
err2        EQU   0x28
err3        EQU   0x29
err4        EQU   0x2A
err6        EQU   0x2B
ind         EQU   0x2C
hour        EQU   0x2E
min         EQU   0x2F
sec         EQU   0x30
stot        EQU   0x31
lev         EQU   0x32
check       EQU   0x33
vINH        EQU   0x34
vComm       EQU   0x35
vEN1        EQU   0x36
vEN2        EQU   0x37
vEN3        EQU   0x38
vEN4        EQU   0x39
vEN6        EQU   0x3A
vBL         EQU   0x3B
vAUTOSTART  EQU   0x44
sysB        EQU   0x46
retvalue    EQU   0x47
vOPA        EQU   0x48
vOPB        EQU   0x49
vOPC        EQU   0x4A
vOPD        EQU   0x4B
vOPE        EQU   0x4C
vOPF        EQU   0x4D
ubyte       EQU   0x4E
overTIME    EQU   0x4F
wTIME       EQU   0x50
vCounter    EQU   0x52
pause       EQU   0x54
WORK        EQU   0x55
OPA_count   EQU   0x56
OPB_count   EQU   0x57
OPC_count   EQU   0x58
OPD_count   EQU   0x59
OPE_count   EQU   0x5A
OPF_count   EQU   0x5B
credit_tmp  EQU   0x5C
OUT_PC_count EQU   0x5F
PC_count    EQU   0x60
PC          EQU   0x61
free_flag   EQU   0x62
tmpSTATUS   EQU   0x00
tmpBSR      EQU   0x01
tmpWREG     EQU   0x02
dat         EQU   0x7F
cmd         EQU   0x7F
smb         EQU   0x7F
arg1        EQU   0x1C
arg2        EQU   0x1E
rm          EQU   0x1F
counter     EQU   0x20
tmp         EQU   0x21
arg1_5      EQU   0x1C
arg2_5      EQU   0x1E
rm_5        EQU   0x1F
counter_5   EQU   0x20
tmp_2       EQU   0x21
ch          EQU   0x7F
count       EQU   0x1E
second      EQU   0x7F
pr          EQU   0x12
pr_n        EQU   0x15
C1cnt       EQU   0x18
C2tmp       EQU   0x19
C3rem       EQU   0x1C
C8cnt       EQU   0x18
C9tmp       EQU   0x19
C10rem      EQU   0x1C
C11cnt      EQU   0x18
C12tmp      EQU   0x19
hex         EQU   0x7F
dec         EQU   0x7F
address     EQU   0x18
byte        EQU   0x19
smb_2       EQU   0x14
addr        EQU   0x15
ch_2        EQU   0x09
overload    EQU   0x0A
addr_2      EQU   0x0B
val         EQU   0x0C
x2          EQU   0x0D
a           EQU   0x0F
b           EQU   0x11
y2          EQU   0x13
C21cnt      EQU   0x16
C22tmp      EQU   0x17
C23rem      EQU   0x1A
C24cnt      EQU   0x16
C25tmp      EQU   0x17
C30cnt      EQU   0x16
C31tmp      EQU   0x17
C32rem      EQU   0x1A
ch_3        EQU   0x09
overload_2  EQU   0x0A
addr_3      EQU   0x0B
val_2       EQU   0x0C
x2_2        EQU   0x0D
a_2         EQU   0x0F
b_2         EQU   0x11
cred        EQU   0x13
y2_2        EQU   0x15
C39cnt      EQU   0x18
C40tmp      EQU   0x19
C41rem      EQU   0x1C
C42cnt      EQU   0x18
C43tmp      EQU   0x19
C48cnt      EQU   0x18
C49tmp      EQU   0x19
C50rem      EQU   0x1C
c           EQU   0x1C
tmp_3       EQU   0x1D
mode        EQU   0x11
pos         EQU   0x14
s           EQU   0x14
symb        EQU   0x13
elem        EQU   0x14
scyr        EQU   0x15
s_2         EQU   0x11
cyr_tmp     EQU   0x12
x           EQU   0x11
a_3         EQU   0x14
b_3         EQU   0x16
a1          EQU   0x18
b1          EQU   0x19
a2          EQU   0x1A
b2          EQU   0x1B
C51cnt      EQU   0x1C
C52tmp      EQU   0x1D
C53rem      EQU   0x20
C54cnt      EQU   0x1C
C55tmp      EQU   0x1D
point       EQU   0x09
k           EQU   0x0A
change      EQU   0x0B
esc         EQU   0x0C
digit       EQU   0x0D
dmax        EQU   0x0E
lcd_adr     EQU   0x0F
eadr        EQU   0x10
ENbit       EQU   0x11
ENaddr      EQU   0x12
new_value   EQU   0x13
en          EQU   0x11
pp          EQU   0x03
val_tmp     EQU   0x04
x2_tmp      EQU   0x06
pause_flag  EQU   0x08
ci_2        EQU   0x16
ci_3        EQU   0x16
ci_4        EQU   0x13

	GOTO main

  ; FILE interrupt.h
			;extern void scan(void);
			;extern void REL1_ON(void);
			;extern void REL2_ON(void);
			;extern void REL3_ON(void);
			;extern void REL4_ON(void);
			;extern void REL6_ON(void);
			;extern void REL_OFF(void);
			;
			;void _highPriorityInt(void);
			;
			;/*-----------------------------------------*/
			;
			;#pragma origin 0x8
	ORG 0x0008
			;interrupt highPriorityIntServer(void)
			;{
highPriorityIntServer
			; _highPriorityInt();
	RCALL _highPriorityInt
			; #pragma fastMode
			;}
	RETFIE 1
			;
			;/*-----------------------------------------*/
			;
			;#pragma origin 0x18
	ORG 0x0018
			;interrupt lowPriorityIntServer(void)
			;{
lowPriorityIntServer
			;low_save_registers						// back up W, STATUS and BSR
	MOVFF STATUS,tmpSTATUS
	MOVFF BSR,tmpBSR
	MOVWF tmpWREG,0
			;
			;if(TMR1IF)								
	MOVLB 0
	BTFSS 0xF9E,TMR1IF,0
	BRA   m001
			;	{
			;	TMR1H = 0xF1;						// delay 10ms		
	MOVLW 241
	MOVWF TMR1H,0
			;	TMR1L = 0x5C;
	MOVLW 92
	MOVWF TMR1L,0
			;	if(!check) scan();
	MOVF  check,1,0
	BTFSC 0xFD8,Zero_,0
	RCALL scan
			;	TMR1IF = 0;
	BCF   0xF9E,TMR1IF,0
			;	}
			;
			;if(TMR0IF)
m001	BTFSS 0xFF2,TMR0IF,0
	BRA   m008
			;	{
			;	TMR0H = 0x48;						// overflow after 1000ms
	MOVLW 72
	MOVWF TMR0H,0
			;	TMR0L = 0xE4;
	MOVLW 228
	MOVWF TMR0L,0
			;	SECcount ++;
	INCF  SECcount,1,1
	MOVLW 0
	ADDWFC SECcount+1,1,1
			;	wTIME ++;
	INCF  wTIME,1,0
	ADDWFC wTIME+1,1,0
			;	overTIME ++;
	INCF  overTIME,1,0
			;	if((cred1 > 0) && (vEN1) && pause == 0) 
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m002
	MOVF  vEN1,1,0
	BZ    m002
	TSTFSZ pause,0
	BRA   m002
			;		{		
			;		cred1 --;
	DECF  cred1,1,1
	MOVLW 0
	SUBWFB cred1+1,1,1
	SUBWFB cred1+2,1,1
			;		REL1_ON();
	RCALL REL1_ON
			;		}
			;//	else REL1_OFF();
			;	if((cred2 > 0) && (vEN2) && pause == 0) 
m002	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m003
	MOVF  vEN2,1,0
	BZ    m003
	TSTFSZ pause,0
	BRA   m003
			;		{		
			;		cred2 --;
	DECF  cred2,1,1
	MOVLW 0
	SUBWFB cred2+1,1,1
	SUBWFB cred2+2,1,1
			;		REL2_ON();
	RCALL REL2_ON
			;		}
			;//	else REL2_OFF();
			;	if((cred3 > 0) && (vEN3) && pause == 0) 
m003	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m004
	MOVF  vEN3,1,0
	BZ    m004
	TSTFSZ pause,0
	BRA   m004
			;		{		
			;		cred3 --;
	DECF  cred3,1,1
	MOVLW 0
	SUBWFB cred3+1,1,1
	SUBWFB cred3+2,1,1
			;		REL3_ON();
	RCALL REL3_ON
			;		}
			;//	else REL3_OFF();
			;	if((cred4 > 0) && (vEN4) && pause == 0) 
m004	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m005
	MOVF  vEN4,1,0
	BZ    m005
	TSTFSZ pause,0
	BRA   m005
			;		{		
			;		cred4 --;
	DECF  cred4,1,1
	MOVLW 0
	SUBWFB cred4+1,1,1
	SUBWFB cred4+2,1,1
			;		REL4_ON();
	RCALL REL4_ON
			;		}
			;//	else REL4_OFF();
			;	if((cred6 > 0) && (vEN6) && pause == 0) 
m005	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m006
	MOVF  vEN6,1,0
	BZ    m006
	TSTFSZ pause,0
	BRA   m006
			;		{		
			;		cred6 --;
	DECF  cred6,1,1
	MOVLW 0
	SUBWFB cred6+1,1,1
	SUBWFB cred6+2,1,1
			;		REL6_ON();
	RCALL REL6_ON
			;		}
			;//	else REL4_OFF();
			;	
			;	if (pause == 1)	REL_OFF();
m006	DCFSNZ pause,W,0
	RCALL REL_OFF
			;
			;	if((cred1 == 0) && (cred2 == 0) && (cred3 == 0) && (cred4 == 0) && (cred6 == 0))	REL_OFF();
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BNZ   m007
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BNZ   m007
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BNZ   m007
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BNZ   m007
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BTFSC 0xFD8,Zero_,0
	RCALL REL_OFF
			;	if(cred1 == 0)	rem1 = 0;
m007	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BTFSC 0xFD8,Zero_,0
	CLRF  rem1,0
			;	if(cred2 == 0)	rem2 = 0;
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BTFSC 0xFD8,Zero_,0
	CLRF  rem2,0
			;	if(cred3 == 0)	rem3 = 0;
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BTFSC 0xFD8,Zero_,0
	CLRF  rem3,0
			;	if(cred4 == 0) 	rem4 = 0;
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BTFSC 0xFD8,Zero_,0
	CLRF  rem4,0
			;	if(cred6 == 0) 	rem6 = 0;
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BTFSC 0xFD8,Zero_,0
	CLRF  rem6,0
			;	clrwdt();
	CLRWDT
			;	TMR0IF = 0;							// clear bit
	BCF   0xFF2,TMR0IF,0
			;	}
			;
			;/*
			;if(TMR1IF)								//!!!!!!!!!
			;	{
			;	TMR1H = 0x06;						// delay 170ms		
			;	TMR1L = 0xF9;
			;//	if(vOpto1 && vEN1) comp1 = C1OUT;
			;//	else comp1 = 1;
			;//	if(vOpto2 && vEN2) comp2 = C2OUT;
			;//	else comp2 = 1;
			;	TMR1IF = 0;
			;	}
			;*/
			;
			;if(RCIF)								//!!!!!!!!!
m008	BTFSC 0xF9E,RCIF,0
			;	{
			;	ubyte = RCREG;
	MOVFF RCREG,ubyte
			;	}
			;
			;
			;low_restore_registers 		// restore W, STATUS and BSR
	MOVF  tmpWREG,W,0
	MOVFF tmpBSR,BSR
	MOVFF tmpSTATUS,STATUS
			;}
	RETFIE
			;
			;/*-----------------------------------------*/
			;
			;void _highPriorityInt(void)
			;{
_highPriorityInt
			;// sysB = PORTB;
			;// sysB |= 0x10;
			;// sysB &= 0xF7;
			;
			;INT0IF = 0;
	BCF   0xFF2,INT0IF,0
			;INT1IF = 0;
	BCF   0xFF0,INT1IF,0
			;INT2IF = 0;
	BCF   0xFF0,INT2IF,0
			;// RBIF = 0;
			;
			;// check = 1;
			;}
	RETURN

  ; FILE spi.h
			;uns8 SPI_Send(uns8);							// SPI send routine
			;void SPI_setup(void);							// slow speed SPI Init low speed routine
			;
			;/*----------------------------------------*/
			;
			;uns8 SPI_Send(uns8 dat)
			;{
SPI_Send
	MOVWF dat,0
			;	SSPBUF = dat;									// send character
	MOVFF dat,SSPBUF
			;	while(!BF);										// wait until sent
m009	BTFSS 0xFC7,BF,0
	BRA   m009
			;	return SSPBUF;									// and return the received character
	MOVF  SSPBUF,W,0
	RETURN
			;}
			;
			;/*----------------------------------------*/
			;
			;void SPI_setup(void)
			;{
SPI_setup
			;	SSPCON1 = 0x02;									// clear register, Master, Fosc/64	(250kbps @ 16MHz)
	MOVLW 2
	MOVWF SSPCON1,0
			;	SMP = 0;										// input is valid in the middle of clock
	BCF   0xFC7,SMP,0
			;	CKE = 0;										// rising edge is data capture
	BCF   0xFC7,CKE,0
			;	CKP = 1;										// high value is passive state
	BSF   0xFC6,CKP,0
			;	SSPEN = 1;
	BSF   0xFC6,SSPEN,0
			;}
	RETURN

  ; FILE pc.h
			;void PCcmd(const char*);					// send string to PC
			;void terminate(void);						// Send CR/LF
			;void PC_TX(uns8);							// send char to PC
			;
			;/*----------------------------------------*/
			;
			;void PCcmd(const char *cmd)
			;{
PCcmd
			;while(*cmd) PC_TX(*cmd++);
m010	MOVF  cmd,W,0
	CALL  _const1
	XORLW 0
	BZ    m011
	MOVF  cmd,W,0
	CALL  _const1
	RCALL PC_TX
	INCF  cmd,1,0
	BRA   m010
			;}
m011	RETURN
			;
			;/*-----------------------------------------*/
			;void terminate(void)						// Send CR/LF
			;{
terminate
			;PC_TX(CR);
	MOVLW 13
	RCALL PC_TX
			;PC_TX(LF);
	MOVLW 10
	BRA   PC_TX
			;}
			;
			;/*-----------------------------------------*/
			;
			;void PC_TX(uns8 smb)
			;{
PC_TX
	MOVWF smb,0
			;TXREG = smb;								// send symbol
	MOVFF smb,TXREG
			;while(!TRMT);
m012	BTFSS 0xFAC,TRMT,0
	BRA   m012
			;}
	RETURN

  ; FILE math16.h
			;// SIZE
			;
			;#pragma library 1
			;/*
			;uns16 operator* _mult8x8( uns8 arg1, uns8 arg2);
			;uns16 operator* _multU16x8( uns16 arg1, uns8 arg2);
			;uns16 operator* _mult16x16( uns16 arg1, uns16 arg2);
			;uns16 operator/ _divU16_8( uns16 arg1, uns8 arg2);
			;uns16 operator/ _divU16_16( uns16 arg1, uns16 arg2);
			;int16 operator/ _divS16_8( int16 arg1, int8 arg2);
			;int16 operator/ _divS16_16( int16 arg1, int16 arg2);
			;uns8 operator% _remU16_8( uns16 arg1, uns8 arg2);
			;uns16 operator% _remU16_16( uns16 arg1, uns16 arg2);
			;int8 operator% _remS16_8( int16 arg1, int8 arg2);
			;int16 operator% _remS16_16( int16 arg1, int16 arg2);
			;*/
			;
			;#if __CoreSet__ < 1600
			; #define genAdd(r,a) W=a; btsc(Carry); W=incsz(a); r+=W;
			; #define genSub(r,a) W=a; btss(Carry); W=incsz(a); r-=W;
			; #define genAddW(r,a) W=a; btsc(Carry); W=incsz(a); W=r+W;
			; #define genSubW(r,a) W=a; btss(Carry); W=incsz(a); W=r-W;
			;#else
			; #define genAdd(r,a) W=a; r=addWFC(r);
			; #define genSub(r,a) W=a; r=subWFB(r);
			; #define genAddW(r,a) W=a; W=addWFC(r);
			; #define genSubW(r,a) W=a; W=subWFB(r);
			;#endif
			;
			;#if __CoreSet__ == 1700 || __CoreSet__ == 1800
			; #define hw_mult8x8(a,b)  { W = a; multiply(b); }
			; #define loRES PRODL
			; #define hiRES PRODH
			;#endif
			;
			;#if __CoreSet__ == 2000
			; #define hw_mult8x8(a,b)  { W = a; multiply(b); }
			; #define loRES W
			; #define hiRES MULH
			;#endif
			;
			;
			;
			;#ifdef hw_mult8x8
			;
			;inline int16 operator*( int8 arg1, int8 arg2);
			;inline uns16 operator*( uns8 arg1, uns8 arg2);
			;inline int16 operator*( int8 arg1, int16 arg2);
			;inline uns16 operator*( uns8 arg1, uns16 arg2);
			;inline int16 operator*( int16 arg1, int8 arg2);
			;inline uns16 operator*( uns16 arg1, uns8 arg2);
			;inline int16 operator*( int16 arg1, int16 arg2);
			;inline uns16 operator*( uns16 arg1, uns16 arg2);
			;
			;#undef hw_mult8x8
			;#undef loRES
			;#undef hiRES
			;
			;#else
			;
			;int8 operator*( int8 arg1, int8 arg2)  @
			;
			;uns16 operator* _mult8x8( uns8 arg1, uns8 arg2)
			;{
			;    uns16 rval;
			;    char counter = sizeof(arg2)*8;
			;    rval.high8 = 0;
			;    W = arg1;
			;    do  {
			;        arg2 = rr( arg2);
			;        if (Carry)
			;            rval.high8 += W;
			;        rval = rr( rval);
			;        counter = decsz(counter);
			;    } while (1);
			;    return rval;
			;}
			;
			;
			;uns16 operator*( uns8 arg1, uns16 arg2) exchangeArgs @
			;
			;uns16 operator* _multU16x8( uns16 arg1, uns8 arg2)
			;{
			;    uns16 rval;
			;    uns8 rvalH = 0;
			;    char counter = sizeof(arg1)*8;
			;    W = arg2;
			;    do  {
			;        arg1 = rr( arg1);
			;        if (Carry)
			;            rvalH += W;
			;        rvalH = rr(rvalH);
			;        rval = rr(rval);
			;        counter = decsz(counter);
			;    } while (1);
			;    return rval;
			;}
			;
			;
			;int16 operator*( int16 arg1, int16 arg2) @
			;
			;uns16 operator* _mult16x16( uns16 arg1, uns16 arg2)
			;{
			;    uns16 rval;
			;    char counter = sizeof(arg1)*8;
			;    do  {
			;        Carry = 0;
			;        rval = rl( rval);
			;        arg1 = rl( arg1);
			;        if (Carry)
			;            rval += arg2;
			;        counter = decsz(counter);
			;    } while (1);
			;    return rval;
			;}
			;
			;#endif
			;
			;
			;uns16 operator/ _divU16_8( uns16 arg1, uns8 arg2)
			;{
_divU16_8
	MOVWF arg2,0
			;    uns8 rm = 0;
	CLRF  rm,0
			;    char counter = sizeof(arg1)*8+1;
	MOVLW 17
	MOVWF counter,0
			;    goto ENTRY;
	BRA   m014
			;    do  {
			;        rm = rl( rm);
m013	RLCF  rm,1,0
			;        uns8 tmp = rl( tmp);
	RLCF  tmp,1,0
			;        W = rm - arg2;
	MOVF  arg2,W,0
	SUBWF rm,W,0
			;        if (tmp&1)
	BTFSC tmp,0,0
			;            Carry = 1;
	BSF   0xFD8,Carry,0
			;        if (Carry)
	BTFSC 0xFD8,Carry,0
			;            rm = W;
	MOVWF rm,0
			;       ENTRY:
			;        arg1 = rl( arg1);
m014	RLCF  arg1,1,0
	RLCF  arg1+1,1,0
			;        counter = decsz(counter);
	DECFSZ counter,1,0
			;    } while (1);
	BRA   m013
			;    return arg1;
	MOVF  arg1,W,0
	RETURN
			;}
			;
			;
			;uns16 operator/ _divU16_16( uns16 arg1, uns16 arg2)
			;{
_divU16_16
			;    uns16 rm = 0;
			;    char counter = sizeof(arg1)*8+1;
			;    goto ENTRY;
			;    do  {
			;        rm = rl( rm);
			;        W = rm.low8 - arg2.low8;
			;        genSubW( rm.high8, arg2.high8);
			;        if (!Carry)
			;            goto ENTRY;
			;        rm.high8 = W;
			;        rm.low8 -= arg2.low8;
			;        Carry = 1;
			;       ENTRY:
			;        arg1 = rl( arg1);
			;        counter = decsz(counter);
			;    } while (1);
			;    return arg1;
			;}
			;
			;
			;int8  operator/ (int8 arg1, int8 arg2) @
			;
			;int16 operator/ _divS16_8( int16 arg1, int8 arg2)
			;{
_divS16_8
			;    uns8 rm = 0;
			;    char counter = 16+1;
			;    char sign = arg1.high8 ^ arg2.high8;
			;    if (arg1 < 0)  {
			;       INVERT:
			;        arg1 = -arg1;
			;        if (!counter)
			;            return arg1;
			;    }
			;    if (arg2 < 0)
			;        arg2 = -arg2;
			;    goto ENTRY;
			;    do  {
			;        rm = rl( rm);
			;        W = rm - arg2;
			;        if (Carry)
			;            rm = W;
			;       ENTRY:
			;        arg1 = rl( arg1);
			;        counter = decsz(counter);
			;    } while (1);
			;    if (sign & 0x80)
			;        goto INVERT;
			;    return arg1;
			;}
			;
			;
			;int16 operator/ _divS16_16( int16 arg1, int16 arg2)
			;{
_divS16_16
			;    uns16 rm = 0;
			;    char counter = sizeof(arg1)*8+1;
			;    char sign = arg1.high8 ^ arg2.high8;
			;    if (arg1 < 0)  {
			;       INVERT:
			;        arg1 = -arg1;
			;        if (!counter)
			;            return arg1;
			;    }
			;    if (arg2 < 0)
			;        arg2 = -arg2;
			;    goto ENTRY;
			;    do  {
			;        rm = rl( rm);
			;        W = rm.low8 - arg2.low8;
			;        genSubW( rm.high8, arg2.high8);
			;        if (!Carry)
			;            goto ENTRY;
			;        rm.high8 = W;
			;        rm.low8 -= arg2.low8;
			;        Carry = 1;
			;       ENTRY:
			;        arg1 = rl( arg1);
			;        counter = decsz(counter);
			;    } while (1);
			;    if (sign & 0x80)
			;        goto INVERT;
			;    return arg1;
			;}
			;
			;
			;uns8 operator% _remU16_8( uns16 arg1, uns8 arg2)
			;{
_remU16_8
	MOVWF arg2_5,0
			;    uns8 rm = 0;
	CLRF  rm_5,0
			;    char counter = sizeof(arg1)*8;
	MOVLW 16
	MOVWF counter_5,0
			;    do  {
			;        arg1 = rl( arg1);
m015	RLCF  arg1_5,1,0
	RLCF  arg1_5+1,1,0
			;        rm = rl( rm);
	RLCF  rm_5,1,0
			;        uns8 tmp = rl( tmp);
	RLCF  tmp_2,1,0
			;        W = rm - arg2;
	MOVF  arg2_5,W,0
	SUBWF rm_5,W,0
			;        if (tmp&1)
	BTFSC tmp_2,0,0
			;            Carry = 1;
	BSF   0xFD8,Carry,0
			;        if (Carry)
	BTFSC 0xFD8,Carry,0
			;            rm = W;
	MOVWF rm_5,0
			;        counter = decsz(counter);
	DECFSZ counter_5,1,0
			;    } while (1);
	BRA   m015
			;    return rm;
	MOVF  rm_5,W,0
	RETURN
			;}
			;
			;
			;uns16 operator% _remU16_16( uns16 arg1, uns16 arg2)
			;{
_remU16_16
			;    uns16 rm = 0;
			;    char counter = sizeof(arg1)*8;
			;    do  {
			;        arg1 = rl( arg1);
			;        rm = rl( rm);
			;        W = rm.low8 - arg2.low8;
			;        genSubW( rm.high8, arg2.high8);
			;        if (!Carry)
			;            goto NOSUB;
			;        rm.high8 = W;
			;        rm.low8 -= arg2.low8;
			;      NOSUB:
			;        counter = decsz(counter);
			;    } while (1);
			;    return rm;
			;}
			;
			;
			;int8 operator% (int8 arg1, int8 arg2) @
			;
			;int8 operator% _remS16_8( int16 arg1, int8 arg2)
			;{
_remS16_8
			;    int8 rm = 0;
			;    char counter = 16;
			;    char sign = arg1.high8;
			;    if (arg1 < 0)
			;        arg1 = -arg1;
			;    if (arg2 < 0)
			;        arg2 = -arg2;
			;    do  {
			;        arg1 = rl( arg1);
			;        rm = rl( rm);
			;        W = rm - arg2;
			;        if (Carry)
			;            rm = W;
			;        counter = decsz(counter);
			;    } while (1);
			;    if (sign & 0x80)
			;        rm = -rm;
			;    return rm;
			;}
			;
			;
			;int16 operator% _remS16_16( int16 arg1, int16 arg2)
			;{
_remS16_16
			;    int16 rm = 0;
			;    char counter = sizeof(arg1)*8;
			;    char sign = arg1.high8;
			;    if (arg1 < 0)
			;        arg1 = -arg1;
			;    if (arg2 < 0)
			;        arg2 = -arg2;
			;    do  {
			;        arg1 = rl( arg1);
			;        rm = rl( rm);
			;        W = rm.low8 - arg2.low8;
			;        genSubW( rm.high8, arg2.high8);
			;        if (!Carry)
			;            goto NOSUB;
			;        rm.high8 = W;
			;        rm.low8 -= arg2.low8;
			;      NOSUB:
			;        counter = decsz(counter);
			;    } while (1);
			;    if (sign & 0x80)
			;        rm = -rm;
			;    return rm;

  ; FILE functions.h
			;/*----------- FUNCTIONS ---------------*/
			;
			;void SYSTEM_setup(void);	// system ini routine
			;void ini(void);				// Load ini values
			;void ADC(char);				// ADC config routine
			;void delay(char);			// delay 1ms
			;void delaySec(char);		// delay 1s
			;void uart(void);			// USART ini routine
			;void conv(uns24);			// convert sec to hh/mm/ss
			;void start_int(void);		// start interrupts
			;void ESCbut(void);			// press ESC
			;char hex2dec(char hex);		// convert hsx to dec
			;void scan(void);
			;void REL1_ON(void);		//puska nqkolko triaka na 1 buton void REL1_ON(void);
			;void REL2_ON(void);
			;void REL3_ON(void);
			;void REL4_ON(void);
			;void REL6_ON(void);
			;void REL_OFF(void);
			;
			;/*----------------------------------------*/
			;
			;void SYSTEM_setup(void)
			;{
SYSTEM_setup
			;PORTA = 0;				// Initialization port A
	CLRF  PORTA,0
			;PORTB = 0;				// Initialization port B
	CLRF  PORTB,0
			;PORTC = 0;				// Initialization port C
	CLRF  PORTC,0
			;PORTD = 0;				// Initialization port D
	CLRF  PORTD,0
			;PORTE = 0;				// Initialization port E
	CLRF  PORTE,0
			;
			;TRISA = 0b11000011;		// configure I/O port A 1 - Input
	MOVLW 195
	MOVWF TRISA,0
			;TRISB = 0b11110111;		// configure I/O port B	0 - Output
	MOVLW 247
	MOVWF TRISB,0
			;TRISC = 0b00101000;		// configure I/O port C
	MOVLW 40
	MOVWF TRISC,0
			;TRISD = 0b11111110;		// configure I/O port D
	MOVLW 254
	MOVWF TRISD,0
			;TRISE = 0b00000100;		// configure I/O port E
	MOVLW 4
	MOVWF TRISE,0
			;
			;
			;ADCON1 = 0x0F;			// all digital
	MOVLW 15
	MOVWF ADCON1,0
			;ADCON0 = 0b00000000;	// turn off ADC module
	CLRF  ADCON0,0
			;CMCON  = 0b00000111;	// comparator off
	MOVLW 7
	MOVWF CMCON,0
			;
			;T0CON = 0b10000101;		// enable TMR0; 1:64 prescaler
	MOVLW 133
	MOVWF T0CON,0
			;T1CON = 0b00110001;		// enable TMR1; 1:8  prescaler 
	MOVLW 49
	MOVWF T1CON,0
			;T2CON = 0b00000111;		// enable TMR2; 1:16 prescaler
	MOVLW 7
	MOVWF T2CON,0
			;T3CON = 0b00110001;		// enable TMR3; 1:8  prescaler 
	MOVLW 49
	MOVWF T3CON,0
			;
			;INTCON  = 0;			// disable all unmasked and peripheral interrupts
	CLRF  INTCON,0
			;INTCON2 = 0xC0;			// PORTB pull up disabled; 
	MOVLW 192
	MOVWF INTCON2,0
			;INTCON3 = 0;
	CLRF  INTCON3,0
			;
			;PIE1 = 0;				// disable peripheral interrupts
	CLRF  PIE1,0
			;PIE2 = 0;			
	CLRF  PIE2,0
			;PIR1 = 0;
	CLRF  PIR1,0
			;PIR2 = 0;
	CLRF  PIR2,0
			;IPR1 = 0;				
	CLRF  IPR1,0
			;IPR2 = 0;	
	CLRF  IPR2,0
			;IPEN = 1;				// enable interrupt priority
	BSF   0xFD0,IPEN,0
			;GIEL = 1;				// enable low priority interrupts
	BSF   0xFF2,GIEL,0
			;GIEH = 1;				// enable high priority interrupts
	BSF   0xFF2,GIEH,0
			;STATUS = 0;
	CLRF  STATUS,0
			;}
	RETURN
			;
			;/*----------------------------------------*/
			;
			;void ini(void)
			;{
ini
			;//BLCTRL = 1;
			;SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;credit_tmp = 0;
	CLRF  credit_tmp,0
	CLRF  credit_tmp+1,0
	CLRF  credit_tmp+2,0
			;if(vINH) INHALL = 1;
	MOVF  vINH,1,0
	BZ    m016
	BSF   0xF81,INHALL,0
			;else INHALL = 0;
	BRA   m017
m016	BCF   0xF81,INHALL,0
			;OUT_PC_count = 0;
m017	CLRF  OUT_PC_count,0
			;free_flag = 0;
	CLRF  free_flag,0
			;}
	RETURN
			;
			;/*----------------------------------------*/
			;
			;void ADC(char ch)
			;{
ADC
	MOVWF ch,0
			;ADRESL = 0;					// resetting ADRES register
	CLRF  ADRESL,0
			;ADRESH = 0;
	CLRF  ADRESH,0
			;if(ch) ADCON0 = 0b00000101;
	MOVF  ch,1,0
	BZ    m018
	MOVLW 5
	MOVWF ADCON0,0
			;else ADCON0 = 0b00000001;
	BRA   m019
m018	MOVLW 1
	MOVWF ADCON0,0
			;GO = 1;
m019	BSF   0xFC2,GO,0
			;while(GO);
m020	BTFSC 0xFC2,GO,0
	BRA   m020
			;ADC_value.high8 = ADRESH;
	MOVFF ADRESH,ADC_value+1
			;ADC_value.low8  = ADRESL;
	MOVFF ADRESL,ADC_value
			;}
	RETURN
			;
			;/*-----------------------------------------*/
			;
			;void delay(char count)			// 1ms at 12MHz
			;{
delay
	MOVWF count,0
			;do  
			;   {
			;    TMR2 = 0;					// used TMR2
m021	CLRF  TMR2,0
			;    while(TMR2 < 187);
m022	MOVLW 186
	CPFSGT TMR2,0
	BRA   m022
			;   } 
			;while(--count>0);
	DECFSZ count,1,0
	BRA   m021
			;}
	RETURN
			;
			;/*-----------------------------------------*/
			;
			;void delaySec(char second)			// 1s at 12MHz
			;{
delaySec
	MOVWF second,0
			;do  
			;   {
			;	delay(250);
m023	MOVLW 250
	RCALL delay
			;	delay(250);
	MOVLW 250
	RCALL delay
			;	delay(250);
	MOVLW 250
	RCALL delay
			;	delay(250);
	MOVLW 250
	RCALL delay
			;   } 
			;while(--second>0);
	DECFSZ second,1,0
	BRA   m023
			;}
	RETURN
			;
			;/*-----------------------------------------*/
			;
			;/*				!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			;void uart(void)
			;{
			; SPBRG = 38;			// 19200bps @ 12MHz
			; BRGH = 1;				// high speed clock
			; SYNC = 0;				// asynchronous serial i/o
			; SPEN = 1;				// enable serial port
			; TX9 = 0;				// transmit 8 data bits
			; RX9 = 0;				// receive 8 data bits
			; RCIE = 1;				// enable USART receive interrupt
			; CREN = 1;				// enable serial receive
			; TXEN = 1;				// enable serial transmit
			;}
			;
			;*/
			;/*-----------------------------------------*/
			;
			;void conv(uns24 pr)
			;{
conv
			;uns24 pr_n;
			;
			;hour = pr / 3600;
	MOVF  pr,W,0
	MOVWF C2tmp,0
	MOVF  pr+1,W,0
	MOVWF C2tmp+1,0
	MOVF  pr+2,W,0
	MOVWF C2tmp+2,0
	CLRF  C3rem,0
	CLRF  C3rem+1,0
	MOVLW 24
	MOVWF C1cnt,0
m024	RLCF  C2tmp,1,0
	RLCF  C2tmp+1,1,0
	RLCF  C2tmp+2,1,0
	RLCF  C3rem,1,0
	RLCF  C3rem+1,1,0
	BC    m025
	MOVLW 16
	SUBWF C3rem,W,0
	MOVLW 14
	SUBWFB C3rem+1,W,0
	BNC   m026
m025	MOVLW 16
	SUBWF C3rem,1,0
	MOVLW 14
	SUBWFB C3rem+1,1,0
	BSF   0xFD8,Carry,0
m026	RLCF  hour,1,0
	DECFSZ C1cnt,1,0
	BRA   m024
			;temp = (uns16)hour * 60;
	CLRF  temp+2,1
	MOVF  hour,W,0
	MULLW 60
	MOVFF PRODL,temp
	MOVFF PRODH,temp+1
			;pr_n = (uns24)temp * 60;
	MOVLW 60
	MULWF temp+2,1
	MOVFF PRODL,pr_n+2
	MULWF temp,1
	MOVFF PRODL,pr_n
	MOVFF PRODH,pr_n+1
	MULWF temp+1,1
	MOVF  PRODL,W,0
	ADDWF pr_n+1,1,0
	MOVF  PRODH,W,0
	ADDWFC pr_n+2,1,0
			;temp = pr - pr_n;
	MOVF  pr_n,W,0
	SUBWF pr,W,0
	MOVWF temp,1
	MOVF  pr_n+1,W,0
	SUBWFB pr+1,W,0
	MOVWF temp+1,1
	MOVF  pr_n+2,W,0
	SUBWFB pr+2,W,0
	MOVWF temp+2,1
			;min  = temp / 60;
	MOVF  temp,W,1
	MOVWF C9tmp,0
	MOVF  temp+1,W,1
	MOVWF C9tmp+1,0
	MOVF  temp+2,W,1
	MOVWF C9tmp+2,0
	CLRF  C10rem,0
	MOVLW 24
	MOVWF C8cnt,0
m027	RLCF  C9tmp,1,0
	RLCF  C9tmp+1,1,0
	RLCF  C9tmp+2,1,0
	RLCF  C10rem,1,0
	BC    m028
	MOVLW 60
	SUBWF C10rem,W,0
	BNC   m029
m028	MOVLW 60
	SUBWF C10rem,1,0
	BSF   0xFD8,Carry,0
m029	RLCF  min,1,0
	DECFSZ C8cnt,1,0
	BRA   m027
			;sec = temp % 60;
	MOVF  temp,W,1
	MOVWF C12tmp,0
	MOVF  temp+1,W,1
	MOVWF C12tmp+1,0
	MOVF  temp+2,W,1
	MOVWF C12tmp+2,0
	CLRF  sec,0
	MOVLW 24
	MOVWF C11cnt,0
m030	RLCF  C12tmp,1,0
	RLCF  C12tmp+1,1,0
	RLCF  C12tmp+2,1,0
	RLCF  sec,1,0
	BC    m031
	MOVLW 60
	SUBWF sec,W,0
	BNC   m032
m031	MOVLW 60
	SUBWF sec,1,0
m032	DECFSZ C11cnt,1,0
	BRA   m030
			;}
	RETURN
			;
			;/*-----------------------------------------*/
			;
			;void start_int(void)
			;{
start_int
			;// INTEDG0 = 0;
			;// INTEDG1 = 0;
			;// INTEDG2 = 0;
			;
			;TMR0IP = 0;
	BCF   0xFF1,TMR0IP,0
			;TMR0IF = 0;
	BCF   0xFF2,TMR0IF,0
			;TMR0IE = 1;
	BSF   0xFF2,TMR0IE,0
			;
			;TMR1IP = 0;	
	BCF   0xF9F,TMR1IP,0
			;TMR1IF = 0;	
	BCF   0xF9E,TMR1IF,0
			;TMR1IE = 1;	
	BSF   0xF9D,TMR1IE,0
			;
			;// INT0IF = 1;
			;// INT0IE = 1;
			;
			;// INT1IP = 1;
			;// INT1IF = 0;
			;// INT1IE = 1;
			;
			;// INT2IP = 1;
			;// INT2IF = 0;
			;// INT2IE = 1;
			;
			;// RBIP = 1;
			;// RBIF = 0;
			;// RBIE = 1;
			;}
	RETURN
			;
			;/*-----------------------------------------*/
			;
			;void ESCbut(void)
			;{
ESCbut
			;while(ESC); delay(100);
m033	BTFSC 0xF83,ESC,0
	BRA   m033
	MOVLW 100
	RCALL delay
			;while(!ESC); delay(100);
m034	BTFSS 0xF83,ESC,0
	BRA   m034
	MOVLW 100
	BRA   delay
			;}
			;
			;/*--------------------------------------*/
			;
			;char hex2dec(char hex)
			;{
hex2dec
	MOVWF hex,0
			;char dec;
			;
			;dec = hex >> 4;
	SWAPF hex,W,0
	ANDLW 15
	MOVWF dec,0
			;dec *= 10;
	MOVLW 10
	MULWF dec,0
	MOVFF PRODL,dec
			;hex &= 0x0F;
	MOVLW 15
	ANDWF hex,1,0
			;dec += hex;
	MOVF  hex,W,0
	ADDWF dec,1,0
			;return dec;
	MOVF  dec,W,0
	RETURN
			;}
			;
			;/*-----------------------------------------*/
			;
			;void scan(void)
			;{
scan
			;if(!OPA) OPA_count ++;
	BTFSC 0xF81,OPA,0
	BRA   m035
	INCF  OPA_count,1,0
			;else OPA_count = 0;
	BRA   m036
m035	CLRF  OPA_count,0
			;if(!OPB) OPB_count ++;
m036	BTFSC 0xF81,OPB,0
	BRA   m037
	INCF  OPB_count,1,0
			;else OPB_count = 0;
	BRA   m038
m037	CLRF  OPB_count,0
			;if(!OPC) OPC_count ++;
m038	BTFSC 0xF81,OPC,0
	BRA   m039
	INCF  OPC_count,1,0
			;else OPC_count = 0;
	BRA   m040
m039	CLRF  OPC_count,0
			;if(!OPD) OPD_count ++;
m040	BTFSC 0xF81,OPD,0
	BRA   m041
	INCF  OPD_count,1,0
			;else OPD_count = 0;
	BRA   m042
m041	CLRF  OPD_count,0
			;if(!OPE) OPE_count ++;
m042	BTFSC 0xF81,OPE,0
	BRA   m043
	INCF  OPE_count,1,0
			;else OPE_count = 0;
	BRA   m044
m043	CLRF  OPE_count,0
			;if(!OPF) OPF_count ++;
m044	BTFSC 0xF81,OPF,0
	BRA   m045
	INCF  OPF_count,1,0
			;else OPF_count = 0;
	BRA   m046
m045	CLRF  OPF_count,0
			;if(PC == 1)
m046	DECFSZ PC,W,0
	BRA   m048
			;	{
			;	if(!IN_PC) PC_count ++;     //PC_in
	BTFSC 0xF82,IN_PC,0
	BRA   m047
	INCF  PC_count,1,0
			;	else PC_count = 0;			//PC_in
	BRA   m048
m047	CLRF  PC_count,0
			;	}
			;
			;if(OPA_count > OP_limit) { sysB = 0x77; check = 1; }
m048	MOVLW 3
	CPFSGT OPA_count,0
	BRA   m049
	MOVLW 119
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;if(OPB_count > OP_limit) { sysB = 0xB7; check = 1; }
m049	MOVLW 3
	CPFSGT OPB_count,0
	BRA   m050
	MOVLW 183
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;if(OPC_count > OP_limit) { sysB = 0xD7; check = 1; }
m050	MOVLW 3
	CPFSGT OPC_count,0
	BRA   m051
	MOVLW 215
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;if(OPD_count > OP_limit) { sysB = 0xF3; check = 1; }
m051	MOVLW 3
	CPFSGT OPD_count,0
	BRA   m052
	MOVLW 243
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;if(OPE_count > OP_limit) { sysB = 0xF5; check = 1; }
m052	MOVLW 3
	CPFSGT OPE_count,0
	BRA   m053
	MOVLW 245
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;if(OPF_count > OP_limit) { sysB = 0xF6; check = 1; }
m053	MOVLW 3
	CPFSGT OPF_count,0
	BRA   m054
	MOVLW 246
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;if(PC_count > OP_PC_limit) { sysB = 0xA5; check = 1; }    //PC_in
m054	MOVLW 60
	CPFSGT PC_count,0
	BRA   m055
	MOVLW 165
	MOVWF sysB,0
	MOVLW 1
	MOVWF check,0
			;}
m055	RETURN
			;
			;/*-----------------------------------------*/
			;
			;
			;void REL1_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
			;{
REL1_ON
			;	REL1 = 0;			// kontaktor vodostuika
	BCF   0xF82,REL1,0
			;	REL2 = 0;			// klapan topla H20
	BCF   0xF82,REL2,0
			;	REL3 = 1;			// prepatar
	BSF   0xF82,REL3,0
			;	REL4 = 0; 			// klapan studena H20 
	BCF   0xF82,REL4,0
			;	REL5 = 0; 			// chetka
	BCF   0xF83,REL5,0
			;	REL6 = 0;		    // vaksa
	BCF   0xF82,REL6,0
			;}
	RETURN
			;void REL2_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
			;{
REL2_ON
			;	REL1 = 1;			// kontaktor vodostuika
	BSF   0xF82,REL1,0
			;	REL2 = 1;			// klapan topla H20
	BSF   0xF82,REL2,0
			;	REL3 = 0;			// prepatar
	BCF   0xF82,REL3,0
			;	REL4 = 0; 			// klapan studena H20 
	BCF   0xF82,REL4,0
			;	REL5 = 0; 			// chetka
	BCF   0xF83,REL5,0
			;	REL6 = 0;		    // vaksa
	BCF   0xF82,REL6,0
			;}
	RETURN
			;void REL3_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
			;{
REL3_ON
			;	REL1 = 1;			// kontaktor vodostuika
	BSF   0xF82,REL1,0
			;	REL2 = 0;			// klapan topla H20
	BCF   0xF82,REL2,0
			;	REL3 = 0;			// prepatar
	BCF   0xF82,REL3,0
			;	REL4 = 1; 			// klapan studena H20 
	BSF   0xF82,REL4,0
			;	REL5 = 0; 			// chetka
	BCF   0xF83,REL5,0
			;	REL6 = 0;		    // vaksa
	BCF   0xF82,REL6,0
			;}
	RETURN
			;void REL4_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
			;{
REL4_ON
			;	REL1 = 0;			// kontaktor vodostuika
	BCF   0xF82,REL1,0
			;	REL2 = 0;			// klapan topla H20
	BCF   0xF82,REL2,0
			;	REL3 = 0;			// prepatar
	BCF   0xF82,REL3,0
			;	REL4 = 0; 			// klapan studena H20 
	BCF   0xF82,REL4,0
			;	REL5 = 1; 			// chetka
	BSF   0xF83,REL5,0
			;	REL6 = 0;		    // vaksa
	BCF   0xF82,REL6,0
			;}
	RETURN
			;void REL6_ON(void)		//100100 - vodostrukia; 110000 - parapstruika; 001000 - preparat; 000110 - chetka; 000001 - vaksa
			;{
REL6_ON
			;	REL1 = 0;			// kontaktor vodostuika
	BCF   0xF82,REL1,0
			;	REL2 = 0;			// klapan topla H20
	BCF   0xF82,REL2,0
			;	REL3 = 0;			// prepatar
	BCF   0xF82,REL3,0
			;	REL4 = 0; 			// klapan studena H20 
	BCF   0xF82,REL4,0
			;	REL5 = 0; 			// chetka
	BCF   0xF83,REL5,0
			;	REL6 = 1;		    // vaksa
	BSF   0xF82,REL6,0
			;}
	RETURN
			;void REL_OFF(void)
			;{
REL_OFF
			;	REL1 = 0;
	BCF   0xF82,REL1,0
			;	REL2 = 0;
	BCF   0xF82,REL2,0
			;	REL3 = 0;
	BCF   0xF82,REL3,0
			;	REL4 = 0;
	BCF   0xF82,REL4,0
			;	REL5 = 0; 
	BCF   0xF83,REL5,0
			;	REL6 = 0; 
	BCF   0xF82,REL6,0
			;}
	RETURN

  ; FILE eeprom.h
			;uns8 readEEPROM(uns8);			// read EEPROM cells
			;void writeEEPROM(uns8, uns8);	// write to eeprom
			;void Load(void);				// Load EEPROM values
			;void cr_to_time(char);			// convert credit to time
			;void time_to_cr(char);			// convert left time to credit
			;/*-----------------------------------------*/
			;
			;uns8 readEEPROM(uns8 address)
			;{
readEEPROM
	MOVWF address,0
			;uns8 byte;                     	// Variable hold the data that is read
			;
			;EEADR = address;               	// Read from this address
	MOVFF address,EEADR
			;EEPGD = 0;                     	// Point to EE memory
	BCF   0xFA6,EEPGD,0
			;CFGS = 0;						// EEPROM address
	BCF   0xFA6,CFGS,0
			;RD = 1;                     	// Initiate a read cycle
	BSF   0xFA6,RD,0
			;byte = EEDATA;                 	// Fetch byte from data register
	MOVFF EEDATA,byte
			;
			;return byte;                   	// Return the read byte
	MOVF  byte,W,0
	RETURN
			;}
			;
			;/*-----------------------------------------*/
			;
			;void writeEEPROM(uns8 smb, uns8 addr)
			;{
writeEEPROM
	MOVWF addr,0
			;EEADR = addr;		// set address
	MOVFF addr,EEADR
			;EEDATA = smb;		// set symbol to be written
	MOVFF smb_2,EEDATA
			;CFGS = 0;			// EEPROM address
	BCF   0xFA6,CFGS,0
			;WREN = 1;			// enable write
	BSF   0xFA6,WREN,0
			;EECON2 = 0x55;		// Write "password" to EECON2
	MOVLW 85
	MOVWF EECON2,0
			;EECON2 = 0xAA;
	MOVLW 170
	MOVWF EECON2,0
			;WR = 1;				// Initiate a write cycle
	BSF   0xFA6,WR,0
			;while(WR);			// Wait for write to complete
m056	BTFSC 0xFA6,WR,0
	BRA   m056
			;WREN = 0;			// disable write
	BCF   0xFA6,WREN,0
			;}
	RETURN
			;
			;/*----------------------------------------*/
			;
			;void Load(void)
			;{
Load
			;vEN1 = readEEPROM(eEN1); delay(1);
	MOVLW 246
	RCALL readEEPROM
	MOVWF vEN1,0
	MOVLW 1
	RCALL delay
			;vEN2 = readEEPROM(eEN2); delay(1);
	MOVLW 247
	RCALL readEEPROM
	MOVWF vEN2,0
	MOVLW 1
	RCALL delay
			;vEN3 = readEEPROM(eEN3); delay(1);
	MOVLW 198
	RCALL readEEPROM
	MOVWF vEN3,0
	MOVLW 1
	RCALL delay
			;vEN4 = readEEPROM(eEN4); delay(1);
	MOVLW 199
	RCALL readEEPROM
	MOVWF vEN4,0
	MOVLW 1
	RCALL delay
			;vEN6 = readEEPROM(eEN6); delay(1);
	MOVLW 200
	RCALL readEEPROM
	MOVWF vEN6,0
	MOVLW 1
	RCALL delay
			;//vZumer = readEEPROM(eZumer); delay(1);
			;//vOpto1 = readEEPROM(eOpto1); delay(1);
			;//vOpto2 = readEEPROM(eOpto2); delay(1);
			;vBL = readEEPROM(eBL); delay(1);
	MOVLW 251
	RCALL readEEPROM
	MOVWF vBL,0
	MOVLW 1
	RCALL delay
			;vAUTOSTART = readEEPROM(eAUTOSTART); delay(1);
	MOVLW 223
	RCALL readEEPROM
	MOVWF vAUTOSTART,0
	MOVLW 1
	RCALL delay
			;vCounter.high8 = readEEPROM(eCounterH); delay(1);
	MOVLW 218
	RCALL readEEPROM
	MOVWF vCounter+1,0
	MOVLW 1
	RCALL delay
			;vCounter.low8  = readEEPROM(eCounterL); delay(1);
	MOVLW 219
	RCALL readEEPROM
	MOVWF vCounter,0
	MOVLW 1
	RCALL delay
			;
			;vOPA = readEEPROM(eOPA); delay(1);
	MOVLW 245
	RCALL readEEPROM
	MOVWF vOPA,0
	MOVLW 1
	RCALL delay
			;vOPB = readEEPROM(eOPB); delay(1);
	MOVLW 244
	RCALL readEEPROM
	MOVWF vOPB,0
	MOVLW 1
	RCALL delay
			;vOPC = readEEPROM(eOPC); delay(1);
	MOVLW 243
	RCALL readEEPROM
	MOVWF vOPC,0
	MOVLW 1
	RCALL delay
			;vOPD = readEEPROM(eOPD); delay(1);
	MOVLW 242
	RCALL readEEPROM
	MOVWF vOPD,0
	MOVLW 1
	RCALL delay
			;vOPE = readEEPROM(eOPE); delay(1);
	MOVLW 241
	RCALL readEEPROM
	MOVWF vOPE,0
	MOVLW 1
	RCALL delay
			;vOPF = readEEPROM(eOPF); delay(1);
	MOVLW 240
	RCALL readEEPROM
	MOVWF vOPF,0
	MOVLW 1
	RCALL delay
			;
			;/*
			;// calculate remaining time
			;retvalue = readEEPROM(etime1H); delay(1);
			;cred1 = (uns24)retvalue * 60;
			;retvalue  = readEEPROM(etime1M); delay(1);
			;cred1 += retvalue;
			;cred1 *= 60;
			;retvalue = readEEPROM(etime2H); delay(1);
			;cred2 = (uns24)retvalue * 60;
			;retvalue  = readEEPROM(etime2M); delay(1);
			;cred2 += retvalue;
			;cred2 *= 60;
			;retvalue = readEEPROM(etime3H); delay(1);
			;cred3 = (uns24)retvalue * 60;
			;retvalue  = readEEPROM(etime3M); delay(1);
			;cred3 += retvalue;
			;cred3 *= 60;
			;retvalue = readEEPROM(etime4H); delay(1);
			;cred4 = (uns24)retvalue * 60;
			;retvalue  = readEEPROM(etime4M); delay(1);
			;cred4 += retvalue;
			;cred4 *= 60;
			;retvalue = readEEPROM(etime6H); delay(1);
			;cred6 = (uns24)retvalue * 60;
			;retvalue  = readEEPROM(etime6M); delay(1);
			;cred6 += retvalue;
			;cred6 *= 60;
			;
			;*/
			;
			;vINH = readEEPROM(eINH); delay(1);
	MOVLW 255
	RCALL readEEPROM
	MOVWF vINH,0
	MOVLW 1
	RCALL delay
			;vComm = readEEPROM(eComm); delay(1);
	MOVLW 254
	RCALL readEEPROM
	MOVWF vComm,0
	MOVLW 1
	RCALL delay
			;
			;overpay.high8 = readEEPROM(eoverH); delay(1);
	MOVLW 231
	RCALL readEEPROM
	MOVWF overpay+2,1
	MOVLW 1
	RCALL delay
			;overpay.mid8  = readEEPROM(eoverM); delay(1);
	MOVLW 232
	RCALL readEEPROM
	MOVWF overpay+1,1
	MOVLW 1
	RCALL delay
			;overpay.low8  = readEEPROM(eoverL); delay(1);
	MOVLW 233
	RCALL readEEPROM
	MOVWF overpay,1
	MOVLW 1
	RCALL delay
			;
			;total1.high8 = readEEPROM(etotal1H); delay(1);
	MOVLW 234
	RCALL readEEPROM
	MOVWF total1+2,1
	MOVLW 1
	RCALL delay
			;total1.mid8  = readEEPROM(etotal1M); delay(1);
	MOVLW 235
	RCALL readEEPROM
	MOVWF total1+1,1
	MOVLW 1
	RCALL delay
			;total1.low8  = readEEPROM(etotal1L); delay(1);
	MOVLW 236
	RCALL readEEPROM
	MOVWF total1,1
	MOVLW 1
	RCALL delay
			;
			;total2.high8 = readEEPROM(etotal2H); delay(1);
	MOVLW 237
	RCALL readEEPROM
	MOVWF total2+2,1
	MOVLW 1
	RCALL delay
			;total2.mid8  = readEEPROM(etotal2M); delay(1);
	MOVLW 238
	RCALL readEEPROM
	MOVWF total2+1,1
	MOVLW 1
	RCALL delay
			;total2.low8  = readEEPROM(etotal2L); delay(1);
	MOVLW 239
	RCALL readEEPROM
	MOVWF total2,1
	MOVLW 1
	RCALL delay
			;
			;total3.high8 = readEEPROM(etotal3H); delay(1);
	MOVLW 202
	RCALL readEEPROM
	MOVWF total3+2,1
	MOVLW 1
	RCALL delay
			;total3.mid8  = readEEPROM(etotal3M); delay(1);
	MOVLW 203
	RCALL readEEPROM
	MOVWF total3+1,1
	MOVLW 1
	RCALL delay
			;total3.low8  = readEEPROM(etotal3L); delay(1);
	MOVLW 204
	RCALL readEEPROM
	MOVWF total3,1
	MOVLW 1
	RCALL delay
			;
			;total4.high8 = readEEPROM(etotal4H); delay(1);
	MOVLW 205
	RCALL readEEPROM
	MOVWF total4+2,1
	MOVLW 1
	RCALL delay
			;total4.mid8  = readEEPROM(etotal4M); delay(1);
	MOVLW 206
	RCALL readEEPROM
	MOVWF total4+1,1
	MOVLW 1
	RCALL delay
			;total4.low8  = readEEPROM(etotal4L); delay(1);
	MOVLW 207
	RCALL readEEPROM
	MOVWF total4,1
	MOVLW 1
	RCALL delay
			;
			;total6.high8 = readEEPROM(etotal6H); delay(1);
	MOVLW 186
	RCALL readEEPROM
	MOVWF total6+2,1
	MOVLW 1
	RCALL delay
			;total6.mid8  = readEEPROM(etotal6M); delay(1);
	MOVLW 187
	RCALL readEEPROM
	MOVWF total6+1,1
	MOVLW 1
	RCALL delay
			;total6.low8  = readEEPROM(etotal6L); delay(1);
	MOVLW 188
	RCALL readEEPROM
	MOVWF total6,1
	MOVLW 1
	RCALL delay
			;
			;NONpay.high8 = readEEPROM(eNONpayH); delay(1);
	MOVLW 228
	RCALL readEEPROM
	MOVWF NONpay+2,1
	MOVLW 1
	RCALL delay
			;NONpay.mid8  = readEEPROM(eNONpayM); delay(1);
	MOVLW 229
	RCALL readEEPROM
	MOVWF NONpay+1,1
	MOVLW 1
	RCALL delay
			;NONpay.low8  = readEEPROM(eNONpayL); delay(1);
	MOVLW 230
	RCALL readEEPROM
	MOVWF NONpay,1
	MOVLW 1
	RCALL delay
			;
			;wHour.high8  = readEEPROM(eHour); delay(1);
	MOVLW 220
	RCALL readEEPROM
	MOVWF wHour+2,1
	MOVLW 1
	RCALL delay
			;wHour.mid8   = readEEPROM(eHour+1); delay(1);
	MOVLW 221
	RCALL readEEPROM
	MOVWF wHour+1,1
	MOVLW 1
	RCALL delay
			;wHour.low8   = readEEPROM(eHour+2); delay(1);
	MOVLW 222
	RCALL readEEPROM
	MOVWF wHour,1
	MOVLW 1
	BRA   delay
			;}
			;
			;/*-----------------------------------------*/
			;
			;void cr_to_time(char ch)
			;{
cr_to_time
	MOVWF ch_2,0
			;char overload;
			;char addr;
			;uns8 val;
			;uns16 x2;
			;uns16 a,b;
			;uns24 y2;
			;
			;if(credit == 0)	
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m057
			;	{
			;	value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;	return;
	RETURN
			;	}
			;
			;overload = 0;
m057	CLRF  overload,0
			;if(ch == 1) addr = eeprom_start;
	DCFSNZ ch_2,W,0
	CLRF  addr_2,0
			;if(ch == 2) addr = eeprom_start + 5;
	MOVLW 2
	CPFSEQ ch_2,0
	BRA   m058
	MOVLW 5
	MOVWF addr_2,0
			;if(ch == 3) addr = eeprom_start + 0x60;
m058	MOVLW 3
	CPFSEQ ch_2,0
	BRA   m059
	MOVLW 96
	MOVWF addr_2,0
			;if(ch == 4) 
m059	MOVLW 4
	CPFSEQ ch_2,0
	BRA   m060
			;	{
			;	addr = eeprom_start + 0x60;
	MOVLW 96
	MOVWF addr_2,0
			;	addr = addr + 5;
	MOVLW 5
	ADDWF addr_2,1,0
			;	}
			;if(ch == 6) addr = eeprom_start + 0x0B;
m060	MOVLW 6
	CPFSEQ ch_2,0
	BRA   m061
	MOVLW 11
	MOVWF addr_2,0
			;
			;for(ind=0;ind<10;ind++)
m061	CLRF  ind,0
m062	MOVLW 10
	CPFSLT ind,0
	BRA   m064
			;	{
			;	val = readEEPROM(addr);	
	MOVF  addr_2,W,0
	RCALL readEEPROM
	MOVWF val,0
			;	if(val == 0xFF) overload = 1;
	INCFSZ val,W,0
	BRA   m063
	MOVLW 1
	MOVWF overload,0
			;	if(overload) break;	
m063	TSTFSZ overload,0
	BRA   m064
			;	x2 = (uns16)val * 100;
	MOVF  val,W,0
	MULLW 100
	MOVFF PRODL,x2
	MOVFF PRODH,x2+1
			;	val = readEEPROM(addr+1);	
	INCF  addr_2,W,0
	RCALL readEEPROM
	MOVWF val,0
			;	x2 +=(uns16)val;
	ADDWF x2,1,0
	MOVLW 0
	ADDWFC x2+1,1,0
			;	if(credit <= x2) break;
	MOVF  credit,W,1
	SUBWF x2,W,0
	MOVF  credit+1,W,1
	SUBWFB x2+1,W,0
	BC    m064
			;	addr += 0x10;
	MOVLW 16
	ADDWF addr_2,1,0
			;	}
	INCF  ind,1,0
	BRA   m062
			;
			;if(overload) addr -= 0x10;
m064	MOVF  overload,1,0
	BZ    m065
	MOVLW 16
	SUBWF addr_2,1,0
			;addr += 2;
m065	MOVLW 2
	ADDWF addr_2,1,0
			;val = readEEPROM(addr); 	y2 = (uns24)val * 3600;
	MOVF  addr_2,W,0
	RCALL readEEPROM
	MOVWF val,0
	MULLW 16
	MOVFF PRODL,y2
	MOVFF PRODH,y2+1
	CLRF  y2+2,0
	MULLW 14
	MOVF  PRODL,W,0
	ADDWF y2+1,1,0
	MOVF  PRODH,W,0
	ADDWFC y2+2,1,0
			;val = readEEPROM(addr+1); 	
	INCF  addr_2,W,0
	RCALL readEEPROM
	MOVWF val,0
			;temp = (uns16)val * 60;		y2 += (uns24)temp;
	CLRF  temp+2,1
	MULLW 60
	MOVFF PRODL,temp
	MOVFF PRODH,temp+1
	MOVF  temp,W,1
	ADDWF y2,1,0
	MOVF  temp+1,W,1
	ADDWFC y2+1,1,0
	MOVF  temp+2,W,1
	ADDWFC y2+2,1,0
			;val = readEEPROM(addr+2); 	y2 += (uns24)val;
	MOVLW 2
	ADDWF addr_2,W,0
	RCALL readEEPROM
	MOVWF val,0
	ADDWF y2,1,0
	MOVLW 0
	ADDWFC y2+1,1,0
	ADDWFC y2+2,1,0
			;
			;a = y2 / x2;
	MOVF  y2,W,0
	MOVWF C22tmp,0
	MOVF  y2+1,W,0
	MOVWF C22tmp+1,0
	MOVF  y2+2,W,0
	MOVWF C22tmp+2,0
	CLRF  C23rem,0
	CLRF  C23rem+1,0
	MOVLW 24
	MOVWF C21cnt,0
m066	RLCF  C22tmp,1,0
	RLCF  C22tmp+1,1,0
	RLCF  C22tmp+2,1,0
	RLCF  C23rem,1,0
	RLCF  C23rem+1,1,0
	BC    m067
	MOVF  x2,W,0
	SUBWF C23rem,W,0
	MOVF  x2+1,W,0
	SUBWFB C23rem+1,W,0
	BNC   m068
m067	MOVF  x2,W,0
	SUBWF C23rem,1,0
	MOVF  x2+1,W,0
	SUBWFB C23rem+1,1,0
	BSF   0xFD8,Carry,0
m068	RLCF  a,1,0
	RLCF  a+1,1,0
	DECFSZ C21cnt,1,0
	BRA   m066
			;b = y2 % x2;
	MOVF  y2,W,0
	MOVWF C25tmp,0
	MOVF  y2+1,W,0
	MOVWF C25tmp+1,0
	MOVF  y2+2,W,0
	MOVWF C25tmp+2,0
	CLRF  b,0
	CLRF  b+1,0
	MOVLW 24
	MOVWF C24cnt,0
m069	RLCF  C25tmp,1,0
	RLCF  C25tmp+1,1,0
	RLCF  C25tmp+2,1,0
	RLCF  b,1,0
	RLCF  b+1,1,0
	BC    m070
	MOVF  x2,W,0
	SUBWF b,W,0
	MOVF  x2+1,W,0
	SUBWFB b+1,W,0
	BNC   m071
m070	MOVF  x2,W,0
	SUBWF b,1,0
	MOVF  x2+1,W,0
	SUBWFB b+1,1,0
m071	DECFSZ C24cnt,1,0
	BRA   m069
			;value = (uns24)a * credit;
	MOVF  a+1,W,0
	MULWF credit+1,1
	MOVFF PRODL,value+2
	MOVF  a,W,0
	MULWF credit,1
	MOVFF PRODL,value
	MOVFF PRODH,value+1
	MOVF  a+1,W,0
	MULWF credit,1
	MOVF  PRODL,W,0
	ADDWF value+1,1,1
	MOVF  PRODH,W,0
	ADDWFC value+2,1,1
	MOVF  a,W,0
	MULWF credit+1,1
	MOVF  PRODL,W,0
	ADDWF value+1,1,1
	MOVF  PRODH,W,0
	ADDWFC value+2,1,1
			;y2 = (uns24)b * credit;
	MOVF  b+1,W,0
	MULWF credit+1,1
	MOVFF PRODL,y2+2
	MOVF  b,W,0
	MULWF credit,1
	MOVFF PRODL,y2
	MOVFF PRODH,y2+1
	MOVF  b+1,W,0
	MULWF credit,1
	MOVF  PRODL,W,0
	ADDWF y2+1,1,0
	MOVF  PRODH,W,0
	ADDWFC y2+2,1,0
	MOVF  b,W,0
	MULWF credit+1,1
	MOVF  PRODL,W,0
	ADDWF y2+1,1,0
	MOVF  PRODH,W,0
	ADDWFC y2+2,1,0
			;y2 /= x2;
	MOVF  y2,W,0
	MOVWF C31tmp,0
	MOVF  y2+1,W,0
	MOVWF C31tmp+1,0
	MOVF  y2+2,W,0
	MOVWF C31tmp+2,0
	CLRF  C32rem,0
	CLRF  C32rem+1,0
	MOVLW 24
	MOVWF C30cnt,0
m072	RLCF  C31tmp,1,0
	RLCF  C31tmp+1,1,0
	RLCF  C31tmp+2,1,0
	RLCF  C32rem,1,0
	RLCF  C32rem+1,1,0
	BC    m073
	MOVF  x2,W,0
	SUBWF C32rem,W,0
	MOVF  x2+1,W,0
	SUBWFB C32rem+1,W,0
	BNC   m074
m073	MOVF  x2,W,0
	SUBWF C32rem,1,0
	MOVF  x2+1,W,0
	SUBWFB C32rem+1,1,0
	BSF   0xFD8,Carry,0
m074	RLCF  y2,1,0
	RLCF  y2+1,1,0
	RLCF  y2+2,1,0
	DECFSZ C30cnt,1,0
	BRA   m072
			;value +=  y2;
	MOVF  y2,W,0
	ADDWF value,1,1
	MOVF  y2+1,W,0
	ADDWFC value+1,1,1
	MOVF  y2+2,W,0
	ADDWFC value+2,1,1
			;}
	RETURN
			;
			;/*-----------------------------------------*/
			;
			;void time_to_cr(char ch)
			;{
time_to_cr
	MOVWF ch_3,0
			;char overload;
			;uns8 addr;
			;uns8 val;
			;uns16 x2;
			;uns16 a,b;
			;uns16 cred;
			;uns24 y2;
			;
			;overload = 0;
	CLRF  overload_2,0
			;if(ch == 1) 
	DECFSZ ch_3,W,0
	BRA   m075
			; {
			; addr = eeprom_start;
	CLRF  addr_3,0
			; cred = cred1;
	MOVFF cred1,cred
	MOVFF cred1+1,cred+1
			; cred1 = 0;
	CLRF  cred1,1
	CLRF  cred1+1,1
	CLRF  cred1+2,1
			; }
			;if(ch == 2) 
m075	MOVLW 2
	CPFSEQ ch_3,0
	BRA   m076
			; {
			; addr = eeprom_start + 5;
	MOVLW 5
	MOVWF addr_3,0
			; cred = cred2;
	MOVFF cred2,cred
	MOVFF cred2+1,cred+1
			; cred2 = 0;
	CLRF  cred2,1
	CLRF  cred2+1,1
	CLRF  cred2+2,1
			; }
			;if(ch == 3) 
m076	MOVLW 3
	CPFSEQ ch_3,0
	BRA   m077
			; {
			; addr = eeprom_start + 0x60;
	MOVLW 96
	MOVWF addr_3,0
			; cred = cred3;
	MOVFF cred3,cred
	MOVFF cred3+1,cred+1
			; cred3 = 0;
	CLRF  cred3,1
	CLRF  cred3+1,1
	CLRF  cred3+2,1
			; }
			;if(ch == 4) 
m077	MOVLW 4
	CPFSEQ ch_3,0
	BRA   m078
			; {
			; addr = eeprom_start + 0x65;
	MOVLW 101
	MOVWF addr_3,0
			; cred = cred4;
	MOVFF cred4,cred
	MOVFF cred4+1,cred+1
			; cred4 = 0;
	CLRF  cred4,1
	CLRF  cred4+1,1
	CLRF  cred4+2,1
			; }
			;if(ch == 6) 
m078	MOVLW 6
	CPFSEQ ch_3,0
	BRA   m079
			; {
			; addr = eeprom_start + 0x0B;
	MOVLW 11
	MOVWF addr_3,0
			; cred = cred6;
	MOVFF cred6,cred
	MOVFF cred6+1,cred+1
			; cred6 = 0;
	CLRF  cred6,1
	CLRF  cred6+1,1
	CLRF  cred6+2,1
			; }
			;
			;addr += 2;
m079	MOVLW 2
	ADDWF addr_3,1,0
			;for(ind=0;ind<10;ind++)
	CLRF  ind,0
m080	MOVLW 10
	CPFSLT ind,0
	BRA   m083
			; {
			; val = readEEPROM(addr);  
	MOVF  addr_3,W,0
	RCALL readEEPROM
	MOVWF val_2,0
			; if(val == 0xFF) 
	INCFSZ val_2,W,0
	BRA   m081
			;  {
			;  overload = 1;
	MOVLW 1
	MOVWF overload_2,0
			;  break; 
	BRA   m083
			;  }
			; y2 = (uns24)val * 3600;
m081	MOVF  val_2,W,0
	MULLW 16
	MOVFF PRODL,y2_2
	MOVFF PRODH,y2_2+1
	CLRF  y2_2+2,0
	MULLW 14
	MOVF  PRODL,W,0
	ADDWF y2_2+1,1,0
	MOVF  PRODH,W,0
	ADDWFC y2_2+2,1,0
			; val = readEEPROM(addr+1);  
	INCF  addr_3,W,0
	RCALL readEEPROM
	MOVWF val_2,0
			; temp = (uns16)val * 60;  y2 += (uns24)temp;
	CLRF  temp+2,1
	MULLW 60
	MOVFF PRODL,temp
	MOVFF PRODH,temp+1
	MOVF  temp,W,1
	ADDWF y2_2,1,0
	MOVF  temp+1,W,1
	ADDWFC y2_2+1,1,0
	MOVF  temp+2,W,1
	ADDWFC y2_2+2,1,0
			; val = readEEPROM(addr+2);  y2 += (uns24)val;
	MOVLW 2
	ADDWF addr_3,W,0
	RCALL readEEPROM
	MOVWF val_2,0
	ADDWF y2_2,1,0
	MOVLW 0
	ADDWFC y2_2+1,1,0
	ADDWFC y2_2+2,1,0
			; if(cred <= y2) break;
	MOVF  y2_2+2,W,0
	BNZ   m083
	MOVF  cred+1,W,0
	SUBWF y2_2+1,W,0
	BNC   m082
	BNZ   m083
	MOVF  cred,W,0
	SUBWF y2_2,W,0
	BC    m083
			; addr += 0x10;
m082	MOVLW 16
	ADDWF addr_3,1,0
			; }
	INCF  ind,1,0
	BRA   m080
			;
			;if(overload) addr -= 0x10;
m083	MOVF  overload_2,1,0
	BZ    m084
	MOVLW 16
	SUBWF addr_3,1,0
			;addr -= 2;
m084	MOVLW 2
	SUBWF addr_3,1,0
			;val = readEEPROM(addr); 
	MOVF  addr_3,W,0
	RCALL readEEPROM
	MOVWF val_2,0
			;x2 = (uns16)val * 100;
	MULLW 100
	MOVFF PRODL,x2_2
	MOVFF PRODH,x2_2+1
			;val = readEEPROM(addr+1); 
	INCF  addr_3,W,0
	RCALL readEEPROM
	MOVWF val_2,0
			;x2 +=(uns16)val;
	ADDWF x2_2,1,0
	MOVLW 0
	ADDWFC x2_2+1,1,0
			;
			;a = y2 / x2;
	MOVF  y2_2,W,0
	MOVWF C40tmp,0
	MOVF  y2_2+1,W,0
	MOVWF C40tmp+1,0
	MOVF  y2_2+2,W,0
	MOVWF C40tmp+2,0
	CLRF  C41rem,0
	CLRF  C41rem+1,0
	MOVLW 24
	MOVWF C39cnt,0
m085	RLCF  C40tmp,1,0
	RLCF  C40tmp+1,1,0
	RLCF  C40tmp+2,1,0
	RLCF  C41rem,1,0
	RLCF  C41rem+1,1,0
	BC    m086
	MOVF  x2_2,W,0
	SUBWF C41rem,W,0
	MOVF  x2_2+1,W,0
	SUBWFB C41rem+1,W,0
	BNC   m087
m086	MOVF  x2_2,W,0
	SUBWF C41rem,1,0
	MOVF  x2_2+1,W,0
	SUBWFB C41rem+1,1,0
	BSF   0xFD8,Carry,0
m087	RLCF  a_2,1,0
	RLCF  a_2+1,1,0
	DECFSZ C39cnt,1,0
	BRA   m085
			;b = y2 % x2;
	MOVF  y2_2,W,0
	MOVWF C43tmp,0
	MOVF  y2_2+1,W,0
	MOVWF C43tmp+1,0
	MOVF  y2_2+2,W,0
	MOVWF C43tmp+2,0
	CLRF  b_2,0
	CLRF  b_2+1,0
	MOVLW 24
	MOVWF C42cnt,0
m088	RLCF  C43tmp,1,0
	RLCF  C43tmp+1,1,0
	RLCF  C43tmp+2,1,0
	RLCF  b_2,1,0
	RLCF  b_2+1,1,0
	BC    m089
	MOVF  x2_2,W,0
	SUBWF b_2,W,0
	MOVF  x2_2+1,W,0
	SUBWFB b_2+1,W,0
	BNC   m090
m089	MOVF  x2_2,W,0
	SUBWF b_2,1,0
	MOVF  x2_2+1,W,0
	SUBWFB b_2+1,1,0
m090	DECFSZ C42cnt,1,0
	BRA   m088
			;y2 = (uns24)cred * x2;
	MOVF  cred+1,W,0
	MULWF x2_2+1,0
	MOVFF PRODL,y2_2+2
	MOVF  cred,W,0
	MULWF x2_2,0
	MOVFF PRODL,y2_2
	MOVFF PRODH,y2_2+1
	MOVF  cred+1,W,0
	MULWF x2_2,0
	MOVF  PRODL,W,0
	ADDWF y2_2+1,1,0
	MOVF  PRODH,W,0
	ADDWFC y2_2+2,1,0
	MOVF  cred,W,0
	MULWF x2_2+1,0
	MOVF  PRODL,W,0
	ADDWF y2_2+1,1,0
	MOVF  PRODH,W,0
	ADDWFC y2_2+2,1,0
			;temp = (uns24)a * x2;
	MOVF  a_2+1,W,0
	MULWF x2_2+1,0
	MOVFF PRODL,temp+2
	MOVF  a_2,W,0
	MULWF x2_2,0
	MOVFF PRODL,temp
	MOVFF PRODH,temp+1
	MOVF  a_2+1,W,0
	MULWF x2_2,0
	MOVF  PRODL,W,0
	ADDWF temp+1,1,1
	MOVF  PRODH,W,0
	ADDWFC temp+2,1,1
	MOVF  a_2,W,0
	MULWF x2_2+1,0
	MOVF  PRODL,W,0
	ADDWF temp+1,1,1
	MOVF  PRODH,W,0
	ADDWFC temp+2,1,1
			;x2 = temp + b;
	MOVF  b_2,W,0
	ADDWF temp,W,1
	MOVWF x2_2,0
	MOVF  b_2+1,W,0
	ADDWFC temp+1,W,1
	MOVWF x2_2+1,0
			;credit = y2 / x2;
	MOVF  y2_2,W,0
	MOVWF C49tmp,0
	MOVF  y2_2+1,W,0
	MOVWF C49tmp+1,0
	MOVF  y2_2+2,W,0
	MOVWF C49tmp+2,0
	CLRF  C50rem,0
	CLRF  C50rem+1,0
	MOVLW 24
	MOVWF C48cnt,0
m091	RLCF  C49tmp,1,0
	RLCF  C49tmp+1,1,0
	RLCF  C49tmp+2,1,0
	RLCF  C50rem,1,0
	RLCF  C50rem+1,1,0
	BC    m092
	MOVF  x2_2,W,0
	SUBWF C50rem,W,0
	MOVF  x2_2+1,W,0
	SUBWFB C50rem+1,W,0
	BNC   m093
m092	MOVF  x2_2,W,0
	SUBWF C50rem,1,0
	MOVF  x2_2+1,W,0
	SUBWFB C50rem+1,1,0
	BSF   0xFD8,Carry,0
m093	RLCF  credit,1,1
	RLCF  credit+1,1,1
	DECFSZ C48cnt,1,0
	BRA   m091
			;}
	RETURN

  ; FILE lcd.h
			;void lcd_write(uns8);				// write a byte to LCD in 4 bit mode 
			;void lcd_setup(char);				// intialize the LCD - call before anything else 
			;void lcd_goto(uns8 pos);			// Go to the specified position
			;void lcd_clear(void);				// Clear and home the LCD
			;void lcd_puts(const char *);		// write a string of characters to the LCD
			;void lcd_credit(void);				// write credit
			;void lcd_time(void);				// write remaining time
			;void lcd_money(void);
			;void lcd_out(void);					// out of service
			;void st_clear(void);
			;void print_total(void);
			;void lcd_puts_cyr(const char *);	// write a CYR string of characters to the LCD
			;uns8 lat2cyr(char symb);			// convert LAT 2 CYR
			;
			;/*----------------------------------------*/
			;
			;#define LINE1   0x80
			;#define LINE2   0xC0
			;//#define LINE3   0x90
			;//#define LINE4   0xD0
			;
			;const uns8 CYR[26] = {0x41, 0xA0, 0xE1, 0xE0, 0x45, 0xAA, 0xA1, 0x58, 0xA5, 0xA3, 0x4B, 0xA7, 0x4D, 0x48, 0x4F, 0xA8, 0xB0, 0x50, 0x43, 0x54, 0xA9, 0x42, 0xB1, 0xAD, 0xAB, 0xA4};  
			;const uns8 cyr[26] = {0x61, 0xB2, 0xE5, 0xE3, 0x65, 0xE4, 0xb4, 0x78, 0xB8, 0xB6, 0xBA, 0xBB, 0xBC, 0xBD, 0x6F, 0xBE, 0xC6, 0x70, 0x63, 0xBF, 0x79, 0xB3, 0xC7, 0xC2, 0xC0, 0xB7};
			;
			;
			;/*
			;                   16-char display   
			;                   ===============   
			;
			;1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16
			;
			;80	81	82	83	84	85	86	87	88	89	8A	8B	8C	8D	8E	8F
			;C0	C1	C2	C3	C4	C5	C6	C7	C8	C9	CA	CB	CC	CD	CE	CF
			;90	91	92	93	94	95	96	97	98	99	9A	9B	9C	9D	9E	9F
			;D0	D1	D2	D3	D4	D5	D6	D7	D8	D9	DA	DB	DC	DD	DE	DF
			;
			;*/
			;
			;/*----------------------------------------*/
			;
			;void lcd_write(uns8 c)
			;{
lcd_write
	MOVWF c,0
			;char tmp;
			;	
			;tmp = c & 0xF0;
	MOVLW 240
	ANDWF c,W,0
	MOVWF tmp_3,0
			;tmp >>= 2;
	BCF   0xFD8,Carry,0
	RRCF  tmp_3,1,0
	BCF   0xFD8,Carry,0
	RRCF  tmp_3,1,0
			;PORTA = tmp;
	MOVFF tmp_3,PORTA
			;LCD_EN = 1;
	BSF   0xF84,LCD_EN,0
			;nop2();
	BRA   m094
			;nop2();
m094	BRA   m095
			;LCD_EN = 0;
m095	BCF   0xF84,LCD_EN,0
			;
			;tmp = c & 0x0F;
	MOVLW 15
	ANDWF c,W,0
	MOVWF tmp_3,0
			;tmp <<= 2;
	BCF   0xFD8,Carry,0
	RLCF  tmp_3,1,0
	BCF   0xFD8,Carry,0
	RLCF  tmp_3,1,0
			;PORTA = tmp;
	MOVFF tmp_3,PORTA
			;LCD_EN = 1;
	BSF   0xF84,LCD_EN,0
			;nop2();
	BRA   m096
			;nop2();
m096	BRA   m097
			;LCD_EN = 0;
m097	BCF   0xF84,LCD_EN,0
			;delay(3);
	MOVLW 3
	GOTO  delay
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_setup(char mode)
			;{
lcd_setup
	MOVWF mode,0
			;LCD_RS = 0;							// write control bytes
	BCF   0xF84,LCD_RS,0
			;lcd_write(0x28); delay(4);			// 4 bit mode, 2 lines, 5x8 font	
	MOVLW 40
	RCALL lcd_write
	MOVLW 4
	CALL  delay
			;if(mode) lcd_write(0x0F);			// blink on; cursor on
	MOVF  mode,1,0
	BZ    m098
	MOVLW 15
	RCALL lcd_write
			;else lcd_write(0x0C); 				// blink off, cursor off
	BRA   m099
m098	MOVLW 12
	RCALL lcd_write
			;delay(4);							// config display
m099	MOVLW 4
	CALL  delay
			;// lcd_write(0x01); delay(4);			// clear display
			;lcd_write(0x06); delay(4);			// entry mode
	MOVLW 6
	RCALL lcd_write
	MOVLW 4
	GOTO  delay
			;// lcd_write(0x01); delay(20);			// clear display
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_goto(uns8 pos)
			;{
lcd_goto
	MOVWF pos,0
			;	LCD_RS = 0;
	BCF   0xF84,LCD_RS,0
			;	lcd_write(pos);
	BRA   lcd_write
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_clear(void)
			;{
lcd_clear
			;	LCD_RS = 0;
	BCF   0xF84,LCD_RS,0
			;	lcd_write(0x01);
	MOVLW 1
	RCALL lcd_write
			;	delay(1);
	MOVLW 1
	GOTO  delay
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_puts(const char *s)
			;{
lcd_puts
			;	LCD_RS = 1;						// write characters
	BSF   0xF84,LCD_RS,0
			;	while(*s) lcd_write(*s++);
m100	MOVFF s,ci_2
	MOVFF s+1,ci_2+1
	CALL  _const2
	XORLW 0
	BZ    m101
	MOVFF s,ci_2
	MOVFF s+1,ci_2+1
	CALL  _const2
	RCALL lcd_write
	INCF  s,1,0
	MOVLW 0
	ADDWFC s+1,1,0
	BRA   m100
			;}
m101	RETURN
			;
			;
			;/*--------------------------------------*/
			;
			;
			;uns8 lat2cyr(char symb)
			;{
lat2cyr
	MOVWF symb,0
			;char elem;
			;uns8 scyr;
			;
			;if((symb >= 'A') && (symb <= 'Z'))
	MOVLW 64
	CPFSGT symb,0
	BRA   m102
	MOVLW 91
	CPFSLT symb,0
	BRA   m102
			;	{
			;	elem = symb - 0x41;
	MOVLW 65
	SUBWF symb,W,0
	MOVWF elem,0
			;	scyr = CYR[elem];
	MOVLW 115
	ADDWF elem,W,0
	CALL  _const3
	MOVWF scyr,0
			;	}	
			;if(symb == '<') scyr = 0xA6;
m102	MOVLW 60
	CPFSEQ symb,0
	BRA   m103
	MOVLW 166
	MOVWF scyr,0
			;if(symb == '?') scyr = 0xAC;
m103	MOVLW 63
	CPFSEQ symb,0
	BRA   m104
	MOVLW 172
	MOVWF scyr,0
			;if(symb == '&') scyr = 0xE2;
m104	MOVLW 38
	CPFSEQ symb,0
	BRA   m105
	MOVLW 226
	MOVWF scyr,0
			;if(symb == '$') scyr = 0xC4;
m105	MOVLW 36
	CPFSEQ symb,0
	BRA   m106
	MOVLW 196
	MOVWF scyr,0
			;if((symb >= 'a') && (symb <= 'z'))
m106	MOVLW 96
	CPFSGT symb,0
	BRA   m107
	MOVLW 123
	CPFSLT symb,0
	BRA   m107
			;	{
			;	elem = symb - 0x61;
	MOVLW 97
	SUBWF symb,W,0
	MOVWF elem,0
			;	scyr = cyr[elem];
	MOVLW 141
	ADDWF elem,W,0
	CALL  _const3
	MOVWF scyr,0
			;	}
			;if(symb == '>') scyr = 0xB9;
m107	MOVLW 62
	CPFSEQ symb,0
	BRA   m108
	MOVLW 185
	MOVWF scyr,0
			;if(symb == '/') scyr = 0xC1;
m108	MOVLW 47
	CPFSEQ symb,0
	BRA   m109
	MOVLW 193
	MOVWF scyr,0
			;if(symb == '%') scyr = 0xE6;
m109	MOVLW 37
	CPFSEQ symb,0
	BRA   m110
	MOVLW 230
	MOVWF scyr,0
			;if(symb == '#') scyr = 0xC4;
m110	MOVLW 35
	CPFSEQ symb,0
	BRA   m111
	MOVLW 196
	MOVWF scyr,0
			;if(symb == ' ') scyr = 0x20;
m111	MOVLW 32
	CPFSEQ symb,0
	BRA   m112
	MOVWF scyr,0
			;return scyr;
m112	MOVF  scyr,W,0
	RETURN
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_puts_cyr(const char *s)
			;{
lcd_puts_cyr
			;	char cyr_tmp;
			;	LCD_RS = 1;						// write characters
	BSF   0xF84,LCD_RS,0
			;	while(*s)
m113	MOVF  s_2,W,0
	CALL  _const5
	XORLW 0
	BZ    m114
			;		{
			;		cyr_tmp = lat2cyr(*s++);	
	MOVF  s_2,W,0
	CALL  _const5
	RCALL lat2cyr
	MOVWF cyr_tmp,0
	INCF  s_2,1,0
			;		lcd_write(cyr_tmp);
	RCALL lcd_write
			;		}
	BRA   m113
			;}
m114	RETURN
			;
			;
			;/*--------------------------------------*/
			;
			;void lcd_credit(void)
			;{
lcd_credit
			;stot = credit % 100;
	MOVFF credit,arg1_5
	MOVFF credit+1,arg1_5+1
	MOVLW 100
	CALL  _remU16_8
	MOVWF stot,0
			;lev = credit / 100;
	MOVFF credit,arg1
	MOVFF credit+1,arg1+1
	MOVLW 100
	CALL  _divU16_8
	MOVFF arg1,lev
			;lcd_write(lev/10 + 0x30);
	MOVFF lev,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(lev%10 + 0x30);
	MOVFF lev,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_write(DOT);
	MOVLW 46
	RCALL lcd_write
			;lcd_write(stot/10 + 0x30);
	MOVFF stot,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(stot%10 + 0x30);
	MOVFF stot,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_puts_cyr(BGN_cyr);
	MOVLW 126
	MOVWF s_2,0
	BRA   lcd_puts_cyr
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_time(void)
			;{
lcd_time
			;lcd_write(hour/10 + 0x30);
	MOVFF hour,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(hour%10 + 0x30);
	MOVFF hour,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_write(':');
	MOVLW 58
	RCALL lcd_write
			;lcd_write(min/10 + 0x30);
	MOVFF min,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(min%10 + 0x30);
	MOVFF min,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_write(':');
	MOVLW 58
	RCALL lcd_write
			;lcd_write(sec/10 + 0x30);
	MOVFF sec,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(sec%10 + 0x30);
	MOVFF sec,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	BRA   lcd_write
			;//lcd_write('s');
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_money(void)
			;{
lcd_money
			;uns24 x;
			;uns16 a;
			;uns16 b;
			;uns8 a1;
			;uns8 b1;
			;uns8 a2;
			;uns8 b2;
			;
			;x = tot;
	MOVFF tot,x
	MOVFF tot+1,x+1
	MOVFF tot+2,x+2
			;a = x / 10000;
	MOVF  x,W,0
	MOVWF C52tmp,0
	MOVF  x+1,W,0
	MOVWF C52tmp+1,0
	MOVF  x+2,W,0
	MOVWF C52tmp+2,0
	CLRF  C53rem,0
	CLRF  C53rem+1,0
	MOVLW 24
	MOVWF C51cnt,0
m115	RLCF  C52tmp,1,0
	RLCF  C52tmp+1,1,0
	RLCF  C52tmp+2,1,0
	RLCF  C53rem,1,0
	RLCF  C53rem+1,1,0
	BC    m116
	MOVLW 16
	SUBWF C53rem,W,0
	MOVLW 39
	SUBWFB C53rem+1,W,0
	BNC   m117
m116	MOVLW 16
	SUBWF C53rem,1,0
	MOVLW 39
	SUBWFB C53rem+1,1,0
	BSF   0xFD8,Carry,0
m117	RLCF  a_3,1,0
	RLCF  a_3+1,1,0
	DECFSZ C51cnt,1,0
	BRA   m115
			;b = x % 10000;
	MOVF  x,W,0
	MOVWF C55tmp,0
	MOVF  x+1,W,0
	MOVWF C55tmp+1,0
	MOVF  x+2,W,0
	MOVWF C55tmp+2,0
	CLRF  b_3,0
	CLRF  b_3+1,0
	MOVLW 24
	MOVWF C54cnt,0
m118	RLCF  C55tmp,1,0
	RLCF  C55tmp+1,1,0
	RLCF  C55tmp+2,1,0
	RLCF  b_3,1,0
	RLCF  b_3+1,1,0
	BC    m119
	MOVLW 16
	SUBWF b_3,W,0
	MOVLW 39
	SUBWFB b_3+1,W,0
	BNC   m120
m119	MOVLW 16
	SUBWF b_3,1,0
	MOVLW 39
	SUBWFB b_3+1,1,0
m120	DECFSZ C54cnt,1,0
	BRA   m118
			;a1 = a / 100;
	MOVFF a_3,arg1
	MOVFF a_3+1,arg1+1
	MOVLW 100
	CALL  _divU16_8
	MOVFF arg1,a1
			;a2 = a % 100;
	MOVFF a_3,arg1_5
	MOVFF a_3+1,arg1_5+1
	MOVLW 100
	CALL  _remU16_8
	MOVWF a2,0
			;b1 = b / 100;
	MOVFF b_3,arg1
	MOVFF b_3+1,arg1+1
	MOVLW 100
	CALL  _divU16_8
	MOVFF arg1,b1
			;b2 = b % 100;
	MOVFF b_3,arg1_5
	MOVFF b_3+1,arg1_5+1
	MOVLW 100
	CALL  _remU16_8
	MOVWF b2,0
			;// lcd_write(a1/10 + 0x30);
			;lcd_write(a1%10 + 0x30);
	MOVFF a1,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_write(a2/10 + 0x30);
	MOVFF a2,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(a2%10 + 0x30);
	MOVFF a2,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_write(b1/10 + 0x30);
	MOVFF b1,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(b1%10 + 0x30);
	MOVFF b1,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	RCALL lcd_write
			;lcd_write('.');
	MOVLW 46
	RCALL lcd_write
			;lcd_write(b2/10 + 0x30);
	MOVFF b2,arg1
	CLRF  arg1+1,0
	MOVLW 10
	CALL  _divU16_8
	MOVLW 48
	ADDWF arg1,W,0
	RCALL lcd_write
			;lcd_write(b2%10 + 0x30);
	MOVFF b2,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 10
	CALL  _remU16_8
	ADDLW 48
	BRA   lcd_write
			;
			;/*
			;char xtmp;
			;
			;temp = tot / 100;
			;lev  = temp / 10;
			;xtmp = temp / 100 + 0x30; 	lcd_write(xtmp);	
			;xtmp = lev % 10 + 0x30; 	lcd_write(xtmp);
			;xtmp = temp % 10 + 0x30;	lcd_write(xtmp);
			;lcd_write('.');
			;stot = tot % 100;
			;xtmp = stot / 10 + 0x30;	lcd_write(xtmp);
			;xtmp = stot % 10 + 0x30;	lcd_write(xtmp);		
			;*/	
			;}
			;
			;/*--------------------------------------*/
			;
			;void lcd_out(void)
			;{
lcd_out
			;lcd_clear();
	RCALL lcd_clear
			;lcd_goto(LINE1);
	MOVLW 128
	RCALL lcd_goto
			;lcd_puts(Welc);
	CLRF  s,0
	CLRF  s+1,0
	RCALL lcd_puts
			;lcd_goto(LINE2);
	MOVLW 192
	RCALL lcd_goto
			;lcd_puts(OUT);
	MOVLW 76
	MOVWF s,0
	CLRF  s+1,0
	RCALL lcd_puts
			;INHALL ^= 1;
	BTG   0xF81,INHALL,0
			;}
	RETURN
			;
			;/*--------------------------------------*/
			;
			;void st_clear(void)
			;{
st_clear
			;lcd_goto(LINE2);
	MOVLW 192
	RCALL lcd_goto
			;lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	RCALL lcd_puts
			;ESCbut();
	GOTO  ESCbut
			;}
			;
			;/*--------------------------------------*/
			;
			;void print_total(void)
			;{
print_total
			;lcd_goto(LINE2);
	MOVLW 192
	RCALL lcd_goto
			;lcd_puts(Cash);
	MOVLW 135
	MOVWF s,0
	CLRF  s+1,0
	RCALL lcd_puts
			;lcd_money();
	RCALL lcd_money
			;lcd_puts(BGN);
	MOVLW 73
	MOVWF s,0
	CLRF  s+1,0
	RCALL lcd_puts
			;ESCbut();	
	GOTO  ESCbut
			;}

  ; FILE menu.h
			;void scan_menu(char);
			;char en_to_dis(char,uns8);
			;void test(char);
			;
			;/*-----------------------------------------------------*/
			;
			;void scan_menu(char point)
			;{
scan_menu
	MOVWF point,0
			;char k;
			;char change;
			;char esc;
			;char digit;
			;char dmax;
			;uns8 lcd_adr;
			;uns8 eadr;
			;
			;switch(point)
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m121
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m124
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m125
	XORLW 7
	BTFSC 0xFD8,Zero_,0
	BRA   m126
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m127
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m128
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m129
	XORLW 15
	BTFSC 0xFD8,Zero_,0
	BRA   m130
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m131
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m132
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m133
	XORLW 7
	BTFSC 0xFD8,Zero_,0
	BRA   m134
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m135
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m136
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m137
	XORLW 31
	BTFSC 0xFD8,Zero_,0
	BRA   m138
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m139
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m140
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m141
	XORLW 7
	BTFSC 0xFD8,Zero_,0
	BRA   m142
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m143
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m144
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m145
	XORLW 15
	BTFSC 0xFD8,Zero_,0
	BRA   m146
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m147
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	XORLW 7
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m148
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m163
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m163
	XORLW 63
	BTFSC 0xFD8,Zero_,0
	BRA   m163
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m163
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m163
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m179
	XORLW 7
	BTFSC 0xFD8,Zero_,0
	BRA   m179
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m179
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	BRA   m179
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	BRA   m179
	XORLW 15
	BTFSC 0xFD8,Zero_,0
	GOTO  m239
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m240
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	GOTO  m241
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m242
	XORLW 7
	BTFSC 0xFD8,Zero_,0
	GOTO  m252
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m258
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	GOTO  m259
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m260
	XORLW 31
	BTFSC 0xFD8,Zero_,0
	GOTO  m261
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m262
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	GOTO  m263
	XORLW 1
	BTFSC 0xFD8,Zero_,0
	GOTO  m264
	GOTO  m265
			;	{
			;	case 1:			// VT code
			;		{
			;		lcd_goto(LINE2);
m121	MOVLW 192
	RCALL lcd_goto
			;		lcd_puts(Serial);
	MOVLW 142
	MOVWF s,0
	CLRF  s+1,0
	RCALL lcd_puts
			;		for(ind=0;ind<8;ind++)
	CLRF  ind,0
m122	MOVLW 8
	CPFSLT ind,0
	BRA   m123
			;			{
			;			retvalue = CODE[ind];
	MOVF  ind,W,0
	CALL  _const3
	MOVWF retvalue,0
			;			lcd_write(retvalue);
	RCALL lcd_write
			;			eadr++;
	INCF  eadr,1,0
			;			}
	INCF  ind,1,0
	BRA   m122
			;		ESCbut();
m123	CALL  ESCbut
			;		break;
	GOTO  m265
			;		}
			;	case 2:			// Button 1 Activ?
			;		{
			;		vEN1 = en_to_dis(vEN1,eEN1);
m124	MOVFF vEN1,ENbit
	MOVLW 246
	CALL  en_to_dis
	MOVWF vEN1,0
			;		ESCbut();
	CALL  ESCbut
			;		if(vEN1 && (cred1 != 0)) rem1 = 1;
	MOVF  vEN1,1,0
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 1
	MOVWF rem1,0
			;		break;
	GOTO  m265
			;		}
			;	case 3:			// Button 2 Activ?
			;		{
			;		vEN2 = en_to_dis(vEN2,eEN2);
m125	MOVFF vEN2,ENbit
	MOVLW 247
	CALL  en_to_dis
	MOVWF vEN2,0
			;		ESCbut();
	CALL  ESCbut
			;		if(vEN2 && (cred2 != 0)) rem2 = 1;
	MOVF  vEN2,1,0
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 1
	MOVWF rem2,0
			;		break;
	GOTO  m265
			;		}
			;	case 4:			// Button 3 Activ?
			;		{
			;		vEN3 = en_to_dis(vEN3,eEN3);
m126	MOVFF vEN3,ENbit
	MOVLW 198
	CALL  en_to_dis
	MOVWF vEN3,0
			;		ESCbut();
	CALL  ESCbut
			;		if(vEN3 && (cred3 != 0)) rem3 = 1;				
	MOVF  vEN3,1,0
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 1
	MOVWF rem3,0
			;		break;
	GOTO  m265
			;		}
			;	case 5:			// Button 4 Activ?
			;		{
			;		vEN4 = en_to_dis(vEN4,eEN4);
m127	MOVFF vEN4,ENbit
	MOVLW 199
	CALL  en_to_dis
	MOVWF vEN4,0
			;		ESCbut();
	CALL  ESCbut
			;		if(vEN4 && (cred4 != 0)) rem4 = 1;				
	MOVF  vEN4,1,0
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 1
	MOVWF rem4,0
			;		break;
	GOTO  m265
			;		}
			;	case 6:			// Button 6 Activ?
			;		{
			;		vEN6 = en_to_dis(vEN6,eEN6);
m128	MOVFF vEN6,ENbit
	MOVLW 200
	CALL  en_to_dis
	MOVWF vEN6,0
			;		ESCbut();
	CALL  ESCbut
			;		if(vEN6 && (cred6 != 0)) rem6 = 1;				
	MOVF  vEN6,1,0
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 1
	MOVWF rem6,0
			;		break;
	GOTO  m265
			;		}
			;	case 7:			// Test Relay 1
			;		{
			;		if(WORK != 1) test(1);
m129	DCFSNZ WORK,W,0
	GOTO  m265
	MOVLW 1
	CALL  test
			;		break;
	GOTO  m265
			;		}
			;	case 8:			// Test Relay 2
			;		{
			;		if(WORK != 2) test(2);	
m130	MOVF  WORK,W,0
	XORLW 2
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 2
	CALL  test
			;		break;
	GOTO  m265
			;		}
			;	case 9:			// Test Relay 3
			;		{
			;		if(WORK != 3) test(3);
m131	MOVF  WORK,W,0
	XORLW 3
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 3
	CALL  test
			;		break;
	GOTO  m265
			;		}
			;	case 10:			// Test Relay 4
			;		{
			;		if(WORK != 4) test(4);	
m132	MOVF  WORK,W,0
	XORLW 4
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 4
	CALL  test
			;		break;
	GOTO  m265
			;		}
			;	case 11:			// Test Relay 6
			;		{
			;		if(WORK != 6) test(6);	
m133	MOVF  WORK,W,0
	XORLW 6
	BTFSC 0xFD8,Zero_,0
	GOTO  m265
	MOVLW 6
	CALL  test
			;		break;
	GOTO  m265
			;		}
			;	case 12:		// Sale Channel 1
			;		{
			;		tot = total1;
m134	MOVFF total1,tot
	MOVFF total1+1,tot+1
	MOVFF total1+2,tot+2
			;		print_total();
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 13:		// Sale Channel 2
			;		{
			;		tot = total2;
m135	MOVFF total2,tot
	MOVFF total2+1,tot+1
	MOVFF total2+2,tot+2
			;		print_total();			
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 14:		// Sale Channel 3
			;		{
			;		tot = total3;
m136	MOVFF total3,tot
	MOVFF total3+1,tot+1
	MOVFF total3+2,tot+2
			;		print_total();
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 15:		// Sale Channel 4
			;		{
			;		tot = total4;
m137	MOVFF total4,tot
	MOVFF total4+1,tot+1
	MOVFF total4+2,tot+2
			;		print_total();			
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 16:		// Sale Channel 6
			;		{
			;		tot = total6;
m138	MOVFF total6,tot
	MOVFF total6+1,tot+1
	MOVFF total6+2,tot+2
			;		print_total();			
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 17:		// Sale All
			;		{
			;		tot = total1 + total2;
m139	MOVF  total2,W,1
	ADDWF total1,W,1
	MOVWF tot,1
	MOVF  total2+1,W,1
	ADDWFC total1+1,W,1
	MOVWF tot+1,1
	MOVF  total2+2,W,1
	ADDWFC total1+2,W,1
	MOVWF tot+2,1
			;		tot += total3;
	MOVF  total3,W,1
	ADDWF tot,1,1
	MOVF  total3+1,W,1
	ADDWFC tot+1,1,1
	MOVF  total3+2,W,1
	ADDWFC tot+2,1,1
			;		tot += total4;
	MOVF  total4,W,1
	ADDWF tot,1,1
	MOVF  total4+1,W,1
	ADDWFC tot+1,1,1
	MOVF  total4+2,W,1
	ADDWFC tot+2,1,1
			;		tot += total6;
	MOVF  total6,W,1
	ADDWF tot,1,1
	MOVF  total6+1,W,1
	ADDWFC tot+1,1,1
	MOVF  total6+2,W,1
	ADDWFC tot+2,1,1
			;		tot += overpay;
	MOVF  overpay,W,1
	ADDWF tot,1,1
	MOVF  overpay+1,W,1
	ADDWFC tot+1,1,1
	MOVF  overpay+2,W,1
	ADDWFC tot+2,1,1
			;		print_total();
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 18:		// Overpay
			;		{
			;		tot = overpay;
m140	MOVFF overpay,tot
	MOVFF overpay+1,tot+1
	MOVFF overpay+2,tot+2
			;		print_total();	
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 19:		//Total counter
			;		{
			;		tot = NONpay;
m141	MOVFF NONpay,tot
	MOVFF NONpay+1,tot+1
	MOVFF NONpay+2,tot+2
			;		print_total();
	RCALL print_total
			;		break;
	GOTO  m265
			;		}
			;	case 20:		// Clear STAT CH1
			;		{
			;		total1 = 0;
m142	CLRF  total1,1
	CLRF  total1+1,1
	CLRF  total1+2,1
			;		writeEEPROM(NULL,etotal1H); delay(10);
	CLRF  smb_2,0
	MOVLW 234
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal1M); delay(10);
	CLRF  smb_2,0
	MOVLW 235
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal1L); delay(10);	
	CLRF  smb_2,0
	MOVLW 236
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();
	RCALL st_clear
			;		break;
	GOTO  m265
			;		}
			;	case 21:		// Clear STAT CH2
			;		{
			;		total2 = 0;
m143	CLRF  total2,1
	CLRF  total2+1,1
	CLRF  total2+2,1
			;		writeEEPROM(NULL,etotal2H); delay(10);
	CLRF  smb_2,0
	MOVLW 237
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal2M); delay(10);
	CLRF  smb_2,0
	MOVLW 238
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal2L); delay(10);	
	CLRF  smb_2,0
	MOVLW 239
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();			
	RCALL st_clear
			;		break;
	GOTO  m265
			;		}
			;	case 22:		// Clear STAT CH3
			;		{
			;		total3 = 0;
m144	CLRF  total3,1
	CLRF  total3+1,1
	CLRF  total3+2,1
			;		writeEEPROM(NULL,etotal3H); delay(10);
	CLRF  smb_2,0
	MOVLW 202
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal3M); delay(10);
	CLRF  smb_2,0
	MOVLW 203
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal3L); delay(10);	
	CLRF  smb_2,0
	MOVLW 204
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();
	RCALL st_clear
			;		break;
	GOTO  m265
			;		}
			;	case 23:		// Clear STAT CH4
			;		{
			;		total4 = 0;
m145	CLRF  total4,1
	CLRF  total4+1,1
	CLRF  total4+2,1
			;		writeEEPROM(NULL,etotal4H); delay(10);
	CLRF  smb_2,0
	MOVLW 205
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal4M); delay(10);
	CLRF  smb_2,0
	MOVLW 206
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal4L); delay(10);	
	CLRF  smb_2,0
	MOVLW 207
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();			
	RCALL st_clear
			;		break;
	GOTO  m265
			;		}
			;	case 24:		// Clear STAT CH6
			;		{
			;		total6 = 0;
m146	CLRF  total6,1
	CLRF  total6+1,1
	CLRF  total6+2,1
			;		writeEEPROM(NULL,etotal6H); delay(10);
	CLRF  smb_2,0
	MOVLW 186
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal6M); delay(10);
	CLRF  smb_2,0
	MOVLW 187
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal6L); delay(10);	
	CLRF  smb_2,0
	MOVLW 188
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();			
	RCALL st_clear
			;		break;
	GOTO  m265
			;		}
			;	case 25:		// Clear All STAT
			;		{
			;		total1 = 0;
m147	CLRF  total1,1
	CLRF  total1+1,1
	CLRF  total1+2,1
			;		writeEEPROM(NULL,etotal1H); delay(10);
	CLRF  smb_2,0
	MOVLW 234
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal1M); delay(10);
	CLRF  smb_2,0
	MOVLW 235
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal1L); delay(10);
	CLRF  smb_2,0
	MOVLW 236
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		total2 = 0;
	CLRF  total2,1
	CLRF  total2+1,1
	CLRF  total2+2,1
			;		writeEEPROM(NULL,etotal2H); delay(10);
	CLRF  smb_2,0
	MOVLW 237
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal2M); delay(10);
	CLRF  smb_2,0
	MOVLW 238
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal2L); delay(10);
	CLRF  smb_2,0
	MOVLW 239
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		total3 = 0;
	CLRF  total3,1
	CLRF  total3+1,1
	CLRF  total3+2,1
			;		writeEEPROM(NULL,etotal3H); delay(10);
	CLRF  smb_2,0
	MOVLW 202
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal3M); delay(10);
	CLRF  smb_2,0
	MOVLW 203
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal3L); delay(10);
	CLRF  smb_2,0
	MOVLW 204
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		total4 = 0;
	CLRF  total4,1
	CLRF  total4+1,1
	CLRF  total4+2,1
			;		writeEEPROM(NULL,etotal4H); delay(10);
	CLRF  smb_2,0
	MOVLW 205
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal4M); delay(10);
	CLRF  smb_2,0
	MOVLW 206
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal4L); delay(10);
	CLRF  smb_2,0
	MOVLW 207
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		total6 = 0;
	CLRF  total6,1
	CLRF  total6+1,1
	CLRF  total6+2,1
			;		writeEEPROM(NULL,etotal6H); delay(10);
	CLRF  smb_2,0
	MOVLW 186
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal6M); delay(10);
	CLRF  smb_2,0
	MOVLW 187
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etotal6L); delay(10);
	CLRF  smb_2,0
	MOVLW 188
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		overpay = 0;
	CLRF  overpay,1
	CLRF  overpay+1,1
	CLRF  overpay+2,1
			;		writeEEPROM(NULL,eoverH); delay(10);
	CLRF  smb_2,0
	MOVLW 231
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,eoverM); delay(10);
	CLRF  smb_2,0
	MOVLW 232
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,eoverL); delay(10);
	CLRF  smb_2,0
	MOVLW 233
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();
	RCALL st_clear
			;		break;
	GOTO  m265
			;		}
			;	case 26:		// MMC/SD -> EEPROM   MOJE DA NE RABOTI
			;		{
			;/*		CardDetect();
			;		lcd_goto(LINE2);
			;		if(!card) lcd_puts(MMCerr);
			;		else
			;			{
			;			lcd_puts(Wait);
			;			MMC_Read(CONFIG_H,CONFIG_L);
			;			eadr = eeprom_start;
			;			for(index=0;index<256;index++)
			;				{
			;				retvalue = mmc[index];
			;				writeEEPROM(retvalue,eadr);
			;				delay(10);
			;				eadr ++;
			;				}
			;			lcd_goto(LINE2);
			;			lcd_puts(Ready);
			;			}
			;		Load();
			;		if(vBL) BLCTRL = 1;
			;		else BLCTRL = 0;
			;		ESCbut();
			;		break;    */
			;		}
			;	case 27:		// AUDIT -> MMC/SD		MOJE DA NE RABOTI
			;	case 28:		// EEPROM-> CONFIG		MOJE DA NE RABOTI
			;		{
			;		break;
			;		}
			;/*		{
			;		CardDetect();
			;		lcd_goto(LINE2);
			;		if(!card) lcd_puts(MMCerr);
			;		else
			;			{
			;			lcd_puts(Wait);
			;			if(point == 17) SecSearch();
			;			else
			;				{
			;				addr_H = CONFIG_H;
			;				addr_L = CONFIG_L;
			;				}
			;*/	//		vCounter ++;
			;//			writeEEPROM(vCounter.high8,eCounterH); delay(10);
			; /*			writeEEPROM(vCounter.low8,eCounterL); delay(10);
			;			eadr = eeprom_start;
			;			for(index=0;index<256;index++)
			;				{
			;				retvalue = readEEPROM(eadr);
			;				mmc[index] = retvalue;
			;				eadr ++;
			;				}
			;			for(index=256;index<503;index++) mmc[index] = NULL;
			;			ind = 0;
			;			for(index=504;index<512;index++)
			;				{
			;				retvalue = CODE[ind];
			;				mmc[index] = retvalue;
			;				ind ++;
			;				}
			;			retvalue = MMC_Write(addr_H,addr_L); delay(100);
			;			if(retvalue)
			;				{
			;				UpdateFAT(); delay(100);
			;				lcd_goto(LINE2);
			;				lcd_puts(Ready);
			;				}
			;			else
			;				{
			;				lcd_goto(LINE2);
			;				lcd_puts(MMCerr);
			;				}
			;			}
			;		ESCbut();
			;//		break; 		
			;		}     */
			;	case 29:		// Set coin table
			;		{
			;		for(ind=0;ind<3;ind++)
m148	CLRF  ind,0
m149	MOVLW 3
	CPFSLT ind,0
	BRA   m162
			;			{
			;			check = 0;
	CLRF  check,0
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			lcd_puts(Insert);
	MOVLW 151
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;			switch(ind)
	MOVF  ind,W,0
	BZ    m150
	XORLW 1
	BZ    m151
	XORLW 3
	BZ    m152
	BRA   m153
			;				{
			;				case 0:
			;					{
			;					lcd_write('T');
m150	MOVLW 84
	CALL  lcd_write
			;					lcd_write('o');
	MOVLW 111
	CALL  lcd_write
			;					lcd_write('k');
	MOVLW 107
	CALL  lcd_write
			;					lcd_write('e');
	MOVLW 101
	CALL  lcd_write
			;					lcd_write('n');
	MOVLW 110
	CALL  lcd_write
			;					lcd_write(' ');
	MOVLW 32
	CALL  lcd_write
			;					lcd_write('1');
	MOVLW 49
	CALL  lcd_write
			;					retvalue = readEEPROM(eOPA); delay(1);
	MOVLW 245
	CALL  readEEPROM
	MOVWF retvalue,0
	MOVLW 1
	CALL  delay
			;					break;
	BRA   m153
			;					}
			;				case 1:
			;					{
			;					lcd_write('T');
m151	MOVLW 84
	CALL  lcd_write
			;					lcd_write('o');
	MOVLW 111
	CALL  lcd_write
			;					lcd_write('k');
	MOVLW 107
	CALL  lcd_write
			;					lcd_write('e');
	MOVLW 101
	CALL  lcd_write
			;					lcd_write('n');
	MOVLW 110
	CALL  lcd_write
			;					lcd_write(' ');
	MOVLW 32
	CALL  lcd_write
			;					lcd_write('2');
	MOVLW 50
	CALL  lcd_write
			;					retvalue = readEEPROM(eOPB); delay(1);
	MOVLW 244
	CALL  readEEPROM
	MOVWF retvalue,0
	MOVLW 1
	CALL  delay
			;					break;
	BRA   m153
			;					}
			;				case 2:
			;					{
			;					lcd_write('T');
m152	MOVLW 84
	CALL  lcd_write
			;					lcd_write('o');
	MOVLW 111
	CALL  lcd_write
			;					lcd_write('k');
	MOVLW 107
	CALL  lcd_write
			;					lcd_write('e');
	MOVLW 101
	CALL  lcd_write
			;					lcd_write('n');
	MOVLW 110
	CALL  lcd_write
			;					lcd_write(' ');
	MOVLW 32
	CALL  lcd_write
			;					lcd_write('3');
	MOVLW 51
	CALL  lcd_write
			;					retvalue = readEEPROM(eOPC); delay(1);
	MOVLW 243
	CALL  readEEPROM
	MOVWF retvalue,0
	MOVLW 1
	CALL  delay
			;					break;
			;					}
			;		/*
			;				case 3:
			;					{
			;					lcd_write('2');
			;					lcd_write('0');
			;					retvalue = 20;
			;					break;
			;					}
			;				case 4:
			;					{
			;					lcd_write('5');
			;					lcd_write('0');
			;					retvalue = 50;
			;					break;
			;					}
			;				case 5:
			;					{
			;					lcd_write('1');
			;					lcd_write('0');
			;					lcd_write('0');
			;					retvalue = 100;
			;					break;
			;					}
			;	*/	
			;			}
			;			while(!check);
m153	MOVF  check,1,0
	BZ    m153
			;			check = 0;
	CLRF  check,0
			;			switch(sysB)
	MOVF  sysB,W,0
	XORLW 119
	BZ    m154
	XORLW 192
	BZ    m155
	XORLW 96
	BZ    m156
	XORLW 36
	BZ    m157
	XORLW 6
	BZ    m158
	XORLW 3
	BZ    m159
	XORLW 17
	BZ    m160
	BRA   m161
			;				{
			;				case 0x77:
			;					{
			;					writeEEPROM(retvalue,eOPA);
m154	MOVFF retvalue,smb_2
	MOVLW 245
	CALL  writeEEPROM
			;					delay(10);
	MOVLW 10
	CALL  delay
			;					break;
	BRA   m161
			;					}
			;				case 0xB7:
			;					{
			;					writeEEPROM(retvalue,eOPB);
m155	MOVFF retvalue,smb_2
	MOVLW 244
	CALL  writeEEPROM
			;					delay(10);
	MOVLW 10
	CALL  delay
			;					break;
	BRA   m161
			;					}
			;				case 0xD7:
			;					{
			;					writeEEPROM(retvalue,eOPC);
m156	MOVFF retvalue,smb_2
	MOVLW 243
	CALL  writeEEPROM
			;					delay(10);
	MOVLW 10
	CALL  delay
			;					break;
	BRA   m161
			;					}
			;				case 0xF3:
			;					{
			;					writeEEPROM(retvalue,eOPD);
m157	MOVFF retvalue,smb_2
	MOVLW 242
	CALL  writeEEPROM
			;					delay(10);
	MOVLW 10
	CALL  delay
			;					break;
	BRA   m161
			;					}
			;				case 0xF5:
			;					{
			;					writeEEPROM(retvalue,eOPE);
m158	MOVFF retvalue,smb_2
	MOVLW 241
	CALL  writeEEPROM
			;					delay(10);
	MOVLW 10
	CALL  delay
			;					break;
	BRA   m161
			;					}
			;				case 0xF6:
			;					{
			;					writeEEPROM(retvalue,eOPF);
m159	MOVFF retvalue,smb_2
	MOVLW 240
	CALL  writeEEPROM
			;					delay(10);
	MOVLW 10
	CALL  delay
			;					break;
	BRA   m161
			;					}
			;				case 0xE7:
			;					{		
			;					lcd_goto(LINE2);
m160	MOVLW 192
	CALL  lcd_goto
			;					lcd_puts(Error);
	MOVLW 10
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;					break;
			;					}
			;				}
			;			delay(250);
m161	MOVLW 250
	CALL  delay
			;			}
	INCF  ind,1,0
	BRA   m149
			;		check = 0;
m162	CLRF  check,0
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(Save);
	MOVLW 164
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 30:			// Read cred table 1
			;	case 31:			// Read cred table 2
			;	case 32:			// Read cred table 3
			;	case 33:			// Read cred table 4
			;	case 34:			// Read cred table 6
			;		{
			;		if(point == 30) eadr = eeprom_start;
m163	MOVLW 30
	CPFSEQ point,0
	BRA   m164
	CLRF  eadr,0
			;		if(point == 31) eadr = eeprom_start + 5;
m164	MOVLW 31
	CPFSEQ point,0
	BRA   m165
	MOVLW 5
	MOVWF eadr,0
			;		if(point == 32) eadr = eeprom_start + 0x60;
m165	MOVLW 32
	CPFSEQ point,0
	BRA   m166
	MOVLW 96
	MOVWF eadr,0
			;		if(point == 33) 
m166	MOVLW 33
	CPFSEQ point,0
	BRA   m167
			;			{
			;			eadr = eeprom_start + 0x60;
	MOVLW 96
	MOVWF eadr,0
			;			eadr = eadr + 5;
	MOVLW 5
	ADDWF eadr,1,0
			;			}
			;		if(point == 34) eadr = eeprom_start + 0x0B; 
m167	MOVLW 34
	CPFSEQ point,0
	BRA   m168
	MOVLW 11
	MOVWF eadr,0
			;		lcd_clear();		
m168	CALL  lcd_clear
			;		k = 0;
	CLRF  k,0
			;		esc = 1;
	MOVLW 1
	MOVWF esc,0
			;		while(esc)
m169	MOVF  esc,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m265
			;			{
			;			retvalue = readEEPROM(eadr);
	MOVF  eadr,W,0
	CALL  readEEPROM
	MOVWF retvalue,0
			;			credit = (uns16)retvalue * 100;
	MULLW 100
	MOVFF PRODL,credit
	MOVFF PRODH,credit+1
			;			retvalue = readEEPROM(eadr+1);
	INCF  eadr,W,0
	CALL  readEEPROM
	MOVWF retvalue,0
			;			credit += retvalue;
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(retvalue != 0xFF)
	INFSNZ retvalue,W,0
	BRA   m170
			;				{
			;				lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;				lcd_puts(Credit);
	MOVLW 17
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_credit();
	CALL  lcd_credit
			;				lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;				lcd_puts(Time);
	MOVLW 26
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				hour = readEEPROM(eadr+2);
	MOVLW 2
	ADDWF eadr,W,0
	CALL  readEEPROM
	MOVWF hour,0
			;				min  = readEEPROM(eadr+3);
	MOVLW 3
	ADDWF eadr,W,0
	CALL  readEEPROM
	MOVWF min,0
			;				sec  = readEEPROM(eadr+4);
	MOVLW 4
	ADDWF eadr,W,0
	CALL  readEEPROM
	MOVWF sec,0
			;				lcd_time();	
	CALL  lcd_time
			;				}
			;			else
	BRA   m173
			;				{
			;				lcd_goto(LINE2);
m170	MOVLW 192
	CALL  lcd_goto
			;				lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				while(ESC);	 delay(100);
m171	BTFSC 0xF83,ESC,0
	BRA   m171
	MOVLW 100
	CALL  delay
			;				while(!ESC); delay(100);
m172	BTFSS 0xF83,ESC,0
	BRA   m172
	MOVLW 100
	CALL  delay
			;				break;
	BRA   m265
			;				}
			;
			;			if(!DOWN)		// Press DOWN
m173	BTFSC 0xF83,DOWN,0
	BRA   m175
			;				{
			;				if(k<5)
	MOVLW 5
	CPFSLT k,0
	BRA   m174
			;					{
			;					retvalue = readEEPROM(eadr+0x10);
	MOVLW 16
	ADDWF eadr,W,0
	CALL  readEEPROM
	MOVWF retvalue,0
			;					if(retvalue != 0xFF) 
	INFSNZ retvalue,W,0
	BRA   m174
			;						{
			;						k ++;
	INCF  k,1,0
			;						eadr += 0x10;
	MOVLW 16
	ADDWF eadr,1,0
			;						}
			;					}
			;				while(!DOWN);
m174	BTFSS 0xF83,DOWN,0
	BRA   m174
			;				delay(100);
	MOVLW 100
	CALL  delay
			;				}
			;
			;			if(!UP)			// Press UP
m175	BTFSC 0xF83,UP,0
	BRA   m177
			;				{
			;				if(k > 0) 
	MOVF  k,1,0
	BZ    m176
			;					{
			;					k --;
	DECF  k,1,0
			;					eadr -= 0x10;
	MOVLW 16
	SUBWF eadr,1,0
			;					}
			;				while(!UP);
m176	BTFSS 0xF83,UP,0
	BRA   m176
			;				delay(100);
	MOVLW 100
	CALL  delay
			;				}
			;
			;			if(!ESC) 		// Press ESC
m177	BTFSC 0xF83,ESC,0
	BRA   m169
			;				{
			;				credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;				while(!ESC);
m178	BTFSS 0xF83,ESC,0
	BRA   m178
			;				esc = 0;
	CLRF  esc,0
			;				delay(100);
	MOVLW 100
	CALL  delay
			;				}	
			;			}
	BRA   m169
			;		break;
			;		}
			;	case 35:		// Set credit table 1
			;	case 36:		// Set credit table 2
			;	case 37:		// Set credit table 3
			;	case 38:		// Set credit table 4
			;	case 39:		// Set credit table 6
			;		{
			;		if(point == 35) eadr = eeprom_start;
m179	MOVLW 35
	CPFSEQ point,0
	BRA   m180
	CLRF  eadr,0
			;		if(point == 36) eadr = eeprom_start + 5;
m180	MOVLW 36
	CPFSEQ point,0
	BRA   m181
	MOVLW 5
	MOVWF eadr,0
			;		if(point == 37) eadr = eeprom_start + 0x60;
m181	MOVLW 37
	CPFSEQ point,0
	BRA   m182
	MOVLW 96
	MOVWF eadr,0
			;		if(point == 38) 
m182	MOVLW 38
	CPFSEQ point,0
	BRA   m183
			;			{
			;			eadr = eeprom_start + 0x60;
	MOVLW 96
	MOVWF eadr,0
			;			eadr = eadr + 5;
	MOVLW 5
	ADDWF eadr,1,0
			;			}
			;		if(point == 39) eadr = eeprom_start + 0x0B; //new
m183	MOVLW 39
	CPFSEQ point,0
	BRA   m184
	MOVLW 11
	MOVWF eadr,0
			;		for(ind=0;ind<5;ind++)
m184	CLRF  ind,0
m185	MOVLW 5
	CPFSLT ind,0
	BRA   m188
			;			{
			;			for(k=0;k<10;k++) 
	CLRF  k,0
m186	MOVLW 10
	CPFSLT k,0
	BRA   m187
			;				{
			;				writeEEPROM(0xFF,eadr+k); 
	SETF  smb_2,0
	MOVF  k,W,0
	ADDWF eadr,W,0
	CALL  writeEEPROM
			;				delay(10);
	MOVLW 10
	CALL  delay
			;				}
	INCF  k,1,0
	BRA   m186
			;			eadr += 0x10;
m187	MOVLW 16
	ADDWF eadr,1,0
			;			}
	INCF  ind,1,0
	BRA   m185
			;		delay(100);
m188	MOVLW 100
	CALL  delay
			;		lcd_setup(1);
	MOVLW 1
	CALL  lcd_setup
			;		for(ind=0;ind<5;ind++)
	CLRF  ind,0
m189	MOVLW 5
	CPFSLT ind,0
	BRA   m236
			;			{
			;			lcd_clear();
	CALL  lcd_clear
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(Cont);
	MOVLW 44
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			while(1)
			;				{
			;				if(!ESC) 
m190	BTFSC 0xF83,ESC,0
	BRA   m192
			;					{
			;					esc = 1;
	MOVLW 1
	MOVWF esc,0
			;					while(!ESC);
m191	BTFSS 0xF83,ESC,0
	BRA   m191
			;					delay(100);
	MOVLW 100
	CALL  delay
			;					break;
	BRA   m194
			;					}
			;				if(!ENTER)
m192	BTFSC 0xF83,ENTER,0
	BRA   m190
			;					{
			;					esc = 0;
	CLRF  esc,0
			;					while(!ENTER);
m193	BTFSS 0xF83,ENTER,0
	BRA   m193
			;					delay(100);
	MOVLW 100
	CALL  delay
			;					break;
			;					}
			;				}
			;			if(esc) break;
m194	TSTFSZ esc,0
	BRA   m236
			;			retvalue = 0;
	CLRF  retvalue,0
			;			if(point == 35) eadr = ind * 16;
	MOVLW 35
	CPFSEQ point,0
	BRA   m195
	MOVLW 16
	MULWF ind,0
	MOVFF PRODL,eadr
			;	 		if(point == 36) eadr = ind * 16 + 5;
m195	MOVLW 36
	CPFSEQ point,0
	BRA   m196
	MOVLW 16
	MULWF ind,0
	MOVF  PRODL,W,0
	ADDLW 5
	MOVWF eadr,0
			;			if(point == 37) eadr = ind * 16 + 0x60;
m196	MOVLW 37
	CPFSEQ point,0
	BRA   m197
	MOVLW 16
	MULWF ind,0
	MOVF  PRODL,W,0
	ADDLW 96
	MOVWF eadr,0
			;			if(point == 38) 
m197	MOVLW 38
	CPFSEQ point,0
	BRA   m198
			;			{
			;			eadr = ind * 16 + 0x60;
	MOVLW 16
	MULWF ind,0
	MOVF  PRODL,W,0
	ADDLW 96
	MOVWF eadr,0
			;			eadr = eadr + 5;
	MOVLW 5
	ADDWF eadr,1,0
			;			}
			;			if(point == 39) eadr = ind * 16 + 0x0B; //new
m198	MOVLW 39
	CPFSEQ point,0
	BRA   m199
	MOVLW 16
	MULWF ind,0
	MOVF  PRODL,W,0
	ADDLW 11
	MOVWF eadr,0
			;
			;	//		if(point == 23) eadr = ind * 16;
			;	//		else eadr = ind * 16 + 5;
			;			lcd_clear();
m199	CALL  lcd_clear
			;			lcd_adr = LINE1 + 8;
	MOVLW 136
	MOVWF lcd_adr,0
			;			credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;			hour = 0;
	CLRF  hour,0
			;			min = 0;
	CLRF  min,0
			;			sec = 0;
	CLRF  sec,0
			;			change = 1;
	MOVLW 1
	MOVWF change,0
			;			k = 0;
	CLRF  k,0
			;			dmax = 9;
	MOVLW 9
	MOVWF dmax,0
			;
			;			while(k<10)
m200	MOVLW 10
	CPFSLT k,0
	BRA   m235
			;				{
			;				if(change) 
	MOVF  change,1,0
	BZ    m201
			;					{
			;					lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;					lcd_puts(Credit);
	MOVLW 17
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;					lcd_credit();
	CALL  lcd_credit
			;					lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;					lcd_puts(Time);
	MOVLW 26
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;					lcd_time();
	CALL  lcd_time
			;					lcd_goto(lcd_adr);
	MOVF  lcd_adr,W,0
	CALL  lcd_goto
			;					change = 0;
	CLRF  change,0
			;					}
			;
			;				if(!ENTER)
m201	BTFSC 0xF83,ENTER,0
	BRA   m209
			;					{
			;					while(!ENTER);
m202	BTFSS 0xF83,ENTER,0
	BRA   m202
			;					delay(100);
	MOVLW 100
	CALL  delay
			;					k ++;
	INCF  k,1,0
			;					digit = 0;
	CLRF  digit,0
			;					change = 1;
	MOVLW 1
	MOVWF change,0
			;					if((lcd_adr==0x89) || (lcd_adr==0xC7) || (lcd_adr==0xCA)) lcd_adr ++;
	MOVF  lcd_adr,W,0
	XORLW 137
	BZ    m203
	MOVF  lcd_adr,W,0
	XORLW 199
	BZ    m203
	MOVLW 202
	CPFSEQ lcd_adr,0
	BRA   m204
m203	INCF  lcd_adr,1,0
			;					if(lcd_adr==0x8C) lcd_adr = LINE2 + 5;	
m204	MOVLW 140
	CPFSEQ lcd_adr,0
	BRA   m205
	MOVLW 197
	MOVWF lcd_adr,0
			;					if(lcd_adr==0xCD)
m205	MOVLW 205
	CPFSEQ lcd_adr,0
	BRA   m206
			;						{
			;						writeEEPROM(lev,eadr);		delay(10);
	MOVFF lev,smb_2
	MOVF  eadr,W,0
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;						writeEEPROM(stot,eadr+1);	delay(10);
	MOVFF stot,smb_2
	INCF  eadr,W,0
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;						writeEEPROM(hour,eadr+2);	delay(10);
	MOVFF hour,smb_2
	MOVLW 2
	ADDWF eadr,W,0
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;						writeEEPROM(min,eadr+3);	delay(10);
	MOVFF min,smb_2
	MOVLW 3
	ADDWF eadr,W,0
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;						writeEEPROM(sec,eadr+4);	delay(10);
	MOVFF sec,smb_2
	MOVLW 4
	ADDWF eadr,W,0
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;						}
			;					lcd_adr ++;
m206	INCF  lcd_adr,1,0
			;					if((lcd_adr==0xC9) || (lcd_adr==0xCC)) dmax = 5;
	MOVF  lcd_adr,W,0
	XORLW 201
	BZ    m207
	MOVLW 204
	CPFSEQ lcd_adr,0
	BRA   m208
m207	MOVLW 5
	MOVWF dmax,0
			;					else dmax = 9;
	BRA   m209
m208	MOVLW 9
	MOVWF dmax,0
			;					}	// end if(ENTER)
			;
			;				if(!UP)
m209	BTFSC 0xF83,UP,0
	BRA   m222
			;					{
			;					if(digit < dmax) 
	MOVF  dmax,W,0
	CPFSLT digit,0
	BRA   m210
			;						{
			;						digit ++;
	INCF  digit,1,0
			;						change = 1;
	MOVLW 1
	MOVWF change,0
			;						}
			;					else change = 0;
	BRA   m211
m210	CLRF  change,0
			;					while(!UP);
m211	BTFSS 0xF83,UP,0
	BRA   m211
			;					delay(100);
	MOVLW 100
	CALL  delay
			;					if(change)
	MOVF  change,1,0
	BZ    m222
			;						{
			;						switch(lcd_adr)
	MOVF  lcd_adr,W,0
	XORLW 136
	BZ    m212
	XORLW 1
	BZ    m213
	XORLW 2
	BZ    m214
	XORLW 7
	BZ    m215
	XORLW 74
	BZ    m216
	XORLW 1
	BZ    m217
	XORLW 14
	BZ    m218
	XORLW 3
	BZ    m219
	XORLW 6
	BZ    m220
	XORLW 1
	BZ    m221
	BRA   m222
			;							{
			;							case 0x88:
			;								{
			;								credit += 1000;
m212	MOVLW 232
	ADDWF credit,1,1
	MOVLW 3
	ADDWFC credit+1,1,1
			;								break;
	BRA   m222
			;								}
			;							case 0x89:
			;								{
			;								credit += 100;
m213	MOVLW 100
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;								break;
	BRA   m222
			;								}
			;							case 0x8B:
			;								{
			;								credit += 10;
m214	MOVLW 10
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;								break;
	BRA   m222
			;								}
			;							case 0x8C:
			;								{
			;								credit ++;
m215	INCF  credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;								break;
	BRA   m222
			;								}
			;							case 0xC6:
			;								{
			;								hour += 10;
m216	MOVLW 10
	ADDWF hour,1,0
			;								break;
	BRA   m222
			;								}
			;							case 0xC7:
			;								{
			;								hour ++;
m217	INCF  hour,1,0
			;								break;
	BRA   m222
			;								}
			;							case 0xC9:
			;								{
			;								min += 10;
m218	MOVLW 10
	ADDWF min,1,0
			;								break;
	BRA   m222
			;								}
			;							case 0xCA:
			;								{
			;								min ++;
m219	INCF  min,1,0
			;								break;
	BRA   m222
			;								}
			;							case 0xCC:
			;								{
			;								sec += 10;
m220	MOVLW 10
	ADDWF sec,1,0
			;								break;
	BRA   m222
			;								}
			;							case 0xCD:
			;								{
			;								sec ++;
m221	INCF  sec,1,0
			;								break;
			;								}
			;							}	// end switch(lcd_adr)
			;						}	// end if
			;					}	// end if(UP)
			;
			;				if(!DOWN)
m222	BTFSC 0xF83,DOWN,0
	BRA   m200
			;					{
			;					if(digit > 0) 
	MOVF  digit,1,0
	BZ    m223
			;						{
			;						digit --;
	DECF  digit,1,0
			;						change = 1;
	MOVLW 1
	MOVWF change,0
			;						}
			;					else change = 0;
	BRA   m224
m223	CLRF  change,0
			;					while(!DOWN);
m224	BTFSS 0xF83,DOWN,0
	BRA   m224
			;					delay(100);
	MOVLW 100
	CALL  delay
			;					if(change)
	MOVF  change,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m200
			;						{
			;						switch(lcd_adr)
	MOVF  lcd_adr,W,0
	XORLW 136
	BZ    m225
	XORLW 1
	BZ    m226
	XORLW 2
	BZ    m227
	XORLW 7
	BZ    m228
	XORLW 74
	BZ    m229
	XORLW 1
	BZ    m230
	XORLW 14
	BZ    m231
	XORLW 3
	BZ    m232
	XORLW 6
	BZ    m233
	XORLW 1
	BZ    m234
	BRA   m200
			;							{
			;							case 0x88:
			;								{
			;								credit -= 1000;
m225	MOVLW 232
	SUBWF credit,1,1
	MOVLW 3
	SUBWFB credit+1,1,1
			;								break;
	BRA   m200
			;								}
			;							case 0x89:
			;								{
			;								credit -= 100;
m226	MOVLW 100
	SUBWF credit,1,1
	MOVLW 0
	SUBWFB credit+1,1,1
			;								break;
	BRA   m200
			;								}
			;							case 0x8B:
			;								{
			;								credit -= 10;
m227	MOVLW 10
	SUBWF credit,1,1
	MOVLW 0
	SUBWFB credit+1,1,1
			;								break;
	BRA   m200
			;								}
			;							case 0x8C:
			;								{
			;								credit --;
m228	DECF  credit,1,1
	MOVLW 0
	SUBWFB credit+1,1,1
			;								break;
	BRA   m200
			;								}
			;							case 0xC6:
			;								{
			;								hour -= 10;
m229	MOVLW 10
	SUBWF hour,1,0
			;								break;
	BRA   m200
			;								}
			;							case 0xC7:
			;								{
			;								hour --;
m230	DECF  hour,1,0
			;								break;
	BRA   m200
			;								}
			;							case 0xC9:
			;								{
			;								min -= 10;
m231	MOVLW 10
	SUBWF min,1,0
			;								break;
	BRA   m200
			;								}
			;							case 0xCA:
			;								{
			;								min --;
m232	DECF  min,1,0
			;								break;
	BRA   m200
			;								}
			;							case 0xCC:
			;								{
			;								sec -= 10;
m233	MOVLW 10
	SUBWF sec,1,0
			;								break;
	BRA   m200
			;								}
			;							case 0xCD:
			;								{
			;								sec --;
m234	DECF  sec,1,0
			;								break;
	BRA   m200
			;								}
			;							}	// end switch(lcd_adr)
			;						}	// end if(change)
			;					}	// end if(DOWN) 
			;				}	// end while(k)
			;			}	// end for(ind)
m235	INCF  ind,1,0
	BRA   m189
			;		delay(100);
m236	MOVLW 100
	CALL  delay
			;		lcd_setup(0);
	MOVLW 0
	CALL  lcd_setup
			;		lcd_clear();
	CALL  lcd_clear
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		while(!ESC); delay(100);
m237	BTFSS 0xF83,ESC,0
	BRA   m237
	MOVLW 100
	CALL  delay
			;		while(!ENTER); delay(100);
m238	BTFSS 0xF83,ENTER,0
	BRA   m238
	MOVLW 100
	CALL  delay
			;		break;
	BRA   m265
			;		}
			;	case 40:		// Inhibit settings
			;		{
			;		vINH = en_to_dis(vINH,eINH);
m239	MOVFF vINH,ENbit
	MOVLW 255
	RCALL en_to_dis
	MOVWF vINH,0
			;		break;
	BRA   m265
			;		}
			;	case 41:		// Start settings
			;		{
			;		vComm = en_to_dis(vComm,eComm);
m240	MOVFF vComm,ENbit
	MOVLW 254
	RCALL en_to_dis
	MOVWF vComm,0
			;		break;
	BRA   m265
			;		}
			;	case 42:		// BL settings
			;		{
			;		vBL = en_to_dis(vBL,eBL);
m241	MOVFF vBL,ENbit
	MOVLW 251
	RCALL en_to_dis
	MOVWF vBL,0
			;		break;
	BRA   m265
			;		}
			;	case 43:		// AUTOSTART value 
			;		{
			;		change = 1;
m242	MOVLW 1
	MOVWF change,0
			;		while(1)
			;			{
			;			if(change)
m243	MOVF  change,1,0
	BZ    m244
			;				{
			;				change = 0;
	CLRF  change,0
			;				hour = 0;
	CLRF  hour,0
			;				min = vAUTOSTART / 60;
	MOVFF vAUTOSTART,arg1
	CLRF  arg1+1,0
	MOVLW 60
	CALL  _divU16_8
	MOVFF arg1,min
			;				sec = vAUTOSTART % 60;
	MOVFF vAUTOSTART,arg1_5
	CLRF  arg1_5+1,0
	MOVLW 60
	CALL  _remU16_8
	MOVWF sec,0
			;				lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;				lcd_puts(Time);
	MOVLW 26
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_time();
	CALL  lcd_time
			;				}
			;			if(!DOWN)
m244	BTFSC 0xF83,DOWN,0
	BRA   m246
			;				{
			;				if(vAUTOSTART > 0) 
	MOVF  vAUTOSTART,1,0
	BZ    m245
			;					{
			;					vAUTOSTART --;
	DECF  vAUTOSTART,1,0
			;					change = 1;
	MOVLW 1
	MOVWF change,0
			;					}
			;				while(!DOWN);
m245	BTFSS 0xF83,DOWN,0
	BRA   m245
			;				delay(100);
	MOVLW 100
	CALL  delay
			;				}
			;			if(!UP)
m246	BTFSC 0xF83,UP,0
	BRA   m248
			;				{
			;				if(vAUTOSTART < 240) 
	MOVLW 240
	CPFSLT vAUTOSTART,0
	BRA   m247
			;					{
			;					vAUTOSTART ++;
	INCF  vAUTOSTART,1,0
			;					change = 1;
	MOVLW 1
	MOVWF change,0
			;					}
			;				while(!UP);
m247	BTFSS 0xF83,UP,0
	BRA   m247
			;				delay(100);
	MOVLW 100
	CALL  delay
			;				}
			;			if(!ENTER)
m248	BTFSC 0xF83,ENTER,0
	BRA   m250
			;				{
			;				writeEEPROM(vAUTOSTART,eAUTOSTART);
	MOVFF vAUTOSTART,smb_2
	MOVLW 223
	CALL  writeEEPROM
			;				while(!ENTER);
m249	BTFSS 0xF83,ENTER,0
	BRA   m249
			;				delay(100);
	MOVLW 100
	CALL  delay
			;				lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;				lcd_puts(Save);
	MOVLW 164
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				break;
	BRA   m251
			;				}
			;			if(!ESC) break;
m250	BTFSC 0xF83,ESC,0
	BRA   m243
			;			}
			;		ESCbut();
m251	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 44:		// Error log
			;		{
			;		lcd_clear();
m252	CALL  lcd_clear
			;		if(err1)
	MOVF  err1,1,0
	BZ    m253
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(Chan1);
	MOVLW 61
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			lcd_puts(Error);
	MOVLW 10
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			ESCbut();
	CALL  ESCbut
			;			}
			;		if(err2)
m253	MOVF  err2,1,0
	BZ    m254
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(Chan2);
	MOVLW 73
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			lcd_puts(Error);
	MOVLW 10
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			ESCbut();
	CALL  ESCbut
			;			}
			;		if(err3)
m254	MOVF  err3,1,0
	BZ    m255
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(Chan3);
	MOVLW 85
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			lcd_puts(Error);
	MOVLW 10
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			ESCbut();
	CALL  ESCbut
			;			}
			;		if(err4)
m255	MOVF  err4,1,0
	BZ    m256
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(Chan4);
	MOVLW 97
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			lcd_puts(Error);
	MOVLW 10
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			ESCbut();
	CALL  ESCbut
			;			}
			;		if(err6)
m256	MOVF  err6,1,0
	BZ    m257
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(Chan6);
	MOVLW 109
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			lcd_puts(Error);
	MOVLW 10
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			ESCbut();
	CALL  ESCbut
			;			}
			;		if(!err1 && !err2 && !err3 && !err4 && !err6)
m257	TSTFSZ err1,0
	BRA   m265
	TSTFSZ err2,0
	BRA   m265
	TSTFSZ err3,0
	BRA   m265
	TSTFSZ err4,0
	BRA   m265
	TSTFSZ err6,0
	BRA   m265
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts(nError);
	MOVLW 27
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			ESCbut();
	CALL  ESCbut
			;			}
			;		break;
	BRA   m265
			;		}
			;	case 45:		// Clear Error log
			;		{
			;		err1 = 0;
m258	CLRF  err1,0
			;		err2 = 0;
	CLRF  err2,0
			;		err3 = 0;
	CLRF  err3,0
			;		err4 = 0;
	CLRF  err4,0
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 46:		// Clear credit 1
			;		{
			;		cred1 = 0;
m259	CLRF  cred1,1
	CLRF  cred1+1,1
	CLRF  cred1+2,1
			;//		REL1_OFF();
			;		writeEEPROM(NULL,etime1H); delay(10);
	CLRF  smb_2,0
	MOVLW 224
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etime1M);  delay(10);
	CLRF  smb_2,0
	MOVLW 225
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 47:		// clear credit 2
			;		{
			;		cred2 = 0;
m260	CLRF  cred2,1
	CLRF  cred2+1,1
	CLRF  cred2+2,1
			;//		REL2_OFF();
			;		writeEEPROM(NULL,etime2H); delay(10);
	CLRF  smb_2,0
	MOVLW 226
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etime2M);  delay(10);
	CLRF  smb_2,0
	MOVLW 227
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 48:		// Clear credit 3
			;		{
			;		cred3 = 0;
m261	CLRF  cred3,1
	CLRF  cred3+1,1
	CLRF  cred3+2,1
			;//		REL3_OFF();
			;		writeEEPROM(NULL,etime3H); delay(10);
	CLRF  smb_2,0
	MOVLW 192
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etime3M);  delay(10);
	CLRF  smb_2,0
	MOVLW 193
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 49:		// clear credit 4
			;		{
			;		cred4 = 0;
m262	CLRF  cred4,1
	CLRF  cred4+1,1
	CLRF  cred4+2,1
			;//		REL4_OFF();
			;		writeEEPROM(NULL,etime4H); delay(10);
	CLRF  smb_2,0
	MOVLW 194
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etime4M);  delay(10);
	CLRF  smb_2,0
	MOVLW 195
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 50:		// clear credit 6
			;		{
			;		cred6 = 0;
m263	CLRF  cred6,1
	CLRF  cred6+1,1
	CLRF  cred6+2,1
			;//		REL4_OFF();
			;		writeEEPROM(NULL,etime6H); delay(10);
	CLRF  smb_2,0
	MOVLW 196
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,etime6M);  delay(10);
	CLRF  smb_2,0
	MOVLW 197
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(CLEAR);
	MOVLW 127
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		ESCbut();
	CALL  ESCbut
			;		break;
	BRA   m265
			;		}
			;	case 51:		// clear overpay
			;		{
			;		overpay = 0;
m264	CLRF  overpay,1
	CLRF  overpay+1,1
	CLRF  overpay+2,1
			;		writeEEPROM(NULL,eoverH); delay(10);
	CLRF  smb_2,0
	MOVLW 231
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,eoverM); delay(10);
	CLRF  smb_2,0
	MOVLW 232
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NULL,eoverL); delay(10);	
	CLRF  smb_2,0
	MOVLW 233
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		st_clear();
	CALL  st_clear
			;		break;
			;		}
			;	default: break;
			;	}
			;}
m265	RETURN
			;
			;/*-----------------------------------------------------*/
			;
			;char en_to_dis(char ENbit,uns8 ENaddr)
			;{
en_to_dis
	MOVWF ENaddr,0
			;char new_value;
			;
			;new_value = ENbit;
	MOVFF ENbit,new_value
			;lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;if(ENbit) lcd_puts(EN);
	MOVF  ENbit,1,0
	BZ    m266
	MOVLW 232
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;else lcd_puts(DIS);
	BRA   m267
m266	MOVLW 249
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;SECcount = 0;
m267	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;while(SECcount < 30)
m268	MOVF  SECcount+1,W,1
	BNZ   m272
	MOVLW 30
	CPFSLT SECcount,1
	BRA   m272
			;	{
			;	if(!ENTER) 
	BTFSC 0xF83,ENTER,0
	BRA   m271
			;		{
			;		new_value ^= 1;
	MOVLW 1
	XORWF new_value,1,0
			;		writeEEPROM(new_value,ENaddr); 
	MOVFF new_value,smb_2
	MOVF  ENaddr,W,0
	CALL  writeEEPROM
			;		delay(10);
	MOVLW 10
	CALL  delay
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		if(new_value) lcd_puts(Enable);
	MOVF  new_value,1,0
	BZ    m269
	MOVLW 198
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		else lcd_puts(Disable);
	BRA   m270
m269	MOVLW 215
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		while(!ENTER);	delay(100);
m270	BTFSS 0xF83,ENTER,0
	BRA   m270
	MOVLW 100
	CALL  delay
			;		break;
	BRA   m272
			;		}
			;	if(!ESC) break;
m271	BTFSC 0xF83,ESC,0
	BRA   m268
			;	}
			;return (new_value);
m272	MOVF  new_value,W,0
	RETURN
			;}
			;
			;/*-----------------------------------------------------*/
			;
			;void test(char en)
			;{
test
	MOVWF en,0
			;if(en == 1)
	DECFSZ en,W,0
	BRA   m273
			;	{
			;	cred1 = 30;
	MOVLW 30
	MOVWF cred1,1
	CLRF  cred1+1,1
	CLRF  cred1+2,1
			;	REL1_ON();
	CALL  REL1_ON
			;	}
			;if(en == 2)
m273	MOVLW 2
	CPFSEQ en,0
	BRA   m274
			;	{
			;	cred2 = 30;
	MOVLW 30
	MOVWF cred2,1
	CLRF  cred2+1,1
	CLRF  cred2+2,1
			;	REL2_ON();
	CALL  REL2_ON
			;	}
			;if(en == 3)
m274	MOVLW 3
	CPFSEQ en,0
	BRA   m275
			;	{
			;	cred3 = 30;
	MOVLW 30
	MOVWF cred3,1
	CLRF  cred3+1,1
	CLRF  cred3+2,1
			;	REL3_ON();
	CALL  REL3_ON
			;	}
			;if(en == 4)
m275	MOVLW 4
	CPFSEQ en,0
	BRA   m276
			;	{
			;	cred4 = 30;
	MOVLW 30
	MOVWF cred4,1
	CLRF  cred4+1,1
	CLRF  cred4+2,1
			;	REL4_ON();
	CALL  REL4_ON
			;	}
			;if(en == 6)
m276	MOVLW 6
	CPFSEQ en,0
	BRA   m277
			;	{
			;	cred6 = 30;
	MOVLW 30
	MOVWF cred6,1
	CLRF  cred6+1,1
	CLRF  cred6+2,1
			;	REL6_ON();
	CALL  REL6_ON
			;	}
			;lcd_goto(LINE1);
m277	MOVLW 128
	CALL  lcd_goto
			;lcd_puts(TESTS);
	MOVLW 93
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;while((cred1 > 0) || (cred2 > 0) || (cred3 > 0) || (cred4 > 0) || (cred6 > 0))
m278	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BNZ   m279
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BNZ   m279
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BNZ   m279
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BNZ   m279
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m285
			;	{
			;	lcd_goto(LINE2);
m279	MOVLW 192
	CALL  lcd_goto
			;	if(en == 1) 
	DECFSZ en,W,0
	BRA   m280
			;		{
			;		conv(cred1);
	MOVFF cred1,pr
	MOVFF cred1+1,pr+1
	MOVFF cred1+2,pr+2
	CALL  conv
			;		lcd_puts(Time1);
	MOVLW 33
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		}
			;	if(en == 2)
m280	MOVLW 2
	CPFSEQ en,0
	BRA   m281
			;		{
			;		conv(cred2);
	MOVFF cred2,pr
	MOVFF cred2+1,pr+1
	MOVFF cred2+2,pr+2
	CALL  conv
			;		lcd_puts(Time2);
	MOVLW 41
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		}
			;	if(en == 3) 
m281	MOVLW 3
	CPFSEQ en,0
	BRA   m282
			;		{
			;		conv(cred3);
	MOVFF cred3,pr
	MOVFF cred3+1,pr+1
	MOVFF cred3+2,pr+2
	CALL  conv
			;		lcd_puts(Time3);
	MOVLW 49
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		}
			;	if(en == 4)
m282	MOVLW 4
	CPFSEQ en,0
	BRA   m283
			;		{
			;		conv(cred4);
	MOVFF cred4,pr
	MOVFF cred4+1,pr+1
	MOVFF cred4+2,pr+2
	CALL  conv
			;		lcd_puts(Time4);
	MOVLW 57
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		}
			;	if(en == 6)
m283	MOVLW 6
	CPFSEQ en,0
	BRA   m284
			;		{
			;		conv(cred6);
	MOVFF cred6,pr
	MOVFF cred6+1,pr+1
	MOVFF cred6+2,pr+2
	CALL  conv
			;		lcd_puts(Time6);
	MOVLW 65
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		}
			;	lcd_time();
m284	CALL  lcd_time
			;	delay(100);
	MOVLW 100
	CALL  delay
			;	if(!ESC) break;
	BTFSC 0xF83,ESC,0
	BRA   m278
			;	}
			;if(en == 1)  
m285	DECFSZ en,W,0
	BRA   m286
			;	{
			;	REL_OFF();
	CALL  REL_OFF
			;	cred1 = 0;
	CLRF  cred1,1
	CLRF  cred1+1,1
	CLRF  cred1+2,1
			;	}
			;if(en == 2)
m286	MOVLW 2
	CPFSEQ en,0
	BRA   m287
			;	{
			;	REL_OFF();
	CALL  REL_OFF
			;	cred2 = 0;
	CLRF  cred2,1
	CLRF  cred2+1,1
	CLRF  cred2+2,1
			;	}
			;if(en == 3)  
m287	MOVLW 3
	CPFSEQ en,0
	BRA   m288
			;	{
			;	REL_OFF();
	CALL  REL_OFF
			;	cred3 = 0;
	CLRF  cred3,1
	CLRF  cred3+1,1
	CLRF  cred3+2,1
			;	}
			;if(en == 4)
m288	MOVLW 4
	CPFSEQ en,0
	BRA   m289
			;	{
			;	REL_OFF();
	CALL  REL_OFF
			;	cred4 = 0;
	CLRF  cred4,1
	CLRF  cred4+1,1
	CLRF  cred4+2,1
			;	}
			;if(en == 6)
m289	MOVLW 6
	CPFSEQ en,0
	BRA   m290
			;	{
			;	REL_OFF();
	CALL  REL_OFF
			;	cred6 = 0;
	CLRF  cred6,1
	CLRF  cred6+1,1
	CLRF  cred6+2,1
			;	}
			;lcd_goto(LINE1);
m290	MOVLW 128
	CALL  lcd_goto
			;lcd_puts(TESTF);
	MOVLW 110
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;lcd_puts(NOTH);
	MOVLW 181
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;ESCbut();
	GOTO  ESCbut
			;}

  ; FILE system.c
			;#include "int18xxx.h"
			;#include <defs.h>
			;#include <config.h>
			;#include <print.h>
			;#include <interrupt.h>
			;#include <spi.h>
			;#include <pc.h>
			;#include <math16.h>
			;#include <functions.h>
			;//#include <mmc.h>
			;//#include <fat16.h>
			;#include <eeprom.h>
			;#include <lcd.h>
			;#include <menu.h>
			;
			;void main(void)
			;{
main
			;uns8 pp;
			;uns16 val_tmp;
			;uns16 x2_tmp;
			;uns8 pause_flag;
			;
			;clearRAM();						// clear RAM
	LFSR  0,0 
	MOVLW 6
	MOVLB 0
m291	CLRF  POSTINC0,0
	CPFSEQ FSR0H,0
	BRA   m291
			;SYSTEM_setup();delay(100);		// system config
	CALL  SYSTEM_setup
	MOVLW 100
	CALL  delay
			;// uart(); delay(100);				// uart ini 
			;SPI_setup(); delay(100);		// spi ini
	CALL  SPI_setup
	MOVLW 100
	CALL  delay
			;lcd_setup(0); delay(100);		// LCD ini routine
	MOVLW 0
	CALL  lcd_setup
	MOVLW 100
	CALL  delay
			;lcd_clear();			
	CALL  lcd_clear
			;start_int();					// Start interrupts
	CALL  start_int
			;Load();							// Load epprom values
	CALL  Load
			;ini();							// Load ini values
	CALL  ini
			;pause = 0;
	CLRF  pause,0
			;WORK = 0;
	CLRF  WORK,0
			;pause_flag = 0;
	CLRF  pause_flag,0
			;OUT_PC = 1;
	BSF   0xF82,OUT_PC,0
			;PC = 0;							//1 - ON PC comunication; 0 - OFF PC comunication
	CLRF  PC,0
			;//if(vBL) BLCTRL = 1;
			;//else BLCTRL = 0;
			;
			;lcd_clear();
	CALL  lcd_clear
			;lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;lcd_puts(Welc);
	CLRF  s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//lcd_goto(LINE2);
			;//lcd_puts(NOTH);
			;lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;lcd_puts_cyr(Ready_cyr);
	MOVLW 85
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;
			;if(vComm != 0) 
	MOVF  vComm,1,0
	BZ    m296
			;	{
			;	if(vEN1) cred1 = vAUTOSTART;
	MOVF  vEN1,1,0
	BZ    m292
	MOVFF vAUTOSTART,cred1
	CLRF  cred1+1,1
	CLRF  cred1+2,1
			;	if(vEN2) cred2 = vAUTOSTART;
m292	MOVF  vEN2,1,0
	BZ    m293
	MOVFF vAUTOSTART,cred2
	CLRF  cred2+1,1
	CLRF  cred2+2,1
			;	if(vEN3) cred3 = vAUTOSTART;
m293	MOVF  vEN3,1,0
	BZ    m294
	MOVFF vAUTOSTART,cred3
	CLRF  cred3+1,1
	CLRF  cred3+2,1
			;	if(vEN4) cred4 = vAUTOSTART;
m294	MOVF  vEN4,1,0
	BZ    m295
	MOVFF vAUTOSTART,cred4
	CLRF  cred4+1,1
	CLRF  cred4+2,1
			;	if(vEN6) cred6 = vAUTOSTART;
m295	MOVF  vEN6,1,0
	BZ    m301
	MOVFF vAUTOSTART,cred6
	CLRF  cred6+1,1
	CLRF  cred6+2,1
			;
			;	}
			;else
	BRA   m301
			;	{
			;	if(cred1 != 0) rem1 = 1;
m296	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m297
	MOVLW 1
	MOVWF rem1,0
			;	if(cred2 != 0) rem2 = 1;
m297	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m298
	MOVLW 1
	MOVWF rem2,0
			;	if(cred3 != 0) rem3 = 1;
m298	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m299
	MOVLW 1
	MOVWF rem3,0
			;	if(cred4 != 0) rem4 = 1;
m299	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m300
	MOVLW 1
	MOVWF rem4,0
			;	if(cred6 != 0) rem6 = 1;
m300	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m301
	MOVLW 1
	MOVWF rem6,0
			;	}
			;
			;MODE:
			;
			;lcd_setup(0);
m301	MOVLW 0
	CALL  lcd_setup
			;
			;if(rem1 && (cred1 != 0) && pause == 0) 
	MOVF  rem1,1,0
	BZ    m302
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m302
	TSTFSZ pause,0
	BRA   m302
			;	{	
			;	REL1_ON();
	CALL  REL1_ON
			;	WORK = 1;
	MOVLW 1
	MOVWF WORK,0
			;	}
			;if(rem2 && (cred2 != 0) && pause == 0)
m302	MOVF  rem2,1,0
	BZ    m303
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m303
	TSTFSZ pause,0
	BRA   m303
			;	{
			;	REL2_ON();
	CALL  REL2_ON
			;	WORK = 2;
	MOVLW 2
	MOVWF WORK,0
			;	}
			;if(rem3 && (cred3 != 0) && pause == 0) 
m303	MOVF  rem3,1,0
	BZ    m304
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m304
	TSTFSZ pause,0
	BRA   m304
			;	{
			;	REL3_ON();
	CALL  REL3_ON
			;	WORK = 3;
	MOVLW 3
	MOVWF WORK,0
			;	}
			;if(rem4 && (cred4 != 0) && pause == 0) 
m304	MOVF  rem4,1,0
	BZ    m305
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m305
	TSTFSZ pause,0
	BRA   m305
			;	{
			;	REL4_ON();
	CALL  REL4_ON
			;	WORK = 4;
	MOVLW 4
	MOVWF WORK,0
			;	}	
			;if(rem6 && (cred6 != 0) && pause == 0) 
m305	MOVF  rem6,1,0
	BZ    m306
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m306
	TSTFSZ pause,0
	BRA   m306
			;	{
			;	REL6_ON();
	CALL  REL6_ON
			;	WORK = 6;
	MOVLW 6
	MOVWF WORK,0
			;	}	
			;
			;if(check)
m306	MOVF  check,1,0
	BZ    m315
			;	{
			;	delay(200);
	MOVLW 200
	CALL  delay
			;	check = 0;
	CLRF  check,0
			;	switch(sysB)
	MOVF  sysB,W,0
	XORLW 119
	BZ    m307
	XORLW 192
	BZ    m308
	XORLW 96
	BZ    m309
	XORLW 36
	BZ    m310
	XORLW 6
	BZ    m311
	XORLW 3
	BZ    m312
	XORLW 83
	BZ    m313
	XORLW 66
	BZ    m314
	BRA   m314
			;		{
			;		case 0x77:
			;			{
			;			credit += vOPA;
m307	MOVF  vOPA,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(PC == 1) OUT_PC_count += OUT_PC_ON;
	DECFSZ PC,W,0
	BRA   m314
	MOVLW 4
	ADDWF OUT_PC_count,1,0
			;			break;
	BRA   m314
			;			}
			;		case 0xB7:
			;			{
			;			credit += vOPB;
m308	MOVF  vOPB,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(PC == 1) OUT_PC_count += OUT_PC_ON;
	DECFSZ PC,W,0
	BRA   m314
	MOVLW 4
	ADDWF OUT_PC_count,1,0
			;			break;
	BRA   m314
			;			}
			;		case 0xD7:
			;			{
			;			credit += vOPC;
m309	MOVF  vOPC,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(PC == 1) OUT_PC_count += OUT_PC_ON;
	DECFSZ PC,W,0
	BRA   m314
	MOVLW 4
	ADDWF OUT_PC_count,1,0
			;			break;
	BRA   m314
			;			}
			;		case 0xF3:
			;			{
			;			credit += vOPD;
m310	MOVF  vOPD,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(PC == 1) OUT_PC_count += OUT_PC_ON;
	DECFSZ PC,W,0
	BRA   m314
	MOVLW 4
	ADDWF OUT_PC_count,1,0
			;			break;
	BRA   m314
			;			}
			;		case 0xF5:
			;			{
			;			credit += vOPE;
m311	MOVF  vOPE,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(PC == 1) OUT_PC_count += OUT_PC_ON;
	DECFSZ PC,W,0
	BRA   m314
	MOVLW 4
	ADDWF OUT_PC_count,1,0
			;			break;
	BRA   m314
			;			}
			;		case 0xF6:
			;			{
			;			credit += vOPF;
m312	MOVF  vOPF,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			if(PC == 1) OUT_PC_count += OUT_PC_ON;
	DECFSZ PC,W,0
	BRA   m314
	MOVLW 4
	ADDWF OUT_PC_count,1,0
			;			break;
	BRA   m314
			;			}
			;		case 0xA5:
			;			{
			;			credit += vOPE;
m313	MOVF  vOPE,W,0
	ADDWF credit,1,1
	MOVLW 0
	ADDWFC credit+1,1,1
			;			break;
			;			}
			;
			;
			;
			;		case 0xE7:
			;			{		
			;			break;
			;			}
			;		}
			;
			;	lcd_clear();
m314	CALL  lcd_clear
			;	lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;	lcd_puts_cyr(Credit_cyr);
	MOVLW 102
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;	lcd_puts(": ");
	MOVLW 23
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//	lcd_goto(LINE2);
			;//	lcd_puts(Space);
			;	lcd_credit();
	CALL  lcd_credit
			;	lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;	lcd_puts_cyr(Choice_cyr);
	MOVLW 109
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;
			;	delay(250);
	MOVLW 250
	CALL  delay
			;	overTIME = 0;
	CLRF  overTIME,0
			;	sysB = PORTB;
	MOVFF PORTB,sysB
			;/*
			;	if(OUT_PC_count != 0)
			;		{
			;		OUT_PC = 1;
			;		delaySec(3);
			;		OUT_PC = 0;
			;		delaySec(1);
			;		OUT_PC_count --;
			;		}
			;*/
			;	}
			;
			;if((overTIME > 180) && (credit != 0))
m315	MOVLW 180
	CPFSGT overTIME,0
	BRA   m316
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BZ    m316
			;	{
			;	overpay += credit;
	MOVF  credit,W,1
	ADDWF overpay,1,1
	MOVF  credit+1,W,1
	ADDWFC overpay+1,1,1
	MOVLW 0
	ADDWFC overpay+2,1,1
			;	NONpay += credit;
	MOVF  credit,W,1
	ADDWF NONpay,1,1
	MOVF  credit+1,W,1
	ADDWFC NONpay+1,1,1
	MOVLW 0
	ADDWFC NONpay+2,1,1
			;	credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;	writeEEPROM(overpay.high8,eoverH); delay(10);
	MOVFF overpay+2,smb_2
	MOVLW 231
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	writeEEPROM(overpay.mid8,eoverM); delay(10);
	MOVFF overpay+1,smb_2
	MOVLW 232
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	writeEEPROM(overpay.low8,eoverL); delay(10);
	MOVFF overpay,smb_2
	MOVLW 233
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;
			;	writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	MOVFF NONpay+2,smb_2
	MOVLW 228
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	MOVFF NONpay+1,smb_2
	MOVLW 229
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	MOVFF NONpay,smb_2
	MOVLW 230
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	}
			;
			;if((!vEN1 && !vEN2 && !vEN3 && !vEN4 && !vEN6) && !vComm)
m316	TSTFSZ vEN1,0
	BRA   m317
	TSTFSZ vEN2,0
	BRA   m317
	TSTFSZ vEN3,0
	BRA   m317
	TSTFSZ vEN4,0
	BRA   m317
	TSTFSZ vEN6,0
	BRA   m317
	TSTFSZ vComm,0
	BRA   m317
			;	{
			;	lcd_out();
	CALL  lcd_out
			;	ESCbut();
	CALL  ESCbut
			;	goto M;
	GOTO  m428
			;	}
			;
			;if(!EBUT_COUNTER)
m317	BTFSC 0xF84,EBUT_COUNTER,0
	BRA   m319
			;	{
			;	tot = NONpay;
	MOVFF NONpay,tot
	MOVFF NONpay+1,tot+1
	MOVFF NONpay+2,tot+2
			;	lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;	lcd_puts(Cash);
	MOVLW 135
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;	lcd_money();
	CALL  lcd_money
			;	lcd_puts(BGN);
	MOVLW 73
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;	while(!EBUT_COUNTER);
m318	BTFSS 0xF84,EBUT_COUNTER,0
	BRA   m318
			;	delay(100);
	MOVLW 100
	CALL  delay
			;	}
			;
			;if(((cred1 == 0) || !vEN1) && ((cred2 == 0) || !vEN2) && ((cred3 == 0) || !vEN3) && ((cred4 == 0) || !vEN4) && ((cred6 == 0) || !vEN6)) 	WORK = 0;
m319	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m320
	TSTFSZ vEN1,0
	BRA   m325
m320	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m321
	TSTFSZ vEN2,0
	BRA   m325
m321	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m322
	TSTFSZ vEN3,0
	BRA   m325
m322	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m323
	TSTFSZ vEN4,0
	BRA   m325
m323	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m324
	MOVF  vEN6,1,0
	BTFSC 0xFD8,Zero_,0
m324	CLRF  WORK,0
			;
			;if((credit == 0) && ((cred1 == 0) || !vEN1) && ((cred2 == 0) || !vEN2) && ((cred3 == 0) || !vEN3) && ((cred4 == 0) || !vEN4) && ((cred6 == 0) || !vEN6))
m325	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m331
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m326
	TSTFSZ vEN1,0
	BRA   m331
m326	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m327
	TSTFSZ vEN2,0
	BRA   m331
m327	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m328
	TSTFSZ vEN3,0
	BRA   m331
m328	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m329
	TSTFSZ vEN4,0
	BRA   m331
m329	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m330
	TSTFSZ vEN6,0
	BRA   m331
			;	{
			;	lcd_goto(LINE1);
m330	MOVLW 128
	CALL  lcd_goto
			;	lcd_puts(Welc);
	CLRF  s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//	lcd_goto(LINE2);
			;//	lcd_puts(NOTH);
			;	lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;	lcd_puts_cyr(Ready_cyr);
	MOVLW 85
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;	free_flag = 0;
	CLRF  free_flag,0
			;
			;	goto M;
	GOTO  m428
			;	}
			;
			;if((credit == 0) && ((cred1 != 0) || (cred2 != 0) || (cred3 != 0) || (cred4 != 0) || (cred6 != 0)))
m331	MOVF  credit,W,1
	IORWF credit+1,W,1
	BTFSS 0xFD8,Zero_,0
	BRA   m367
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BNZ   m332
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BNZ   m332
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BNZ   m332
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BNZ   m332
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BTFSC 0xFD8,Zero_,0
	BRA   m367
			;	{
			;	if(vEN1 && (cred1 != 0))
m332	MOVF  vEN1,1,0
	BZ    m341
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m341
			;		{
			;		if (pause == 0)
	TSTFSZ pause,0
	BRA   m334
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Time1_cyr);
	CLRF  s_2,0
	CALL  lcd_puts_cyr
			;//			lcd_goto(LINE2);
			;//			lcd_puts(NOTH);
			;			conv(cred1);
	MOVFF cred1,pr
	MOVFF cred1+1,pr+1
	MOVFF cred1+2,pr+2
	CALL  conv
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			if(hour > 99) lcd_puts(Over);
	MOVLW 99
	CPFSGT hour,0
	BRA   m333
	MOVLW 121
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			else 
	BRA   m334
			;				{
			;				lcd_puts(Space);
m333	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_time();
	CALL  lcd_time
			;				lcd_puts(Space);
	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				}
			;			}
			;			
			;		if(!EBUT5 && pause == 0)
m334	BTFSC 0xF83,EBUT5,0
	BRA   m339
	TSTFSZ pause,0
	BRA   m339
			;			{
			;			pause = 1;
	MOVLW 1
	MOVWF pause,0
			;			pause_flag = 1;
	MOVWF pause_flag,0
			;			lcd_clear();
	CALL  lcd_clear
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Pause_LCD_cyr);
	MOVLW 129
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;								
			;
			;			while (!EBUT5)
m335	BTFSC 0xF83,EBUT5,0
	BRA   m338
			;				{
			;				if(!EBUT1) 						//Free add 2lv
	BTFSC 0xF83,EBUT1,0
	BRA   m337
			;					{
			;					free_flag ++;
	INCF  free_flag,1,0
			;					while (!EBUT1);
m336	BTFSS 0xF83,EBUT1,0
	BRA   m336
			;					delay(100);
	MOVLW 100
	CALL  delay
			;					}
			;					if(free_flag == 3)
m337	MOVLW 3
	CPFSEQ free_flag,0
	BRA   m335
			;						{
			;						cred1 += 120;
	MOVLW 120
	ADDWF cred1,1,1
	MOVLW 0
	ADDWFC cred1+1,1,1
	ADDWFC cred1+2,1,1
			;						free_flag = 0;
	CLRF  free_flag,0
			;						}
			;				}
	BRA   m335
			;			delay(100);
m338	MOVLW 100
	CALL  delay
			;			}
			;
			;		if(!EBUT5 && pause == 1 && pause_flag == 1)
m339	BTFSC 0xF83,EBUT5,0
	BRA   m341
	DECFSZ pause,W,0
	BRA   m341
	DECFSZ pause_flag,W,0
	BRA   m341
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			while (!EBUT5);
m340	BTFSS 0xF83,EBUT5,0
	BRA   m340
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;		}
			;
			;	if(vEN2 && (cred2 != 0))
m341	MOVF  vEN2,1,0
	BZ    m347
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m347
			;		{
			;		if (pause == 0)
	TSTFSZ pause,0
	BRA   m343
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Time2_cyr);
	MOVLW 17
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;//			lcd_goto(LINE2);
			;//			lcd_puts(NOTH);
			;			conv(cred2);
	MOVFF cred2,pr
	MOVFF cred2+1,pr+1
	MOVFF cred2+2,pr+2
	CALL  conv
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			if(hour > 99) lcd_puts(Over);
	MOVLW 99
	CPFSGT hour,0
	BRA   m342
	MOVLW 121
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			else 
	BRA   m343
			;				{
			;				lcd_puts(Space);
m342	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_time();
	CALL  lcd_time
			;				lcd_puts(Space);
	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				}
			;			}
			;			
			;		if(!EBUT5 && pause == 0)
m343	BTFSC 0xF83,EBUT5,0
	BRA   m345
	TSTFSZ pause,0
	BRA   m345
			;			{
			;			pause = 1;
	MOVLW 1
	MOVWF pause,0
			;			pause_flag = 2;
	MOVLW 2
	MOVWF pause_flag,0
			;			lcd_clear();
	CALL  lcd_clear
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Pause_LCD_cyr);
	MOVLW 129
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;			while (!EBUT5);
m344	BTFSS 0xF83,EBUT5,0
	BRA   m344
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;
			;		if(!EBUT5 && pause == 1 && pause_flag == 2)
m345	BTFSC 0xF83,EBUT5,0
	BRA   m347
	DECFSZ pause,W,0
	BRA   m347
	MOVLW 2
	CPFSEQ pause_flag,0
	BRA   m347
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			while (!EBUT5);
m346	BTFSS 0xF83,EBUT5,0
	BRA   m346
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}	
			;		}
			;
			;	if(vEN3 && (cred3 != 0))
m347	MOVF  vEN3,1,0
	BZ    m353
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m353
			;		{
			;		if (pause == 0)
	TSTFSZ pause,0
	BRA   m349
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Time3_cyr);
	MOVLW 34
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;//			lcd_goto(LINE2);
			;//			lcd_puts(NOTH);
			;			conv(cred3);
	MOVFF cred3,pr
	MOVFF cred3+1,pr+1
	MOVFF cred3+2,pr+2
	CALL  conv
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			if(hour > 99) lcd_puts(Over);
	MOVLW 99
	CPFSGT hour,0
	BRA   m348
	MOVLW 121
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			else 
	BRA   m349
			;				{
			;				lcd_puts(Space);
m348	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_time();
	CALL  lcd_time
			;				lcd_puts(Space);
	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				}
			;			}
			;			
			;		if(!EBUT5 && pause == 0)
m349	BTFSC 0xF83,EBUT5,0
	BRA   m351
	TSTFSZ pause,0
	BRA   m351
			;			{
			;			pause = 1;
	MOVLW 1
	MOVWF pause,0
			;			pause_flag = 3;
	MOVLW 3
	MOVWF pause_flag,0
			;			lcd_clear();
	CALL  lcd_clear
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Pause_LCD_cyr);
	MOVLW 129
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;			while (!EBUT5);
m350	BTFSS 0xF83,EBUT5,0
	BRA   m350
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;
			;		if(!EBUT5 && pause == 1  && pause_flag == 3)
m351	BTFSC 0xF83,EBUT5,0
	BRA   m353
	DECFSZ pause,W,0
	BRA   m353
	MOVLW 3
	CPFSEQ pause_flag,0
	BRA   m353
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			while (!EBUT5);
m352	BTFSS 0xF83,EBUT5,0
	BRA   m352
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;		}
			;
			;	if(vEN4 && (cred4 != 0))
m353	MOVF  vEN4,1,0
	BZ    m359
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m359
			;		{
			;		if (pause == 0)
	TSTFSZ pause,0
	BRA   m355
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Time4_cyr);
	MOVLW 51
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;//			lcd_goto(LINE2);
			;//			lcd_puts(NOTH);
			;			conv(cred4);
	MOVFF cred4,pr
	MOVFF cred4+1,pr+1
	MOVFF cred4+2,pr+2
	CALL  conv
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			if(hour > 99) lcd_puts(Over);
	MOVLW 99
	CPFSGT hour,0
	BRA   m354
	MOVLW 121
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			else 
	BRA   m355
			;				{
			;				lcd_puts(Space);
m354	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_time();
	CALL  lcd_time
			;				lcd_puts(Space);
	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				}
			;			}
			;			
			;		if(!EBUT5 && pause == 0)
m355	BTFSC 0xF83,EBUT5,0
	BRA   m357
	TSTFSZ pause,0
	BRA   m357
			;			{
			;			pause = 1;
	MOVLW 1
	MOVWF pause,0
			;			pause_flag = 4;
	MOVLW 4
	MOVWF pause_flag,0
			;			lcd_clear();
	CALL  lcd_clear
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Pause_LCD_cyr);
	MOVLW 129
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;			while (!EBUT5);
m356	BTFSS 0xF83,EBUT5,0
	BRA   m356
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;
			;		if(!EBUT5 && pause == 1 && pause_flag == 4)
m357	BTFSC 0xF83,EBUT5,0
	BRA   m359
	DECFSZ pause,W,0
	BRA   m359
	MOVLW 4
	CPFSEQ pause_flag,0
	BRA   m359
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			while (!EBUT5);
m358	BTFSS 0xF83,EBUT5,0
	BRA   m358
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}	
			;		}
			;
			;	if(vEN6 && (cred6 != 0))
m359	MOVF  vEN6,1,0
	BZ    m365
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m365
			;		{
			;		if (pause == 0)
	TSTFSZ pause,0
	BRA   m361
			;			{
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Time6_cyr);
	MOVLW 68
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;//			lcd_goto(LINE2);
			;//			lcd_puts(NOTH);
			;			conv(cred6);
	MOVFF cred6,pr
	MOVFF cred6+1,pr+1
	MOVFF cred6+2,pr+2
	CALL  conv
			;			lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;			if(hour > 99) lcd_puts(Over);
	MOVLW 99
	CPFSGT hour,0
	BRA   m360
	MOVLW 121
	MOVWF s,0
	MOVLW 1
	MOVWF s+1,0
	CALL  lcd_puts
			;			else 
	BRA   m361
			;				{
			;				lcd_puts(Space);
m360	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				lcd_time();
	CALL  lcd_time
			;				lcd_puts(Space);
	MOVLW 12
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;				}
			;			}
			;			
			;		if(!EBUT5 && pause == 0)
m361	BTFSC 0xF83,EBUT5,0
	BRA   m363
	TSTFSZ pause,0
	BRA   m363
			;			{
			;			pause = 1;
	MOVLW 1
	MOVWF pause,0
			;			pause_flag = 6;
	MOVLW 6
	MOVWF pause_flag,0
			;			lcd_clear();
	CALL  lcd_clear
			;			lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;			lcd_puts_cyr(Pause_LCD_cyr);
	MOVLW 129
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;			while (!EBUT5);
m362	BTFSS 0xF83,EBUT5,0
	BRA   m362
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;
			;		if(!EBUT5 && pause == 1  && pause_flag == 6)
m363	BTFSC 0xF83,EBUT5,0
	BRA   m365
	DECFSZ pause,W,0
	BRA   m365
	MOVLW 6
	CPFSEQ pause_flag,0
	BRA   m365
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			while (!EBUT5);
m364	BTFSS 0xF83,EBUT5,0
	BRA   m364
			;			delay(100);
	MOVLW 100
	CALL  delay
			;			}
			;		}
			;		
			;/*-------------------------------------------------------------*/
			;		if(OUT_PC_count > 0)				/////PC_OUT_counter
m365	MOVF  OUT_PC_count,1,0
	BZ    m366
			;			{
			;			OUT_PC = 0;
	BCF   0xF82,OUT_PC,0
			;			delay(250);
	MOVLW 250
	CALL  delay
			;			OUT_PC_count --;
	DECF  OUT_PC_count,1,0
			;			if (!(OUT_PC_count % 4))
	MOVLW 3
	ANDWF OUT_PC_count,W,0
	BNZ   m367
			;				{
			;				OUT_PC = 1;
	BSF   0xF82,OUT_PC,0
			;				delay(250);
	MOVLW 250
	CALL  delay
			;				delay(250);
	MOVLW 250
	CALL  delay
			;				}
			;			} 
			;		else OUT_PC = 1;
	BRA   m367
m366	BSF   0xF82,OUT_PC,0
			;
			;/*-------------------------------------------------------------*/
			;	
			;	}
			;
			;
			;if((WORK == 0 || WORK == 1) && (((!EBUT1 && vEN1) && ((credit != 0) || rem1)) || (vComm != 0)))
m367	MOVF  WORK,1,0
	BZ    m368
	DECFSZ WORK,W,0
	BRA   m374
m368	BTFSC 0xF83,EBUT1,0
	BRA   m369
	MOVF  vEN1,1,0
	BZ    m369
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m370
	TSTFSZ rem1,0
	BRA   m370
m369	MOVF  vComm,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m374
			;	{
			;	val_tmp = readEEPROM(0x00);	
m370	MOVLW 0
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp = (uns16)val_tmp * 100;
	MOVLW 100
	MULWF val_tmp,0
	MOVFF PRODL,x2_tmp
	MOVFF PRODH,x2_tmp+1
	MULWF val_tmp+1,0
	MOVF  PRODL,W,0
	ADDWF x2_tmp+1,1,0
			;	val_tmp = readEEPROM(0x01);	
	MOVLW 1
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp +=(uns16)val_tmp;
	ADDWF x2_tmp,1,0
	MOVF  val_tmp+1,W,0
	ADDWFC x2_tmp+1,1,0
			;	if(x2_tmp<=credit)
	MOVF  x2_tmp,W,0
	SUBWF credit,W,1
	MOVF  x2_tmp+1,W,0
	SUBWFB credit+1,W,1
	BNC   m373
			;		{
			;		WORK = 1;
	MOVLW 1
	MOVWF WORK,0
			;		rem1 = 0;
	CLRF  rem1,0
			;		SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;		cr_to_time(1);
	CALL  cr_to_time
			;		cred1 += value;
	MOVF  value,W,1
	ADDWF cred1,1,1
	MOVF  value+1,W,1
	ADDWFC cred1+1,1,1
	MOVF  value+2,W,1
	ADDWFC cred1+2,1,1
			;		total1 += credit;
	MOVF  credit,W,1
	ADDWF total1,1,1
	MOVF  credit+1,W,1
	ADDWFC total1+1,1,1
	MOVLW 0
	ADDWFC total1+2,1,1
			;		NONpay += credit;
	MOVF  credit,W,1
	ADDWF NONpay,1,1
	MOVF  credit+1,W,1
	ADDWFC NONpay+1,1,1
	MOVLW 0
	ADDWFC NONpay+2,1,1
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred1 != 0 && pause == 0)
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m371
	TSTFSZ pause,0
	BRA   m371
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL1_ON(); 
	CALL  REL1_ON
			;			}
			;		writeEEPROM(total1.high8,etotal1H); delay(10);
m371	MOVFF total1+2,smb_2
	MOVLW 234
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total1.mid8,etotal1M);  delay(10);
	MOVFF total1+1,smb_2
	MOVLW 235
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total1.low8,etotal1L);  delay(10);
	MOVFF total1,smb_2
	MOVLW 236
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	
			;		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	MOVFF NONpay+2,smb_2
	MOVLW 228
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	MOVFF NONpay+1,smb_2
	MOVLW 229
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	MOVFF NONpay,smb_2
	MOVLW 230
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		while(!EBUT1);
m372	BTFSS 0xF83,EBUT1,0
	BRA   m372
			;		delay(100);
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m374
			;		{
			;		lcd_clear();
m373	CALL  lcd_clear
			;		lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;		lcd_puts_cyr(Credit_cyr);
	MOVLW 102
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		lcd_puts(": ");
	MOVLW 23
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//		lcd_goto(LINE2);
			;//		lcd_puts(Space);
			;		lcd_credit();
	CALL  lcd_credit
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts_cyr(Choice_cyr);
	MOVLW 109
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		}
			;	}
			;
			;if((WORK == 0 || WORK == 2) && (((!EBUT2 && vEN2)  && ((credit != 0) || rem2)) || (vComm != 0))) 
m374	MOVF  WORK,1,0
	BZ    m375
	MOVLW 2
	CPFSEQ WORK,0
	BRA   m381
m375	BTFSC 0xF83,EBUT2,0
	BRA   m376
	MOVF  vEN2,1,0
	BZ    m376
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m377
	TSTFSZ rem2,0
	BRA   m377
m376	MOVF  vComm,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m381
			;	{
			;	val_tmp = readEEPROM(0x05);	
m377	MOVLW 5
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp = (uns16)val_tmp * 100;
	MOVLW 100
	MULWF val_tmp,0
	MOVFF PRODL,x2_tmp
	MOVFF PRODH,x2_tmp+1
	MULWF val_tmp+1,0
	MOVF  PRODL,W,0
	ADDWF x2_tmp+1,1,0
			;	val_tmp = readEEPROM(0x06);	
	MOVLW 6
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp +=(uns16)val_tmp;
	ADDWF x2_tmp,1,0
	MOVF  val_tmp+1,W,0
	ADDWFC x2_tmp+1,1,0
			;	if(x2_tmp<=credit)
	MOVF  x2_tmp,W,0
	SUBWF credit,W,1
	MOVF  x2_tmp+1,W,0
	SUBWFB credit+1,W,1
	BNC   m380
			;		{
			;		WORK = 2;
	MOVLW 2
	MOVWF WORK,0
			;		rem2 = 0;
	CLRF  rem2,0
			;		SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;		cr_to_time(2);
	CALL  cr_to_time
			;		cred2 += value;
	MOVF  value,W,1
	ADDWF cred2,1,1
	MOVF  value+1,W,1
	ADDWFC cred2+1,1,1
	MOVF  value+2,W,1
	ADDWFC cred2+2,1,1
			;		total2 += credit;
	MOVF  credit,W,1
	ADDWF total2,1,1
	MOVF  credit+1,W,1
	ADDWFC total2+1,1,1
	MOVLW 0
	ADDWFC total2+2,1,1
			;		NONpay += credit;
	MOVF  credit,W,1
	ADDWF NONpay,1,1
	MOVF  credit+1,W,1
	ADDWFC NONpay+1,1,1
	MOVLW 0
	ADDWFC NONpay+2,1,1
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred2 != 0 && pause == 0)
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m378
	TSTFSZ pause,0
	BRA   m378
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL2_ON(); 
	CALL  REL2_ON
			;			}
			;		writeEEPROM(total2.high8,etotal2H); delay(10);
m378	MOVFF total2+2,smb_2
	MOVLW 237
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total2.mid8,etotal2M);  delay(10);
	MOVFF total2+1,smb_2
	MOVLW 238
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total2.low8,etotal2L);  delay(10);
	MOVFF total2,smb_2
	MOVLW 239
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	
			;		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	MOVFF NONpay+2,smb_2
	MOVLW 228
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	MOVFF NONpay+1,smb_2
	MOVLW 229
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	MOVFF NONpay,smb_2
	MOVLW 230
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		while(!EBUT2);
m379	BTFSS 0xF83,EBUT2,0
	BRA   m379
			;		delay(100);
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m381
			;		{
			;		lcd_clear();
m380	CALL  lcd_clear
			;		lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;		lcd_puts_cyr(Credit_cyr);
	MOVLW 102
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		lcd_puts(": ");
	MOVLW 23
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//		lcd_goto(LINE2);
			;//		lcd_puts(Space);
			;		lcd_credit();
	CALL  lcd_credit
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts_cyr(Choice_cyr);
	MOVLW 109
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		}
			;	}
			;
			;if((WORK == 0 || WORK == 3) && (((!EBUT3 && vEN3) && ((credit != 0) || rem3)) || (vComm != 0)))
m381	MOVF  WORK,1,0
	BZ    m382
	MOVLW 3
	CPFSEQ WORK,0
	BRA   m388
m382	BTFSC 0xF80,EBUT3,0
	BRA   m383
	MOVF  vEN3,1,0
	BZ    m383
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m384
	TSTFSZ rem3,0
	BRA   m384
m383	MOVF  vComm,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m388
			;	{
			;	val_tmp = readEEPROM(0x60);	
m384	MOVLW 96
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp = (uns16)val_tmp * 100;
	MOVLW 100
	MULWF val_tmp,0
	MOVFF PRODL,x2_tmp
	MOVFF PRODH,x2_tmp+1
	MULWF val_tmp+1,0
	MOVF  PRODL,W,0
	ADDWF x2_tmp+1,1,0
			;	val_tmp = readEEPROM(0x61);	
	MOVLW 97
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp +=(uns16)val_tmp;
	ADDWF x2_tmp,1,0
	MOVF  val_tmp+1,W,0
	ADDWFC x2_tmp+1,1,0
			;	if(x2_tmp<=credit)
	MOVF  x2_tmp,W,0
	SUBWF credit,W,1
	MOVF  x2_tmp+1,W,0
	SUBWFB credit+1,W,1
	BNC   m387
			;		{
			;		WORK = 3;
	MOVLW 3
	MOVWF WORK,0
			;		rem3 = 0;
	CLRF  rem3,0
			;		SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;		cr_to_time(3);
	CALL  cr_to_time
			;		cred3 += value;
	MOVF  value,W,1
	ADDWF cred3,1,1
	MOVF  value+1,W,1
	ADDWFC cred3+1,1,1
	MOVF  value+2,W,1
	ADDWFC cred3+2,1,1
			;		total3 += credit;
	MOVF  credit,W,1
	ADDWF total3,1,1
	MOVF  credit+1,W,1
	ADDWFC total3+1,1,1
	MOVLW 0
	ADDWFC total3+2,1,1
			;		NONpay += credit;
	MOVF  credit,W,1
	ADDWF NONpay,1,1
	MOVF  credit+1,W,1
	ADDWFC NONpay+1,1,1
	MOVLW 0
	ADDWFC NONpay+2,1,1
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred3 != 0 && pause == 0)
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m385
	TSTFSZ pause,0
	BRA   m385
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL3_ON(); 
	CALL  REL3_ON
			;			}
			;		writeEEPROM(total3.high8,etotal3H); delay(10);
m385	MOVFF total3+2,smb_2
	MOVLW 202
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total3.mid8,etotal3M);  delay(10);
	MOVFF total3+1,smb_2
	MOVLW 203
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total3.low8,etotal3L);  delay(10);
	MOVFF total3,smb_2
	MOVLW 204
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	
			;		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	MOVFF NONpay+2,smb_2
	MOVLW 228
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	MOVFF NONpay+1,smb_2
	MOVLW 229
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	MOVFF NONpay,smb_2
	MOVLW 230
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		while(!EBUT3);
m386	BTFSS 0xF80,EBUT3,0
	BRA   m386
			;		delay(100);
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m388
			;		{
			;		lcd_clear();
m387	CALL  lcd_clear
			;		lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;		lcd_puts_cyr(Credit_cyr);
	MOVLW 102
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		lcd_puts(": ");
	MOVLW 23
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//		lcd_goto(LINE2);
			;//		lcd_puts(Space);
			;		lcd_credit();
	CALL  lcd_credit
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts_cyr(Choice_cyr);
	MOVLW 109
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		}
			;	}
			;
			;if((WORK == 0 || WORK == 4) && (((!EBUT4 && vEN4)  && ((credit != 0) || rem4)) || (vComm != 0))) 
m388	MOVF  WORK,1,0
	BZ    m389
	MOVLW 4
	CPFSEQ WORK,0
	BRA   m395
m389	BTFSC 0xF80,EBUT4,0
	BRA   m390
	MOVF  vEN4,1,0
	BZ    m390
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m391
	TSTFSZ rem4,0
	BRA   m391
m390	MOVF  vComm,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m395
			;	{
			;	val_tmp = readEEPROM(0x65);	
m391	MOVLW 101
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp = (uns16)val_tmp * 100;
	MOVLW 100
	MULWF val_tmp,0
	MOVFF PRODL,x2_tmp
	MOVFF PRODH,x2_tmp+1
	MULWF val_tmp+1,0
	MOVF  PRODL,W,0
	ADDWF x2_tmp+1,1,0
			;	val_tmp = readEEPROM(0x66);	
	MOVLW 102
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp +=(uns16)val_tmp;
	ADDWF x2_tmp,1,0
	MOVF  val_tmp+1,W,0
	ADDWFC x2_tmp+1,1,0
			;	if(x2_tmp<=credit)
	MOVF  x2_tmp,W,0
	SUBWF credit,W,1
	MOVF  x2_tmp+1,W,0
	SUBWFB credit+1,W,1
	BNC   m394
			;		{
			;		WORK = 4;
	MOVLW 4
	MOVWF WORK,0
			;		rem4 = 0;
	CLRF  rem4,0
			;		SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;		cr_to_time(4);
	CALL  cr_to_time
			;		cred4 += value;
	MOVF  value,W,1
	ADDWF cred4,1,1
	MOVF  value+1,W,1
	ADDWFC cred4+1,1,1
	MOVF  value+2,W,1
	ADDWFC cred4+2,1,1
			;		total4 += credit;
	MOVF  credit,W,1
	ADDWF total4,1,1
	MOVF  credit+1,W,1
	ADDWFC total4+1,1,1
	MOVLW 0
	ADDWFC total4+2,1,1
			;		NONpay += credit;
	MOVF  credit,W,1
	ADDWF NONpay,1,1
	MOVF  credit+1,W,1
	ADDWFC NONpay+1,1,1
	MOVLW 0
	ADDWFC NONpay+2,1,1
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred4 != 0 && pause == 0)
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m392
	TSTFSZ pause,0
	BRA   m392
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL4_ON(); 
	CALL  REL4_ON
			;			}
			;		writeEEPROM(total4.high8,etotal4H); delay(10);
m392	MOVFF total4+2,smb_2
	MOVLW 205
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total4.mid8,etotal4M);  delay(10);
	MOVFF total4+1,smb_2
	MOVLW 206
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total4.low8,etotal4L);  delay(10);
	MOVFF total4,smb_2
	MOVLW 207
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	
			;		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	MOVFF NONpay+2,smb_2
	MOVLW 228
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	MOVFF NONpay+1,smb_2
	MOVLW 229
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	MOVFF NONpay,smb_2
	MOVLW 230
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		while(!EBUT4);
m393	BTFSS 0xF80,EBUT4,0
	BRA   m393
			;		delay(100);
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m395
			;		{
			;		lcd_clear();
m394	CALL  lcd_clear
			;		lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;		lcd_puts_cyr(Credit_cyr);
	MOVLW 102
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		lcd_puts(": ");
	MOVLW 23
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//		lcd_goto(LINE2);
			;//		lcd_puts(Space);
			;		lcd_credit();
	CALL  lcd_credit
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts_cyr(Choice_cyr);
	MOVLW 109
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		}
			;	}
			;
			;if((WORK == 0 || WORK == 6) && (((!EBUT6 && vEN6)  && ((credit != 0) || rem6)) || (vComm != 0))) 
m395	MOVF  WORK,1,0
	BZ    m396
	MOVLW 6
	CPFSEQ WORK,0
	BRA   m402
m396	BTFSC 0xF82,EBUT6,0
	BRA   m397
	MOVF  vEN6,1,0
	BZ    m397
	MOVF  credit,W,1
	IORWF credit+1,W,1
	BNZ   m398
	TSTFSZ rem6,0
	BRA   m398
m397	MOVF  vComm,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m402
			;	{
			;	val_tmp = readEEPROM(0x0B);	//new
m398	MOVLW 11
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp = (uns16)val_tmp * 100;
	MOVLW 100
	MULWF val_tmp,0
	MOVFF PRODL,x2_tmp
	MOVFF PRODH,x2_tmp+1
	MULWF val_tmp+1,0
	MOVF  PRODL,W,0
	ADDWF x2_tmp+1,1,0
			;	val_tmp = readEEPROM(0x0C);	 //new
	MOVLW 12
	CALL  readEEPROM
	MOVWF val_tmp,0
	CLRF  val_tmp+1,0
			;	x2_tmp +=(uns16)val_tmp;
	ADDWF x2_tmp,1,0
	MOVF  val_tmp+1,W,0
	ADDWFC x2_tmp+1,1,0
			;	if(x2_tmp<=credit)
	MOVF  x2_tmp,W,0
	SUBWF credit,W,1
	MOVF  x2_tmp+1,W,0
	SUBWFB credit+1,W,1
	BNC   m401
			;		{
			;		WORK = 6;
	MOVLW 6
	MOVWF WORK,0
			;		rem6 = 0;
	CLRF  rem6,0
			;		SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;		cr_to_time(6);
	CALL  cr_to_time
			;		cred6 += value;
	MOVF  value,W,1
	ADDWF cred6,1,1
	MOVF  value+1,W,1
	ADDWFC cred6+1,1,1
	MOVF  value+2,W,1
	ADDWFC cred6+2,1,1
			;		total6 += credit;
	MOVF  credit,W,1
	ADDWF total6,1,1
	MOVF  credit+1,W,1
	ADDWFC total6+1,1,1
	MOVLW 0
	ADDWFC total6+2,1,1
			;		NONpay += credit;
	MOVF  credit,W,1
	ADDWF NONpay,1,1
	MOVF  credit+1,W,1
	ADDWFC NONpay+1,1,1
	MOVLW 0
	ADDWFC NONpay+2,1,1
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred6 != 0 && pause == 0)
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m399
	TSTFSZ pause,0
	BRA   m399
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL6_ON(); 
	CALL  REL6_ON
			;			}
			;		writeEEPROM(total6.high8,etotal6H); delay(10);
m399	MOVFF total6+2,smb_2
	MOVLW 186
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total6.mid8,etotal6M);  delay(10);
	MOVFF total6+1,smb_2
	MOVLW 187
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(total6.low8,etotal6L);  delay(10);
	MOVFF total6,smb_2
	MOVLW 188
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	
			;		writeEEPROM(NONpay.high8,eNONpayH); delay(10);
	MOVFF NONpay+2,smb_2
	MOVLW 228
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.mid8,eNONpayM); delay(10);
	MOVFF NONpay+1,smb_2
	MOVLW 229
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		writeEEPROM(NONpay.low8,eNONpayL); delay(10);
	MOVFF NONpay,smb_2
	MOVLW 230
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;		while(!EBUT6);
m400	BTFSS 0xF82,EBUT6,0
	BRA   m400
			;		delay(100);
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m402
			;		{
			;		lcd_clear();
m401	CALL  lcd_clear
			;		lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;		lcd_puts_cyr(Credit_cyr);
	MOVLW 102
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		lcd_puts(": ");
	MOVLW 23
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;//		lcd_goto(LINE2);
			;//		lcd_puts(Space);
			;		lcd_credit();
	CALL  lcd_credit
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts_cyr(Choice_cyr);
	MOVLW 109
	MOVWF s_2,0
	CALL  lcd_puts_cyr
			;		}
			;	}
			;
			;if((WORK != 0))				// prehvarlqne ot 1 BUT na dr.
m402	MOVF  WORK,1,0
	BTFSC 0xFD8,Zero_,0
	BRA   m427
			;	{
			;	if((!EBUT1) && WORK !=1)
	BTFSC 0xF83,EBUT1,0
	BRA   m406
	DCFSNZ WORK,W,0
	BRA   m406
			;		{
			;		if (pause == 1)
	DECFSZ pause,W,0
	BRA   m403
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			}
			;		credit_tmp = credit;
m403	MOVFF credit,credit_tmp
	MOVFF credit+1,credit_tmp+1
	CLRF  credit_tmp+2,0
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		time_to_cr(WORK);
	MOVF  WORK,W,0
	CALL  time_to_cr
			;		if (credit_tmp!=0) credit+=credit_tmp;
	MOVF  credit_tmp,W,0
	IORWF credit_tmp+1,W,0
	IORWF credit_tmp+2,W,0
	BZ    m404
	MOVF  credit_tmp,W,0
	ADDWF credit,1,1
	MOVF  credit_tmp+1,W,0
	ADDWFC credit+1,1,1
			;		cr_to_time(1);
m404	MOVLW 1
	CALL  cr_to_time
			;		cred1 = value;
	MOVFF value,cred1
	MOVFF value+1,cred1+1
	MOVFF value+2,cred1+2
			;		WORK = 1;
	MOVLW 1
	MOVWF WORK,0
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred1 != 0 && pause == 0)
	MOVF  cred1,W,1
	IORWF cred1+1,W,1
	IORWF cred1+2,W,1
	BZ    m405
	TSTFSZ pause,0
	BRA   m405
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL1_ON(); 
	CALL  REL1_ON
			;			}
			;		while(!EBUT1);
m405	BTFSS 0xF83,EBUT1,0
	BRA   m405
			;		delay(100);		
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m407
			;		if((!EBUT1) && pause == 1)
m406	BTFSC 0xF83,EBUT1,0
	BRA   m407
	DECFSZ pause,W,0
	BRA   m407
			;		{
			;		pause = 0;
	CLRF  pause,0
			;		pause_flag = 0;
	CLRF  pause_flag,0
			;		}
			;
			;	if((!EBUT2) && WORK !=2)
m407	BTFSC 0xF83,EBUT2,0
	BRA   m411
	MOVF  WORK,W,0
	XORLW 2
	BZ    m411
			;		{
			;		if (pause == 1)
	DECFSZ pause,W,0
	BRA   m408
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			}
			;		credit_tmp = credit;
m408	MOVFF credit,credit_tmp
	MOVFF credit+1,credit_tmp+1
	CLRF  credit_tmp+2,0
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		time_to_cr(WORK);
	MOVF  WORK,W,0
	CALL  time_to_cr
			;		if (credit_tmp!=0) credit+=credit_tmp;
	MOVF  credit_tmp,W,0
	IORWF credit_tmp+1,W,0
	IORWF credit_tmp+2,W,0
	BZ    m409
	MOVF  credit_tmp,W,0
	ADDWF credit,1,1
	MOVF  credit_tmp+1,W,0
	ADDWFC credit+1,1,1
			;		cr_to_time(2);
m409	MOVLW 2
	CALL  cr_to_time
			;		cred2 = value;
	MOVFF value,cred2
	MOVFF value+1,cred2+1
	MOVFF value+2,cred2+2
			;		WORK = 2;
	MOVLW 2
	MOVWF WORK,0
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred2 != 0 && pause == 0)
	MOVF  cred2,W,1
	IORWF cred2+1,W,1
	IORWF cred2+2,W,1
	BZ    m410
	TSTFSZ pause,0
	BRA   m410
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL2_ON(); 
	CALL  REL2_ON
			;			}
			;		while(!EBUT2);
m410	BTFSS 0xF83,EBUT2,0
	BRA   m410
			;		delay(100);		
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m412
			;		if((!EBUT2) && pause == 1)
m411	BTFSC 0xF83,EBUT2,0
	BRA   m412
	DECFSZ pause,W,0
	BRA   m412
			;		{
			;		pause = 0;
	CLRF  pause,0
			;		pause_flag = 0;
	CLRF  pause_flag,0
			;		}
			;
			;
			;	if((!EBUT3) && WORK !=3)
m412	BTFSC 0xF80,EBUT3,0
	BRA   m416
	MOVF  WORK,W,0
	XORLW 3
	BZ    m416
			;		{
			;		if (pause == 1)
	DECFSZ pause,W,0
	BRA   m413
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			}
			;		credit_tmp = credit;
m413	MOVFF credit,credit_tmp
	MOVFF credit+1,credit_tmp+1
	CLRF  credit_tmp+2,0
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		time_to_cr(WORK);
	MOVF  WORK,W,0
	CALL  time_to_cr
			;		if (credit_tmp!=0) credit+=credit_tmp;
	MOVF  credit_tmp,W,0
	IORWF credit_tmp+1,W,0
	IORWF credit_tmp+2,W,0
	BZ    m414
	MOVF  credit_tmp,W,0
	ADDWF credit,1,1
	MOVF  credit_tmp+1,W,0
	ADDWFC credit+1,1,1
			;		cr_to_time(3);
m414	MOVLW 3
	CALL  cr_to_time
			;		cred3 = value;
	MOVFF value,cred3
	MOVFF value+1,cred3+1
	MOVFF value+2,cred3+2
			;		WORK = 3;
	MOVLW 3
	MOVWF WORK,0
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred3 != 0 && pause == 0)
	MOVF  cred3,W,1
	IORWF cred3+1,W,1
	IORWF cred3+2,W,1
	BZ    m415
	TSTFSZ pause,0
	BRA   m415
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL3_ON(); 
	CALL  REL3_ON
			;			}
			;		while(!EBUT3);
m415	BTFSS 0xF80,EBUT3,0
	BRA   m415
			;		delay(100);		
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m417
			;		if((!EBUT3) && pause == 1)
m416	BTFSC 0xF80,EBUT3,0
	BRA   m417
	DECFSZ pause,W,0
	BRA   m417
			;		{
			;		pause = 0;
	CLRF  pause,0
			;		pause_flag = 0;
	CLRF  pause_flag,0
			;		}
			;
			;
			;	if((!EBUT4) && WORK !=4)
m417	BTFSC 0xF80,EBUT4,0
	BRA   m421
	MOVF  WORK,W,0
	XORLW 4
	BZ    m421
			;		{
			;		if (pause == 1)
	DECFSZ pause,W,0
	BRA   m418
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			}
			;		credit_tmp = credit;
m418	MOVFF credit,credit_tmp
	MOVFF credit+1,credit_tmp+1
	CLRF  credit_tmp+2,0
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		time_to_cr(WORK);
	MOVF  WORK,W,0
	CALL  time_to_cr
			;		if (credit_tmp!=0) credit+=credit_tmp;
	MOVF  credit_tmp,W,0
	IORWF credit_tmp+1,W,0
	IORWF credit_tmp+2,W,0
	BZ    m419
	MOVF  credit_tmp,W,0
	ADDWF credit,1,1
	MOVF  credit_tmp+1,W,0
	ADDWFC credit+1,1,1
			;		cr_to_time(4);
m419	MOVLW 4
	CALL  cr_to_time
			;		cred4 = value;
	MOVFF value,cred4
	MOVFF value+1,cred4+1
	MOVFF value+2,cred4+2
			;		WORK = 4;
	MOVLW 4
	MOVWF WORK,0
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred4 != 0 && pause == 0)
	MOVF  cred4,W,1
	IORWF cred4+1,W,1
	IORWF cred4+2,W,1
	BZ    m420
	TSTFSZ pause,0
	BRA   m420
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL4_ON(); 
	CALL  REL4_ON
			;			}
			;		while(!EBUT4);
m420	BTFSS 0xF80,EBUT4,0
	BRA   m420
			;		delay(100);		
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m422
			;		if((!EBUT4) && pause == 1)
m421	BTFSC 0xF80,EBUT4,0
	BRA   m422
	DECFSZ pause,W,0
	BRA   m422
			;		{
			;		pause = 0;
	CLRF  pause,0
			;		pause_flag = 0;
	CLRF  pause_flag,0
			;		}
			;
			;
			;	if((!EBUT6) && WORK !=6)
m422	BTFSC 0xF82,EBUT6,0
	BRA   m426
	MOVF  WORK,W,0
	XORLW 6
	BZ    m426
			;		{
			;		if (pause == 1)
	DECFSZ pause,W,0
	BRA   m423
			;			{
			;			pause = 0;
	CLRF  pause,0
			;			pause_flag = 0;
	CLRF  pause_flag,0
			;			}
			;		credit_tmp = credit;
m423	MOVFF credit,credit_tmp
	MOVFF credit+1,credit_tmp+1
	CLRF  credit_tmp+2,0
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		time_to_cr(WORK);
	MOVF  WORK,W,0
	CALL  time_to_cr
			;		if (credit_tmp!=0) credit+=credit_tmp;
	MOVF  credit_tmp,W,0
	IORWF credit_tmp+1,W,0
	IORWF credit_tmp+2,W,0
	BZ    m424
	MOVF  credit_tmp,W,0
	ADDWF credit,1,1
	MOVF  credit_tmp+1,W,0
	ADDWFC credit+1,1,1
			;		cr_to_time(6);
m424	MOVLW 6
	CALL  cr_to_time
			;		cred6 = value;
	MOVFF value,cred6
	MOVFF value+1,cred6+1
	MOVFF value+2,cred6+2
			;		WORK = 6;
	MOVLW 6
	MOVWF WORK,0
			;		value = 0;
	CLRF  value,1
	CLRF  value+1,1
	CLRF  value+2,1
			;		credit = 0;
	CLRF  credit,1
	CLRF  credit+1,1
			;		if(cred6 != 0 && pause == 0)
	MOVF  cred6,W,1
	IORWF cred6+1,W,1
	IORWF cred6+2,W,1
	BZ    m425
	TSTFSZ pause,0
	BRA   m425
			;			{
			;			SECcount = 60;
	MOVLW 60
	MOVWF SECcount,1
	CLRF  SECcount+1,1
			;			REL6_ON(); 
	CALL  REL6_ON
			;			}
			;		while(!EBUT6);
m425	BTFSS 0xF82,EBUT6,0
	BRA   m425
			;		delay(100);		
	MOVLW 100
	CALL  delay
			;		}
			;	else 
	BRA   m427
			;		if((!EBUT6) && pause == 1)
m426	BTFSC 0xF82,EBUT6,0
	BRA   m427
	DECFSZ pause,W,0
	BRA   m427
			;		{
			;		pause = 0;
	CLRF  pause,0
			;		pause_flag = 0;
	CLRF  pause_flag,0
			;		}
			;
			;	}
			;
			;
			;/*
			;
			;if((SECcount > 60) && ((cred1 != 0) || (cred2 != 0) || (cred3 != 0) || (cred4 != 0) || (cred6 != 0)))
			;	{
			;	SECcount = 0;
			;	if(vEN1)
			;		{
			;		conv(cred1);
			;		writeEEPROM(hour,etime1H); delay(10);
			;		writeEEPROM(min,etime1M);  delay(10);
			;		}
			;	if(vEN2)
			;		{
			;		conv(cred2);
			;		writeEEPROM(hour,etime2H); delay(10);
			;		writeEEPROM(min,etime2M);  delay(10);
			;		}
			;	if(vEN3)
			;		{
			;		conv(cred3);
			;		writeEEPROM(hour,etime3H); delay(10);
			;		writeEEPROM(min,etime3M);  delay(10);
			;		}
			;	if(vEN4)
			;		{
			;		conv(cred4);
			;		writeEEPROM(hour,etime4H); delay(10);
			;		writeEEPROM(min,etime4M);  delay(10);
			;		}
			;	if(vEN6)
			;		{
			;		conv(cred6);
			;		writeEEPROM(hour,etime6H); delay(10);
			;		writeEEPROM(min,etime6M);  delay(10);
			;		}
			;	}
			;
			;*/
			;
			;if(wTIME > 3600)
m427	MOVLW 17
	SUBWF wTIME,W,0
	MOVLW 14
	SUBWFB wTIME+1,W,0
	BNC   m428
			;	{
			;	wHour ++;
	INCF  wHour,1,1
	MOVLW 0
	ADDWFC wHour+1,1,1
	ADDWFC wHour+2,1,1
			;	wTIME = 0;
	CLRF  wTIME,0
	CLRF  wTIME+1,0
			;	writeEEPROM(wHour.high8,eHour);  delay(10);
	MOVFF wHour+2,smb_2
	MOVLW 220
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	writeEEPROM(wHour.mid8,eHour+1); delay(10);
	MOVFF wHour+1,smb_2
	MOVLW 221
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	writeEEPROM(wHour.low8,eHour+2); delay(10);
	MOVFF wHour,smb_2
	MOVLW 222
	CALL  writeEEPROM
	MOVLW 10
	CALL  delay
			;	}
			;
			;M:
			;if(!ENTER)
m428	BTFSC 0xF83,ENTER,0
	GOTO  m301
			;	{
			;	lcd_clear();
	CALL  lcd_clear
			;	while(!ENTER);
m429	BTFSS 0xF83,ENTER,0
	BRA   m429
			;	delay(100);
	MOVLW 100
	CALL  delay
			;	pp = 0;
	CLRF  pp,0
			;	SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;	while(SECcount < 120)
m430	MOVF  SECcount+1,W,1
	BTFSS 0xFD8,Zero_,0
	GOTO  m301
	MOVLW 120
	CPFSLT SECcount,1
	GOTO  m301
			;		{
			;		lcd_goto(LINE1);
	MOVLW 128
	CALL  lcd_goto
			;		lcd_puts(Menu[pp].com);
	BCF   0xFD8,Carry,0
	RLCF  pp,W,0
	ADDLW 9
	RCALL _const3
	MOVWF s,0
	TBLRD +*
	MOVF  TABLAT,W,0
	MOVWF s+1,0
	CALL  lcd_puts
			;		lcd_goto(LINE2);
	MOVLW 192
	CALL  lcd_goto
			;		lcd_puts(NOTH);
	MOVLW 181
	MOVWF s,0
	CLRF  s+1,0
	CALL  lcd_puts
			;		if(!DOWN)		// Press DOWN
	BTFSC 0xF83,DOWN,0
	BRA   m432
			;			{
			;			if(pp < 52) pp ++;
	MOVLW 51
	CPFSGT pp,0
	INCF  pp,1,0
			;			while(!DOWN);
m431	BTFSS 0xF83,DOWN,0
	BRA   m431
			;			delay(200);
	MOVLW 200
	CALL  delay
			;			SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;			}
			;		if(!UP)			// Press UP
m432	BTFSC 0xF83,UP,0
	BRA   m434
			;			{
			;			if(pp > 0) pp --;
	TSTFSZ pp,0
	DECF  pp,1,0
			;			while(!UP);
m433	BTFSS 0xF83,UP,0
	BRA   m433
			;			delay(200);
	MOVLW 200
	CALL  delay
			;			SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;			}
			;		if(!ESC) 		// Press ESC
m434	BTFSC 0xF83,ESC,0
	BRA   m436
			;			{
			;			while(!ESC);
m435	BTFSS 0xF83,ESC,0
	BRA   m435
			;			delay(200);
	MOVLW 200
	CALL  delay
			;			lcd_clear();
	CALL  lcd_clear
			;			break;
	GOTO  m301
			;			}
			;		if(!ENTER)		// Press Enter
m436	BTFSC 0xF83,ENTER,0
	BRA   m430
			;			{
			;			while(!ENTER);
m437	BTFSS 0xF83,ENTER,0
	BRA   m437
			;			delay(200);
	MOVLW 200
	CALL  delay
			;			scan_menu(pp);
	MOVF  pp,W,0
	CALL  scan_menu
			;			SECcount = 0;
	CLRF  SECcount,1
	CLRF  SECcount+1,1
			;			}
			;		}	// end while
	BRA   m430
			;	}	// end if
			;
			;goto MODE;
_const1
	RETLW 0
_const2
	MOVF  ci_2,W,0
	ADDLW 28
	MOVWF TBLPTR,0
	MOVLW 49
	ADDWFC ci_2+1,W,0
	MOVWF TBLPTR+1,0
	CLRF  TBLPTR+2,0
	TBLRD *
	MOVF  TABLAT,W,0
	RETURN
	DW    0x2020
	DW    0x4520
	DW    0x5341
	DW    0x2059
	DW    0x4157
	DW    0x4853
	DW    0x2020
	DW    0x2020
	DW    0x4300
	DW    0x6572
	DW    0x6964
	DW    0x3A74
	DW    0x20
	DW    0x6954
	DW    0x656D
	DW    0x203A
	DW    0x5400
	DW    0x6D69
	DW    0x3165
	DW    0x203A
	DW    0x5400
	DW    0x6D69
	DW    0x3265
	DW    0x203A
	DW    0x5400
	DW    0x6D69
	DW    0x3365
	DW    0x203A
	DW    0x5400
	DW    0x6D69
	DW    0x3465
	DW    0x203A
	DW    0x5400
	DW    0x6D69
	DW    0x3565
	DW    0x203A
	DW    0x4C00
	DW    0x56
	DW    0x754F
	DW    0x2074
	DW    0x666F
	DW    0x7320
	DW    0x7265
	DW    0x6976
	DW    0x6563
	DW    0x2020
	DW    0x5400
	DW    0x7365
	DW    0x2074
	DW    0x7473
	DW    0x7261
	DW    0x6574
	DW    0x2064
	DW    0x2020
	DW    0x20
	DW    0x6554
	DW    0x7473
	DW    0x6620
	DW    0x6E69
	DW    0x7369
	DW    0x6568
	DW    0x2064
	DW    0x2020
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x6465
	DW    0x4300
	DW    0x7361
	DW    0x3A68
	DW    0x20
	DW    0x6553
	DW    0x4E72
	DW    0x6D75
	DW    0x203A
	DW    0x4900
	DW    0x736E
	DW    0x7265
	DW    0x2074
	DW    0x6F63
	DW    0x6E69
	DW    0x3A
	DW    0x6553
	DW    0x7474
	DW    0x6E69
	DW    0x7367
	DW    0x7320
	DW    0x7661
	DW    0x6465
	DW    0x2020
	DW    0x2000
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x6E45
	DW    0x6261
	DW    0x656C
	DW    0x2064
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x4400
	DW    0x7369
	DW    0x6261
	DW    0x656C
	DW    0x2064
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x6E45
	DW    0x6261
	DW    0x656C
	DW    0x2F64
	DW    0x6944
	DW    0x6173
	DW    0x6C62
	DW    0x3F65
	DW    0x4400
	DW    0x7369
	DW    0x6261
	DW    0x656C
	DW    0x2F64
	DW    0x6E45
	DW    0x6261
	DW    0x656C
	DW    0x3F
	DW    0x5245
	DW    0x4F52
	DW    0x2052
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x4E00
	DW    0x204F
	DW    0x5245
	DW    0x4F52
	DW    0x5352
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x6F43
	DW    0x746E
	DW    0x6E69
	DW    0x6575
	DW    0x203F
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x4300
	DW    0x6168
	DW    0x6E6E
	DW    0x6C65
	DW    0x3120
	DW    0x203A
	DW    0x4300
	DW    0x6168
	DW    0x6E6E
	DW    0x6C65
	DW    0x3220
	DW    0x203A
	DW    0x4300
	DW    0x6168
	DW    0x6E6E
	DW    0x6C65
	DW    0x3320
	DW    0x203A
	DW    0x4300
	DW    0x6168
	DW    0x6E6E
	DW    0x6C65
	DW    0x3420
	DW    0x203A
	DW    0x4300
	DW    0x6168
	DW    0x6E6E
	DW    0x6C65
	DW    0x3520
	DW    0x203A
	DW    0x2000
	DW    0x6954
	DW    0x656D
	DW    0x6F20
	DW    0x6576
	DW    0x2072
	DW    0x3031
	DW    0x6830
	DW    0x20
	DW    0x2D2D
	DW    0x4D2D
	DW    0x4E45
	DW    0x2055
	DW    0x5453
	DW    0x5241
	DW    0x2D54
	DW    0x2D2D
	DW    0x5600
	DW    0x2054
	DW    0x6F63
	DW    0x6564
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x7542
	DW    0x7474
	DW    0x6E6F
	DW    0x3120
	DW    0x4120
	DW    0x7463
	DW    0x7669
	DW    0x203F
	DW    0x4200
	DW    0x7475
	DW    0x6F74
	DW    0x206E
	DW    0x2032
	DW    0x6341
	DW    0x6974
	DW    0x3F76
	DW    0x20
	DW    0x7542
	DW    0x7474
	DW    0x6E6F
	DW    0x3320
	DW    0x4120
	DW    0x7463
	DW    0x7669
	DW    0x203F
	DW    0x4200
	DW    0x7475
	DW    0x6F74
	DW    0x206E
	DW    0x2034
	DW    0x6341
	DW    0x6974
	DW    0x3F76
	DW    0x20
	DW    0x7542
	DW    0x7474
	DW    0x6E6F
	DW    0x3520
	DW    0x4120
	DW    0x7463
	DW    0x7669
	DW    0x203F
	DW    0x5400
	DW    0x7365
	DW    0x2074
	DW    0x6552
	DW    0x616C
	DW    0x2079
	DW    0x2031
	DW    0x2020
	DW    0x20
	DW    0x6554
	DW    0x7473
	DW    0x5220
	DW    0x6C65
	DW    0x7961
	DW    0x3220
	DW    0x2020
	DW    0x2020
	DW    0x5400
	DW    0x7365
	DW    0x2074
	DW    0x6552
	DW    0x616C
	DW    0x2079
	DW    0x2033
	DW    0x2020
	DW    0x20
	DW    0x6554
	DW    0x7473
	DW    0x5220
	DW    0x6C65
	DW    0x7961
	DW    0x3420
	DW    0x2020
	DW    0x2020
	DW    0x5400
	DW    0x7365
	DW    0x2074
	DW    0x6552
	DW    0x616C
	DW    0x2079
	DW    0x2035
	DW    0x2020
	DW    0x20
	DW    0x6153
	DW    0x656C
	DW    0x7020
	DW    0x6572
	DW    0x6170
	DW    0x6172
	DW    0x2074
	DW    0x2020
	DW    0x5300
	DW    0x6C61
	DW    0x2065
	DW    0x6F76
	DW    0x6F64
	DW    0x7473
	DW    0x7572
	DW    0x6B69
	DW    0x61
	DW    0x6153
	DW    0x656C
	DW    0x7020
	DW    0x7261
	DW    0x736F
	DW    0x7274
	DW    0x6975
	DW    0x616B
	DW    0x5300
	DW    0x6C61
	DW    0x2065
	DW    0x6863
	DW    0x7465
	DW    0x616B
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x6153
	DW    0x656C
	DW    0x7020
	DW    0x6E71
	DW    0x2061
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x5300
	DW    0x6C61
	DW    0x2065
	DW    0x6C61
	DW    0x3A6C
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x764F
	DW    0x7265
	DW    0x6170
	DW    0x3A79
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x5400
	DW    0x746F
	DW    0x6C61
	DW    0x6320
	DW    0x756F
	DW    0x746E
	DW    0x7265
	DW    0x2020
	DW    0x20
	DW    0x6C43
	DW    0x6165
	DW    0x2072
	DW    0x5453
	DW    0x5441
	DW    0x4320
	DW    0x3148
	DW    0x203F
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x5320
	DW    0x4154
	DW    0x2054
	DW    0x4843
	DW    0x3F32
	DW    0x20
	DW    0x6C43
	DW    0x6165
	DW    0x2072
	DW    0x5453
	DW    0x5441
	DW    0x4320
	DW    0x3348
	DW    0x203F
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x5320
	DW    0x4154
	DW    0x2054
	DW    0x4843
	DW    0x3F34
	DW    0x20
	DW    0x6C43
	DW    0x6165
	DW    0x2072
	DW    0x5453
	DW    0x5441
	DW    0x4320
	DW    0x3548
	DW    0x203F
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x4120
	DW    0x6C6C
	DW    0x5320
	DW    0x4154
	DW    0x3F54
	DW    0x20
	DW    0x5541
	DW    0x4944
	DW    0x2054
	DW    0x2D20
	DW    0x203E
	DW    0x4D4D
	DW    0x2F43
	DW    0x4453
	DW    0x4D00
	DW    0x434D
	DW    0x532F
	DW    0x2044
	DW    0x3E2D
	DW    0x4520
	DW    0x5045
	DW    0x4F52
	DW    0x4D
	DW    0x4545
	DW    0x5250
	DW    0x4D4F
	DW    0x2D20
	DW    0x203E
	DW    0x4F43
	DW    0x464E
	DW    0x4749
	DW    0x5300
	DW    0x7465
	DW    0x6320
	DW    0x696F
	DW    0x206E
	DW    0x6174
	DW    0x6C62
	DW    0x2065
	DW    0x20
	DW    0x6552
	DW    0x6461
	DW    0x7020
	DW    0x6572
	DW    0x6170
	DW    0x6172
	DW    0x2074
	DW    0x2020
	DW    0x5200
	DW    0x6165
	DW    0x2064
	DW    0x6F76
	DW    0x6F64
	DW    0x7473
	DW    0x7572
	DW    0x6B69
	DW    0x61
	DW    0x6552
	DW    0x6461
	DW    0x7020
	DW    0x7261
	DW    0x736F
	DW    0x7274
	DW    0x6975
	DW    0x616B
	DW    0x5200
	DW    0x6165
	DW    0x2064
	DW    0x6863
	DW    0x7465
	DW    0x616B
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x6552
	DW    0x6461
	DW    0x7020
	DW    0x6E71
	DW    0x2061
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x5300
	DW    0x7465
	DW    0x7020
	DW    0x6572
	DW    0x6170
	DW    0x6172
	DW    0x2074
	DW    0x2020
	DW    0x20
	DW    0x6553
	DW    0x2074
	DW    0x6F76
	DW    0x6F64
	DW    0x7473
	DW    0x7572
	DW    0x696B
	DW    0x2061
	DW    0x5300
	DW    0x7465
	DW    0x7020
	DW    0x7261
	DW    0x736F
	DW    0x7274
	DW    0x6B75
	DW    0x6169
	DW    0x20
	DW    0x6553
	DW    0x2074
	DW    0x6863
	DW    0x7465
	DW    0x616B
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x5300
	DW    0x7465
	DW    0x7020
	DW    0x6E71
	DW    0x2061
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x6E49
	DW    0x6968
	DW    0x6962
	DW    0x2074
	DW    0x6573
	DW    0x7474
	DW    0x6E69
	DW    0x7367
	DW    0x5300
	DW    0x6174
	DW    0x7472
	DW    0x7320
	DW    0x7465
	DW    0x6974
	DW    0x676E
	DW    0x2073
	DW    0x20
	DW    0x4C42
	DW    0x7320
	DW    0x7465
	DW    0x6974
	DW    0x676E
	DW    0x2073
	DW    0x2020
	DW    0x2020
	DW    0x4100
	DW    0x5455
	DW    0x534F
	DW    0x4154
	DW    0x5452
	DW    0x7620
	DW    0x6C61
	DW    0x6575
	DW    0x20
	DW    0x7245
	DW    0x6F72
	DW    0x2072
	DW    0x6F6C
	DW    0x2067
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x4520
	DW    0x7272
	DW    0x726F
	DW    0x6C20
	DW    0x676F
	DW    0x20
	DW    0x6C43
	DW    0x6165
	DW    0x2072
	DW    0x7263
	DW    0x6465
	DW    0x7469
	DW    0x3120
	DW    0x2020
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x6320
	DW    0x6572
	DW    0x6964
	DW    0x2074
	DW    0x2032
	DW    0x20
	DW    0x6C43
	DW    0x6165
	DW    0x2072
	DW    0x7263
	DW    0x6465
	DW    0x7469
	DW    0x3320
	DW    0x2020
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x6320
	DW    0x6572
	DW    0x6964
	DW    0x2074
	DW    0x2034
	DW    0x20
	DW    0x6C43
	DW    0x6165
	DW    0x2072
	DW    0x7263
	DW    0x6465
	DW    0x7469
	DW    0x3520
	DW    0x2020
	DW    0x4300
	DW    0x656C
	DW    0x7261
	DW    0x6F20
	DW    0x6576
	DW    0x7072
	DW    0x7961
	DW    0x2020
	DW    0x20
	DW    0x2D2D
	DW    0x2D2D
	DW    0x454D
	DW    0x554E
	DW    0x4520
	DW    0x444E
	DW    0x2D2D
	DW    0x2D2D
	DW    0x0
_const3
	MOVWF ci_3,0
	ADDLW 64
	MOVWF TBLPTR,0
	MOVLW 54
	CLRF  TBLPTR+1,0
	ADDWFC TBLPTR+1,1,0
	CLRF  TBLPTR+2,0
	TBLRD *
	MOVF  TABLAT,W,0
	RETURN
	DW    0x3631
	DW    0x3330
	DW    0x3431
	DW    0x3630
	DW    0x8A00
	DW    0x9B01
	DW    0xAC01
	DW    0xBD01
	DW    0xCE01
	DW    0xDF01
	DW    0xF001
	DW    0x101
	DW    0x1202
	DW    0x2302
	DW    0x3402
	DW    0x4502
	DW    0x5602
	DW    0x6702
	DW    0x7802
	DW    0x8902
	DW    0x9A02
	DW    0xAB02
	DW    0xBC02
	DW    0xCD02
	DW    0xDE02
	DW    0xEF02
	DW    0x2
	DW    0x1103
	DW    0x2203
	DW    0x3303
	DW    0x4403
	DW    0x5503
	DW    0x6603
	DW    0x7703
	DW    0x8803
	DW    0x9903
	DW    0xAA03
	DW    0xBB03
	DW    0xCC03
	DW    0xDD03
	DW    0xEE03
	DW    0xFF03
	DW    0x1003
	DW    0x2104
	DW    0x3204
	DW    0x4304
	DW    0x5404
	DW    0x6504
	DW    0x7604
	DW    0x8704
	DW    0x9804
	DW    0xA904
	DW    0xBA04
	DW    0xCB04
	DW    0xDC04
	DW    0xED04
	DW    0xFE04
	DW    0x4104
	DW    0xE1A0
	DW    0x45E0
	DW    0xA1AA
	DW    0xA558
	DW    0x4BA3
	DW    0x4DA7
	DW    0x4F48
	DW    0xB0A8
	DW    0x4350
	DW    0xA954
	DW    0xB142
	DW    0xABAD
	DW    0x61A4
	DW    0xE5B2
	DW    0x65E3
	DW    0xB4E4
	DW    0xB878
	DW    0xBAB6
	DW    0xBCBB
	DW    0x6FBD
	DW    0xC6BE
	DW    0x6370
	DW    0x79BF
	DW    0xC7B3
	DW    0xC0C2
	DW    0xB7
_const5
	MOVWF ci_4,0
	ADDLW 252
	MOVWF TBLPTR,0
	MOVLW 54
	CLRF  TBLPTR+1,0
	ADDWFC TBLPTR+1,1,0
	CLRF  TBLPTR+2,0
	TBLRD *
	MOVF  TABLAT,W,0
	RETURN
	DW    0x2020
	DW    0x2020
	DW    0x7250
	DW    0x7065
	DW    0x7261
	DW    0x7461
	DW    0x2020
	DW    0x2020
	DW    0x2000
	DW    0x2020
	DW    0x6F56
	DW    0x6F64
	DW    0x7473
	DW    0x7572
	DW    0x6B3E
	DW    0x2061
	DW    0x20
	DW    0x2020
	DW    0x5020
	DW    0x7261
	DW    0x736F
	DW    0x7274
	DW    0x3E75
	DW    0x616B
	DW    0x2020
	DW    0x2000
	DW    0x2020
	DW    0x2020
	DW    0x6559
	DW    0x6B74
	DW    0x2061
	DW    0x2020
	DW    0x2020
	DW    0x20
	DW    0x2020
	DW    0x2020
	DW    0x5020
	DW    0x6E77
	DW    0x2061
	DW    0x2020
	DW    0x2020
	DW    0x2020
	DW    0x2000
	DW    0x5550
	DW    0x4E53
	DW    0x5445
	DW    0x2045
	DW    0x454A
	DW    0x4F54
	DW    0x204E
	DW    0x20
	DW    0x524B
	DW    0x4445
	DW    0x5449
	DW    0x4E00
	DW    0x5041
	DW    0x4152
	DW    0x4556
	DW    0x4554
	DW    0x4920
	DW    0x425A
	DW    0x524F
	DW    0x20
	DW    0x564C
	DW    0x2000
	DW    0x2020
	DW    0x2020
	DW    0x4150
	DW    0x5A55
	DW    0x2041
	DW    0x2020
	DW    0x2020
	DW    0x20

	END


; *** KEY INFO ***

; 0x0001D6   87 word(s)  0 % : scan
; 0x00022D    7 word(s)  0 % : REL1_ON
; 0x000234    7 word(s)  0 % : REL2_ON
; 0x00023B    7 word(s)  0 % : REL3_ON
; 0x000242    7 word(s)  0 % : REL4_ON
; 0x000249    7 word(s)  0 % : REL6_ON
; 0x000250    7 word(s)  0 % : REL_OFF
; 0x0000A4    4 word(s)  0 % : _highPriorityInt
; 0x000004    2 word(s)  0 % : highPriorityIntServer
; 0x00000C  152 word(s)  0 % : lowPriorityIntServer
; 0x0000A8    7 word(s)  0 % : SPI_Send
; 0x0000AF    7 word(s)  0 % : SPI_setup
; 0x0000B6   12 word(s)  0 % : PCcmd
; 0x0000C2    4 word(s)  0 % : terminate
; 0x0000C6    6 word(s)  0 % : PC_TX
; 0x001883    1 word(s)  0 % : _const1
; 0x0000CC   19 word(s)  0 % : _divU16_8
; 0x0000DF   18 word(s)  0 % : _remU16_8
; 0x0000F1   43 word(s)  0 % : SYSTEM_setup
; 0x00011C   15 word(s)  0 % : ini
; 0x00012B   18 word(s)  0 % : ADC
; 0x00013D    8 word(s)  0 % : delay
; 0x000145   12 word(s)  0 % : delaySec
; 0x000151  104 word(s)  0 % : conv
; 0x0001B9    7 word(s)  0 % : start_int
; 0x0001C0    8 word(s)  0 % : ESCbut
; 0x0001C8   14 word(s)  0 % : hex2dec
; 0x000257   10 word(s)  0 % : readEEPROM
; 0x000261   16 word(s)  0 % : writeEEPROM
; 0x000271  205 word(s)  1 % : Load
; 0x00033E  249 word(s)  1 % : cr_to_time
; 0x000437  280 word(s)  1 % : time_to_cr
; 0x00054F   30 word(s)  0 % : lcd_write
; 0x00056D   22 word(s)  0 % : lcd_setup
; 0x000583    3 word(s)  0 % : lcd_goto
; 0x000586    6 word(s)  0 % : lcd_clear
; 0x00058C   21 word(s)  0 % : lcd_puts
; 0x0005FB   56 word(s)  0 % : lcd_credit
; 0x000633   55 word(s)  0 % : lcd_time
; 0x00066A  158 word(s)  0 % : lcd_money
; 0x000708   14 word(s)  0 % : lcd_out
; 0x000716    8 word(s)  0 % : st_clear
; 0x00071E   13 word(s)  0 % : print_total
; 0x0005EC   15 word(s)  0 % : lcd_puts_cyr
; 0x0005A1   75 word(s)  0 % : lat2cyr
; 0x001884  658 word(s)  4 % : _const2
; 0x001B16   94 word(s)  0 % : _const3
; 0x001B74   83 word(s)  0 % : _const5
; 0x00072B 1929 word(s) 11 % : scan_menu
; 0x000EB4   64 word(s)  0 % : en_to_dis
; 0x000EF4  219 word(s)  1 % : test
; 0x000FCF 2228 word(s) 13 % : main

; RAM usage: 706 bytes (34 local), 830 bytes free
; Maximum call level: 4 (+2 for interrupt)
; Total of 7103 code words (43 %)
