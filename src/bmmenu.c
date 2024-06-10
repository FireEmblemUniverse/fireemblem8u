#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmenu.h"
#include "playerphase.h"
#include "uichapterstatus.h"
#include "uiselecttarget.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "icon.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmidoten.h"
#include "uiutils.h"
#include "bksel.h"
#include "bmbattle.h"
#include "bmdifficulty.h"
#include "bmitemuse.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "bmtrick.h"
#include "mu.h"
#include "bmarch.h"
#include "event.h"
#include "bb.h"
#include "bmarena.h"
#include "face.h"
#include "uiconfig.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "prepscreen.h"
#include "bmguide.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "unitlistscreen.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/items.h"

extern u16 gUnknown_085A0D4C[];

extern u8 gSummonConfig[4][2];

struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[] = {
    PROC_CALL(LockGame),

    PROC_CALL(BackToUnitMenu_CamWatch),
    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_CALL(BackToUnitMenu_RestartMenu),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_0859B630[] = {
    PROC_CALL(LockGame),

    PROC_CALL(sub_8022E38),

    PROC_WHILE_EXISTS(gProcScr_BKSEL),
    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_CALL(sub_8022E54),

    PROC_CALL(UnlockGame),

    PROC_END,
};

u8 sub_80225AC(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_IsSuspendCommandAvailable(const struct MenuItemDef* def, int number) {

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;
}

u8 MapMenu_SuspendCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x864); // TODO: msgid "You cannot stop in the[NL]middle of the tutorial.[.]"
        return MENU_ACT_SND6B;
    }

    sub_80B5D3C();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 CommandEffectEndPlayerPhase(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_EndEach(gProcScr_PlayerPhase);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_UnitCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_Goto(Proc_Find(gProcScr_PlayerPhase), 10);
    StartUnitListScreenField();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_OptionsCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_Start(gProcScr_Config1, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_802263C(void) {
    if (GetBattleMapKind() == 1) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 MapMenu_StatusCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    NewChapterStatusScreen(NULL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_IsGuideCommandAvailable(const struct MenuItemDef* def, int number) {
    if (IsGuideLocked()) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

int MapMenu_GuideCommandDraw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (!BmGuideTextShowGreenOrNormal()) {
        Text_SetColor(&menuItem->text, 4);
    }

    if (menuItem->availability == MENU_DISABLED) {
        Text_SetColor(&menuItem->text, 1);
    }

    Text_DrawString(&menuItem->text, GetStringFromIndex(menuItem->def->nameMsgId));

    PutText(&menuItem->text, BG_GetMapBuffer(menu->frontBg) + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    // return 0; // BUG?
}

u8 MapMenu_GuideCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_Start(ProcScr_E_Guide1, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_DangerZone_UnusedEffect(void) {
    gActiveUnit = NULL;
    gBmSt.swapActionRangeCount = 0;
    Proc_Goto(Proc_Find(gProcScr_PlayerPhase), 0xC);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_8022724(void) {

    Make6C_SaveMenuPostChapter(PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_8022734(void) {
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 EffectWait(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_WAIT;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GenericSelection_BackToUM(ProcPtr proc, struct SelectTarget * target) {
    EndTargetSelection(proc);

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ResetTextFont();

    HideMoveRangeGraphics();

    EnsureCameraOntoPosition(
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22),
        gActiveUnit->xPos,
        gActiveUnit->yPos
    );

    return MENU_ACT_SKIPCURSOR | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

void BackToUnitMenu_CamWatch(ProcPtr proc) {

    if (IsCameraNotWatchingPosition(gActiveUnit->xPos, gActiveUnit->yPos)) {

        int y = gActiveUnit->yPos;

        Proc_EndEach(gProcScr_CamMove);

        if (GetCameraAdjustedY(y << 4) > gBmSt.cameraMax.y) {
            y = (gBmSt.cameraMax.y >> 4) + 2;
        }

        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, y);
    }

    return;
}

void BackToUnitMenu_RestartMenu(void) {
    StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22);

    return;
}

u8 GenericSelection_BackToUM_CamWait(ProcPtr proc, struct SelectTarget * target) {

    EndTargetSelection(proc);

    BG_Fill(gBG2TilemapBuffer,0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    HideMoveRangeGraphics();

    ResetTextFont();

    Proc_Start(gProcScr_BackToUnitMenu, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

u8 ItemMenu_ButtonBPressed(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ResetTextFont();

    StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22);

    HideMoveRangeGraphics();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

u8 RescueSelection_OnHelp(ProcPtr proc, struct SelectTarget * target) {
    return 0;
}

u8 RescueUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & (US_IN_BALLISTA | US_RESCUING)) {
        return MENU_NOTSHOWN;
    }

    MakeRescueTargetList(gActiveUnit);

    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 RescueEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    MakeRescueTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Rescue);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 RescueSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.targetIndex = target->uid;
    gActionData.unitActionType = UNIT_ACTION_RESCUE;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DropUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (!(gActiveUnit->state & US_RESCUING)) {
        return MENU_NOTSHOWN;
    }

    MakeDropTargetList(gActiveUnit);

    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 DropEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    MakeDropTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Drop);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DropSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_DROP;
    gActionData.targetIndex = gActiveUnit->rescue;
    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 TakeUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gBmSt.taken_action & BM_TAKEN_ACTION_TAKE) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_RESCUING) {
        return MENU_NOTSHOWN;
    }

    MakeTakeTargetList(gActiveUnit);

    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 TakeEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    MakeTakeTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Take);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 GiveUsability(const struct MenuItemDef* def, int number) {
    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gBmSt.taken_action & BM_TAKEN_ACTION_TAKE) {
        return MENU_NOTSHOWN;
    }

    if (!(gActiveUnit->state & US_RESCUING)) {
        return MENU_NOTSHOWN;
    }

    MakeGiveTargetList(gActiveUnit);

    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 GiveEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    MakeGiveTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Give);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

void MakeUnitRescueTransferGraphics(struct Unit* from, struct Unit* to) {
    struct Unit* rescue = GetUnit(from->rescue);

    EndSubtitleHelp();

    Make6CKOIDOAMM(rescue, GetSomeFacingDirection(to->xPos, to->yPos, from->xPos, from->yPos));

    return;
}

u8 TakeSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_TAKE;
    gActionData.targetIndex = target->uid;

    UnitFinalizeMovement(GetUnit(gActionData.targetIndex));

    MakeUnitRescueTransferGraphics(GetUnit(gActionData.targetIndex), GetUnit(gActionData.subjectIndex));

    UnitGive(GetUnit(gActionData.targetIndex), GetUnit(gActionData.subjectIndex));

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GiveSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_GIVE;
    gActionData.targetIndex = target->uid;

    UnitFinalizeMovement(GetUnit(gActionData.subjectIndex));

    MakeUnitRescueTransferGraphics(GetUnit(gActionData.subjectIndex), GetUnit(gActionData.targetIndex));

    UnitGive(GetUnit(gActionData.subjectIndex), GetUnit(gActionData.targetIndex));

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 UnitActionMenu_Attack(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x858); // TODO: msgid "There's no more ammo for[NL]the ballista.[.]"
        return MENU_ACT_SND6B;
    }

    ResetIconGraphics();

    LoadIconPalettes(4);

    if (gActiveUnit->state & US_IN_BALLISTA) {
        return StartUnitBallistaSelect(menu, menuItem);
    }

    return StartUnitWeaponSelect(menu, menuItem);
}

u8 StartUnitBallistaSelect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    ProcPtr proc = StartOrphanMenu(&gBallistaRangeMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
    SetFaceBlinkControlById(0, 5);

    ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 StartUnitWeaponSelect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    ProcPtr proc = StartOrphanMenu(&gUnknownMenuDef);

    if (gActiveUnit->pClassData->number != CLASS_PHANTOM) {
        StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
        SetFaceBlinkControlById(0, 5);
    }

    ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

    sub_80832C4();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int DisplayUnitStandingAttackRange(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    if (gActiveUnit->state & US_IN_BALLISTA) {
        MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, 1, 10);
    } else {
        int reach = GetUnitWeaponReachBits(gActiveUnit, -1);
        GenerateUnitStandingReachRange(gActiveUnit, reach);
    }

    DisplayMoveRangeGraphics(3);

    return 0;
}

int HideMoveRangeGraphicsWrapper(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    HideMoveRangeGraphics();
    return 0;
}

u8 UnknownMenu_IsAvailable(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[number];

    if (!(GetItemAttributes(item) & IA_WEAPON)) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitUseWeapon(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForWeapon(gActiveUnit, item);

    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 UnknownMenu_Selected(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    EquipUnitItemSlot(gActiveUnit, menuItem->itemNumber);
    gActionData.itemSlotIndex = 0;

    ClearBg0Bg1();

    MakeTargetListForWeapon(gActiveUnit, gActiveUnit->items[0]);

    NewTargetSelection(&gSelectInfo_Attack);

    sub_80832C8();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;
}

int UnknownMenu_Draw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int item = gActiveUnit->items[menuItem->itemNumber];

    s8 isUsable = CanUnitUseWeapon(gActiveUnit, item);

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isUsable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile)
    );

    return 0;
}

int UnknownMenu_SwitchIn(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    int reach;

    UpdateMenuItemPanel(menuItem->itemNumber);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    reach = GetUnitWeaponReachBits(gActiveUnit, menuItem->itemNumber);
    GenerateUnitStandingReachRange(gActiveUnit, reach);

    DisplayMoveRangeGraphics(2);

    return 0;
}

int BallistaRangeMenu_SwitchOut(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (!(menu->state & US_DEAD)) {
        HideMoveRangeGraphics();
    }

    return 0;
}

u8 AttackMapSelect_Select(ProcPtr proc, struct SelectTarget* target) {

    if (EventEngineExists() == 1) {
        return 0;
    }

    gActionData.unitActionType = UNIT_ACTION_COMBAT;
    gActionData.targetIndex = target->uid;

    if (target->uid == 0) {
        gActionData.xOther = target->x;
        gActionData.yOther = target->y;
        gActionData.trapType = target->extra;
    }

    Proc_EndEach(gProcScr_BKSEL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;

}

void sub_8022E38(void) {
    EnsureCameraOntoPosition(NULL, gActiveUnit->xPos, gActiveUnit->yPos);

    return;
}

void sub_8022E54(void) {
    UnitActionMenu_Attack(NULL, NULL);

    return;
}

u8 AttackMapSelect_Cancel(ProcPtr proc, struct SelectTarget * target) {
    if (EventEngineExists() == 1) {
        return 0;
    }

    Proc_Start(gProcScr_0859B630, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 AttackMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target) {

    struct Unit* unit = GetUnit(target->uid);

    ChangeActiveUnitFacing(target->x, target->y);

    if (target->uid == 0) {
        gActionData.xOther = target->x;
        gActionData.yOther = target->y;
        gActionData.trapType = target->extra;

        InitObstacleBattleUnit();
    }

    if (gActionData.itemSlotIndex == BU_ISLOT_BALLISTA) {
        BattleGenerateBallistaSimulation(gActiveUnit, unit, gActiveUnit->xPos, gActiveUnit->yPos);
    } else {
        BattleGenerateSimulation(gActiveUnit, unit, -1, -1, gActionData.itemSlotIndex);
    }

    UpdateBattleForecastContents();

    return 0;
}

int AttackMapSelect_End(ProcPtr proc) {

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    HideMoveRangeGraphics();
    CloseBattleForecast();

    return 0;
}

u8 ItemSubMenu_IsTradeAvailable(const struct MenuItemDef* def, int number) {
    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gBmSt.taken_action & BM_TAKEN_ACTION_TRADE) {
        return MENU_NOTSHOWN;
    }

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_SUPPLY) {
        return MENU_NOTSHOWN;
    }

    MakeTradeTargetList(gActiveUnit);

    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 TradeCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    ClearBg0Bg1();

    MakeTradeTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Trade);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 TradeSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_TRADED_1D;

    StartTradeMenu(gActiveUnit, GetUnit(target->uid), 0);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 UnitActionMenu_CanSeize(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitSeize(gActiveUnit)) {
        return MENU_NOTSHOWN;
    }

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_SEIZE
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 UnitActionMenu_Seize(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    gActionData.unitActionType = UNIT_ACTION_SEIZE;
    gActiveUnit->state |= US_HAS_MOVED;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 VisitCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    switch (gBmMapTerrain[gActiveUnit->yPos][gActiveUnit->xPos]) {
        default:
            return MENU_NOTSHOWN;
        case TERRIAN_HOUSE:
        case TERRAIN_INN:
        case TERRAIN_RUINS_37:
        case TERRAIN_VILLAGE_03:
            break;
    }

    if (GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_VISIT) {
        if (IsUnitMagicSealed(gActiveUnit)) {
            return MENU_DISABLED;
        }

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

u8 VisitCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x84C); // TODO: msgid "You can't visit villages or[.][NL]houses while Silenced."
        return MENU_ACT_SND6B;
    }

    gActionData.unitActionType = UNIT_ACTION_VISIT;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;

}

u8 sub_80230F0(const struct MenuItemDef* def) {
    int i;

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForRefresh(gActiveUnit);

    if (GetSelectTargetCount() != 0) {
        return MENU_ENABLED;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (GetItemType(item) != ITYPE_12) {
            continue;
        }

        if (!CanUnitUseItem(gActiveUnit, item)) {
            continue;
        }

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

u8 PlayCommandUsability(const struct MenuItemDef* def, int number) {

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_PLAY)) {
        return MENU_NOTSHOWN;
    }

    gBmSt.um_tmp_item = ITEM_UNK_CD;

    return sub_80230F0(def);
}

u8 DanceCommandUsability(const struct MenuItemDef* def, int number) {

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_DANCE)) {
        return MENU_NOTSHOWN;
    }

    gBmSt.um_tmp_item = ITEM_DANCE;

    return sub_80230F0(def);
}

