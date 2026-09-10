#include "global.h"
#include "gba/m4a_internal.h"
// Private helper entry consumes r2, advances the track pointer and returns r3.
register volatile u8 * volatile portAddress asm("r0");
register struct MusicPlayerTrack *portTrack asm("r1");
register const u8 * volatile portCommand asm("r2");
register volatile unsigned portValue asm("r3");
extern void _081DD64A(void);
__attribute__((matching_ip_return))
void ply_port(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    portCommand = portTrack->cmdPtr;
    portValue = *portCommand;
    portCommand++;
    portAddress = (volatile u8 *)0x04000060;
    asm("" : "+r"(portAddress));
    portAddress += portValue;
    _081DD64A();
    *portAddress = portValue;
}
