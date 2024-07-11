#include "global.h"

#include "cp_common.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"

#include "constants/items.h"
#include "constants/terrains.h"

u8 EWRAM_DATA gUnknown_0203AAA0 = 0;

// forward declarations
void AiFillDangerMap(void);
s8 AiUpdateGetUnitIsHealing(struct Unit*);
const struct AiEscapePt* GetEscapePointStructThingMaybe(void);
void sub_803EC18(u16);
s8 AiIsWithinFlyingDistance(struct Unit*, int, int);
int StoreItemAndGetUnitAttack(struct Unit*, u16*);
s8 AiTryDoDanceAdjacent(int, int);
s8 AiTryDoStealAdjacent(int, int);
s8 sub_803EEB0(int, int);


//! FE8U = 0x0803E2F4
void AiInitDangerMap(void) {
    if ((u8)gAiState.dangerMapFilled == 0) {
        gAiState.dangerMapFilled = 1;

        BmMapFill(gBmMapOther, 0);
        AiFillDangerMap();
    }

    return;
}

//! FE8U = 0x0803E320
void AiFillDangerMap(void) {
    int ix;
    int iy;
    int i;
    int j;

    u16 item = 0;
    u8 might = 0;

    for (i = 1; i < 0xC0; i++) {
        u16 itemTmp;

        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_NOT_DEPLOYED | US_BIT16)) {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, unit->index)) {
            continue;
        }

        // BUG: Item is never re-initialized in the loop

        for (j = 0; (j < UNIT_ITEM_COUNT) && (itemTmp = unit->items[j]); j++) {
            if (!CanUnitUseWeapon(unit, itemTmp)) {
                continue;
            }

            if (GetItemMight(itemTmp) > might) {
                item = itemTmp;
                might = GetItemMight(itemTmp);
            }
        }

        if (item == 0) {
            continue;
        }

        if (!AiCouldReachByBirdsEyeDistance(gActiveUnit, unit, item)) {
            continue;
        }

        FillMovementAndRangeMapForItem(unit, item);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                if (gMapRangeSigned[iy][ix] == 0) {
                    continue;
                }

                gBmMapOther[iy][ix] += (GetUnitPower(unit) + might) >> 1;
            }
        }
    }

    return;
}

s8 AiCheckDangerAt(int x, int y, u8 threshold) {

    if (gBmMapOther[y][x] > threshold) {
        return 0;
    }

    return 1;
}

u8 CONST_DATA sTerrainList_Fort[] = { TERRAIN_FORT, 0, 0, 0 };

