#include "global.h"

// Thumb entry for the ARM multiply body. Both return the high product word.
extern u32 multiply_high_arm(u32 left, u32 right) __attribute__((target("arm")));
u32 umul3232H32(u32 left, u32 right)
{
    return multiply_high_arm(left, right);
}
