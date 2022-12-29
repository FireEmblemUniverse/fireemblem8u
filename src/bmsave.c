#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"

#include "bmsave.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"

/* functions */
u8 CheckSaveHeaderMagic(void*, u8*);
void SaveBonusContentData(void*);
int SaveMetadata_VerifyChecksum(struct SramChunk *buf);
uintptr_t GetSaveTargetAddress(int index);
void SaveMetadata_ComputeChecksum(struct SramChunk*);
void *GetLocalEventIdStorage();
int GetLocalEventIdStorageSize();
void *GetGlobalEventIdStorage();
int GetGlobalEventIdStorageSize();
unsigned short *GetConvoyItemArray();
s8 LoadAndCheckChComplete(int);
int sub_80A6A68();
int GGM_IsAnyCharacterKnown(struct SaveMeta *buf);
u8 LoadAndVerfyRankData(void*);
u8 sub_80A6C1C();
u8 LoadBonusContentData(void*);
void sub_80A4000(struct bmsave_unkstruct2 *buf);


/* variables */
extern EWRAM_DATA s8 gBoolSramWorking;
EWRAM_DATA struct UnitUsageStats *gpBWLSaveTarget = NULL;
EWRAM_DATA struct UnitUsageStats gBWLDataStorage[BWL_ARRAY_NUM] = {0};
EWRAM_DATA struct ChapterWinData gChapterWinDataArray[WIN_ARRAY_NUM] = {0};
EWRAM_DATA u32 gBonusContentClaimFlags = 0;
EWRAM_DATA u8 gUnknown_0203EDB8 = 0;

extern struct SramHeader *gpSaveDataStart; /* 0x0E000000 */
extern CONST_DATA u8 gSaveHeaderKeygen[];
extern CONST_DATA unsigned char gUnknown_08205CA4[]; /* related to convoy */
extern CONST_DATA unsigned char gUnknown_08205CAC[];
extern CONST_DATA int gUnknown_08A1FAF8[][2];

void SramInit()
{
    u32 buf[2];
    buf[0] = 0x12345678;
    buf[1] = 0x87654321;

    SetSramFastFunc();
    *InterruptEnableRegister |= 0x2000;
    WriteSramFast((void*)(&buf[0]), (void*)gpSaveDataStart + 0x73A0, 4);
    (*ReadSramFast)((void*)gpSaveDataStart + 0x73A0,(void*)(&buf[1]), 4);
    
    gBoolSramWorking = (buf[1] == buf[0])
                     ? 1
                     : 0;
}

s8 IsSramWorking()
{
    return gBoolSramWorking;
}

void EraseSecureHeader()
{
    int buf[0x10];
    int i;

    for (i = 0; i < 0x10; i++)
        buf[i] = -1;

    for (i = 0; i < 0x200; i++)
        WriteAndVerifySramFast((void*)buf, (void*)gpSaveDataStart + i * 0x40, 0x40);
}

u16 ComputeChecksum16(const u16* data, int size)
{
    int i;
    u32 addAcc = 0;
    u32 xorAcc = 0;
    
    for (i = 0; i < size/2; ++i) {
        addAcc += data[i];
        xorAcc ^= data[i];
    }
    
    return addAcc + xorAcc;
}


u8 LoadGeneralGameMetadata(struct SaveMeta *buf)
{
    struct SaveMeta tmp;
    struct SaveMeta *header = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == buf)
        header = &tmp;

    (*ReadSramFast)((void*)gpSaveDataStart, (void*)header, sizeof(struct SaveMeta));

    if ((0 != CheckSaveHeaderMagic(header, gSaveHeaderKeygen)) &&
        (0x40624 == header->_00040624) &&
        (0x200A == header->_200A) &&
        (header->sec_sum == ComputeChecksum16((void*)header, 0x50)))
        return 1;

    return 0;
}

void SaveGeneralGameMetadata(struct SaveMeta *header)
{
    header->sec_sum = ComputeChecksum16((void*)header, 0x50);
    WriteAndVerifySramFast((void*)header, (void*)gpSaveDataStart, sizeof(struct SaveMeta));
}

void SaveGeneralGameMetadataNoChecksum(struct SaveMeta *header)
{
    WriteAndVerifySramFast((void*)header, (void*)gpSaveDataStart, sizeof(struct SaveMeta));
}

void InitSaveMetadata()
{
    struct SaveMeta header;
    int i;

    EraseSecureHeader();
    CopyString((void*)(&header), (void*)gSaveHeaderKeygen);

    header._00040624 = 0x00040624;
    header._200A = 0x200A;

    header.play_through_declared  = 0;
    header.flag0E_1 = 0;
    header.Eirk_mode_easy = 0;
    header.Eirk_mode_norm = 0;
    header.Eirk_mode_hard = 0;
    header.Ephy_mode_easy = 0;
    header.Ephy_mode_norm = 0;
    header.Ephy_mode_hard = 0;

    header.unk0F_0 = 0;
    header.unk0F_1 = 0;

    header.unk10 = 0;
    header.unk12 = 0;

    header.slot_su = 0;
    header.slot_sa = 0;

    for (i = 0; i < 0xC; i++)
        header.playthrough_ids[i] = 0;

    for (i = 0; i < 0x20; i++)
        header.SuppordRecord[i] = 0;

    for (i = 0; i < 0x20; i++)
        header.charKnownFlags[i] = 0;

    SaveGeneralGameMetadata(&header);

    return;
}

void EraseBonusContentData()
{
    u8 *buf = gGenericBuffer;
    CPU_FILL(0, buf, 0x144, 16);
    SaveBonusContentData(buf);
}

uintptr_t SramOffsetToPointer(u16 off)
{
    return (uintptr_t)gpSaveDataStart + off;
}

u16 SramPointerToOffset(uintptr_t addr)
{
    return addr - (uintptr_t)gpSaveDataStart;
}

s8 SaveMetadata_Load(struct SramChunk *buf, int index)
{
    struct SramChunk tmp;
    u32 key;

    if (0 == buf)
        buf = &tmp;

    (*ReadSramFast)(
        (void*)(&gpSaveDataStart->chunks[index]),
        (void*)buf,
        sizeof(struct SramChunk));

    if (0x200A != buf->magic2)
        return 0;

    switch (index) {
    case SAVE_CHUNK_0:
    case SAVE_CHUNK_1:
    case SAVE_CHUNK_2:
    case SAVE_CHUNK_3:
        key = 0x00040624;
        break;
        
    case SAVE_CHUNK_4:
        key = 0x00040624;
        break;

    case SAVE_CHUNK_5:
        key = 0x00020112;
        break;

    case SAVE_CHUNK_6:
        key = 0x00020223;
        break;
    
    default:
        return 0;
        break;
    } /* switch */

    if (buf->magic1 != key)
        return 0;

    return SaveMetadata_VerifyChecksum(buf);
}

void SaveMetadata_Save(struct SramChunk *buf, int index) {

    buf->magic2 = 0x200A;
    buf->sram_offset = (uintptr_t)GetSaveTargetAddress(index);

    if (!(index < SAVE_CHUNK_MAX))
        return;

    switch (buf->type) {
    case SAVE_CHUNK_0:
        buf->size = 0x0DC8;
        break;

    case SAVE_CHUNK_1:
        buf->size = 0x1F78;
        break;

    case SAVE_CHUNK_2:
        buf->size = 0x0874;
        break;

    case SAVE_CHUNK_3:
        buf->size = 0xC00;
        break;

    case 0xFF:
        buf->size = 0;
        buf->sram_offset = 0;
        buf->magic2 = 0;
        break;

    default:
        return;
    }

    SaveMetadata_ComputeChecksum(buf);
    WriteAndVerifySramFast(
        (void*)buf,
        (void*)(&gpSaveDataStart->chunks[index]),
        sizeof(struct SramChunk));
}

void SaveMetadata_Erase(int index)
{
    struct SramChunk chunk;

    if (index < SAVE_CHUNK_MAX) {
        CpuFill16(0xFFFF, &chunk, sizeof(struct SramChunk));
        WriteAndVerifySramFast(
            (void*)(&chunk),
            (void*)(&gpSaveDataStart->chunks[index]),
            sizeof(struct SramChunk));
    }
}

