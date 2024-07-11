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
#include "prepscreen.h"
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
#include "eventinfo.h"

#include "playerphase.h"

#include "constants/classes.h"
#include "constants/items.h"

// clang-format off

struct ProcCmd CONST_DATA gProcScr_PlayerPhase[] =
{
    PROC_NAME("E_PLAYERPHASE"),
    PROC_MARK(PROC_MARK_2),
    PROC_YIELD,

PROC_LABEL(0),
    PROC_CALL(PlayerPhase_Suspend),

    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(StartPlayerPhaseStartTutorialEvent),
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
    PROC_YIELD,

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

struct ProcCmd CONST_DATA gProcScr_0859ACE8[] =
{
    PROC_CALL(MakeMoveunitForActiveUnit),
    PROC_CALL(TryCallSelectEvents),

    PROC_WHILE(EventEngineExists),

    PROC_END,
};

u8 * CONST_DATA gOpenLimitViewImgLut[] =
{
    NULL,
    NULL,
    Img_LimitViewSquares + (0 * 4 * CHR_SIZE),
    Img_LimitViewSquares + (1 * 4 * CHR_SIZE),
    Img_LimitViewSquares + (2 * 4 * CHR_SIZE),
    Img_LimitViewSquares + (3 * 4 * CHR_SIZE),
    Img_LimitViewSquares + (4 * 4 * CHR_SIZE),
    Img_LimitViewSquares + (5 * 4 * CHR_SIZE),
};

struct ProcCmd CONST_DATA sProcScr_MoveLimitViewChange[] =
{
    PROC_NAME("MLVCHC"),
    PROC_MARK(PROC_MARK_1),

    PROC_CALL(MoveLimitViewChange_OnInit),
    PROC_REPEAT(MoveLimitViewChange_OnLoop),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_MoveLimitView[] =
{
    PROC_NAME("E_MOVELIMITVIEW"),
    PROC_MARK(PROC_MARK_1),

    PROC_SET_END_CB(MoveLimitView_OnEnd),

    PROC_START_CHILD(sProcScr_MoveLimitViewChange),

    PROC_CALL(MoveLimitView_OnInit),
    PROC_REPEAT(MoveLimitView_OnLoop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0801C894
void PlayerPhase_Suspend(void)
{
    gActionData.suspendPointType = SUSPEND_POINT_PLAYERIDLE;
    WriteSuspendSave(SAVE_ID_SUSPEND);
    return;
}

//! FE8U = 0x0801C8AC
void HandlePlayerCursorMovement(void)
{
    if ((gKeyStatusPtr->heldKeys & B_BUTTON) && !(gBmSt.playerCursorDisplay.x & 7) &&
        !(gBmSt.playerCursorDisplay.y & 7))
    {
        HandleMapCursorInput(gKeyStatusPtr->newKeys2);

        HandleMoveMapCursor(8);
        HandleMoveCameraWithMapCursor(8);
    }
    else
    {
        HandleMapCursorInput(gKeyStatusPtr->repeatedKeys);

        HandleMoveMapCursor(4);
        HandleMoveCameraWithMapCursor(4);
    }

    if (((gBmSt.playerCursorDisplay.x | gBmSt.playerCursorDisplay.y) & 0xF) != 0)
    {
        gKeyStatusPtr->newKeys &= ~(A_BUTTON | B_BUTTON | START_BUTTON | R_BUTTON | L_BUTTON);
    }

    return;
}

//! FE8U = 0x0801C928
bool CanShowUnitStatScreen(struct Unit * unit)
{
    if (UNIT_IS_GORGON_EGG(unit))
    {
        return false;
    }

    return true;
}

//! FE8U = 0x0801C940
void PlayerPhase_MainIdle(ProcPtr proc)
{
    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & L_BUTTON)
    {
        TrySwitchViewedUnit(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
        PlaySoundEffect(0x6B);
    }
    else if (!DoesBMXFADEExist())
    {
        if ((gKeyStatusPtr->newKeys & R_BUTTON) && (gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x] != 0))
        {
            if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])))
            {

                MU_EndAll();

                EndPlayerPhaseSideWindows();
                SetStatScreenConfig(
                    STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                    STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);

                StartStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]), proc);

                Proc_Goto(proc, 5);

                return;
            }
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

            switch (GetPlayerSelectKind(unit))
            {
                case PLAYER_SELECT_NOUNIT:
                case PLAYER_SELECT_TURNENDED:
                    EndPlayerPhaseSideWindows();

                    gPlaySt.xCursor = gBmSt.playerCursor.x;
                    gPlaySt.yCursor = gBmSt.playerCursor.y;

                    if (unit)
                    {
                        MU_EndAll();
                        ShowUnitSprite(unit);
                    }

                    StartOrphanMenuAdjusted(&gMapMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x17);
                    sub_80832CC();

                    Proc_Goto(proc, 9);

                    return;

                case PLAYER_SELECT_CONTROL:
                    UnitBeginAction(unit);
                    PidStatsAddActAmt(gActiveUnit->pCharacterData->number);

                    Proc_Break(proc);

                    goto _0801CB38;

                case PLAYER_SELECT_NOCONTROL:
                    UnitBeginAction(unit);
                    gBmSt.swapActionRangeCount = 0;

                    Proc_Goto(proc, 11);

                    goto _0801CB38;
            }
        }

        if ((gKeyStatusPtr->newKeys & START_BUTTON) && !(gKeyStatusPtr->heldKeys & SELECT_BUTTON))
        {
            struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

            if (unit)
            {
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
        gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y,
        IsUnitSpriteHoverEnabledAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y) ? 3 : 0);

    return;
}

