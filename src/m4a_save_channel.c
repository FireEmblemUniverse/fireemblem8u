#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
// Save channel progress, restore the mixer sample count and enter Thumb control.
// Shared entries skip the fraction store or all three stores, respectively.
register volatile u32 saveTarget asm("r0");
register u32 saveCount asm("r2");
register u32 saveSource asm("r3");
register volatile struct SoundChannel *saveChannel asm("r4");
register u32 saveSamples asm("r8");
register volatile struct SoundMainMixerFrame *saveFrame asm("sp");
register u32 saveFraction asm("lr");
extern void SoundMainRAM_ChanAdvance(void);
__attribute__((matching_pc_address, matching_arm_indirect_frame))
void SoundMainRAM_SaveResampled(void)
{
    saveChannel->fw = saveFraction;
    saveChannel->ct = saveCount;
    saveChannel->cp = saveSource;
    saveSamples = saveFrame->samplesRemaining;
    saveTarget = (u32)SoundMainRAM_ChanAdvance;
    ((void (*)(void))saveTarget)();
}
