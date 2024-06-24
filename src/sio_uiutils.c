#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"

#include "sio_core.h"
#include "sio.h"

/**
 * Contains various sprite/palette utility procs used in
 * the Link Arena menus.
 */

extern s8 gUnk_Sio_0203DDDC;

//! FE8U = 0x0804C33C
void InitSioBG(void)
{
    // clang-format off
    u16 SioDefaultBgConfig[] =
    {
        0x0000, 0x6000, 0x0000,
        0x0000, 0x6800, 0x0000,
        0x0000, 0x7000, 0x0000,
        0x8000, 0x7800, 0x0000,
    };
    // clang-format on

    SetupBackgrounds(SioDefaultBgConfig);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ReadGameSaveCoreGfx();

    CopyToPaletteBuffer(Pal_LinkArenaRankIcons, 0x300, 0x40);

    return;
}

//! FE8U = 0x0804C3A0
void sub_804C3A0(int unusedA, int unusedB)
{
    return;
}

//! FE8U = 0x0804C3A4
void sub_804C3A4(int unused)
{
    return;
}

//! FE8U = 0x0804C3A8
void nullsub_13(void)
{
    return;
}

//! FE8U = 0x0804C3AC
void sub_804C3AC(u8 * src, u8 * dst, int c, int d)
{
    int i;

    int r7 = c << 5;

    for (i = 0; i < d; i++)
    {
        CpuFastCopy(src, dst, (r7 * 0x20) / 0x20);
        src += 0x400;
        dst += 0x400;
    }

    return;
}

struct SioProc85AA980
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ u32 unk_5c;
};

extern u8 gUnknown_085B0DE8[];
extern u8 gUnknown_085AAE0C[];

extern u8 gUnknown_085B0F2C[];

//! FE8U = 0x0804C3EC
void sub_804C3EC(struct SioProc85AA980 * proc)
{
    int a = (proc->unk_58 % 3) * 0x140;
    int b = (proc->unk_58 / 3) * 0x800;

    Decompress(gUnknown_085B0DE8, (void *)(0x6000000 + proc->unk_5c));
    Decompress(gUnknown_085AAE0C, gGenericBuffer);

    sub_804C3AC(gGenericBuffer + (a + b), (void *)(0x06014000), 10, 2);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_085B0F2C, (((u16)(proc->unk_5c >> 1) >> 4)) | 0x1000);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

// clang-format off

u16 CONST_DATA gUnknown_085AA96C[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x200) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x204) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x208) + OAM2_LAYER(1) + OAM2_PAL(8),
};

// clang-format on

//! FE8U = 0x0804C47C
void sub_804C47C(void)
{
    PutSpriteExt(4, 20, 8, gUnknown_085AA96C, 0);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085AA980[] =
{
    PROC_YIELD,
    PROC_CALL(sub_804C3EC),
    PROC_REPEAT(sub_804C47C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C49C
void NewProc085AA980(ProcPtr parent, int b, int chr)
{
    struct SioProc85AA980 * proc;

    Proc_EndEach(ProcScr_085AA980);
    proc = Proc_Start(ProcScr_085AA980, parent);

    proc->unk_58 = b;
    proc->unk_5c = chr;

    if (chr == 0)
    {
        proc->unk_5c = 0x5c00;
    }

    proc->unk_2c = (proc->unk_58 % 3) * 0x140;
    proc->unk_30 = (proc->unk_58 / 3) * 0x800;

    return;
}

//! FE8U = 0x0804C4F8
void sub_804C4F8(void)
{
    Proc_EndEach(ProcScr_085AA980);
    return;
}

//! FE8U = 0x0804C508
void sub_804C508(void)
{
    SetBlendConfig(1, 0x10, 4, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x0804C558
void sub_804C558(void)
{
    SetBlendConfig(1, 0x10, 4, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

//! FE8U = 0x0804C590
void sub_804C590(void)
{
    SetBlendConfig(0, 0, 0, 0);
    return;
}

// clang-format off

const u16 Sprite_080D9FFC[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x240),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x244),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x248),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_080DA01C[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x24A),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x24E),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x252),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_080DA03C[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x254),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x258),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x25C),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_080DA05C[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x280),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x284),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x288),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_080DA07C[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x28A),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x28E),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x292),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 * CONST_DATA gUnknown_085AA9A0[] =
{
    Sprite_080D9FFC,
    Sprite_080DA01C,
    Sprite_080DA03C,
    Sprite_080DA05C,
    Sprite_080DA07C,
};

