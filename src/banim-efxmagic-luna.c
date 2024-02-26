#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLuna[] =
{
    PROC_NAME("efxLuna"),
    PROC_REPEAT(efxLuna_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063974
void StartSpellAnimLuna(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxLuna, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080639B0
void efxLuna_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxLunaBG(anim);

        SetWinEnable(0, 0, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 10, 0, 0x10, 0);
        StartSubSpell_efxLunaRST(anim, NewefxRestRST(anim, 20, 15, 0x100, 2), 20);
        NewEfxRestWINH(anim, 20, gLCDControlBuffer.bgoffset[BG_1].x, 0);

        PlaySFX(0x2BD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 41)
    {
        StartSubSpell_efxLunaSCR();
        NewEfxRestWINH_(anim, 21, 1);
        StartSubSpell_efxLunaOBJ(anim);
        NewEfxALPHA(anim, 0, 25, 16, 0, 0);
    }
    else if (proc->timer == duration + 55)
    {
        PlaySFX(0x2BE, 0x100, anim->xPosition, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxLunaBG2(anim, 65);
        StartSubSpell_efxLunaBGCOL(anim, 65);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewefxRestRST(anim, 65, 2, 128, 1);
        NewEfxRestWINH_(anim, 68, 0);
    }
    else if (proc->timer == duration + 135)
    {
        NewEfxFlashBgWhite(anim, 5);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 140)
    {
        BG_SetPosition(BG_1, 0, 0);
        StartSubSpell_efxLunaBG3(proc->anim);
    }
    else if (proc->timer == duration + 190)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLunaBG[] =
{
    PROC_NAME("efxLunaBG"),
    PROC_REPEAT(efxLunaBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_LunaBg1[] =
{
    Tsa_LunaBg1_A,
};

// clang-format on

//! FE8U = 0x08063B6C
void StartSubSpell_efxLunaBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 60,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_LunaBg1;
    proc->tsar = TsaArray_LunaBg1;

    SpellFx_RegisterBgPal(Pal_LunaBg1, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_LunaBg1, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08063BC8
void efxLunaBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
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

struct ProcCmd CONST_DATA ProcScr_efxLunaSCR[] =
{
    PROC_NAME("efxLunaSCR"),
    PROC_REPEAT(efxLunaSCR_Loop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_efxLunaSCR2[] =
{
    PROC_NAME("efxLunaSCR2"),
    PROC_REPEAT(efxLunaSCR2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063C20
void StartSubSpell_efxLunaSCR(void)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxLunaSCR, PROC_TREE_3);

    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;

    StartSubSpell_efxLunaSCR2(proc);

    return;
}

// clang-format off

s16 CONST_DATA gLunaBgScrollOffsets[] =
{
    -256, -250, -245, -239, -234, -228, -223, -217, -212, -206, -201, -196,
    -190, -185, -179, -174, -168, -163, -157, -152, -147, -141, -136, -130,
    -125, -119, -114, -108, -103, -98,  -92,  -87,  -81,  -76,  -70,  -65,
    -59,  -54,  -49,  -43,  -38,  -32,  -27,  -21,  -16,  -10,  -5,   +0,
    +0,   +5,   +10,  +16,  +21,  +27,  +32,  +38,  +43,  +49,  +54,  +59,
    +65,  +70,  +76,  +81,  +87,  +92,  +98,  +103, +108, +114, +119, +125,
    +130, +136, +141, +147, +152, +157, +163, +168, +174, +179, +185, +190,
    +196, +201, +206, +212, +217, +223, +228, +234, +239, +245, +250, +256,
};

// clang-format on

//! FE8U = 0x08063C40
void efxLunaSCR_Loop(struct ProcEfx * proc)
{
    u32 i;

    u16 * bg2Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg2ScrollOffsetTable2 : gpBg2ScrollOffsetTable1;
    u16 * bg1Scroll = (gEkrBg1ScrollFlip == 0) ? gpBg1ScrollOffsetList2 : gpBg1ScrollOffsetList1;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < 16)
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
        else if (i < 112)
        {
            s16 val = gLunaBgScrollOffsets[i - 16] * proc->unk44 >> 12;

            if (val != 0)
            {
                if (i < 64)
                {
                    if (val < -112 + i)
                    {
                        val = -112 + i;
                    }
                }
                else
                {
                    if (val > 112 - i)
                    {
                        val = 112 - i;
                    }
                }
            }

            *bg2Scroll++ = val;
            *bg1Scroll++ = val;
        }
        else
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
    }

    return;
}

//! FE8U = 0x08063CFC
void StartSubSpell_efxLunaSCR2(ProcPtr proc)
{
    struct ProcEfxSCR * otherProc = Proc_Start(ProcScr_efxLunaSCR2, PROC_TREE_3);

    otherProc->timer = 0;
    otherProc->unk2E = 20;
    otherProc->unk5C = proc;

    return;
}

//! FE8U = 0x08063D1C
void efxLunaSCR2_Loop(struct ProcEfxSCR * proc)
{
    struct ProcEfx * otherProc = proc->unk5C;
    otherProc->unk44 = Interpolate(INTERPOLATE_LINEAR, 0, 0x4000, proc->timer, proc->unk2E);

    proc->timer++;

    if (proc->timer > proc->unk2E)
    {
        Proc_End(otherProc);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLunaBG2[] =
{
    PROC_NAME("efxLunaBG2"),
    PROC_SET_END_CB(efxLunaBG2_OnEnd),

    PROC_REPEAT(efxLunaBG2_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08063D64
void StartSubSpell_efxLunaBG2(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(Img_LunaBg2, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_LunaBg2, PLTT_SIZE_4BPP);

    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_LunaBg2, gEkrTsaBuffer);

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 32, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 32, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);
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

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08063E58
void efxLunaBG2_OnEnd(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();

    return;
}

//! FE8U = 0x08063E74
void efxLunaBG2_Loop(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].y++;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLunaBGCOL[] =
{
    PROC_NAME("efxLunaBGCOL"),
    PROC_MARK(PROC_MARK_A),

    PROC_SET_END_CB(efxLunaBGCOL_OnEnd),

    PROC_REPEAT(efxLunaBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08063EA0
void StartSubSpell_efxLunaBGCOL(struct Anim * anim, int terminator)
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

    proc = Proc_Start(ProcScr_efxLunaBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_LunaBg2;
    SpellFx_RegisterBgPal(Pal_LunaBg2, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08063EE8
void efxLunaBGCOL_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

//! FE8U = 0x08063EF8
void efxLunaBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
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

struct ProcCmd CONST_DATA ProcScr_efxLunaBG3[] =
{
    PROC_NAME("efxLunaBG3"),
    PROC_REPEAT(efxLunaBG3_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_LunaBg3[] =
{
    Tsa_LunaBg3_A,
    Tsa_LunaBg3_B,
    Tsa_LunaBg3_C,
    Tsa_LunaBg3_D,
    Tsa_LunaBg3_E,
    Tsa_LunaBg3_F,
    Tsa_LunaBg3_G,
    Tsa_LunaBg3_H,
    Tsa_LunaBg3_I,
    Tsa_LunaBg3_J,
    Tsa_LunaBg3_K,
    Tsa_LunaBg3_L,
};

u16 * CONST_DATA ImgArray_LunaBg3[] =
{
    Img_LunaBg3_A,
    Img_LunaBg3_A,
    Img_LunaBg3_A,
    Img_LunaBg3_A,
    Img_LunaBg3_A,
    Img_LunaBg3_A,
    Img_LunaBg3_B,
    Img_LunaBg3_B,
    Img_LunaBg3_B,
    Img_LunaBg3_C,
    Img_LunaBg3_C,
    Img_LunaBg3_C,
};

// clang-format on

//! FE8U = 0x08063F3C
void StartSubSpell_efxLunaBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 2,
         1, 2,
         2, 2,
         3, 3,
         4, 3,
         5, 3,
         6, 3,
         7, 3,
         8, 3,
         9, 3,
        10, 3,
        11, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_LunaBg3;
    proc->tsar = TsaArray_LunaBg3;

    proc->img = ImgArray_LunaBg3;

    SpellFx_RegisterBgPal(Pal_LunaBg3, PLTT_SIZE_4BPP);

    SpellFx_SetSomeColorEffect();

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

    return;
}

//! FE8U = 0x08063FC0
void efxLunaBG3_Loop(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxLunaOBJ[] =
{
    PROC_NAME("efxLunaOBJ"),

    PROC_REPEAT(efxLunaOBJ_Loop_A),
    PROC_REPEAT(efxLunaOBJ_Loop_B),
    PROC_REPEAT(efxLunaOBJ_Loop_C),
    PROC_REPEAT(efxLunaOBJ_Loop_D),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08064024
void StartSubSpell_efxLunaOBJ(struct Anim * anim)
{
    u32 i;

    for (i = 0; i < 8; i++)
    {
        struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxLunaOBJ, PROC_TREE_3);
        proc->anim = anim;
        proc->unk44 = i;
    }

    SpellFx_RegisterObjPal(Pal_LunaSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_LunaSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08064060
void efxLunaOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = proc->unk44 * 0x2AAA;

    scr = gUnknown_0872DFEC;
    anim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;

    anim->timer = 0;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(2);

    anim->xPosition = 256;
    anim->yPosition = 256;

    proc->unk32 = proc->anim->xPosition;
    proc->unk3A = proc->anim->yPosition;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080640D0
void efxLunaOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = Interpolate(INTERPOLATE_RSQUARE, 0, 50, proc->timer, 20);

    proc->unk30 = proc->unk30 + 0x200;

    hm = proc->unk30 / 0x100;

    sin = gSinLookup[proc->unk30 / 0x100];
    cos = gSinLookup[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 20)
    {
        proc->timer = 20;
    }

    if (++proc->terminator > 20)
    {
        proc->timer = 0;
        proc->terminator = 0;

        anim->pScrStart = gUnknown_0872E24C;
        anim->pScrCurrent = gUnknown_0872E24C;
        anim->timer = 0;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806416C
void efxLunaOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = 50;

    proc->unk30 = proc->unk30 + 0x200;

    hm = proc->unk30 / 0x100;

    sin = gSinLookup[proc->unk30 / 0x100];
    cos = gSinLookup[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 60)
    {
        proc->timer = 60;
    }

    if (++proc->terminator > 60)
    {
        proc->timer = 0;
        proc->terminator = 0;

        anim->pScrStart = gUnknown_0872E024;
        anim->pScrCurrent = gUnknown_0872E024;
        anim->timer = 0;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080641F0
void efxLunaOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    int x;
    int y;
    s16 a;
    s16 b;
    s16 sin;
    s16 cos;
    s16 hm;

    struct Anim * anim = proc->anim2;

    s16 ret = Interpolate(INTERPOLATE_SQUARE, 50, 0, proc->timer, 10);

    proc->unk30 = proc->unk30 + 0x400;

    hm = proc->unk30 / 0x100;

    sin = gSinLookup[proc->unk30 / 0x100];
    cos = gSinLookup[0x40 + proc->unk30 / 0x100];

    a = (sin * ret) >> 12;
    b = (cos * ret) >> 12;

    x = a + proc->unk32;
    y = b + proc->unk3A;

    anim->xPosition = x;
    anim->yPosition = y;

    if (++proc->timer > 10)
    {
        proc->timer = 10;
    }

    if (++proc->terminator > 10)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLunaRST[] =
{
    PROC_NAME("efxLunaRST"),
    PROC_REPEAT(efxLunaRST_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806428C
void StartSubSpell_efxLunaRST(struct Anim * anim, ProcPtr efxproc, int duration)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->duration = duration;
    proc->efxproc = efxproc;
}

//! FE8U = 0x080642BC
void efxLunaRST_Loop(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->efxproc;
    otherProc->frame = Interpolate(INTERPOLATE_RSQUARE, 0x80, 0, proc->timer, proc->duration);

    proc->timer++;

    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
