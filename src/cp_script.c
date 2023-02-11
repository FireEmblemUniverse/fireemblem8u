#include "global.h"

#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"

#include "cp_script.h"

enum ScriptKind {
    AI_SCRIPT_AI1,
    AI_SCRIPT_AI2,
};

typedef void(*AiScrCmd)(u8* pc);

static s8 gAiScriptEnded;
static int gAiScriptKind;
static struct AiScr* gpAiScriptCurrent;
static AiScrFunc gpCurrentAiFunctionCall;

extern struct AiScr gAiScript_FallbackAi1[];
extern struct AiScr gAiScript_FallbackAi2[];

// forward decl.
void AiScript_Exec(u8*);

void AiScriptCmd_00_ConditionalGoto(u8* pc);
void AiScriptCmd_01_FunctionCall(u8* pc);
void AiScriptCmd_02_ChangeAi(u8* pc);
void AiScriptCmd_03_Goto(u8* pc);
void AiScriptCmd_04_ActionOnSelectedCharacter(u8* pc);
void AiScriptCmd_05_DoStandardAction(u8* pc);
void AiScriptCmd_06_DoNothing(u8* pc);
void AiScriptCmd_07_DoStandardActionNoMove(u8* pc);
void AiScriptCmd_08_DoStandardActionAgainstClass(u8* pc);
void AiScriptCmd_09_DoStaffAction(u8* pc);
void AiScriptCmd_0A_DoStaffAction(u8* pc);
void AiScriptCmd_0B_DoStaffAction(u8* pc);
void AiScriptCmd_0C_MoveTowardsSetPoint(u8* pc);
void AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(u8* pc);
void AiScriptCmd_0E_DoNothing(u8* pc);
void AiScriptCmd_0F_MoveTowardsUnitWithClass(u8* pc);
void AiScriptCmd_10_DoLooting(u8* pc);
void AiScriptCmd_11_MoveTowardsSafety(u8* pc);
void AiScriptCmd_12_MoveTowardsEnemy(u8* pc);
void AiScriptCmd_13(u8* pc);
void AiScriptCmd_14_DoNothing(u8* pc);
void AiScriptCmd_15_DoNothing(u8* pc);
void AiScriptCmd_16_RandomMovement(u8* pc);
void AiScriptCmd_17_DoEscape(u8* pc);
void AiScriptCmd_18_TryAttackSnagWall(u8* pc);
void AiScriptCmd_19_MoveTowardsTerrain(u8* pc);
void AiScriptCmd_1A_MoveTowardsTerrain(u8* pc);
void AiScriptCmd_1B_NoOp(u8* pc);

