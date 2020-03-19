
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
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "mapselect.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"

struct WarpSelectProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x4A - 0x29];
    /* 4A */ short prevWarpAllowed;
    /* 4C */ u8 pad4C[0x54 - 0x4C];
    /* 54 */ struct APHandle* ap;
};

void sub_8003D20(void);
void DeleteEach6CBB(void);

void sub_8034FFC(ProcPtr proc);
void sub_803501C(struct Unit* unit);
void sub_8035090(ProcPtr proc);
void sub_80350A4(struct Unit* unit);
void sub_80350FC(ProcPtr proc);
void sub_803511C(struct Unit* unit, int number);

void DisplayCursor(int x, int y, s8 arg2);

s8 ShouldMoveCameraPosSomething(int x, int y);

int sub_804FD28(void);
s8 IsThereClosedChestAt(int x, int y);
ProcPtr NewTargetSelection_Specialized(const struct SelectInfo* selectInfo, int(*onSelect)(ProcPtr, struct SelectTarget*));
void NewBottomHelpText(ProcPtr parent, const char* string);
ProcPtr NewTargetSelection(const struct SelectInfo* selectInfo);
void EndTargetSelection(ProcPtr proc);

void sub_801E684(ProcPtr parent, struct Unit* unit, int x, int y);

void NewUnitInfoWindow_WithAllLines(ProcPtr proc);

void sub_801E748(int number);

void ChangeActiveUnitFacing(int xLook, int yLook);
void DrawHammerneUnitInfoWindow(struct Unit* unit);

void EnsureCameraOntoPosition(ProcPtr parent, int x, int y);
void FillWarpRangeMap(struct Unit* caster, struct Unit* target);
void DisplayMoveRangeGraphics(int config);

void MakeTargetListForAdjacentHeal(struct Unit* unit);
void MakeTargetListForRangedHeal(struct Unit* unit);
void MakeTargetListForRestore(struct Unit* unit);
void MakeTargetListForRescueStaff(struct Unit* unit);
void MakeTargetListForBarrier(struct Unit* unit);
void MakeTargetListForSilence(struct Unit* unit);
void MakeTargetListForSleep(struct Unit* unit);
void MakeTargetListForBerserk(struct Unit* unit);
void MakeTargetListForWarp(struct Unit* unit);
void MakeTargetListForHammerne(struct Unit* unit);
void MakeTargetListForUnlock(struct Unit* unit);
void MakeTargetListForLatona(struct Unit* unit);
void MakeTargetListForMine(struct Unit* unit);
void MakeTargetListForLightRune(struct Unit* unit);
void MakeTargetListForDanceRing(struct Unit* unit);
void MakeTargetListForDoorAndBridges(struct Unit* unit, int terrain);

static s8 IsGeneratedTargetListEmpty(struct Unit* unit, void(*func)(struct Unit*));
s8 CanUseStatBooster(struct Unit* unit, int item);
s8 CanUsePromotionItem(struct Unit* unit, int item);
s8 CanUseHealingItem(struct Unit* unit);
s8 CanUsePureWater(struct Unit* unit);
s8 CanUseTorch(struct Unit* unit);
s8 CanUseAntidote(struct Unit* unit);
s8 CanUseChestKey(struct Unit* unit);
s8 CanUseDoorKey(struct Unit* unit);
s8 CanUseLockpick(struct Unit* unit);
s8 CanUseJunaFruit(struct Unit* unit);

static void PrepareTargetSelectionForHeal(struct Unit* unit, void(*func)(struct Unit*));
static void PrepareTargetSelectionForRescueStaff(struct Unit* unit, void(*func)(struct Unit*));
static void PrepareTargetSelectionForRestoreStaff(struct Unit* unit, void(*func)(struct Unit*));
static void PrepareTargetSelectionForOffensiveStaff(struct Unit* unit, void(*func)(struct Unit*));
static void sub_8029C34(struct Unit* unit);
static void SetupWarpTargetSelection(struct Unit* unit);
static void SetupHammerneUseSelection(struct Unit* unit);
static void EndItemEffectSelectionThing(struct Unit* unit);
static void PrepareTargetSelectionForMineAndLightRune(struct Unit* unit, void(*func)(struct Unit*), int msgHelp);
static void NewTorchStaffSelection(struct Unit* unit);
static void SetupTargetSelectionForGenericStaff(struct Unit* unit, void(*func)(struct Unit*), int msgHelp);
static void sub_8029544(struct Unit* unit);

