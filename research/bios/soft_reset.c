// Private reset sequence: the stack changes before two terminal BIOS services.
#include "gba/types.h"
struct MultiBootParam;
#include "gba/syscall.h"
register volatile u8 *resetIme asm("r3");
register u32 resetZero asm("r2");
register u32 resetStackValue asm("r1");
register u32 *resetStack asm("sp");

void SoftReset(u32 resetFlags)
{
    register u32 flags asm("r0") = resetFlags;
    resetIme = (volatile u8 *)0x04000208;
    asm volatile("" : "+r"(resetIme));
    resetZero = 0;
    asm volatile("" : "+r"(resetZero));
    *resetIme = resetZero;
    resetStackValue = 0x03007f00;
    asm volatile("" : "+r"(resetStackValue));
    resetStack = (u32 *)resetStackValue;
    asm volatile("" : "+k"(resetStack));
    asm volatile("swi 1" : "+r"(flags) : : "r1", "r2", "r3", "ip", "cc", "memory");
    asm volatile("swi 0\n.balign 4, 0" : : : "cc", "memory");
    __builtin_unreachable();
}
