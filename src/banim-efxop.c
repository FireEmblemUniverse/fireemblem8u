#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

extern ProcPtr gpProcefxopCur;
extern ProcPtr gUnknown_0203E1EC;

//! FE8U = 0x0806E8F0
void sub_806E8F0(void)
{
    gpProcefxopCur = NULL;
    gUnknown_0203E1EC = NULL;

    return;
}

//! FE8U = 0x0806E904
void sub_806E904(void)
{
    if (gpProcefxopCur != NULL)
    {
        Proc_End(gpProcefxopCur);
        gpProcefxopCur = NULL;
    }

    return;
}

//! FE8U = 0x0806E920
void sub_806E920(void)
{
    if (gUnknown_0203E1EC != NULL)
    {
        Proc_End(gUnknown_0203E1EC);
        gUnknown_0203E1EC = NULL;
    }

    return;
}

//! FE8U = 0x0806E93C
void SetGlbProcefxopCur(ProcPtr proc)
{
    gpProcefxopCur = proc;
    return;
}

//! FE8U = 0x0806E948
void sub_806E948(ProcPtr proc)
{
    gUnknown_0203E1EC = proc;
    return;
}

//! FE8U = 0x0806E954
struct AnimMagicFxBuffer * sub_806E954(struct Anim * anim)
{
    return ((struct AnimBuffer *)(anim->pUnk44))->unk_30;
}

//! FE8U = 0x0806E95C
void sub_806E95C(struct Anim * anim, struct AnimMagicFxBuffer * magicFx)
{
    s16 x;
    s16 y;

    if (GetAnimPosition(anim) == 0)
    {
        x = anim->xPosition - BanimTypesPosLeft[0];
    }
    else
    {
        x = BanimTypesPosRight[0] - anim->xPosition;
    }

    y = 88 - anim->yPosition;

    BG_SetPosition(magicFx->bg, x - magicFx->xOffsetBg, y - magicFx->yOffsetBg);

    return;
}

//! FE8U = 0x0806E9B4
void sub_806E9B4(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    CpuFastFill(0, magicFx->bgTmBuf, 0x800);
    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}

//! FE8U = 0x0806E9E4
struct Anim * sub_806E9E4(struct Anim * anim, u16 scrIdx, void * scrA, void * scrB)
{
    struct Anim * newAnim;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    if (scrIdx == 0)
    {
        newAnim = AnimCreate(scrA, 120);
    }
    else
    {
        newAnim = AnimCreate(scrB, 120);
    }

    newAnim->oam2Base = (magicFx->objPalId << 12) | magicFx->objChr | OAM2_LAYER(2);
    newAnim->xPosition = anim->xPosition;
    newAnim->yPosition = anim->yPosition;

    return newAnim;
}

//! FE8U = 0x0806EA38
void sub_806EA38(struct Anim * anim, u16 notFlipped, void * src, u16 isCompressed)
{
    void * buf;
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    if (isCompressed == 1)
    {
        LZ77UnCompWram(src, magicFx->bgTsaBuf);
    }

    buf = src;

    if (isCompressed == 1)
    {
        buf = magicFx->bgTsaBuf;
    }

    if (notFlipped == 0)
    {
        EfxTmCpyBgHFlip(buf, magicFx->bgTmBuf, 30, 20, magicFx->bgPalId, magicFx->bgChr);
    }
    else
    {
        EfxTmCpyBG(buf, magicFx->bgTmBuf, 30, 20, magicFx->bgPalId, magicFx->bgChr);
    }

    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}

//! FE8U = 0x0806EAA4
void sub_806EAA4(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    void * dst = (void *)(0x6000000 + magicFx->bgChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->bgImgBuf);
    RegisterDataMove(magicFx->bgImgBuf, dst, 0x2000);

    return;
}

