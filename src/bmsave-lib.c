#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);

extern EWRAM_DATA bool gBoolSramWorking;

static const char sSaveMarker[] = "AGB-FE9";
static const u8 sConvySavePackMask1[] = {
    0xC0,   /* 1100 0000 */
    0x81,   /* 1000 0001 */
    0x03,   /* 0000 0011 */
    0x07,   /* 0000 0111 */
    0x0F,   /* 0000 1111 */
    0x1F,   /* 0001 1111 */
    0x3F,   /* 0011 1111 */
    0x7F,   /* 0111 1111 */
};

static const u8 sConvySavePackMask2[] = {
    0x00,   /* 0000 0000 */
    0x00,   /* 0000 0000 */
    0x00,   /* 0000 0000 */
    0xF7,   /* 1111 0111 */
    0xFC,   /* 1111 1100 */
    0xF8,   /* 1111 1000 */
    0xF0,   /* 1111 0000 */
    0xE0,   /* 1110 0000 */
};

CONST_DATA u8 *gSram = CART_SRAM;

CONST_DATA int sSupportUnkLut[][2] = {
    { 0x0100, 0x0100 }, 
    { 0x0000, 0x0000 }
};

void SramInit()
{
    u32 buf[2];
    buf[0] = 0x12345678;
    buf[1] = 0x87654321;

    SetSramFastFunc();
    REG_IE |= INTR_FLAG_GAMEPAK;
    WriteSramFast((u8 *)&buf[0], gSram + 0x73A0, 4);
    ReadSramFast(gSram + 0x73A0, &buf[1], 4);
    
    gBoolSramWorking = (buf[1] == buf[0])
                     ? true
                     : false;
}

bool IsSramWorking()
{
    return gBoolSramWorking;
}

void WipeSram()
{
    u32 buf[0x10];
    int i;

    for (i = 0; i < 0x10; i++)
        buf[i] = 0xFFFFFFFF;

    for (i = 0; i < 0x200; i++)
        WriteAndVerifySramFast(buf, gSram + i * 0x40, 0x40);
}

u16 Checksum16(void const * data, int size)
{
    u16 const * data_u16 = data;

    int i;

    u32 add_acc = 0;
    u32 xor_acc = 0;

    for (i = 0; i < size/2; ++i)
    {
        add_acc += data_u16[i];
        xor_acc ^= data_u16[i];
    }

    return add_acc + xor_acc;
}


bool ReadGlobalSaveInfo(struct GlobalSaveInfo *buf)
{
    struct GlobalSaveInfo local_info;

    if (!IsSramWorking())
        return false;

    if (NULL == buf)
        buf = &local_info;

    ReadSramFast(gSram, buf, sizeof(struct GlobalSaveInfo));

    if (0 != StringCompare(buf->name, sSaveMarker)
        && SAVEMAGIC32 == buf->magic32
        && SAVEMAGIC16 == buf->magic16
        && buf->checksum == Checksum16(buf, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM))
        return true;

    return false;
}

void WriteGlobalSaveInfo(struct GlobalSaveInfo *header)
{
    header->checksum = Checksum16(header, GLOBALSIZEINFO_SIZE_FOR_CHECKSUM);
    WriteAndVerifySramFast(header, gSram, sizeof(struct GlobalSaveInfo));
}

void WriteGlobalSaveInfoNoChecksum(struct GlobalSaveInfo *header)
{
    WriteAndVerifySramFast(header, gSram, sizeof(struct GlobalSaveInfo));
}

