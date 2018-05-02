void PCcmd(const char*);					// send string to PC
void terminate(void);						// Send CR/LF
void PC_TX(uns8);							// send char to PC

/*----------------------------------------*/

void PCcmd(const char *cmd)
{
while(*cmd) PC_TX(*cmd++);
}

/*-----------------------------------------*/
void terminate(void)						// Send CR/LF
{
PC_TX(CR);
PC_TX(LF);
}

/*-----------------------------------------*/

void PC_TX(uns8 smb)
{
TXREG = smb;								// send symbol
while(!TRMT);
}

/*-----------------------------------------*/
