#include "global.h"
register volatile u32 guardCommand asm("r1");
extern void MPlayMainWaitCommand(void);
extern void MPlayMainCommandSetup(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayWaitGuardCandidate(void)
{
    if (guardCommand <= 176) {
        MPlayMainWaitCommand();
        return;
    }
    MPlayMainCommandSetup();
}
