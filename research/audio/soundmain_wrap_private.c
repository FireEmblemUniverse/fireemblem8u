#include "global.h"
// One iteration of the resampling wrap loop. The original ADDS/BGT tests
// the signed mathematical sum, not just the sign of the wrapped register.
register u32 wrapLength asm("r0");
register volatile u32 wrapRemaining asm("r2");
register u32 wrapSkip asm("r9");
extern void SoundMainRAM_ResampleReload(void);
extern void SoundMainRAM_ResampleWrap(void);
__attribute__((matching_signed_sum))
void SoundMainRAM_WrapCandidate(void)
{
    s64 total = (s64)(s32)wrapLength + (s64)(s32)wrapRemaining;
    wrapRemaining = (u32)total;
    if (total > 0) {
        SoundMainRAM_ResampleReload();
        return;
    }
    wrapSkip -= wrapLength;
    SoundMainRAM_ResampleWrap();
}
