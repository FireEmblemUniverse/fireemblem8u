#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 postCount asm("r2");
register volatile u32 postTracks asm("r5");
register volatile struct MusicPlayerInfo *postPlayer asm("r7");
extern void MPlayMainPostTrackGuard(void);
__attribute__((matching_tail_transfer))
void MPlayMainPostTick(void)
{
    postCount = postPlayer->trackCount;
    asm("" : "+r"(postCount));
    postTracks = (u32)postPlayer->tracks;
    MPlayMainPostTrackGuard();
}
