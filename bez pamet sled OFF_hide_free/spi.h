uns8 SPI_Send(uns8);							// SPI send routine
void SPI_setup(void);							// slow speed SPI Init low speed routine

/*----------------------------------------*/

uns8 SPI_Send(uns8 dat)
{
	SSPBUF = dat;									// send character
	while(!BF);										// wait until sent
	return SSPBUF;									// and return the received character
}

/*----------------------------------------*/

void SPI_setup(void)
{
	SSPCON1 = 0x02;									// clear register, Master, Fosc/64	(250kbps @ 16MHz)
	SMP = 0;										// input is valid in the middle of clock
	CKE = 0;										// rising edge is data capture
	CKP = 1;										// high value is passive state
	SSPEN = 1;
}

/*----------------------------------------*/

