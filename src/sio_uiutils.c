#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

/**
 * Contains various sprite/palette utility procs used in
 * the Link Arena menus.
 */

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

    ApplyPalettes(Pal_LinkArenaRankIcons, 0x18, 2);

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

struct LinkArenaTitleBannerProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ u32 chr;
};

extern u8 gUnknown_085B0DE8[];
extern u8 gUnknown_085AAE0C[];

extern u8 gUnknown_085B0F2C[];

//! FE8U = 0x0804C3EC
void LATitleBanner_Init(struct LinkArenaTitleBannerProc * proc)
{
    int a = (proc->unk_58 % 3) * 0x140;
    int b = (proc->unk_58 / 3) * 0x800;

    Decompress(gUnknown_085B0DE8, (void *)(0x6000000 + proc->chr));
    Decompress(gUnknown_085AAE0C, gGenericBuffer);

    sub_804C3AC(gGenericBuffer + (a + b), (void *)(0x06014000), 10, 2);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_085B0F2C, (((u16)(proc->chr >> 1) >> 4)) | 0x1000);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

// clang-format off

u16 CONST_DATA Sprite_LinkArena_MenuTitle[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x200) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x204) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x208) + OAM2_LAYER(1) + OAM2_PAL(8),
};

// clang-format on

//! FE8U = 0x0804C47C
void LATitleBanner_Loop(void)
{
    PutSpriteExt(4, 20, 8, Sprite_LinkArena_MenuTitle, 0);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LinkArenaTitleBanner[] =
{
    PROC_YIELD,
    PROC_CALL(LATitleBanner_Init),
    PROC_REPEAT(LATitleBanner_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C49C
void StartLinkArenaTitleBanner(ProcPtr parent, int size, int chr)
{
    struct LinkArenaTitleBannerProc * proc;

    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    proc = Proc_Start(ProcScr_LinkArenaTitleBanner, parent);

    proc->unk_58 = size;
    proc->chr = chr;

    if (chr == 0)
    {
        proc->chr = 0x5c00;
    }

    proc->unk_2c = (proc->unk_58 % 3) * 0x140;
    proc->unk_30 = (proc->unk_58 / 3) * 0x800;

    return;
}

//! FE8U = 0x0804C4F8
void sub_804C4F8(void)
{
    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    return;
}

//! FE8U = 0x0804C508
void sub_804C508(void)
{
    SetBlendAlpha(16, 4);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x0804C558
void sub_804C558(void)
{
    SetBlendAlpha(16, 4);

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

const u16 Sprite_SioMenu_EditTeams[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x240),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x244),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x248),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_SioMenu_Practice[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x24A),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x24E),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x252),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_SioMenu_LinkedBattle[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x254),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x258),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x25C),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_SioMenu_BattleData[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x280),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x284),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x288),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 Sprite_SioMenu_RuleSettings[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x28A),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x28E),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x292),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x294),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x29C),
};

const u16 * CONST_DATA SpriteArray_SioMenuItems[] =
{
    Sprite_SioMenu_EditTeams,
    Sprite_SioMenu_Practice,
    Sprite_SioMenu_LinkedBattle,
    Sprite_SioMenu_BattleData,
    Sprite_SioMenu_RuleSettings,
};

const u16 gUnknown_080DA09C[] =
{
    OAM2_LAYER(1) + OAM2_PAL(5),
    OAM2_LAYER(1) + OAM2_PAL(4),
    OAM2_PAL(3),
    OAM2_PAL(4),
};

const u16 Sprite_SioMenu_2Teams[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C0) + OAM2_PAL(4),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x2C4) + OAM2_PAL(4),
};

const u16 Sprite_SioMenu_3Teams[] =
{
    3,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x2C0) + OAM2_PAL(4),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(8), OAM2_CHR(0x2C6) + OAM2_PAL(4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x2C2) + OAM2_PAL(4),
};

const u16 Sprite_SioMenu_4Teams[] =
{
    3,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x2C0) + OAM2_PAL(4),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(8), OAM2_CHR(0x2C7) + OAM2_PAL(4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x2C2) + OAM2_PAL(4),
};

