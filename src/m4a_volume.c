#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 volumeValue asm("r0");
register volatile u32 volumeLoopStart asm("r1");
register volatile struct WaveData *volumeWave asm("r3");
register volatile struct SoundChannel *volumeChannel asm("r4");
register volatile u32 volumeLevel asm("r5");
register u32 volumeStatus asm("r6");
register volatile struct SoundMainMixerFrame *volumeFrame asm("sp");
extern void SoundMainRAM_ResumeSamples(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void SoundMainRAM_EnvelopeVolume(void)
{
    volumeChannel->ev = volumeLevel;
    volumeValue = volumeFrame->soundInfo;
    volumeValue = ((volatile struct SoundInfo *)volumeValue)->masterVolume;
    volumeValue += 1;
    volumeValue *= volumeLevel;
    volumeLevel = volumeValue >> 4;
    asm("" : "+r"(volumeLevel));
    volumeValue = volumeChannel->rightVolume;
    volumeValue *= volumeLevel;
    volumeValue >>= 8;
    volumeChannel->er = volumeValue;
    volumeValue = volumeChannel->leftVolume;
    volumeValue *= volumeLevel;
    volumeValue >>= 8;
    volumeChannel->el = volumeValue;
    volumeValue = 16;
    volumeValue &= volumeStatus;
    volumeFrame->mixerScratch10 = volumeValue;
    if (volumeValue) {
        volumeValue = (u32)volumeWave;
        asm("" : "+r"(volumeValue));
        volumeValue += 16;
        volumeLoopStart = volumeWave->loopStart;
        volumeValue += volumeLoopStart;
        volumeFrame->mixerScratchC = volumeValue;
        volumeValue = volumeWave->size;
        volumeValue -= volumeLoopStart;
        volumeFrame->mixerScratch10 = volumeValue;
    }
    SoundMainRAM_ResumeSamples();
}
