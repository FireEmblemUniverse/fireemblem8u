#include "global.h"
#include "gba/m4a_internal.h"

// Assembly callers retain r0, r1 and r12 across this leaf.
void clear_modM(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    register unsigned mask asm("r2") = 0;
    register unsigned flags asm("r3");
    asm("" : "+r"(mask));
    track->modM = mask;
    track->lfoSpeedC = mask;
    mask = track->modT;
    asm("" : "+r"(mask));
    if (mask == 0)
    {
        asm("" : : : "r2");
        mask = 12;
    }
    else
        mask = 3;
    asm("" : "+r"(mask));
    flags = track->flags;
    asm("" : "+r"(flags));
    flags |= mask;
    asm("" : "+r"(flags));
    track->flags = flags;
}