void InitGlobalSaveInfodata()
{
    struct GlobalSaveInfo info;
    int i;

    WipeSram();
    CopyString(info.name, sSaveMarker);

    info.magic32 = SAVEMAGIC32;
    info.magic16 = SAVEMAGIC16;

    info.completed  = 0;
    info.flag0E_1 = 0;
    info.Eirk_mode_easy = 0;
    info.Eirk_mode_norm = 0;
    info.Eirk_mode_hard = 0;
    info.Ephy_mode_easy = 0;
    info.Ephy_mode_norm = 0;
    info.Ephy_mode_hard = 0;

    info.game_end = 0;
    info.unk0F_1 = 0;

    info.unk10 = 0;
    info.unk12 = 0;

    info.last_suspend_slot = 0;
    info.last_game_save_id = 0;

    for (i = 0; i < 0xC; i++)
        info.cleared_playthroughs[i] = 0;

    for (i = 0; i < 0x20; i++)
        info.SuppordRecord[i] = 0;

    for (i = 0; i < 0x20; i++)
        info.charKnownFlags[i] = 0;

    WriteGlobalSaveInfo(&info);
}

void EraseBonusContentData()
{
    u8 *buf = gGenericBuffer;
    CPU_FILL(0, buf, 0x144, 16);
    SaveBonusContentData(buf);
}

void * SramOffsetToAddr(u16 off)
{
    return gSram + off;
}

u16 SramAddrToOffset(void * addr)
{
    return ((u8 *) addr) - gSram;
}

bool ReadSaveBlockInfo(struct SaveBlockInfo *chunk, int index)
{
    struct SaveBlockInfo tmp;
    u32 magic;

    if (NULL == chunk)
        chunk = &tmp;

    ReadSramFast(&((struct SramHeader *)gSram)->chunks[index], chunk, sizeof(struct SaveBlockInfo));

    if (SAVEMAGIC16 != chunk->magic16)
        return false;

    switch (index) {
    case SAVE_ID_GAME0:
    case SAVE_ID_GAME1:
    case SAVE_ID_GAME2:
        magic = SAVEMAGIC32;
        break;

    case SAVE_ID_SUSPEND:    
    case SAVE_ID_SUSPEND_ALT:
        magic = SAVEMAGIC32;
        break;

    case SAVE_ID_ARENA:
        magic = SAVEMAGIC32_ARENA;
        break;

    case SAVE_ID_XMAP:
        magic = SAVEMAGIC32_XMAP;
        break;
    
    default:
        return false;
        break;
    } /* switch */

    if (chunk->magic32 != magic)
        return false;

    return VerifySaveBlockChecksum(chunk);
}

void WriteSaveBlockInfo(struct SaveBlockInfo *chunk, int index)
{

    chunk->magic16 = SAVEMAGIC16;
#if BUGFIX
    chuck->offset = SramAddrToOffset(GetSaveWriteAddr(index));
#else
    chunk->offset = (uintptr_t)GetSaveWriteAddr(index);
#endif

    if (index >= SAVE_ID_MAX)
        return;

    switch (chunk->kind) {
    case SAVEBLOCK_KIND_GAME:
        chunk->size = GAMESAVE_OFFSET_MAX;
        break;

    case SAVEBLOCK_KIND_SUSPEND:
        chunk->size = SRAM_SIZE_SUSPEND;
        break;

    case SAVEBLOCK_KIND_ARENA:
        chunk->size = SRAM_SIZE_5;
        break;

    case SAVEBLOCK_KIND_XMAP:
        chunk->size = SRAM_SIZE_6;
        break;

    case (u8)SAVEBLOCK_KIND_INVALID:
        chunk->size = 0;
        chunk->offset = 0;
        chunk->magic16 = 0;
        break;

    default:
        return;
    }

    PopulateSaveBlockChecksum(chunk);
    WriteAndVerifySramFast( chunk, &((struct SramHeader *)gSram)->chunks[index], sizeof(struct SaveBlockInfo));
}

void EraseSaveBlockInfo(int index)
{
    struct SaveBlockInfo chunk;

    if (index < SAVE_ID_MAX) {
        CpuFill16(0xFFFF, &chunk, sizeof(struct SaveBlockInfo));
        WriteAndVerifySramFast(
            &chunk,
            &((struct SramHeader *)gSram)->chunks[index],
            sizeof(struct SaveBlockInfo));
    }
}

