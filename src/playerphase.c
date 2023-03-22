#include "global.h"

#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmmap.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "statscreen.h"
#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "event.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "sallycursor.h"
#include "bmtrick.h"
#include "bmio.h"
#include "hardware.h"
#include "bmphase.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "minimap.h"
#include "player_interface.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"

#include "playerphase.h"

#include "constants/classes.h"
#include "constants/items.h"

struct MoveLimitViewProc {
    PROC_HEADER;
    
    /* 29 */ u8 pad[0x4A-0x29];
    /* 4A */ s16 unk_4A;
    /* 4C */ s16 unk_4C;
};

extern const struct MenuDef gMapMenuDef;
extern const struct MenuDef gUnitActionMenuDef;

extern u16 gUnknown_08A02F34[];
extern u16 gUnknown_08A02F94[];
extern u16 gUnknown_08A02FF4[];

extern u8 gUnknown_08A02EB4[];

void TrySwitchViewedUnit(int, int);
int GetUnitSelectionValueThing(struct Unit* unit);
void DisplayMoveRangeGraphics(int config);
s8 CanMoveActiveUnitTo(int, int);

// code.s
void PidStatsAddActAmt(u8);

// ev_triggercheck.s
s8 sub_8083250(void);
void sub_808326C(void);
void sub_80832CC(void);
s8 sub_80844B0(void);
s8 sub_8084508(void);
void sub_8084590(ProcPtr);
void TryCallSelectEvents(ProcPtr);

extern struct ProcCmd gProcScr_0859ACE8[];

void PlayerPhase_Suspend(void);
void PlayerPhase_MainIdle(ProcPtr proc);
void PlayerPhase_InitUnitMovementSelect(void);
void PlayerPhase_DisplayDangerZone(void);
void PlayerPhase_RangeDisplayIdle(ProcPtr proc);
s8 PlayerPhase_PrepareAction(ProcPtr proc);
s8 EnsureCameraOntoActiveUnitPosition(ProcPtr proc);
void PlayerPhase_FinishAction(ProcPtr proc);
void PlayerPhase_ApplyUnitMovement(ProcPtr proc);
void PlayerPhase_DisplayUnitMovement(void);
void PlayerPhase_WaitForUnitMovement(ProcPtr proc);
void PlayerPhase_ResumeRangeDisplay(ProcPtr proc);
void PlayerPhase_ReReadGameSaveGfx(void);
void PlayerPhase_RangeDisplayIdle_ForceAPress(ProcPtr);
void PlayerPhase_HandleAutoEnd(ProcPtr);

struct ProcCmd CONST_DATA gProcScr_PlayerPhase[] = {
    PROC_NAME("E_PLAYERPHASE"),
    PROC_MARK(PROC_MARK_2),
    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(PlayerPhase_Suspend),

    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(sub_8084590),
    PROC_WHILE(EventEngineExists),

    PROC_CALL(PlayerPhase_HandleAutoEnd),

    PROC_CALL(StartMapSongBgm),

    // fallthrough

PROC_LABEL(9),
    PROC_CALL(StartPlayerPhaseSideWindows),
    PROC_CALL(ResetUnitSpriteHover),

    PROC_REPEAT(PlayerPhase_MainIdle),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(EndPlayerPhaseSideWindows),

    PROC_WHILE(DoesBMXFADEExist),

    PROC_CALL(SetAllUnitNotBackSprite),
    PROC_CALL(RefreshUnitSprites),

    PROC_START_CHILD_BLOCKING(gProcScr_0859ACE8),

    PROC_CALL(PlayerPhase_InitUnitMovementSelect),
    PROC_SLEEP(1),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),

    PROC_CALL(PlayerPhase_DisplayUnitMovement),
    PROC_REPEAT(PlayerPhase_WaitForUnitMovement),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(PlayerPhase_ApplyUnitMovement),

    // fallthrough

PROC_LABEL(7),
    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_CALL_2(PlayerPhase_PrepareAction),

    PROC_CALL_2(ApplyUnitAction),
    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),

    PROC_CALL_2(EnsureCameraOntoActiveUnitPosition),

    PROC_CALL(PlayerPhase_FinishAction),

    PROC_GOTO(0),