uintptr_t GetSaveTargetAddress(int index)
{
    switch (index) {
        case SAVE_CHUNK_0:
            return 0x00003FC4 + (uintptr_t)gpSaveDataStart;
            break;

        case SAVE_CHUNK_1:
            return 0x00004D8C + (uintptr_t)gpSaveDataStart;
            break;

        case SAVE_CHUNK_2:
            return 0x00005B54 + (uintptr_t)gpSaveDataStart;
            break;

        case SAVE_CHUNK_3:
            return 0x000000d4 + (uintptr_t)gpSaveDataStart;
            break;

        case SAVE_CHUNK_4:
            return 0x0000204C + (uintptr_t)gpSaveDataStart;
            break;

        case SAVE_CHUNK_5:
            return 0x0000691C + (uintptr_t)gpSaveDataStart;
            break;

        case SAVE_CHUNK_6:
            return (uintptr_t)0x0E007400;
            break;

        default:
            return 0;
            break;
    }
}

uintptr_t GetSaveSourceAddress(int index)
{
    struct SramChunk chunk;
    SaveMetadata_Load(&chunk, index);
    return SramOffsetToPointer(chunk.sram_offset);
}

void SaveLocalEventIndexes(void *sram_dest)
{
    WriteAndVerifySramFast(
        GetLocalEventIdStorage(),
        sram_dest,
        GetLocalEventIdStorageSize());
}

void SaveGlobalEventIndexes(void *sram_dest)
{
    WriteAndVerifySramFast(
        GetGlobalEventIdStorage(),
        sram_dest,
        GetGlobalEventIdStorageSize());
}

void LoadLocalEventIds(void *ewram_dest)
{
    (*ReadSramFast)(
        ewram_dest,
        GetLocalEventIdStorage(),
        GetLocalEventIdStorageSize());
}

void LoadGlobalEventIds(void *ewram_dest)
{
    (*ReadSramFast)(
        ewram_dest,
        GetGlobalEventIdStorage(),
        GetGlobalEventIdStorageSize());
}

void LoadGlobalEventIds_ret(void *sram_src, void *ewram_dest)
{
    (*ReadSramFast)(
        sram_src,
        ewram_dest,
        GetGlobalEventIdStorageSize());
}

void SaveConvoyItems(void *sram_dest) {
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
            (*cur & gUnknown_08205CA4[var0]) |
            (item_use << var0);

        if (var0 > 1) {
            cur++;
            if (var0 > 2) {
                *cur =
                    (*cur & gUnknown_08205CAC[var0]) |
                    (item_use >> (8 - var0));
            }
        }
        var1 += 6;
        ++items;
    }

    WriteAndVerifySramFast(buf, sram_dest, 0xB0);
}

void LoadConvoyItems(const void *sram_src)
{
    unsigned char buf[176];
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
        item_use = (*cur & ~gUnknown_08205CA4[var0]) >> var0;

        if (var0 > 1) {
            cur++;

            if (var0 > 2) {
                item_use |= (*cur & ~gUnknown_08205CAC[var0]) << (8 - var0);
            }
        }

        items[0] |= item_use << 8;
        var1 += 6;
        items++;
    }

}

int sub_80A32EC()
{
    return 1;
}

s8 sub_80A32F0(int index)
{
    int i;

    if (!IsSramWorking())
        return 0;

    for (i = 0; i < 3; i++)
        if (LoadAndCheckChComplete(i))
            return 1;

    return sub_80A6A68();
}

int sub_80A3328()
{
    return 1;
}

signed char sub_80A332C()
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

int sub_80A33C4()
{
    struct SaveMeta buf;

    if (!LoadGeneralGameMetadata(&buf))
        return 0;

    if (!sub_80A6C1C())
        return 0;
    else
        return 1;
}

int sub_80A33EC()
{
    int i;

    if (!IsSramWorking())
        return 0;

    for (i = 0; i < 3; i++)
        if (LoadAndCheckChComplete2(i))
            return 1;

    return 0;
}

int sub_80A341C(void) {
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
                ret = 1;

            if (2 == buf1[i].unk[1])
                ret = 1;
        }

        if (0 == ret)
            return 0;
        else
            return 1;
    }
    return 0;
}

int sub_80A3468(const int val0, const int val1) {
    int i;

    if (0 != gUnknown_08A1FAF8[0][0]) {
        for (i = 0; 0 != gUnknown_08A1FAF8[i][0]; i++) {
            if (gUnknown_08A1FAF8[i][0] == val0)
                if (gUnknown_08A1FAF8[i][1] != val1)
                    return 2;

            if (gUnknown_08A1FAF8[i][0] == val1)
                if (gUnknown_08A1FAF8[i][1] != val0)
                    return 2;
            
            if (gUnknown_08A1FAF8[i][1] == val0)
                if (gUnknown_08A1FAF8[i][0] != val1)
                    return 2;

            if (gUnknown_08A1FAF8[i][1] == val1)
                if (gUnknown_08A1FAF8[i][0] != val0)
                    return 2;
        }
    }
    return 3;
}

int sub_80A34CC()
{
    int ret = 0;
    struct SupportTalkEnt *buf = sub_80847F8();

    for (; 0xFFFF != buf->unitA; buf++)
        ret += sub_80A3468(buf->unitA, buf->unitB);

    return ret;
}

