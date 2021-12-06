#ifndef GUARD_MONSTERGEN_H
#define GUARD_MONSTERGEN_H

extern const u8 gMonsterLevelWeights[];
struct MonsterClassWeights {
    u8 classes[5];
    u8 weights[7];
};
extern const struct MonsterClassWeights gMonsterClassWeights[];

int SelectFromWeightedArray(const u8 *weights, u8 size);
int GenerateMonsterLevel(u8 baseLevel);
int GenerateMonsterClass(u8 baseClassId);
u32 GenerateMonsterItems(u8 monsterClassId);

#endif
