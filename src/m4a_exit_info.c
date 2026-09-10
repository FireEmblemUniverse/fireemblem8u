#include "global.h"
#include "gba/m4a_mixer_frame.h"
register u32 exitInfo asm("r0");
register volatile struct SoundMainMixerFrame *exitFrame asm("sp");
__attribute__((matching_thumb_fallthrough))
void SoundMainRAM_DeadlineExit(void)
{
    exitInfo = exitFrame->soundInfo;
}
