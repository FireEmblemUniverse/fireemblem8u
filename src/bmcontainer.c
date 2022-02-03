#include "global.h"

#include "variables.h"
#include "bmitem.h"

// 0203A8E4 - 0203A81C = C8 (200 in decimal)
EWRAM_DATA u16 gUnknown_0203A81C[100] = {0};

extern unsigned int sub_80BD048();

u16* GetConvoyItemArray() {
    return gUnknown_0203A81C;
}

void ClearConvoyItems() {
    CpuFill16(0, gUnknown_0203A81C, 0xC8);
    return;
}

void ShrinkConvoyItemList() {
    u16* buffer = (void*) gUnknown_02020188; // generic buffer?
    u16* bufferIt = buffer;
    u16* convoy = GetConvoyItemArray(); // gUnknown_0203A81C
    u16 count;

    for (count = 0; count <= 0x63; ++count) {
        // _0803153A
        if (*convoy != 0) {// gUnknown_0203A81C
            *bufferIt = *convoy;
            bufferIt++;
        }
        // _08031544
        convoy++;
    }

    *bufferIt = 0;
    ClearConvoyItems();
    CpuCopy16(buffer, GetConvoyItemArray(), count * 2);
    return;
}

int GetConvoyItemCount() {
    int count = 0;
    u16* convoy = gUnknown_0203A81C;
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
    gUnknown_0202BCB0.itemUnk2E = 0; // game state @ 0x2e
    r3 = 0;
    convoy = gUnknown_0203A81C;
    for (r3; r3 <= 0x63; ++r3) {
        // _080315A2
        if (*convoy == 0) {
            *convoy = itemNameId;
            return r3;
        }
        // _080315B8
        convoy++;
    }
    gUnknown_0202BCB0.itemUnk2E = itemNameId;
    return -1;
}

void sub_80315CC(int index) {
    gUnknown_0203A81C[index] = 0;
    ShrinkConvoyItemList();
    return;
}

int GetConvoyItemSlot(int r0) {
    int r2;
    u16* convoy;
    r0 = GetItemIndex(r0);
    r2 = 0;
    convoy = gUnknown_0203A81C;
     for (r2 = 0; r2 <= 0x63; ++r2) {
        // _080315F4
        if (r0 == (convoy[r2] & 0xFF)) {
            return r2;
        }
        // _08031608
    }

    return -1;
}

bool8 HasConvoyAccess() {
    unsigned int chapterId;
    s16 r1;
    if (GMAP_STATE_BIT0 & gUnknown_03005280.state) { // if GMAP_STATE_BIT0 is set
        chapterId = sub_80BD048();
        if (chapterId <= 1) { //bls _08031650 
            return 0;
        } else if (chapterId == 0x38) { // beq _08031650
            return 0;
        } else {
            // _08031658
            return 1;
        }
    }
    // _0803163C
    r1 = gRAMChapterData.chapterIndex; // ch data @ 0xe
    if (r1 <= 1) { // ble _08031650
        return 0;
    } else if (r1 == 0x38) { // beq _08031650
        return 0;
    } else if (r1 != 5) {
        return 1;
    }
    return 0;
}