//! FE8U = 0x0801CB70
void DisplayUnitEffectRange(struct Unit * unit)
{
    int flags = LIMITVIEW_BLUE;

    GenerateUnitMovementMapExt(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionData.moveCount);

    if (!(gActiveUnit->state & US_HAS_MOVED))
    {

        BmMapFill(gBmMapOther, 0);

        if (UnitHasMagicRank(unit))
        {
            GenerateMagicSealMap(1);
        }

        BmMapFill(gBmMapRange, 0);

        switch (GetUnitWeaponUsabilityBits(gActiveUnit))
        {
            case UNIT_USEBIT_WEAPON | UNIT_USEBIT_STAFF:
                if (gBmSt.swapActionRangeCount & 1)
                {
                    GenerateUnitCompleteStaffRange(gActiveUnit);
                    flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;
                }
                else
                {
                    GenerateUnitCompleteAttackRange(gActiveUnit);
                    flags = LIMITVIEW_RED | LIMITVIEW_BLUE;
                }

                break;

            case UNIT_USEBIT_STAFF:
                GenerateUnitCompleteStaffRange(gActiveUnit);
                flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;

                break;

            case UNIT_USEBIT_WEAPON:
                GenerateUnitCompleteAttackRange(gActiveUnit);
                flags = LIMITVIEW_RED | LIMITVIEW_BLUE;

                break;
        }
    }

    DisplayMoveRangeGraphics(flags);

    return;
}

//! FE8U = 0x0801CC1C
void PlayerPhase_InitUnitMovementSelect(void)
{
    gBmSt.gameStateBits |= BM_FLAG_1;

    DisplayUnitEffectRange(gActiveUnit);

    if ((gActiveUnit->xPos == gBmSt.playerCursor.x) && (gActiveUnit->yPos == gBmSt.playerCursor.y))
    {
        PathArrowDisp_Init(0);
        PlaySoundEffect(0x69);
        return;
    }

    PathArrowDisp_Init(1);

    return;
}

//! FE8U = 0x0801CC7C
void DisplayActiveUnitEffectRange(ProcPtr proc)
{
    PlaySoundEffect(0x68);

    gBmSt.gameStateBits &= ~BM_FLAG_1;
    DisplayUnitEffectRange(gActiveUnit);

    return;
}

//! FE8U = 0x0801CCB4
void PlayerPhase_DisplayDangerZone(void)
{
    GenerateDangerZoneRange(gBmSt.swapActionRangeCount & 1);

    BmMapFill(gBmMapMovement, -1);

    PlaySoundEffect(0x68);

    gBmSt.gameStateBits |= BM_FLAG_3;
    gBmSt.gameStateBits &= ~BM_FLAG_1;

    if (gBmSt.swapActionRangeCount & 1)
    {
        DisplayMoveRangeGraphics(5);
    }
    else
    {
        DisplayMoveRangeGraphics(3);
    }

    return;
}

