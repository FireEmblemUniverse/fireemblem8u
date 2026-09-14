#include "global.h"
register volatile u32 pcmR3 asm("r3");
register volatile u32 pcmR4 asm("r4");
register volatile u32 pcmR8 asm("r8");
extern void PlyNotePcmLoop(void);
extern void PlyNoteExit(void);
extern void PlyNoteChannelAttach(void);
__attribute__((matching_tail_transfer, matching_thumb_fork_decrement, matching_thumb_direct_tails))
void PlyNotePcmAdvanceCandidate(void)
{
    pcmR4 += 64;
    asm("" : "+r"(pcmR4));
    if ((s32)pcmR3 > 1) {
        pcmR3--;
        PlyNotePcmLoop();
        return;
    }
    pcmR3--;
    pcmR4 = pcmR8;
    asm("" : "+r"(pcmR4));
    if (!pcmR4) { PlyNoteExit(); return; }
    PlyNoteChannelAttach();
}
