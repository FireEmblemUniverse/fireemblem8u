// Private bootstrap ABI; the caller consumes Z directly from sio_polling.
register volatile unsigned short *serialBase asm("r0");
register unsigned serialValue asm("r1");
register unsigned serialExpected asm("r2");
register volatile unsigned short *serialHeader asm("r3");
extern void sio_polling(void);
extern void SerialDecompressAndJump(void) __attribute__((noreturn));
static __inline__ int poll_failed(void)
{
    unsigned failed;
    sio_polling();
    asm("" : "=@ccne"(failed));
    return failed;
}
void __attribute__((noreturn)) SerialReset(void)
{
    serialBase = (volatile unsigned short *)0x04000120;
restart:
    if (poll_failed()) goto restart;
    serialExpected = 0;
    serialBase[5] = serialExpected;
    if (serialValue != 0) goto restart;
    serialExpected = 0x8000;
sequence:
    serialValue = 0;
exchange:
    serialBase[5] = serialValue;
    if (poll_failed()) goto restart;
    if (serialValue != serialExpected) goto sequence;
    serialExpected >>= 5;
    if (serialValue != 0) goto exchange;
    serialHeader = (volatile unsigned short *)0x020000ac;
    serialExpected = serialHeader[0];
    serialBase[5] = serialExpected;
    if (poll_failed()) goto failed;
    if (serialValue != serialExpected) goto failed;
    serialExpected = serialHeader[1];
    serialBase[5] = serialExpected;
    if (poll_failed()) goto failed;
    if (serialValue != serialExpected) goto failed;
    serialValue = 0;
    serialBase[5] = serialValue;
    SerialDecompressAndJump();
failed:
    for (;;) {}
}
