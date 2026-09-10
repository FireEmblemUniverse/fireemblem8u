#include "global.h"
#include "gba/m4a_internal.h"
register volatile unsigned oldModType asm("r0");
register struct MusicPlayerTrack *modTrack asm("r1");
register volatile unsigned modMask asm("r2");
register volatile unsigned modByte asm("r3");
extern void ld_r3_tp_adr_i(void);
__attribute__((matching_ip_return))
void ply_modt(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    ld_r3_tp_adr_i();
    oldModType = modTrack->modT;
    if (oldModType != modByte)
    {
        modTrack->modT = modByte;
        modByte = modTrack->flags;
        modMask = 15;
        modByte |= modMask;
        modTrack->flags = modByte;
    }
}
