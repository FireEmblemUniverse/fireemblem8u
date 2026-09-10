#include "global.h"
#include "gba/m4a_internal.h"

#define PRIVATE_RETURN __attribute__((matching_ip_return))

/* The audio byte-reader ABI preserves r0/r1 and returns its byte in r3. */
register struct MusicPlayerTrack * commandTrack asm("r1");
register unsigned commandByte asm("r3");
extern void ld_r3_tp_adr_i(void);

PRIVATE_RETURN void ply_prio(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandTrack->priority = commandByte;
}

PRIVATE_RETURN void ply_lfodl(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandTrack->lfoDelay = commandByte;
}