//! FE8U = 0x0803C4BC
s8 AiTryExecScriptA(void) {
    gpAiScriptCurrent = gpAi1Table[0][gActiveUnit->ai1];
    gpAiScriptCurrent = gpAiScriptCurrent + gActiveUnit->ai1data;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI1;

    AiScript_Exec(&gActiveUnit->ai1data);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C510
s8 AiExecFallbackScriptA(void) {
    gpAiScriptCurrent = gAiScript_FallbackAi1;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI1;

    AiScript_Exec(&gActiveUnit->ai1data);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C54C
s8 AiTryExecScriptB(void) {
    gpAiScriptCurrent = gpAi2Table[0][gActiveUnit->ai2];
    gpAiScriptCurrent = gpAiScriptCurrent + gActiveUnit->ai2data;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI2;

    AiScript_Exec(&gActiveUnit->ai2data);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C5A0
s8 AiExecFallbackScriptB(void) {

    gpAiScriptCurrent = gAiScript_FallbackAi2;

    gAiScriptEnded = 1;
    gAiScriptKind = AI_SCRIPT_AI2;

    AiScript_Exec(&gActiveUnit->ai2data);

    return gAiScriptEnded;
}

//! FE8U = 0x0803C5DC
void AiScript_Exec(u8* pc) {

    AiScrCmd funcLut[] = {
        [AI_CMD_CONDITIONAL]        = AiScriptCmd_00_ConditionalGoto,
        [AI_CMD_CALL_FUNC]          = AiScriptCmd_01_FunctionCall,
        [AI_CMD_SET_AI]             = AiScriptCmd_02_ChangeAi,
        [AI_CMD_GOTO]               = AiScriptCmd_03_Goto,
        [AI_CMD_ACTION_ON_CHAR]     = AiScriptCmd_04_ActionOnSelectedCharacter,
        [AI_CMD_ACTION]             = AiScriptCmd_05_DoStandardAction,
        [AI_CMD_NOP]                = AiScriptCmd_06_DoNothing,
        [AI_CMD_ACTION_IN_PLACE]    = AiScriptCmd_07_DoStandardActionNoMove,
        [AI_CMD_ACTION_ON_CLASS]    = AiScriptCmd_08_DoStandardActionAgainstClass,
        [AI_CMD_STAFF_ACTION]       = AiScriptCmd_09_DoStaffAction,
        [AI_CMD_STAFF_ACTION_2]     = AiScriptCmd_0A_DoStaffAction,
        [AI_CMD_STAFF_ACTION_3]     = AiScriptCmd_0B_DoStaffAction,
        [AI_CMD_MOVE_TOWARDS]       = AiScriptCmd_0C_MoveTowardsSetPoint,
        [AI_CMD_MOVE_TOWARDS_CHAR]  = AiScriptCmd_0D_MoveTowardsCharacterUntilInRange,
        [AI_CMD_NOP_0E]             = AiScriptCmd_0E_DoNothing,
        [AI_CMD_MOVE_TOWARDS_CLASS] = AiScriptCmd_0F_MoveTowardsUnitWithClass,
        [AI_CMD_PILLAGE]            = AiScriptCmd_10_DoLooting,
        [AI_CMD_MOVE_TO_SAFETY]     = AiScriptCmd_11_MoveTowardsSafety,
        [AI_CMD_MOVE_TO_ENEMY]      = AiScriptCmd_12_MoveTowardsEnemy,
        [AI_CMD_MOVE_TO_ENEMY_2]    = AiScriptCmd_13,
        [AI_CMD_NOP_14]             = AiScriptCmd_14_DoNothing,
        [AI_CMD_NOP_15]             = AiScriptCmd_15_DoNothing,
        [AI_CMD_MOVE_RANDOM]        = AiScriptCmd_16_RandomMovement,
        [AI_CMD_ESCAPE]             = AiScriptCmd_17_DoEscape,
        [AI_CMD_ATTACK_WALLS]       = AiScriptCmd_18_TryAttackSnagWall,
        [AI_CMD_MOVE_TO_TERRAIN]    = AiScriptCmd_19_MoveTowardsTerrain,
        [AI_CMD_MOVE_TO_LISTED_TERRAIN] = AiScriptCmd_1A_MoveTowardsTerrain,
        [AI_CMD_1B]                 = AiScriptCmd_1B_NoOp,
    };

    if (gpAiScriptCurrent->cmd >= AI_CMD_COUNT) {

        if (gAiScriptKind == AI_SCRIPT_AI1) {
            gpAiScriptCurrent = gAiScript_FallbackAi1;
        } else {
            gpAiScriptCurrent = gAiScript_FallbackAi2;
        }

    }

    gAiState.unk7E = gpAiScriptCurrent->unk_02;

    funcLut[gpAiScriptCurrent->cmd](pc);

    return;
}

//! FE8U = 0x0803C648
void AiScriptCmd_00_ConditionalGoto(u8* pc) {
    u8 target = gpAiScriptCurrent->unk_03;
    u8 i = 0;

    if (AiCompare(gpAiScriptCurrent->unk_08, gpAiScriptCurrent->unk_01, gpAiScriptCurrent->unk_04) == 1) {
        const struct AiScr* script;

        if (gAiScriptKind == AI_SCRIPT_AI1) {
            script = gpAi1Table[0][gActiveUnit->ai1];
        } else {
            script = gpAi2Table[0][gActiveUnit->ai2];
        }

        if (target != 0) {

            while ((script[i].cmd != AI_CMD_LABEL) || (script[i].unk_03 != target)) {
                i++;
            }

            *pc = i + 1;
        } else {
            *pc = 0;
        }
    } else {
        (*pc)++;
    }

    gAiScriptEnded = 0;

    return;
}

//! FE8U = 0x0803C6EC
void AiScriptCmd_01_FunctionCall(u8* pc) {
    gpCurrentAiFunctionCall = gpAiScriptCurrent->unk_08;

    gAiScriptEnded = gpCurrentAiFunctionCall(gpAiScriptCurrent->unk_0C);

    (*pc)++;

    return;
}

//! FE8U = 0x0803C71C
void AiScriptCmd_02_ChangeAi(u8* pc) {
    u8 ai1 = gpAiScriptCurrent->unk_01;
    u8 ai2 = gpAiScriptCurrent->unk_02;

    if (ai1 != 0xFF) {
        gActiveUnit->ai1 = ai1;
        gActiveUnit->ai1data = 0;
    }

    if (ai2 != 0xFF) {
        gActiveUnit->ai2 = ai2;
        gActiveUnit->ai2data = 0;
    }

    if (((gAiScriptKind == 0) && (ai1 == 0xFF)) || ((gAiScriptKind == 1 && (ai2 == 0xFF))))  {
        (*pc)++;
    }

    gAiState.decideState = 0;

    return;
}

//! FE8U = 0x0803C78C
void AiScriptCmd_03_Goto(u8* pc) {
    struct AiScr* script;

    u8 target = gpAiScriptCurrent->unk_03;
    u8 i = 0;

    if (gAiScriptKind == AI_SCRIPT_AI1) {
        script = gpAi1Table[0][gActiveUnit->ai1];
    } else {
        script = gpAi2Table[0][gActiveUnit->ai2];
    }

    if (target != 0) {
        while ((script[i].cmd != AI_CMD_LABEL || (script[i].unk_03 != target))) {
            i++;
        }

        *pc = i + 1;
    } else {
        *pc = 0;
    }

    gAiScriptEnded = 0;

    return;
}

//! FE8U = 0x0803C818
s8 AiIsUnitEnemy(struct Unit* unit) {

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803C848
s8 AiIsUnitNonActive(struct Unit* unit) {

    if (unit == gActiveUnit) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803C864
s8 AiIsUnitEnemyAndNotInScrList(struct Unit* unit) {

    if ((AiIsInShortList(gpAiScriptCurrent->unk_08, unit->pCharacterData->number) != 1) && !(AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C8AC
s8 AiIsUnitEnemyOrInScrList(struct Unit* unit) {

    if ((AiIsInShortList(gpAiScriptCurrent->unk_08, unit->pCharacterData->number) == 1) || !(AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C8F4
s8 AiIsUnitEnemyAndScrCharId(struct Unit* unit) {

    if ((unit->pCharacterData->number == gpAiScriptCurrent->unk_04) && !(AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C934
s8 AiIsUnitEnemyAndScrClassId(struct Unit* unit) {

    if ((unit->pClassData->number == gpAiScriptCurrent->unk_04) && (!AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C974
void AiScriptCmd_04_ActionOnSelectedCharacter(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {

        if (!AiTryDoStaff(AiIsUnitEnemy)) {

            if (AiUnitWithCharIdExists(gpAiScriptCurrent->unk_04) == 1) {
                if (GetUnitFromCharId(gpAiScriptCurrent->unk_04)->state & US_RESCUED) {
                    gAiState.unk86[0] = 3;
                    gAiScriptEnded = 0;
                } else {
                    AiAttemptOffensiveAction(AiIsUnitEnemyAndScrCharId);
                }
            } else {
                gAiState.unk86[0] = 1;
                gAiScriptEnded = 0;
            }
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CA0C
void AiScriptCmd_05_DoStandardAction(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {
        if (gpAiScriptCurrent->unk_08 == 0) {
            if (AiTryDoStaff(AiIsUnitEnemy) == 0) {
                AiAttemptOffensiveAction(AiIsUnitEnemy);
            }
        } else {
            if (AiTryDoStaff(AiIsUnitEnemyOrInScrList) == 0) {
                AiAttemptOffensiveAction(AiIsUnitEnemyAndNotInScrList);
            }
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CA7C
void AiScriptCmd_06_DoNothing(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CA84
void AiScriptCmd_07_DoStandardActionNoMove(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {
        gAiState.flags |= AI_FLAG_1;

        if (!AiTryDoStaff(AiIsUnitEnemy)) {
            AiAttemptOffensiveAction(AiIsUnitEnemy);
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CAE4
void AiScriptCmd_08_DoStandardActionAgainstClass(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gpAiScriptCurrent->unk_01) {

        if (AiTryDoStaff(AiIsUnitEnemyAndScrClassId) == 0) {
            AiAttemptOffensiveAction(AiIsUnitEnemyAndScrClassId);
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CB34
void AiScriptCmd_09_DoStaffAction(u8* pc) {

    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB50
void AiScriptCmd_0A_DoStaffAction(u8* pc) {

    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB6C
void AiScriptCmd_0B_DoStaffAction(u8* pc) {

    AiTryDoStaff(AiIsUnitEnemy);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB88
void AiScriptCmd_0C_MoveTowardsSetPoint(u8* pc) {
    AiTryMoveTowards(gpAiScriptCurrent->unk_01, gpAiScriptCurrent->unk_03, 0, gpAiScriptCurrent->unk_02, 1);

    if (gAiDecision.actionPerformed == 1) {
        if (gAiDecision.xMove == gpAiScriptCurrent->unk_01) {
            if (gAiDecision.yMove == gpAiScriptCurrent->unk_03) {
                (*pc)++;
            }
        }
    }

    return;
}

//! FE8U = 0x0803CBD4
void AiScriptCmd_0D_MoveTowardsCharacterUntilInRange(u8* pc) {
    struct Vec2 pos;

    if (AiFindTargetInReachByCharId(gpAiScriptCurrent->unk_04, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);

        if (AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 1) == 1) {
            struct Unit* unit = GetUnitFromCharId(gpAiScriptCurrent->unk_04);
            if ((unit->state & US_RESCUED) != 0) {
                gAiState.unk86[0] = 3;
            } else {
                AiUpdateDecision(0, 0, 0, 0, unit->index);

                gAiState.unk86[0] = 2;
                gAiDecision.actionPerformed = 0;
                gAiScriptEnded = 0;
            }
        }
    } else {
        gAiScriptEnded = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CC90
void AiScriptCmd_0E_DoNothing(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CC98
void AiScriptCmd_0F_MoveTowardsUnitWithClass(u8* pc) {
    struct Vec2 pos;

    if (AiFindTargetInReachByClassId(gpAiScriptCurrent->unk_04, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CCDC
void AiScriptCmd_10_DoLooting(u8* pc) {

    if (AiTryDoSpecialItems() == 1) {
        if (gpAiScriptCurrent->unk_03 == 0) {
            return;
        }

        gActiveUnit->_u46++;

        if (gActiveUnit->_u46 != gpAiScriptCurrent->unk_03) {
            return;
        }

        (*pc)++;
        gAiScriptEnded = 0;
    } else {
        struct Vec2 pos;
        u8 itemSlot;

        if (AiFindPillageLocation(&pos, &itemSlot) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, -1, 1);

            if (AiLocationIsPillageTarget(gAiDecision.xMove, gAiDecision.yMove) != 1) {
                return;
            }

            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, 4, 0, itemSlot, 0, 0);

            if (gpAiScriptCurrent->unk_03 == 0) {
                return;
            }

            gActiveUnit->_u46++;

            if (gActiveUnit->_u46 != gpAiScriptCurrent->unk_03) {
                return;
            }

            (*pc)++;
            gAiScriptEnded = 0;
        } else {
            (*pc)++;
            gAiScriptEnded = 0;
        }
    }

    return;
}

//! FE8U = 0x0803CDD4
void AiScriptCmd_11_MoveTowardsSafety(u8* pc) {
    struct Vec2 pos;

    if (AiFindSafestReachableLocation(gActiveUnit, &pos) == 1) {
        AiSetDecision(pos.x, pos.y, 0, 0, 0, 0, 0);
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CE18
void AiScriptCmd_12_MoveTowardsEnemy(u8* pc) {
    struct Vec2 pos;

    if (gpAiScriptCurrent->unk_08 == 0) {
        if (AiFindTargetInReachByFunc(AiIsUnitEnemy, &pos) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    } else {
        if (AiFindTargetInReachByFunc(AiIsUnitEnemyAndNotInScrList, &pos) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CE98
void AiScriptCmd_13(u8* pc) {
    struct Vec2 pos;

    if (gpAiScriptCurrent->unk_08 == 0) {
        if (sub_803AA40(AiIsUnitEnemy, &pos) == 1) {
            sub_803BBF4(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    } else {
        if (sub_803AA40(AiIsUnitEnemyAndNotInScrList, &pos) == 1) {
            sub_803BBF4(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CF18
void AiScriptCmd_14_DoNothing(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CF20
void AiScriptCmd_15_DoNothing(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CF28
void AiScriptCmd_16_RandomMovement(u8* pc) {
    AiRandomMove();

    (*pc)++;

    return;
}

//! FE8U = 0x0803CF3C
void AiScriptCmd_17_DoEscape(u8* pc) {
    gActiveUnit->aiFlags |= AI_UNIT_FLAG_3;
    AiTryMoveTowardsEscape();

    (*pc)++;

    return;
}

//! FE8U = 0x0803CF60
int sub_803CF60(int x, int y) {
    return ((AiGetTerrainCombatPositionScoreComponent(x, y) + AiGetFriendZoneCombatPositionScoreComponent(x, y)) - ((s8**)(gBmMapMovement))[y][x] - gBmMapOther[y][x] / 8) + 0x7FFFFFFF;
}

//! FE8U = 0x0803CFB4
s8 sub_803CFB4(int x, int y, struct Vec2* out, u8* itemSlotOut) {
    int slot;

    int xOut = -1;
    int yOut = -1;

    u32 best = 0;

    GenerateUnitMovementMap(gActiveUnit);

    for (slot = 0; slot < 5; slot++) {
        int ix;
        int iy;

        u16 item = gActiveUnit->items[slot];

        if (item == 0) {
            break;
        }

        if (!CanUnitUseWeapon(gActiveUnit, item)) {
            continue;
        }

        BmMapFill(gBmMapRange, 0);
        MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                u32 current;

                if (gBmMapMovement[iy][ix] > 0x78) {
                    continue;
                }

                if (((s8**)(gBmMapRange))[iy][ix] == 0) {
                    continue;
                }

                if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                    continue;
                }

                current = GetItemMight(item) + sub_803CF60(ix, iy);

                if (current > best) {
                    xOut = ix;
                    yOut = iy;
                    best = current;

                    *itemSlotOut = slot;
                }
            }
        }
    }

    if (best == 0) {
        return 0;
    }

    out->x = xOut;
    out->y = yOut;

    return 1;
}

//! FE8U = 0x0803D124
s8 sub_803D124(const u8* terrainList, u32 flags, struct Vec2* out) {
    int ix;
    int iy;

    u8 best = 0xff;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapRange[iy][ix] > 0x78) {
                continue;
            }

            if (AiIsInByteList(terrainList, gBmMapTerrain[iy][ix]) == 0) {
                continue;
            }

            if (flags & 1) {
                if (gBmMapUnit[iy][ix] != 0 && !AreUnitsAllied(gActiveUnit->index, gBmMapUnit[iy][ix])) {
                    continue;
                }
            }

            if (flags & 2) {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0) {
                    continue;
                }
            }

            if (best <= ((s8**)(gBmMapRange))[iy][ix]) {
                continue;
            }

            out->x = ix;
            out->y = iy;
            best = gBmMapRange[iy][ix];
        }
    }

    if (best != 0xff) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803D228
void AiScriptCmd_18_TryAttackSnagWall(u8* pc) {
    struct Vec2 posA;
    struct Vec2 posB;
    u8 slot;

    sub_8041020(gActiveUnit);

    if (sub_803D124(gUnknown_085A814C, 0, &posA) == 1) {
        if (sub_803CFB4(posA.x, posA.y, &posB, &slot) == 1) {

            struct Trap* trap = GetTrapAt(posA.x, posA.y);

            if (trap == 0) {
                return;
            }

            AiSetDecision(posB.x, posB.y, 1, 0, slot, posA.x, posA.y);
        } else {
            AiTryMoveTowards(posA.x, posA.y, 0, 0xff, 1);
        }
    } else {
        gAiState.unk86[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803D2D8
void AiScriptCmd_19_MoveTowardsTerrain(u8* pc) {
    struct Vec2 pos;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(&gpAiScriptCurrent->unk_03, 0, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    } else {
        gAiState.unk86[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803D354
void AiScriptCmd_1A_MoveTowardsTerrain(u8* pc) {
    struct Vec2 pos;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(gpAiScriptCurrent->unk_08, 0, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
    } else {
        gAiState.unk86[0] = 4;
        gAiScriptEnded = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803D3D0
void AiScriptCmd_1B_NoOp(u8* pc) {
    (*pc)++;
    gAiScriptEnded = 0;

    return;
}

//! FE8U = 0x0803D3E4
void AiDoBerserkAction(void) {
    if (!AiTryDoStaff(AiIsUnitEnemy)) {
        AiAttemptOffensiveAction(AiIsUnitNonActive);
    }

    return;
}

//! FE8U = 0x0803D404
void AiDoBerserkMove(void) {
    struct Vec2 pos;

    if (AiFindTargetInReachByFunc(AiIsUnitNonActive, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y , 0, -1, 1);
    }

    return;
}

//! FE8U = 0x0803D43C
s8 sub_803D43C(void) {
    return 1;
}

//! FE8U = 0x0803D440
s8 sub_803D440(u8* arg) {
    AiGetClassRank(*arg);

    return 1;
}
