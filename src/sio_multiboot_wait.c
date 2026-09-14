#include "global.h"


// Calibrated delay at 0x0804E024. The decrement depends on the memory region
// executing this function: EWRAM uses 12, ROM uses 13, other regions use 4.
void __attribute__((matching_thumb_countdown)) MultiBootWaitCycles(u32 cycles)
{
    register u32 region asm("r2");
    register int step asm("r1");

    // Reading the current execution address requires a hardware operation.
    asm("mov %0, pc" : "=r"(region));
    region >>= 24;
    step = 12;
    asm("" : "+r"(step) : "r"(region));

    if (region != 2)
    {
        step = 13;
        asm("" : "+r"(step));
        if (region != 8)
            step = 4;
    }

    u32 before;

    do {
        before = cycles;
        cycles -= step;
    } while ((int)before > (int)step);
}
