#include "global.h"
#include "gba/m4a_internal.h"

/* Private entry: r0 is the destination; r12 receives the incoming r4. */
register u32 *clearOutput asm("r0");
register u32 clearSavedR4 asm("r12");
register u32 clearR4 asm("r4");
__attribute__((matching_group_stores))
void SoundMainBTM(void)
{
    register u32 zero1 asm("r1");
    register u32 zero2 asm("r2");
    register u32 zero3 asm("r3");
    clearSavedR4 = clearR4;
    zero1 = 0;
    zero2 = 0;
    zero3 = 0;
    clearR4 = 0;
    asm("" : "+r"(zero1), "+r"(zero2), "+r"(zero3), "+r"(clearR4));
#define CLEAR_FOUR() do { \
    clearOutput[0] = zero1; \
    clearOutput[1] = zero2; \
    clearOutput[2] = zero3; \
    clearOutput[3] = clearR4; \
    clearOutput += 4; \
    asm("" : "+r"(clearOutput)); \
} while (0)
    CLEAR_FOUR();
    CLEAR_FOUR();
    CLEAR_FOUR();
    CLEAR_FOUR();
#undef CLEAR_FOUR
    clearR4 = clearSavedR4;
}