const u16 * CONST_DATA SpriteArray_SioMenuTeamCount[] =
{
    Sprite_SioMenu_2Teams,
    Sprite_SioMenu_3Teams,
    Sprite_SioMenu_4Teams,
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
        PAL_OBJ_COLOR(3, 1) = ((color) << 10) + ((color) << 5) + (color);
        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804C5F8
void sub_804C5F8(struct SioProc85AA9C0 * proc)
{
    int oam2 = OAM2_CHR(0x2C8) + OAM2_PAL(8);

    PutSprite(4, proc->xBase, proc->yBase, SpriteArray_SioMenuItems[proc->unk_2f], gUnknown_080DA09C[proc->unk_2e]);

    if (proc->unk_2e == 2)
    {
        sub_804C5A4(proc->unk_30);
    }

    proc->unk_30 = (proc->unk_30 + 1) & 31;

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

            if (proc->unk_34 > 52)
            {
                proc->unk_34--;
            }
        }

        // Put golden arrow sprites for increasing/decreasing team count

        PutSprite(0, 75 + proc->xBase + proc->unk_32, proc->yBase + 8, gObject_8x16, ((proc->unk_36 >> 5) % 6) + oam2);
        PutSprite(
            0, 73 + proc->xBase + proc->unk_34, proc->yBase + 8, gObject_8x16_HFlipped,
            ((proc->unk_38 >> 5) % 6) + oam2);

        PutSpriteExt(0, 80 + proc->xBase, proc->yBase + 9, SpriteArray_SioMenuTeamCount[gLinkArenaSt.unk_05], 0);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085AA9C0[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804C5F8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C758
ProcPtr sub_804C758(ProcPtr parent, u8 xBase, u8 yBase, u8 d, u8 e)
{
    struct SioProc85AA9C0 * proc = Proc_Start(ProcScr_085AA9C0, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;
    proc->unk_2e = e;
    proc->unk_2f = d;
    proc->unk_32 = 0;
    proc->unk_34 = 52;
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
    proc->xBase = x;
    proc->yBase = y;

    return;
}

extern u16 gUnknown_085ADDE8[];

// clang-format off

const u16 Sprite_LinkArena_PressStart[] =
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

        PAL_OBJ_COLOR(8, 14) = ptr[idx];
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

        PAL_OBJ_COLOR(3, 14) = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

// clang-format off

u16 CONST_DATA Sprite_LinkArena_TeamName[] =
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

u16 CONST_DATA Sprite_LinkArena_NameBanner[] =
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
            oam2 = OAM2_LAYER(1);
        }
        else
        {
            oam2 = OAM2_LAYER(3);
        }

        // Put "Team Name" sprite
        PutSprite(0, 88, 32, Sprite_LinkArena_TeamName, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            // Put name banner sprite
            PutSprite(4, proc->unk_30[i] + 6, 32 + i * 24, Sprite_LinkArena_NameBanner, OAM2_PAL(i) + oam2);

            if (proc->unk_3a[i] != 0)
            {
                // Put active selection sprite
                PutSprite(4, proc->unk_30[i] + 6, 32 + i * 24, gUnknown_085AAA5E, oam2);
            }
        }

        if (proc->unk_40 != 0)
        {
            if (gUnk_Sio_0203DDDC == 0)
            {
                PAL_OBJ_COLOR(8, 14) = ((GetGameClock() % 0x40) / 4)[gUnknown_08A1BD40];
                EnablePaletteSync();
            }

            if (proc->unk_40 < 0x100)
            {
                proc->unk_40 += 0x10;
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

            // Put "Press Start" sprite
            PutSprite(4, 120, 0, Sprite_LinkArena_PressStart, OAM2_PAL(8));
        }

        sub_804C83C();
    }
    else
    {
        // Put "Team Name" sprite
        PutSprite(0xb, 88, 32, Sprite_LinkArena_TeamName, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            // Put side menu item sprite
            PutSprite(2, proc->unk_30[i], 48 + i * 16, gUnknown_085AAA48[proc->unk_3a[i]], 0);

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
        oam2 = OAM2_LAYER(1);
    }
    else
    {
        oam2 = OAM2_LAYER(2);
    }

    if (proc->unk_44 != 0)
    {
        PutLinkArenaButtonSpriteAt(192, 16);
    }

    if (proc->unk_48 >= 0)
    {
        // Put team row highlight indicator sprite
        PutSprite(4, 80, proc->unk_48 + 8, gUnknown_085AAA0E, oam2);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085AAA78[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804C894),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CAEC
ProcPtr sub_804CAEC(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf)
{
    struct SioProc85AAA78 * proc;
    int i;

    Proc_EndEach(ProcScr_085AAA78);
    proc = Proc_Start(ProcScr_085AAA78, parent);

    proc->unk_2c = numActiveOptions;
    proc->unk_44 = 1;
    proc->unk_40 = 0;
    proc->unk_48 = -1;

    for (i = 0; i < 5; i++)
    {
        proc->unk_3a[i] = buf[i];
        proc->unk_30[i] = -8;
    }

    StartLinkArenaMenuScrollBar(225, 40, parent->unk_38, 6, parent->yBg1 + 40, proc);
    PutLinkArenaTeamSprites(152, 40 - parent->unk_48 * 16, 136, 39, parent->unk_38, proc);

    return proc;
}

struct LATeamSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ int yMin;
    /* 38 */ int yMax;
    /* 3C */ int numTeams;
};

//! FE8U = 0x0804CB94
void LATeamSpriteDraw_Loop(struct LATeamSpriteDrawProc * proc)
{
    int i;
    int j;

    for (i = 0; i < proc->numTeams; i++)
    {
        int y = proc->yBase + i * 16;

        if (y >= proc->yMax)
        {
            continue;
        }

        if (y <= proc->yMin)
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

            sub_8027E4C(4, proc->xBase + j * 14, y, OAM2_LAYER(1), unit);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LinkArenaTeamSpriteDraw[] =
{
    PROC_YIELD,
    PROC_REPEAT(LATeamSpriteDraw_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CC14
void PutLinkArenaTeamSprites(int x, int y, int yMax, int yMin, int count, ProcPtr parent)
{
    struct LATeamSpriteDrawProc * proc;

    Proc_EndEach(ProcScr_LinkArenaTeamSpriteDraw);
    proc = Proc_Start(ProcScr_LinkArenaTeamSpriteDraw, parent);

    proc->numTeams = count;

    proc->xBase = x;
    proc->yBase = y;

    proc->yMin = yMin;
    proc->yMax = yMax;

    return;
}

//! FE8U = 0x0804CC5C
void ScrollMultiArenaTeamSprites(int amount)
{
    struct LATeamSpriteDrawProc * proc = Proc_Find(ProcScr_LinkArenaTeamSpriteDraw);
    proc->yBase += amount;

    return;
}

extern u16 gUnknown_085ADE28[];

//! FE8U = 0x0804CC78
void UpdateNameEntrySpriteGlow(void)
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
            PAL_OBJ_COLOR(9, 11 + i) = ptr[(r2 + i) & 0xf];
        }

        EnablePaletteSync();
    }

    return;
}

struct NameEntrySpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xCurrent;
    /* 30 */ int yCurrent;
    /* 34 */ int xNew;
    /* 38 */ int yNew;
    /* 3C */ int cursorKind;
    /* 40 */ int xPointer;
    /* 44 */ int unk_44; // maybe mode (Katakana/Hiragana)?
};

// clang-format off

const u16 Sprite_NameEntry_CursorSmall[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x251) + OAM2_LAYER(1) + OAM2_PAL(9),
};

const u16 Sprite_NameEntry_CursorLarge[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x253) + OAM2_LAYER(1) + OAM2_PAL(9),
};

const u16 * CONST_DATA SpriteArray_NameEntryCursor[] =
{
    Sprite_NameEntry_CursorSmall,
    Sprite_NameEntry_CursorLarge,
};

// Sprite for the "next letter" position indicator

const u16 Sprite_NameEntry_PositionIndicator[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x29A) + OAM2_LAYER(2) + OAM2_PAL(9),
};

