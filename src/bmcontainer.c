#include "global.h"

#include "variables.h"

// 0203A8E4 - 0203A81C = C8 (200 in decimal)
EWRAM_DATA u16 gUnknown_0203A81C[100] = {0};

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