int sub_80A3500(struct SaveMeta *buf)
{
    int i, j, tmp1, tmp2, ret = 0;
    unsigned char *SuppordRecord;
    struct SaveMeta tmp_header;

    if (0 == buf) {
        buf = &tmp_header;
        LoadGeneralGameMetadata(buf);
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

int sub_80A3544(void) {
    int tmp0 = sub_80A3500(0);
    int tmp1 = sub_80A34CC();

    if ((tmp0 > 0) && (0 == ((tmp0 * 0x64) / tmp1)))
            tmp0 = 1;
    else
        tmp0 = (tmp0 * 0x64) / tmp1;

    if (tmp0 > 0x64)
        tmp0 = 0x64;
    
    return tmp0;
}

int sub_80A3584(int param0, int param1, struct SaveMeta *buf)
{
    struct SaveMeta tmp_header;
    int i = 0;
    int ret = 0;
    int tmp0, tmp1, tmp2, tmp3;
    unsigned char *SuppordRecord;
    struct SupportTalkEnt *cur = sub_80847F8();

    if (buf == NULL) {
        buf = &tmp_header;
        LoadGeneralGameMetadata(buf);
    }

    while (1) {
        if (cur->unitA == 0xFFFF)
            break;
        
        if (cur->unitA == param0 && cur->unitB == param1)
            break;
    
        if (cur->unitA == param1 && cur->unitB == param0)
            break;

        i++;
        cur++;
    }

    tmp0 =  i >> 2;
    tmp1 = (3 & i) << 1;
    ret = 3 & buf->SuppordRecord[tmp0] >> tmp1;
    return ret;
}

void sub_80A35EC(int unitId, u8* data, struct SaveMeta* buf) {
    struct SaveMeta tempHeader;
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
    ptr = sub_80847F8();

    if (buf == 0) {
        buf = &tempHeader;
        LoadGeneralGameMetadata(buf);
    }

    for (; ; j++, ptr++) {
        int tmp1, tmp2;

        if (ptr->unitA == 0xFFFF) {
            break;
        }

        if ((ptr->unitA != unitId) && (ptr->unitB != unitId)) {
            continue;
        }

        tmp1 = j >> 2;
        tmp2 = (j & 3) << 1;

        for (i = 0; i < gCharacterData[unitId-1].pSupportData->supportCount; i++) {

            if ((ptr->unitA != gCharacterData[unitId-1].pSupportData->characters[i]) &&
                (ptr->unitB != gCharacterData[unitId-1].pSupportData->characters[i])) {
                continue;
            }

            data[i] = (buf->SuppordRecord[tmp1] >> (tmp2)) & 3;

            break;
        }
    }

    for (i = gCharacterData[unitId-1].pSupportData->supportCount; i < UNIT_SUPPORT_MAX_COUNT; i++) {
        data[i] = 0;
    }

    return;
}

s8 sub_80A3724(int unitA, int unitB, int supportRank) {
    int convo;
    int var0;
    int var1;
    struct SaveMeta tempHeader;
    struct SupportTalkEnt* ptr;

    supportRank = supportRank & 3;

    if (!LoadGeneralGameMetadata(&tempHeader)) {
        return 0;
    }

    convo = 0;

    for (ptr = sub_80847F8(); ; ptr++) {

        if (ptr->unitA == 0xFFFF) {
            break;
        }

        if ((ptr->unitA == unitA) && (ptr->unitB == unitB)) {
            break;
        }

        if ((ptr->unitA == unitB) && (ptr->unitB == unitA)) {
            break;
        }

        convo++;
    }

    var0 = convo >> 2;
    var1 = (convo & 3) << 1;

    if (((tempHeader.SuppordRecord[var0] >> var1) & 3) >= (supportRank)) {
        return 0;
    }

    tempHeader.SuppordRecord[var0] &= ~(3 << var1);
    tempHeader.SuppordRecord[var0] += (supportRank << var1);

    SaveGeneralGameMetadata(&tempHeader);

    return 1;
}

void SGM_SetCharacterKnown(s32 charId, struct SaveMeta* buf)
{
  s32 boolLoadedSecureHeader = 0;
  struct SaveMeta tmp_header;
  
  if (charId > 256) {
    return;
  }
  if (buf == NULL) {
    buf = &tmp_header;
    LoadGeneralGameMetadata(buf);
    boolLoadedSecureHeader = 1;
  }
  
  buf->charKnownFlags[charId >> 3] |= 1 << (charId & 7);
  
  if (boolLoadedSecureHeader) {
    SaveGeneralGameMetadata(buf);
  }
}

int GGM_IsCharacterKnown(int index, struct SaveMeta *buf)
{
    struct SaveMeta tmp_header;
    u32 _index = index;

    if (index > 0x100)
        return 0;

    if (0 == buf) {
        buf = &tmp_header;
        LoadGeneralGameMetadata(&tmp_header);
    }

    if (1 & buf->charKnownFlags[index >> 3] >> (_index % 8))
        return 1;
    else
        return 0;
}

int GGM_IsAnyCharacterKnown(struct SaveMeta *buf)
{
    int i;
    struct SaveMeta tmp_header;

    if (NULL == buf) {
        buf = &tmp_header;
        LoadGeneralGameMetadata(&tmp_header);
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
    struct SaveMeta tmp_header;

    if (!LoadGeneralGameMetadata(&tmp_header))
        return 0;

    if (0 == tmp_header.play_through_declared )
        return 0;
    else
        return 1;
}

u8 LoadAndVerfyRankData(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == _buf)
        _buf = (void*)gGenericBuffer;

    (*ReadSramFast)(
        (void*)gpSaveDataStart + 0x7190,
        (void*)_buf,
        sizeof(struct GameRankSaveDataPacks)
    );

    if (_buf->magic0 != ComputeChecksum16((void*)_buf, 0x90))
        return 0;
    else
        return 1;
}

u8 LoadBonusContentData(void *buf)
{
    u16 *_buf = buf;
    
    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = (void*)gGenericBuffer;

    (*ReadSramFast)(
        (void*)gpSaveDataStart + 0x725C,
        (void*)_buf,
        0x144
    );

    if (_buf[0x140 / 2] != ComputeChecksum16(_buf, 0x140))
        return 0;
    else
        return 1;
}

void SaveBonusContentData(void *buf)
{
    u16 *_buf = buf;

    _buf[0x140/2] = ComputeChecksum16(buf, 0x140);

    WriteAndVerifySramFast(
        buf,
        (void*)gpSaveDataStart + 0x725C,
        0x144
    );
}

void SaveRankings(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    _buf->magic0 = ComputeChecksum16(buf, 0x90);

    WriteAndVerifySramFast(
        buf,
        (void*)gpSaveDataStart + 0x7190,
        sizeof(struct GameRankSaveDataPacks)
    );
}

void sub_80A39B4()
{
    u16 _buf[0x94 / 2];

    CpuFill16(0, _buf, 0x128 / 2);
    SaveRankings(_buf);
}

int GetNextChapterMode()
{
    return gRAMChapterData.chapterModeIndex - 1;
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
    
    buf->unk00_16 = gRAMChapterData.unk_2B_00;
    buf->unk00_17 = gRAMChapterData.unk_2C_04;

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

        if (BWL_GetFavoritismValue(unit->pCharacterData->number) <= best)
            continue;

        best = BWL_GetFavoritismValue(unit->pCharacterData->number);
        buf->cuteguy = unit->pCharacterData->number;
    }

    buf->unk00_04 = sub_80B5D74();
    buf->unk00_0A = sub_80B5FD0();
    buf->unk00_07 = sub_80B5E6C();
    buf->unk00_0D = sub_80B5EA4();
    buf->unk00_10 = sub_80B5F9C();

    buf->unk00_01 = sub_80B6070(buf->unk00_04, buf->unk00_07, buf->unk00_0A, buf->unk00_0D, buf->unk00_10);
    buf->unk08_15 = GetWonChapterCount();
    strcpy((void*)&buf->tactician_name, GetTacticianName());
}

void SaveEndgameRankings()
{
    struct GameRankSaveData old, new;

    int chapter_mode = GetNextChapterMode();
    int difficult = 1 & gRAMChapterData.chapterStateBits >> 6;

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

u8 sub_80A3E4C(void *buf)
{
    struct bmsave_unkstruct1 *_buf = buf;
    struct bmsave_unkstruct1 tmp;

    if (!IsSramWorking())
        return 0;

    if (NULL == buf)
        _buf = &tmp;
    
    (*ReadSramFast)((void*)gpSaveDataStart + 0x7224,
                    (void*)_buf,
                    sizeof(struct bmsave_unkstruct1));

    if (_buf->magic1 != ComputeChecksum16((u16*)_buf, sizeof(struct bmsave_unkstruct1) - 4))
        return 0;
    else
        return 1;
}

void sub_80A3EA4(void *buf)
{
    struct bmsave_unkstruct1 *_buf = buf;

    _buf->magic1 = ComputeChecksum16(buf, sizeof(struct bmsave_unkstruct1) - 4);

    WriteAndVerifySramFast((void*)_buf,
                           (void*)gpSaveDataStart + 0x7224,
                            sizeof(struct bmsave_unkstruct1));
}

int sub_80A3ED0(void *buf, int val) {
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

u8 sub_80A3FA8(void *buf)
{
    struct bmsave_unkstruct2 tmp, *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = &tmp;

    (*ReadSramFast)((void*)gpSaveDataStart + 0x7248, (void*)_buf, sizeof(struct bmsave_unkstruct2));

    if (_buf->magic1 != ComputeChecksum16((u16*)_buf, sizeof(struct bmsave_unkstruct2) - 4))
        return 0;
    else
        return 1;
}

void sub_80A4000(struct bmsave_unkstruct2 *buf)
{
    buf->magic1 = ComputeChecksum16((u16*)buf, sizeof(struct bmsave_unkstruct2) - 4);

    WriteAndVerifySramFast((void*)buf,
                           (void*)gpSaveDataStart + 0x7248,
                            sizeof(struct bmsave_unkstruct2));
}

int sub_80A402C(void *buf, int val) {
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

void sub_80A40A8()
{
    if (!LoadGeneralGameMetadata(NULL))
        InitSaveMetadata();

    if (!LoadBonusContentData(NULL))
        EraseBonusContentData();
    
    if (!LoadAndVerfyRankData(NULL))
        sub_80A39B4();
    
    if (!sub_80A3E4C(NULL))
        sub_80A3E28();
    
    if (!sub_80A3FA8(NULL))
        sub_80A3F84();
    
    sub_80A6AA0();
}

void SaveClearedBWLAndChapterWinData(void *sram_dest)
{
    int i, j;
    void *dest0 ,*dest1, *src;

    CpuFill16(0, gBWLDataStorage, sizeof(gBWLDataStorage));
    CpuFill16(0, gChapterWinDataArray, sizeof(gChapterWinDataArray));

    src = gBWLDataStorage;
    dest0 = sram_dest + 0x084C;

    for (i = 0; i < BWL_ARRAY_NUM; i++) {
        gBWLDataStorage[i].favval = 0x2000;
        WriteAndVerifySramFast((const u8*)src, dest0, sizeof(struct UnitUsageStats));

        dest0 += sizeof(struct UnitUsageStats);
    }

    dest1 = sram_dest + 0x0CAC;

    for (i = 0; i < WIN_ARRAY_NUM; i++) {
        WriteAndVerifySramFast((const u8*)gChapterWinDataArray, dest1, sizeof(struct ChapterWinData));
        dest1 += sizeof(struct ChapterWinData);
    }

    gpBWLSaveTarget = sram_dest + 0x084C;
}

void sub_80A41A4()
{
    gRAMChapterData.unk_2C_04 = 0;
    SetPartyGoldAmount(0);
    sub_80A41C8();
}

void sub_80A41C8()
{
    CpuFill16(0, gBWLDataStorage, sizeof(gBWLDataStorage));
    gRAMChapterData.unk_38_2 = 0;
    gRAMChapterData.unk_34_14 = 0;
    gRAMChapterData.unk_38_1 = 0;
    gRAMChapterData.unk_34_00 = 0;
    gRAMChapterData.total_gold = GetPartyTotalGoldValue();
}

void LoadBWLEntries(void *sram_src)
{
    (*ReadSramFast)(sram_src, (u8*)gBWLDataStorage, sizeof(gBWLDataStorage));
    gpBWLSaveTarget = sram_src;
}

void LoadChapterDataWinArray(const void *sram_src)
{
    ReadSramFast(sram_src, (u8*)gChapterWinDataArray, sizeof(gChapterWinDataArray));
}

void SaveBWLEntries(void *sram_dest)
{
    WriteAndVerifySramFast((const u8*)gBWLDataStorage, sram_dest, sizeof(gBWLDataStorage));
    gpBWLSaveTarget = sram_dest;
}

void SaveChapterWinData(void *sram_dest)
{
    WriteAndVerifySramFast((const u8*)gChapterWinDataArray, sram_dest, sizeof(gChapterWinDataArray));
}

struct ChapterWinData *GetChapterWinDataEntry(int index)
{
    return &gChapterWinDataArray[index];
}

u32 sub_80A42A8(u16 *pval)
{
    u32 ret = *pval & 0xFF80;
    return ((-ret) | ret) >> 0x1F;
}

int GetNextChapterWinDataEntryIndex()
{
    struct ChapterWinData *cur = GetChapterWinDataEntry(0);
    int ret = 0;

    while (cur->chapter_turn) {
        ++ret;
        ++cur;
    }

    return ret;
}

int GetWonChapterCount()
{
    struct ChapterWinData *cur = GetChapterWinDataEntry(0);
    int ret;

    for (ret = 0; cur->chapter_turn; cur++) {
        if (DoesThisChapterCount(cur->chapter_index))
            ret++;
    }

    return ret;
}

int GetNextChapterWinDataEntry()
{
    int index = GetNextChapterWinDataEntryIndex();

    if (0 == index)
        return -1;
    else
        return GetChapterWinDataEntry(index - 1)->chapter_index;
}

void RegisterChapterTimeAndTurnCount(struct RAMChapterData* chData)
{
    struct ChapterWinData *win_data = GetChapterWinDataEntry(GetNextChapterWinDataEntryIndex());
    int time, turn;
    
    time = (GetGameClock() - chData->unk4) / 0xB4;
    if (time > 0xEA60)
        time = 0xEA60;

    turn = chData->chapterTurnNumber;
    if (turn > 0x1F4)
        turn = 0x1F4;

    win_data->chapter_index = chData->chapterIndex;
    win_data->chapter_turn = turn;
    win_data->chapter_time = time;
    
}

int GetGameTotalTime_unused()
{
    int time = 0;
    int index = GetNextChapterWinDataEntryIndex();
    int i = 0;

    if (time < index)
        for (; i < index; i++)
            time += GetChapterWinDataEntry(i)->chapter_time * 180;

    return time;
}

int GetGameTotalTurnCount()
{
    int ret = 0;
    int index = GetNextChapterWinDataEntryIndex();
    int i = 0;

    if (ret < index)
        for (; i < index; i++)
            ret += GetChapterWinDataEntry(i)->chapter_turn;

    return ret;
}

u8 DoesThisChapterCount(u32 ch_index)
{
    switch (gRAMChapterData.chapterModeIndex) {
    case CHAPTER_MODE_COMMON:
        if (ch_index < 10)
            return 1;
        break;

    case CHAPTER_MODE_EIRIKA:
        if (ch_index >= 10 && ch_index <= 21)
            return 1;
        break;

    case CHAPTER_MODE_EPHRAIM:
        if (ch_index <= 34 && ch_index >= 23)
            return 1;
        break;
    }
    return 0;
}

int GetGameTotalTime()
{
    int time = 0;
    int ch_index = GetNextChapterWinDataEntryIndex();
    int i = 0;
    struct ChapterWinData *cur;

    for(; i < ch_index; i++) {
        cur = GetChapterWinDataEntry(i);

        if (DoesThisChapterCount(cur->chapter_index))
            time += cur->chapter_time * 180;
    }

    return time;
}

int GetGameTotalTurnCount2()
{
    int count = 0;
    int ch_index = GetNextChapterWinDataEntryIndex();
    int i = 0;
    struct ChapterWinData *cur;

    for(; i < ch_index; i++) {
        cur = GetChapterWinDataEntry(i);

        if (DoesThisChapterCount(cur->chapter_index))
            count += cur->chapter_turn;
    }

    return count;
}

static inline struct UnitUsageStats *BWL_GetEntry_Inline(u8 char_id)
{
    if (char_id >= BWL_ARRAY_NUM)
        return 0;
    else if (0 == GetCharacterData(char_id)->affinity)
        return 0;
    else
        return &gBWLDataArray[char_id];  
}

void sub_80A44C8(struct Unit* unit)
{
    u32 char_id;
    struct UnitUsageStats *bwl;
    
    if (FACTION_BLUE != UNIT_FACTION(unit))
        return;

    char_id = UNIT_CHAR_ID(unit);
    
    bwl = BWL_GetEntry_Inline(char_id);
    if (NULL == bwl)
        return;

    if (bwl->battleAmt < 4000)
        bwl->battleAmt++;

    BWL_AddFavoritismValue(UNIT_CHAR_ID(unit), 4);
}

void BWL_IncrementWinCount(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (NULL == bwl)
        return;

    if (bwl->winAmt < 0x3E8)
        bwl->winAmt++;

    BWL_AddFavoritismValue(char_id, 0x10);
}

void RecordUnitLossData(u8 char_id)
{
    struct SramChunk buf;
    int val;
    
    if (IsSramWorking()){

        struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
        if (0 == bwl)
            return;
    
        if (1 == gGameState.unk3C)
            return;

        if (0x08 & gRAMChapterData.chapterStateBits)
            return;
    
        if (0x40 & gGameState.gameStateBits)
            return;
    
        if (0x20 & gGameState.gameStateBits)
            return;
    
        if (0x80 & gRAMChapterData.chapterStateBits)
            return;
    
        if (bwl->lossAmt >= 0xC8)
            return;
        
        bwl->lossAmt++;
    
        BWL_AddFavoritismValue(char_id, -0x80);
    
        val = GetLastSuspendSaveId() + 3;
    
        WriteAndVerifySramFast((void*)bwl,
            (void*)GetSaveTargetAddress(val) + 0x19E4 + char_id * 0x10,
            1);
    
        SaveMetadata_Load(&buf, val);
        SaveMetadata_Save(&buf, val);
    
        WriteAndVerifySramFast((void*)bwl,
                (void*)GetSaveTargetAddress(gRAMChapterData.gameSaveSlot) + 0x083C + char_id * 0x10,
                3);
    
        SaveMetadata_Load(&buf, gRAMChapterData.gameSaveSlot);
        SaveMetadata_Save(&buf, gRAMChapterData.gameSaveSlot);
    }
}

void BWL_AddWinOrLossIdk(u8 char_id, u8 killerPid, int deathCause)
{
    int type;
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    type = GetChapterThing();
    switch (type) {
    case 2:
        bwl->deathSkirm = 1;
        bwl->deathLoc = gGMData.unk10[0].location;
        break;


    case 0:
    case 1:
    default:
        bwl->deathSkirm = 0;
        bwl->deathLoc = gRAMChapterData.chapterIndex;
        break;
    }

    bwl->deathTurn = gRAMChapterData.chapterTurnNumber;
    bwl->killerPid = killerPid;
    bwl->deathCause = deathCause;
}

void BWL_IncrementMoveValue(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    if (bwl->actAmt < 200)
        bwl->actAmt++;

    BWL_AddFavoritismValue(char_id, 2);
}

void BWL_IncrementStatScreenViews(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    if (bwl->statViewAmt < 200)
        bwl->statViewAmt++;
    
    BWL_AddFavoritismValue(char_id, 2);
}

void BWL_IncrementDeployCountMaybe(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    if (bwl->deployAmt < 60)
        bwl->deployAmt++;
    
    BWL_AddFavoritismValue(char_id, 0x40);
}

void BWL_AddTilesMoved(u8 char_id, int amount)
{
    int move_count;
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    move_count = bwl->moveAmt + amount;
    if (move_count > 1000)
        move_count = 1000;

    bwl->moveAmt = move_count;
    
    BWL_AddFavoritismValue(char_id, 2);
}

void BWL_AddExpGained(u8 char_id, int expGain)
{
    int exp;
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    exp = bwl->expGained + expGain;
    if (exp > 4000)
        exp = 4000;

    bwl->expGained = exp;
    
    BWL_AddFavoritismValue(char_id, expGain);
}

void BWL_FavorReduced(u8 char_id)
{
    BWL_AddFavoritismValue(char_id, -0x08);
}

void BWL_FavorReduced_H(u8 char_id)
{
    BWL_AddFavoritismValue(char_id, -0x100);
}

int BWL_GetTotalBattles()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].battleAmt;

    return ret;
}

int BWL_GetTotalWins()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].winAmt;

    return ret;
}

