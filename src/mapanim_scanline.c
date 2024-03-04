#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

EWRAM_DATA u16 gManimScanlineBufA[DISPLAY_HEIGHT * 2 * 2] = { 0 };
EWRAM_DATA u16 * gManimScanlineBufs[2] = { NULL };
EWRAM_DATA u16 * gManimActiveScanlineBuf = NULL;
EWRAM_DATA u32 unused_0203e760 = 0;

//! FE8U = 0x08081E78
void InitScanline(void)
{
    InitScanlineBuf(gManimScanlineBufA);
    InitScanlineBuf(gManimScanlineBufA + 0x140);

    gManimScanlineBufs[0] = gManimScanlineBufA;
    gManimScanlineBufs[1] = gManimScanlineBufA + 0x140;

    gManimActiveScanlineBuf = gManimScanlineBufA;

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
void UpdateMapAnimScanline(int x, int y, int arg3)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    MapAnimScanlineCore(gManimScanlineBufs[1], x, y, arg3);
    SwapScanlineBufs();
}

//! FE8U = 0x08081F58
void MapAnimResetHBlank(void)
{
    SetPrimaryHBlankHandler(NULL);
}

//! FE8U = 0x08081F64
void sub_8081F64(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_WIN0H = gManimActiveScanlineBuf[vcount];

    return;
}

//! FE8U = 0x08081FA8
void HBlank_MapAnimEffect_Unk_8081FA8(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_WIN0H = gManimActiveScanlineBuf[vcount];
    REG_BG2HOFS = gManimActiveScanlineBuf[DISPLAY_HEIGHT + vcount];

    return;
}

//! FE8U = 0x08081FFC
void sub_8081FFC(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    ((vu16 *)PLTT)[0x10 * (1 + 0) + 1] = gManimActiveScanlineBuf[vcount];
    ((vu16 *)PLTT)[0x10 * (1 + 1) + 1] = gManimActiveScanlineBuf[DISPLAY_HEIGHT + vcount];

    return;
}

//! FE8U = 0x08082050
void sub_8082050(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_BLDALPHA = gManimActiveScanlineBuf[vcount];

    return;
}

//! FE8U = 0x08082094
void sub_8082094(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    *(vu16 *)0x04000054 = gManimActiveScanlineBuf[vcount];

    return;
}

//! FE8U = 0x080820D8
void StartManimFrameGradientScanlineEffect(u16 yTop, u16 yBottom, u16 colorArg3, u16 colorArg4)
{
    // clang-format off
    #define RGB_HALVED(color, component_mask) \
        ((((component_mask) & (color)) >> 1) & (component_mask))
    // clang-format on

    PrepareGradientScanlineBuf(
        gManimScanlineBufs[1], yTop, yBottom, colorArg3,
        RGB_HALVED(colorArg3, 0x1F) | RGB_HALVED(colorArg3, 0x1F << 5) | RGB_HALVED(colorArg3, 0x1F << 10));
    PrepareGradientScanlineBuf(
        gManimScanlineBufs[1] + DISPLAY_HEIGHT, yTop, yBottom, colorArg4,
        RGB_HALVED(colorArg4, 0x1F) | RGB_HALVED(colorArg4, 0x1F << 5) | RGB_HALVED(colorArg4, 0x1F << 10));
    SwapScanlineBufs();

    SetPrimaryHBlankHandler(sub_8081FFC);

    return;

    // clang-format off
    #undef RGB_HALVED
    // clang-format on
}

//! FE8U = 0x0808218C
void sub_808218C(int x, int y, int a, int b, const u8 * unk)
{
    int var;

    InitScanlineBuf(gManimScanlineBufs[1]);

    for (; *unk != 0xFF && y >= 0; y--)
    {
        var = Div(*unk * a, b);
        unk++;

        if (var > 0)
        {
            SetScanlineBufWinR(gManimScanlineBufs[1], x + var - 1, y);
            SetScanlineBufWinL(gManimScanlineBufs[1], x - var, y);
        }
    }

    if (var > 0)
    {
        while (y >= 0)
        {
            SetScanlineBufWinR(gManimScanlineBufs[1], x + var - 1, y);
            SetScanlineBufWinL(gManimScanlineBufs[1], x - var, y);
            y--;
        }
    }

    return;
}

