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
void sub_80A3950(void*);
int sub_80A6430(struct SramChunk *buf);
uintptr_t GetSaveDataLocation(int index);
void sub_80A6454(struct SramChunk*);
void *GetLocalEventIdStorage();
int GetLocalEventIdStorageSize();
void *GetGlobalEventIdStorage();
int GetGlobalEventIdStorageSize();
unsigned short *GetConvoyItemArray();
s8 sub_80A52DC(int);
int sub_80A6A68();
int sub_80A3834(struct SecureSaveHeader *buf);
u8 sub_80A3898(void*);
u8 sub_80A6C1C();
u8 sub_80A38F4(void*);
void sub_80A4000(struct bmsave_unkstruct2 *buf);


/* variables */
extern EWRAM_DATA s8 gBoolSramWorking;
extern CONST_DATA struct SramHeader *gpSaveDataStart; /* 0x0E000000 */
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

    /* Appparently it lost one unit lol */
    for (i = 0; i < 0x10; i++)
        buf[i] = -1;

    for (i = 0; i < 0x200; i++)
        WriteAndVerifySramFast((void*)buf, (void*)gpSaveDataStart + i * 0x40, 0x40);
}

u16 SecureHeaderCalc(u16 *src, int size)
{
    int num0 = 0;
    int num1 = 0;
    int i = size / 2;

    if (num0 < i) {
        do{
            num0 += *src;
            num1 ^= *src;
            src++;
        } while(--i != 0);
    }
    return num0 + num1;
}


u8 LoadAndVerifySecureHeaderSW(struct SecureSaveHeader *buf)
{
    struct SecureSaveHeader tmp;
    struct SecureSaveHeader *header = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == buf)
        header = &tmp;

    (*ReadSramFast)((void*)gpSaveDataStart, (void*)header, sizeof(struct SecureSaveHeader));

    if ((0 != CheckSaveHeaderMagic(header, gSaveHeaderKeygen)) &&
        (0x40624 == header->_00040624) &&
        (0x200A == header->_200A) &&
        (header->sec_sum == SecureHeaderCalc((void*)header, 0x50)))
        return 1;

    return 0;
}

void SaveSecureHeader(struct SecureSaveHeader *header)
{
    header->sec_sum = SecureHeaderCalc((void*)header, 0x50);
    WriteAndVerifySramFast((void*)header, (void*)gpSaveDataStart, sizeof(struct SecureSaveHeader));
}

void ForceSaveSecureHeader(struct SecureSaveHeader *header)
{
    WriteAndVerifySramFast((void*)header, (void*)gpSaveDataStart, sizeof(struct SecureSaveHeader));
}

void InitNopSecHeader()
{
    struct SecureSaveHeader header;
    int i;

    EraseSecureHeader();
    CopyString((void*)(&header), (void*)gSaveHeaderKeygen);

    header._00040624 = 0x00040624;
    header._200A = 0x200A;

    header.flag0E_0 = 0;
    header.flag0E_1 = 0;
    header.flag0E_2 = 0;
    header.flag0E_3 = 0;
    header.flag0E_4 = 0;
    header.flag0E_5 = 0;
    header.flag0E_6 = 0;
    header.flag0E_7 = 0;

    header.unk0F_0 = 0;
    header.unk0F_1 = 0;

    header.unk10 = 0;
    header.unk12 = 0;

    header.unk63 = 0;
    header.unk62 = 0;

    for (i = 0; i < 0xC; i++)
        header.unk14[i] = 0;

    for (i = 0; i < 0x20; i++)
        header.unk20[i] = 0;

    for (i = 0; i < 0x20; i++)
        header.charKnownFlags[i] = 0;

    SaveSecureHeader(&header);

    return;
}

void sub_80A2EA8()
{
    u8 *buf = gUnknown_02020188;
    CPU_FILL(0, buf, 0x144, 16);
    sub_80A3950(buf);
}

uintptr_t SramOffsetToPointer(u16 off)
{
    return (uintptr_t)gpSaveDataStart + off;
}

u16 SramPointerToOffset(uintptr_t addr)
{
    return addr - (uintptr_t)gpSaveDataStart;
}

s8 SaveMetadata_Check(struct SramChunk *buf, int index)
{
    struct SramChunk tmp;
    u32 key;

    if (0 == buf)
        buf = &tmp;

    (*ReadSramFast)(
        (void*)(&gpSaveDataStart->chunks[index]),
        (void*)buf,
        sizeof(struct SramChunk));

    if (0x200A != buf->unk04)
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

    if (buf->unk00 != key)
        return 0;

    return sub_80A6430(buf);
}