const u16 gUnknown_080DA09C[] =
{
    OAM2_LAYER(1) + OAM2_PAL(5),
    OAM2_LAYER(1) + OAM2_PAL(4),
    OAM2_PAL(3),
    OAM2_PAL(4),
};

const u16 Sprite_080DA0A4[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C0) + OAM2_PAL(4),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x2C4) + OAM2_PAL(4),
};

const u16 Sprite_080DA0B2[] =
{
    3,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x2C0) + OAM2_PAL(4),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(8), OAM2_CHR(0x2C6) + OAM2_PAL(4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x2C2) + OAM2_PAL(4),
};

const u16 Sprite_080DA0C6[] =
{
    3,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x2C0) + OAM2_PAL(4),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(8), OAM2_CHR(0x2C7) + OAM2_PAL(4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x2C2) + OAM2_PAL(4),
};

const u16 * CONST_DATA gUnknown_085AA9B4[] =
{
    Sprite_080DA0A4,
    Sprite_080DA0B2,
    Sprite_080DA0C6,
};

// clang-format on

//! FE8U = 0x0804C5A4
void sub_804C5A4(u8 idx)
{
    // clang-format off
    const u8 gUnknown_080DA0DA[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };
    // clang-format on

    if (gUnk_Sio_0203DDDC == 0)
    {
        int color = gUnknown_080DA0DA[idx] + 0x10;
        gPaletteBuffer[0x131] = ((color) << 10) + ((color) << 5) + (color);
        EnablePaletteSync();
    }

    return;
}

struct SioProc85AA9C0
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u16 unk_36;
    /* 38 */ u16 unk_38;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 unk_3c;
    /* 3E */ u8 unk_3e;
};

