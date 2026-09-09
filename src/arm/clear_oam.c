#include "global.h"

// Each block contains 16 eight-byte OAM entries. Clear only attributes 0 and 1;
// attribute 2 and the affine-parameter halfword retain their previous contents.
// The original loop always processes one block, even when count is below 16.
void ClearOam(u32 * dst, u32 count)
{
    register u32 hidden asm("r2");

    count = (count >> 4) - 1;
    hidden = 160;

    do
    {
        dst[0] = hidden;
        dst[2] = hidden;
        dst[4] = hidden;
        dst[6] = hidden;
        dst[8] = hidden;
        dst[10] = hidden;
        dst[12] = hidden;
        dst[14] = hidden;
        dst[16] = hidden;
        dst[18] = hidden;
        dst[20] = hidden;
        dst[22] = hidden;
        dst[24] = hidden;
        dst[26] = hidden;
        dst[28] = hidden;
        dst[30] = hidden;
        dst += 32;
    } while ((int) --count >= 0);
}