//! FE8U = 0x0803E470
s8 AiTryGetNearestHealPoint(struct Vec2* out) {
    struct Unit* unit;

    int ix;
    int iy;

    int currentCount = 10000;
    int currentMove = 0xff;

    if (gActiveUnit->ai_config & AI_UNIT_CONFIG_FLAG_STAY) {
        return 0;
    }

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_LORD) {
        return 0;
    }

    GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            int count;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (!AiIsInByteList(sTerrainList_Fort, gBmMapTerrain[iy][ix])) {
                if ((gBmMapUnit[iy][ix] == 0) || !AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                    continue;
                }

                unit = GetUnit(gBmMapUnit[iy][ix]);

                if (!(unit->aiFlags & AI_UNIT_FLAG_2)) {
                    continue;
                }
            } else {
                if (gBmMapUnit[iy][ix] != 0) {
                    if (!AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                        continue;
                    }

                    unit = GetUnit(gBmMapUnit[iy][ix]);

                    if (unit->ai_config & AI_UNIT_CONFIG_FLAG_STAY) {
                        if (!(unit->aiFlags & AI_UNIT_FLAG_2)) {
                            continue;
                        }
                    }
                }
            }

            count = AiCountNearbyEnemyUnits(ix, iy);

            if ((count <= currentCount) && (gMapMovementSigned[iy][ix] <= currentMove)) {
                currentCount = count;
                currentMove = gBmMapMovement[iy][ix];
                out->x = ix;
                out->y = iy;
            }
        }
    }

    if (currentMove != 0xff) {
        if ((gBmMapUnit[out->y][out->x] != 0) && (gBmMapUnit[out->y][out->x] != gActiveUnitId)) {
            unit = GetUnit(gBmMapUnit[out->y][out->x]);
            unit->aiFlags |= AI_UNIT_FLAG_1;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x0803E640
void UpdateAllPhaseHealingAIStatus(void) {
    int i;

    u8 faction = gPlaySt.faction;

    int factionUnitCountLut[3] = {
        [FACTION_ID_BLUE]  = 62,
        [FACTION_ID_GREEN] = 20,
        [FACTION_ID_RED]   = 50
    };

    for (i = 0; i < factionUnitCountLut[faction >> 6]; i++) {
        struct Unit* unit = GetUnit(faction + i + 1);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        AiUpdateGetUnitIsHealing(unit);
    }

    return;
}

//! FE8U = 0x0803E698
s8 AiUpdateGetUnitIsHealing(struct Unit* unit) {

    u16 hpPercentage = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

    if (unit->aiFlags & AI_UNIT_FLAG_0) {
        if (gAI3HealingThresholdTable[unit->ai_config & AI_UNIT_CONFIG_HEALTHRESHOLD_MASK].exitThreshold > hpPercentage) {
            return 1;
        } else {
            unit->aiFlags &= ~AI_UNIT_FLAG_0;
            return 0;
        }
    } else {
        if (gAI3HealingThresholdTable[unit->ai_config & AI_UNIT_CONFIG_HEALTHRESHOLD_MASK].enterThreshold > hpPercentage) {
            unit->aiFlags |= AI_UNIT_FLAG_0;
            return 1;
        } else {
            return 0;
        }
    }
}

//! FE8U = 0x0803E718
bool AiTryHealSelf(void)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = gActiveUnit->items[i];

        if (item == 0)
            return 0;

        if (GetItemIndex(item) == ITEM_VULNERARY || GetItemIndex(item) == ITEM_ELIXIR)
        {
            if (!(gAiState.flags & AI_FLAG_STAY) && !(gActiveUnit->ai_config & AI_UNIT_CONFIG_FLAG_STAY))
            {
                /**
                 * If unit can move around (rather than stick on position)
                 * he may try escape to a safe place then heal itself.
                 */
                struct Vec2 position;
                if (AiFindSafestReachableLocation(gActiveUnit, &position) == true)
                {
                    AiSetDecision(position.x, position.y, AI_ACTION_USEITEM, 0, i, 0, 0);
                    return true;
                }
            }
            else
            {
                AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, AI_ACTION_USEITEM, 0, i, 0, 0);
                return true;
            }
        }
    }
    return false;
}

//! FE8U = 0x0803E7D0
s8 AiTryMoveTowardsEscape(void) {
    const struct AiEscapePt* escapePoint;

    GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);
    escapePoint = GetEscapePointStructThingMaybe();

    if (escapePoint != NULL) {

        if (gMapMovementSigned[escapePoint->y][escapePoint->x] <= UNIT_MOV(gActiveUnit)) {
            AiTryMoveTowards(escapePoint->x, escapePoint->y, 0, -1, 1);
            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_ESCAPE, escapePoint->x, escapePoint->y, escapePoint->facing, 0);

            return 1;
        } else {
            AiTryMoveTowards(escapePoint->x, escapePoint->y, 0, -1, 0);
            return gAiDecision.actionPerformed;
        }
    }

    return 0;
}

//! FE8U = 0x0803E878
const struct AiEscapePt* GetEscapePointStructThingMaybe(void) {
    int i = 0;

    const struct AiEscapePt* list = NULL;
    const struct AiEscapePt* result = NULL;

    int chapter = gPlaySt.chapterIndex;

    u8 resultMove = 0xFF;

    switch (gPlaySt.faction) {
        case FACTION_BLUE:
            return NULL;

        case FACTION_RED:
            list = gRedAiEscapePoints[chapter];
            break;

        case FACTION_GREEN:
            list = gGreenAiEscapePoints[chapter];
            break;
    }

    for (; list[i].x != 0xFF; i++) {
        if (gBmMapMovement[list[i].y][list[i].x] > MAP_MOVEMENT_MAX) {
            continue;
        }

        if (resultMove > gMapMovementSigned[list[i].y][list[i].x]) {
            resultMove = gMapMovementSigned[list[i].y][list[i].x];
            result = list + i;
        }
    }

    return result;
}

