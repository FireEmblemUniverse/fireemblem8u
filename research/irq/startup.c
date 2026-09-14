// Research: processor-mode writes remain explicitly assembly-owned.
register unsigned startupValue asm("r0");
register unsigned startupPointer asm("r1");
register unsigned *startupStack asm("sp");
register unsigned startupLink asm("lr");
extern unsigned __sp_irq[], __sp_usr[];
extern void IrqMain(void), AgbMain(void);
#ifdef RESEARCH_STARTUP_FRAME
#define STARTUP_FRAME __attribute__((research_arm_startup_frame))
#else
#define STARTUP_FRAME
#endif
void __attribute__((noreturn)) STARTUP_FRAME Startup(void)
{
    for (;;) {
        startupValue = 0x12;
        asm volatile("msr cpsr_fc, %2" : "+k"(startupStack), "+r"(startupLink)
                     : "r"(startupValue) : "memory");
        startupStack = __sp_irq;
        asm volatile("" : "+k"(startupStack));
        startupValue = 0x1f;
        asm volatile("msr cpsr_fc, %2" : "+k"(startupStack), "+r"(startupLink)
                     : "r"(startupValue) : "memory");
        startupStack = __sp_usr;
        asm volatile("" : "+k"(startupStack));
        startupPointer = 0x03007ffc;
        asm volatile("" : "+r"(startupPointer));
        startupValue = (unsigned)IrqMain;
        asm volatile("" : "+r"(startupValue));
        *(unsigned *)startupPointer = startupValue;
        startupPointer = (unsigned)AgbMain;
        asm volatile("" : "+r"(startupPointer));
        ((void (*)(void))startupPointer)();
    }
}
