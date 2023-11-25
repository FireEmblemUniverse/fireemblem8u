#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

extern struct ProcCmd gUnknown_085D58F0[];

//! FE8U = 0x0805EED8
void sub_805EED8(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D58F0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805EF14
void sub_805EF14(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        PlaySFX(0x10a, 0x100, proc->anim->xPosition, 1);
        sub_805F004(anim);
    }
    else if (proc->timer == 16)
    {
        sub_805F1A4(proc->anim);
    }
    else if (proc->timer == 74)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else
    {
        if (proc->timer == duration + 75)
        {
            proc->unk_64 = sub_805F1E8(anim);
        }
        else if (proc->timer == duration + 94)
        {
            PlaySFX(0x2E1, 0x100, anim->xPosition, 1);
            sub_805F0B0(proc->anim);
        }
        else if (proc->timer == duration + 114)
        {
            Proc_End(proc->unk_64);
        }
        else if (proc->timer == duration + 131)
        {
            NewEfxFlashBgWhite(proc->anim, 6);
            anim->state3 |= 9;

            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if (proc->timer == duration + 164)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

extern u16 * gUnknown_085D5920[];
extern u16 * gUnknown_085D59C4[];

extern struct ProcCmd gUnknown_085D5908[];

//! FE8U = 0x0805F004
void sub_805F004(struct Anim * anim)
{
    struct LCDControlBuffer * lcd;
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5908, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD094;
    proc->tsar = proc->tsal = gUnknown_085D5920;
    proc->img = gUnknown_085D59C4;
    SpellFx_RegisterBgPal(gUnknown_0862A2D0, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(1, 232, 0);
        }
        else
        {
            BG_SetPosition(1, 24, 0);
        }
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        lcd = &gLCDControlBuffer;
        lcd->bgoffset[1].x += 4;
        lcd->bgoffset[1].y += 8;
    }
    else
    {
        lcd = &gLCDControlBuffer;
        lcd->bgoffset[1].x -= 4;
        lcd->bgoffset[1].y += 8;
    }

    return;
}

//! FE8U = 0x0805F0B0
void sub_805F0B0(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5908, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD0C6;
    proc->tsar = proc->tsal = gUnknown_085D5920;
    proc->img = gUnknown_085D59C4;

    SpellFx_RegisterBgPal(gUnknown_0862A2F0, 0x20);
    SpellFx_SetSomeColorEffect();

    SetSpecialColorEffectsParameters(1, 10, 7, 0);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(1, 232, 0);
        }
        else
        {
            BG_SetPosition(1, 24, 0);
        }
    }

    return;
}

//! FE8U = 0x0805F140
void sub_805F140(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaLeft = proc->tsal;
        u16 ** tsaRight = proc->tsar;
        SpellFx_RegisterBgGfx(proc->img[ret], 0x2000);
        SpellFx_WriteBgMap(proc->anim, tsaLeft[ret], tsaRight[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxMistyrainOBJ[];

//! FE8U = 0x0805F1A4
void sub_805F1A4(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMistyrainOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);
    script = FramScr_Unk5D4F90;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);

    return;
}

extern struct ProcCmd gUnknown_085D5AB0[];

//! FE8U = 0x0805F1E8
struct ProcEfxOBJ * sub_805F1E8(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5AB0, PROC_TREE_3);
    proc->anim = anim;
    GetAnimAnotherSide(anim);

    script = FramScr_Unk5D4F90;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);
    proc->anim2->yPosition -= 4;

    return proc;
}

//! FE8U = 0x0805F234
void sub_805F234(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0805F24C
void sub_805F24C(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = gUnknown_0862D6A8;
    proc->anim2->pScrCurrent = gUnknown_0862D6A8;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0862D424, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0862C82C, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F288
void sub_805F288(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = gUnknown_0862D82C;
    proc->anim2->pScrCurrent = gUnknown_0862D82C;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0862D424, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0862CC2C, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F2C4
void sub_805F2C4(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = gUnknown_0862DCE0;
    proc->anim2->pScrCurrent = gUnknown_0862DCE0;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0862D424, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_0862D06C, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F300
void sub_805F300(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;
    anim->pScrStart = gUnknown_0862DC24;
    anim->pScrCurrent = gUnknown_0862DC24;

    anim->timer = 0;

    anim->drawLayerPriority = 20;

    AnimSort();

    proc->timer = 39;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F32C
void sub_805F32C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        anim->pScrStart = gUnknown_0862DC58;
        anim->pScrCurrent = gUnknown_0862DC58;
        anim->timer = 0;

        proc->timer = 0;
    }

    return;
}
