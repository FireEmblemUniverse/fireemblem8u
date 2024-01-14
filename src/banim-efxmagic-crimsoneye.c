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
    PROC_REPEAT(sub_8069F00),
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
void sub_8069F00(struct ProcEfx * proc)
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
        sub_806ABCC(anim);
        PlaySFX(0x3C7, 0x100, 192, 1);
    }
    else if (proc->timer == duration + 145)
    {
        sub_806A4CC(anim);
    }
    else if (proc->timer == duration + 209)
    {
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 217)
    {
        sub_806A068(anim);
        sub_806A3CC(anim);
        StartSpellThing_MagicQuake(proc->anim, 74, 2);
    }
    else if (proc->timer == duration + 257)
    {
        sub_806C608();
    }
    else if (proc->timer == duration + 265)
    {
        sub_806A3F4(anim);
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
void sub_806A008(struct ProcEfxBG * proc)
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

u16 * CONST_DATA gUnknown_085D877C[] =
{
    Tsa_086BC884,
    Tsa_086BCAF8,
    Tsa_086BCD70,
    Tsa_086BCFE8,
};

u16 * CONST_DATA gUnknown_085D878C[] =
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

const u16 gUnknown_080DEEC2[] =
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
    PROC_REPEAT(sub_806A008),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806A068
void sub_806A068(struct Anim * anim)
{

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeBGFinish1, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DEEC2;

    proc->tsal = gUnknown_085D877C;
    proc->img = gUnknown_085D878C;

    SpellFx_RegisterBgPal(gUnknown_086BC824, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SetPrimaryHBlankHandler(sub_806B088);

    return;
}

//! FE8U = 0x0806A0CC
void sub_806A0CC(struct ProcEfxOBJ * proc)
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
    PROC_REPEAT(sub_806A0CC),
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
void sub_806A138(struct Anim * anim, int terminator, u8 c, s8 flag)
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
        scr = gUnknown_086B5984;
    }
    else
    {
        scr = gUnknown_086B598C;
    }

    frontAnim = (void *)EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    proc->unk32 = gUnknown_085D87DC[(c & 0xff) * 2];
    proc->unk3A = gUnknown_085D87DC[((c & 0xff) * 2 + 1)];

    frontAnim->xPosition = Interpolate(INTERPOLATE_LINEAR, 0x78, (s16)proc->unk32, proc->timer, proc->terminator);
    frontAnim->yPosition = Interpolate(INTERPOLATE_LINEAR, 0x40, (s16)proc->unk3A, proc->timer, proc->terminator);

    return;
}

