#include "global.h"

#include "cp_common.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"

struct AiScr
{
    /* 00 */ u8 cmd;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u32 unk_04;
    /* 08 */ void* unk_08;
    /* 0C */ void* unk_0C;
};

typedef void(*AiScrCmd)(u8* pc);

typedef s8(*AiScrFunc)(void* arg);


extern s8 gUnknown_030017C8;
extern int gUnknown_030017CC;
extern struct AiScr* gUnknown_030017D0;
extern AiScrFunc gUnknown_030017D4;

extern struct AiScr gUnknown_085A812C[];
extern struct AiScr gUnknown_085A813C[];
extern u8 gUnknown_085A814C[];
extern struct AiScr** gUnknown_085A91D8[];
extern struct AiScr** gUnknown_085A91E4[];

extern AiScrCmd gUnknown_080D80FC[];

// forward decl.
void sub_803C5DC(u8*);

//! FE8U = 0x0803C4BC
s8 AiTryExecScriptA(void) {
    gUnknown_030017D0 = gUnknown_085A91E4[0][gActiveUnit->ai1];
    gUnknown_030017D0 = gUnknown_030017D0 + gActiveUnit->ai1data;

    gUnknown_030017C8 = 1;
    gUnknown_030017CC = 0;

    sub_803C5DC(&gActiveUnit->ai1data);

    return gUnknown_030017C8;
}

//! FE8U = 0x0803C510
s8 AiExecFallbackScriptA(void) {
    gUnknown_030017D0 = gUnknown_085A812C;

    gUnknown_030017C8 = 1;
    gUnknown_030017CC = 0;

    sub_803C5DC(&gActiveUnit->ai1data);

    return gUnknown_030017C8;
}

//! FE8U = 0x0803C54C
s8 AiTryExecScriptB(void) {
    gUnknown_030017D0 = gUnknown_085A91D8[0][gActiveUnit->ai2];
    gUnknown_030017D0 = gUnknown_030017D0 + gActiveUnit->ai2data;

    gUnknown_030017C8 = 1;
    gUnknown_030017CC = 1;

    sub_803C5DC(&gActiveUnit->ai2data);

    return gUnknown_030017C8;
}

//! FE8U = 0x0803C5A0
s8 AiExecFallbackScriptB(void) {

    gUnknown_030017D0 = gUnknown_085A813C;

    gUnknown_030017C8 = 1;
    gUnknown_030017CC = 1;

    sub_803C5DC(&gActiveUnit->ai2data);

    return gUnknown_030017C8;
}

//! FE8U = 0x0803C5DC
void sub_803C5DC(u8* pc) {

    AiScrCmd hack[28];
    memcpy(hack, gUnknown_080D80FC, 0x70);

    if (gUnknown_030017D0->cmd >= 0x1D) {

        if (gUnknown_030017CC == 0) {
            gUnknown_030017D0 = gUnknown_085A812C;
        } else {
            gUnknown_030017D0 = gUnknown_085A813C;
        }

    }

    gAiState.unk7E = gUnknown_030017D0->unk_02;

    hack[gUnknown_030017D0->cmd](pc);

    return;
}

//! FE8U = 0x0803C648
void sub_803C648(u8* pc) {
    u8 target = gUnknown_030017D0->unk_03;
    u8 i = 0;

    if (AiCompare(gUnknown_030017D0->unk_08, gUnknown_030017D0->unk_01, gUnknown_030017D0->unk_04) == 1) {
        const struct AiScr* script;

        if (gUnknown_030017CC == 0) {
            script = gUnknown_085A91E4[0][gActiveUnit->ai1];
        } else {
            script = gUnknown_085A91D8[0][gActiveUnit->ai2];
        }

        if (target != 0) {

            while ((script[i].cmd != 0x1C) || (script[i].unk_03 != target)) {
                i++;
            }

            *pc = i + 1;
        } else {
            *pc = 0;
        }
    } else {
        (*pc)++;
    }

    gUnknown_030017C8 = 0;

    return;
}

//! FE8U = 0x0803C6EC
void sub_803C6EC(u8* pc) {
    gUnknown_030017D4 = gUnknown_030017D0->unk_08;

    gUnknown_030017C8 = gUnknown_030017D4(gUnknown_030017D0->unk_0C);

    (*pc)++;

    return;
}

//! FE8U = 0x0803C71C
void sub_803C71C(u8* pc) {
    u8 ai1 = gUnknown_030017D0->unk_01;
    u8 ai2 = gUnknown_030017D0->unk_02;

    if (ai1 != 0xFF) {
        gActiveUnit->ai1 = ai1;
        gActiveUnit->ai1data = 0;
    }

    if (ai2 != 0xFF) {
        gActiveUnit->ai2 = ai2;
        gActiveUnit->ai2data = 0;
    }

    if (((gUnknown_030017CC == 0) && (ai1 == 0xFF)) || ((gUnknown_030017CC == 1 && (ai2 == 0xFF))))  {
        (*pc)++;
    }

    gAiState.decideState = 0;

    return;
}

