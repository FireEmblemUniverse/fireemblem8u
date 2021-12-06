#include "global.h"

#include "rng.h"

#include "monstergen.h"

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
    const u8 *startp = gMonsterClassWeights + baseClassId * 12;
    u8 selected = SelectFromWeightedArray(startp + 5, 5);
    return *(startp + selected);
}
