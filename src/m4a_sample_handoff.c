#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register u32 handoffTarget asm("r0");
register u32 handoffCount asm("r2");
register u32 handoffSource asm("r3");
register volatile struct SoundChannel *handoffChannel asm("r4");
register u32 handoffBuffer asm("r5");
register volatile struct SoundMainMixerFrame *handoffFrame asm("sp");
extern void SoundMainRAM_SampleEntry(void);
// The private handoff contract selects a link-checked ADR and BX r0, so this
// exact block remains valid when the mixer is copied from ROM into RAM.
__attribute__((matching_thumb_pc_handoff))
void SoundMainRAM_ResumeSamples(void)
{
    handoffBuffer = handoffFrame->pcmBuffer;
    handoffCount = handoffChannel->ct;
    handoffSource = handoffChannel->cp;
    handoffTarget = (u32)SoundMainRAM_SampleEntry;
}