extern struct Unit gUnknown_03004C00;


extern struct ProcCmd CONST_DATA gUnknown_0859B600[]; // go back to unit menu proc

extern const struct MenuDef gUnknown_0859D064;

extern struct SelectInfo CONST_DATA gUnknown_0859D238;
extern struct SelectInfo CONST_DATA gUnknown_0859D258;
extern struct SelectInfo CONST_DATA gUnknown_0859D278;
extern struct SelectInfo CONST_DATA gUnknown_0859D298;
extern struct SelectInfo CONST_DATA gUnknown_0859D2D8;
extern struct SelectInfo CONST_DATA gUnknown_0859D2F8;
extern struct SelectInfo CONST_DATA gUnknown_0859D3B8;

extern u16 CONST_DATA gUnknown_085A0EA0[]; // ap

static void WarpTargetPosSelect_Destruct(struct WarpSelectProc* proc);
static void WarpTargetPosSelect_Init(struct WarpSelectProc* proc);
static void WarpTargetPosSelect_Loop(struct WarpSelectProc* proc);
static void WarpTargetPosSelect_Confirm(struct WarpSelectProc* proc);
static void WarpTargetPosSelect_Cancel(struct WarpSelectProc* proc);

static void TorchTargetPosSelect_Init(struct WarpSelectProc* proc);
static void TorchTargetSelection_Loop(struct WarpSelectProc* proc);

struct ProcCmd CONST_DATA gUnknown_0859B9B8[] =
{
    PROC_SET_END_CB(WarpTargetPosSelect_Destruct),

    PROC_CALL(AddSkipThread2),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_CALL(WarpTargetPosSelect_Init),
    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_REPEAT(WarpTargetPosSelect_Loop),

    PROC_CALL(WarpTargetPosSelect_Confirm),
    PROC_SLEEP(0),

    PROC_CALL(SubSkipThread2),

    PROC_GOTO(100),

PROC_LABEL(99),
    PROC_CALL(WarpTargetPosSelect_Cancel),
    PROC_SLEEP(0),

    PROC_CALL(SubSkipThread2),

PROC_LABEL(100),
    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_0859BA38[] =
{
    PROC_CALL(AddSkipThread2),

    PROC_CALL(TorchTargetPosSelect_Init),
    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_REPEAT(TorchTargetSelection_Loop),

    PROC_CALL(WarpTargetPosSelect_Confirm),

    PROC_GOTO(100),

PROC_LABEL(99),
    PROC_CALL(WarpTargetPosSelect_Cancel),

PROC_LABEL(100),
    PROC_CALL(SubSkipThread2),

    PROC_END,
};

s8 CanUnitUseItem(struct Unit* unit, int item)
{
    if ((GetItemAttributes(item) & IA_STAFF) && !CanUnitUseStaff(unit, item))
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForAdjacentHeal);

