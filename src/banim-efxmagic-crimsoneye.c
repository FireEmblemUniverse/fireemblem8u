#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxCrimsonEye[] =
{
    PROC_NAME("efxCrimsonEye"),
    PROC_REPEAT(efxCrimsonEye_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08069EC4
void StartSpellAnimCrimsonEye(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxCrimsonEye, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08069F00
void efxCrimsonEye_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 11)
    {
        StartSubSpell_efxCrimsonEyeOBJ(anim);
        PlaySFX(0x3C7, 0x100, 192, 1);
    }
    else if (proc->timer == duration + 145)
    {
        StartSubSpell_efxCrimsonEyeBG(anim);
    }
    else if (proc->timer == duration + 209)
    {
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 217)
    {
        StartSubSpell_efxCrimsonEyeBGFinish1(anim);
        StartSubSpell_efxCrimsonEyeOBJFinish(anim);
        StartSpellThing_MagicQuake(proc->anim, 74, 2);
    }
    else if (proc->timer == duration + 257)
    {
        sub_806C608();
    }
    else if (proc->timer == duration + 265)
    {
        StartSubSpell_efxGorgonBGFinish_(anim);
    }
    else if (proc->timer == duration + 291)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 311)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806A008
void efxCrimsonEyeBGFinish1_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaL + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
    }

    proc->terminator++;

    if (proc->terminator == 48)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

u16 * CONST_DATA TsaArray_efxCrimsonEyeBGFinish1[] =
{
    Tsa_086BC884,
    Tsa_086BCAF8,
    Tsa_086BCD70,
    Tsa_086BCFE8,
};

u16 * CONST_DATA ImgArray_efxCrimsonEyeBGFinish1[] =
{
    Img_086B64BC,
    Img_086B7DA8,
    Img_086B9620,
    Img_086BAF14,
    Img_086B64BC,
    Img_086B7DA8,
    Img_086B9620,
    Img_086BAF14,
};

const u16 gFrameConfig_efxCrimsonEyeBGFinish1[] =
{
    0, 2,
    1, 2,
    2, 2,
    3, 2,
    -2,
};

struct ProcCmd CONST_DATA ProcScr_efxCrimsonEyeBGFinish1[] =
{
    PROC_NAME("efxCrimsonEyeBGFinish1"),
    PROC_REPEAT(efxCrimsonEyeBGFinish1_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806A068
void StartSubSpell_efxCrimsonEyeBGFinish1(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeBGFinish1, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxCrimsonEyeBGFinish1;

    proc->tsal = TsaArray_efxCrimsonEyeBGFinish1;
    proc->img = ImgArray_efxCrimsonEyeBGFinish1;

    SpellFx_RegisterBgPal(Pal_efxCrimsonEyeBGFinish1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SetPrimaryHBlankHandler(OnHBlank_806B088);

    return;
}

//! FE8U = 0x0806A0CC
void efxCrimsonEyeOBJFinishPiece_Loop(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = Interpolate(INTERPOLATE_LINEAR, 120, (s16)proc->unk32, proc->timer, proc->terminator);
    proc->anim2->yPosition = Interpolate(INTERPOLATE_LINEAR, 64, (s16)proc->unk3A, proc->timer, proc->terminator);

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

struct ProcCmd CONST_DATA ProcScr_efxCrimsonEyeOBJFinishPiece[] =
{
    PROC_NAME("efxCrimsonEyeOBJFinishPiece"),
    PROC_REPEAT(efxCrimsonEyeOBJFinishPiece_Loop),
    PROC_END,
};

s16 CONST_DATA gUnknown_085D87DC[] =
{
    0, 0,
    15, -22,
    34, -41,
    56, -56,
    80, -66,
    107, -71,
    133, -71,
    159, -66,
    184, -56,
    206, -41,
    225, -22,
    240, 0,
    250, 24,
    255, 51,
    255, 77,
    250, 103,
    240, 128,
    225, 150,
    206, 169,
    184, 184,
    160, 194,
    133, 199,
    107, 199,
    81, 194,
    56, 184,
    34, 169,
    15, 150,
    0, 128,
    -10, 104,
    -15, 77,
    -15, 51,
    -10, 25,
};

// clang-format on

//! FE8U = 0x0806A138
void StartSubSpell_efxCrimsonEyeOBJFinishPiece(struct Anim * anim, int terminator, u8 c, s8 flag)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJFinishPiece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 1;
    proc->terminator = terminator + 1;

    if (flag)
    {
        scr = AnimScr_EfxCrimsonEyeOBJFinishPiece1;
    }
    else
    {
        scr = AnimScr_EfxCrimsonEyeOBJFinishPiece2;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    proc->unk32 = gUnknown_085D87DC[(c & 0xff) * 2];
    proc->unk3A = gUnknown_085D87DC[((c & 0xff) * 2 + 1)];

    frontAnim->xPosition = Interpolate(INTERPOLATE_LINEAR, 120, (s16)proc->unk32, proc->timer, proc->terminator);
    frontAnim->yPosition = Interpolate(INTERPOLATE_LINEAR, 64, (s16)proc->unk3A, proc->timer, proc->terminator);

    return;
}

//! FE8U = 0x0806A1EC
void efxCrimsonEyeOBJFinish_Loop(struct ProcEfxOBJ * proc)
{
    if (proc->timer < 44)
    {
        switch (proc->timer & 31)
        {
            case 0:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 0, 0);
                break;

            case 4:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 4, 1);
                break;

            case 8:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 1, 0);
                break;

            case 12:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 5, 1);
                break;

            case 16:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 2, 0);
                break;

            case 20:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 6, 1);
                break;

