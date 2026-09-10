#include "global.h"
register volatile u32 commandInput0 asm("r0");
register volatile u32 commandInput1 asm("r1");
register volatile u32 commandInput2 asm("r2");
register volatile u32 commandCallback asm("r3");
extern void MPlayMainCommandStatus(void);
__attribute__((matching_thumb_callback_tail))
void MPlayMainCommandInvoke(void)
{
    ((void (*)(void))commandCallback)();
    MPlayMainCommandStatus();
}
