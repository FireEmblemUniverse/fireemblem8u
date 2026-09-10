#include "global.h"
register volatile u32 frameR0 asm("r0");
register volatile u32 frameR4 asm("r4");
register volatile u32 frameR5 asm("r5");
register volatile u32 frameR6 asm("r6");
register volatile u32 frameR7 asm("r7");
register volatile u32 frameR8 asm("r8");
register volatile u32 frameR9 asm("r9");
register volatile u32 frameR10 asm("r10");
register volatile u32 frameR11 asm("r11");
register volatile u32 frameSP asm("sp");
extern void MPlayMainEntryStatus(void);
__attribute__((matching_thumb_saved_entry_frame))
void MPlayMainEntryFrame(void)
{
    frameR0 = *(volatile u32 *)(frameSP + 0);
    frameSP += 4;
    frameSP -= 16;
    *(volatile u32 *)(frameSP + 0) = frameR4;
    *(volatile u32 *)(frameSP + 4) = frameR5;
    *(volatile u32 *)(frameSP + 8) = frameR6;
    *(volatile u32 *)(frameSP + 12) = frameR7;
    frameR4 = frameR8;
    frameR5 = frameR9;
    frameR6 = frameR10;
    frameR7 = frameR11;
    frameSP -= 16;
    *(volatile u32 *)(frameSP + 0) = frameR4;
    *(volatile u32 *)(frameSP + 4) = frameR5;
    *(volatile u32 *)(frameSP + 8) = frameR6;
    *(volatile u32 *)(frameSP + 12) = frameR7;
    MPlayMainEntryStatus();
}