u8 PlayCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    s8 hasTargets;
    int i;

    s8 itemUsable = 0;

    MakeTargetListForRefresh(gActiveUnit);

    hasTargets = 0;
    if (GetSelectTargetCount() != 0) {
        hasTargets = 1;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (GetItemType(item) != ITYPE_12) {
            continue;
        }

        if (!CanUnitUseItem(gActiveUnit, item)) {
            continue;
        }

        itemUsable = 1;
    }

    if (hasTargets && !itemUsable) {
        return ItemMenu_Select1stCommand(menu, menuItem);
    } else {
        ProcPtr proc = StartOrphanMenu(&gItemMenuDef);

        StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
        SetFaceBlinkControlById(0, 5);
        ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

        ResetIconGraphics();
        LoadIconPalettes(4);

        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
    }

}

u8 RefreshMapSelect_Select(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_DANCE;
    gActionData.targetIndex = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ItemCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->items[0] == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 ItemCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    ProcPtr proc;

    if (menuItem->availability != MENU_ENABLED) {
        return 0;
    }

    ResetIconGraphics();
    LoadIconPalettes(4);

    ResetTextFont();

    proc = StartOrphanMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int ItemSelectMenu_TextDraw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    s8 isUsable;

    int item = gActiveUnit->items[menuItem->itemNumber];

    if (GetItemAttributes(item) & IA_WEAPON) {
        UnknownMenu_Draw(menu, menuItem);
        return 0;
    }

    if (GetItemType(item) == ITYPE_12) {
        isUsable = 0;
    } else {
        isUsable = CanUnitUseItem(gActiveUnit, item);
    }

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isUsable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile)
    );

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    //return 0; BUG?
}