    case ITEM_STAFF_PHYSIC:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_FORTIFY:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForRangedHeal);

    case ITEM_STAFF_RESTORE:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForRestore);

    case ITEM_STAFF_RESCUE:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForRescueStaff);

    case ITEM_STAFF_BARRIER:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForBarrier);

    case ITEM_STAFF_SILENCE:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForSilence);

    case ITEM_STAFF_SLEEP:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForSleep);

    case ITEM_STAFF_BERSERK:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForBerserk);

    case ITEM_STAFF_WARP:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForWarp);

    case ITEM_STAFF_REPAIR:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForHammerne);

    case ITEM_STAFF_UNLOCK:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForUnlock);

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUseStatBooster(unit, item);

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
        return CanUsePromotionItem(unit, item);

    case ITEM_VULNERARY:
    case ITEM_ELIXIR:
    case ITEM_VULNERARY_2:
        return CanUseHealingItem(unit);

    case ITEM_PUREWATER:
        return CanUsePureWater(unit);

    case ITEM_TORCH:
        return CanUseTorch(unit);

    case ITEM_ANTITOXIN:
        return CanUseAntidote(unit);

    case ITEM_CHESTKEY:
    case ITEM_CHESTKEY_BUNDLE:
        return CanUseChestKey(unit);

    case ITEM_DOORKEY:
        return CanUseDoorKey(unit);

    case ITEM_LOCKPICK:
        return CanUseLockpick(unit);

    case ITEM_STAFF_LATONA:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForLatona);

    case ITEM_MINE:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForMine);

    case ITEM_LIGHTRUNE:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForLightRune);

    case ITEM_STAFF_TORCH:
        return gUnknown_0202BCF0.chapterVisionRange != 0;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        return IsGeneratedTargetListEmpty(unit, MakeTargetListForDanceRing);

    case ITEM_METISSTOME:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case ITEM_JUNAFRUIT:
        return CanUseJunaFruit(unit);

    default:
        return FALSE;

    }
}

int sub_8028C0C(struct Unit* unit, int item)
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
        boolval = CanUsePromotionItem(gActiveUnit, item);
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

void ItemEffect_Call(struct Unit* unit, int item)
{
    ClearBg0Bg1();
    DeleteFaceByIndex(0);

    switch (GetItemIndex(item))
    {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
        PrepareTargetSelectionForHeal(unit, MakeTargetListForAdjacentHeal);
        break;

    case ITEM_STAFF_PHYSIC:
        PrepareTargetSelectionForHeal(unit, MakeTargetListForRangedHeal);
        break;

    case ITEM_STAFF_RESCUE:
        PrepareTargetSelectionForRescueStaff(unit, MakeTargetListForRescueStaff);
        break;

    case ITEM_STAFF_RESTORE:
        PrepareTargetSelectionForRestoreStaff(unit, MakeTargetListForRestore);
        break;

    case ITEM_STAFF_SILENCE:
        PrepareTargetSelectionForOffensiveStaff(unit, MakeTargetListForSilence);
        break;

    case ITEM_STAFF_SLEEP:
        PrepareTargetSelectionForOffensiveStaff(unit, MakeTargetListForSleep);
        break;

    case ITEM_STAFF_BERSERK:
        PrepareTargetSelectionForOffensiveStaff(unit, MakeTargetListForBerserk);
        break;

    case ITEM_STAFF_BARRIER:
        sub_8029C34(unit);
        break;

    case ITEM_STAFF_UNLOCK:
        PrepareTargetSelectionForMineAndLightRune(unit, MakeTargetListForUnlock, 0x87A); // TODO: msgid "Select a door to open."
        break;

    case ITEM_STAFF_WARP:
        SetupWarpTargetSelection(unit);
        break;

    case ITEM_STAFF_REPAIR:
        SetupHammerneUseSelection(unit);
        break;

    case ITEM_STAFF_FORTIFY:
    case ITEM_STAFF_LATONA:
        EndItemEffectSelectionThing(unit);
        break;

    case ITEM_MINE:
        PrepareTargetSelectionForMineAndLightRune(unit, MakeTargetListForMine, 0x87D); // TODO: msgid "Select an area to trap."
        break;

    case ITEM_LIGHTRUNE:
        PrepareTargetSelectionForMineAndLightRune(unit, MakeTargetListForLightRune, 0x87E); // TODO: msgid "Select an area to trap."
        break;

    case ITEM_STAFF_TORCH:
        NewTorchStaffSelection(unit);
        break;

    case ITEM_FILLAS_MIGHT:
    case ITEM_NINISS_GRACE:
    case ITEM_THORS_IRE:
    case ITEM_SETS_LITANY:
        SetupTargetSelectionForGenericStaff(unit, MakeTargetListForDanceRing, 0x87F); // TODO: msgid "Select a character to bless."
        break;

    default:
        sub_8029544(unit);
        break;

    }
}