int BWL_GetTotalLoss()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].lossAmt;

    return ret;
}

int BWL_GetTotalLevel()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].expGained / 100;

    return ret;
}

int BWL_GetTotalExpGained()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].expGained;

    return ret;
}

int BWL_GetUnitExpGained(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return 0;
    else
        return bwl->expGained;
}

int BWL_GetFavoritismValue(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return 0x2000;
    else
        return bwl->favval >> 6;
}

void BWL_AddFavoritismValue(u8 char_id, int val)
{
    int cur;
    
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return;

    cur = bwl->favval + val;
    
    if (cur > 0x4000)
        bwl->favval = 0x4000;
    else if (cur < 0)
        bwl->favval = 0;
    else
        bwl->favval = cur;
}

void RecordUnitBattleResult()
{
    struct BattleUnit *buA = NULL, *buB = NULL;

    if (0 == GetUnitCurrentHp(&gBattleActor.unit)) {
        buA = &gBattleActor;
        buB = &gBattleTarget;
    }

    if (0 == GetUnitCurrentHp(&gBattleTarget.unit)) {
        buA = &gBattleTarget;
        buB = &gBattleActor;
    }

    if (NULL != buA) {
        if (NULL != buB && FACTION_BLUE == UNIT_FACTION(&buB->unit)) {
            BWL_IncrementWinCount(UNIT_CHAR_ID(&buB->unit));
            gRAMChapterData.unk48++;
        }

        if (NULL != buA && FACTION_BLUE == UNIT_FACTION(&buA->unit))
            RecordUnitLossData(UNIT_CHAR_ID(&buA->unit));
    }
}