u8 ItemSelectMenu_Usability(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[number];

    if (item == 0) {
        return MENU_NOTSHOWN;
    }

    if (GetItemAttributes(item) & IA_WEAPON) {
        UnknownMenu_IsAvailable(def, number);
    }

    return CanUnitUseItem(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ItemSelectMenu_Effect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    struct MenuRect rect;

    gActionData.itemSlotIndex = menuItem->itemNumber;

    rect.x = menuItem->xTile + 9;
    rect.y = menuItem->yTile - 1;
    rect.w = 7;
    rect.h = 0;

    sub_80234AC(rect.x, rect.y);

    StartMenuAt(&gItemSubMenuDef, rect, (struct Proc*)menu);

    return MENU_ACT_SND6A;
}

int Menu_SwitchIn(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    UpdateMenuItemPanel(menuItem->itemNumber);

    // return 0; // BUG?
}

int Menu_SwitchOut_DoNothing(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    // return 0; // BUG?
}

void sub_80234AC(int x, int y) {
    InitTextFont(&gUnknown_02002774, (void*)VRAM + 0x4000, 0x200, 0);

    TileMap_CopyRect(gBG0TilemapBuffer + 0x2B, gUiTmScratchA, 9, 19);
    TileMap_CopyRect(gBG1TilemapBuffer + 0x2B, gUiTmScratchB, 9, 19);

    return;
}

void ItemSubMenuEnd(struct MenuProc* menu) {
    SetTextFont(0);

    return;
}

u8 MenuCommand_SelectNo(struct MenuProc* menu/*, struct MenuItemProc* menuItem*/) {
    SetTextFont(NULL);

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + 0x2B, 9, 19);
    TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + 0x2B, 9, 19);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 sub_8023538(struct MenuProc* menu) {
    SetTextFont(NULL);
    ResetTextFont();

    EndAllMenus();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

u8 sub_8023550(struct MenuProc* menu) {
    ProcPtr proc;

    sub_8023538(menu);
    // This is really caused by implicit declaration
    MenuCommand_SelectNo(menu);

    proc = StartOrphanMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);
    ForceMenuItemPanel(proc, gActiveUnit, 15, 11);

    return MENU_ENABLED;
}