s8 IsGeneratedTargetListEmpty(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    return sub_804FD28() != 0;
}

s8 CanUseHealingItem(struct Unit* unit)
{
    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit))
        return FALSE;

    return TRUE;
}

s8 sub_802909C(struct Unit* unit)
{
    return FALSE;
}

s8 CanUsePureWater(struct Unit* unit)
{
    if (unit->barrierDuration == 7)
        return FALSE;

    return TRUE;
}

s8 CanUseTorch(struct Unit* unit)
{
    if (gUnknown_0202BCF0.chapterVisionRange != 0 && unit->torchDuration != 4)
        return TRUE;

    return FALSE;
}

s8 CanUseAntidote(struct Unit* unit)
{
    if (unit->statusIndex != UNIT_STATUS_POISON)
        return FALSE;

    return TRUE;
}

s8 CanUseChestKey(struct Unit* unit)
{
    if (gBmMapTerrain[unit->yPos][unit->xPos] != TERRAIN_CHEST_21)
        return FALSE;

    if (!IsThereClosedChestAt(unit->xPos, unit->yPos))
        return FALSE;

    return TRUE;
}

s8 CanUseDoorKey(struct Unit* unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_DOOR);
    return sub_804FD28();
}

s8 CanOpenBridge(struct Unit* unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_BRIDGE_14);
    return sub_804FD28();
}

s8 CanUseLockpick(struct Unit* unit)
{
    if (!(UNIT_CATTRIBUTES(unit) & CA_THIEF))
        return FALSE;

    if (!CanUseChestKey(unit) && !CanUseDoorKey(unit) && !CanOpenBridge(unit))
        return FALSE;

    return TRUE;
}

s8 CanUsePromotionItem(struct Unit* unit, int item)
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
            classList = gUnknown_088ADFA4;
            break;

        case ITEM_SOLARBRACE:
            classList = gUnknown_088ADFA6;
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
        classList = gUnknown_088ADF57;
        break;

    case ITEM_KNIGHTCREST:
        classList = gUnknown_088ADF5E;
        break;

    case ITEM_ORIONSBOLT:
        classList = gUnknown_088ADF64;
        break;

    case ITEM_ELYSIANWHIP:
        classList = gUnknown_088ADF67;
        break;

    case ITEM_GUIDINGRING:
        classList = gUnknown_088ADF6B;
        break;

    case ITEM_MASTERSEAL:
        classList = gUnknown_088ADF76;
        break;

    case ITEM_LUNARBRACE:
        classList = gUnknown_088ADFA4;
        break;

    case ITEM_SOLARBRACE:
        classList = gUnknown_088ADFA6;
        break;

    case ITEM_HEAVENSEAL:
        classList = gUnknown_088ADF96;
        break;

    case ITEM_UNK_C1:
        classList = gUnknown_088ADFA3;
        break;

    case ITEM_OCEANSEAL:
        classList = gUnknown_088ADF9E;
        break;

    } // switch (GetItemIndex(item))

    CHECK_LIST(classList);

    return FALSE;

    #undef CHECK_LIST
}

