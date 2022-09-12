#include "global.h"

#include "bmunit.h"
#include "variables.h"

EWRAM_DATA struct Unit* gUnitStackBase = 0;
EWRAM_DATA struct Unit* gUnitStackTop = 0;
EWRAM_DATA u8 gUnitStackSize = 0;

void InitUnitStack(void* buff)
{
    struct Unit **tmp = &gUnitStackBase; // ...?
    gUnitStackTop = buff;
    *tmp = buff;
    gUnitStackSize = 1;
}

void PushUnit(struct Unit* unit)
{
    gUnitStackTop->pCharacterData = 0;
    CopyUnit(unit, gUnitStackTop);
    gUnitStackTop->index = gUnitStackSize;
    unit->maxHP = 0;
    gUnitStackSize++;
    gUnitStackTop++;
}

void LoadPlayerUnitsFromUnitStack()
{
    int i;
    for (i = 0; i < 0x3E; ++i)
        ClearUnit(&gUnitArrayBlue[i]);

    CpuCopy16(gUnitStackBase, gUnitArrayBlue, (void*)gUnitStackTop - (void*)gUnitStackBase);
}

void LoadPlayerUnitsFromUnitStack2()
{
    int i;
    for (i = 0; i < 0x3E; ++i)
        ClearUnit(&gUnitArrayBlue[i]);

    CpuCopy16(gUnitStackBase, gUnitArrayBlue, (void*)gUnitStackTop - (void*)gUnitStackBase);
}
