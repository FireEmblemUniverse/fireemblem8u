#include "global.h"
#include "agb_sram.h"

static u16 verifySramFast_Work[80]; // buffer to hold code of VerifySramFast_Core
static u16 readSramFast_Work[64];  // buffer to hold code of ReadSramFast_Core

u32 (*VerifySramFast)(const u8 *src, u8 *dest, u32 size);  // pointer to verifySramFast_Work
void (*ReadSramFast)(const u8 *src, u8 *dest, u32 size);  // pointer to readSramFast_Work

void ReadSramFast_Core(const u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}

void WriteSramFast(const u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}

u32 VerifySramFast_Core(const u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
    {
        if (*dest++ != *src++)
            return (u32)(dest - 1);
    }
    return 0;
}

void SetSramFastFunc(void)
{
    u16 *src;
    u16 *dest;
    u16 size;

    src = (u16 *)ReadSramFast_Core;
    // clear the least significant bit so that we get the actual start address of the function
    src = (u16 *)((uintptr_t)src & ~1);
    dest = readSramFast_Work;
    // get the size of the function by subtracting the address of the next function
    size = ((uintptr_t)WriteSramFast - (uintptr_t)ReadSramFast_Core) / 2;
    // copy the function into the WRAM buffer
    while (size != 0)
    {
        *dest++ = *src++;
        size--;
    }
    // add 1 to the address of the buffer so that we stay in THUMB mode when bx-ing to the address
    ReadSramFast = (void *)((uintptr_t)readSramFast_Work + 1);

    src = (u16 *)VerifySramFast_Core;
    // clear the least significant bit so that we get the actual start address of the function
    src = (u16 *)((uintptr_t)src & ~1);
    dest = verifySramFast_Work;
    // get the size of the function by subtracting the address of the next function
    size = ((uintptr_t)SetSramFastFunc - (uintptr_t)VerifySramFast_Core) / 2;
    // copy the function into the WRAM buffer
    while (size != 0)
    {
        *dest++ = *src++;
        size--;
    }
    // add 1 to the address of the buffer so that we stay in THUMB mode when bx-ing to the address
    VerifySramFast = (void *)((uintptr_t)verifySramFast_Work + 1);

    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
}

u32 WriteAndVerifySramFast(const u8 *src, u8 *dest, u32 size)
{
    u8 i;
    u32 errorAddr;

    // try writing and verifying the data 3 times
    for (i = 0; i < 3; i++)
    {
        WriteSramFast(src, dest, size);
        errorAddr = VerifySramFast(src, dest, size);
        if (errorAddr == 0)
            break;
    }

    return errorAddr;
}
