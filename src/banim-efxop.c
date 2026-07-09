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

    void * dst = (void *)(VRAM + magicFx->bgChr * CHR_SIZE);

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
    Tsa_Banim_0,
    Tsa_Banim_1,
    Tsa_Banim_2,
    Tsa_Banim_3,
    Tsa_Banim_4,
    Tsa_Banim_5,
    Tsa_Banim_6,
    Tsa_Banim_7,
    Tsa_Banim_8,
    Tsa_Banim_9,
    Tsa_Banim_10,
    Tsa_Banim_11,
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

// FIXME: Either this or Tsa_HealSpellBg may need to change its type
u16 * CONST_DATA gEfxop_0[] =
{
    (u16 *)Tsa_HealSpellBg,
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

    proc->tsal = gEfxop_0;

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
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_5,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_1,
    Img_Light_1,
    Img_Light_1,
    Img_Light_2,
    Img_Light_2,
    Img_Light_2,
    Img_Light_2,
    Img_Light_2,
};

u16 * CONST_DATA PalArray_Light_ClassReel[] =
{
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
};

u16 * CONST_DATA TsaArray_Light_ClassReel[] =
{
    Tsa_Light_0,
    Tsa_Light_1,
    Tsa_Light_2,
    Tsa_Light_3,
    Tsa_Light_4,
    Tsa_Light_5,
    Tsa_Light_6,
    Tsa_Light_7,
    Tsa_Light_8,
    Tsa_Light_9,
    Tsa_Light_10,
    Tsa_Light_11,
    Tsa_Light_12,
    Tsa_Light_13,
    Tsa_Light_14,
    Tsa_Light_15,
    Tsa_Light_16,
    Tsa_Light_17,
    Tsa_Light_18,
    Tsa_Light_19,
    Tsa_Light_20,
    Tsa_Light_21,
    Tsa_Light_22,
    Tsa_Light_23,
    Tsa_Light_24,
    Tsa_Light_25,
    Tsa_Light_26,
    Tsa_Light_27,
    Tsa_Light_28,
    Tsa_Light_29,
    Tsa_Light_30,
    Tsa_Light_31,
    Tsa_Light_32,
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
    Tsa_Flux_ClassReel_0,
    Tsa_Flux_ClassReel_1,
    Tsa_Flux_ClassReel_2,
    Tsa_Flux_ClassReel_3,
    Tsa_Flux_ClassReel_4,
    Tsa_Flux_ClassReel_5,
    Tsa_Flux_ClassReel_6,
    Tsa_Flux_ClassReel_7,
    Tsa_Flux_ClassReel_8,
    Tsa_Flux_ClassReel_9,
    Tsa_Flux_ClassReel_10,
    Tsa_Flux_ClassReel_11,
    Tsa_Flux_ClassReel_12,
    Tsa_Flux_ClassReel_13,
    Tsa_Flux_ClassReel_14,
    Tsa_Flux_ClassReel_15,
    Tsa_Flux_ClassReel_16,
    Tsa_Flux_ClassReel_17,
    Tsa_Flux_ClassReel_18,
    Tsa_Flux_ClassReel_19,
    Tsa_Flux_ClassReel_20,
    Tsa_Flux_ClassReel_21,
    Tsa_Flux_ClassReel_22,
    Tsa_Flux_ClassReel_23,
    Tsa_Flux_ClassReel_24,
    Tsa_Flux_ClassReel_25,
    Tsa_Flux_ClassReel_26,
    Tsa_Flux_ClassReel_27,
    Tsa_Flux_ClassReel_28,
    Tsa_Flux_ClassReel_29,
    Tsa_Flux_ClassReel_30,
    Tsa_Flux_ClassReel_31,
    Tsa_Flux_ClassReel_32,
    Tsa_Flux_ClassReel_33,
    Tsa_Flux_ClassReel_34,
    Tsa_Flux_ClassReel_35,
    Tsa_Flux_ClassReel_36,
    Tsa_Flux_ClassReel_37,
    Tsa_Flux_ClassReel_38,
    Tsa_Flux_ClassReel_39,
    Tsa_Flux_ClassReel_40,
};

