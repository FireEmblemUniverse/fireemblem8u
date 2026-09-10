#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 setupValue asm("r0");
register volatile struct SoundInfo *setupInfo asm("r4");
register u32 setupFrequency asm("r12");
register volatile struct SoundMainMixerFrame *setupFrame asm("sp");
__attribute__((matching_thumb_fallthrough))
void SoundMainRAM_ChanSetup(void)
{
    setupInfo = (volatile struct SoundInfo *)setupFrame->soundInfo;
    setupValue = setupInfo->divFreq;
    setupFrequency = setupValue;
    setupValue = setupInfo->maxChans;
    setupInfo = (volatile struct SoundInfo *)&setupInfo->chans[0];
}
