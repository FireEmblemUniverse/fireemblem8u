#include "global.h"
#include "variables.h"
#include "functions.h"

#include "hardware.h"
#include "proc.h"

typedef void (*cpy_func_t)(const void* src, void* dst);
extern cpy_func_t gUnknown_08599FB4[];

struct Struct8012F98 {
    u8* unk0;
    int unk4;
};

int Interpolate(int method, int lo, int hi, int x, int end)
{
    int deno, _x, base, ret;
    register int _deno asm("r0");

    if (0 == end)
        return hi;

    switch (method) {
    case 0:
        deno =(hi - lo) * x;
        ret = lo + Div(deno, end);
        break;

    case 1:
        _deno = x * x;
        deno = _deno * (hi - lo);
        ret = lo + Div(deno, end * end);
        break;

    case 2:
        deno = x * x * x * (hi - lo);
        ret = lo + Div(deno,  end * end * end);
        break;

    case 3:
        deno = x * x * x * x * (hi - lo);
        ret = lo + Div(deno, end * end * end * end);
        break;

    case 4:
        _x = end - x;
        deno = _x * _x * (hi - lo);
        ret = lo + (hi - lo) - Div(deno, end * end);
        break;
    case 5:
        _x = end - x;
        deno = _x * _x * _x * (hi - lo);
        ret = lo + (hi - lo) - Div(deno, end * end * end);
        break;

    default:
        ret = 0;
    }

    return ret;
}

void sub_8012E94() {}

u8 CheckSaveHeaderMagic(u8 *magic, u8 *keygen) {
    int val1, val2;

    while (1) {
        val1 = *magic;
        val2 = *keygen;
        if ( !(val2 | val1) )
            break;

        ++keygen;
        ++magic;
        if ( val1 != val2 )
            return 0;
    }

    return 1;
}

void CopyString(char *dst, char *src)
{
    while ('\0' != *src)
        *dst++ = *src++;

    *dst = *src;
}

void CopyDirect(u8 *src, u8 *dst)
{
    int size = FilterR0ForRawCopy(src) - 4;

    if (0 != size % 32)
        CpuCopy16(src + 4, dst, size);
    else
        CpuFastCopy(src + 4, dst, size);

}

void sub_8012F20(u8 *src, u8 *dst)
{
    LZ77UnCompWram(src, gGenericBuffer);
    CpuFastCopy(gGenericBuffer, dst, FilterR0ForRawCopy(src));
}

void CopyDataWithPossibleUncomp(const void* src, void* dst)
{
    const u8 *_src;
    u8 *_dst;
    int index ;

    _src = src;
    _dst = dst;

    if ((_dst - 0x06000000) < (u8*)0x18000)
        index = 0;
    else
        index = 1;

    gUnknown_08599FB4[index + (_src[0] & 0xF0) / 8](_src, _dst);
}

int FilterR0ForRawCopy(const void* data)
{
    const u32 *_data = data;
    return _data[0] >> 8;
}

void sub_8012F98(struct Struct8012F98 *buf, int a2, int a3)
{
    int a, b = a3;
    buf->unk0 = (u8*)b;
    a3 = 0xFFE0;
    a = (a2 & a3) >> 5;
    b = (b & a3) >> 5;
    buf->unk4 = a = b - a;
}

int sub_8012FB0(struct Struct8012F98 *buf, u8 *src)
{
    int val, size;
    CopyDataWithPossibleUncomp(src, buf->unk0);
    val = FilterR0ForRawCopy(src);
    buf->unk0 += val;
    size = buf->unk4;
    buf->unk4 = size + (val / 32);
    return size;
}

int sub_8012FE0(struct Struct8012F98 *buf, int a2)
{
    int size;
    buf->unk0 += a2 << 5;
    size = buf->unk4;
    buf->unk4 += a2;
    return  size;
}

void RegisterObjectTileGraphics(const void* source, void* target, int width, int height)
{
    int t_width = 32 * width;

    if (height > 0) {
        int tile = height;
        do {
            RegisterTileGraphics(source, target, t_width);
            source += t_width;
            target += 1024;
        } while(--tile != 0);
    }
}

void CopyTileGfxForObj(const void* src, void* dst, int width, int height)
{
    int t_width = 32 * width;

    if (height > 0) {
        int tile = height;
        do {
            CpuFastCopy(src, dst, t_width);
            src += t_width;
            dst += 1024;
        } while(--tile != 0);
    }
}