u16 * CONST_DATA ImgArray_Flux_ClassReel[] =
{
    Img_Banim_6,
    Img_Banim_6,
    Img_Banim_6,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Banim_6,
    Img_Banim_6,
    Img_Banim_6,
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

    CRSpell_RegisterBgPal(anim, Pal_Banim_1);

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

    CRSpell_RegisterBgPal(anim, Pal_Banim_2);

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
    Img_EvilEye_0,
    Img_EvilEye_1,
    Img_EvilEye_2,
    Img_EvilEye_3,
    Img_EvilEye_4,
    Img_EvilEye_5,
    Img_EvilEye_6,
    Img_EvilEye_7,
    Img_EvilEye_8,
    Img_EvilEye_9,
    Img_EvilEye_10,
    Img_EvilEye_11,
    Img_EvilEye_12,
    Img_EvilEye_13,
    Img_EvilEye_14,
    Img_EvilEye_15,
    Img_EvilEye_16,
    Img_EvilEye_17,
    Img_EvilEye_18,
    Img_EvilEye_19,
    Img_EvilEye_20,
    Img_EvilEye_21,
    Img_EvilEye_22,
    Img_EvilEye_23,
    Img_EvilEye_24,
    Img_EvilEye_25,
};

u16 * CONST_DATA TsaArray_EvilEye_ClassReel[] =
{
    Tsa_EvilEye_0,
    Tsa_EvilEye_1,
    Tsa_EvilEye_2,
    Tsa_EvilEye_3,
    Tsa_EvilEye_4,
    Tsa_EvilEye_5,
    Tsa_EvilEye_6,
    Tsa_EvilEye_7,
    Tsa_EvilEye_8,
    Tsa_EvilEye_9,
    Tsa_EvilEye_10,
    Tsa_EvilEye_11,
    Tsa_EvilEye_12,
    Tsa_EvilEye_13,
    Tsa_EvilEye_14,
    Tsa_EvilEye_15,
    Tsa_EvilEye_16,
    Tsa_EvilEye_17,
    Tsa_EvilEye_18,
    Tsa_EvilEye_19,
    Tsa_EvilEye_20,
    Tsa_EvilEye_21,
    Tsa_EvilEye_22,
    Tsa_EvilEye_23,
    Tsa_EvilEye_24,
    Tsa_EvilEye_25,
};

u16 * CONST_DATA PalArray_EvilEye_ClassReel[] =
{
    Pal_EvilEye_0,
    Pal_EvilEye_1,
    Pal_EvilEye_2,
    Pal_EvilEye_3,
    Pal_EvilEye_4,
    Pal_EvilEye_5,
    Pal_EvilEye_6,
    Pal_EvilEye_7,
    Pal_EvilEye_8,
    Pal_EvilEye_9,
    Pal_EvilEye_10,
    Pal_EvilEye_11,
    Pal_EvilEye_12,
    Pal_EvilEye_13,
    Pal_EvilEye_14,
    Pal_EvilEye_15,
    Pal_EvilEye_16,
    Pal_EvilEye_17,
    Pal_EvilEye_18,
    Pal_EvilEye_19,
    Pal_EvilEyeBg2_A,
    Pal_EvilEye_20,
    Pal_EvilEye_21,
    Pal_EvilEye_22,
    Pal_EvilEye_23,
    Pal_EvilEye_24,
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

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_Banim_1, AnimScr_Banim_0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 24;

    CRSpell_RegisterObjPal(proc->anim, Pal_Banim_6);
    CRSpell_RegisterObjGfx(proc->anim, Img_Banim_15);

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
    Img_Banim_14,
    Img_Stone_0,
    Img_Stone_1,
    Img_Stone_2,
    Img_Stone_3,
    Img_Stone_4,
    Img_Stone_5,
    Img_Stone_6,
    Img_Stone_7,
    Img_Stone_8,
    Img_Stone_9,
    Img_Stone_10,
    Img_Stone_11,
    Img_Stone_12,
    Img_Stone_13,
    Img_Stone_14,
    Img_Stone_15,
    Img_Stone_16,
    Img_Stone_17,
};

u16 * CONST_DATA TsaArray_Stone_ClassReel[] =
{
    Tsa_Stone_0,
    Tsa_Stone_1,
    Tsa_Stone_2,
    Tsa_Stone_3,
    Tsa_Stone_4,
    Tsa_Stone_5,
    Tsa_Stone_6,
    Tsa_Stone_7,
    Tsa_Stone_8,
    Tsa_Stone_9,
    Tsa_Stone_10,
    Tsa_Stone_11,
    Tsa_Stone_12,
    Tsa_Stone_13,
    Tsa_Stone_14,
    Tsa_Stone_15,
    Tsa_Stone_16,
    Tsa_Stone_17,
    Tsa_Stone_18,
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
            SpellFx_RegisterBgPal(Pal_StoneBg_0, PLTT_SIZE_4BPP);
        }

        if (ret == 18)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_1, PLTT_SIZE_4BPP);
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

    scr = AnimScr_EfxStone;
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
