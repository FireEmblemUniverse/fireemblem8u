#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D71F8[] =
{
    PROC_NAME("efxExcalibur"),
    PROC_REPEAT(sub_8064344),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08064308
void sub_8064308(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D71F8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08064344
void sub_8064344(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 1)
    {
        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        sub_8064C28(anim);
        PlaySFX(0x3B5, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 41)
    {
        NewEfxALPHA(anim, 0, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 63)
    {
        sub_80646FC(15);
        NewEfxRestWINH_(anim, 15, 1);
    }
    else if (proc->timer == duration + 64)
    {
        sub_80644E0(anim);
        sub_806466C(anim);
        PlaySFX(0x2BF, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 108)
    {
        PlaySFX(0x2c0, 0x100, proc->anim->xPosition, 1);
    }

    if (!proc->hitted)
    {
        if (proc->timer == duration + 113)
        {
            sub_8064B90(anim);
            sub_8064838(anim);
            sub_8064958(anim);
        }
        if (proc->timer == duration + 146)
        {
            NewEfxFlashBgWhite(anim, 5);
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
            EfxPlayHittedSFX(anim);
        }
        if (proc->timer == duration + 152)
        {
            sub_80649E4(anim);
            sub_8064B04(anim);
        }
        if (proc->timer == duration + 167)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else
    {
        if (proc->timer == duration + 110)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        }
        if (proc->timer == duration + 111)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7210[] =
{
    PROC_NAME("efxExcaliburBG"),

    PROC_SET_END_CB(sub_806454C),

    PROC_REPEAT(sub_8064568),
    PROC_REPEAT(sub_80645FC),
    PROC_REPEAT(sub_806464C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080644E0
void sub_80644E0(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7210, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x28;

    SpellFx_RegisterBgGfx(gUnknown_0872E25C, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(gUnknown_0872E7EC, gEkrTsaBuffer);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x0806454C
void sub_806454C(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08064568
void sub_8064568(struct ProcEfxBG * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 32, 32, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 32, 32, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 6;
        proc->unk32 = 0;

        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->unk34 = +128;
        }
        else
        {
            proc->unk34 = -128;
        }

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080645FC
void sub_80645FC(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].x = Interpolate(0, proc->unk32, proc->unk34, proc->timer, proc->terminator);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 12;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806464C
void sub_806464C(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7240[] =
{
    PROC_NAME("efxExcaliburBGCOL"),
    PROC_MARK(PROC_MARK_A),

    PROC_SET_END_CB(sub_80646B0),
    PROC_REPEAT(sub_80646C0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806466C
void sub_806466C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE1CE[] =
    {
         0,  2,
         1,  2,
         2,  2,
         3,  2,
         4,  2,
         5, 20,
         6,  2,
         7,  2,
         8,  2,
         9,  6,
        10,  2,
        11,  2,
        12,  2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7240, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE1CE;

    proc->pal = gUnknown_0872E64C;
    SpellFx_RegisterBgPal(gUnknown_0872E64C, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x080646B0
void sub_80646B0(void)
{
    gEfxBgSemaphore--;
    return;
}

//! FE8U = 0x080646C0
void sub_80646C0(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7268[] =
{
    PROC_NAME("efxExcaliburSCR"),
    PROC_REPEAT(sub_8064720),
    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085D7280[] =
{
    PROC_NAME("efxExcaliburSCR2"),
    PROC_REPEAT(sub_80647F0),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080646FC
void sub_80646FC(int unk)
{
    struct ProcEfx * proc = Proc_Start(gUnknown_085D7268, PROC_TREE_3);
    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = 0;

    sub_80647D0(proc, unk);

    return;
}

// clang-format off

s16 CONST_DATA gUnknown_085D7298[] =
{
    -256, -251, -247, -243, -239, -235, -231, -227, -223, -219, -215, -211, -207, -203, -199, -195, -190, -186, -182,
    -178, -174, -170, -166, -162, -158, -154, -150, -146, -142, -138, -134, -130, -125, -121, -117, -113, -109, -105,
    -101, -97,  -93,  -89,  -85,  -81,  -77,  -73,  -69,  -65,  -60,  -56,  -52,  -48,  -44,  -40,  -36,  -32,  -28,
    -24,  -20,  -16,  -12,  -8,   -4,   +0,   +0,   +4,   +8,   +12,  +16,  +20,  +24,  +28,  +32,  +36,  +40,  +44,
    +48,  +52,  +56,  +60,  +65,  +69,  +73,  +77,  +81,  +85,  +89,  +93,  +97,  +101, +105, +109, +113, +117, +121,
    +125, +130, +134, +138, +142, +146, +150, +154, +158, +162, +166, +170, +174, +178, +182, +186, +190, +195, +199,
    +203, +207, +211, +215, +219, +223, +227, +231, +235, +239, +243, +247, +251, +256
};

// clang-format on

//! FE8U = 0x08064720
void sub_8064720(struct ProcEfx * proc)
{
    u32 i;

    u16 * bg2Scroll = (gEkrBg1ScrollFlip == 0) ? gpEkrLvupBg2ScrollOffsetTable2 : gpEkrLvupBg2ScrollOffsetTable1;
    u16 * bg1Scroll = (gEkrBg1ScrollFlip == 0) ? gpEkrLvupBg1ScrollOffsetList2 : gpEkrLvupBg1ScrollOffsetList1;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < 128)
        {
            s16 val = gUnknown_085D7298[i] * proc->unk44 >> 12;

            if (val != 0)
            {
                if (i < 64)
                {
                    if (val < i - 128)
                    {
                        val = -128 + i;
                    }
                }
                else
                {
                    if (val > 128 - i)
                    {
                        val = 128 - i;
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

//! FE8U = 0x080647D0
void sub_80647D0(struct ProcEfx * proc, int b)
{
    struct ProcEfxSCR * childProc = Proc_Start(gUnknown_085D7280, PROC_TREE_3);
    childProc->timer = 0;
    childProc->unk2E = b;
    childProc->unk5C = proc;

    return;
}

//! FE8U = 0x080647F0
void sub_80647F0(struct ProcEfxSCR * proc)
{
    struct ProcEfx * otherProc = proc->unk5C;

    otherProc->unk44 = Interpolate(4, 0x4000, 0, proc->timer, proc->unk2E);

    proc->timer++;

    if (proc->timer > proc->unk2E)
    {
        Proc_End(otherProc);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7398[] =
{
    PROC_NAME("efxExcaliburBG2"),
    PROC_SET_END_CB(sub_806491C),
    PROC_REPEAT(sub_8064938),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08064838
void sub_8064838(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7398, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 12;

    SpellFx_RegisterBgGfx(gUnknown_0872E998, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    if (gEkrDistanceType == 0)
    {
        LZ77UnCompWram(gUnknown_0872FA84, gEkrTsaBuffer);
    }
    else
    {
        LZ77UnCompWram(gUnknown_0872FEB8, gEkrTsaBuffer);
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x0806491C
void sub_806491C(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08064938
void sub_8064938(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxExcaliburBGCOL2[] =
{
    PROC_NAME("efxExcaliburBGCOL2"),
    PROC_MARK(PROC_MARK_A),

    PROC_REPEAT(sub_806499C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08064958
void sub_8064958(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE24C[] =
    {
         0, 6,
         1, 2,
         2, 2,
         3, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE24C;

    proc->pal = gUnknown_0872FA04;
    SpellFx_RegisterBgPal(gUnknown_0872FA04, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x0806499C
void sub_806499C(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
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

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D73D8[] =
{
    PROC_NAME("efxExcaliburBG3"),

    PROC_SET_END_CB(sub_8064AC8),
    PROC_REPEAT(sub_8064AE4),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080649E4
void sub_80649E4(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D73D8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 12;

    SpellFx_RegisterBgGfx(Img_ShineBg1, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    if (gEkrDistanceType == 0)
    {
        LZ77UnCompWram(Tsa_ShineBg1_Left, gEkrTsaBuffer);
    }
    else
    {
        LZ77UnCompWram(Tsa_ShineBg1_Right, gEkrTsaBuffer);
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08064AC8
void sub_8064AC8(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08064AE4
void sub_8064AE4(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D73F8[] =
{
    PROC_NAME("efxExcaliburBGCOL3"),
    PROC_MARK(PROC_MARK_A),

    PROC_REPEAT(sub_8064B48),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08064B04
void sub_8064B04(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE284[] =
    {
         0, 6,
         1, 2,
         2, 2,
         3, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D73F8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE284;

    proc->pal = gUnknown_087302A4;
    SpellFx_RegisterBgPal(gUnknown_087302A4, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08064B48
void sub_8064B48(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
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

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7418[] =
{
    PROC_NAME("efxExcaliburOBJ"),
    PROC_REPEAT(sub_8064BFC),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08064B90
void sub_8064B90(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7418, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 40;

    scr = gUnknown_087312BC;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    proc->anim2 = frontAnim;
    frontAnim->xPosition = proc->anim->xPosition;
    frontAnim->yPosition = proc->anim->yPosition;

    SpellFx_RegisterObjPal(gUnknown_08730780, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08730324, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08064BFC
void sub_8064BFC(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7430[] =
{
    PROC_NAME("efxExcaliburBG0"),
    PROC_REPEAT(sub_8064C80),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D7448[] =
{
    Img_08723274,
};

u16 * CONST_DATA gUnknown_085D744C[] =
{
    Tsa_08724444,
};

// clang-format on

//! FE8U = 0x08064C28
void sub_8064C28(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE2B8[] =
    {
         0, 60,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7430, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->unk32 = 0;
    proc->frame_config = gUnknown_080DE2B8;

    proc->tsal = gUnknown_085D744C;
    proc->tsar = gUnknown_085D744C;

    proc->img = gUnknown_085D7448;

    SpellFx_RegisterBgPal(gUnknown_08724424, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08064C80
void sub_8064C80(struct ProcEfxBG * proc)
{
    s16 ret;

    proc->unk32 = (proc->unk32 + 16) % DISPLAY_WIDTH;
    BG_SetPosition(BG_1, proc->unk32, 0);

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        SpellFx_WriteBgMapExt(proc->anim, *(tsaL + ret), 32, 20);
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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
