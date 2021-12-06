#ifndef GUARD_MONSTERGEN_H
#define GUARD_MONSTERGEN_H

extern const u8 gMonsterLevelWeights[];
extern const u8 gMonsterClassWeights[];

int SelectFromWeightedArray(const u8 *weights, u8 size);
int GenerateMonsterLevel(u8 baseLevel);
int GenerateMonsterClass(u8 baseClassId);
u32 GenerateMonsterItems(u8 monsterClassId);

#endif
