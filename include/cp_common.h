#ifndef GUARD_CP_COMMON_H
#define GUARD_CP_COMMON_H

#include "global.h"

struct AiState
{
    /* 00 */ u8 units[116];
    /* 74 */ u8 * unitIt;
    /* 78 */ u8 orderState;
    /* 79 */ u8 decideState;
    /* 7A */ s8 dangerMapFilled; // bool
    /* 7B */ u8 flags;
    /* 7C */ u8 unk7C;
    /* 7D */ u8 combatWeightTableId;
    /* 7E */ u8 unk7E;
    /* 7F */ u8 unk7F;
    /* 80 */ u32 specialItemFlags;
    /* 84 */ u8 unk84;
    /* 85 */ u8 bestBlueMov;
    /* 86 */ u8 unk86[8];
};

struct AiDecision
{
    /* 00 */ u8 actionId;

    /* 01 */ u8 unitId;
    /* 02 */ u8 xMove;
    /* 03 */ u8 yMove;
    /* 04 */ u8 unk04;
    /* 05 */ u8 unk05;
    /* 06 */ u8 targetId;
    /* 07 */ u8 itemSlot;
    /* 08 */ u8 xTarget;
    /* 09 */ u8 yTarget;

    /* 0A */ s8 actionPerformed;
};

enum
{
    AI_FLAGS_NONE = 0,

    AI_FLAG_0 = (1 << 0),
    AI_FLAG_1 = (1 << 1),
    AI_FLAG_BERSERKED = (1 << 2),
    AI_FLAG_3 = (1 << 3),
};

enum
{
    AI_UNIT_FLAG_0 = (1 << 0),
    AI_UNIT_FLAG_1 = (1 << 1),
    AI_UNIT_FLAG_2 = (1 << 2),
    AI_UNIT_FLAG_3 = (1 << 3),
    AI_UNIT_FLAG_4 = (1 << 4),
    AI_UNIT_FLAG_5 = (1 << 5),
    AI_UNIT_FLAG_6 = (1 << 6),
};

enum
{
    AI_ACTION_NONE = 0, // move only
    AI_ACTION_COMBAT = 1,
    AI_ACTION_ESCAPE = 2,
    AI_ACTION_STEAL = 3,
    AI_ACTION_PILLAGE = 4,
    AI_ACTION_STAFF = 5,
    AI_ACTION_USEITEM = 6,
    AI_ACTION_REFRESH = 7,
    AI_ACTION_TALK = 8,
    AI_ACTION_RIDEBALLISTA = 9,
    AI_ACTION_EXITBALLISTA = 10,
    AI_ACTION_DKNIGHTMARE = 11,
    AI_ACTION_DKSUMMON = 12,
    AI_ACTION_PICK = 13,
};

enum
{
    AI_COMPARE_GT,
    AI_COMPARE_GE,
    AI_COMPARE_EQ,
    AI_COMPARE_LE,
    AI_COMPARE_LT,
    AI_COMPARE_NE,
};

struct AiCombatSimulationSt
{
    /* 00 */ u8 xMove;
    /* 01 */ u8 yMove;
    /* 02 */ u8 targetId;
    /* 04 */ u16 itemSlot;
    /* 08 */ u32 score;
};

extern struct AiState gAiState;
extern struct AiDecision gAiDecision;

extern void(*AiDecideMainFunc)(void);

extern struct ProcCmd CONST_DATA gProcScr_CpPhase[];
extern struct ProcCmd CONST_DATA gProcScr_BerserkCpPhase[];
extern struct ProcCmd CONST_DATA gProcScr_CpOrder[];
extern struct ProcCmd CONST_DATA gProcScr_BerserkCpOrder[];
extern struct ProcCmd CONST_DATA gProcScr_CpDecide[];
extern struct ProcCmd CONST_DATA gProcScr_CpPerform[];

void AiClearDecision(void);
void AiSetDecision(s16 xMove, s16 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget);
void AiUpdateDecision(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget);
void AiDecideMain(void);

