#include "global.h"
register volatile u32 setupCount asm("r2");
register volatile u32 setupRequested asm("r8");
register volatile u32 setupRemainder asm("lr");
extern void SoundMainRAM_Short(void);
extern void SoundMainRAM_Packed(void);
__attribute__((matching_subtract_compare, matching_arm_adjacent))
void SoundMainRAM_FixedSetup(void)
{
    u32 previous;
    if ((s32)setupCount <= 4) {
        SoundMainRAM_Short();
        return;
    }
    previous = setupCount;
    setupCount -= setupRequested;
    if ((s32)previous > (s32)setupRequested) {
        setupRemainder = 0;
        SoundMainRAM_Packed();
        return;
    }
    setupRemainder = setupRequested;
    setupCount += setupRequested;
    setupRequested = setupCount - 4;
    setupRemainder -= setupRequested;
    setupCount &= 3;
    if (setupCount == 0)
        setupCount = 4;
    SoundMainRAM_Packed();
}