s8 CanUseStatBooster(struct Unit* unit, int item)
{
    s8 result;

    const struct ItemStatBonuses* bonuses = GetItemStatBonuses(item);

    ClearUnit(&gUnknown_03004C00);

    gUnknown_03004C00.pCharacterData = unit->pCharacterData;
    gUnknown_03004C00.pClassData     = unit->pClassData;

    gUnknown_03004C00.maxHP = unit->maxHP + bonuses->hpBonus;
    gUnknown_03004C00.pow = unit->pow + bonuses->powBonus;
    gUnknown_03004C00.skl = unit->skl + bonuses->sklBonus;
    gUnknown_03004C00.spd = unit->spd + bonuses->spdBonus;
    gUnknown_03004C00.def = unit->def + bonuses->defBonus;
    gUnknown_03004C00.res = unit->res + bonuses->resBonus;
    gUnknown_03004C00.lck = unit->lck + bonuses->lckBonus;
    gUnknown_03004C00.movBonus = unit->movBonus + bonuses->movBonus;
    gUnknown_03004C00.conBonus = unit->conBonus + bonuses->conBonus;

    UnitCheckStatCaps(&gUnknown_03004C00);

    result = gUnknown_03004C00.maxHP != unit->maxHP;

    if (gUnknown_03004C00.pow != unit->pow)
        result = TRUE;

    if (gUnknown_03004C00.skl != unit->skl)
        result = TRUE;

    if (gUnknown_03004C00.spd != unit->spd)
        result = TRUE;

    if (gUnknown_03004C00.def != unit->def)
        result = TRUE;

    if (gUnknown_03004C00.res != unit->res)
        result = TRUE;

    if (gUnknown_03004C00.lck != unit->lck)
        result = TRUE;

    if (gUnknown_03004C00.movBonus != unit->movBonus)
        result = TRUE;

    if (gUnknown_03004C00.conBonus != unit->conBonus)
        result = TRUE;

    return result;
}

s8 CanUseJunaFruit(struct Unit* unit)
{
    return (unit->level >= 10)
        ? TRUE
        : FALSE;
}

void EndItemEffectSelectionThing(struct Unit* unit)
{
    HideMoveRangeGraphics();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    gActionData.unitActionType = UNIT_ACTION_STAFF;
}

void sub_8029544(struct Unit* unit)
{
    gActionData.unitActionType = UNIT_ACTION_USE_ITEM;
}

int GenericStaffSelection_OnSelect(ProcPtr proc, struct SelectTarget* target)
{
    gActionData.targetIndex = target->uid;
    EndItemEffectSelectionThing(NULL);

    return 0x17; // TODO: Select Return Constants
}

void PrepareTargetSelectionForRescueStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection_Specialized(&gUnknown_0859D2F8, GenericStaffSelection_OnSelect),
        GetStringFromIndex(0x876)); // TODO: msgid "Select which character to bring next to you."
}

void SetupTargetSelectionForGenericStaff(struct Unit* unit, void(*func)(struct Unit*), int msgHelp)
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection_Specialized(&gUnknown_0859D2F8, GenericStaffSelection_OnSelect),
        GetStringFromIndex(msgHelp));
}

