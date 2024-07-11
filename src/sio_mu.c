#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"

struct SioProc85AA83C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct MuProc * muProc;
};

struct SioWarpProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ int x;
    /* 38 */ int y;
    /* 3C */ int facing;
    /* 40 */ u8 unk_40;
    /* 41 */ s8 playStepSe;
};

struct SioProc85AA954
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int x;
    /* 30 */ int y;
};

// clang-format off

u16 * CONST_DATA PalArray_SolidColors[] =
{
    Pal_AllWhite,
    Pal_AllBlack,
    Pal_AllRed,
    Pal_AllGreen,
    Pal_AllBlue,
    Pal_AllYellow,
};

extern struct ProcCmd ProcScr_085AA83C[];

// clang-format on

//! FE8U = 0x0804BED8
void sub_804BED8(struct MuProc * muProc, int kind)
{
    struct SioProc85AA83C * proc;

    ApplyPalette(PalArray_SolidColors[kind], 0x16);

    muProc->sprite_anim->tileBase = muProc->config->chr + 0x6800;
    StartPalFade(gPaletteBuffer + (muProc->config->pal + 0x10) * 0x10, 0x16, 0x14, muProc);

    proc = Proc_Start(ProcScr_085AA83C, muProc);
    proc->muProc = muProc;

    return;
}

