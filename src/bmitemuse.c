
#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"

#include "bmitemuse.h"

extern struct Unit gStatGainSimUnit;

// clang-format off

struct ProcCmd CONST_DATA gProcScr_SquareSelectWarp[] =
{
    PROC_SET_END_CB(WarpSelect_OnEnd),

    PROC_CALL(LockGame),

    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_CALL(WarpSelect_OnInit),
    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_REPEAT(WarpSelect_OnIdle),

    PROC_CALL(WarpSelect_OnConfirm),
    PROC_SLEEP(0),

    PROC_CALL(UnlockGame),

    PROC_GOTO(100),

PROC_LABEL(99),
    PROC_CALL(WarpSelect_OnCancel),
    PROC_SLEEP(0),

    PROC_CALL(UnlockGame),

PROC_LABEL(100),
    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SquareSelectTorch[] =
{
    PROC_CALL(LockGame),

    PROC_CALL(TorchSelect_OnInit),
    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_REPEAT(TorchSelect_OnIdle),

    PROC_CALL(WarpSelect_OnConfirm),

    PROC_GOTO(100),

PROC_LABEL(99),
    PROC_CALL(WarpSelect_OnCancel),

PROC_LABEL(100),
    PROC_CALL(UnlockGame),

    PROC_END,
};

// clang-format on

s8 CanUnitUseItem(struct Unit* unit, int item)
{
    if ((GetItemAttributes(item) & IA_STAFF) && !CanUnitUseStaff(unit, item))
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        return HasSelectTarget(unit, MakeTargetListForAdjacentHeal);

    case ITEM_STAFF_PHYSIC:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_FORTIFY:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_RESTORE:
        return HasSelectTarget(unit, MakeTargetListForRestore);

    case ITEM_STAFF_RESCUE:
        return HasSelectTarget(unit, MakeTargetListForRescueStaff);

    case ITEM_STAFF_BARRIER:
        return HasSelectTarget(unit, MakeTargetListForBarrier);

    case ITEM_STAFF_SILENCE:
        return HasSelectTarget(unit, MakeTargetListForSilence);

    case ITEM_STAFF_SLEEP:
        return HasSelectTarget(unit, MakeTargetListForSleep);

    case ITEM_STAFF_BERSERK:
        return HasSelectTarget(unit, MakeTargetListForBerserk);

    case ITEM_STAFF_WARP:
        return HasSelectTarget(unit, MakeTargetListForWarp);

    case ITEM_STAFF_REPAIR:
        return HasSelectTarget(unit, MakeTargetListForHammerne);

    case ITEM_STAFF_UNLOCK:
        return HasSelectTarget(unit, MakeTargetListForUnlock);

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_HEAVENSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
        return CanUnitUsePromotionItem(unit, item);

    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_VULNERARY_2:
        return CanUnitUseHealItem(unit);

    case ITEM_PUREWATER:
        return CanUnitUsePureWaterItem(unit);

    case ITEM_TORCH:
        return CanUnitUseTorchItem(unit);

    case ITEM_ANTITOXIN:
        return CanUnitUseAntitoxinItem(unit);

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return CanUnitUseChestKeyItem(unit);

    case ITEM_DOORKEY:
        return CanUnitUseDoorKeyItem(unit);

    case ITEM_LOCKPICK:
        return CanUnitUseLockpickItem(unit);

    case ITEM_STAFF_LATONA:
        return HasSelectTarget(unit, MakeTargetListForLatona);

    case ITEM_MINE:
        return HasSelectTarget(unit, MakeTargetListForMine);

    case ITEM_LIGHTRUNE:
        return HasSelectTarget(unit, MakeTargetListForLightRune);

    case ITEM_STAFF_TORCH:
        return gPlaySt.chapterVisionRange != 0;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        return HasSelectTarget(unit, MakeTargetListForDanceRing);

    case ITEM_METISSTOME:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case ITEM_JUNAFRUIT:
        return CanUnitUseFruitItem(unit);

    default:
        return FALSE;

    }
}

