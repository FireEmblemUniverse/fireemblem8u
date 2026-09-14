#include "global.h"
register volatile u32 argR0 asm("r0");
register volatile u32 argR4 asm("r4");
extern void PlyNoteClearInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void PlyNoteClearSetupCandidate(void)
{
    argR0 = argR4;
    PlyNoteClearInvoke();
}
