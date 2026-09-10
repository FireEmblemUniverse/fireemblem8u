#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 frequencyResult asm("r0");
register volatile u32 frequencyBit asm("r1");
register volatile struct CgbChannel *frequencyChannel asm("r4");
extern void MPlayMainPostChannelNext(void);
__attribute__((matching_tail_transfer))
void MPlayMainPostCgbStore(void)
{
    frequencyChannel->fr = frequencyResult;
    frequencyResult = frequencyChannel->mo;
    asm("" : "+r"(frequencyResult));
    frequencyBit = 2;
    asm("" : "+r"(frequencyBit));
    frequencyResult |= frequencyBit;
    asm("" : "+r"(frequencyResult));
    frequencyChannel->mo = frequencyResult;
    MPlayMainPostChannelNext();
}
