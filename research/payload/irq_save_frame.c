// Research: SPSR capture remains explicitly assembly-owned.
register unsigned savedStatus asm("r0");
register unsigned enabled asm("r1");
register unsigned word asm("r2");
register unsigned base asm("r3");
register unsigned *stack asm("sp");
register unsigned link asm("lr");
extern void PayloadIrqSearch(void) __attribute__((noreturn));
#ifdef RESEARCH_IRQ_SAVE
#define SAVE_FRAME __attribute__((matching_arm_irq_save_frame))
#else
#define SAVE_FRAME
#endif
void __attribute__((noreturn)) SAVE_FRAME PayloadIrqSaveFrame(void)
{
    asm volatile("mrs %0, spsr" : "=r"(savedStatus));
    stack -= 4;
    asm volatile("" : "+k"(stack));
    stack[0] = savedStatus;
    stack[1] = enabled;
    stack[2] = base;
    stack[3] = link;
    PayloadIrqSearch();
}
