#include "global.h"
#include "gba/m4a_internal.h"
register volatile struct SoundChannel *nextChannel asm("r4");
extern void MPlayMainPostChannelGate(void);
extern void MPlayMainPostTrackFinish(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayMainPostChannelNext(void)
{
    nextChannel = (volatile struct SoundChannel *)nextChannel->np;
    asm("" : "+r"(nextChannel));
    if (nextChannel) {
        MPlayMainPostChannelGate();
        return;
    }
    MPlayMainPostTrackFinish();
}
