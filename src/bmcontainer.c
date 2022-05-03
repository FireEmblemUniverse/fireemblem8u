#include "global.h"

#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"

EWRAM_DATA u16 gConvoyItemArray[100] = {0};

extern unsigned int sub_80BD048();

u16* GetConvoyItemArray() {
    return gConvoyItemArray;
}

void ClearConvoyItems() {
    CpuFill16(0, gConvoyItemArray, 0xC8);
    return;
}

void ShrinkConvoyItemList() {
    u16 i;
    u16* buffer = (void*) gUnknown_02020188;
    u16* bufferIt = buffer;
    u16* convoy = GetConvoyItemArray();

    for (i = 0; i <= 0x63; ++i) {
        if (*convoy != 0) {
            *bufferIt = *convoy;
            bufferIt++;
        }
        convoy++;
    }

    *bufferIt = 0;
    ClearConvoyItems();
    CpuCopy16(buffer, GetConvoyItemArray(), i * 2);
    return;
}

int GetConvoyItemCount() {
    int i;
    int count = 0;
    u16* convoy = gConvoyItemArray;
    for (i = 0x63; i >= 0; i--) {
        if (*convoy != 0) {
            count++;
        }
        convoy++;
    }
    return count;
}

int AddItemToConvoy(int itemNameId) {
    int i;
    u16* convoy;
    gUnknown_0202BCB0.itemUnk2E = 0;
    convoy = gConvoyItemArray;
    for (i = 0; i <= 0x63; ++i) {
        if (convoy[i] == 0) {
            convoy[i] = itemNameId;
            return i;
        }
    }
    gUnknown_0202BCB0.itemUnk2E = itemNameId;
    return -1;
}

void RemoveItemFromConvoy(int index) {
    gConvoyItemArray[index] = 0;
    ShrinkConvoyItemList();
    return;
}

int GetConvoyItemSlot(int r0) {
    int i;
    u16* convoy;
    r0 = GetItemIndex(r0);
    convoy = gConvoyItemArray;
     for (i = 0; i <= 0x63; ++i) {
        if (r0 == (convoy[i] & 0xFF)) {
            return i;
        }
    }

    return -1;
}

bool8 HasConvoyAccess() {
    unsigned int chapterId;
    if (GMAP_STATE_BIT0 & gUnknown_03005280.state) {
        chapterId = sub_80BD048();
        if (chapterId <= 1) {
            return 0;
        } else if (chapterId == 0x38) {
            return 0;
        } else {
            return 1;
        }
    }

    if (gRAMChapterData.chapterIndex <= 1) {
        return 0;
    } else if (gRAMChapterData.chapterIndex == 0x38) {
        return 0;
    } else if (gRAMChapterData.chapterIndex != 5) {
        return 1;
    }
    return 0;
}

bool8 sub_8031660() {
    const struct ROMChapterData* chapterData = GetROMChapterStruct(gRAMChapterData.chapterIndex);
    if (chapterData->_unk81[1] == 0xFF) { // ROM Chapter Data @ 0x82
        return 0;
    }
    return 1;
}

struct Unit* GetSupplyUnit() {
    int i;
    for (i = 1; i <= 0x3F; ++i) {
        struct Unit* unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
                return unit;
            }
        }
    }
    return 0;
}