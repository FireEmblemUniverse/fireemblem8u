
#include "global.h"

#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uiutils.h"

#include "constants/items.h"
#include "constants/terrains.h"

int sub_804FD28(void);
s8 IsThereClosedChestAt(int x, int y);

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

s8 IsGeneratedTargetListEmpty(struct Unit* unit, void(*func)(struct Unit*));
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

void PrepareTargetSelectionForHeal(struct Unit* unit, void(*func)(struct Unit*));
void PrepareTargetSelectionForRescueStaff(struct Unit* unit, void(*func)(struct Unit*));
void PrepareTargetSelectionForRestoreStaff(struct Unit* unit, void(*func)(struct Unit*));
void PrepareTargetSelectionForOffensiveStaff(struct Unit* unit, void(*func)(struct Unit*));
void sub_8029C34(struct Unit* unit);
void SetupWarpTargetSelection(struct Unit* unit);
void SetupHammerneUseSelection(struct Unit* unit);
void EndItemEffectSelectionThing(struct Unit* unit);
void PrepareTargetSelectionForMineAndLightRune(struct Unit* unit, void(*func)(struct Unit*), int msgHelp);
void NewTorchStaffSelection(struct Unit* unit);
void SetupTargetSelectionForGenericStaff(struct Unit* unit, void(*func)(struct Unit*), int msgHelp);
void sub_8029544(struct Unit* unit);

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