void *GetSaveWriteAddr(int index)
{
    switch (index) {
        case SAVE_ID_GAME0:
            return SRAM_OFFSET_SAV0 + gSram;
            break;

        case SAVE_ID_GAME1:
            return SRAM_OFFSET_SAV1 + gSram;
            break;

        case SAVE_ID_GAME2:
            return SRAM_OFFSET_SAV2 + gSram;
            break;

        case SAVE_ID_SUSPEND:
            return SRAM_OFFSET_SUS0 + gSram;
            break;

        case SAVE_ID_SUSPEND_ALT:
            return SRAM_OFFSET_SUS1 + gSram;
            break;

        case SAVE_ID_ARENA:
            return SRAM_OFFSET_5 + gSram;
            break;

        case SAVE_ID_XMAP:
            return CART_SRAM + SRAM_OFFSET_6;
            break;

        default:
            return NULL;
            break;
    }
}

void *GetSaveReadAddr(int index)
{
    struct SaveBlockInfo chunk;
    ReadSaveBlockInfo(&chunk, index);
    return SramOffsetToAddr(chunk.offset);
}

void WriteChapterFlags(void *sram_dest)
{
    WriteAndVerifySramFast(
        GetChapterFlagBits(),
        sram_dest,
        GetChapterFlagBitsSize());
}

void WritePermanentFlags(void *sram_dest)
{
    WriteAndVerifySramFast(
        GetPermanentFlagBits(),
        sram_dest,
        GetPermanentFlagBitsSize());
}

void ReadChapterFlags(void *ewram_dest)
{
    ReadSramFast(
        ewram_dest,
        GetChapterFlagBits(),
        GetChapterFlagBitsSize());
}

void ReadPermanentFlags(void *ewram_dest)
{
    ReadSramFast(
        ewram_dest,
        GetPermanentFlagBits(),
        GetPermanentFlagBitsSize());
}

void ReadPermanentFlags_ret(void *sram_src, void *ewram_dest)
{
    ReadSramFast(
        sram_src,
        ewram_dest,
        GetPermanentFlagBitsSize());
}

void WriteSupplyItems(void *sram_dest)
{
    const unsigned short *items = GetConvoyItemArray();
    unsigned char *cur;
    int i, item_use, var0, var1;
    unsigned char buf[176];
    cur = &buf[100];
    var1 = 0;

    for (i = 0; i < 100; i++) {
        buf[i] = items[0];
        item_use = ITEM_USES(items[0]) & 0x3F;
        var0 = var1 & 0x7;
        *cur = 
            (*cur & sConvySavePackMask1[var0]) |
            (item_use << var0);

        if (var0 > 1) {
            cur++;
            if (var0 > 2) {
                *cur =
                    (*cur & sConvySavePackMask2[var0]) |
                    (item_use >> (8 - var0));
            }
        }
        var1 += 6;
        ++items;
    }

    WriteAndVerifySramFast(buf, sram_dest, GAMESAVE_SIZE_SUPPLY);
}

void ReadSupplyItems(const void *sram_src)
{
    unsigned char buf[GAMESAVE_SIZE_SUPPLY];
    unsigned short *items;
    unsigned char *cur, item_use;
    int i, var0, var1;

    ReadSramFast(sram_src, buf, sizeof(buf));
    items = GetConvoyItemArray();
    cur = &buf[100];
    var1 = 0;

    for (i = 0; i < 100; i++) {
        items[0] = buf[i];
        var0 = var1 & 0x7;
        item_use = (*cur & ~sConvySavePackMask1[var0]) >> var0;

        if (var0 > 1) {
            cur++;

            if (var0 > 2) {
                item_use |= (*cur & ~sConvySavePackMask2[var0]) << (8 - var0);
            }
        }

        items[0] |= item_use << 8;
        var1 += 6;
        items++;
    }

}

bool null_true()
{
    return true;
}