void sub_8013058(const void* src, void* dst, int width, int height)
{
    int tile;
    if (height > 0) {
        int _width = width * 64;
        for (tile = height; tile != 0; tile--) {
            sub_8013094(src, dst, width);
            src += _width;
            dst += 32 * width;
        }
    }
}

void sub_8013094(const void *src, void *dst, int width)
{
    if (width > 0) {
        int tile;
        for (tile = width; tile != 0; tile--) {
            sub_80130BC(src, dst, width);
            src += 8;
            dst += 32;
        }
    }
}

void sub_80130BC(const void *src, void *dst, int width)
{
    const u8 *_src;
    u32 *_dst;
    int _width;
    int i;

    _src = src;
    _dst = dst;
    _width = width;

    for (i = 0; i < 8; i++) {
        *_dst = 16 * (16 * (16 * (16 * (16 * (16 * (16 * _src[7] | _src[6]) | _src[5]) | _src[4]) | _src[3]) | _src[2]) | _src[1]) | _src[0];
        _dst += 1;
        _src += 8 * _width;
    }
}

void sub_8013104(u16 *tm, int pal, int a3, int a4)
{
    int i, j;
    register u16 *_tm asm("r0");

    for (i = 0; i < a4; i++) {
        if (a3 > 0) {
            _tm = (u16 *)(i * 64 + (uintptr_t)tm);

            for (j = a3; j != 0; j--) {
                *_tm++ = pal++;
            }
        }
    }
}

void sub_8013138(u16 *dst, u8* src, int a3, int a4)
{
    u16 *_dst = dst;
    int _a3 = a3;

    if (a4 > 0) {
        do {
            *dst-- = 0;
        } while (--a4);
    }

    while (*src != 32) {
        *_dst = *src + _a3 - 48;
        --_dst;
        --src;
    }
}

void sub_8013168(u16 *dst, u8* src, int a3, int a4, int a5)
{
    register u16 *_dst asm("r4") = dst;

    if (a4 > 0) {
        do {
            *dst-- = 0;
        } while (--a4);
    }

    if (a5) {
        *_dst-- = a3 + 10;
        *_dst = a3 + 10;
    } else {
        while (*src != 32) {
            *_dst = *src + a3 - 48;
            --_dst;
            --src;
        }
    }
}

/***
 * I think this maybe a counter.
 */

void sub_80131A8(struct Proc *proc, int val)
{
    proc->unk4C = val;
}

void sub_80131B0(struct Proc *proc)
{
    int val1 = (u16)proc->unk4C + 1;
    int val2 = 0x7FFF;
    proc->unk4C = val1 & val2;
}

void sub_80131C4(struct Proc *proc)
{
    (u16)proc->unk4C--;
}

void sub_80131D0(s16 *buf)
{
    int i = 159;
    while (i >= 0) {
        *buf++ = 240;
        *buf++ = -1;
        i--;
    }
}

#define _SWAP(a, b) \
do {                \
    tmp = a;        \
    a = b;          \
    b = tmp;        \
} while (0)

void sub_80131F0(s16 *buf, int x1, int y1, int x2, int y2)
{
    int val1, val2;
    int tmp;

    if (y1 > y2) {
        _SWAP(x2, x1);
        _SWAP(y2, y1);
    }

    val1 = ((x2 - x1) << 0x10) / (y2 - y1);
    val2 = x1 << 0x10;

    if (y2 > 160)
        y2 = 160;

    if (y1 < 0) {
        val2 += val1 * -y1;
        y1 = 0;
    }

    for (; y1 < y2; y1++) {
        register int val asm("r3") = val2 >> 0x10;
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
        asm(""::"r"(buf + 2*y1));
        val2 += val1;
    }
}

#undef _SWAP

