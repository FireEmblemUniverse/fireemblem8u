#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetr[] =
{
    PROC_NAME("efxFimbulvetr"),
    PROC_REPEAT(sub_805E120),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E0E4
void StartSpellAnimFimbulvetr(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();

    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFimbulvetr, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805E120
void sub_805E120(struct ProcEfx * proc)
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
        sub_805E230(anim);
        sub_805E4C4(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 16, 0, 16, 0);
        PlaySFX(0x122, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == duration + 82)
    {
        NewEfxFlashBgWhite(proc->anim, 4);
    }
    else if (proc->timer == duration + 85)
    {
        sub_805E318(anim);
        sub_805E430(anim);
        NewEfxALPHA(anim, 24, 16, 16, 0, 0);
        PlaySFX(0x123, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 88)
    {
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 136) && (proc->timer == duration + 161))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetrBGTR[] =
{
    PROC_NAME("efxFimbulvetrBGTR"),
    PROC_REPEAT(sub_805E2B4),

    PROC_END,
};

u16 * CONST_DATA gUnknown_085D5688[] =
{
    Tsa_08617F24,
    Tsa_08618110,
    Tsa_086182E8,
    Tsa_086184B0,
    Tsa_086186E4,
    Tsa_0861892C,
};

u16 * CONST_DATA gUnknown_085D56A0[] =
{
    Img_086110E0,
    Img_086122E8,
    Img_08613444,
    Img_086144C8,
    Img_08615908,
    Img_08616CC0,
};

// clang-format on

//! FE8U = 0x0805E230
void sub_805E230(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    static const u16 gUnknown_080DCE6E[] =
    {
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         3, 3,
         4, 3,
         5, 3,
        -1,
    };
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBGTR, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCE6E;
    proc->tsal = gUnknown_085D5688;
    proc->tsar = gUnknown_085D5688;
    proc->img = gUnknown_085D56A0;

    SpellFx_RegisterBgPal(gUnknown_08617F04, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805E2B4
void sub_805E2B4(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

struct ProcCmd CONST_DATA gUnknown_085D56B8[] =
{
    PROC_NAME("efxFimbulvetrBG"),
    PROC_REPEAT(sub_805E39C),

    PROC_END,
};

u16 * CONST_DATA gUnknown_085D56D0[] =
{
    Tsa_086101FC,
    Tsa_086102A0,
    Tsa_08610348,
    Tsa_08610404,
    Tsa_086104D8,
    Tsa_086105D4,
    Tsa_08610714,
    Tsa_086108AC,
    Tsa_08610A80,
    Tsa_08610C90,
    Tsa_08610EB0,
};

u16 * CONST_DATA gUnknown_085D56FC[] =
{
    Img_0860A764,
    Img_0860A764,
    Img_0860A764,
    Img_0860A764,
    Img_0860A764,
    Img_0860A764,
    Img_0860BA34,
    Img_0860BA34,
    Img_0860D2E4,
    Img_0860E728,
    Img_0860E728,
};

// clang-format on

//! FE8U = 0x0805E318
void sub_805E318(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    static const u16 gUnknown_080DCEEC[] =
    {
         0,  1,
         1,  1,
         2,  1,
         3,  1,
         4,  1,
         5,  1,
         6,  1,
         7,  1,
         8,  1,
         9,  1,
        10, 30,
        -1,
    };
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D56B8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCEEC;
    proc->tsal = gUnknown_085D56D0;
    proc->tsar = gUnknown_085D56D0;
    proc->img = gUnknown_085D56FC;

    SpellFx_RegisterBgPal(gUnknown_086101DC, PLTT_SIZE_4BPP);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805E39C
void sub_805E39C(struct ProcEfxBG * proc)
{
    int ret;

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

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

struct ProcCmd CONST_DATA gUnknown_085D5728[] =
{
    PROC_NAME("efxFimbulvetrOBJ"),
    PROC_REPEAT(sub_805E494),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E430
void sub_805E430(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5728, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_0861ACB8, gUnknown_0861ACB8, gUnknown_0861ACB8, gUnknown_0861ACB8);
    proc->anim2->xPosition += 24;

    SpellFx_RegisterObjPal(gUnknown_08670528, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08618BBC, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805E494
void sub_805E494(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 51)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5740[] =
{
    PROC_NAME("efxFimbulvetrOBJ2"),
    PROC_REPEAT(sub_805E510),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E4C4
void sub_805E4C4(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5740, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 1;
    proc->unk48 = 0;

    SpellFx_RegisterObjPal(gUnknown_08670528, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08618BBC, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805E510
void sub_805E510(struct ProcEfxOBJ * proc)
{
    int i;

    for (i = 0; i < 32; i++)
    {
        sub_805E53C(proc->anim, i);
    }

    gEfxBgSemaphore--;

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5758[] =
{
    PROC_NAME("efxFimbulvetrOBJ2Fall"),
    PROC_REPEAT(sub_805E694),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E53C
void sub_805E53C(struct Anim * anim, int unk)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    u8 array[8] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5758, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 100;
    proc->unk29 = array[unk & 7];

    anim2 = AnimCreate(gUnknown_0861AD24, 120);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);
    anim2->xPosition = 256;
    anim2->yPosition = 256;

    proc->unk32 = sub_80716B0(UINT16_MAX);
    proc->unk3A = sub_80716B0(UINT16_MAX);

    if (array[unk & 7] == 0)
    {
        proc->unk34 = (sub_80716B0(UINT16_MAX) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk34 = (sub_80716B0(UINT16_MAX) & 0x1FF) + 0xa00;
    }

    proc->unk3C = (sub_80716B0(UINT16_MAX - 240) & 0x3FF) - 0x100;
    proc->unk36 = sub_80716B0(UINT16_MAX - 240);
    proc->unk3E = sub_80716B0(UINT16_MAX - 240);

    if (array[unk & 7] == 0)
    {
        proc->unk38 = (sub_80716B0(UINT16_MAX - 240) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk38 = (sub_80716B0(UINT16_MAX - 240) & 0x1FF) + 0xa00;
    }

    proc->unk40 = (sub_80716B0(UINT16_MAX - 240) & 0x3FF) - 0x100;

    return;
}

//! FE8U = 0x0805E694
void sub_805E694(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
    }
    else
    {
        if (!(proc->timer & 1))
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = gUnknown_0861AD84;
                anim->pScrCurrent = gUnknown_0861AD84;
            }
            else
            {
                anim->pScrStart = gUnknown_0861AD8C;
                anim->pScrCurrent = gUnknown_0861AD8C;
            }

            anim->timer = 0;

            proc->unk32 += proc->unk34;
            proc->unk3A += proc->unk3C;
            anim->xPosition = proc->unk32 >> 8;
            anim->yPosition = proc->unk3A >> 8;
        }
        else
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = gUnknown_0861AD84;
                anim->pScrCurrent = gUnknown_0861AD84;
            }
            else
            {
                anim->pScrStart = gUnknown_0861AD8C;
                anim->pScrCurrent = gUnknown_0861AD8C;
            }

            anim->timer = 0;

            proc->unk3E += proc->unk38;
            proc->unk3E += proc->unk40;
            anim->xPosition = proc->unk36 >> 8;
            anim->yPosition = proc->unk3E >> 8;
        }
    }

    return;
}
