#include "global.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 finishSource asm("r3");
register u32 finishChannel asm("r4");
register u32 finishProduct asm("r12");
register volatile struct SoundMainResampleFrame *finishFrame asm("sp");
extern void SoundMainRAM_SaveResampled(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_ResampleFinish(void)
{
    finishSource -= 1;
    finishChannel = finishFrame->savedChannel;
    finishProduct = finishFrame->savedProduct;
    finishFrame = (volatile struct SoundMainResampleFrame *)((u32)finishFrame + 8);
    SoundMainRAM_SaveResampled();
}
