#include "global.h"
#include "gba/m4a_internal.h"
register struct MusicPlayerInfo *resetPlayer asm("r0");
register struct MusicPlayerTrack *resetTrack asm("r1");
register volatile unsigned resetByte asm("r3");
extern void ld_r3_tp_adr_i_unchecked(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
extern void clear_modM(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
#define PRIVATE_RETURN __attribute__((matching_ip_return))
PRIVATE_RETURN void ply_lfos(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    ld_r3_tp_adr_i_unchecked(resetPlayer, resetTrack);
    resetTrack->lfoSpeed = resetByte;
    if (resetByte == 0)
        clear_modM(resetPlayer, resetTrack);
}
PRIVATE_RETURN void ply_mod(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    ld_r3_tp_adr_i_unchecked(resetPlayer, resetTrack);
    resetTrack->mod = resetByte;
    if (resetByte == 0)
        clear_modM(resetPlayer, resetTrack);
}
