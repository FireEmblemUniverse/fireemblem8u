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
    /* 2C */ struct MUProc * unk_2c;
};

struct SioWarpProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct Unit * unk_2c;
    /* 30 */ struct MUProc * unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ u8 unk_40;
    /* 41 */ s8 unk_41;
};

extern u16 * gUnknown_085AA824[];

extern struct ProcCmd gUnknown_085AA83C[];

//! FE8U = 0x0804BED8
void sub_804BED8(struct MUProc * muProc, int palIdx)
{
    struct SioProc85AA83C * proc;

    ApplyPalette(gUnknown_085AA824[palIdx], 0x16);

    muProc->pAPHandle->tileBase = muProc->pMUConfig->objTileIndex + 0x6800;
    StartPalFade(gPaletteBuffer + (muProc->pMUConfig->paletteIndex + 0x10) * 0x10, 0x16, 0x14, muProc);

    proc = Proc_Start(gUnknown_085AA83C, muProc);
    proc->unk_2c = muProc;

    return;
}

//! FE8U = 0x0804BF30
void sub_804BF30(struct SioProc85AA83C * proc)
{
    proc->unk_2c->pAPHandle->tileBase =
        OAM2_PAL(proc->unk_2c->pMUConfig->paletteIndex) + proc->unk_2c->pMUConfig->objTileIndex + 0x800;
    return;
}

//! FE8U = 0x0804BF4C
void sub_804BF4C(struct MUProc * muProc)
{
    struct MUEffectProc * muEffectProc;

    muProc->stateId = MU_STATE_DEATHFADE;

    muEffectProc = Proc_Start(gProcScr_MUDeathFade, muProc);
    muEffectProc->pMUProc = muProc;
    muEffectProc->timeLeft = 0x20;

    SetBlendConfig(0, 0x10, 0x10, 0);

    muProc->pAPHandle->frameTimer = 0;
    muProc->pAPHandle->frameInterval = 0;

    sub_804BED8(muProc, 0);

    muProc->pAPHandle->objLayer = 0xd;

    PlaySoundEffect(0xd6);

    return;
}

extern u16 * gUnknown_085AA824[];

//! FE8U = 0x0804BFAC
void sub_804BFAC(struct MUProc * muProc, int palIdx)
{
    muProc->pAPHandle->tileBase = muProc->pMUConfig->objTileIndex + 0x6800;

    ApplyPalette(gPaletteBuffer + (muProc->pMUConfig->paletteIndex + 0x10) * 0x10, 0x16);
    StartPalFade(gUnknown_085AA824[palIdx], 0x16, 8, muProc);

    return;
}

//! FE8U = 0x0804BFF8
void sub_804BFF8(struct MUProc * muProc)
{
    struct MUEffectProc * muEffectProc;

    StartPalFade(gPaletteBuffer + (muProc->pMUConfig->paletteIndex + 0x10) * 0x10, 0x16, 8, muProc);
    muEffectProc = Proc_Start(gProcScr_MU_89A2CF8, PROC_TREE_3);
    muEffectProc->pMUProc = muProc;

    return;
}

extern u8 gUnknown_089AE224[];
extern u16 gUnknown_089AE484[];

//! FE8U = 0x0804C02C
void sub_804C02C(struct SioWarpProc * proc)
{
    Decompress(gUnknown_089AE224, (void *)(0x06004400));
    ApplyPalette(gUnknown_089AE484, 3);

    proc->unk_40 = 0;

    if (proc->unk_41)
    {
        MU_StartStepSfx(0x7f, 2, proc->unk_34 * 8);
    }

    return;
}

extern u16 gUnknown_089AE4A4[];
extern u8 gUnknown_085AA854[];

