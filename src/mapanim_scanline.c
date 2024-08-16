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

//! FE8U = 0x080825E8
void sub_80825E8(void)
{
    int i;
    volatile u16 * buf;

    for (buf = gManimScanlineBufs[0], i = 0; i < DISPLAY_HEIGHT; i++)
    {
        buf[i] = 0x1000;
    }

    for (i = 8; i < DISPLAY_HEIGHT - 8; i++)
    {
        gManimScanlineBufs[0][i] = 0x10;
    }

    for (i = 0; i <= 32; i++)
    {
        *(gManimScanlineBufs[0] + (i + 8)) = ((0x10 - (i >> 1)) << 8) | (i >> 1);
        *(gManimScanlineBufs[0] - (i - DISPLAY_HEIGHT + 8)) = ((0x10 - (i >> 1)) << 8) | (i >> 1);
    }

    return;
}

//! FE8U = 0x08082644
u16 * sub_8082644(int bufId, int scanline)
{
    return &gManimScanlineBufs[bufId][scanline];
}

//! FE8U = 0x08082658
void sub_8082658(u16 * buf, int x, int y, int unk)
{
    int r1;
    int r9;

    int r7 = unk;
    int sl = unk;

    for (r9 = 0; r7 >= r9; r9++)
    {

        if (((y + r9) & 1) == 0)
        {
            SetScanlineBufWinR(buf, x + r7, y + r9);
            SetScanlineBufWinR(buf, x + r7, y - r9);
            SetScanlineBufWinL(buf, x - r7, y + r9);
            SetScanlineBufWinL(buf, x - r7, y - r9);
        }

        if (((y + r7) & 1) == 0)
        {
            SetScanlineBufWinR(buf, x + r9, y + r7);
            SetScanlineBufWinR(buf, x + r9, y - r7);
            SetScanlineBufWinL(buf, x - r9, y + r7);
            SetScanlineBufWinL(buf, x - r9, y - r7);
        }

        sl = (r1 = sl + 1) - (r9) * 2;
        if (sl < 0)
        {
            sl = sl + (r7 - 1) * 2;
            r7 = r7 - 1;
        }
    }

    return;
}

//! FE8U = 0x08082730
void sub_8082730(int x, int y, int unk)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    sub_8082658(gManimScanlineBufs[1], x, y, unk);
    SwapScanlineBufs();
    return;
}

#if NONMATCHING

//! FE8U = 0x08082764
void sub_8082764(int arg_1) {
    int i;
    int r4;
    int ip;

    arg_1 = (arg_1 > 0x70) ? 0x70 : arg_1;

    r4 = 0x50 - arg_1;
    ip = arg_1 + 0x50;

    for (i = 0; i < r4; i++) {
        gManimScanlineBufs[1][i] = 0x1000;
    }

    for (i = ip; i < 0xa0; i++) {
        gManimScanlineBufs[1][i] = 0x1000;
    }

    for (i = r4; i < 0x50 && i < r4 + 0x20; i++) {
        gManimScanlineBufs[1][i] = (0x10 - ((i - r4) >> 1)) * 0x100 | ((i - r4) >> 1);
    }

    for (i = ip - 1; i >= 0x50 && i >= r4 + 0x20; i--) {
        gManimScanlineBufs[1][i] = (0x10 - ((ip - i) >> 1)) * 0x100 | ((ip - i) >> 1);
    }

    for (i = r4 + (0x50 - ip); i < ip; i++) {
        gManimScanlineBufs[1][i] = 0x10;
    }

    SwapScanlineBufs();

    return;
}

#else

/* https://decomp.me/scratch/H9WJv */