//! FE8U = 0x0806EAD4
void sub_806EAD4(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    CpuFastCopy(src, gPaletteBuffer + (magicFx->bgPalId * 0x10), PLTT_SIZE_4BPP);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x0806EAFC
void sub_806EAFC(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    void * dst = (void *)(0x6010000 + magicFx->objChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->objImgBuf);
    RegisterDataMove(magicFx->objImgBuf, dst, 0x1000);

    return;
}

//! FE8U = 0x0806EB2C
void sub_806EB2C(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    CpuFastCopy(src, gPaletteBuffer + 0x100 + (magicFx->objPalId * 0x10), 0x20);
    EnablePaletteSync();

    return;
}

// clang-format off

CONST_DATA SpellAnimFunc gpEfxopFuncLut[] =
{
    nullsub_73,
    NewEfxopFire,
    NewEfxopThunder,
    NewEfxopLive,
    NewEfxopLightning,
    NewEfxopMistyrain,
    NewEfxopMyrrh,
    sub_806F6B4,
    sub_806F844,
};

// clang-format on

//! FE8U = 0x0806EB54
void ExecEfxop(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    gpEfxopFuncLut[magicFx->magicFuncIdx](anim);

    return;
}

//! FE8U = 0x0806EB78
void nullsub_73(struct Anim * anim)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopFire[] =
{
    PROC_NAME("efxopFire"),

    PROC_REPEAT(sub_806EB9C),
    PROC_SLEEP(50),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EB7C
void NewEfxopFire(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopFire, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806EB9C
void sub_806EB9C(struct ProcEfx * proc)
{
    NewEfxopFireBG(proc->anim, proc);
    NewEfxopFireOBJ(proc->anim, proc);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopFireBG[] =
{
    PROC_NAME("efxopFireBG"),
    PROC_REPEAT(sub_806EC1C),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D9494[] =
{
    Tsa_085F6250,
    Tsa_085F62F8,
    Tsa_085F63A0,
    Tsa_085F6458,
    Tsa_085F6520,
    Tsa_085F65F0,
    Tsa_085F66F0,
    Tsa_085F67F8,
    Tsa_085F690C,
    Tsa_085F6A44,
    Tsa_085F6B48,
    Tsa_085F6C1C,
};

// clang-format on

//! FE8U = 0x0806EBBC
void NewEfxopFireBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 gUnknown_080DF644[] =
    {
        0, 3,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        9, 3,
        10, 3,
        11, 3,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopFireBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF644;
    proc->tsal = gUnknown_085D9494;

    sub_806EAD4(anim, gUnknown_085F6230);
    sub_806EAA4(proc->anim, gUnknown_085F5638);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EC1C
void sub_806EC1C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        sub_806EA38(proc->anim, 1, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopFireOBJ[] =
{
    PROC_NAME("efxopFireOBJ"),
    PROC_REPEAT(sub_806ECE8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EC68
void NewEfxopFireOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopFireOBJ, parent);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = sub_806E9E4(anim, 1, gUnknown_085F843C, gUnknown_085F80B4);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition = anim->xPosition - 8;
    }
    else
    {
        frontAnim->xPosition = anim->xPosition + 8;
    }

    frontAnim->yPosition = anim->yPosition + 8;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    sub_806EB2C(proc->anim, gUnknown_085F7D64);
    sub_806EAFC(proc->anim, gUnknown_085F7768);

    return;
}

//! FE8U = 0x0806ECE8
void sub_806ECE8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopThunder[] =
{
    PROC_NAME("efxopThunder"),

    PROC_REPEAT(sub_806ED2C),
    PROC_SLEEP(50),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806ED0C
void NewEfxopThunder(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopThunder, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806ED2C
void sub_806ED2C(struct ProcEfx * proc)
{
    sub_806ED54(proc->anim, proc);
    sub_806EE34(proc->anim, proc);
    sub_806EEA8(proc->anim, proc);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopThunderBG[] =
{
    PROC_NAME("efxopThunderBG"),
    PROC_REPEAT(sub_806EDB0),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D951C[] =
{
    Tsa_085F387C,
    Tsa_085F3948,
};

// clang-format on

//! FE8U = 0x0806ED54
void sub_806ED54(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 gUnknown_080DF6A8[] =
    {
        0, 4,
        1, 40,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopThunderBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF6A8;

    proc->tsal = gUnknown_085D951C;

    sub_806EAD4(anim, gUnknown_085F367C);
    sub_806EAA4(proc->anim, gUnknown_085F2DC0);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EDB0
void sub_806EDB0(struct ProcEfxBG * proc)
{
    u16 chr = 0;
    struct AnimMagicFxBuffer * magicFx = sub_806E954(proc->anim);

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        sub_806EA38(proc->anim, 0, *(tsaL + ret), 1);

        if (ret == 0)
        {
            chr = magicFx->bgChr + 31;
        }

        if (ret == 1)
        {
            chr = magicFx->bgChr + 80;
        }

        FillBGRect(magicFx->bgTmBuf + 0x1E, 2, 20, magicFx->bgPalId, chr);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopThunderBGCOL[] =
{
    PROC_NAME("efxopThunderBGCOL"),
    PROC_MARK(PROC_MARK_A),

    PROC_REPEAT(sub_806EE68),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EE34
void sub_806EE34(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 gUnknown_080DF6C6[] =
    {
        0, 4,
        1, 4,
        2, 2,
        3, 2,
        4, 20,
        5, 2,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopThunderBGCOL, PROC_TREE_3);

    sub_806E948(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF6C6;

    proc->pal = gUnknown_085F367C;

    return;
}

//! FE8U = 0x0806EE68
void sub_806EE68(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        sub_806EAD4(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E920();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopThunderOBJ[] =
{
    PROC_NAME("efxopThunderOBJ"),
    PROC_REPEAT(sub_806EF24),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EEA8
void sub_806EEA8(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopThunderOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = sub_806E9E4(anim, 1, gUnknown_085F5550, gUnknown_085F4A24);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition = anim->xPosition + 56;
    }
    else
    {
        frontAnim->xPosition = anim->xPosition - 56;
    }

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    sub_806EB2C(proc->anim, Pal_BoltingSprites);
    sub_806EAFC(proc->anim, Img_BoltingSprites);

    return;
}

//! FE8U = 0x0806EF24
void sub_806EF24(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLive[] =
{
    PROC_NAME("efxopLive"),

    PROC_REPEAT(sub_806EF64),
    PROC_SLEEP(70),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EF48
void NewEfxopLive(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLive, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806EF64
void sub_806EF64(struct ProcEfx * proc)
{
    sub_806F184(proc->anim, proc);
    sub_806EFB8(proc->anim, proc);
    sub_806F058(proc->anim, proc);

    SetBlendAlpha(0, 16);

    sub_806F0CC(proc->anim, 1, 12, 0, proc);
    sub_806F0CC(proc->anim, 35, 25, 1, proc);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLiveBG[] =
{
    PROC_NAME("efxopLiveBG"),
    PROC_REPEAT(sub_806F00C),
    PROC_END,
};

// FIXME: Either this or gUnknown_0866F774 may need to change its type
u16 * CONST_DATA gUnknown_085D959C[] =
{
    (u16 *)gUnknown_0866F774,
};

// clang-format on

//! FE8U = 0x0806EFB8
void sub_806EFB8(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 gUnknown_080DF730[] =
    {
        0, 62,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);

    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLiveBG, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF730;

    proc->tsal = gUnknown_085D959C;

    sub_806EAA4(anim, gUnknown_0866F5E4);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F00C
void sub_806F00C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        sub_806EA38(proc->anim, 1, *(tsaL + ret), 0);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLiveBGCOL[] =
{
    PROC_NAME("efxopLiveBGCOL"),
    PROC_MARK(PROC_MARK_A),

    PROC_REPEAT(sub_806F08C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F058
void sub_806F058(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 gUnknown_080DF748[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 4,
        4, 4,
        5, 4,
        6, 4,
        7, 4,
        8, 4,
        9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
        15, 5,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopLiveBGCOL, PROC_TREE_3);
    sub_806E948(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF748;

    proc->pal = gUnknown_086700D4;

    return;
}

//! FE8U = 0x0806F08C
void sub_806F08C(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        sub_806EAD4(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E920();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLiveALPHA[] =
{
    PROC_NAME("efxopLiveALPHA"),

    PROC_REPEAT(sub_806F0FC),
    PROC_REPEAT(sub_806F118),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F0CC
void sub_806F0CC(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused)
{
    struct ProcEfxALPHA * proc = Proc_Start(ProcScr_efxopLiveALPHA, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = timer;
    proc->unk2E = c;

    proc->unk29 = d;

    return;
}

//! FE8U = 0x0806F0FC
void sub_806F0FC(struct ProcEfxALPHA * proc)
{
    if (--proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806F118
void sub_806F118(struct ProcEfxALPHA * proc)
{
    int bldA;

    if (proc->timer > proc->unk2E)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->unk29 == 0)
    {
        bldA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
    }
    else
    {
        bldA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
    }

    SetBlendAlpha(bldA, 16);

    proc->timer++;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLiveOBJ[] =
{
    PROC_NAME("efxopLiveOBJ"),

    PROC_REPEAT(sub_806F1E8),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F184
void sub_806F184(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopLiveOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    scr = gUnknown_08675114;
    frontAnim = sub_806E9E4(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    sub_806EB2C(proc->anim, Pal_FimbulvetrSprites_Snow);
    sub_806EAFC(proc->anim, gUnknown_086702D4);

    return;
}

//! FE8U = 0x0806F1E8
void sub_806F1E8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLightning[] =
{
    PROC_NAME("efxopLightning"),

    PROC_REPEAT(sub_806F230),
    PROC_SLEEP(50),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F210
void NewEfxopLightning(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLightning, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F230
void sub_806F230(struct ProcEfx * proc)
{
    sub_806F248(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLightningBG[] =
{
    PROC_NAME("efxopLightningBG"),
    PROC_REPEAT(sub_806F2A0),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D9638[] =
{
    Img_0861AD94,
    Img_0861AD94,
    Img_0861AD94,
    Img_0861B65C,
    Img_0861B65C,
    Img_0861B65C,
    Img_0861BDAC,
    Img_0861BDAC,
    Img_0861BDAC,
    Img_0861BDAC,
    Img_0861C770,
    Img_0861C770,
    Img_0861C770,
    Img_0861D2C4,
    Img_0861D2C4,
    Img_0861D2C4,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861DDCC,
    Img_0861E0E4,
    Img_0861E0E4,
    Img_0861E0E4,
    Img_0861ED94,
    Img_0861ED94,
    Img_0861ED94,
    Img_0861ED94,
    Img_0861ED94,
};

u16 * CONST_DATA gUnknown_085D96BC[] =
{
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7B4,
    Pal_0861F7D4,
    Pal_0861F7D4,
    Pal_0861F7D4,
    Pal_0861F7D4,
    Pal_0861F7D4,
    Pal_0861F7D4,
    Pal_0861F7D4,
    Pal_0861F7D4,
};

u16 * CONST_DATA gUnknown_085D9740[] =
{
    Tsa_0861F7F4,
    Tsa_0861F918,
    Tsa_0861FA38,
    Tsa_0861FB44,
    Tsa_0861FC40,
    Tsa_0861FD28,
    Tsa_0861FE0C,
    Tsa_0861FEF0,
    Tsa_0861FFCC,
    Tsa_086200AC,
    Tsa_086201A0,
    Tsa_08620294,
    Tsa_08620398,
    Tsa_086204A0,
    Tsa_086205B8,
    Tsa_086206DC,
    Tsa_086207F0,
    Tsa_086208A0,
    Tsa_086209A8,
    Tsa_08620AE4,
    Tsa_08620C58,
    Tsa_08620DF0,
    Tsa_08620F64,
    Tsa_08621070,
    Tsa_08621144,
    Tsa_086211E4,
    Tsa_08621304,
    Tsa_08621420,
    Tsa_08621534,
    Tsa_0862162C,
    Tsa_08621714,
    Tsa_086217E4,
    Tsa_086218A8,
};

// clang-format on

//! FE8U = 0x0806F248
void sub_806F248(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 gUnknown_080DF7CE[] =
    {
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        30, 2,
        31, 2,
        32, 2,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
        0, 7,
        1, 1,
        2, 1,
        3, 1,
        4, 1,
        5, 1,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLightningBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF7CE;

    proc->tsal = gUnknown_085D9740;
    proc->tsar = gUnknown_085D9740;

    proc->img = gUnknown_085D9638;
    proc->pal = gUnknown_085D96BC;

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F2A0
void sub_806F2A0(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        sub_806EAA4(proc->anim, *(img + ret));
        sub_806EAD4(proc->anim, *(pal + ret));
        sub_806EA38(proc->anim, 0, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D97C4[] =
{
    PROC_NAME("efxopMistyrainBG"),
    PROC_REPEAT(sub_806F3F8),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D97DC[] =
{
    Tsa_0862A310,
    Tsa_0862A40C,
    Tsa_0862A50C,
    Tsa_0862A610,
    Tsa_0862A708,
    Tsa_0862A814,
    Tsa_0862A920,
    Tsa_0862AA40,
    Tsa_0862AB64,
    Tsa_0862AC4C,
    Tsa_0862AD28,
    Tsa_0862ADE8,
    Tsa_0862AEA0,
    Tsa_0862AF48,
    Tsa_0862B004,
    Tsa_0862B0DC,
    Tsa_0862B1BC,
    Tsa_0862B2AC,
    Tsa_0862B3A8,
    Tsa_0862B49C,
    Tsa_0862B594,
    Tsa_0862B680,
    Tsa_0862B764,
    Tsa_0862B83C,
    Tsa_0862B90C,
    Tsa_0862B9D8,
    Tsa_0862BAA0,
    Tsa_0862BB54,
    Tsa_0862BC08,
    Tsa_0862BCA8,
    Tsa_0862BD5C,
    Tsa_0862BE18,
    Tsa_0862BEF4,
    Tsa_0862BFDC,
    Tsa_0862C100,
    Tsa_0862C220,
    Tsa_0862C32C,
    Tsa_0862C438,
    Tsa_0862C534,
    Tsa_0862C634,
    Tsa_0862C730,
};

u16 * CONST_DATA gUnknown_085D9880[] =
{
    Img_08626944,
    Img_08626944,
    Img_08626944,
    Img_08627514,
    Img_08627514,
    Img_08627514,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08629480,
    Img_08629480,
    Img_08629480,
    Img_08629480,
    Img_08629480,
    Img_08629480,
    Img_08629B04,
    Img_08629B04,
    Img_08629B04,
    Img_08629B04,
    Img_0862A060,
    Img_0862A060,
    Img_0862A060,
    Img_0862A060,
    Img_0862A060,
    Img_0862A060,
    Img_0862A060,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08628224,
    Img_08627514,
    Img_08627514,
    Img_08627514,
    Img_08626944,
    Img_08626944,
    Img_08626944,
};

// clang-format on

//! FE8U = 0x0806F304
void sub_806F304(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 gUnknown_080DF866[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        9, 2,
        10, 2,
        11, 2,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D97C4, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF866;

    proc->tsal = gUnknown_085D97DC;
    proc->tsar = gUnknown_085D97DC;
    proc->img = gUnknown_085D9880;

    proc->terminator = 0;

    sub_806EAD4(anim, gUnknown_0862A2D0);

    if (GetAnimPosition(proc->anim) == 0)
    {
        gLCDControlBuffer.bgoffset[BG_1].x += 4;
    }
    else
    {
        gLCDControlBuffer.bgoffset[BG_1].x -= 4;
    }

    gLCDControlBuffer.bgoffset[BG_1].y += 8;

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F38C
void sub_806F38C(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 gUnknown_080DF898[] =
    {
        12, 6,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        24, 2,
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        30, 2,
        31, 2,
        32, 2,
        33, 2,
        34, 2,
        35, 2,
        36, 2,
        37, 2,
        38, 2,
        39, 2,
        40, 2,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D97C4, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF898;

    proc->tsal = gUnknown_085D97DC;
    proc->tsar = gUnknown_085D97DC;
    proc->img = gUnknown_085D9880;

    proc->terminator = 1;

    sub_806EAD4(anim, gUnknown_0862A2F0);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    SetBlendAlpha(10, 7);

    return;
}

//! FE8U = 0x0806F3F8
void sub_806F3F8(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        sub_806EAA4(proc->anim, *(img + ret));
        sub_806EA38(proc->anim, proc->terminator, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D9924[] =
{
    PROC_NAME("efxopMistyrainOBJ"),

    PROC_SET_END_CB(sub_806F4B4),

    PROC_REPEAT(sub_806F4C0),
    PROC_SLEEP(32),

    PROC_REPEAT(sub_806F4F8),
    PROC_SLEEP(11),

    PROC_REPEAT(sub_806F530),
    PROC_SLEEP(22),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F450
void sub_806F450(struct Anim * anim, struct ProcEfx * parent)
{
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D9924, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    proc->anim2 = sub_806E9E4(anim, 1, scr, scr);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D996C[] =
{
    PROC_NAME("efxopMistyrainOBJ2"),

    PROC_SET_END_CB(sub_806F4B4),

    PROC_REPEAT(sub_806F568),
    PROC_SLEEP(14),

    PROC_REPEAT(sub_806F594),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F47C
struct ProcEfxOBJ * sub_806F47C(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D996C, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    frontAnim = sub_806E9E4(anim, 0, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition -= 4;

    return proc;
}

void sub_806F4B4(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0806F4C0
void sub_806F4C0(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862D6A8;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    sub_806EB2C(proc->anim, Pal_FluxAnimSprites);
    sub_806EAFC(proc->anim, Img_FluxAnimSprites_Orb);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F4F8
void sub_806F4F8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862D82C;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    sub_806EB2C(proc->anim, Pal_FluxAnimSprites);
    sub_806EAFC(proc->anim, Img_FluxAnimSprites_Tendrils);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F530
void sub_806F530(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862DCE0;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    sub_806EB2C(proc->anim, Pal_FluxAnimSprites);
    sub_806EAFC(proc->anim, Img_FluxAnimSprites_SigilVoid);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F568
void sub_806F568(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = gUnknown_0862DC24;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;
    anim->drawLayerPriority = 20;

    AnimSort();

    proc->timer = 39;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F594
void sub_806F594(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        u32 * scr = gUnknown_0862DC58;

        anim->pScrStart = scr;
        anim->pScrCurrent = scr;
        anim->timer = 0;

        proc->timer = 0;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopMistyrain[] =
{
    PROC_NAME("efxopMistyrain"),

    PROC_REPEAT(sub_806F5E0),
    PROC_SLEEP(170),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F5BC
void NewEfxopMistyrain(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMistyrain, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806F5E0
void sub_806F5E0(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        sub_806F304(proc->anim, proc);
    }

    if (proc->timer == 16)
    {
        sub_806F450(proc->anim, proc);
    }

    if (proc->timer == 75)
    {
        proc->unk_64 = sub_806F47C(proc->anim, proc);
    }

    if (proc->timer == 94)
    {
        sub_806F38C(proc->anim, proc);
    }

    if (proc->timer == 114)
    {
        Proc_End(proc->unk_64);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopMyrrh[] =
{
    PROC_NAME("efxopMyrrh"),

    PROC_REPEAT(sub_806F668),
    PROC_SLEEP(50),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F648
void NewEfxopMyrrh(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMyrrh, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F668
void sub_806F668(ProcPtr proc)
{
    struct BattleAnim * banim = banim_data;
    LZ77UnCompWram(banim[197 - 1].pal, gPalBackupEkrUnitMaybe);

    CpuFastCopy(gPalBackupEkrUnitMaybe + 0x10, gPaletteBuffer + 0x120, 0x20);
    CpuFastCopy(gPalBackupEkrUnitMaybe + 0x10, gPaletteBuffer + 0x130, 0x20);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D99EC[] =
{
    PROC_REPEAT(sub_806F6D4),
    PROC_SLEEP(24),

    PROC_REPEAT(sub_806F6EC),
    PROC_SLEEP(72),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F6B4
void sub_806F6B4(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(gUnknown_085D99EC, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F6D4
void sub_806F6D4(struct ProcEfx * proc)
{
    sub_806F7C0(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F6EC
void sub_806F6EC(struct ProcEfx * proc)
{
    sub_806F704(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D9A1C[] =
{
    PROC_REPEAT(sub_806F75C),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D9A2C[] =
{
    Img_086C97B4,
    Img_086C9DAC,
    Img_086CA3C4,
    Img_086CAA94,
    Img_086CB1C4,
    Img_086CB8F0,
    Img_086CC0E4,
    Img_086CC8A0,
    Img_086CD098,
    Img_086CD988,
    Img_086CE15C,
    Img_086CE9FC,
    Img_086CF244,
    Img_086CF9D8,
    Img_086D0268,
    Img_086D0B24,
    Img_086D134C,
    Img_086D1B6C,
    Img_086D2400,
    Img_086D2BE4,
    Img_086D4C08,
    Img_086D5418,
    Img_086D5E44,
    Img_086D68AC,
    Img_086D73A4,
    Img_086D7F20,
};

u16 * CONST_DATA gUnknown_085D9A94[] =
{
    Tsa_086D36D4,
    Tsa_086D37B4,
    Tsa_086D3890,
    Tsa_086D3978,
    Tsa_086D3A7C,
    Tsa_086D3B78,
    Tsa_086D3C84,
    Tsa_086D3D8C,
    Tsa_086D3E94,
    Tsa_086D3FBC,
    Tsa_086D40CC,
    Tsa_086D41F4,
    Tsa_086D4318,
    Tsa_086D4428,
    Tsa_086D454C,
    Tsa_086D466C,
    Tsa_086D4788,
    Tsa_086D489C,
    Tsa_086D49D0,
    Tsa_086D4ADC,
    Tsa_086D8B54,
    Tsa_086D8C64,
    Tsa_086D8DEC,
    Tsa_086D8FA4,
    Tsa_086D9170,
    Tsa_086D9354,
};

u16 * CONST_DATA gUnknown_085D9AFC[] =
{
    Pal_086D3454,
    Pal_086D3474,
    Pal_086D3494,
    Pal_086D34B4,
    Pal_086D34D4,
    Pal_086D34F4,
    Pal_086D3514,
    Pal_086D3534,
    Pal_086D3554,
    Pal_086D3574,
    Pal_086D3594,
    Pal_086D35B4,
    Pal_086D35D4,
    Pal_086D35F4,
    Pal_086D3614,
    Pal_086D3634,
    Pal_086D3654,
    Pal_086D3674,
    Pal_086D3694,
    Pal_086D36B4,
    Pal_EvilEyeBg2_A,
    Pal_086D8AB4,
    Pal_086D8AD4,
    Pal_086D8AF4,
    Pal_086D8B14,
    Pal_086D8B34,
};

// clang-format on

//! FE8U = 0x0806F704
void sub_806F704(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 gUnknown_080DF954[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        4, 3,
        5, 3,
        6, 3,
        7, 3,
        8, 3,
        9, 3,
        10, 3,
        11, 3,
        12, 3,
        13, 3,
        14, 3,
        15, 3,
        16, 3,
        17, 3,
        18, 3,
        19, 3,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        24, 2,
        25, 2,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D9A1C, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF954;

    proc->tsal = gUnknown_085D9A94;
    proc->img = gUnknown_085D9A2C;
    proc->pal = gUnknown_085D9AFC;

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F75C
void sub_806F75C(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        sub_806EA38(proc->anim, 1, *(tsaL + ret), 1);
        sub_806EAA4(proc->anim, *(img + ret));
        sub_806EAD4(proc->anim, *(pal + ret));
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D9B64[] =
{
    PROC_REPEAT(sub_806F820),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F7C0
void sub_806F7C0(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * unused = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D9B64, parent);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = sub_806E9E4(anim, 1, gUnknown_086C978C, gUnknown_086C95C0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 24;

    sub_806EB2C(proc->anim, gUnknown_086C93FC);
    sub_806EAFC(proc->anim, gUnknown_086C90A4);

    return;
}

//! FE8U = 0x0806F820
void sub_806F820(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 60)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D9B74[] =
{
    PROC_REPEAT(sub_806F864),
    PROC_SLEEP(62),

    PROC_REPEAT(sub_806F87C),
    PROC_SLEEP(138),

    PROC_CALL(sub_806E904),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F844
void sub_806F844(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(gUnknown_085D9B74, PROC_TREE_3);
    SetGlbProcefxopCur(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F864
void sub_806F864(struct ProcEfx * proc)
{
    sub_806F968(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F87C
void sub_806F87C(struct ProcEfx * proc)
{
    sub_806F894(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D9BA4[] =
{
    PROC_REPEAT(sub_806F8F0),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D9BB4[] =
{
    Img_086BDB7C,
    Img_086BE0CC,
    Img_086BE668,
    Img_086BEC5C,
    Img_086BF2F4,
    Img_086BF9B0,
    Img_086C0110,
    Img_086C0924,
    Img_086C119C,
    Img_086C1AD0,
    Img_086C2438,
    Img_086C2DA8,
    Img_086C375C,
    Img_086C40F4,
    Img_086C4AB4,
    Img_086C53CC,
    Img_086C5D20,
    Img_086C669C,
    Img_086C7010,
};

u16 * CONST_DATA gUnknown_085D9C00[] =
{
    Tsa_086C796C,
    Tsa_086C7A2C,
    Tsa_086C7AF8,
    Tsa_086C7BD0,
    Tsa_086C7CBC,
    Tsa_086C7DC0,
    Tsa_086C7ED4,
    Tsa_086C7FFC,
    Tsa_086C8138,
    Tsa_086C828C,
    Tsa_086C8404,
    Tsa_086C8570,
    Tsa_086C86E4,
    Tsa_086C8860,
    Tsa_086C89EC,
    Tsa_086C8B30,
    Tsa_086C8C84,
    Tsa_086C8DE8,
    Tsa_086C8F4C,
};

// clang-format on

//! FE8U = 0x0806F894
void sub_806F894(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 gUnknown_080DF9BE[] =
    {
        0, 4,
        1, 4,
        2, 4,
        3, 4,
        4, 4,
        5, 4,
        6, 4,
        7, 4,
        8, 4,
        9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
        15, 4,
        16, 4,
        17, 4,
        18, 4,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = sub_806E954(anim);
    struct ProcEfxBG * proc = Proc_Start(gUnknown_085D9BA4, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF9BE;

    proc->tsal = gUnknown_085D9C00;
    proc->img = gUnknown_085D9BB4;

    sub_806EAD4(anim, Pal_StoneBg);

    magicFx->resetCallback();

    sub_806E95C(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F8F0
void sub_806F8F0(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        sub_806EA38(proc->anim, 1, *(tsaL + ret), 1);
        sub_806EAA4(proc->anim, *(img + ret));

        if (ret == 17)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_086C792C, PLTT_SIZE_4BPP);
        }

        if (ret == 18)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_086C794C, PLTT_SIZE_4BPP);
        }
    }
    else
    {
        if (ret == -1)
        {
            sub_806E9B4(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D9C4C[] =
{
    PROC_REPEAT(sub_806F9D8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F968
void sub_806F968(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * unused = sub_806E954(anim);
    struct ProcEfxOBJ * proc = Proc_Start(gUnknown_085D9C4C, parent);

    proc->anim = anim;
    proc->timer = 0;

    scr = gUnknown_086BDA5C;
    frontAnim = sub_806E9E4(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 12;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;
    frontAnim->oam2Base |= OAM2_LAYER(3);

    AnimSort();

    sub_806EB2C(proc->anim, Pal_StoneSprites);
    sub_806EAFC(proc->anim, Img_StoneSprites);

    return;
}

//! FE8U = 0x0806F9D8
void sub_806F9D8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 200)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
