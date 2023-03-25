#include "global.h"
#include "agb_sram.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "bmmap.h"

EWRAM_DATA struct ExtraMapSaveHead gExtraMapSaveHead = {0};
EWRAM_DATA struct ChapterStats gExtraMapStatus = {0};

CONST_DATA u8 *gpSramExtraData = CART_SRAM + SRAM_OFFSET_6;
CONST_DATA struct ExtraMapInfo *gExtraMapInfo = (void *) EWRAM_START + 0x40000 - EWRAM_XMAP_SIZE; // 0x40000 = EWRAM_SIZE

void LoadAndVerfySuspendSave(void)
{
    struct PlaySt playSt;
    
    if (IsValidSuspendSave(SAVE_ID_SUSPEND)) {

        ReadSuspendSavePlaySt(SAVE_ID_SUSPEND, &playSt);
        if (0x7F == playSt.chapterIndex) {
            ReadSramFast(gpSramExtraData, &gExtraMapSaveHead, sizeof(struct ExtraMapSaveHead));

            if (playSt.unk_2C_0D != gExtraMapSaveHead.unk0F)
                InvalidateSuspendSave(SAVE_ID_SUSPEND);
        }
    }
}

bool ReadExtraMapSaveHead(void)
{
    ReadSramFast(gpSramExtraData, &gExtraMapSaveHead, sizeof(struct ExtraMapSaveHead));

    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return FALSE;

    if (gExtraMapSaveHead.save_magic32 != SAVEMAGIC32_XMAP + (GetLang() << 24))
        return FALSE;

    gExtraMapSaveHead.map_sram += (ptrdiff_t)gpSramExtraData;
    gExtraMapSaveHead.info_sram += (ptrdiff_t)gpSramExtraData;
    gPlaySt.unk_2C_0D = gExtraMapSaveHead.unk0F;

    return TRUE;
}

void const * GetExtraMapMapReadAddr(void)
{
    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return NULL;

    return gExtraMapSaveHead.map_sram;
}

u32 GetExtraMapMapSize(void)
{
    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return 0;

    return gExtraMapSaveHead.map_size;
}

void const *GetExtraMapInfoReadAddr(void)
{
    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return NULL;

    return gExtraMapSaveHead.info_sram;
}

u32 GetExtraMapInfoSize(void)
{
    if (gExtraMapSaveHead.xmap_magic != XMAP_MAGIC)
        return 0;

    return gExtraMapSaveHead.info_size;
}

u16 ExtraMapChecksum(void const *data, int size)
{
    u16 const * data_u16 = data;
    int i, result = 0;

    for (i = 0; i < size / 2; i++)
        result += *data_u16++;

    return result;
}

bool IsExtraMapAvailable(void)
{
    struct ExtraMapSaveHead *buf = (struct ExtraMapSaveHead *)gGenericBuffer;

    if (!IsSramWorking())
        return FALSE;

    ReadSramFast(CART_SRAM + SRAM_OFFSET_6, buf, SRAM_SIZE_6);

    if (buf->xmap_magic != XMAP_MAGIC)
        return FALSE;

    if (buf->save_magic32 != SAVEMAGIC32_XMAP + (GetLang() << 24))
        return FALSE;

    if (buf->xmap_size == 0)
        return FALSE;

    if (buf->xmap_checksum != ExtraMapChecksum(&buf->save_magic32, buf->xmap_size))
        return FALSE;

    return TRUE;
}

void ReadExtraMapInfo(void)
{
    ReadExtraMapSaveHead();

    ReadSramFast(GetExtraMapInfoReadAddr(), gGenericBuffer, GetExtraMapInfoSize());
    Decompress(gGenericBuffer, gExtraMapInfo);

    gExtraMapInfo->play_st = &gPlaySt;
    gExtraMapInfo->bm_st = &gBmSt;
    gExtraMapInfo->active_unit = &gActiveUnit;
    gExtraMapInfo->unit_lut = gUnitLookup;
    gExtraMapInfo->bu_a = &gBattleActor;
    gExtraMapInfo->bu_b = &gBattleTarget;
    gExtraMapInfo->battle_hits = gBattleHitArray;
    gExtraMapInfo->traps = GetTrap(0);
    gExtraMapInfo->permanent_flags = GetPermanentFlagBits();
    gExtraMapInfo->chapter_frags = GetChapterFlagBits();
}

bool sub_80A6D1C(u8 *buf)
{
    *buf = 0;
    return true;
}

const char* GetChapterTitle_(unsigned ch)
{
    return GetChapterTitle(ch);
}

bool bmsave_null_false1(void)
{
    return false;
}

bool bmsave_null_false2(void)
{
    return false;
}

void NullBmMapHidden_(void)
{
    GetGlobalCompletionCount();
    gBmMapHidden = NULL;
}

struct ChapterStats *sub_80A6D4C(void)
{
    int time;

    time = (GetGameClock() - gPlaySt.time_chapter_started) / 180;
    if (time > 60000)
        time = 60000;

    gExtraMapStatus.chapter_index = gPlaySt.chapterIndex;
    gExtraMapStatus.chapter_turn = gPlaySt.chapterTurnNumber;
    gExtraMapStatus.chapter_time = time;
    return &gExtraMapStatus;
}
