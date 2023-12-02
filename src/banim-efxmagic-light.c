#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5CF0[] =
{
    PROC_NAME("efxLightning"),
    PROC_REPEAT(sub_805F8F0),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805F8B4
void sub_805F8B4(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D5CF0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805F8F0
void sub_805F8F0(struct ProcEfx * proc)
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
        PlaySFX(0x120, 0x100, anim->xPosition, 1);
        sub_805F9A8(anim);
    }
    else if (proc->timer == duration + 26)
    {
        PlaySFX(0x00000121, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(proc->anim, 4);

        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 47) && (proc->timer == duration + 48))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5D08[] =
{
    PROC_NAME("efxLightningBG"),
    PROC_REPEAT(sub_805FA28),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D5D20[] =
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

u16 * CONST_DATA gUnknown_085D5DA4[] =
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

u16 * CONST_DATA gUnknown_085D5E28[] =
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

//! FE8U = 0x0805F9A8
void sub_805F9A8(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD288[] =
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

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5D08, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD288;
    proc->tsal = gUnknown_085D5E28;
    proc->tsar = gUnknown_085D5E28;
    proc->img = gUnknown_085D5D20;
    proc->pal = gUnknown_085D5DA4;

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

//! FE8U = 0x0805FA28
void sub_805FA28(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != 0)
        {
            int pos = GetAnimPosition(proc->anim);
            if (pos == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, pos);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }
        }
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5EAC[] =
{
    PROC_NAME("efxPurge"),
    PROC_REPEAT(sub_805FB60),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FAE0
void StartSpellAnimPurge(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D5EAC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    gUnknown_02020044 = 0;

    return;
}

//! FE8U = 0x0805FB24
void sub_805FB24(int location, int type)
{
    if (gUnknown_02020044 & 1)
    {
        PlaySFX(0xfe, 0x100, location, type);
    }
    else
    {
        PlaySFX(0xff, 0x100, location, type);
    }

    gUnknown_02020044++;

    return;
}

//! FE8U = 0x0805FB60
void sub_805FB60(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 4);
        sub_805FC90(anim);
        sub_805FD5C(anim);
        sub_805FB24(0x30, 0);
        return;
    }
    else if (proc->timer == duration + 21)
    {
        NewEfxFlashBgWhite(anim, 4);
        sub_805FB24(0xa0, 0);
        return;
    }
    else if (proc->timer == duration + 41)
    {
        NewEfxFlashBgWhite(anim, 4);
        sub_805FB24(0x70, 0);
        return;
    }

    if (proc->timer == duration + 61)
    {
        NewEfxFlashBgWhite(anim, 4);
        NewEfxALPHA(anim, 3, 10, 0, 16, 0);
        PlaySFX(0x100, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 94)
    {
        NewEfxFlashBgWhite(anim, 4);
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        PlaySFX(0x101, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }

        return;
    }

    if (proc->timer == duration + 105)
    {
        NewEfxALPHA(anim, 0, 20, 8, 0, 0);
        return;
    }

    if (proc->timer != duration + 113)
    {
        return;
    }

    SpellFx_Finish();
    RegisterEfxSpellCastEnd();
    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5EC4[] =
{
    PROC_NAME("efxPurgeBG"),
    PROC_REPEAT(sub_805FCE0),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D5EDC[] =
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
    Img_0865C8C0,
    Img_0865C8C0,
    Img_0865CE1C,
    Img_0865CE1C,
    Img_0865D498,
    Img_0865D498,
    Img_0865DAE4,
    Img_0865DAE4,
    Img_0865E298,
    Img_0865E298,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Img_0865E9A0,
    Img_0865EEBC,
    Img_0865F7BC,
    Img_08660170,
    Img_08660AE4,
    Img_086614B8,
    Img_086614B8,
    Img_086624BC,
    Img_086624BC,
    Img_0866330C,
    Img_08663DF0,
    Img_08664998,
    Img_08665534,
    Img_08665FF4,
    Img_08666A6C,
};

u16 * CONST_DATA gUnknown_085D6014[] =
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
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    Pal_08667D70,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
    Pal_08667D90,
};

u16 * CONST_DATA gUnknown_085D614C[] =
{
    Tsa_08667DB0,
    Tsa_08667ED4,
    Tsa_08667FF4,
    Tsa_08668100,
    Tsa_086681FC,
    Tsa_086682E4,
    Tsa_086683CC,
    Tsa_086684AC,
    Tsa_08668588,
    Tsa_08668668,
    Tsa_0866875C,
    Tsa_08668850,
    Tsa_08668954,
    Tsa_08668A5C,
    Tsa_08668B74,
    Tsa_08668C98,
    Tsa_08668DAC,
    Tsa_08668ED0,
    Tsa_08668FF4,
    Tsa_08669104,
    Tsa_08669204,
    Tsa_086692EC,
    Tsa_086693CC,
    Tsa_086694A8,
    Tsa_08669584,
    Tsa_08669668,
    Tsa_0866975C,
    Tsa_0866984C,
    Tsa_08669950,
    Tsa_08669A58,
    Tsa_08669B6C,
    Tsa_08669C90,
    Tsa_08669DA4,
    Tsa_08669EC8,
    Tsa_08669FE8,
    Tsa_0866A0F4,
    Tsa_0866A1F0,
    Tsa_0866A2D8,
    Tsa_0866A3C0,
    Tsa_0866A4A0,
    Tsa_0866A57C,
    Tsa_0866A65C,
    Tsa_0866A750,
    Tsa_0866A844,
    Tsa_0866A948,
    Tsa_0866AA50,
    Tsa_0866AB68,
    Tsa_0866AC8C,
    Tsa_0866AD9C,
    Tsa_0866AFB0,
    Tsa_0866B16C,
    Tsa_0866B348,
    Tsa_0866B54C,
    Tsa_0866B754,
    Tsa_0866B968,
    Tsa_0866BBC8,
    Tsa_0866BDFC,
    Tsa_0866C070,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Tsa_0866C2B8,
    Tsa_0866C618,
    Tsa_0866C96C,
    Tsa_0866CC7C,
    Tsa_0866CF60,
    Tsa_0866D230,
    Tsa_0866D4C8,
    Tsa_0866D760,
    Tsa_0866D98C,
    Tsa_0866DC40,
    Tsa_0866DF00,
    Tsa_0866E230,
    Tsa_0866E580,
    Tsa_0866E8F8,
    Tsa_0866EC80,
};

// clang-format on

//! FE8U = 0x0805FC90
void sub_805FC90(struct Anim * anim)
{
    // clang-format off
    const static u16 gUnknown_080DD328[] =
    {
         0, 1,
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
        15, 5,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
        25, 1,
        26, 1,
        27, 1,
        28, 1,
        29, 1,
        30, 1,
        31, 5,
        32, 1,
        33, 1,
        34, 1,
        35, 1,
        36, 1,
        37, 1,
        38, 1,
        39, 1,
        40, 1,
        41, 1,
        42, 1,
        43, 1,
        44, 1,
        45, 1,
        46, 1,
        47, 5,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 1,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 1,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 4,
        63, 2,
        64, 2,
        65, 2,
        66, 2,
        67, 2,
        68, 2,
        69, 2,
        70, 2,
        71, 2,
        72, 2,
        73, 2,
        74, 2,
        75, 2,
        76, 2,
        77, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5EC4, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD328;

    proc->tsal = gUnknown_085D614C;
    proc->tsar = gUnknown_085D614C;
    proc->img = gUnknown_085D5EDC;
    proc->pal = gUnknown_085D6014;

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805FCE0
void sub_805FCE0(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D6284[] =
{
    PROC_NAME("efxPurgeOBJRND"),
    PROC_REPEAT(sub_805FD90),
    PROC_SLEEP(69),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FD5C
void sub_805FD5C(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6284, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 7;
    proc->terminator = 0;
    proc->unk48 = 6;

    return;
}

// clang-format off

int CONST_DATA gUnknown_085D62A4[] =
{
    208,  48,
    160, 144,
     64,  64,
    192,  96,
    128,  48,
     32,  96,
     80, 128,
};

// clang-format on

//! FE8U = 0x0805FD90
void sub_805FD90(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->unk44)
    {
        int x;
        int y;

        proc->timer = 0;

        x = gUnknown_085D62A4[proc->terminator * 2];
        y = gUnknown_085D62A4[proc->terminator * 2 + 1];

        sub_805FDFC(proc->anim2, x, y);
        sub_805FB24(x, 1);

        if (++proc->terminator > proc->unk48)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D62DC[] =
{
    PROC_NAME("efxPurgeOBJ"),
    PROC_SET_END_CB(sub_805FE68),
    PROC_SLEEP(69),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FDFC
void sub_805FDFC(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D62DC, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_0866F58C, gUnknown_0866F58C, gUnknown_0866F58C, gUnknown_0866F58C);

    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    SpellFx_RegisterObjPal(gUnknown_0866F2B4, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0866EFF0, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805FE68
void sub_805FE68(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;

    return;
}

//! FE8U = 0x0805FE80
void nullsub_41(struct Anim * anim)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D62FC[] =
{
    PROC_NAME("efxDevine"),
    PROC_REPEAT(DivineSfxLoop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FE84
void StartSpellAnimDivine(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D62FC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805FEC0
void DivineSfxLoop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        PlaySFX(0x127, 0x100, proc->anim->xPosition, 1);
        sub_805FFB0(anim);
        sub_80601E0(proc->anim);
        return;
    }

    if (proc->timer == 20)
    {
        PlaySFX(0x128, 0x100, proc->anim->xPosition, 1);
        return;
    }

    if (proc->timer == 50)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (proc->timer == duration + 70)
    {
        sub_8060034(anim);
        PlaySFX(0x129, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 73)
    {
        NewEfxFlashBgWhite(proc->anim, 10);
        return;
    }

    if (proc->timer == duration + 75)
    {
        sub_80600B8(anim);

        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }

        return;
    }

    if ((proc->timer != duration + 90) && (proc->timer == 100))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D6314[] =
{
    PROC_NAME("efxDevineBG"),
    PROC_REPEAT(sub_806013C),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D632C[] =
{
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
};

u16 * CONST_DATA gUnknown_085D637C[] =
{
    Tsa_08644DD0,
    Tsa_08644E70,
    Tsa_08644F18,
    Tsa_08644FC0,
    Tsa_08645070,
    Tsa_08645128,
    Tsa_086451F4,
    Tsa_086452C0,
    Tsa_08645394,
    Tsa_0864546C,
    Tsa_08645548,
    Tsa_08645624,
    Tsa_08645708,
    Tsa_086457BC,
    Tsa_08645858,
    Tsa_086458F4,
    Tsa_08645990,
    Tsa_08645A2C,
    Tsa_08645AC8,
    Tsa_08645B64,
};

// clang-format on

//! FE8U = 0x0805FFB0
void sub_805FFB0(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD4D4[] =
    {
         0, 2,
         1, 2,
         2, 2,
         3, 2,
         4, 2,
         5, 2,
         7, 1,
         5, 1,
         7, 1,
         5, 1,
         7, 1,
         5, 1,
         7, 1,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6314, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD4D4;
    proc->tsal = gUnknown_085D637C;
    proc->tsar = gUnknown_085D637C;
    proc->img = gUnknown_085D632C;

    SpellFx_RegisterBgPal(gUnknown_08641D84, PLTT_SIZE_4BPP);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
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

// clang-format off

u16 * CONST_DATA gUnknown_085D63CC[] =
{
    Img_086415F4,
    Img_086415F4,
    Img_086415F4,
};

u16 * gUnknown_085D63D8[] =
{
    Tsa_08645C00,
    Tsa_08645C9C,
    Tsa_08645D38,
};

// clang-format on

//! FE8U = 0x08060034
void sub_8060034(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD542[] =
    {
         0, 1,
         1, 1,
         2, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6314, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD542;
    proc->tsal = gUnknown_085D63D8;
    proc->tsar = gUnknown_085D63D8;
    proc->img = gUnknown_085D63CC;

    SpellFx_RegisterBgPal(gUnknown_08641D84, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// clang-format off

u16 * CONST_DATA gUnknown_085D63E4[] =
{
    Img_086396E4,
    Img_086396E4,
    Img_08639C98,
    Img_0863A360,
    Img_0863A9A0,
    Img_0863AFA8,
    Img_0863B608,
    Img_0863BC78,
    Img_0863C2B4,
    Img_0863C8FC,
    Img_0863D000,
    Img_0863D7B8,
    Img_0863DFAC,
    Img_0863E784,
    Img_0863EFA0,
    Img_0863F720,
    Img_0863FEB4,
    Img_086405E8,
    Img_086405E8,
    Img_08641094,
    Img_08641094,
};

u16 * CONST_DATA gUnknown_085D6438[] =
{
    Tsa_08641DA4,
    Tsa_08641F38,
    Tsa_0864213C,
    Tsa_0864240C,
    Tsa_086426DC,
    Tsa_0864298C,
    Tsa_08642C40,
    Tsa_08642ECC,
    Tsa_08643150,
    Tsa_086433C4,
    Tsa_08643658,
    Tsa_086438E0,
    Tsa_08643B7C,
    Tsa_08643E04,
    Tsa_08644080,
    Tsa_086442B0,
    Tsa_08644500,
    Tsa_08644730,
    Tsa_08644928,
    Tsa_08644B0C,
    Tsa_08644CA8,
};

// clang-format on

//! FE8U = 0x080600B8
void sub_80600B8(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD550[] =
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
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        20, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6314, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD550;

    proc->tsal = gUnknown_085D6438;
    proc->tsar = gUnknown_085D6438;
    proc->img = gUnknown_085D63E4;

    SpellFx_RegisterBgPal(gUnknown_08641D64, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806013C
void sub_806013C(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != 0)
        {
            int pos = GetAnimPosition(proc->anim);
            if (pos == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, pos);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }
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

struct ProcCmd CONST_DATA gUnknown_085D648C[] =
{
    PROC_NAME("efxDevineOBJ"),
    PROC_REPEAT(sub_8060254),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080601E0
void sub_80601E0(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D648C, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_08646510, gUnknown_08646510, gUnknown_08646510, gUnknown_08646510);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 6;
    }
    else
    {
        frontAnim->xPosition += 6;
    }

    SpellFx_RegisterObjPal(gUnknown_08645F44, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08645DD8, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08060254
void sub_8060254(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 44)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08060284
void sub_8060284(struct Anim * anim)
{
    return;
}

//! FE8U = 0x08060288
void nullsub_40(struct Anim * anim)
{
    return;
}
