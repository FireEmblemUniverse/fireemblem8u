// BIOS services return an already zero-extended u16 in r0.
#include "gba/types.h"
struct MultiBootParam;
#include "gba/syscall.h"

__attribute__((matching_bios_u16_return))
u16 ArcTan2(s16 x, s16 y)
{
    register u32 r0 asm("r0") = x;
    register s32 r1 asm("r1") = y;
    asm volatile("swi 0xa" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc");
    return r0;
}
__attribute__((matching_bios_u16_return))
u16 Sqrt(u32 num)
{
    register u32 r0 asm("r0") = num;
    asm volatile("swi 8" : "+r"(r0) : : "r1", "r2", "r3", "cc");
    return r0;
}
