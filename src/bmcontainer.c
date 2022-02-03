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