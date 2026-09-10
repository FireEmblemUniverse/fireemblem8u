#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/m4a_mixer_frame.h"
register volatile u32 advanceCount asm("r0");
register struct SoundChannel *advanceChannel asm("r4");
register volatile struct SoundMainMixerFrame *advanceFrame asm("sp");
extern void SoundMainRAM_DeadlineExit(void);
extern void SoundMainRAM_ChanLoop(void);
__attribute__((matching_tail_transfer))
void SoundMainRAM_ChannelAdvanceCandidate(void)
{
    advanceCount = advanceFrame->channelsRemaining;
    if ((s32)advanceCount > 1) {
        advanceCount -= 1;
        advanceChannel = (struct SoundChannel *)((u32)advanceChannel + 64);
        SoundMainRAM_ChanLoop();
        return;
    }
    advanceCount -= 1;
    SoundMainRAM_DeadlineExit();
}
