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

#include "constants/songs.h"

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
void Nop_SioUiutils_1(int unusedA, int unusedB)
{
    return;
}

//! FE8U = 0x0804C3A4
void Nop_SioUiutils_2(int unused)
{
    return;
}

//! FE8U = 0x0804C3A8
void Nop_SioUiutils_0(void)
{
    return;
}

//! FE8U = 0x0804C3AC
void CopyLinkArenaTileRows(u8 * src, u8 * dst, int c, int d)
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

//! FE8U = 0x0804C3EC
void LATitleBanner_Init(struct LinkArenaTitleBannerProc * proc)
{
    int a = (proc->unk_58 % 3) * 0x140;
    int b = (proc->unk_58 / 3) * 0x800;

    Decompress(Img_LinkArenaTitleBanner, (void *)(VRAM + proc->chr));
    Decompress(Img_LinkArenaMenuTitle, gGenericBuffer);

    CopyLinkArenaTileRows(gGenericBuffer + (a + b), OBJ_CHR_ADDR(0x200), 10, 2);

    CallARM_FillTileRect(gBG2TilemapBuffer, Tsa_LinkArenaTitleBanner, (((u16)(proc->chr >> 1) >> 4)) | 0x1000);
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
        proc->chr = 0x2E0 * CHR_SIZE;
    }

    proc->unk_2c = (proc->unk_58 % 3) * 0x140;
    proc->unk_30 = (proc->unk_58 / 3) * 0x800;

    return;
}

//! FE8U = 0x0804C4F8
void EndLinkArenaTitleBanner(void)
{
    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    return;
}