void SaveMetadata_Generate(struct SramChunk *buf, int index) {

    buf->unk04 = 0x200A;
    buf->sram_offset = (uintptr_t)GetSaveDataLocation(index);

    if (!(index < SAVE_CHUNK_MAX))
        return;

    switch (buf->unk06) {
    case SAVE_CHUNK_0:
        buf->unk0A = 0x0DC8;
        break;

    case SAVE_CHUNK_1:
        buf->unk0A = 0x1F78;
        break;

    case SAVE_CHUNK_2:
        buf->unk0A = 0x0874;
        break;

    case SAVE_CHUNK_3:
        buf->unk0A = 0xC00;
        break;

    case 0xFF:
        buf->unk0A = 0;
        buf->sram_offset = 0;
        buf->unk04 = 0;
        break;

    default:
        return;
    }

    sub_80A6454(buf);
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

uintptr_t GetSaveDataLocation(int index)
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

uintptr_t CheckSaveAndGetPointer(int index)
{
    struct SramChunk chunk;
    SaveMetadata_Check(&chunk, index);
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
        if (sub_80A52DC(i))
            return 1;

    return sub_80A6A68();
}

int sub_80A3328()
{
    return 1;
}

signed char sub_80A332C()
{
    int tmp0 = sub_80A3834(NULL);
    int tmp1 = sub_80A3870();
    return tmp1 & tmp0;
}

unsigned int sub_80A3348(void) {
    unsigned char buf[0x94];
    int r4 = 0;
    unsigned char tmp0 = sub_80A3870();

    if (!tmp0)
        return 0;

    if (sub_80A3898(buf)) {
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
    struct SecureSaveHeader buf;

    if (!LoadAndVerifySecureHeaderSW(&buf))
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
        if (sub_80A530C(i))
            return 1;

    return 0;
}

int sub_80A341C(void) {
    unsigned char buf0[0x4C];
    struct bmsave_unkstruct0 *buf1;
    int i, ret;

    if (sub_80A38F4((void*)gUnknown_02020188)) {

        ret = 0;
        buf1 = (void*)gUnknown_02020188;
    
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

int sub_80A3500(struct SecureSaveHeader *buf)
{
    int i, j, tmp1, tmp2, ret = 0;
    unsigned char *unk20;
    struct SecureSaveHeader tmp_header;

    if (0 == buf) {
        buf = &tmp_header;
        LoadAndVerifySecureHeaderSW(buf);
    }


    for (i = 0; i < 0x20; i++) {
        for (j = 0; j < 4; j++) {
            tmp1 = 1 + i;
            tmp2 = buf->unk20[tmp1 - 1];
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

int sub_80A3584(int param0, int param1, struct SecureSaveHeader *buf)
{
    struct SecureSaveHeader tmp_header;
    int i = 0;
    int ret = 0;
    int tmp0, tmp1, tmp2, tmp3;
    unsigned char *unk20;
    struct SupportTalkEnt *cur = sub_80847F8();

    if (buf == NULL) {
        buf = &tmp_header;
        LoadAndVerifySecureHeaderSW(buf);
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
    ret = 3 & buf->unk20[tmp0] >> tmp1;
    return ret;
}

void sub_80A35EC(int unitId, u8* data, struct SecureSaveHeader* buf) {
    struct SecureSaveHeader tempHeader;
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
        LoadAndVerifySecureHeaderSW(buf);
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

            data[i] = (buf->unk20[tmp1] >> (tmp2)) & 3;

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
    struct SecureSaveHeader tempHeader;
    struct SupportTalkEnt* ptr;

    supportRank = supportRank & 3;

    if (!LoadAndVerifySecureHeaderSW(&tempHeader)) {
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

    if (((tempHeader.unk20[var0] >> var1) & 3) >= (supportRank)) {
        return 0;
    }

    tempHeader.unk20[var0] &= ~(3 << var1);
    tempHeader.unk20[var0] += (supportRank << var1);

    SaveSecureHeader(&tempHeader);

    return 1;
}

void SetSavedCharacterKnownFlag(s32 charId, struct SecureSaveHeader* buf)
{
  s32 boolLoadedSecureHeader = 0;
  struct SecureSaveHeader tmp_header;
  
  if (charId > 256) {
    return;
  }
  if (buf == NULL) {
    buf = &tmp_header;
    LoadAndVerifySecureHeaderSW(buf);
    boolLoadedSecureHeader = 1;
  }
  
  buf->charKnownFlags[charId >> 3] |= 1 << (charId & 7);
  
  if (boolLoadedSecureHeader) {
    SaveSecureHeader(buf);
  }
}

int sub_80A37F0(int index, struct SecureSaveHeader *buf)
{
    struct SecureSaveHeader tmp_header;
    u32 _index = index;

    if (index > 0x100)
        return 0;

    if (0 == buf) {
        buf = &tmp_header;
        LoadAndVerifySecureHeaderSW(&tmp_header);
    }

    if (1 & buf->charKnownFlags[index >> 3] >> (_index % 8))
        return 1;
    else
        return 0;
}

int sub_80A3834(struct SecureSaveHeader *buf)
{
    int i;
    struct SecureSaveHeader tmp_header;

    if (NULL == buf) {
        buf = &tmp_header;
        LoadAndVerifySecureHeaderSW(&tmp_header);
    }

    for (i = 0; i < 0x20; i++) {
        if (0 != buf->charKnownFlags[i])
            return 1;
    }
    return 0;
}

void sub_80A3868() {}

void __malloc_unlock_3() {}

int sub_80A3870(void)
{
    struct SecureSaveHeader tmp_header;

    if (!LoadAndVerifySecureHeaderSW(&tmp_header))
        return 0;

    if (0 == tmp_header.flag0E_0)
        return 0;
    else
        return 1;
}

u8 sub_80A3898(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == _buf)
        _buf = (void*)gUnknown_02020188;

    (*ReadSramFast)(
        (void*)gpSaveDataStart + 0x7190,
        (void*)_buf,
        sizeof(struct GameRankSaveDataPacks)
    );

    if (_buf->magic0 != SecureHeaderCalc((void*)_buf, 0x90))
        return 0;
    else
        return 1;
}

u8 sub_80A38F4(void *buf)
{
    u16 *_buf = buf;
    
    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = (void*)gUnknown_02020188;

    (*ReadSramFast)(
        (void*)gpSaveDataStart + 0x725C,
        (void*)_buf,
        0x144
    );

    if (_buf[0x140 / 2] != SecureHeaderCalc(_buf, 0x140))
        return 0;
    else
        return 1;
}

void sub_80A3950(void *buf)
{
    u16 *_buf = buf;

    _buf[0x140/2] = SecureHeaderCalc(buf, 0x140);

    WriteAndVerifySramFast(
        buf,
        (void*)gpSaveDataStart + 0x725C,
        0x144
    );
}

void sub_80A3984(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    _buf->magic0 = SecureHeaderCalc(buf, 0x90);

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
    sub_80A3984(_buf);
}

int sub_80A39D8()
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

    if (0 != sub_80A3898(&_buf)) {
        src = &_buf.pack[(chapter_mode + difficulty * 3)];
        *dest = *src;
        return 1;
    }
    
    return 0;
}

void sub_80A3A48(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src = buf;

    if (0 != sub_80A3898(&_buf)) {
        _buf.pack[chapter_mode + difficulty * 3] = *src;
        sub_80A3984(&_buf);
    }
}

u8 sub_80A3A88(struct GameRankSaveData *old, struct GameRankSaveData *new)
{
    int newtime, oldtime;
    
    if (0 == old->unk00_00)
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

void sub_80A3B48(struct GameRankSaveData *buf, int chapter_mode, int difficulty)
{
    int i, j;
    int best = 0;
    u16 hours, minutes, seconds;

    CpuFill16(0, buf, sizeof(struct GameRankSaveData));

    buf->unk00_00 = 1;
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

        if (sub_80A49FC(unit->pCharacterData->number) <= best)
            continue;

        best = sub_80A49FC(unit->pCharacterData->number);
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

void SaveChapterRankings()
{
    struct GameRankSaveData old, new;

    int chapter_mode = sub_80A39D8();
    int diffcult = 1 & gRAMChapterData.chapterStateBits >> 6;

    sub_80A3B48(&new, chapter_mode, diffcult);
    sub_80A39E4(&old, chapter_mode, diffcult);

    if (0 != sub_80A3A88(&old, &new))
        sub_80A3A48(&new, chapter_mode, diffcult);
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

    if (_buf->magic1 != SecureHeaderCalc((u16*)_buf, sizeof(struct bmsave_unkstruct1) - 4))
        return 0;
    else
        return 1;
}

void sub_80A3EA4(void *buf)
{
    struct bmsave_unkstruct1 *_buf = buf;

    _buf->magic1 = SecureHeaderCalc(buf, sizeof(struct bmsave_unkstruct1) - 4);

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

    if (_buf->magic1 != SecureHeaderCalc((u16*)_buf, sizeof(struct bmsave_unkstruct2) - 4))
        return 0;
    else
        return 1;
}

void sub_80A4000(struct bmsave_unkstruct2 *buf)
{
    buf->magic1 = SecureHeaderCalc((u16*)buf, sizeof(struct bmsave_unkstruct2) - 4);

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
    if (!LoadAndVerifySecureHeaderSW(NULL))
        InitNopSecHeader();

    if (!sub_80A38F4(NULL))
        sub_80A2EA8();
    
    if (!sub_80A3898(NULL))
        sub_80A39B4();
    
    if (!sub_80A3E4C(NULL))
        sub_80A3E28();
    
    if (!sub_80A3FA8(NULL))
        sub_80A3F84();
    
    sub_80A6AA0();
}

void sub_80A4104(void *sram_dest)
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

void LoadSomeTable(const void *sram_src)
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

void sub_80A4594(u8 char_id)
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
    
        val = sub_80A63B0() + 3;
    
        WriteAndVerifySramFast((void*)bwl,
            (void*)GetSaveDataLocation(val) + 0x19E4 + char_id * 0x10,
            1);
    
        SaveMetadata_Check(&buf, val);
        SaveMetadata_Generate(&buf, val);
    
        WriteAndVerifySramFast((void*)bwl,
                (void*)GetSaveDataLocation(gRAMChapterData.gameSaveSlot) + 0x083C + char_id * 0x10,
                3);
    
        SaveMetadata_Check(&buf, gRAMChapterData.gameSaveSlot);
        SaveMetadata_Generate(&buf, gRAMChapterData.gameSaveSlot);
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
        bwl->deathLoc = gUnknown_03005280.unk10[0].location;
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

void StoreSomeUnitSetFlags(u8 char_id)
{
    BWL_AddFavoritismValue(char_id, -0x08);
}

void sub_80A48F0(u8 char_id)
{
    BWL_AddFavoritismValue(char_id, -0x100);
}

int sub_80A4904()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].battleAmt;

    return ret;
}

int sub_80A4928()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].winAmt;

    return ret;
}

int sub_80A4958()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].lossAmt;

    return ret;
}

int sub_80A4978()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].expGained / 100;

    return ret;
}

int sub_80A49A4()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].expGained;

    return ret;
}

