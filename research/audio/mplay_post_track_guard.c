#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 postFlags asm("r0");
register volatile u32 postMask asm("r1");
register volatile struct MusicPlayerTrack *postTrack asm("r5");
extern void MPlayMainPostTrackNext(void);
extern void MPlayMainPostTrackSetup(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayPostTrackGuardCandidate(void)
{
    postFlags = postTrack->flags;
    asm("" : "+r"(postFlags));
    postMask = 128;
    asm("" : "+r"(postMask));
    if (!(postMask & postFlags)) {
        MPlayMainPostTrackNext();
        return;
    }
    postMask = 15;
    asm("" : "+r"(postMask));
    if (!(postMask & postFlags)) {
        MPlayMainPostTrackNext();
        return;
    }
    MPlayMainPostTrackSetup();
}
