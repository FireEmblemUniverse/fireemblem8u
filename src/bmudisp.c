#include "global.h"

#include "hardware.h"
#include "unit_icon_data.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "chapterdata.h"
#include "ctc.h"
#include "mu.h"

#include "constants/terrains.h"

/**
* Display standing map sprites and various tile/unit markers
*/

extern int gUnknown_0203A4CC; // gSMSSyncFlag

extern int gUnknown_0203A4D0; // gMapSpriteSwitchHoverTimer

extern u8 gUnknown_02033F40[]; // gSMSGfxIndexLookup

extern int gUnknown_0203A010; // gSMS16xGfxIndexCounter
extern int gUnknown_0203A014; // gSMS32xGfxIndexCounter

extern struct SMSHandle gUnknown_0203A018[]; // gSMSHandleArray
extern struct SMSHandle* gUnknown_0203A4C8; // gSMSHandleIt

extern UnitIconWait unit_icon_wait_table[];

extern u8 gUnknown_02034010[3][8*0x20*0x20]; // gSMSGfxBuffer

// pal
extern u16 unit_icon_pal_player[]; // gPal_MapSprite
extern u16 gUnknown_0859EEC0[]; // gPal_NotMapSprite
extern u16 unit_icon_pal_p4[]; // gPal_MapSpriteArena
extern u16 gUnknown_0859EEE0[]; // gPal_MapSpriteSepia

extern u16 gUnknown_080D7C0C[];

extern u8* gUnknown_0859B668; // gpSMSGfxDecompBuffer
extern int gUnknown_0859B66C[]; // gSomeSMSLookupTable_859B66C
extern u16 gUnknown_0859B67C[]; // gSomeSMSLookupTable_859B67C

extern u16 gUnknown_0859B73C[];

extern u16* gUnknown_0859B7F4[];
extern u16* gUnknown_0859B858[];
extern u16* gUnknown_0859B898[];
extern u16* gUnknown_0859B938[];

extern u16 gUnknown_0859B968[];

extern u16 gUnknown_0859B976[]; // gObj_16x16_SemiTransparent
extern u16 gUnknown_0859B97E[]; // gObj_16x32_SemiTransparent
extern u16 gUnknown_0859B986[]; // gObj_32x32_SemiTransparent
extern u16 gUnknown_0859B98E[]; // gObj_16x16_ObjWindow
extern u16 gUnknown_0859B996[]; // gObj_16x32_ObjWindow
extern u16 gUnknown_0859B99E[]; // gObj_32x32_ObjWindow

// forward declarations
int SomethingSMS_16x16_0(int, u32);
int SomethingSMS_16x16(int, u32);
int SomethingSMS_16x32(int, u32);
int SomethingSMS_32x32(int, u32);
struct SMSHandle* SMS_GetNewInfoStruct(int);
void DisplayUnitAdditionalBlinkingIcons(void);
u8 GetUnitStandingSpriteDataFlagThing(struct Unit*);

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

//! FE8U = 0x08026618
void sub_8026618(void) {
    gUnknown_0203A4CC++;
    return;
}

//! FE8U = 0x08026628
void SetupMapSpritesPalettes(void) {

    CopyToPaletteBuffer(unit_icon_pal_player, 0x380, 0x80);

    if (gGameState.gameStateBits & 0x40) {
        CopyToPaletteBuffer(unit_icon_pal_p4, 0x360, 0x20);
    } else {
        CopyToPaletteBuffer(gUnknown_0859EEC0, 0x360, 0x20);
    }

    return;
}

//! FE8U = 0x08026670
void sub_8026670(void) {
    CopyToPaletteBuffer(gUnknown_0859EEE0, 0x3c0, 0x20);

    return;
}

//! FE8U = 0x08026688
void SMS_ClearUsageTable(void) {

    int i;

    for (i = 0xD0-1; i >= 0; i--) {
        gUnknown_02033F40[i] |= 0xff;
    }

    gUnknown_0203A014 = 0;
    gUnknown_0203A010 = 0x40-1;

    return;
}

//! FE8U = 0x080266BC
void sub_80266BC(void) {

    int i;

    for (i = 0xD0-1; i >= 0; i--) {
        gUnknown_02033F40[i] |= 0xff;
    }

    gUnknown_0203A014 = 0;
    gUnknown_0203A010 = 0x60-1;

    return;
}

