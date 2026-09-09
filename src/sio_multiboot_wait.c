#include "global.h"

// Calibrated delay at 0x0804E024. The decrement depends on the memory region
// executing this function: EWRAM uses 12, ROM uses 13, other regions use 4.
void MultiBootWaitCycles(u32 cycles)
{
    register u32 region asm("r2");
    register u32 step asm("r1");

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

    // Keep the original two-instruction loop and its exact condition flags.
    // A C countdown currently introduces an extra CMP, changing the delay.
    // These two instructions and the PC read remain assembly in the audit.
    asm volatile(
        ".syntax unified\n"
        "1: subs %0, %0, %1\n"
        "bgt 1b\n"
        ".syntax divided"
        : "+l"(cycles)
        : "l"(step)
        : "cc");
}
