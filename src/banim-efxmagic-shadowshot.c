#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxDarkLongMons[];

//! FE8U = 0x0806AEF4
void sub_806AEF4(struct Anim * anim)
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
void sub_806AF30(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 0xb)
    {
        sub_806B2C0(anim);
        PlaySFX(0x000003D5, 0x100, 0x10, 1);
    }
    else if (proc->timer == duration + 0x2b)
    {
        sub_806B1E8(anim);
    }
    else if (proc->timer == duration + 0x97)
    {
        sub_806B4E4();
    }
    else if (proc->timer == duration + 0xa7)
    {
        sub_806B134(anim);
    }
    else if (proc->timer == duration + 0xeb)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 0xec)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 0xed)
    {
        StartSpellThing_MagicQuake(proc->anim, 0x3e, 9);
        NewEfxFlashBgWhite(proc->anim, 10);
    }
    else if (proc->timer == duration + 0xf7)
    {
        NewEfxRestWINH_(proc->anim, 0x46, 1);
        NewEfxTwobaiRST(proc->anim, 0x32);
        StartSubSpell_efxSuperdruidBG3(proc->anim);
        NewEfxALPHA(anim, 0x10, 10, 0x10, 0, 0);
        PlaySFX(0x000003D6, 0x100, 0xc0, 1);
    }
    else if (proc->timer == duration + 0x110)
    {
        RegisterEfxSpellCastEnd();
    }
    else if (proc->timer == duration + 0x0000012B)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806B088
void sub_806B088(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount < DISPLAY_HEIGHT)
    {
        REG_BG1VOFS = (vcount >> 1) - vcount;
    }

    return;
}

//! FE8U = 0x0806B0AC
void sub_806B0AC(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
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
void sub_806B11C(struct ProcEfxBG * proc)
{
    SetPrimaryHBlankHandler(NULL);
    Proc_Break(proc);
    return;
}

extern struct ProcCmd ProcScr_efxDarkLongMonsBG01[];

extern u16 * gUnknown_085D89B8[];
extern u16 * gUnknown_085D89F8[];
extern u16 * gUnknown_085D8A38[];

extern u16 gUnknown_080DEF78[];

//! FE8U = 0x0806B134
void sub_806B134(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsBG01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DEF78;

    proc->tsal = gUnknown_085D89B8;
    proc->img = gUnknown_085D89F8;
    proc->pal = gUnknown_085D8A38;

    BG_SetPosition(BG_1, 0, 0);

    SetPrimaryHBlankHandler(sub_806B088);

    return;
}

//! FE8U = 0x0806B194
void sub_806B194(struct ProcEfxBG * proc)
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

extern struct ProcCmd ProcScr_efxDarkLongMonsBG02[];

extern u16 * gUnknown_085D8A98[];

extern u16 gUnknown_086E7EB0[];
extern u16 gUnknown_086E91B8[];

extern u16 gUnknown_080DEFD0[];

//! FE8U = 0x0806B1E8
void sub_806B1E8(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsBG02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DEFD0;

    proc->tsal = gUnknown_085D8A98;

    SpellFx_RegisterBgGfx(gUnknown_086E7EB0, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_086E91B8, 0x20);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806B24C
void sub_806B24C(struct ProcEfxOBJ * proc)
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

    if (proc->timer < 0x10)
    {
        timer = proc->timer;
    }
    else
    {
        if (proc->timer >= proc->terminator - 0x10)
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
            proc->anim2->yPosition = 0xe0;
        }
        else
        {
            proc->anim2->yPosition = 0x20;
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxDarkLongMonsOBJ[];

extern u32 gUnknown_086DA920[];

extern u16 gUnknown_086D9C40[];
extern u16 gUnknown_086DA33C[];

//! FE8U = 0x0806B2C0
void sub_806B2C0(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0xbc;

    scr = gUnknown_086DA920;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = 200;
    }
    else
    {
        frontAnim->xPosition = 0x28;
    }

    frontAnim->yPosition = 0x20;

    SpellFx_RegisterObjPal(gUnknown_086DA33C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086D9C40, 0x1000);

    return;
}

struct Proc085D8AEC
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

//! FE8U = 0x0806B33C
void sub_806B33C(struct Proc085D8AEC * proc)
{
    proc->unk4C = 0;
    return;
}

#define RGB_(r, g, b) (((b) << 10) | ((g) << 5) | (r))

//! FE8U = 0x0806B344
void sub_806B344(struct Proc085D8AEC * proc)
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
                CpuFastCopy(r7, r6, 0x20);
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

extern struct ProcCmd gUnknown_085D8AEC[];

//! FE8U = 0x0806B4E4
void sub_806B4E4(void)
{
    Proc_Start(gUnknown_085D8AEC, PROC_TREE_VSYNC);
    return;
}
