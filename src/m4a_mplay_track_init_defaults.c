#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 initValue asm("r0");
register volatile u8 *initToneBase asm("r1");
register volatile struct MusicPlayerTrack *initTrack asm("r5");
extern void MPlayMainTrackWait(void);
__attribute__((matching_tail_transfer))
void MPlayMainTrackDefaults(void)
{
    initValue = MPT_FLG_EXIST;
    asm("" : "+r"(initValue));
    initTrack->flags = initValue;
    initValue = 2;
    asm("" : "+r"(initValue));
    initTrack->bendRange = initValue;
    initValue = 64;
    asm("" : "+r"(initValue));
    initTrack->volX = initValue;
    initValue = 22;
    asm("" : "+r"(initValue));
    initTrack->lfoSpeed = initValue;
    initValue = 1;
    asm("" : "+r"(initValue));
    initToneBase = (volatile u8 *)initTrack + 6;
    asm("" : "+r"(initToneBase));
    initToneBase[offsetof(struct MusicPlayerTrack, tone) - 6] = initValue;
    MPlayMainTrackWait();
}
