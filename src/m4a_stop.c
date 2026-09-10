#include "global.h"
#include "gba/m4a_mixer_frame.h"
register u32 stopRemaining asm("r2");
register u32 stopChannel asm("r4");
register u32 stopProduct asm("r12");
register volatile struct SoundMainResampleFrame *stopFrame asm("sp");
extern void SoundMainRAM_Partial(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_ResampleStop(void)
{
    stopChannel = stopFrame->savedChannel;
    stopProduct = stopFrame->savedProduct;
    stopFrame = (volatile struct SoundMainResampleFrame *)((u32)stopFrame + 8);
    stopRemaining = 0;
    SoundMainRAM_Partial();
}
