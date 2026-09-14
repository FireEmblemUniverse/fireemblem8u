// Private IRQ continuation; processor-status instructions remain assembly-owned.
register unsigned irqValue asm("r0");
register unsigned irqPointer asm("r1");
register unsigned irqOffset asm("r2");
register unsigned irqStatus asm("r3");
register unsigned *irqStack asm("sp");
register unsigned irqLink asm("lr");
extern unsigned gIrqFuncTable[13];
unsigned *const PayloadIrqHandlersPointer __attribute__((used,section(".rodata.irq_handlers"))) = gIrqFuncTable;

void __attribute__((noreturn)) __attribute__((matching_arm_irq_frame)) PayloadIrqSelected(void)
{
    *(volatile unsigned short *)(irqStatus + 2) = irqValue;
    asm volatile("mrs %0, cpsr" : "=r"(irqStatus));
    irqStatus = (irqStatus & ~0xdfu) | 0x1f;
    // Mode changes select different SP/LR banks; k constrains SP itself.
    asm volatile("msr cpsr_fc, %2" : "+k"(irqStack), "+r"(irqLink)
                 : "r"(irqStatus) : "memory");
    irqPointer = (unsigned)gIrqFuncTable;
    irqPointer += irqOffset;
    asm volatile("" : "+r"(irqPointer));
    irqValue = *(unsigned *)irqPointer;
    asm volatile("" : "+r"(irqValue));
    irqStack--;
    asm volatile("" : "+k"(irqStack));
    *irqStack = irqLink;
    ((void (*)(void))irqValue)();
    irqLink = *irqStack++;
    asm volatile("mrs %0, cpsr" : "=r"(irqStatus));
    irqStatus = (irqStatus & ~0xdfu) | 0x92;
    // Mode changes select different SP/LR banks; k constrains SP itself.
    asm volatile("msr cpsr_fc, %2" : "+k"(irqStack), "+r"(irqLink)
                 : "r"(irqStatus) : "memory");
    irqValue = irqStack[0];
    irqPointer = irqStack[1];
    irqStatus = irqStack[2];
    irqLink = irqStack[3];
    irqStack += 4;
    *(volatile unsigned short *)irqStatus = irqPointer;
    asm volatile("msr spsr_fc, %0" : : "r"(irqValue) : "memory");
    ((void (*)(void))irqLink)();
    __builtin_unreachable();
}
