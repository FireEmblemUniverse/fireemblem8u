#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd gUnknown_085D5CF0[];

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

extern struct ProcCmd gUnknown_085D5D08[];

extern u16 gUnknown_080DD288[];
extern u16 * gUnknown_085D5E28[];
extern u16 * gUnknown_085D5D20[];
extern u16 * gUnknown_085D5DA4[];

//! FE8U = 0x0805F9A8
void sub_805F9A8(struct Anim * anim)
{
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

extern struct ProcCmd gUnknown_085D5EAC[];

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

extern struct ProcCmd gUnknown_085D5EC4[];
extern u16 gUnknown_080DD328[];
extern u16 * gUnknown_085D614C[];
extern u16 * gUnknown_085D5EDC[];
extern u16 * gUnknown_085D6014[];

//! FE8U = 0x0805FC90
void sub_805FC90(struct Anim * anim)
{
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

extern struct ProcCmd gUnknown_085D6284[];

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

extern int gUnknown_085D62A4[];

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

extern struct ProcCmd gUnknown_085D62DC[];

extern u32 gUnknown_0866F58C[];
extern u16 gUnknown_0866F2B4[];
extern u16 gUnknown_0866EFF0[];

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

extern struct ProcCmd gUnknown_085D62FC[];

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

void sub_805FFB0(struct Anim *);
void sub_80601E0(struct Anim *);
void sub_8060034(struct Anim *);
void sub_80600B8(struct Anim *);

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

extern struct ProcCmd gUnknown_085D6314[];
extern u16 gUnknown_080DD4D4[];
extern u16 * gUnknown_085D637C[];
extern u16 * gUnknown_085D632C[];
extern u16 gUnknown_08641D84[];

//! FE8U = 0x0805FFB0
void sub_805FFB0(struct Anim * anim)
{
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

extern u16 gUnknown_080DD542[];
extern u16 * gUnknown_085D63D8[];
extern u16 * gUnknown_085D63CC[];

//! FE8U = 0x08060034
void sub_8060034(struct Anim * anim)
{
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

extern u16 gUnknown_080DD550[];
extern u16 * gUnknown_085D6438[];
extern u16 * gUnknown_085D63E4[];
extern u16 gUnknown_08641D64[];

//! FE8U = 0x080600B8
void sub_80600B8(struct Anim * anim)
{
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

extern struct ProcCmd gUnknown_085D648C[];
extern u32 gUnknown_08646510[];
extern u16 gUnknown_08645F44[];
extern u16 gUnknown_08645DD8[];

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
