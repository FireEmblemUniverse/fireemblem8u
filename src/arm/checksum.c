#include "global.h"

// Sum and XOR the input halfwords into the low and high halves of the result.
// As in the original, the loop reads at least one halfword even for size < 2.
u32 Checksum32(const u16 * src, u32 size)
{
    register u32 sum asm("r2");
    register u32 parity asm("r3");
    register u32 value asm("r4");
    register u32 result asm("r0");

    // Preserve the original save set. All asm statements here are empty
    // register constraints; the compiler generates every machine instruction.
    asm("" ::: "r5", "r6", "r7");

    size -= 2;
    sum = 0;
    asm("" : "+r"(sum));
    parity = 0;

    do
    {
        value = *src;
        asm("" : : "r"(value));
        asm("" : "+r"(sum));
        sum += value;
        parity ^= value;
        src++;
        size -= 2;
    } while ((int) size >= 0);

    // Materialize the original 0x10000 - 1 mask and register transfer sequence.
    result = 0x10000;
    asm("" : "+r"(result));
    result -= 1;
    sum &= result;
    parity <<= 16;
    asm("" : : "r"(parity));
    result = sum;
    asm("" : "+r"(result));
    result += parity;

    return result;
}
