uns8 readEEPROM(uns8);			// read EEPROM cells
void writeEEPROM(uns8, uns8);	// write to eeprom
void Load(void);				// Load EEPROM values
void cr_to_time(char);			// convert credit to time
void time_to_cr(char);			// convert left time to credit
/*-----------------------------------------*/

uns8 readEEPROM(uns8 address)
{
uns8 byte;                     	// Variable hold the data that is read

EEADR = address;               	// Read from this address
EEPGD = 0;                     	// Point to EE memory
CFGS = 0;						// EEPROM address
RD = 1;                     	// Initiate a read cycle
byte = EEDATA;                 	// Fetch byte from data register

return byte;                   	// Return the read byte
}

/*-----------------------------------------*/

void writeEEPROM(uns8 smb, uns8 addr)
{
EEADR = addr;		// set address
EEDATA = smb;		// set symbol to be written
CFGS = 0;			// EEPROM address
WREN = 1;			// enable write
EECON2 = 0x55;		// Write "password" to EECON2
EECON2 = 0xAA;
WR = 1;				// Initiate a write cycle
while(WR);			// Wait for write to complete
WREN = 0;			// disable write
}

/*----------------------------------------*/

void Load(void)
{
vEN1 = readEEPROM(eEN1); delay(1);
vEN2 = readEEPROM(eEN2); delay(1);
vEN3 = readEEPROM(eEN3); delay(1);
vEN4 = readEEPROM(eEN4); delay(1);
vEN6 = readEEPROM(eEN6); delay(1);
//vZumer = readEEPROM(eZumer); delay(1);
//vOpto1 = readEEPROM(eOpto1); delay(1);
//vOpto2 = readEEPROM(eOpto2); delay(1);
vBL = readEEPROM(eBL); delay(1);
vAUTOSTART = readEEPROM(eAUTOSTART); delay(1);
vCounter.high8 = readEEPROM(eCounterH); delay(1);
vCounter.low8  = readEEPROM(eCounterL); delay(1);

vOPA = readEEPROM(eOPA); delay(1);
vOPB = readEEPROM(eOPB); delay(1);
vOPC = readEEPROM(eOPC); delay(1);
vOPD = readEEPROM(eOPD); delay(1);
vOPE = readEEPROM(eOPE); delay(1);
vOPF = readEEPROM(eOPF); delay(1);

/*
// calculate remaining time
retvalue = readEEPROM(etime1H); delay(1);
cred1 = (uns24)retvalue * 60;
retvalue  = readEEPROM(etime1M); delay(1);
cred1 += retvalue;
cred1 *= 60;
retvalue = readEEPROM(etime2H); delay(1);
cred2 = (uns24)retvalue * 60;
retvalue  = readEEPROM(etime2M); delay(1);
cred2 += retvalue;
cred2 *= 60;
retvalue = readEEPROM(etime3H); delay(1);
cred3 = (uns24)retvalue * 60;
retvalue  = readEEPROM(etime3M); delay(1);
cred3 += retvalue;
cred3 *= 60;
retvalue = readEEPROM(etime4H); delay(1);
cred4 = (uns24)retvalue * 60;
retvalue  = readEEPROM(etime4M); delay(1);
cred4 += retvalue;
cred4 *= 60;
retvalue = readEEPROM(etime6H); delay(1);
cred6 = (uns24)retvalue * 60;
retvalue  = readEEPROM(etime6M); delay(1);
cred6 += retvalue;
cred6 *= 60;

*/

vINH = readEEPROM(eINH); delay(1);
vComm = readEEPROM(eComm); delay(1);

overpay.high8 = readEEPROM(eoverH); delay(1);
overpay.mid8  = readEEPROM(eoverM); delay(1);
overpay.low8  = readEEPROM(eoverL); delay(1);

total1.high8 = readEEPROM(etotal1H); delay(1);
total1.mid8  = readEEPROM(etotal1M); delay(1);
total1.low8  = readEEPROM(etotal1L); delay(1);

total2.high8 = readEEPROM(etotal2H); delay(1);
total2.mid8  = readEEPROM(etotal2M); delay(1);
total2.low8  = readEEPROM(etotal2L); delay(1);

total3.high8 = readEEPROM(etotal3H); delay(1);
total3.mid8  = readEEPROM(etotal3M); delay(1);
total3.low8  = readEEPROM(etotal3L); delay(1);

total4.high8 = readEEPROM(etotal4H); delay(1);
total4.mid8  = readEEPROM(etotal4M); delay(1);
total4.low8  = readEEPROM(etotal4L); delay(1);

total6.high8 = readEEPROM(etotal6H); delay(1);
total6.mid8  = readEEPROM(etotal6M); delay(1);
total6.low8  = readEEPROM(etotal6L); delay(1);

NONpay.high8 = readEEPROM(eNONpayH); delay(1);
NONpay.mid8  = readEEPROM(eNONpayM); delay(1);
NONpay.low8  = readEEPROM(eNONpayL); delay(1);

wHour.high8  = readEEPROM(eHour); delay(1);
wHour.mid8   = readEEPROM(eHour+1); delay(1);
wHour.low8   = readEEPROM(eHour+2); delay(1);
}