bool IsExtraLinkArenaEnabled(int index)
{
    int i;

    if (!IsSramWorking())
        return 0;

    for (i = 0; i < 3; i++)
        if (IsGameSaveNotFirstChapter(i))
            return 1;

    return IsMultiArenaSaveReady();
}

bool IsExtraSoundRoomEnabled()
{
    return 1;
}

bool IsExtraSupportViewerEnabled()
{
    int tmp0 = GGM_IsAnyCharacterKnown(NULL);
    int tmp1 = IsGamePlayedThrough();
    return tmp1 & tmp0;
}

unsigned int sub_80A3348(void) {
    unsigned char buf[0x94];
    int r4 = 0;
    unsigned char tmp0 = IsGamePlayedThrough();

    if (!tmp0)
        return 0;

    if (LoadAndVerfyRankData(buf)) {
        if (buf[0] << 0x1F)
            r4 = 1;
    
        if (buf[0x18] << 0x1F)
            r4 |= 2;
    
        if (buf[0x30] << 0x1F)
            r4 |= 4;
    
        if (buf[0x48] << 0x1F)
            r4 |= 8;
    
        if (buf[0x60] << 0x1F)
            r4 |= 0x10;
    
        if (buf[0x78] << 0x1F)
            r4 |= 0x20;
    }
    return r4;
}

bool sub_80A33C4()
{
    struct GlobalSaveInfo buf;

    if (!ReadGlobalSaveInfo(&buf))
        return false;

    if (!IsExtraMapAvailable())
        return false;
    else
        return true;
}

bool IsExtraFreeMapEnabled()
{
    int i;

    if (!IsSramWorking())
        return 0;

    for (i = 0; i < 3; i++)
        if (IsGameSaveComplete(i))
            return true;

    return false;
}

bool IsExtraBonusClaimEnabled(void) {
    unsigned char buf0[0x4C];
    struct bmsave_unkstruct0 *buf1;
    int i, ret;

    if (LoadBonusContentData((void*)gGenericBuffer)) {

        ret = 0;
        buf1 = (void*)gGenericBuffer;
    
        for (i = 0; i < 0x10; i++) {
            if ((0 == buf1[i].unk[0]))
                continue;
    
            if (0 == buf1[i].unk[1])
                ret = true;

            if (2 == buf1[i].unk[1])
                ret = true;
        }

        if (0 == ret)
            return false;
        else
            return true;
    }
    return 0;
}

int GetUnitsAverageSupportValue(const int unitA, const int unitB)
{
    int i;


    for (i = 0; 0 != sSupportUnkLut[i][0]; i++) {
        if (sSupportUnkLut[i][0] == unitA)
            if (sSupportUnkLut[i][1] != unitB)
                return 2;

        if (sSupportUnkLut[i][0] == unitB)
            if (sSupportUnkLut[i][1] != unitA)
                return 2;
            
        if (sSupportUnkLut[i][1] == unitA)
            if (sSupportUnkLut[i][0] != unitB)
                return 2;

        if (sSupportUnkLut[i][1] == unitB)
            if (sSupportUnkLut[i][0] != unitA)
                return 2;
    }

    return 3;
}

int GetTotalAverageSupportValue()
{
    int ret = 0;
    struct SupportTalkEnt *buf = GetSupportTalkList();

    for (; 0xFFFF != buf->unitA; buf++)
        ret += GetUnitsAverageSupportValue(buf->unitA, buf->unitB);

    return ret;
}

int GetTotalGlobalSupportValue(struct GlobalSaveInfo *buf)
{
    int i, j, tmp1, tmp2, ret = 0;
    unsigned char *SuppordRecord;
    struct GlobalSaveInfo tmp_header;

    if (0 == buf) {
        buf = &tmp_header;
        ReadGlobalSaveInfo(buf);
    }


    for (i = 0; i < 0x20; i++) {
        for (j = 0; j < 4; j++) {
            tmp1 = 1 + i;
            tmp2 = buf->SuppordRecord[tmp1 - 1];
            ret += (tmp2 >> (j << 1)) & 3;
        }
    }

    return ret;
}

int GetTotalSupportCollection(void)
{
    int tmp0 = GetTotalGlobalSupportValue(0);
    int tmp1 = GetTotalAverageSupportValue();

    if ((tmp0 > 0) && (0 == ((tmp0 * 100) / tmp1)))
            tmp0 = 1;
    else
        tmp0 = (tmp0 * 100) / tmp1;

    if (tmp0 > 100)
        tmp0 = 100;
    
    return tmp0;
}

int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo *info)
{
    struct GlobalSaveInfo local_info;
    int i = 0;
    int ret = 0;
    int tmp0, tmp1, tmp2, tmp3;
    unsigned char *SuppordRecord;
    struct SupportTalkEnt *cur = GetSupportTalkList();

    if (info == NULL) {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (; cur->unitA != 0xFFFF; i++, cur++) {
        
        if (cur->unitA == unitA && cur->unitB == unitB)
            break;
    
        if (cur->unitA == unitB && cur->unitB == unitA)
            break;
    }

    tmp0 =  i >> 2;
    tmp1 = (3 & i) << 1;
    ret = 3 & info->SuppordRecord[tmp0] >> tmp1;
    return ret;
}

void GetGlobalSupportListFromSave(int unitId, u8* data, struct GlobalSaveInfo* info)
{
    struct GlobalSaveInfo local_info;
    struct SupportTalkEnt* ptr;
    int i;
    int j;

    if (gCharacterData[unitId-1].pSupportData == 0) {

        for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; data++, i++) {
            *data = 0;
        }

        return;
    }

    j = 0;
    ptr = GetSupportTalkList();

    if (info == NULL) {
        info = &local_info;
        ReadGlobalSaveInfo(info);
    }

    for (; ; j++, ptr++) {
        int tmp1, tmp2;

        if (ptr->unitA == 0xFFFF)
            break;

        if ((ptr->unitA != unitId) && (ptr->unitB != unitId))
            continue;

        tmp1 = j >> 2;
        tmp2 = (j & 3) << 1;

        for (i = 0; i < gCharacterData[unitId-1].pSupportData->supportCount; i++) {

            if ((ptr->unitA != gCharacterData[unitId-1].pSupportData->characters[i]) &&
                (ptr->unitB != gCharacterData[unitId-1].pSupportData->characters[i])) {
                continue;
            }

            data[i] = (info->SuppordRecord[tmp1] >> (tmp2)) & 3;

            break;
        }
    }

    for (i = gCharacterData[unitId-1].pSupportData->supportCount; i < UNIT_SUPPORT_MAX_COUNT; i++) {
        data[i] = 0;
    }

    return;
}

bool UpdateBestGlobalSupportValue(int unitA, int unitB, int supportRank) {
    int convo;
    int var0;
    int var1;
    struct GlobalSaveInfo info;
    struct SupportTalkEnt* ptr;

    supportRank = supportRank & 3;

    if (!ReadGlobalSaveInfo(&info)) {
        return 0;
    }

    convo = 0;

    for (ptr = GetSupportTalkList(); ; ptr++) {

        if (ptr->unitA == 0xFFFF)
            break;

        if ((ptr->unitA == unitA) && (ptr->unitB == unitB))
            break;

        if ((ptr->unitA == unitB) && (ptr->unitB == unitA))
            break;

        convo++;
    }

    var0 = convo >> 2;
    var1 = (convo & 3) << 1;

    if (((info.SuppordRecord[var0] >> var1) & 3) >= (supportRank))
        return false;

    info.SuppordRecord[var0] &= ~(3 << var1);
    info.SuppordRecord[var0] += (supportRank << var1);

    WriteGlobalSaveInfo(&info);

    return true;
}

