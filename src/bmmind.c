#include "global.h"

#include "proc.h"
#include "rng.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "mu.h"
#include "uiselecttarget.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmusemind.h"
#include "bmtrap.h"
#include "bmarch.h"
#include "bmtarget.h"
#include "bmmind.h"

#include "constants/items.h"
#include "constants/terrains.h"

struct UnknownBMMindProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29[0x54-0x29];

    /* 54 */ struct Unit* unk_54;
};

struct UnknownBMMindProc_2 {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29[0x54-0x29];

    /* 54 */ struct MUProc* unk_54;
    /* 58 */ u8 unk_58[0x64-0x58];

    /* 64 */ s16 unitIdA;
    /* 66 */ s16 unitIdB;
};

struct DeathDropAnimProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;
    /* 30 */ int xDrop, yDrop;
    /* 38 */ short xFrom, yFrom;
    /* 3C */ short xTo, yTo;
    /* 40 */ short yOffset;
    /* 42 */ short ySpeed;
    /* 44 */ short yAccel;
    /* 46 */ short clock;
    /* 48 */ short clockEnd;
};

static int AfterDrop_CheckTrapAfterDropMaybe(struct UnknownBMMindProc* proc);
static int sub_80321C8(void);

struct ProcCmd CONST_DATA sProcScr_AfterDropAction[] = {
    PROC_SLEEP(0),
    PROC_WHILE(MU_IsAnyActive),
    PROC_CALL_2(AfterDrop_CheckTrapAfterDropMaybe),
    PROC_CALL(sub_80321C8),

    PROC_END,
};

static void sub_80325AC(struct DeathDropAnimProc* proc);
static void sub_8032658(struct DeathDropAnimProc* proc);
static void sub_8032664(void);

struct ProcCmd CONST_DATA sProcScr_DeathDropAnim[] = {
    PROC_REPEAT(sub_80325AC),
    PROC_CALL(sub_8032658),
    PROC_SLEEP(0),
    PROC_CALL(sub_8032664),

    PROC_END,
};

static void BATTLE_PostCombatDeathFades(ProcPtr proc);
static bool8 BATTLE_HandleItemDrop(ProcPtr proc);
static void BATTLE_HandleCombatDeaths(ProcPtr proc);

struct ProcCmd CONST_DATA sProcScr_CombatAction[] = {
    PROC_CALL(BeginBattleAnimations),
    PROC_SLEEP(1),
    PROC_CALL(BattleApplyGameStateUpdates),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(BATTLE_GOTO1_IfNobodyIsDead),
    PROC_CALL(BATTLE_PostCombatDeathFades),
    PROC_SLEEP(0x20),
    PROC_CALL(BATTLE_DeleteLinkedMOVEUNIT),

PROC_LABEL(1),
    PROC_CALL_2(BATTLE_HandleItemDrop),
    PROC_CALL(BATTLE_HandleCombatDeaths),
    PROC_SLEEP(0),

    PROC_END,
};

static void sub_8032974(ProcPtr proc);
static void BATTLE_HandleArenaDeathsMaybe(ProcPtr proc);

struct ProcCmd CONST_DATA sProcScr_ArenaAction[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_8032974),
    PROC_CALL(BATTLE_PostCombatDeathFades),
    PROC_SLEEP(0x20),
    PROC_CALL(BATTLE_DeleteLinkedMOVEUNIT),

PROC_LABEL(1),
    PROC_CALL(BATTLE_HandleArenaDeathsMaybe),
    PROC_SLEEP(0),

    PROC_END,
};


// koido.s
void Make6CKOIDO(struct Unit*, int, u8, ProcPtr);
int GetSomeFacingDirection(int, int, int, int);

// ev_triggercheck.s
void sub_808371C(u8, u8, int);
void sub_8083FB0(u8, u8);
void sub_80840C4(int, int);

// code_mapanim.s
void BeginMapAnimForSteal(void);
void BeginMapAnimForSummon(void);
void BeginMapAnimForSummonDK(void);

// bmudisp.s
void SMS_RegisterUsage(int);
void sub_8027B60(int, int, int, struct Unit*);

// code.s
void BWL_AddWinOrLossIdk(u8, u8, int);

// bm.s
int GetCurrentMapMusicIndex(void);

// popup.s
void NewGeneralItemGot(struct Unit*, int, ProcPtr);

