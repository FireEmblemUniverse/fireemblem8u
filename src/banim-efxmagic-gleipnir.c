#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkGrado[] =
{
    PROC_NAME("efxDarkGrado"),
    PROC_REPEAT(efxDarkGrado_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08068B80
void StartSpellAnimGleipnir(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDarkGrado, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08068BB8
void efxDarkGrado_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 2)
    {
        if ((GetBanimDragonStatusType() != EKRDRGON_TYPE_DRACO_ZOMBIE) &&
            (GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING))
        {
            StartSubSpell_efxDarkGradoMapFadeOut();
        }
    }
    else if (proc->timer == duration + 34)
    {
        StartSubSpell_efxDarkGradoBG01(anim);
        PlaySFX(0x3ac, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 96)
    {
        StartSubSpell_efxDarkGradoBG02(anim);
        StartSubSpell_efxDarkGradoOBJ01(anim);
    }
    else if (proc->timer == duration + 206)
    {
        StartSubSpell_efxDarkGradoOBJ02(anim);
    }
    else if (proc->timer == duration + 302)
    {
        NewEfxFlashBgWhite(anim, 10);

        if ((GetBanimDragonStatusType() != EKRDRGON_TYPE_DRACO_ZOMBIE) &&
            (GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING))
        {
            efxDarkGradoRestoreMapBg();
        }

        NewEfxSpellCast();

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 308)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 312)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 9);
        StartSubSpell_efxGespenstBG4(anim, 30);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x3AD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 328)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 8);
    }
    else if (proc->timer == duration + 353)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08068D20
void efxDarkGradoMapFadeOut_Loop(struct ProcEfx * proc)
{
    int ret = Interpolate(INTERPOLATE_SQUARE, 4, 16, proc->timer, 16);

    EfxPalBlackInOut(gPaletteBuffer, 6, 10, ret);
    EnablePaletteSync();

    proc->timer++;

    if (proc->timer == 17)
    {
        proc->timer = 0;
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoMapFadeOut[] =
{
    PROC_NAME("efxDarkGradoMapFadeOut"),
    PROC_REPEAT(efxDarkGradoMapFadeOut_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08068D78
void StartSubSpell_efxDarkGradoMapFadeOut(void)
{
    struct ProcEfx * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoMapFadeOut, PROC_TREE_3);
    proc->timer = 0;

    return;
}

//! FE8U = 0x08068D9C
void efxDarkGradoRestoreMapBg(void)
{
    if (gBanimBG == 0)
    {
        EfxChapterMapFadeOUT(4);
    }
    else
    {
        PutBanimBgPAL(gBanimBG - 1);
        EfxPalBlackInOut(gPaletteBuffer, 6, 10, 0);
        EnablePaletteSync();
    }

    return;
}

//! FE8U = 0x08068DD8
void efxDarkGradoBG01_OnHBlank_13(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xd);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068E14
void efxDarkGradoBG01_OnHBlank_12(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xc);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068E50
void efxDarkGradoBG01_OnHBlank_11(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xb);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068E8C
void efxDarkGradoBG01_OnHBlank_10(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 0xa);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068EC8
void efxDarkGradoBG01_OnHBlank_9(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 9);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068F04
void efxDarkGradoBG01_OnHBlank_8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 8);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068F40
void efxDarkGradoBG01_OnHBlank_7(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 7);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068F7C
void efxDarkGradoBG01_OnHBlank_6(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 6);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068FB8
void efxDarkGradoBG01_OnHBlank_5(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 5);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08068FF4
void efxDarkGradoBG01_OnHBlank_4(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 4);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x08069030
void efxDarkGradoBG01_OnHBlank_3(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 3);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x0806906C
void efxDarkGradoBG01_OnHBlank_2(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 2);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x080690A8
void efxDarkGradoBG01_OnHBlank_1(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        int tmp = gUnk_Banim_Ekrbattle_10;
        int tmp2 = (vcount - 0x3f);
        int result = Div((gUnk_Banim_Ekrbattle_10 - tmp2), 1);

        REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10 - result;
    }

    return;
}

//! FE8U = 0x080690E4
void efxDarkGradoBG01_OnHBlank_0(void)
{
    u16 vcount = REG_VCOUNT + 1;
    REG_BG1VOFS = -gUnk_Banim_Ekrbattle_10;
    return;
}

//! FE8U = 0x08069100
void efxDarkGradoBG01_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    switch (proc->frame)
    {
        case 1:
            switch (proc->timer)
            {
                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_10);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_13);
                    break;
            }

            break;

        case 2:
            switch (proc->timer)
            {
                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_7);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_8);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_10);
                    break;
            }

            break;

        case 3:
            switch (proc->timer)
            {
                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_6);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_8);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_6);
                    break;
            }

            break;

        case 4:
            switch (proc->timer)
            {
                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_4);
                    break;

                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_5);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_4);
                    break;
            }

            break;

        case 5:
            switch (proc->timer)
            {
                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_3);
                    break;

                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_3);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_2);
                    break;
            }

            break;

        default:
            SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
            break;
    }

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        proc->terminator = ret;
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            SetPrimaryHBlankHandler(NULL);
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

