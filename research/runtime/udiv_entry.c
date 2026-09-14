// Private terminal handoffs preserve the original caller's LR and argument registers.
register unsigned runtimeDivisor asm("r1");
extern void runtime_udiv(void) __attribute__((noreturn));
extern void runtime_divzero(void) __attribute__((noreturn));
#ifdef MATCHING_ENTRY
__attribute__((matching_udiv_entry))
#endif
void runtime_entry(void)
{
    if (runtimeDivisor == 0)
        runtime_divzero();
    runtime_udiv();
}
