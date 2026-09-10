#include "global.h"
register volatile u32 frequencyType asm("r6");
extern void MPlayMainPostPcmSetup(void);
extern void MPlayMainPostCgbSetup(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayPostFrequencySelectCandidate(void)
{
    if (!frequencyType) {
        MPlayMainPostPcmSetup();
        return;
    }
    MPlayMainPostCgbSetup();
}
