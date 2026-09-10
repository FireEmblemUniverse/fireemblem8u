#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 setupCurrent asm("r0");
register volatile u32 setupDifference asm("r1");
register const volatile s8 *volatile setupSource asm("r3");
register u32 setupReserved asm("r2");
register u32 setupChannel asm("r4");
register u32 setupProduct asm("r12");
register u32 setupFraction asm("lr");
register volatile struct SoundMainResampleFrame *volatile setupFrame asm("sp");
extern void SoundMainRAM_Resample(void);
__attribute__((matching_byte_preincrement, matching_arm_adjacent))
void SoundMainRAM_ResampleSetup(void)
{
    setupFrame = (volatile struct SoundMainResampleFrame *)((u32)setupFrame - 8);
    setupFrame->savedChannel = setupChannel;
    setupFrame->savedProduct = setupProduct;
    setupFraction = ((volatile struct SoundChannel *)setupChannel)->fw;
    setupDifference = ((volatile struct SoundChannel *)setupChannel)->freq;
    setupChannel = setupDifference * setupProduct;
    setupCurrent = *setupSource;
    setupDifference = *++setupSource;
    setupDifference -= setupCurrent;
    SoundMainRAM_Resample();
}
