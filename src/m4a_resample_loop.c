#include "global.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 repeatLength asm("r0");
register u32 repeatRemaining asm("r2");
register u32 repeatSource asm("r3");
register u32 repeatSkip asm("r9");
register volatile struct SoundMainResampleFrame *repeatFrame asm("sp");
extern void SoundMainRAM_ResampleWrap(void);
extern void SoundMainRAM_ResampleStop(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_ResampleLoop(void)
{
    repeatLength = repeatFrame->mixer.mixerScratch10;
    if (repeatLength == 0) {
        SoundMainRAM_ResampleStop();
        return;
    }
    repeatSource = repeatFrame->mixer.mixerScratchC;
    repeatSkip = 0u - repeatRemaining;
    SoundMainRAM_ResampleWrap();
}