int sub_80A49C8(u8 char_id)
{
    struct UnitUsageStats *bwl = BWL_GetEntry_Inline(char_id);
    if (0 == bwl)
        return 0;
    else
        return bwl->expGained;
}

int sub_80A49FC(u8 char_id)
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

void sub_80A4AA4()
{
    struct BattleUnit *buA = 0, *buB = 0;

    if (0 == GetUnitCurrentHp(&gBattleActor.unit)) {
        buA = &gBattleActor;
        buB = &gBattleTarget;
    }

    if (0 == GetUnitCurrentHp(&gBattleTarget.unit)) {
        buA = &gBattleTarget;
        buB = &gBattleActor;
    }

    if (0 != buA) {
        if (0 != buB && FACTION_BLUE == UNIT_FACTION(&buB->unit)) {
            BWL_IncrementWinCount(UNIT_CHAR_ID(&buB->unit));
            gRAMChapterData.unk48++;
        }

        if (0 != buA && FACTION_BLUE == UNIT_FACTION(&buA->unit))
            sub_80A4594(UNIT_CHAR_ID(&buA->unit));
    }
}

u8 sub_80A4B1C(int index)
{
    int i;
    struct SecureSaveHeader sec_head;
    struct RAMChapterData ram_ch;

    LoadAndVerifySecureHeaderSW(&sec_head);

    for (i = 0; i < 0xC; i++)
        if (sec_head.unk14[i] == index)
            return 0;

    for (i = 0; i < 3; i++) {
        if (!sub_80A5218(i))
            continue;

        sub_80A522C(i, &ram_ch);

        if (ram_ch.playthroughIdentifier == index)
            return 0;
    }
    
    return 1;
}