u8 sub_80235A8(struct MenuProc* menu) {

    ProcPtr proc;

    sub_8023538(menu);

    if (GetUnitItemCount(gActiveUnit) == 0) {
        ClearBg0Bg1();

        EndFaceById(0);

        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);

        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
    }

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + 0x2B, 9, 0x13);
    TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + 0x2B, 9, 0x13);

    TileMap_FillRect(gBG0TilemapBuffer + 0x2B - 0xA, 0xE, 0xC, 0);
    TileMap_FillRect(gBG1TilemapBuffer + 0x2B - 0xA, 0xD, 0xC, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc = StartOrphanMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR;
}

u8 ItemSubMenu_IsUseAvailable(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[gActionData.itemSlotIndex];

    if (GetItemUseEffect(item) == 0) {
        return MENU_NOTSHOWN;
    }

    if (GetItemType(item) == ITYPE_STAFF) {
        return MENU_NOTSHOWN;
    }

    if (GetItemType(item) == ITYPE_12) {
        return MENU_NOTSHOWN;
    }

    if ((GetItemAttributes(item) & IA_WEAPON) && !CanUnitUseWeapon(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    return CanUnitUseItem(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ItemSubMenu_IsEquipAvailable(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[gActionData.itemSlotIndex];

    if (!(GetItemAttributes(item) & IA_WEAPON)) {
        return MENU_NOTSHOWN;
    }

    return CanUnitUseWeapon(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ItemSubMenu_IsDiscardAvailable(const struct MenuItemDef* def, int number) {
    if (GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) & IA_UNSELLABLE) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;

}

u8 ItemSubMenu_UseItem(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, GetItemCantUseMsgid(gActiveUnit, gActiveUnit->items[gActionData.itemSlotIndex]));
        return MENU_ACT_SND6B;
    }

    ClearBg0Bg1();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionData.itemSlotIndex]);

    PlaySoundEffect(0x6A);

    SetTextFont(NULL);

    ResetTextFont();

    EndAllMenus();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_ENDFACE;
}

u8 ItemSubMenu_EquipItem(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x84D); // TODO: msgid "You can't equip[.][NL]this weapon."
        return MENU_ACT_SND6B;
    }

    EquipUnitItemSlot(gActiveUnit, gActionData.itemSlotIndex);

    return sub_8023550(menu);
}

u8 ItemSubMenu_TradeItem(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gBmSt.unk3F = gActionData.itemSlotIndex;

    sub_8023538(menu);

    EndFaceById(0);

    TradeCommandEffect(menu, menuItem);

    return MENU_ENABLED;
}

u8 ItemSubMenu_DiscardItem(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    struct MenuProc* proc;
    struct MenuRect rect;

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x84F); // TODO: msgid "Treasure can't be dropped."
        return MENU_ACT_SND6B;
    }

    rect.x = menuItem->xTile + 3;
    rect.y = menuItem->yTile;
    rect.w = 5;
    rect.h = 0;

    proc = StartMenuAt(&gYesNoSelectionMenuDef, rect, (struct Proc*)menu);

    proc->itemCurrent = 1;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;

}

u8 MenuCommand_SelectYes(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    UnitRemoveItem(gActiveUnit, gActionData.itemSlotIndex);

    if (gActionData.itemSlotIndex != 0) {
        BG_Fill(gBG0TilemapBuffer, 0);
    }

    sub_80235A8(menu);

    return MENU_ACT_SKIPCURSOR;
}

u8 BallistaRangeMenu_BallistaUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos) & 0xFF00) {
        return MENU_ENABLED;
    }

    return MENU_DISABLED;

}

int BallistaRangeMenu_Draw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    s8 isAvailable = menuItem->availability == 1;
    int item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isAvailable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile)
    );

    // return 0; // BUG?
}

