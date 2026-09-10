#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 tickMask asm("r3");
register volatile u32 tickStatus asm("r4");
register volatile u32 tickTrack asm("r5");
register volatile u32 tickCount asm("r6");
register volatile struct MusicPlayerInfo *tickPlayer asm("r7");
extern void MPlayMainTrackLoop(void);
__attribute__((matching_tail_transfer))
void MPlayMainTickLoop(void)
{
    tickCount = tickPlayer->trackCount;
    asm("" : "+r"(tickCount));
    tickTrack = (u32)tickPlayer->tracks;
    asm("" : "+r"(tickTrack));
    tickMask = 1;
    asm("" : "+r"(tickMask));
    tickStatus = 0;
    MPlayMainTrackLoop();
}