void SGM_SetCharacterKnown(s32 charId, struct GlobalSaveInfo* buf)
{
  s32 boolLoadedSecureHeader = 0;
  struct GlobalSaveInfo tmp_header;
  
  if (charId > 256) {
    return;
  }
  if (buf == NULL) {
    buf = &tmp_header;
    ReadGlobalSaveInfo(buf);
    boolLoadedSecureHeader = 1;
  }
  
  buf->charKnownFlags[charId >> 3] |= 1 << (charId & 7);
  
  if (boolLoadedSecureHeader) {
    WriteGlobalSaveInfo(buf);
  }
}

bool GGM_IsCharacterKnown(int index, struct GlobalSaveInfo *buf)
{
    struct GlobalSaveInfo tmp_header;
    u32 _index = index;

    if (index > 0x100)
        return 0;

    if (0 == buf) {
        buf = &tmp_header;
        ReadGlobalSaveInfo(&tmp_header);
    }

    if (1 & buf->charKnownFlags[index >> 3] >> (_index % 8))
        return 1;
    else
        return 0;
}

int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo *buf)
{
    int i;
    struct GlobalSaveInfo tmp_header;

    if (NULL == buf) {
        buf = &tmp_header;
        ReadGlobalSaveInfo(&tmp_header);
    }

    for (i = 0; i < 0x20; i++) {
        if (0 != buf->charKnownFlags[i])
            return 1;
    }
    return 0;
}

void sub_80A3868() {}

void __malloc_unlock_3() {}

int IsGamePlayedThrough(void)
{
    struct GlobalSaveInfo tmp_header;

    if (!ReadGlobalSaveInfo(&tmp_header))
        return 0;

    if (0 == tmp_header.completed )
        return 0;
    else
        return 1;
}

bool LoadAndVerfyRankData(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == _buf)
        _buf = (void*)gGenericBuffer;

    ReadSramFast(
        (void*)gSram + 0x7190,
        (void*)_buf,
        sizeof(struct GameRankSaveDataPacks)
    );

    if (_buf->magic0 != Checksum16((void*)_buf, 0x90))
        return 0;
    else
        return 1;
}

bool LoadBonusContentData(void *buf)
{
    u16 *_buf = buf;
    
    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = (void*)gGenericBuffer;

    ReadSramFast(
        (void*)gSram + 0x725C,
        (void*)_buf,
        0x144
    );

    if (_buf[0x140 / 2] != Checksum16(_buf, 0x140))
        return 0;
    else
        return 1;
}

void SaveBonusContentData(void *buf)
{
    u16 *_buf = buf;

    _buf[0x140/2] = Checksum16(buf, 0x140);

    WriteAndVerifySramFast(buf, gSram + 0x725C, 0x144);
}

void SaveRankings(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    _buf->magic0 = Checksum16(buf, 0x90);

    WriteAndVerifySramFast(
        buf,
        (void*)gSram + 0x7190,
        sizeof(struct GameRankSaveDataPacks)
    );
}

void EraseSaveRankData()
{
    u16 _buf[0x94 / 2];

    CpuFill16(0, _buf, 0x128 / 2);
    SaveRankings(_buf);
}

int GetNextChapterMode()
{
    return gPlaySt.chapterModeIndex - 1;
}

int sub_80A39E4(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src;
    struct GameRankSaveData *dest = buf;

    CpuFill16(0, buf, 0x18);
    CpuFill16(0, &_buf, sizeof(_buf));

    if (0 != LoadAndVerfyRankData(&_buf)) {
        src = &_buf.pack[(chapter_mode + difficulty * 3)];
        *dest = *src;
        return 1;
    }
    
    return 0;
}

void SaveNewRankData(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src = buf;

    if (0 != LoadAndVerfyRankData(&_buf)) {
        _buf.pack[chapter_mode + difficulty * 3] = *src;
        SaveRankings(&_buf);
    }
}