/* https://decomp.me/scratch/1FKcf */
#if NONMATCHING
void sub_8013278(int a1)
{
    int i;
    int _a1 = a1;
    u16 val1, val2, val3, val4;
    u16 *bufp, *bufm, *buff, *bufr;
    int val5, val6;

    val5 = a1;
    if (a1 > 0x80)
        a1 = 0x80;

    if (a1 < 0)
        return;

    bufp = &gGenericBuffer[2 * a1];
    bufm = &gGenericBuffer[2 * a1];
    val6 = -a1;
    buff = &gGenericBuffer[0];
    bufr = &gGenericBuffer[4 * a1];

    for (i = 0; i <= _a1; i++) {
        val1 = a1 + i;
        if (val1 <= 0x9F)
            bufp[1] = _a1;

        val2 = a1 - i;
        if (val2 <= 0x9F)
            bufm[1] = _a1;

        val3 = a1 + _a1;
        if (val3 <= 0x9F)
            bufr[1] = i;

        val4 = a1 - _a1;
        if (val4 <= 0x9F)
           buff[1] = i;

        if (val1 <= 0x9F)
            bufp[0] = -_a1;

        if (val2 <= 0x9F)
            gGenericBuffer16[a1 - i] = _a1;

        if (val3 <= 0x9F)
            gGenericBuffer16[a1 + _a1] = -i;

        if (val4 <= 0x9F)
            gGenericBuffer16[a1 - _a1] = -i;

        val5 = val5 + 1 - 2 * i;
        if (val5 < 0) {
            val5 += 2 * (_a1 - 1);
            val6++;
            buff += 2;
            bufr += 2;
            _a1--;
        }
        bufp += 2;
        bufm -= 2;
    }
}
#else
__attribute__((naked))
void sub_8013278(int a1)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x1c\n\
        adds r6, r0, #0\n\
        str r6, [sp]\n\
        cmp r6, #0x50\n\
        ble _08013290\n\
        movs r0, #0x50\n\
        str r0, [sp]\n\
    _08013290:\n\
        adds r2, r6, #0\n\
        movs r1, #0\n\
        mov r9, r1\n\
        cmp r2, #0\n\
        blt _08013388\n\
        movs r3, #0\n\
        str r3, [sp, #4]\n\
        ldr r4, [sp]\n\
        lsls r0, r4, #2\n\
        ldr r7, _0801339C\n\
        adds r0, r0, r7\n\
        mov sl, r0\n\
        str r0, [sp, #8]\n\
        negs r1, r2\n\
        str r1, [sp, #0xc]\n\
        lsls r0, r2, #2\n\
        ldr r3, [sp, #8]\n\
        subs r3, r3, r0\n\
        str r3, [sp, #0x10]\n\
        ldr r4, [sp, #8]\n\
        adds r0, r0, r4\n\
        str r0, [sp, #0x14]\n\
    _080132BC:\n\
        ldr r0, [sp]\n\
        add r0, r9\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        str r0, [sp, #0x18]\n\
        cmp r0, #0x9f\n\
        bhi _080132CE\n\
        mov r7, sl\n\
        strh r2, [r7, #2]\n\
    _080132CE:\n\
        ldr r0, [sp]\n\
        mov r1, r9\n\
        subs r0, r0, r1\n\
        mov r8, r0\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        cmp r4, #0x9f\n\
        bhi _080132E2\n\
        ldr r3, [sp, #8]\n\
        strh r2, [r3, #2]\n\
    _080132E2:\n\
        ldr r7, [sp]\n\
        adds r7, r7, r2\n\
        mov ip, r7\n\
        lsls r0, r7, #0x10\n\
        lsrs r3, r0, #0x10\n\
        cmp r3, #0x9f\n\
        bhi _080132F6\n\
        mov r1, r9\n\
        ldr r0, [sp, #0x14]\n\
        strh r1, [r0, #2]\n\
    _080132F6:\n\
        ldr r7, [sp]\n\
        subs r5, r7, r2\n\
        lsls r0, r5, #0x10\n\
        lsrs r1, r0, #0x10\n\
        cmp r1, #0x9f\n\
        bhi _08013308\n\
        mov r7, r9\n\
        ldr r0, [sp, #0x10]\n\
        strh r7, [r0, #2]\n\
    _08013308:\n\
        ldr r0, [sp, #0x18]\n\
        cmp r0, #0x9f\n\
        bhi _08013316\n\
        mov r7, sp\n\
        ldrh r0, [r7, #0xc]\n\
        mov r7, sl\n\
        strh r0, [r7]\n\
    _08013316:\n\
        cmp r4, #0x9f\n\
        bhi _08013328\n\
        mov r4, r8\n\
        lsls r0, r4, #2\n\
        ldr r7, _0801339C\n\
        adds r0, r0, r7\n\
        mov r4, sp\n\
        ldrh r4, [r4, #0xc]\n\
        strh r4, [r0]\n\
    _08013328:\n\
        cmp r3, #0x9f\n\
        bhi _0801333A\n\
        mov r7, ip\n\
        lsls r0, r7, #2\n\
        ldr r3, _0801339C\n\
        adds r0, r0, r3\n\
        mov r4, sp\n\
        ldrh r4, [r4, #4]\n\
        strh r4, [r0]\n\
    _0801333A:\n\
        cmp r1, #0x9f\n\
        bhi _0801334A\n\
        lsls r0, r5, #2\n\
        ldr r7, _0801339C\n\
        adds r0, r0, r7\n\
        mov r1, sp\n\
        ldrh r1, [r1, #4]\n\
        strh r1, [r0]\n\
    _0801334A:\n\
        adds r1, r6, #1\n\
        mov r3, r9\n\
        lsls r0, r3, #1\n\
        subs r6, r1, r0\n\
        cmp r6, #0\n\
        bge _08013370\n\
        subs r1, r2, #1\n\
        lsls r0, r1, #1\n\
        adds r6, r6, r0\n\
        ldr r4, [sp, #0xc]\n\
        adds r4, #1\n\
        str r4, [sp, #0xc]\n\
        ldr r7, [sp, #0x10]\n\
        adds r7, #4\n\
        str r7, [sp, #0x10]\n\
        ldr r0, [sp, #0x14]\n\
        subs r0, #4\n\
        str r0, [sp, #0x14]\n\
        adds r2, r1, #0\n\
    _08013370:\n\
        ldr r1, [sp, #4]\n\
        subs r1, #1\n\
        str r1, [sp, #4]\n\
        movs r3, #4\n\
        add sl, r3\n\
        ldr r4, [sp, #8]\n\
        subs r4, #4\n\
        str r4, [sp, #8]\n\
        movs r7, #1\n\
        add r9, r7\n\
        cmp r2, r9\n\
        bge _080132BC\n\
    _08013388:\n\
        ldr r0, _0801339C\n\
        add sp, #0x1c\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _0801339C: .4byte gGenericBuffer\n\
        .syntax divided\n\
    ");
}
#endif

void sub_80133A0(int a1)
{
    int color;
    u16 *tmp_buf = (void*)gGenericBuffer;
    int i;
    u16 *pal_buf = (void*)gPaletteBuffer;

    for (i = 0; i < 0x200; i++) {
        color = pal_buf[i];

        if ((color & 0x1F) >= RGB(a1, 0, 0))
            color = color - RGB(a1, 0, 0);
        else
            color = color & 0xFFE0;

        if ((color & 0x3E0) >= RGB(0, a1, 0))
            color -= RGB(0, a1, 0);
        else
            color = color & 0xFC1F;

        if ((color & 0x7C00) >= RGB(0, 0, a1))
            color = color - RGB(0, 0, a1);
        else
            color = color & 0x3FF;

        tmp_buf[i] = color;
    }

    DisablePaletteSync();
    RegisterTileGraphics(tmp_buf, (void*)0x5000000, 0x400);
}

void sub_8013428()
{
    return;
}

void sub_801342C(void *buf)
{
    u8 _buf[0x10];
    memcpy(_buf, gUnknown_080D7954, 0x0D);
    sub_801342C(_buf);
}

struct Struct202B6B0 *GetPaletteBufferBuffer()
{
    return &gUnknown_0202B6B0;
}

void sub_8013454(int _2a, int _5a, int _8a)
{
    SetSomethingInPaletteBB_2A(_2a);
    SetSomethingInPaletteBB_5A(_5a);
    SetSomethingInPaletteBB_8A(_8a);
}

void SetSomethingInPaletteBB_2A(int a1)
{
    GetPaletteBufferBuffer()->unk2A = a1;
}

void SetSomethingInPaletteBB_5A(int a1)
{
    GetPaletteBufferBuffer()->unk5A = a1;
}

void SetSomethingInPaletteBB_8A(int a1)
{
    GetPaletteBufferBuffer()->unk8A = a1;
}

int GetSomethingInPaletteBB_2A()
{
    return GetPaletteBufferBuffer()->unk2A;
}

int GetSomethingInPaletteBB_5A()
{
    return GetPaletteBufferBuffer()->unk5A;
}

int GetSomethingInPaletteBB_8A()
{
    return GetPaletteBufferBuffer()->unk8A;
}

void ArchiveCurrentPalettes()
{
    int i, j;
    u16 *dst = (void*)GetPaletteBufferBuffer();
    u16 *src = (void*)&gPaletteBuffer;

    for (i = 0; i < 32; i++) {
        for (j = 0; j < 16; j++)
            dst[j] = *src++;

        dst += 24;
    }

    SetSomethingInPaletteBB_2A(0x100);
    SetSomethingInPaletteBB_5A(0x100);
    SetSomethingInPaletteBB_8A(0x100);
}

void ArchivePalette(int index)
{
    int i;
    u16 *dst = (void*)GetPaletteBufferBuffer();
    u16 *src = (void*)&gPaletteBuffer[16 * index];

    for (i = 0; i < 16; i++)
        dst[24 * index + i] = *src++;
}