u8 BallistaRangeMenu_Select(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    ClearBg0Bg1();

    gActionData.itemSlotIndex = BU_ISLOT_BALLISTA;

    FillBallistaRangeMaybe(gActiveUnit);

    NewTargetSelection(&gSelectInfo_Attack);

    return MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;
}

int FillBallistaRange(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int item;

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    SetWorkingBmMap(gBmMapRange);

    item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    UpdateMenuItemPanel(item);

    MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, GetItemMinRange(item), GetItemMaxRange(item));

    DisplayMoveRangeGraphics(2);

    return 0;
}

u8 StaffCommandUsability(const struct MenuItemDef* def, int number) {
    int i;

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (GetItemType(item) != ITYPE_STAFF) {
            continue;
        }

        if (!CanUnitUseItem(gActiveUnit, item)) {
            continue;
        }

        if (IsUnitMagicSealed(gActiveUnit)) {
            return MENU_DISABLED;
        } else {
            return MENU_ENABLED;
        }
    }

    return MENU_NOTSHOWN;
}

u8 StaffCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    ProcPtr proc;

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x851); // TODO: msgid "You can't use a staff[.][NL]while Silenced.[.]"
        return MENU_ACT_SND6B;
    }

    ResetIconGraphics();

    LoadIconPalettes(4);

    proc = StartOrphanMenu(&gStaffItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int StaffCommandRange(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int reach = GetUnitItemUseReachBits(gActiveUnit, -1);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    GenerateUnitStandingReachRange(gActiveUnit, reach);

    DisplayMoveRangeGraphics(5);

    return 0;
}

int HideMoveRangeGraphicsWrapper2(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    HideMoveRangeGraphics();

    return 0;
}

u8 StaffItemSelect_Usability(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[number];

    if (GetItemType(item) != ITYPE_STAFF) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitUseItem(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;

}

u8 StaffItemSelect_Effect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    EquipUnitItemSlot(gActiveUnit, menuItem->itemNumber);

    gActionData.itemSlotIndex = 0;

    ClearBg0Bg1();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionData.itemSlotIndex]);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

int StaffItemSelect_TextDraw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    return ItemSelectMenu_TextDraw(menu, menuItem);
}

int StaffItemSelect_OnHover(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int reach = GetUnitItemUseReachBits(gActiveUnit, menuItem->itemNumber);

    UpdateMenuItemPanel(menuItem->itemNumber);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    GenerateUnitStandingReachRange(gActiveUnit, reach);

    DisplayMoveRangeGraphics(4);

    return 0;
}

int StaffItemSelect_SwitchOut(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (!(menu->state & US_DEAD)) {
        HideMoveRangeGraphics();
    }

    return 0;
}

u8 TalkCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    MakeTalkTargetList(gActiveUnit);
    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->statusIndex == UNIT_STATUS_SILENCED) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;
}

u8 TalkCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x852); // TODO: msgid "You can't speak[.][NL]while Silenced.[.]"
        return MENU_ACT_SND6B;
    }

    MakeTalkTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Talk);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 TalkSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_TALK;
    gActionData.targetIndex = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 SupportCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForSupport(gActiveUnit);
    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    MakeTalkTargetList(gActiveUnit);
    if (GetSelectTargetCount() != 0) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->statusIndex == UNIT_STATUS_SILENCED) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;
}

u8 SupportCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x852); // TODO: msgid "You can't speak[.][NL]while Silenced.[.]"
        return MENU_ACT_SND6B;
    }

    MakeTargetListForSupport(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Support);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 SupportSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_SUPPORT;
    gActionData.targetIndex = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DoorCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_DOOR) < 0) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForDoorAndBridges(gActiveUnit, TERRAIN_DOOR);

    return GetSelectTargetCount() != 0
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 DoorCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_DOOR;

    gActionData.subjectIndex = gActiveUnit->index;

    gActionData.itemSlotIndex = GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_DOOR);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ChestCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_CHEST_21) < 0) {
        return MENU_NOTSHOWN;
    }

    return CanUnitUseChestKeyItem(gActiveUnit)
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 ChestCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_CHEST;
    gActionData.itemSlotIndex = GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_CHEST_21);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 PickCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->pClassData->number != CLASS_ROGUE) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForPick(gActiveUnit);

    return GetSelectTargetCount()
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 PickCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    MakeTargetListForPick(GetUnit(gActionData.subjectIndex));
    NewTargetSelection(&gSelectInfo_Pick);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}


u8 PickSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    gActionData.unitActionType = UNIT_ACTION_PICK;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

// clang-format off

const s8 gSupplyAdjacentPosLut[4][2] =
{
    { -1,  0, },
    {  0, -1, },
    { +1,  0, },
    {  0, +1, },
};

// clang-format on

