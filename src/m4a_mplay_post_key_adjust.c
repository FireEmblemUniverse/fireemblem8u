#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 keyOffset asm("r0");
register volatile u32 channelKey asm("r1");
register volatile s32 adjustedKey asm("r2");
register volatile struct SoundChannel *keyChannel asm("r4");
register volatile struct MusicPlayerTrack *keyTrack asm("r5");
extern void MPlayMainPostFrequencySelect(void);
__attribute__((matching_tail_transfer, matching_thumb_add_sign_branch))
void MPlayMainPostKeyAdjust(void)
{
    channelKey = keyChannel->ky;
    asm("" : "+r"(channelKey));
    keyOffset = 8;
    asm("" : "+r"(keyOffset));
    keyOffset = *(volatile s8 *)((volatile u8 *)keyTrack + keyOffset);
    asm("" : "+r"(keyOffset));
    adjustedKey = channelKey + keyOffset;
    if (adjustedKey < 0)
        adjustedKey = 0;
    MPlayMainPostFrequencySelect();
}
