#include "global.h"
register volatile u32 nextSize asm("r0");
register volatile u32 nextCount asm("r2");
register volatile u32 nextTrack asm("r5");
extern void MPlayMainExit(void);
extern void MPlayMainPostTrackGuard(void);
__attribute__((matching_tail_transfer, matching_thumb_fork_decrement, matching_thumb_positive_advance))
void MPlayMainPostTrackNext(void)
{
    if ((s32)nextCount > 1) {
        nextCount -= 1;
        nextSize = 80;
        asm("" : "+r"(nextSize));
        if ((s32)nextTrack > (s32)(0u - nextSize)) {
            nextTrack += nextSize;
            MPlayMainPostTrackGuard();
            return;
        }
        nextTrack += nextSize;
    } else
        nextCount -= 1;
    MPlayMainExit();
}