u8 IsPlaythroughIdUnique(int index)
{
    int i;
    struct SaveMeta sec_head;
    struct RAMChapterData ram_ch;

    LoadGeneralGameMetadata(&sec_head);

    for (i = 0; i < 0xC; i++)
        if (sec_head.playthrough_ids[i] == index)
            return 0;

    for (i = 0; i < 3; i++) {
        if (!SaveMetadata_LoadId(i))
            continue;

        LoadSavedChapterState(i, &ram_ch);

        if (ram_ch.playthroughIdentifier == index)
            return 0;
    }
    
    return 1;
}

int GetNewPlaythroughId()
{
    int i;
    for (i = 1; i < 0x100; i++)
        if (IsPlaythroughIdUnique(i))
            return i;
}

int GGM_GetCompletionCount(struct SaveMeta *sec_head)
{
    int i, ret = 0;

    for (i = 0; i < 0xC; i++)
        if (0 != sec_head->playthrough_ids[i])
            ret++;

    return ret;
}

int GetGlobalCompletionCount()
{
    struct SaveMeta sec_head;

    if (!LoadGeneralGameMetadata(&sec_head))
        return 0;
    else
        return GGM_GetCompletionCount(&sec_head);
}

int GGM_RegisterCompletedPlaythrough(struct SaveMeta *sec_head, int index)
{
    int i;
    for (i = 0; i < 0xC; i++)
        if (sec_head->playthrough_ids[i] == index)
            return 0;

    for(i = 0; i < 0xC; i++)
        if (0 == sec_head->playthrough_ids[i]) {
            sec_head->playthrough_ids[i] = index;
            return 1;
        }

    return 0;    
}

int GetCurerentGameMode()
{
    return gRAMChapterData.chapterModeIndex;
}

void RegisterCompletedPlaythrough()
{
    struct SaveMeta sec_head;
    int mode, difficult, isTutorial;
    
    mode = GetCurerentGameMode();

    /* Maybe flag definition should be modified? */
    difficult = (gRAMChapterData.chapterStateBits >> 6);
    difficult &= 1;

    isTutorial = gRAMChapterData.cfgController;

    if (0 == LoadGeneralGameMetadata(&sec_head)) {
        InitSaveMetadata();
        LoadGeneralGameMetadata(&sec_head);
    }

    GGM_RegisterCompletedPlaythrough(&sec_head, gRAMChapterData.playthroughIdentifier);
    sec_head.play_through_declared  = 1;

    switch (mode) {
    case CHAPTER_MODE_EIRIKA:
        if (0 == isTutorial)
            sec_head.Eirk_mode_easy = 1;
        else if (0 != difficult)
            sec_head.Eirk_mode_hard = 1;
        else
            sec_head.Eirk_mode_norm = 1;
        break;
    
    case CHAPTER_MODE_EPHRAIM:
        if (0 == isTutorial)
            sec_head.Ephy_mode_easy = 1;
        else if (0 != difficult)
            sec_head.Ephy_mode_hard = 1;
        else
            sec_head.Ephy_mode_norm = 1;
        break;

        
    case CHAPTER_MODE_COMMON:
    default:
        break;
    }

    SaveGeneralGameMetadata(&sec_head);
}

int sub_80A4CB4()
{
    struct SaveMeta sec_head;

    if (LoadGeneralGameMetadata(&sec_head))
        return sec_head.unk0F_0;
    else
        return 0;
}

void sub_80A4CD8()
{
    struct SaveMeta sec_head;

    if (LoadGeneralGameMetadata(&sec_head)) {
        sec_head.unk0F_0 = 1;
        SaveGeneralGameMetadata(&sec_head);
    }
}

struct UnitUsageStats *BWL_GetEntry(u8 char_id)
{
    if (char_id >= BWL_ARRAY_NUM)
        return 0;
    else if (0 == GetCharacterData(char_id)->affinity)
        return 0;
    else
        return &gBWLDataArray[char_id];  
}

u32 GetBonusContentClaimFlags()
{
    return gBonusContentClaimFlags;
}

void SetBonusContentClaimFlags(u32 num)
{
    gBonusContentClaimFlags = num;
}

void SaveBonusContentClaimFlags(void *sram_dest)
{
    WriteAndVerifySramFast((void*)&gBonusContentClaimFlags,
                           sram_dest + 0x0D88,
                           sizeof(gBonusContentClaimFlags));
}

void LoadBonusContentClaimFlags(const void *sram_src)
{
    (*ReadSramFast)(sram_src + 0x0D88,
                    (void*)&gBonusContentClaimFlags,
                    sizeof(gBonusContentClaimFlags));
}

void UpdateLastUsedGameSaveSlot(int num)
{
    struct SaveMeta sec_head;

    LoadGeneralGameMetadata(&sec_head);
    sec_head.slot_sa = num;
    SaveGeneralGameMetadataNoChecksum(&sec_head);
}

int GetLastUsedGameSaveSlot()
{
    int ret;
    struct SaveMeta sec_head;

    if (!LoadGeneralGameMetadata(&sec_head))
        return 0;
    
    ret = sec_head.slot_sa;

    if (ret > 2)
        return 0;
    else if (ret < 0)
        return 0;
    else
        return ret;
}

void sub_80A4DC8(int val)
{
    struct SramChunk chunks[0x5];
    u8 buf[0xC];

    if (sub_80A5DA8(3)) {
        struct SramChunk *cur = &chunks[1];
        sub_80A5DFC(3, cur);

        /* +0C is u32 check-sum, here u8 maybe a bug? */
        if ((u8)cur->cksum32 == val)
            ClearSaveBlock(3);
    }

    chunks[0].type = -1;
    SaveMetadata_Save(chunks, val);
}

void CopyGameSave(int index_src, int index_dest)
{
    struct SramChunk chunk;
    void *src = (void*)GetSaveSourceAddress(index_src);
    void *dest = (void*)GetSaveTargetAddress(index_dest);

    (*ReadSramFast)(src, gGenericBuffer, 0xDC8);
    WriteAndVerifySramFast(gGenericBuffer, dest, 0xDC8);

    chunk.magic1 = 0x40624;
    chunk.type = 0;
    SaveMetadata_Save(&chunk, index_dest);
}

