#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 gateTempo asm("r0");
register volatile struct MusicPlayerInfo *gatePlayer asm("r7");
extern void MPlayMainTickLoop(void);
extern void MPlayMainPostTick(void);
__attribute__((matching_tail_transfer))
void MPlayTempoGateCandidate(void)
{
    gatePlayer->tempoC = gateTempo;
    if (gateTempo >= 150) {
        MPlayMainTickLoop();
        return;
    }
    MPlayMainPostTick();
}
