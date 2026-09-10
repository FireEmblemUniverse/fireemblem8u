#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 pitchMask asm("r0");
register volatile u32 pitchFlags asm("r3");
register volatile struct MusicPlayerTrack *pitchTrack asm("r5");
extern void MPlayMainPostChannelNext(void);
extern void MPlayMainPostKeyAdjust(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayMainPostPitchGuard(void)
{
    pitchFlags = pitchTrack->flags;
    asm("" : "+r"(pitchFlags));
    pitchMask = 12;
    asm("" : "+r"(pitchMask));
    if (!(pitchMask & pitchFlags)) {
        MPlayMainPostChannelNext();
        return;
    }
    MPlayMainPostKeyAdjust();
}