int GetItemCantUseMsgid(struct Unit* unit, int item)
{
    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_TORCH:
    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_PUREWATER:
    case ITEM_ANTITOXIN:
    case ITEM_TORCH:
    case ITEM_VULNERARY_2:
        return 0x859; // TODO: msgid "There's no need for that."

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return 0x85E; // TODO: msgid "There's no chest."

    case ITEM_DOORKEY:
        return 0x85D; // TODO: msgid "There's no door."

    case ITEM_LOCKPICK:
        if (UNIT_CATTRIBUTES(gActiveUnit) & CA_THIEF)
            return 0x861; // TODO: msgid "No doors or chests."

        return 0x85F; // TODO: msgid "For thieves only."

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_HEAVENSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
    {
        int level = gActiveUnit->level;
        s8 boolval;

        gActiveUnit->level = 10;
        boolval = CanUnitUsePromotionItem(gActiveUnit, item);
        gActiveUnit->level = level;

        if (boolval)
            return 0x85B; // TODO: msgid "Must be above level 10."

        return 0x85A; // TODO: msgid "This can't be used."
    }

    case ITEM_JUNAFRUIT:
        return 0x85C; // TODO: msgid "Must be above level 10."

    default:
        return 0x85A; // TODO: msgid "This can't be used."

    }
}

void DoItemUse(struct Unit* unit, int item)
{
    ClearBg0Bg1();
    EndFaceById(0);

    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        DoUseHealStaff(unit, MakeTargetListForAdjacentHeal);
        break;

    case ITEM_STAFF_PHYSIC:
        DoUseHealStaff(unit, MakeTargetListForRangedHeal);
        break;

    case ITEM_STAFF_RESCUE:
        DoUseRescueStaff(unit, MakeTargetListForRescueStaff);
        break;

    case ITEM_STAFF_RESTORE:
        DoUseRestoreStaff(unit, MakeTargetListForRestore);
        break;

    case ITEM_STAFF_SILENCE:
        DoUseAttackStaff(unit, MakeTargetListForSilence);
        break;

    case ITEM_STAFF_SLEEP:
        DoUseAttackStaff(unit, MakeTargetListForSleep);
        break;

    case ITEM_STAFF_BERSERK:
        DoUseAttackStaff(unit, MakeTargetListForBerserk);
        break;

    case ITEM_STAFF_BARRIER:
        DoUseBarrierStaff(unit);
        break;

    case ITEM_STAFF_UNLOCK:
        DoUsePutTrap(unit, MakeTargetListForUnlock, 0x87A); // TODO: msgid "Select a door to open."
        break;

    case ITEM_STAFF_WARP:
        DoUseWarpStaff(unit);
        break;

    case ITEM_STAFF_REPAIR:
        DoUseRepairStaff(unit);
        break;

    case ITEM_STAFF_FORTIFY:
    case ITEM_STAFF_LATONA:
        SetStaffUseAction(unit);
        break;

    case ITEM_MINE:
        DoUsePutTrap(unit, MakeTargetListForMine, 0x87D); // TODO: msgid "Select an area to trap."
        break;

    case ITEM_LIGHTRUNE:
        DoUsePutTrap(unit, MakeTargetListForLightRune, 0x87E); // TODO: msgid "Select an area to trap."
        break;

    case ITEM_STAFF_TORCH:
        DoUseTorchStaff(unit);
        break;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        DoUseSpecialDance(unit, MakeTargetListForDanceRing, 0x87F); // TODO: msgid "Select a character to bless."
        break;

    default:
        SetItemUseAction(unit);
        break;

    }
}

s8 HasSelectTarget(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    return GetSelectTargetCount() != 0;
}

s8 CanUnitUseHealItem(struct Unit* unit)
{
    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit))
        return FALSE;

    return TRUE;
}

s8 sub_802909C(struct Unit* unit)
{
    return FALSE;
}

s8 CanUnitUsePureWaterItem(struct Unit* unit)
{
    if (unit->barrierDuration == 7)
        return FALSE;

    return TRUE;
}

s8 CanUnitUseTorchItem(struct Unit* unit)
{
    if (gPlaySt.chapterVisionRange != 0 && unit->torchDuration != 4)
        return TRUE;

    return FALSE;
}

s8 CanUnitUseAntitoxinItem(struct Unit* unit)
{
    if (unit->statusIndex != UNIT_STATUS_POISON)
        return FALSE;

    return TRUE;
}

s8 CanUnitUseChestKeyItem(struct Unit* unit)
{
    if (gBmMapTerrain[unit->yPos][unit->xPos] != TERRAIN_CHEST_21)
        return FALSE;

    if (!IsThereClosedChestAt(unit->xPos, unit->yPos))
        return FALSE;

    return TRUE;
}

s8 CanUnitUseDoorKeyItem(struct Unit* unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_DOOR);
    return GetSelectTargetCount();
}

