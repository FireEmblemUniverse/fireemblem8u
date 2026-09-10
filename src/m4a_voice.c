#include "global.h"
#include "gba/m4a_internal.h"
// The filter preserves r0/r1/r2/r12 and validates each loaded word in r3.
register struct MusicPlayerInfo *voicePlayer asm("r0");
register struct MusicPlayerTrack *voiceTrack asm("r1");
register volatile unsigned voiceAddress asm("r2");
register volatile unsigned voiceWord asm("r3");
extern void chk_adr_r2(void);
__attribute__((matching_ip_return))
void ply_voice(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    voiceAddress = (unsigned)voiceTrack->cmdPtr;
    voiceWord = *(const u8 *)voiceAddress;
    voiceAddress++;
    voiceTrack->cmdPtr = (u8 *)voiceAddress;
    voiceAddress = voiceWord << 1;
    voiceAddress += voiceWord;
    voiceAddress <<= 2;
    voiceWord = (unsigned)voicePlayer->tone;
    voiceAddress += voiceWord;
    voiceWord = *(const u32 *)voiceAddress;
    chk_adr_r2();
    // Preserve word-by-word order, including overlapping source/destination.
    ((u32 *)&voiceTrack->tone)[0] = voiceWord;
    voiceWord = ((const u32 *)voiceAddress)[1];
    chk_adr_r2();
    ((u32 *)&voiceTrack->tone)[1] = voiceWord;
    voiceWord = ((const u32 *)voiceAddress)[2];
    chk_adr_r2();
    ((u32 *)&voiceTrack->tone)[2] = voiceWord;
}