//! FE8U = 0x08023EF0
bool IsAdjacentForSupply(u8 pid)
{
    int i;
    const s8 * iter;

    int xUnit = gActiveUnit->xPos;
    int yUnit = gActiveUnit->yPos;

    for (i = 0, iter = gSupplyAdjacentPosLut[i]; i < 4; iter += 2, i++)
    {
        struct Unit * unit;

        int x = xUnit + iter[0];
        int y = yUnit + iter[1];

        u8 other = gBmMapUnit[y][x];

        if (other & FACTION_RED)
        {
            continue;
        }

        unit = GetUnit(other);

        if (!unit)
        {
            continue;
        }

        if (unit->pCharacterData->number == pid)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08023F64
u8 SupplyUsability(const struct MenuItemDef * def, int number)
{
    int pid;

    if (!HasConvoyAccess())
    {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM)
    {
        return MENU_NOTSHOWN;
    }

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
            pid = CHARACTER_EIRIKA;
            break;

        case CHAPTER_MODE_EPHRAIM:
            pid = CHARACTER_EPHRAIM;
            break;

        default:
            pid = CHARACTER_EIRIKA;
            break;
    }

    if (gActiveUnit->pCharacterData->number == pid)
    {
        return MENU_ENABLED;
    }

    if (IsAdjacentForSupply(pid))
    {
        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

u8 SupplyCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_TRADED_1D;

    StartBmSupply(gActiveUnit, NULL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ArmoryCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_ARMORY
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 ArmoryCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    StartAvailableTileEvent(gActiveUnit->xPos, gActiveUnit->yPos);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 VendorCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_VENDOR
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 VendorCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    StartAvailableTileEvent(gActiveUnit->xPos, gActiveUnit->yPos);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 SecretShopCommandUsability(const struct MenuItemDef* def, int number) {
    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_SECRET
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 SecretShopCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    StartAvailableTileEvent(gActiveUnit->xPos, gActiveUnit->yPos);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ArenaCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gBmMapTerrain[gActiveUnit->yPos][gActiveUnit->xPos] != TERRAIN_ARENA_08) {
        return MENU_NOTSHOWN;
    }

    return ArenaIsUnitAllowed(gActiveUnit)
        ? MENU_ENABLED : MENU_DISABLED;
}

u8 ArenaCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (menuItem->availability == MENU_DISABLED) {
        if (IsUnitMagicSealed(gActiveUnit)) {
            MenuFrozenHelpBox(menu, 0x853); // TODO: msgid "You can't enter the[.][NL]arena while Silenced.[.]"
        } else {
            MenuFrozenHelpBox(menu, 0x854); // TODO: msgid "You can't fight, so you[.][NL]can't enter the arena."
        }

        return MENU_ACT_SND6B;
    }

    StartArenaScreen();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;

}

u8 StealCommandUsability(const struct MenuItemDef* def, int number) {
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL)) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForSteal(gActiveUnit);
    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    if (GetUnitItemCount(gActiveUnit) == UNIT_ITEM_COUNT) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;
}

u8 StealCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x862); // TODO msgid "Your inventory is full.[.]"
        return MENU_ACT_SND6B;
    }

    ClearBg0Bg1();

    MakeTargetListForSteal(gActiveUnit);

    NewTargetSelection(&gSelectInfo_Steal);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

void StealMapSelect_Init(ProcPtr menu) {
    StartUnitInventoryInfoWindow(menu);
    StartSubtitleHelp(menu, GetStringFromIndex(0x86D)); // TODO: msgid "Select which unit to steal from."

    return;
}

u8 StealMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitStealInventoryInfoWindow(GetUnit(target->uid));

    // return 0; // BUG?
}

u8 StealMapSelect_Select(ProcPtr proc, struct SelectTarget* target) {
    int pos;

    gActionData.targetIndex = target->uid;

    ResetIconGraphics();
    LoadIconPalettes(4);

    StartOrphanMenu(&gStealItemMenuDef);

    EndTargetSelection(proc);

    CallARM_FillTileRect(gBG1TilemapBuffer + 0x42, gUnknown_085A0D4C, 0x1000);

    pos = (56 - GetStringTextLen(GetStringFromIndex(GetUnit(gActionData.targetIndex)->pCharacterData->nameTextId))) / 2;

    PutDrawText(0, gBG0TilemapBuffer + 0x63, 0, pos, 7, GetStringFromIndex(GetUnit(gActionData.targetIndex)->pCharacterData->nameTextId));

    PutFace80x72_Core(gBG0TilemapBuffer + 0x63 + 0x40, GetUnitPortraitId(GetUnit(gActionData.targetIndex)), 0x200, 5);

    return 0;
}

u8 StealItemMenuCommand_Usability(const struct MenuItemDef* def, int number) {
    if (GetUnit(gActionData.targetIndex)->items[number] == 0) {
        return MENU_NOTSHOWN;
    }

    if (!IsItemStealable(GetUnit(gActionData.targetIndex)->items[number])) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;
}

int StealItemMenuCommand_Draw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];
    s8 isStealable = IsItemStealable(item);

    DrawItemMenuLine(&menuItem->text, item, isStealable, gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    // return;
}

u8 StealItemMenuCommand_Effect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x855); // TODO: msgid "Weapons, magic, and[.][NL]staves can't be stolen.[.]"
        return MENU_ACT_SND6B;
    }

    gActionData.itemSlotIndex = menuItem->itemNumber;
    gActionData.unitActionType = UNIT_ACTION_STEAL;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 SummonCommandUsability(const struct MenuItemDef* def, int number) {
    u16 a;
    s16 summonerId;
    int i;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_SUMMON)) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForSummon(gActiveUnit);
    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    summonerId = -1;

    for (a = 0; a < 3; a++) {

        if (gActiveUnit->pCharacterData->number == gSummonConfig[a][0]) {
            summonerId = a;
            break;
        }
    }

    if (summonerId == -1) {
        return MENU_NOTSHOWN;
    }

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->pCharacterData->number != gSummonConfig[summonerId][1]) {
            continue;
        }

        if (unit->state & US_UNAVAILABLE) {
            unit->state &= ~(US_UNAVAILABLE);
            return MENU_ENABLED;
        }

        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 SummonCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    MakeTargetListForSummon(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Summon);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 SummonSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    GetUnit(gActionData.subjectIndex);

    gActionData.unitActionType = UNIT_ACTION_SUMMON;
    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 YobimaCommandUsability(const struct MenuItemDef* def, int number) {

    u16 count;
    int i;

    if (gActiveUnit->pClassData->number != CLASS_DEMON_KING) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (count > 0x27) {
            return MENU_NOTSHOWN;
        }

        count++;
    }

    return MENU_ENABLED;
}

