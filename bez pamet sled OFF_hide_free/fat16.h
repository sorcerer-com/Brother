char readMBR(void);				// Read Master Boot Record Table
char readBRT(void);				// Read FAT Boot Record Table
void UpdateFAT(void);			// Update FAT data
void SecLoad(void);				// Load sectors
void SecSearch(void);			// Find last sector
void next(void);				// Goto next sector
void CardDetect(void);			// detect MMC/SD card

/*-----------------------------------------*/

char readMBR(void)
{
MMC_Read(0x0000,0x0000); 		
sec_mbr.low8   = mmc[454];		// get #Sectors between MBR and Partition
sec_mbr.high8  = mmc[455];		// get #Sectors between MBR and Partition								
sec_part.low8  = mmc[458];		// get #Sectors in Partition							
sec_part.mid8  = mmc[459];		//														
sec_part.high8 = mmc[460];		//														
sec_part --;
if(mmc[450] == 0x06) return 1;	// check type of partition FAT16 >32MB
else return 0;
}

/*-----------------------------------------*/

char readBRT(void)
{
uns16 BRTtemp;
uns24 Mbr;

Mbr = (uns24)sec_mbr * 512;					//												
MMC_Read((uns16)Mbr.high8,Mbr.low16);		
Sec_per_cluster 	= mmc[13];				// Sectors per cluster							
Res_sec.low8   		= mmc[14];				// Reserved sectors (LSB)
Res_sec.high8   	= mmc[15];				// Reserved sectors (MSB)								
Max_Root_Dir.low8   = mmc[17];				// Maximum Root Directory Entry	(LSB)				
Max_Root_Dir.high8  = mmc[18];				// Maximum Root Directory Entry	(MSB)												
Sec_Per_FAT.low8	= mmc[22];				// Sectors per FAT (LSB)	
Sec_Per_FAT.high8	= mmc[23];				// Sectors per FAT (MSB)					
Fat_Start1 = sec_mbr + Res_sec;				// FAT1 first sector							
Fat_Start2 = Fat_Start1 + Sec_Per_FAT;		// FAT2 first sector							
Root_Dir_Entry  = Fat_Start2 + Sec_Per_FAT;	// Root Directory Entry sector	
BRTtemp = Max_Root_Dir / 16;				// 	
Data_area = Root_Dir_Entry + BRTtemp;		// Data area sector								
if(mmc[21] == 0xF8) return 1;				// check Media descriptor
else return 0;
}

/*-----------------------------------------*/

void SecLoad(void)
{
uns24 Data;
uns16 nextCluster;

Data = (uns24)Data_area * 512;				// Data address
CONFIG_H.high8 = NULL;
CONFIG_H.low8  = Data.high8;
CONFIG_L.high8 = Data.mid8;
CONFIG_L.low8  = Data.low8;

nextCluster = Sec_per_cluster * 512;

START_DATA_H = CONFIG_H;
START_DATA_L = CONFIG_L + nextCluster;

Data = sec_part * 2;
FINAL_DATA_H.high8 = Data.high8;
FINAL_DATA_H.low8  = Data.mid8;
FINAL_DATA_L.high8 = Data.low8;
FINAL_DATA_L.low8  = NULL;
}

/*-----------------------------------------*/

void UpdateFAT(void)
{
uns24 RootDir;

RootDir = (uns24)Root_Dir_Entry * 512;		// RootDir address
MMC_Read((uns16)RootDir.high8,RootDir.low16);
delay(100);
MMC_Write((uns16)RootDir.high8,RootDir.low16);			// Write RootDir data}
}

/*-----------------------------------------*/

void SecSearch(void)
{
uns16 stp;

stp = 0x0100;
addr_H = START_DATA_H;
addr_L = START_DATA_L;

/* read first data sector */
MMC_Read(addr_H,addr_L);
if(mmc[FLAG_POS] != FLAG) return;

/* found last log record */
do
	{
	addr_H += stp;
	if(addr_H > FINAL_DATA_H) 
		{
		addr_H -= stp;
		stp >>= 1;
		}
	MMC_Read(addr_H,addr_L);
	if(mmc[FLAG_POS] != FLAG)
		{
		addr_H -= stp;
		stp >>= 1;
		}
	}
while(stp != 0x0000);

SECcount = 0;
while(1)
	{
	next();
	MMC_Read(addr_H,addr_L);
	if(mmc[FLAG_POS] != FLAG) break;
	if(SECcount > 30)
		{
		addr_H = START_DATA_H;
		addr_L = START_DATA_L;
		return;
		}
	}
}

/*-----------------------------------------*/

void next(void)
{
if(addr_L == 0xFE00)				// update Last address by BLOCL_LEN
	{
	addr_H ++;
	addr_L = 0x0000;
	}
else addr_L += 512;
if((addr_H >= FINAL_DATA_H) && (addr_L >= FINAL_DATA_L))
	{
	addr_H = START_DATA_H;
	addr_L = START_DATA_L;
	}
}

/*----------------------------------------*/

void CardDetect(void)
{
card = MMC_Init(); 					// MMC ini routine
if(card) 
	{
	readMBR();
	readBRT();
	SecLoad();
	}
}

/*----------------------------------------*/