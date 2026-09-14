// Ordinary register setup before SPSR capture and IRQ frame save.
register unsigned irqSavedStatus asm("r0");
register unsigned irqEnabled asm("r1");
register unsigned irqWord asm("r2");
register volatile unsigned *irqBase asm("r3");
extern void PayloadIrqSaveFrame(void) __attribute__((noreturn));
void __attribute__((noreturn, matching_arm_noreturn_frame)) IntrMain(void)
{
    irqBase = (volatile unsigned *)0x04000000;
    asm volatile("" : "+r"(irqBase));
    irqBase += 0x200 / sizeof(*irqBase);
    asm volatile("" : "+r"(irqBase));
    irqWord = *irqBase;
    irqEnabled = (unsigned short)irqWord;
    PayloadIrqSaveFrame();
}
