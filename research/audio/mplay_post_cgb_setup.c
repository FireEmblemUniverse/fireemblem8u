#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 frequencyArgument asm("r0");
register volatile u32 frequencyKey asm("r1");
register volatile u32 frequencyPitch asm("r2");
register volatile u32 frequencyTarget asm("r3");
register volatile struct MusicPlayerTrack *frequencyTrack asm("r5");
register volatile u32 frequencyType asm("r6");
register volatile u32 frequencyInfo asm("r8");
extern void MPlayMainPostCgbInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayPostCgbSetupCandidate(void)
{
    frequencyArgument = frequencyInfo;
    asm("" : "+r"(frequencyArgument));
    frequencyTarget = (u32)((volatile struct SoundInfo *)frequencyArgument)->MidiKeyToCgbFreq;
    asm("" : "+r"(frequencyTarget));
    frequencyKey = frequencyPitch;
    asm("" : "+r"(frequencyKey));
    frequencyPitch = frequencyTrack->pitM;
    asm("" : "+r"(frequencyPitch));
    frequencyArgument = frequencyType;
    MPlayMainPostCgbInvoke();
}
