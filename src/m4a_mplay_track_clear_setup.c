#include "global.h"
register volatile u32 clearArgument asm("r0");
register volatile u32 clearChannel asm("r5");
extern void MPlayMainTrackClearInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainTrackClear(void)
{
    clearArgument = clearChannel;
    MPlayMainTrackClearInvoke();
}