//! FE8U = 0x08082228
void PrepareSineWaveScanlineBuf(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
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
void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd)
{
    int i;

    for (i = yStart; i < yEnd; i++)
    {
        *buf++ = (SIN(i * frequency + phase) * amplitude) >> 12;
    }

    return;
}

//! FE8U = 0x08082390
void SwapScanlineBufs(void)
{
    u16 * tmp = gManimScanlineBufs[0];
    gManimScanlineBufs[0] = gManimScanlineBufs[1];
    gManimScanlineBufs[1] = tmp;

    return;
}

//! FE8U = 0x080823A0
void InitScanlineBuf(u16 * buf)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        *buf++ = DISPLAY_WIDTH | (DISPLAY_WIDTH << 8);
    }

    return;
}

//! FE8U = 0x080823BC
void SetScanlineBufWinL(u16 * buf, int x, int y)
{
    u16 * tmp;

    if (y < 0 || y >= DISPLAY_HEIGHT)
    {
        return;
    }

    if (x < 0)
    {
        x = 0;
    }

    if (x > DISPLAY_WIDTH)
    {
        x = DISPLAY_WIDTH;
    }

    tmp = buf + y;

    ((u8 *)(tmp))[1] = x;
    return;
}

//! FE8U = 0x080823DC
void SetScanlineBufWinR(u16 * buf, int x, int y)
{
    u16 * tmp;

    if (y < 0 || y >= DISPLAY_HEIGHT)
    {
        return;
    }

    if (x < 0)
    {
        x = 0;
    }

    if (x > DISPLAY_WIDTH)
    {
        x = DISPLAY_WIDTH;
    }

    tmp = buf + y;

    ((u8 *)(tmp))[0] = x;

    return;
}

//! FE8U = 0x080823FC
void MapAnimScanlineCore(u16 * buf, int x, int y, int arg4)
{
    int i;

    int var = arg4;

    for (i = 0; var >= i; i++)
    {
        SetScanlineBufWinR(buf, x + var, y + i);
        SetScanlineBufWinR(buf, x + var, y - i);
        SetScanlineBufWinR(buf, x + i, y + var);
        SetScanlineBufWinR(buf, x + i, y - var);

        SetScanlineBufWinL(buf, x - var, y + i);
        SetScanlineBufWinL(buf, x - var, y - i);
        SetScanlineBufWinL(buf, x - i, y + var);
        SetScanlineBufWinL(buf, x - i, y - var);

        arg4 -= (i << 1) - 1;

        if (arg4 < 0)
        {
            arg4 = arg4 + ((var - 1) << 1);
            var = var - 1;
        }
    }
}

//! FE8U = 0x080824C4
void PrepareGradientScanlineBuf(u16 * buf, u16 yTop, u16 yBottom, u16 colorA, u16 colorB)
{
    int i;
    int scanline;
    int r, g, b;

    int scanlines = yBottom - yTop;

    scanline = 0;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < yTop)
        {
            *buf++ = colorA;
            continue;
        }

        if (i > yBottom)
        {
            *buf++ = colorB;
            continue;
        }

        r = Interpolate(INTERPOLATE_LINEAR, colorA & 0x001F, colorB & 0x001F, scanline, scanlines);
        g = Interpolate(INTERPOLATE_LINEAR, colorA & 0x03E0, colorB & 0x03E0, scanline, scanlines);
        b = Interpolate(INTERPOLATE_LINEAR, colorA & 0x7C00, colorB & 0x7C00, scanline, scanlines);

        *buf++ = (r & 0x001F) | (g & 0x03E0) | (b & 0x7C00);

        scanline++;
    }

    return;
}

struct ManimShiftingSineWaveScanlineBufProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};

//! FE8U = 0x080825B0
void sub_80825B0(struct ManimShiftingSineWaveScanlineBufProc * proc)
{
    proc->phase = 0;
    return;
}

//! FE8U = 0x080825B8
void sub_80825B8(struct ManimShiftingSineWaveScanlineBufProc * proc)
{
    PrepareSineWaveScanlineBuf(gManimScanlineBufs[1] + DISPLAY_HEIGHT, proc->phase++, 0x10, 8);
    SwapScanlineBufs();
    return;
}
