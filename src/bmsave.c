#include "global.h"

#include "agb_sram.h"
#include "functions.h"

#define InterruptEnableRegister ((u16*)0x4000200)

u8 CheckSaveHeaderMagic(void*, u8*);

extern EWRAM_DATA s8 gBoolSramWorking;
extern CONST_DATA void *gpSaveDataStart; /* 0x0E000000 */
extern CONST_DATA u8 gSaveHeaderKeygen[];

struct SecureSaveHeader {
    /* 00 */ u8 magic[0x6];
    /* 06 */ u8 _pad[0x8 - 0x6];
    /* 08 */ u32 _00040624;
    /* 0C */ u16 _200A;

    /* 0E */ u8 flag0E_0 : 1;
             u8 flag0E_1 : 1;
             u8 flag0E_2 : 1;
             u8 flag0E_3 : 1;
             u8 flag0E_4 : 1;
             u8 flag0E_5 : 1;
             u8 flag0E_6 : 2;

    /* 0F */ u8 unk0F_0 : 1;
             u8 unk0F_1 : 7;

    /* 10 */ u16 key1[2];
    /* 14 */ u8 unk14[0x20 - 0x14];
    /* 20 */ u8 unk20[0x40 - 0x20];
    /* 40 */ u8 unk40[0x60 - 0x40];
    /* 60 */ u16 sec_sum;
    /* 62 */ u8 unk62;
    /* 63 */ u8 unk63;
};

void SramInit()
{
    u32 buf[2];
    buf[0] = 0x12345678;
    buf[1] = 0x87654321;

    SetSramFastFunc();
    *InterruptEnableRegister |= 0x2000;
    WriteSramFast((void*)(&buf[0]), gpSaveDataStart + 0x73A0, 4);
    (*ReadSramFast)(gpSaveDataStart + 0x73A0,(void*)(&buf[1]), 4);
    
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
        WriteAndVerifySramFast((void*)buf, gpSaveDataStart + i * 0x40, 0x40);
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


int VerifySecureHeaderSW(struct SecureSaveHeader *buf)
{
    struct SecureSaveHeader tmp;
    struct SecureSaveHeader *header = buf;

    if (!IsSramWorking())
        return 0;

    if (NULL == buf)
        header = &tmp;

    (*ReadSramFast)(gpSaveDataStart, (void*)header, sizeof(struct SecureSaveHeader));

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
    WriteAndVerifySramFast((void*)header, gpSaveDataStart, sizeof(struct SecureSaveHeader));
}

void ForceSaveSecureHeader(struct SecureSaveHeader *header)
{
    WriteAndVerifySramFast((void*)header, gpSaveDataStart, sizeof(struct SecureSaveHeader));
}

#if NONMATCHING

void InitNopSecHeader()
{
    int i;
    struct SecureSaveHeader header;

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

    header.unk0F_0 = 0;
    header.unk0F_1 = 0;

    header.key1[0] = 0;
    header.key1[1] = 0;

    header.unk63 = 0;
    header.unk62 = 0;

    for (i = 0x20 - 0x14; i > 0; i--)
        header.unk14[i - 1] = 0;

    for (i = 0x40 - 0x20; i > 0; i--)
        header.unk20[i - 1] = 0;

    for (i = 0x60 - 0x40; i > 0; i--)
        header.unk40[i - 1] = 0;

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