PROC_LABEL(4),
    PROC_WHILE(DoesBMXFADEExist),

    PROC_GOTO(1),

PROC_LABEL(5),
    PROC_CALL(PlayerPhase_ReReadGameSaveGfx),

    // fallthrough

PROC_LABEL(10),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),

    PROC_GOTO(9),

PROC_LABEL(6),
    PROC_CALL(PlayerPhase_ResumeRangeDisplay),

    PROC_GOTO(1),

PROC_LABEL(8),
    PROC_SLEEP(0),

    PROC_CALL(MU_EndAll),

    PROC_GOTO(0),

PROC_LABEL(11),
    PROC_CALL(EndPlayerPhaseSideWindows),

    PROC_WHILE(DoesBMXFADEExist),

    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),

    PROC_GOTO(9),

PROC_LABEL(12),
    PROC_CALL(PlayerPhase_DisplayDangerZone),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),

    PROC_GOTO(9),

PROC_LABEL(3),
    PROC_WHILE(DoesBMXFADEExist),

    PROC_END,

};

void MakeMoveunitForActiveUnit(void);

struct ProcCmd CONST_DATA gProcScr_0859ACE8[] = {
    PROC_CALL(MakeMoveunitForActiveUnit),
    PROC_CALL(TryCallSelectEvents),

    PROC_WHILE(EventEngineExists),

    PROC_END,
};

u8* CONST_DATA gUnknown_0859AD08[] = {
    NULL,
    NULL,
    gUnknown_08A02C34 + (0 * 4 * 0x20),
    gUnknown_08A02C34 + (1 * 4 * 0x20),
    gUnknown_08A02C34 + (2 * 4 * 0x20),
    gUnknown_08A02C34 + (3 * 4 * 0x20),
    gUnknown_08A02C34 + (4 * 4 * 0x20),
    gUnknown_08A02C34 + (5 * 4 * 0x20),
};

void MoveLimitViewChange_OnInit(struct MoveLimitViewProc* proc);
void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc* proc);

struct ProcCmd CONST_DATA sProcScr_MoveLimitViewChange[] = {
    PROC_NAME("MLVCHC"),
    PROC_MARK(PROC_MARK_1),

    PROC_CALL(MoveLimitViewChange_OnInit),
    PROC_REPEAT(MoveLimitViewChange_OnLoop),

    PROC_END,
};

void MoveLimitView_OnEnd(struct MoveLimitViewProc* proc);
void MoveLimitView_OnInit(ProcPtr);
void MoveLimitView_OnLoop(struct MoveLimitViewProc* proc);

struct ProcCmd CONST_DATA sProcScr_MoveLimitView[] = {
    PROC_NAME("E_MOVELIMITVIEW"),
    PROC_MARK(PROC_MARK_1),

    PROC_SET_END_CB(MoveLimitView_OnEnd),

    PROC_START_CHILD(sProcScr_MoveLimitViewChange),

    PROC_CALL(MoveLimitView_OnInit),
    PROC_REPEAT(MoveLimitView_OnLoop),

    PROC_END,
};


void PlayerPhase_Suspend() {
    gActionData.suspendPointType = SUSPEND_POINT_PLAYERIDLE;
    WriteSuspendSave(SAVE_BLOCK_SUSPEND_BASE);

    return;
}

void HandlePlayerCursorMovement() {

    if ((gKeyStatusPtr->heldKeys & B_BUTTON) && !(gBmSt.playerCursorDisplay.x & 7) && !(gBmSt.playerCursorDisplay.y & 7)) {
        HandleMapCursorInput(gKeyStatusPtr->newKeys2);

        HandleMoveMapCursor(8);
        HandleMoveCameraWithMapCursor(8);
    } else {
        HandleMapCursorInput(gKeyStatusPtr->repeatedKeys);

        HandleMoveMapCursor(4);
        HandleMoveCameraWithMapCursor(4);
    }

    if (((gBmSt.playerCursorDisplay.x | gBmSt.playerCursorDisplay.y) & 0xF) != 0) {
        gKeyStatusPtr->newKeys &= ~(A_BUTTON | B_BUTTON | START_BUTTON | R_BUTTON | L_BUTTON);
    }

    return;
}

