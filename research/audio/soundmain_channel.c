#include "global.h"
#include "gba/m4a_internal.h"
#include "soundmain_frame.h"

// Semantic model through the channel's ARM sample-mixing entry.
// Return 0: skip channel; 1: mix samples; 2: deadline exits the entire mixer.
u32 SoundMainChannelModel(struct SoundMainMixerFrame *frame,
                          struct SoundChannel *channel, u32 channels, u32 vcount)
{
    struct SoundInfo *sound = (struct SoundInfo *)frame->soundInfo;
    struct WaveData *wave = channel->wav;
    u32 status, envelope;
    frame->channelsRemaining = channels;
    if (frame->deadline) {
        vcount &= 255;
        if (vcount < 160)
            vcount += 228;
        if (vcount >= frame->deadline)
            return 2;
    }
    status = channel->status;
    if (!(status & 0xC7))
        return 0;
    if (status & 0x80) {
        if (status & 0x40)
            goto stop;
        status = 3;
        channel->status = status;
        channel->cp = (u32)wave + 16;
        channel->ct = wave->size;
        envelope = 0;
        channel->ev = 0;
        channel->fw = 0;
        if (wave->status & 0xC000) {
            status |= 0x10;
            channel->status = status;
        }
        goto attack;
    }
    envelope = channel->ev;
    if (status & 4) {
        u32 length = channel->echoLength;
        channel->echoLength = length - 1;
        if (length <= 1)
            goto stop;
        goto volume;
    }
    if (status & 0x40) {
        envelope = (envelope * channel->release) >> 8;
        if (envelope > channel->echoVolume)
            goto volume;
        goto echo;
    }
    if ((status & 3) == 2) {
        envelope = (envelope * channel->decay) >> 8;
        if (envelope > channel->sustain)
            goto volume;
        envelope = channel->sustain;
        if (!envelope)
            goto echo;
        channel->status = --status;
    } else if ((status & 3) == 3) {
attack:
        envelope += channel->attack;
        if (envelope >= 255) {
            envelope = 255;
            channel->status = --status;
        }
    }
    goto volume;
echo:
    envelope = channel->echoVolume;
    if (!envelope)
        goto stop;
    status |= 4;
    channel->status = status;
volume:
    channel->ev = envelope;
    envelope = (envelope * ((u32)sound->masterVolume + 1)) >> 4;
    channel->er = (channel->rightVolume * envelope) >> 8;
    channel->el = (channel->leftVolume * envelope) >> 8;
    frame->mixerScratch10 = status & 0x10;
    if (frame->mixerScratch10) {
        frame->mixerScratchC = (u32)wave + 16 + wave->loopStart;
        frame->mixerScratch10 = wave->size - wave->loopStart;
    }
    return 1;
stop:
    channel->status = 0;
    return 0;
}
