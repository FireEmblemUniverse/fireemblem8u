#include "global.h"
register volatile u32 guardCommand asm("r1");
extern void MPlayMainNonNoteCommand(void);
extern void MPlayMainNoteSetup(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayNoteGuardCandidate(void)
{
    if (guardCommand < 207) {
        MPlayMainNonNoteCommand();
        return;
    }
    MPlayMainNoteSetup();
}