int CanShowUnitStatScreen(struct Unit* unit) {
    u8 class = unit->pClassData->number;

    if ((class == CLASS_GORGONEGG) || (class == CLASS_GORGONEGG2)) {
        return 0;
    }

    return 1;
}

void PlayerPhase_MainIdle(ProcPtr proc) {

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & L_BUTTON) {
        TrySwitchViewedUnit(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
        PlaySoundEffect(0x6B);
    } else if (!DoesBMXFADEExist()) {
        if ((gKeyStatusPtr->newKeys & R_BUTTON) && (gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x] != 0)) {
            if ((s8)CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]))) {

                MU_EndAll();

                EndPlayerPhaseSideWindows();
                SetStatScreenConfig(0x1F);

                StartStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]), proc);

                Proc_Goto(proc, 5);

                return;
            }
        }

        if ((gKeyStatusPtr->newKeys & A_BUTTON)) {
            struct Unit* unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
            
            switch (GetUnitSelectionValueThing(unit)) {
                case 0:
                case 1:
                    EndPlayerPhaseSideWindows();

                    gPlaySt.xCursor = gBmSt.playerCursor.x;
                    gPlaySt.yCursor = gBmSt.playerCursor.y;


                    if (unit) {
                        MU_EndAll();
                        ShowUnitSprite(unit);
                    }

                    StartOrphanMenuAdjusted(&gMapMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x17);
                    sub_80832CC();

                    Proc_Goto(proc, 9);
                    return;
                case 2:
                    UnitBeginAction(unit);
                    PidStatsAddActAmt(gActiveUnit->pCharacterData->number);

                    Proc_Break(proc);
                    goto _0801CB38;
                case 3:
                    UnitBeginAction(unit);
                    gBmSt.unk3E = 0;

                    Proc_Goto(proc, 11);

                    goto _0801CB38;
            }
        }

        if ((gKeyStatusPtr->newKeys & START_BUTTON) && !(gKeyStatusPtr->heldKeys & SELECT_BUTTON)) {
            struct Unit* unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

            if (unit) {
                MU_EndAll();
                ShowUnitSprite(unit);
            }

            EndPlayerPhaseSideWindows();
            StartMinimapPlayerPhase();

            Proc_Goto(proc, 9);
            return;
            
        }
    }

_0801CB38:
    UnitSpriteHoverUpdate();

    PutMapCursor(
        gBmSt.playerCursorDisplay.x, 
        gBmSt.playerCursorDisplay.y, 
        IsUnitSpriteHoverEnabledAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y) ? 3 : 0
    );

    return;
}

void DisplayUnitEffectRange(struct Unit* unit) {

    int flags = 1;

    GenerateUnitMovementMapExt(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionData.moveCount);

    if (!(gActiveUnit->state & US_HAS_MOVED)) {

        BmMapFill(gBmMapOther, 0);

        if (UnitHasMagicRank(unit)) {
            GenerateMagicSealMap(1);
        }

        BmMapFill(gBmMapRange, 0);

        switch (GetUnitWeaponUsabilityBits(gActiveUnit)) {
            case 3:
                if (gBmSt.unk3E & 1) {
                    GenerateUnitCompleteStaffRange(gActiveUnit);
                    flags = 5;
                } else {
                    GenerateUnitCompleteAttackRange(gActiveUnit);
                    flags = 3;
                }
                break;
            case 2:
                GenerateUnitCompleteStaffRange(gActiveUnit);
                flags = 5;
                break;
            case 1:
                GenerateUnitCompleteAttackRange(gActiveUnit);
                flags = 3;
                break;
        }
    }

    DisplayMoveRangeGraphics(flags);

    return;
}

