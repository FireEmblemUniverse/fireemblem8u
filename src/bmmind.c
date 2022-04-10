#include "global.h"

#include "proc.h"
#include "rng.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "mu.h"
#include "mapselect.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "constants/items.h"
#include "constants/terrains.h"

struct UnknownBMMindProc {
    /* 00 */ PROC_HEADER;
    
    /* 29 */ u8 unk_29[0x54-0x29];
    
    /* 54 */ struct Unit* unk_54;
    
};

extern struct ProcCmd CONST_DATA gUnknown_0859DA6C[];
extern struct ProcCmd CONST_DATA gUnknown_0859DABC[];
extern struct ProcCmd CONST_DATA gUnknown_0859DB24[];

// koido.s
void Make6CKOIDO(struct Unit*, int, u8, ProcPtr);
int GetSomeFacingDirection(int, int, int, int);

// bmtrap.s
s8 sub_80377F0(ProcPtr, struct Unit*);

// ev_triggercheck.s
void sub_808371C(u8, u8, int);
void sub_8083FB0(u8, u8);
void sub_80840C4(int, int);

// ui_targetselection.s
struct SelectTarget* GetTarget(int index);

// bmtarget.s
void MakeTargetListForFuckingNightmare(struct Unit*);

// code_mapanim.s
void BeginMapAnimForSteal(void);
void BeginMapAnimForSummon(void);
void BeginMapAnimForSummonDK(void);

s8 ActionRescue(ProcPtr);
s8 ActionDrop(ProcPtr);
s8 ActionVisitAndSieze(ProcPtr);
s8 ActionCombat(ProcPtr);
s8 ActionDance(ProcPtr);
s8 ActionTalk(ProcPtr);
s8 ActionSupport(ProcPtr);
s8 ActionSteal(ProcPtr);
s8 ActionSummon(ProcPtr);
s8 ActionSummonDK(ProcPtr);
s8 ActionArena(ProcPtr);
s8 ActionStaffDoorChestUseItem(ProcPtr);
s8 ActionPick(ProcPtr);

void StoreRNStateToActionStruct() {
    StoreRNState(gActionData._u00);
    return;
}

void LoadRNStateFromActionStruct() {
    LoadRNState(gActionData._u00);
    return;
}

unsigned int ApplyUnitAction(ProcPtr proc) {
    gActiveUnit = GetUnit(gActionData.subjectIndex);

    if (gActionData.unitActionType == UNIT_ACTION_COMBAT) { // UNIT_ACTION_STAFF = 2, UNIT_ACTION_COMBAT = 1
        int itemIdx = GetItemIndex(
            GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
        );

        if (itemIdx == ITEM_NIGHTMARE) {
            ActionStaffDoorChestUseItem(proc);
            return 0;
        }
    }

    switch (gActionData.unitActionType) {
        case UNIT_ACTION_WAIT:
        case UNIT_ACTION_TRAPPED:
            gActiveUnit->state |= US_HAS_MOVED;
            return 1;
        case UNIT_ACTION_RESCUE:
            return ActionRescue(proc);
        case UNIT_ACTION_DROP:
            return ActionDrop(proc);
        case UNIT_ACTION_VISIT:
        case UNIT_ACTION_SEIZE:
            return ActionVisitAndSieze(proc);
        case UNIT_ACTION_COMBAT:
            return ActionCombat(proc);
        case UNIT_ACTION_DANCE:
            return ActionDance(proc);
        case UNIT_ACTION_TALK:
            return ActionTalk(proc);
        case UNIT_ACTION_SUPPORT:
            return ActionSupport(proc);
        case UNIT_ACTION_STEAL:
            return ActionSteal(proc);
        case UNIT_ACTION_SUMMON:
            return ActionSummon(proc);
        case UNIT_ACTION_SUMMON_DK:
            return ActionSummonDK(proc);
        case UNIT_ACTION_ARENA:
            return ActionArena(proc);
        case UNIT_ACTION_STAFF:
        case UNIT_ACTION_DOOR:
        case UNIT_ACTION_CHEST:
        case UNIT_ACTION_USE_ITEM:
            ActionStaffDoorChestUseItem(proc);
            return 0;
        case UNIT_ACTION_PICK:
            ActionPick(proc);
            return 0;
        default:
            return 1;
    }
}

s8 ActionRescue(ProcPtr proc) {
    struct Unit* subject = GetUnit(gActionData.subjectIndex);
    struct Unit* target = GetUnit(gActionData.targetIndex);

    TryRemoveUnitFromBallista(target);

    Make6CKOIDO(
        target,
        GetSomeFacingDirection(subject->xPos, subject->yPos, target->xPos, target->yPos),
        0,
        proc
    );

    UnitRescue(subject, target);
    HideUnitSMS(target);

    return 0;
}

int sub_80321B8(struct UnknownBMMindProc* proc) {
    return sub_80377F0(proc, proc->unk_54);
}

int sub_80321C8() {
    RefreshEntityBmMaps();
    RenderBmMap();
    SMS_UpdateFromGameData();
    SMS_FlushIndirect();

    // return; // BUG?
}

s8 ActionDrop(ProcPtr proc) {
    struct Unit* target = GetUnit(gActionData.targetIndex);
    ProcPtr child;
    
    if ((1 & gBmMapHidden[gActionData.yOther][gActionData.xOther])) {
        gWorkingMovementScript[0] = 0xA;
        gWorkingMovementScript[1] = 4;
        MU_StartMoveScript_Auto(gWorkingMovementScript);
        return 0;
    }

    UnitFinalizeMovement(GetUnit(gActionData.subjectIndex));

    Make6CKOIDO(
        target,
        GetSomeFacingDirection(gActionData.xOther, gActionData.yOther, target->xPos, target->yPos),
        2,
        proc
    );

    UnitDrop(
        GetUnit(gActionData.subjectIndex),
        gActionData.xOther,
        gActionData.yOther
    );

    child = Proc_StartBlocking(gUnknown_0859DA6C, proc);
    ((struct UnknownBMMindProc*)(child))->unk_54 = target;

    return 0;
}