const u16 Sprite_NameEntry_OKIcon[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C0) + OAM2_LAYER(1),
};

const u16 Sprite_NameEntry_DeleteIcon[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C4) + OAM2_LAYER(1),
};

const u16 Sprite_NameEntry_KatakanaIcon[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2C8) + OAM2_LAYER(1),
};

const u16 Sprite_NameEntry_HiraganaIcon[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2CC) + OAM2_LAYER(1),
};

const u16 Sprite_NameEntry_080DA15A[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2D0) + OAM2_LAYER(1),
};

const u16 * CONST_DATA SpriteArray_NameEntryIcons[] =
{
    Sprite_NameEntry_HiraganaIcon,
    Sprite_NameEntry_KatakanaIcon,
    Sprite_NameEntry_080DA15A,
    Sprite_NameEntry_DeleteIcon,
    Sprite_NameEntry_OKIcon,
};

// clang-format on

//! FE8U = 0x0804CCCC
void NameEntrySpriteDraw_Loop(struct NameEntrySpriteDrawProc * proc)
{
    int i;

    int x = (proc->xNew + proc->xCurrent) >> 1;
    int y = (proc->yNew + proc->yCurrent) >> 1;

    proc->xCurrent = x;
    proc->yCurrent = y;

    PutSprite(2, x, y, SpriteArray_NameEntryCursor[proc->cursorKind], 0);
    PutSprite(2, 96 + proc->xPointer, 48, Sprite_NameEntry_PositionIndicator, 0);
    PutSprite(2, 96, 32, Sprite_LinkArena_TeamName, 0);
    PutSprite(4, 80, 32, Sprite_LinkArena_NameBanner, OAM2_LAYER(2));

    for (i = 3; i < 5; i++)
    {
        if ((proc->unk_44 == i) && (i < 3))
        {
            PutSprite(4, 196, 72 + i * 16, SpriteArray_NameEntryIcons[i], OAM2_PAL(4));
        }
        else
        {
            PutSprite(4, 196, 72 + i * 16, SpriteArray_NameEntryIcons[i], OAM2_PAL(8));
        }
    }

    UpdateNameEntrySpriteGlow();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_NameEntrySpriteDraw[] =
{
    PROC_YIELD,
    PROC_REPEAT(NameEntrySpriteDraw_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CD90
ProcPtr StartNameEntrySpriteDraw(ProcPtr parent, int x, int y)
{
    struct NameEntrySpriteDrawProc * proc;

    Proc_EndEach(ProcScr_NameEntrySpriteDraw);
    proc = Proc_Start(ProcScr_NameEntrySpriteDraw, parent);

    proc->xNew = x;
    proc->xCurrent = x;

    proc->yNew = y;
    proc->yCurrent = y;

    proc->cursorKind = 0;
    proc->xPointer = 0;
    proc->unk_44 = 1;

    return proc;
}

// FIXME - param
//! FE8U = 0x0804CDD0
void UpdateNameEntrySpriteDraw(void * proc, int xNew, int yNew, int xPointer, int cursorKind, int f)
{
    struct NameEntrySpriteDrawProc * param_1 = proc;

    param_1->xNew = xNew;
    param_1->yNew = yNew;
    param_1->cursorKind = cursorKind;
    param_1->xPointer = xPointer;
    param_1->unk_44 = f;

    return;
}

struct RuleSettingSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 yPrevious;
    /* 2C */ s16 yNew;
    /* 2E */ s16 xOption;
    /* 30 */ s16 yOption;
};

// clang-format off

const u16 Sprite_RuleSettings_HideUnitsIcon[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2D4) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 Sprite_RuleSettings_VictoryCondIcon[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2D6) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 Sprite_RuleSettings_AutoWeaponIcon[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2D8) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 * CONST_DATA SpriteArray_RuleSettingIcons[] =
{
    Sprite_RuleSettings_HideUnitsIcon,
    Sprite_RuleSettings_VictoryCondIcon,
    Sprite_RuleSettings_AutoWeaponIcon,
};

// clang-format on

//! FE8U = 0x0804CDE8
void RuleSettingSprites_Interactive_Loop(struct RuleSettingSpriteDrawProc * proc)
{
    int i;

    int y1 = proc->yNew;
    int y2 = proc->yPrevious;
    int y = (y1 + y2) * 12;

    proc->yPrevious = proc->yNew;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 32, 48 + i * 24, SpriteArray_RuleSettingIcons[i], 0);
    }

    DisplayFrozenUiHand(32, y + 48);
    DisplayUiHand(proc->xOption, proc->yOption);

    PutLinkArenaButtonSpriteAt(192, 16);

    return;
}

