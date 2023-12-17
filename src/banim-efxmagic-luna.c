#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxLuna[];

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
void sub_80639B0(struct ProcEfx * proc)
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
        sub_8063B6C(anim);

        SetWinEnable(0, 0, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 10, 0, 0x10, 0);
        sub_806428C(anim, NewefxRestRST(anim, 20, 15, 0x100, 2), 20);
        NewEfxRestWINH(anim, 20, gLCDControlBuffer.bgoffset[BG_1].x, 0);

        PlaySFX(0x2BD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 41)
    {
        sub_8063C20();
        NewEfxRestWINH_(anim, 21, 1);
        sub_8064024(anim);
        NewEfxALPHA(anim, 0, 25, 16, 0, 0);
    }
    else if (proc->timer == duration + 55)
    {
        PlaySFX(0x2BE, 0x100, anim->xPosition, 0);
    }
    else if (proc->timer == duration + 70)
    {
        sub_8063D64(anim, 65);
        sub_8063EA0(anim, 65);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewefxRestRST(anim, 65, 2, 128, 1);
        NewEfxRestWINH_(anim, 68, 0);
    }
    else if (proc->timer == duration + 135)
    {
        NewEfxFlashBgWhite(anim, 5);

        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 140)
    {
        BG_SetPosition(BG_1, 0, 0);
        sub_8063F3C(proc->anim);
    }
    else if (proc->timer == duration + 190)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D6FE4[];

extern u16 * gUnknown_085D6FFC[];

extern u16 gUnknown_0872972C[];
extern u16 gUnknown_08728C5C[];

extern u16 gUnknown_080DE0CE[];

//! FE8U = 0x08063B6C
void sub_8063B6C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6FE4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE0CE;

    proc->tsal = gUnknown_085D6FFC;
    proc->tsar = gUnknown_085D6FFC;

    SpellFx_RegisterBgPal(gUnknown_0872972C, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(gUnknown_08728C5C, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08063BC8
void sub_8063BC8(struct ProcEfxBG * proc)
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

extern struct ProcCmd gUnknown_085D7000[];

//! FE8U = 0x08063C20
void sub_8063C20(void)
{
    struct ProcEfx * proc = Proc_Start(gUnknown_085D7000, PROC_TREE_3);

    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = 0;

    sub_8063CFC(proc);

    return;
}

extern s16 gUnknown_085D7030[];

//! FE8U = 0x08063C40
void sub_8063C40(struct ProcEfx * proc)
{
    u32 i;

    u16 * bg2Scroll = (gEkrBg1ScrollFlip == 0) ? gpEkrLvupBg2ScrollOffsetTable2 : gpEkrLvupBg2ScrollOffsetTable1;
    u16 * bg1Scroll = (gEkrBg1ScrollFlip == 0) ? gpEkrLvupBg1ScrollOffsetList2 : gpEkrLvupBg1ScrollOffsetList1;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < 16)
        {
            *bg2Scroll++ = 0;
            *bg1Scroll++ = 0;
        }
        else if (i < 112)
        {
            s16 val = gUnknown_085D7030[i - 16] * proc->unk44 >> 12;

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

extern struct ProcCmd gUnknown_085D7018[];

//! FE8U = 0x08063CFC
void sub_8063CFC(ProcPtr proc)
{
    struct ProcEfxSCR * otherProc = Proc_Start(gUnknown_085D7018, PROC_TREE_3);

    otherProc->timer = 0;
    otherProc->unk2E = 20;
    otherProc->unk5C = proc;

    return;
}

//! FE8U = 0x08063D1C
void sub_8063D1C(struct ProcEfxSCR * proc)
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

extern struct ProcCmd gUnknown_085D70F0[];

extern u16 gUnknown_0872987C[];
extern u16 gUnknown_08729FDC[];
extern u16 gUnknown_0872A1BC[];

//! FE8U = 0x08063D64
void sub_8063D64(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D70F0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(gUnknown_0872987C, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_08729FDC, PLTT_SIZE_4BPP);

    SpellFx_ClearBG1();

    LZ77UnCompWram(gUnknown_0872A1BC, gEkrTsaBuffer);

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
void sub_8063E58(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();

    return;
}

//! FE8U = 0x08063E74
void sub_8063E74(struct ProcEfxBG * proc)
{
    gLCDControlBuffer.bgoffset[BG_1].y++;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D7110[];

extern u16 gUnknown_080DE106[];

//! FE8U = 0x08063EA0
void sub_8063EA0(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7110, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE106;

    proc->pal = gUnknown_08729FDC;
    SpellFx_RegisterBgPal(gUnknown_08729FDC, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08063EE8
void sub_8063EE8(void)
{
    gEfxBgSemaphore--;
    return;
}

//! FE8U = 0x08063EF8
void sub_8063EF8(struct ProcEfxBGCOL * proc)
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

extern struct ProcCmd gUnknown_085D7138[];

extern u16 * gUnknown_085D7150[];
extern u16 * gUnknown_085D7180[];

extern u16 gUnknown_0872CE60[];

extern u16 gUnknown_080DE150[];

//! FE8U = 0x08063F3C
void sub_8063F3C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7138, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE150;

    proc->tsal = gUnknown_085D7150;
    proc->tsar = gUnknown_085D7150;

    proc->img = gUnknown_085D7180;

    SpellFx_RegisterBgPal(gUnknown_0872CE60, PLTT_SIZE_4BPP);

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
void sub_8063FC0(struct ProcEfxBG * proc)
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

extern struct ProcCmd ProcScr_efxLunaOBJ[];

extern u16 gUnknown_0872DA04[];
extern u16 gUnknown_0872DE04[];

//! FE8U = 0x08064024
void sub_8064024(struct Anim * anim)
{
    u32 i;

    for (i = 0; i < 8; i++)
    {
        struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxLunaOBJ, PROC_TREE_3);
        proc->anim = anim;
        proc->unk44 = i;
    }

    SpellFx_RegisterObjPal(gUnknown_0872DE04, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0872DA04, 32 * 4 * CHR_SIZE);

    return;
}

extern u32 gUnknown_0872DFEC[];

//! FE8U = 0x08064060
void sub_8064060(struct ProcEfxOBJ * proc)
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

    anim->oam2Base &= 0x0000F3FF;
    anim->oam2Base |= 0x800;

    anim->xPosition = 0x100;
    anim->yPosition = 0x100;

    proc->unk32 = proc->anim->xPosition;
    proc->unk3A = proc->anim->yPosition;

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0872E24C[];

//! FE8U = 0x080640D0
void sub_80640D0(struct ProcEfxOBJ * proc)
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

extern u32 gUnknown_0872E024[];

//! FE8U = 0x0806416C
void sub_806416C(struct ProcEfxOBJ * proc)
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
void sub_80641F0(struct ProcEfxOBJ * proc)
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

extern struct ProcCmd gUnknown_085D71E0[];

//! FE8U = 0x0806428C
void sub_806428C(struct Anim * anim, ProcPtr b, int c)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D71E0, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = c;
    proc->unk64 = b;

    return;
}

//! FE8U = 0x080642BC
void sub_80642BC(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->unk64;
    otherProc->unk4C = Interpolate(INTERPOLATE_RSQUARE, 0x80, 0, proc->timer, proc->unk2E);

    proc->timer++;

    if (proc->timer > proc->unk2E)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