u16 * CONST_DATA TsaArray_GleipnirBg_Sigil[] =
{
    Tsa_GleipnirBg_Sigil_0,
    Tsa_GleipnirBg_Sigil_1,
    Tsa_GleipnirBg_Sigil_2,
    Tsa_GleipnirBg_Sigil_3,
    Tsa_GleipnirBg_Sigil_4,
    Tsa_GleipnirBg_Sigil_5,
    Tsa_GleipnirBg_Sigil_6,
    Tsa_GleipnirBg_Sigil_7,
    Tsa_GleipnirBg_Sigil_8,
    Tsa_GleipnirBg_Sigil_9,
    Tsa_GleipnirBg_Sigil_10,
};

u16 * CONST_DATA ImgArray_GleipnirBg_Sigil[] =
{
    Img_Banim_13,
    Img_GleipnirBg_Sigil_0,
    Img_GleipnirBg_Sigil_1,
    Img_GleipnirBg_Sigil_2,
    Img_GleipnirBg_Sigil_3,
    Img_GleipnirBg_Sigil_4,
    Img_GleipnirBg_Sigil_5,
    Img_GleipnirBg_Sigil_6,
    Img_GleipnirBg_Sigil_7,
    Img_GleipnirBg_Sigil_8,
    Img_GleipnirBg_Sigil_9,
};

