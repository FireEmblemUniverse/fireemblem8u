#include "global.h"
register u32 laneOutput asm("r5");
extern void SoundMainRAM_ResampleMix(void);
extern void SoundMainRAM_ResampleWordFinish(void);
__attribute__((matching_add_carry, matching_arm_adjacent))
void SoundMainRAM_ResampleNoAdvance(void)
{
    u32 next;
    int carry = __builtin_add_overflow(laneOutput, 0x40000000u, &next);
    laneOutput = next;
    if (!carry) {
        SoundMainRAM_ResampleMix();
        return;
    }
    SoundMainRAM_ResampleWordFinish();
}
