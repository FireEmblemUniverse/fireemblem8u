#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

CONST_DATA struct ProcCmd ProcScr_efxDummymagic[] = {
    PROC_NAME("efxDummymagic"),
    PROC_REPEAT(EfxDummymagicMain),
    PROC_END
};

void StartSpellAnimDummy(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDummymagic, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxDummymagicMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);
    int time = ++proc->timer;

    if (time == 1)
    {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        return;
    }

    if (time == 10)
    {
        if (GetAnimNextRoundType(animc) != ANIM_ROUND_INVALID)
            animc->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

CONST_DATA struct ProcCmd ProcScr_efxTeono[] = {
    PROC_NAME("efxTeono"),
    PROC_REPEAT(EfxTeonoMain),
    PROC_END
};

void StartSpellAnimHandAxe(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeono, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxTeonoMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxTeonoOBJ(proc->anim);

        if (proc->timer == 1)
        {
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0x46)
    {
        return;
    }

    if (proc->timer == 0x50)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

CONST_DATA struct ProcCmd ProcScr_efxTeonoOBJ[] = {
    PROC_NAME("efxTeonoOBJ"),
    PROC_REPEAT(EfxTeonoObjMain),
    PROC_REPEAT(EfxTeonoObjEnd),
    PROC_END
};

void NewEfxTeonoOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObjCloseLeft, AnimScr_TeonoObjCloseRight, AnimScr_TeonoObjFarLeft, AnimScr_TeonoObjFarRight);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        proc->terminator = 35;
    else
        proc->terminator = 10;

    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
}

void EfxTeonoObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);

        if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        {
            gUnknown_02017758 = 1;
            Proc_End(proc->seproc);
            Proc_End(proc);
        }
        else
        {
            Proc_Break(proc);
        }
    }
}

void EfxTeonoObjEnd(struct ProcEfxMagicOBJ * proc)
{
    gUnknown_02017754 = 0;
    Proc_End(proc->seproc);
    NewEfxTeonoOBJ2(proc->anim);
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxTeonoOBJ2[] = {
    PROC_NAME("efxTeonoOBJ2"),
    PROC_REPEAT(EfxTeonoObj2Main),
    PROC_END
};

void NewEfxTeonoOBJ2(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);
}

void EfxTeonoObj2Main(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 17)
    {
        gEfxBgSemaphore--;
        gUnknown_02017758 = 1;
        Proc_End(proc->seproc);
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxTeonoSE[] = {
    PROC_NAME("efxTeonoSE"),
    PROC_SET_END_CB(EfxTeonoSeCallBack),
    PROC_REPEAT(EfxTeonoSeMain),
    PROC_END
};

ProcPtr NewEfxTeonoSE(struct Anim * anim, struct Anim * anim2)
{
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoSE, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 1;
    PlaySFX(0xCD, 0x100, anim->xPosition, 1);
    return proc;
}

void EfxTeonoSeCallBack(struct ProcEfxMagicOBJ * proc)
{
    gEfxBgSemaphore--;
}

void EfxTeonoSeMain(struct ProcEfxMagicOBJ * proc)
{
    int sound_pos;

    if (++proc->timer == 0x8)
    {
        sound_pos = (u16)proc->anim2->xPosition + GetProperAnimSoundLocation(proc->anim2);
        PlaySFX(0xCD, 0x100, (s16)sound_pos, 1);
        proc->timer = 0;
        if (proc->terminator <= 8)
            proc->terminator++;
    }
}

CONST_DATA struct ProcCmd ProcScr_efxArrow[] = {
    PROC_NAME("efxArrow"),
    PROC_REPEAT(EfxArrowMain),
    PROC_END
};

void StartSpellAnimArrow(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxArrow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxArrowMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);
    int frame = EfxGetCamMovDuration();

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxArrowOBJ(proc->anim);
        PlaySFX(0xCC, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1)
        {
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == (frame + 9))
    {
        return;
    }

    if (proc->timer == (frame + 10))
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

CONST_DATA struct ProcCmd ProcScr_efxArrowOBJ[] = {
    PROC_NAME("efxArrowOBJ"),
    PROC_REPEAT(EfxArrowObjMain),
    PROC_END
};

void NewEfxArrowOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxArrowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_ArrowCloseLeft, AnimScr_ArrowCloseRight, AnimScr_ArrowFarLeft, AnimScr_ArrowFarRight);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxArrowOBJ, 0x60);
}

void EfxArrowObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 4)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxTeyari[] = {
    PROC_NAME("efxTeyari"),
    PROC_REPEAT(EfxTeyariMain),
    PROC_END
};

void StartSpellAnimJavelin(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 0);
    SpellFx_RegisterObjPal(Pal_SpellJavelin, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin, 0x1000);
}

void StartSpellAnimJavelinCavalier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinCavalier, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinCavalier, 0x1000);
}

void StartSpellAnimJavelinSoldier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 0);
    SpellFx_RegisterObjPal(Pal_SpellJavelinSoldier, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinSoldier, 0x1000);
}

void StartSpellAnimJavelinPaladin(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinPaladin, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinPaladin, 0x1000);
}

void StartSpellAnimJavelinPrgasusKnight(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinPrgasusKnight, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinPrgasusKnight, 0x1000);
}

void StartSpellAnimJavelinFalcon(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinFalcon, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinFalcon, 0x1000);
}

void StartSpellAnimJavelinWyvernRider(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinWyvernRider, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinWyvernRider, 0x1000);
}

void StartSpellAnimJavelinWyvernLord(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinWyvernLord, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinWyvernLord, 0x1000);
}

void StartSpellAnimJavelinGenerial(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinGenerial, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinGenerial, 0x1000);
}

void StartSpellAnimJavelinUnk(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinUnk, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinUnk, 0x1000);
}

void StartSpellAnimJavelinPaladinF(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinPaladin, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinPaladin, 0x1000);
}

void EfxTeyariMain(struct ProcEfx * proc)
{
    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        PlaySFX(0xCA, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1)
        {
            struct Anim * animc = GetAnimAnotherSide(proc->anim);
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0xE)
    {
        return;
    }

    if (proc->timer == 0x10)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

CONST_DATA struct ProcCmd ProcScr_efxTeyariOBJ[] = {
    PROC_NAME("efxTeyariOBJ"),
    PROC_REPEAT(EfxTeyariObjMain),
    PROC_END
};

void NewEfxTeyariOBJ(struct Anim * anim, int type)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;
    u32 * scr1, * scr2;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeyariOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (type == 0)
    {
        scr2 = AnimScr_EfxTeyariObjType0Right;
        scr1 = AnimScr_EfxTeyariObjType0Left;
    }
    else
    {
        scr2 = AnimScr_EfxTeyariObjType1Right;
        scr1 = AnimScr_EfxTeyariObjType1Left;
    }

    anim2 = EfxCreateFrontAnim(anim, scr1, scr2, scr1, scr2);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x38;
    else
        anim2->xPosition -= 0x38;
}

void EfxTeyariObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 0xC)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}