s8 ActionRescue(ProcPtr);
s8 ActionDrop(ProcPtr);
s8 ActionVisitAndSeize(ProcPtr);
s8 ActionCombat(ProcPtr);
s8 ActionDance(ProcPtr);
s8 ActionTalk(ProcPtr);
s8 ActionSupport(ProcPtr);
s8 ActionSteal(ProcPtr);
s8 ActionSummon(ProcPtr);
s8 ActionSummonDK(ProcPtr);
s8 ActionArena(ProcPtr);

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

    if (gActionData.unitActionType == UNIT_ACTION_COMBAT) {
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
            return ActionVisitAndSeize(proc);
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

int AfterDrop_CheckTrapAfterDropMaybe(struct UnknownBMMindProc* proc) {
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

    child = Proc_StartBlocking(sProcScr_AfterDropAction, proc);
    ((struct UnknownBMMindProc*)(child))->unk_54 = target;

    return 0;
}

// TODO: Fake match - register allocation prefers r5 without the register keyword
s8 ActionVisitAndSeize(ProcPtr proc) {
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
        targetCount = GetSelectTargetCount();

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

    Proc_StartBlocking(sProcScr_CombatAction, proc);

    return 0;
}

s8 ActionArena(ProcPtr proc) {
    Proc_StartBlocking(sProcScr_ArenaAction, proc);
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

void sub_80325AC(struct DeathDropAnimProc* proc) {
    int x = sub_8012DCC(0, proc->xFrom, proc->xTo, proc->clock, proc->clockEnd);
    int y = sub_8012DCC(0, proc->yFrom, proc->yTo, proc->clock, proc->clockEnd);

    y += proc->yOffset;

    proc->yOffset += proc->ySpeed;
    proc->ySpeed += proc->yAccel;

    sub_8027B60(
        7,
        x - gUnknown_0202BCB0.camera.x,
        y - gUnknown_0202BCB0.camera.y,
        proc->unit
    );

    ++proc->clock;

    if (proc->clock == proc->clockEnd) {
        Proc_Break(proc);
    }

    return;
}

void sub_8032658(struct DeathDropAnimProc* proc) {
    sub_8037830(proc, proc->unit);
    return;
}

void sub_8032664() {
    RefreshEntityBmMaps();
    SMS_UpdateFromGameData();

    return;
}

void DropRescueOnDeath(ProcPtr proc, struct Unit* unit) {
    struct DeathDropAnimProc* child;

    if (GetUnitCurrentHp(unit) != 0) {
        return;
    }

    if (!(unit->state & US_RESCUING)) {
        return;
    }

    child = Proc_StartBlocking(sProcScr_DeathDropAnim, proc);

    child->unit = GetUnit(unit->rescueOtherUnit);

    UnitGetDeathDropLocation(unit, &child->xDrop, &child->yDrop);
    UnitDrop(unit, child->xDrop, child->yDrop);

    child->xFrom = unit->xPos * 16;
    child->yFrom = unit->yPos * 16;
    child->xTo = child->xDrop * 16;
    child->yTo = child->yDrop * 16;
    child->yOffset = 0;
    child->ySpeed = -5;
    child->yAccel = 1;
    child->clock = 0;
    child->clockEnd = 11;

    SMS_RegisterUsage(GetUnitSMSId(child->unit));
    SMS_FlushIndirect();

    PlaySoundEffect(0xAC);
    return;
}

void KillUnitOnCombatDeath(struct Unit* unitA, struct Unit* unitB) {
    if (GetUnitCurrentHp(unitA) != 0) {
        return;
    }

    BWL_AddWinOrLossIdk(unitA->pCharacterData->number, unitB->pCharacterData->number, 2);

    UnitKill(unitA);

    return;
}

void KillUnitOnArenaDeathMaybe(struct Unit* unit) {
    if (GetUnitCurrentHp(unit) != 0) {
        return;
    }

    UnitKill(unit);

    BWL_AddWinOrLossIdk(unit->pCharacterData->number, 0, 6);

    return;
}

void BATTLE_GOTO1_IfNobodyIsDead(ProcPtr proc) {
    if ((gBattleStats.config & 0x80) == 0) {
        if (gBattleActor.unit.curHP == 0) {
            return;
        }

        if (gBattleTarget.unit.curHP == 0) {
            return;
        }
    }

    Proc_Goto(proc, 1);

    return;
}

bool8 DidUnitDie(struct Unit* unit) {
    if (GetUnitCurrentHp(unit) != 0) {
        return 0;
    } else {
        return 1;
    }
}

void BATTLE_PostCombatDeathFades(ProcPtr proc) {
    struct MUProc* muProc;

    ((struct UnknownBMMindProc_2*)(proc))->unk_54 = 0;

    if (DidUnitDie(&gBattleActor.unit)) {
        muProc = Proc_Find(gProcScr_MoveUnit);
        MU_StartDeathFade(muProc);
        ((struct UnknownBMMindProc_2*)(proc))->unk_54 = muProc;

        TryRemoveUnitFromBallista(&gBattleActor.unit);
    }

    if (DidUnitDie(&gBattleTarget.unit)) {
        struct Unit* target = GetUnit(gBattleTarget.unit.index);
        target->state |= US_HIDDEN;

        TryRemoveUnitFromBallista(target);

        SMS_UpdateFromGameData();
        muProc = MU_Create(&gBattleTarget.unit);

        gWorkingMovementScript[0] = GetFacingDirection(gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
        gWorkingMovementScript[1] = 4;

        MU_StartMoveScript(muProc, gWorkingMovementScript);
        MU_StartDeathFade(muProc);

        ((struct UnknownBMMindProc_2*)(proc))->unk_54 = muProc;
    }

    return;
}

void BATTLE_DeleteLinkedMOVEUNIT(ProcPtr proc) {
    MU_End(((struct UnknownBMMindProc_2*)(proc))->unk_54);
    return;
}

void BATTLE_HandleCombatDeaths(ProcPtr proc) {
    struct Unit* unitA = GetUnit(((struct UnknownBMMindProc_2*)(proc))->unitIdA);
    struct Unit* unitB = GetUnit(((struct UnknownBMMindProc_2*)(proc))->unitIdB);

    DropRescueOnDeath(proc, unitA);
    DropRescueOnDeath(proc, unitB);

    KillUnitOnCombatDeath(unitA, unitB);
    KillUnitOnCombatDeath(unitB, unitA);

    return;
}

void sub_80328B0() {
    int bgmIdx = GetCurrentMapMusicIndex();

    if (Sound_GetCurrentSong() != bgmIdx) {
        Sound_PlaySong80024E4(bgmIdx, 6, NULL);
    }

    return;
}

bool8 BATTLE_HandleItemDrop(ProcPtr proc) {
    struct Unit* unitA = NULL;
    struct Unit* unitB;

    ((struct UnknownBMMindProc_2*)(proc))->unitIdA = gBattleActor.unit.index;
    ((struct UnknownBMMindProc_2*)(proc))->unitIdB = gBattleTarget.unit.index;

    if (gBattleActor.unit.curHP == 0) {
        unitA = GetUnit(gBattleActor.unit.index);
        unitB = GetUnit(gBattleTarget.unit.index);
    }

    if (gBattleTarget.unit.curHP == 0) {
        unitA = GetUnit(gBattleTarget.unit.index);
        unitB = GetUnit(gBattleActor.unit.index);
    }

    if (unitA == NULL) {
        return 1;
    }

    if (!(unitA->state & US_DROP_ITEM)) {
        return 1;
    }

    if (unitA->items[0] == 0) {
        return 1;
    }

    if ((UNIT_FACTION(unitB)) != 0) {
        return 1;
    }

    NewGeneralItemGot(
        unitB,
        GetUnitLastItem(unitA),
        proc
    );

    return 0;
}

void sub_8032974(ProcPtr proc) {
    gBattleTarget.unit.maxHP = 1;
    gBattleTarget.unit.curHP = 1;

    if (gBattleActor.unit.curHP != 0) {
        Proc_Goto(proc, 1);
    }

    return;
}

void BATTLE_HandleArenaDeathsMaybe(ProcPtr proc) {
    KillUnitOnArenaDeathMaybe(gActiveUnit);
    DropRescueOnDeath(proc, gActiveUnit);

    return;
}

#if NONMATCHING

??? sub_80329C0(u8 r0) {
    CpuFastFill(r0, gUnknown_0203A974, 7);

    return gUnknown_0203A974;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80329C0(u8 r0) {
    asm("\n\
        .syntax unified\n\
        push {r4, lr}\n\
        ldr r4, _080329D4  @ gUnknown_0203A974\n\
        adds r1, r4, #0\n\
        movs r2, #7\n\
        bl CpuFastSet\n\
        adds r0, r4, #0\n\
        pop {r4}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080329D4: .4byte gUnknown_0203A974\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING
