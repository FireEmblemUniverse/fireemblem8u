#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

EWRAM_DATA ProcPtr gpActiveClassReelSpellProc = NULL;
EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc = NULL;

//! FE8U = 0x0806E8F0
void ResetClassReelSpell(void)
{
    gpActiveClassReelSpellProc = NULL;
    gpActiveCRSpellBgColorProc = NULL;

    return;
}

//! FE8U = 0x0806E904
void EndActiveClassReelSpell(void)
{
    if (gpActiveClassReelSpellProc != NULL)
    {
        Proc_End(gpActiveClassReelSpellProc);
        gpActiveClassReelSpellProc = NULL;
    }

    return;
}

//! FE8U = 0x0806E920
void EndActiveClassReelBgColorProc(void)
{
    if (gpActiveCRSpellBgColorProc != NULL)
    {
        Proc_End(gpActiveCRSpellBgColorProc);
        gpActiveCRSpellBgColorProc = NULL;
    }

    return;
}

//! FE8U = 0x0806E93C
void SetActiveClassReelSpell(ProcPtr proc)
{
    gpActiveClassReelSpellProc = proc;
    return;
}

//! FE8U = 0x0806E948
void SetActiveCRSpellBgColorProc(ProcPtr proc)
{
    gpActiveCRSpellBgColorProc = proc;
    return;
}

//! FE8U = 0x0806E954
struct AnimMagicFxBuffer * GetMagicEffectBufferFor(struct Anim * anim)
{
    return ((struct AnimBuffer *)(anim->pUnk44))->unk_30;
}

//! FE8U = 0x0806E95C
void SetCRSpellBgPosition(struct Anim * anim, struct AnimMagicFxBuffer * magicFx)
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
void ClearCRSpellBgTmBuf(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastFill(0, magicFx->bgTmBuf, 0x800);
    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}

