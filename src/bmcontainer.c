#include "global.h"

#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"

// 0203A8E4 - 0203A81C = C8 (200 in decimal)
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
    u16* buffer = (void*) gUnknown_02020188;
    u16* bufferIt = buffer;
    u16* convoy = GetConvoyItemArray();
    u16 count;

    for (count = 0; count <= 0x63; ++count) {
        if (*convoy != 0) {
            *bufferIt = *convoy;
            bufferIt++;
        }
        convoy++;
    }

    *bufferIt = 0;
    ClearConvoyItems();
    CpuCopy16(buffer, GetConvoyItemArray(), count * 2);
    return;
}

int GetConvoyItemCount() {
    int count = 0;
    u16* convoy = gConvoyItemArray;
    int r1 = 0x63;
    for (r1; r1 >= 0; r1--) {
        if (*convoy != 0) {
            count++;
        }
        convoy++;
    }
    return count;
}

int AddItemToConvoy(int itemNameId) {
    int r3;
    u16* convoy;
    gUnknown_0202BCB0.itemUnk2E = 0;
    r3 = 0;
    convoy = gConvoyItemArray;
    for (r3; r3 <= 0x63; ++r3) {
        if (convoy[r3] == 0) {
            convoy[r3] = itemNameId;
            return r3;
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
    int r2;
    u16* convoy;
    r0 = GetItemIndex(r0);
    r2 = 0;
    convoy = gConvoyItemArray;
     for (r2 = 0; r2 <= 0x63; ++r2) {
        if (r0 == (convoy[r2] & 0xFF)) {
            return r2;
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

struct Unit* sub_8031688() {
    int r4;
    for (r4 = 1; r4 <= 0x3F; ++r4) {
        struct Unit* unit = GetUnit(r4);
        if (UNIT_IS_VALID(unit)) {
            if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
                return unit;
            }
        }
    }
    return 0;
}