// TODO: Fake match - register allocation prefers r5 without the register keyword
s8 ActionVisitAndSieze(ProcPtr proc) {
    register int x asm("r4");
    int y;

    x = GetUnit(gActionData.subjectIndex)->xPos;
    y = GetUnit(gActionData.subjectIndex)->yPos;

    sub_80840C4(x, y);

    return 0;
}

s8 ActionCombat(ProcPtr proc) {
    struct Unit* target = GetUnit(gActionData.targetIndex);

    int itemIdx = GetItemIndex(
        GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
    );

    gBattleActor.hasItemEffectTarget = 0;

    if (itemIdx == ITEM_NIGHTMARE) {
        int i, targetCount;

        MakeTargetListForFuckingNightmare(GetUnit(gActionData.subjectIndex));
        targetCount = sub_804FD28();

        for (i = 0; i < targetCount; i++) {
            SetUnitStatus(
                GetUnit(GetTarget(i)->uid),
                UNIT_STATUS_SLEEP
            );
        }
    }

    if (target == 0) {
        InitObstacleBattleUnit();
    }

    if (gActionData.itemSlotIndex == 8) {
        BattleGenerateBallistaReal(GetUnit(gActionData.subjectIndex), target);
    } else {
        BattleGenerateReal(GetUnit(gActionData.subjectIndex), target);
    }

    Proc_StartBlocking(gUnknown_0859DABC, proc);

    return 0;
}

s8 ActionArena(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_0859DB24, proc);
    return 0;
}

s8 ActionDance(ProcPtr proc) {
    GetUnit(gActionData.targetIndex)->state &= ~( US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI );

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex), -1);
    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    gBattleStats.config = 0x40;

    BattleApplyMiscAction(proc);
    BeginBattleAnimations();

    return 0;
}

s8 ActionTalk(ProcPtr proc) {
    sub_8083FB0(
        GetUnit(gActionData.subjectIndex)->pCharacterData->number,
        GetUnit(gActionData.targetIndex)->pCharacterData->number
    );

    return 0;
}

s8 ActionSupport(ProcPtr proc) {
    int subjectExp, targetExp;

    struct Unit* target = GetUnit(gActionData.targetIndex);

    int targetSupportNum = GetUnitSupporterNum(gActiveUnit, target->pCharacterData->number);
    int subjectSupportNum = GetUnitSupporterNum(target, gActiveUnit->pCharacterData->number);

    CanUnitSupportNow(target, subjectSupportNum);

    UnitGainSupportLevel(gActiveUnit, targetSupportNum);
    UnitGainSupportLevel(target, subjectSupportNum);

    sub_808371C(
        gActiveUnit->pCharacterData->number,
        target->pCharacterData->number,
        GetUnitSupportLevel(gActiveUnit, targetSupportNum)
    );

    subjectExp = gActiveUnit->supports[targetSupportNum];
    targetExp = target->supports[subjectSupportNum];

    if (subjectExp != targetExp) {
        if (subjectExp > targetExp) {
            target->supports[subjectSupportNum] = subjectExp;
        }

        if (subjectExp < targetExp) { 
            gActiveUnit->supports[targetSupportNum] = targetExp;
        }
    }

    return 0;
}

s8 ActionSteal(ProcPtr proc) {
    int itemIdx;
    struct Unit* target = GetUnit(gActionData.targetIndex);

    if ((target->state & US_DROP_ITEM)) {
        if (gActionData.itemSlotIndex == (GetUnitItemCount(target) - 1)) {
            target->state &= ~US_DROP_ITEM;
        }
    }

    itemIdx = GetUnit(gActionData.targetIndex)->items[gActionData.itemSlotIndex];

    UnitRemoveItem(GetUnit(gActionData.targetIndex), gActionData.itemSlotIndex);

    switch (0xFF & itemIdx) {
        case ITEM_1G:
        case ITEM_5G:
        case ITEM_10G:
        case ITEM_50G:
        case ITEM_100G:
        case ITEM_150G:
        case ITEM_200G:
        case ITEM_3000G:
        case ITEM_5000G:
            SetPartyGoldAmount(GetPartyGoldAmount() + GetItemCost(itemIdx));
            break;
        default:
            UnitAddItem(GetUnit(gActionData.subjectIndex), itemIdx);
            break;
    }

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex), -1);
    gBattleTarget.terrainId = TERRAIN_PLAINS;
    InitBattleUnit(&gBattleTarget, GetUnit(gActionData.targetIndex));
    gBattleTarget.weapon = itemIdx;
    BattleApplyMiscAction(proc);

    MU_EndAll();
    BeginMapAnimForSteal();

    return 0;
}

s8 ActionSummon(ProcPtr proc) {
    InitBattleUnit(&gBattleActor, gActiveUnit);

    BattleApplyMiscAction(proc);
    MU_EndAll();
    BeginMapAnimForSummon();

    return 0;
}

s8 ActionSummonDK(ProcPtr proc) {
    InitBattleUnit(&gBattleActor, gActiveUnit);

    BattleApplyMiscAction(proc);
    MU_EndAll();
    BeginMapAnimForSummonDK();

    return 0;
}