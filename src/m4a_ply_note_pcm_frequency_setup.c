#include "global.h"
register volatile u32 argR0 asm("r0");
register volatile u32 argR1 asm("r1");
register volatile u32 argR2 asm("r2");
register volatile u32 argR3 asm("r3");
register volatile u32 argR5 asm("r5");
register volatile u32 argR7 asm("r7");
extern void PlyNotePcmFrequencyInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void PlyNotePcmFrequencySetupBody(void)
{
    argR2 = *(volatile u8 *)(argR5 + 9);
    asm("" : "+r"(argR2));
    argR1 = argR3;
    asm("" : "+r"(argR1));
    argR0 = argR7;
    PlyNotePcmFrequencyInvoke();
}
