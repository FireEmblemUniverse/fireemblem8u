#include "global.h"
register volatile u32 postInput0 asm("r0");
register volatile u32 postInput1 asm("r1");
register volatile u32 postInput2 asm("r2");
register volatile u32 postInput3 asm("r3");
// Private register arguments are prepared by the preceding matching C fragment.
extern void MidiKeyToFreq(void);
extern void MPlayMainPostPcmStore(void);
__attribute__((matching_thumb_callback_tail))
void MPlayMainPostPcmInvoke(void)
{
    MidiKeyToFreq();
    MPlayMainPostPcmStore();
}
