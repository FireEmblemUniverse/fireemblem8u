#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 modulationValue asm("r0");
register volatile u32 modulationPhase asm("r1");
register volatile u32 modulationResult asm("r2");
register volatile struct MusicPlayerTrack *modulationTrack asm("r5");
extern void MPlayMainTrackFinish(void);
__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))
void MPlayMainModulationUpdate(void)
{
    modulationValue = modulationTrack->lfoSpeedC;
    asm("" : "+r"(modulationValue));
    modulationValue += modulationPhase;
    asm("" : "+r"(modulationValue));
    modulationTrack->lfoSpeedC = modulationValue;
    modulationPhase = modulationValue;
    asm("" : "+r"(modulationPhase));
    modulationValue -= 64;
    asm("" : "+r"(modulationValue));
    modulationValue <<= 24;
    if ((s32)modulationValue < 0) {
        modulationResult = modulationPhase << 24;
        asm("" : "+r"(modulationResult));
        modulationResult = (s32)modulationResult >> 24;
        asm("" : "+r"(modulationResult));
    } else {
        modulationValue = 128;
        asm("" : "+r"(modulationValue));
        modulationResult = modulationValue - modulationPhase;
        asm("" : "+r"(modulationResult));
    }
    modulationValue = modulationTrack->mod;
    asm("" : "+r"(modulationValue));
    modulationValue *= modulationResult;
    asm("" : "+r"(modulationValue));
    modulationResult = (s32)modulationValue >> 6;
    asm("" : "+r"(modulationResult));
    modulationValue = *(volatile u8 *)&modulationTrack->modM;
    asm("" : "+r"(modulationValue));
    modulationValue ^= modulationResult;
    asm("" : "+r"(modulationValue));
    modulationValue <<= 24;
    if (modulationValue != 0) {
        modulationTrack->modM = modulationResult;
        modulationValue = modulationTrack->flags;
        asm("" : "+r"(modulationValue));
        modulationPhase = modulationTrack->modT;
        asm("" : "+r"(modulationPhase));
        if (modulationPhase == 0) {
            asm("" : "+r"(modulationPhase));
            modulationPhase = 12;
        } else
            modulationPhase = 3;
        asm("" : "+r"(modulationPhase));
        modulationValue |= modulationPhase;
        asm("" : "+r"(modulationValue));
        modulationTrack->flags = modulationValue;
    }
    MPlayMainTrackFinish();
}
