#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "functions.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmio.h"

#include "bwl.h"
#include "bmsave.h"

/* functions */
u8 CheckSaveHeaderMagic(void*, u8*);
void sub_80A3950(void*);
char VerifySaveChunk(void *buf);
uintptr_t GetSaveDataLocation(int index);
void SetSaveChunkCheckSum(struct SramChunk*);
void *GetLocalEventIdStorage();
int GetLocalEventIdStorageSize();
void *GetGlobalEventIdStorage();
int GetGlobalEventIdStorageSize();
unsigned short *GetConvoyItemArray();
s8 sub_80A52DC(int);
int sub_80A6A68();
int sub_80A3834(struct SecureSaveHeader *buf);
u8 ReadAndVerifyGameRankSaveDataAll(void*);
u8 sub_80A6C1C();
u8 sub_80A530C(int);
u8 sub_80A38F4(void*);


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

u16 CalcSaveDataMagic(void *src, int size)
{
    u16 *_src = src;
    int num0 = 0;
    int num1 = 0;
    int i = size / 2;

    if (num0 < i) {
        do{
            num0 += *_src;
            num1 ^= *_src;
            _src++;
        } while(--i != 0);
    }
    return num0 + num1;
}


u8 LoadAndVerifySecureHeaderSW(void *buf)
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
        (header->sec_sum == CalcSaveDataMagic((void*)header, 0x50)))
        return 1;

    return 0;
}

void SaveSecureHeader(struct SecureSaveHeader *header)
{
    header->sec_sum = CalcSaveDataMagic((void*)header, 0x50);
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
        header.unk40[i] = 0;

    SaveSecureHeader(&header);

    return;
}