//! FE8U = 0x0801CD1C
void PlayerPhase_RangeDisplayIdle(ProcPtr proc)
{
    enum
    {
        ACT_FAIL = 0,
        ACT_MOVE = 1,
        ACT_CANCEL = 2,
        ACT_INFOSCREEN = 3,
        ACT_RESET_CURSOR = 4,
        ACT_EVENT = 5,
        ACT_SWAP_RANGES = 6,
    };

    u8 uid;
    u8 action = -1;

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (!gActiveUnit)
        {
            if (GetCombinedEnemyWeaponUsabilityBits() == 3)
            {
                action = ACT_SWAP_RANGES;
            }
            else
            {
                action = ACT_CANCEL;
            }

            goto _0801CDE2;
        }

        if (StartDestSelectedEvent())
        {
            action = ACT_EVENT;
            goto _0801CDE2;
        }
        else
        {
            if ((GetPlayerSelectKind(gActiveUnit) != 2) && !(gActiveUnit->state & US_HAS_MOVED))
            {
                if (GetUnitWeaponUsabilityBits(gActiveUnit) == 3)
                {
                    action = ACT_SWAP_RANGES;
                }
                else
                {
                    action = ACT_CANCEL;
                }

                goto _0801CDE2;
            }
            else
            {
                if (!CanMoveActiveUnitTo(gBmSt.playerCursor.x, gBmSt.playerCursor.y))
                {
                    action = ACT_FAIL;
                    goto _0801CDE2;
                }

                action = ACT_MOVE;
            }
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        if (gActiveUnit->state & US_HAS_MOVED)
        {
            action = ACT_FAIL;
        }
        else
        {
            action = ACT_CANCEL;
        }
    }
    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        action = ACT_INFOSCREEN;
    }
    else if (gKeyStatusPtr->newKeys & L_BUTTON)
    {
        action = ACT_RESET_CURSOR;
    }

_0801CDE2:
    switch (action)
    {
        case ACT_FAIL:
            PlaySoundEffect(0x6C);

            break;

        case ACT_MOVE:
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            HideMoveRangeGraphics();
            Proc_Break(proc);

            return;

        case ACT_CANCEL:
            if (gActiveUnit)
            {
                MU_EndAll();

                gActiveUnit->state &= ~US_HIDDEN;

                if (UNIT_FACTION(gActiveUnit) == 0)
                {
                    EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                    SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                }
            }

            gBmSt.gameStateBits &= ~BM_FLAG_3;

            HideMoveRangeGraphics();

            RefreshEntityBmMaps();
            RefreshUnitSprites();

            PlaySoundEffect(0x6B);

            Proc_Goto(proc, 9);

            return;

        case ACT_INFOSCREEN:
            if (EventEngineExists() == 1)
            {
                break;
            }

            uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

            if ((gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x) && (gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y))
            {
                uid = gActiveUnit->index;
            }

            if (uid == 0)
            {
                break;
            }

            if (!CanShowUnitStatScreen(GetUnit(uid)))
            {
                break;
            }

            MU_EndAll();
            SetStatScreenConfig(
                STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
            StartStatScreen(GetUnit(uid), proc);

            Proc_Goto(proc, 6);

            return;

        case ACT_RESET_CURSOR:
            if (!gActiveUnit)
            {
                break;
            }

            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(0x6B);

            break;

        case ACT_EVENT:
            break;

        case ACT_SWAP_RANGES:
            gBmSt.swapActionRangeCount++;

            HideMoveRangeGraphics();

            if (gBmSt.gameStateBits & BM_FLAG_3)
            {
                Proc_Goto(proc, 12);
            }
            else
            {
                Proc_Goto(proc, 11);
            }

            break;
    }

    if (GetPlayerSelectKind(gActiveUnit) == PLAYER_SELECT_CONTROL)
    {
        DrawUpdatedPathArrow();
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 1);

    return;
}

//! FE8U = 0x0801CFF0
void PlayerPhase_CancelAction(ProcPtr proc)
{
    gActionData.unitActionType = 0;
    Proc_Goto(proc, 2);
    return;
}

