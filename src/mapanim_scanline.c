#include "global.h"

#include "hardware.h"
#include "mapanim.h"

extern u16 gUnknown_0203E254[DISPLAY_HEIGHT * 2]; // gManimScanlineBufA

extern u16 * gUnknown_0203E754[]; // gManimScanlineBufs

extern u16 * gUnknown_0203E75C; // gManimActiveScanlineBuf

//! FE8U = 0x08081E78
void sub_8081E78(void)
{
    sub_80823A0(gUnknown_0203E254);
    sub_80823A0(gUnknown_0203E254 + 0x140);

    gUnknown_0203E754[0] = gUnknown_0203E254;
    gUnknown_0203E754[1] = gUnknown_0203E254 + 0x140;

    gUnknown_0203E75C = gUnknown_0203E254;

    return;
}

//! FE8U = 0x08081EAC
void sub_8081EAC(void)
{
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    SetWin0Layers(0, 0, 0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);

    SetPrimaryHBlankHandler(sub_8081F64);

    return;
}

//! FE8U = 0x08081F24
void sub_8081F24(int x, int y, int arg3)
{
    sub_80823A0(gUnknown_0203E754[1]);
    sub_80823FC(gUnknown_0203E754[1], x, y, arg3);
    sub_8082390();
    return;
}

//! FE8U = 0x08081F58
void sub_8081F58(void)
{
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x08081F64
void sub_8081F64(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gUnknown_0203E75C = gUnknown_0203E754[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_WIN0H = gUnknown_0203E75C[vcount];

    return;
}

//! FE8U = 0x08081FA8
void sub_8081FA8(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gUnknown_0203E75C = gUnknown_0203E754[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_WIN0H = gUnknown_0203E75C[vcount];
    REG_BG2HOFS = gUnknown_0203E75C[DISPLAY_HEIGHT + vcount];

    return;
}

//! FE8U = 0x08081FFC
void sub_8081FFC(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gUnknown_0203E75C = gUnknown_0203E754[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    ((vu16 *)PLTT)[0x10 * (1 + 0) + 1] = gUnknown_0203E75C[vcount];
    ((vu16 *)PLTT)[0x10 * (1 + 1) + 1] = gUnknown_0203E75C[DISPLAY_HEIGHT + vcount];

    return;
}

//! FE8U = 0x08082050
void sub_8082050(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gUnknown_0203E75C = gUnknown_0203E754[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_BLDALPHA = gUnknown_0203E75C[vcount];

    return;
}

//! FE8U = 0x08082094
void sub_8082094(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gUnknown_0203E75C = gUnknown_0203E754[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    *(vu16 *)0x04000054 = gUnknown_0203E75C[vcount];

    return;
}

//! FE8U = 0x080820D8
void sub_80820D8(u16 yTop, u16 yBottom, u16 colorArg3, u16 colorArg4)
{
    // clang-format off
    #define RGB_HALVED(color, component_mask) \
        ((((component_mask) & (color)) >> 1) & (component_mask))
    // clang-format on

    sub_80824C4(
        gUnknown_0203E754[1], yTop, yBottom, colorArg3,
        RGB_HALVED(colorArg3, 0x1F) | RGB_HALVED(colorArg3, 0x1F << 5) | RGB_HALVED(colorArg3, 0x1F << 10));
    sub_80824C4(
        gUnknown_0203E754[1] + DISPLAY_HEIGHT, yTop, yBottom, colorArg4,
        RGB_HALVED(colorArg4, 0x1F) | RGB_HALVED(colorArg4, 0x1F << 5) | RGB_HALVED(colorArg4, 0x1F << 10));
    sub_8082390();

    SetPrimaryHBlankHandler(sub_8081FFC);

    return;

    // clang-format off
    #undef RGB_HALVED
    // clang-format on
}

//! FE8U = 0x0808218C
void sub_808218C(int x, int y, int a, int b, u8 * unk)
{
    int var;

    sub_80823A0(gUnknown_0203E754[1]);

    for (; *unk != 0xFF && y >= 0; y--)
    {
        var = Div(*unk * a, b);
        unk++;

        if (var > 0)
        {
            sub_80823DC(gUnknown_0203E754[1], x + var - 1, y);
            sub_80823BC(gUnknown_0203E754[1], x - var, y);
        }
    }

    if (var > 0)
    {
        while (y >= 0)
        {
            sub_80823DC(gUnknown_0203E754[1], x + var - 1, y);
            sub_80823BC(gUnknown_0203E754[1], x - var, y);
            y--;
        }
    }

    return;
}

//! FE8U = 0x08082228
void sub_8082228(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = (SIN((i * frequency + phase)) * amplitude) >> 12;
    }

    return;
}

//! FE8U = 0x08082268
void sub_8082268(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int arg5)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = ((SIN((i * frequency + phase)) * amplitude) >> 12) + arg5;
    }

    return;
}

//! FE8U = 0x080822AC
void sub_80822AC(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
{
    int i;

    buf++;

    for (i = 0; i < DISPLAY_HEIGHT - 1; i += 2)
    {
        *buf = ((SIN((i * frequency + frequency + phase)) * amplitude) >> 12);
        buf += 2;
    }

    return;
}

//! FE8U = 0x080822F0
void sub_80822F0(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int arg5)
{
    int i;

    buf++;

    for (i = 0; i < DISPLAY_HEIGHT - 1; i += 2)
    {
        *buf = ((SIN((i * frequency + frequency + phase)) * amplitude) >> 12) + arg5;
        buf += 2;
    }

    return;
}

//! FE8U = 0x08082338
void sub_8082338(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd)
{
    int i;

    for (i = yStart; i < yEnd; i++)
    {
        *buf++ = (SIN(i * frequency + phase) * amplitude) >> 12;
    }

    return;
}

//! FE8U = 0x08082390
void sub_8082390(void)
{
    u16 * tmp = gUnknown_0203E754[0];
    gUnknown_0203E754[0] = gUnknown_0203E754[1];
    gUnknown_0203E754[1] = tmp;

    return;
}

//! FE8U = 0x080823A0
void sub_80823A0(u16 * buf)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = DISPLAY_WIDTH | (DISPLAY_WIDTH << 8);
    }

    return;
}