//! FE8U = 0x0803E900
s8 AiCanEquip(void) {

    if (gActiveUnit->state & US_CANTOING) {
        return 0;
    }

    if (gAiDecision.actionId == AI_ACTION_COMBAT) {
        return 0;
    }

    if (gActiveUnit->statusIndex == UNIT_STATUS_BERSERK) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803E93C
s8 AiEquipGetFlags(u16 * out)
{
    int i;
    u32 perc;

    if (GetUnitItemCount(gActiveUnit) == 0)
        return 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item;
        out[i] = 0;

        item = gActiveUnit->items[i];

        if (item == 0)
            break;

        if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
            continue;

        if (GetItemAttributes(item) & IA_LOCK_3)
            continue;

        if (!CanUnitUseWeapon(gActiveUnit, item) && !CanUnitUseStaff(gActiveUnit, item))
            continue;

        if (GetItemAttributes(item) & IA_WEAPON)
        {
            if (GetItemMinRange(item) > 1)
                out[i] |= 2;

            if (GetItemMaxRange(item) == 1)
                out[i] |= 1;

            perc = Div(perc = GetItemUses(item) * 100, GetItemMaxUses(item));

            if (perc <= 10)
                out[i] |= 4;
        }
        else
        {
            sub_803EC18(item);
            out[i] |= 8;
        }

        out[i] |= (GetItemMight(item) << 8);
    }
}

//! FE8U = 0x0803EA58
void AiEquipGetDanger(int x, int y, u16 * range_danger_out, u16 * melee_danger_out, u16 * combined_danger_out)
{
    int i;
    int might;
    int iy, ix;
    u16 item;

    *combined_danger_out = 0;
    *melee_danger_out = 0;
    *range_danger_out = 0;

    BmMapFill(gBmMapOther, 0);

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_RESCUED))
            continue;

        if (AreUnitsAllied(gActiveUnitId, unit->index))
            continue;

        if (!AiIsWithinFlyingDistance(unit, x, y))
            continue;

        GenerateUnitMovementMap(unit);

        if (gBmMapMovement[y][x] == 0xFF)
            continue;

        might = StoreItemAndGetUnitAttack(unit, &item);

        if (GetItemMinRange(item) > 1)
            *range_danger_out += might;

        if (GetItemMaxRange(item) == 1)
            *melee_danger_out += might;

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                    continue;

                if (gBmMapOther[iy][ix] + might <= 0xFF)
                    gBmMapOther[iy][ix] = gBmMapOther[iy][ix] + might;
                else
                    gBmMapOther[iy][ix] = 0xFF;
            }
        }
    }
    *combined_danger_out = *range_danger_out + *melee_danger_out;
}

//! FE8U = 0x0803EBA4
void AiEquipBestMatch(int equip_flag, u16 * equip_flags)
{
    int i;

    int itemSlot = -1;
    u16 unk = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; equip_flags++, i++)
    {
        if (*equip_flags == 0)
            continue;

        if (!(*equip_flags & equip_flag))
            continue;

        if ((*equip_flags & 0xff00) > unk)
        {
            unk = *equip_flags & 0xff00;
            itemSlot = i;
        }
    }

    if (itemSlot > 0)
        EquipUnitItemSlot(gActiveUnit, itemSlot);
}

//! FE8U = 0x0803EBF0
void AiEquipBestConsideringDanger(u16 range_danger, u16 melee_danger, u16 combined_danger, u16 * equip_flags)
{
    if ((melee_danger + range_danger) != 0)
    {
        if (melee_danger >= range_danger)
            AiEquipBestMatch(1, equip_flags);
        else
            AiEquipBestMatch(2, equip_flags);
    }
}

//! FE8U = 0x0803EC18
void sub_803EC18(u16 item) {
    switch (GetItemIndex(item)) {
        case ITEM_STAFF_HEAL:
        case ITEM_STAFF_MEND:
        case ITEM_STAFF_RECOVER:
        case ITEM_STAFF_PHYSIC:
        case ITEM_STAFF_FORTIFY:
            gActiveUnit->aiFlags |= AI_UNIT_FLAG_2;
            break;

        case ITEM_STAFF_REPAIR:
            gActiveUnit->aiFlags |= AI_UNIT_FLAG_4;
            break;
    }

    return;
}

