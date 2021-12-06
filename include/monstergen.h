#ifndef GUARD_MONSTERGEN_H
#define GUARD_MONSTERGEN_H

extern const u8 gMonsterLevelWeights[];
struct MonsterClassWeights {
    u8 classes[5];
    u8 weights[7];
};
extern const struct MonsterClassWeights gMonsterClassWeights[];

struct Unknown_088D2440 {
    /* 00 */       u8 classid;
    /* 01 -> 05 */ u8 items1[5];
    /* 06 -> 0a */ u8 items2[5];
    /* 0b -> 10 */ u8 item1weights[5];
    /* 11 -> 15 */ u8 item2weights[5];
    /* 17 -> 1b */ u8 item1tables[5];
    /* 1b -> */    u8 item2tables[5];
};
extern const struct Unknown_088D2440 gUnknown_088D2440[];
extern const u8 gUnknown_088D21C8[];
extern const u8 gUnknown_088D22C7[];

int SelectFromWeightedArray(const u8 *weights, u8 size);
int GenerateMonsterLevel(u8 baseLevel);
int GenerateMonsterClass(u8 baseClassId);
u32 GenerateMonsterItems(u8 monsterClassId);

#endif
