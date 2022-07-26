#include "global.h"

#include "bmunit.h"
#include "variables.h"

#include "bmphase.h"

int GetPhaseAbleUnitCount(int faction) {
    int count = 0;
    int id;
    for (id = faction + 1; id < faction + 0x40; id++) {
        struct Unit *unit = GetUnit(id);
        if (UNIT_IS_VALID(unit)) {
            u32 state = unit->state;
            u32 notAble = (
                US_UNSELECTABLE
                | US_DEAD
                | US_NOT_DEPLOYED
                | US_RESCUED
                | US_UNDER_A_ROOF
                | US_BIT16);
            if (!(state & notAble)) {
                if (unit->statusIndex != UNIT_STATUS_SLEEP
                    && unit->statusIndex != UNIT_STATUS_BERSERK)
                {
                    if (!(UNIT_CATTRIBUTES(unit) & CA_UNSELECTABLE)) {
                        count += 1;
                    }
                }
            }
        }
    }
    return count;
}

int CountUnitsInState(int faction, int state) {
    int count = 0;
    int id;
    for (id = faction + 1; id < faction + 0x40; id++) {
        struct Unit *unit = GetUnit(id);
        if (UNIT_IS_VALID(unit)) {
            if (!(unit->state & state)) {
                count += 1;
            }
        }
    }
    return count;
}

s8 AreUnitsAllied(int left, int right) {
    int a = left & 0x80;
    int b = right & 0x80;
    return (a == b);
}

s8 IsSameAllegiance(int left, int right) {
    int ret;
    if ((left & 0xc0) == (right & 0xc0)) {
        ret = 1;
    } else {
        ret = 0;
    };
    return ret;
}

int GetCurrentPhase(void) {
    return gRAMChapterData.chapterPhaseIndex & FACTION_RED;
}

int GetNonActiveFaction(void) {
    return (gRAMChapterData.chapterPhaseIndex & FACTION_RED) ^ FACTION_RED;
}