s8 AiAttemptOffensiveAction(s8 (* isEnemy)(struct Unit * unit));
s8 AiAttemptCombatWithinMovement(s8 (* isEnemy)(struct Unit * unit));
void AiFillReversedAttackRangeMap(struct Unit *, u16);
void AiFloodMovementAndRange(struct Unit * unit, u16 move, u16 item);
s8 AiAttemptBallistaCombat(s8 (* isEnemy)(struct Unit * unit), struct AiCombatSimulationSt*);
u8 AiAttemptStealAction_GetMovementAt(int x, int y);
s8 AiAttemptStealActionWithinMovement(void);
s8 AiSimulateBestBattleAgainstTarget(struct AiCombatSimulationSt *);
s8 AiSimulateBestBallistaBattleAgainstTarget(struct AiCombatSimulationSt *, u16);
u32 AiGetCombatPositionScore(int, int, struct AiCombatSimulationSt *);
s8 AiIsBadFight(struct AiCombatSimulationSt * st);
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt *);
int AiGetDamageDealtCombatScoreComponent(void);
int AiGetOpponentLowHpScoreComponent(void);
int AiGetFriendZoneCombatScoreComponent(void);
int AiGetTargetClassCombatScoreComponent(void);
int AiGetTurnCombatScoreComponent(void);
int AiGetDamageTakenScoreComponent(void);
int AiGetDangerScoreComponent(void);
int AiGetLowHpScoreComponent(void);
void AiComputeCombatScore(struct AiCombatSimulationSt * st);
int AiGetInRangeCombatPositionScoreComponent(int, int, struct Unit*);
int AiGetTerrainCombatPositionScoreComponent(int, int);
int AiGetFriendZoneCombatPositionScoreComponent(int, int);
void AiInitDangerMap(void);
// ??? AiFillDangerMap(???);
s8 AiCheckDangerAt(int, int, u8);
s8 AiTryGetNearestHealPoint(struct Vec2* out);
void UpdateAllPhaseHealingAIStatus(void);
s8 AiUpdateGetUnitIsHealing(struct Unit* unit);
s8 AiTryHealSelf(void);
s8 AiTryMoveTowardsEscape(void);
// ??? GetEscapePointStructThingMaybe(???);
s8 sub_803E900(void);
s8 sub_803E93C(u16*);
void sub_803EA58(int, int, u16*, u16*, u16*);
// ??? sub_803EBA4(???);
void sub_803EBF0(u16, u16, u16, u16*);
// ??? sub_803EC18(???);
// ??? sub_803EC54(???);
// ??? StoreItemAndGetUnitAttack(???);
void AiTryDanceOrStealAfterMove(void);
void AiTryActionAfterMove(void);
// ??? AiTryDoDanceAdjacent(???);
// ??? AiTryDoStealAdjacent(???);
// ??? sub_803EEB0(???);
// ??? AiIsUnitAtPositionDifferentAllegiance(???);
s8 sub_803F018(const void*);
// ??? sub_803F15C(???);
s8 sub_803F330(const void*);
s8 sub_803F34C(const void*);
// ??? sub_803F37C(???);
// ??? sub_803F3AC(???);
s8 sub_803F434(const void*);
s8 sub_803F4A4(const void*);
// ??? sub_803F4EC(???);
s8 sub_803F51C(const void*);
// ??? sub_803F5E0(???);
// ??? sub_803F61C(???);
// ??? sub_803F680(???);
// ??? sub_803F6B8(???);
s8 sub_803F72C(const void*);
s8 sub_803F790(const void*);
s8 sub_803F7DC(const void*);
// ??? sub_803F82C(???);
s8 sub_803F9A8(const void*);
// ??? sub_803F9C8(???);
// ??? GetAiStaffFuncIndex(???);
s8 AiTryDoStaff(s8 (*isEnemy)(struct Unit* unit)); // AiTryDoStaff
// ??? GetAiSafestAccessibleAdjacentPosition(???);
// ??? AiStaffHealMendRecover(???);
// ??? AiStaffPhysicRescue(???);
// ??? AiStaffFortify(???);
// ??? AiStaffWarp(???);
// ??? AiStaffRestore(???);
// ??? sub_80402A8(???);
// ??? GetAiSilenceEffectivenessScore(???);
// ??? AiStaffSilence(???);
// ??? AiStaffSleepBerserk(???);
// ??? AiStaffBarrier(???);
s8 sub_8040668(struct Vec2*);
// ??? GetSpecialItemFuncIndex(???);
s8 AiTryDoSpecialItems(void);
// ??? AiSpecialItemDoorKey(???);
// ??? AiSpecialItemLockpick(???);
// ??? AiSpecialItemAntitoxin(???);
// ??? sub_8040AE0(???);
// ??? sub_8040B38(???);
// ??? sub_8040B8C(???);
// ??? sub_8040BB4(???);
// ??? sub_8040C5C(???);
// ??? AiSetMovCostTableWithPassableWalls(???);
// ??? sub_8040E04(???);
// ??? sub_8040E34(???);
void InitAiMoveMapForUnit(struct Unit*);
// ??? sub_8040E98(???);
// ??? sub_8040EC8(???);
// ??? sub_8040EF8(???);
void sub_8040F28(int x, int y, const s8* cost); // AiMapRangeFillMovementWithPassableWalls
void sub_8040F54(int, int, struct Unit*);
// ??? sub_8040F88(???);
// ??? sub_8040FBC(???);
// ??? sub_8040FEC(???);
void sub_8041020(struct Unit* unit);
void sub_8041054(struct Unit* unit);
void AiUpdateNoMoveFlag(struct Unit* unit);
void sub_80410C4(int, int, struct Unit*);
// ??? AiDetermineNightmareEffectiveness(???);
// ??? AiTryUseNightmareStaff(???);
// ??? AiDecideNightmareStaff(???);
// ??? AiTryDKSummon(???);
// ??? AiDecideDKSummon(???);

#endif // GUARD_CP_COMMON_H
