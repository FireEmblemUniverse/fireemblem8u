#include "global.h"

#include "constants/terrains.h"

#include "bmunit.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"

enum
{
    TRAP_MAX_COUNT = 64,
};

EWRAM_DATA struct Trap gUnknown_0203A614[TRAP_MAX_COUNT] = {};
EWRAM_DATA struct Trap gUnknown_0203A814 = {};

#define TRAP_INDEX(aTrap) ((aTrap) - GetTrap(0))

inline struct Trap* GetTrap(int id)
{
    return gUnknown_0203A614 + id;
}

void ResetTraps(void)
{
    int i;

    for (i = 0; i < TRAP_MAX_COUNT; ++i)
        gUnknown_0203A614[i].type = TRAP_NONE;

    gUnknown_0203A814.type = TRAP_NONE;
}

struct Trap* GetTrapAt(int x, int y)
{
    struct Trap* it;

lop:
    for (it = GetTrap(0); it->type != TRAP_NONE; ++it)
    {
        // Check trap position
        if ((x == it->xPos) && (y == it->yPos))
            return it;

        // Check if we on a wall, and there is a wall above
        // In which case the trap would be on the topmost wall tile
        if (gBmMapTerrain[y][x] == TERRAIN_WALL_1B)
        {
            if ((y > 0) && gBmMapTerrain[y-1][x] == TERRAIN_WALL_1B)
            {
                y = y-1;
                goto lop;
            }
        }
    }

    return NULL;
}

struct Trap* GetSpecificTrapAt(int x, int y, int trapType)
{
    struct Trap* it;

    for (it = GetTrap(0); it->type != TRAP_NONE; ++it)
    {
        // Check trap position
        if ((it->xPos == x) && (it->yPos == y) && (it->type == trapType))
            return it;

        // Check if we want a wall
        if (trapType == TERRAIN_WALL_1B)
        {
            // Check if we on a wall, and there is a wall above
            // In which case the trap would be on the topmost wall tile
            if (gBmMapTerrain[y][x] == TERRAIN_WALL_1B)
            {
                if ((y > 0) && gBmMapTerrain[y-1][x] == TERRAIN_WALL_1B)
                {
                    return GetTrapAt(x, y-1);
                }
            }
        }
    }

    return NULL;
}

struct Trap* AddTrap(int x, int y, int trapType, int data0)
{
    struct Trap* trap;

    // Find first free trap
    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {}

    trap->xPos = x;
    trap->yPos = y;
    trap->type = trapType;
    trap->data[0] = data0;

    return trap;
}

struct Trap* AddTrapExt(int x, int y, int trapType, int data0, int data1, int data2, int data3)
{
    struct Trap* trap = AddTrap(x, y, trapType, data0);

    trap->data[1] = data1;
    trap->data[2] = data2;
    trap->data[3] = data1;
    trap->data[4] = data3;

    return trap;
}

#ifdef NONMATCHING

struct Trap* RemoveTrap(struct Trap* trap)
{
    while (trap->type != TRAP_NONE)
    {
        *trap++ = *(trap + 1);
    }

    // return trap; // BUG
}

#else // NONMATCHING

__attribute__((naked))
struct Trap* RemoveTrap(struct Trap* trap)
{
    asm( // 0802E2FC
        ".syntax unified\n"

        "push {lr}\n"
        "adds r3, r0, #0\n"
        "b _0802E308\n"
    "_0802E302:\n"
        "ldr r1, [r3, #8]\n"
        "ldr r2, [r3, #0xc]\n"
        "stm r3!, {r1, r2}\n"
    "_0802E308:\n"
        "ldrb r1, [r3, #2]\n"
        "cmp r1, #0\n"
        "bne _0802E302\n"
        "pop {r1}\n"
        "bx r1\n"

        ".syntax divided\n"
    );
}

#endif // NONMATCHING

void AddFireTrap(int x, int y, int arg2, int arg3)
{
    AddTrapExt(x, y, TRAP_FIRETILE, 0, arg2, arg3, 10);
}

void AddGasTrap(int x, int y, int arg2, int arg3, int arg4)
{
    AddTrapExt(x, y, TRAP_GAS, arg2, arg3, arg4, 3);
}

void AddArrowTrap(int x, int arg1, int arg2)
{
    AddTrapExt(x, 0, TRAP_LIGHTARROW, 0, arg1, arg2, 10);
}

void sub_802E36C(int x, int y, int arg2, int arg3)
{
    AddTrapExt(x, y, TRAP_MAPCHANGE2, 0, arg2, arg3, 0);
}

void AddTrap8(int x, int y)
{
    AddTrap(x, y, TRAP_8, 0);
}

void AddTrap9(int x, int y, int arg2)
{
    AddTrap(x, y, TRAP_9, arg2);
}

void AddSnagsAndWalls(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            switch (gBmMapTerrain[iy][ix])
            {

            case TERRAIN_WALL_1B:
                if (gBmMapTerrain[iy-1][ix] == TERRAIN_WALL_1B)
                    continue; // walls are stacked, only the topmost tile gets a trap

                AddTrap(
                    ix, iy, TRAP_OBSTACLE,
                    GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->mapCrackedWallHeath);

                break;

            case TERRAIN_SNAG:
                AddTrap(ix, iy, TRAP_OBSTACLE, 20);
                break;

            } // switch (gBmMapTerrain[iy][ix])
        }
    }
}

