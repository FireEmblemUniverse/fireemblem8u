#include "global.h"
#include "gba/m4a_internal.h"
register volatile struct SoundInfo *mixerInfo asm("r0");
register u32 mixerTarget asm("r1");
register volatile u32 mixerReverb asm("r3");
extern void SoundMainRAM_Reverb(void);
// Recover entry state. The zero-reverb exit and relative ARM transfer still
// require matching instruction selection; this candidate returns normally.
void SoundMainRAM_EntryCandidate(void)
{
    mixerReverb = mixerInfo->reverb;
    if (mixerReverb)
        mixerTarget = (u32)SoundMainRAM_Reverb;
}