//! FE8U = 0x0803EC54
s8 AiIsWithinFlyingDistance(struct Unit* unit, int x, int y) {
    int mov =  UNIT_MOV(unit);
    int dist = RECT_DISTANCE(x, y, unit->xPos, unit->yPos);

    if (mov >= dist) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803EC98
int StoreItemAndGetUnitAttack(struct Unit* unit, u16* itemOut) {
    u16 item = GetUnitEquippedWeapon(unit);
    *itemOut = item;
    return GetUnitPower(unit) + GetItemMight(item);
}

//! FE8U = 0x0803ECC4
void AiTryDanceOrStealAfterMove(void) {

    if (gAiDecision.actionId == AI_ACTION_ESCAPE) {
        return;
    }

    if (AiTryDoDanceAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1) {
        return;
    }

    AiTryDoStealAdjacent(gAiDecision.xMove, gAiDecision.yMove);

    return;
}

//! FE8U = 0x0803ECF0
void AiTryActionAfterMove(void) {

    if (AiTryDoDanceAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1) {
        return;
    }

    if (AiTryDoStealAdjacent(gAiDecision.xMove, gAiDecision.yMove) == 1) {
        return;
    }

    sub_803EEB0(gAiDecision.xMove, gAiDecision.yMove);

    return;
}

//! FE8U = 0x0803ED28
s8 AiTryDoDanceAdjacent(int x, int y) {
    int ix;
    int iy;

    u8 level = 0;
    u8 target = 0;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & (CA_DANCE | CA_PLAY))) {
        return 0;
    }

    BmMapFill(gBmMapMovement, -1);

    MapAddInRange(x, y, 1, 1);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (!AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (UNIT_CATTRIBUTES(unit) & (CA_DANCE | CA_PLAY)) {
                continue;
            }

            if (level < unit->level) {
                level = unit->level;
                target = gBmMapUnit[iy][ix];
            }
        }
    }

    if (level != 0) {
        AiSetDecision(x, y, AI_ACTION_REFRESH, target, 0, 0, 0);
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803EE4C
s8 AiTryDoStealAdjacent(int x, int y) {
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL)) {
        return 0;
    }

    BmMapFill(gBmMapMovement, -1);

    gBmMapMovement[y][x] = 0;
    MapAddInRange(x, y, 1, MAP_MOVEMENT_MAX);

    if (AiAttemptStealActionWithinMovement() != -1) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803EEB0
s8 sub_803EEB0(int x, int y) {
    int ix;
    int iy;

    u16 item = GetUnitEquippedWeapon(gActiveUnit);
    if (item == 0) {
        return 0;
    }

    BmMapFill(gBmMapMovement, 0);

    MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gMapMovementSigned[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix]) == 1) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (AiGetInRangeCombatPositionScoreComponent(x, y, unit)) {
                AiSetDecision(x, y, AI_ACTION_COMBAT, unit->index, GetUnitEquippedWeaponSlot(gActiveUnit), 0, 0);
                return 1;
            }
        }
    }

    return 0;
}

//! FE8U = 0x0803EFE0
s8 AiIsUnitAtPositionDifferentAllegiance(int x, int y) {
    if (gBmMapUnit[y][x] == 0) {
        return 0;
    }

    if ((gActiveUnitId ^ gBmMapUnit[y][x]) & 0x80) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803F018
s8 AiFunc_CountEnemiesInRange(const void * arg)
{
    struct AiCountEnemiesInRangeArg const * cast = arg;
    u16 item;
    int ix;
    int iy;
    u16 move;

    u8 count = 0;

    move = (UNIT_MOV(gActiveUnit) * cast->move_coeff_q4);
    move = move >> 4;

    item = GetUnitEquippedWeapon(gActiveUnit);

    if ((cast->attack_range != 0) && item != 0) {
        AiFloodMovementAndRange(gActiveUnit, move, item);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

                if (gMapRangeSigned[iy][ix] == 0) {
                    continue;
                }

                if (AiIsUnitAtPositionDifferentAllegiance(ix, iy) == 1) {
                    count++;
                }
            }
        }
    } else {
        SetWorkingMoveCosts(GetUnitMovementCost(gActiveUnit));
        SetWorkingBmMap(gBmMapRange);

        GenerateMovementMap(gActiveUnit->xPos, gActiveUnit->yPos, move, 0);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

                if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                    continue;
                }

                if (AiIsUnitAtPositionDifferentAllegiance(ix, iy) == 1) {
                    count++;
                }
            }
        }
    }

    gAiState.cmd_result[cast->result_slot] = count;
    return 0;
}

