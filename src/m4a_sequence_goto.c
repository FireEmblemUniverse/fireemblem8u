#include "global.h"
#include "gba/m4a_internal.h"
// The byte reader filters only the low byte and preserves the other registers.
register volatile unsigned jumpAddress asm("r0");
register struct MusicPlayerTrack *jumpTrack asm("r1");
register const u8 *jumpCommand asm("r2");
register volatile unsigned jumpByte asm("r3");
extern void ldrb_r3_r2(void);
void ply_goto(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    jumpCommand = jumpTrack->cmdPtr;
    jumpAddress = jumpCommand[3];
    jumpAddress <<= 8;
    jumpByte = jumpCommand[2];
    jumpAddress |= jumpByte;
    jumpAddress <<= 8;
    jumpByte = jumpCommand[1];
    jumpAddress |= jumpByte;
    jumpAddress <<= 8;
    ldrb_r3_r2();
    jumpAddress |= jumpByte;
    jumpTrack->cmdPtr = (u8 *)jumpAddress;
}
