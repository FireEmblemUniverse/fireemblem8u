#ifndef GUARD_AGB_SRAM_H
#define GUARD_AGB_SRAM_H

#include "global.h"

void SetSramFastFunc(void);
void WriteSramFast(const u8 *src, u8 *dest, u32 size);
extern void (*ReadSramFast)(void const * src, void * dest, u32 size);
extern u32 (*VerifySramFast)(void const * src, void * dest, u32 size);
u32 WriteAndVerifySramFast(void const * src, void * dest, u32 size);

#define CART_SRAM_ADDR 0x0E000000
#define CART_SRAM_SIZE 0x00008000
#define CART_SRAM ((void *) CART_SRAM_ADDR)

#endif  // GUARD_AGB_SRAM_H
