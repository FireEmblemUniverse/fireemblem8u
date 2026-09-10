#include "global.h"
#include "gba/m4a_internal.h"
register u32 *clearOutput asm("r0");
void SoundMainBTM(void)
{
    register u32 zero1 asm("r1") = 0;
    register u32 zero2 asm("r2") = 0;
    register u32 zero3 asm("r3") = 0;
    register u32 zero4 asm("r4") = 0;
    asm("" : "+r"(zero1), "+r"(zero2), "+r"(zero3), "+r"(zero4));
#define CLEAR_FOUR() do { clearOutput[0]=zero1; clearOutput[1]=zero2; clearOutput[2]=zero3; clearOutput[3]=zero4; clearOutput+=4; asm("" : "+r"(clearOutput)); } while (0)
    CLEAR_FOUR();
    CLEAR_FOUR();
    CLEAR_FOUR();
    CLEAR_FOUR();
#undef CLEAR_FOUR
}
