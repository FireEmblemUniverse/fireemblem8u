#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 frequencyResult asm("r0");
register volatile struct SoundChannel *frequencyChannel asm("r4");
extern void MPlayMainPostChannelNext(void);
__attribute__((matching_tail_transfer))
void MPlayPostPcmStoreCandidate(void)
{
    frequencyChannel->freq = frequencyResult;
    MPlayMainPostChannelNext();
}