//! FE8U = 0x0806E9E4
struct Anim * CRSpellCreateFrontAnim(struct Anim * anim, u16 scrIdx, void * scrA, void * scrB)
{
    struct Anim * newAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

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
void CRSpell_WriteBgMap(struct Anim * anim, u16 notFlipped, void * src, u16 isCompressed)
{
    void * buf;
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

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
void CRSpell_RegisterBgGfx(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    void * dst = (void *)(0x6000000 + magicFx->bgChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->bgImgBuf);
    RegisterDataMove(magicFx->bgImgBuf, dst, 0x2000);

    return;
}

//! FE8U = 0x0806EAD4
void CRSpell_RegisterBgPal(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastCopy(src, gPaletteBuffer + (magicFx->bgPalId * 0x10), PLTT_SIZE_4BPP);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x0806EAFC
void CRSpell_RegisterObjGfx(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    void * dst = (void *)(0x6010000 + magicFx->objChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->objImgBuf);
    RegisterDataMove(magicFx->objImgBuf, dst, 0x1000);

    return;
}

//! FE8U = 0x0806EB2C
void CRSpell_RegisterObjPal(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastCopy(src, gPaletteBuffer + 0x100 + (magicFx->objPalId * 0x10), PLTT_SIZE_4BPP);
    EnablePaletteSync();

    return;
}

// clang-format off

CONST_DATA SpellAnimFunc gClassReelSpellAnimFuncLut[] =
{
    StartClassReelSpellAnimDummy,
    StartClassReelSpellAnimFire,
    StartClassReelSpellAnimThunder,
    StartClassReelSpellAnimHeal,
    StartClassReelSpellAnimLight,
    StartClassReelSpellAnimFlux,
    StartClassReelSpellAnimMyrrh,
    StartClassReelSpellAnimEvilEye,
    StartClassReelSpellAnimStone,
};

// clang-format on

//! FE8U = 0x0806EB54
void StartClassReelSpellAnim(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

#if BUGFIX
    if (gClassReelSpellAnimFuncLut[magicFx->magicFuncIdx] == NULL)
        return;
#endif

    gClassReelSpellAnimFuncLut[magicFx->magicFuncIdx](anim);

    return;
}

//! FE8U = 0x0806EB78
void StartClassReelSpellAnimDummy(struct Anim * anim)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopFire[] =
{
    PROC_NAME("efxopFire"),

    PROC_REPEAT(efxopFire_Loop_Main),
    PROC_SLEEP(50),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EB7C
void StartClassReelSpellAnimFire(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopFire, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806EB9C
void efxopFire_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopFireBG(proc->anim, proc);
    StartCRSubSpell_efxopFireOBJ(proc->anim, proc);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopFireBG[] =
{
    PROC_NAME("efxopFireBG"),
    PROC_REPEAT(efxopFireBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_Fire_ClassReel[] =
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
void StartCRSubSpell_efxopFireBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
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

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopFireBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_Fire_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_FireSpellBg);
    CRSpell_RegisterBgGfx(proc->anim, Img_FireSpellBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EC1C
void efxopFireBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            ClearCRSpellBgTmBuf(proc->anim);
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
    PROC_REPEAT(efxopFireOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EC68
void StartCRSubSpell_efxopFireOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopFireOBJ, parent);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_EfxFireOBJ_R_Front, AnimScr_EfxFireOBJ_L_Front);
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

    CRSpell_RegisterObjPal(proc->anim, Pal_FireSpellSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FireSpellSprites);

    return;
}

//! FE8U = 0x0806ECE8
void efxopFireOBJ_Loop(struct ProcEfxOBJ * proc)
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

    PROC_REPEAT(efxopThunder_Loop_Main),
    PROC_SLEEP(50),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806ED0C
void StartClassReelSpellAnimThunder(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopThunder, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806ED2C
void efxopThunder_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopThunderBG(proc->anim, proc);
    StartCRSubSpell_efxopThunderBGCOL(proc->anim, proc);
    StartCRSubSpell_efxopThunderOBJ(proc->anim, proc);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopThunderBG[] =
{
    PROC_NAME("efxopThunderBG"),
    PROC_REPEAT(efxopThunderBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_Thunder_ClassReel[] =
{
    Tsa_EfxThuderBg1,
    Tsa_EfxThuderBg2,
};

// clang-format on

//! FE8U = 0x0806ED54
void StartCRSubSpell_efxopThunderBG(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 4,
        1, 40,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopThunderBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Thunder_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_ThunderSpellBg);
    CRSpell_RegisterBgGfx(proc->anim, Img_ThunderSpellBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EDB0
void efxopThunderBG_Loop(struct ProcEfxBG * proc)
{
    u16 chr = 0;
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(proc->anim);

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 0, *(tsaL + ret), 1);

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
            ClearCRSpellBgTmBuf(proc->anim);
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
    PROC_MARK(PROC_MARK_EFX_BGCOL),

    PROC_REPEAT(efxopThunderBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EE34
void StartCRSubSpell_efxopThunderBGCOL(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
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
    SetActiveCRSpellBgColorProc(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_ThunderSpellBg;

    return;
}

//! FE8U = 0x0806EE68
void efxopThunderBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        CRSpell_RegisterBgPal(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            EndActiveClassReelBgColorProc();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopThunderOBJ[] =
{
    PROC_NAME("efxopThunderOBJ"),
    PROC_REPEAT(efxopThunderOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EEA8
void StartCRSubSpell_efxopThunderOBJ(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopThunderOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R);
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

    CRSpell_RegisterObjPal(proc->anim, Pal_BoltingSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_BoltingSprites);

    return;
}

//! FE8U = 0x0806EF24
void efxopThunderOBJ_Loop(struct ProcEfxOBJ * proc)
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

    PROC_REPEAT(efxopLive_Loop_Main),
    PROC_SLEEP(70),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806EF48
void StartClassReelSpellAnimHeal(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLive, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806EF64
void efxopLive_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopLiveOBJ(proc->anim, proc);
    StartCRSubSpell_efxopLiveBG(proc->anim, proc);
    StartCRSubSpell_efxopLiveBGCOL(proc->anim, proc);

    SetBlendAlpha(0, 16);

    StartCRSubSpell_efxopLiveALPHA(proc->anim, 1, 12, 0, proc);
    StartCRSubSpell_efxopLiveALPHA(proc->anim, 35, 25, 1, proc);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLiveBG[] =
{
    PROC_NAME("efxopLiveBG"),
    PROC_REPEAT(efxopLiveBG_Loop),
    PROC_END,
};

// FIXME: Either this or gUnknown_0866F774 may need to change its type
u16 * CONST_DATA gUnknown_085D959C[] =
{
    (u16 *)gUnknown_0866F774,
};

// clang-format on

//! FE8U = 0x0806EFB8
void StartCRSubSpell_efxopLiveBG(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 62,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLiveBG, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = gUnknown_085D959C;

    CRSpell_RegisterBgGfx(anim, Img_HealSpellBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F00C
void efxopLiveBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 0);
    }
    else
    {
        if (ret == -1)
        {
            ClearCRSpellBgTmBuf(proc->anim);
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
    PROC_MARK(PROC_MARK_EFX_BGCOL),

    PROC_REPEAT(efxopLiveBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F058
void StartCRSubSpell_efxopLiveBGCOL(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
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
    SetActiveCRSpellBgColorProc(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_HealSpellBg;

    return;
}

//! FE8U = 0x0806F08C
void efxopLiveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        CRSpell_RegisterBgPal(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            EndActiveClassReelBgColorProc();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLiveALPHA[] =
{
    PROC_NAME("efxopLiveALPHA"),

    PROC_REPEAT(efxopLiveALPHA_Loop_A),
    PROC_REPEAT(efxopLiveALPHA_Loop_B),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F0CC
void StartCRSubSpell_efxopLiveALPHA(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused)
{
    struct ProcEfxALPHA * proc = Proc_Start(ProcScr_efxopLiveALPHA, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = timer;
    proc->unk2E = c;

    proc->unk29 = d;

    return;
}

//! FE8U = 0x0806F0FC
void efxopLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    if (--proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806F118
void efxopLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
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
    PROC_REPEAT(efxopLiveOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F184
void StartCRSubSpell_efxopLiveOBJ(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopLiveOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    scr = AnimScr_EfxLiveOBJ1;
    frontAnim = CRSpellCreateFrontAnim(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    CRSpell_RegisterObjPal(proc->anim, Pal_HealSprites_Sparkles);
    CRSpell_RegisterObjGfx(proc->anim, Img_HealSprites_Sparkles);

    return;
}

//! FE8U = 0x0806F1E8
void efxopLiveOBJ_Loop(struct ProcEfxOBJ * proc)
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

    PROC_REPEAT(efxopLightning_Loop_Main),
    PROC_SLEEP(50),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F210
void StartClassReelSpellAnimLight(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLightning, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F230
void efxopLightning_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopLightningBG(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopLightningBG[] =
{
    PROC_NAME("efxopLightningBG"),
    PROC_REPEAT(efxopLightningBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_Light_ClassReel[] =
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

u16 * CONST_DATA PalArray_Light_ClassReel[] =
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

u16 * CONST_DATA TsaArray_Light_ClassReel[] =
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
void StartCRSubSpell_efxopLightningBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
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

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLightningBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Light_ClassReel;
    proc->tsar = TsaArray_Light_ClassReel;

    proc->img = ImgArray_Light_ClassReel;
    proc->pal = PalArray_Light_ClassReel;

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F2A0
void efxopLightningBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_RegisterBgPal(proc->anim, *(pal + ret));
        CRSpell_WriteBgMap(proc->anim, 0, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            ClearCRSpellBgTmBuf(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopMistyrainBG[] =
{
    PROC_NAME("efxopMistyrainBG"),
    PROC_REPEAT(efxopMistyrainBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_Flux_ClassReel[] =
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

u16 * CONST_DATA ImgArray_Flux_ClassReel[] =
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
void StartCRSubSpell_efxopMistyrainBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
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

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopMistyrainBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Flux_ClassReel;
    proc->tsar = TsaArray_Flux_ClassReel;
    proc->img = ImgArray_Flux_ClassReel;

    proc->terminator = 0;

    CRSpell_RegisterBgPal(anim, Pal_0862A2D0);

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

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F38C
void StartCRSubSpell_efxopMistyrainBG_2(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
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

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopMistyrainBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Flux_ClassReel;
    proc->tsar = TsaArray_Flux_ClassReel;
    proc->img = ImgArray_Flux_ClassReel;

    proc->terminator = 1;

    CRSpell_RegisterBgPal(anim, Pal_0862A2F0);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    SetBlendAlpha(10, 7);

    return;
}

//! FE8U = 0x0806F3F8
void efxopMistyrainBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_WriteBgMap(proc->anim, proc->terminator, *(tsaL + ret), 1);
    }
    else
    {
        if (ret == -1)
        {
            ClearCRSpellBgTmBuf(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopMistyrainOBJ[] =
{
    PROC_NAME("efxopMistyrainOBJ"),

    PROC_SET_END_CB(efxopMistyrainOBJ_OnEnd),

    PROC_REPEAT(efxopMistyrainOBJ_Loop_A),
    PROC_SLEEP(32),

    PROC_REPEAT(efxopMistyrainOBJ_Loop_B),
    PROC_SLEEP(11),

    PROC_REPEAT(efxopMistyrainOBJ_Loop_C),
    PROC_SLEEP(22),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F450
void StartCRSubSpell_efxopMistyrainOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopMistyrainOBJ, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    proc->anim2 = CRSpellCreateFrontAnim(anim, 1, scr, scr);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopMistyrainOBJ2[] =
{
    PROC_NAME("efxopMistyrainOBJ2"),

    PROC_SET_END_CB(efxopMistyrainOBJ_OnEnd),

    PROC_REPEAT(efxopMistyrainOBJ2_Loop_A),
    PROC_SLEEP(14),

    PROC_REPEAT(efxopMistyrainOBJ2_Loop_B),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F47C
struct ProcEfxOBJ * StartCRSubSpell_efxopMistyrainOBJ2(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopMistyrainOBJ2, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    frontAnim = CRSpellCreateFrontAnim(anim, 0, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition -= 4;

    return proc;
}

void efxopMistyrainOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0806F4C0
void efxopMistyrainOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj1;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    CRSpell_RegisterObjPal(proc->anim, Pal_FluxAnimSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FluxAnimSprites_Orb);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F4F8
void efxopMistyrainOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj2;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    CRSpell_RegisterObjPal(proc->anim, Pal_FluxAnimSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FluxAnimSprites_Tendrils);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F530
void efxopMistyrainOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj3;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    CRSpell_RegisterObjPal(proc->anim, Pal_FluxAnimSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FluxAnimSprites_SigilVoid);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F568
void efxopMistyrainOBJ2_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj4;

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
void efxopMistyrainOBJ2_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        u32 * scr = AnimScr_EfxMistyRainObj5;

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

    PROC_REPEAT(efxopMistyrain_Loop_Main),
    PROC_SLEEP(170),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F5BC
void StartClassReelSpellAnimFlux(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMistyrain, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806F5E0
void efxopMistyrain_Loop_Main(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        StartCRSubSpell_efxopMistyrainBG(proc->anim, proc);
    }

    if (proc->timer == 16)
    {
        StartCRSubSpell_efxopMistyrainOBJ(proc->anim, proc);
    }

    if (proc->timer == 75)
    {
        proc->unk_64 = StartCRSubSpell_efxopMistyrainOBJ2(proc->anim, proc);
    }

    if (proc->timer == 94)
    {
        StartCRSubSpell_efxopMistyrainBG_2(proc->anim, proc);
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

    PROC_REPEAT(efxopMyrrh_Loop_Main),
    PROC_SLEEP(50),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F648
void StartClassReelSpellAnimMyrrh(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMyrrh, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F668
void efxopMyrrh_Loop_Main(ProcPtr proc)
{
    struct BattleAnim * banim = banim_data;
    LZ77UnCompWram(banim[197 - 1].pal, gPal_Banim);

    CpuFastCopy(gPal_Banim + 0x10, gPaletteBuffer + 0x120, PLTT_SIZE_4BPP);
    CpuFastCopy(gPal_Banim + 0x10, gPaletteBuffer + 0x130, PLTT_SIZE_4BPP);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopEvilEye[] =
{
    PROC_REPEAT(efxopEvilEye_Loop_A),
    PROC_SLEEP(24),

    PROC_REPEAT(efxopEvilEye_Loop_B),
    PROC_SLEEP(72),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F6B4
void StartClassReelSpellAnimEvilEye(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopEvilEye, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F6D4
void efxopEvilEye_Loop_A(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopEvilEyeOBJ(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F6EC
void efxopEvilEye_Loop_B(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopEvilEyeBG(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopEvilEyeBG[] =
{
    PROC_REPEAT(efxopEvilEyeBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_EvilEye_ClassReel[] =
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

u16 * CONST_DATA TsaArray_EvilEye_ClassReel[] =
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

u16 * CONST_DATA PalArray_EvilEye_ClassReel[] =
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
void StartCRSubSpell_efxopEvilEyeBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
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

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopEvilEyeBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EvilEye_ClassReel;
    proc->img = ImgArray_EvilEye_ClassReel;
    proc->pal = PalArray_EvilEye_ClassReel;

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F75C
void efxopEvilEyeBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_RegisterBgPal(proc->anim, *(pal + ret));
    }
    else
    {
        if (ret == -1)
        {
            ClearCRSpellBgTmBuf(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopEvilEyeOBJ[] =
{
    PROC_REPEAT(efxopEvilEyeOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F7C0
void StartCRSubSpell_efxopEvilEyeOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * unused = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopEvilEyeOBJ, parent);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, gUnknown_086C978C, gUnknown_086C95C0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 24;

    CRSpell_RegisterObjPal(proc->anim, Pal_086C93FC);
    CRSpell_RegisterObjGfx(proc->anim, Img_086C90A4);

    return;
}

//! FE8U = 0x0806F820
void efxopEvilEyeOBJ_Loop(struct ProcEfxOBJ * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxopStone[] =
{
    PROC_REPEAT(efxopStone_Loop_A),
    PROC_SLEEP(62),

    PROC_REPEAT(efxopStone_Loop_B),
    PROC_SLEEP(138),

    PROC_CALL(EndActiveClassReelSpell),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F844
void StartClassReelSpellAnimStone(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopStone, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F864
void efxopStone_Loop_A(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopStoneOBJ(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F87C
void efxopStone_Loop_B(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopStoneBG(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopStoneBG[] =
{
    PROC_REPEAT(efxopStoneBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_Stone_ClassReel[] =
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

u16 * CONST_DATA TsaArray_Stone_ClassReel[] =
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
void StartCRSubSpell_efxopStoneBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
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

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopStoneBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Stone_ClassReel;
    proc->img = ImgArray_Stone_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_StoneBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F8F0
void efxopStoneBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));

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
            ClearCRSpellBgTmBuf(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxopStoneOBJ[] =
{
    PROC_REPEAT(efxopStoneOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806F968
void StartCRSubSpell_efxopStoneOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * unused = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopStoneOBJ, parent);

    proc->anim = anim;
    proc->timer = 0;

    scr = gUnknown_086BDA5C;
    frontAnim = CRSpellCreateFrontAnim(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 12;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;
    frontAnim->oam2Base |= OAM2_LAYER(3);

    AnimSort();

    CRSpell_RegisterObjPal(proc->anim, Pal_StoneSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_StoneSprites);

    return;
}

//! FE8U = 0x0806F9D8
void efxopStoneOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 200)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