//! FE8U = 0x0801D008
void PlayerPhase_BackToMove(ProcPtr proc)
{
    gActiveUnit->xPos = gActiveUnitMoveOrigin.x;
    gActiveUnit->yPos = gActiveUnitMoveOrigin.y;

    UnitFinalizeMovement(gActiveUnit);

    gActiveUnit->state &= ~US_HIDDEN;

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();

    if (!(gActiveUnit->state & US_HAS_MOVED))
    {
        UnitBeginAction(gActiveUnit);
    }
    else
    {
        UnitBeginCantoAction(gActiveUnit);
    }

    HideUnitSprite(gActiveUnit);
    MU_EndAll();
    StartMu(gActiveUnit);

    Proc_Goto(proc, 1);

    return;
}

//! FE8U = 0x0801D084
s8 PlayerPhase_PrepareAction(ProcPtr proc)
{
    s8 cameraReturn;
    int item;

    cameraReturn = EnsureCameraOntoPosition(
        proc, GetUnit(gActionData.subjectIndex)->xPos, GetUnit(gActionData.subjectIndex)->yPos);
    cameraReturn ^= 1;

    switch (gActionData.unitActionType)
    {
        case 0:
            /**
             * If character has use some action: such as trade with somebody,
             * then he may get chance to take another action but cannot change to another.
             * If player want to control other character, the current unit may caught wait action.
             */
            if (gBmSt.taken_action != 0)
            {
                gActionData.unitActionType = UNIT_ACTION_FORCE_WAIT;
                break;
            }

            PlayerPhase_BackToMove(proc);

            return 1;

        case UNIT_ACTION_TRADED:
            gBmSt.taken_action |= BM_TAKEN_ACTION_TRADE;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_TRADED_SUPPLY:
            gBmSt.taken_action |= BM_TAKEN_ACTION_SUPPLY;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_TAKE:
        case UNIT_ACTION_GIVE:
            gBmSt.taken_action |= BM_TAKEN_ACTION_TAKE;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_RIDE_BALLISTA:
        case UNIT_ACTION_EXIT_BALLISTA:
            gBmSt.taken_action |= BM_TAKEN_ACTION_BALLISTA;
            PlayerPhase_CancelAction(proc);

            return 1;

        case UNIT_ACTION_TRADED_1D:
            PlayerPhase_CancelAction(proc);

            return 1;
    }

    item = GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]);

    gBattleActor.hasItemEffectTarget = 0;

    switch (item)
    {
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

    if ((gActionData.unitActionType != UNIT_ACTION_WAIT) && !gBmSt.just_resumed)
    {
        gActionData.suspendPointType = SUSPEND_POINT_DURINGACTION;
        WriteSuspendSave(SAVE_ID_SUSPEND);
    }

    return cameraReturn;
}

//! FE8U = 0x0801D244
bool TryMakeCantoUnit(ProcPtr proc)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO))
    {
        return false;
    }

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16))
    {
        return false;
    }

    switch (gActionData.unitActionType)
    {
        case UNIT_ACTION_WAIT:
        case UNIT_ACTION_COMBAT:
        case UNIT_ACTION_STAFF:
            return false;
    }

    if (UNIT_MOV(gActiveUnit) <= gActionData.moveCount)
    {
        return false;
    }

    if (!CanUnitMove())
    {
        return false;
    }

    BmMapFill(gBmMapRange, 0);

    UnitBeginCantoAction(gActiveUnit);

    gActiveUnit->state |= US_HAS_MOVED;
    gActiveUnit->state &= ~US_UNSELECTABLE;

    MU_EndAll();
    StartMu(gActiveUnit);
    SetAutoMuDefaultFacing();

    if (gPlaySt.chapterVisionRange != 0)
    {
        Proc_Goto(proc, 4);
    }
    else
    {
        Proc_Goto(proc, 1);
    }

    return true;
}

//! FE8U = 0x0801D300
bool RunPotentialWaitEvents(void)
{
    if (CheckForWaitEvents())
    {
        RunWaitEvents();
        return false;
    }

    return true;
}

