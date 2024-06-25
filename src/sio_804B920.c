#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

struct SioProc85AA7B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x64);
    /* 64 */ s16 unk_64;
};

extern s16 gUnk_Sio_02000F00[];

extern s16 * gUnk_Sio_02001180;
extern s16 * gUnk_Sio_02001184;
extern s16 * gUnk_Sio_02001188;

//! FE8U = 0x0804B920
void Set_0203DDDC(void)
{
    gUnk_Sio_0203DDDC = 1;
    return;
}

//! FE8U = 0x0804B92C
void Clear_0203DDDC(void)
{
    gUnk_Sio_0203DDDC = 0;
    return;
}

//! FE8U = 0x0804B938
void sub_804B938(void)
{
    SetWinEnable(0, 0, 0);
    SetBlendConfig(0, 0, 0, 0);
    return;
}

//! FE8U = 0x0804B964
void sub_804B964(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        gUnk_Sio_02001188 = gUnk_Sio_02001180;
        vcount = 0;
    }

    REG_WIN1H = (gUnk_Sio_02001188[vcount * 2 + 0] << 8) + gUnk_Sio_02001188[vcount * 2 + 1];

    return;
}

//! FE8U = 0x0804B9A4
void sub_804B9A4(void)
{
    s16 * swap = gUnk_Sio_02001180;
    gUnk_Sio_02001180 = gUnk_Sio_02001184;
    gUnk_Sio_02001184 = swap;

    return;
}

//! FE8U = 0x0804B9BC
void sub_804B9BC(void)
{
    SetWinEnable(0, 0, 0);
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x0804B9E4
void sub_804B9E4(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k)
{
    int x1;
    int y1;
    int x2;
    int y2;
    int x3;
    int y3;
    int x4;
    int y4;

    b -= (DISPLAY_WIDTH / 2);
    c -= (DISPLAY_HEIGHT / 2);

    d -= (DISPLAY_WIDTH / 2);
    e -= (DISPLAY_HEIGHT / 2);

    f -= (DISPLAY_WIDTH / 2);
    g -= (DISPLAY_HEIGHT / 2);

    h -= (DISPLAY_WIDTH / 2);
    i -= (DISPLAY_HEIGHT / 2);

    x1 = (b * SIN(j)) + (c * COS(j));
    y1 = (b * COS(j)) - (c * SIN(j));

    x2 = (d * SIN(j)) + (e * COS(j));
    y2 = (d * COS(j)) - (e * SIN(j));

    x3 = (f * SIN(j)) + (g * COS(j));
    y3 = (f * COS(j)) - (g * SIN(j));

    x4 = (h * SIN(j)) + (i * COS(j));
    y4 = (h * COS(j)) - (i * SIN(j));

    x1 = ((k * (x1 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y1 = ((k * (y1 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x2 = ((k * (x2 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y2 = ((k * (y2 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x3 = ((k * (x3 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y3 = ((k * (y3 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x4 = ((k * (x4 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y4 = ((k * (y4 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    sub_80131F0(a, x1, y1, x2, y2);
    sub_80131F0(a, x2, y2, x3, y3);
    sub_80131F0(a, x3, y3, x4, y4);
    sub_80131F0(a, x4, y4, x1, y1);

    return;
}

//! FE8U = 0x0804BB54
void sub_804BB54(struct SioProc85AA7B4 * proc)
{
    gUnk_Sio_02001180 = gUnk_Sio_02000F00;

    gUnk_Sio_02001184 = gUnk_Sio_02000F00 - 320;
    gUnk_Sio_02001188 = gUnk_Sio_02000F00;

    sub_80131D0(gUnk_Sio_02001180);
    sub_80131D0(gUnk_Sio_02001184);

    proc->unk_4c = 0;

    SetPrimaryHBlankHandler(sub_804B964);

    return;
}

//! FE8U = 0x0804BBA0
void sub_804BBA0(struct SioProc85AA7B4 * proc)
{
    int a;
    int b;

    if (proc->unk_4c == proc->unk_64)
    {
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
        return;
    }

    a = Interpolate(INTERPOLATE_LINEAR, 0xa0, 0xc0, proc->unk_4c, proc->unk_64);
    b = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x110, proc->unk_4c, proc->unk_64);

    sub_80131D0(gUnk_Sio_02001184);
    sub_804B9E4(gUnk_Sio_02001184, 0, 0, DISPLAY_WIDTH, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0, DISPLAY_HEIGHT, a, b);
    sub_804B9A4();

    proc->unk_4c++;

    return;
}

//! FE8U = 0x0804BC3C
void sub_804BC3C(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 0, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085AA7B4[] =
{
    PROC_YIELD,

    PROC_CALL(sub_804BB54),
    PROC_REPEAT(sub_804BBA0),
    PROC_SLEEP(1),

    PROC_CALL(sub_804BC3C),
    PROC_SLEEP(1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804BC84
void sub_804BC84(u16 a, ProcPtr parent)
{
    struct SioProc85AA7B4 * proc = Proc_StartBlocking(ProcScr_085AA7B4, parent);
    proc->unk_64 = a;

    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 1, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.win1_enableBlend = 1;

    return;
}

//! FE8U = 0x0804BD2C
void sub_804BD2C(ProcPtr parent)
{
    sub_804BC84(0x40, parent);
    return;
}

//! FE8U = 0x0804BD3C
void sub_804BD3C(struct SioProc85AA7B4 * proc)
{
    int a;
    int b;

    if (proc->unk_4c == proc->unk_64)
    {
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
        return;
    }

    a = Interpolate(INTERPOLATE_RSQUARE, 0xc0, 0xa0, proc->unk_4c, proc->unk_64);
    b = Interpolate(INTERPOLATE_RCUBIC, 0x110, 0x10, proc->unk_4c, proc->unk_64);

    sub_80131D0(gUnk_Sio_02001184);
    sub_804B9E4(gUnk_Sio_02001184, 0, 0, DISPLAY_WIDTH, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0, DISPLAY_HEIGHT, a, b);
    sub_804B9A4();

    proc->unk_4c++;

    return;
}

//! FE8U = 0x0804BDD8
void sub_804BDD8(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetWinEnable(0, 0, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085AA7EC[] =
{
    PROC_YIELD,

    PROC_CALL(sub_804BB54),
    PROC_REPEAT(sub_804BD3C),
    PROC_SLEEP(1),

    PROC_CALL(sub_804BDD8),
    PROC_SLEEP(1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804BDFC
void sub_804BDFC(u16 a, ProcPtr parent)
{
    struct SioProc85AA7B4 * proc = Proc_StartBlocking(ProcScr_085AA7EC, parent);
    proc->unk_64 = a;

    SetWinEnable(0, 1, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.win1_enableBlend = 1;

    return;
}

//! FE8U = 0x0804BE88
void sub_804BE88(ProcPtr parent)
{
    sub_804BDFC(0x40, parent);
    return;
}

//! FE8U = 0x0804BE98
void sub_804BE98(ProcPtr proc)
{
    if (Proc_Find(ProcScr_085AA7B4) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0804BEB8
void sub_804BEB8(ProcPtr proc)
{
    if (Proc_Find(ProcScr_085AA7EC) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}
