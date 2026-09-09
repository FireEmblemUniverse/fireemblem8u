#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkLongMons[] =
{
    PROC_NAME("efxDarkLongMons"),
    PROC_REPEAT(efxDarkLongMons_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806AEF4
void StartSpellAnimShadowshot(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDarkLongMons, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0806AF30
void efxDarkLongMons_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxDarkLongMonsOBJ(anim);
        PlaySFX(0x3D5, 0x100, 16, 1);
    }
    else if (proc->timer == duration + 43)
    {
        StartSubSpell_efxDarkLongMonsBG02(anim);
    }
    else if (proc->timer == duration + 151)
    {
        StartSubSpell_efxDarkLongMonsFadeToBlack();
    }
    else if (proc->timer == duration + 167)
    {
        StartSubSpell_efxDarkLongMonsBG01(anim);
    }
    else if (proc->timer == duration + 235)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 237)
    {
        StartSpellThing_MagicQuake(proc->anim, 62, 9);
        NewEfxFlashBgWhite(proc->anim, 10);
    }
    else if (proc->timer == duration + 247)
    {
        NewEfxRestWINH_(proc->anim, 70, 1);
        NewEfxTwobaiRST(proc->anim, 50);
        StartSubSpell_efxSuperdruidBG3(proc->anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
        PlaySFX(0x3D6, 0x100, 192, 1);
    }
    else if (proc->timer == duration + 272)
    {
        RegisterEfxSpellCastEnd();
    }
    else if (proc->timer == duration + 299)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806B088
void OnHBlank_0(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        REG_BG1VOFS = (vcount >> 1) - vcount;
    }

    return;
}

//! FE8U = 0x0806B0AC
void efxDarkLongMonsBG01_Loop_A(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(GetAnimAnotherSide(proc->anim), *(tsa + ret), *(tsa + ret));
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

//! FE8U = 0x0806B11C
void efxDarkLongMonsBG01_Loop_B(struct ProcEfxBG * proc)
{
    SetPrimaryHBlankHandler(NULL);
    Proc_Break(proc);
    return;
}

// clang-format off

u16 * CONST_DATA TsaArray_efxDarkLongMonsBG01[] =
{
    Tsa_efxDarkLongMonsBG01_0,
    Tsa_efxDarkLongMonsBG01_1,
    Tsa_efxDarkLongMonsBG01_2,
    Tsa_efxDarkLongMonsBG01_3,
    Tsa_efxDarkLongMonsBG01_4,
    Tsa_efxDarkLongMonsBG01_5,
    Tsa_efxDarkLongMonsBG01_6,
    Tsa_efxDarkLongMonsBG01_7,
    Tsa_efxDarkLongMonsBG01_8,
    Tsa_efxDarkLongMonsBG01_9,
    Tsa_efxDarkLongMonsBG01_10,
    Tsa_efxDarkLongMonsBG01_11,
    Tsa_efxDarkLongMonsBG01_12,
    Tsa_efxDarkLongMonsBG01_13,
    Tsa_efxDarkLongMonsBG01_14,
    Tsa_efxDarkLongMonsBG01_15,
};

u16 * CONST_DATA ImgArray_efxDarkLongMonsBG01[] =
{
    Img_efxDarkLongMonsBG01_0,
    Img_efxDarkLongMonsBG01_1,
    Img_efxDarkLongMonsBG01_2,
    Img_efxDarkLongMonsBG01_3,
    Img_efxDarkLongMonsBG01_4,
    Img_efxDarkLongMonsBG01_5,
    Img_efxDarkLongMonsBG01_6,
    Img_efxDarkLongMonsBG01_7,
    Img_efxDarkLongMonsBG01_8,
    Img_efxDarkLongMonsBG01_9,
    Img_efxDarkLongMonsBG01_10,
    Img_efxDarkLongMonsBG01_11,
    Img_efxDarkLongMonsBG01_12,
    Img_efxDarkLongMonsBG01_13,
    Img_efxDarkLongMonsBG01_14,
    Img_efxDarkLongMonsBG01_15,
};

u16 * CONST_DATA PalArray_efxDarkLongMonsBG01[] =
{
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_0,
    Pal_efxDarkLongMonsBG01_1,
    Pal_efxDarkLongMonsBG01_1,
    Pal_efxDarkLongMonsBG01_2,
    Pal_efxDarkLongMonsBG01_3,
    Pal_efxDarkLongMonsBG01_4,
};

const u16 gFrameConfig_efxDarkLongMonsBG01[] =
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
    -1,
};

struct ProcCmd CONST_DATA ProcScr_efxDarkLongMonsBG01[] =
{
    PROC_NAME("efxDarkLongMonsBG01"),

    PROC_REPEAT(efxDarkLongMonsBG01_Loop_A),
    PROC_REPEAT(efxDarkLongMonsBG01_Loop_B),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806B134
void StartSubSpell_efxDarkLongMonsBG01(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsBG01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxDarkLongMonsBG01;

    proc->tsal = TsaArray_efxDarkLongMonsBG01;
    proc->img = ImgArray_efxDarkLongMonsBG01;
    proc->pal = PalArray_efxDarkLongMonsBG01;

    BG_SetPosition(BG_1, 0, 0);

    SetPrimaryHBlankHandler(OnHBlank_0);

    return;
}

//! FE8U = 0x0806B194
void efxDarkLongMonsBG02_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        SpellFx_WriteBgMap(GetAnimAnotherSide(proc->anim), *(tsa + ret), *(tsa + ret));
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

u16 * CONST_DATA TsaArray_efxDarkLongMonsBG02[] =
{
    Tsa_efxDarkLongMonsBG02_0,
    Tsa_efxDarkLongMonsBG02_1,
    Tsa_efxDarkLongMonsBG02_2,
    Tsa_efxDarkLongMonsBG02_3,
    Tsa_efxDarkLongMonsBG02_4,
    Tsa_efxDarkLongMonsBG02_5,
    Tsa_efxDarkLongMonsBG02_6,
    Tsa_efxDarkLongMonsBG02_7,
    Tsa_efxDarkLongMonsBG02_8,
};

const u16 gFrameConfig_efxDarkLongMonsBG02[] =
{
    0, 8,
    1, 8,
    2, 8,
    3, 8,
    4, 8,
    5, 8,
    6, 8,
    7, 8,
    8, 8,
    6, 8,
    7, 8,
    8, 8,
    6, 8,
    7, 8,
    8, 8,
    -1,
};

struct ProcCmd CONST_DATA ProcScr_efxDarkLongMonsBG02[] =
{
    PROC_NAME("efxDarkLongMonsBG02"),
    PROC_REPEAT(efxDarkLongMonsBG02_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806B1E8
void StartSubSpell_efxDarkLongMonsBG02(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsBG02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxDarkLongMonsBG02;

    proc->tsal = TsaArray_efxDarkLongMonsBG02;

    SpellFx_RegisterBgGfx(Img_efxDarkLongMonsBG, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_efxDarkLongMonsBG, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806B24C
void efxDarkLongMonsOBJ_Loop(struct ProcEfxOBJ * proc)
{
    int timer;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
        return;
    }

    if (proc->timer < 16)
    {
        timer = proc->timer;
    }
    else
    {
        if (proc->timer >= proc->terminator - 16)
        {
            timer = proc->terminator - proc->timer;
        }
        else
        {
            timer = 0;
        }
    }

    if ((timer & 1) == 0)
    {
        if (((timer >> 1) & 1) != 0)
        {
            proc->anim2->yPosition = 224;
        }
        else
        {
            proc->anim2->yPosition = 32;
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkLongMonsOBJ[] =
{
    PROC_NAME("efxDarkLongMonsOBJ"),
    PROC_REPEAT(efxDarkLongMonsOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806B2C0
void StartSubSpell_efxDarkLongMonsOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 188;

    scr = AnimScr_efxDarkLongMonsOBJ;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = 200;
    }
    else
    {
        frontAnim->xPosition = 40;
    }

    frontAnim->yPosition = 32;

    SpellFx_RegisterObjPal(Pal_efxDarkLongMonsOBJ, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_Banim_16, 32 * 4 * CHR_SIZE);

    return;
}

struct Proc085D8AEC
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x0806B33C
void EfxmagicShadowshot_FadeToBlack_Init(struct Proc085D8AEC * proc)
{
    proc->unk4C = 0;
    return;
}

#define RGB_(r, g, b) (((b) << 10) | ((g) << 5) | (r))

//! FE8U = 0x0806B344
void EfxmagicShadowshot_FadeToBlack_Loop(struct Proc085D8AEC * proc)
{
    int sl;
    u16 * r6;
    u16 * r7;
    int sp_08;
    int ip;

    r7 = gPaletteBuffer;
    r6 = gEfxPal;

    if (proc->unk4C > 0x14)
        sl = Interpolate(0, 0x10, 0, proc->unk4C - 0x14, 12);
    else if (proc->unk4C > 12)
        sl = 0x10;
    else
        sl = Interpolate(0, 0, 0x10, proc->unk4C, 12);

    *r6 = *r7;

    for (sp_08 = 0; sp_08 < 0x20; sp_08++)
    {
        switch (sp_08)
        {
            case 2:
            case 3:
            case 16:
            case 21:
            case 22:
            case 27:
            case 28:
            case 29:
            case 30:
                CpuFastCopy(r7, r6, PLTT_SIZE_4BPP);
                r7 += 0x10;
                r6 += 0x10;
                continue;

            default:
                break;
        }

        r7++;
        r6++;

        for (ip = 0; ip < 0xF; ip++)
        {
            u8 r = ((*r7 & 0x1f) * (0x10 - sl)) >> 4;
            u8 g = (((*r7 >> 5) & 0x1f) * (0x10 - sl)) >> 4;
            u8 b = (((*r7 >> 10) & 0x1f) * (0x10 - sl)) >> 4;

            *r6 = RGB_(r & 0x1f, g & 0x1f, b & 0x1f);
            r7++;
            r6++;
        }
    }

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);
    DisablePaletteSync();

    if (proc->unk4C == 0x20)
    {
        Proc_Break(proc);
    }

    proc->unk4C++;

    return;
}

#undef RGB_

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EfxmagicShadowshot_0[] =
{
    PROC_CALL(EfxmagicShadowshot_FadeToBlack_Init),
    PROC_REPEAT(EfxmagicShadowshot_FadeToBlack_Loop),

    PROC_CALL(EnablePaletteSync),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806B4E4
void StartSubSpell_efxDarkLongMonsFadeToBlack(void)
{
    Proc_Start(ProcScr_EfxmagicShadowshot_0, PROC_TREE_VSYNC);
    return;
}
