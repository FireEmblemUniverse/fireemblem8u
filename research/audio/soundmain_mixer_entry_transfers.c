#include "global.h"
#include "gba/m4a_internal.h"
register volatile struct SoundInfo *mixerInfo asm("r0");
register u32 mixerTarget asm("r1");
register volatile u32 mixerReverb asm("r3");
extern void SoundMainRAM_Reverb(void);
extern void SoundMainRAM_NoReverb(void);
__attribute__((matching_tail_transfer))
void SoundMainRAM_EntryTransfersCandidate(void)
{
    mixerReverb = mixerInfo->reverb;
    if (mixerReverb) {
        mixerTarget = (u32)SoundMainRAM_Reverb;
        // Retain the private r1 target instead of a direct-call substitution.
        asm("" : "+r"(mixerTarget));
        ((void (*)(void))mixerTarget)();
    } else {
        SoundMainRAM_NoReverb();
    }
}
