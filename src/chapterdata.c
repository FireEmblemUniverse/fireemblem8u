#include "global.h"
#include "chapterdata.h"
#include "hardware.h"
#include "agb_sram.h"

const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex) {
    if (chIndex == 0x7F)
        return (const struct ROMChapterData*) gUnknown_08A1FB34[0];

    return gChapterDataTable + chIndex;
}

const void* GetChapterMapPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->mapMainLayerId];

    ReadSramFast(sub_80A6B70(), gGenericBuffer, sub_80A6B90());
    return gGenericBuffer;
}

const void* GetChapterMapChangesPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->mapChangeLayerId];

    return gUnknown_08A1FB34[1];
}

const struct ChapterEventInfo* GetChapterEventDataPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->mapEventDataId];

    return gUnknown_08A1FB34[2];
}

const char* sub_80346E0(unsigned chIndex) {
    if (chIndex != 0x7F)
        // ???????????????????
        return GetStringFromIndex((int)(&GetROMChapterStruct(chIndex)->unk70));

    return gUnknown_08A1FB34[3];
}

int IsDifficultMode(void) {
    u8 difficultState = gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT;
    return difficultState ? TRUE : FALSE;
}
