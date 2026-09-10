#include "global.h"
#include "gba/m4a_internal.h"
register u32 finishOutput asm("r5");
register u32 finishRight asm("r6");
register u32 finishLeft asm("r7");
register u32 finishRemaining asm("r8");
extern void SoundMainRAM_Resample(void);
extern void SoundMainRAM_ResampleFinish(void);
__attribute__((matching_word_postincrement, matching_subtract_compare, matching_arm_adjacent))
void SoundMainRAM_ResampleWordFinish(void)
{
    u32 previous;
    *(volatile u32 *)(finishOutput + PCM_DMA_BUF_SIZE) = finishLeft;
    *(volatile u32 *)finishOutput = finishRight;
    finishOutput += 4;
    previous = finishRemaining;
    finishRemaining -= 4;
    if ((s32)previous > 4) {
        SoundMainRAM_Resample();
        return;
    }
    SoundMainRAM_ResampleFinish();
}
