#include "global.h"
#include "gba/m4a_internal.h"

// Stop a channel and finish rotating its partially mixed stereo word.
// The packed output pointer encodes the current lane in its top two bits.
register volatile u32 partialShift asm("r0");
register u32 partialStatus asm("r2");
register volatile struct SoundChannel *partialChannel asm("r4");
register u32 partialOutput asm("r5");
register volatile u32 partialRight asm("r6");
register volatile u32 partialLeft asm("r7");
extern void SoundMainRAM_RestoreFrame(void);
__attribute__((matching_word_postincrement, matching_arm_adjacent))
void SoundMainRAM_Partial(void)
{
    u32 shift, word;
    partialChannel->status = partialStatus;
    partialShift = partialOutput >> 30;
    partialOutput &= ~0xC0000000u;
    partialShift = 3 - partialShift;
    partialShift <<= 3;
    shift = partialShift;
    // Capture each volatile register once so the rotate has one stable operand.
    // The masked complementary shift also keeps a zero rotation defined in C.
    word = partialRight;
    partialRight = (word >> shift) | (word << ((-shift) & 31));
    word = partialLeft;
    partialLeft = (word >> shift) | (word << ((-shift) & 31));
    *(volatile u32 *)(partialOutput + PCM_DMA_BUF_SIZE) = partialLeft;
    *(volatile u32 *)partialOutput = partialRight;
    partialOutput += 4;
    SoundMainRAM_RestoreFrame();
}
