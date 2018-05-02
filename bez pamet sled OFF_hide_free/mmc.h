/********************  DEFINITION FOR MMC CARD  ********************/

#define	CMD0		0x40	// GO_IDLE_STATE 
#define	CMD1		0x41	// SEND_OP_COND
#define CMD9		0x49	// READ_CSD 
#define CMD10 		0x4A    // SEND_CID
#define	CMD12		0x4C	// STOP_TRANSMISSION
#define CMD13	 	0x4D    // SEND_STATUS
#define	CMD16		0x50	// SET_BLOCKLEN 
#define	CMD17		0x51	// READ_SINGLE_BLOCK 
#define	CMD18		0x52	// READ_MULTIPLE_BLOCK 
#define	CMD24		0x58	// WRITE_BLOCK 
#define	CMD25		0x59	// WRITE_MULTIPLE_BLOCK 
#define CMD27 		0x5B	// WRITE_CSD
#define CMD28	 	0x5C    // SET_WRITE_PROT
#define CMD29	 	0x5D    // CLR_WRITE_PROT
#define CMD30	 	0x5E    // SEND_WRITE_PROT
#define CMD41		0x69	// SEND_OP_COND (ACMD)
#define CMD55		0x77	// APP_CMD
#define CMD59		0x7B	// CRC_ON_OFF

#define	SingleBR	0xFE	// Single Block Read
#define	SingleBW	0xFE	// Single Block Read

#define	DataResponse 0x05

/********************  FUNCTIONS FOR MMC CARD  ********************/

char MMC_Init(void);							// MMC Init routine
char MMC_Read(uns16,uns16);						// Read single block
char MMC_Write(uns16,uns16);					// Write single block
uns8 MMC_Cmd(uns8,uns16,uns16,uns8);			// MMC command routine
uns8 MMC_Busy(void);							// MMC card Busy

/*----------------------------------------*/

/*
char MMC_Init(void)
{
uns8 i;
uns8 r1;

// RESET card
i = 0xFF;
do
	{
	SPI_Send(0xFF);
	SPI_Send(0xFF);
	SPI_Send(0xFF);
	SPI_Send(0xFF);
	CS_MMC = 0;										// enable MMC
	r1 = MMC_Cmd(CMD0,0x0000,0x0000,0x95);			// Reset command
	CS_MMC = 1;										// disable MMC
	SPI_Send(0xFF);
	i --;
	}
while(((r1 & 0xF7) != 0x01) && (i != 0));
if(i == 0) return 0;								// MMC error

i = 0xFF;
do
	{
	// SD INIT CMD55
	CS_MMC = 0;									// enable MMC
	r1 = MMC_Cmd(CMD55,0x0000,0x0000,0xFF);		// Init command
	CS_MMC = 1;
	SPI_Send(0xFF);

	// SD INIT ACMD41 (not supported by MMC card)
	CS_MMC = 0;									// enable MMC
	r1 = MMC_Cmd(CMD41,0x0000,0x0000,0xFF);		// Init command
	CS_MMC = 1;									// disable MMC
	SPI_Send(0xFF);
	i --;
	}
while(((r1 & 0x01) != 0x00) && (i != 0)); 

if(i == 0)
	{
	// INIT card
	i = 0xFF;
	do
		{
		CS_MMC = 0;									// enable MMC
		r1 = MMC_Cmd(CMD1,0x0000,0x0000,0xFF);		// Init command
		CS_MMC = 1;									// disable MMC
		SPI_Send(0xFF);
		i --;
		}
	while((r1 != 0x00) && (i != 0));
	if(i == 0) return 0;
	}

// CRC_OFF
CS_MMC = 0;											// enable MMC
r1 = MMC_Cmd(CMD59,0x0000,0x0000,0xFF);				// CRC OFF
CS_MMC = 1;											// disable MMC
SPI_Send(0xFF);

// Set BLOCK LENGTH 
CS_MMC = 0;											// enable MMC
r1 = MMC_Cmd(CMD16,0x0000,0x0200,0xFF);				// Set blocklength
CS_MMC = 1;											// disable MMC
SPI_Send(0xFF);

return 1;											// MMC error
}
*/

/*----------------------------------------*/

/*
char MMC_Read(uns16 addrH, uns16 addrL)
{
uns8 r1;
uns16 i;
uns16 count;

CS_MMC = 0;											// enable MMC card
r1 = MMC_Cmd(CMD17, addrH, addrL, 0xFF);			// Send read command
if(r1 != 0x00) return 0;							// Error state
count = 0xFFF;
while((SPI_Send(0xFF) != SingleBR) && (count != 0)) count --;
if(count == 0) 
	{
	CS_MMC = 1;
	SPI_Send(0xFF);
	return 0;			
	}

for(i=0; i<512; i++)	
	{
	r1 = SPI_Send(0xFF);							// receive 512 bytes
	mmc[i] = r1;
	}
SPI_Send(0xFF);										// send 2 bytes
SPI_Send(0xFF);
CS_MMC = 1;											// disable MMC card
SPI_Send(0xFF);
return 1;
}
*/

/*----------------------------------------*/

/*
char MMC_Write(uns16 addrH, uns16 addrL)
{
	uns16 i;
	uns8 r1;
	
	CS_MMC = 0;
	r1 = MMC_Cmd(CMD24, addrH, addrL, 0xFF);	// Send write command	
	if(r1 != 0x00) return 0;					// Error state
	SPI_Send(SingleBW);							// Send 0xFE byte
	for(i=0;i<512;i++) SPI_Send(mmc[i]);		// Send data stream
	SPI_Send(0xFF);
	SPI_Send(0xFF);
	r1 = SPI_Send(0xFF);
	if((r1 & 0x1F) != DataResponse)				// Check MMC answer
		{
		CS_MMC = 1;
		SPI_Send(0xFF);
		return 0;
		}
	r1 = MMC_Busy();
	CS_MMC = 1;
	SPI_Send(0xFF);
	return 1;
}
*/

/*----------------------------------------*/

/*
uns8 MMC_Cmd(uns8 cmd1, uns16 addrH, uns16 addrL, uns8 cmd2)
{
uns8 r1;
uns16 count;

SPI_Send(cmd1);
SPI_Send(addrH.high8);
SPI_Send(addrH.low8);
SPI_Send(addrL.high8);
SPI_Send(addrL.low8);
SPI_Send(cmd2);
	
count = 0xFFF;
do
	{
	r1 = SPI_Send(0xFF);
	count --;
	}
while((count != 0) && (r1 == 0xFF));
return r1;
}

*/

/*----------------------------------------*/

/*

uns8 MMC_Busy(void)
{
	uns8 r1;
	uns16 count;
	
	count = 0xFFF;
	do  
		{
        r1 = SPI_Send(0xFF);
		count --;
		}
 	while((count != 0) && (r1 == 0x00));
	return r1;
}

/*----------------------------------------*/
*/
