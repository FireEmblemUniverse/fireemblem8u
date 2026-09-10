#include "global.h"
register volatile u32 finishMask asm("r3");
register volatile u32 finishActive asm("r4");
register volatile u32 savedMask asm("r10");
register volatile u32 savedActive asm("r11");
extern void MPlayMainTrackAdvance(void);
__attribute__((matching_tail_transfer))
void MPlayMainTrackFinish(void)
{
    finishMask = savedMask;
    asm("" : "+r"(finishMask));
    finishActive = savedActive;
    MPlayMainTrackAdvance();
}
