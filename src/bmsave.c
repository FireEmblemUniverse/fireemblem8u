#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "functions.h"

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
extern CONST_DATA u16 gUnknown_089ED10C[][0x8];

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

#if NONMATCHING

void InitNopSecHeader()
{
    struct SecureSaveHeader header;

    EraseSecureHeader();
    CopyString((void*)(&header), (void*)gUnknown_08205C9C);

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

    /* Here shouble be three loops, but I failed to decompile them */

    SaveSecureHeader(&header);
}

#else

__attribute__((naked))
void InitNopSecHeader()
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        sub sp, #0x64\n\
        bl EraseSecureHeader\n\
        ldr r1, _080A2E9C  @ gSaveHeaderKeygen\n\
        mov r0, sp\n\
        bl CopyString\n\
        ldr r0, _080A2EA0  @ 0x00040624\n\
        str r0, [sp, #8]\n\
        mov r1, sp\n\
        movs r4, #0\n\
        movs r5, #0\n\
        ldr r0, _080A2EA4  @ 0x0000200A\n\
        strh r0, [r1, #0xc]\n\
        mov r2, sp\n\
        ldrb r1, [r2, #0xe]\n\
        movs r3, #2\n\
        negs r3, r3\n\
        adds r0, r3, #0\n\
        ands r0, r1\n\
        strb r0, [r2, #0xe]\n\
        movs r1, #3\n\
        negs r1, r1\n\
        ands r1, r0\n\
        strb r1, [r2, #0xe]\n\
        movs r0, #5\n\
        negs r0, r0\n\
        ands r0, r1\n\
        strb r0, [r2, #0xe]\n\
        movs r1, #9\n\
        negs r1, r1\n\
        ands r1, r0\n\
        strb r1, [r2, #0xe]\n\
        movs r0, #0x11\n\
        negs r0, r0\n\
        ands r0, r1\n\
        strb r0, [r2, #0xe]\n\
        movs r1, #0x21\n\
        negs r1, r1\n\
        ands r1, r0\n\
        strb r1, [r2, #0xe]\n\
        movs r0, #0x41\n\
        negs r0, r0\n\
        ands r0, r1\n\
        strb r0, [r2, #0xe]\n\
        mov r1, sp\n\
        movs r0, #0\n\
        strb r0, [r1, #0xe]\n\
        ldrb r0, [r1, #0xf]\n\
        ands r3, r0\n\
        strb r3, [r1, #0xf]\n\
        mov r0, sp\n\
        strb r4, [r0, #0xf]\n\
        strh r5, [r0, #0x10]\n\
        strh r5, [r0, #0x12]\n\
        adds r0, #0x63\n\
        strb r4, [r0]\n\
        subs r0, #1\n\
        strb r4, [r0]\n\
        add r3, sp, #0x20\n\
        add r4, sp, #0x40\n\
        add r1, sp, #0x14\n\
        movs r2, #0\n\
        subs r0, #0x43\n\
    _080A2E66:\n\
        strb r2, [r0]\n\
        subs r0, #1\n\
        cmp r0, r1\n\
        bge _080A2E66\n\
        adds r1, r3, #0\n\
        movs r2, #0\n\
        adds r0, r1, #0\n\
        adds r0, #0x1f\n\
    _080A2E76:\n\
        strb r2, [r0]\n\
        subs r0, #1\n\
        cmp r0, r1\n\
        bge _080A2E76\n\
        adds r1, r4, #0\n\
        movs r2, #0\n\
        adds r0, r1, #0\n\
        adds r0, #0x1f\n\
    _080A2E86:\n\
        strb r2, [r0]\n\
        subs r0, #1\n\
        cmp r0, r1\n\
        bge _080A2E86\n\
        mov r0, sp\n\
        bl SaveSecureHeader\n\
        add sp, #0x64\n\
        pop {r4, r5}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080A2E9C: .4byte gSaveHeaderKeygen\n\
    _080A2EA0: .4byte 0x00040624\n\
    _080A2EA4: .4byte 0x0000200A\n\
        .syntax divided\n\
    ");
}

#endif /* NONMATCHING */

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
    struct bmsave_unkstruct_089ED10C *buf = sub_80847F8();

    for (; 0xFFFF != buf->unk00; buf++)
        ret += sub_80A3468(buf->unk00, buf->unk02);

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
    struct bmsave_unkstruct_089ED10C *cur = sub_80847F8();

    if (buf == NULL) {
        buf = &tmp_header;
        LoadAndVerifySecureHeaderSW(buf);
    }

    while (1) {
        if (cur->unk00 == 0xFFFF)
            break;
        
        if (cur->unk00 == param0 && cur->unk02 == param1)
            break;
    
        if (cur->unk00 == param1 && cur->unk02 == param0)
            break;

        i++;
        cur++;
    }

    tmp0 =  i >> 2;
    tmp1 = (3 & i) << 1;
    ret = 3 & buf->unk20[tmp0] >> tmp1;
    return ret;
}