//! FE8U = 0x0801D31C
bool EnsureCameraOntoActiveUnitPosition(ProcPtr proc)
{
    return !EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

//! FE8U = 0x0801D344
void PlayerPhase_FinishAction(ProcPtr proc)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderBmMapOnBg2();

        MoveActiveUnit(gActionData.xMove, gActionData.yMove);

        RefreshEntityBmMaps();
        RenderBmMap();

        NewBMXFADE(0);

        RefreshUnitSprites();
    }
    else
    {
        MoveActiveUnit(gActionData.xMove, gActionData.yMove);

        RefreshEntityBmMaps();
        RenderBmMap();
    }

    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    gPlaySt.xCursor = gBmSt.playerCursor.x;
    gPlaySt.yCursor = gBmSt.playerCursor.y;

    if (TryMakeCantoUnit(proc))
    {
        HideUnitSprite(gActiveUnit);
        return;
    }

    if (ShouldCallEndEvent())
    {
        MU_EndAll();

        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();

        MaybeCallEndEvent_();

        Proc_Goto(proc, 8);

        return;
    }

    MU_EndAll();

    return;
}

//! FE8U = 0x0801D404
void sub_801D404(void)
{
    if (gPlaySt.faction == FACTION_BLUE)
    {
        MoveActiveUnit(gActionData.xMove, gActionData.yMove);
        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        MU_EndAll();
    }

    return;
}

