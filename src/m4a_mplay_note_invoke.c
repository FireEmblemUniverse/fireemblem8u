#include "global.h"
register volatile u32 noteInput0 asm("r0");
register volatile u32 noteInput1 asm("r1");
register volatile u32 noteInput2 asm("r2");
register volatile u32 noteCallback asm("r3");
extern void MPlayMainTrackWait(void);
__attribute__((matching_thumb_callback_tail))
void MPlayMainNoteInvoke(void)
{
    ((void (*)(void))noteCallback)();
    MPlayMainTrackWait();
}
