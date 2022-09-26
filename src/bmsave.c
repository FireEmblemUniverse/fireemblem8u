#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"

/* functions */
u8 CheckSaveHeaderMagic(void*, u8*);
void sub_80A3950(void*);
char sub_80A6430(void *buf);
uintptr_t GetSaveDataLocation(int index);
void sub_80A6454(struct SramChunk*);
void *GetLocalEventIdStorage();
int GetLocalEventIdStorageSize();
void *GetGlobalEventIdStorage();
int GetGlobalEventIdStorageSize();
unsigned short *GetConvoyItemArray();
s8 sub_80A52DC(int);
int sub_80A6A68();
int sub_80A3834(int);
u8 sub_80A3898(void*);
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
        header.unk40[i] = 0;

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
    int tmp0 = sub_80A3834(0);
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
