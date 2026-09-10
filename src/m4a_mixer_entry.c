#include "global.h"
// Other callers declare the copied mixer as raw bytes; define its code entry here.
#define SoundMainRAM SoundMainRAM_RawDeclaration
#include "gba/m4a_internal.h"
#undef SoundMainRAM
register volatile struct SoundInfo *mixerInfo asm("r0");
register u32 mixerTarget asm("r1");
register volatile u32 mixerReverb asm("r3");
extern void SoundMainRAM_Reverb(void);
extern void SoundMainRAM_NoReverb(void);
__attribute__((matching_tail_transfer, matching_thumb_split_handoff))
void SoundMainRAM(void)
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