//! FE8U = 0x0801D434
void sub_801D434(ProcPtr proc)
{
    if (gActionData.unitActionType != UNIT_ACTION_TRAPPED)
    {
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0801D470
void PlayerPhase_ApplyUnitMovement(ProcPtr proc)
{
    gActiveUnit->xPos = gActionData.xMove;
    gActiveUnit->yPos = gActionData.yMove;

    UnitFinalizeMovement(gActiveUnit);

    if ((!(gActiveUnit->state & US_HAS_MOVED) && (gActionData.unitActionType == 0)) && (gBmSt.taken_action == 0))
    {
        gActionData.moveCount = gBmMapMovement[gActionData.yMove][gActionData.xMove];
    }

    ResetTextFont();

    if (StartAfterUnitMovedEvent() == 1)
    {
        sub_801D434(proc);
        return;
    }

    if (gActionData.unitActionType != UNIT_ACTION_TRAPPED)
    {
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0801D51C
int GetPlayerSelectKind(struct Unit * unit)
{
    u8 faction = gPlaySt.faction;

    if (!unit)
    {
        return PLAYER_SELECT_NOUNIT;
    }

    if (gBmSt.gameStateBits & BM_FLAG_PREPSCREEN)
    {
        if (!CanCharacterBePrepMoved(unit->pCharacterData->number))
        {
            return PLAYER_SELECT_4;
        }

        faction = FACTION_BLUE;
    }

    if (!unit)
    {
        return PLAYER_SELECT_NOUNIT;
    }

    if (UNIT_FACTION(unit) != faction)
    {
        return PLAYER_SELECT_NOCONTROL;
    }

    if (unit->state & US_UNSELECTABLE)
    {
        return PLAYER_SELECT_TURNENDED;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE)
    {
        return PLAYER_SELECT_TURNENDED;
    }

    if ((unit->statusIndex != UNIT_STATUS_SLEEP) && (unit->statusIndex != UNIT_STATUS_BERSERK))
    {
        return PLAYER_SELECT_CONTROL;
    }

    return PLAYER_SELECT_NOCONTROL;
}

//! FE8U = 0x0801D5A8
bool CanMoveActiveUnitTo(int x, int y)
{
    struct Trap * trap;

    if (gBmMapUnit[y][x] != 0)
    {
        return false;
    }

    if (gBmMapMovement[y][x] >= MAP_MOVEMENT_MAX)
    {
        return false;
    }

    if (!(gActiveUnit->state & US_IN_BALLISTA))
    {
        return true;
    }

    trap = GetTrapAt(x, y);

    if ((x == gActiveUnitMoveOrigin.x) && (y == gActiveUnitMoveOrigin.y))
    {
        return true;
    }

    if (!trap)
    {
        return true;
    }

    if (trap->type != TRAP_BALLISTA)
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0801D624
void PlayerPhase_DisplayUnitMovement(void)
{
    GetMovementScriptFromPath();
    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);
    SetAutoMuMoveScript(gWorkingMovementScript);

    return;
}

//! FE8U = 0x0801D64C
void PlayerPhase_WaitForUnitMovement(ProcPtr proc)
{
    if (!MuExistsActive())
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0801D668
void PlayerPhase_ResumeRangeDisplay(ProcPtr proc)
{
    if (!gActiveUnit)
    {
        RefreshBMapGraphics();
        Proc_Goto(proc, 12);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    switch (GetPlayerSelectKind(gActiveUnit))
    {
        case PLAYER_SELECT_CONTROL:
            HideUnitSprite(gActiveUnit);
            break;

        case PLAYER_SELECT_NOCONTROL:
            Proc_Goto(proc, 11);
            break;
    }

    return;
}

//! FE8U = 0x0801D6FC
void PlayerPhase_ReReadGameSaveGfx(void)
{
    RefreshBMapGraphics();
    SetDefaultColorEffects();

    return;
}

//! FE8U = 0x0801D70C
void MakeMoveunitForActiveUnit(void)
{
    if (!MuExists())
    {
        if (UNIT_FACTION(gActiveUnit) == gPlaySt.faction)
        {
            if ((gActiveUnit->statusIndex != UNIT_STATUS_SLEEP) && (gActiveUnit->statusIndex != UNIT_STATUS_BERSERK))
            {
                StartMu(gActiveUnit);
                HideUnitSprite(gActiveUnit);
            }
        }
    }

    SetAutoMuDefaultFacing();

    return;
}

//! FE8U = 0x0801D75C
void ClearActiveUnit(struct Unit * unit)
{
    ProcPtr playerPhaseProc = Proc_Find(gProcScr_PlayerPhase);

    if (!playerPhaseProc)
    {
        return;
    }

    Proc_Goto(playerPhaseProc, 9);

    if (gActiveUnit != NULL)
    {
        MU_EndAll();
        gActiveUnit->state &= ~US_HIDDEN;
    }

    gBmSt.gameStateBits &= ~BM_FLAG_3;

    HideMoveRangeGraphics();
    RefreshEntityBmMaps();
    RefreshUnitSprites();
    UnitBeginAction(unit);

    gActiveUnit->state &= ~US_HIDDEN;

    gActiveUnitMoveOrigin.x = gActiveUnit->xPos;
    gActiveUnitMoveOrigin.y = gActiveUnit->yPos;

    SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);

    RefreshEntityBmMaps();
    RefreshUnitSprites();

    return;
}

//! FE8U = 0x0801D7E8
void PlayPhaseForcePressAButtonInRangeDisp(void)
{
    struct Proc * playerPhaseProc = Proc_Find(gProcScr_PlayerPhase);

    if (!playerPhaseProc)
        return;

    if (playerPhaseProc->proc_idleCb == PlayerPhase_RangeDisplayIdle)
        Proc_SetRepeatCb(playerPhaseProc, PlayerPhase_RangeDisplayIdle_ForceAPress);
}

//! FE8U = 0x0801D818
void PlayerPhase_RangeDisplayIdle_ForceAPress(ProcPtr proc)
{
    gKeyStatusPtr->newKeys = A_BUTTON;
    gKeyStatusPtr->repeatedKeys = 0;

    PlayerPhase_RangeDisplayIdle(proc);
}

//! FE8U = 0x0801D834
void PlayPhaseForceActiveUnitCanto(void)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO))
        return;

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16))
        return;

    if ((gActionData.unitActionType == UNIT_ACTION_COMBAT) || (gActionData.unitActionType == UNIT_ACTION_STAFF))
        return;

    if (UNIT_MOV(gActiveUnit) <= gActionData.moveCount)
        return;

    if (!CanUnitMove())
        return;

    gActiveUnit->state |= US_CANTOING;
}

//! FE8U = 0x0801D89C
void MoveLimitViewChange_OnInit(struct MoveLimitViewProc * proc)
{
    RegisterDataMove(gUnknown_08A02EB4, (u8 *)VRAM + 0x5080, 0x80);

    if (!(gBmSt.gameStateBits & BM_FLAG_0))
    {
        proc->unk_4C = 2;
    }
    else
    {
        RegisterDataMove(gUnknown_08A02EB4, (u8 *)VRAM + 0x5000, 0x80);
        Proc_End(proc);
    }

    return;
}

