#include "global.h"
// Candidate for the resampling source-advance block; not production yet.
// The subtraction's signed branch compares the incoming operands, including
// overflow cases, rather than testing the sign of the wrapped result alone.
register volatile u32 advanceCurrent asm("r0");
register volatile u32 advanceDifference asm("r1");
register u32 advanceRemaining asm("r2");
register volatile s8 *volatile advanceSource asm("r3");
register volatile u32 advanceSkip asm("r9");
register u32 advanceFraction asm("lr");
extern void SoundMainRAM_ResampleLoop(void);
extern void SoundMainRAM_ResampleNoAdvance(void);
__attribute__((matching_subtract_compare, matching_byte_preincrement))
void SoundMainRAM_AdvanceCandidate(void)
{
    u32 previous;
    advanceFraction &= ~0x3F800000u;
    asm("" : "+r"(advanceFraction));
    previous = advanceRemaining;
    advanceRemaining -= advanceSkip;
    if ((s32)previous <= (s32)advanceSkip) {
        SoundMainRAM_ResampleLoop();
        return;
    }
    advanceSkip--;
    if (advanceSkip == 0)
        advanceCurrent += advanceDifference;
    else {
        advanceSource += advanceSkip;
        advanceCurrent = *advanceSource;
    }
    advanceDifference = *++advanceSource;
    advanceDifference -= advanceCurrent;
    SoundMainRAM_ResampleNoAdvance();
}