const u16 gFrameConfig_GleipnirBg_Sigil[] =
{
    0, 24,
    1, 4,
    3, 4,
    4, 4,
    5, 4,
    6, 4,
    7, 4,
    8, 4,
    9, 4,
    10, 4,
    -1,
};

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoBG01[] =
{
    PROC_NAME("efxDarkGradoBG01"),
    PROC_REPEAT(efxDarkGradoBG01_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080692B0
void StartSubSpell_efxDarkGradoBG01(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    gUnk_Banim_Ekrbattle_10 = 0x10;

    proc = Proc_Start(ProcScr_efxDarkGradoBG01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gFrameConfig_GleipnirBg_Sigil;

    proc->tsal = TsaArray_GleipnirBg_Sigil;
    proc->tsar = TsaArray_GleipnirBg_Sigil;
    proc->img = ImgArray_GleipnirBg_Sigil;

    SpellFx_RegisterBgPal(Pal_GleipnirBg_Sigil, PLTT_SIZE_4BPP);

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, -16);
        }
        else
        {
            BG_SetPosition(BG_1, -24, -16);
        }
    }
    else
    {
        BG_SetPosition(BG_1, 0, -16);
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806935C
void efxDarkGradoBG02_Loop_A(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 20);
    }
    else
    {
        if (ret == -6)
        {
            StartSubSpell_efxDarkGradoPalFlash();
            proc->frame++;
        }
        else if (ret == -1)
        {
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

u16 * CONST_DATA TsaArray_GleipnirBg_Nebula[] =
{
    Tsa_GleipnirBg_Nebula_0,
    Tsa_GleipnirBg_Nebula_1,
    Tsa_GleipnirBg_Nebula_2,
    Tsa_GleipnirBg_Nebula_3,
    Tsa_GleipnirBg_Nebula_4,
    Tsa_GleipnirBg_Nebula_5,
    Tsa_GleipnirBg_Nebula_6,
    Tsa_GleipnirBg_Nebula_7,
    Tsa_GleipnirBg_Nebula_8,
    Tsa_GleipnirBg_Nebula_9,
    Tsa_GleipnirBg_Nebula_10,
    Tsa_GleipnirBg_Nebula_11,
    Tsa_GleipnirBg_Nebula_12,
    Tsa_GleipnirBg_Nebula_13,
    Tsa_GleipnirBg_Nebula_14,
    Tsa_GleipnirBg_Nebula_15,
};

u16 * CONST_DATA ImgArray_GleipnirBg_Nebula[] =
{
    Img_GleipnirBg_Nebula_0,
    Img_GleipnirBg_Nebula_1,
    Img_GleipnirBg_Nebula_2,
    Img_GleipnirBg_Nebula_3,
    Img_GleipnirBg_Nebula_4,
    Img_GleipnirBg_Nebula_5,
    Img_GleipnirBg_Nebula_6,
    Img_GleipnirBg_Nebula_7,
    Img_GleipnirBg_Nebula_8,
    Img_GleipnirBg_Nebula_9,
    Img_GleipnirBg_Nebula_10,
    Img_GleipnirBg_Nebula_11,
    Img_GleipnirBg_Nebula_12,
    Img_GleipnirBg_Nebula_13,
    Img_GleipnirBg_Nebula_14,
    Img_GleipnirBg_Nebula_15,
};

u16 * CONST_DATA PalArray_GleipnirBg_Nebula[] =
{
    Pal_GleipnirBg_Nebula_0,
    Pal_GleipnirBg_Nebula_1,
    Pal_GleipnirBg_Nebula_2,
    Pal_GleipnirBg_Nebula_3,
    Pal_GleipnirBg_Nebula_4,
    Pal_GleipnirBg_Nebula_5,
    Pal_GleipnirBg_Nebula_6,
    Pal_GleipnirBg_Nebula_7,
    Pal_GleipnirBg_Nebula_8,
    Pal_GleipnirBg_Nebula_9,
    Pal_GleipnirBg_Nebula_10,
    Pal_GleipnirBg_Nebula_11,
    Pal_GleipnirBg_Nebula_12,
    Pal_GleipnirBg_Nebula_13,
    Pal_GleipnirBg_Nebula_14,
    Pal_GleipnirBg_Nebula_15,
};

u16 * CONST_DATA TsaArray_GleipnirBg_Fog[] =
{
    Tsa_GleipnirBg_Fog,
};

u16 * CONST_DATA ImgArray_GleipnirBg_Fog[] =
{
    Img_GleipnirBg_Fog,
};

u16 * CONST_DATA PalArray_GleipnirBg_Fog[] =
{
    Pal_GleipnirBg_Fog,
};

const u16 gFrameConfig_GleipnirBg_Nebula[] =
{
    0, 6,
    1, 6,
    2, 6,
    3, 6,
    4, 6,
    5, 6,
    6, 6,
    7, 6,
    8, 6,
    9, 6,
    10, 6,
    11, 6,
    12, 6,
    -6, 0,
    13, 6,
    14, 6,
    15, 6,
    -1,
};

const u16 gFrameConfig_GleipnirBg_Fog[] =
{
    0, 96,
    -1,
};

// clang-format on

//! FE8U = 0x080693CC
void efxDarkGradoBG02_0(struct ProcEfxBG * proc)
{
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = gFrameConfig_GleipnirBg_Fog;

    proc->tsal = TsaArray_GleipnirBg_Fog;
    proc->img = ImgArray_GleipnirBg_Fog;

    SpellFx_RegisterBgPal(Pal_GleipnirBg_Fog, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08069400
void efxDarkGradoBG02_Loop_B(struct ProcEfxBG * proc)
{
    s16 ret;

    int x = proc->terminator >> 1;

    if (GetAnimPosition(proc->anim) != 0)
    {
        x = -x;
    }

    BG_SetPosition(BG_1, x, 0);

    proc->terminator++;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 0x14);
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

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoBG02[] =
{
    PROC_NAME("efxDarkGradoBG02"),

    PROC_REPEAT(efxDarkGradoBG02_Loop_A),
    PROC_SLEEP(14),

    PROC_CALL(efxDarkGradoBG02_0),
    PROC_REPEAT(efxDarkGradoBG02_Loop_B),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08069488
void StartSubSpell_efxDarkGradoBG02(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoBG02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gFrameConfig_GleipnirBg_Nebula;

    proc->tsal = TsaArray_GleipnirBg_Nebula;
    proc->img = ImgArray_GleipnirBg_Nebula;
    proc->pal = PalArray_GleipnirBg_Nebula;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(BG_1, 40, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -24, 0);
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(BG_1, 16, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0, 0);
        }
    }

    SpellFx_SetSomeColorEffect();
    SetBlendBackdropB(0);

    return;
}

struct Proc085D84B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x08069528
void efxDarkGradoPalFlash_Init(struct Proc085D84B4 * proc)
{
    proc->unk4C = 0;
    return;
}

#define RGB_(r, g, b) (((b) << 10) | ((g) << 5) | (r))

//! FE8U = 0x08069530
void efxDarkGradoPalFlash_Loop(struct Proc085D84B4 * param_1)
{
    u16 r1;
    int r6;
    u16 * r8, * r9;
    int sp_0c = 0; // redundant initialization
    int sp_18;

    r9 = gPaletteBuffer;
    r8 = gEfxPal;

    if (param_1->unk4C > 0x28)
        r6 = Interpolate(0, 0x10, 0, param_1->unk4C - 0x28, 0x18);
    else if (param_1->unk4C > 0x18)
        r6 = 0x10;
    else
        r6 = Interpolate(0, 0, 0x10, param_1->unk4C, 0x18);

    *r8 = *r9;

    for (sp_0c = 0; sp_0c < 0x20; sp_0c++)
    {
        switch (sp_0c) {
            case 1:
            case 2:
            case 3:
            case 16:
            case 21:
            case 22:
            case 27:
            case 28:
            case 29:
            case 30:
                r1 = 0x00007C1F;
                break;

            default:
                r1 = 0;
                break;
        }

        r9++;
        r8++;

        for (sp_18 = 0; sp_18 < 0xF; sp_18++)
        {
            u8 r = ((*r9 & 0x1f) * (0x10 - r6) + ((r1 & 0x1f) * r6)) >> 4;
            u8 g = (((*r9 >> 5) & 0x1f) * (0x10 - r6) + (((r1 >> 5) & 0x1f) * r6)) >> 4; // ((r1 >> 5) & 0x1f) == 0 given the two colors
            u8 b = (((*r9 >> 10) & 0x1f) * (0x10 - r6) + (((r1 >> 10) & 0x1f) * r6)) >> 4;

            *r8 = RGB_(r & 0x1f, g & 0x1f, b & 0x1f);
            r9++;
            r8++;
        }
    }

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);
    DisablePaletteSync();

    if (param_1->unk4C == 0x40)
        Proc_Break(param_1);

    param_1->unk4C++;

    return;
}

#undef RGB_

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EfxmagicGleipnir_0[] =
{
    PROC_CALL(efxDarkGradoPalFlash_Init),
    PROC_REPEAT(efxDarkGradoPalFlash_Loop),

    PROC_CALL(EnablePaletteSync),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080696F0
void StartSubSpell_efxDarkGradoPalFlash(void)
{
    Proc_Start(ProcScr_EfxmagicGleipnir_0, PROC_TREE_VSYNC);
    return;
}

// clang-format off

s16 CONST_DATA gEfxmagicGleipnir_0[] =
{
    -65, -93,
    -50, -92,
    -38, -90,
    -25, -86,
    -15, -83,
    -5, -77,
    2, -72,
    9, -66,
    14, -60,
    19, -53,
    24, -45,
    28, -37,
    29, -28,
    30, -19,
    30, -10,
    29, -3,
    27, 3,
    23, 8,
    19, 11,
    15, 14,
};

s16 CONST_DATA gEfxmagicGleipnir_1[] =
{
    28, 53,
    13, 51,
    1, 48,
    -13, 44,
    -24, 36,
    -33, 25,
    -39, 16,
    -43, 5,
    -44, -4,
    -43, -13,
    -39, -20,
    -31, -25,
    -23, -25,
    -14, -24,
    -7, -23,
    -1, -20,
    6, -15,
    10, -10,
    12, -4,
    13, 1,
};

s16 CONST_DATA gEfxmagicGleipnir_2[] =
{
    150, 18,
    133, 29,
    118, 35,
    102, 39,
    89, 41,
    78, 42,
    68, 42,
    59, 42,
    48, 40,
    37, 37,
    26, 33,
    18, 29,
    11, 24,
    5, 19,
    0, 15,
    -5, 11,
    -9, 5,
    -12, -1,
    -14, -9,
    -15, -16,
};

s16 CONST_DATA gEfxmagicGleipnir_3[] =
{
    -91, -5,
    -86, -17,
    -80, -28,
    -75, -38,
    -68, -47,
    -59, -55,
    -48, -58,
    -37, -59,
    -26, -58,
    -17, -56,
    -8, -52,
    -1, -48,
    6, -43,
    11, -37,
    14, -29,
    16, -23,
    17, -16,
    17, -10,
    16, -3,
    14, 3,
};

s16 CONST_DATA gEfxmagicGleipnir_4[] =
{
    25, 55,
    15, 53,
    5, 50,
    -5, 46,
    -15, 40,
    -23, 35,
    -30, 28,
    -36, 19,
    -40, 10,
    -43, 1,
    -44, -8,
    -44, -16,
    -42, -24,
    -35, -29,
    -28, -30,
    -21, -30,
    -15, -29,
    -9, -26,
    -4, -23,
    1, -18,
};

s16 CONST_DATA gEfxmagicGleipnir_5[] =
{
    145, -73,
    146, -46,
    143, -22,
    130, 2,
    112, 17,
    97, 24,
    82, 29,
    68, 32,
    54, 35,
    43, 34,
    32, 32,
    22, 30,
    12, 28,
    4, 25,
    -3, 21,
    -9, 16,
    -14, 10,
    -17, 2,
    -18, -5,
    -18, -11,
};

s16 CONST_DATA gEfxmagicGleipnir_6[] =
{
    14, -82,
    28, -78,
    38, -71,
    46, -62,
    52, -52,
    55, -42,
    57, -32,
    57, -23,
    56, -13,
    53, -5,
    50, 2,
    45, 7,
    39, 12,
    34, 15,
    28, 18,
    22, 19,
    17, 19,
    12, 18,
    6, 17,
    0, 14,
};

// clang-format on

//! FE8U = 0x08069704
int efxDarkGradoGetPieceX(int a, int b, int c)
{
    s16 * ptr;

    switch (b)
    {
        case 0:
            ptr = gEfxmagicGleipnir_0;
            break;

        case 1:
            ptr = gEfxmagicGleipnir_1;
            break;

        case 2:
            ptr = gEfxmagicGleipnir_2;
            break;

        case 3:
            ptr = gEfxmagicGleipnir_3;
            break;

        case 4:
            ptr = gEfxmagicGleipnir_4;
            break;

        case 5:
            ptr = gEfxmagicGleipnir_5;
            break;

        default:
            ptr = gEfxmagicGleipnir_6;
            break;
    }

    return (ptr[a * 2] * c) >> 8;
}

//! FE8U = 0x0806977C
int efxDarkGradoGetPieceY(int a, int b, int c)
{
    s16 * ptr;

    switch (b)
    {
        case 0:
            ptr = gEfxmagicGleipnir_0;
            break;

        case 1:
            ptr = gEfxmagicGleipnir_1;
            break;

        case 2:
            ptr = gEfxmagicGleipnir_2;
            break;

        case 3:
            ptr = gEfxmagicGleipnir_3;
            break;

        case 4:
            ptr = gEfxmagicGleipnir_4;
            break;

        case 5:
            ptr = gEfxmagicGleipnir_5;
            break;

        default:
            ptr = gEfxmagicGleipnir_6;
            break;
    }

    return (ptr[a * 2 + 1] * c) >> 8;
}

//! FE8U = 0x080697F4
void efxDarkGradoOBJ01piece_Loop(struct ProcEfxOBJ * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->anim2->xPosition = proc->unk32 + efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }
    else
    {
        proc->anim2->xPosition = proc->unk32 - efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }

    proc->anim2->yPosition = proc->unk3A + efxDarkGradoGetPieceY(proc->timer, proc->unk44, proc->unk48);

    proc->timer++;

    if ((proc->timer == proc->terminator) || (proc->timer == proc->unk4C))
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoOBJ01piece[] =
{
    PROC_NAME("efxDarkGradoOBJ01piece"),
    PROC_REPEAT(efxDarkGradoOBJ01piece_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08069878
void NewEfxDarkGradoOBJ01piece(struct Anim * anim, s16 b, s16 c, s16 d, u16 e)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ01piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 20;

    switch (b)
    {
        case 0:
            scr = AnimScr_EfxDarkGradoOBJ01piece1;
            break;

        case 1:
            scr = AnimScr_EfxDarkGradoOBJ01piece3;
            break;

        case 2:
            scr = AnimScr_EfxDarkGradoOBJ01piece2;
            break;

        default:
            scr = AnimScr_EfxDarkGradoOBJ01piece4;
            break;
    }

    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->unk32 = 88;
    }
    else
    {
        proc->unk32 = 152;
    }

    proc->unk3A = 80;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk32 -= 24;
        }
        else
        {
            proc->unk32 += 24;
        }
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = proc->unk32 + efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }
    else
    {
        frontAnim->xPosition = proc->unk32 - efxDarkGradoGetPieceX(proc->timer, proc->unk44, proc->unk48);
    }

    frontAnim->yPosition = proc->unk3A + efxDarkGradoGetPieceY(proc->timer, proc->unk44, proc->unk48);

    return;
}

//! FE8U = 0x080699A8
void efxDarkGradoOBJ01_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (DivRem(proc->timer, 12) == 0)
    {
        if ((proc->terminator & 1) == 0)
        {
            NewEfxDarkGradoOBJ01piece(proc->anim, (proc->terminator >> 1) & 3, 0, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 2) & 3, 1, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 1) & 3, 2, 0x100, 98 - proc->timer);
        }
        else
        {
            NewEfxDarkGradoOBJ01piece(proc->anim, (proc->terminator >> 1) & 3, 3, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 2) & 3, 4, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 1) & 3, 5, 0x100, 98 - proc->timer);
            NewEfxDarkGradoOBJ01piece(proc->anim, ((proc->terminator >> 1) + 3) & 3, 6, 0x100, 98 - proc->timer);
        }

        proc->terminator++;
    }

    if (proc->timer == 97)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoOBJ01[] =
{
    PROC_NAME("efxDarkGradoOBJ01"),
    PROC_REPEAT(efxDarkGradoOBJ01_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08069AC4
void StartSubSpell_efxDarkGradoOBJ01(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    SpellFx_RegisterObjPal(Pal_GleipnirSprites_Rocks, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_GleipnirSprites_Rocks, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08069AFC
void efxDarkGradoOBJ02piece_Loop(struct ProcEfxOBJ * proc)
{
    proc->unk48 += proc->unk44;

    if (GetAnimPosition(proc->anim) == 0)
    {
        proc->anim2->xPosition = proc->unk32 - (proc->unk48 >> 8);
    }
    else
    {
        proc->anim2->xPosition = (proc->unk48 >> 8) + proc->unk32;
    }

    proc->anim2->yPosition = (proc->unk48 >> 8) + proc->unk3A;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoOBJ02piece[] =
{
    PROC_NAME("efxDarkGradoOBJ02piece"),
    PROC_REPEAT(efxDarkGradoOBJ02piece_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08069B68
void StartSubSpell_efxDarkGradoOBJ02piece_A(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->unk44 = unk;
    proc->unk48 = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDarkGradoOBJ02piece1_L, AnimScr_EfxDarkGradoOBJ02piece1_R, AnimScr_EfxDarkGradoOBJ02piece1_L, AnimScr_EfxDarkGradoOBJ02piece1_R);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = 104;
    frontAnim->yPosition = yPosition;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition -= xOffset;
    }
    else
    {
        frontAnim->xPosition += xOffset;
    }

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            frontAnim->xPosition -= 24;
        }
        else
        {
            frontAnim->xPosition += 24;
        }
    }

    proc->unk32 = frontAnim->xPosition;
    proc->unk3A = frontAnim->yPosition;

    return;
}

//! FE8U = 0x08069C18
void StartSubSpell_efxDarkGradoOBJ02piece_B(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02piece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->unk44 = unk;
    proc->unk48 = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDarkGradoOBJ02piece2_L, AnimScr_EfxDarkGradoOBJ02piece2_R, AnimScr_EfxDarkGradoOBJ02piece2_L, AnimScr_EfxDarkGradoOBJ02piece2_R);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = 120;
    frontAnim->yPosition = yPosition;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition -= xOffset;
    }
    else
    {
        frontAnim->xPosition += xOffset;
    }

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            frontAnim->xPosition -= 24;
        }
        else
        {
            frontAnim->xPosition += 24;
        }
    }

    proc->unk32 = frontAnim->xPosition;
    proc->unk3A = frontAnim->yPosition;

    frontAnim->drawLayerPriority = 20;
    frontAnim->oam2Base |= OAM2_LAYER(3);
    AnimSort();

    return;
}