//! FE8U = 0x0804C508
void SetLinkArenaUiBlendAndWindowOff(void)
{
    SetBlendAlpha(16, 4);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x0804C558
void SetLinkArenaUiBlend(void)
{
    SetBlendAlpha(16, 4);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

//! FE8U = 0x0804C590
void ResetLinkArenaUiBlend(void)
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

const u16 gSioUiutils_0[] =
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
void UpdateSioMenuSelectedGlow(u8 idx)
{
    // clang-format off
    const u8 sioMenuItemGlowLut[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };
    // clang-format on

    if (gUnk_Sio_22 == 0)
    {
        int color = sioMenuItemGlowLut[idx] + 0x10;
        PAL_OBJ_COLOR(3, 1) = ((color) << 10) + ((color) << 5) + (color);
        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804C5F8
void SioMenuItem_Loop(struct SioMenuItemProc * proc)
{
    int oam2 = OAM2_CHR(0x2C8) + OAM2_PAL(8);

    PutSprite(4, proc->xBase, proc->yBase, SpriteArray_SioMenuItems[proc->index], gSioUiutils_0[proc->state]);

    if (proc->state == 2)
    {
        UpdateSioMenuSelectedGlow(proc->glowFrame);
    }

    proc->glowFrame = (proc->glowFrame + 1) & 31;

    if (proc->state == 2 && proc->index == 1)
    {
        proc->leftArrowAnmCnt += proc->leftArrowSpeed;
        proc->rightArrowAnmCnt += proc->rightArrowSpeed;

        if (proc->leftArrowSpeed > 4)
        {
            proc->leftArrowSpeed--;
        }

        if (proc->rightArrowSpeed > 4)
        {
            proc->rightArrowSpeed--;
        }

        if ((GetGameClock() & 3) == 0)
        {
            if (proc->xLeftArrow < 0)
            {
                proc->xLeftArrow++;
            }

            if (proc->xRightArrow > 52)
            {
                proc->xRightArrow--;
            }
        }

        // Put golden arrow sprites for increasing/decreasing team count

        PutSprite(0, 75 + proc->xBase + proc->xLeftArrow, proc->yBase + 8, gObject_8x16, ((proc->leftArrowAnmCnt >> 5) % 6) + oam2);
        PutSprite(
            0, 73 + proc->xBase + proc->xRightArrow, proc->yBase + 8, gObject_8x16_HFlipped,
            ((proc->rightArrowAnmCnt >> 5) % 6) + oam2);

        PutSpriteExt(0, 80 + proc->xBase, proc->yBase + 9, SpriteArray_SioMenuTeamCount[gLinkArenaSt.unk_05], 0);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SioMenuItem[] =
{
    PROC_YIELD,
    PROC_REPEAT(SioMenuItem_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C758
ProcPtr StartSioMenuItem(ProcPtr parent, u8 xBase, u8 yBase, u8 index, u8 state)
{
    struct SioMenuItemProc * proc = Proc_Start(ProcScr_SioMenuItem, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;
    proc->state = state;
    proc->index = index;
    proc->xLeftArrow = 0;
    proc->xRightArrow = 52;
    proc->rightArrowAnmCnt = 0;
    proc->leftArrowAnmCnt = 0;
    proc->rightArrowSpeed = 4;
    proc->leftArrowSpeed = 4;
    proc->unk_3e = 0;
    proc->glowFrame = 0;

    return proc;
}

//! FE8U = 0x0804C7C8
void SioMenuItem_SetArrowConfig(struct SioMenuItemProc * proc, int xLeft, int xRight, int leftSpeed, int rightSpeed)
{
    proc->xLeftArrow = xLeft;
    proc->xRightArrow = xRight;
    proc->leftArrowSpeed = leftSpeed;
    proc->rightArrowSpeed = rightSpeed;

    return;
}

//! FE8U = 0x0804C7DC
void SioMenuItem_SetPosition(struct SioMenuItemProc * proc, s16 x, s16 y)
{
    proc->xBase = x;
    proc->yBase = y;

    return;
}

// clang-format off

const u16 Sprite_LinkArena_PressStart[] =
{
    1,
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32, OAM2_CHR(0x300) + OAM2_LAYER(1),
};

// clang-format on

//! FE8U = 0x0804C7E4
void UpdateLinkArenaSideMenuGlow(void)
{
    u16 * ptr = Pal_SioSideMenuGlow;

    // clang-format off
    const u8 sLinkArenaSideMenuGlowPalIndexLut[] =
    {
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
    };
    // clang-format on

    if (gUnk_Sio_22 == 0)
    {
        int a = (GetGameClock() % 0x40);
        int idx = sLinkArenaSideMenuGlowPalIndexLut[a / 2];

        PAL_OBJ_COLOR(8, 14) = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804C83C
void UpdateLinkArenaNameBannerGlow(void)
{
    u16 * ptr = Pal_SioNameBannerGlow;

    // clang-format off
    const u8 sioMenuItemGlowLut[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };
    // clang-format on

    if (gUnk_Sio_22 == 0)
    {
        int a = (GetGameClock() % 0x40);
        int idx = sioMenuItemGlowLut[a / 2];

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

u16 CONST_DATA Sprite_SioUiutils_3[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x27B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x27B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x27F) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA Sprite_SioUiutils_4[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x29B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x29B) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x29F) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 CONST_DATA gSioUiutils_2[] =
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

u16 * CONST_DATA gSioUiutils_3[] =
{
    Sprite_SioUiutils_3,
    Sprite_SioUiutils_4,
};

u16 CONST_DATA Sprite_LinkArena_NameBanner[] =
{
    2,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x240) + OAM2_PAL(3),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x248) + OAM2_PAL(3),
};

u16 CONST_DATA gSioUiutils_4[] =
{
    4,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x24C) + OAM2_PAL(3),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x290) + OAM2_PAL(3),
    OAM0_SHAPE_32x8 + OAM0_Y(24), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2AD) + OAM2_PAL(3),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64) + OAM1_HFLIP, OAM2_CHR(0x24C) + OAM2_PAL(3),
};

// clang-format on

extern u16 Pal_SioPressStartGlow[];

//! FE8U = 0x0804C894
void SioTeamMenuSpriteDraw_Loop(struct SioProc85AAA78 * proc)
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
                PutSprite(4, proc->unk_30[i] + 6, 32 + i * 24, gSioUiutils_4, oam2);
            }
        }

        if (proc->unk_40 != 0)
        {
            if (gUnk_Sio_22 == 0)
            {
                PAL_OBJ_COLOR(8, 14) = ((GetGameClock() % 0x40) / 4)[Pal_SioPressStartGlow];
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

        UpdateLinkArenaNameBannerGlow();
    }
    else
    {
        // Put "Team Name" sprite
        PutSprite(0xb, 88, 32, Sprite_LinkArena_TeamName, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            // Put side menu item sprite
            PutSprite(2, proc->unk_30[i], 48 + i * 16, gSioUiutils_3[proc->unk_3a[i]], 0);

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

        UpdateLinkArenaSideMenuGlow();
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
        PutSprite(4, 80, proc->unk_48 + 8, gSioUiutils_2, oam2);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SioUiutils_0[] =
{
    PROC_YIELD,
    PROC_REPEAT(SioTeamMenuSpriteDraw_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804CAEC
ProcPtr StartSioTeamMenuSpriteDraw(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf)
{
    struct SioProc85AAA78 * proc;
    int i;

    Proc_EndEach(ProcScr_SioUiutils_0);
    proc = Proc_Start(ProcScr_SioUiutils_0, parent);

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

            PutUiUnitSprite(4, proc->xBase + j * 14, y, OAM2_LAYER(1), unit);
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

//! FE8U = 0x0804CC78
void UpdateNameEntrySpriteGlow(void)
{
    int r2;
    int i;

    u16 * ptr = Pal_SioNameEntryGlow;

    if (gUnk_Sio_22 == 0)
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

const u16 Sprite_NameEntry_0[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2D0) + OAM2_LAYER(1),
};

const u16 * CONST_DATA SpriteArray_NameEntryIcons[] =
{
    Sprite_NameEntry_HiraganaIcon,
    Sprite_NameEntry_KatakanaIcon,
    Sprite_NameEntry_0,
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

extern u16 Pal_SioNameEntryGlow[];

//! FE8U = 0x0804CECC
void UpdateSioMenuBurstGlow(int idx)
{
    u16 * ptr = Pal_SioNameEntryGlow;

    if (gUnk_Sio_22 == 0)
    {
        PAL_OBJ_COLOR(6, 14) = ptr[idx];
        EnablePaletteSync();
    }

    return;
}

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

const s16 gSioUiutils_1[] =
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

    x = gSioUiutils_1[idx + 1];
    r1 = proc->xBase - x;

    y = gSioUiutils_1[idx + 0];

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
void LAPhaseIntro_Init(void)
{
    // clang-format off
    u8 * sLinkArenaPhaseIntroFactionImgLut[] =
    {
        Img_LinkArenaPhaseIntroPlayer,
        Img_LinkArenaPhaseIntroOther,
        Img_LinkArenaPhaseIntroEnemy,
        Img_LinkArenaPhaseIntro4,
    };

    u16 * sLinkArenaPhaseIntroFactionPalLut[] =
    {
        Pal_LinkArenaPhaseIntroPlayer,
        Pal_LinkArenaPhaseIntroOther,
        Pal_LinkArenaPhaseIntroEnemy,
        Pal_LinkArenaPhaseIntro4,
    };

    u16 * sLinkArenaPhaseIntroPhaseChangePalLut[] =
    {
        Pal_PhaseChangePlayer,
        Pal_PhaseChangeOther,
        Pal_PhaseChangeEnemy,
        Pal_PhaseChange_0,
    };
    // clang-format on

    Decompress(Img_PhaseChangeUnk, OBJ_CHR_ADDR(0x200));
    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(0x100));
    Decompress(Img_LinkArenaPhaseIntroBg, BG_CHR_ADDR(0x140));

    Decompress(sLinkArenaPhaseIntroFactionImgLut[gPlaySt.faction], gGenericBuffer);
    Copy2dChr(gGenericBuffer, BG_CHR_ADDR(0x14C), 3, 3);

    ApplyPalette(sLinkArenaPhaseIntroFactionPalLut[gPlaySt.faction], 5);
    ApplyPalette(sLinkArenaPhaseIntroPhaseChangePalLut[gPlaySt.faction], 0x12);

    gUnk_49 = gPlaySt.faction;
    gPlaySt.faction = FACTION_BLUE;

    return;
}

//! FE8U = 0x0804D37C
void LAPhaseIntro_End(void)
{
    gPlaySt.faction = gUnk_49;

    SetWinEnable(0, 0, 0);
    SetDefaultColorEffects();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    return;
}

//! FE8U = 0x0804D3DC
void LAPhaseIntro_StartBgm(void)
{
    StartBgm(SONG_COMBAT_PREPARATION, &gMPlayInfo_BGM2);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LinkArenaPhaseIntro[] =
{
    PROC_CALL(LAPhaseIntro_Init),
    PROC_YIELD,

    PROC_START_CHILD(gProcScr_PhaseIntroText),
    PROC_START_CHILD(gProcScr_PhaseIntroSquares),
    PROC_START_CHILD(gProcScr_PhaseIntroBlendBox),

    PROC_CALL(PhaseIntro_InitDisp),
    PROC_REPEAT(PhaseIntro_WaitForEnd),

    PROC_CALL(LAPhaseIntro_StartBgm),
    PROC_CALL(LAPhaseIntro_End),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D3F0
void SetUnitItemUsesToMax(struct Unit * unit, int itemSlot)
{
    u16 item = unit->items[itemSlot];

    if (item != 0)
    {
        unit->items[itemSlot] = item | 0xff00;
    }

    return;
}

//! FE8U = 0x0804D40C
void SetUnitAllItemsUsesToMax(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        SetUnitItemUsesToMax(unit, i);
    }

    return;
}

//! FE8U = 0x0804D428
void UpdateLinkArenaVersusBannerGlow(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_22 == 0)
    {
        idx = (GetGameClock() % 0x20);
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_OBJ_COLOR(9, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePaletteSync();
    }

    return;
}

// clang-format off

const u16 Sprite_LAVersus_P1[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16, OAM2_CHR(0x300) + OAM2_LAYER(1) + OAM2_PAL(3),
};

const u16 Sprite_LAVersus_P2[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(1), OAM2_CHR(0x304) + OAM2_LAYER(1) + OAM2_PAL(4),
};

const u16 Sprite_LAVersus_P3[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(2), OAM2_CHR(0x308) + OAM2_LAYER(1) + OAM2_PAL(5),
};

const u16 Sprite_LAVersus_P4[] =
{
    1,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(3), OAM2_CHR(0x30C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

const u16 * CONST_DATA SpriteArray_LAVersusPlayerNumbers[] =
{
    Sprite_LAVersus_P1,
    Sprite_LAVersus_P2,
    Sprite_LAVersus_P3,
    Sprite_LAVersus_P4,
};

const u16 Sprite_SioUiutils_0[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x348) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(32), OAM2_CHR(0x34C) + OAM2_LAYER(1) + OAM2_PAL(8),
};

const u16 Sprite_SioUiutils_1[] =
{
    3,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x34D) + OAM2_LAYER(1) + OAM2_PAL(9),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x351) + OAM2_LAYER(1) + OAM2_PAL(9),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(64), OAM2_CHR(0x355) + OAM2_LAYER(1) + OAM2_PAL(9),
};

// clang-format on

//! FE8U = 0x0804D47C
void LAVersusSpriteDraw_Loop(struct LAVersusSpriteDrawProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        PutSprite(4, proc->x, proc->yBase + i * 24, Sprite_LinkArena_NameBanner, OAM2_PAL(i) + OAM2_LAYER(2));

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
            {
            _0804D544:
                if (proc->unk_3c[i] <= 335)
                {
                    proc->unk_3c[i] += 8;
                }
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

        PutSprite(4, proc->x - 48, proc->yBase + i * 24, SpriteArray_LAVersusPlayerNumbers[i], 0);
    }

    if (proc->unk_34 != -1)
    {
        PutSprite(4, proc->x - 72, proc->yBase + proc->unk_34 * 24 + 8, Sprite_SioUiutils_0, 0);
        PutSprite(4, proc->x - 72, proc->yBase + proc->unk_34 * 24 + 18, Sprite_SioUiutils_1, 0);
        UpdateLinkArenaVersusBannerGlow();
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LAVersusSpriteDraw[] =
{
    PROC_REPEAT(LAVersusSpriteDraw_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D664
ProcPtr StartLinkArenaVersusSpriteDraw(int x, int y, ProcPtr parent)
{
    struct LAVersusSpriteDrawProc * proc;
    int i;

    Proc_EndEach(ProcScr_LAVersusSpriteDraw);
    proc = Proc_Start(ProcScr_LAVersusSpriteDraw, parent);

    proc->x = x;
    proc->yBase = y;
    proc->unk_34 = -1;
    proc->unk_38 = -1;

    for (i = 0; i < 4; i++)
    {
        proc->unk_3c[i] = 0x100;
    }

    return proc;
}

//! FE8U = 0x0804D6B4
void EndLinkArenaVersusSpriteDraw(void)
{
    Proc_EndEach(ProcScr_LAVersusSpriteDraw);
    return;
}

//! FE8U = 0x0804D6C4
ProcPtr GetLinkArenaVersusSpriteDraw(void)
{
    return Proc_Find(ProcScr_LAVersusSpriteDraw);
}

//! FE8U = 0x0804D6D4
void UpdateLinkArenaActiveBannerBgGlow(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_22 == 0)
    {
        idx = GetGameClock() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_BG_COLOR(2, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804D724
void UpdateLinkArenaActiveBannerObjGlow(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_22 == 0)
    {
        idx = GetGameClock() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_OBJ_COLOR(3, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x0804D778
void SetLinkArenaResultBlend(void)
{
    SetBlendAlpha(8, 12);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 0);

    return;
}

// clang-format off

const u16 Sprite_SioUiutils_2[] =
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
void LinkArenaResultBanner_Loop(struct SioProc85AABD8 * proc)
{
    if (proc->y > 30 && proc->y < 153)
    {
        PutSprite(4, proc->x, proc->y, Sprite_SioUiutils_2, 0);
        UpdateLinkArenaActiveBannerObjGlow();
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SioUiutils_1[] =
{
    PROC_YIELD,
    PROC_REPEAT(LinkArenaResultBanner_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804D7DC
ProcPtr StartLinkArenaResultBanner(int x, int y, ProcPtr parent)
{
    struct SioProc85AABD8 * proc;

    Proc_EndEach(ProcScr_SioUiutils_1);
    proc = Proc_Start(ProcScr_SioUiutils_1, parent);

    proc->x = x;
    proc->y = y;

    return proc;
}

//! FE8U = 0x0804D80C
void LoadLinkArenaChoiceBoxGfx(void)
{
    Decompress(gGfx_SupportMenu, (void *)(0x06016800));
    ApplyPalette(gPal_SupportMenu, 0x12);
    return;
}

// clang-format off

const u16 Sprite_LinkArena_ChoiceBanner[] =
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
void PutLinkArenaChoiceBannerSprite(int x, int y)
{
    PutSprite(1, x, y, Sprite_LinkArena_ChoiceBanner, OAM2_CHR(0x340) + OAM2_LAYER(1) + OAM2_PAL(2));
    return;
}