u8 JudgeGameRankSaveData(struct GameRankSaveData *old, struct GameRankSaveData *new)
{
    int newtime, oldtime;
    
    if (0 == old->valid)
        return 1;

    if (new->unk00_01 > old->unk00_01)
        return 1;
    else if (new->unk00_01 != old->unk00_01)
        return 0;

    if (new->luckydog != 0 && new->luckydog != old->luckydog)
        return 1;

    if (new->unk00_17 > old->unk00_17)
        return 1;

    if (new->gold > old->gold)
        return 1;
    else if (new->gold != old->gold)
        return 0;

    newtime = new->hours * 3600
         + new->minutes * 60
         + new->seconds;

    oldtime = old->hours * 3600
         + old->minutes * 60
         + old->seconds;

    if (newtime >= oldtime)
        return 0;

    return 1;
}

void GenerateGameRankSaveData(struct GameRankSaveData *buf, int chapter_mode, int difficulty)
{
    int i, j;
    int best = 0;
    u16 hours, minutes, seconds;

    CpuFill16(0, buf, sizeof(struct GameRankSaveData));

    buf->valid = 1;
    buf->chapter_mode = chapter_mode;
    buf->chapter_stat = difficulty;

    buf->gold = GetPartyTotalGoldValue();
    
    buf->unk00_16 = gPlaySt.unk_2B_00;
    buf->unk00_17 = gPlaySt.unk_2C_04;

    ComputeDisplayTime(GetGameTotalTime(), &hours, &minutes, &seconds);
    buf->hours = hours;
    buf->minutes = minutes;
    buf->seconds = seconds;

    buf->cuteguy = 0;
    buf->luckydog = 0;

    for (i = 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (US_GROWTH_BOOST & unit->state) {
            if (US_DEAD & unit->state)
                break;
            
            buf->luckydog = unit->pCharacterData->number;
            break;
        }
    }

    for (j = 1; j < FACTION_GREEN; j++) {
        struct Unit *unit = GetUnit(j);

        if (0 == UNIT_IS_VALID(unit))
            continue;

        if (0 != ((CA_LOCK_1 | CA_STEAL) & unit->state))
            continue;

        if (PidStatsGetFavval(unit->pCharacterData->number) <= best)
            continue;

        best = PidStatsGetFavval(unit->pCharacterData->number);
        buf->cuteguy = unit->pCharacterData->number;
    }

    buf->tacticsRank = GetGameTacticsRank();
    buf->fundsRank = GetGameFundsRank();
    buf->survivalRank = GetGameSurvivalRank();
    buf->expRank = GetGameExpRank();
    buf->combatRank = GetGameCombatRank();

    buf->unk00_01 = GetOverallRank(buf->tacticsRank, buf->survivalRank, buf->fundsRank, buf->expRank, buf->combatRank);
    buf->unk08_15 = GetCurCompleteChapters();
    strcpy((void*)&buf->tactician_name, GetTacticianName());
}

void SaveEndgameRankings()
{
    struct GameRankSaveData old, new;

    int chapter_mode = GetNextChapterMode();
    int difficult = 1 & gPlaySt.chapterStateBits >> 6;

    GenerateGameRankSaveData(&new, chapter_mode, difficult);
    sub_80A39E4(&old, chapter_mode, difficult);

    if (0 != JudgeGameRankSaveData(&old, &new))
        SaveNewRankData(&new, chapter_mode, difficult);
}

void sub_80A3E28()
{
    u16 buf[0x12];
    
    CpuFill16(0, buf, sizeof(buf));
    sub_80A3EA4(buf);
}

bool sub_80A3E4C(void *buf)
{
    struct bmsave_unkstruct1 *_buf = buf;
    struct bmsave_unkstruct1 tmp;

    if (!IsSramWorking())
        return false;

    if (NULL == buf)
        _buf = &tmp;
    
    ReadSramFast(gSram + 0x7224, _buf, sizeof(struct bmsave_unkstruct1));

    if (_buf->magic1 != Checksum16(_buf, sizeof(struct bmsave_unkstruct1) - 4))
        return false;
    else
        return true;
}

