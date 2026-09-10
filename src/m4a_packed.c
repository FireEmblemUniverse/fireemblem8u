#include "global.h"
#include "gba/m4a_internal.h"

// Private fixed-rate word loop: load stereo words, mix four signed samples,
// store the packed results, and repeat while the original count exceeds four.
// The top two output-address bits encode the current lane.
register volatile u32 packedSample asm("r0");
register volatile u32 packedProduct asm("r1");
register volatile s8 *packedSource asm("r3");
register u32 packedOutput asm("r5");
register volatile u32 packedRight asm("r6");
register volatile u32 packedLeft asm("r7");
register u32 packedRemaining asm("r8");
register u32 packedRightVolume asm("r10");
register u32 packedLeftVolume asm("r11");

extern void SoundMainRAM_PackedFinish(void);
__attribute__((matching_add_carry, matching_subtract_compare, matching_arm_adjacent))
void SoundMainRAM_Packed(void)
{
    u32 next;
    int carry;
    u32 oldRemaining;
    do {
        packedRight = *(volatile u32 *)packedOutput;
        packedLeft = *(volatile u32 *)(packedOutput + PCM_DMA_BUF_SIZE);
        do {
            asm("" : "+r"(packedRightVolume), "+r"(packedLeftVolume));
            packedSample = *packedSource++;
            asm("" : "+r"(packedSample));
            packedProduct = packedSample * packedRightVolume;
            packedProduct &= ~0xFF0000u;
            packedRight = packedProduct + ((packedRight >> 8) | (packedRight << 24));
            packedProduct = packedSample * packedLeftVolume;
            packedProduct &= ~0xFF0000u;
            packedLeft = packedProduct + ((packedLeft >> 8) | (packedLeft << 24));
            carry = __builtin_add_overflow(packedOutput, 0x40000000u, &next);
            packedOutput = next;
        } while (!carry);
        asm("" : "+r"(packedRight), "+r"(packedLeft));
        *(volatile u32 *)(packedOutput + PCM_DMA_BUF_SIZE) = packedLeft;
        *(volatile u32 *)packedOutput = packedRight;
        packedOutput += 4;
        // Compare the old signed count: testing the wrapped subtraction instead
        // would change the branch at signed-overflow boundaries.
        oldRemaining = packedRemaining;
        packedRemaining -= 4;
    } while ((s32)oldRemaining > 4);
    SoundMainRAM_PackedFinish();
}
