#ifndef GUARD_CP_UTILITY_H
#define GUARD_CP_UTILITY_H

s8 AiCompare(const u8* left, u8 op, u32 right);
s8 AiFindTargetInReachByCharId(int uid, struct Vec2* out);
s8 AiFindTargetInReachByClassId(int classId, struct Vec2* out);
s8 AiFindTargetInReachByFunc(s8(*func)(struct Unit* unit), struct Vec2* out);
s8 sub_803AA40(s8(*func)(struct Unit* unit), struct Vec2* out);
void AiRandomMove(void);
// ??? AiReachesByBirdsEyeDistance(???);
// ??? AiCouldReachByBirdsEyeDistance(???);
s8 AiIsInShortList(const u16* list, u16 item);
s8 AiIsInByteList(const u8* list, u8 item);
s8 AiFindClosestTerrainPosition(const u8*, int, struct Vec2*);
// ??? AiGetPositionRange(???);
s8 AiFindClosestTerrainAdjacentPosition(const u8*, int, struct Vec2*);
s8 AiFindClosestUnlockPosition(int, struct Vec2*, struct Vec2*);
// ??? AiCountUnitsInRange(???);
// ??? AiCountEnemyUnitsInRange(???);
// ??? AiCountAlliedUnitsInRange(???);
// ??? AiCountNearbyUnits(???);
int AiCountNearbyEnemyUnits(s16, s16);
// ??? AiCountNearbyAlliedUnits(???);
// ??? FillMovementAndRangeMapForItem(???);
// ??? AiMakeMoveRangeUnitPowerMaps(???);
// ??? sub_803B678(???);
s8 AiFindBestAdjacentPositionByFunc(int, int, u8(*)(int, int), struct Vec2*);
// ??? AiGetItemStealRank(???);
// ??? AiGetUnitStealItemSlot(???);
s8 AiFindSafestReachableLocation(struct Unit*, struct Vec2*);
s8 AiFindPillageLocation(struct Vec2* out, u8* outItemSlot);
// ??? AiGetChestUnlockItemSlot(???);
void AiTryMoveTowards(s16, s16, u8, u8, u8);
void sub_803BBF4(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk);
// ??? AiGetUnitClosestValidPosition(???);
u8 AiGetClassRank(u8 classId);
s8 AiUnitWithCharIdExists(u16 uid);
s8 AiIsWithinRectDistance(s16, s16, u8, u8, u8);
s8 AiLocationIsPillageTarget(u8 x, u8 y);
void SetupUnitInventoryAIFlags(void);
// ??? SetupUnitStatusStaffAIFlags(???);
// ??? SetupUnitHealStaffAIFlags(???);
// ??? SaveNumberOfAlliedUnitsIn0To8Range(???);
void CharStoreAI(struct Unit* unit, const struct UnitDefinition* uDef);
// ??? sub_803C284(???);
// ??? sub_803C364(???);
// ??? sub_803C3B0(???);
// ??? sub_803C44C(???);
void sub_803C490(struct Unit*);

#endif // GUARD_CP_UTILITY_H
