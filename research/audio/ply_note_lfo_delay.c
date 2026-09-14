#include "global.h"
register volatile u32 argR0 asm("r0");
register volatile u32 argR1 asm("r1");
register volatile u32 argR5 asm("r5");
extern void PlyNoteTrackVolumeSetup(void);
extern void PlyNoteModInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero, matching_thumb_direct_tails))
void PlyNoteLfoDelayCandidate(void)
{
    argR0 = *(volatile u8 *)(argR5 + 27);
    asm("" : "+r"(argR0));
    *(volatile u8 *)(argR5 + 28) = argR0;
    if (argR0 == argR1) {
        PlyNoteTrackVolumeSetup();
        return;
    }
    argR1 = argR5;
    PlyNoteModInvoke();
}
