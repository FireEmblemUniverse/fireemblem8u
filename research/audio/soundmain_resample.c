#include "global.h"
#include "gba/m4a_internal.h"
#include "soundmain_frame.h"

static u32 RotateRight(u32 value, u32 shift)
{
    return shift ? (value >> shift) | (value << (32 - shift)) : value;
}

// Semantic resampling model for aligned output counts divisible by four and
// positive source/loop lengths. Arithmetic retains the original 32-bit wrap.
void SoundMainResampleModel(struct SoundMainMixerFrame *frame,
                            struct SoundChannel *channel, u32 samples, u32 divFreq)
{
    volatile u32 *output = (volatile u32 *)frame->pcmBuffer;
    volatile s8 *source = (volatile s8 *)channel->cp;
    u32 count = channel->ct;
    u32 fraction = channel->fw;
    u32 step = divFreq * channel->freq;
    u32 right = (u32)channel->er << 16;
    u32 left = (u32)channel->el << 16;
    s32 current = *source;
    s32 difference = *++source - current;
    frame->samplesRemaining = samples;
    do {
        u32 lane;
        u32 packedRight = output[0];
        u32 packedLeft = output[PCM_DMA_BUF_SIZE / 4];
        for (lane = 0; lane < 4; lane++) {
            u32 advance;
            u32 sample = current + ((s32)(fraction * (u32)difference) >> 23);
            packedRight = RotateRight(packedRight, 8) + ((sample * right) & ~0xFF0000u);
            packedLeft = RotateRight(packedLeft, 8) + ((sample * left) & ~0xFF0000u);
            fraction += step;
            advance = fraction >> 23;
            if (advance) {
                // The original clears bits 23..29, retaining the top two bits.
                fraction &= ~0x3F800000u;
                count -= advance;
                if ((s32)count <= 0) {
                    u32 length = frame->mixerScratch10;
                    u32 skip;
                    if (!length) {
                        channel->status = 0;
                        packedRight = RotateRight(packedRight, (3 - lane) * 8);
                        packedLeft = RotateRight(packedLeft, (3 - lane) * 8);
                        output[PCM_DMA_BUF_SIZE / 4] = packedLeft;
                        output[0] = packedRight;
                        return;
                    }
                    source = (volatile s8 *)frame->mixerScratchC;
                    skip = 0 - count;
                    do {
                        count += length;
                        if ((s32)count > 0)
                            break;
                        skip -= length;
                    } while (1);
                    source += skip;
                    current = *source;
                } else if (advance == 1) {
                    current += difference;
                } else {
                    source += advance - 1;
                    current = *source;
                }
                difference = *++source - current;
            }
        }
        output[PCM_DMA_BUF_SIZE / 4] = packedLeft;
        *output++ = packedRight;
        samples -= 4;
    } while (samples);
    channel->fw = fraction;
    channel->ct = count;
    channel->cp = (u32)(source - 1);
}
