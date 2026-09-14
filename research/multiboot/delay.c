// SUBS/BGT tests the signed pre-subtraction operands, including overflow.
// Unsigned arithmetic defines the wrapped result for every input bit pattern.
unsigned MultiBootDelayLoop(unsigned cycles, unsigned step)
{
    unsigned before;
    do {
        before = cycles;
        cycles -= step;
    } while ((int)before > (int)step);
    return cycles;
}
