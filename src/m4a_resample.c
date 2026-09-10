#include "global.h"
#include "gba/m4a_internal.h"
// Private resampling word/interpolation entries share the mixer registers.
// LR holds the fractional position here, rather than a return address.
register u32 sampleCurrent asm("r0");
register u32 sampleDifference asm("r1");
register u32 sampleOutput asm("r5");
register volatile u32 sampleRight asm("r6");
register volatile u32 sampleLeft asm("r7");
register volatile u32 sampleInterpolated asm("r9");
register u32 sampleRightVolume asm("r10");
register u32 sampleLeftVolume asm("r11");
register volatile u32 sampleProduct asm("r12");
register u32 sampleFraction asm("lr");
extern void SoundMainRAM_ResampleAdvance(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_Resample(void)
{
    sampleRight = *(volatile u32 *)sampleOutput;
    sampleLeft = *(volatile u32 *)(sampleOutput + PCM_DMA_BUF_SIZE);
    sampleInterpolated = sampleDifference * sampleFraction;
    sampleInterpolated = sampleCurrent + ((s32)sampleInterpolated >> 23);
    asm("" : "+r"(sampleInterpolated));
    sampleProduct = sampleInterpolated * sampleRightVolume;
    sampleProduct &= ~0xFF0000u;
    sampleRight = sampleProduct + ((sampleRight >> 8) | (sampleRight << 24));
    asm("" : "+r"(sampleInterpolated));
    sampleProduct = sampleInterpolated * sampleLeftVolume;
    sampleProduct &= ~0xFF0000u;
    sampleLeft = sampleProduct + ((sampleLeft >> 8) | (sampleLeft << 24));
    SoundMainRAM_ResampleAdvance();
}