void ApplyTrapMapChanges(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_MAPCHANGE:
            ApplyMapChangesById(trap->data[TRAP_EXTDATA_MAPCHANGE_ID]);
            break;

        case TRAP_MAPCHANGE2:
            // this is a mystery
            ApplyMapChangesById(trap->data[0] ? trap->yPos : trap->xPos);
            break;

        } // switch (trap->type)
    }
}

void UpdateAllLightRunes(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = TERRAIN_TILE_00;
            break;

        }
    }
}

int GetTrapExt1At(int x, int y)
{
    struct Trap* trap;

    if ((trap = GetTrapAt(x, y)) != NULL)
    {
        return trap->data[0];
    }

    if ((gBmMapTerrain[y][x] == TERRAIN_WALL_1B) && (gBmMapTerrain[y-1][x] == TERRAIN_WALL_1B))
    {
        if ((trap = GetTrapAt(x, y-1)) != NULL)
        {
            return trap->data[0];
        }
    }

    return 0;
}

const struct MapChange* GetMapChangesPointerById(int id)
{
    const struct MapChange* mapChange = GetChapterMapChangesPointer(gUnknown_0202BCF0.chapterIndex);

    if (!mapChange)
        return NULL;

    while (mapChange->id >= 0)
    {
        if (id == mapChange->id)
            return mapChange;

        ++mapChange;
    }

    return NULL;
}

int GetMapChangesIdAt(int x, int y)
{
    int result = -1;

    const struct MapChange* mapChange = GetChapterMapChangesPointer(gUnknown_0202BCF0.chapterIndex);

    if (!mapChange)
        return result;

    while (mapChange->id >= 0)
    {
        if (x >= mapChange->xOrigin)
            if (y >= mapChange->yOrigin)
                if (mapChange->xOrigin + mapChange->xSize - 1 >= x)
                    if (mapChange->yOrigin + mapChange->ySize - 1 >= y)
                        result = mapChange->id;

        ++mapChange;
    }

    return result;
}

void ApplyMapChangesById(int id)
{
    int ix = 0, iy = 0;

    const struct MapChange* mapChange = GetMapChangesPointerById(id);
    const u16* tileDataIt = mapChange->data;

    for (iy = 0; iy < mapChange->ySize; ++iy)
    {
        for (ix = 0; ix < mapChange->xSize; ++ix)
        {
            if (*tileDataIt != 0)
            {
                gBmMapBaseTiles[mapChange->yOrigin + iy][mapChange->xOrigin + ix] = *tileDataIt++;
            }
            else
            {
                ++tileDataIt;
            }
        }
    }
}

void AddMapChange(int id)
{
    AddTrap(0, 0, TRAP_MAPCHANGE, id);
}

void UntriggerMapChange(int id)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if (trap->type == TRAP_MAPCHANGE && trap->data[TRAP_EXTDATA_MAPCHANGE_ID] == id)
            RemoveTrap(trap);
    }
}

s8 AreMapChangeTriggered(int id)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if (trap->type == TRAP_MAPCHANGE && trap->data[TRAP_EXTDATA_MAPCHANGE_ID] == id)
            return TRUE;
    }

    return FALSE;
}

void UnitHideIfUnderRoof(struct Unit* unit)
{
    if (gBmMapTerrain[unit->yPos][unit->xPos] == TERRAIN_ROOF)
    {
        unit->state |= (US_HIDDEN | US_UNDER_A_ROOF);
    }
}

void sub_802E690(void)
{
    int i;

    for (i = 1; i < 0xC0; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & US_UNDER_A_ROOF))
            continue;

        if (gBmMapTerrain[unit->yPos][unit->xPos] != TERRAIN_ROOF)
        {
            unit->state = (unit->state &~ (US_UNDER_A_ROOF | US_HIDDEN)) | US_BIT8;
        }
    }

    RefreshEntityBmMaps();
    SMS_UpdateFromGameData();
}

void AddToTargetListFromPos(int x, int y, int tId)
{
    AddTarget(x, y, gBmMapUnit[y][x], tId);
}

void AddArrowTrapTargetsToTargetList(int x, int y, int tId)
{
    int iy;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
    {
        if (gBmMapUnit[iy][x])
            AddTarget(x, iy, gBmMapUnit[iy][x], tId);
    }
}

void sub_802E754(int x, int y, int tId, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    } // switch (facing)

    for (i = 2; i >= 0; --i)
    {
        x += xInc;
        y += yInc;

        if (gBmMapUnit[y][x])
            AddTarget(x, y, gBmMapUnit[y][x], tId);
    }
}

s8 sub_802E7D4(int x, int y, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    s8 boolHasNoEffect = TRUE;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    } // switch (facing)

    for (i = 0; i < 3; ++i)
    {
        x += xInc;
        y += yInc;

        if (gBmMapUnit[y][x])
            boolHasNoEffect = FALSE;
    }

    return boolHasNoEffect;
}

