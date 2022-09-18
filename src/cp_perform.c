#include "global.h"

#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "hardware.h"
#include "bmtrap.h"
#include "playerphase.h"
#include "popup.h"

#include "constants/terrains.h"

struct UnkProcA {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 pad_2A;
    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    u8 _pad1[0x58-0x34];
    /* 58 */ int unk_58;
    u8 _pad2[0x64-0x5C];
    /* 64 */ s16 unk_64;
};

struct CpPerformProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ s8(*func)(struct CpPerformProc* proc);
    /* 30 */ u8 unk_30;
    /* 31 */ u8 isUnitVisible;
};

void sub_8039E88(struct UnkProcA* proc);

struct ProcCmd CONST_DATA gUnknown_085A8004[] = {
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),
    PROC_REPEAT(sub_8039E88),

    PROC_END,
};

void sub_8039EF4(void);
void sub_8039F0C(struct CpPerformProc* proc);
void sub_8039FAC(struct CpPerformProc* proc);
void sub_803A3C8(struct CpPerformProc* proc);
void PrepareAIAction(struct CpPerformProc* proc);
void sub_803A5F8(struct CpPerformProc* proc);
void sub_803A63C(struct CpPerformProc* proc);
void sub_803A6D0(struct CpPerformProc* proc);

struct ProcCmd CONST_DATA gProcScr_CpPerform[] = {
    PROC_NAME("E_CPPERFORM"),

    PROC_CALL(sub_8039EF4),
    PROC_CALL(sub_8039F0C),
    PROC_SLEEP(0),

    PROC_CALL(sub_8039FAC),
    PROC_WHILE(MU_IsAnyActive),

    PROC_CALL(sub_803A3C8),
    PROC_SLEEP(0),

    PROC_CALL(PrepareAIAction),
    PROC_REPEAT(sub_803A5F8),

    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),

    PROC_CALL(sub_803A63C),
    PROC_CALL(sub_803A6D0),

PROC_LABEL(1),
    PROC_END,
};

s8 sub_803A674(struct CpPerformProc*);
s8 sub_803A678(struct CpPerformProc*);
s8 sub_803A69C(struct CpPerformProc*);


void sub_8039E88(struct UnkProcA* proc) {

    DisplayCursor(proc->unk_2C, proc->unk_30, proc->unk_58);

    if ((gKeyStatusPtr->heldKeys & (A_BUTTON | START_BUTTON)) || (proc->unk_64 > 45)) {
        Proc_Break(proc);
    }

    proc->unk_64++;

    return;
}

void sub_8039ECC(int x, int y, int kind, ProcPtr parent) {
    struct UnkProcA* proc;

    proc = Proc_StartBlocking(gUnknown_085A8004, parent);

    proc->unk_2C = x;
    proc->unk_30 = y;
    proc->unk_58 = kind;
    proc->unk_64 = 0;

    return;
}

void sub_8039EF4() {
    if (!Proc_Find(gMusicProc3Script)) {
        sub_80160D0();
    }

    return;
}

void sub_8039F0C(struct CpPerformProc* proc) {
    proc->isUnitVisible = 1;

    if ((gRAMChapterData.chapterVisionRange != 0) && (gRAMChapterData.chapterPhaseIndex == FACTION_RED)) {
        if ((gBmMapFog[gActiveUnit->yPos][gActiveUnit->xPos] != 0) || (gBmMapFog[gAiDecision.yMove][gAiDecision.xMove] != 0)) {
            EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
        } else {
            proc->isUnitVisible = 0;

            if (gAiDecision.actionId == AI_ACTION_PILLAGE) {
                EnsureCameraOntoPosition(proc, gAiDecision.xMove, gAiDecision.yMove);
            }
        }
    } else {
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    }

    return;
}