/*-----------------------------------------*/

void cr_to_time(char ch)
{
char overload;
char addr;
uns8 val;
uns16 x2;
uns16 a,b;
uns24 y2;

if(credit == 0)	
	{
	value = 0;
	return;
	}

overload = 0;
if(ch == 1) addr = eeprom_start;
if(ch == 2) addr = eeprom_start + 5;
if(ch == 3) addr = eeprom_start + 0x60;
if(ch == 4) 
	{
	addr = eeprom_start + 0x60;
	addr = addr + 5;
	}
if(ch == 6) addr = eeprom_start + 0x0B;

for(ind=0;ind<10;ind++)
	{
	val = readEEPROM(addr);	
	if(val == 0xFF) overload = 1;
	if(overload) break;	
	x2 = (uns16)val * 100;
	val = readEEPROM(addr+1);	
	x2 +=(uns16)val;
	if(credit <= x2) break;
	addr += 0x10;
	}

if(overload) addr -= 0x10;
addr += 2;
val = readEEPROM(addr); 	y2 = (uns24)val * 3600;
val = readEEPROM(addr+1); 	
temp = (uns16)val * 60;		y2 += (uns24)temp;
val = readEEPROM(addr+2); 	y2 += (uns24)val;

a = y2 / x2;
b = y2 % x2;
value = (uns24)a * credit;
y2 = (uns24)b * credit;
y2 /= x2;
value +=  y2;
}

/*-----------------------------------------*/

void time_to_cr(char ch)
{
char overload;
uns8 addr;
uns8 val;
uns16 x2;
uns16 a,b;
uns16 cred;
uns24 y2;

overload = 0;
if(ch == 1) 
 {
 addr = eeprom_start;
 cred = cred1;
 cred1 = 0;
 }
if(ch == 2) 
 {
 addr = eeprom_start + 5;
 cred = cred2;
 cred2 = 0;
 }
if(ch == 3) 
 {
 addr = eeprom_start + 0x60;
 cred = cred3;
 cred3 = 0;
 }
if(ch == 4) 
 {
 addr = eeprom_start + 0x65;
 cred = cred4;
 cred4 = 0;
 }
if(ch == 6) 
 {
 addr = eeprom_start + 0x0B;
 cred = cred6;
 cred6 = 0;
 }

addr += 2;
for(ind=0;ind<10;ind++)
 {
 val = readEEPROM(addr);  
 if(val == 0xFF) 
  {
  overload = 1;
  break; 
  }
 y2 = (uns24)val * 3600;
 val = readEEPROM(addr+1);  
 temp = (uns16)val * 60;  y2 += (uns24)temp;
 val = readEEPROM(addr+2);  y2 += (uns24)val;
 if(cred <= y2) break;
 addr += 0x10;
 }

if(overload) addr -= 0x10;
addr -= 2;
val = readEEPROM(addr); 
x2 = (uns16)val * 100;
val = readEEPROM(addr+1); 
x2 +=(uns16)val;

a = y2 / x2;
b = y2 % x2;
y2 = (uns24)cred * x2;
temp = (uns24)a * x2;
x2 = temp + b;
credit = y2 / x2;
}

/*-----------------------------------------*/