void SaveNewGame(int index, int isDifficult, int mode, int isTutorial)
{
    int i;
    struct SramChunk chunk;
    u8 buf0[0x24];

    void *dest = (void*)GetSaveTargetAddress(index);
    void *tmp_dest;

    if (0 == mode)
        mode = gRAMChapterData.chapterModeIndex;

    if (isTutorial < 0)
        isTutorial = gRAMChapterData.cfgController;

    SetGameClock(0);
    InitPlaythroughState(isDifficult, isTutorial);
    ClearUnits();
    ClearConvoyItems();
    sub_8083D18();
    ClearSaveBlock(3);
    
    gRAMChapterData.unk_2C_1 = 0;
    gRAMChapterData.unk_2C_04 = 0;
    CpuFill16(0, &gRAMChapterData.total_gold, 0x10);
    gRAMChapterData.unk_2C_0D = 0;
    gRAMChapterData.chapterModeIndex = mode;
    gRAMChapterData.unk_2B_00 = 1;
    gRAMChapterData.playerName[0] = '\0';
    gRAMChapterData.chapterIndex = 0;
    gRAMChapterData.playthroughIdentifier = GetNewPlaythroughId();
    gRAMChapterData.gameSaveSlot = index;
    gRAMChapterData.unk_2C_2 = GetGlobalCompletionCount();

    WriteAndVerifySramFast((void*)&gRAMChapterData, dest, sizeof(gRAMChapterData));
    SetBonusContentClaimFlags(0);
    SaveBonusContentClaimFlags(dest);
    
    CpuFill16(0, buf0, 0x24);

    for (i = 0; i < 0x33; i++) {
        WriteAndVerifySramFast(buf0, dest + 0x4C + 0x24 * i, 0x24);
    }
    WriteAndVerifySramFast(buf0, dest + 0x778, 0x24);
    SaveConvoyItems(dest + 0x79C);
    SaveClearedBWLAndChapterWinData(dest);
    SaveGlobalEventIndexes(dest + 0xD6C);
    sub_80A7074(dest + 0xD8C);
    {
        u8 buf1[0x18];   
        CpuFill16(0, buf1, 0x18);
        WriteAndVerifySramFast(buf1, dest + 0xDB0, 0x18);
    
        chunk.magic1 = 0x40624;
        chunk.type = 0;
        SaveMetadata_Save(&chunk, index);
        UpdateLastUsedGameSaveSlot(index);
    }
}

void SaveGame(int slot)
{
    int i;
    struct SramChunk chunk;
    struct SaveMeta sec_head;
    struct Dungeon dungeon[2];

    void *dest = (void*)GetSaveTargetAddress(slot);
    ClearSaveBlock(3);
    gRAMChapterData.gameSaveSlot = slot;
    gRAMChapterData.unk0 = GetGameClock();
    WriteAndVerifySramFast((u8*)&gRAMChapterData, dest, sizeof(gRAMChapterData));

    for (i = 0; i < 0x33; i++)
        SaveUnit(&gUnitArrayBlue[i], dest + 0x4C + 0x24 * i);

    LoadGeneralGameMetadata(&sec_head);
    
    for (i = 0; i < 0x33; i++)
        SGM_SetCharacterKnown(UNIT_CHAR_ID(&gUnitArrayBlue[i]), &sec_head);

    SaveGeneralGameMetadata(&sec_head);
    SaveGMMonsterRnState(dest + 0x778);
    SaveConvoyItems(dest + 0x079C);
    SaveBWLEntries(dest + 0x84C);
    SaveChapterWinData(dest + 0xCAC);
    SaveBonusContentClaimFlags(dest);
    SaveGlobalEventIndexes(dest + 0xD6C);
    SaveWMStuff(dest + 0xD8C, &gGMData);
    sub_8037E4C(dungeon);
    WriteAndVerifySramFast((u8*)dungeon, dest + 0xDB0 ,sizeof(dungeon));

    chunk.magic1 = 0x40624;
    chunk.type = 0;
    SaveMetadata_Save(&chunk, slot);
    UpdateLastUsedGameSaveSlot(slot);
}

void LoadGame(int slot)
{
    int i;
    struct Dungeon dungeon[2];
    void *src = (void*)GetSaveSourceAddress(slot);

    if (0 == (CHAPTER_FLAG_DIFFICULT & gGameState.gameStateBits))
        ClearSaveBlock(3);

    (*ReadSramFast)(src, (void*)&gRAMChapterData, sizeof(gRAMChapterData));
    SetGameClock(gRAMChapterData.unk0);
    gRAMChapterData.gameSaveSlot = slot;

    ClearUnits();

    for (i = 0; i < 0x33; i++)
        LoadSavedUnit(src + 0x4C + 0x24 * i, &gUnitArrayBlue[i]);

    LoadGMMonsterRnState(src + 0x778);
    LoadConvoyItems(src + 0x79C);
    LoadGlobalEventIds(src + 0xD6C);
    LoadBWLEntries(src + 0x84C);
    LoadChapterDataWinArray(src + 0xCAC);
    LoadBonusContentClaimFlags(src);
    LoadWMStuff(src + 0xD8C, &gGMData);
    (*ReadSramFast)(src + 0xDB0, (u8*)dungeon, sizeof(dungeon));
    sub_8037E64(dungeon);
    UpdateLastUsedGameSaveSlot(slot);
}

s8 SaveMetadata_LoadId(int index)
{
    return SaveMetadata_Load(NULL, index);
}

void LoadSavedChapterState(int slot, struct RAMChapterData* buf)
{
    void *src = (void*)GetSaveSourceAddress(slot);
    (*ReadSramFast)(src, (u8*)buf, sizeof(*buf));
}

u32 LoadSavedBonusClaimFlags(int slot)
{
    u32 buf;
    void *src = (void*)GetSaveSourceAddress(slot);
    (*ReadSramFast)(src + 0xD88, (u8*)&buf, sizeof(buf));
    return buf;
}

void LoadSavedWMStuff(int slot, void *dest)
{
    void *src = (void*)GetSaveSourceAddress(slot);
    LoadWMStuff(src + 0xD8C, dest);
}

s8 LoadSavedEid8A(int slot)
{
    void *sram_base = (void*)GetSaveSourceAddress(slot);
    LoadGlobalEventIds_ret(sram_base + 0xD6C, gGenericBuffer);
    return sub_8083D34(0x8A, gGenericBuffer);
}

s8 CheckChapterCompleted(struct RAMChapterData *chapter_data)
{
    if (CHAPTER_FLAG_COMPLETE & chapter_data->chapterStateBits)
        return 1;
    else if (0 != chapter_data->chapterIndex)
        return 1;
    else
        return 0;
}

s8 LoadAndCheckChComplete(int slot)
{
    struct RAMChapterData chapter_data;

    if (!SaveMetadata_LoadId(slot))
        return 0;

    LoadSavedChapterState(slot, &chapter_data);
    return CheckChapterCompleted(&chapter_data);
}

s8 LoadAndCheckChComplete2(int slot)
{
    struct RAMChapterData chapter_data;

    if (!SaveMetadata_LoadId(slot))
        return 0;

    LoadSavedChapterState(slot, &chapter_data);

    return (CHAPTER_FLAG_COMPLETE & chapter_data.chapterStateBits);
}

void SaveUnit(struct Unit *unit, void *sram_dest)
{
    int i;
    struct UnitSavePack unit_pack;


    unit_pack.char_index = UNIT_CHAR_ID(unit);
    unit_pack.class = unit->pClassData->number;

    if (0 == unit->pCharacterData) {
        struct Unit tmp_unit;
        unit = &tmp_unit;
        ClearUnit(&tmp_unit);
        unit_pack.char_index = 0;
        unit_pack.class = 0;
    }

    unit_pack.level = unit->level;
    unit_pack.exp = unit->exp;
    unit_pack.xPos = unit->xPos;
    unit_pack.yPos = unit->yPos;

    unit_pack.max_hp = unit->maxHP;
    unit_pack.pow = unit->pow;
    unit_pack.skl = unit->skl;
    unit_pack.spd = unit->spd;
    unit_pack.def = unit->def;
    unit_pack.res = unit->res;
    unit_pack.lck = unit->lck;
    unit_pack.con_bonus = unit->conBonus;
    unit_pack.mov_bonus = unit->movBonus;

    unit_pack.item1 = unit->items[0];
    unit_pack.item2 = unit->items[1];
    unit_pack.item3 = unit->items[2];
    unit_pack.item4 = unit->items[3];
    unit_pack.item5 = unit->items[4];

    unit_pack.flag = 0;

    if (US_DEAD & unit->state)
        unit_pack.flag |= PACKED_US_DEAD;

    if (US_NOT_DEPLOYED & unit->state) 
        unit_pack.flag |= PACKED_US_UNDEPLOYED;

    if (US_SOLOANIM_1 & unit->state)
        unit_pack.flag |= PACKED_US_SOLO_ANIM1;

    if (US_SOLOANIM_2 & unit->state)
        unit_pack.flag |= PACKED_US_SOLO_ANIM2;

    if (US_GROWTH_BOOST & unit->state)
        unit_pack.flag |= PACKED_US_METIS_TOME;

    if (US_BIT16 & unit->state)
        unit_pack.flag |= PACKED_US_B4;

    if (US_BIT25 & unit->state)
        unit_pack.flag |= PACKED_US_B5;

    if (US_BIT21 & unit->state)
        unit_pack.flag |= PACKED_US_NEW_FRIEND;

    for (i = 0; i < 8; i++)
        unit_pack.wpnRanks[i] = unit->ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit_pack.supports[i] = unit->supports[i];

    WriteAndVerifySramFast((u8*)&unit_pack, sram_dest, sizeof(unit_pack));
}

