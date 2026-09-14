// Private IRQ search ABI: r2 starts as the combined IE/IF word.
register unsigned irqBit asm("r0");
register unsigned irqPending asm("r1");
register unsigned irqWord asm("r2");
extern void IrqSelected(void) __attribute__((noreturn));
void __attribute__((noreturn)) IrqSearch(void)
{
    irqPending = irqWord & (irqWord >> 16);
    irqBit = irqPending & 0x2000;
    while (irqBit) {}
    irqWord = 0;
    irqBit = irqPending & 0x1;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x2;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x4;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x8;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x10;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x20;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x40;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x80;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x100;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x200;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x400;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x800;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x1000;
    if (irqBit) goto selected;
    irqWord += 4;
    irqBit = irqPending & 0x2000;
    while (irqBit) {}
selected:
    IrqSelected();
}
