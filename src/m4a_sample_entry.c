#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 entryType asm("r0");
register volatile struct SoundChannel *entryChannel asm("r4");
register u32 entryCount asm("r8");
register volatile u32 entryRight asm("r10");
register volatile u32 entryLeft asm("r11");
register volatile struct SoundMainMixerFrame *entryFrame asm("sp");
extern void SoundMainRAM_ResampleSetup(void);
extern void SoundMainRAM_FixedSetup(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_SampleEntry(void)
{
    entryFrame->samplesRemaining = entryCount;
    entryRight = entryChannel->er;
    entryLeft = entryChannel->el;
    entryRight <<= 16;
    entryLeft <<= 16;
    entryType = entryChannel->type;
    if (!(entryType & 8)) {
        SoundMainRAM_ResampleSetup();
        return;
    }
    SoundMainRAM_FixedSetup();
}
