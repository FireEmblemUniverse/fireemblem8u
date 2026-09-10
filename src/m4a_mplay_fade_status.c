#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 statusWord asm("r0");
register volatile struct MusicPlayerInfo *statusPlayer asm("r7");
extern void MPlayMainExit(void);
extern void MPlayMainTempoAccumulate(void);
__attribute__((matching_tail_transfer))
void MPlayMainFadeStatus(void)
{
    statusWord = statusPlayer->status;
    if ((s32)statusWord < 0) {
        MPlayMainExit();
        return;
    }
    MPlayMainTempoAccumulate();
}