//! FE8U = 0x0804CE5C
void RuleSettingSprites_Static_Loop(struct RuleSettingSpriteDrawProc * proc)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 32, 48 + i * 24, SpriteArray_RuleSettingIcons[i], 0);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_RuleSettingSpriteDraw_Interactive[] =
{
    PROC_YIELD,
    PROC_REPEAT(RuleSettingSprites_Interactive_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CE8C
ProcPtr StartRuleSettingSpriteDrawInteractive(ProcPtr parent)
{
    struct RuleSettingSpriteDrawProc * proc;

    Proc_EndEach(ProcScr_RuleSettingSpriteDraw_Interactive);
    proc = Proc_Start(ProcScr_RuleSettingSpriteDraw_Interactive, parent);

    proc->yPrevious = 0;

    return proc;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_RuleSettingSpriteDraw_Static[] =
{
    PROC_YIELD,
    PROC_REPEAT(RuleSettingSprites_Static_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CEB0
void StartRuleSettingSpriteDrawStatic(void)
{
    Proc_Start(ProcScr_RuleSettingSpriteDraw_Static, PROC_TREE_3);
    return;
}

// FIXME
//! FE8U = 0x0804CEC4
void UpdateRuleSettingSprites(ProcPtr proc, s16 b, s16 xOption, s16 yOption)
{
    struct RuleSettingSpriteDrawProc * param_1 = proc;

    param_1->yNew = b;
    param_1->xOption = xOption;
    param_1->yOption = yOption;

    return;
}

extern u16 gUnknown_085ADE28[];

//! FE8U = 0x0804CECC
void UpdateSioMenuBurstGlow(int idx)
{
    u16 * ptr = gUnknown_085ADE28;

    if (gUnk_Sio_0203DDDC == 0)
    {
        PAL_OBJ_COLOR(6, 14) = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

struct SioMenuBurstFxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 glowPalIdx;
};

// clang-format off

const u16 Sprite_SioMenuBurst_TopLeft[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const u16 Sprite_SioMenuBurst_TopRight[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(16) + OAM1_HFLIP, OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(48) + OAM1_HFLIP, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16 + OAM1_X(72) + OAM1_HFLIP, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const u16 Sprite_SioMenuBurst_BottomLeft[] =
{
    3,
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_VFLIP, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(32) + OAM1_VFLIP, OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16 + OAM1_VFLIP, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const u16 Sprite_SioMenuBurst_BottomRight[] =
{
    3,
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(16) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x2CF) + OAM2_PAL(6),
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(48) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x2CE) + OAM2_PAL(6),
    OAM0_SHAPE_8x16 + OAM0_Y(8), OAM1_SIZE_8x16 + OAM1_X(72) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x2D3) + OAM2_PAL(6),
};

const s16 gUnknown_080DA1CA[] =
{
    2, 3,
    2, 6,
    6, 9,
    8, 12,
    7, 11,
    7, 11,
    6, 10,
    6, 9,
    5, 8,
    5, 7,
    4, 6,
    4, 5,
    3, 4,
    2, 3,
    1, 1,
    0, 0,
};

// clang-format on

//! FE8U = 0x0804CF04
void SioMenuBurstFx_Loop(struct SioMenuBurstFxProc * proc)
{
    int idx;
    int x;
    int y;
    int r1;

    idx = proc->glowPalIdx * 2;

    UpdateSioMenuBurstGlow(proc->glowPalIdx);

    x = gUnknown_080DA1CA[idx + 1];
    r1 = proc->xBase - x;

    y = gUnknown_080DA1CA[idx + 0];

    PutSprite(2, r1, proc->yBase - y, Sprite_SioMenuBurst_TopLeft, 0);
    PutSprite(2, proc->xBase + x + 16, proc->yBase - y, Sprite_SioMenuBurst_TopRight, 0);
    PutSprite(2, proc->xBase - x, proc->yBase + y, Sprite_SioMenuBurst_BottomLeft, 0);
    PutSprite(2, proc->xBase + x + 16, proc->yBase + y, Sprite_SioMenuBurst_BottomRight, 0);

    proc->glowPalIdx++;

    if (proc->glowPalIdx == 15)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SioMenuBurstFx[] =
{
    PROC_YIELD,
    PROC_REPEAT(SioMenuBurstFx_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CFB8
ProcPtr StartSioMenuBurstFx(ProcPtr parent, int x, int y)
{
    struct SioMenuBurstFxProc * proc = Proc_Start(ProcScr_SioMenuBurstFx, parent);

    proc->xBase = x;
    proc->yBase = y;
    proc->glowPalIdx = 0;

    // return proc; // BUG
}

struct LAMenuScrollBarProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ s16 unk_3e;
    /* 40 */ s16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u8 oam2Arrows[2];
};

//! FE8U = 0x0804CFE0
void LinkArenaMenuScroll_Init(struct LAMenuScrollBarProc * proc)
{
    proc->oam2Arrows[1] = 0;
    proc->oam2Arrows[0] = 0;

    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}

// clang-format off

u16 CONST_DATA Sprite_LAMenuScrollBar_UpArrow[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x257) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA Sprite_LAMenuScrollBar_DownArrow[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, OAM2_CHR(0x257) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA Sprite_LinkArenaMenuScrollBar[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x25D) + OAM2_LAYER(1) + OAM2_PAL(8),
};

// clang-format on

//! FE8U = 0x0804D01C
void LinkArenaMenuScroll_Loop(struct LAMenuScrollBarProc * proc)
{
    int i;
    int buf[2];

    int r8 = proc->xBase;
    int sl = proc->yBase + 8;
    int sp_10 = proc->unk_38 >> 3;
    int sp_14 = 8 - (proc->unk_38 & 7);
    int sp_18 = (proc->unk_3e * proc->unk_42) >> 8;

    if (proc->unk_3c > proc->unk_3d)
    {
        proc->oam2Arrows[0]++;
        proc->oam2Arrows[1]++;

        if (proc->unk_3e < proc->unk_40)
        {
            proc->oam2Arrows[0] += 2;
        }

        if (proc->unk_3e > proc->unk_40)
        {
            proc->oam2Arrows[1] += 2;
        }

        for (i = 0; i < 2; i++)
        {
            if (proc->oam2Arrows[i] > 48)
            {
                proc->oam2Arrows[i] = 0;
            }

            buf[i] = (proc->oam2Arrows[i] / 8) % 6;
        }

        if (proc->unk_3e != 0)
        {
            PutSprite(3, r8, sl - 9, Sprite_LAMenuScrollBar_DownArrow, buf[0]);
        }

        if (((proc->unk_3e / 16) + proc->unk_3d) < proc->unk_3c)
        {
            PutSprite(3, r8, proc->unk_34 * 8 + sl + 1, Sprite_LAMenuScrollBar_UpArrow, buf[1]);
        }

        // Put the "container" of the scroll bar

        for (i = 0; i < proc->unk_34; i++)
        {
            PutSprite(2, r8, sl + i * 8, Sprite_LinkArenaMenuScrollBar, 1);
        }

        // Put the active scroll bar segments

        for (i = 0; i < sp_10; i++)
        {
            PutSprite(2, r8, (sl + sp_18) + i * 8, Sprite_LinkArenaMenuScrollBar, 0);
        }

        // Put the "cap" of the scroll bar

        PutSprite(2, r8, (sl + sp_18) + (sp_10 * 8) - sp_14, Sprite_LinkArenaMenuScrollBar, 0);
        PutSprite(2, r8, sl - 8, Sprite_LinkArenaMenuScrollBar, 2);
        PutSprite(2, r8 + OAM1_VFLIP, proc->unk_34 * 8 + sl - 7, Sprite_LinkArenaMenuScrollBar, 2);

        proc->unk_40 = proc->unk_3e;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LinkArenaMenuScrollBar[] =
{
    PROC_YIELD,
    PROC_CALL(LinkArenaMenuScroll_Init),
    PROC_REPEAT(LinkArenaMenuScroll_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D1E0
void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent)
{
    struct LAMenuScrollBarProc * proc;

    Proc_EndEach(ProcScr_LinkArenaMenuScrollBar);
    proc = Proc_Start(ProcScr_LinkArenaMenuScrollBar, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;

    proc->unk_34 = d * 2 - 2;

    proc->unk_3c = c;
    proc->unk_3d = d;
    proc->unk_3e = e;
    proc->unk_40 = e;

    return;
}

//! FE8U = 0x0804D24C
void UpdateLinkArenaMenuScrollBar(u8 a, s16 b)
{
    struct LAMenuScrollBarProc * proc = Proc_Find(ProcScr_LinkArenaMenuScrollBar);

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

//! FE8U = 0x0804D2A4
void sub_804D2A4(void)
{
    // clang-format off
    u8 * gUnknown_080DA20C[] =
    {
        gUnknown_085AEDD4,
        gUnknown_085AEE90,
        gUnknown_085AEF54,
        gUnknown_085AF02C,
    };

    u16 * gUnknown_080DA21C[] =
    {
        gUnknown_085AF0F0,
        gUnknown_085AF130,
        gUnknown_085AF110,
        gUnknown_085AF150,
    };

    u16 * gUnknown_080DA22C[] =
    {
        Pal_PhaseChangePlayer,
        Pal_PhaseChangeOther,
        Pal_PhaseChangeEnemy,
        Pal_085A06B8,
    };
    // clang-format on

    Decompress(Img_PhaseChangeUnk, (void *)(0x06014000));
    Decompress(Img_PhaseChangeSquares, (void *)(0x06002000));
    Decompress(gUnknown_085AE7EC, (void *)(0x06002800));

    Decompress(gUnknown_080DA20C[gPlaySt.faction], gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void *)(0x06002980), 3, 3);

    CopyToPaletteBuffer(gUnknown_080DA21C[gPlaySt.faction], 0xa0, 0x20);
    CopyToPaletteBuffer(gUnknown_080DA22C[gPlaySt.faction], 0x240, 0x20);

    gUnknown_03001860 = gPlaySt.faction;
    gPlaySt.faction = FACTION_BLUE;

    return;
}

//! FE8U = 0x0804D37C
void sub_804D37C(void)
{
    gPlaySt.faction = gUnknown_03001860;

    SetWinEnable(0, 0, 0);
    SetDefaultColorEffects();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    return;
}

//! FE8U = 0x0804D3DC
void StopBGM2(void)
{
    StartBgm(0x34, &gMPlayInfo_BGM2);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AAB68[] =
{
    PROC_CALL(sub_804D2A4),
    PROC_YIELD,

    PROC_START_CHILD(gProcScr_PhaseIntroText),
    PROC_START_CHILD(gProcScr_PhaseIntroSquares),
    PROC_START_CHILD(gProcScr_PhaseIntroBlendBox),

    PROC_CALL(PhaseIntro_InitDisp),
    PROC_REPEAT(PhaseIntro_WaitForEnd),

    PROC_CALL(StopBGM2),
    PROC_CALL(sub_804D37C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D3F0
void sub_804D3F0(struct Unit * unit, int itemSlot)
{
    u16 item = unit->items[itemSlot];

    if (item != 0)
    {
        unit->items[itemSlot] = item | 0xff00;
    }

    return;
}

//! FE8U = 0x0804D40C
void sub_804D40C(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        sub_804D3F0(unit, i);
    }

    return;
}

//! FE8U = 0x0804D428
void sub_804D428(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_0203DDDC == 0)
    {
        idx = (GetGameClock() % 0x20);
        idx = idx >> 1;

        for (i = 0; i < 0xf; i++)
        {
            gPaletteBuffer[0x191 + i] = ptr[(idx + i) & 0xf];
        }

        EnablePaletteSync();
    }

    return;
}

struct SioProc85AABC8
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u16 unk_3c[4];
};

// clang-format off

const u16 Sprite_080DA23C[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16, OAM2_CHR(0x300) + OAM2_LAYER(1) + OAM2_PAL(3),
};

const u16 Sprite_080DA244[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(1), OAM2_CHR(0x304) + OAM2_LAYER(1) + OAM2_PAL(4),
};

const u16 Sprite_080DA24C[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(2), OAM2_CHR(0x308) + OAM2_LAYER(1) + OAM2_PAL(5),
};

const u16 Sprite_080DA254[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(3), OAM2_CHR(0x30C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

const u16 * CONST_DATA gUnknown_085AABB8[] =
{
    Sprite_080DA23C,
    Sprite_080DA244,
    Sprite_080DA24C,
    Sprite_080DA254,
};

const u16 gUnknown_080DA25C[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x348) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(32), OAM2_CHR(0x34C) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 gUnknown_080DA26A[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x34D) + OAM2_LAYER(1) + OAM2_PAL(9),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x351) + OAM2_LAYER(1) + OAM2_PAL(9),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(64), OAM2_CHR(0x355) + OAM2_LAYER(1) + OAM2_PAL(9),
};

// clang-format on

//! FE8U = 0x0804D47C
void sub_804D47C(struct SioProc85AABC8 * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        PutSprite(4, proc->unk_2c, proc->unk_30 + i * 0x18, Sprite_LinkArena_NameBanner, ((i & 0xf) << 12) + 0x800);

        // clang-format off
        SetObjAffine(
            i,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, 0x100),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, 0x100)
        );
        // clang-format on

        if (proc->unk_38 != -1)
        {
            if (proc->unk_38 != i)
            {
                if (proc->unk_3c[i] > 0x100)
                {
                    proc->unk_3c[i] -= 8;
                }

                if (proc->unk_38 == i)
                {
                    goto _0804D544;
                }
            }
            else
            _0804D544:
                if (proc->unk_3c[i] <= 0x14F)
                {
                    proc->unk_3c[i] += 8;
                }

            // clang-format off
            SetObjAffine(
                i,
                Div(+COS(0) * 16, proc->unk_3c[i]),
                Div(-SIN(0) * 16, proc->unk_3c[i]),
                Div(+SIN(0) * 16, proc->unk_3c[i]),
                Div(+COS(0) * 16, proc->unk_3c[i])
            );
            // clang-format on
        }

        PutSprite(4, proc->unk_2c - 0x30, proc->unk_30 + i * 0x18, gUnknown_085AABB8[i], 0);
    }

    if (proc->unk_34 != -1)
    {
        PutSprite(4, proc->unk_2c - 0x48, proc->unk_30 + proc->unk_34 * 0x18 + 8, gUnknown_080DA25C, 0);
        PutSprite(4, proc->unk_2c - 0x48, proc->unk_30 + proc->unk_34 * 0x18 + 0x12, gUnknown_080DA26A, 0);
        sub_804D428();
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AABC8[] =
{
    PROC_REPEAT(sub_804D47C),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D664
ProcPtr sub_804D664(int x, int y, ProcPtr parent)
{
    struct SioProc85AABC8 * proc;
    int i;

    Proc_EndEach(gUnknown_085AABC8);
    proc = Proc_Start(gUnknown_085AABC8, parent);

    proc->unk_2c = x;
    proc->unk_30 = y;
    proc->unk_34 = -1;
    proc->unk_38 = -1;

    for (i = 0; i < 4; i++)
    {
        proc->unk_3c[i] = 0x100;
    }

    return proc;
}

//! FE8U = 0x0804D6B4
void sub_804D6B4(void)
{
    Proc_EndEach(gUnknown_085AABC8);
    return;
}

//! FE8U = 0x0804D6C4
ProcPtr sub_804D6C4(void)
{
    return Proc_Find(gUnknown_085AABC8);
}

//! FE8U = 0x0804D6D4
void sub_804D6D4(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_0203DDDC == 0)
    {
        idx = GetGameClock() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 0xf; i++)
        {
            gPaletteBuffer[0x21 + i] = ptr[(idx + i) & 0xf];
        }

        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804D724
void sub_804D724(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_0203DDDC == 0)
    {
        idx = GetGameClock() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 0xf; i++)
        {
            gPaletteBuffer[0x131 + i] = ptr[(idx + i) & 0xf];
        }

        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804D778
void sub_804D778(void)
{
    SetBlendConfig(1, 8, 0xc, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 0);

    return;
}

struct SioProc85AABD8
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
};

// clang-format off

const u16 gUnknown_080DA27E[] =
{
    8,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16, OAM2_CHR(0x300) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x304) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x308) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_8x16 + OAM0_BLEND, OAM1_SIZE_8x16 + OAM1_X(96), OAM2_CHR(0x30C) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_8x16 + OAM0_BLEND, OAM1_SIZE_8x16 + OAM1_X(104) + OAM1_HFLIP, OAM2_CHR(0x30C) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(112) + OAM1_HFLIP, OAM2_CHR(0x308) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(144) + OAM1_HFLIP, OAM2_CHR(0x304) + OAM2_LAYER(2) + OAM2_PAL(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(176) + OAM1_HFLIP, OAM2_CHR(0x300) + OAM2_LAYER(2) + OAM2_PAL(3),
};

// clang-format on

//! FE8U = 0x0804D7B0
void sub_804D7B0(struct SioProc85AABD8 * proc)
{
    if (proc->unk_30 > 0x1e && proc->unk_30 < 0x99)
    {
        PutSprite(4, proc->unk_2c, proc->unk_30, gUnknown_080DA27E, 0);
        sub_804D724();
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085AABD8[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_804D7B0),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D7DC
ProcPtr sub_804D7DC(int x, int y, ProcPtr parent)
{
    struct SioProc85AABD8 * proc;

    Proc_EndEach(gUnknown_085AABD8);
    proc = Proc_Start(gUnknown_085AABD8, parent);

    proc->unk_2c = x;
    proc->unk_30 = y;

    return proc;
}

//! FE8U = 0x0804D80C
void sub_804D80C(void)
{
    Decompress(gGfx_SupportMenu, (void *)(0x06016800));
    CopyToPaletteBuffer(gPal_SupportMenu, 0x240, 0x20);
    return;
}

// clang-format off

const u16 gUnknown_080DA2B0[] =
{
    6,
    OAM0_SHAPE_32x16 + OAM0_Y(4), OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16 + OAM0_Y(4), OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16 + OAM0_Y(4), OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_32x8 + OAM0_Y(20), OAM1_SIZE_32x8, OAM2_CHR(0xC),
    OAM0_SHAPE_32x8 + OAM0_Y(20), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8 + OAM0_Y(20), OAM1_SIZE_32x8 + OAM1_X(64), OAM2_CHR(0x14),
};

// clang-format on

//! FE8U = 0x0804D834
void sub_804D834(int x, int y)
{
    PutSprite(1, x, y, gUnknown_080DA2B0, OAM2_CHR(0x340) + OAM2_LAYER(1) + OAM2_PAL(2));
    return;
}
