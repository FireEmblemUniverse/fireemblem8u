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
    const struct MonsterItemsByClassEntry *iter = gMonsterItemsByClassIndex;
    for (iter = gMonsterItemsByClassIndex; iter->classId != 0xff; ++iter)
    {
        if (iter->classId == classId) {
            u32 item1row;
            u32 item1weightsidx;
            u32 item1;
            u8 row1, col1, row2, col2;
            row1 = SelectFromWeightedArray(iter->item1weights, 5);

            item1row = iter->item1row[row1];
            item1weightsidx = iter->item1tables[row1];
            col1 = SelectFromWeightedArray(gMonsterItemWeightsTable[item1weightsidx], 5);
            item1 = gMonsterItemTable[item1row][col1] << 0x10;

            row2 = SelectFromWeightedArray(iter->item2weights, 5);
            if (row2 != 0xff) {
                u32 item2row = iter->item2row[row2];
                if (item2row) {
                    u32 item2;
                    u32 item2weightsidx = iter->item2tables[row2];
                    col2 = SelectFromWeightedArray(gMonsterItemWeightsTable[item2weightsidx], 5);
                    item2 = gMonsterItemTable[item2row][col2];
                    return item1 | item2;
                }
            }
            return item1;
        }
    }
    return 0;
}
