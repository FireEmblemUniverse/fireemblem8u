// Private IRQ search ABI: r2 starts as the combined IE/IF word.
// Payload priority groups bits 6/7 before the remaining individual sources.
// Cold-loop hints preserve isolated halt blocks for checked self-loop lowering.
register unsigned irqBit asm("r0");
register unsigned irqPending asm("r1");
register unsigned irqWord asm("r2");
extern void PayloadIrqSelected(void) __attribute__((noreturn));
void __attribute__((matching_arm_noreturn_frame)) __attribute__((noreturn)) PayloadIrqSearch(void)
{
    irqPending = irqWord & (irqWord >> 16);
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x2000;
    asm volatile("" : : "r"(irqBit));
    while (__builtin_expect(irqBit != 0, 0)) {}
    irqWord = 0;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0xc0;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x1;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x2;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x4;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x8;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x10;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x20;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x100;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x200;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x400;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x800;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x1000;
    if (irqBit) goto selected;
    irqWord += 4;
    asm volatile("" : "+r"(irqWord));
    asm volatile("" : "+r"(irqPending));
    irqBit = irqPending & 0x2000;
    asm volatile("" : : "r"(irqBit));
    while (__builtin_expect(irqBit != 0, 0)) {}
selected:
    PayloadIrqSelected();
}
