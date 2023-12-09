#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D6644[] =
{
    PROC_NAME("efxFenrir"),
    PROC_REPEAT(sub_80608E0),
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

    proc = Proc_Start(gUnknown_085D6644, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080608E0
void sub_80608E0(struct ProcEfx * proc)
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
        sub_8060A9C(anim, 100);
        sub_8060B7C(anim, 100);

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
        sub_8060C18(anim, 74);
        PlaySFX(0x131, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 110)
    {
        sub_8060CAC(anim);
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
        sub_8060E90(anim);

        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        PlaySFX(0x133, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 248)
    {
        sub_8060D3C(anim);
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

struct ProcCmd CONST_DATA gUnknown_085D665C[] =
{
    PROC_NAME("efxFenrirBG"),

    PROC_SET_END_CB(sub_8060B2C),
    PROC_REPEAT(sub_8060B48),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08060A9C
void sub_8060A9C(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D665C, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(gUnknown_08651DF4, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(gUnknown_08652734, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(2);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08060B2C
void sub_8060B2C(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08060B48
void sub_8060B48(struct ProcEfxBG * proc)
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
    PROC_MARK(PROC_MARK_A),

    PROC_SET_END_CB(sub_8060BC4),
    PROC_REPEAT(sub_8060BD4),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08060B7C
void sub_8060B7C(struct Anim * anim, int terminator)
{
    // clang-format off
    static const u16 gUnknown_080DD70C[] =
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
    proc->frame_config = gUnknown_080DD70C;

    proc->pal = gUnknown_08652554;
    SpellFx_RegisterBgPal(gUnknown_08652554, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08060BC4
void sub_8060BC4(void)
{
    gEfxBgSemaphore--;
    return;
}

//! FE8U = 0x08060BD4
void sub_8060BD4(struct ProcEfxBGCOL * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D66A4[] =
{
    PROC_NAME("efxFenrirOBJ"),
    PROC_REPEAT(sub_8060C78),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08060C18
void sub_8060C18(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D66A4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_0865C7D4, gUnknown_0865C7D4, gUnknown_0865C7D4, gUnknown_0865C7D4);

    SpellFx_RegisterObjPal(gUnknown_0865BAB8, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0865AF3C, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08060C78
void sub_8060C78(struct ProcEfxOBJ * proc)
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
    PROC_REPEAT(sub_8060DC4),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D66D4[] =
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

u16 * CONST_DATA gUnknown_085D67A0[] =
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
void sub_8060CAC(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD76A[] =
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
    proc->frame_config = gUnknown_080DD76A;

    proc->tsal = gUnknown_085D67A0;
    proc->tsar = gUnknown_085D67A0;
    proc->img = gUnknown_085D66D4;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_086568F4, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
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
void sub_8060D3C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DCD72;

    proc->tsal = gUnknown_085D55B4;
    proc->tsar = gUnknown_085D55B4;
    proc->img = gUnknown_085D5560;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_08656914, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
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
void sub_8060DC4(struct ProcEfxEclipseBG * proc)
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
    PROC_REPEAT(sub_8060ED8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08060E90
void sub_8060E90(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 0;

    SpellFx_RegisterObjPal(gUnknown_0865BAD8, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0865AF3C, 0x1000);

    return;
}

//! FE8U = 0x08060ED8
void sub_8060ED8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        proc->timer = 0;

        sub_8060F24(proc->anim, proc->unk44++);

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

struct ProcCmd CONST_DATA gUnknown_085D6884[] =
{
    PROC_NAME("efxFenrirOBJ2Chiri"),
    PROC_REPEAT(sub_8060FA4),
    PROC_END,
};

int CONST_DATA gUnknown_085D689C[] =
{
    184, 85, 66, 119, 158, 39, 135, 210,
};

// clang-format on

//! FE8U = 0x08060F24
void sub_8060F24(struct Anim * anim, int idx)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6884, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 30;

    proc->unk44 = gUnknown_085D689C[idx & 7];

    otherAnim = NULL;

    switch (idx & 1)
    {
        case 0:
            otherAnim = AnimCreate(gUnknown_0865C77C, 0x78);
            proc->anim2 = otherAnim;

            break;

        case 1:
            otherAnim = AnimCreate(gUnknown_0865C7A8, 0x78);
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
void sub_8060FA4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 300, proc->timer, proc->terminator);

    int x = (ret * gSinLookup[proc->unk44]) >> 12;
    int y = (ret * gSinLookup[proc->unk44 + 0x40]) >> 12;

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