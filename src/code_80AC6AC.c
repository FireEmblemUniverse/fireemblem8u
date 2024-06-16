#include "global.h"

/**
 * Unreferenced functions in FE8U. Seem to be used in an effect
 * generating an alpha value related to the Mode Select screen in FE7.
 */

//! FE8U = 0x080AC6AC
int sub_80AC6AC(int a, int b, int c, int d, int e)
{
    u64 accum;

    u64 tmpA = (e - 0x400) * (e - 0x400) * (e * 2 + 0x400);
    u64 tmpB = e * e * (0xc00 - e * 2);
    u64 tmpC = (0x400 - e) * (0x400 - e) * e;
    u64 tmpD = e * (e - 0x400) * e;

    // clang-format off
    accum = (tmpA * b)
        + (tmpB * c)
        + (tmpC * ((c - a) >> 1))
        + (tmpD * ((d - b) >> 1));
    // clang-format on

    return accum >> 30;
}

//! FE8U = 0x080AC784
int sub_80AC784(int a, int b, int c, int d, int e)
{
    u64 accum;

    u64 tmpA = e * 6 * e - e * 0x1800;
    u64 tmpB = e * 0x1800 - e * 6 * e;
    u64 tmpC = e * 3 * e - e * 0x1000 + 0x100000;
    u64 tmpD = e * 3 * e - e * 0x800;

    // clang-format off
    accum = (tmpA * b)
        + (tmpB * c)
        + (tmpC * ((c - a) >> 1))
        + (tmpD * ((d - b) >> 1));
    // clang-format on

    return accum >> 20;
}
