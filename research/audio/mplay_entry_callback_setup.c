#include "global.h"
#include "gba/m4a_internal.h"
register volatile u32 entryCallbackArgument asm("r0");
register volatile u32 entryCallbackTarget asm("r3");
extern void MPlayMainEntryFrame(void);
extern void MPlayMainEntryCallbackInvoke(void);
__attribute__((matching_tail_transfer, matching_thumb_direct_tails))
void MPlayEntryCallbackSetupCandidate(void)
{
    entryCallbackTarget = ((volatile struct MusicPlayerInfo *)entryCallbackArgument)->func;
    if (!entryCallbackTarget) {
        MPlayMainEntryFrame();
        return;
    }
    entryCallbackArgument = ((volatile struct MusicPlayerInfo *)entryCallbackArgument)->intp;
    MPlayMainEntryCallbackInvoke();
}
