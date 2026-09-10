#include "global.h"
register volatile u32 exitR0 asm("r0");
register volatile u32 exitR1 asm("r1");
register volatile u32 exitR2 asm("r2");
register volatile u32 exitR3 asm("r3");
register volatile u32 exitR4 asm("r4");
register volatile u32 exitR5 asm("r5");
register volatile u32 exitR6 asm("r6");
register volatile u32 exitR7 asm("r7");
register u32 exitR8 asm("r8");
register u32 exitR9 asm("r9");
register u32 exitR10 asm("r10");
register u32 exitR11 asm("r11");
register volatile u32 *exitStack asm("sp");
// Private mixer return: the compiler contract restores the original stack
// progression and selects BX r3 from the saved final frame word.
__attribute__((matching_thumb_frame_return))
void SoundMainRAM_ExitRestore(void)
{
    exitR3 = 0x68736d53;
    *(volatile u32 *)exitR0 = exitR3;
    exitR0 = exitStack[7];
    exitR1 = exitStack[8];
    exitR2 = exitStack[9];
    exitR3 = exitStack[10];
    exitR4 = exitStack[11];
    exitR5 = exitStack[12];
    exitR6 = exitStack[13];
    exitR7 = exitStack[14];
    exitR8 = exitR0;
    exitR9 = exitR1;
    exitR10 = exitR2;
    exitR11 = exitR3;
    exitR3 = exitStack[15];
    exitStack += 16;
}
