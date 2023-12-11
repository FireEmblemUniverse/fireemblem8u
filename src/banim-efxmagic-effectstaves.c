#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

extern struct ProcCmd gUnknown_085D6B20[];

//! FE8U = 0x080623E0
void StartSpellAnimSilence(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D6B20, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0806241C
void sub_806241C(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_8062608(proc->anim);
        PlaySFX(0xfa, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 0x29)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 0x44)
    {
        sub_8062524(proc->anim);
        PlaySFX(0xfb, 0x100, anim->xPosition, 1);
        NewEfxALPHA(proc->anim, 0x42, 0x14, 0x10, 0, 0);
    }
    else if (proc->timer == duration + 0x86)
    {
        PlaySFX(0xfc, 0x100, anim->xPosition, 1);
        StopBGM1();

        anim->state3 |= 9;

        sub_8055518(anim, proc->hitted);
        NewEfxFlashBgWhite(proc->anim, 10);

        if (!proc->hitted && (GettUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 3);
        }
    }
    else if (proc->timer == duration + 0x9e)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D6B38[];

extern u16 * gUnknown_085D6B50[];

extern u16 gUnknown_08680DC0[];
extern u16 gUnknown_0867EEB4[];

extern u16 gUnknown_080DDCE6[];

//! FE8U = 0x08062524
void sub_8062524(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6B38, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDCE6;

    proc->tsal = gUnknown_085D6B50;
    proc->tsar = gUnknown_085D6B50;

    SpellFx_RegisterBgPal(gUnknown_08680DC0, 0x20);
    SpellFx_RegisterBgGfx(gUnknown_0867EEB4, 0x2000);

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0xe8, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
    }

    return;
}

//! FE8U = 0x080625B0
void sub_80625B0(struct ProcEfxBG * proc)
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

extern struct ProcCmd gUnknown_085D6B98[];

extern u32 gUnknown_08680FFC[];
extern u16 gUnknown_086808A0[];

//! FE8U = 0x08062608
void sub_8062608(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6B98, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 =
        EfxCreateFrontAnim(anim, gUnknown_08680FFC, gUnknown_08680FFC, gUnknown_08680FFC, gUnknown_08680FFC);

    SpellFx_RegisterObjPal(gUnknown_08680DC0, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086808A0, 0x1000);

    return;
}

//! FE8U = 0x08062660
void sub_8062660(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

extern struct ProcCmd gUnknown_085D6BB8[];

//! FE8U = 0x08062678
void StartSpellAnimSleep(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D6BB8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080626B4
void sub_80626B4(struct ProcEfx * proc)
{

    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_8062898(proc->anim);
        PlaySFX(0x0000011B, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 100)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 0x82)
    {
        sub_80628F0(anim);
        sub_8062944(anim);

        sub_80627B4(proc->anim);

        NewEfxALPHA(anim, 0, 0x14, 0, 0x10, 0);
        NewEfxALPHA(anim, 0xe6, 0x14, 0x10, 0, 0);
    }
    else if (proc->timer == duration + 0x14a)
    {
        anim->state3 |= 9;

        sub_8055518(anim, proc->hitted);

        if (!proc->hitted && GettUnitEfxDebuff(anim) == 0)
        {
            SetUnitEfxDebuff(anim, 2);
        }
    }
    else if (proc->timer == duration + 0x172)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D6BD0[];

extern u16 * gUnknown_085D6BE8[];

extern u16 gUnknown_086852D8[];
extern u16 gUnknown_086861A4[];

extern u16 gUnknown_080DDD58[];

//! FE8U = 0x080627B4
void sub_80627B4(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6BD0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDD58;

    proc->tsal = gUnknown_085D6BE8;
    proc->tsar = gUnknown_085D6BE8;

    SpellFx_RegisterBgPal(gUnknown_086861A4, 0x20);
    SpellFx_RegisterBgGfx(gUnknown_086852D8, 0x2000);

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0xe8, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
    }

    return;
}

//! FE8U = 0x08062840
void sub_8062840(struct ProcEfxBG * proc)
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

extern struct ProcCmd gUnknown_085D6C28[];

extern u32 gUnknown_0868C2E8[];

//! FE8U = 0x08062898
void sub_8062898(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6C28, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_0868C2E8, gUnknown_0868C2E8, gUnknown_0868C2E8, gUnknown_0868C2E8);

    SpellFx_RegisterObjPal(gUnknown_0868716C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 0x800);

    return;
}

extern struct ProcCmd ProcScr_efxSleepOBJ2[];

extern u32 gUnknown_0868C168[];

//! FE8U = 0x080628F0
void sub_80628F0(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ2, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_0868C168, gUnknown_0868C168, gUnknown_0868C168, gUnknown_0868C168);
    proc->anim2 = frontAnim;
    frontAnim->yPosition -= 8;

    return;
}