struct Unknown_Sub80315C {
    u8* unk_00;
    u8 unk_04;
    u8 unk_05;
};

//! FE8U = 0x0803F15C
s8 sub_803F15C(const struct Unknown_Sub80315C* input) {
    u16 item;
    int ix;
    int iy;
    int xUnk;
    int yUnk;
    u16 move;
    int xPrev;
    int yPrev;

    move = UNIT_MOV(gActiveUnit) * input->unk_04;
    move = move >> 4;

    item = GetUnitEquippedWeapon(gActiveUnit);

    xUnk = input->unk_00[((gActiveUnit->ai_config & 0x1fc0) >> 8)*2+0];
    yUnk = input->unk_00[((gActiveUnit->ai_config & 0x1fc0) >> 8)*2+1];

    xPrev = gActiveUnit->xPos;
    yPrev = gActiveUnit->yPos;

    gActiveUnit->xPos = xUnk;
    gActiveUnit->yPos = yUnk;

    if ((input->unk_05 != 0) && (item != 0)) {
        AiFloodMovementAndRange(gActiveUnit, move, item);

        if (gMapRangeSigned[yUnk][xUnk] == 0) {
            gActiveUnit->xPos = xPrev;
            gActiveUnit->yPos = yPrev;
            AiTryMoveTowards(xUnk, yUnk, 0, 0xff, 1);
            return 1;
        }

    } else {
        SetWorkingMoveCosts(GetUnitMovementCost(gActiveUnit));

        SetWorkingBmMap(gBmMapRange);
        GenerateMovementMap(gActiveUnit->xPos, gActiveUnit->yPos, move, 0);
        if (gBmMapRange[yUnk][xUnk] > MAP_MOVEMENT_MAX) {
            gActiveUnit->xPos = xPrev;
            gActiveUnit->yPos = yPrev;
            AiTryMoveTowards(xUnk, yUnk, 0, 0xff, 1);
            return 1;
        }
    }

    gActiveUnit->xPos = xPrev;
    gActiveUnit->yPos = yPrev;

    GenerateUnitMovementMap(gActiveUnit);
    if (UnitHasMagicRank(gActiveUnit) != 0) {
        GenerateMagicSealMap(-1);
    }

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (item != 0) {
                if ((gMapMovementSigned[iy][ix] < MAP_MOVEMENT_MAX) && (gMapRangeSigned[iy][ix] != 0) ) {
                    continue;
                }

                gMapMovementSigned[iy][ix] = -1;
            } else {
                if ((gMapMovementSigned[iy][ix] < MAP_MOVEMENT_MAX) && (gMapRangeSigned[iy][ix] < MAP_MOVEMENT_MAX) ) {
                    continue;
                }

                gMapMovementSigned[iy][ix] = -1;
            }

        }
    }

    AiAttemptCombatWithinMovement(AiIsUnitEnemy);
    if (gAiDecision.actionPerformed == 1) {
        return 1;
    }

    AiTryMoveTowards(xUnk, yUnk, 0, 0xff, 1);
    return 1;
}

//! FE8U = 0x0803F330
s8 sub_803F330(const void* input) {
    gAiState.cmd_result[0] = gActiveUnit->ai_counter;
    return 0;
}

//! FE8U = 0x0803F34C
s8 sub_803F34C(const void* input) {

    int i;
    int faction = GetCurrentPhase();

    for (i = faction + 1; i < faction + 0x80; i++) {
        GetUnit(i);
    }

    gAiState.decideState = 0;

    return 0;
}

//! FE8U = 0x0803F37C
s8 sub_803F37C(const void* input) {

    int i;
    int faction = GetCurrentPhase();

    for (i = faction + 1; i < faction + 0x80; i++) {
        GetUnit(i);
    }

    gAiState.decideState = 0;

    return 0;
}