//! FE8U = 0x0804C078
void sub_804C078(struct SioWarpProc * proc)
{
    sub_80146A0(
        gBG2TilemapBuffer, proc->unk_34 - 1, proc->unk_38 - 3, 0x3220, 4, 6, gUnknown_089AE4A4,
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

    SetBlendConfig(1, 0xc, 0xc, 0);

    return;
}

//! FE8U = 0x0804C12C
void sub_804C12C(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetDefaultColorEffects();

    return;
}

extern struct ProcCmd ProcScr_SIOWARP[];

//! FE8U = 0x0804C148
void sub_804C148(struct SioWarpProc * parent)
{
    struct SioWarpProc * proc;

    proc = Proc_Start(ProcScr_SIOWARP, PROC_TREE_2);

    proc->unk_34 = parent->unk_2c->xPos * 2;
    proc->unk_38 = parent->unk_2c->yPos * 2;

    proc->unk_41 = parent->unk_41;

    return;
}

//! FE8U = 0x0804C178
void sub_804C178(struct SioWarpProc * proc)
{
    sub_804BFAC(proc->unk_30, 0);
    return;
}

//! FE8U = 0x0804C188
void sub_804C188(struct SioWarpProc * proc)
{
    MU_Hide(proc->unk_30);
    return;
}

//! FE8U = 0x0804C194
void sub_804C194(struct SioWarpProc * proc)
{
    MU_SetDisplayPosition(proc->unk_30, proc->unk_34 * 16, proc->unk_38 * 16);

    proc->unk_2c->xPos = proc->unk_34;
    proc->unk_2c->yPos = proc->unk_38;

    return;
}

//! FE8U = 0x0804C1B8
void sub_804C1B8(struct SioWarpProc * proc)
{
    if (proc->unk_3c != -1)
    {
        MU_SetFacing(proc->unk_30, proc->unk_3c);
    }

    MU_Show(proc->unk_30);

    return;
}

//! FE8U = 0x0804C1D8
void sub_804C1D8(struct SioWarpProc * proc)
{
    sub_804BFF8(proc->unk_30);
    return;
}

//! FE8U = 0x0804C1E4
void sub_804C1E4(ProcPtr proc)
{
    s8 found = Proc_Find(ProcScr_SIOWARP) != NULL;

    if (!found)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_SIOWARPFX[];

//! FE8U = 0x0804C208
ProcPtr sub_804C208(struct Unit * unit, struct MUProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent)
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

    proc->unk_2c = unit;
    proc->unk_30 = muProc;
    proc->unk_34 = x;
    proc->unk_38 = y;
    proc->unk_3c = facing;
    proc->unk_41 = playStepSe;

    return proc;
}

extern struct ProcCmd gUnknown_085AA914[];

//! FE8U = 0x0804C260
ProcPtr sub_804C260(struct Unit * unit, struct MUProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent)
{
    struct SioWarpProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gUnknown_085AA914, parent);
    }
    else
    {
        proc = Proc_Start(gUnknown_085AA914, PROC_TREE_2);
    }

    proc->unk_2c = unit;
    proc->unk_30 = muProc;
    proc->unk_34 = x;
    proc->unk_38 = y;
    proc->unk_3c = facing;
    proc->unk_41 = playStepSe;

    return proc;
}

extern u16 gUnknown_080D9FD6[];

//! FE8U = 0x0804C2B8
void sub_804C2B8(int x, int y)
{
    PutSprite(4, x, y, gUnknown_080D9FD6, 0);
    return;
}

struct SioProc85AA954
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int x;
    /* 30 */ int y;
};

//! FE8U = 0x0804C2DC
void sub_804C2DC(struct SioProc85AA954 * proc)
{
    sub_804C2B8(proc->x, proc->y);
    return;
}

extern struct ProcCmd gUnknown_085AA954[];

//! FE8U = 0x0804C2EC
void sub_804C2EC(int x, int y, ProcPtr parent)
{
    struct SioProc85AA954 * proc;

    Proc_EndEach(gUnknown_085AA954);

    proc = Proc_Start(gUnknown_085AA954, parent);

    proc->x = x;
    proc->y = y;

    return;
}

//! FE8U = 0x0804C31C
void sub_804C31C(void)
{
    if (Proc_Find(gUnknown_085AA954) != NULL)
    {
        Proc_EndEach(gUnknown_085AA954);
    }

    return;
}