//! FE8U = 0x0804C5F8
void sub_804C5F8(struct SioProc85AA9C0 * proc)
{
    int oam2 = OAM2_CHR(0x2C8) + OAM2_PAL(8);

    PutSprite(4, proc->unk_2a, proc->unk_2c, gUnknown_085AA9A0[proc->unk_2f], gUnknown_080DA09C[proc->unk_2e]);

    if (proc->unk_2e == 2)
    {
        sub_804C5A4(proc->unk_30);
    }

    proc->unk_30 = (proc->unk_30 + 1) & 0x1f;

    if (proc->unk_2e == 2 && proc->unk_2f == 1)
    {
        proc->unk_36 += proc->unk_3a;
        proc->unk_38 += proc->unk_3c;

        if (proc->unk_3a > 4)
        {
            proc->unk_3a--;
        }

        if (proc->unk_3c > 4)
        {
            proc->unk_3c--;
        }

        if ((GetGameClock() & 3) == 0)
        {
            if (proc->unk_32 < 0)
            {
                proc->unk_32++;
            }

            if (proc->unk_34 > 0x34)
            {
                proc->unk_34--;
            }
        }

        PutSprite(
            0, 0x4b + proc->unk_2a + proc->unk_32, proc->unk_2c + 8, gObject_8x16, ((proc->unk_36 >> 5) % 6) + oam2);
        PutSprite(
            0, 0x49 + proc->unk_2a + proc->unk_34, proc->unk_2c + 8, gObject_8x16_HFlipped,
            ((proc->unk_38 >> 5) % 6) + oam2);

        PutSpriteExt(0, 0x50 + proc->unk_2a, proc->unk_2c + 9, gUnknown_085AA9B4[gLinkArenaSt.unk_05], 0);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AA9C0[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804C5F8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C758
ProcPtr sub_804C758(ProcPtr parent, u8 x1, u8 y1, u8 d, u8 e)
{
    struct SioProc85AA9C0 * proc = Proc_Start(gUnknown_085AA9C0, parent);

    proc->unk_2a = x1;
    proc->unk_2c = y1;
    proc->unk_2e = e;
    proc->unk_2f = d;
    proc->unk_32 = 0;
    proc->unk_34 = 0x34;
    proc->unk_38 = 0;
    proc->unk_36 = 0;
    proc->unk_3c = 4;
    proc->unk_3a = 4;
    proc->unk_3e = 0;
    proc->unk_30 = 0;

    return proc;
}

//! FE8U = 0x0804C7C8
void sub_804C7C8(struct SioProc85AA9C0 * proc, int b, int c, int d, int e)
{
    proc->unk_32 = b;
    proc->unk_34 = c;
    proc->unk_3a = d;
    proc->unk_3c = e;

    return;
}

//! FE8U = 0x0804C7DC
void sub_804C7DC(struct SioProc85AA9C0 * proc, s16 x, s16 y)
{
    proc->unk_2a = x;
    proc->unk_2c = y;

    return;
}

extern u16 gUnknown_085ADDE8[];

// clang-format off

const u16 gUnknown_080DA0FA[] =
{
    1,
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32, OAM2_CHR(0x300) + OAM2_LAYER(1),
};

// clang-format on

//! FE8U = 0x0804C7E4
void sub_804C7E4(void)
{
    u16 * ptr = gUnknown_085ADDE8;

    // clang-format off
    const u8 gUnknown_080DA102[] =
    {
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
    };
    // clang-format on

    if (gUnk_Sio_0203DDDC == 0)
    {
        int a = (GetGameClock() % 0x40);
        int idx = gUnknown_080DA102[a / 2];

        gPaletteBuffer[0x18E] = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

extern u16 gUnknown_085ADE48[];

//! FE8U = 0x0804C83C
void sub_804C83C(void)
{
    u16 * ptr = gUnknown_085ADE48;

    // clang-format off
    const u8 gUnknown_080DA0DA[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };
    // clang-format on

    if (gUnk_Sio_0203DDDC == 0)
    {
        int a = (GetGameClock() % 0x40);
        int idx = gUnknown_080DA0DA[a / 2];

        gPaletteBuffer[0x13E] = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

struct SioProc85AAA78
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ s16 unk_30[5];
    /* 3A */ u8 unk_3a[5];
    /* 40 */ int unk_40;
    /* 44 */ s8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
};

// clang-format off

u16 CONST_DATA gUnknown_085AA9D8[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x2B8) + OAM2_PAL(8),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2BC) + OAM2_PAL(8),
};

u16 CONST_DATA Sprite_085AA9E6[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x27B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x27B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x27F) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA Sprite_085AA9FA[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x29B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x29B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x29F) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA gUnknown_085AAA0E[] =
{
    9,
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8, OAM2_CHR(0x277) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(16), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(32), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(48), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(64), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(80), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(96), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(112), OAM2_CHR(0x278) + OAM2_PAL(3),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(128), OAM2_CHR(0x279) + OAM2_PAL(3),
};

u16 * CONST_DATA gUnknown_085AAA48[] =
{
    Sprite_085AA9E6,
    Sprite_085AA9FA,
};

u16 CONST_DATA Sprite_085AAA50[] =
{
    2,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x240) + OAM2_PAL(3),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x248) + OAM2_PAL(3),
};

u16 CONST_DATA gUnknown_085AAA5E[] =
{
    4,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x24C) + OAM2_PAL(3),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x290) + OAM2_PAL(3),
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2AD) + OAM2_PAL(3),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64) + OAM1_HFLIP, OAM2_CHR(0x24C) + OAM2_PAL(3),
};

// clang-format on

extern u16 gUnknown_08A1BD40[];

