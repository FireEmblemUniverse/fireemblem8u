#include "global.h"
register u32 multiplyTarget asm("r2");
register u32 multiplyStack asm("sp");
extern void multiply_high_arm(void) __attribute__((target("arm")));
__attribute__((matching_thumb_pc_handoff))
void MultiplyEntryBody(void)
{
    multiplyTarget = (u32)multiply_high_arm;
}
