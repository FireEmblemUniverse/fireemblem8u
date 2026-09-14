// Private entry frame shared with PutOamHi's C-generated body.
register unsigned saved4 asm("r4");
register unsigned saved5 asm("r5");
register unsigned saved6 asm("r6");
register unsigned cursor asm("r7");
register unsigned *entryStack asm("sp");
extern unsigned gOamLoPutIt;
extern void PutOamSharedBody(void) __attribute__((noreturn));
#ifdef RESEARCH_OAM_ENTRY
unsigned *const PutOamLoCursorPointer __attribute__((used,section(".rodata.oam_lo_cursor"))) = &gOamLoPutIt;
#define OAM_ENTRY __attribute__((research_arm_oam_entry))
#else
#define OAM_ENTRY
#endif
void __attribute__((noreturn)) OAM_ENTRY PutOamLo(unsigned x, unsigned y, const unsigned short *list, unsigned attr)
{
    entryStack -= 4;
    asm volatile("" : "+k"(entryStack));
    entryStack[0] = saved4;
    entryStack[1] = saved5;
    entryStack[2] = saved6;
    entryStack[3] = cursor;
    cursor = (unsigned)&gOamLoPutIt;
    asm volatile("" : "+r"(cursor));
    PutOamSharedBody();
}