//! FE8U = 0x080266F0
int SMS_80266F0(int smsId, int frameId) {

    int slot = gUnknown_0859B66C[frameId];

    CopyDataWithPossibleUncomp(GetInfo(smsId).sheet, gUnknown_0859B668);

    switch (GetInfo(smsId).size) {
        case UNIT_ICON_SIZE_16x16:
            gUnknown_02033F40[frameId] = SomethingSMS_16x16(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_16x32:
            gUnknown_02033F40[frameId] = SomethingSMS_16x32(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_32x32:
            gUnknown_02033F40[frameId] = SomethingSMS_32x32(slot, smsId) / 2;

            break;
    }

    return gUnknown_02033F40[frameId] << 1;
}

//! FE8U = 0x0802677C
int SMS_SomethingGmapUnit(int smsId, int frameId, int slot) {

    CopyDataWithPossibleUncomp(GetInfo(smsId).sheet, gUnknown_0859B668);

    switch (GetInfo(smsId).size) {
        case UNIT_ICON_SIZE_16x16:
            gUnknown_02033F40[frameId] = SomethingSMS_16x16(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_16x32:

            gUnknown_02033F40[frameId] = SomethingSMS_16x32(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_32x32:
            gUnknown_02033F40[frameId] = SomethingSMS_32x32(slot, smsId) / 2;

            break;
    }

    return gUnknown_02033F40[frameId] << 1;
}

//! FE8U = 0x080267FC
int SMS_RegisterUsage(u32 id) {

    if (gUnknown_02033F40[id] == 0xFF) {

        CopyDataWithPossibleUncomp(GetInfo(id).sheet, gUnknown_0859B668);

        switch (GetInfo(id).size) {
            case UNIT_ICON_SIZE_16x16:
                gUnknown_02033F40[id] = SomethingSMS_16x16_0(gUnknown_0203A010, id) / 2;
                gUnknown_0203A010 -= 1;

                break;

            case UNIT_ICON_SIZE_16x32:
                gUnknown_02033F40[id] = SomethingSMS_16x32(gUnknown_0203A014, id) / 2;
                gUnknown_0203A014 += 2;

                break;

            case UNIT_ICON_SIZE_32x32:
                if ((gUnknown_0203A014 & 0x1e) == 0x1e) {
                    gUnknown_0203A014 += 2;
                }

                gUnknown_02033F40[id] = SomethingSMS_32x32(gUnknown_0203A014, id) / 2;
                gUnknown_0203A014 += 4;

                break;
        }

        gUnknown_0203A4CC++;

    }

    return gUnknown_02033F40[id] << 1;
}

//! FE8U = 0x080268C8
int SomethingSMS_16x16_0(int slot, u32 id) {
    int i;

    int outOff = gUnknown_0859B67C[slot] * CHR_SIZE;
    id = ((id >> 7) ^ 1) & 1;

    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastCopy(gUnknown_0859B668 + 0 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 2 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return gUnknown_0859B67C[slot];
}

//! FE8U = 0x0802695C
int SomethingSMS_16x16(int slot, u32 id) {
    int i;

    int outOff = gUnknown_0859B67C[slot] * CHR_SIZE;
    id = ((id >> 7) ^ 1) & 1;

    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastFill(
            0,
            gUnknown_02034010[i] + 0 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );
        CpuFastFill(
            0,
            gUnknown_02034010[i] + 1 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );

        CpuFastCopy(
            gUnknown_0859B668 + 0 * CHR_SIZE + imgOff,
            gUnknown_02034010[i] + 2 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );
        CpuFastCopy(
            gUnknown_0859B668 + 2 * CHR_SIZE + imgOff,
            gUnknown_02034010[i] + 3 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );
    }

    return gUnknown_0859B67C[slot];
}

//! FE8U = 0x08026A38
int SomethingSMS_16x32(int slot, u32 id) {

    int i;

    int outOff = gUnknown_0859B67C[slot] * CHR_SIZE;
    id = ((id >> 7) ^ 1) & 1;

    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 8 * CHR_SIZE;

        CpuFastCopy(gUnknown_0859B668 + 0 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 2 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 4 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 6 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return gUnknown_0859B67C[slot];
}

//! FE8U = 0x08026B28
int SomethingSMS_32x32(int slot, u32 id) {
    int i;

    int outOff = gUnknown_0859B67C[slot] * CHR_SIZE;

    id = ((id >> 7) ^ 1) & 1;


    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 16 * CHR_SIZE;

        CpuFastCopy(gUnknown_0859B668 + 0 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 4 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 8 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(gUnknown_0859B668 + 12 * CHR_SIZE + imgOff, gUnknown_02034010[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
    }

    return gUnknown_0859B67C[slot];
}

#if NONMATCHING

/* https://decomp.me/scratch/UAoIL */

//! FE8U = 0x08026C1C
void sub_8026C1C(struct Unit* param_1, int param_2) {
    u16 uVar1;
    int uVar6;
    int iVar7;
    int iVar9;
    int uVar15;
    int iVar17;
    int iVar18;

    uVar6 = GetUnitSMSId(param_1);
    iVar7 = SMS_RegisterUsage(uVar6) * 0x20;

    uVar1 = gUnknown_0859B73C[param_2];

    uVar15 = 0;
    iVar9 = GetGameClock() % 0x48;

    if (iVar9 >= 0x44) {
        uVar15 = 1;
    }

    if (iVar9 >= 0x24) {
        uVar15 = 2;
    }

    if (iVar9 >= 0x20) {
        uVar15 = 1;
    }

    if (iVar9 >= 0) {
        uVar15 = 0;
    }

    switch (GetInfo(uVar6).size) {
        case UNIT_ICON_SIZE_16x16:

            for (iVar9 = 0; iVar9 < 3; iVar9++) {
                for (iVar17 = 0; iVar17 < 2; iVar17++) {
                    gUnknown_02034010[iVar9][iVar7 + (iVar17 * CHR_SIZE) + (uVar1 >> 1) + 0 * CHR_SIZE * CHR_LINE] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar17 * CHR_SIZE) + (uVar1 >> 1) + 1 * CHR_SIZE * CHR_LINE] &= (0xf << (!(uVar1 & 1) << 2));
                }
            }

            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011000), 2 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011400), 2 * CHR_SIZE);

            break;

        case UNIT_ICON_SIZE_16x32:

            for (iVar9 = 0; iVar9 < 3; iVar9++) {
                for (iVar18 = 0; iVar18 < 2; iVar18++) {

                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 0 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 1 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 2 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 3 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                }
            }

            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011000), 2 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011400), 2 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 2 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011800), 2 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 3 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011C00), 2 * CHR_SIZE);

            break;

        case UNIT_ICON_SIZE_32x32:

            for (iVar9 = 0; iVar9 < 3; iVar9++) {
                for (iVar18 = 0; iVar18 < 4; iVar18++) {

                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * 0x20) + 0 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * 0x20) + 1 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * 0x20) + 2 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gUnknown_02034010[iVar9][iVar7 + (iVar18 * 0x20) + 3 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                }
            }

            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011000), 4 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011400), 4 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 2 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011800), 4 * CHR_SIZE);
            CpuFastCopy(&gUnknown_02034010[uVar15][iVar7 + 3 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011C00), 4 * CHR_SIZE);

            break;

    }

