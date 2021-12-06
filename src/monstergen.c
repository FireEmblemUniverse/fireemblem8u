#include "global.h"

#include "rng.h"

#include "monstergen.h"

/*
 * Random monster unit generation utility
 * (for skirmishes and valni/lagdou)
 */

int SelectFromWeightedArray(const u8 *weights, u8 size) {
    char i;
    char rand = NextRN_100();
    const char *iter = weights;
    char old_count = 0;
    char new_count = 0;

    for (i = 0; i < size; ++iter, ++i) {
        old_count = new_count;
        new_count += *iter;
        if (old_count <= rand && rand < new_count) {
            return i;
        }
    }
    return 0xff;
}

int GenerateMonsterLevel(u8 baseLevel) {
    char result = baseLevel;
    u8 selected = SelectFromWeightedArray(gMonsterLevelWeights, 7);
    result += selected - 2;
    if ((s8) result <= 0) {
        result = 1;
    }
    if ((s8) result > 20) {
        result = 20;
    }
    return result;
}

int GenerateMonsterClass(u8 baseClassId) {
    const struct MonsterClassWeights *weights = gMonsterClassWeights + baseClassId;
    u8 selected = SelectFromWeightedArray(weights->weights, 5);
    return weights->classes[selected];
}

u32 GenerateMonsterItems(u8 classId) {
    const struct Unknown_088D2440 *a = gUnknown_088D2440;
    for (a = gUnknown_088D2440; a->classId != 0xff; ++a)
    {
        if (a->classId == classId) {
            u32 item1idx;
            u32 item1weightsidx;
            u32 item1;
            u8 select1, select2;
            select1 = SelectFromWeightedArray(a->item1weights, 5);

            item1idx = a->items1[select1];
            item1weightsidx = a->item1tables[select1];
            select1 = SelectFromWeightedArray(gUnknown_088D22C7 + item1weightsidx * 5, 5);
            item1 = gUnknown_088D21C8[select1 + item1idx * 5] << 0x10;

            select2 = SelectFromWeightedArray(a->item2weights, 5);
            if (select2 != 0xff) {
                u32 item2idx = a->items2[select2];
                if (item2idx) {
                    u32 item2;
                    u32 item2weightsidx = a->item2tables[select2];
                    select2 = SelectFromWeightedArray(item2weightsidx * 5 + gUnknown_088D22C7, 5);
                    item2 = gUnknown_088D21C8[select2 + item2idx * 5];
                    return item1 | item2;
                }
            }
            return item1;
        }
    }
    return 0;
}
