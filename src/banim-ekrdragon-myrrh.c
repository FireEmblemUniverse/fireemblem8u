#include "gbafe.h"

CONST_DATA struct ProcCmd ProcScr_EkrMyrrh[] = {
    PROC_SLEEP(0x3C),
    PROC_REPEAT(EkrMyr_PrepareBanimfx),
    PROC_REPEAT(EkrMyr_WaitForTransform),

PROC_LABEL(0),
    PROC_REPEAT(EkrMyr_TrigerForPrepared),
    PROC_REPEAT(EkrMyr_InBattleIdle),
    PROC_REPEAT(EkrMyr_ReturnToLoli),
    PROC_REPEAT(sub_8070AE4),
    PROC_END
};

void NewEkrDragonManakete(struct Anim *anim)
{
    struct EkrDragonStatus *ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon *proc = Proc_Start(ProcScr_EkrMyrrh, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}

void EkrMyr_PrepareBanimfx(struct ProcEkrDragon * proc)
{
    struct BattleAnim * banim = banim_data;
    struct Anim * anim = proc->anim;
    proc->timer = 0;

    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_INTRO - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPal_Banim);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
    Proc_Break(proc);
}

void EkrMyr_WaitForTransform(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;

    if (++proc->timer == 0x1A) {
        EfxPlaySE(0xDC, 0x100);
        M4aPlayWithPostionCtrl(0xDC, anim->xPosition, 1);
    }

    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EfxPlaySE(0xDE, 0x100);
        M4aPlayWithPostionCtrl(0xDE, anim->xPosition, 1);
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_MAIN - 1);
        Proc_Break(proc);
    }
}

void EkrMyr_TrigerForPrepared(struct ProcEkrDragon *proc)
{
    (void)GetAnimAnotherSide(proc->anim);
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

void EkrMyr_InBattleIdle(struct ProcEkrDragon * proc)
{
    u16 attr = GetEkrDragonStatusAttr(proc->anim);
    if (attr & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrMyr_ReturnToLoli(struct ProcEkrDragon * proc)
{
    struct Anim * anim = proc->anim;
    struct BattleAnim * banim = banim_data;

    if (GetEfxHp(2 * gEfxHpLutOff[GetAnimPosition(anim)] + GetAnimPosition(anim)) <= 0) {

        /* Transform from dragon to loli */
        proc->timer = 0;
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        gEkrSpellAnimIndex[0] = -1;
        Proc_Break(proc);
        return;
    }

    EfxPlaySE(0xDD, 0x100);
    M4aPlayWithPostionCtrl(0xDD, anim->xPosition, 1);
    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_EXIT - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    Proc_Break(proc);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPal_Banim);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPal_Banim, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
}

void sub_8070AE4(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);

        if (GetAnimPosition(anim) == EKR_POS_L)
            SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        else
            SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);

        Proc_Break(proc);
    }
}

#ifdef NONMATCHING
#define UNIT_FACTION_FAKE(bu) UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&(bu)->unit)))
#else
#define UNIT_FACTION_FAKE(bu) ({ \
    s32 tmp = GetUnitFromCharId(UNIT_CHAR_ID(&(bu)->unit))->index; \
    asm("":::"r4"); \
    tmp & 0xC0; \
})
#endif

void RegisterEkrDragonStatusType(void)
{
    struct BattleUnit *bu1 = gpEkrBattleUnitLeft;
    struct BattleUnit *bu2 = gpEkrBattleUnitRight;

    struct BattleUnit *bu1a = bu1, *bu2a = bu2;

    u16 validl = gBanimValid[EKR_POS_L];
    u16 validr = gBanimValid[EKR_POS_R];

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        break;

    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
    default:
        return;
    }

    switch (UNIT_CLASS_ID(&bu1a->unit)) {
    case CLASS_MANAKETE_MYRRH:
        if (bu1a->unit.statusIndex == UNIT_STATUS_SLEEP)
            break;

        if (bu1a->unit.statusIndex == UNIT_STATUS_PETRIFY)
            break;

        if (bu1a->unit.statusIndex == UNIT_STATUS_13)
            break;

        if (GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_SLEEP)
            break;

        if (GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_BERSERK)
            break;

        if (GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_SILENCE)
            break;

        if (GetItemIndex(bu2->weaponBefore) == ITEM_MONSTER_STONE)
            break;

        if (UNIT_FACTION_FAKE(bu1a) == UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bu2->unit))))
            break;

        if (validl == false)
            break;

        if (GetItemIndex(bu1a->weaponBefore) == ITEM_DIVINESTONE)
            SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_MYRRH);

        break;

    case CLASS_DRACO_ZOMBIE:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_DRACO_ZOMBIE);
        break;

    case CLASS_DEMON_KING:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_DEMON_KING);
        break;

    default:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        break;
    }

    /* Judge another side */
    if (UNIT_CLASS_ID(&bu2a->unit) == CLASS_MANAKETE_MYRRH) {
        if (bu2a->unit.statusIndex == UNIT_STATUS_SLEEP)
            return;

        if (bu2a->unit.statusIndex == UNIT_STATUS_PETRIFY)
            return;

        if (bu2a->unit.statusIndex == UNIT_STATUS_13)
            return;

        if (GetItemIndex(bu1->weaponBefore) == ITEM_STAFF_SLEEP)
            return;

        if (GetItemIndex(bu1->weaponBefore) == ITEM_STAFF_BERSERK)
            return;

        if (GetItemIndex(bu1->weaponBefore) == ITEM_STAFF_SILENCE)
            return;

        if (GetItemIndex(bu1->weaponBefore) == ITEM_MONSTER_STONE)
            return;

        if (UNIT_FACTION_FAKE(bu1a) == UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bu2a->unit))))
            return;

        if (validr == false)
            return;

        if (GetItemIndex(bu2->weaponBefore) == ITEM_DIVINESTONE)
            SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_MYRRH);
    }
    else
        SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);
}
