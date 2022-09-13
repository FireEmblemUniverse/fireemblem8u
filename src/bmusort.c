#include "global.h"

#include "bmunit.h"
#include "variables.h"

EWRAM_DATA struct Unit* sUnitStackBase = 0;
EWRAM_DATA struct Unit* sUnitStackTop = 0;
EWRAM_DATA u8 sUnitStackSize = 0;

void InitUnitStack(void* buff)
{
    struct Unit **tmp = &sUnitStackBase; // ...
    sUnitStackTop = buff;
    *tmp = buff;
    sUnitStackSize = 1;
}

void PushUnit(struct Unit* unit)
{
    sUnitStackTop->pCharacterData = 0;
    CopyUnit(unit, sUnitStackTop);
    sUnitStackTop->index = sUnitStackSize;
    unit->maxHP = 0;
    sUnitStackSize++;
    sUnitStackTop++;
}

void LoadPlayerUnitsFromUnitStack()
{
    int i;
    for (i = 0; i < 0x3E; ++i)
        ClearUnit(&gUnitArrayBlue[i]);

    CpuCopy16(sUnitStackBase, gUnitArrayBlue, (void*)sUnitStackTop - (void*)sUnitStackBase);
}

void LoadPlayerUnitsFromUnitStack2()
{
    int i;
    for (i = 0; i < 0x3E; ++i)
        ClearUnit(&gUnitArrayBlue[i]);

    CpuCopy16(sUnitStackBase, gUnitArrayBlue, (void*)sUnitStackTop - (void*)sUnitStackBase);
}