//! FE8U = 0x0803F3AC
s8 AiTryMoveToSpecificPosition(struct Vec2* out) {

    const struct Vec2* posA;
    const struct Vec2* posB;

    int idx = (gActiveUnit->ai_config & 0x1fc0) >> 8;
    int ai_counter = gActiveUnit->ai_counter;

    if (gUnknown_085A8400 == NULL) {
        return 0;
    }

    posA = gUnknown_085A8400[idx];

    if (posA == NULL) {
        return 0;
    }

    posB = posA + ai_counter;
    if (posB->x == -1) {
        ai_counter = 0;
        gActiveUnit->ai_counter = 0;
        posB = posA;
    }

    out->x = posB->x;
    out->y = posB->y;

    if (gBmMapMovement[posB->y][posB->x] != 0xFF) {
        ai_counter++;
        gActiveUnit->ai_counter = ai_counter;
    }

    return 1;
}

//! FE8U = 0x0803F434
s8 AiCountEnemyInRangeOrTryMoveToSpecificPosition(const void* input) {
    int enemiesInRange;
    struct Vec2 pos;

    u16 item = GetUnitEquippedWeapon(gActiveUnit);

    if (item != 0) {
        FillMovementAndRangeMapForItem(gActiveUnit, item);
        enemiesInRange = AiCountEnemyUnitsInRange();
        if (enemiesInRange != 0) {
            gAiState.cmd_result[0] = enemiesInRange;
            return 0;
        }
    } else {
        GenerateUnitMovementMap(gActiveUnit);
    }

    if (AiTryMoveToSpecificPosition(&pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, 0xff, 1);
        return 1;
    }

    return 0;

}

struct UnknownSub803F4A4 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
};

//! FE8U = 0x0803F4A4
s8 sub_803F4A4(const void* input) {
    const struct UnknownSub803F4A4* castInput = (const struct UnknownSub803F4A4*)input;

    u8 x = gActiveUnit->xPos;
    u8 y = gActiveUnit->yPos;

    if (castInput->unk_00 <= x && castInput->unk_02 >= x && castInput->unk_01 <= y && castInput->unk_03 >= y) {
        gAiState.cmd_result[0] = 1;
        return 0;
    }

    gAiState.cmd_result[0] = 0;

    return 0;
}

//! FE8U = 0x0803F4EC
s8 sub_803F4EC(const void* input) {

    AiUpdateDecision(
        8,
        0,
        GetUnitFromCharId(((u8*)(input))[0])->index,
        GetUnitFromCharId(((u8*)(input))[1])->index,
        0xff
    );

    return 1;
}

//! FE8U = 0x0803F51C
s8 sub_803F51C(const void* input) {
    u16 leaderAi1;
    u16 leaderai_a_pc;
    struct Unit* leader;

    int i = 0;
    u8 prevUid = gActiveUnitId;
    struct Unit* prevUnit = gActiveUnit;

    u16 leadUid = GetUnitLeaderCharId(gActiveUnit);
    if (leadUid == 0) {
        return 0;
    }

    leader = GetUnitFromCharId(leadUid);

    gActiveUnit = leader;

    if (leader == 0) {
        gActiveUnit = prevUnit;
        gAiState.cmd_result[1] = 1;
        return 0;
    }

    gActiveUnitId = leader->index;

    leaderAi1 = leader->ai1;
    leaderai_a_pc = leader->ai_a_pc;

    for (; i < 0x100; i++) {
        if (AiTryExecScriptA() == 1) {
            goto _0803F584;
        }
    }

    AiExecFallbackScriptA();

_0803F584:
    if ((gAiDecision.actionPerformed == 1) && (gAiDecision.actionId == AI_ACTION_COMBAT)) {
        gAiState.cmd_result[0] = gAiDecision.targetId;
    } else {
        gAiState.cmd_result[0] = 0;
    }

    AiClearDecision();

    gActiveUnit->ai1 = leaderAi1;
    gActiveUnit->ai_a_pc = leaderai_a_pc;

    gActiveUnitId = prevUid;
    gActiveUnit = prevUnit;

    return 0;
}

