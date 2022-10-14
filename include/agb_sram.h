#ifndef GUARD_AGB_SRAM_H
#define GUARD_AGB_SRAM_H

void SetSramFastFunc(void);
void WriteSramFast(const void *src, void *dest, u32 size);
extern void (*ReadSramFast)(const void *src, void *dest, u32 size);
extern u32 (*VerifySramFast)(const void *src, void *dest, u32 size);
u32 WriteAndVerifySramFast(const void *src, void *dest, u32 size);

#endif  // GUARD_AGB_SRAM_H
