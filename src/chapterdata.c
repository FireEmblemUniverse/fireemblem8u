#include "global.h"
#include "chapterdata.h"
#include "hardware.h"
#include "agb_sram.h"

#include "src/data/chapter_settings.h"

const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex) {
    if (chIndex == 0x7F)
        return (const struct ROMChapterData*) gUnknown_08A1FB34[0];

    return gChapterDataTable + chIndex;
}

const void* GetChapterMapPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->map.mainLayerId];

    ReadSramFast(sub_80A6B70(), gGenericBuffer, sub_80A6B90());
    return gGenericBuffer;
}

const void* GetChapterMapChangesPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->map.changeLayerId];

    return gUnknown_08A1FB34[1];
}

const struct ChapterEventGroup* GetChapterEventDataPointer(unsigned chIndex) {
    if (chIndex != 0x7F)
        return gChapterDataAssetTable[GetROMChapterStruct(chIndex)->mapEventDataId];

    return gUnknown_08A1FB34[2];
}

const char* GetChapterTitle(unsigned chIndex) {
    if (chIndex != 0x7F)
        // ???????????????????
        return GetStringFromIndex((int)(&GetROMChapterStruct(chIndex)->chapTitleTextId));

    return gUnknown_08A1FB34[3];
}

int IsDifficultMode(void) {
    u8 difficultState = gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT;
    return difficultState ? TRUE : FALSE;
}