//! FE8U = 0x0804C894
void sub_804C894(struct SioProc85AAA78 * proc)
{
    int i;
    int oam2;

    if (gLinkArenaSt.unk_00 == 1)
    {
        if (proc->unk_44 != 0)
        {
            oam2 = 0x400;
        }
        else
        {
            oam2 = 0xc00;
        }

        PutSprite(0, 0x58, 0x20, gUnknown_085AA9D8, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            PutSprite(4, proc->unk_30[i] + 6, 0x20 + i * 0x18, Sprite_085AAA50, (i & 0xf) * 0x1000 + oam2);

            if (proc->unk_3a[i] != 0)
            {
                PutSprite(4, proc->unk_30[i] + 6, 0x20 + i * 0x18, gUnknown_085AAA5E, oam2);
            }
        }

        if (proc->unk_40 != 0)
        {
            if (gUnk_Sio_0203DDDC == 0)
            {
                gPaletteBuffer[0x18e] = ((GetGameClock() % 0x40) / 4)[gUnknown_08A1BD40];
                EnablePaletteSync();
            }

            if (proc->unk_40 < 0x100)
            {
                proc->unk_40 = proc->unk_40 + 0x10;
            }

            // clang-format off
            SetObjAffine(
                0,
                Div(+COS(0) * 16, 0x100),
                Div(-SIN(0) * 16, proc->unk_40),
                Div(+SIN(0) * 16, 0x100),
                Div(+COS(0) * 16, proc->unk_40)
            );
            // clang-format on

            PutSprite(4, 0x78, 0, gUnknown_080DA0FA, 0x8000);
        }
        sub_804C83C();
    }
    else
    {
        PutSprite(0xb, 0x58, 0x20, gUnknown_085AA9D8, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            PutSprite(2, proc->unk_30[i], 0x30 + i * 0x10, gUnknown_085AAA48[proc->unk_3a[i]], 0);

            if (proc->unk_3a[i] != 0)
            {
                if (proc->unk_30[i] < 0)
                {
                    proc->unk_30[i]++;
                }
            }
            else if (proc->unk_30[i] > -8)
            {
                proc->unk_30[i]--;
            }
        }

        sub_804C7E4();
    }

    if (gLinkArenaSt.unk_00 == 1)
    {
        oam2 = 0x400;
    }
    else
    {
        oam2 = 0x800;
    }

    if (proc->unk_44 != 0)
    {
        PutLinkArenaButtonSpriteAt(0xc0, 0x10);
    }

    if (proc->unk_48 >= 0)
    {
        PutSprite(4, 0x50, proc->unk_48 + 8, gUnknown_085AAA0E, oam2);
    }

    return;
}

struct SioTeamListProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85AAA78 * unk_2c;
    /* 30 */ ProcPtr pSioHoldProc;
    /* 34 */ int numActiveOptions;
    /* 38 */ int unk_38;
    /* 3C */ int optionIdx;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u8 unk_48;
    /* 49 */ STRUCT_PAD(0x49, 0x4A);
    /* 4A */ u16 yBg1;
    /* 4C */ s8 unk_4c;
    /* 4D */ u8 validOptions[5];
    /* 52 */ u8 selectedOption;
    /* 53 */ u8 selectedTeam;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ STRUCT_PAD(0x56, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ s8 unk_5c;
};

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAA78[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804C894),
    PROC_END,
};

// clang-format on

void sub_804CC14(int, int, int, int, int, ProcPtr);

//! FE8U = 0x0804CAEC
ProcPtr sub_804CAEC(struct SioTeamListProc * parent, int b, u8 * buf)
{
    struct SioProc85AAA78 * proc;
    int i;

    Proc_EndEach(gUnknown_085AAA78);
    proc = Proc_Start(gUnknown_085AAA78, parent);

    proc->unk_2c = b;
    proc->unk_44 = 1;
    proc->unk_40 = 0;
    proc->unk_48 = -1;

    for (i = 0; i < 5; i++)
    {
        proc->unk_3a[i] = buf[i];
        proc->unk_30[i] = -8;
    }

    sub_804D1E0(0xe1, 0x28, parent->unk_38, 6, parent->yBg1 + 40, proc);
    sub_804CC14(0x98, 0x28 - parent->unk_48 * 0x10, 0x88, 0x27, parent->unk_38, proc);

    return proc;
}

struct SioProc85AAA90
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
};

