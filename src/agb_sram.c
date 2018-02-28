#include "global.h"
#include "agb_sram.h"

extern u16 gVerifySramFast_IWRAMCodeBuffer[];
extern u16 gReadSramFast_IWRAMCodeBuffer[];

// This function is copied into RAM
void ReadSramFast_Core(u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}

void WriteSramFast(u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}

// Verifies the copied data. Returns non-NULL if there is a mismatch
void *VerifySramFast_Core(u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
    {
        if (*dest++ != *src++)
            return dest - 1;
    }
    return NULL;
}

void SetSramFastFunc(void)
{
    u16 *src;
    u16 *dest;
    u16 size;

    src = (u16 *)ReadSramFast_Core;
    // clear the least significant bit so that we get the actual start address of the function
    src = (u16 *)((uintptr_t)src & ~1);
    dest = gReadSramFast_IWRAMCodeBuffer;
    // Get the size of the function by subtracting the address of the next function
    size = ((uintptr_t)WriteSramFast - (uintptr_t)ReadSramFast_Core) / 2;
    while (size != 0)
    {
        *dest++ = *src++;
        size--;
    }
    // add 1 to the address of the buffer so that we stay in THUMB mode when bx-ing to the address
    gSramTransferFunc = (void (*)(u8 *, u8 *, int))((uintptr_t)gReadSramFast_IWRAMCodeBuffer + 1);

    src = (u16 *)VerifySramFast_Core;
    // clear the least significant bit so that we get the actual start address of the function
    src = (u16 *)((uintptr_t)src & ~1);
    dest = gVerifySramFast_IWRAMCodeBuffer;
    // get the size of the function by subtracting the address of the next function
    size = ((uintptr_t)SetSramFastFunc - (uintptr_t)VerifySramFast_Core) / 2;
    while (size != 0)
    {
        *dest++ = *src++;
        size--;
    }
    // add 1 to the address of the buffer so that we stay in THUMB mode when bx-ing to the address
    gSramVerifyFunc = (void *(*)(u8 *, u8 *, int))((uintptr_t)gVerifySramFast_IWRAMCodeBuffer + 1);

    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
}

void *SRAM_TransferAndVerify(u8 *src, u8 *dest, int size)
{
    u8 i;
    u8 *mismatch;

    // try writing and verifying the data 3 times
    for (i = 0; i < 3; i++)
    {
        WriteSramFast(src, dest, size);
        mismatch = gSramVerifyFunc(src, dest, size);
        if (mismatch == NULL)
            break;
    }

    return mismatch;
}