s8 CanUnitOpenBridge(struct Unit* unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_BRIDGE_14);
    return GetSelectTargetCount();
}

s8 CanUnitUseLockpickItem(struct Unit* unit)
{
    if (!(UNIT_CATTRIBUTES(unit) & CA_THIEF))
        return FALSE;

    if (!CanUnitUseChestKeyItem(unit) && !CanUnitUseDoorKeyItem(unit) && !CanUnitOpenBridge(unit))
        return FALSE;

    return TRUE;
}

s8 CanUnitUsePromotionItem(struct Unit* unit, int item)
{
    #define CHECK_LIST(it)                       \
        while (*it)                              \
        {                                        \
            if (unit->pClassData->number == *it) \
                return TRUE;                     \
            it++;                                \
        }                                        \

    const u8* classList = NULL;

    if (unit->pCharacterData->number == CHARACTER_EIRIKA || unit->pCharacterData->number == CHARACTER_EPHRAIM)
    {
        switch (GetItemIndex(item))
        {

        case ITEM_LUNARBRACE:
            classList = gItemUseJidList_LunarBrace;
            break;

        case ITEM_SOLARBRACE:
            classList = gItemUseJidList_SolarBrace;
            break;

        } // switch (GetItemIndex(item))

        if (classList)
            CHECK_LIST(classList);
    }

    if (unit->level < 10)
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_HEROCREST:
        classList = gItemUseJidList_HeroCrest;
        break;

    case ITEM_KNIGHTCREST:
        classList = gItemUseJidList_KnightCrest;
        break;

    case ITEM_ORIONSBOLT:
        classList = gItemUseJidList_OrionsBolt;
        break;

    case ITEM_ELYSIANWHIP:
        classList = gItemUseJidList_ElysianWhip;
        break;

    case ITEM_GUIDINGRING:
        classList = gItemUseJidList_GuidRing;
        break;

    case ITEM_MASTERSEAL:
        classList = gItemUseJidList_MasterSeal;
        break;

    case ITEM_LUNARBRACE:
        classList = gItemUseJidList_LunarBrace;
        break;

    case ITEM_SOLARBRACE:
        classList = gItemUseJidList_SolarBrace;
        break;

    case ITEM_HEAVENSEAL:
        classList = gItemUseJidList_HeavenSeal;
        break;

    case ITEM_UNK_C1:
        classList = gItemUseJidList_C1;
        break;

    case ITEM_OCEANSEAL:
        classList = gItemUseJidList_OceanSeal;
        break;

    } // switch (GetItemIndex(item))

    CHECK_LIST(classList);

    return FALSE;

    #undef CHECK_LIST
}

s8 CanUnitUseStatGainItem(struct Unit* unit, int item)
{
    s8 result;

    const struct ItemStatBonuses* bonuses = GetItemStatBonuses(item);

    ClearUnit(&gStatGainSimUnit);

    gStatGainSimUnit.pCharacterData = unit->pCharacterData;
    gStatGainSimUnit.pClassData     = unit->pClassData;

    gStatGainSimUnit.maxHP = unit->maxHP + bonuses->hpBonus;
    gStatGainSimUnit.pow = unit->pow + bonuses->powBonus;
    gStatGainSimUnit.skl = unit->skl + bonuses->sklBonus;
    gStatGainSimUnit.spd = unit->spd + bonuses->spdBonus;
    gStatGainSimUnit.def = unit->def + bonuses->defBonus;
    gStatGainSimUnit.res = unit->res + bonuses->resBonus;
    gStatGainSimUnit.lck = unit->lck + bonuses->lckBonus;
    gStatGainSimUnit.movBonus = unit->movBonus + bonuses->movBonus;
    gStatGainSimUnit.conBonus = unit->conBonus + bonuses->conBonus;

    UnitCheckStatCaps(&gStatGainSimUnit);

    result = gStatGainSimUnit.maxHP != unit->maxHP;

    if (gStatGainSimUnit.pow != unit->pow)
        result = TRUE;

    if (gStatGainSimUnit.skl != unit->skl)
        result = TRUE;

    if (gStatGainSimUnit.spd != unit->spd)
        result = TRUE;

    if (gStatGainSimUnit.def != unit->def)
        result = TRUE;

    if (gStatGainSimUnit.res != unit->res)
        result = TRUE;

    if (gStatGainSimUnit.lck != unit->lck)
        result = TRUE;

    if (gStatGainSimUnit.movBonus != unit->movBonus)
        result = TRUE;

    if (gStatGainSimUnit.conBonus != unit->conBonus)
        result = TRUE;

    return result;
}

