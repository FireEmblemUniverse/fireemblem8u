#include "global.h"
#include "gba/m4a_internal.h"
#include "soundmain_frame.h"

static u32 RotateRight(u32 value, u32 shift)
{
    return shift ? (value >> shift) | (value << (32 - shift)) : value;
}

// Semantic fixed-rate model. Positive sample counts must be divisible by four;
// source count and any active loop length must be positive.
void SoundMainFixedModel(struct SoundMainMixerFrame *frame,
                         struct SoundChannel *channel, u32 samples)
{
    volatile u32 *output = (volatile u32 *)frame->pcmBuffer;
    volatile s8 *source = (volatile s8 *)channel->cp;
    u32 count = channel->ct;
    u32 right = (u32)channel->er << 16;
    u32 left = (u32)channel->el << 16;
    frame->samplesRemaining = samples;
    do {
        u32 lane;
        u32 packedRight = output[0];
        u32 packedLeft = output[PCM_DMA_BUF_SIZE / 4];
        for (lane = 0; lane < 4; lane++) {
            u32 sample = (s32)*source++;
            packedRight = RotateRight(packedRight, 8) + ((sample * right) & ~0xFF0000u);
            packedLeft = RotateRight(packedLeft, 8) + ((sample * left) & ~0xFF0000u);
            if (--count == 0) {
                count = frame->mixerScratch10;
                if (!count) {
                    channel->status = 0;
                    // Finish rotating the partial word without mixing further
                    // samples. The original leaves cp and ct unchanged here.
                    packedRight = RotateRight(packedRight, (3 - lane) * 8);
                    packedLeft = RotateRight(packedLeft, (3 - lane) * 8);
                    output[PCM_DMA_BUF_SIZE / 4] = packedLeft;
                    output[0] = packedRight;
                    return;
                }
                source = (volatile s8 *)frame->mixerScratchC;
            }
        }
        output[PCM_DMA_BUF_SIZE / 4] = packedLeft;
        *output++ = packedRight;
        samples -= 4;
    } while (samples);
    channel->ct = count;
    channel->cp = (u32)source;
}
