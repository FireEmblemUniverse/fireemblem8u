#include "global.h"
register volatile u32 advanceSize asm("r0");
register volatile u32 advanceMask asm("r3");
register volatile u32 advanceTrack asm("r5");
register volatile u32 advanceCount asm("r6");
extern void MPlayMainTrackLoop(void);
extern void MPlayMainClockUpdate(void);
__attribute__((matching_tail_transfer, matching_thumb_fork_decrement))
void MPlayMainTrackAdvance(void)
{
    if ((s32)advanceCount > 1) {
        advanceCount -= 1;
        advanceSize = 80;
        advanceTrack += advanceSize;
        advanceMask <<= 1;
        MPlayMainTrackLoop();
        return;
    }
    advanceCount -= 1;
    MPlayMainClockUpdate();
}
