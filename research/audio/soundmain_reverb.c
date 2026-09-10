#include "global.h"
#include "gba/m4a_internal.h"

// Semantic model of SoundMainRAM_Reverb, for positive sample counts.
// Volatile byte accesses preserve the original ordering when buffers overlap.
// This is not yet a replacement for the mixer's private register/frame ABI.
void SoundMainReverbModel(struct SoundInfo *sound, volatile s8 *output,
                         u32 samples, u32 counter)
{
    volatile s8 *source = counter == 2
        ? (volatile s8 *)sound->pcmBuffer : output + samples;
    u32 strength = sound->reverb;
    do {
        s32 value = output[PCM_DMA_BUF_SIZE];
        value += output[0];
        value += source[PCM_DMA_BUF_SIZE];
        value += *source++;
        value = (value * (s32)strength) >> 9;
        // The machine tests bit 7, including positive results >= 128.
        if (value & 0x80)
            value++;
        output[PCM_DMA_BUF_SIZE] = value;
        *output++ = value;
    } while (--samples);
}
