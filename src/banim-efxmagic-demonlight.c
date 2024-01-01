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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlash[] =
{
    PROC_NAME("efxMaohFlash"),
    PROC_REPEAT(efxMaohFlash_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066514
void StartSpellAnimDemonLight(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxMaohFlash, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08066550
void efxMaohFlash_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    switch (proc->timer)
    {
        case 11:
        {
            SetBlendAlpha(0, 16);
            NewEfxALPHA(anim, 0, 32, 0, 16, 0);

            NewEfxRestWINH_(anim, 166, 1);
            NewEfxTwobaiRST(anim, 166);

            StartSubSpell_efxMaohFlashBG1(anim);
            PlaySFX(0x3B2, 0x100, anim->xPosition, 1);
            break;
        }

        case 177:
        {
            sub_8066914(anim);
            break;
        }

        case 255:
        {
            sub_8066C98();
            StartSubSpell_efxMaohFlashEyeROBJ2(anim, 10, 173, 44);
            StartSubSpell_efxMaohFlashEyeLOBJ2(anim, 10, 159, 48);
            break;
        }

        case 265:
        {
            NewEfxRestWINH_(anim, 34, 1);
            NewEfxTwobaiRST(anim, 34);
            StartSubSpell_efxMaohFlashBG4(anim);
            break;
        }

        case 301:
        {
            NewEfxFlashBgWhite(anim, 4);
            NewEfxFarAttackWithDistance(proc->anim, -1);
            break;
        }
    }

    if (proc->timer == duration + 307)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            StartSpellThing_MagicQuake(anim, 120, 10);
            StartSubSpell_efxMaohFlashBG2(anim);
            StartSubSpell_efxMaohFlashBGCOL(anim);
            StartSubSpell_efxMaohFlashThunderOBJ(anim, 74);
            PlaySFX(0x3B3, 0x100, anim->xPosition, 1);
        }
        else
        {
            proc->timer = duration + 452;
        }
    }
    else if (proc->timer == duration + 457)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashBG1[] =
{
    PROC_NAME("efxMaohFlashBG1"),
    PROC_REPEAT(efxMaohFlashBG1_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_DemonLightBg1_Close[] =
{
    Tsa_087B2430,
    Tsa_087B26A4,
    Tsa_087B291C,
    Tsa_087B2B90,
    Tsa_087B2E04,
    Tsa_087B307C,
    Tsa_087B32F0,
    Tsa_087B3568,
    Tsa_087B37DC,
    Tsa_087B3A54,
    Tsa_087B3CC8,
    Tsa_087B3F40,
    Tsa_087B41B4,
    Tsa_087B4428,
    Tsa_087B46A0,
    Tsa_087B4914,
    Tsa_087C2F34,
    Tsa_087C31A4,
    Tsa_087C341C,
    Tsa_087C3694,
    Tsa_087C38F0,
    Tsa_087C3B38,
    Tsa_087C3D74,
    Tsa_087C3FA8,
    Tsa_087C41E0,
    Tsa_087C4420,
    Tsa_087C4660,
    Tsa_087C48AC,
    Tsa_087C4AF0,
    Tsa_087C4CA0,
    Tsa_087C4E64,
    Tsa_087C5034,
};

u16 * CONST_DATA ImgArray_DemonLightBg1_Close[] =
{
    Img_087A73F4,
    Img_087A7F38,
    Img_087A8A74,
    Img_087A9598,
    Img_087AA02C,
    Img_087AAAA8,
    Img_087AB558,
    Img_087ABFF0,
    Img_087ACAC8,
    Img_087AD54C,
    Img_087ADFEC,
    Img_087AEA74,
    Img_087AF518,
    Img_087B0070,
    Img_087B0C00,
    Img_087B1728,
    Img_087B4B88,
    Img_087B5678,
    Img_087B6198,
    Img_087B6D54,
    Img_087B7AEC,
    Img_087B8968,
    Img_087B98FC,
    Img_087BA910,
    Img_087BBAA4,
    Img_087BCCD8,
    Img_087BDF0C,
    Img_087BF05C,
    Img_087BFEF4,
    Img_087C0A18,
    Img_087C15E4,
    Img_087C2308,
};

u16 * CONST_DATA PalArray_DemonLightBg1_Close[] =
{
    Pal_087B2230,
    Pal_087B2250,
    Pal_087B2270,
    Pal_087B2290,
    Pal_087B22B0,
    Pal_087B22D0,
    Pal_087B22F0,
    Pal_087B2310,
    Pal_087B2330,
    Pal_087B2350,
    Pal_087B2370,
    Pal_087B2390,
    Pal_087B23B0,
    Pal_087B23D0,
    Pal_087B23F0,
    Pal_087B2410,
    Pal_087C2D34,
    Pal_087C2D54,
    Pal_087C2D74,
    Pal_087C2D94,
    Pal_087C2DB4,
    Pal_087C2DD4,
    Pal_087C2DF4,
    Pal_087C2E14,
    Pal_087C2E34,
    Pal_087C2E54,
    Pal_087C2E74,
    Pal_087C2E94,
    Pal_087C2EB4,
    Pal_087C2ED4,
    Pal_087C2EF4,
    Pal_087C2F14,
};

u16 * CONST_DATA TsaArray_DemonLightBg1_Far[] =
{
    Tsa_087D7BE8,
    Tsa_087D7E5C,
    Tsa_087D80D4,
    Tsa_087D8348,
    Tsa_087D85BC,
    Tsa_087D8834,
    Tsa_087D8AA8,
    Tsa_087D8D20,
    Tsa_087D8F94,
    Tsa_087D920C,
    Tsa_087D9480,
    Tsa_087D96F8,
    Tsa_087D996C,
    Tsa_087D9BE0,
    Tsa_087D9E58,
    Tsa_087DA0CC,
    Tsa_087E84CC,
    Tsa_087E873C,
    Tsa_087E89B4,
    Tsa_087E8C2C,
    Tsa_087E8E88,
    Tsa_087E90D0,
    Tsa_087E9314,
    Tsa_087E9554,
    Tsa_087E9798,
    Tsa_087E99E0,
    Tsa_087E9C28,
    Tsa_087E9E78,
    Tsa_087EA0C0,
    Tsa_087EA268,
    Tsa_087EA41C,
    Tsa_087EA5D0,
};

u16 * CONST_DATA ImgArray_DemonLightBg1_Far[] =
{
    Img_087CCBF8,
    Img_087CD738,
    Img_087CE274,
    Img_087CED98,
    Img_087CF824,
    Img_087D0298,
    Img_087D0D3C,
    Img_087D17C0,
    Img_087D2294,
    Img_087D2D18,
    Img_087D37B8,
    Img_087D4238,
    Img_087D4CE4,
    Img_087D5834,
    Img_087D63BC,
    Img_087D6EE4,
    Img_087DA340,
    Img_087DAE40,
    Img_087DB960,
    Img_087DC518,
    Img_087DD288,
    Img_087DE0C8,
    Img_087DF030,
    Img_087E002C,
    Img_087E1190,
    Img_087E238C,
    Img_087E358C,
    Img_087E466C,
    Img_087E54B4,
    Img_087E5FD4,
    Img_087E6B90,
    Img_087E78A0,
};

u16 * CONST_DATA PalArray_DemonLightBg1_Far[] =
{
    Pal_087D79E8,
    Pal_087D7A08,
    Pal_087D7A28,
    Pal_087D7A48,
    Pal_087D7A68,
    Pal_087D7A88,
    Pal_087D7AA8,
    Pal_087D7AC8,
    Pal_087D7AE8,
    Pal_087D7B08,
    Pal_087D7B28,
    Pal_087D7B48,
    Pal_087D7B68,
    Pal_087D7B88,
    Pal_087D7BA8,
    Pal_087D7BC8,
    Pal_087E82CC,
    Pal_087E82EC,
    Pal_087E830C,
    Pal_087E832C,
    Pal_087E834C,
    Pal_087E836C,
    Pal_087E838C,
    Pal_087E83AC,
    Pal_087E83CC,
    Pal_087E83EC,
    Pal_087E840C,
    Pal_087E842C,
    Pal_087E844C,
    Pal_087E846C,
    Pal_087E848C,
    Pal_087E84AC,
};

// clang-format on

//! FE8U = 0x080666D0
void StartSubSpell_efxMaohFlashBG1(struct Anim * anim)
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
        16, 6,
        17, 6,
        18, 6,
        19, 6,
        20, 5,
        21, 5,
        22, 5,
        23, 5,
        24, 4,
        25, 4,
        26, 4,
        27, 4,
        28, 3,
        29, 3,
        30, 3,
        31, 3,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG1, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_DemonLightBg1_Far;
        proc->tsar = TsaArray_DemonLightBg1_Far;
        proc->img = ImgArray_DemonLightBg1_Far;
        proc->pal = PalArray_DemonLightBg1_Far;
    }
    else
    {
        proc->tsal = TsaArray_DemonLightBg1_Close;
        proc->tsar = TsaArray_DemonLightBg1_Close;
        proc->img = ImgArray_DemonLightBg1_Close;
        proc->pal = PalArray_DemonLightBg1_Close;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08066758
void efxMaohFlashBG1_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    GetAnimAnotherSide(proc->anim);

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, 0, 0);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashBG2[] =
{
    PROC_NAME("efxMaohFlashBG2"),
    PROC_REPEAT(efxMaohFlashBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_DemonLightBg2[] =
{
    Tsa_087F3C74,
    Tsa_087F3D60,
    Tsa_087F3E88,
};

u16 * CONST_DATA ImgArray_DemonLightBg2[] =
{
    Img_087F1C94,
    Img_087F2464,
    Img_087F2E40,
};

u16 * CONST_DATA PalArray_DemonLightBg2[] =
{
    Pal_087F3C14,
    Pal_087F3C34,
    Pal_087F3C54,
};

// clang-format on

//! FE8U = 0x080667E0
void StartSubSpell_efxMaohFlashBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 120,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_DemonLightBg2;
    proc->tsar = TsaArray_DemonLightBg2;
    proc->img = ImgArray_DemonLightBg2;
    proc->pal = PalArray_DemonLightBg2;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806683C
void efxMaohFlashBG2_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (gEkrDistanceType == 0)
    {
        BG_SetPosition(BG_1, 24, 0);
    }
    else
    {
        BG_SetPosition(BG_1, 0, 0);
    }

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        sub_80668DC();
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
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

//! FE8U = 0x080668DC
void sub_80668DC(void)
{
    int ix;
    int iy;

    for (iy = 0; iy < 16; iy++)
    {
        for (ix = 0; ix < 3; ix++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + ix, iy)] = gBG1TilemapBuffer[TILEMAP_INDEX(28, iy)];
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashBG3[] =
{
    PROC_NAME("efxMaohFlashBG3"),
    PROC_REPEAT(efxMaohFlashBG3_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_DemonLightBg3_Close[] =
{
    Tsa_087CC5FC,
    Tsa_087CC734,
    Tsa_087CC878,
    Tsa_087CC9B8,
    Tsa_087CCAD8,
};

u16 * CONST_DATA ImgArray_DemonLightBg3_Close[] =
{
    Img_087C9F18,
    Img_087CA68C,
    Img_087CAE60,
    Img_087CB630,
    Img_087CBDF4,
};

u16 * CONST_DATA PalArray_DemonLightBg3_Close[] =
{
    Pal_087CC55C,
    Pal_087CC57C,
    Pal_087CC59C,
    Pal_087CC5BC,
    Pal_087CC5DC,
};

u16 * CONST_DATA TsaArray_DemonLightBg3_Far[] =
{
    Tsa_087F16A0,
    Tsa_087F17D8,
    Tsa_087F191C,
    Tsa_087F1A54,
    Tsa_087F1B74,
};

u16 * CONST_DATA ImgArray_DemonLightBg3_Far[] =
{
    Img_087EEFBC,
    Img_087EF730,
    Img_087EFF04,
    Img_087F06D4,
    Img_087F0E98,
};

u16 * CONST_DATA PalArray_DemonLightBg3_Far[] =
{
    Pal_087F1600,
    Pal_087F1620,
    Pal_087F1640,
    Pal_087F1660,
    Pal_087F1680,
};

// clang-format on

//! FE8U = 0x08066914
void sub_8066914(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 6,
        1, 6,
        2, 6,
        3, 6,
        4, 6,
        3, 6,
        2, 6,
        1, 6,
        0, 6,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_DemonLightBg3_Far;
        proc->tsar = TsaArray_DemonLightBg3_Far;
        proc->img = ImgArray_DemonLightBg3_Far;
        proc->pal = PalArray_DemonLightBg3_Far;
    }
    else
    {
        proc->tsal = TsaArray_DemonLightBg3_Close;
        proc->tsar = TsaArray_DemonLightBg3_Close;
        proc->img = ImgArray_DemonLightBg3_Close;
        proc->pal = PalArray_DemonLightBg3_Close;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806699C
void efxMaohFlashBG3_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashBG4[] =
{
    PROC_NAME("efxMaohFlashBG4"),
    PROC_REPEAT(efxMaohFlashBG4_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_DemonLightBg4_Close[] = {
    Tsa_087C9390,
    Tsa_087C9464,
    Tsa_087C9600,
    Tsa_087C9818,
    Tsa_087C9A2C,
    Tsa_087C9BEC,
    Tsa_087C9CF4,
    Tsa_087C9E04,
};

u16 * CONST_DATA ImgArray_DemonLightBg4_Close[] =
{
    Img_087C5190,
    Img_087C56E4,
    Img_087C619C,
    Img_087C6CF4,
    Img_087C7678,
    Img_087C810C,
    Img_087C86BC,
    Img_087C8C80,
};

u16 * CONST_DATA PalArray_DemonLightBg4_Close[] =
{
    Pal_087C9290,
    Pal_087C92B0,
    Pal_087C92D0,
    Pal_087C92F0,
    Pal_087C9310,
    Pal_087C9330,
    Pal_087C9350,
    Pal_087C9370,
};

u16 * CONST_DATA TsaArray_DemonLightBg4_Far[] =
{
    Tsa_087EE4A0,
    Tsa_087EE578,
    Tsa_087EE710,
    Tsa_087EE8F8,
    Tsa_087EEAF4,
    Tsa_087EECA8,
    Tsa_087EEDAC,
    Tsa_087EEEB0,
};

u16 * CONST_DATA ImgArray_DemonLightBg4_Far[] =
{
    Img_087EA72C,
    Img_087EAC80,
    Img_087EB704,
    Img_087EC054,
    Img_087EC944,
    Img_087ED2B0,
    Img_087ED828,
    Img_087EDDC0,
};

u16 * CONST_DATA PalArray_DemonLightBg4_Far[] =
{
    Pal_087EE3A0,
    Pal_087EE3C0,
    Pal_087EE3E0,
    Pal_087EE400,
    Pal_087EE420,
    Pal_087EE440,
    Pal_087EE460,
    Pal_087EE480,
};

// clang-format on

//! FE8U = 0x08066A0C
void StartSubSpell_efxMaohFlashBG4(struct Anim * anim)
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
        6, 3,
        7, 4,
        -1
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_DemonLightBg4_Far;
        proc->tsar = TsaArray_DemonLightBg4_Far;
        proc->img = ImgArray_DemonLightBg4_Far;
        proc->pal = PalArray_DemonLightBg4_Far;
    }
    else
    {
        proc->tsal = TsaArray_DemonLightBg4_Close;
        proc->tsar = TsaArray_DemonLightBg4_Close;
        proc->img = ImgArray_DemonLightBg4_Close;
        proc->pal = PalArray_DemonLightBg4_Close;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08066A94
void efxMaohFlashBG4_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, 0, 0);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashWOUT[] =
{
    PROC_NAME("efxMaohFlashWOUT"),

    PROC_REPEAT(efxMaohFlashWOUT_Loop_A),
    PROC_SLEEP(32),

    PROC_REPEAT(efxMaohFlashWOUT_Loop_B),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08066B14
void StartSubSpell_efxMaohFlashWOUT(struct Anim * anim, int unused, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08066B40
void efxMaohFlashWOUT_Loop_A(struct ProcEfxOBJ * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->terminator);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, val);

    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        NewEfxWhiteIN(proc->anim, 0, 0x20);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08066BBC
void efxMaohFlashWOUT_Loop_B(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashBGCOL[] =
{
    PROC_NAME("efxMaohFlashBGCOL"),
    PROC_SLEEP(4),
    PROC_REPEAT(efxMaohFlashBGCOL_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066BD4
void StartSubSpell_efxMaohFlashBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
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
        15, 1,
        14, 1,
        13, 1,
        12, 1,
        11, 1,
        10, 1,
        9, 1,
        8, 1,
        7, 1,
        6, 1,
        5, 1,
        4, 1,
        3, 1,
        2, 1,
        1, 1,
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
        15, 1,
        14, 1,
        13, 1,
        12, 1,
        11, 1,
        10, 1,
        9, 1,
        8, 1,
        7, 1,
        6, 1,
        5, 1,
        4, 1,
        3, 1,
        2, 1,
        1, 1,
        0, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk32 = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_087F3C54;
    SpellFx_RegisterBgPal(gUnknown_08603B50, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08066C1C
void efxMaohFlashBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    u16 palBuffer[0x10];

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CopyPalWithFade(Pal_087F3C54, palBuffer, ret - 4);
        SpellFx_RegisterBgPal(palBuffer, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08066C74
int sub_8066C74(int pos)
{
    int xNew;

    if (gEkrDistanceType == 0)
    {
        xNew = 24;
    }
    else
    {
        xNew = 0;
    }

    if (pos == 0)
    {
        xNew = -xNew;
    }

    return xNew;
}

//! FE8U = 0x08066C98
void sub_8066C98(void)
{
    SpellFx_RegisterObjPal(Pal_DemonLightSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites, 32 * 4 * CHR_SIZE);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashEyeROBJ2[] =
{
    PROC_NAME("efxMaohFlashEyeROBJ2"),
    PROC_REPEAT(efxMaohFlashEyeROBJ2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066CB8
void StartSubSpell_efxMaohFlashEyeROBJ2(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE8A0[2] =
    {
        gUnknown_087A5B74,
        gUnknown_087A5958
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeROBJ2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8A0[pos];

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}

//! FE8U = 0x08066D7C
void efxMaohFlashEyeROBJ2_Loop(struct ProcEfxOBJ * proc)
{
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashEyeLOBJ2[] =
{
    PROC_NAME("efxMaohFlashEyeLOBJ2"),
    PROC_REPEAT(efxMaohFlashEyeLOBJ2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066DB0
void StartSubSpell_efxMaohFlashEyeLOBJ2(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE8C0[2] =
    {
        gUnknown_087A5B8C,
        gUnknown_087A5970,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeLOBJ2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8C0[pos];

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}

//! FE8U = 0x08066E74
void efxMaohFlashEyeLOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08066EA8
void sub_8066EA8(void)
{
    SpellFx_RegisterObjPal(Pal_DemonLightSprites_EyeFlash, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites_EyeFlash, 32 * 4 * CHR_SIZE);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashEyeOBJ1[] =
{
    PROC_NAME("efxMaohFlashEyeOBJ1"),
    PROC_REPEAT(efxMaohFlashEyeOBJ1_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066EC8
void StartSubSpell_efxMaohFlashEyeOBJ1(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE8DC[2] =
    {
        gUnknown_087A536C,
        gUnknown_087A5240
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeOBJ1, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8DC[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}

//! FE8U = 0x08066F90
void efxMaohFlashEyeOBJ1_Loop(struct ProcEfxOBJ * proc)
{
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashEyeFire1OBJ1[] =
{
    PROC_NAME("efxMaohFlashEyeFire1OBJ1"),
    PROC_REPEAT(efxMaohFlashEyeFire1OBJ1_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066FC4
void StartSubSpell_efxMaohFlashEyeFire1OBJ1(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE900[2] =
    {
        gUnknown_087A6AEC,
        gUnknown_087A6674,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeFire1OBJ1, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE900[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    SpellFx_RegisterObjPal(Pal_DemonLightSprites_087A61EC, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites_087A5BA4, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x080670A8
void efxMaohFlashEyeFire1OBJ1_Loop(struct ProcEfxOBJ * proc)
{
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashEyeFire2OBJ1[] =
{
    PROC_NAME("efxMaohFlashEyeFire2OBJ1"),
    PROC_REPEAT(efxMaohFlashEyeFire2OBJ1_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080670DC
void StartSubSpell_efxMaohFlashEyeFire2OBJ1(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE924[2] =
    {
        gUnknown_087A73E0,
        gUnknown_087A6F64,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeFire2OBJ1, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE924[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (sub_8066C74(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + sub_8066C74(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    SpellFx_RegisterObjPal(Pal_DemonLightSprites_087A61EC, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites_087A5E9C, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x080671C0
void efxMaohFlashEyeFire2OBJ1_Loop(struct ProcEfxOBJ * proc)
{
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

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashThunderOBJ[] =
{
    PROC_NAME("efxMaohFlashThunderOBJ"),
    PROC_REPEAT(efxMaohFlashThunderOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080671F4
void StartSubSpell_efxMaohFlashThunderOBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashThunderOBJ, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterObjPal(Pal_DemonLightSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08067244
void efxMaohFlashThunderOBJ_Loop(struct ProcEfxOBJ * proc)
{
    u8 pos = GetAnimPosition(proc->anim);
    s16 xBase = sub_8066C74(pos);

    proc->timer++;

    if (proc->timer == 0)
    {
        if (pos != 0)
        {
            xBase += 56;
        }
        else
        {
            xBase += 184;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 110);
    }
    else if (proc->timer == 10)
    {
        if (pos != 0)
        {
            xBase += 32;
        }
        else
        {
            xBase += 208;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 108);
    }
    else if (proc->timer == 14)
    {
        if (pos != 0)
        {
            xBase += 14;
        }
        else
        {
            xBase += 226;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 104);
    }
    else if (proc->timer == 24)
    {
        if (pos != 0)
        {
            xBase += 98;
        }
        else
        {
            xBase += 142;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 98);
    }
    else if (proc->timer == 34)
    {
        if (pos != 0)
        {
            xBase += 48;
        }
        else
        {
            xBase += 192;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 110);
    }
    else if (proc->timer == 44)
    {
        if (pos != 0)
        {
            xBase += 24;
        }
        else
        {
            xBase += 216;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 108);
    }
    else if (proc->timer == 48)
    {
        if (pos != 0)
        {
            xBase += 6;
        }
        else
        {
            xBase += 234;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 104);
    }
    else if (proc->timer == 52)
    {
        if (pos != 0)
        {
            xBase += 106;
        }
        else
        {
            xBase += 134;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 98);
    }
    else if (proc->timer == 56)
    {
        if (pos != 0)
        {
            xBase += 88;
        }
        else
        {
            xBase += 152;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 110);
    }
    else if (proc->timer == 60)
    {
        if (pos != 0)
        {
            xBase += 16;
        }
        else
        {
            xBase += 224;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 108);
    }
    else if (proc->timer == 64)
    {
        if (pos != 0)
        {
            xBase -= 2;
        }
        else
        {
            xBase += 242;
        }
        StartSubSpell_efxMaohFlashThunderOBJ2(proc->anim, 10, xBase, 104);
    }
    else if (proc->timer == proc->terminator)
    {
        StartSubSpell_efxMaohFlashWOUT(((struct ProcEfx *)(proc->proc_parent))->anim, 90, 45);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMaohFlashThunderOBJ2[] =
{
    PROC_NAME("efxMaohFlashThunderOBJ2"),
    PROC_REPEAT(efxMaohFlashThunderOBJ2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08067400
void StartSubSpell_efxMaohFlashThunderOBJ2(struct Anim * anim, int terminator, s16 x, s16 y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashThunderOBJ2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_087A5B5C;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;
    proc->anim2->xPosition = x;
    proc->anim2->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    SpellFx_RegisterObjPal(Pal_DemonLightSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x080674A0
void efxMaohFlashThunderOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
