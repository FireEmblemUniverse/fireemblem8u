// Private IRQ frame: SPSR capture remains explicitly assembly-owned.
register unsigned savedStatus asm("r0");
register unsigned enabled asm("r1");
register unsigned word asm("r2");
register unsigned base asm("r3");
register unsigned *stack asm("sp");
register unsigned link asm("lr");
extern void IrqSearch(void) __attribute__((noreturn));
void __attribute__((noreturn)) __attribute__((matching_arm_irq_save_frame)) IrqSaveFrame(void)
{
    asm volatile("mrs %0, spsr" : "=r"(savedStatus));
    stack -= 4;
    asm volatile("" : "+k"(stack));
    stack[0] = savedStatus;
    stack[1] = enabled;
    stack[2] = base;
    stack[3] = link;
    IrqSearch();
}
