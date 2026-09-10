#include "global.h"

// Private ABI: fetch through r2 into r3, then enter the adjacent address filter.
register const u8 *byteAddress asm("r2");
register volatile u32 byteValue asm("r3");
extern void chk_adr_r2(void);
__attribute__((matching_tail_transfer))
void ldrb_r3_r2(void)
{
    byteValue = *byteAddress;
    chk_adr_r2();
}