void PlayerPhase_InitUnitMovementSelect() {

    gBmSt.gameStateBits |= (1 << 1);

    DisplayUnitEffectRange(gActiveUnit);

    if ((gActiveUnit->xPos == gBmSt.playerCursor.x) && (gActiveUnit->yPos == gBmSt.playerCursor.y)) {
        PathArrowDisp_Init(0);
        PlaySoundEffect(0x69);
        return;
    }

    PathArrowDisp_Init(1);

    return;
}

void DisplayActiveUnitEffectRange(ProcPtr proc) {

    PlaySoundEffect(0x68);

    gBmSt.gameStateBits &= ~(1 << 1);
    DisplayUnitEffectRange(gActiveUnit);

    return;
}

void PlayerPhase_DisplayDangerZone() {

    GenerateDangerZoneRange(gBmSt.unk3E & 1);

    BmMapFill(gBmMapMovement, -1);

    PlaySoundEffect(0x68);

    gBmSt.gameStateBits |= (1 << 3);
    gBmSt.gameStateBits &= ~(1 << 1);

    if (gBmSt.unk3E & 1) {
        DisplayMoveRangeGraphics(5);
    } else {
        DisplayMoveRangeGraphics(3);
    }

    return;
}

void PlayerPhase_RangeDisplayIdle(ProcPtr proc) {
    u8 uid;
    u8 action = -1;

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (!gActiveUnit) {

            if (GetCombinedEnemyWeaponUsabilityBits() == 3) {
                action = 6;
            } else {
                action = 2;
            }
            goto _0801CDE2;
        }

        if (sub_80844B0()) {
            action = 5;
            goto _0801CDE2;
        } else {
            if ((GetUnitSelectionValueThing(gActiveUnit) != 2) && !(gActiveUnit->state & US_HAS_MOVED)) {
                if (GetUnitWeaponUsabilityBits(gActiveUnit) == 3) {
                    action = 6;
                } else {
                    action = 2;
                }
                
                goto _0801CDE2;
            } else {
                if (!CanMoveActiveUnitTo(gBmSt.playerCursor.x, gBmSt.playerCursor.y)) {
                    action = 0;
                    goto _0801CDE2;
                }
                
                action = 1;
            }
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        if (gActiveUnit->state & US_HAS_MOVED) {
            action = 0;
        } else {
            action = 2;
        }
    } else if (gKeyStatusPtr->newKeys & R_BUTTON) {
        action = 3;
    } else if (gKeyStatusPtr->newKeys & L_BUTTON) {
        action = 4;
    }

_0801CDE2:
    switch (action) {
        case 0:
            PlaySoundEffect(0x6C);
            break;

        case 1:
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            HideMoveRangeGraphics();
            Proc_Break(proc);
            return;

        case 2:
            if (gActiveUnit) {
                MU_EndAll();
                
                gActiveUnit->state &= ~US_HIDDEN;
                
                if (UNIT_FACTION(gActiveUnit) == 0) {
                    EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                    SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                }
            }
            
            gBmSt.gameStateBits &= ~(1 << 3);
            
            HideMoveRangeGraphics();
            
            RefreshEntityBmMaps();
            RefreshUnitSprites();
            
            PlaySoundEffect(0x6B);
            
            Proc_Goto(proc, 9);

            return;

        case 3:
            if (EventEngineExists() == 1) {
                break;
            }
            
            uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];
            
            if ((gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x) && (gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y)) {
                uid = gActiveUnit->index;
            }
            
            if (uid == 0) {
                break;
            }

            if (!((s8)CanShowUnitStatScreen(GetUnit(uid)))) {
                break;
            }

            MU_EndAll();
            SetStatScreenConfig(0x1F);
            StartStatScreen(GetUnit(uid), proc);
            
            Proc_Goto(proc, 6);
            return;

        case 4:
            if (!gActiveUnit) {
                break;
            }
            
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(0x6B);
            break;

        case 5:
            break;

        case 6:
            gBmSt.unk3E++;
            
            HideMoveRangeGraphics();
            
            if (gBmSt.gameStateBits & (1 << 3)) {
                Proc_Goto(proc, 12);
            } else {
                Proc_Goto(proc, 11);
            }

            break;
    }

    if (GetUnitSelectionValueThing(gActiveUnit) == 2) {
        DrawUpdatedPathArrow();
    }
    
    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 1);

    return;
}