void MakeTargetListForTurnTrapDamage(void)
{
    struct Trap* trap;

    InitTargets(0, 0);

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if ((s8) trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
        {
            switch (trap->type)
            {

            case TRAP_FIRETILE:
                AddToTargetListFromPos(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_LIGHTARROW:
                AddArrowTrapTargetsToTargetList(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_GAS:
                sub_802E754(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE], trap->data[TRAP_EXTDATA_GAS_FACING]);
                break;

            }
        }
    }
}

void sub_802E8A8(void)
{
    struct Trap* trap;

    int specialType = 0;

    InitTargets(0, 0);

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if ((s8) trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
        {
            switch (trap->type)
            {

            case TRAP_FIRETILE:
                if (gBmMapUnit[trap->yPos][trap->xPos])
                {
                    AddTarget(trap->xPos, trap->yPos, 0, TRAP_FIRETILE);
                    AddToTargetListFromPos(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                }

                break;

            case TRAP_GAS:
                switch (trap->data[TRAP_EXTDATA_GAS_FACING])
                {

                    // TODO: figure out

                case FACING_UP:
                    specialType = 0x64;
                    break;

                case FACING_DOWN:
                    specialType = 0x65;
                    break;

                case FACING_LEFT:
                    specialType = 0x66;
                    break;

                case FACING_RIGHT:
                    specialType = 0x67;
                    break;

                } // switch (trap->data[TRAP_EXTDATA_GAS_FACING])

                if (!sub_802E7D4(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_GAS_FACING]))
                {
                    AddTarget(trap->xPos, trap->yPos, 0, specialType);
                    sub_802E754(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE], trap->data[TRAP_EXTDATA_GAS_FACING]);
                }

                break;

            case TRAP_LIGHTARROW:
                AddTarget(trap->xPos, trap->yPos, 0, TRAP_LIGHTARROW);
                AddArrowTrapTargetsToTargetList(trap->xPos, trap->yPos, (s8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]);
                break;

            case TRAP_MAPCHANGE2:
                AddTarget(trap->data[0] ? trap->xPos : trap->yPos, TRAP_INDEX(trap), 0, trap->type);
                break;

            } // switch (trap->type)
        }
    }
}

void CountDownTraps(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_FIRETILE:
        case TRAP_GAS:
        case TRAP_LIGHTARROW:
        case TRAP_MAPCHANGE2:
            trap->data[TRAP_EXTDATA_TRAP_COUNTER]--;
            break;

        } // switch (trap->type)
    }
}

void ResetCounterForCountedDownTraps(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_FIRETILE:
        case TRAP_GAS:
        case TRAP_LIGHTARROW:
        case TRAP_MAPCHANGE2:
            if ((s8) trap->data[TRAP_EXTDATA_TRAP_COUNTER] == 0)
                trap->data[TRAP_EXTDATA_TRAP_COUNTER] = trap->data[TRAP_EXTDATA_TRAP_TURNNEXT];

            break;

        } // switch (trap->type)
    }
}

void sub_802EA00(void)
{
    int truePhase = gUnknown_0202BCF0.chapterPhaseIndex;
    gUnknown_0202BCF0.chapterPhaseIndex = FACTION_RED;

    RefreshEntityBmMaps();

    gUnknown_0202BCF0.chapterPhaseIndex = truePhase;
}

void sub_802EA1C(void)
{
    sub_8026414(3);
}

void sub_802EA28(void)
{
    // TODO: EID/FLAG DEFINITIONS

    if (CheckEventId(0x65) || CountAvailableBlueUnits() == 0)
    {
        CallGameOverEvent();
    }

    if (!AreAnyEnemyUnitDead())
        SetEventId(0x06);
}

struct Trap* AddLightRune(int x, int y)
{
    struct Trap* trap = AddTrap(x, y, TRAP_LIGHT_RUNE, gBmMapTerrain[y][x]);

    trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT] = 3;
    gBmMapTerrain[y][x] = TERRAIN_TILE_00;

    // return trap; // BUG
}

struct Trap* RemoveLightRune(struct Trap* trap)
{
    gBmMapTerrain[trap->yPos][trap->xPos] = GetTrueTerrainAt(trap->xPos, trap->yPos);
    return RemoveTrap(trap);
}

void HandleTrapDecay(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_TORCHLIGHT:
            trap->data[TRAP_EXTDATA_LIGHT_TURNSLEFT]--;

            if (trap->data[TRAP_EXTDATA_LIGHT_TURNSLEFT] == 0)
            {
                RemoveTrap(trap);
                trap--;
            }

            break;

        case TRAP_LIGHT_RUNE:
            trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT]--;

            if (trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT] == 0)
            {
                RemoveLightRune(trap);
                trap--;
            }

            break;

        } // switch (trap->type)
    }
}

void BattleSomethingTrapChangeTerrain(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = GetTrueTerrainAt(trap->xPos, trap->yPos);
            break;

        } // switch (trap->type)
    }
}

void NullAllLightRunesTerrain(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = TERRAIN_TILE_00;
            break;

        } // switch (trap->type)
    }
}