s8 CanUnitUseFruitItem(struct Unit* unit)
{
    return (unit->level >= 10)
        ? TRUE
        : FALSE;
}

void SetStaffUseAction(struct Unit* unit)
{
    HideMoveRangeGraphics();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    gActionData.unitActionType = UNIT_ACTION_STAFF;
}

void SetItemUseAction(struct Unit* unit)
{
    gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
}

u8 StaffSelectOnSelect(ProcPtr proc, struct SelectTarget* target)
{
    gActionData.targetIndex = target->uid;
    SetStaffUseAction(NULL);

    return TARGETSELECTION_ACTION_ENDFAST | TARGETSELECTION_ACTION_END | TARGETSELECTION_ACTION_SE_6A | TARGETSELECTION_ACTION_CLEARBGS;
}

void DoUseRescueStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, StaffSelectOnSelect),
        GetStringFromIndex(0x876)); // TODO: msgid "Select which character to bring next to you."
}

void DoUseSpecialDance(struct Unit* unit, void(*func)(struct Unit*), int msgHelp)
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, StaffSelectOnSelect),
        GetStringFromIndex(msgHelp));
}

void WarpSelect_OnInit(struct WarpSelectProc* proc)
{
    struct APHandle* ap;

    StartSubtitleHelp(proc, GetStringFromIndex(0x871)); // TODO: msgid "Select warp point."

    EnsureCameraOntoPosition(proc,
        GetUnit(gActionData.targetIndex)->xPos,
        GetUnit(gActionData.targetIndex)->yPos);

    HideMoveRangeGraphics();

    FillWarpRangeMap(gActiveUnit, GetUnit(gActionData.targetIndex));

    gBmSt.gameStateBits &= ~BM_FLAG_1;

    DisplayMoveRangeGraphics(1);

    SetCursorMapPosition(
        GetUnit(gActionData.targetIndex)->xPos,
        GetUnit(gActionData.targetIndex)->yPos);

    ap = AP_Create(gUnknown_085A0EA0, 0);

    ap->tileBase = OAM2_CHR(0) + OAM2_PAL(0);
    AP_SwitchAnimation(ap, 0);

    proc->ap = ap;
    proc->prevWarpAllowed = 2; // neither TRUE nor FALSE
}

void WarpSelect_OnIdle(struct WarpSelectProc* proc)
{
    s8 warpAllowed = ((s8**) gBmMapMovement)[gBmSt.playerCursor.y][gBmSt.playerCursor.x] != -1;

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (warpAllowed)
        {
            Proc_Break(proc);

            gActionData.xOther = gBmSt.playerCursor.x;
            gActionData.yOther = gBmSt.playerCursor.y;

            SetStaffUseAction(gActiveUnit);

            BG_Fill(gBG2TilemapBuffer, 0);
            BG_EnableSyncByMask(BG2_SYNC_BIT);

            PlaySoundEffect(0x6A); // TODO: song ids

            return;
        }
        else
        {
            PlaySoundEffect(0x6C); // TODO: song ids
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 99);

        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        PlaySoundEffect(0x6B); // TODO: song ids
    }

    if (warpAllowed != proc->prevWarpAllowed)
    {
        AP_SwitchAnimation(proc->ap, warpAllowed ? 0 : 1);
    }

    AP_Update(proc->ap,
        gBmSt.playerCursorDisplay.x - gBmSt.camera.x,
        gBmSt.playerCursorDisplay.y - gBmSt.camera.y);

    proc->prevWarpAllowed = warpAllowed;
}

void WarpSelect_OnConfirm(struct WarpSelectProc* proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndSubtitleHelp();

    SetCursorMapPosition(
        gActiveUnit->xPos,
        gActiveUnit->yPos);

    EnsureCameraOntoPosition(proc,
        gActiveUnit->xPos,
        gActiveUnit->yPos);
}

void WarpSelect_OnCancel(struct WarpSelectProc* proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndSubtitleHelp();

    SetCursorMapPosition(
        gActiveUnit->xPos,
        gActiveUnit->yPos);

    Proc_Start(gProcScr_BackToUnitMenu, PROC_TREE_3);
}

void WarpSelect_OnEnd(struct WarpSelectProc* proc)
{
    HideMoveRangeGraphics();
    AP_Delete(proc->ap);
}

