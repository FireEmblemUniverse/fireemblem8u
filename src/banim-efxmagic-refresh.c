#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSong[] =
{
    PROC_NAME("efxSong"),
    PROC_REPEAT(efxSong_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805C934
void StartSpellAnimSong(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxSong, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805C96C
void efxSong_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 39)
    {
        StartSubSpell_efxSongBG(anim, 0);
        StartSubSpell_efxSongOBJ(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 139)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPaletteBuffer + PAL_OFFSET(0x17), 0x20);
        }
        else
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPaletteBuffer + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 179)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSongBG[] =
{
    PROC_NAME("efxSongBG"),
    PROC_REPEAT(efxSongBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_SongBg[] =
{
    Tsa_08754910,
    Tsa_087549B8,
    Tsa_08754A64,
    Tsa_08754B14,
    Tsa_08754BD8,
    Tsa_08754CA4,
    Tsa_08754D7C,
    Tsa_08754E5C,
    Tsa_08754F3C,
    Tsa_08755028,
    Tsa_0875511C,
    Tsa_08755218,
    Tsa_08755310,
    Tsa_08755410,
    Tsa_08755510,
    Tsa_08755610,
    Tsa_08755714,
    Tsa_08755804,
    Tsa_087558EC,
    Tsa_087559D0,
    Tsa_08755AB8,
    Tsa_08755B94,
    Tsa_08755C64,
    Tsa_08755D20,
    Tsa_08755DE0,
    Tsa_08755E94,
    Tsa_08755F3C,
};

u16 * CONST_DATA ImgArray_SongBg[] =
{
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752044,
    Img_08752C10,
    Img_08752C10,
    Img_08752C10,
    Img_08752C10,
    Img_08752C10,
    Img_0875384C,
    Img_0875384C,
    Img_0875384C,
    Img_0875384C,
    Img_0875384C,
    Img_0875384C,
    Img_0875384C,
    Img_0875431C,
    Img_0875431C,
    Img_0875431C,
    Img_0875431C,
    Img_0875431C,
};

// clang-format on

//! FE8U = 0x0805CA64
void StartSubSpell_efxSongBG(struct Anim * anim, int kind)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  2,
         1,  2,
         2,  2,
         3,  2,
         4,  2,
         5,  2,
         6,  2,
         7,  2,
         8,  2,
         9,  2,
        10,  2,
        11,  2,
        12,  2,
        13,  2,
        14,  2,
        15,  2,
        16,  2,
        17,  2,
        18,  2,
        19,  2,
        20,  2,
        21,  2,
        22,  2,
        23,  2,
        24,  2,
        25,  2,
        26, 48,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_SongBg;
    proc->tsar = TsaArray_SongBg;

    proc->img = ImgArray_SongBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_SongSprites + kind * 0x10, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805CAC4
void efxSongBG_Loop(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSongOBJ[] =
{
    PROC_NAME("efxSongOBJ"),
    PROC_REPEAT(efxSongOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805CB40
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 56;
    scr = AnimScr_EfxSong;
    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(Pal_SongSprites + kind * 0x10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SongSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805CBA8
void efxSongOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDance[] =
{
    PROC_NAME("efxDance"),
    PROC_REPEAT(efxDance_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805CBDC
void StartSpellAnimDance(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDance, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805CC14
void efxDance_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        StartSubSpell_efxSongBG(anim, 0);
        StartSubSpell_efxSongOBJ(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 125)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPaletteBuffer + PAL_OFFSET(0x17), 0x20);
        }
        else
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPaletteBuffer + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
