// Private terminal handoffs preserve the original caller's LR and argument registers.
register unsigned runtimeBit asm("r3");
register unsigned runtimeDivisor asm("r1");
extern void runtime_udiv(void) __attribute__((noreturn));
extern void runtime_divzero(void) __attribute__((noreturn));
#ifdef MATCHING_ENTRY
__attribute__((matching_smod_entry))
#endif
void runtime_entry(void)
{
    runtimeBit = 1;
    if (runtimeDivisor == 0)
        runtime_divzero();
    runtime_udiv();
}