u8 YobimaCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    GetUnit(gActionData.subjectIndex);

    gActionData.unitActionType = UNIT_ACTION_SUMMON_DK;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 sub_8024564(ProcPtr proc, struct SelectTarget* target) {

    GetUnit(gActionData.subjectIndex);

    gActionData.unitActionType = UNIT_ACTION_SUMMON_DK;

    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ConvoyMenu_HelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->itemNumber >= 5) {
        StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, gBmSt.um_tmp_item);
        return 0;
    }

    StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, gActiveUnit->items[menuItem->itemNumber]);

    // return 0; // BUG?
}

u8 ItemMenu_HelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    struct Unit* unit = GetUnit(gActionData.targetIndex);

    StartItemHelpBox(menuItem->xTile * 8, menuItem->yTile << 3,
    unit->items[menuItem->itemNumber]);

    //return 0; // BUG?
}

u8 BallistaRangeMenuHelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int x = menuItem->xTile << 3;
    int y = menuItem->yTile << 3;

    int item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    StartItemHelpBox(x, y, item);

    // return 0; // BUG?
}

void HealMapSelect_Init(ProcPtr proc) {
    StartUnitHpInfoWindow(proc);

    return;
}

u8 HealMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target) {

    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitHpInfoWindow(GetUnit(target->uid));

    // return 0; // BUG?
}

void RescueSelection_OnConstruction(ProcPtr proc) {
    RefreshUnitTakeRescueInfoWindows(proc);
    StartSubtitleHelp(proc, GetStringFromIndex(0x868)); // TODO: msgid "Select a unit to rescue."

    return;
}

u8 RescueSelection_OnChange(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitRescueInfoWindows(GetUnit(target->uid));

    // return 0; // BUG?
}

void DropSelection_OnConstruction(ProcPtr menu) {
    StartSubtitleHelp(menu, GetStringFromIndex(0x869)); // TODO: msgid "Select which space to drop the unit into.[.]"

    return;
}

void sub_80246DC(void) {
    return;
}

void GiveSelection_OnInit(ProcPtr menu) {
    StartUnitGiveInfoWindows(menu);

    StartSubtitleHelp(menu, GetStringFromIndex(0x86B)); // TODO: msgid "Select a unit to give the traveler to."
    return;
}

u8 GiveSelection_OnChange(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitGiveInfoWindows(GetUnit(target->uid));

    // return 0; // BUG?
}

void TakeSelection_OnInit(ProcPtr menu) {
    RefreshUnitTakeRescueInfoWindows(menu);

    StartSubtitleHelp(menu, GetStringFromIndex(0x86A)); // TODO: msgid "Select a unit to receive the traveler."

    return;
}

u8 TakeSelection_OnChange(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitTakeInfoWindows(GetUnit(target->uid));

    // return 0; // BUG?
}

void TradeTargetSelection_OnInit(ProcPtr menu) {
    StartUnitInventoryInfoWindow(menu);
    StartSubtitleHelp(menu, GetStringFromIndex(0x86C)); // TODO: msgid "Select which unit to trade with."

    return;
}

u8 TradeSelection_OnChange(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);
    ResetIconGraphics();
    RefreshUnitInventoryInfoWindow(GetUnit(target->uid));

    // return 0; // BUG?
}

void TalkSupportSelection_OnInit(ProcPtr menu) {
    StartUnitHpInfoWindow(menu);
    StartSubtitleHelp(menu, GetStringFromIndex(0x86F)); // TODO: msgid "Select which unit to speak to."

    return;
}

u8 TalkSupportSelection_OnChange(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpInfoWindow(GetUnit(target->uid));

    // return 0; // BUG?
}

void RefreshMapSelect_Init(ProcPtr menu) {
    StartUnitHpInfoWindow(menu);
    StartSubtitleHelp(menu, GetStringFromIndex(0x870)); // TODO: msgid "Select unit to refresh.[.]"

    return;
}

u8 RefreshMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpInfoWindow(GetUnit(target->uid));

    // return 0; // BUG?
}

void WarpUnitMapSelect_Init(ProcPtr menu) {

    StartUnitHpInfoWindow(menu);

    return;
}

u8 WarpUnitMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target) {
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpInfoWindow(GetUnit(target->uid));

    // return 0; // BUG?
}

void SummonSelection_OnInit(ProcPtr menu) {

    StartSubtitleHelp(menu, GetStringFromIndex(0x880)); // TODO: msgid "Select which space to summon into."
    return;
}

u8 SummonSelection_OnChange(ProcPtr proc, struct SelectTarget * target) {
}

void sub_8024888(ProcPtr menu) {
    StartSubtitleHelp(menu, GetStringFromIndex(0x880)); // TODO: msgid "Select which space to summon into."

    return;
}

