// The bootstrap ABI keeps the serial base in r0 and returns data/status in r1.
// The final status test must also return its Z flag to the assembly caller.
register volatile unsigned short *serialBase asm("r0");
register unsigned serialValue asm("r1");
void sio_polling(void)
{
    do { serialValue = serialBase[4]; asm("" : "+r"(serialValue)); } while (!(serialValue & 0x80));
    do { serialValue = serialBase[4]; asm("" : "+r"(serialValue)); } while (serialValue & 0x80);
    serialValue = serialBase[4];
    if (serialValue & 0x40)
        return;
    serialValue = serialBase[0];
    asm("" : "+r"(serialValue));
}
