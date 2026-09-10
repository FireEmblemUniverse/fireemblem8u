#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 clockValue asm("r0");
register volatile u32 clockTracks asm("r4");
register volatile struct MusicPlayerInfo *clockPlayer asm("r7");
extern void MPlayMainExit(void);
extern void MPlayMainTempoFinish(void);
__attribute__((matching_tail_transfer))
void MPlayClockUpdateCandidate(void)
{
    clockValue = clockPlayer->clock;
    asm("" : "+r"(clockValue));
    clockValue += 1;
    asm("" : "+r"(clockValue));
    clockPlayer->clock = clockValue;
    if (clockTracks == 0) {
        clockValue = 128;
        asm("" : "+r"(clockValue));
        clockValue <<= 24;
        clockPlayer->status = clockValue;
        MPlayMainExit();
        return;
    }
    MPlayMainTempoFinish();
}
