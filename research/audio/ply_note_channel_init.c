#include "global.h"
register volatile u32 initR0 asm("r0");
register volatile u32 initR4 asm("r4");
register volatile u32 initR5 asm("r5");
register volatile u32 initR6 asm("r6");
register volatile u32 initR7 asm("r7");
register volatile u32 initR9 asm("r9");
register volatile u32 initSP asm("sp");
extern void PlyNoteVolumeInvoke(void);
__attribute__((matching_tail_transfer))
void PlyNoteChannelInitCandidate(void)
{
    initR0 = *(volatile u32 *)(initR5 + 4);
    asm("" : "+r"(initR0));
    *(volatile u32 *)(initR4 + 16) = initR0;
    initR0 = *(volatile u32 *)(initSP + 16);
    asm("" : "+r"(initR0));
    *(volatile u8 *)(initR4 + 19) = initR0;
    initR0 = *(volatile u32 *)(initSP + 8);
    asm("" : "+r"(initR0));
    *(volatile u8 *)(initR4 + 8) = initR0;
    initR0 = *(volatile u32 *)(initSP + 20);
    asm("" : "+r"(initR0));
    *(volatile u8 *)(initR4 + 20) = initR0;
    initR6 = initR9;
    asm("" : "+r"(initR6));
    initR0 = *(volatile u8 *)initR6;
    asm("" : "+r"(initR0));
    *(volatile u8 *)(initR4 + 1) = initR0;
    initR7 = *(volatile u32 *)(initR6 + 4);
    asm("" : "+r"(initR7));
    *(volatile u32 *)(initR4 + 36) = initR7;
    initR0 = *(volatile u32 *)(initR6 + 8);
    asm("" : "+r"(initR0));
    *(volatile u32 *)(initR4 + 4) = initR0;
    initR0 = *(volatile u16 *)(initR5 + 30);
    asm("" : "+r"(initR0));
    *(volatile u16 *)(initR4 + 12) = initR0;
    PlyNoteVolumeInvoke();
}
