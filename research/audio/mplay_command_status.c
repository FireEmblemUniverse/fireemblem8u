#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 commandStatus asm("r0");
register volatile struct MusicPlayerTrack *commandTrack asm("r5");
extern void MPlayMainTrackFinish(void);
extern void MPlayMainTrackWait(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayCommandStatusCandidate(void)
{
    commandStatus = commandTrack->flags;
    asm("" : "+r"(commandStatus));
    if (commandStatus == 0) {
        MPlayMainTrackFinish();
        return;
    }
    MPlayMainTrackWait();
}
