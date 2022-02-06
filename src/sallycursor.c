#include "global.h"

#include "functions.h"
#include "constants/characters.h"
#include "bmunit.h"
#include "bmmap.h"

int sub_809541C();
const struct UnitDefinition* GetChapterAllyUnitDataPointer();
void DisplayMoveRangeGraphics(int config);

#if NONMATCHING

int GetPlayerLeaderUnitId() {
    int i;
    int unitId;
    struct Unit* unit;
    const struct CharacterData* data;
    switch (gRAMChapterData.chapterModeIndex) {
        case 1: // tutorial (chapter 0-8)
        case 2: // Eirika
            unitId = CHARACTER_EIRIKA; // #1
            break;
        case 3: // Ephraim
            unitId = CHARACTER_EPHRAIM; // #0xF
            break;
        default:
            break;
    }

    if ((u8)gRAMChapterData.chapterIndex == 5) {
        return CHARACTER_EPHRAIM; // #0xF
    }

    if (GetChapterThing() == 0) {
        return unitId;
    }

    unit = GetUnitFromCharId(unitId);
    if (unit != 0 ) {
        if ((unit->state & US_NOT_DEPLOYED) != 0) {
            return unitId;
        }
    }

    for (i = 1; i <= 0x3F; ++i) { // TODO - Is there a constant for number of units?
        unit = GetUnit(i);
        if (unit != 0) {
            data = unit->pCharacterData;
            if (data != 0) {
                if (!(unit->state & US_UNAVAILABLE)) {
                    return (int)data->number;
                }
            }
        }
    }
}

#else // if !NONMATCHING

__attribute__((naked))
int GetPlayerLeaderUnitId() {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        ldr r0, _0803326C  @ gRAMChapterData\n\
        ldrb r1, [r0, #0x1b]\n\
        cmp r1, #1\n\
        blt _08033276\n\
        cmp r1, #2\n\
        ble _08033270\n\
        cmp r1, #3\n\
        beq _08033274\n\
        b _08033276\n\
        .align 2, 0\n\
    _0803326C: .4byte gRAMChapterData\n\
    _08033270:\n\
        movs r5, #1\n\
        b _08033276\n\
        _08033274:\n\
        movs r5, #0xf\n\
    _08033276:\n\
        ldrb r0, [r0, #0xe]\n\
        cmp r0, #5\n\
        bne _08033284\n\
        movs r0, #0xf\n\
        b _080332C4\n\
    _08033280:\n\
        ldrb r0, [r2, #4]\n\
        b _080332C4\n\
    _08033284:\n\
        bl GetChapterThing\n\
        cmp r0, #0\n\
        beq _080332C2\n\
        adds r0, r5, #0\n\
        bl GetUnitFromCharId\n\
        cmp r0, #0\n\
        beq _080332A0 @\n\
        ldr r0, [r0, #0xc]\n\
        movs r1, #8\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080332C2\n\
    _080332A0:\n\
        movs r4, #1\n\
    _080332A2:\n\
        adds r0, r4, #0\n\
        bl GetUnit\n\
        cmp r0, #0\n\
        beq _080332BC\n\
        ldr r2, [r0]\n\
        cmp r2, #0\n\
        beq _080332BC\n\
        ldr r0, [r0, #0xc]\n\
        ldr r1, _080332CC  @ 0x0001000C\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08033280\n\
    _080332BC:\n\
        adds r4, #1\n\
        cmp r4, #0x3f\n\
        ble _080332A2\n\
        _080332C2:\n\
        adds r0, r5, #0\n\
    _080332C4:\n\
        pop {r4, r5}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080332CC: .4byte 0x0001000C\n\
        .syntax divided\n\
    ");

}
   
#endif // NONMATCHING



void sub_80332D0() {
    s8 xTmp, yTmp;
    const struct UnitDefinition* uDef = GetChapterAllyUnitDataPointer();
    BmMapFill(gBmMapRange, 0);
    BmMapFill(gBmMapMovement, -1);
    uDef = uDef + sub_809541C(); // TODO - Seems to be count of non-deployable / force-deployed characters

    if (uDef->charIndex != 0) {
        while (uDef->charIndex) {
            GetPreferredPositionForUNIT(uDef, &xTmp, &yTmp, 0);
            gBmMapRange[yTmp][xTmp] = 1;
            uDef++;
        }
    }

    DisplayMoveRangeGraphics(0x10);
    return;
}