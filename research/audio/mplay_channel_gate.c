#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 channelWork asm("r0");
register volatile u32 channelStatus asm("r1");
register volatile struct SoundChannel *gateChannel asm("r4");
extern void MPlayMainChannelClear(void);
extern void MPlayMainChannelNext(void);
__attribute__((matching_tail_transfer))
void MPlayChannelGateCandidate(void)
{
    channelStatus = gateChannel->status;
    asm("" : "+r"(channelStatus));
    channelWork = 0xc7;
    asm("" : "+r"(channelWork));
    if (!(channelWork & channelStatus)) {
        MPlayMainChannelClear();
        return;
    }
    channelWork = gateChannel->gt;
    if (channelWork) {
        channelWork -= 1;
        asm("" : "+r"(channelWork));
        gateChannel->gt = channelWork;
        if (!channelWork) {
            asm("" : "+r"(channelWork));
            channelWork = 0x40;
            asm("" : "+r"(channelWork));
            channelStatus |= channelWork;
            gateChannel->status = channelStatus;
        }
    }
    MPlayMainChannelNext();
}
