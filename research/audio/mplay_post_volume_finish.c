#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 volumeMode asm("r0");
register volatile u32 volumeBit asm("r1");
register volatile struct CgbChannel *volumeChannel asm("r4");
register volatile u32 channelType asm("r6");
extern void MPlayMainPostPitchGuard(void);
__attribute__((matching_tail_transfer))
void MPlayPostVolumeFinishCandidate(void)
{
    if (channelType != 0) {
        volumeMode = volumeChannel->mo;
        asm("" : "+r"(volumeMode));
        volumeBit = 1;
        asm("" : "+r"(volumeBit));
        volumeMode |= volumeBit;
        asm("" : "+r"(volumeMode));
        volumeChannel->mo = volumeMode;
    }
    MPlayMainPostPitchGuard();
}
