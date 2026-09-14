#include "global.h"
register volatile u32 finishR0 asm("r0");
register volatile u32 finishR1 asm("r1");
register volatile u32 finishR4 asm("r4");
register volatile u32 finishR5 asm("r5");
extern void PlyNoteExit(void);
__attribute__((matching_tail_transfer))
void PlyNoteFinishCandidate(void)
{
    *(volatile u32 *)(finishR4 + 32) = finishR0;
    finishR0 = 128;
    asm("" : "+r"(finishR0));
    *(volatile u8 *)finishR4 = finishR0;
    finishR1 = *(volatile u8 *)finishR5;
    asm("" : "+r"(finishR1));
    finishR0 = 240;
    asm("" : "+r"(finishR0));
    finishR0 &= finishR1;
    asm("" : "+r"(finishR0));
    *(volatile u8 *)finishR5 = finishR0;
    PlyNoteExit();
}
