#include "global.h"
#include "gba/m4a_internal.h"

// Private short-sample path: load the packed stereo words and mix one sample.
// Decrement the source count and select the shared end/continue path.
// The top two output-address bits encode the current lane.
register volatile u32 shortSample asm("r0");
register volatile u32 shortProduct asm("r1");
register u32 shortRemaining asm("r2");
register volatile s8 *shortSource asm("r3");
register u32 shortOutput asm("r5");
register volatile u32 shortRight asm("r6");
register volatile u32 shortLeft asm("r7");
register u32 shortRightVolume asm("r10");
register u32 shortLeftVolume asm("r11");

extern void SoundMainRAM_ShortCount(void);
extern void SoundMainRAM_ShortEnd(void);
__attribute__((matching_arm_adjacent))
void SoundMainRAM_Short(void)
{
    shortRight = *(volatile u32 *)shortOutput;
    shortLeft = *(volatile u32 *)(shortOutput + PCM_DMA_BUF_SIZE);
    asm("" : "+r"(shortRightVolume), "+r"(shortLeftVolume));
    shortSample = *shortSource++;
    asm("" : "+r"(shortSample));
    shortProduct = shortSample * shortRightVolume;
    shortProduct &= ~0xFF0000u;
    shortRight = shortProduct + ((shortRight >> 8) | (shortRight << 24));
    shortProduct = shortSample * shortLeftVolume;
    shortProduct &= ~0xFF0000u;
    shortLeft = shortProduct + ((shortLeft >> 8) | (shortLeft << 24));
    shortRemaining--;
    if (shortRemaining == 0)
        SoundMainRAM_ShortEnd();
    else
        SoundMainRAM_ShortCount();
}
