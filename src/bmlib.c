#include "global.h"
#include "variables.h"
#include "functions.h"

#include "hardware.h"

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

#if NONMATCHING
void sub_8012F98(struct Struct8012F98 *buf, int a2, int a3)
{
    buf->unk0 = (u8*)a3;
    buf->unk4 = ((a2 & 0xFFE0) / 32) - ((a3 & 0xFFE0) / 32);
}

#else
__attribute__((naked))
void sub_8012F98(struct Struct8012F98 *buf, int a2, int a3)
{
    asm("\n\
        .syntax unified\n\
        adds r3, r2, #0\n\
        str r3, [r0]\n\
        ldr r2, _08012FAC\n\
        ands r1, r2\n\
        asrs r1, r1, #5\n\
        ands r2, r3\n\
        asrs r3, r2, #5\n\
        subs r1, r3, r1\n\
        str r1, [r0, #4]\n\
        bx lr\n\
        .align 2, 0\n\
    _08012FAC: .4byte 0x0000FFE0\n\
        .syntax divided\n\
    ");
}
#endif

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
