#ifndef GUARD_CP_UTILITY_H
#define GUARD_CP_UTILITY_H

s8 AiCompare(const u8* left, u8 op, u32 right);
s8 AiFindTargetInReachByCharId(int uid, struct Vec2* out);
s8 AiFindTargetInReachByClassId(int classId, struct Vec2* out);
s8 AiFindTargetInReachByFunc(s8(*func)(struct Unit* unit), struct Vec2* out);
s8 AiFindTargetInReachNeglectWallByFunc(s8(*func)(struct Unit* unit), struct Vec2* out);
void AiRandomMove(void);
s8 AiReachesByBirdsEyeDistance(struct Unit* unit, struct Unit* other, u16 item);
s8 AiCouldReachByBirdsEyeDistance(struct Unit* unit, struct Unit* other, u16 item);
s8 AiIsInShortList(const u16* list, u16 item);
s8 AiIsInByteList(const u8* list, u8 item);
s8 AiFindClosestTerrainPosition(const u8*, int, struct Vec2*);
// ??? AiGetPositionRange(???);
s8 AiFindClosestTerrainAdjacentPosition(const u8*, int, struct Vec2*);
s8 AiFindClosestUnlockPosition(int, struct Vec2*, struct Vec2*);
// ??? AiCountUnitsInRange(???);
int AiCountEnemyUnitsInRange(void);
// ??? AiCountAlliedUnitsInRange(???);
// ??? AiCountNearbyUnits(???);
int AiCountNearbyEnemyUnits(s16, s16);
// ??? AiCountNearbyAlliedUnits(???);
void FillMovementAndRangeMapForItem(struct Unit* unit, u16 item);
// ??? AiMakeMoveRangeUnitPowerMaps(???);
// ??? AiMakeMoveRangeItemRangeMaps(???);
s8 AiFindBestAdjacentPositionByFunc(int, int, u8(*)(int, int), struct Vec2*);
int AiGetItemStealRank(u16 item);
s8 AiGetUnitStealItemSlot(struct Unit* unit);
s8 AiFindSafestReachableLocation(struct Unit*, struct Vec2*);
s8 AiFindPillageLocation(struct Vec2* out, u8* outItemSlot);
// ??? AiGetChestUnlockItemSlot(???);
void AiTryMoveTowards(s16, s16, u8, u8, u8);
void AiTryMoveTowardsNeglectWall(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk);
s8 AiGetUnitClosestValidPosition(struct Unit* unit, s16 x, s16 y, struct Vec2* out);
u8 AiGetClassRank(u8 classId);
s8 AiUnitWithCharIdExists(u16 uid);
s8 AiIsWithinRectDistance(s16, s16, u8, u8, u8);
s8 AiLocationIsPillageTarget(u8 x, u8 y);
void SetupUnitInventoryAIFlags(void);
// ??? SetupUnitStatusStaffAIFlags(???);
// ??? SetupUnitHealStaffAIFlags(???);
// ??? SaveNumberOfAlliedUnitsIn0To8Range(???);
void CharStoreAI(struct Unit* unit, const struct UnitDefinition* uDef);
s8 GetAiBestSafeStaffTargetPosition(struct Vec2* out);
int AiCountCurrentPhaseFlaggedUnits(void);
int AiCountAlliedFlaggedUnitsInRange(void);
s8 AiCanUnitUseAnyStaff(struct Unit* unit);
void AiGenerateUnitMovementMapRespectStay(struct Unit*);

#endif // GUARD_CP_UTILITY_H
