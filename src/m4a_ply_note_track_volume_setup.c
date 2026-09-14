#include "global.h"
register volatile u32 argR0 asm("r0");
register volatile u32 argR1 asm("r1");
register volatile u32 argR5 asm("r5");
register volatile u32 argSP asm("sp");
extern void PlyNoteTrackVolumeInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void PlyNoteTrackVolumeSetupBody(void)
{
    argR0 = *(volatile u32 *)argSP;
    asm("" : "+r"(argR0));
    argR1 = argR5;
    PlyNoteTrackVolumeInvoke();
}
