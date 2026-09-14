/* Private entry keeps r0/r1 and caller LR, and supplies r3=1 to the core. */
register unsigned runtimeDividend asm("r0");
register unsigned runtimeDivisor asm("r1");
register unsigned runtimeBit asm("r3");
extern void runtime_umod(void) __attribute__((noreturn));
extern void runtime_divzero(void) __attribute__((noreturn));
__attribute__((matching_umod_entry))
void runtime_mod_entry(void)
{
    if (!runtimeDivisor) runtime_divzero();
    runtimeBit = 1;
    if (runtimeDividend >= runtimeDivisor) runtime_umod();
}