void LoadSavedUnit(const void *sram_src, struct Unit *unit)
{
    int i;
    struct UnitSavePack unit_pack;

    (*ReadSramFast)(sram_src, (u8*)&unit_pack, sizeof(unit_pack));

    unit->pCharacterData = GetCharacterData(unit_pack.char_index);
    unit->pClassData = GetClassData(unit_pack.class);
    unit->level = unit_pack.level;
    unit->exp = unit_pack.exp;
    unit->xPos = unit_pack.xPos;
    unit->yPos = unit_pack.yPos;

    unit->maxHP = unit_pack.max_hp;
    unit->pow = unit_pack.pow;
    unit->skl = unit_pack.skl;
    unit->spd = unit_pack.spd;
    unit->def = unit_pack.def;
    unit->res = unit_pack.res;
    unit->lck = unit_pack.lck;
    unit->conBonus = unit_pack.con_bonus;
    unit->movBonus = unit_pack.mov_bonus;

    unit->items[0] = unit_pack.item1;
    unit->items[1] = unit_pack.item2;
    unit->items[2] = unit_pack.item3;
    unit->items[3] = unit_pack.item4;
    unit->items[4] = unit_pack.item5;

    if (unit->exp > 99)
        unit->exp = -1;

    unit->state = 0;

    if (PACKED_US_DEAD & unit_pack.flag)
        unit->state  = US_HIDDEN | US_DEAD;

    if (PACKED_US_UNDEPLOYED & unit_pack.flag)
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    if (PACKED_US_SOLO_ANIM1 & unit_pack.flag)
        unit->state |= US_SOLOANIM_1;

    if (PACKED_US_SOLO_ANIM2 & unit_pack.flag)
        unit->state |= US_SOLOANIM_2;

    if (PACKED_US_METIS_TOME & unit_pack.flag)
        unit->state |= US_GROWTH_BOOST;

    if (PACKED_US_B4 & unit_pack.flag)
        unit->state |= US_BIT16;

    if (PACKED_US_B5 & unit_pack.flag)
        unit->state |= US_BIT25;

    if (PACKED_US_NEW_FRIEND & unit_pack.flag)
        unit->state |= US_BIT21;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unit_pack.wpnRanks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unit_pack.supports[i];

    SetUnitHp(unit, GetUnitMaxHp(unit));
    unit->supportBits = 0;

    /* mins zero */
    if (0x7F == unit->exp)
        unit->exp = -1;

    if (0x3F == unit->xPos)
        unit->xPos = -1;

    if (0x3F == unit->yPos)
        unit->yPos = -1;
}

void SaveGMMonsterRnState(void *sram_dest)
{
    u32 buf[2];
    sub_80A71E4(buf);
    WriteAndVerifySramFast((u8*)buf, sram_dest, sizeof(buf));
}

void LoadGMMonsterRnState(const void *sram_src)
{
    u32 buf[2];
    (*ReadSramFast)(sram_src, (u8*)buf, sizeof(buf));
    sub_80A71F8(buf);
}

void ClearSaveBlock(int slot)
{
    struct SramChunk chunk;
    chunk.type = -1;

    SaveMetadata_Save(&chunk, slot);

    if (3 == slot)
        SaveMetadata_Save(&chunk, 4);
}

void SaveSuspendedGame(int slot)
{
    void *dest;
    struct SramChunk chunk;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    int i, val;
    struct UnitSaveSuPack *buf;

    if (CHAPTER_FLAG_3 & gRAMChapterData.chapterStateBits)
        return;

    if (!IsSramWorking())
        return;

    slot += GetNextSuspendSaveId();
    dest = (void*)GetSaveTargetAddress(slot);
    gRAMChapterData.unk0 = GetGameClock();
    WriteAndVerifySramFast((u8*)&gRAMChapterData, dest, sizeof(gRAMChapterData));
    StoreRNStateToActionStruct();
    WriteAndVerifySramFast((u8*)&gActionData, dest + 0x4C, 0x38);

    buf = (void*)gGenericBuffer;
    for (i = 0; i < 51; i++)
        PackUnitStructForSuspend(&gUnitArrayBlue[i], buf++);
    WriteSramFast(gGenericBuffer, dest + 0x84, 0xA5C);

    buf = (void*)gGenericBuffer;
    for (i = 0; i < 50; i++)
        PackUnitStructForSuspend(&gUnitArrayRed[i], buf++);
    for (i = 0; i < 10; i++)
        PackUnitStructForSuspend(&gUnitArrayGreen[i], buf++);
    WriteSramFast(gGenericBuffer, dest + 0xB14, 0xC30);

    SaveGlobalEventIndexes(dest + 0x1F24);
    SaveLocalEventIndexes(dest + 0x1F3D);
    SaveConvoyItems(dest + 0x1944);
    SaveBWLEntries(dest + 0x19F4);
    SaveChapterWinData(dest + 0x1E54);
    SaveTrapStructs(dest + 0x1744);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest + 0x1F14, sizeof(list));

    SaveWMStuff(dest + 0x1F44, &gGMData);

    sub_8037E4C(dungeon);
    WriteAndVerifySramFast((u8*)dungeon, dest + 0xAE0, 2 * sizeof(struct Dungeon));
    sub_8037E08(dungeon);
    WriteAndVerifySramFast((u8*)dungeon, dest + 0x1F68, sizeof(struct Dungeon));

    val = GetEventSlotCounter();
    WriteAndVerifySramFast((u8*)&val, dest + 0x1F74, sizeof(int));

    chunk.magic1 = 0x40624;
    chunk.type = 1;
    SaveMetadata_Save(&chunk, slot);

    gGameState.unk3C = 0;
    ChangeSuspendSaveId();
}