void sub_80A3EA4(void *buf)
{
    struct bmsave_unkstruct1 *_buf = buf;

    _buf->magic1 = Checksum16(buf, sizeof(struct bmsave_unkstruct1) - 4);

    WriteAndVerifySramFast(_buf, gSram + 0x7224, sizeof(struct bmsave_unkstruct1));
}

int sub_80A3ED0(void *buf, int val)
{
    struct bmsave_unkstruct1 tmp;
    struct bmsave_unkstruct1 *_buf;
    u32 _val = val;

    if (0 == buf) {
        buf = &tmp;
        sub_80A3E4C(&tmp);
    }

    _buf = buf;
    if (1 & (_buf->unk[val >> 5] >> (_val % 0x20)))
        return 1;
    else
        return 0;
}

void sub_80A3F08(struct bmsave_unkstruct1 *buf, int val)
{
    struct bmsave_unkstruct1 tmp;
    u32 _val = val;
    
    if (NULL == buf) {
        buf = &tmp;
        
        if (!sub_80A3E4C(&tmp))
            return;
    }

    if (buf->unk[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->unk[val >> 5] |= 1 << (_val % 0x20);

    if (0x43 == val)
        buf->unk[0] |= 4;
    else if (2 == val)
        buf->unk[2] |= 8;

    if (0x54 == val)
        buf->unk[1] |= 1 << 0x10;
    else if (0x30 == val)
        buf->unk[2] |= 1 << 0x14;

    sub_80A3EA4(buf);
}

void sub_80A3F84()
{
    struct bmsave_unkstruct2 buf;
    
    CpuFill16(0, (void*)&buf, sizeof(buf));
    sub_80A4000(&buf);
}

bool sub_80A3FA8(void *buf)
{
    struct bmsave_unkstruct2 tmp, *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = &tmp;

    ReadSramFast((void*)gSram + 0x7248, (void*)_buf, sizeof(struct bmsave_unkstruct2));

    if (_buf->magic1 != Checksum16((u16*)_buf, sizeof(struct bmsave_unkstruct2) - 4))
        return 0;
    else
        return 1;
}

void sub_80A4000(struct bmsave_unkstruct2 *buf)
{
    buf->magic1 = Checksum16((u16*)buf, sizeof(struct bmsave_unkstruct2) - 4);

    WriteAndVerifySramFast((void*)buf,
                           (void*)gSram + 0x7248,
                            sizeof(struct bmsave_unkstruct2));
}

int sub_80A402C(void *buf, int val)
{
    struct bmsave_unkstruct2 tmp;
    struct bmsave_unkstruct2 *_buf;
    u32 _val = val;

    if (0 == buf) {
        buf = &tmp;
        sub_80A3FA8(&tmp);
    }

    _buf = buf;
    if (1 & (_buf->unk[val >> 5] >> (_val % 0x20)))
        return 1;
    else
        return 0;
}

void sub_80A4064(struct bmsave_unkstruct2 *buf, int val)
{
    struct bmsave_unkstruct2 tmp;
    u32 _val = val;
    
    if (NULL == buf) {
        buf = &tmp;
        
        if (!sub_80A3FA8(&tmp))
            return;
    }

    if (buf->unk[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->unk[val >> 5] |= (1 << (_val % 0x20));
    sub_80A4000(buf);
}

void LoadAndVerifySramSaveData()
{
    if (!ReadGlobalSaveInfo(NULL))
        InitGlobalSaveInfodata();

    if (!LoadBonusContentData(NULL))
        EraseBonusContentData();
    
    if (!LoadAndVerfyRankData(NULL))
        EraseSaveRankData();
    
    if (!sub_80A3E4C(NULL))
        sub_80A3E28();
    
    if (!sub_80A3FA8(NULL))
        sub_80A3F84();
    
    LoadAndVerfySuspendSave();
}
