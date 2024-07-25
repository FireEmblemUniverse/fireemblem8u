#include "global.h"

#include "bmunit.h"
#include "bmmap.h"
#include "eventinfo.h"
#include "bmdifficulty.h"
#include "bmtarget.h"
#include "uiselecttarget.h"
#include "bmidoten.h"
#include "bmmind.h"
#include "bmitem.h"

#include "constants/terrains.h"

/**
 * Does checks related to whether a unit can do certain actions on certain tiles
 * None of this is used, even in the debug version of the game
 * However, in the debug version, GetUnitCommandUseFlags does some printing to debug console
 */

//! FE8U = 0x08034314
bool CanUnitUseVisit(void)
{
    int ix;
    int iy;

    if (gActiveUnit->state & US_HAS_MOVED)
        return false;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapTerrain[iy][ix] != TERRAIN_VILLAGE_03 && gBmMapTerrain[iy][ix] != TERRIAN_HOUSE &&
                gBmMapTerrain[iy][ix] != TERRAIN_INN && gBmMapTerrain[iy][ix] != TERRAIN_RUINS_37)
                continue;

            if (GetAvailableTileEventCommand(ix, iy) == TILE_COMMAND_VISIT)
                return true;
        }
    }

    return false;
}

//! FE8U = 0x080343A8
bool CanUnitUseSeize(void)
{
    int ix;
    int iy;

    if (gActiveUnit->state & US_HAS_MOVED)
        return false;

    if (!CanUnitSeize(gActiveUnit))
        return false;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (GetAvailableTileEventCommand(ix, iy) == TILE_COMMAND_SEIZE)
                return true;
        }
    }

    return false;
}

//! FE8U = 0x08034428
bool CanUnitUseAttack(void)
{
    InitTargets(0, 0);
    BmMapFill(gBmMapRange, 0);

    GenerateUnitCompleteAttackRange(gActiveUnit);

    gSubjectUnit = gActiveUnit;
    ForEachUnitInRange(AddUnitToTargetListIfNotAllied);

    return GetSelectTargetCount() != 0 ? true : false;
}

//! FE8U = 0x08034470
bool CanActiveUnitUseRescue(void)
{
    MakeRescueTargetList(gActiveUnit);

    return GetSelectTargetCount() != 0 ? true : false;
}

//! FE8U = 0x0803448C
bool CanActiveUnitUseTrade(void)
{
    MakeTradeTargetList(gActiveUnit);

    return GetSelectTargetCount() != 0 ? true : false;
}

//! FE8U = 0x080344A8
int GetUnitCommandUseFlags(void)
{
    int result = 0;

    GetGameClock();

    result |= CanUnitUseVisit() << 15;
    result |= CanUnitUseSeize() << 16;
    result |= CanUnitUseAttack() << 1;
    result |= CanActiveUnitUseRescue() << 8;
    result |= CanActiveUnitUseTrade() << 23;

    return result;
}

//! FE8U = 0x080344E8
int sub_80344E8(void)
{
    GenerateUnitMovementMapExt(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionData.moveCount);
    return GetUnitCommandUseFlags();
}

//! FE8U = 0x08034514
int sub_8034514(void)
{
    BmMapFill(gBmMapMovement, -1);
    gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

    return GetUnitCommandUseFlags();
}

//! FE8U = 0x08034550
void sub_8034550(struct Unit * unit)
{
    int i;
    int ix;
    int iy;

    int reach = GetUnitWeaponReachBits(unit, -1);

    BmMapFill(gBmMapOther, 0);

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit2 = GetUnit(i);

        if (!UNIT_IS_VALID(unit2))
            continue;

        GenerateUnitStandingReachRange(unit2, reach);

        gActionData.xOther = unit2->xPos;
        gActionData.yOther = unit2->yPos;
    }

    InitTargets(0, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            if (gBmMapOther[iy][ix] == 0)
                continue;

            AddTarget(ix, iy, 1, 1);
        }
    }

    return;
}
