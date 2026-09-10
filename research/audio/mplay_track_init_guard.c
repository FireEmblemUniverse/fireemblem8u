#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 initMask asm("r0");
register volatile u32 initFlags asm("r3");
register volatile struct MusicPlayerTrack *initTrack asm("r5");
extern void MPlayMainTrackClear(void);
extern void MPlayMainTrackWait(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayTrackInitGuardCandidate(void)
{
    initFlags = initTrack->flags;
    asm("" : "+r"(initFlags));
    initMask = MPT_FLG_START;
    asm("" : "+r"(initMask));
    if (!(initMask & initFlags)) {
        MPlayMainTrackWait();
        return;
    }
    MPlayMainTrackClear();
}