//! FE8U = 0x0804BF30
void sub_804BF30(struct SioProc85AA83C * proc)
{
    proc->muProc->sprite_anim->tileBase =
        OAM2_PAL(proc->muProc->config->pal) + proc->muProc->config->chr + 0x800;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085AA83C[] =
{
    PROC_SLEEP(17),
    PROC_CALL(sub_804BF30),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804BF4C
void StartLinkArenaMUDeathFade(struct MuProc * muProc)
{
    struct MuEffectProc * muEffectProc;

    muProc->state = MU_STATE_DEATHFADE;

    muEffectProc = Proc_Start(ProcScr_MuDeathFade, muProc);
    muEffectProc->mu = muProc;
    muEffectProc->timeLeft = 32;

    SetBlendConfig(0, 16, 16, 0);

    muProc->sprite_anim->frameTimer = 0;
    muProc->sprite_anim->frameInterval = 0;

    sub_804BED8(muProc, 0);

    muProc->sprite_anim->objLayer = 13;

    PlaySoundEffect(0xd6);

    return;
}

//! FE8U = 0x0804BFAC
void sub_804BFAC(struct MuProc * muProc, int palIdx)
{
    muProc->sprite_anim->tileBase = muProc->config->chr + 0x6800;

    ApplyPalette(gPaletteBuffer + (muProc->config->pal + 0x10) * 0x10, 0x16);
    StartPalFade(PalArray_SolidColors[palIdx], 0x16, 8, muProc);

    return;
}

//! FE8U = 0x0804BFF8
void sub_804BFF8(struct MuProc * muProc)
{
    struct MuEffectProc * muEffectProc;

    StartPalFade(gPaletteBuffer + (muProc->config->pal + 0x10) * 0x10, 0x16, 8, muProc);
    muEffectProc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    muEffectProc->mu = muProc;

    return;
}

extern u8 Img_LinkArenaWarpFx[];
extern u16 Pal_LinkArenaWarpFx[];

//! FE8U = 0x0804C02C
void SioWarp_Init(struct SioWarpProc * proc)
{
    Decompress(Img_LinkArenaWarpFx, (void *)(0x06004400));
    ApplyPalette(Pal_LinkArenaWarpFx, 3);

    proc->unk_40 = 0;

    if (proc->playStepSe)
    {
        MU_StartStepSfx(0x7f, 2, proc->x * 8);
    }

    return;
}

extern u16 gUnknown_089AE4A4[];

// clang-format off

u8 CONST_DATA gUnknown_085AA854[] =
{
    0x00, 0x01, 0x02, 0x03, 0x03,
    0x03, 0x03, 0x03, 0x03, 0x03,
    0x03, 0x03, 0x03, 0x03, 0x03,
    0x04, 0x05, 0x06, 0x07, 0x08,
    0x09, 0xFF,
};

// clang-format on

//! FE8U = 0x0804C078
void SioWarp_Loop(struct SioWarpProc * proc)
{
    sub_80146A0(
        gBG2TilemapBuffer, proc->x - 1, proc->y - 3, 0x3220, 4, 6, gUnknown_089AE4A4,
        gUnknown_085AA854[proc->unk_40]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->unk_40++;

    if (gUnknown_085AA854[proc->unk_40] == 0xFF)
    {
        Proc_Break(proc);
    }

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);

    SetBlendAlpha(12, 12);

    return;
}

//! FE8U = 0x0804C12C
void SioWarp_End(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetDefaultColorEffects();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SIOWARP[] =
{
    PROC_NAME("SIOWARP"),
    PROC_YIELD,

    PROC_CALL(SioWarp_Init),
    PROC_REPEAT(SioWarp_Loop),

    PROC_CALL(SioWarp_End),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C148
void SioWarpFx_StartSioWarp(struct SioWarpProc * parent)
{
    struct SioWarpProc * proc = Proc_Start(ProcScr_SIOWARP, PROC_TREE_2);

    proc->x = parent->unit->xPos * 2;
    proc->y = parent->unit->yPos * 2;

    proc->playStepSe = parent->playStepSe;

    return;
}

//! FE8U = 0x0804C178
void SioWarpFx_804C178(struct SioWarpProc * proc)
{
    sub_804BFAC(proc->muProc, 0);
    return;
}

//! FE8U = 0x0804C188
void SioWarpFx_HideMoveUnit(struct SioWarpProc * proc)
{
    MU_Hide(proc->muProc);
    return;
}

//! FE8U = 0x0804C194
void SioWarpFx_SetMUPosition(struct SioWarpProc * proc)
{
    MU_SetDisplayPosition(proc->muProc, proc->x * 16, proc->y * 16);

    proc->unit->xPos = proc->x;
    proc->unit->yPos = proc->y;

    return;
}

//! FE8U = 0x0804C1B8
void SioWarpFx_ShowMoveUnit(struct SioWarpProc * proc)
{
    if (proc->facing != -1)
    {
        SetMuFacing(proc->muProc, proc->facing);
    }

    MU_Show(proc->muProc);

    return;
}

//! FE8U = 0x0804C1D8
void SioWarpFx_804C1D8(struct SioWarpProc * proc)
{
    sub_804BFF8(proc->muProc);
    return;
}

//! FE8U = 0x0804C1E4
void SioWarpFx_AwaitSioWarp(ProcPtr proc)
{
    s8 found = Proc_Find(ProcScr_SIOWARP) != NULL;

    if (!found)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SIOWARPFX[] =
{
    PROC_NAME("SIOWARPFX"),
    PROC_YIELD,

    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(5),

    PROC_CALL(SioWarpFx_804C178),
    PROC_SLEEP(15),

    PROC_CALL(SioWarpFx_HideMoveUnit),
    PROC_SLEEP(1),

    PROC_CALL(SioWarpFx_SetMUPosition),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(5),

    PROC_CALL(SioWarpFx_ShowMoveUnit),
    PROC_CALL(SioWarpFx_804C1D8),

    PROC_REPEAT(SioWarpFx_AwaitSioWarp),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C208
ProcPtr StartSioWarpFx(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent)
{
    struct SioWarpProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_SIOWARPFX, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_SIOWARPFX, PROC_TREE_2);
    }

    proc->unit = unit;
    proc->muProc = muProc;
    proc->x = x;
    proc->y = y;
    proc->facing = facing;
    proc->playStepSe = playStepSe;

    return proc;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SioWarpFxPartial[] =
{
    PROC_YIELD,

    PROC_CALL(SioWarpFx_HideMoveUnit),
    PROC_SLEEP(1),

    PROC_CALL(SioWarpFx_SetMUPosition),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(5),

    PROC_CALL(SioWarpFx_ShowMoveUnit),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C260
ProcPtr sub_804C260(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent)
{
    struct SioWarpProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_SioWarpFxPartial, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_SioWarpFxPartial, PROC_TREE_2);
    }

    proc->unit = unit;
    proc->muProc = muProc;
    proc->x = x;
    proc->y = y;
    proc->facing = facing;
    proc->playStepSe = playStepSe;

    return proc;
}

// clang-format off

u16 const Sprite_LinkArenaBButton[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x2DA) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(32), OAM2_CHR(0x2DE) + OAM2_LAYER(1) + OAM2_PAL(8),
};

// clang-format on

//! FE8U = 0x0804C2B8
void PutLinkArenaButtonSpriteAt(int x, int y)
{
    PutSprite(4, x, y, Sprite_LinkArenaBButton, 0);
    return;
}

//! FE8U = 0x0804C2DC
void LAButtonSprites_Loop(struct SioProc85AA954 * proc)
{
    PutLinkArenaButtonSpriteAt(proc->x, proc->y);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LAButtonSpriteDraw[] =
{
    PROC_YIELD,
    PROC_REPEAT(LAButtonSprites_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0804C2EC
void StartLinkArenaButtonSpriteDraw(int x, int y, ProcPtr parent)
{
    struct SioProc85AA954 * proc;

    Proc_EndEach(ProcScr_LAButtonSpriteDraw);

    proc = Proc_Start(ProcScr_LAButtonSpriteDraw, parent);

    proc->x = x;
    proc->y = y;

    return;
}

//! FE8U = 0x0804C31C
void EndLinkArenaButtonSpriteDraw(void)
{
    if (Proc_Find(ProcScr_LAButtonSpriteDraw) != NULL)
    {
        Proc_EndEach(ProcScr_LAButtonSpriteDraw);
    }

    return;
}
