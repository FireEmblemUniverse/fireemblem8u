// Preserve the original ADD-zero return flags after the explicit BIOS boundary.
#include "gba/types.h"
struct MultiBootParam;
#include "gba/syscall.h"

__attribute__((matching_thumb_copy_add_zero))
int DivRem(int numerator, int denominator)
{
    register int r0 asm("r0") = numerator;
    register int r1 asm("r1") = denominator;
    asm volatile("swi 6" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc");
    return r1;
}
