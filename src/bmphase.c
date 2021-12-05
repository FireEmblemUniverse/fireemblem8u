#include "global.h"

#include "bmunit.h"
#include "variables.h"

#include "bmphase.h"

enum {
    PLAYER_PHASE_INDEX = 0x00,
    NPC_PHASE_INDEX = 0x40,
    ENEMY_PHASE_INDEX = 0x80,
};

int GetPhaseAbleUnitCount(int a) {
    int count = 0;
    int id;
    for (id = a + 1; id < a + 0x40; id++) {
        struct Unit *unit = GetUnit(id);
        if (unit != 0) {
            if (unit->pCharacterData != 0) {
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
                        u32 unitAttributes = (unit->pCharacterData->attributes
                            | unit->pClassData->attributes);
                        if (!(unitAttributes & CA_UNSELECTABLE)) {
                            count += 1;
                        }
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
        if (unit != 0) {
            if (unit->pCharacterData != 0) {
                if (!(unit->state & state)) {
                    count += 1;
                }
            }
        }
    }
    return count;
}

int AreUnitsAllied(int left, int right) {
    int a = left & 0x80;
    int b = right & 0x80;
    return (a == b);
}

int IsSameAllegiance(int left, int right) {
    int ret;
    if ((left & 0xc0) == (right & 0xc0)) {
        ret = 1;
    } else {
        ret = 0;
    };
    return ret;
}

int GetCurrentPhase(void) {
    return gRAMChapterData.chapterPhaseIndex & ENEMY_PHASE_INDEX;
}

int GetActiveNonEnemyFaction(void) {
    return (gRAMChapterData.chapterPhaseIndex & ENEMY_PHASE_INDEX) ^ ENEMY_PHASE_INDEX;
}
