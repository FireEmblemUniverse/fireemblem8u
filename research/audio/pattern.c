#include "global.h"
#include "gba/m4a_internal.h"
// Research candidate: ordinary calls still differ from the original tail branches.
register struct MusicPlayerInfo *patternPlayer asm("r0");
register struct MusicPlayerTrack *patternTrack asm("r1");
register volatile unsigned patternValue asm("r2");
register u8 * volatile patternSlot asm("r3");
void ply_patt(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    patternValue = patternTrack->patternLevel;
    if (patternValue < 3)
    {
        patternValue <<= 2;
        patternSlot = (u8 *)patternTrack + patternValue;
        patternValue = (unsigned)patternTrack->cmdPtr;
        patternValue += 4;
        *(u32 *)(patternSlot + 68) = patternValue;
        patternValue = patternTrack->patternLevel;
        patternValue++;
        patternTrack->patternLevel = patternValue;
        ply_goto(patternPlayer, patternTrack);
    }
    else
        ply_fine(patternPlayer, patternTrack);
}
