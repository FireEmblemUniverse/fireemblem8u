#include "global.h"
#include "gba/m4a_internal.h"
register struct MusicPlayerInfo *repeatPlayer asm("r0");
register struct MusicPlayerTrack *repeatTrack asm("r1");
register const u8 * volatile repeatCommand asm("r2");
register volatile unsigned repeatByte asm("r3");
register volatile unsigned repeatCount asm("r12");
extern void ld_r3_tp_adr_i(void);
__attribute__((matching_shared_frame))
void ply_rept(struct MusicPlayerInfo *player, struct MusicPlayerTrack *track)
{
    repeatCommand = repeatTrack->cmdPtr;
    repeatByte = *repeatCommand;
    if (repeatByte == 0)
    {
        repeatCommand++;
        repeatTrack->cmdPtr = (u8 *)repeatCommand;
        ply_goto(repeatPlayer, repeatTrack);
    }
    else
    {
        repeatByte = repeatTrack->repN;
        repeatByte++;
        repeatTrack->repN = repeatByte;
        // Compare the untruncated increment, including 256 after byte wraparound.
        repeatCount = repeatByte;
        ld_r3_tp_adr_i();
        if (repeatCount < repeatByte)
            ply_goto(repeatPlayer, repeatTrack);
        else
        {
            repeatByte = 0;
            repeatTrack->repN = repeatByte;
            repeatCommand += 5;
            repeatTrack->cmdPtr = (u8 *)repeatCommand;
        }
    }
}
