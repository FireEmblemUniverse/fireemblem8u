#include "global.h"
#include "gba/m4a_internal.h"
register u32 fixedFinishOutput asm("r5");
register u32 fixedFinishRight asm("r6");
register u32 fixedFinishLeft asm("r7");
register u32 fixedFinishRemaining asm("r8");
extern void SoundMainRAM_FixedSetup(void);
extern void SoundMainRAM_SaveChannel(void);
__attribute__((matching_word_postincrement, matching_subtract_compare, matching_arm_adjacent))
void SoundMainRAM_FixedWordFinish(void)
{
    u32 previous;
    *(volatile u32 *)(fixedFinishOutput + PCM_DMA_BUF_SIZE) = fixedFinishLeft;
    *(volatile u32 *)fixedFinishOutput = fixedFinishRight;
    fixedFinishOutput += 4;
    previous = fixedFinishRemaining;
    fixedFinishRemaining -= 4;
    if ((s32)previous > 4) {
        SoundMainRAM_FixedSetup();
        return;
    }
    SoundMainRAM_SaveChannel();
}
