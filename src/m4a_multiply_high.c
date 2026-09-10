#include "global.h"

// ARM half of the interworking helper: r0/r1 operands, r2/r3 full product.
__attribute__((matching_copy_add_zero))
u32 multiply_high_arm(u32 left, u32 right)
{
    register u64 product asm("r2") = (u64)left * right;
    asm("" : "+r"(product));
    return (u32)(product >> 32);
}
