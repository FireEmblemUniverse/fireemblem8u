// Private bootstrap ABI; the caller consumes Z directly from sio_polling.
register volatile unsigned short *serialBase asm("r0");
register unsigned serialValue asm("r1");
register unsigned serialExpected asm("r2");
register volatile unsigned short *serialHeader asm("r3");
extern void sio_polling(void);
register void (*serialEntry)(void) asm("lr");
static __inline__ int poll_failed(void)
{
    unsigned succeeded;
    sio_polling();
    asm volatile("" : "=@cceq"(succeeded));
    return !succeeded;
}
void __attribute__((matching_arm_lr_transfer)) __attribute__((noreturn)) SerialReset(void)
{
    unsigned accepted;
    serialBase = (volatile unsigned short *)0x04000120;
restart:
    if (poll_failed()) goto restart;
    serialExpected = 0;
    asm volatile("" : "+r"(serialExpected));
    serialBase[5] = serialExpected;
    asm volatile("" : "+r"(serialValue));
    if (serialValue != 0) goto restart;
    serialExpected = 0x8000;
sequence:
    asm volatile("" : : : "r1");
    serialValue = 0;
    asm volatile("" : "+r"(serialValue));
exchange:
    serialBase[5] = serialValue;
    if (poll_failed()) goto restart;
    if (serialValue != serialExpected) goto sequence;
    asm volatile("" : "+r"(serialExpected));
    serialExpected >>= 5;
    asm volatile("" : "+r"(serialValue));
    if (serialValue != 0) goto exchange;
    serialHeader = (volatile unsigned short *)0x020000ac;
    asm volatile("" : "+r"(serialHeader));
    serialExpected = serialHeader[0];
    serialBase[5] = serialExpected;
    sio_polling();
// Re-read the private Z result at the common halt/recheck point.
// A mismatched comparison leaves Z clear, so this loop cannot recover.
header_check:
    asm volatile("" : "=@cceq"(accepted));
    if (!accepted) goto header_check;
    if (serialValue != serialExpected) goto header_check;
    serialExpected = serialHeader[1];
    serialBase[5] = serialExpected;
    if (poll_failed()) goto header_check;
    if (serialValue != serialExpected) goto header_check;
    asm volatile("" : : : "r1");
    serialValue = 0;
    asm volatile("" : "+r"(serialValue));
    serialBase[5] = serialValue;
    serialBase=(volatile unsigned short *)0x020002b0;
    serialValue=0x02010000;
    asm volatile("svc #0x110000" : "+r"(serialBase), "+r"(serialValue)
                 : : "r2", "r3", "ip", "cc", "memory");
    serialEntry=(void (*)(void))0x02010000;
    asm volatile("" : "+r"(serialEntry));
    serialEntry();
    __builtin_unreachable();
}