//! FE8U = 0x0803F5E0
s8 sub_803F5E0(struct Unit* unit) {

    if (unit->pCharacterData->number != gUnknown_0203AAA0) {
        return 0;
    }

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803F61C
s8 sub_803F61C(const void* input) {
    gUnknown_0203AAA0 = ((u8*)(input))[0];

    if (AiUnitWithCharIdExists(((u8*)(input))[0]) != 1) {
        gAiState.cmd_result[1] = 1;
        return 0;
    }

    AiAttemptOffensiveAction(sub_803F5E0);
    gAiState.cmd_result[0] = 0;

    if ((gAiDecision.actionPerformed == 1) && (gAiDecision.actionId == AI_ACTION_COMBAT)) {
        gAiState.cmd_result[0] = gAiDecision.targetId;
    }

    AiClearDecision();

    return 0;
}

//! FE8U = 0x0803F680
s8 sub_803F680(struct Unit* unit) {

    if (unit->index != gAiState.cmd_result[0]) {
        return 0;
    }

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803F6B8
s8 sub_803F6B8(struct Unit* unit) {
    int a;
    int b;
    int c;
    int d;

    struct Unit* other = GetUnit(gAiState.cmd_result[0]);

    a = (other->xPos - gActiveUnit->xPos);
    b = (other->yPos - gActiveUnit->yPos);
    c = (unit->xPos - gActiveUnit->xPos);
    d = (unit->yPos - gActiveUnit->yPos);

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    if ((a * c) < 0) {
        return 0;
    }

    if ((d * b) < 0) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803F72C
s8 sub_803F72C(const void* input) {
    struct Unit* unit;

    if (gAiState.cmd_result[0] == 0) {
        return 1;
    }

    unit = GetUnit(gAiState.cmd_result[0]);

    AiAttemptOffensiveAction(sub_803F680);

    if (gAiDecision.actionPerformed == 1) {
        return 1;
    }

    AiAttemptOffensiveAction(sub_803F6B8);

    if (gAiDecision.actionPerformed == 1) {
        return 1;
    }

    AiTryMoveTowards(unit->xPos, unit->yPos, 0, 0xff, 1);
    return 1;
}

//! FE8U = 0x0803F790
s8 sub_803F790(const void* input) {
    u8 rng = NextRN_N(100);

    gAiState.unk7C = ((u8*)(input))[1];

    if (rng <= ((u8*)(input))[0]) {
        if (AiTryDoStaff(AiIsUnitEnemy) == 0) {
            AiAttemptOffensiveAction(AiIsUnitEnemy);
        }

        return 1;
    }

    gAiState.decideState = 4;

    return 1;
}

//! FE8U = 0x0803F7DC
s8 sub_803F7DC(const void* input) {
    u8 rng = NextRN_N(100);

    if (rng <= ((u8*)(input))[0]) {
        if (AiTryDoSpecialItems() != 0) {
            return 1;
        }

        rng = NextRN_N(100);

        if (rng <= ((u8*)(input))[1]) {
            AiAttemptOffensiveAction(AiIsUnitEnemy);
        }

        return 1;
    }

    gAiState.decideState = 4;
    return 1;
}

//! FE8U = 0x0803F82C
s8 AiBallistaRideExit(const void * input)
{
    int ix;
    int iy;

    s16 x = -1;
    s16 y = -1;

    u16 unk = 0;
    u8 movement = 0xff;

    if (gActiveUnit->state & US_IN_BALLISTA) {
        if (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) == 0) {
            AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, AI_ACTION_EXITBALLISTA, 0, 0, 0, 0);
        }

        return 1;
    }

    InitAiMoveMapForUnit(gActiveUnit);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (GetRiddenBallistaAt(ix, iy) == 0) {
                continue;
            }

            unk = (unk + (unk + 128 / 48)) / 2;

            if (gBmMapUnit[iy][ix] != 0) {
                continue;
            }

            if (gBmMapMovement[iy][ix] <= movement) {
                movement = gBmMapMovement[iy][ix];

                x = ix;
                y = iy;
            }
        }
    }

    if (x >= 0) {
        AiTryMoveTowards(x, y, 0, 0xff, 1);
    }

    if (gAiDecision.actionPerformed == 1) {
        if ((gAiDecision.xMove == x) && (gAiDecision.yMove == y)) {
            AiUpdateDecision(AI_ACTION_RIDEBALLISTA, 0, 0, 0, 0);
        }
    } else {
        if (unk != 0) {
            gAiState.cmd_result[0] = 7;
        } else {
            gAiState.cmd_result[0] = 6;
        }
    }

    return 1;
}

//! FE8U = 0x0803F9A8
s8 sub_803F9A8(const void* input) {

    AiTryMoveTowards(((u8*)(input))[0], ((u8*)(input))[1], 0, 0xff, 1);

    return 1;
}

//! FE8U = 0x0803F9C8
s8 sub_803F9C8(const void* input) {
    gAiState.decideState = 4;

    return 1;
}
