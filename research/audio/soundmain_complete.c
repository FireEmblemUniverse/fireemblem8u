#include "global.h"
#include "gba/m4a_internal.h"
#include "soundmain_frame.h"

int SoundMainEntryModel(u32 *, struct SoundInfo *, u32);
void SoundMainReverbModel(struct SoundInfo *, volatile s8 *, u32, u32);
u32 SoundMainChannelModel(struct SoundMainMixerFrame *, struct SoundChannel *, u32, u32);
void SoundMainFixedModel(struct SoundMainMixerFrame *, struct SoundChannel *, u32);
void SoundMainResampleModel(struct SoundMainMixerFrame *, struct SoundChannel *, u32, u32);

// Complete semantic composition, not the original private stack/register ABI.
// Supported buffers have positive sample counts >=16 divisible by four.
void SoundMainCompleteModel(void)
{
    struct SoundInfo *sound = *(struct SoundInfo * volatile *)0x03007FF0;
    struct SoundMainMixerFrame frame;
    struct SoundChannel *channel;
    u32 inputs[5], vcount = 0, samples, channels, divFreq;
    if (sound->ident == ID_NUMBER && sound->maxLines)
        vcount = *(volatile u8 *)0x04000006;
    if (!SoundMainEntryModel(inputs, sound, vcount))
        return;
    samples = inputs[2];
    frame.pcmBuffer = inputs[3];
    frame.deadline = inputs[0];
    frame.soundInfo = (u32)sound;
    if (sound->reverb) {
        SoundMainReverbModel(sound, (volatile s8 *)frame.pcmBuffer,
                             samples, sound->pcmDmaCounter);
    } else {
        volatile u32 *output = (volatile u32 *)frame.pcmBuffer;
        u32 n;
        for (n = 0; n < samples / 4; n++) {
            output[n] = 0;
            output[n + PCM_DMA_BUF_SIZE / 4] = 0;
        }
    }
    channels = sound->maxChans;
    divFreq = sound->divFreq;
    channel = sound->chans;
    do {
        u32 result;
        vcount = frame.deadline ? *(volatile u8 *)0x04000006 : 0;
        result = SoundMainChannelModel(&frame, channel, channels, vcount);
        if (result == 2)
            break;
        if (result == 1) {
            if (channel->type & 8)
                SoundMainFixedModel(&frame, channel, samples);
            else
                SoundMainResampleModel(&frame, channel, samples, divFreq);
        }
        if ((s32)channels-- <= 1)
            break;
        channel++;
    } while (1);
    sound->ident = ID_NUMBER;
}