void PlayerPhase_CancelAction(ProcPtr proc) {

    gActionData.unitActionType = 0;
    Proc_Goto(proc, 2);

    return;
}

void PlayerPhase_BackToMove(ProcPtr proc) {

    gActiveUnit->xPos = gActiveUnitMoveOrigin.x;
    gActiveUnit->yPos = gActiveUnitMoveOrigin.y;

    UnitFinalizeMovement(gActiveUnit);

    gActiveUnit->state &= ~US_HIDDEN;

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();

    if (!(gActiveUnit->state & US_HAS_MOVED)) {
        UnitBeginAction(gActiveUnit);
    } else {
        UnitBeginCantoAction(gActiveUnit);
    }

    HideUnitSprite(gActiveUnit);
    MU_EndAll();
    MU_Create(gActiveUnit);

    Proc_Goto(proc, 1);

    return;
}

s8 PlayerPhase_PrepareAction(ProcPtr proc) {

    s8 cameraReturn;
    int item;

    cameraReturn = EnsureCameraOntoPosition(proc, GetUnit(gActionData.subjectIndex)->xPos, GetUnit(gActionData.subjectIndex)->yPos);
    cameraReturn ^= 1;

    switch (gActionData.unitActionType) {
        case 0:
            if (gBmSt.unk3D != 0) {
                gActionData.unitActionType = 0x1F;
                break;
            }

            PlayerPhase_BackToMove(proc);
            return 1;

        case 27:
            gBmSt.unk3D |= (1 << 1);
            PlayerPhase_CancelAction(proc);
            return 1;

        case 28:
            gBmSt.unk3D |= (1 << 2);
            PlayerPhase_CancelAction(proc);
            return 1;

        case 11:
        case 12:
            gBmSt.unk3D |= (1 << 0);
            PlayerPhase_CancelAction(proc);
            return 1;

        case 33:
        case 34:
            gBmSt.unk3D |= (1 << 3);
            PlayerPhase_CancelAction(proc);
            return 1;

        case 29:
            PlayerPhase_CancelAction(proc);
            return 1;
    }

    item = GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]);

    gBattleActor.hasItemEffectTarget = 0;
    
    switch (item) {
        case ITEM_HEAVENSEAL:
        case ITEM_HEROCREST:
        case ITEM_KNIGHTCREST:
        case ITEM_ORIONSBOLT:
        case ITEM_ELYSIANWHIP:
        case ITEM_GUIDINGRING:
        case ITEM_MASTERSEAL:
        case ITEM_OCEANSEAL:
        case ITEM_LUNARBRACE:
        case ITEM_SOLARBRACE:
        case ITEM_UNK_C1:
            return cameraReturn;
    }

    if ((gActionData.unitActionType != UNIT_ACTION_WAIT) && !gBmSt.just_resumed) {
        gActionData.suspendPointType = SUSPEND_POINT_DURINGACTION;
        WriteSuspendSave(SAVE_BLOCK_SUSPEND_BASE);
    }

    return cameraReturn;
}

s8 TryMakeCantoUnit(ProcPtr proc) {

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO)) {
        return 0;
    }

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16)) {
        return 0;
    }

    switch (gActionData.unitActionType) {
        case UNIT_ACTION_WAIT:
        case UNIT_ACTION_COMBAT:
        case UNIT_ACTION_STAFF:
            return 0;
    }

    if (UNIT_MOV(gActiveUnit) <= gActionData.moveCount) {
        return 0;
    }

    if (!CanUnitMove()) {
        return 0;
    }

    BmMapFill(gBmMapRange, 0);

    UnitBeginCantoAction(gActiveUnit);

    gActiveUnit->state |= US_HAS_MOVED;
    gActiveUnit->state &= ~US_UNSELECTABLE;

    MU_EndAll();
    MU_Create(gActiveUnit);
    MU_SetDefaultFacing_Auto();

    if (gPlaySt.chapterVisionRange != 0) {
        Proc_Goto(proc, 4);
    } else {
        Proc_Goto(proc, 1);
    }

    return 1;
}

