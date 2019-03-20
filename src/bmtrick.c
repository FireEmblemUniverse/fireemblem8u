#include "global.h"

#include "constants/terrains.h"

#include "bmmap.h"

enum
{
    TRAP_MAX_COUNT = 64,
};

EWRAM_DATA struct Trap gUnknown_0203A614[TRAP_MAX_COUNT] = {};
EWRAM_DATA struct Trap gUnknown_0203A814 = {};

static inline struct Trap* GetTrp(int id)
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
    for (it = GetTrp(0); it->type != TRAP_NONE; ++it)
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

    for (it = GetTrp(0); it->type != TRAP_NONE; ++it)
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
    for (trap = gUnknown_0203A614; trap->type != TRAP_NONE; ++trap) {}

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
}

#else // NONMATCHING

__attribute__((naked))
struct Trap* RemoveTrap(struct Trap* trap)
{
    asm(
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