//! FE8U = 0x0806A1EC
void sub_806A1EC(struct ProcEfxOBJ * proc)
{
    if (proc->timer < 0x2c)
    {
        switch (proc->timer & 0x1f)
        {
            case 0:
                sub_806A138(proc->anim, 6, 0, 0);
                break;

            case 4:
                sub_806A138(proc->anim, 6, 4, 1);
                break;

            case 8:
                sub_806A138(proc->anim, 6, 1, 0);
                break;

            case 12:
                sub_806A138(proc->anim, 6, 5, 1);
                break;

            case 16:
                sub_806A138(proc->anim, 6, 2, 0);
                break;

            case 20:
                sub_806A138(proc->anim, 6, 6, 1);
                break;

            case 24:
                sub_806A138(proc->anim, 6, 3, 0);
                break;

            case 28:
                sub_806A138(proc->anim, 6, 7, 1);
                break;

            case 2:
                sub_806A138(proc->anim, 6, 8, 0);
                break;

            case 6:
                sub_806A138(proc->anim, 6, 12, 1);
                break;

            case 10:
                sub_806A138(proc->anim, 6, 9, 0);
                break;

            case 14:
                sub_806A138(proc->anim, 6, 13, 1);
                break;

            case 18:
                sub_806A138(proc->anim, 6, 10, 0);
                break;

            case 22:
                sub_806A138(proc->anim, 6, 14, 1);
                break;

            case 26:
                sub_806A138(proc->anim, 6, 11, 0);
                break;

            case 30:
                sub_806A138(proc->anim, 6, 15, 1);
                break;

            case 1:
                sub_806A138(proc->anim, 6, 16, 0);
                break;

            case 5:
                sub_806A138(proc->anim, 6, 20, 1);
                break;

            case 9:
                sub_806A138(proc->anim, 6, 17, 0);
                break;

            case 13:
                sub_806A138(proc->anim, 6, 21, 1);
                break;

            case 17:
                sub_806A138(proc->anim, 6, 18, 0);
                break;

            case 21:
                sub_806A138(proc->anim, 6, 22, 1);
                break;

            case 25:
                sub_806A138(proc->anim, 6, 19, 0);
                break;

            case 29:
                sub_806A138(proc->anim, 6, 23, 1);
                break;

            case 3:
                sub_806A138(proc->anim, 6, 24, 0);
                break;

            case 7:
                sub_806A138(proc->anim, 6, 28, 1);
                break;

            case 11:
                sub_806A138(proc->anim, 6, 25, 0);
                break;

            case 15:
                sub_806A138(proc->anim, 6, 29, 1);
                break;

            case 19:
                sub_806A138(proc->anim, 6, 26, 0);
                break;

            case 23:
                sub_806A138(proc->anim, 6, 30, 1);
                break;

            case 27:
                sub_806A138(proc->anim, 6, 27, 0);
                break;

            case 31:
                sub_806A138(proc->anim, 6, 31, 1);
                break;
        }
    }

    proc->timer++;

    if (proc->timer == 0x30)
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
    PROC_REPEAT(sub_806A1EC),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806A3CC
void sub_806A3CC(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJFinish, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806A3F4
void sub_806A3F4(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonBGFinish, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DF0E0;

    proc->tsal = gUnknown_085D8C7C;
    proc->img = gUnknown_085D8CA0;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -0x18, 0);
        }
    }
    else
    {
        BG_SetPosition(BG_1, 0, 0);
    }

    SpellFx_RegisterBgPal(gUnknown_086B5A2C, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x0806A47C
void sub_806A47C(struct ProcEfxBG * proc)
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

u16 * CONST_DATA gUnknown_085D8874[] =
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

const u16 gUnknown_080DEF20[] =
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
    PROC_REPEAT(sub_806A47C),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806A4CC
void sub_806A4CC(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DEF20;

    proc->tsal = gUnknown_085D8874;

    SpellFx_RegisterBgGfx(gUnknown_086B5A4C, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_086B5EAC, PLTT_SIZE_4BPP);

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -0x18, 0);
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
        a += 0x5a;
    }

    while (a >= 0x5a)
    {
        a -= 0x5a;
    }

    return a;
}

//! FE8U = 0x0806A578
void sub_806A578(struct Anim * anim, u32 b)
{
    if (b - 0x16 > 0x2c)
    {
        anim->drawLayerPriority = 0x78;
    }
    else
    {
        anim->drawLayerPriority = 0x14;
    }

    return;
}

//! FE8U = 0x0806A590
void sub_806A590(int index, int denom, int c)
{
    if (c > 0x2d)
    {
        c = 0x5a - c;
    }

    denom = (Interpolate(INTERPOLATE_LINEAR, 0x100, 0x80, c, 0x2d) * denom) >> 8;

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

    if (b == 0 || b == 0x2d)
    {
        return r6;
    }

    if (b <= 0x15)
    {
        var = b;
    }
    else if (b <= 0x2c)
    {
        var = 0x2d - b;
    }
    else if (b < 0x42)
    {

        var = b - 0x2d;
    }
    else
    {
        var = 0x5a - b;
    }

    a = Interpolate(INTERPOLATE_LINEAR, a >> 1, a, var, 0x16);

    if (b <= 0x2c)
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

    if (b > 0x2d)
    {
        b = 0x5a - b;
    }

    a = Interpolate(INTERPOLATE_LINEAR, a, a >> 1, b, 0x2d);

    return var - a;
}

