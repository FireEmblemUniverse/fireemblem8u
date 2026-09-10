#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 playerTempo asm("r0");
register volatile u32 playerIncrement asm("r1");
register volatile struct MusicPlayerInfo *tempoPlayer asm("r7");
extern void MPlayMainTempoStore(void);
__attribute__((matching_tail_transfer))
void MPlayTempoAccumulateCandidate(void)
{
    playerTempo = tempoPlayer->tempoC;
    playerIncrement = tempoPlayer->tempoI;
    playerTempo += playerIncrement;
    MPlayMainTempoStore();
}
