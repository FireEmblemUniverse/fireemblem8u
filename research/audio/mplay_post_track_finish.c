#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 postFlags asm("r0");
register volatile u32 postMask asm("r1");
register volatile u32 postCount asm("r2");
register volatile struct MusicPlayerTrack *postTrack asm("r5");
register volatile u32 postSavedCount asm("r9");
extern void MPlayMainPostTrackNext(void);
__attribute__((matching_tail_transfer))
void MPlayPostTrackFinishCandidate(void)
{
    postFlags = postTrack->flags;
    asm("" : "+r"(postFlags));
    postMask = 240;
    asm("" : "+r"(postMask));
    postFlags &= postMask;
    asm("" : "+r"(postFlags));
    postTrack->flags = postFlags;
    postCount = postSavedCount;
    MPlayMainPostTrackNext();
}
