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
__attribute__((matching_thumb_frame_return))
void PlyNoteExitRestoreCandidate(void)
{
    exitR0 = exitStack[6];
    exitR1 = exitStack[7];
    exitR2 = exitStack[8];
    exitR3 = exitStack[9];
    exitR4 = exitStack[10];
    exitR5 = exitStack[11];
    exitR6 = exitStack[12];
    exitR7 = exitStack[13];
    exitR8 = exitR0;
    exitR9 = exitR1;
    exitR10 = exitR2;
    exitR11 = exitR3;
    exitR0 = exitStack[14];
    exitStack += 15;
}