void sub_8039FAC(struct CpPerformProc* proc) {

    UnitBeginAction(gActiveUnit);

    HideUnitSMS(gActiveUnit);

    GenerateUnitMovementMap(gActiveUnit);
    SetWorkingBmMap(gBmMapMovement);

    GenerateBestMovementScript(gAiDecision.xMove, gAiDecision.yMove, gWorkingMovementScript);

    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);

    gAiDecision.xMove = gActionData.xMove;
    gAiDecision.yMove = gActionData.yMove;

    if (proc->isUnitVisible) {
        MU_Create(gActiveUnit);
        MU_SetDefaultFacing_Auto();
        MU_StartMoveScript_Auto(gWorkingMovementScript);
    }

    return;
}

void sub_803A024() {
    gActiveUnit = GetUnit(gActionData.subjectIndex);

    SetCursorMapPosition(gAiDecision.xMove, gAiDecision.yMove);
    RenderBmMapOnBg2();

    MoveActiveUnit(gAiDecision.xMove, gAiDecision.yMove);

    RefreshEntityBmMaps();
    RenderBmMap();

    NewBMXFADE(1);

    MU_EndAll();
    RefreshEntityBmMaps();

    ShowUnitSMS(gActiveUnit);
    SMS_UpdateFromGameData();

    return;
}

void ApplyAICombat2(struct CpPerformProc* proc) {

    gActionData.subjectIndex = gActiveUnitId;
    gActionData.unitActionType = UNIT_ACTION_COMBAT;
    gActionData.targetIndex = gAiDecision.targetId;

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    if (gAiDecision.targetId == 0) {
        struct Trap* trap = GetTrapAt(gAiDecision.xTarget, gAiDecision.yTarget);
        gActionData.xOther = gAiDecision.xTarget;
        gActionData.yOther = gAiDecision.yTarget;
        gActionData.trapType = trap->extra;
    }

    if ((s8)gAiDecision.itemSlot != -1) {
        EquipUnitItemSlot(gActiveUnit, gAiDecision.itemSlot);
        gActionData.itemSlotIndex = 0;
    } else {
        gActionData.itemSlotIndex = 8;
    }

    ApplyUnitAction(proc);

    return;
}

void sub_803A0F4(struct CpPerformProc* proc) {
    u8 scripts[4][3] = {
        { MU_COMMAND_MOVE_LEFT,  MU_COMMAND_MOVE_LEFT,  MU_COMMAND_HALT },
        { MU_COMMAND_MOVE_RIGHT, MU_COMMAND_MOVE_RIGHT, MU_COMMAND_HALT },
        { MU_COMMAND_MOVE_DOWN,  MU_COMMAND_MOVE_DOWN,  MU_COMMAND_HALT },
        { MU_COMMAND_MOVE_UP,    MU_COMMAND_MOVE_UP,    MU_COMMAND_HALT },
    };

    if ((gAiDecision.xTarget != 5) && (proc->isUnitVisible)) {
        MU_StartMoveScript_Auto(scripts[gAiDecision.xTarget]);
    }

    return;
}

void sub_803A134(struct CpPerformProc* proc) {
    struct Unit* unit = GetUnit(gAiDecision.targetId);

    u16 item = unit->items[gAiDecision.itemSlot];

    UnitAddItem(gActiveUnit, item);
    UnitRemoveItem(unit, gAiDecision.itemSlot);

    sub_8011694(item, proc);

    return;
}

// TODO: Popup macros
struct PopupInstruction CONST_DATA gUnknown_085A80A4[] = {
    { POPUP_SOUND, 0x5C },
    { POPUP_MSG,   0x12 },
    { POPUP_END,   0x00 }
};

s8 sub_803A17C(struct CpPerformProc* proc) {

    int x = gAiDecision.xMove;
    register int y asm("r4") = gAiDecision.yMove;

    if (gBmMapTerrain[y][x] == TERRAIN_CHEST_21) {
        gActiveUnit->xPos = gAiDecision.xMove;
        gActiveUnit->yPos = gAiDecision.yMove;

        gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
        gActionData.itemSlotIndex = gAiDecision.itemSlot;

        ActionStaffDoorChestUseItem(proc);
    } else {
        s8 y2 = y - 1;
        sub_80840C4((s8)x, (s8)(y2));

        PlaySoundEffect(0xAB);

        NewPopupSimple(gUnknown_085A80A4, 0x60, 0, proc);
    }

    return 1;
}

