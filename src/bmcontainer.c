#include "global.h"

#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"

#include "bmcontainer.h"

EWRAM_DATA u16 gConvoyItemArray[CONVOY_ITEM_COUNT] = {0};

u16* GetConvoyItemArray() {
    return gConvoyItemArray;
}

void ClearSupplyItems() {
    CpuFill16(0, gConvoyItemArray, CONVOY_ITEM_COUNT * sizeof(u16));
    return;
}

void ShrinkConvoyItemList() {
    u16 i;
    u16* buffer = (void*) gGenericBuffer;
    u16* bufferIt = buffer;
    u16* convoy = GetConvoyItemArray();

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i) {
        if (*convoy != 0) {
            *bufferIt = *convoy;
            bufferIt++;
        }
        convoy++;
    }

    *bufferIt = 0;
    ClearSupplyItems();
    CpuCopy16(buffer, GetConvoyItemArray(), i * sizeof(u16));
    return;
}

int GetConvoyItemCount() {
    int i;
    int count = 0;
    u16* convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        if (convoy[i] != 0) {
            count++;
        }
    }
    return count;
}

int AddItemToConvoy(int item) {
    int i;
    u16* convoy;
    gBmSt.itemUnk2E = 0;
    convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; ++i) {
        if (convoy[i] == 0) {
            convoy[i] = item;
            return i;
        }
    }
    gBmSt.itemUnk2E = item;
    return -1;
}

void RemoveItemFromConvoy(int index) {
    gConvoyItemArray[index] = 0;
    ShrinkConvoyItemList();
    return;
}

int GetConvoyItemSlot(int item) {
    int i;
    u16* convoy;
    item = GetItemIndex(item);
    convoy = gConvoyItemArray;

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i) {
        if (item == ITEM_INDEX(convoy[i])) {
            return i;
        }
    }

    return -1;
}

bool8 HasConvoyAccess() {
    unsigned int chapterId;
    if (gGMData.state.bits.state_0) {
        chapterId = sub_80BD048();
        if (chapterId <= 1) {
            return 0;
        } else if (chapterId == 0x38) {
            return 0;
        } else {
            return 1;
        }
    }

    if (gPlaySt.chapterIndex <= 1) {
        return 0;
    } else if (gPlaySt.chapterIndex == 0x38) {
        return 0;
    } else if (gPlaySt.chapterIndex != 5) {
        return 1;
    }
    return 0;
}

bool8 sub_8031660() {
    const struct ROMChapterData* chapterData = GetROMChapterStruct(gPlaySt.chapterIndex);
    if (chapterData->merchantPosX == 0xFF) {
        return 0;
    }
    return 1;
}

struct Unit* GetSupplyUnit() {
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
            return unit;
        }
    }
    return 0;
}