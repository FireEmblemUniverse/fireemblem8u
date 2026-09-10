#include "global.h"
register volatile u32 clearArgument asm("r0");
register volatile u32 clearChannel asm("r4");
extern void MPlayMainPostClearInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayPostClearSetupCandidate(void)
{
    clearArgument = clearChannel;
    MPlayMainPostClearInvoke();
}