int sub_80A4B6C()
{
    int i;
    for (i = 1; i < 0x100; i++)
        if (sub_80A4B1C(i))
            return i;
}

int sub_80A4B90(struct SecureSaveHeader *sec_head)
{
    int i, ret = 0;

    for (i = 0; i < 0xC; i++)
        if (0 != sec_head->unk14[i])
            ret++;

    return ret;
}

int sub_80A4BB0()
{
    struct SecureSaveHeader sec_head;

    if (!LoadAndVerifySecureHeaderSW(&sec_head))
        return 0;
    else
        return sub_80A4B90(&sec_head);
}

int sub_80A4BD0(struct SecureSaveHeader *sec_head, int index)
{
    int i;
    for (i = 0; i < 0xC; i++)
        if (sec_head->unk14[i] == index)
            return 0;

    for(i = 0; i < 0xC; i++)
        if (0 == sec_head->unk14[i]) {
            sec_head->unk14[i] = index;
            return 1;
        }

    return 0;    
}

int GetchapterModeIndex()
{
    return gRAMChapterData.chapterModeIndex;
}

void DeclareCompletedPlaythrough()
{
    struct SecureSaveHeader sec_head;
    int mode, diffcult, is_toturial;
    
    mode = GetchapterModeIndex();

    /* Maybe flag definition should be modified? */
    diffcult = (gRAMChapterData.chapterStateBits >> 6);
    diffcult &= 1;

    is_toturial = gRAMChapterData.unk42_6;

    if (0 == LoadAndVerifySecureHeaderSW(&sec_head)) {
        InitNopSecHeader();
        LoadAndVerifySecureHeaderSW(&sec_head);
    }

    sub_80A4BD0(&sec_head, gRAMChapterData.playthroughIdentifier);
    sec_head.flag0E_0 = 1;

    switch (mode) {
    case CHAPTER_MODE_EIRIKA:
        if (0 == is_toturial)
            sec_head.flag0E_2 = 1;
        else if (0 != diffcult)
            sec_head.flag0E_4 = 1;
        else
            sec_head.flag0E_3 = 1;
        break;
    
    case CHAPTER_MODE_EPHRAIM:
        if (0 == is_toturial)
            sec_head.flag0E_5 = 1;
        else if (0 != diffcult)
            sec_head.flag0E_7 = 1;
        else
            sec_head.flag0E_6 = 1;
        break;

        
    case CHAPTER_MODE_COMMON:
    default:
        break;
    }

    SaveSecureHeader(&sec_head);
}

