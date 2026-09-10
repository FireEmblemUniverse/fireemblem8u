#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 entryR0 asm("r0");
register volatile u32 entryR1 asm("r1");
register volatile u32 entryR2 asm("r2");
register volatile u32 entryR3 asm("r3");
register volatile u32 entryR4 asm("r4");
register volatile u32 entryR5 asm("r5");
register volatile u32 entryR6 asm("r6");
register volatile u32 entryR7 asm("r7");
register volatile u32 entryR8 asm("r8");
register volatile u32 entryR9 asm("r9");
register volatile u32 entryR10 asm("r10");
register volatile u32 entryR11 asm("r11");
register volatile u32 entryLR asm("lr");
register volatile u32 entrySP asm("sp");
// Explicit private frame contents, before selecting grouped PUSH instructions.
void SoundMainEntryFrameCandidate(void)
{
    entryR0 = 0x03007ff0;
    asm("" : "+r"(entryR0));
    entryR0 = *(volatile u32 *)entryR0;
    asm("" : "+r"(entryR0));
    entryR2 = ID_NUMBER;
    asm("" : "+r"(entryR2));
    entryR3 = *(volatile u32 *)entryR0;
    asm("" : "+r"(entryR3));
    if (entryR2 != entryR3)
        return;
    entryR3++;
    *(volatile u32 *)entryR0 = entryR3;
    entrySP -= 20;
    *(volatile u32 *)(entrySP + 0) = entryR4;
    *(volatile u32 *)(entrySP + 4) = entryR5;
    *(volatile u32 *)(entrySP + 8) = entryR6;
    *(volatile u32 *)(entrySP + 12) = entryR7;
    *(volatile u32 *)(entrySP + 16) = entryLR;
    entryR1 = entryR8;
    entryR2 = entryR9;
    entryR3 = entryR10;
    entryR4 = entryR11;
    entrySP -= 20;
    *(volatile u32 *)(entrySP + 0) = entryR0;
    *(volatile u32 *)(entrySP + 4) = entryR1;
    *(volatile u32 *)(entrySP + 8) = entryR2;
    *(volatile u32 *)(entrySP + 12) = entryR3;
    *(volatile u32 *)(entrySP + 16) = entryR4;
    entrySP -= 24;
}