//! FE8U = 0x0806A6FC
void sub_806A6FC(int index, int b, int c)
{
    int hi;
    int lo;
    int denom;

    if (c > 0x2d)
    {
        c = 0x5a - c;
    }

    hi = Interpolate(INTERPOLATE_LINEAR, 0x80, 0x20, b, 0x18);
    lo = Interpolate(INTERPOLATE_LINEAR, 0x100, 0x180, b, 0x18);

    denom = Interpolate(INTERPOLATE_LINEAR, lo, hi, c, 0x2d);

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
void sub_806A7C4(struct ProcEfxOBJ * proc)
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
                index = 0x1f;
                break;

            case 1:
                anim = proc->anim3;
                index = 0x1e;
                break;

            case 2:
                anim = proc->anim4;
                index = 0x1d;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 0x1c;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 0x1b;
                break;
        }

        var = sub_806A560(i * 0x12);
        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + Interpolate(INTERPOLATE_RSQUARE, sub_806A634(var, 0), sub_806A634(var, 0x100), proc->timer, 0x10);
        anim->yPosition = proc->unk3A + Interpolate(INTERPOLATE_RSQUARE, sub_806A64C(var, 0), sub_806A64C(var, 0x100), proc->timer, 0x10);

        sub_806A590(index, Interpolate(INTERPOLATE_RSQUARE, 2, 0x100, proc->timer, 0x10), var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806A8E8
void sub_806A8E8(struct ProcEfxOBJ * proc)
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
                index = 0x1f;
                break;

            case 1:
                anim = proc->anim3;
                index = 0x1e;
                break;

            case 2:
                anim = proc->anim4;
                index = 0x1d;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 0x1c;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 0x1b;
                break;
        }

        var = i * 0x12 + proc->terminator;
        var = sub_806A560(var);

        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + sub_806A634(var, 0x100);
        anim->yPosition = proc->unk3A + sub_806A64C(var, 0x100);

        sub_806A590(index, 0x100, var);
    }

    AnimSort();

    proc->terminator++;

    proc->timer++;

    if (proc->timer == 0x7e)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806A9C4
void sub_806A9C4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int index;
    int i;
    int var;

    int ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0x18, proc->timer, 0x10);

    for (i = 0; i < 5; i++)
    {
        switch (i)
        {
            case 0:
                anim = proc->anim2;
                index = 0x1f;
                break;

            case 1:
                anim = proc->anim3;
                index = 0x1e;
                break;

            case 2:
                anim = proc->anim4;
                index = 0x1d;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 0x1c;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 0x1b;
                break;
        }

        var = i * 0x12 + proc->terminator;
        var = sub_806A560(var);
        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + sub_806A664(ret, var);
        anim->yPosition = proc->unk3A + sub_806A6C4(ret, var);

        sub_806A6FC(index, ret, var);
    }

    AnimSort();

    proc->timer++;

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806AAA0
void sub_806AAA0(struct ProcEfxOBJ * proc)
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
                index = 0x1f;
                break;

            case 1:
                anim = proc->anim3;
                index = 0x1e;
                break;

            case 2:
                anim = proc->anim4;
                index = 0x1d;
                break;

            case 3:
                anim = (struct Anim *)proc->unk44;
                index = 0x1c;
                break;

            case 4:
                anim = (struct Anim *)proc->unk48;
                index = 0x1b;
                break;
        }

        var = i * 0x12 + proc->terminator;
        var = sub_806A560(var);

        sub_806A578(anim, var);

        anim->xPosition = proc->unk32 + Interpolate(INTERPOLATE_SQUARE, sub_806A664(0x18, var), 0, proc->timer, 8);
        anim->yPosition = proc->unk3A + Interpolate(INTERPOLATE_SQUARE, sub_806A6C4(0x18, var), 0, proc->timer, 8);

        sub_806A6FC(index, Interpolate(INTERPOLATE_SQUARE, 0x18, 0, proc->timer, 8), var);
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

    PROC_REPEAT(sub_806A7C4),
    PROC_SLEEP(16),

    PROC_REPEAT(sub_806A8E8),
    PROC_SLEEP(16),

    PROC_REPEAT(sub_806A9C4),
    PROC_REPEAT(sub_806AAA0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806ABCC
void sub_806ABCC(struct Anim * anim)
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
        proc->unk32 = 0x58;
    }
    else
    {
        proc->unk32 = 0x98;
    }

    proc->unk3A = 0x48;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk32 -= 0x18;
        }
        else
        {
            proc->unk32 += 0x18;
        }
    }

    proc->unk32 -= 0x10;
    proc->unk3A -= 0x10;

    scr = gUnknown_086B5974;

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
        0x1f,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        0x1e,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        0x1d,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        0x1c,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );

    SetObjAffine(
        0x1b,
        Div(+COS(0) * 16, 2),
        Div(-SIN(0) * 16, 2),
        Div(+SIN(0) * 16, 2),
        Div(+COS(0) * 16, 2)
    );
    // clang-format on

    SpellFx_RegisterObjPal(gUnknown_086B58DC, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086B5580, 32 * 4 * CHR_SIZE);

    return;
}
