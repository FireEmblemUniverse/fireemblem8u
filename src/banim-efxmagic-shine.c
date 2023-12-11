#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxShine[];

//! FE8U = 0x08063480
void StartSpellAnimShine(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxShine, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080634BC
void sub_80634BC(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 0xb)
    {
        sub_806364C(anim);
        PlaySFX(700, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x17)
    {
        NewEfxFlashBgWhite(anim, 5);
        sub_80637F8(anim);
    }
    else if (proc->timer == duration + 0x1d)
    {
        sub_8063590(anim);
        sub_806376C(anim);
    }
    else if (proc->timer == duration + 0x1e)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 0x23)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxShineBG[];

extern u16 * gUnknown_085D6F24[];
extern u16 * gUnknown_085D6F28[];
extern u16 * gUnknown_085D6F2C[];

extern u16 gUnknown_080DE03C[];

//! FE8U = 0x08063590
void sub_8063590(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE03C;

    proc->tsal = gUnknown_085D6F24;
    proc->tsar = gUnknown_085D6F28;
    proc->img = gUnknown_085D6F2C;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080635E8
void sub_80635E8(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
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

extern struct ProcCmd ProcScr_efxShineBG2[];

extern u16 * gUnknown_085D6F48[];

extern u16 gUnknown_0872796C[];
extern u16 gUnknown_08727C48[];

extern u16 gUnknown_080DE050[];

//! FE8U = 0x0806364C
void sub_806364C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE050;

    proc->tsal = gUnknown_085D6F48;
    proc->tsar = gUnknown_085D6F48;

    SpellFx_RegisterBgPal(gUnknown_08727C48, 0x20);
    SpellFx_RegisterBgGfx(gUnknown_0872796C, 0x2000);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0xe8, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080636D8
void sub_80636D8(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != 0)
        {
            if (GetAnimPosition(proc->anim) == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 0x14, 0, 0);
            }
            else
            {
                FillBGRect(gBG1TilemapBuffer + 0x1d, 3, 0x14, 0, 0);
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

extern struct ProcCmd ProcScr_efxShineBGCOL[];

extern u16 gUnknown_08726FF4[];

extern u16 gUnknown_080DE086[];

//! FE8U = 0x0806376C
void sub_806376C(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE086;

    proc->pal = gUnknown_08726FF4;
    SpellFx_RegisterBgPal(gUnknown_08726FF4, 0x20);

    return;
}

//! FE8U = 0x080637B0
void sub_80637B0(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, 0x20);
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

extern struct ProcCmd ProcScr_efxShineOBJRND[];

extern u16 gUnknown_08728920[];
extern u16 gUnknown_0872865C[];

//! FE8U = 0x080637F8
void sub_80637F8(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJRND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 2;
    proc->unk30 = 0;

    SpellFx_RegisterObjPal(gUnknown_08728920, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0872865C, 0x1000);

    return;
}

extern s16 gUnknown_085D6FA4[];

//! FE8U = 0x08063840
void sub_8063840(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        int x;
        int y;
        if (GetAnimPosition(proc->anim) == 0)
        {
            x = proc->anim->xPosition + gUnknown_085D6FA4[(s16)proc->unk30];
            y = proc->anim->yPosition + gUnknown_085D6FA4[(s16)proc->unk30 + 1];
            sub_80638F0(proc->anim, x, y);
        }
        else
        {
            x = proc->anim->xPosition - gUnknown_085D6FA4[(s16)proc->unk30];
            y = proc->anim->yPosition + gUnknown_085D6FA4[(s16)proc->unk30 + 1];
            sub_80638F0(proc->anim, x, y);
        }

        proc->timer = 0;

        (s16) proc->unk30 += 2;

        if ((s16)proc->unk30 > 7)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxShineOBJ[];
extern u32 gUnknown_08728C04[];

//! FE8U = 0x080638F0
void sub_80638F0(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x46;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_08728C04, gUnknown_08728C04, gUnknown_08728C04, gUnknown_08728C04);
    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

//! FE8U = 0x08063948
void sub_8063948(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
