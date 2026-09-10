#include "global.h"
#include "gba/m4a_internal.h"

// Private ABI: the checked load consumes r2, returns r3 and preserves r0/r1/r12.
register struct MusicPlayerTrack *checkedTrack asm("r1");
register u8 * volatile checkedPointer asm("r2");
register volatile u32 checkedValue asm("r3");
extern void chk_adr_r2(void);

__attribute__((matching_tail_transfer))
void ld_r3_tp_adr_i(void)
{
    checkedPointer = checkedTrack->cmdPtr;
    checkedValue = (u32)(checkedPointer + 1);
    checkedTrack->cmdPtr = (u8 *)checkedValue;
    checkedValue = *checkedPointer;
    chk_adr_r2();
}