//! FE8U = 0x0804CB94
void sub_804CB94(struct SioProc85AAA90 * proc)
{
    int i;
    int y;
    int j;

    for (i = 0; i < proc->unk_3c; i++)
    {
        y = proc->unk_30 + i * 0x10;

        if (y >= proc->unk_38)
        {
            continue;
        }

        if (y <= proc->unk_34)
        {
            continue;
        }

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit = GetUnit(i * 5 + j + 1);

            if (unit->pCharacterData == NULL)
            {
                continue;
            }

            sub_8027E4C(4, proc->unk_2c + j * 0xe, y, OAM2_LAYER(1), unit);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAA90[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804CB94),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CC14
void sub_804CC14(int x, int y, int upperBound, int lowerBound, int count, ProcPtr parent)
{
    struct SioProc85AAA90 * proc;

    Proc_EndEach(gUnknown_085AAA90);
    proc = Proc_Start(gUnknown_085AAA90, parent);

    proc->unk_3c = count;

    proc->unk_2c = x;
    proc->unk_30 = y;

    proc->unk_34 = lowerBound;
    proc->unk_38 = upperBound;

    return;
}

//! FE8U = 0x0804CC5C
void sub_804CC5C(int amount)
{
    struct SioProc85AAA90 * proc = Proc_Find(gUnknown_085AAA90);
    proc->unk_30 += amount;

    return;
}

extern u16 gUnknown_085ADE28[];

//! FE8U = 0x0804CC78
void sub_804CC78(void)
{
    int r2;
    int i;

    u16 * ptr = gUnknown_085ADE28;

    if (gUnk_Sio_0203DDDC == 0)
    {
        r2 = (GetGameClock() % 0x20);
        r2 = r2 >> 1;

        for (i = 0; i < 5; i++)
        {
            gPaletteBuffer[0x19B + i] = ptr[((r2 + i) & 0xf)];
        }

        EnablePaletteSync();
    }

    return;
}

struct SioProc85AAAC4
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
};

// clang-format off

const u16 Sprite_080DA122[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x251) + OAM2_LAYER(1) + OAM2_PAL(9),
};

const u16 Sprite_080DA12A[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x253) + OAM2_LAYER(1) + OAM2_PAL(9),
};

const u16 * CONST_DATA gUnknown_085AAAA8[] =
{
    Sprite_080DA122,
    Sprite_080DA12A,
};

const u16 gUnknown_080DA132[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x29A) + OAM2_LAYER(2) + OAM2_PAL(9),
};

const u16 Sprite_080DA13A[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C0) + OAM2_LAYER(1),
};

const u16 Sprite_080DA142[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C4) + OAM2_LAYER(1),
};

const u16 Sprite_080DA14A[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C8) + OAM2_LAYER(1),
};

const u16 Sprite_080DA152[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2CC) + OAM2_LAYER(1),
};

const u16 Sprite_080DA15A[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2D0) + OAM2_LAYER(1),
};

const u16 * CONST_DATA gUnknown_085AAAB0[] =
{
    Sprite_080DA152,
    Sprite_080DA14A,
    Sprite_080DA15A,
    Sprite_080DA142,
    Sprite_080DA13A,
};

// clang-format on

//! FE8U = 0x0804CCCC
void sub_804CCCC(struct SioProc85AAAC4 * proc)
{
    int i;

    int x = (proc->unk_34 + proc->unk_2c) >> 1;
    int y = (proc->unk_38 + proc->unk_30) >> 1;

    proc->unk_2c = x;
    proc->unk_30 = y;

    PutSprite(2, x, y, gUnknown_085AAAA8[proc->unk_3c], 0);
    PutSprite(2, proc->unk_40 + 0x60, 0x30, gUnknown_080DA132, 0);
    PutSprite(2, 0x60, 0x20, gUnknown_085AA9D8, 0);
    PutSprite(4, 0x50, 0x20, Sprite_085AAA50, 0x800);

    for (i = 3; i < 5; i++)
    {
        if ((proc->unk_44 == i) && (i < 3))
        {
            PutSprite(4, 0xc4, 0x48 + i * 0x10, gUnknown_085AAAB0[i], 0x4000);
        }
        else
        {
            PutSprite(4, 0xc4, 0x48 + i * 0x10, gUnknown_085AAAB0[i], 0x8000);
        }
    }

    sub_804CC78();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA Proc_085AAAC4[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804CCCC),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CD90
ProcPtr NewProc_085AAAC4(ProcPtr parent, int x, int y)
{
    struct SioProc85AAAC4 * proc;

    Proc_EndEach(Proc_085AAAC4);
    proc = Proc_Start(Proc_085AAAC4, parent);

    proc->unk_34 = x;
    proc->unk_2c = x;

    proc->unk_38 = y;
    proc->unk_30 = y;

    proc->unk_3c = 0;
    proc->unk_40 = 0;
    proc->unk_44 = 1;

    return proc;
}

// FIXME - param
//! FE8U = 0x0804CDD0
void sub_804CDD0(void * proc, int b, int c, int d, int e, int f)
{
    struct SioProc85AAAC4 * param_1 = proc;

    param_1->unk_34 = b;
    param_1->unk_38 = c;
    param_1->unk_3c = e;
    param_1->unk_40 = d;
    param_1->unk_44 = f;

    return;
}

struct SioProc85AAAE8
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
};

