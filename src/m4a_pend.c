#include "global.h"
#include "gba/m4a_internal.h"

// Empty constraints retain the audio handler's original register allocation.
void ply_pend(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    register unsigned level asm("r2") = track->patternLevel;
    asm("" : "+r"(level));
    if (level)
    {
        register struct MusicPlayerTrack * indexed asm("r3");
        --level;
        track->patternLevel = level;
        level *= 4;
        asm("" : "+r"(level));
        indexed = (struct MusicPlayerTrack *) ((char *) track + level);
        asm("" : "+r"(indexed));
        {
            register u8 * command asm("r2") = indexed->patternStack[0];
            asm("" : "+r"(command));
            track->cmdPtr = command;
        }
    }
}