void WarpTargetPosSelect_Init(struct WarpSelectProc* proc)
{
    struct APHandle* ap;

    NewBottomHelpText(proc, GetStringFromIndex(0x871)); // TODO: msgid "Select warp point."

    EnsureCameraOntoPosition(proc,
        GetUnit(gActionData.targetIndex)->xPos,
        GetUnit(gActionData.targetIndex)->yPos);

    HideMoveRangeGraphics();

    FillWarpRangeMap(gActiveUnit, GetUnit(gActionData.targetIndex));

    gUnknown_0202BCB0.gameStateBits &= ~GMAP_STATE_BIT1;

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

void WarpTargetPosSelect_Loop(struct WarpSelectProc* proc)
{
    s8 warpAllowed = ((s8**) gBmMapMovement)[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x] != -1;

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (warpAllowed)
        {
            Proc_Break(proc);

            gActionData.xOther = gUnknown_0202BCB0.playerCursor.x;
            gActionData.yOther = gUnknown_0202BCB0.playerCursor.y;

            EndItemEffectSelectionThing(gActiveUnit);

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
        gUnknown_0202BCB0.playerCursorDisplay.x - gUnknown_0202BCB0.camera.x,
        gUnknown_0202BCB0.playerCursorDisplay.y - gUnknown_0202BCB0.camera.y);

    proc->prevWarpAllowed = warpAllowed;
}

void WarpTargetPosSelect_Confirm(struct WarpSelectProc* proc)
{
    sub_8003D20();
    HideMoveRangeGraphics();
    DeleteEach6CBB();

    SetCursorMapPosition(
        gActiveUnit->xPos,
        gActiveUnit->yPos);

    EnsureCameraOntoPosition(proc,
        gActiveUnit->xPos,
        gActiveUnit->yPos);
}

void WarpTargetPosSelect_Cancel(struct WarpSelectProc* proc)
{
    sub_8003D20();
    HideMoveRangeGraphics();
    DeleteEach6CBB();

    SetCursorMapPosition(
        gActiveUnit->xPos,
        gActiveUnit->yPos);

    Proc_Start(gUnknown_0859B600, PROC_TREE_3);
}

void WarpTargetPosSelect_Destruct(struct WarpSelectProc* proc)
{
    HideMoveRangeGraphics();
    AP_Delete(proc->ap);
}

int WarpTargetSelection_OnSelect(ProcPtr proc, struct SelectTarget* target)
{
    EndTargetSelection(proc);

    gActionData.targetIndex = target->uid;

    Proc_Start(gUnknown_0859B9B8, PROC_TREE_3);

    return 4; // TODO: Map Select Return Constants
}

void SetupWarpTargetSelection(struct Unit* unit)
{
    MakeTargetListForWarp(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection_Specialized(&gUnknown_0859D2F8, WarpTargetSelection_OnSelect),
        GetStringFromIndex(0x875)); // TODO: msgid "Select character to warp."

    PlaySoundEffect(0x6A); // TODO: song ids
}

int sub_80298D4(ProcPtr proc, struct SelectTarget* target)
{
    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    EndItemEffectSelectionThing(NULL);

    return 0x17; // TODO: Map Select Return Constants
}

void PrepareTargetSelectionForMineAndLightRune(struct Unit* unit, void(*func)(struct Unit*), int msgHelp)
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection_Specialized(&gUnknown_0859D2D8, sub_80298D4),
        GetStringFromIndex(msgHelp));

    PlaySoundEffect(0x6A); // TODO: song ids
}

int HammerneTargetSelection_OnSelect(ProcPtr proc, struct SelectTarget* target)
{
    sub_8003D20();

    gActionData.targetIndex = target->uid;

    sub_801E684(
        StartOrphanMenu(&gUnknown_0859D064),
        GetUnit(gActionData.targetIndex),
        16, 11);

    // TODO: UNIT_HAS_PORTRAIT macro?
    if (GetPortraitStructPointer(GetUnitPortraitId(GetUnit(gActionData.targetIndex)))->img)
    {
        NewFace(0, GetUnitPortraitId(GetUnit(gActionData.targetIndex)), 184, 12, 2);
        sub_8006458(0, 5);
    }

    return 0x17; // TODO: Map Select Return Constants
}

void SetupHammerneUseSelection(struct Unit* unit)
{
    MakeTargetListForHammerne(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection(&gUnknown_0859D3B8),
        GetStringFromIndex(0x878)); // TODO: msgid "Select the character whose weapon needs repair."

    PlaySoundEffect(0x6A); // TODO: song ids
}

int HammerneTargetSelection_OnChange(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    DrawHammerneUnitInfoWindow(GetUnit(target->uid));
}

void HammerneTargetSelection_OnInit(ProcPtr proc)
{
    NewUnitInfoWindow_WithAllLines(proc);
}

int sub_8029A38(struct MenuProc* menu, struct MenuItemProc* item)
{
    sub_801E748(item->itemNumber);
}

void nullsub_24(struct MenuProc* menu, struct MenuItemProc* item)
{
}

u8 sub_8029A4C(const struct MenuItemDef* def, int number)
{
    int item = GetUnit(gActionData.targetIndex)->items[number];

    if (!item)
        return MENU_NOTSHOWN;

    if (!IsItemHammernable(item))
        return MENU_DISABLED;

    return MENU_ENABLED;
}

int sub_8029A84(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];
    int isRepairable = IsItemHammernable(item);

    DrawItemMenuLineLong(
        &menuItem->text, item, isRepairable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return 0;
}

