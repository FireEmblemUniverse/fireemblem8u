#include "global.h"
#include "gba/m4a_internal.h"

// Research model of setup arithmetic with callback-stable SoundInfo fields.
// The real entry computes the deadline before callbacks and selects the buffer
// after callbacks; a full replacement must preserve that ordering and its frame.
void SoundMainSetupModel(u32 *result, const struct SoundInfo *sound, u32 vcount)
{
    u32 deadline = sound->maxLines;
    u32 counter = sound->pcmDmaCounter;
    u32 preceding = counter - 1;
    u32 samples = (u32)sound->pcmSamplesPerVBlank;
    u32 buffer = (u32)sound + offsetof(struct SoundInfo, pcmBuffer);
    if (deadline)
    {
        vcount &= 255;
        if (vcount < 160)
            vcount += 228;
        deadline += vcount;
    }
    if (counter > 1)
        buffer += samples * ((u32)sound->pcmDmaPeriod - preceding);
    result[0] = deadline;
    result[1] = preceding;
    result[2] = samples;
    result[3] = buffer;
    result[4] = PCM_DMA_BUF_SIZE;
}
