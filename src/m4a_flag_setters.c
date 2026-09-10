#include "global.h"
#include "gba/m4a_internal.h"
/* Volatile register bindings retain the private mask/result updates in order. */
#define PRIVATE_RETURN __attribute__((matching_ip_return))
register struct MusicPlayerTrack * commandTrack asm("r1");
register volatile unsigned commandMask asm("r2");
register volatile unsigned commandByte asm("r3");
extern void ld_r3_tp_adr_i(void);

PRIVATE_RETURN void ply_keysh(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandTrack->keyShift = commandByte;
    commandByte = commandTrack->flags;
    commandMask = 12;
    commandByte |= commandMask;
    commandTrack->flags = commandByte;
}
PRIVATE_RETURN void ply_vol(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandTrack->vol = commandByte;
    commandByte = commandTrack->flags;
    commandMask = 3;
    commandByte |= commandMask;
    commandTrack->flags = commandByte;
}
PRIVATE_RETURN void ply_bendr(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandTrack->bendRange = commandByte;
    commandByte = commandTrack->flags;
    commandMask = 12;
    commandByte |= commandMask;
    commandTrack->flags = commandByte;
}

PRIVATE_RETURN void ply_pan(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandByte -= 64;
    commandTrack->pan = commandByte;
    commandByte = commandTrack->flags;
    commandMask = 3;
    commandByte |= commandMask;
    commandTrack->flags = commandByte;
}

PRIVATE_RETURN void ply_bend(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandByte -= 64;
    commandTrack->bend = commandByte;
    commandByte = commandTrack->flags;
    commandMask = 12;
    commandByte |= commandMask;
    commandTrack->flags = commandByte;
}

PRIVATE_RETURN void ply_tune(struct MusicPlayerInfo * player, struct MusicPlayerTrack * track)
{
    ld_r3_tp_adr_i();
    commandByte -= 64;
    commandTrack->tune = commandByte;
    commandByte = commandTrack->flags;
    commandMask = 12;
    commandByte |= commandMask;
    commandTrack->flags = commandByte;
}
