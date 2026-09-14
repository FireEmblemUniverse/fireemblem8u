#include "global.h"
register volatile u32 pcmR2 asm("r2");
register volatile u32 pcmR3 asm("r3");
register volatile u32 pcmR4 asm("r4");
register volatile u32 pcmR5 asm("r5");
register volatile u32 pcmR6 asm("r6");
register volatile u32 pcmR7 asm("r7");
register volatile u32 pcmR8 asm("r8");
register volatile u32 pcmSP asm("sp");
extern void PlyNotePcmLoop(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void PlyNotePcmSetup(void)
{
    pcmR6 = *(volatile u32 *)(pcmSP + 16);
    asm("" : "+r"(pcmR6));
    pcmR7 = pcmR5;
    asm("" : "+r"(pcmR7));
    pcmR2 = 0;
    asm("" : "+r"(pcmR2));
    pcmR8 = pcmR2;
    asm("" : "+r"(pcmR8));
    pcmR4 = *(volatile u32 *)(pcmSP + 4);
    asm("" : "+r"(pcmR4));
    pcmR3 = *(volatile u8 *)(pcmR4 + 6);
    asm("" : "+r"(pcmR3));
    pcmR4 += 80;
    PlyNotePcmLoop();
}