// clang-format off

const u16 Sprite_080DA162[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2D4) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 Sprite_080DA16A[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2D6) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 Sprite_080DA172[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2D8) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 * CONST_DATA gUnknown_085AAADC[] =
{
    Sprite_080DA162,
    Sprite_080DA16A,
    Sprite_080DA172,
};

// clang-format on

//! FE8U = 0x0804CDE8
void sub_804CDE8(struct SioProc85AAAE8 * proc)
{
    int i;

    int y1 = proc->unk_2c;
    int y2 = proc->unk_2a;
    int y = (y1 + y2) * 12;

    proc->unk_2a = proc->unk_2c;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 0x20, 0x30 + i * 0x18, gUnknown_085AAADC[i], 0);
    }

    DisplayFrozenUiHand(0x20, y + 0x30);
    DisplayUiHand(proc->unk_2e, proc->unk_30);

    PutLinkArenaButtonSpriteAt(0xc0, 0x10);

    return;
}

//! FE8U = 0x0804CE5C
void sub_804CE5C(struct SioProc85AAAE8 * proc)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 0x20, 0x30 + i * 0x18, gUnknown_085AAADC[i], 0);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAAE8[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804CDE8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CE8C
ProcPtr sub_804CE8C(ProcPtr parent)
{
    struct SioProc85AAAE8 * proc;

    Proc_EndEach(gUnknown_085AAAE8);
    proc = Proc_Start(gUnknown_085AAAE8, parent);

    proc->unk_2a = 0;

    return proc;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAB00[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804CE5C),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CEB0
void sub_804CEB0(void)
{
    Proc_Start(gUnknown_085AAB00, PROC_TREE_3);
    return;
}

// FIXME
//! FE8U = 0x0804CEC4
void sub_804CEC4(ProcPtr proc, s16 b, s16 c, s16 d)
{
    struct SioProc85AAAE8 * param_1 = proc;

    param_1->unk_2c = b;
    param_1->unk_2e = c;
    param_1->unk_30 = d;

    return;
}

extern u16 gUnknown_085ADE28[];

//! FE8U = 0x0804CECC
void sub_804CECC(int idx)
{
    u16 * ptr = gUnknown_085ADE28;

    if (gUnk_Sio_0203DDDC == 0)
    {
        gPaletteBuffer[0x16E] = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

struct SioProc85AAB18
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 unk_4c;
};

// clang-format off

const u16 gUnknown_080DA17A[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const u16 gUnknown_080DA18E[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(16) + OAM1_HFLIP, OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(48) + OAM1_HFLIP, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16 + OAM1_X(72) + OAM1_HFLIP, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const u16 gUnknown_080DA1A2[] =
{
    3,
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_VFLIP, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(32) + OAM1_VFLIP, OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16 + OAM1_VFLIP, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const u16 gUnknown_080DA1B6[] =
{
    3,
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(16) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(48) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16 + OAM1_X(72) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const s16 gUnknown_080DA1CA[] =
{
    0x0002, 0x0003,
    0x0002, 0x0006,
    0x0006, 0x0009,
    0x0008, 0x000C,
    0x0007, 0x000B,
    0x0007, 0x000B,
    0x0006, 0x000A,
    0x0006, 0x0009,
    0x0005, 0x0008,
    0x0005, 0x0007,
    0x0004, 0x0006,
    0x0004, 0x0005,
    0x0003, 0x0004,
    0x0002, 0x0003,
    0x0001, 0x0001,
    0x0000, 0x0000,
};

// clang-format on

//! FE8U = 0x0804CF04
void sub_804CF04(struct SioProc85AAB18 * proc)
{
    int idx;
    int x;
    int y;
    int r1;

    idx = proc->unk_4c * 2;

    sub_804CECC(proc->unk_4c);

    x = gUnknown_080DA1CA[idx + 1];
    r1 = proc->unk_2c - x;

    y = gUnknown_080DA1CA[idx + 0];

    PutSprite(2, r1, proc->unk_30 - y, gUnknown_080DA17A, 0);
    PutSprite(2, proc->unk_2c + x + 0x10, proc->unk_30 - y, gUnknown_080DA18E, 0);
    PutSprite(2, proc->unk_2c - x, proc->unk_30 + y, gUnknown_080DA1A2, 0);
    PutSprite(2, proc->unk_2c + x + 0x10, proc->unk_30 + y, gUnknown_080DA1B6, 0);

    proc->unk_4c++;

    if (proc->unk_4c == 0xf)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAB18[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804CF04),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CFB8
ProcPtr sub_804CFB8(ProcPtr parent, int b, int c)
{
    struct SioProc85AAB18 * proc = Proc_Start(gUnknown_085AAB18, parent);

    proc->unk_2c = b;
    proc->unk_30 = c;
    proc->unk_4c = 0;

    // return proc; // BUG
}

struct SioProc85AAB48
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ s16 unk_3e;
    /* 40 */ s16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u8 unk_44[2];
};

//! FE8U = 0x0804CFE0
void sub_804CFE0(struct SioProc85AAB48 * proc)
{
    proc->unk_44[1] = 0;
    proc->unk_44[0] = 0;

    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}

// clang-format off

u16 CONST_DATA gUnknown_085AAB30[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x257) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA gUnknown_085AAB38[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, OAM2_CHR(0x257) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA gUnknown_085AAB40[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x25D) + OAM2_LAYER(1) + OAM2_PAL(8),
};

// clang-format on

//! FE8U = 0x0804D01C
void sub_804D01C(struct SioProc85AAB48 * proc)
{
    int i;
    int buf[2];

    int r8 = proc->unk_2c;
    int sl = proc->unk_30 + 8;
    int sp_10 = proc->unk_38 >> 3;
    int sp_14 = 8 - (proc->unk_38 & 7);
    int sp_18 = (proc->unk_3e * proc->unk_42) >> 8;

    if (proc->unk_3c > proc->unk_3d)
    {
        proc->unk_44[0]++;
        proc->unk_44[1]++;

        if (proc->unk_3e < proc->unk_40)
        {
            proc->unk_44[0] += 2;
        }

        if (proc->unk_3e > proc->unk_40)
        {
            proc->unk_44[1] += 2;
        }

        for (i = 0; i < 2; i++)
        {
            if (proc->unk_44[i] > 0x30)
            {
                proc->unk_44[i] = 0;
            }

            buf[i] = (proc->unk_44[i] / 8) % 6;
        }

        if (proc->unk_3e != 0)
        {
            PutSprite(3, r8, sl - 9, gUnknown_085AAB38, buf[0]);
        }

        if (((proc->unk_3e / 16) + proc->unk_3d) < proc->unk_3c)
        {
            PutSprite(3, r8, proc->unk_34 * 8 + sl + 1, gUnknown_085AAB30, buf[1]);
        }

        for (i = 0; i < proc->unk_34; i++)
        {
            PutSprite(2, r8, sl + i * 8, gUnknown_085AAB40, 1);
        }

        for (i = 0; i < sp_10; i++)
        {
            PutSprite(2, r8, (sl + sp_18) + i * 8, gUnknown_085AAB40, 0);
        }

        PutSprite(2, r8, (sl + sp_18) + (sp_10 * 8) - sp_14, gUnknown_085AAB40, 0);
        PutSprite(2, r8, sl - 8, gUnknown_085AAB40, 2);
        PutSprite(2, r8 + 0x2000, proc->unk_34 * 8 + sl - 7, gUnknown_085AAB40, 2);

        proc->unk_40 = proc->unk_3e;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAB48[] =
{
    PROC_YIELD,
    PROC_CALL(sub_804CFE0),
    PROC_REPEAT(sub_804D01C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D1E0
void sub_804D1E0(int a, int b, u8 c, u8 d, u8 e, ProcPtr parent)
{
    struct SioProc85AAB48 * proc;

    Proc_EndEach(gUnknown_085AAB48);
    proc = Proc_Start(gUnknown_085AAB48, parent);

    proc->unk_2c = a;
    proc->unk_30 = b;

    proc->unk_34 = d * 2 - 2;

    proc->unk_3c = c;
    proc->unk_3d = d;
    proc->unk_3e = e;
    proc->unk_40 = e;

    return;
}

//! FE8U = 0x0804D24C
void sub_804D24C(u8 a, s16 b)
{
    struct SioProc85AAB48 * proc = Proc_Find(gUnknown_085AAB48);

    if (proc == NULL)
    {
        return;
    }

    proc->unk_3c = a;
    proc->unk_3e = b & 0xff;
    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}