int sub_8029AE0(struct MenuProc* menu, struct MenuItemProc* menuItem)
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
    EndItemEffectSelectionThing(gActiveUnit);

    return MENU_ACT_SKIPCURSOR + MENU_ACT_END + MENU_ACT_SND6A + MENU_ACT_CLEAR + MENU_ACT_ENDFACE;
}

void PrepareTargetSelectionForHeal(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection(&gUnknown_0859D298),
        GetStringFromIndex(0x874)); // TODO: msgid "Select a character to restore HP to."
}

void PrepareTargetSelectionForRestoreStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection(&gUnknown_0859D278),
        GetStringFromIndex(0x877)); // TODO: msgid "Select a character to restore to normal."
}

int sub_8029C04(ProcPtr proc)
{
    sub_8034FFC(proc);
}

int sub_8029C10(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    sub_803501C(GetUnit(target->uid));
}

void sub_8029C34(struct Unit* unit)
{
    MakeTargetListForBarrier(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection(&gUnknown_0859D258),
        GetStringFromIndex(0x879)); // TODO: msgid "Select a character to restore to normal."
}

int sub_8029C70(ProcPtr proc)
{
    sub_8035090(proc);
}

int sub_8029C7C(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    sub_80350A4(GetUnit(target->uid));
}

void PrepareTargetSelectionForOffensiveStaff(struct Unit* unit, void(*func)(struct Unit*))
{
    func(unit);

    BmMapFill(gBmMapMovement, -1);

    NewBottomHelpText(
        NewTargetSelection(&gUnknown_0859D238),
        GetStringFromIndex(0x87B)); // TODO: msgid "Select a unit to use the staff on."
}

int sub_8029CDC(ProcPtr proc)
{
    sub_80350FC(proc);
}

int sub_8029CE8(ProcPtr proc, struct SelectTarget* target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    sub_803511C(
        GetUnit(target->uid),
        GetOffensiveStaffAccuracy(gActiveUnit, GetUnit(target->uid)));
}

void GenericSelection_DeleteBBAndBG(ProcPtr proc)
{
    DeleteEach6CBB();
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
    NewBottomHelpText(
        NewTargetSelection_Specialized(&gUnknown_0859D2F8, GenericStaffSelection_OnSelect),
        GetStringFromIndex(0x876)); // TODO: msgid "Select which character to bring next to you."
}

void TorchTargetPosSelect_Init(struct WarpSelectProc* proc)
{
    gUnknown_0202BCB0.gameStateBits |= GMAP_STATE_BIT0;

    NewBottomHelpText(proc,
        GetStringFromIndex(0x87C)); // TODO: msgid "Select an area to light up."

    if (ShouldMoveCameraPosSomething(gActiveUnit->xPos, gActiveUnit->yPos))
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void TorchTargetSelection_Loop(struct WarpSelectProc* proc)
{
    int xTorch = gUnknown_0202BCB0.playerCursor.x;
    int yTorch = gUnknown_0202BCB0.playerCursor.y;

    s8 canTorch = ((s8**) gBmMapRange)[yTorch][xTorch];

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (canTorch)
        {
            PlaySoundEffect(0x6A); // TODO: song ids

            Proc_Break(proc);

            gActionData.xOther = gUnknown_0202BCB0.playerCursor.x;
            gActionData.yOther = gUnknown_0202BCB0.playerCursor.y;

            EndItemEffectSelectionThing(gActiveUnit);

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

    DisplayCursor(
        gUnknown_0202BCB0.playerCursorDisplay.x,
        gUnknown_0202BCB0.playerCursorDisplay.y,
        TRUE);
}

void NewTorchStaffSelection(struct Unit* unit)
{
    Proc_Start(gUnknown_0859BA38, PROC_TREE_3);
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
        return CanUseStatBooster(unit, item);

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
        return CanUsePromotionItem(unit, item);

    case ITEM_METISSTOME:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case ITEM_JUNAFRUIT:
        return CanUseJunaFruit(unit);

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
