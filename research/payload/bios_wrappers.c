// BIOS boundary instructions remain inline; C supplies argument setup and return.
typedef unsigned u32;

void SwiCpuFastSet(const void *src, void *dst, u32 control)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    register u32 r2 asm("r2") = control;
    asm volatile("swi 0xc" : "+r"(r0), "+r"(r1), "+r"(r2) : : "r3", "cc", "memory");
}

void SwiCpuSet(const void *src, void *dst, u32 control)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    register u32 r2 asm("r2") = control;
    asm volatile("swi 0xb" : "+r"(r0), "+r"(r1), "+r"(r2) : : "r3", "cc", "memory");
}

void SwiHuffUnCompReadNormal(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x13" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void SwiLZ77UnCompReadNormalWrite16bit(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x12" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void SwiLZ77UnCompReadNormalWrite8bit(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x11" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void SwiRLUnCompReadNormalWrite16bit(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x15" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void SwiRLUnCompReadNormalWrite8bit(const void *src, void *dst)
{
    register const void *r0 asm("r0") = src;
    register void *r1 asm("r1") = dst;
    asm volatile("swi 0x14" : "+r"(r0), "+r"(r1) : : "r2", "r3", "cc", "memory");
}

void SwiSoundBiasReset(void)
{
    register u32 r0 asm("r0") = 0;
    asm volatile("swi 0x19" : "+r"(r0) : : "r1", "r2", "r3", "cc", "memory");
}

void SwiSoundBiasSet(void)
{
    register u32 r0 asm("r0") = 1;
    asm volatile("swi 0x19" : "+r"(r0) : : "r1", "r2", "r3", "cc", "memory");
}

void SwiVBlankIntrWait(void)
{
    register u32 r2 asm("r2") = 0;
    asm volatile("swi 5" : "+r"(r2) : : "r0", "r1", "r3", "cc", "memory");
}