s8 RunPotentialWaitEvents() {

    if (CheckForWaitEvents()) {
        RunWaitEvents();
        return 0;
    }

    return 1;
}

s8 EnsureCameraOntoActiveUnitPosition(ProcPtr proc) {
    return !EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void PlayerPhase_FinishAction(ProcPtr proc) {

    if (gPlaySt.chapterVisionRange != 0) {
        RenderBmMapOnBg2();

        MoveActiveUnit(gActionData.xMove, gActionData.yMove);

        RefreshEntityBmMaps();
        RenderBmMap();

        NewBMXFADE(0);

        RefreshUnitSprites();
    } else {
        MoveActiveUnit(gActionData.xMove, gActionData.yMove);

        RefreshEntityBmMaps();
        RenderBmMap();
    }

    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    gPlaySt.xCursor = gBmSt.playerCursor.x;
    gPlaySt.yCursor = gBmSt.playerCursor.y;

    if (TryMakeCantoUnit(proc)) {
        HideUnitSprite(gActiveUnit);
        return;
    }

    if (sub_8083250()) {
        MU_EndAll();

        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();

        sub_808326C();

        Proc_Goto(proc, 8);

        return;
    }

    MU_EndAll();

    return;
}

void sub_801D404() {  
    if (gPlaySt.faction == 0) {
        MoveActiveUnit(gActionData.xMove, gActionData.yMove);
        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        MU_EndAll();
    }

    return;
}

void sub_801D434(ProcPtr proc) {

    if (gActionData.unitActionType != UNIT_ACTION_TRAPPED) {
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);
    }

    Proc_Break(proc);

    return;
}

void PlayerPhase_ApplyUnitMovement(ProcPtr proc) {

    gActiveUnit->xPos = gActionData.xMove;
    gActiveUnit->yPos = gActionData.yMove;

    UnitFinalizeMovement(gActiveUnit);

    if ((!(gActiveUnit->state & US_HAS_MOVED) && (gActionData.unitActionType == 0)) && (gBmSt.unk3D == 0)) {
        gActionData.moveCount = gBmMapMovement[gActionData.yMove][gActionData.xMove];
    }

    Font_ResetAllocation();

    if (sub_8084508() == 1) {
        sub_801D434(proc);
        return;
    }

    if (gActionData.unitActionType != UNIT_ACTION_TRAPPED) {
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);
    }

    Proc_Break(proc);

    return;
}

int GetUnitSelectionValueThing(struct Unit* unit) {
    u8 faction = gPlaySt.faction;

    if (!unit) {
        return 0;
    }

    if (gBmSt.gameStateBits & (1 << 4)) {
        if (!CanCharacterBePrepMoved(unit->pCharacterData->number)) {
            return 4;
        }

        faction = 0;
    }

    if (!unit) {
        return 0;
    }

    if (UNIT_FACTION(unit) != faction) {
        return 3;
    }

    if (unit->state & US_UNSELECTABLE) {
        return 1;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE) {
        return 1;
    }

    if ((unit->statusIndex != UNIT_STATUS_SLEEP) && (unit->statusIndex != UNIT_STATUS_BERSERK)) {
        return 2;
    }

    return 3;
}

s8 CanMoveActiveUnitTo(int x, int y) {
    struct Trap* trap;

    if (gBmMapUnit[y][x] != 0) {
        return 0;
    }

    if (gBmMapMovement[y][x] >= 0x78) {
        return 0;
    }

    if (!(gActiveUnit->state & US_IN_BALLISTA)) {
        return 1;
    }

    trap = GetTrapAt(x, y);

    if ((x == gActiveUnitMoveOrigin.x) && (y == gActiveUnitMoveOrigin.y)) {
        return 1;
    }

    if (!trap) {
        return 1;
    }

    if (trap->type != TRAP_BALLISTA) {
        return 1;
    }

    return 0;
}