s8 sub_803A204(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionData.unitActionType = UNIT_ACTION_STAFF;

    gActionData.targetIndex = gAiDecision.targetId;
    gActionData.itemSlotIndex = gAiDecision.itemSlot;

    ActionStaffDoorChestUseItem(proc);

    return 1;
}

s8 sub_803A23C(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
    gActionData.itemSlotIndex = gAiDecision.itemSlot;

    ActionStaffDoorChestUseItem(proc);

    return 1;
}

s8 sub_803A270(struct CpPerformProc* proc) {
    return 1;
}

s8 sub_803A274(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    if (gAiDecision.targetId == 0) {
        sub_8083FB0(
            GetUnit(gAiDecision.itemSlot)->pCharacterData->number,
            GetUnit(gAiDecision.xTarget)->pCharacterData->number
        );
    }

    return 1;
}

s8 sub_803A2B8(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    RideBallista(gActiveUnit);

    return 1;
}

s8 sub_803A2E0(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    TryRemoveUnitFromBallista(gActiveUnit);

    return 1;
}

s8 ApplyAICombat(struct CpPerformProc* proc) {
    gActionData.subjectIndex = gActiveUnitId;

    gActionData.unitActionType = UNIT_ACTION_COMBAT;

    gActionData.targetIndex = gAiDecision.targetId;

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    EquipUnitItemSlot(gActiveUnit, gAiDecision.itemSlot);

    gActionData.itemSlotIndex = 0;

    ApplyUnitAction(proc);

    return 1;
}

void ApplyAIDKSummonAction(struct CpPerformProc* proc) {

    gActionData.subjectIndex = gActiveUnitId;
    gActionData.unitActionType = UNIT_ACTION_SUMMON_DK;

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    ApplyUnitAction(proc);

    return;
}

s8 ApplyAIPickAction(struct CpPerformProc* proc) {

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionData.xOther = gAiDecision.xTarget;
    gActionData.yOther = gAiDecision.yTarget;

    gActionData.unitActionType = UNIT_ACTION_PICK;

    ApplyUnitAction(proc);

    return 1;
}

void sub_803A3C8(struct CpPerformProc* proc) {
    struct Unit* unit;

    int x = 0;
    int y = 0;

    if (gActionData.unitActionType == UNIT_ACTION_TRAPPED) {
        return;
    }

    switch (gAiDecision.actionId) {
        case AI_ACTION_NONE:
        case AI_ACTION_ESCAPE:
        case AI_ACTION_PILLAGE:
        case AI_ACTION_USEITEM:
        case AI_ACTION_RIDEBALLISTA:
        case AI_ACTION_EXITBALLISTA:
        case AI_ACTION_DKNIGHTMARE:
        case AI_ACTION_DKSUMMON:
        case AI_ACTION_PICK:

            return;

        case AI_ACTION_COMBAT:
            if (gAiDecision.targetId == 0) {
                x = gAiDecision.xTarget;
                y = gAiDecision.yTarget;
            } else {
                unit = GetUnit(gAiDecision.targetId);
                x = unit->xPos;
                y = unit->yPos;
            }

            if (((s8)gAiDecision.itemSlot == -1) && !(gActiveUnit->state & US_IN_BALLISTA)) {
                MU_EndAll();

                gActiveUnit->xPos = gAiDecision.xMove;
                gActiveUnit->yPos = gAiDecision.yMove;

                RideBallista(gActiveUnit);

                MU_Create(gActiveUnit);
                MU_SetDefaultFacing_Auto();
            }

            break;

        case AI_ACTION_STEAL:
            unit = GetUnit(gAiDecision.targetId);

            x = unit->xPos;
            y = unit->yPos;

            break;

        case AI_ACTION_REFRESH:
            unit = GetUnit(gAiDecision.targetId);

            x = unit->xPos;
            y = unit->yPos;

            break;

        case AI_ACTION_TALK:
            unit = GetUnit(gAiDecision.yTarget);

            x = unit->xPos;
            y = unit->yPos;

            break;

        case AI_ACTION_STAFF:
            if (gAiDecision.targetId == 0) {
                return;
            }

            unit = GetUnit(gAiDecision.targetId);

            x = unit->xPos;
            y = unit->yPos;

            break;
    }

    EnsureCameraOntoPosition(proc, x, y);
    sub_8039ECC(x * 16, y * 16, 2, proc);

    return;
}

void PrepareAIAction(struct CpPerformProc* proc) {
    proc->unk_30 = 0;

    if (gActionData.unitActionType == UNIT_ACTION_TRAPPED) {
        proc->func = sub_803A674;

        return;
    }

    switch (gAiDecision.actionId) {
        case AI_ACTION_NONE:
            proc->func = sub_803A674;

            break;

        case AI_ACTION_COMBAT:
            proc->func = sub_803A674;
            ApplyAICombat2(proc);

            break;

        case AI_ACTION_ESCAPE:
            sub_803A0F4(proc);
            proc->func = sub_803A678;

            break;

        case AI_ACTION_STEAL:
            sub_803A134(proc);
            proc->func = sub_803A69C;

            break;

        case AI_ACTION_PILLAGE:
            proc->func = sub_803A17C;

            break;

        case AI_ACTION_STAFF:
            proc->func = sub_803A204;

            break;

        case AI_ACTION_USEITEM:
            proc->func = sub_803A23C;

            break;

        case AI_ACTION_REFRESH:
            proc->func = sub_803A270;

            break;

        case AI_ACTION_TALK:
            proc->func = sub_803A274;

            break;

        case AI_ACTION_RIDEBALLISTA:
            proc->func = sub_803A2B8;

            break;

        case AI_ACTION_EXITBALLISTA:
            proc->func = sub_803A2E0;

            break;

        case AI_ACTION_DKNIGHTMARE:
            proc->func = sub_803A674;
            ApplyAICombat(proc);

            break;

        case AI_ACTION_DKSUMMON:
            proc->func = sub_803A674;
            ApplyAIDKSummonAction(proc);

            break;

        case AI_ACTION_PICK:
            proc->func = ApplyAIPickAction;

            break;
    }

    return;
}

void sub_803A5F8(struct CpPerformProc* proc) {
    proc->unk_30++;

    if (proc->func(proc) == 1) {
        Proc_Break(proc);
    }

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    return;
}

void sub_803A63C(struct CpPerformProc* proc) {
    UpdateAllPhaseHealingAIStatus();
    sub_803A024();

    if (!(gActiveUnit->pCharacterData) || (gActiveUnit->state & (US_HIDDEN | US_DEAD | US_BIT16))) {
        Proc_Goto(proc, 1);
    }

    return;
}

s8 sub_803A674(struct CpPerformProc* proc) {
    return 1;
}

s8 sub_803A678(struct CpPerformProc* proc) {
    if (!MU_IsAnyActive()) {
        gActiveUnit->pCharacterData = NULL;
        return 1;
    }

    return 0;
}

s8 sub_803A69C(struct CpPerformProc* proc) {

    if (proc->unk_30 > 4) {
        BG_Fill(gBG0TilemapBuffer, 0);
        BG_Fill(gBG1TilemapBuffer, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        return 1;
    }

    return 0;
}

void sub_803A6D0(struct CpPerformProc* proc) {
    u16 a[6];
    u16 b;
    u16 c;
    u16 d;

    if ((sub_803E900() != 0) && (sub_803E93C(a) != 0)) {
        sub_803EA58(gAiDecision.xMove, gAiDecision.yMove, &b, &c, &d);
        sub_803EBF0(b, c, d, a);
    }
    return;
}
