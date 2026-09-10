#include "global.h"
register volatile u32 postInput0 asm("r0");
register volatile u32 postInput1 asm("r1");
register volatile u32 postInput2 asm("r2");
register volatile u32 postInput3 asm("r3");
// Private register arguments are prepared by the preceding matching C fragment.
extern void ChnVolSetAsm(void);
extern void MPlayMainPostVolumeFinish(void);
__attribute__((matching_thumb_callback_tail))
void MPlayPostVolumeInvokeCandidate(void)
{
    ChnVolSetAsm();
    MPlayMainPostVolumeFinish();
}
