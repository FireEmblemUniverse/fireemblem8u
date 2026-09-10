#include "global.h"
register volatile u32 priorityR0 asm("r0");
register volatile u32 priorityR1 asm("r1");
register volatile u32 priorityR3 asm("r3");
register volatile u32 priorityR5 asm("r5");
register volatile u32 priorityR6 asm("r6");
register volatile u32 priorityR9 asm("r9");
register volatile u32 prioritySP asm("sp");
extern void PlyNoteCgbSelect(void);
extern void PlyNotePcmSelect(void);
__attribute__((matching_tail_transfer, matching_thumb_and_store_tail))
void PlyNotePriority(void)
{
    *(volatile u32 *)(prioritySP + 8) = priorityR3;
    priorityR6 = *(volatile u32 *)prioritySP;
    asm("" : "+r"(priorityR6));
    priorityR1 = *(volatile u8 *)(priorityR6 + 9);
    asm("" : "+r"(priorityR1));
    priorityR0 = *(volatile u8 *)(priorityR5 + 29);
    asm("" : "+r"(priorityR0));
    priorityR0 += priorityR1;
    asm("" : "+r"(priorityR0));
    if (priorityR0 > 255)
        priorityR0 = 255;
    *(volatile u32 *)(prioritySP + 16) = priorityR0;
    priorityR6 = priorityR9;
    asm("" : "+r"(priorityR6));
    priorityR0 = *(volatile u8 *)priorityR6;
    asm("" : "+r"(priorityR0));
    priorityR6 = 7;
    asm("" : "+r"(priorityR6));
    priorityR6 &= priorityR0;
    *(volatile u32 *)(prioritySP + 12) = priorityR6;
    if (!priorityR6) { PlyNotePcmSelect(); return; }
    PlyNoteCgbSelect();
}
