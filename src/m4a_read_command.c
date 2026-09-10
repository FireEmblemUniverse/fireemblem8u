#include "global.h"
#include "gba/m4a_internal.h"

// Internal audio ABI: keep player/track in r0/r1 and return the byte in r3.
// The command stream pointer advances by one byte; callers guarantee validity.
void ld_r3_tp_adr_i_unchecked(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    register u8 * command asm("r2") = track->cmdPtr;
    register u8 * next asm("r3");
    register unsigned value asm("r3");
    asm("" : "+r"(command));
    next = command + 1;
    track->cmdPtr = next;
    value = *command;
    asm("" : : "r"(value));
}