u8 WarpOnSelectTarget(ProcPtr proc, struct SelectTarget* target)
{
    EndTargetSelection(proc);

    gActionData.targetIndex = target->uid;

    Proc_Start(gProcScr_SquareSelectWarp, PROC_TREE_3);

    return TARGETSELECTION_ACTION_SE_6A;
}

void DoUseWarpStaff(struct Unit* unit)
{
    MakeTargetListForWarp(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, WarpOnSelectTarget),
        GetStringFromIndex(0x875)); // TODO: msgid "Select character to warp."

    PlaySoundEffect(0x6A); // TODO: song ids
}

u8 OnSelectPutTrap(ProcPtr proc, struct SelectTarget* target)
{
    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    SetStaffUseAction(NULL);

    return TARGETSELECTION_ACTION_ENDFAST | TARGETSELECTION_ACTION_END | TARGETSELECTION_ACTION_SE_6A | TARGETSELECTION_ACTION_CLEARBGS;
}

void DoUsePutTrap(struct Unit* unit, void(*func)(struct Unit*), int msgHelp)
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_PutTrap, OnSelectPutTrap),
        GetStringFromIndex(msgHelp));

    PlaySoundEffect(0x6A); // TODO: song ids
}

u8 RepairSelectOnSelect(ProcPtr proc, struct SelectTarget* target)
{
    ResetTextFont();

    gActionData.targetIndex = target->uid;

    ForceMenuItemPanel(
        StartOrphanMenu(&gMenuInfo_RepairItems),
        GetUnit(gActionData.targetIndex),
        16, 11);

    // TODO: UNIT_HAS_PORTRAIT macro?
    if (GetPortraitData(GetUnitPortraitId(GetUnit(gActionData.targetIndex)))->img)
    {
        StartFace(0, GetUnitPortraitId(GetUnit(gActionData.targetIndex)), 184, 12, FACE_96x80);
        SetFaceBlinkControlById(0, 5);
    }

    return TARGETSELECTION_ACTION_ENDFAST | TARGETSELECTION_ACTION_END | TARGETSELECTION_ACTION_SE_6A | TARGETSELECTION_ACTION_CLEARBGS;
}

void DoUseRepairStaff(struct Unit* unit)
{
    MakeTargetListForHammerne(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection(&gSelectInfo_Repair),
        GetStringFromIndex(0x878)); // TODO: msgid "Select the character whose weapon needs repair."

    PlaySoundEffect(0x6A); // TODO: song ids
}

u8 RepairSelectOnChange(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshHammerneUnitInfoWindow(GetUnit(target->uid));
}

void RepairSelectOnInit(ProcPtr proc)
{
    StartUnitInventoryInfoWindow(proc);
}

int RepairMenuItemOnChange(struct MenuProc* menu, struct MenuItemProc* item)
{
    UpdateMenuItemPanel(item->itemNumber);
}

int RepairMenuItemOnChangeOut(struct MenuProc* menu, struct MenuItemProc* item)
{
}

u8 RepairMenuItemIsAvailable(const struct MenuItemDef* def, int number)
{
    int item = GetUnit(gActionData.targetIndex)->items[number];

    if (!item)
        return MENU_NOTSHOWN;

    if (!IsItemHammernable(item))
        return MENU_DISABLED;

    return MENU_ENABLED;
}

int RepairMenuItemDraw(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];
    int isRepairable = IsItemHammernable(item);

    DrawItemMenuLineLong(
        &menuItem->text, item, isRepairable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return 0;
}

u8 RepairMenuItemSelect(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        int msgId = 0;

        int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];

        if (GetItemAttributes(item) & (IA_UNBREAKABLE | IA_HAMMERNE | IA_LOCK_3))
            msgId = 0x863; // TODO: msgid "Item cannot be repaired."
        else if (!(GetItemAttributes(item) & (IA_STAFF | IA_WEAPON)))
            msgId = 0x857; // TODO: msgid "Only weapons, tomes, and[N]staves can be repaired."
        else if (GetItemUses(item) == GetItemMaxUses(item))
            msgId = 0x856; // TODO: msgid "There's nothing to repair."

        if (msgId != 0)
            MenuFrozenHelpBox(menu, msgId);

        return MENU_ACT_SND6B;
    }

    gActionData.trapType = menuItem->itemNumber;
    SetStaffUseAction(gActiveUnit);

    return MENU_ACT_SKIPCURSOR + MENU_ACT_END + MENU_ACT_SND6A + MENU_ACT_CLEAR + MENU_ACT_ENDFACE;
}

void DoUseHealStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection(&gSelectInfo_Heal),
        GetStringFromIndex(0x874)); // TODO: msgid "Select a character to restore HP to."
}

void DoUseRestoreStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection(&gSelectInfo_Restore),
        GetStringFromIndex(0x877)); // TODO: msgid "Select a character to restore to normal."
}

int RestoreMapSelect_Init(ProcPtr proc)
{
    StartUnitHpStatusInfoWindow(proc);
}

u8 RestoreMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitHpStatusInfoWindow(GetUnit(target->uid));
}

void DoUseBarrierStaff(struct Unit* unit)
{
    MakeTargetListForBarrier(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection(&gSelectInfo_Barrier),
        GetStringFromIndex(0x879)); // TODO: msgid "Select which character's resistance to bolster."
}

int BarrierMapSelect_Init(ProcPtr proc)
{
    StartUnitResChangeInfoWindow(proc);
}

u8 BarrierMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    RefreshUnitResChangeInfoWindow(GetUnit(target->uid));
}

void DoUseAttackStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    StartSubtitleHelp(
        NewTargetSelection(&gSelectInfo_OffensiveStaff),
        GetStringFromIndex(0x87B)); // TODO: msgid "Select a unit to use the staff on."
}

int AttackStaffMapSelect_Init(ProcPtr proc)
{
    StartUnitStaffOffenseInfoWindow(proc);
}

u8 AttackStaffMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    RefreshUnitStaffOffenseInfoWindow(
        GetUnit(target->uid),
        GetOffensiveStaffAccuracy(gActiveUnit, GetUnit(target->uid)));
}

void SubtitleMapSelect_End(ProcPtr proc)
{
    EndSubtitleHelp();
    ClearBg0Bg1();
}

int sub_8029D38(struct Unit* unit)
{
    if ((UNIT_CATTRIBUTES(unit) & CA_ASSASSIN) && GetTrapAt(unit->xPos, unit->yPos) == NULL)
        return TRUE;

    return FALSE;
}

void sub_8029D6C(void)
{
    StartSubtitleHelp(
        NewTargetSelection_Specialized(&gSelectInfo_WarpUnit, StaffSelectOnSelect),
        GetStringFromIndex(0x876)); // TODO: msgid "Select which character to bring next to you."
}

void TorchSelect_OnInit(struct WarpSelectProc* proc)
{
    gBmSt.gameStateBits |= GMAP_STATE_BIT0;

    StartSubtitleHelp(proc,
        GetStringFromIndex(0x87C)); // TODO: msgid "Select an area to light up."

    if (IsCameraNotWatchingPosition(gActiveUnit->xPos, gActiveUnit->yPos))
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void TorchSelect_OnIdle(struct WarpSelectProc* proc)
{
    int xTorch = gBmSt.playerCursor.x;
    int yTorch = gBmSt.playerCursor.y;

    s8 canTorch = ((s8**) gBmMapRange)[yTorch][xTorch];

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (canTorch)
        {
            PlaySoundEffect(0x6A); // TODO: song ids

            Proc_Break(proc);

            gActionData.xOther = gBmSt.playerCursor.x;
            gActionData.yOther = gBmSt.playerCursor.y;

            SetStaffUseAction(gActiveUnit);

            return;
        }
        else
        {
            PlaySoundEffect(0x6C); // TODO: song ids
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        Proc_Goto(proc, 99);

        PlaySoundEffect(0x6B); // TODO: song ids
    }

    PutMapCursor(
        gBmSt.playerCursorDisplay.x,
        gBmSt.playerCursorDisplay.y,
        TRUE);
}

void DoUseTorchStaff(struct Unit* unit)
{
    Proc_Start(gProcScr_SquareSelectTorch, PROC_TREE_3);
    PlaySoundEffect(0x6A); // TODO: song ids
}

s8 CanUnitUseItemPrepScreen(struct Unit* unit, int item)
{
    if (GetItemAttributes(item) & IA_STAFF)
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_HEAVENSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
        return CanUnitUsePromotionItem(unit, item);

    case ITEM_METISSTOME:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case ITEM_JUNAFRUIT:
        return CanUnitUseFruitItem(unit);

    default:
        return FALSE;

    }
}

s8 sub_802A108(struct Unit* unit)
{
    int i, count = GetUnitItemCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetItemIndex(unit->items[i]) == ITEM_UNK_CC)
            return TRUE;
    }

    return FALSE;
}
