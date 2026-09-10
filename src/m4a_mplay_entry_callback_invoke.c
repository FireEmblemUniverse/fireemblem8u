#include "global.h"
register volatile u32 entryInput0 asm("r0");
register volatile u32 entryInput1 asm("r1");
register volatile u32 entryInput2 asm("r2");
register volatile u32 entryCallback asm("r3");
extern void MPlayMainEntryFrame(void);
__attribute__((matching_thumb_callback_tail))
void MPlayMainEntryCallbackInvoke(void)
{
    ((void (*)(void))entryCallback)();
    MPlayMainEntryFrame();
}