void LoadSuspendedGame(int slot)
{
    int i, val;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    void *src = (void*)GetSaveSourceAddress(slot + gUnknown_0203EDB8);

    (*ReadSramFast)(src, (u8*)&gRAMChapterData, sizeof(gRAMChapterData));
    SetGameClock(gRAMChapterData.unk0);

    (*ReadSramFast)(src + 0x4C, (u8*)&gActionData, 0x38);
    LoadRNStateFromActionStruct();
    ClearUnits();

    for (i = 0; i < 51; i++)
        UnpackUnitStructFromSuspend(src + 0x84 + i * sizeof(struct UnitSaveSuPack),
                                    &gUnitArrayBlue[i]);
    for (i = 0; i < 50; i++)
        UnpackUnitStructFromSuspend(src + 0xB14 + i * sizeof(struct UnitSaveSuPack),
                                    &gUnitArrayRed[i]);
    for (i = 0; i < 10; i++)
        UnpackUnitStructFromSuspend(src + 0x153C + i * sizeof(struct UnitSaveSuPack),
                                    &gUnitArrayGreen[i]);

    LoadBWLEntries(src + 0x19F4);
    LoadChapterDataWinArray(src + 0x1E54);
    LoadConvoyItems(src + 0x1944);
    LoadGlobalEventIds(src + 0x1F24);
    LoadLocalEventIds(src + 0x1F3D);
    LoadTrapStructs(src + 0x1744);

    (*ReadSramFast)(src + 0x1F14, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    LoadWMStuff(src + 0x1F44, &gGMData);

    (*ReadSramFast)(src + 0xAE0, (u8*)dungeon, 2 * sizeof(struct Dungeon));
    sub_8037E64(dungeon);
    (*ReadSramFast)(src + 0x1F68, (u8*)dungeon, sizeof(struct Dungeon));
    sub_8037E30(dungeon);

    (*ReadSramFast)(src + 0x1F74, (u8*)&val, sizeof(int));
    SetEventSlotCounter(val);

    SetBonusContentClaimFlags(LoadSavedBonusClaimFlags(gRAMChapterData.gameSaveSlot));
}

u8 sub_80A5DA8(int slot)
{
    if (!IsSramWorking())
        return 0;

    if (3 != slot)
        return 0;

    gUnknown_0203EDB8 = GetLastSuspendSaveId();
    if (SaveMetadata_Load(0, gUnknown_0203EDB8 + 3))
        return 1;

    gUnknown_0203EDB8 = GetNextSuspendSaveId();
    if (SaveMetadata_Load(0, gUnknown_0203EDB8 + 3))
        return 1;
    
    gUnknown_0203EDB8 = 0x7F;
    return 0;
}

void sub_80A5DFC(int slot, void *buf)
{
    LoadSavedChapterState(slot + gUnknown_0203EDB8, buf);
}

void PackUnitStructForSuspend(struct Unit *unit, void *buf)
{
    u8 ai1_byte;
    int i;
    struct UnitSaveSuPack *unit_su = buf;

    if (0 == unit->pCharacterData) {
        unit_su->char_id = 0;
        return;
    }
    
    unit_su->char_id = UNIT_CHAR_ID(unit);
    unit_su->class = unit->pClassData->number;
    unit_su->level = unit->level;
    unit_su->exp = unit->exp;
    unit_su->state = unit->state;
    unit_su->xPos = unit->xPos;
    unit_su->yPos = unit->yPos;
    unit_su->maxHP = unit->maxHP;
    unit_su->curHP = unit->curHP;
    unit_su->pow = unit->pow;
    unit_su->skl = unit->skl;
    unit_su->spd = unit->spd;
    unit_su->def = unit->def;
    unit_su->res = unit->res;
    unit_su->lck = unit->lck;
    unit_su->conBonus = unit->conBonus;
    unit_su->statusIndex_l = unit->statusIndex;
    unit_su->statusDuration = unit->statusDuration;
    unit_su->torchDuration = unit->torchDuration;
    unit_su->barrierDuration = unit->barrierDuration;
    unit_su->rescueOtherUnit = unit->rescueOtherUnit;
    unit_su->movBonus = unit->movBonus;

    unit_su->ballistaIndex = 
                  (0x7F & unit->ballistaIndex) | (0x01 & unit->supportBits) << 0X07;
    unit_su->item1 = (0x3FFF & unit->items[0]) | (0x06 & unit->supportBits) << 0x0D;
    unit_su->item2 = (0x3FFF & unit->items[1]) | (0x18 & unit->supportBits) << 0x0B;
    unit_su->item3 = (0x3FFF & unit->items[2]) | (0x60 & unit->supportBits) << 0x09;
    unit_su->item4 = unit->items[3];
    unit_su->item5 = unit->items[4];

    for (i = 0; i < 8; i++)
        unit_su->ranks[i] = unit->ranks[i];
    
    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit_su->supports[i] = unit->supports[i];

    unit_su->ai1 =  unit->ai1;

    ai1_byte = unit->ai1 & 0x7F;
    if (unit->statusIndex & 8)
        ai1_byte |= 0x80;

    unit_su->ai1 = ai1_byte;
    unit_su->ai1data = unit->ai1data;
    unit_su->ai2 = unit->ai2;
    unit_su->ai2data = unit->ai2data;
    unit_su->ai3And4 = unit->ai3And4;
    unit_su->_u46 = unit->_u46;
    unit_su->aiFlags = unit->aiFlags; 
}

void UnpackUnitStructFromSuspend(const void *sram_src, struct Unit *unit)
{
    int i;

    struct UnitSaveSuPack unit_su;

    (*ReadSramFast)(sram_src, (u8*)&unit_su, sizeof(unit_su));

    unit->pCharacterData = GetCharacterData(unit_su.char_id);
    unit->pClassData = GetClassData(unit_su.class);
    unit->level = unit_su.level;
    unit->exp = unit_su.exp;
    unit->state = unit_su.state;
    unit->xPos = unit_su.xPos;
    unit->yPos = unit_su.yPos;

    unit->maxHP = unit_su.maxHP;
    unit->curHP = unit_su.curHP;
    unit->pow = unit_su.pow;
    unit->skl = unit_su.skl;
    unit->spd = unit_su.spd;
    unit->def = unit_su.def;
    unit->res = unit_su.res;
    unit->lck = unit_su.lck;
    unit->conBonus = unit_su.conBonus;

    unit->statusIndex = unit_su.statusIndex_l;
    unit->statusIndex |= (unit_su.ai1 & 0x80) ? 8 : 0;
    unit->statusDuration = unit_su.statusDuration;
    unit->torchDuration = unit_su.torchDuration;
    unit->barrierDuration = unit_su.barrierDuration;

    unit->rescueOtherUnit = unit_su.rescueOtherUnit;
    unit->movBonus = unit_su.movBonus;
    unit->ballistaIndex = unit_su.ballistaIndex & 0x7F;

    unit->items[0] = unit_su.item1 & 0x3FFF;
    unit->items[1] = unit_su.item2 & 0x3FFF;
    unit->items[2] = unit_su.item3 & 0x3FFF;
    unit->items[3] = unit_su.item4;
    unit->items[4] = unit_su.item5;

    unit->supportBits = (unit_su.ballistaIndex & 0x80) >> 7 |
                        (unit_su.item1 & 0xC000) >> 0x0D |
                        (unit_su.item2 & 0xC000) >> 0x0B |
                        (unit_su.item3 & 0xC000) >> 0x09;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unit_su.ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unit_su.supports[i];

    unit->ai1 = unit_su.ai1 & 0x7F;
    unit->ai1data = unit_su.ai1data;
    unit->ai2 = unit_su.ai2;
    unit->ai2data = unit_su.ai2data;
    unit->ai3And4 = unit_su.ai3And4;
    unit->_u46 = unit_su._u46;
    unit->aiFlags = unit_su.aiFlags;

    if (0x7F == unit->exp)
        unit->exp = -1;

    if (0x3F == unit->xPos)
        unit->xPos = -1;

    if (0x3F == unit->yPos)
        unit->yPos = -1;
}

void SaveTrapStructs(void *sram_dest)
{
    WriteAndVerifySramFast((u8*)GetTrap(0), sram_dest, TRAP_MAX_COUNT * sizeof(struct Trap));
}

void LoadTrapStructs(void *sram_dest)
{
    (*ReadSramFast)(sram_dest, (u8*)GetTrap(0), TRAP_MAX_COUNT * sizeof(struct Trap));
}

int GetLastSuspendSaveId()
{
    struct SaveMeta header;
    LoadGeneralGameMetadata(&header);

    if (1 == header.slot_su)
        return 1;
    else
        return 0;
}

int GetNextSuspendSaveId()
{
    return 1 - GetLastSuspendSaveId();
}

void ChangeSuspendSaveId()
{
    struct SaveMeta header;   
    LoadGeneralGameMetadata(&header);
    header.slot_su = 0 == header.slot_su;
    SaveGeneralGameMetadataNoChecksum(&header);
}

int ComputeSaveChecksum(void *sram_src, int size)
{
    (*ReadSramFast)(sram_src, gGenericBuffer, size);
    return ComputeChecksum32((const u16*)gGenericBuffer, size);
}

int SaveMetadata_VerifyChecksum(struct SramChunk *buf)
{
    int size = buf->size;
    void *sram_dest = (u8*)SramOffsetToPointer(buf->sram_offset);
    int check_sum = ComputeSaveChecksum(sram_dest, size);

    if (buf->cksum32 != check_sum)
        return 0;
    else
        return 1;
}

void SaveMetadata_ComputeChecksum(struct SramChunk* buf)
{
    int size = buf->size;
    void *sram_dest = (u8*)SramOffsetToPointer(buf->sram_offset);
    buf->cksum32 = ComputeSaveChecksum(sram_dest, size);
}

u16 GenerateSaveDataSum()
{
    int i;
    u16 ret = 0;

    for (i = 0; i < 0x33; i++) {
        if (0 == gUnitArrayBlue[i].pCharacterData)
            continue;

        gUnitArrayBlue[i].pMapSpriteHandle = 0;
        ret += ComputeSaveChecksum(&gUnitArrayBlue[i], 0x24);
    }

    for (i = 0; i < 0x32; i++) {
        if (0 == gUnitArrayRed[i].pCharacterData)
            continue;

        gUnitArrayRed[i].pMapSpriteHandle = 0;
        ret += ComputeSaveChecksum(&gUnitArrayRed[i], 0x24);
    }

    for (i = 0; i < 0x0A; i++) {
        if (0 == gUnitArrayGreen[i].pCharacterData)
            continue;

        gUnitArrayGreen[i].pMapSpriteHandle = 0;
        ret += ComputeSaveChecksum(&gUnitArrayGreen[i], 0x24);
    }

    ret += ComputeSaveChecksum(GetGlobalEventIdStorage(), GetGlobalEventIdStorageSize() / 2);

    ret += ComputeSaveChecksum(GetLocalEventIdStorage(), GetLocalEventIdStorageSize() / 2);

    ret += ComputeSaveChecksum(GetTrap(0), 0x100);

    return ret;
}

void sub_80A6544()
{
    u8 buf[8];
}

s8 sub_80A654C(int index)
{
    return SaveMetadata_Load(NULL, index);
}