void sub_80A2EA8()
{
    u8 *buf = gGenericBuffer;
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

    return VerifySaveChunk(buf);
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

    SetSaveChunkCheckSum(buf);
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

    if (ReadAndVerifyGameRankSaveDataAll(buf)) {
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
    struct bmsave_unkstruct0_ *buf;
    int i, ret;

    if (sub_80A38F4(gGenericBuffer)) {

        ret = 0;
        buf = gGenericBuffer;
    
        for (i = 0; i < 0x10; i++) {
            if ((0 == buf[i].data.unk[0]))
                continue;
    
            if (0 == buf[i].data.unk[1])
                ret = 1;

            if (2 == buf[i].data.unk[1])
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

void SetSomeUnitStatThingUnlockMaybeIdk(int index, struct SecureSaveHeader *buf)
{
    struct SecureSaveHeader tmp_header;
    u32 _index = index;
    int save = 0;

    if (index > 0x100)
        return;

    if (0 == buf) {
        buf = &tmp_header;
        LoadAndVerifySecureHeaderSW(&tmp_header);
        save = 1;
    }

    buf->unk40[index >> 3] |= 1 << (_index % 8);

    if (save)
        SaveSecureHeader(buf);
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

    if (1 & buf->unk40[index >> 3] >> (_index % 8))
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
        if (0 != buf->unk40[i])
            return 1;
    }
    return 0;
}

void sub_80A3868()
{
    return;
}

void __malloc_unlock_3()
{
    return;
}

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

u8 ReadAndVerifyGameRankSaveDataAll(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == _buf)
        _buf = gGenericBuffer;

    (*ReadSramFast)(
        (void*)gpSaveDataStart + 0x7190,
        (void*)_buf,
        sizeof(struct GameRankSaveDataPacks)
    );

    if (_buf->magic0 != CalcSaveDataMagic((void*)_buf, 0x90))
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
        _buf = gGenericBuffer;

    (*ReadSramFast)(
        (void*)gpSaveDataStart + 0x725C,
        (void*)_buf,
        0x144
    );

    if (_buf[0x140 / 2] != CalcSaveDataMagic(_buf, 0x140))
        return 0;
    else
        return 1;
}

void sub_80A3950(void *buf)
{
    u16 *_buf = buf;

    _buf[0x140/2] = CalcSaveDataMagic(buf, 0x140);

    WriteAndVerifySramFast(
        buf,
        (void*)gpSaveDataStart + 0x725C,
        0x144
    );
}

void UpdateAllGameRankSaveData(void *buf)
{
    struct GameRankSaveDataPacks *_buf = buf;

    _buf->magic0 = CalcSaveDataMagic(buf, 0x90);

    WriteAndVerifySramFast(
        buf,
        (void*)gpSaveDataStart + 0x7190,
        sizeof(struct GameRankSaveDataPacks)
    );
}

void EraseAllGameRankSaveData()
{
    u16 _buf[0x94 / 2];

    CpuFill16(0, _buf, 0x128 / 2);
    UpdateAllGameRankSaveData(_buf);
}

int GetChapterDataMode()
{
    return gRAMChapterData.chapterModeIndex - 1;
}

int GetGameRankSaveData(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src;
    struct GameRankSaveData *dest = buf;

    CpuFill16(0, buf, 0x18);
    CpuFill16(0, &_buf, sizeof(_buf));

    if (0 != ReadAndVerifyGameRankSaveDataAll(&_buf)) {
        src = &_buf.pack[(chapter_mode + difficulty * 3)];
        *dest = *src;
        return 1;
    }
    
    return 0;
}

void WriteMiscGameSavePack(void *buf, int chapter_mode, int difficulty)
{
    struct GameRankSaveDataPacks _buf;
    struct GameRankSaveData *src = buf;

    if (0 != ReadAndVerifyGameRankSaveDataAll(&_buf)) {
        _buf.pack[chapter_mode + difficulty * 3] = *src;
        UpdateAllGameRankSaveData(&_buf);
    }
}

u8 IsGameRankSaveDataBetter(struct GameRankSaveData *old, struct GameRankSaveData *new)
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

void GenerateGameRankSaveData(struct GameRankSaveData *buf, int chapter_mode, int difficulty)
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

        if (GetBwlFavoritism(unit->pCharacterData->number) <= best)
            continue;

        best = GetBwlFavoritism(unit->pCharacterData->number);
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

void UpdateGameRankSaveData()
{
    struct GameRankSaveData old, new;

    int chapter_mode = GetChapterDataMode();
    int diffcult = 1 & gRAMChapterData.chapterStateBits >> 6;

    GenerateGameRankSaveData(&new, chapter_mode, diffcult);
    GetGameRankSaveData(&old, chapter_mode, diffcult);

    if (0 != IsGameRankSaveDataBetter(&old, &new))
        WriteMiscGameSavePack(&new, chapter_mode, diffcult);
}

void EraseUnkBmSave1()
{
    u16 buf[0x12];
    
    CpuFill16(0, buf, sizeof(buf));
    WriteUnkBmSave1(buf);
}

u8 ReadAndVerifyUnkBmSave1(void *buf)
{
    struct bmsave_unkstruct1_ *_buf = buf;
    struct bmsave_unkstruct1_ tmp;

    if (!IsSramWorking())
        return 0;

    if (NULL == buf)
        _buf = &tmp;
    
    (*ReadSramFast)((void*)gpSaveDataStart + 0x7224,
                    (void*)_buf,
                    sizeof(struct bmsave_unkstruct1_));

    if (_buf->magic1 != CalcSaveDataMagic(_buf, sizeof(struct bmsave_unkstruct1)))
        return 0;
    else
        return 1;
}

void WriteUnkBmSave1(void *buf)
{
    struct bmsave_unkstruct1_ *_buf = buf;

    _buf->magic1 = CalcSaveDataMagic(buf, sizeof(struct bmsave_unkstruct1));

    WriteAndVerifySramFast((void*)_buf,
                           (void*)gpSaveDataStart + 0x7224,
                            sizeof(struct bmsave_unkstruct1_));
}


int ReadAndVerifyUnkBmSave1Bit(void *buf, int val) {
    struct bmsave_unkstruct1_ tmp;
    struct bmsave_unkstruct1_ *_buf;
    u32 _val = val;

    if (0 == buf) {
        buf = &tmp;
        ReadAndVerifyUnkBmSave1(&tmp);
    }

    _buf = buf;
    if (1 & (_buf->data.unk[val >> 5] >> (_val % 0x20)))
        return 1;
    else
        return 0;
}

void ModifyUnkBmSave1(struct bmsave_unkstruct1_ *buf, int val)
{
    struct bmsave_unkstruct1_ tmp;
    u32 _val = val;
    
    if (NULL == buf) {
        buf = &tmp;
        
        if (!ReadAndVerifyUnkBmSave1(&tmp))
            return;
    }

    if (buf->data.unk[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->data.unk[val >> 5] |= 1 << (_val % 0x20);

    if (0x43 == val)
        buf->data.unk[0] |= 4;
    else if (2 == val)
        buf->data.unk[2] |= 8;

    if (0x54 == val)
        buf->data.unk[1] |= 1 << 0x10;
    else if (0x30 == val)
        buf->data.unk[2] |= 1 << 0x14;

    WriteUnkBmSave1(buf);
}

void EraseUnkBmSave2()
{
    struct bmsave_unkstruct2_ buf;
    
    CpuFill16(0, (void*)&buf, sizeof(buf));
    WriteUnkBmSave2(&buf);
}

u8 ReadAndVerifyUnkBmSave2(void *buf)
{
    struct bmsave_unkstruct2_ tmp, *_buf = buf;

    if (!IsSramWorking())
        return 0;

    if (0 == _buf)
        _buf = &tmp;

    (*ReadSramFast)((void*)gpSaveDataStart + 0x7248, (void*)_buf, sizeof(*_buf));

    if (_buf->magic1 != CalcSaveDataMagic(_buf, sizeof(_buf->data)))
        return 0;
    else
        return 1;
}

void WriteUnkBmSave2(struct bmsave_unkstruct2_ *buf)
{
    buf->magic1 = CalcSaveDataMagic(buf, sizeof(struct bmsave_unkstruct2));

    WriteAndVerifySramFast((void*)buf,
                           (void*)gpSaveDataStart + 0x7248,
                            sizeof(struct bmsave_unkstruct2_));
}

int ReadAndVerifyUnkBmSave2Bit(void *buf, int val) {
    struct bmsave_unkstruct2_ tmp;
    struct bmsave_unkstruct2_ *_buf;
    u32 _val = val;

    if (0 == buf) {
        buf = &tmp;
        ReadAndVerifyUnkBmSave2(&tmp);
    }

    _buf = buf;
    if (1 & (_buf->data.unk[val >> 5] >> (_val % 0x20)))
        return 1;
    else
        return 0;
}

void ModifyUnkBmSave2(struct bmsave_unkstruct2_ *buf, int val)
{
    struct bmsave_unkstruct2_ tmp;
    u32 _val = val;
    
    if (NULL == buf) {
        buf = &tmp;
        
        if (!ReadAndVerifyUnkBmSave2(&tmp))
            return;
    }

    if (buf->data.unk[val >> 5] & (1 << (_val % 0x20)))
        return;

    buf->data.unk[val >> 5] |= (1 << (_val % 0x20));
    WriteUnkBmSave2(buf);
}

void VerfyMiscSaveData()
{
    if (!LoadAndVerifySecureHeaderSW(NULL))
        InitNopSecHeader();

    if (!sub_80A38F4(NULL))
        sub_80A2EA8();
    
    if (!ReadAndVerifyGameRankSaveDataAll(NULL))
        EraseAllGameRankSaveData();
    
    if (!ReadAndVerifyUnkBmSave1(NULL))
        EraseUnkBmSave1();
    
    if (!ReadAndVerifyUnkBmSave2(NULL))
        EraseUnkBmSave2();
    
    sub_80A6AA0();
}

void SaveClearedBWLAndChapterWinData(void *sram_dest)
{
    int i, j;
    void *dest0 ,*dest1, *src;

    CpuFill16(0, (void*)gBWLDataStorage, sizeof(gBWLDataStorage));
    CpuFill16(0, (void*)gChapterWinDataArray, sizeof(gChapterWinDataArray));

    src = gBWLDataStorage;
    dest0 = sram_dest + 0x084C;

    for (i = 0; i < BWL_ARRAY_NUM; i++) {
        gBWLDataStorage[i].favoritism = 0x2000;
        WriteAndVerifySramFast(src, dest0, sizeof(struct BwlData));

        dest0 += sizeof(struct BwlData);
        /* bug? */
        // src += sizeof(struct BwlData);
    }

    dest1 = sram_dest + 0x0CAC;

    for (i = 0; i < WIN_ARRAY_NUM; i++) {
        WriteAndVerifySramFast((void*)&gChapterWinDataArray[0], /* bug? */
                                dest1,
                                sizeof(struct ChapterWinData));
        dest1 += sizeof(struct ChapterWinData);
    }

    gpBWLSaveTarget = sram_dest + 0x084C;
}

void ClearRAMChapterData()
{
    gRAMChapterData.unk_2C_04 = 0;
    SetPartyGoldAmount(0);
    ResetRAMChapterData();
}

void ResetRAMChapterData()
{
    CpuFill16(0, (void*)gBWLDataStorage, sizeof(gBWLDataStorage));
    gRAMChapterData.unk_38_2 = 0;
    gRAMChapterData.unk_34_14 = 0;
    gRAMChapterData.unk_38_1 = 0;
    gRAMChapterData.unk_34_00 = 0;
    gRAMChapterData.total_gold = GetPartyTotalGoldValue();
}

void LoadBWLEntries(void *sram_src)
{
    ReadSramFast(sram_src,
                 (void*)gBWLDataStorage,
                 sizeof(gBWLDataStorage));
    
    gpBWLSaveTarget = sram_src;
}

void LoadChapterWinData(void *sram_src)
{
    ReadSramFast(sram_src,
                 (void*)gChapterWinDataArray,
                 sizeof(gChapterWinDataArray));
}

void SaveBWLEntries(void *sram_dest)
{
    WriteAndVerifySramFast((void*)gBWLDataStorage,
                            sram_dest,
                            sizeof(gBWLDataStorage));

    gpBWLSaveTarget = sram_dest;
}

void SaveChapterWinData(void *sram_dest)
{
    WriteAndVerifySramFast((void*)gChapterWinDataArray,
                            sram_dest,
                            sizeof(gChapterWinDataArray));
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
        if (IsChapterIndexValid(cur->chapter_index))
            ret++;
    }

    return ret;
}

int sub_80A4330()
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

int CalcTotalGameTime()
{
    int ret = 0;
    int index = GetNextChapterWinDataEntryIndex();
    int i = 0;

    if (ret < index)
        for (; i < index; i++)
            ret += GetChapterWinDataEntry(i)->chapter_time * 180;

    return ret;
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

u8 IsChapterIndexValid(u32 ch_index)
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

        if (IsChapterIndexValid(cur->chapter_index))
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

        if (IsChapterIndexValid(cur->chapter_index))
            count += cur->chapter_turn;
    }

    return count;
}

void BWL_IncrementBattleCount(struct Unit* unit)
{
    u32 char_id;
    struct BwlData *bwl;
    
    if (FACTION_BLUE != UNIT_FACTION(unit))
        return;

    char_id = UNIT_CHAR_ID(unit);
    
    bwl = GetBWL(char_id);
    if (NULL == bwl)
        return;

    if (bwl->battle_count < 4000)
        bwl->battle_count++;

    BWL_AddFavoritismValue(UNIT_CHAR_ID(unit), 4);
}

void BWL_IncrementWinCount(u8 char_id)
{
    struct BwlData *bwl = GetBWL(char_id);
    if (NULL == bwl)
        return;

    if (bwl->win_count < 0x3E8)
        bwl->win_count++;

    BWL_AddFavoritismValue(char_id, 0x10);
}

void BWL_IncrementAndSaveLossCount(u8 char_id)
{
    struct SramChunk buf;
    int val;
    
    if (IsSramWorking()){

        struct BwlData *bwl = GetBWL(char_id);
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
    
        if (bwl->loss_count >= 0xC8)
            return;
        
        bwl->loss_count++;
    
        BWL_AddFavoritismValue(char_id, -0x80);
    
        val = CheckSecHeader_BIT63() + 3;
    
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

void BWL_SetUnitLossInfo(u8 char_id, u8 killer, int death_type)
{
    int type;
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return;

    type = GetBattleMapType();
    switch (type) {
    case 2:
        bwl->dead_in_skirmish = 1;
        bwl->death_loc_id = gGMData.unk10[0].location;
        break;


    case 0:
    case 1:
    default:
        bwl->dead_in_skirmish = 0;
        bwl->death_loc_id = gRAMChapterData.chapterIndex;
        break;
    }

    bwl->death_turn_num = gRAMChapterData.chapterTurnNumber;
    bwl->killer = killer;
    bwl->death_type = death_type;
}

void BWL_IncrementMoveValue(u8 char_id)
{
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return;

    if (bwl->unit_move_count < 200)
        bwl->unit_move_count++;
    
    BWL_AddFavoritismValue(char_id, 2);
}

void BWL_IncrementStatScreenViews(u8 char_id)
{
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return;

    if (bwl->stat_screen_view_count < 200)
        bwl->stat_screen_view_count++;
    
    BWL_AddFavoritismValue(char_id, 2);
}

void BWL_IncrementDeployCount(u8 char_id)
{
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return;

    if (bwl->deploy_count < 60)
        bwl->deploy_count++;
    
    BWL_AddFavoritismValue(char_id, 0x40);
}

void BWL_AddTilesMoved(u8 char_id, int amount)
{
    int move_count;
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return;

    move_count = bwl->tiles_move_count + amount;
    if (move_count > 1000)
        move_count = 1000;

    bwl->tiles_move_count = move_count;
    
    BWL_AddFavoritismValue(char_id, 2);
}

void BWL_AddExpGained(u8 char_id, int expGain)
{
    int exp;
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return;

    exp = bwl->total_exp_gain + expGain;
    if (exp > 4000)
        exp = 4000;

    bwl->total_exp_gain = exp;
    
    BWL_AddFavoritismValue(char_id, expGain);
}

void BWL_FavorDecreaseSlightly(u8 char_id)
{
    BWL_AddFavoritismValue(char_id, -0x08);
}

void BWL_FavorDecreaseDrastically(u8 char_id)
{
    BWL_AddFavoritismValue(char_id, -0x100);
}

int BWL_CalcTotalBattleCount()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].battle_count;

    return ret;
}

int BWL_CalcTotalWinCount()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].win_count;

    return ret;
}

int BWL_CalcTotalLossCount()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].loss_count;

    return ret;
}

int BWL_CalcTotalLevel()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].total_exp_gain / 100;

    return ret;
}

int BWL_CalcTotalExpGain()
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gBWLDataStorage[i].total_exp_gain;

    return ret;
}

int GetBwlExpGain(u8 char_id)
{
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return 0;
    else
        return bwl->total_exp_gain;
}

int GetBwlFavoritism(u8 char_id)
{
    struct BwlData *bwl = GetBWL(char_id);
    if (0 == bwl)
        return 0x2000;
    else
        return bwl->favoritism >> 6;
}