//! FE8U = 0x08062934
void sub_8062934(void)
{
    gEfxBgSemaphore--;
    return;
}

extern struct ProcCmd ProcScr_efxSleepSE[];

//! FE8U = 0x08062944
void sub_8062944(struct Anim * anim)
{
    struct ProcEfx * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepSE, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x08062968
void sub_8062968(struct ProcEfx * proc)
{
    PlaySFX(0x11c, 0x100, proc->anim->xPosition, 1);
    return;
}

//! FE8U = 0x08062988
void sub_8062988(void)
{
    gEfxBgSemaphore--;
    return;
}

extern struct ProcCmd ProcScr_efxHammarne[];

//! FE8U = 0x08062998
void StartSpellAnimHammerne(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxHammarne, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080629D4
void sub_80629D4(struct ProcEfx * proc)
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
        sub_8062AF4(anim);

        NewEfxALPHA(anim, 0x28, 0x1e, 0x10, 8, 0);
        NewEfxALPHA(anim, 0x47, 0x1e, 8, 0x10, 0);
        NewEfxALPHA(anim, 0x66, 0x1e, 0x10, 8, 0);
        NewEfxALPHA(anim, 0x85, 0x1e, 8, 0x10, 0);
        NewEfxALPHA(anim, 0xa4, 0x3c, 0x10, 0, 0);

        PlaySFX(0x00000103, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x50)
    {
        sub_8062BAC(anim);
    }
    else if (proc->timer == duration + 0xa4)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= 9;
        sub_8055518(anim, proc->hitted);
    }
    else if (proc->timer == duration + 300)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxHammarneBG[];

extern u16 * gUnknown_085D6CE0[];
extern u16 * gUnknown_085D6D14[];

extern u16 gUnknown_086810B8[];

extern u16 gUnknown_080DDE9E[];

//! FE8U = 0x08062AF4
void sub_8062AF4(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDE9E;

    proc->tsal = gUnknown_085D6CE0;
    proc->tsar = gUnknown_085D6CE0;

    proc->img = gUnknown_085D6D14;

    SpellFx_RegisterBgPal(gUnknown_086810B8, 0x20);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08062B48
void sub_8062B48(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
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

extern struct ProcCmd ProcScr_efxHammarneOBJ[];

extern u32 gUnknown_08684908[];

extern u16 gUnknown_08686F84[];
extern u16 gUnknown_0868718C[];

//! FE8U = 0x08062BAC
void sub_8062BAC(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08684908, gUnknown_08684908, gUnknown_08684908, gUnknown_08684908);

    SpellFx_RegisterObjPal(gUnknown_0868718C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 0x800);

    return;
}

//! FE8U = 0x08062C04
void sub_8062C04(void)
{
    gEfxBgSemaphore--;
    return;
}

extern struct ProcCmd ProcScr_efxBerserk[];

//! FE8U = 0x08062C14
void StartSpellAnimBerserk(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxBerserk, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08062C50
void sub_8062C50(struct ProcEfx * proc)
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
        sub_8062F4C(anim);
        sub_8062D30(anim, 0x4a);
        sub_8062EAC(anim, 0x4a);

        NewefxRestRST(anim, 0x4a, 10, 0x100, 1);
        NewEfxRestWINH_(anim, 0x4a, 0);

        PlaySFX(0xf9, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x4a)
    {
        NewEfxFlashBgWhite(anim, 5);
        anim->state3 |= 9;

        sub_8055518(anim, proc->hitted);

        if (!proc->hitted && (GettUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 4);
        }
    }
    else if (proc->timer == duration + 0x5a)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxBerserkBG[];

extern u16 gUnknown_0868C338[];
extern u16 Img_086849B8[];
extern u16 gUnknown_08684AB8[];

//! FE8U = 0x08062D30
void sub_8062D30(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(gUnknown_0868C338, 0x20);
    SpellFx_RegisterBgGfx(Img_086849B8, 0x2000);

    EfxTmCpyBG(gUnknown_08684AB8, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    SpellFx_SetSomeColorEffect();
    SetBlendAlpha(14, 8);

    sub_80708A0();

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    anim->oamBase |= 0x800;

    anim->oam2Base &= 0x0000F3FF;
    anim->oam2Base |= 0x400;

    return;
}

//! FE8U = 0x08062E44
void sub_8062E44(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;

    gLCDControlBuffer.bgoffset[BG_1].y--;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        sub_8070874();

        anim->oamBase &= 0xFFFFF7FF;

        anim->oam2Base &= 0x0000F3FF;
        anim->oam2Base |= 0x800;

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxBerserkCLONE[];

//! FE8U = 0x08062EAC
void sub_8062EAC(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08062ED8
void sub_8062ED8(struct ProcEfxBG * proc)
{
    struct Anim clone;

    struct Anim * anim = proc->anim;

    clone.xPosition = anim->xPosition;
    clone.yPosition = anim->yPosition;

    clone.pSpriteData = anim->pSpriteData;

    clone.oamBase = anim->oamBase & 0xFFFFF7FF;

    clone.oam2Base = anim->oam2Base;
    clone.oam2Base &= 0x0000F3FF;
    clone.oam2Base |= 0x800;

    AnimDisplay(&clone);

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08062F3C
void sub_8062F3C(void)
{
    gEfxBgSemaphore--;
    return;
}

extern struct ProcCmd ProcScr_efxBerserkOBJ[];

//! FE8U = 0x08062F4C
void sub_8062F4C(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);

    scr = FramScr_Unk5D4F90;
    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->oam2Base &= 0x0000F3FF;
    frontAnim->oam2Base |= 0x400;

    return;
}

//! FE8U = 0x08062FA4
void sub_8062FA4(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

extern u32 gUnknown_0868D2B4[];

extern u16 gUnknown_0868C358[];
extern u16 gUnknown_0868CC10[];

//! FE8U = 0x08062FBC
void sub_8062FBC(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2B4;
    anim->pScrCurrent = gUnknown_0868D2B4;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D2C8[];

//! FE8U = 0x08062FF8
void sub_8062FF8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2C8;
    anim->pScrCurrent = gUnknown_0868D2C8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D2DC[];

//! FE8U = 0x08063034
void sub_8063034(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2DC;
    anim->pScrCurrent = gUnknown_0868D2DC;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D2F0[];

//! FE8U = 0x08063070
void sub_8063070(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2F0;
    anim->pScrCurrent = gUnknown_0868D2F0;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D304[];

//! FE8U = 0x080630AC
void sub_80630AC(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D304;
    anim->pScrCurrent = gUnknown_0868D304;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D678[];
extern u16 gUnknown_0868C7F0[];

//! FE8U = 0x080630E8
void sub_80630E8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D678;
    anim->pScrCurrent = gUnknown_0868D678;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D684[];

//! FE8U = 0x08063124
void sub_8063124(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D684;
    anim->pScrCurrent = gUnknown_0868D684;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D690[];

//! FE8U = 0x08063160
void sub_8063160(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D690;
    anim->pScrCurrent = gUnknown_0868D690;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D69C[];

//! FE8U = 0x0806319C
void sub_806319C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D69C;
    anim->pScrCurrent = gUnknown_0868D69C;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 0x1000);

    Proc_Break(proc);

    return;
}

extern u32 gUnknown_0868D6A8[];

//! FE8U = 0x080631D8
void sub_80631D8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D6A8;
    anim->pScrCurrent = gUnknown_0868D6A8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 0x1000);

    Proc_Break(proc);

    return;
}

extern struct ProcCmd ProcScr_efxMshield[];

//! FE8U = 0x08063214
void sub_8063214(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxMshield, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08063250
void sub_8063250(struct ProcEfx * proc)
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
        sub_806331C(proc->anim);
        sub_80633D0(anim);
        sub_8063428(anim);
        PlaySFX(0x102, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x28)
    {
        sub_8063428(anim);
    }
    else if (proc->timer == duration + 0x50)
    {
        sub_8063428(anim);
    }
    else if (proc->timer == duration + 0xb0)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 0xe1)
    {
        anim->state3 |= 9;
        sub_8055518(anim, proc->hitted);
    }
    else if (proc->timer == duration + 0xe6)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxMshieldBG[];

extern u16 * gUnknown_085D6EA0[];

extern u16 gUnknown_0868DF5C[];
extern u16 gUnknown_0868D6D0[];

extern u16 gUnknown_080DDF3A[];

//! FE8U = 0x0806331C
void sub_806331C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDF3A;

    proc->tsal = gUnknown_085D6EA0;
    proc->tsar = gUnknown_085D6EA0;

    SpellFx_RegisterBgPal(gUnknown_0868DF5C, 0x20);
    SpellFx_RegisterBgGfx(gUnknown_0868D6D0, 0x2000);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08063378
void sub_8063378(struct ProcEfxBG * proc)
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

extern struct ProcCmd ProcScr_efxMshieldBGOBJ[];

extern u32 gUnknown_08692524[];

extern u16 gUnknown_0868E46C[];
extern u16 gUnknown_08686F84[];

//! FE8U = 0x080633D0
void sub_80633D0(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08692524, gUnknown_08692524, gUnknown_08692524, gUnknown_08692524);

    SpellFx_RegisterObjPal(gUnknown_0868E46C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 0x800);

    return;
}

extern struct ProcCmd ProcScr_efxMshieldBGOBJ2[];

extern u32 gUnknown_08692674[];

//! FE8U = 0x08063428
void sub_8063428(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08692674, gUnknown_08692674, gUnknown_08692674, gUnknown_08692674);

    return;
}

//! FE8U = 0x08063468
void sub_8063468(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}