int sub_80A4CB4()
{
    struct SecureSaveHeader sec_head;

    if (LoadAndVerifySecureHeaderSW(&sec_head))
        return sec_head.unk0F_0;
    else
        return 0;
}

void sub_80A4CD8()
{
    struct SecureSaveHeader sec_head;

    if (LoadAndVerifySecureHeaderSW(&sec_head)) {
        sec_head.unk0F_0 = 1;
        SaveSecureHeader(&sec_head);
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

u32 sub_80A4D28()
{
    return gUnknown_0203EDB4;
}

void Set0203EDB4(u32 num)
{
    gUnknown_0203EDB4 = num;
}

void Save0203EDB4(void *sram_dest)
{
    WriteAndVerifySramFast((void*)&gUnknown_0203EDB4,
                           sram_dest + 0x0D88,
                           sizeof(gUnknown_0203EDB4));
}

void Load0203EDB4(const void *sram_src)
{
    (*ReadSramFast)(sram_src + 0x0D88,
                    (void*)&gUnknown_0203EDB4,
                    sizeof(gUnknown_0203EDB4));
}

void sub_80A4D80(int num)
{
    struct SecureSaveHeader sec_head;

    LoadAndVerifySecureHeaderSW(&sec_head);
    sec_head.unk62 = num;
    ForceSaveSecureHeader(&sec_head);
}

int sub_80A4DA0()
{
    int ret;
    struct SecureSaveHeader sec_head;

    if (!LoadAndVerifySecureHeaderSW(&sec_head))
        return 0;
    
    ret = sec_head.unk62;

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
        if ((u8)cur->unk0C == val)
            sub_80A5A20(3);
    }

    chunks[0].unk06 = -1;
    SaveMetadata_Generate(chunks, val);
}

void sub_80A4E08(int index_src, int index_dest)
{
    struct SramChunk chunk;
    void *src = (void*)CheckSaveAndGetPointer(index_src);
    void *dest = (void*)GetSaveDataLocation(index_dest);

    (*ReadSramFast)(src, gUnknown_02020188, 0xDC8);
    WriteAndVerifySramFast(gUnknown_02020188, dest, 0xDC8);

    chunk.unk00 = 0x40624;
    chunk.unk06 = 0;
    SaveMetadata_Generate(&chunk, index_dest);
}

void sub_80A4E70(int index, int isDifficult, int mode, int isToturial)
{
    int i;
    struct SramChunk chunk;
    u8 buf0[0x24];

    void *dest = (void*)GetSaveDataLocation(index);
    void *tmp_dest;

    if (0 == mode)
        mode = gRAMChapterData.chapterModeIndex;

    if (isToturial < 0)
        isToturial = gRAMChapterData.unk42_6;

    SetGameClock(0);
    InitPlaythroughState(isDifficult, isToturial);
    ClearUnits();
    ClearConvoyItems();
    sub_8083D18();
    sub_80A5A20(3);
    
    gRAMChapterData.unk_2C_1 = 0;
    gRAMChapterData.unk_2C_04 = 0;
    CpuFill16(0, &gRAMChapterData.total_gold, 0x10);
    gRAMChapterData.unk_2C_0D = 0;
    gRAMChapterData.chapterModeIndex = mode;
    gRAMChapterData.unk_2B_00 = 1;
    gRAMChapterData.playerName[0] = '\0';
    gRAMChapterData.chapterIndex = 0;
    gRAMChapterData.playthroughIdentifier = sub_80A4B6C();
    gRAMChapterData.gameSaveSlot = index;
    gRAMChapterData.unk_2C_2 = sub_80A4BB0();

    WriteAndVerifySramFast((void*)&gRAMChapterData, dest, sizeof(gRAMChapterData));
    Set0203EDB4(0);
    Save0203EDB4(dest);
    
    CpuFill16(0, buf0, 0x24);

    for (i = 0; i < 0x33; i++) {
        WriteAndVerifySramFast(buf0, dest + 0x4C + 0x24 * i, 0x24);
    }
    WriteAndVerifySramFast(buf0, dest + 0x778, 0x24);
    SaveConvoyItems(dest + 0x79C);
    sub_80A4104(dest);
    SaveGlobalEventIndexes(dest + 0xD6C);
    sub_80A7074(dest + 0xD8C);
    {
        u8 buf1[0x18];   
        CpuFill16(0, buf1, 0x18);
        WriteAndVerifySramFast(buf1, dest + 0xDB0, 0x18);
    
        chunk.unk00 = 0x40624;
        chunk.unk06 = 0;
        SaveMetadata_Generate(&chunk, index);
        sub_80A4D80(index);
    }
}

void SaveGame(int slot)
{
    int i;
    struct SramChunk chunk;
    struct SecureSaveHeader sec_head;
    struct Dungeon dungeon[2];

    void *dest = (void*)GetSaveDataLocation(slot);
    sub_80A5A20(3);
    gRAMChapterData.gameSaveSlot = slot;
    gRAMChapterData.unk0 = GetGameClock();
    WriteAndVerifySramFast((u8*)&gRAMChapterData, dest, sizeof(gRAMChapterData));

    for (i = 0; i < 0x33; i++)
        SaveUnit(&gUnitArrayBlue[i], dest + 0x4C + 0x24 * i);

    LoadAndVerifySecureHeaderSW(&sec_head);
    
    for (i = 0; i < 0x33; i++)
        SetSavedCharacterKnownFlag(UNIT_CHAR_ID(&gUnitArrayBlue[i]), &sec_head);

    SaveSecureHeader(&sec_head);
    SaveRNGState_Maybe(dest + 0x778);
    SaveConvoyItems(dest + 0x079C);
    SaveBWLEntries(dest + 0x84C);
    SaveChapterWinData(dest + 0xCAC);
    Save0203EDB4(dest);
    SaveGlobalEventIndexes(dest + 0xD6C);
    sub_80A70B0(dest + 0xD8C, &gUnknown_03005280);
    sub_8037E4C(dungeon);
    WriteAndVerifySramFast((u8*)dungeon, dest + 0xDB0 ,sizeof(dungeon));

    chunk.unk00 = 0x40624;
    chunk.unk06 = 0;
    SaveMetadata_Generate(&chunk, slot);
    sub_80A4D80(slot);
}

void LoadGame(int slot)
{
    int i;
    struct Dungeon dungeon[2];
    void *src = (void*)CheckSaveAndGetPointer(slot);

    if (0 == (CHAPTER_FLAG_DIFFICULT & gGameState.gameStateBits))
        sub_80A5A20(3);

    (*ReadSramFast)(src, (void*)&gRAMChapterData, sizeof(gRAMChapterData));
    SetGameClock(gRAMChapterData.unk0);
    gRAMChapterData.gameSaveSlot = slot;

    ClearUnits();

    for (i = 0; i < 0x33; i++)
        LoadSavedUnit(src + 0x4C + 0x24 * i, &gUnitArrayBlue[i]);

    sub_80A5A00(src + 0x778);
    LoadConvoyItems(src + 0x79C);
    LoadGlobalEventIds(src + 0xD6C);
    LoadBWLEntries(src + 0x84C);
    LoadSomeTable(src + 0xCAC);
    Load0203EDB4(src);
    sub_80A7138(src + 0xD8C, &gUnknown_03005280);
    (*ReadSramFast)(src + 0xDB0, (u8*)dungeon, sizeof(dungeon));
    sub_8037E64(dungeon);
    sub_80A4D80(slot);
}

s8 sub_80A5218(int index)
{
    return SaveMetadata_Check(NULL, index);
}

void sub_80A522C(int slot, struct RAMChapterData* buf)
{
    void *src = (void*)CheckSaveAndGetPointer(slot);
    (*ReadSramFast)(src, (u8*)buf, sizeof(*buf));
}

u32 sub_80A524C(int slot)
{
    u32 buf;
    void *src = (void*)CheckSaveAndGetPointer(slot);
    (*ReadSramFast)(src + 0xD88, (u8*)&buf, sizeof(buf));
    return buf;
}

void sub_80A5274(int slot, void *dest)
{
    void *src = (void*)CheckSaveAndGetPointer(slot);
    sub_80A7138(src + 0xD8C, dest);
}

s8 sub_80A5290(int slot)
{
    void *sram_base = (void*)CheckSaveAndGetPointer(slot);
    LoadGlobalEventIds_ret(sram_base + 0xD6C, gUnknown_02020188);
    return sub_8083D34(0x8A, gUnknown_02020188);
}

s8 sub_80A52BC(struct RAMChapterData *chapter_data)
{
    if (CHAPTER_FLAG_5 & chapter_data->chapterStateBits)
        return 1;
    else if (0 != chapter_data->chapterIndex)
        return 1;
    else
        return 0;
}

s8 sub_80A52DC(int slot)
{
    struct RAMChapterData chapter_data;

    if (!sub_80A5218(slot))
        return 0;

    sub_80A522C(slot, &chapter_data);
    return sub_80A52BC(&chapter_data);
}

s8 sub_80A530C(int slot)
{
    struct RAMChapterData chapter_data;

    if (!sub_80A5218(slot))
        return 0;

    sub_80A522C(slot, &chapter_data);

    return (CHAPTER_FLAG_5 & chapter_data.chapterStateBits);
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

void SaveRNGState_Maybe(void *sram_dest)
{
    u32 buf[2];
    sub_80A71E4(buf);
    WriteAndVerifySramFast((u8*)buf, sram_dest, sizeof(buf));
}

void sub_80A5A00(const void *sram_src)
{
    u32 buf[2];
    (*ReadSramFast)(sram_src, (u8*)buf, sizeof(buf));
    sub_80A71F8(buf);
}

void sub_80A5A20(int slot)
{
    struct SramChunk chunk;
    chunk.unk06 = -1;

    SaveMetadata_Generate(&chunk, slot);

    if (3 == slot)
        SaveMetadata_Generate(&chunk, 4);
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

    slot += sub_80A63D0();
    dest = (void*)GetSaveDataLocation(slot);
    gRAMChapterData.unk0 = GetGameClock();
    WriteAndVerifySramFast((u8*)&gRAMChapterData, dest, sizeof(gRAMChapterData));
    StoreRNStateToActionStruct();
    WriteAndVerifySramFast((u8*)&gActionData, dest + 0x4C, 0x38);

    buf = (void*)gUnknown_02020188;
    for (i = 0; i < 51; i++)
        PackUnitStructForSuspend(&gUnitArrayBlue[i], buf++);
    WriteSramFast(gUnknown_02020188, dest + 0x84, 0xA5C);

    buf = (void*)gUnknown_02020188;
    for (i = 0; i < 50; i++)
        PackUnitStructForSuspend(&gUnitArrayRed[i], buf++);
    for (i = 0; i < 10; i++)
        PackUnitStructForSuspend(&gUnitArrayGreen[i], buf++);
    WriteSramFast(gUnknown_02020188, dest + 0xB14, 0xC30);

    SaveGlobalEventIndexes(dest + 0x1F24);
    SaveLocalEventIndexes(dest + 0x1F3D);
    SaveConvoyItems(dest + 0x1944);
    SaveBWLEntries(dest + 0x19F4);
    SaveChapterWinData(dest + 0x1E54);
    SaveTrapStructs(dest + 0x1744);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest + 0x1F14, sizeof(list));

    sub_80A70B0(dest + 0x1F44, &gUnknown_03005280);

    sub_8037E4C(dungeon);
    WriteAndVerifySramFast((u8*)dungeon, dest + 0xAE0, 2 * sizeof(struct Dungeon));
    sub_8037E08(dungeon);
    WriteAndVerifySramFast((u8*)dungeon, dest + 0x1F68, sizeof(struct Dungeon));

    val = GetEventSlotCounter();
    WriteAndVerifySramFast((u8*)&val, dest + 0x1F74, sizeof(int));

    chunk.unk00 = 0x40624;
    chunk.unk06 = 1;
    SaveMetadata_Generate(&chunk, slot);

    gGameState.unk3C = 0;
    sub_80A63E0();
}

void LoadSuspendedGame(int slot)
{
    int i, val;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    void *src = (void*)CheckSaveAndGetPointer(slot + gUnknown_0203EDB8);

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
    LoadSomeTable(src + 0x1E54);
    LoadConvoyItems(src + 0x1944);
    LoadGlobalEventIds(src + 0x1F24);
    LoadLocalEventIds(src + 0x1F3D);
    sub_80A638C(src + 0x1744);

    (*ReadSramFast)(src + 0x1F14, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    sub_80A7138(src + 0x1F44, &gUnknown_03005280);

    (*ReadSramFast)(src + 0xAE0, (u8*)dungeon, 2 * sizeof(struct Dungeon));
    sub_8037E64(dungeon);
    (*ReadSramFast)(src + 0x1F68, (u8*)dungeon, sizeof(struct Dungeon));
    sub_8037E30(dungeon);

    (*ReadSramFast)(src + 0x1F74, (u8*)&val, sizeof(int));
    SetEventSlotCounter(val);

    Set0203EDB4(sub_80A524C(gRAMChapterData.gameSaveSlot));
}

u8 sub_80A5DA8(int slot)
{
    if (!IsSramWorking())
        return 0;

    if (3 != slot)
        return 0;

    gUnknown_0203EDB8 = sub_80A63B0();
    if (SaveMetadata_Check(0, gUnknown_0203EDB8 + 3))
        return 1;

    gUnknown_0203EDB8 = sub_80A63D0();
    if (SaveMetadata_Check(0, gUnknown_0203EDB8 + 3))
        return 1;
    
    gUnknown_0203EDB8 = 0x7F;
    return 0;
}

void sub_80A5DFC(int slot, void *buf)
{
    sub_80A522C(slot + gUnknown_0203EDB8, buf);
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

#if NONMATCHING
    unit_su->item5 = unit->items[4];
#else
    asm("\n\
        .syntax unified\n\
        ldrh r1, [r7, #0x26]\n\
    	lsls r1, r1, #2\n\
    	mov r0, ip\n\
    	ldrh r2, [r0, #0x2e]\n\
    	movs r0, #3\n\
    	ands r0, r2\n\
    	orrs r0, r1\n\
    	mov r1, ip\n\
    	strh r0, [r1, #0x2e]\n\
        .syntax divided\n\
    ");
#endif /* NONMATCHING */

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

void sub_80A638C(void *sram_dest)
{
    (*ReadSramFast)(sram_dest, (u8*)GetTrap(0), TRAP_MAX_COUNT * sizeof(struct Trap));
}

int sub_80A63B0()
{
    struct SecureSaveHeader header;
    LoadAndVerifySecureHeaderSW(&header);

    if (1 == header.unk63)
        return 1;
    else
        return 0;
}

int sub_80A63D0()
{
    return 1 - sub_80A63B0();
}

void sub_80A63E0()
{
    struct SecureSaveHeader header;   
    LoadAndVerifySecureHeaderSW(&header);
    header.unk63 = 0 == header.unk63;
    ForceSaveSecureHeader(&header);
}

int sub_80A6408(void *sram_src, int size)
{
    (*ReadSramFast)(sram_src, gUnknown_02020188, size);
    return CalcSomeChecksum(gUnknown_02020188, size);
}

int sub_80A6430(struct SramChunk *buf)
{
    int size = buf->unk0A;
    void *sram_dest = (u8*)SramOffsetToPointer(buf->sram_offset);
    int check_sum = sub_80A6408(sram_dest, size);

    if (buf->unk0C != check_sum)
        return 0;
    else
        return 1;
}

void sub_80A6454(struct SramChunk* buf)
{
    int size = buf->unk0A;
    void *sram_dest = (u8*)SramOffsetToPointer(buf->sram_offset);
    buf->unk0C = sub_80A6408(sram_dest, size);
}

u16 sub_80A6470()
{
    int i;
    u16 ret = 0;

    for (i = 0; i < 0x33; i++) {
        if (0 == gUnitArrayBlue[i].pCharacterData)
            continue;

        gUnitArrayBlue[i].pMapSpriteHandle = 0;
        ret += sub_80A6408(&gUnitArrayBlue[i], 0x24);
    }

    for (i = 0; i < 0x32; i++) {
        if (0 == gUnitArrayRed[i].pCharacterData)
            continue;

        gUnitArrayRed[i].pMapSpriteHandle = 0;
        ret += sub_80A6408(&gUnitArrayRed[i], 0x24);
    }

    for (i = 0; i < 0x0A; i++) {
        if (0 == gUnitArrayGreen[i].pCharacterData)
            continue;

        gUnitArrayGreen[i].pMapSpriteHandle = 0;
        ret += sub_80A6408(&gUnitArrayGreen[i], 0x24);
    }

    ret += sub_80A6408(GetGlobalEventIdStorage(), GetGlobalEventIdStorageSize() / 2);

    ret += sub_80A6408(GetLocalEventIdStorage(), GetLocalEventIdStorageSize() / 2);

    ret += sub_80A6408(GetTrap(0), 0x100);

    return ret;
}

void sub_80A6544()
{
    u8 buf[8];
}

s8 sub_80A654C(int index)
{
    return SaveMetadata_Check(NULL, index);
}