//! FE8U = 0x08069CDC
void efxDarkGradoOBJ02_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer < 88)
    {
        if ((proc->timer - 3 > 0) && (DivRem(proc->timer - 3, 6) == 0))
        {
            switch (proc->unk44)
            {
                case 0:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -64, -16, 0xa80, 98 - proc->timer);
                    break;

                case 1:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -128, -16, 0x780, 98 - proc->timer);
                    break;

                case 2:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, 0, -16, 0x900, 98 - proc->timer);
                    break;

                case 3:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -64, -16, 0x900, 98 - proc->timer);
                    break;

                case 4:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, -128, -16, 0xa80, 98 - proc->timer);
                    break;

                case 5:
                    StartSubSpell_efxDarkGradoOBJ02piece_A(proc->anim, 0, -16, 0x780, 98 - proc->timer);
                    break;
            }

            proc->unk44++;

            if (proc->unk44 == 6)
            {
                proc->unk44 = 0;
            }
        }

        if ((proc->timer - 1 > 0) && (DivRem(proc->timer - 1, 6) == 0))
        {
            switch (proc->unk48)
            {
                case 0:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -24, 0, 0x540, 98 - proc->timer);
                    break;

                case 1:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -56, 0, 0x3c0, 98 - proc->timer);
                    break;

                case 2:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -88, 0, 0x480, 98 - proc->timer);
                    break;

                case 3:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -24, 0, 0x480, 98 - proc->timer);
                    break;

                case 4:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -56, 0, 0x540, 98 - proc->timer);
                    break;

                case 5:
                    StartSubSpell_efxDarkGradoOBJ02piece_B(proc->anim, -88, 0, 0x3c0, 98 - proc->timer);
                    break;
            }

            proc->unk48++;

            if (proc->unk48 == 6)
            {
                proc->unk48 = 0;
            }
        }
    }

    if (proc->timer == 96)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkGradoOBJ02[] =
{
    PROC_NAME("efxDarkGradoOBJ02"),
    PROC_REPEAT(efxDarkGradoOBJ02_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08069E88
void StartSubSpell_efxDarkGradoOBJ02(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk44 = 0;
    proc->unk48 = 0;

    SpellFx_RegisterObjPal(Pal_GleipnirSprites_Comet, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_GleipnirSprites_Comet, 32 * 4 * CHR_SIZE);

    return;
}