NAKEDFUNC
void sub_8082764(int param_1)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        adds r1, r0, #0\n\
        cmp r1, #0x70\n\
        ble _08082776\n\
        movs r1, #0x70\n\
    _08082776:\n\
        movs r0, #0x50\n\
        subs r4, r0, r1\n\
        adds r1, #0x50\n\
        mov ip, r1\n\
        cmp r4, #0\n\
        ble _08082798\n\
        ldr r0, _08082858  @ gManimScanlineBufs\n\
        movs r2, #0x80\n\
        lsls r2, r2, #5\n\
        adds r1, r2, #0\n\
        ldr r0, [r0, #4]\n\
        adds r2, r4, #0\n\
    _0808278E:\n\
        strh r1, [r0]\n\
        adds r0, #2\n\
        subs r2, #1\n\
        cmp r2, #0\n\
        bne _0808278E\n\
    _08082798:\n\
        mov r2, ip\n\
        movs r7, #0x20\n\
        adds r7, r7, r4\n\
        mov sl, r7\n\
        subs r0, r2, #1\n\
        mov r9, r0\n\
        adds r6, r2, #0\n\
        subs r6, #0x20\n\
        cmp r2, #0x9f\n\
        bgt _080827C4\n\
        ldr r0, _08082858  @ gManimScanlineBufs\n\
        ldr r1, [r0, #4]\n\
        movs r7, #0x80\n\
        lsls r7, r7, #5\n\
        adds r3, r7, #0\n\
        lsls r0, r2, #1\n\
        adds r0, r0, r1\n\
    _080827BA:\n\
        strh r3, [r0]\n\
        adds r0, #2\n\
        adds r2, #1\n\
        cmp r2, #0x9f\n\
        ble _080827BA\n\
    _080827C4:\n\
        adds r2, r4, #0\n\
        cmp r2, #0x4f\n\
        bgt _080827F6\n\
        cmp r2, sl\n\
        bge _080827F6\n\
        ldr r0, _08082858  @ gManimScanlineBufs\n\
        ldr r1, [r0, #4]\n\
        movs r0, #0x10\n\
        mov r8, r0\n\
        mov r5, sl\n\
        lsls r0, r2, #1\n\
        adds r3, r0, r1\n\
    _080827DC:\n\
        subs r1, r2, r4\n\
        asrs r1, r1, #1\n\
        mov r7, r8\n\
        subs r0, r7, r1\n\
        lsls r0, r0, #8\n\
        orrs r0, r1\n\
        strh r0, [r3]\n\
        adds r3, #2\n\
        adds r2, #1\n\
        cmp r2, #0x4f\n\
        bgt _080827F6\n\
        cmp r2, r5\n\
        blt _080827DC\n\
    _080827F6:\n\
        mov r2, r9\n\
        cmp r2, #0x4f\n\
        ble _08082826\n\
        adds r4, r6, #0\n\
        cmp r2, r6\n\
        blt _08082826\n\
        ldr r0, _08082858  @ gManimScanlineBufs\n\
        ldr r1, [r0, #4]\n\
        movs r5, #0x10\n\
        lsls r0, r2, #1\n\
        adds r3, r0, r1\n\
    _0808280C:\n\
        mov r0, ip\n\
        subs r1, r0, r2\n\
        asrs r1, r1, #1\n\
        subs r0, r5, r1\n\
        lsls r0, r0, #8\n\
        orrs r0, r1\n\
        strh r0, [r3]\n\
        subs r3, #2\n\
        subs r2, #1\n\
        cmp r2, #0x4f\n\
        ble _08082826\n\
        cmp r2, r4\n\
        bge _0808280C\n\
    _08082826:\n\
        mov r2, sl\n\
        adds r3, r6, #0\n\
        cmp r2, r3\n\
        bge _08082844\n\
        ldr r0, _08082858  @ gManimScanlineBufs\n\
        ldr r1, [r0, #4]\n\
        movs r4, #0x10\n\
        lsls r0, r2, #1\n\
        adds r0, r0, r1\n\
        subs r2, r3, r2\n\
    _0808283A:\n\
        strh r4, [r0]\n\
        adds r0, #2\n\
        subs r2, #1\n\
        cmp r2, #0\n\
        bne _0808283A\n\
    _08082844:\n\
        bl SwapScanlineBufs\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08082858: .4byte gManimScanlineBufs\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x0808285C
void WorldFlushHBlank(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT - 1)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    if ((vcount & 1) == 0)
    {
        REG_WIN0H = gManimActiveScanlineBuf[vcount];
    }

    return;
}

//! FE8U = 0x080828A8
void sub_80828A8(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT - 1)
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

//! FE8U = 0x080828EC
void sub_80828EC(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount >= DISPLAY_HEIGHT)
    {
        vcount = 0;
    }

    REG_BG2VOFS = gManimActiveScanlineBuf[vcount];

    return;
}

//! FE8U = 0x0808291C
void sub_808291C(void)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        gManimActiveScanlineBuf[i] = -((i & 1) + (i >> 1));
    }

    SwapScanlineBufs();

    return;
}

//! FE8U = 0x0808294C
void sub_808294C(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG1HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG1VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}

//! FE8U = 0x080829A4
void sub_80829A4(s16 * r6, s16 r1, s16 r8, s16 r3, s16 sl, s16 r4, s16 ip)
{
    int r7;

    r6 += 1;

    for (r7 = 1; r7 < DISPLAY_HEIGHT; r7 += 2)
    {
#if NONMATCHING
        *r6 = sl + (((SIN((r3 * r7 + r1)) * r8 * ABS(r7 - r4)) * ip) >> 0x14);
#else
        register int tmp asm("r1") = ((SIN((r3 * r7 + r1)) * r8 * ABS(r7 - r4)) * ip);
        register int tmp2 asm("r0") = tmp >> 0x14;
        *r6 = sl + tmp2;
#endif

        r6 += 2;
    }

    return;
}

//! FE8U = 0x08082A24
void sub_8082A24(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG0HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG0VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}

//! FE8U = 0x08082A7C
void sub_8082A7C(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG1HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG1VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}

//! FE8U = 0x08082AD4
void sub_8082AD4(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG2HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG2VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}

//! FE8U = 0x08082B2C
void sub_8082B2C(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG3HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG3VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}

//! FE8U = 0x08082B84
void sub_8082B84(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG2HOFS = ((vu16 *)(gManimActiveScanlineBuf))[vcount + DISPLAY_HEIGHT] + gLCDControlBuffer.bgoffset[2].x;
        REG_BG2VOFS = ((vu16 *)(gManimActiveScanlineBuf))[vcount + 0] + gLCDControlBuffer.bgoffset[2].y;
    }

    return;
}

