#include "global.h"
register volatile u32 attachR1 asm("r1");
register volatile u32 attachR3 asm("r3");
register volatile u32 attachR4 asm("r4");
register volatile u32 attachR5 asm("r5");
extern void PlyNoteLfoDelay(void);
__attribute__((matching_tail_transfer))
void PlyNoteChannelLinkCandidate(void)
{
    attachR1 = 0;
    asm("" : "+r"(attachR1));
    *(volatile u32 *)(attachR4 + 48) = attachR1;
    attachR3 = *(volatile u32 *)(attachR5 + 32);
    asm("" : "+r"(attachR3));
    *(volatile u32 *)(attachR4 + 52) = attachR3;
    if (attachR3)
        *(volatile u32 *)(attachR3 + 48) = attachR4;
    *(volatile u32 *)(attachR5 + 32) = attachR4;
    *(volatile u32 *)(attachR4 + 44) = attachR5;
    PlyNoteLfoDelay();
}
