// Explicit BIOS boundaries; argument setup and returns are generated from C.
#include "gba/types.h"
struct MultiBootParam;
#include "gba/syscall.h"

void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dst, s32 count)
{
    register void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    register s32 r2 asm("r2") = count;
    asm volatile("swi 0xe" : "+r"(r0), "+r"(r1), "+r"(r2) : : "r3", "cc", "memory");
}

void CpuFastSet(const void *src, void *dst, u32 control)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    register u32 r2 asm("r2") = control;
    asm volatile("swi 0xc" : "+r"(r0), "+r"(r1), "+r"(r2) : : "r3", "cc", "memory");
}

void CpuSet(const void *src, void *dst, u32 control)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    register u32 r2 asm("r2") = control;
    asm volatile("swi 0xb" : "+r"(r0), "+r"(r1), "+r"(r2) : : "r3", "cc", "memory");
}

int Div(int numerator, int denominator)
{
    register int r0 asm("r0") = numerator;
    register int r1 asm("r1") = denominator;
    asm volatile("swi 6" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc");
    return r0;
}

int DivArm(int denominator, int numerator)
{
    register int r0 asm("r0") = denominator;
    register int r1 asm("r1") = numerator;
    asm volatile("swi 7" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc");
    return r0;
}

void HuffUnComp(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x13" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void LZ77UnCompVram(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x12" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void LZ77UnCompWram(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x11" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

int MultiBoot(struct MultiBootParam *param)
{
    register u32 r0 asm("r0") = (u32)param;
    register u32 r1 asm("r1") = 1;
    asm volatile("swi 0x25" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
    return r0;
}

void ObjAffineSet(struct ObjAffineSrcData *src, void *dst, s32 count, s32 offset)
{
    register void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    register s32 r2 asm("r2") = count;
    register s32 r3 asm("r3") = offset;
    asm volatile("swi 0xf" : "+r"(r0), "+r"(r1), "+r"(r2), "+r"(r3) : : "cc", "memory");
}

void RLUnCompVram(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x15" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void RLUnCompWram(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x14" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void RegisterRamReset(u32 flags)
{
    register u32 r0 asm("r0") = flags;
    asm volatile("swi 1" : "+r"(r0) : : "r1", "r2", "r3", "cc", "memory");
}

void SoundBiasReset(void)
{
    register u32 r0 asm("r0") = 0;
    asm volatile("swi 0x19" : "+r"(r0) : : "r1", "r2", "r3", "cc", "memory");
}

void SoundBiasSet(void)
{
    register u32 r0 asm("r0") = 1;
    asm volatile("swi 0x19" : "+r"(r0) : : "r1", "r2", "r3", "cc", "memory");
}

void VBlankIntrWait(void)
{
    register u32 r2 asm("r2") = 0;
    asm volatile("swi 5" : "+r"(r2) : : "r0", "r1", "r3", "cc", "memory");
}
