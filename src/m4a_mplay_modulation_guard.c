#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 modulationValue asm("r0");
register volatile u32 modulationSpeed asm("r1");
register volatile struct MusicPlayerTrack *modulationTrack asm("r5");
extern void MPlayMainTrackFinish(void);
extern void MPlayMainModulationUpdate(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayMainModulationStart(void)
{
    modulationSpeed = modulationTrack->lfoSpeed;
    asm("" : "+r"(modulationSpeed));
    if (modulationSpeed == 0) {
        MPlayMainTrackFinish();
        return;
    }
    modulationValue = modulationTrack->mod;
    asm("" : "+r"(modulationValue));
    if (modulationValue == 0) {
        MPlayMainTrackFinish();
        return;
    }
    modulationValue = modulationTrack->lfoDelayC;
    asm("" : "+r"(modulationValue));
    if (modulationValue == 0) {
        MPlayMainModulationUpdate();
        return;
    }
    modulationValue -= 1;
    asm("" : "+r"(modulationValue));
    modulationTrack->lfoDelayC = modulationValue;
    MPlayMainTrackFinish();
}
