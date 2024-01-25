#include "global.h"

#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "worldmap.h"

#include "bmcontainer.h"

EWRAM_DATA u16 gConvoyItemArray[CONVOY_ITEM_COUNT] = {0};

u16 * GetConvoyItemArray(void)
{
    return gConvoyItemArray;
}

void ClearSupplyItems(void)
{
    CpuFill16(0, gConvoyItemArray, CONVOY_ITEM_COUNT * sizeof(u16));
}

void ShrinkConvoyItemList(void)
{
    u16 i;
    u16 * buffer = (void*) gGenericBuffer;
    u16 * bufferIt = buffer;
    u16 * convoy = GetConvoyItemArray();

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
    {
        if (*convoy != 0)
        {
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

int GetConvoyItemCount(void)
{
    int i;
    int count = 0;
    u16 * convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; i++)
        if (convoy[i] != 0)
            count++;

    return count;
}

int AddItemToConvoy(int item)
{
    int i;
    u16 * convoy;
    gBmSt.itemUnk2E = 0;
    convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
    {
        if (convoy[i] == 0)
        {
            convoy[i] = item;
            return i;
        }
    }
    gBmSt.itemUnk2E = item;
    return -1;
}

void RemoveItemFromConvoy(int index)
{
    gConvoyItemArray[index] = 0;
    ShrinkConvoyItemList();
    return;
}

int GetConvoyItemSlot(int item)
{
    int i;
    u16 * convoy;
    item = GetItemIndex(item);
    convoy = gConvoyItemArray;

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
        if (item == ITEM_INDEX(convoy[i]))
            return i;

    return -1;
}

bool8 HasConvoyAccess(void)
{
    unsigned int chapterId;
    if (gGMData.state.bits.state_0)
    {
        chapterId = GetNextUnclearedChapter();
        if (chapterId <= 1)
            return false;
        else if (chapterId == 0x38)
            return false;
        else
            return true;
    }

    if (gPlaySt.chapterIndex <= 1)
        return false;
    else if (gPlaySt.chapterIndex == 0x38)
        return false;
    else if (gPlaySt.chapterIndex != 5)
        return true;

    return false;
}

bool8 sub_8031660(void)
{
    const struct ROMChapterData * chapterData =
        GetROMChapterStruct(gPlaySt.chapterIndex);
    if (chapterData->merchantPosX == 0xFF)
        return false;

    return true;
}

struct Unit * GetSupplyUnit()
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
            return unit;
    }
    return NULL;
}