void sub_80248A4(void) {
    return;
}

void PickSelection_OnInit(ProcPtr menu) {

    StartSubtitleHelp(menu, GetStringFromIndex(0x881)); // TODO: msgid "Select which space to use picks on.[.]"

    return;
}

u8 RideCommandUsability(const struct MenuItemDef* def, int number) {
    struct Trap* trap;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE)) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & (US_RESCUING | US_RESCUED | US_IN_BALLISTA)) {
        return MENU_NOTSHOWN;
    }

    if (gBmSt.taken_action & BM_TAKEN_ACTION_BALLISTA) {
        return MENU_NOTSHOWN;
    }

    trap = GetTrapAt(gActiveUnit->xPos, gActiveUnit->yPos);

    if (trap == 0) {
        return MENU_NOTSHOWN;
    }

    if (trap->type != 1) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 RideCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_RIDE_BALLISTA;
    RideBallista(gActiveUnit);

    MU_EndAll();
    MU_Create(gActiveUnit);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ExitCommandUsability(const struct MenuItemDef* def, int number) {
    if (!(gActiveUnit->state & US_IN_BALLISTA)) {
        return MENU_NOTSHOWN;
    }

    if (gBmSt.taken_action & BM_TAKEN_ACTION_BALLISTA) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 ExitCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_EXIT_BALLISTA;
    TryRemoveUnitFromBallista(gActiveUnit);

    MU_EndAll();
    MU_Create(gActiveUnit);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 AttackCommandUsability(const struct MenuItemDef* def, int number) {
    int i;

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_IN_BALLISTA) {
        return MENU_NOTSHOWN;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (!(GetItemAttributes(item) & IA_WEAPON)) {
            continue;
        }

        if (!CanUnitUseWeaponNow(gActiveUnit, item)) {
            continue;
        }

        MakeTargetListForWeapon(gActiveUnit, item);
        if (GetSelectTargetCount() == 0) {
            continue;
        }

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;

}

u8 AttackBallistaCommandUsability(const struct MenuItemDef* def, int number) {
    int isBallista;
    struct Trap* trap;

    if (!(gActiveUnit->state & US_IN_BALLISTA)) {
        return MENU_NOTSHOWN;
    }

    trap = GetTrapAt(gActiveUnit->xPos, gActiveUnit->yPos);

    // This is really caused by implicit declaration
    isBallista = ((s32 (*)(struct Trap*))IsBallista)(trap); // TODO: FIXME: UB

    if (isBallista == 0) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForWeapon(gActiveUnit, trap->extra + 0x100);
    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    if (GetBallistaItemUses(trap) == 0) {
        return MENU_DISABLED;
    }

    return MENU_ENABLED;
}

u8 ItemMenu_Is1stCommandAvailable(const struct MenuItemDef* def, int number) {

    MakeTargetListForRefresh(gActiveUnit);
    if (GetSelectTargetCount() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

int ItemMenu_Draw1stCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Text_InsertDrawString(&menuItem->text, 16, 0, GetItemName(gBmSt.um_tmp_item));
    PutText(&menuItem->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    return 0;
}

u8 ItemMenu_Select1stCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (menuItem->availability == MENU_DISABLED) {
        return MENU_ACT_SND6B;
    }

    MakeTargetListForRefresh(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Dance);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;

}

u8 ItemMenu_AreOtherCommandsAvailable(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[number - 1];

    if (GetItemType(item) != ITYPE_12) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitUseItem(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

int ItemMenu_DrawOtherCommands(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    int item = gActiveUnit->items[menuItem->itemNumber - 1];

    DrawItemMenuLine(&menuItem->text, item, 1, gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    return 0;
}

u8 ItemMenu_SelectOtherCommands(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.itemSlotIndex = menuItem->itemNumber - 1;

    ClearBg0Bg1();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionData.itemSlotIndex]);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

int ItemMenu_SwitchIn(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->itemNumber == 0) {
        UpdateMenuItemPanel(BU_ISLOT_5);
    } else {
        UpdateMenuItemPanel(menuItem->itemNumber - 1);
    }

    // return 0; // BUG?
}

int ItemMenu_SwitchOut_DoNothing(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    // return;
}

u8 ItemMenuHelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int item;

    if (menuItem->itemNumber == 0) {
        item = gBmSt.um_tmp_item;
    } else {
        item = gActiveUnit->items[menuItem->itemNumber - 1];
    }

    StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, item);

    // return 0; // BUG?
}

u8 MapMenu_IsRecordsCommandAvailable(const struct MenuItemDef* def, int number) {
    u8 chapterId;

    if (GetBattleMapKind() != 1) {
        return MENU_NOTSHOWN;
    }

    chapterId = gPlaySt.chapterIndex - 0x24;

    if (chapterId > 9) {
        return MENU_ENABLED;
    }

    if ((CheckFlag(0x71) == 0) ||
        (CheckFlag(0x72) == 0) ||
        (CheckFlag(0x73) == 0) ||
        (CheckFlag(0x74) == 0) ||
        (CheckFlag(0x75) == 0) ||
        (CheckFlag(0x76) == 0) ||
        (CheckFlag(0x77) == 0)) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 MapMenu_RecordsCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    StartDungeonRecordProcFromMenu(PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_IsRetreatCommandAvailable(const struct MenuItemDef* def, int number) {
    if (GetBattleMapKind() == 0) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

u8 MapMenu_RetreatCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    CallRetreatPromptEvent();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}
