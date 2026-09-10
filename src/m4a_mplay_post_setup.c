#include "global.h"
register volatile u32 postArgument0 asm("r0");
register volatile u32 postArgument1 asm("r1");
register volatile u32 postCount asm("r2");
register volatile u32 postTrack asm("r5");
register volatile u32 postPlayer asm("r7");
register volatile u32 postSavedCount asm("r9");
extern void MPlayMainPostTrackInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainPostTrackSetup(void)
{
    postSavedCount = postCount;
    asm("" : "+r"(postSavedCount));
    postArgument0 = postPlayer;
    asm("" : "+r"(postArgument0));
    postArgument1 = postTrack;
    MPlayMainPostTrackInvoke();
}
