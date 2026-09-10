#include "global.h"
#include "gba/m4a_internal.h"

static u32 SoundMainDeadlineModel(u32 maxLines, u32 vcount)
{
    if (!maxLines)
        return 0;
    vcount &= 255;
    if (vcount < 160)
        vcount += 228;
    return maxLines + vcount;
}

static void SoundMainBufferModel(u32 *result, const struct SoundInfo *sound)
{
    u32 counter = sound->pcmDmaCounter;
    u32 preceding = counter - 1;
    u32 samples = (u32)sound->pcmSamplesPerVBlank;
    u32 buffer = (u32)sound + offsetof(struct SoundInfo, pcmBuffer);
    if (counter > 1)
        buffer += samples * ((u32)sound->pcmDmaPeriod - preceding);
    result[1] = preceding;
    result[2] = samples;
    result[3] = buffer;
    result[4] = PCM_DMA_BUF_SIZE;
}

// Research model for the two arithmetic phases with callback-stable fields.
void SoundMainSetupModel(u32 *result, const struct SoundInfo *sound, u32 vcount)
{
    result[0] = SoundMainDeadlineModel(sound->maxLines, vcount);
    SoundMainBufferModel(result, sound);
}

// Semantic entry model. The returned array represents values passed to the
// mixer, not the original private stack/register frame or its machine flags.
int SoundMainEntryModel(u32 *result, struct SoundInfo *sound, u32 vcount)
{
    u32 deadline;
    if (sound->ident != ID_NUMBER)
        return 0;
    sound->ident++;
    deadline = SoundMainDeadlineModel(sound->maxLines, vcount);
    if (sound->func)
        ((void (*)(u32))sound->func)(sound->intp);
    // The private entry supplies SoundInfo in r0 even though the public C
    // function-pointer type has no parameters.
    ((void (*)(struct SoundInfo *))sound->CgbSound)(sound);
    result[0] = deadline;
    SoundMainBufferModel(result, sound);
    return 1;
}