//! FE8U = 0x0801D8EC
void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc * proc)
{
    RegisterDataMove(gOpenLimitViewImgLut[proc->unk_4C], (u8 *)VRAM + 0x5000, 0x80);

    proc->unk_4C++;

    if (proc->unk_4C == 8)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0801D92C
void MoveLimitView_OnInit(ProcPtr proc)
{
    int ix;
    int iy;

    SetWinEnable(0, 0, 0);

    gBmSt.gameStateBits |= BM_FLAG_0;
    RenderBmMap();

    for (iy = 9; iy >= 0; --iy)
    {
        for (ix = 14; ix >= 0; --ix)
        {
            s16 xOrigin = gBmSt.mapRenderOrigin.x;
            s16 yOrigin = gBmSt.mapRenderOrigin.y;

            DisplayMovementViewTile(gBG2TilemapBuffer, xOrigin + ix, yOrigin + iy, ix, iy);
        }
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(10, 6);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    InitBmBgLayers();

    return;
}

//! FE8U = 0x0801D9DC
void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc)
{
    int frame = (GetGameClock() / 2) & 31;

    if (proc->flags & LIMITVIEW_BLUE)
    {
        CopyToPaletteBuffer(gUnknown_08A02F34 + frame, 0x82, 0x20);
    }

    if (proc->flags & LIMITVIEW_RED)
    {
        CopyToPaletteBuffer(gUnknown_08A02F94 + frame, 0xA2, 0x20);
    }

    if (proc->flags & LIMITVIEW_GREEN)
    {
        CopyToPaletteBuffer(gUnknown_08A02FF4 + frame, 0xA2, 0x20);
    }

    if (proc->flags & LIMITVIEW_UNK)
    {
        CopyToPaletteBuffer(gUnknown_08A02F34 + frame, 0xA2, 0x20);
    }

    return;
}

//! FE8U = 0x0801DA60
void MoveLimitView_OnEnd(struct MoveLimitViewProc * proc)
{
    if ((proc->flags & (LIMITVIEW_BLUE | LIMITVIEW_UNK)) != 0)
    {
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    }

    gBmSt.gameStateBits &= ~(BM_FLAG_0 | BM_FLAG_1);

    InitBmBgLayers();

    return;
}

//! FE8U = 0x0801DA98
void DisplayMoveRangeGraphics(int flags)
{
    struct MoveLimitViewProc * proc = Proc_Find(sProcScr_MoveLimitView);

    if (proc)
    {
        MoveLimitView_OnInit(proc);
        MoveLimitViewChange_OnInit(NULL);

        return;
    }

    proc = Proc_Start(sProcScr_MoveLimitView, PROC_TREE_4);
    proc->flags = flags;

    return;
}

//! FE8U = 0x0801DACC
void HideMoveRangeGraphics(void)
{
    Proc_EndEach(sProcScr_MoveLimitView);
    return;
}

//! FE8U = 0x0801DADC
bool TrySetCursorOn(int unitId)
{
    ProcPtr proc;

    struct Unit * unit = GetUnit(unitId);

    if (!UNIT_IS_VALID(unit))
    {
        return false;
    }

    if (unit->state & (US_HIDDEN | US_UNSELECTABLE | US_DEAD | US_BIT16))
    {
        return false;
    }

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP)
    {
        return false;
    }

    proc = Proc_Find(gProcScr_PlayerPhase);

    if (!proc)
    {
        proc = Proc_Find(gProcScr_SALLYCURSOR);
    }

    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
    SetCursorMapPosition(unit->xPos, unit->yPos);

    return true;
}

//! FE8U = 0x0801DB4C
void TrySwitchViewedUnit(int x, int y)
{
    int i;

    int unitId = gBmMapUnit[y][x];

    if ((unitId & 0xC0) != FACTION_BLUE)
    {
        unitId = 0;
    }

    unitId++;

    for (i = unitId; i < 0x3F; ++i)
    {
        if (TrySetCursorOn(i))
        {
            return;
        }
    }

    for (i = 1; i <= unitId; ++i)
    {
        if (TrySetCursorOn(i))
        {
            return;
        }
    }

    return;
}

//! FE8U = 0x0801DBA4
void PlayerPhase_HandleAutoEnd(ProcPtr proc)
{
    if (!(gPlaySt.config.disableAutoEndTurns) && (GetPhaseAbleUnitCount(gPlaySt.faction) == 0))
    {
        Proc_Goto(proc, 3);
    }

    return;
}