//! FE8U = 0x08082BEC
void sub_8082BEC(void)
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

    if ((vcount & 1) != 0)
    {
        REG_BG1HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG1VOFS = gManimActiveScanlineBuf[vcount + 0];
        REG_BG2HOFS = gManimActiveScanlineBuf[vcount + DISPLAY_HEIGHT];
        REG_BG2VOFS = gManimActiveScanlineBuf[vcount + 0];
    }

    return;
}

//! FE8U = 0x08082C50
void sub_8082C50(u16 * buf, int x, int y, int arg_4, int arg_5)
{
    int sl;
    int r8;
    int r9;
    int sp_0c;
    int sp_10;
    int sp_14;
    int sp_18;
    int sp_1c;
    int sp_20;

    if (arg_4 > arg_5)
    {
        r9 = arg_4;
        sp_10 = arg_4;
        sp_0c = 0;

        if (arg_4 < 0)
        {
            return;
        }

        for (sp_1c = 0, sp_20 = arg_5 * arg_4; r9 >= sp_0c; sp_0c++)
        {
            sl = sp_20 / arg_4;
            r8 = sp_1c / arg_4;

            SetScanlineBufWinR(buf, x + r9, y + r8);
            SetScanlineBufWinR(buf, x + r9, y - r8);
            SetScanlineBufWinL(buf, x - r9, y + r8);
            SetScanlineBufWinL(buf, x - r9, y - r8);

            SetScanlineBufWinR(buf, x + sp_0c, y + sl);
            SetScanlineBufWinR(buf, x + sp_0c, y - sl);
            SetScanlineBufWinL(buf, x - sp_0c, y + sl);
            SetScanlineBufWinL(buf, x - sp_0c, y - sl);

            sp_10 -= (2 * sp_0c - 1);

            if (sp_10 < 0)
            {
                sp_10 += (r9 - 1) * 2;
                sp_20 -= arg_5;
                r9--;
            }

            sp_1c += arg_5;
        }
    }
    else
    {
        r9 = arg_5;
        sp_10 = arg_5;
        sp_0c = 0;

        if (arg_5 < 0)
        {
            return;
        }

        for (sp_14 = 0, sp_18 = arg_4 * arg_5; r9 >= sp_0c; sp_0c++)
        {
            sl = sp_18 / arg_5;
            r8 = sp_14 / arg_5;

            SetScanlineBufWinR(buf, x + sl, y + sp_0c);
            SetScanlineBufWinR(buf, x + sl, y - sp_0c);
            SetScanlineBufWinL(buf, x - sl, y + sp_0c);
            SetScanlineBufWinL(buf, x - sl, y - sp_0c);

            SetScanlineBufWinR(buf, x + r8, y + r9);
            SetScanlineBufWinR(buf, x + r8, y - r9);
            SetScanlineBufWinL(buf, x - r8, y + r9);
            SetScanlineBufWinL(buf, x - r8, y - r9);

            sp_10 -= (2 * sp_0c - 1);

            if (sp_10 < 0)
            {
                sp_10 += (r9 - 1) * 2;
                sp_18 -= arg_4;
                r9--;
            }

            sp_14 += arg_4;
        }
    }

    return;
}

//! FE8U = 0x08082E40
void sub_8082E40(int x, int y, int c, int d)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    sub_8082C50(gManimScanlineBufs[1], x, y, c, d);
    SwapScanlineBufs();
    return;
}