void PlayerPhase_DisplayUnitMovement() {
    GetMovementScriptFromPath();
    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos) ;
    MU_StartMoveScript_Auto(gWorkingMovementScript);

    return;
}

void PlayerPhase_WaitForUnitMovement(ProcPtr proc) {
    if (!MU_IsAnyActive()) {
        Proc_Break(proc);
    }

    return;
}

void PlayerPhase_ResumeRangeDisplay(ProcPtr proc) {

    if (!gActiveUnit) {
        RefreshBMapGraphics();
        Proc_Goto(proc, 12);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    switch (GetUnitSelectionValueThing(gActiveUnit)) {
        case 2:
            HideUnitSprite(gActiveUnit);
            break;
        case 3:
            Proc_Goto(proc, 11);
            break;
    }

    return;
}

void PlayerPhase_ReReadGameSaveGfx() {
    RefreshBMapGraphics();
    SetDefaultColorEffects();

    return;
}

void MakeMoveunitForActiveUnit() {

    if (!MU_Exists()) {
        if (UNIT_FACTION(gActiveUnit) == gPlaySt.faction) {
            if ((gActiveUnit->statusIndex != UNIT_STATUS_SLEEP) && (gActiveUnit->statusIndex != UNIT_STATUS_BERSERK)) {
                MU_Create(gActiveUnit);
                HideUnitSprite(gActiveUnit);
            }
        }
    }

    MU_SetDefaultFacing_Auto();

    return;
}

void ClearActiveUnit(ProcPtr proc) {
    ProcPtr playerPhaseProc;

    playerPhaseProc = Proc_Find(gProcScr_PlayerPhase);
    if (!playerPhaseProc) {
        return;
    }

    Proc_Goto(playerPhaseProc, 9);

    if (gActiveUnit != 0) {
        MU_EndAll();
        gActiveUnit->state &= ~US_HIDDEN;
    }

    gBmSt.gameStateBits &= ~(1 << 3);

    HideMoveRangeGraphics();
    RefreshEntityBmMaps();
    RefreshUnitSprites();
    UnitBeginAction(proc);

    gActiveUnit->state &= ~US_HIDDEN;

    gActiveUnitMoveOrigin.x = gActiveUnit->xPos;
    gActiveUnitMoveOrigin.y = gActiveUnit->yPos;

    SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);

    RefreshEntityBmMaps();
    RefreshUnitSprites();

    return;
}

void sub_801D7E8() {
    ProcPtr playerPhaseProc;

    playerPhaseProc = Proc_Find(gProcScr_PlayerPhase);
    if (!playerPhaseProc) {
        return;
    }
    
    if (((struct Proc*)(playerPhaseProc))->proc_idleCb == PlayerPhase_RangeDisplayIdle) {
        Proc_SetRepeatCb(playerPhaseProc, PlayerPhase_RangeDisplayIdle_ForceAPress);
    }

    return;
}

void PlayerPhase_RangeDisplayIdle_ForceAPress(ProcPtr proc) {

    gKeyStatusPtr->newKeys = A_BUTTON;
    gKeyStatusPtr->repeatedKeys = 0;

    PlayerPhase_RangeDisplayIdle(proc);

    return;
}

void sub_801D834() {

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO)) {
        return;
    }

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16)) {
        return;
    }

    if ((gActionData.unitActionType == UNIT_ACTION_COMBAT) || (gActionData.unitActionType == UNIT_ACTION_STAFF)) {
        return;
    }

    if (UNIT_MOV(gActiveUnit) <= gActionData.moveCount) {
        return;
    }

    if (!CanUnitMove()) {
        return;
    }

    gActiveUnit->state |= US_CANTOING;

    return;
}

void MoveLimitViewChange_OnInit(struct MoveLimitViewProc* proc) {

    RegisterTileGraphics(gUnknown_08A02EB4, (u8*)VRAM + 0x5080, 0x80);

    if (!(gBmSt.gameStateBits & (1 << 0))) {
        proc->unk_4C = 2;
    } else {
        RegisterTileGraphics(gUnknown_08A02EB4, (u8*)VRAM + 0x5000, 0x80);
        Proc_End(proc);
    }

    return;
}

void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc* proc) {

    RegisterTileGraphics(gUnknown_0859AD08[proc->unk_4C], (u8*)VRAM + 0x5000, 0x80);

    proc->unk_4C++;

    if (proc->unk_4C == 8) {
        Proc_Break(proc);
    }

    return;
}

void MoveLimitView_OnInit(ProcPtr proc) {
    int iy;
    int ix;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gBmSt.gameStateBits |= (1 << 0);
    RenderBmMap();

    for (iy = 9; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            s16 xOrigin = gBmSt.mapRenderOrigin.x;
            s16 yOrigin = gBmSt.mapRenderOrigin.y;

            DisplayMovementViewTile(gBG2TilemapBuffer, xOrigin + ix, yOrigin + iy, ix, iy);
        }
    }

    BG_EnableSyncByMask(4);
    BG_SetPosition(2, 0, 0);

    SetSpecialColorEffectsParameters(1, 10, 6, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    sub_8001F48(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    sub_8001F64(1);

    InitBmBgLayers();

    return;
}

void MoveLimitView_OnLoop(struct MoveLimitViewProc* proc) {

    int frame = (GetGameClock() / 2) & 31;

    if (proc->unk_4A & 1) {
        CopyToPaletteBuffer(gUnknown_08A02F34 + frame, 0x82, 0x20);
    }

    if (proc->unk_4A & 2) {
        CopyToPaletteBuffer(gUnknown_08A02F94 + frame, 0xA2, 0x20);
    }

    if (proc->unk_4A & 4) {
        CopyToPaletteBuffer(gUnknown_08A02FF4 + frame, 0xA2, 0x20);
    }

    if (proc->unk_4A & 0x10) {
        CopyToPaletteBuffer(gUnknown_08A02F34 + frame, 0xA2, 0x20);
    }

    return;
}

void MoveLimitView_OnEnd(struct MoveLimitViewProc* proc) {
    if ((proc->unk_4A & 0x11) != 0) {
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(4);
    }

    gBmSt.gameStateBits &= ~((1 << 0) | (1 << 1));

    InitBmBgLayers();

    return;
}

void DisplayMoveRangeGraphics(int flags) {
    struct MoveLimitViewProc* proc;

    proc = Proc_Find(sProcScr_MoveLimitView);
    if (proc) {
        MoveLimitView_OnInit(proc);
        MoveLimitViewChange_OnInit(0);

        return;
    }

    proc = Proc_Start(sProcScr_MoveLimitView, PROC_TREE_4);
    proc->unk_4A = flags;

    return;
}

void HideMoveRangeGraphics() {
    Proc_EndEach(sProcScr_MoveLimitView);
    return;
}

s8 TrySetCursorOn(int unitId) {
    ProcPtr proc;

    struct Unit* unit = GetUnit(unitId);

    if (!UNIT_IS_VALID(unit)) {
        return 0;
    }

    if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_BIT16)) {
        return 0;
    }
    
    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP) {
        return 0;
    }
    
    proc = Proc_Find(gProcScr_PlayerPhase);

    if (!proc) {
        proc = Proc_Find(gProcScr_SALLYCURSOR);
    }

    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
    SetCursorMapPosition(unit->xPos, unit->yPos);

    return 1;
}

void TrySwitchViewedUnit(int x, int y) {
    int i;

    int unitId = gBmMapUnit[y][x];

    if ((unitId & 0xC0) != 0) {
        unitId = 0;
    }

    unitId++;

    for (i = unitId; i < 0x3F; ++i) {
        if (TrySetCursorOn(i)) {
            return;
        }
    }

    for (i = 1; i <= unitId; ++i) {
        if (TrySetCursorOn(i)) {
            return;
        }
    }

    return;
}

void PlayerPhase_HandleAutoEnd(ProcPtr proc) {

    if (!(gPlaySt.cfgDisableAutoEndTurns) && (GetPhaseAbleUnitCount(gPlaySt.faction) == 0)) {
        Proc_Goto(proc, 3);
    }

    return;
}