_08026EF2:
    if (param_2 == 0x3f) {
        gUnknown_02033F40[uVar6] |= 0xff;
    }
    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_8026C1C(struct Unit* param_1, int param_2) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0xc\n\
        str r1, [sp]\n\
        bl GetUnitSMSId\n\
        str r0, [sp, #4]\n\
        bl SMS_RegisterUsage\n\
        lsls r7, r0, #5\n\
        ldr r1, _08026C84  @ gUnknown_0859B73C\n\
        ldr r2, [sp]\n\
        lsls r0, r2, #1\n\
        adds r0, r0, r1\n\
        ldrh r6, [r0]\n\
        movs r4, #0\n\
        bl GetGameClock\n\
        movs r1, #0x48\n\
        bl __umodsi3\n\
        adds r1, r0, #0\n\
        cmp r1, #0x43\n\
        ble _08026C54\n\
        movs r4, #1\n\
    _08026C54:\n\
        cmp r1, #0x23\n\
        ble _08026C5A\n\
        movs r4, #2\n\
    _08026C5A:\n\
        cmp r1, #0x1f\n\
        ble _08026C60\n\
        movs r4, #1\n\
    _08026C60:\n\
        cmp r1, #0\n\
        blt _08026C66\n\
        movs r4, #0\n\
    _08026C66:\n\
        ldr r1, _08026C88  @ unit_icon_wait_table\n\
        movs r0, #0x7f\n\
        ldr r2, [sp, #4]\n\
        ands r0, r2\n\
        lsls r0, r0, #3\n\
        adds r0, r0, r1\n\
        ldrh r0, [r0, #2]\n\
        cmp r0, #1\n\
        beq _08026D18\n\
        cmp r0, #1\n\
        bgt _08026C8C\n\
        cmp r0, #0\n\
        beq _08026C94\n\
        b _08026EF2\n\
        .align 2, 0\n\
    _08026C84: .4byte gUnknown_0859B73C\n\
    _08026C88: .4byte unit_icon_wait_table\n\
    _08026C8C:\n\
        cmp r0, #2\n\
        bne _08026C92\n\
        b _08026E10\n\
    _08026C92:\n\
        b _08026EF2\n\
    _08026C94:\n\
        movs r1, #0\n\
        lsls r4, r4, #0xd\n\
        str r4, [sp, #8]\n\
        ldr r0, _08026D0C  @ gUnknown_02034010\n\
        mov r8, r0\n\
        lsrs r5, r6, #1\n\
        movs r0, #1\n\
        bics r0, r6\n\
        lsls r0, r0, #2\n\
        movs r4, #0xf\n\
        lsls r4, r0\n\
    _08026CAA:\n\
        movs r6, #0\n\
        lsls r2, r1, #0xd\n\
        adds r1, #1\n\
        mov r9, r1\n\
        adds r0, r7, r5\n\
        adds r0, r0, r2\n\
        mov r1, r8\n\
        adds r3, r0, r1\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        adds r0, r5, r1\n\
        adds r0, r7, r0\n\
        adds r0, r0, r2\n\
        mov r1, r8\n\
        adds r2, r0, r1\n\
    _08026CC8:\n\
        ldrb r1, [r3]\n\
        adds r0, r4, #0\n\
        ands r0, r1\n\
        strb r0, [r3]\n\
        ldrb r1, [r2]\n\
        adds r0, r4, #0\n\
        ands r0, r1\n\
        strb r0, [r2]\n\
        adds r3, #0x20\n\
        adds r2, #0x20\n\
        adds r6, #1\n\
        cmp r6, #1\n\
        ble _08026CC8\n\
        mov r1, r9\n\
        cmp r1, #2\n\
        ble _08026CAA\n\
        ldr r2, _08026D0C  @ gUnknown_02034010\n\
        adds r0, r7, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        ldr r2, _08026D10  @ 0x06011000\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        ldr r1, _08026D0C  @ gUnknown_02034010\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026D14  @ 0x06011400\n\
        b _08026DF2\n\
        .align 2, 0\n\
    _08026D0C: .4byte gUnknown_02034010\n\
    _08026D10: .4byte 0x06011000\n\
    _08026D14: .4byte 0x06011400\n\
    _08026D18:\n\
        movs r1, #0\n\
        lsls r4, r4, #0xd\n\
        str r4, [sp, #8]\n\
        ldr r2, _08026DFC  @ gUnknown_02034010\n\
        mov sl, r2\n\
        lsrs r2, r6, #1\n\
        mov ip, r2\n\
        bics r0, r6\n\
        lsls r0, r0, #2\n\
        movs r2, #0xf\n\
        mov r8, r2\n\
        lsls r2, r0\n\
        mov r8, r2\n\
    _08026D32:\n\
        movs r6, #0\n\
        lsls r2, r1, #0xd\n\
        adds r1, #1\n\
        mov r9, r1\n\
        adds r5, r2, #0\n\
        mov r1, ip\n\
        adds r0, r7, r1\n\
        adds r0, r0, r5\n\
        mov r2, sl\n\
        adds r4, r0, r2\n\
    _08026D46:\n\
        lsls r2, r6, #5\n\
        ldrb r1, [r4]\n\
        mov r0, r8\n\
        ands r0, r1\n\
        strb r0, [r4]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        adds r0, r2, r1\n\
        adds r0, r7, r0\n\
        add r0, ip\n\
        adds r0, r0, r5\n\
        add r0, sl\n\
        ldrb r3, [r0]\n\
        mov r1, r8\n\
        ands r1, r3\n\
        strb r1, [r0]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #4\n\
        adds r0, r2, r1\n\
        adds r0, r7, r0\n\
        add r0, ip\n\
        adds r0, r0, r5\n\
        add r0, sl\n\
        ldrb r3, [r0]\n\
        mov r1, r8\n\
        ands r1, r3\n\
        strb r1, [r0]\n\
        movs r0, #0xc0\n\
        lsls r0, r0, #4\n\
        adds r2, r2, r0\n\
        adds r2, r7, r2\n\
        add r2, ip\n\
        adds r2, r2, r5\n\
        add r2, sl\n\
        ldrb r1, [r2]\n\
        mov r0, r8\n\
        ands r0, r1\n\
        strb r0, [r2]\n\
        adds r4, #0x20\n\
        adds r6, #1\n\
        cmp r6, #1\n\
        ble _08026D46\n\
        mov r1, r9\n\
        cmp r1, #2\n\
        ble _08026D32\n\
        ldr r1, _08026DFC  @ gUnknown_02034010\n\
        adds r0, r7, r1\n\
        ldr r2, [sp, #8]\n\
        adds r0, r2, r0\n\
        ldr r2, _08026E00  @ 0x06011000\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        ldr r1, _08026DFC  @ gUnknown_02034010\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026E04  @ 0x06011400\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        ldr r1, _08026DFC  @ gUnknown_02034010\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026E08  @ 0x06011800\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        ldr r1, _08026DFC  @ gUnknown_02034010\n\
        movs r2, #0xc0\n\
        lsls r2, r2, #4\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026E0C  @ 0x06011C00\n\
    _08026DF2:\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        b _08026EF2\n\
        .align 2, 0\n\
    _08026DFC: .4byte gUnknown_02034010\n\
    _08026E00: .4byte 0x06011000\n\
    _08026E04: .4byte 0x06011400\n\
    _08026E08: .4byte 0x06011800\n\
    _08026E0C: .4byte 0x06011C00\n\
    _08026E10:\n\
        movs r1, #0\n\
        lsls r4, r4, #0xd\n\
        str r4, [sp, #8]\n\
        ldr r0, _08026F14  @ gUnknown_02034010\n\
        mov sl, r0\n\
        lsrs r2, r6, #1\n\
        mov ip, r2\n\
        movs r0, #1\n\
        bics r0, r6\n\
        lsls r0, r0, #2\n\
        movs r2, #0xf\n\
        mov r8, r2\n\
        lsls r2, r0\n\
        mov r8, r2\n\
    _08026E2C:\n\
        movs r6, #0\n\
        adds r0, r1, #1\n\
        mov r9, r0\n\
        lsls r5, r1, #0xd\n\
        mov r1, ip\n\
        adds r0, r7, r1\n\
        adds r0, r0, r5\n\
        mov r2, sl\n\
        adds r4, r0, r2\n\
    _08026E3E:\n\
        lsls r2, r6, #5\n\
        ldrb r1, [r4]\n\
        mov r0, r8\n\
        ands r0, r1\n\
        strb r0, [r4]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        adds r0, r2, r1\n\
        adds r0, r7, r0\n\
        add r0, ip\n\
        adds r0, r0, r5\n\
        add r0, sl\n\
        ldrb r3, [r0]\n\
        mov r1, r8\n\
        ands r1, r3\n\
        strb r1, [r0]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #4\n\
        adds r0, r2, r1\n\
        adds r0, r7, r0\n\
        add r0, ip\n\
        adds r0, r0, r5\n\
        add r0, sl\n\
        ldrb r3, [r0]\n\
        mov r1, r8\n\
        ands r1, r3\n\
        strb r1, [r0]\n\
        movs r0, #0xc0\n\
        lsls r0, r0, #4\n\
        adds r2, r2, r0\n\
        adds r2, r7, r2\n\
        add r2, ip\n\
        adds r2, r2, r5\n\
        add r2, sl\n\
        ldrb r1, [r2]\n\
        mov r0, r8\n\
        ands r0, r1\n\
        strb r0, [r2]\n\
        adds r4, #0x20\n\
        adds r6, #1\n\
        cmp r6, #3\n\
        ble _08026E3E\n\
        mov r1, r9\n\
        cmp r1, #2\n\
        ble _08026E2C\n\
        ldr r1, _08026F14  @ gUnknown_02034010\n\
        adds r0, r7, r1\n\
        ldr r2, [sp, #8]\n\
        adds r0, r2, r0\n\
        ldr r2, _08026F18  @ 0x06011000\n\
        adds r1, r7, r2\n\
        movs r2, #0x20\n\
        bl CpuFastSet\n\
        ldr r1, _08026F14  @ gUnknown_02034010\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026F1C  @ 0x06011400\n\
        adds r1, r7, r2\n\
        movs r2, #0x20\n\
        bl CpuFastSet\n\
        ldr r1, _08026F14  @ gUnknown_02034010\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026F20  @ 0x06011800\n\
        adds r1, r7, r2\n\
        movs r2, #0x20\n\
        bl CpuFastSet\n\
        ldr r1, _08026F14  @ gUnknown_02034010\n\
        movs r2, #0xc0\n\
        lsls r2, r2, #4\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026F24  @ 0x06011C00\n\
        adds r1, r7, r2\n\
        movs r2, #0x20\n\
        bl CpuFastSet\n\
    _08026EF2:\n\
        ldr r0, [sp]\n\
        cmp r0, #0x3f\n\
        bne _08026F02\n\
        ldr r0, _08026F28  @ gUnknown_02033F40\n\
        ldr r1, [sp, #4]\n\
        adds r0, r1, r0\n\
        movs r1, #0xff\n\
        strb r1, [r0]\n\
    _08026F02:\n\
        add sp, #0xc\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08026F14: .4byte gUnknown_02034010\n\
    _08026F18: .4byte 0x06011000\n\
    _08026F1C: .4byte 0x06011400\n\
    _08026F20: .4byte 0x06011800\n\
    _08026F24: .4byte 0x06011C00\n\
    _08026F28: .4byte gUnknown_02033F40\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING

//! FE8U = 0x08026F2C
void SMS_FlushDirect(void) {
    int frame = GetGameClock() % 0x48;

    if (frame == 0) {
        CpuFastCopy(gUnknown_02034010[0], (void*)0x06011000, sizeof(gUnknown_02034010[0]));
    }

    if (frame == 0x20) {
        CpuFastCopy(gUnknown_02034010[1], (void*)0x06011000, sizeof(gUnknown_02034010[1]));
    }

    if (frame == 0x24) {
        CpuFastCopy(gUnknown_02034010[2], (void*)0x06011000, sizeof(gUnknown_02034010[2]));
    }

    if (frame == 0x44) {
        CpuFastCopy(gUnknown_02034010[1], (void*)0x06011000, sizeof(gUnknown_02034010[1]));
    }

    return;
}

//! FE8U = 0x08026F94
void SMS_FlushIndirect(void) {
    int frame;

    gUnknown_0203A4CC = 0;

    frame = GetGameClock() % 0x48;

    if (frame >= 0x44) {
        RegisterTileGraphics(gUnknown_02034010[1], (void*)0x06011000, sizeof(gUnknown_02034010[1]));
        return;
    }

    if (frame >= 0x24) {
        RegisterTileGraphics(gUnknown_02034010[2], (void*)0x06011000, sizeof(gUnknown_02034010[2]));
        return;
    }

    if (frame >= 0x20) {
        RegisterTileGraphics(gUnknown_02034010[1], (void*)0x06011000, sizeof(gUnknown_02034010[1]));
        return;
    }

    if (frame >= 0) {
        RegisterTileGraphics(gUnknown_02034010[0], (void*)0x06011000, sizeof(gUnknown_02034010[0]));
        return;
    }

    return;
}

//! FE8U = 0x08026FF4
void sub_8026FF4(int frameId, u8* dst) {
    int i;
    int off;

    int frame = GetGameClock() % 0x48;

    u8* src = NULL;

    if (frame == 0) {
        src = gUnknown_02034010[0];
    }

    if (frame == 0x20) {
        src = gUnknown_02034010[1];
    }

    if (frame == 0x24) {
        src = gUnknown_02034010[2];
    }

    if (frame == 0x44) {
        src = gUnknown_02034010[1];
    }

    if (src == NULL) {
        return;
    }

    off = gUnknown_0859B66C[frameId] * CHR_SIZE;

    for (i = 0; i <= 3; i++) {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        CpuFastCopy(
            src + a,
            dst + b,
            2 * CHR_SIZE
        );
    }

    return;
}

//! FE8U = 0x08027068
void sub_8027068(int frameId, u8* dst) {
    int i;
    int off;

    int frame = GetGameClock() % 0x48;

    u8* src = NULL;

    if (frame >= 0x44) {
        src = gUnknown_02034010[1];
    } else if (frame >= 0x24) {
        src = gUnknown_02034010[2];
    } else if (frame >= 0x20) {
        src = gUnknown_02034010[1];
    } else if (frame >= 0) {
        src = gUnknown_02034010[0];
    }

    if (src == NULL) {
        return;
    }

    off = gUnknown_0859B66C[frameId] * 0x20;

    for (i = 0; i <= 3; i++) {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;

        RegisterTileGraphics(
            src + a,
            dst + b,
            2 * CHR_SIZE
        );
    }

    return;
}

//! FE8U = 0x080270DC
void sub_80270DC(int frameId, u8* dst) {
    int a;
    int i;

    int frame = GetGameClock() % 0x48;

    #if NONMATCHING

    u8* src = NULL;

    #else // if !NONMATCHING

    register u8* src asm("r5") = NULL;

    #endif // NONMATCHING

    if (frame >= 0x44) {
        src = gUnknown_02034010[1];
    } else if (frame >= 0x24) {
        src = gUnknown_02034010[2];
    } else if (frame >= 0x20) {
        src = gUnknown_02034010[1];
    } else if (frame >= 0) {
        src = gUnknown_02034010[0];
    }

    if (src == NULL) {
        return;
    }

    for (a = frameId * CHR_SIZE, i = 0; i <= 3; a += CHR_SIZE * CHR_LINE, i++) {
        RegisterTileGraphics(
            src + (a),
            dst + (a),
            4 * CHR_SIZE);
    }

    return;
}

//! FE8U = 0x0802713C
int GetUnitSpritePaletteIndexWrapper(const struct Unit* unit) {

    if (unit->state & US_BIT27) {
        return 0xb;
    }

    if (unit->state & US_UNSELECTABLE) {
        return 0xf;
    }

    return GetUnitMapSpritePaletteIndex(unit);
}

//! FE8U = 0x08027168
int GetUnitMapSpritePaletteIndex(const struct Unit* unit) {

    switch (UNIT_FACTION(unit)) {
        case FACTION_BLUE:
            return 0xC;

        case FACTION_RED:
            return 0xD;

        case FACTION_GREEN:
            return 0xE;

        case FACTION_PURPLE:
            return 0xB;
    }
}

#if NONMATCHING

/* https://decomp.me/scratch/76eAd */

//! FE8U = 0x080271A0
void SMS_UpdateFromGameData(void) {
    struct SMSHandle* smsHandle;

    struct Trap* trap;
    int i;

    struct SMSHandle* nullHandle = 0;

    gUnknown_0203A4C8 = &gUnknown_0203A018[0];

    gUnknown_0203A4C8->pNext = nullHandle;
    gUnknown_0203A4C8->yDisplay = 0x400;

    gUnknown_0203A4C8 = &gUnknown_0203A018[1];

    for (i = 1; i < 0xC6; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        unit->pMapSpriteHandle = nullHandle;

        if (unit->state & (US_HIDDEN | US_BIT9)) {
            continue;
        }

        if (gBmMapUnit[unit->yPos][unit->xPos] == 0) {
            continue;
        }

        if (unit->statusIndex == UNIT_STATUS_PETRIFY || unit->statusIndex == UNIT_STATUS_13) {
            unit->state |= US_UNSELECTABLE;
        }

        smsHandle = SMS_GetNewInfoStruct(unit->yPos * 16);

        smsHandle->yDisplay = unit->yPos * 16;
        smsHandle->xDisplay = unit->xPos * 16;

        smsHandle->oam2Base = SMS_RegisterUsage(GetUnitSMSId(unit)) + 0x80 + (GetUnitSpritePaletteIndexWrapper(unit) & 0xf) * 0x1000;

        smsHandle->config = GetInfo(GetUnitSMSId(unit)).size;

        if (unit->state & 0x100) {
            smsHandle->config += 3;
        }

        if (unit->state & 0x1000000) {
            smsHandle->config += 0x40;
        }

        unit->pMapSpriteHandle = smsHandle;
    }

    for (trap = GetTrap(0); trap->type != 0; trap++) {
        u16 oam2;

        if (trap->type == 1 && trap->data[1] == 0) {
            switch (trap->extra) {
                case 0x35:
                    oam2 = SMS_RegisterUsage(0x5b) - 0x4000 + 0x80;
                    break;

                case 0x36:
                    oam2 = SMS_RegisterUsage(0x5c) - 0x4000 + 0x80;
                    break;

                case 0x37:
                    oam2 = SMS_RegisterUsage(0x5d) - 0x4000 + 0x80;
                    break;
            }

            smsHandle = SMS_GetNewInfoStruct(trap->yPos * 16);

            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = oam2;

            smsHandle->config = GetInfo(0x5b).size;
        }

        if (trap->type == 0xd) {
            smsHandle = SMS_GetNewInfoStruct(trap->yPos * 16);
            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = SMS_RegisterUsage(0x66) - 0x5000 + 0x80;

            smsHandle->config = GetInfo(0x66).size;
        }
    }

    if (gUnknown_0203A4CC != 0) {
        SMS_FlushIndirect();
    }


    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void SMS_UpdateFromGameData(void) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        movs r0, #0\n\
        mov r8, r0\n\
        ldr r0, _080272C0  @ gUnknown_0203A4C8\n\
        ldr r1, _080272C4  @ gUnknown_0203A018\n\
        mov r2, r8\n\
        str r2, [r1]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        strh r2, [r1, #6]\n\
        adds r1, #0xc\n\
        str r1, [r0]\n\
        movs r7, #1\n\
    _080271C0:\n\
        adds r0, r7, #0\n\
        bl GetUnit\n\
        adds r6, r0, #0\n\
        cmp r6, #0\n\
        beq _08027282\n\
        ldr r0, [r6]\n\
        cmp r0, #0\n\
        beq _08027282\n\
        movs r0, #0\n\
        str r0, [r6, #0x3c]\n\
        ldr r3, [r6, #0xc]\n\
        ldr r0, _080272C8  @ 0x00000201\n\
        ands r0, r3\n\
        cmp r0, #0\n\
        bne _08027282\n\
        movs r2, #0x11\n\
        ldrsb r2, [r6, r2]\n\
        ldr r0, _080272CC  @ gBmMapUnit\n\
        ldr r1, [r0]\n\
        lsls r0, r2, #2\n\
        adds r0, r0, r1\n\
        movs r1, #0x10\n\
        ldrsb r1, [r6, r1]\n\
        ldr r0, [r0]\n\
        adds r0, r0, r1\n\
        ldrb r0, [r0]\n\
        cmp r0, #0\n\
        beq _08027282\n\
        adds r0, r6, #0\n\
        adds r0, #0x30\n\
        ldrb r0, [r0]\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        cmp r1, #0xb\n\
        beq _0802720C\n\
        cmp r1, #0xd\n\
        bne _08027212\n\
    _0802720C:\n\
        movs r0, #2\n\
        orrs r3, r0\n\
        str r3, [r6, #0xc]\n\
    _08027212:\n\
        lsls r0, r2, #4\n\
        bl SMS_GetNewInfoStruct\n\
        adds r5, r0, #0\n\
        movs r0, #0x11\n\
        ldrsb r0, [r6, r0]\n\
        lsls r0, r0, #4\n\
        strh r0, [r5, #6]\n\
        movs r0, #0x10\n\
        ldrsb r0, [r6, r0]\n\
        lsls r0, r0, #4\n\
        strh r0, [r5, #4]\n\
        adds r0, r6, #0\n\
        bl GetUnitSMSId\n\
        bl SMS_RegisterUsage\n\
        adds r4, r0, #0\n\
        adds r0, r6, #0\n\
        bl GetUnitSpritePaletteIndexWrapper\n\
        adds r4, #0x80\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        lsls r1, r1, #0xc\n\
        adds r4, r4, r1\n\
        strh r4, [r5, #8]\n\
        adds r0, r6, #0\n\
        bl GetUnitSMSId\n\
        ldr r2, _080272D0  @ unit_icon_wait_table\n\
        movs r1, #0x7f\n\
        ands r1, r0\n\
        lsls r1, r1, #3\n\
        adds r1, r1, r2\n\
        ldrh r0, [r1, #2]\n\
        adds r2, r0, #0\n\
        strb r0, [r5, #0xb]\n\
        ldr r0, [r6, #0xc]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #1\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0802726E\n\
        adds r0, r2, #3\n\
        strb r0, [r5, #0xb]\n\
    _0802726E:\n\
        ldr r0, [r6, #0xc]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #0x11\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08027280\n\
        ldrb r0, [r5, #0xb]\n\
        adds r0, #0x40\n\
        strb r0, [r5, #0xb]\n\
    _08027280:\n\
        str r5, [r6, #0x3c]\n\
    _08027282:\n\
        adds r7, #1\n\
        cmp r7, #0xc5\n\
        ble _080271C0\n\
        movs r0, #0\n\
        bl GetTrap\n\
        adds r4, r0, #0\n\
        ldrb r0, [r4, #2]\n\
        cmp r0, #0\n\
        beq _0802734C\n\
        ldr r1, _080272D4  @ 0xFFFFC080\n\
        adds r6, r1, #0\n\
        ldr r7, _080272D8  @ unit_icon_wait_table + 0x2DA @ [91].size ballista\n\
        movs r2, #0x58\n\
        adds r2, r2, r7\n\
        mov r9, r2\n\
    _080272A2:\n\
        cmp r0, #1\n\
        bne _08027316\n\
        movs r0, #5\n\
        ldrsb r0, [r4, r0]\n\
        cmp r0, #0\n\
        bne _08027316\n\
        ldrb r0, [r4, #3]\n\
        cmp r0, #0x36\n\
        beq _080272E6\n\
        cmp r0, #0x36\n\
        bgt _080272DC\n\
        cmp r0, #0x35\n\
        beq _080272E2\n\
        b _080272F8\n\
        .align 2, 0\n\
    _080272C0: .4byte gUnknown_0203A4C8\n\
    _080272C4: .4byte gUnknown_0203A018\n\
    _080272C8: .4byte 0x00000201\n\
    _080272CC: .4byte gBmMapUnit\n\
    _080272D0: .4byte unit_icon_wait_table\n\
    _080272D4: .4byte 0xFFFFC080\n\
    _080272D8: .4byte unit_icon_wait_table + 0x2DA @ [91].size ballista\n\
    _080272DC:\n\
        cmp r0, #0x37\n\
        beq _080272EA\n\
        b _080272F8\n\
    _080272E2:\n\
        movs r0, #0x5b\n\
        b _080272EC\n\
    _080272E6:\n\
        movs r0, #0x5c\n\
        b _080272EC\n\
    _080272EA:\n\
        movs r0, #0x5d\n\
    _080272EC:\n\
        bl SMS_RegisterUsage\n\
        adds r0, r0, r6\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r8, r0\n\
    _080272F8:\n\
        ldrb r0, [r4, #1]\n\
        lsls r0, r0, #4\n\
        bl SMS_GetNewInfoStruct\n\
        adds r5, r0, #0\n\
        ldrb r0, [r4, #1]\n\
        lsls r0, r0, #4\n\
        strh r0, [r5, #6]\n\
        ldrb r0, [r4]\n\
        lsls r0, r0, #4\n\
        strh r0, [r5, #4]\n\
        mov r0, r8\n\
        strh r0, [r5, #8]\n\
        ldrh r0, [r7]\n\
        strb r0, [r5, #0xb]\n\
    _08027316:\n\
        ldrb r0, [r4, #2]\n\
        cmp r0, #0xd\n\
        bne _08027344\n\
        ldrb r0, [r4, #1]\n\
        lsls r0, r0, #4\n\
        bl SMS_GetNewInfoStruct\n\
        adds r5, r0, #0\n\
        ldrb r0, [r4, #1]\n\
        lsls r0, r0, #4\n\
        strh r0, [r5, #6]\n\
        ldrb r0, [r4]\n\
        lsls r0, r0, #4\n\
        strh r0, [r5, #4]\n\
        movs r0, #0x66\n\
        bl SMS_RegisterUsage\n\
        ldr r1, _08027364  @ 0xFFFFB080\n\
        adds r0, r0, r1\n\
        strh r0, [r5, #8]\n\
        mov r2, r9\n\
        ldrh r0, [r2]\n\
        strb r0, [r5, #0xb]\n\
    _08027344:\n\
        adds r4, #8\n\
        ldrb r0, [r4, #2]\n\
        cmp r0, #0\n\
        bne _080272A2\n\
    _0802734C:\n\
        ldr r0, _08027368  @ gUnknown_0203A4CC\n\
        ldr r0, [r0]\n\
        cmp r0, #0\n\
        beq _08027358\n\
        bl SMS_FlushIndirect\n\
    _08027358:\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08027364: .4byte 0xFFFFB080\n\
    _08027368: .4byte gUnknown_0203A4CC\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x0802736C
struct SMSHandle* SMS_GetNewInfoStruct(int y) {
    struct SMSHandle* it = gUnknown_0203A018;

    while (1) {
        if (it->pNext == NULL || it->pNext->yDisplay < y) {
            gUnknown_0203A4C8->pNext = it->pNext;
            gUnknown_0203A4C8 = (it->pNext = gUnknown_0203A4C8) + 1;

            return it->pNext;
        }

        it = it->pNext;
    }

    return;
}

//! FE8U = 0x080273A4
void SMS_DisplayAllFromInfoStructs(void) {

    struct SMSHandle* it = gUnknown_0203A018->pNext;

    DisplayUnitAdditionalBlinkingIcons();

    if (it == NULL) {
        return;
    }

    for (; it != NULL; it = it->pNext) {
        int r3 = 0;

        int x = it->xDisplay - gGameState.camera.x;
        int y = it->yDisplay - gGameState.camera.y;

        if (x < -16 || x > DISPLAY_WIDTH) {
            continue;
        }

        if (y < -32 || y > DISPLAY_HEIGHT) {
            continue;
        }

        if (it->config & 0x80) {
            continue;
        }

        if (it->config & 0x40) {
            r3 = GetGameClock() & 2;
        }

        switch ((it->config & 0xf)) {
            case 0:
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y), gObject_16x16, it->oam2Base + OAM2_LAYER(2));
                break;

            case 1:
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y - 0x10), gObject_16x32, it->oam2Base + OAM2_LAYER(2));
                break;

            case 2:
                CallARM_PushToSecondaryOAM(OAM1_X((x-8)+r3+0x200), OAM0_Y(0x100+y - 0x10), gObject_32x32, it->oam2Base + OAM2_LAYER(2));
                break;

            case 3:
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y), gObject_16x16, it->oam2Base + OAM2_LAYER(3));;
                break;

            case 4:
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y - 0x10), gObject_16x32, it->oam2Base + OAM2_LAYER(3));
                break;

            case 5:
                CallARM_PushToSecondaryOAM(OAM1_X((x-8)+r3+0x200), OAM0_Y(0x100+y - 0x10), gObject_32x32, it->oam2Base + OAM2_LAYER(3));
                break;
        }
    }

    return;
}

//! FE8U = 0x08027530
void DisplayChapterTileMarker(void) {
    int x;
    int y;
    int xTile;
    int yTile;
    int shouldDisplay;

    xTile = GetROMChapterStruct(gRAMChapterData.chapterIndex)->destPosX;
    yTile = GetROMChapterStruct(gRAMChapterData.chapterIndex)->destPosY;

    shouldDisplay = (GetGameClock() & 0x1f) < 0x14 ? 1 : 0;

    if (xTile == 0xFF) {
        return;
    }

    if (shouldDisplay == 0) {
        return;
    }

    if (gBmMapFog[yTile][xTile] == 0) {
        return;
    }

    if (gBmMapTerrain[yTile][xTile] == TERRAIN_ROOF) {
        return;
    }

    x = xTile * 0x10 - gGameState.camera.x;
    y = yTile * 0x10 - gGameState.camera.y;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -16 || y > DISPLAY_HEIGHT) {
        return;
    }

    CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 4), OAM0_Y(0x100+y + 7), gObject_8x8, 0xC51);

    return;
}

void DisplayUnitAdditionalBlinkingIcons(void) {
    u8 protectCharacterId;
    int i;
    int x;
    int y;
    s8 displayRescueIcon;

    int poisonIconFrame;
    int sleepIconFrame;
    int berserkIconFrame;
    int silenceIconFrame;

    u16 hack[4];
    memcpy(hack, gUnknown_080D7C0C, 6);

    if (GetChapterThing() != 2) {
        protectCharacterId = GetROMChapterStruct(gRAMChapterData.chapterIndex)->protectCharacterIndex;
    } else {
        protectCharacterId = 0;
    }

    displayRescueIcon = ((GetGameClock() & 0x1f) < 0x14) ? 1 : 0;

    poisonIconFrame = GetGameClock() / 8 % 0xc;
    sleepIconFrame = GetGameClock() / 16 % 7;
    berserkIconFrame = GetGameClock() / 8 % 9;
    silenceIconFrame = GetGameClock() / 4 % 0x12;

    if (CheckEventId(0x84) != 0) {
        return;
    }

    DisplayChapterTileMarker();

    for (i = 1; i < 0xc0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & US_HIDDEN) {
            continue;
        }

        if (GetUnitStandingSpriteDataFlagThing(unit) != 0) {
            continue;
        }

        switch (unit->statusIndex) {
            case UNIT_STATUS_POISON:
                x = unit->xPos * 16 - gGameState.camera.x;
                y = unit->yPos * 16 - gGameState.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 2), OAM0_Y(0x100+y - 4), gUnknown_0859B938[poisonIconFrame], 0);

                break;

            case UNIT_STATUS_SILENCED:
                x = unit->xPos * 16 - gGameState.camera.x;
                y = unit->yPos * 16 - gGameState.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 2), OAM0_Y(0x100+y - 4), gUnknown_0859B898[silenceIconFrame], 0);

                break;

            case UNIT_STATUS_SLEEP:
                x = unit->xPos * 16 - gGameState.camera.x;
                y = unit->yPos * 16 - gGameState.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 2), OAM0_Y(0x100+y), gUnknown_0859B7F4[sleepIconFrame], 0);

                break;

            case UNIT_STATUS_BERSERK:
                x = unit->xPos * 16 - gGameState.camera.x;
                y = unit->yPos * 16 - gGameState.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 1), OAM0_Y(0x100+y - 5), gUnknown_0859B858[berserkIconFrame], 0);

                break;

            case UNIT_STATUS_ATTACK:
            case UNIT_STATUS_DEFENSE:
            case UNIT_STATUS_CRIT:
            case UNIT_STATUS_AVOID:
                if (!displayRescueIcon) {
                    continue;
                }

                x = unit->xPos * 16 - gGameState.camera.x;
                y = unit->yPos * 16 - gGameState.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 1), OAM0_Y(0x100+y - 5), gUnknown_0859B968, 0);
                break;

            case UNIT_STATUS_SICK:
            case UNIT_STATUS_RECOVER:
                break;
        }

        if (!displayRescueIcon) {
            continue;
        }

        if (unit->state & US_RESCUING) {
            x = unit->xPos * 16 - gGameState.camera.x;
            y = unit->yPos * 16 - gGameState.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH) {
                continue;
            }

            if (y < -16 || y > DISPLAY_HEIGHT) {
                continue;
            }

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, (hack[unit->rescueOtherUnit >> 6] & 0xf) * 0x1000 + 0x803);
        } else if ((UNIT_FACTION(unit) != FACTION_BLUE) && (UNIT_CATTRIBUTES(unit) & CA_BOSS)) {
            x = unit->xPos * 16 - gGameState.camera.x;
            y = unit->yPos * 16 - gGameState.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH) {
                continue;
            }

            if (y < -16 || y > DISPLAY_HEIGHT) {
                continue;
            }

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, 0x810);
        } else if (protectCharacterId == unit->pCharacterData->number) {
            x = unit->xPos * 16 - gGameState.camera.x;
            y = unit->yPos * 16 - gGameState.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH) {
                continue;
            }

            if (y < -16 || y > DISPLAY_HEIGHT) {
                continue;
            }

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, 0x811);
        }
    }

    return;
}

//! FE8U = 0x08027A30
void sub_8027A30(void) {
    gGameState.unk18.x = -1;
    return;
}

//! FE8U = 0x08027A40
void sub_8027A40(void) {
    gUnknown_0203A4D0 = 0;
    return;
}

//! FE8U = 0x08027A4C
void sub_8027A4C(void) {
    struct Unit* unit;

    unit = GetUnit(gBmMapUnit[gGameState.playerCursor.y][gGameState.playerCursor.x]);

    if (unit) {
        if (!(unit->state & US_UNSELECTABLE)
            && (UNIT_FACTION(unit) == FACTION_BLUE)
            && unit->statusIndex != UNIT_STATUS_BERSERK
            && unit->statusIndex != UNIT_STATUS_SLEEP) {

            gUnknown_0203A4D0++;

            if (gUnknown_0203A4D0 == 5) {
                MU_Create(unit);
                HideUnitSMS(unit);

                return;
            }
        }
    }

    if (gGameState.unk18.x != gGameState.playerCursor.x || gGameState.unk18.y != gGameState.playerCursor.y) {
        gUnknown_0203A4D0 = 0;

        unit = GetUnit(gBmMapUnit[gGameState.unk18.y][gGameState.unk18.x]);

        if (unit) {
            MU_EndAll();
            ShowUnitSMS(unit);
        }
    }

    return;
}

//! FE8U = 0x08027B0C
s8 sub_8027B0C(int x, int y) {

    struct Unit* unit = GetUnit(gBmMapUnit[y][x]);

    if (!unit) {
        return 0;
    }

    if (unit->state & US_UNSELECTABLE) {
        return 0;
    }

    if (UNIT_FACTION(unit) != FACTION_BLUE) {
        return 0;
    }

    if (unit->statusIndex != UNIT_STATUS_BERSERK && unit->statusIndex != UNIT_STATUS_SLEEP) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08027B60
void PutUnitSprite(int layer, int x, int y, struct Unit* unit) {
    u32 id = GetUnitSMSId(unit);
    int chr = SMS_RegisterUsage(id);

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, (GetUnitSpritePaletteIndexWrapper(unit) & 0xf) * 0x1000 + 0x880 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 0x10, gObject_16x32, (GetUnitSpritePaletteIndexWrapper(unit) & 0xf) * 0x1000 + 0x880 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 0x10, gObject_32x32, (GetUnitSpritePaletteIndexWrapper(unit) & 0xf) * 0x1000 + 0x880 + chr);

            break;
    }

    return;
}

//! FE8U = 0x08027C48
void sub_8027C48(int layer, int x, int y, u16 oam2, int class) {
    u32 id = GetClassSMSId(class);
    int chr = SMS_RegisterUsage(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 0x10, gObject_16x32, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 0x10, gObject_32x32, oam2 + chr);

            break;
    }

    return;
}

//! FE8U = 0x08027CFC
void sub_8027CFC(int layer, int x, int y, int class) {
    u32 id = GetClassSMSId(class);
    int chr = SMS_RegisterUsage(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSpriteExt(layer, x, y + OAM0_WINDOW, gObject_16x16, chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSpriteExt(layer, x, OAM0_Y(y - 0x10) + OAM0_WINDOW, gObject_16x32, chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSpriteExt(layer, OAM1_X(x - 8), OAM0_Y(y - 0x10) + OAM0_WINDOW, gObject_32x32, chr);

            break;
    }

    return;
}

//! FE8U = 0x08027DB4
void sub_8027DB4(int layer, int x, int y, u16 oam2, int class, int idx) {
    u32 id = GetClassSMSId(class);
    int chr = gUnknown_0859B66C[idx] + 1;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 0x10, gObject_16x32, (oam2) + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 0x10, gObject_32x32, (oam2) + chr);

            break;

    }

    return;
}

//! FE8U = 0x08027E4C
void sub_8027E4C(int layer, int x, int y, int oam2, struct Unit* unit) {
    u32 id = GetUnitSMSId(unit);
    int chr = SMS_RegisterUsage(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, oam2 + (GetUnitMapSpritePaletteIndex(unit) & 0xf) * 0x1000 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 0x10, gObject_16x32, oam2 + (GetUnitMapSpritePaletteIndex(unit) & 0xf) * 0x1000 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 0x10, gObject_32x32, oam2 + (GetUnitMapSpritePaletteIndex(unit) & 0xf) * 0x1000 + chr);

            break;

    }


    return;
}

//! FE8U = 0x08027F28
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, s8 isBlend) {

    if (x < -16 || x > DISPLAY_WIDTH+16) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT+32) {
        return;
    }

    switch (GetInfo(GetClassSMSId(class)).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSpriteExt(layer, OAM1_X(x - 8), isBlend ? OAM0_Y(y - 0x10) | OAM0_BLEND : OAM0_Y((y - 0x10)), gObject_16x16, oam2 + 0x40);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSpriteExt(layer, OAM1_X(x - 8), isBlend ? OAM0_Y(y - 0x20) | OAM0_BLEND : OAM0_Y(y - 0x20), gObject_16x32, oam2);

            break;

        case UNIT_ICON_SIZE_32x32:

            PutSpriteExt(layer, OAM1_X(x - 0x10), isBlend ? OAM0_Y(y - 0x20) | OAM0_BLEND : OAM0_Y(y - 0x20), gObject_32x32, oam2);
            break;
    }

    return;
}

//! FE8U = 0x08028014
void sub_8028014(int layer, int x, int y, int oam2, struct Unit* unit) {
    u32 id = GetUnitSMSId(unit);
    int chr = SMS_RegisterUsage(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }


    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gUnknown_0859B976, oam2 + chr);
            PutSprite(layer, x, y, gUnknown_0859B98E, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 0x10, gUnknown_0859B97E, oam2 + chr);
            PutSprite(layer, x, y - 0x10, gUnknown_0859B996, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 0x10, gUnknown_0859B986, oam2 + chr);
            PutSprite(layer, x - 8, y - 0x10, gUnknown_0859B99E, oam2 + chr);

            break;
    }

    return;
}

//! FE8U = 0x08028100
void sub_8028100(void) {
    gUnknown_0203A018[0].pNext = NULL;
    return;
}

//! FE8U = 0x0802810C
void HideUnitSMS(struct Unit* unit) {

    if (!unit) {
        SMS_UpdateFromGameData();
    }

    if (!unit->pMapSpriteHandle) {
        return;
    }

    unit->pMapSpriteHandle->config |= 0x80;

    return;
}

//! FE8U = 0x08028130
void ShowUnitSMS(struct Unit* unit) {

    if (!unit->pMapSpriteHandle) {
        return;
    }

    unit->pMapSpriteHandle->config &= ~(0x80);

    return;
}

//! FE8U = 0x08028144
u8 GetUnitStandingSpriteDataFlagThing(struct Unit* unit) {
    if (!unit->pMapSpriteHandle) {
        return 0x80;
    }

    return unit->pMapSpriteHandle->config & 0x80;
}

#if NONMATCHING

/* https://decomp.me/scratch/7S0c5 */

//! FE8U = 0x08028160
void sub_8028160(u16** a, int b, int c, int d) {
    int i;
    int j;

    u16 unk = gUnknown_0859B73C[d];

    for (i = 0; i < c; i++) {

        for (j = 0; j < b; j++) {
            int l = 7 << ((7 & unk) << 1);

            a[i][l + j * 0x10] &= (7 & unk) << 2;

        }
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_8028160(u16** param_1, int param_2, int param_3,int param_4) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        mov r8, r0\n\
        adds r5, r1, #0\n\
        mov r9, r2\n\
        ldr r0, _080281C4  @ gUnknown_0859B73C\n\
        lsls r3, r3, #1\n\
        adds r3, r3, r0\n\
        ldrh r6, [r3]\n\
        movs r3, #0\n\
        cmp r3, r9\n\
        bge _080281B8\n\
        movs r0, #7\n\
        ands r0, r6\n\
        lsls r0, r0, #2\n\
        movs r1, #0xf\n\
        mov ip, r1\n\
        mov r7, ip\n\
        lsls r7, r0\n\
        mov ip, r7\n\
    _0802818C:\n\
        adds r4, r3, #1\n\
        cmp r5, #0\n\
        ble _080281B2\n\
        mov r0, ip\n\
        mvns r2, r0\n\
        asrs r1, r6, #3\n\
        lsls r1, r1, #2\n\
        lsls r0, r3, #0xa\n\
        adds r3, r5, #0\n\
        adds r0, r0, r1\n\
        mov r7, r8\n\
        adds r1, r7, r0\n\
    _080281A4:\n\
        ldr r0, [r1]\n\
        ands r0, r2\n\
        str r0, [r1]\n\
        adds r1, #0x20\n\
        subs r3, #1\n\
        cmp r3, #0\n\
        bne _080281A4\n\
    _080281B2:\n\
        adds r3, r4, #0\n\
        cmp r3, r9\n\
        blt _0802818C\n\
    _080281B8:\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080281C4: .4byte gUnknown_0859B73C\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING