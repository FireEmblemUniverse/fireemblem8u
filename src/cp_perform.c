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
#include "bmudisp.h"
#include "bm.h"
#include "bmbattle.h"
#include "eventinfo.h"

#include "cp_perform.h"

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

void AiTargetCursor_Main(struct UnkProcA* proc);

struct ProcCmd CONST_DATA gProcScr_AiTargetCursor[] = {
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(gProcScr_CamMove),
    PROC_REPEAT(AiTargetCursor_Main),

    PROC_END,
};

void CpPerform_UpdateMapMusic(void);
void CpPerform_MoveCameraOntoUnit(struct CpPerformProc* proc);
void CpPerform_BeginUnitMovement(struct CpPerformProc* proc);
void CpPerform_MoveCameraOntoTarget(struct CpPerformProc* proc);
void CpPerform_PerformAction(struct CpPerformProc* proc);
void CpPerform_WaitAction(struct CpPerformProc* proc);
void CpPerform_Cleanup(struct CpPerformProc* proc);
void CpPerform_EquipBest(struct CpPerformProc* proc);

struct ProcCmd CONST_DATA gProcScr_CpPerform[] = {
    PROC_NAME("E_CPPERFORM"),

    PROC_CALL(CpPerform_UpdateMapMusic),
    PROC_CALL(CpPerform_MoveCameraOntoUnit),
    PROC_SLEEP(0),

    PROC_CALL(CpPerform_BeginUnitMovement),
    PROC_WHILE(MuExistsActive),

    PROC_CALL(CpPerform_MoveCameraOntoTarget),
    PROC_SLEEP(0),

    PROC_CALL(CpPerform_PerformAction),
    PROC_REPEAT(CpPerform_WaitAction),

    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),

    PROC_CALL(CpPerform_Cleanup),
    PROC_CALL(CpPerform_EquipBest),

PROC_LABEL(1),
    PROC_END,
};

s8 AiDummyAction(struct CpPerformProc*);
s8 AiEscapeAction(struct CpPerformProc*);
s8 AiWaitAndClearScreenAction(struct CpPerformProc*);


void AiTargetCursor_Main(struct UnkProcA* proc) {

    PutMapCursor(proc->unk_2C, proc->unk_30, proc->unk_58);

    if ((gKeyStatusPtr->heldKeys & (A_BUTTON | START_BUTTON)) || (proc->unk_64 > 45)) {
        Proc_Break(proc);
    }

    proc->unk_64++;

    return;
}

void StartAiTargetCursor(int x, int y, int kind, ProcPtr parent) {
    struct UnkProcA* proc;

    proc = Proc_StartBlocking(gProcScr_AiTargetCursor, parent);

    proc->unk_2C = x;
    proc->unk_30 = y;
    proc->unk_58 = kind;
    proc->unk_64 = 0;

    return;
}

void CpPerform_UpdateMapMusic() {
    if (!Proc_Find(gMusicProc3Script)) {
        StartMapSongBgm();
    }

    return;
}

void CpPerform_MoveCameraOntoUnit(struct CpPerformProc* proc) {
    proc->isUnitVisible = 1;

    if ((gPlaySt.chapterVisionRange != 0) && (gPlaySt.faction == FACTION_RED)) {
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

void CpPerform_BeginUnitMovement(struct CpPerformProc* proc) {

    UnitBeginAction(gActiveUnit);

    HideUnitSprite(gActiveUnit);

    GenerateUnitMovementMap(gActiveUnit);
    SetWorkingBmMap(gBmMapMovement);

    GenerateBestMovementScript(gAiDecision.xMove, gAiDecision.yMove, gWorkingMovementScript);

    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);

    gAiDecision.xMove = gActionData.xMove;
    gAiDecision.yMove = gActionData.yMove;

    if (proc->isUnitVisible) {
        StartMu(gActiveUnit);
        SetAutoMuDefaultFacing();
        SetAutoMuMoveScript(gWorkingMovementScript);
    }

    return;
}

void AiRefreshMap() {
    gActiveUnit = GetUnit(gActionData.subjectIndex);

    SetCursorMapPosition(gAiDecision.xMove, gAiDecision.yMove);
    RenderBmMapOnBg2();

    MoveActiveUnit(gAiDecision.xMove, gAiDecision.yMove);

    RefreshEntityBmMaps();
    RenderBmMap();

    NewBMXFADE(1);

    MU_EndAll();
    RefreshEntityBmMaps();

    ShowUnitSprite(gActiveUnit);
    RefreshUnitSprites();

    return;
}

void AiStartCombatAction(struct CpPerformProc* proc) {

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

    if ((s8)gAiDecision.itemSlot != BU_ISLOT_AUTO) {
        EquipUnitItemSlot(gActiveUnit, gAiDecision.itemSlot);
        gActionData.itemSlotIndex = 0;
    } else {
        gActionData.itemSlotIndex = BU_ISLOT_BALLISTA;
    }

    ApplyUnitAction(proc);

    return;
}

void AiStartEscapeAction(struct CpPerformProc* proc) {
    u8 scripts[4][3] = {
        { MOVE_CMD_MOVE_LEFT,  MOVE_CMD_MOVE_LEFT,  MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_RIGHT, MOVE_CMD_MOVE_RIGHT, MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_DOWN,  MOVE_CMD_MOVE_DOWN,  MOVE_CMD_HALT },
        { MOVE_CMD_MOVE_UP,    MOVE_CMD_MOVE_UP,    MOVE_CMD_HALT },
    };

    if ((gAiDecision.xTarget != 5) && (proc->isUnitVisible)) {
        SetAutoMuMoveScript(scripts[gAiDecision.xTarget]);
    }

    return;
}

void AiStartStealAction(struct CpPerformProc* proc) {
    struct Unit* unit = GetUnit(gAiDecision.targetId);

    u16 item = unit->items[gAiDecision.itemSlot];

    UnitAddItem(gActiveUnit, item);
    UnitRemoveItem(unit, gAiDecision.itemSlot);

    NewPopup_ItemStealing(item, proc);

    return;
}

struct PopupInstruction CONST_DATA PopupScr_085A80A4[] = {
    POPUP_SOUND(0x5C),
    POPUP_MSG(0x12), // TODO: msgid "The village was destroyed."
    POPUP_END
};

s8 AiPillageAction(struct CpPerformProc* proc) {

    int x = gAiDecision.xMove;
    int y = gAiDecision.yMove;

    if (gBmMapTerrain[y][x] == TERRAIN_CHEST_21) {
        gActiveUnit->xPos = gAiDecision.xMove;
        gActiveUnit->yPos = gAiDecision.yMove;

        gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
        gAiDecision.itemSlot = gAiDecision.itemSlot; // dummy
        gActionData.itemSlotIndex = gAiDecision.itemSlot;

        ActionStaffDoorChestUseItem(proc);
    } else {
        s8 y2 = y - 1;
        StartAvailableTileEvent((s8)x, y2);

        PlaySoundEffect(0xAB);

        NewPopup_Simple(PopupScr_085A80A4, 0x60, 0, proc);
    }

    return 1;
}

s8 AiStaffAction(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionData.unitActionType = UNIT_ACTION_STAFF;

    gActionData.targetIndex = gAiDecision.targetId;
    gActionData.itemSlotIndex = gAiDecision.itemSlot;

    ActionStaffDoorChestUseItem(proc);

    return 1;
}

s8 AiUseItemAction(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
    gActionData.itemSlotIndex = gAiDecision.itemSlot;

    ActionStaffDoorChestUseItem(proc);

    return 1;
}

s8 AiRefreshAction(struct CpPerformProc* proc) {
    return 1;
}

s8 AiTalkAction(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    if (gAiDecision.targetId == 0) {
        StartCharacterEvent(
            GetUnit(gAiDecision.itemSlot)->pCharacterData->number,
            GetUnit(gAiDecision.xTarget)->pCharacterData->number
        );
    }

    return 1;
}

s8 AiRideBallistaAction(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    RideBallista(gActiveUnit);

    return 1;
}

s8 AiExitBallistaAction(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    TryRemoveUnitFromBallista(gActiveUnit);

    return 1;
}

s8 AiDKNightmareAction(struct CpPerformProc* proc) {
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

void AiDKSummonAction(struct CpPerformProc* proc) {

    gActionData.subjectIndex = gActiveUnitId;
    gActionData.unitActionType = UNIT_ACTION_SUMMON_DK;

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    ApplyUnitAction(proc);

    return;
}

s8 AiPickAction(struct CpPerformProc* proc) {

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    gActionData.xOther = gAiDecision.xTarget;
    gActionData.yOther = gAiDecision.yTarget;

    gActionData.unitActionType = UNIT_ACTION_PICK;

    ApplyUnitAction(proc);

    return 1;
}

void CpPerform_MoveCameraOntoTarget(struct CpPerformProc* proc) {
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

                StartMu(gActiveUnit);
                SetAutoMuDefaultFacing();
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
    StartAiTargetCursor(x * 16, y * 16, 2, proc);

    return;
}

void CpPerform_PerformAction(struct CpPerformProc* proc) {
    proc->unk_30 = 0;

    if (gActionData.unitActionType == UNIT_ACTION_TRAPPED) {
        proc->func = AiDummyAction;

        return;
    }

    switch (gAiDecision.actionId) {
        case AI_ACTION_NONE:
            proc->func = AiDummyAction;

            break;

        case AI_ACTION_COMBAT:
            proc->func = AiDummyAction;
            AiStartCombatAction(proc);

            break;

        case AI_ACTION_ESCAPE:
            AiStartEscapeAction(proc);
            proc->func = AiEscapeAction;

            break;

        case AI_ACTION_STEAL:
            AiStartStealAction(proc);
            proc->func = AiWaitAndClearScreenAction;

            break;

        case AI_ACTION_PILLAGE:
            proc->func = AiPillageAction;

            break;

        case AI_ACTION_STAFF:
            proc->func = AiStaffAction;

            break;

        case AI_ACTION_USEITEM:
            proc->func = AiUseItemAction;

            break;

        case AI_ACTION_REFRESH:
            proc->func = AiRefreshAction;

            break;

        case AI_ACTION_TALK:
            proc->func = AiTalkAction;

            break;

        case AI_ACTION_RIDEBALLISTA:
            proc->func = AiRideBallistaAction;

            break;

        case AI_ACTION_EXITBALLISTA:
            proc->func = AiExitBallistaAction;

            break;

        case AI_ACTION_DKNIGHTMARE:
            proc->func = AiDummyAction;
            AiDKNightmareAction(proc);

            break;

        case AI_ACTION_DKSUMMON:
            proc->func = AiDummyAction;
            AiDKSummonAction(proc);

            break;

        case AI_ACTION_PICK:
            proc->func = AiPickAction;

            break;
    }

    return;
}

void CpPerform_WaitAction(struct CpPerformProc* proc) {
    proc->unk_30++;

    if (proc->func(proc) == 1) {
        Proc_Break(proc);
    }

    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    return;
}

void CpPerform_Cleanup(struct CpPerformProc* proc) {
    UpdateAllPhaseHealingAIStatus();
    AiRefreshMap();

    if (!(gActiveUnit->pCharacterData) || (gActiveUnit->state & (US_HIDDEN | US_DEAD | US_BIT16))) {
        Proc_Goto(proc, 1);
    }

    return;
}

s8 AiDummyAction(struct CpPerformProc* proc) {
    return 1;
}

s8 AiEscapeAction(struct CpPerformProc* proc) {
    if (!MuExistsActive()) {
        gActiveUnit->pCharacterData = NULL;
        return 1;
    }

    return 0;
}

s8 AiWaitAndClearScreenAction(struct CpPerformProc* proc) {

    if (proc->unk_30 > 4) {
        BG_Fill(gBG0TilemapBuffer, 0);
        BG_Fill(gBG1TilemapBuffer, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        return 1;
    }

    return 0;
}

void CpPerform_EquipBest(struct CpPerformProc* proc) {
    u16 equip_flags[UNIT_ITEM_COUNT + 1];

    if (AiCanEquip() && AiEquipGetFlags(equip_flags))
    {
        u16 range_danger;
        u16 melee_danger;
        u16 combined_danger;

        AiEquipGetDanger(gAiDecision.xMove, gAiDecision.yMove, &range_danger, &melee_danger, &combined_danger);
        AiEquipBestConsideringDanger(range_danger, melee_danger, combined_danger, equip_flags);
    }
}
