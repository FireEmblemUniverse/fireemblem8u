#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 channelMask asm("r0");
register volatile u32 channelStatus asm("r1");
register volatile struct SoundChannel *gateChannel asm("r4");
extern void MPlayMainPostChannelBody(void);
extern void MPlayMainPostClearSetup(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayPostChannelGateCandidate(void)
{
    channelStatus = gateChannel->status;
    asm("" : "+r"(channelStatus));
    channelMask = 199;
    asm("" : "+r"(channelMask));
    if (channelMask & channelStatus) {
        MPlayMainPostChannelBody();
        return;
    }
    MPlayMainPostClearSetup();
}