//! FE8U = 0x0803C78C
void sub_803C78C(u8* pc) {
    struct AiScr* script;

    u8 target = gUnknown_030017D0->unk_03;
    u8 i = 0;

    if (gUnknown_030017CC == 0) {
        script = gUnknown_085A91E4[0][gActiveUnit->ai1];
    } else {
        script = gUnknown_085A91D8[0][gActiveUnit->ai2];
    }

    if (target != 0) {
        while ((script[i].cmd != 0x1C || (script[i].unk_03 != target))) {
            i++;
        }

        *pc = i + 1;
    } else {
        *pc = 0;
    }

    gUnknown_030017C8 = 0;

    return;
}

//! FE8U = 0x0803C818
s8 sub_803C818(struct Unit* unit) {

    if (AreUnitsAllied(gActiveUnit->index, unit->index)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803C848
s8 sub_803C848(struct Unit* unit) {

    if (unit == gActiveUnit) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x0803C864
s8 sub_803C864(struct Unit* unit) {

    if ((AiIsInShortList(gUnknown_030017D0->unk_08, unit->pCharacterData->number) != 1) && !(AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C8AC
s8 sub_803C8AC(struct Unit* unit) {

    if ((AiIsInShortList(gUnknown_030017D0->unk_08, unit->pCharacterData->number) == 1) || !(AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C8F4
s8 sub_803C8F4(struct Unit* unit) {

    if ((unit->pCharacterData->number == gUnknown_030017D0->unk_04) && !(AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C934
s8 sub_803C934(struct Unit* unit) {

    if ((unit->pClassData->number == gUnknown_030017D0->unk_04) && (!AreUnitsAllied(gActiveUnit->index, unit->index))) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803C974
void sub_803C974(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gUnknown_030017D0->unk_01) {

        if (!sub_803FA40(sub_803C818)) {

            if (AiUnitWithCharIdExists(gUnknown_030017D0->unk_04) == 1) {
                if (GetUnitFromCharId(gUnknown_030017D0->unk_04)->state & 0x20) {
                    gAiState.unk86[0] = 3;
                    gUnknown_030017C8 = 0;
                } else {
                    sub_803D450(sub_803C8F4);
                }
            } else {
                gAiState.unk86[0] = 1;
                gUnknown_030017C8 = 0;
            }
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CA0C
void sub_803CA0C(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gUnknown_030017D0->unk_01) {
        if (gUnknown_030017D0->unk_08 == 0) {
            if (sub_803FA40(sub_803C818) == 0) {
                sub_803D450(sub_803C818);
            }
        } else {
            if (sub_803FA40(sub_803C8AC) == 0) {
                sub_803D450(sub_803C864);
            }
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CA7C
void sub_803CA7C(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CA84
void sub_803CA84(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gUnknown_030017D0->unk_01) {
        gAiState.flags |= 2;

        if (!sub_803FA40(sub_803C818)) {
            sub_803D450(sub_803C818);
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CAE4
void sub_803CAE4(u8* pc) {
    u8 rand = NextRN_N(100);

    if (rand <= gUnknown_030017D0->unk_01) {

        if (sub_803FA40(sub_803C934) == 0) {
            sub_803D450(sub_803C934);
        }
    } else {
        gAiState.decideState = 4;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CB34
void sub_803CB34(u8* pc) {

    sub_803FA40(sub_803C818);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB50
void sub_803CB50(u8* pc) {

    sub_803FA40(sub_803C818);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB6C
void sub_803CB6C(u8* pc) {

    sub_803FA40(sub_803C818);
    (*pc)++;

    return;
}

//! FE8U = 0x0803CB88
void sub_803CB88(u8* pc) {
    AiTryMoveTowards(gUnknown_030017D0->unk_01, gUnknown_030017D0->unk_03, 0, gUnknown_030017D0->unk_02, 1);

    if (gAiDecision.actionPerformed == 1) {
        if (gAiDecision.xMove == gUnknown_030017D0->unk_01) {
            if (gAiDecision.yMove == gUnknown_030017D0->unk_03) {
                (*pc)++;
            }
        }
    }

    return;
}

//! FE8U = 0x0803CBD4
void sub_803CBD4(u8* pc) {
    struct Vec2 pos;

    if (AiFindTargetInReachByCharId(gUnknown_030017D0->unk_04, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);

        if (AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 1) == 1) {
            struct Unit* unit = GetUnitFromCharId(gUnknown_030017D0->unk_04);
            if ((unit->state & 0x20) != 0) {
                gAiState.unk86[0] = 3;
            } else {
                AiUpdateDecision(0, 0, 0, 0, unit->index);

                gAiState.unk86[0] = 2;
                gAiDecision.actionPerformed = 0;
                gUnknown_030017C8 = 0;
            }
        }
    } else {
        gUnknown_030017C8 = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CC90
void sub_803CC90(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CC98
void sub_803CC98(u8* pc) {
    struct Vec2 pos;

    if (AiFindTargetInReachByClassId(gUnknown_030017D0->unk_04, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CCDC
void sub_803CCDC(u8* pc) {

    if (AiTryDoSpecialItems() == 1) {
        if (gUnknown_030017D0->unk_03 == 0) {
            return;
        }

        gActiveUnit->_u46++;

        if (gActiveUnit->_u46 != gUnknown_030017D0->unk_03) {
            return;
        }

        (*pc)++;
        gUnknown_030017C8 = 0;
    } else {
        struct Vec2 pos;
        u8 itemSlot;

        if (AiFindPillageLocation(&pos, &itemSlot) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, -1, 1);

            if (AiLocationIsPillageTarget(gAiDecision.xMove, gAiDecision.yMove) != 1) {
                return;
            }

            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, 4, 0, itemSlot, 0, 0);

            if (gUnknown_030017D0->unk_03 == 0) {
                return;
            }

            gActiveUnit->_u46++;

            if (gActiveUnit->_u46 != gUnknown_030017D0->unk_03) {
                return;
            }

            (*pc)++;
            gUnknown_030017C8 = 0;
        } else {
            (*pc)++;
            gUnknown_030017C8 = 0;
        }
    }

    return;
}

//! FE8U = 0x0803CDD4
void sub_803CDD4(u8* pc) {
    struct Vec2 pos;

    if (AiFindSafestReachableLocation(gActiveUnit, &pos) == 1) {
        AiSetDecision(pos.x, pos.y, 0, 0, 0, 0, 0);
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CE18
void sub_803CE18(u8* pc) {
    struct Vec2 pos;

    if (gUnknown_030017D0->unk_08 == 0) {
        if (AiFindTargetInReachByFunc(sub_803C818, &pos) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
        }
    } else {
        if (AiFindTargetInReachByFunc(sub_803C864, &pos) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
        }
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CE98
void sub_803CE98(u8* pc) {
    struct Vec2 pos;

    if (gUnknown_030017D0->unk_08 == 0) {
        if (sub_803AA40(sub_803C818, &pos) == 1) {
            sub_803BBF4(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
        }
    } else {
        if (sub_803AA40(sub_803C864, &pos) == 1) {
            sub_803BBF4(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
        }
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803CF18
void sub_803CF18(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CF20
void sub_803CF20(u8* pc) {
    (*pc)++;
    return;
}

//! FE8U = 0x0803CF28
void sub_803CF28(u8* pc) {
    AiRandomMove();

    (*pc)++;

    return;
}

//! FE8U = 0x0803CF3C
void sub_803CF3C(u8* pc) {
    gActiveUnit->aiFlags |= 8;
    AiTryMoveTowardsEscape();

    (*pc)++;

    return;
}

//! FE8U = 0x0803CF60
int sub_803CF60(int x, int y) {
    return ((sub_803E23C(x, y) + sub_803E27C(x, y)) - ((s8**)(gBmMapMovement))[y][x] - gBmMapOther[y][x] / 8) + 0x7FFFFFFF;
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
void sub_803D228(u8* pc) {
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
        gUnknown_030017C8 = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803D2D8
void sub_803D2D8(u8* pc) {
    struct Vec2 pos;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(&gUnknown_030017D0->unk_03, 0, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
    } else {
        gAiState.unk86[0] = 4;
        gUnknown_030017C8 = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803D354
void sub_803D354(u8* pc) {
    struct Vec2 pos;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    if (AiFindClosestTerrainPosition(gUnknown_030017D0->unk_08, 0, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, gUnknown_030017D0->unk_02, 1);
    } else {
        gAiState.unk86[0] = 4;
        gUnknown_030017C8 = 0;
    }

    (*pc)++;

    return;
}

//! FE8U = 0x0803D3D0
void sub_803D3D0(u8* pc) {
    (*pc)++;
    gUnknown_030017C8 = 0;

    return;
}

//! FE8U = 0x0803D3E4
void AiDoBerserkAction(void) {
    if (!sub_803FA40(sub_803C818)) {
        sub_803D450(sub_803C848);
    }

    return;
}

//! FE8U = 0x0803D404
void AiDoBerserkMove(void) {
    struct Vec2 pos;

    if (AiFindTargetInReachByFunc(sub_803C848, &pos) == 1) {
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
