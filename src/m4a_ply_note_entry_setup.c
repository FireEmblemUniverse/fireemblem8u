#include "global.h"
register volatile u32 setupR0 asm("r0");
register volatile u32 setupR1 asm("r1");
register volatile u32 setupR2 asm("r2");
register volatile u32 setupR5 asm("r5");
register volatile u32 setupSP asm("sp");
extern const u8 gClockTable[];
extern void PlyNoteCommandBoundary(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void PlyNoteEntrySetupBody(void)
{
    *(volatile u32 *)setupSP = setupR1;
    setupR5 = setupR2;
    asm("" : "+r"(setupR5));
    setupR1 = 0x03007ff0;
    asm("" : "+r"(setupR1));
    setupR1 = *(volatile u32 *)setupR1;
    asm("" : "+r"(setupR1));
    *(volatile u32 *)(setupSP + 4) = setupR1;
    setupR1 = (u32)gClockTable;
    asm("" : "+r"(setupR1));
    setupR0 += setupR1;
    asm("" : "+r"(setupR0));
    setupR0 = *(volatile u8 *)setupR0;
    asm("" : "+r"(setupR0));
    *(volatile u8 *)(setupR5 + 4) = setupR0;
    PlyNoteCommandBoundary();
}
