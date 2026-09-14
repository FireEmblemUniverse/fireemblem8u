#include "global.h"

extern void TmFillRect(u16 *, u32, u32, u32);
extern void TmCopyRect(const u16 *, u16 *, int, int);
extern void ColorFadeTick(void);

// ARM halves of the public Thumb interworking entries. Tail calls preserve
// the caller's LR and arguments; the linker places each after its mode switch.
__attribute__((section(".text.arm_call_clear")))
void ArmCall_Clear(void * dst, int count)
{
    ClearOam(dst, count);
}

__attribute__((section(".text.arm_call_tsa")))
void ArmCall_Tsa(u16 * dst, const void * tsa, int tileref)
{
    TmApplyTsa(dst, tsa, tileref);
}

__attribute__((section(".text.arm_call_fill")))
void ArmCall_Fill(u16 * dst, int width, int height, int value)
{
    TmFillRect(dst, width, height, value);
}

__attribute__((section(".text.arm_call_fade")))
void ArmCall_Fade(void)
{
    ColorFadeTick();
}

__attribute__((section(".text.arm_call_copy")))
void ArmCall_Copy(u16 * src, u16 * dst, int width, int height)
{
    TmCopyRect(src, dst, width, height);
}

__attribute__((section(".text.arm_call_checksum")))
u32 ArmCall_Checksum(const u32 * src, int size)
{
    return Checksum32((const u16 *) src, size);
}
