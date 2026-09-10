#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 dispatchStatus asm("r0");
register volatile u32 dispatchBit asm("r1");
register volatile u32 dispatchMask asm("r3");
register volatile u32 dispatchChannels asm("r4");
register volatile struct MusicPlayerTrack *dispatchTrack asm("r5");
register volatile u32 dispatchSavedMask asm("r10");
register volatile u32 dispatchSavedStatus asm("r11");
extern void MPlayMainTrackAdvance(void);
extern void MPlayMainTrackInit(void);
extern void MPlayMainChannelGate(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayMainTrackLoop(void)
{
    dispatchStatus = dispatchTrack->flags;
    asm("" : "+r"(dispatchStatus));
    dispatchBit = 128;
    asm("" : "+r"(dispatchBit));
    if (!(dispatchBit & dispatchStatus)) {
        MPlayMainTrackAdvance();
        return;
    }
    dispatchSavedMask = dispatchMask;
    asm("" : "+r"(dispatchSavedMask));
    dispatchChannels |= dispatchMask;
    asm("" : "+r"(dispatchChannels));
    dispatchSavedStatus = dispatchChannels;
    asm("" : "+r"(dispatchSavedStatus));
    dispatchChannels = (u32)dispatchTrack->chan;
    if (!dispatchChannels) {
        MPlayMainTrackInit();
        return;
    }
    MPlayMainChannelGate();
}
