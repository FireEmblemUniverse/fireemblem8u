#include "global.h"
#include "gba/m4a_internal.h"

// Private ABI: inspect r2 and conditionally clear r3; preserve incoming r0.
register volatile u32 filterScratch asm("r0");
register u32 filterAddress asm("r2");
register volatile u32 filterValue asm("r3");
extern const u32 gMPlayJumpTableTemplate[];
__attribute__((matching_compare_order, matching_stack_word))
void chk_adr_r2(void)
{
    volatile u32 saved = filterScratch;
    filterScratch = filterAddress >> 25;
    if (filterScratch != 0)
        goto done;
    filterScratch = (u32)gMPlayJumpTableTemplate;
    if (filterAddress < filterScratch)
        goto reject;
    filterScratch = filterAddress >> 14;
    if (filterScratch == 0)
        goto done;
reject:
    filterValue = 0;
done:
    filterScratch = saved;
}
