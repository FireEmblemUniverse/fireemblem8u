#include "global.h"
#include "gba/m4a_internal.h"
register volatile struct SoundChannel *nextChannel asm("r4");
extern void MPlayMainChannelGate(void);
extern void MPlayMainTrackInit(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayChannelNextCandidate(void)
{
    nextChannel = (volatile struct SoundChannel *)nextChannel->np;
    asm("" : "+r"(nextChannel));
    if (nextChannel) {
        MPlayMainChannelGate();
        return;
    }
    MPlayMainTrackInit();
}
