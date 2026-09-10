#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 frequencyArgument asm("r0");
register volatile u32 frequencyKey asm("r1");
register volatile u32 frequencyPitch asm("r2");
register volatile struct SoundChannel *frequencyChannel asm("r4");
register volatile struct MusicPlayerTrack *frequencyTrack asm("r5");
extern void MPlayMainPostPcmInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainPostPcmSetup(void)
{
    frequencyKey = frequencyPitch;
    asm("" : "+r"(frequencyKey));
    frequencyPitch = frequencyTrack->pitM;
    asm("" : "+r"(frequencyPitch));
    frequencyArgument = (u32)frequencyChannel->wav;
    MPlayMainPostPcmInvoke();
}
