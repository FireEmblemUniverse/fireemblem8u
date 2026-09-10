#include "global.h"
#include "gba/m4a_internal.h"
/* Research probe only: requires a validated private-entry compiler lowering.
 * Ordinary GCC adds an ABI frame and continuation call; that output is not a
 * matching or executable substitute for the original entry fragment. */
register volatile u32 lockR0 asm("r0");
register volatile u32 lockR1 asm("r1");
register volatile u32 lockR2 asm("r2");
register volatile u32 lockR3 asm("r3");
register volatile u32 lockR4 asm("r4");
register volatile u32 lockR5 asm("r5");
register volatile u32 lockR6 asm("r6");
register volatile u32 lockR7 asm("r7");
register volatile u32 lockR8 asm("r8");
register volatile u32 lockR9 asm("r9");
register volatile u32 lockR10 asm("r10");
register volatile u32 lockR11 asm("r11");
register volatile u32 lockSP asm("sp");
register volatile u32 lockLR asm("lr");
extern void MPlayMainEntryCallbackSetup(void);
__attribute__((matching_thumb_lock_frame))
void MPlayMain(void)
{
    lockR2 = 0x68736d53;
    asm("" : "+r"(lockR2));
    lockR3 = ((volatile struct MusicPlayerInfo *)lockR0)->ident;
    asm("" : "+r"(lockR3));
    if (lockR2 != lockR3)
        return;
    lockR3 += 1;
    ((volatile struct MusicPlayerInfo *)lockR0)->ident = lockR3;
    lockSP -= 8;
    *(volatile u32 *)(lockSP + 0) = lockR0;
    *(volatile u32 *)(lockSP + 4) = lockLR;
    /* The successful comparison proves the incremented value. Re-establish it
     * after the compiler uses r3 temporarily to store LR, avoiding a spill. */
    lockR3 = 0x68736d54;
    MPlayMainEntryCallbackSetup();
}
