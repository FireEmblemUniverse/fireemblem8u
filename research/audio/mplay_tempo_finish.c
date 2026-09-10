#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 finishTempo asm("r0");
register volatile u32 finishTracks asm("r4");
register volatile struct MusicPlayerInfo *finishPlayer asm("r7");
extern void MPlayMainTempoStore(void);
__attribute__((matching_tail_transfer))
void MPlayTempoFinishCandidate(void)
{
    finishPlayer->status = finishTracks;
    finishTempo = finishPlayer->tempoC;
    finishTempo -= 150;
    MPlayMainTempoStore();
}
