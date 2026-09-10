#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"

// Read loop length and conditionally restore the source from the private frame.
// The frame64 contract keeps SP fixed at the incoming mixer frame.
register volatile u32 loopCount asm("r2");
register u32 loopSource asm("r3");
register struct SoundMainMixerFrame *loopFrame asm("sp");
extern void SoundMainRAM_ShortCount(void);
extern void SoundMainRAM_Partial(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_ShortEnd(void)
{
    loopCount = loopFrame->mixerScratch10;
    asm("" : "+r"(loopCount));
    if (loopCount != 0)
        loopSource = loopFrame->mixerScratchC;
    if (loopCount != 0)
        SoundMainRAM_ShortCount();
    else
        SoundMainRAM_Partial();
}
