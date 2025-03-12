#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFenrir[] =
{
    PROC_NAME("efxFenrir"),
    PROC_REPEAT(efxFenrir_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080608A4
void StartSpellAnimFenrir(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFenrir, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080608E0
void efxFenrir_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxFenrirBG(anim, 100);
        StartSubSpell_efxFenrirBGCOL(anim, 100);

        NewefxRestRST(anim, 100, 2, 0x100, 1);
        NewEfxRestWINH_(anim, 105, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 70, 15, 16, 0, 0);

        PlaySFX(0x130, 0x100, 120, 0);

        return;
    }

    if (proc->timer == duration + 40)
    {
        StartSubSpell_efxFenrirOBJ(anim, 74);
        PlaySFX(0x131, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 110)
    {
        StartSubSpell_efxFenrirBG2_A(anim);
    }
    else if (proc->timer == duration + 111)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 139)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 153)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 167)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 181)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 195)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 209)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 238)
    {
        NewEfxFlashBgWhite(anim, 10);
        StartSubSpell_efxFenrirOBJ2(anim);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        PlaySFX(0x133, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 248)
    {
        StartSubSpell_efxFenrirBG2_B(anim);
        NewEfxALPHA(anim, 18, 8, 16, 0, 0);
    }
    else if ((proc->timer != duration + 290) && (proc->timer == duration + 300))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFenrirBG[] =
{
    PROC_NAME("efxFenrirBG"),

    PROC_SET_END_CB(efxFenrirBG_OnEnd),
    PROC_REPEAT(efxFenrirBG_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08060A9C
void StartSubSpell_efxFenrirBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_FenrirBg_Sigils, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_FenrirBg_Sigils, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(2);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08060B2C
void efxFenrirBG_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08060B48
void efxFenrirBG_Loop(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].y++;
    gLCDControlBuffer.bgoffset[BG_1].x--;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFenrirBGCOL[] =
{
    PROC_NAME("efxFenrirBGCOL"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),

    PROC_SET_END_CB(efxFenrirBGCOL_OnEnd),
    PROC_REPEAT(efxFenrirBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08060B7C
void StartSubSpell_efxFenrirBGCOL(struct Anim * anim, int terminator)
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
        -2,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_EfxFenrirBGCOL;
    SpellFx_RegisterBgPal(Pal_EfxFenrirBGCOL, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08060BC4
void efxFenrirBGCOL_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

//! FE8U = 0x08060BD4
void efxFenrirBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret > -1)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }

    proc->timer2++;

    if (proc->timer2 > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFenrirOBJ[] =
{
    PROC_NAME("efxFenrirOBJ"),
    PROC_REPEAT(efxFenrirOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08060C18
void StartSubSpell_efxFenrirOBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3);

    SpellFx_RegisterObjPal(Pal_FenrirSprites_A, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FenrirSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08060C78
void efxFenrirOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFenrirBG2[] =
{
    PROC_NAME("efxFenrirBG2"),
    PROC_REPEAT(efxFenrirBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_FenrirBg[] =
{
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08652948,
    Img_08653B60,
    Img_08654EB0,
    Img_08655D2C,
};

u16 * CONST_DATA TsaArray_FenrirBg[] =
{
    Tsa_08656934,
    Tsa_086569F0,
    Tsa_08656AAC,
    Tsa_08656B68,
    Tsa_08656C24,
    Tsa_08656CE0,
    Tsa_08656D9C,
    Tsa_08656EA0,
    Tsa_08656FA4,
    Tsa_086570A8,
    Tsa_086571AC,
    Tsa_086572B0,
    Tsa_086573B4,
    Tsa_086574F4,
    Tsa_08657638,
    Tsa_0865777C,
    Tsa_086578C0,
    Tsa_08657A04,
    Tsa_08657B48,
    Tsa_08657CC8,
    Tsa_08657E4C,
    Tsa_08657FD0,
    Tsa_08658130,
    Tsa_08658290,
    Tsa_086583F0,
    Tsa_08658594,
    Tsa_08658738,
    Tsa_086588DC,
    Tsa_08658A4C,
    Tsa_08658BBC,
    Tsa_08658D2C,
    Tsa_08658ED0,
    Tsa_08659074,
    Tsa_08659218,
    Tsa_0865938C,
    Tsa_08659500,
    Tsa_08659674,
    Tsa_08659824,
    Tsa_086599D4,
    Tsa_08659B84,
    Tsa_08659CF8,
    Tsa_08659E6C,
    Tsa_08659FE0,
    Tsa_0865A194,
    Tsa_0865A348,
    Tsa_0865A4FC,
    Tsa_0865A674,
    Tsa_0865A7EC,
    Tsa_0865A964,
    Tsa_0865ABBC,
    Tsa_0865ADC4,
};

// clang-format on

//! FE8U = 0x08060CAC
void StartSubSpell_efxFenrirBG2_A(struct Anim * anim)
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
         3, 2,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         9, 2,
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        15, 2,
        18, 2,
        19, 2,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        21, 2,
        24, 2,
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        27, 2,
        30, 2,
        31, 2,
        32, 2,
        33, 2,
        34, 2,
        35, 2,
        33, 2,
        36, 2,
        37, 2,
        38, 2,
        39, 2,
        40, 2,
        41, 2,
        39, 2,
        42, 2,
        43, 2,
        44, 2,
        45, 2,
        46, 2,
        47, 2,
        45, 2,
        46, 2,
        47, 2,
        45, 2,
        46, 2,
        47, 2,
        48, 1,
        49, 1,
        50, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_FenrirBg;
    proc->tsar = TsaArray_FenrirBg;
    proc->img = ImgArray_FenrirBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_FenrirBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}

//! FE8U = 0x08060D3C
void StartSubSpell_efxFenrirBG2_B(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConfig_AnimaHitBG;

    proc->tsal = TsaLut_AnimaHitBG;
    proc->tsar = TsaLut_AnimaHitBG;
    proc->img = ImgLut_AnimaHitBG;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EfxFenrirBG2_B, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}

//! FE8U = 0x08060DC4
void efxFenrirBG2_Loop(struct ProcEfxEclipseBG * proc)
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

        if (gEkrDistanceType != 0)
        {
            if (GetAnimPosition(proc->anim) == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, 0);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }

            BG_EnableSyncByMask(BG1_SYNC_BIT);
        }
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

struct ProcCmd CONST_DATA ProcScr_efxFenrirOBJ2[] =
{
    PROC_NAME("efxFenrirOBJ2"),
    PROC_REPEAT(efxFenrirOBJ2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08060E90
void StartSubSpell_efxFenrirOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 0;

    SpellFx_RegisterObjPal(Pal_FenrirSprites_B, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FenrirSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08060ED8
void efxFenrirOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        proc->timer = 0;

        StartSubSpell_efxFenrirOBJ2Chiri(proc->anim, proc->unk44++);

        proc->terminator++;

        if (proc->terminator == 8)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFenrirOBJ2Chiri[] =
{
    PROC_NAME("efxFenrirOBJ2Chiri"),
    PROC_REPEAT(efxFenrirOBJ2Chiri_Loop),
    PROC_END,
};

int CONST_DATA gFenrirSpriteAngles[] =
{
    184, 85, 66, 119, 158, 39, 135, 210,
};

// clang-format on

//! FE8U = 0x08060F24
void StartSubSpell_efxFenrirOBJ2Chiri(struct Anim * anim, int idx)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2Chiri, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 30;

    proc->unk44 = gFenrirSpriteAngles[idx & 7];

    otherAnim = NULL;

    switch (idx & 1)
    {
        case 0:
            otherAnim = AnimCreate(AnimScr_EfxFenrir1, 120);
            proc->anim2 = otherAnim;

            break;

        case 1:
            otherAnim = AnimCreate(AnimScr_EfxFenrir2, 120);
            proc->anim2 = otherAnim;

            break;
    }

    otherAnim->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);

    otherAnim->xPosition = anim->xPosition;
    proc->unk32 = anim->xPosition;

    otherAnim->yPosition = anim->yPosition;
    proc->unk3A = anim->yPosition;

    return;
}

//! FE8U = 0x08060FA4
void efxFenrirOBJ2Chiri_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 300, proc->timer, proc->terminator);

    int x = (ret * gSinLookup[proc->unk44]) >> 12;
    int y = (ret * gSinLookup[proc->unk44 + 64]) >> 12;

    anim->xPosition = x + proc->unk32;
    anim->yPosition = y + proc->unk3A;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}