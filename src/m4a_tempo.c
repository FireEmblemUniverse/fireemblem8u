#include "global.h"
#include "gba/m4a_internal.h"
// The command reader preserves r0/r1/r12 and returns the byte in r3.
register struct MusicPlayerInfo * tempoPlayer asm("r0");
register struct MusicPlayerTrack * tempoTrack asm("r1");
register volatile unsigned tempoScale asm("r2");
register volatile unsigned tempoValue asm("r3");
extern void ld_r3_tp_adr_i(void);

__attribute__((matching_ip_return))
void ply_tempo(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    tempoValue <<= 1;
    tempoPlayer->tempoD = tempoValue;
    tempoScale = tempoPlayer->tempoU;
    // Keep the loaded scale in r2 without emitting an instruction.
    asm("" : "+r"(tempoScale));
    tempoValue *= tempoScale;
    tempoValue >>= 8;
    tempoPlayer->tempoI = tempoValue;
}