            case 24:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 3, 0);
                break;

            case 28:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 7, 1);
                break;

            case 2:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 8, 0);
                break;

            case 6:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 12, 1);
                break;

            case 10:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 9, 0);
                break;

            case 14:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 13, 1);
                break;

            case 18:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 10, 0);
                break;

            case 22:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 14, 1);
                break;

            case 26:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 11, 0);
                break;

            case 30:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 15, 1);
                break;

            case 1:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 16, 0);
                break;

            case 5:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 20, 1);
                break;

            case 9:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 17, 0);
                break;

            case 13:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 21, 1);
                break;

            case 17:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 18, 0);
                break;

            case 21:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 22, 1);
                break;

            case 25:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 19, 0);
                break;

            case 29:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 23, 1);
                break;

            case 3:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 24, 0);
                break;

            case 7:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 28, 1);
                break;

            case 11:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 25, 0);
                break;

            case 15:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 29, 1);
                break;

            case 19:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 26, 0);
                break;

            case 23:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 30, 1);
                break;

            case 27:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 27, 0);
                break;

            case 31:
                StartSubSpell_efxCrimsonEyeOBJFinishPiece(proc->anim, 6, 31, 1);
                break;
        }
    }

    proc->timer++;

    if (proc->timer == 48)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxCrimsonEyeOBJFinish[] =
{
    PROC_NAME("efxCrimsonEyeOBJFinish"),
    PROC_REPEAT(efxCrimsonEyeOBJFinish_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806A3CC
void StartSubSpell_efxCrimsonEyeOBJFinish(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJFinish, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806A3F4
void StartSubSpell_efxGorgonBGFinish_(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonBGFinish, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxGorgonBGFinish;

    proc->tsal = TsaArray_efxGorgonBGFinish;
    proc->img = ImgArray_efxGorgonBGFinish;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -24, 0);
        }
    }
    else
    {
        BG_SetPosition(BG_1, 0, 0);
    }

    SpellFx_RegisterBgPal(Pal_efxGorgonBGFinish, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x0806A47C
void efxCrimsonEyeBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        SpellFx_WriteBgMap(proc->anim, *(tsa + ret), *(tsa + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

u16 * CONST_DATA TsaArray_efxCrimsonEyeBG[] =
{
    Tsa_086B5ECC,
    Tsa_086B5F78,
    Tsa_086B603C,
    Tsa_086B6100,
    Tsa_086B61C4,
    Tsa_086B6288,
    Tsa_086B634C,
    Tsa_086B6410,
};

const u16 gFrameConfig_efxCrimsonEyeBG[] =
{
    0, 4,
    1, 4,
    2, 4,
    3, 4,
    4, 4,
    5, 4,
    6, 4,
    7, 36,
    -1,
};

struct ProcCmd CONST_DATA ProcScr_efxCrimsonEyeBG[] =
{
    PROC_NAME("efxCrimsonEyeBG"),
    PROC_REPEAT(efxCrimsonEyeBG_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806A4CC
void StartSubSpell_efxCrimsonEyeBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxCrimsonEyeBG;

    proc->tsal = TsaArray_efxCrimsonEyeBG;

    SpellFx_RegisterBgGfx(Img_efxCrimsonEyeBG, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_efxCrimsonEyeBG, PLTT_SIZE_4BPP);

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -24, 0);
        }
    }
    else
    {
        BG_SetPosition(BG_1, 0, 0);
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806A560
int sub_806A560(int a)
{
    while (a < 0)
    {
        a += 90;
    }

    while (a >= 90)
    {
        a -= 90;
    }

    return a;
}

//! FE8U = 0x0806A578
void sub_806A578(struct Anim * anim, u32 b)
{
    if (b - 22 > 44)
    {
        anim->drawLayerPriority = 120;
    }
    else
    {
        anim->drawLayerPriority = 20;
    }

    return;
}

//! FE8U = 0x0806A590
void sub_806A590(int index, int denom, int c)
{
    if (c > 45)
    {
        c = 90 - c;
    }

    denom = (Interpolate(INTERPOLATE_LINEAR, 256, 128, c, 45) * denom) >> 8;

    if (denom < 2)
    {
        denom = 2;
    }

    // clang-format off
    SetObjAffine(
        index,
        Div(+COS(0) * 16, denom),
        Div(-SIN(0) * 16, denom),
        Div(+SIN(0) * 16, denom),
        Div(+COS(0) * 16, denom)
    );
    // clang-format on

    return;
}

// clang-format off

s8 CONST_DATA gUnknown_085D88AC[] =
{
    0, 30,
    -2, 30,
    -4, 30,
    -6, 29,
    -8, 29,
    -10, 28,
    -12, 27,
    -14, 26,
    -16, 25,
    -18, 24,
    -19, 23,
    -21, 22,
    -22, 20,
    -24, 18,
    -25, 17,
    -26, 15,
    -27, 13,
    -28, 11,
    -29, 9,
    -29, 7,
    -30, 5,
    -30, 3,
    -30, 1,
    -30, -1,
    -30, -3,
    -30, -5,
    -29, -7,
    -29, -9,
    -28, -11,
    -27, -13,
    -26, -15,
    -25, -17,
    -24, -18,
    -22, -20,
    -21, -22,
    -19, -23,
    -18, -24,
    -16, -25,
    -14, -26,
    -12, -27,
    -10, -28,
    -8, -29,
    -6, -29,
    -4, -30,
    -2, -30,
    0, -30,
    2, -30,
    4, -30,
    6, -29,
    8, -29,
    10, -28,
    12, -27,
    14, -26,
    16, -25,
    18, -24,
    19, -23,
    21, -22,
    22, -20,
    24, -18,
    25, -17,
    26, -15,
    27, -13,
    28, -11,
    29, -9,
    29, -7,
    30, -5,
    30, -3,
    30, -1,
    30, 1,
    30, 3,
    30, 5,
    29, 7,
    29, 9,
    28, 11,
    27, 13,
    26, 15,
    25, 17,
    24, 18,
    22, 20,
    21, 22,
    19, 23,
    18, 24,
    16, 25,
    14, 26,
    12, 27,
    10, 28,
    8, 29,
    6, 29,
    4, 30,
    2, 30,
};

// clang-format on

//! FE8U = 0x0806A634
int sub_806A634(int index, int b)
{
    return (gUnknown_085D88AC[index * 2] * b) >> 8;
}

//! FE8U = 0x0806A64C
int sub_806A64C(int index, int b)
{
    return (gUnknown_085D88AC[index * 2 + 1] * b) >> 10;
}

//! FE8U = 0x0806A664
int sub_806A664(int a, int b)
{
    int var;

    int r6 = sub_806A634(b, 0x100);

    if (b == 0 || b == 45)
    {
        return r6;
    }

    if (b <= 21)
    {
        var = b;
    }
    else if (b <= 44)
    {
        var = 45 - b;
    }
    else if (b < 66)
    {

        var = b - 45;
    }
    else
    {
        var = 90 - b;
    }

    a = Interpolate(INTERPOLATE_LINEAR, a >> 1, a, var, 22);

    if (b <= 44)
    {
        return r6 - a;
    }
    else
    {
        return r6 + a;
    }
}

//! FE8U = 0x0806A6C4
int sub_806A6C4(int a, int b)
{
    int var = sub_806A64C(b, 0x100);

    if (b > 45)
    {
        b = 90 - b;
    }

    a = Interpolate(INTERPOLATE_LINEAR, a, a >> 1, b, 45);

    return var - a;
}

//! FE8U = 0x0806A6FC
void sub_806A6FC(int index, int b, int c)
{
    int hi;
    int lo;
    int denom;

    if (c > 45)
    {
        c = 90 - c;
    }

    hi = Interpolate(INTERPOLATE_LINEAR, 128, 32, b, 24);
    lo = Interpolate(INTERPOLATE_LINEAR, 256, 384, b, 24);

    denom = Interpolate(INTERPOLATE_LINEAR, lo, hi, c, 45);

    if (denom < 2)
    {
        denom = 2;
    }

    // clang-format off
    SetObjAffine(
        index,
        Div(+COS(0) * 16, denom),
        Div(-SIN(0) * 16, denom),
        Div(+SIN(0) * 16, denom),
        Div(+COS(0) * 16, denom)
    );
    // clang-format on

    return;
}

//! FE8U = 0x0806A7C4
void efxCrimsonEyeOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    for (i = 0; i < 5; i++)
    {
        switch (i)
        {
            case 0:
                anim = proc->anim2;
                index = 31;
                break;

            case 1:
                anim = proc->anim3;
                index = 30;
                break;

            case 2:
                anim = proc->anim4;
                index = 29;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 28;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 27;
                break;
        }

        var = sub_806A560(i * 18);
        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + Interpolate(INTERPOLATE_RSQUARE, sub_806A634(var, 0), sub_806A634(var, 0x100), proc->timer, 0x10);
        anim->yPosition = proc->unk3A + Interpolate(INTERPOLATE_RSQUARE, sub_806A64C(var, 0), sub_806A64C(var, 0x100), proc->timer, 0x10);

        sub_806A590(index, Interpolate(INTERPOLATE_RSQUARE, 2, 0x100, proc->timer, 0x10), var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 16)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806A8E8
void efxCrimsonEyeOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    for (i = 0; i < 5; i++)
    {
        switch (i)
        {
            case 0:
                anim = proc->anim2;
                index = 31;
                break;

            case 1:
                anim = proc->anim3;
                index = 30;
                break;

            case 2:
                anim = proc->anim4;
                index = 29;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 28;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 27;
                break;
        }

        var = i * 18 + proc->terminator;
        var = sub_806A560(var);

        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + sub_806A634(var, 0x100);
        anim->yPosition = proc->unk3A + sub_806A64C(var, 0x100);

        sub_806A590(index, 0x100, var);
    }

    AnimSort();

    proc->terminator++;

    proc->timer++;

    if (proc->timer == 126)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806A9C4
void efxCrimsonEyeOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    int ret = Interpolate(INTERPOLATE_RSQUARE, 0, 24, proc->timer, 16);

    for (i = 0; i < 5; i++)
    {
        switch (i)
        {
            case 0:
                anim = proc->anim2;
                index = 31;
                break;

            case 1:
                anim = proc->anim3;
                index = 30;
                break;

            case 2:
                anim = proc->anim4;
                index = 29;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 28;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 27;
                break;
        }

        var = i * 18 + proc->terminator;
        var = sub_806A560(var);
        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + sub_806A664(ret, var);
        anim->yPosition = proc->unk3A + sub_806A6C4(ret, var);

        sub_806A6FC(index, ret, var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 16)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806AAA0
void efxCrimsonEyeOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    for (i = 0; i < 5; i++)
    {
        switch (i)
        {
            case 0:
                anim = proc->anim2;
                index = 31;
                break;

            case 1:
                anim = proc->anim3;
                index = 30;
                break;

            case 2:
                anim = proc->anim4;
                index = 29;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 28;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 27;
                break;
        }

        var = i * 18 + proc->terminator;
        var = sub_806A560(var);

        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + Interpolate(INTERPOLATE_SQUARE, sub_806A664(24, var), 0, proc->timer, 8);
        anim->yPosition = proc->unk3A + Interpolate(INTERPOLATE_SQUARE, sub_806A6C4(24, var), 0, proc->timer, 8);

        sub_806A6FC(index, Interpolate(INTERPOLATE_SQUARE, 24, 0, proc->timer, 8), var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 8)
    {
        gEfxBgSemaphore--;

        AnimDelete(proc->anim2);
        AnimDelete(proc->anim3);
        AnimDelete(proc->anim4);
        AnimDelete((struct Anim *)(proc->unk44));
        AnimDelete((struct Anim *)(proc->unk48));

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxCrimsonEyeOBJ[] =
{
    PROC_NAME("efxCrimsonEyeOBJ"),

    PROC_REPEAT(efxCrimsonEyeOBJ_Loop_A),
    PROC_SLEEP(16),

    PROC_REPEAT(efxCrimsonEyeOBJ_Loop_B),
    PROC_SLEEP(16),

    PROC_REPEAT(efxCrimsonEyeOBJ_Loop_C),
    PROC_REPEAT(efxCrimsonEyeOBJ_Loop_D),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806ABCC
void StartSubSpell_efxCrimsonEyeOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    if (GetAnimPosition(anim) == 0)
    {
        proc->unk32 = 88;
    }
    else
    {
        proc->unk32 = 152;
    }

    proc->unk3A = 72;

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

    proc->unk32 -= 16;
    proc->unk3A -= 16;

    scr = AnimScr_EfxCrimsonEyeOBJ;

    proc->anim2 = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x3E000300;

    proc->anim3 = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x3C000300;

    proc->anim4 = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x3A000300;

    (struct Anim *)(proc->unk44) = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x38000300;

    (struct Anim *)(proc->unk48) = frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    frontAnim->xPosition = proc->unk32;
    frontAnim->yPosition = proc->unk3A;
    frontAnim->oamBase = 0x36000300;

    // clang-format off
    SetObjAffine(
        31,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        30,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        29,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        28,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        27,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );
    // clang-format on

    SpellFx_RegisterObjPal(Pal_CrimsonEyeSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_CrimsonEyeSprites, 32 * 4 * CHR_SIZE);

    return;
}
