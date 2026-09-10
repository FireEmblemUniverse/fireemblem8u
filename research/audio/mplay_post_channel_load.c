#include "global.h"
#include "gba/m4a_internal.h"
register volatile struct SoundChannel *postChannel asm("r4");
register volatile struct MusicPlayerTrack *postTrack asm("r5");
extern void MPlayMainPostChannelGate(void);
extern void MPlayMainPostTrackFinish(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayPostChannelLoadCandidate(void)
{
    postChannel = (volatile struct SoundChannel *)postTrack->chan;
    asm("" : "+r"(postChannel));
    if (!postChannel) {
        MPlayMainPostTrackFinish();
        return;
    }
    MPlayMainPostChannelGate();
}
