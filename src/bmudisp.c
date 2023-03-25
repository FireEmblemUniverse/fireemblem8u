#include "global.h"

#include "hardware.h"
#include "unit_icon_data.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "chapterdata.h"
#include "ctc.h"
#include "mu.h"

#include "bmudisp.h"

#include "constants/terrains.h"

/**
* Display standing map sprites and various tile/unit markers
*/

extern UnitIconWait unit_icon_wait_table[];

u8 EWRAM_DATA gSMSGfxIndexLookup[0xD0] = {};

u8 EWRAM_DATA gSMSGfxBuffer[3][8*0x20*0x20] = {};

int EWRAM_DATA gSMS16xGfxIndexCounter = 0;
int EWRAM_DATA gSMS32xGfxIndexCounter = 0;

struct SMSHandle EWRAM_DATA gSMSHandleArray[100] = {};
struct SMSHandle* EWRAM_DATA gSMSHandleIt = NULL;

int EWRAM_DATA gSMSSyncFlag = 0;

int EWRAM_DATA gMapSpriteSwitchHoverTimer = 0;

u8* CONST_DATA gpSMSGfxDecompBuffer = gGenericBuffer;

int CONST_DATA gSomeSMSLookupTable_859B66C[] = {
    0,  8,
    4, 16,
};

u16 CONST_DATA sSlotToChrLut[] = {
    0*CHR_LINE+0x00,  2*CHR_LINE+0x00,
    0*CHR_LINE+0x02,  2*CHR_LINE+0x02,
    0*CHR_LINE+0x04,  2*CHR_LINE+0x04,
    0*CHR_LINE+0x06,  2*CHR_LINE+0x06,
    0*CHR_LINE+0x08,  2*CHR_LINE+0x08,
    0*CHR_LINE+0x0A,  2*CHR_LINE+0x0A,
    0*CHR_LINE+0x0C,  2*CHR_LINE+0x0C,
    0*CHR_LINE+0x0E,  2*CHR_LINE+0x0E,
    0*CHR_LINE+0x10,  2*CHR_LINE+0x10,
    0*CHR_LINE+0x12,  2*CHR_LINE+0x12,
    0*CHR_LINE+0x14,  2*CHR_LINE+0x14,
    0*CHR_LINE+0x16,  2*CHR_LINE+0x16,
    0*CHR_LINE+0x18,  2*CHR_LINE+0x18,
    0*CHR_LINE+0x1A,  2*CHR_LINE+0x1A,
    0*CHR_LINE+0x1C,  2*CHR_LINE+0x1C,
    0*CHR_LINE+0x1E,  2*CHR_LINE+0x1E,
    4*CHR_LINE+0x00,  6*CHR_LINE+0x00,
    4*CHR_LINE+0x02,  6*CHR_LINE+0x02,
    4*CHR_LINE+0x04,  6*CHR_LINE+0x04,
    4*CHR_LINE+0x06,  6*CHR_LINE+0x06,
    4*CHR_LINE+0x08,  6*CHR_LINE+0x08,
    4*CHR_LINE+0x0A,  6*CHR_LINE+0x0A,
    4*CHR_LINE+0x0C,  6*CHR_LINE+0x0C,
    4*CHR_LINE+0x0E,  6*CHR_LINE+0x0E,
    4*CHR_LINE+0x10,  6*CHR_LINE+0x10,
    4*CHR_LINE+0x12,  6*CHR_LINE+0x12,
    4*CHR_LINE+0x14,  6*CHR_LINE+0x14,
    4*CHR_LINE+0x16,  6*CHR_LINE+0x16,
    4*CHR_LINE+0x18,  6*CHR_LINE+0x18,
    4*CHR_LINE+0x1A,  6*CHR_LINE+0x1A,
    4*CHR_LINE+0x1C,  6*CHR_LINE+0x1C,
    4*CHR_LINE+0x1E,  6*CHR_LINE+0x1E,
    8*CHR_LINE+0x00, 10*CHR_LINE+0x00,
    8*CHR_LINE+0x02, 10*CHR_LINE+0x02,
    8*CHR_LINE+0x04, 10*CHR_LINE+0x04,
    8*CHR_LINE+0x06, 10*CHR_LINE+0x06,
    8*CHR_LINE+0x08, 10*CHR_LINE+0x08,
    8*CHR_LINE+0x0A, 10*CHR_LINE+0x0A,
    8*CHR_LINE+0x0C, 10*CHR_LINE+0x0C,
    8*CHR_LINE+0x0E, 10*CHR_LINE+0x0E,
    8*CHR_LINE+0x10, 10*CHR_LINE+0x10,
    8*CHR_LINE+0x12, 10*CHR_LINE+0x12,
    8*CHR_LINE+0x14, 10*CHR_LINE+0x14,
    8*CHR_LINE+0x16, 10*CHR_LINE+0x16,
    8*CHR_LINE+0x18, 10*CHR_LINE+0x18,
    8*CHR_LINE+0x1A, 10*CHR_LINE+0x1A,
    8*CHR_LINE+0x1C, 10*CHR_LINE+0x1C,
    8*CHR_LINE+0x1E, 10*CHR_LINE+0x1E,
};

u16 CONST_DATA gUnknown_0859B73C[] = {
    0x15, 0x29, 0x39, 0x2C, 0x19, 0x1D, 0x00, 0x07, 0x08,
    0x09, 0x17, 0x1A, 0x31, 0x0C, 0x21, 0x1C, 0x18, 0x2B,
    0x1B, 0x13, 0x04, 0x0B, 0x35, 0x2A, 0x26, 0x36, 0x2D,
    0x2F, 0x06, 0x02, 0x11, 0x30, 0x1F, 0x3D, 0x25, 0x33,
    0x0D, 0x10, 0x3A, 0x27, 0x03, 0x32, 0x23, 0x28, 0x3F,
    0x37, 0x0A, 0x14, 0x01, 0x12, 0x3E, 0x2E, 0x1E, 0x20,
    0x05, 0x22, 0x34, 0x38, 0x3B, 0x0E, 0x24, 0x0F, 0x16,
    0x3C,
};

u16 CONST_DATA sSprite_SleepIconA[] = {
    1,
    0x0000, 0x0000, 0x1864,
};

u16 CONST_DATA sSprite_SleepIconB[] = {
    1,
    0x00FF, 0x0000, 0x1864,
};

u16 CONST_DATA sSprite_SleepIconC[] = {
    1,
    0x00FE, 0x01FF, 0x1864,
};

u16 CONST_DATA sSprite_SleepIconD[] = {
    1,
    0x00FD, 0x41FF, 0x184A,
};

u16 CONST_DATA sSprite_SleepIconE[] = {
    1,
    0x00FC, 0x41FE, 0x184A,
};

u16 CONST_DATA sSprite_SleepIconF[] = {
    1,
    0x00FB, 0x41FE, 0x184A,
};

u16 CONST_DATA sSprite_SleepIconG[] = {
    1,
    0x00FA, 0x41FD, 0x184A,
};

u16* CONST_DATA sSleepIconSprites[] = {
    sSprite_SleepIconA,
    sSprite_SleepIconB,
    sSprite_SleepIconC,
    sSprite_SleepIconD,
    sSprite_SleepIconE,
    sSprite_SleepIconF,
    sSprite_SleepIconG,
};

u16 CONST_DATA sSprite_BerserkIconA[] = {
    1,
    0x4000, 0x0000, 0x1842,
};

u16 CONST_DATA sSprite_BerserkIconB[] = {
    1,
    0x4001, 0x0001, 0x1862,
};

u16 CONST_DATA sSprite_BerserkIconC[] = {
    1,
    0x4001, 0x0000, 0x1844,
};

u16 CONST_DATA sSprite_BerserkIconD[] = {
    1,
    0x4000, 0x0001, 0x1842,
};

u16 CONST_DATA sSprite_BerserkIconE[] = {
    1,
    0x4000, 0x0002, 0x1862,
};

u16 CONST_DATA sSprite_BerserkIconF[] = {
    1,
    0x4001, 0x0000, 0x1844,
};

u16 CONST_DATA sSprite_BerserkIconG[] = {
    1,
    0x4000, 0x01FF, 0x1842,
};

u16 CONST_DATA sSprite_BerserkIconH[] = {
    1,
    0x4001, 0x0001, 0x1862,
};

u16 CONST_DATA sSprite_BerserkIconI[] = {
    1,
    0x4001, 0x0002, 0x1844,
};

u16* CONST_DATA sBerserkIconSprites[] = {
    sSprite_BerserkIconA,
    sSprite_BerserkIconB,
    sSprite_BerserkIconC,
    sSprite_BerserkIconD,
    sSprite_BerserkIconE,
    sSprite_BerserkIconF,
    sSprite_BerserkIconG,
    sSprite_BerserkIconH,
    sSprite_BerserkIconI,
};

u16 CONST_DATA sSprite_None[] = {
    0,
};

u16 CONST_DATA sSprite_SilenceIconA[] = {
    1,
    0x4000,  0x0000,  0x1866,
};

u16 CONST_DATA sSprite_SilenceIconB[] = {
    1,
    0x40FF, 0x0000, 0x1846,
};

u16 CONST_DATA sSprite_SilenceIconC[] = {
    1,
    0x00FE, 0x4000, 0x1848,
};

u16* CONST_DATA sSilenceIconSprites[] = {
    sSprite_SilenceIconA,
    sSprite_SilenceIconB,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconC,
    sSprite_SilenceIconB,
    sSprite_SilenceIconA,
    sSprite_None,
    sSprite_None,
    sSprite_None,
    sSprite_None,
    sSprite_None,
};

u16 CONST_DATA sSprite_PoisonIconA[] = {
    2,
    0x8000, 0x0002, 0x1840,
    0x8003, 0x000A, 0x1841,
};

u16 CONST_DATA sSprite_PoisonIconB[] = {
    2,
    0x80FF, 0x1002, 0x1840,
    0x8002, 0x1008, 0x1841,
};

u16 CONST_DATA sSprite_PoisonIconC[] = {
    2,
    0x80FE, 0x0002, 0x1840,
    0x8001, 0x000A, 0x1841,
};

u16 CONST_DATA sSprite_PoisonIconD[] = {
    2,
    0x80FD, 0x1002, 0x1840,
    0x8000, 0x1008, 0x1841,
};

u16 CONST_DATA sSprite_PoisonIconE[] = {
    1,
    0x80FC, 0x0004, 0x1840,
};

u16 CONST_DATA sSprite_PoisonIconF[] = {
    1,
    0x80FB, 0x0004, 0x1841,
};

u16 CONST_DATA sSprite_PoisonIconG[] = {
    1,
    0x80FA, 0x0004, 0x1840,
};

u16 CONST_DATA sSprite_PoisonIconH[] = {
    1,
    0x80F9, 0x1004, 0x1841,
};

u16* CONST_DATA sPoisonIconSprites[] = {
    sSprite_PoisonIconA,
    sSprite_PoisonIconB,
    sSprite_PoisonIconC,
    sSprite_PoisonIconD,
    sSprite_PoisonIconE,
    sSprite_PoisonIconF,
    sSprite_PoisonIconG,
    sSprite_PoisonIconH,
    sSprite_PoisonIconH,
    sSprite_None,
    sSprite_None,
    sSprite_None,
};

u16 CONST_DATA sSprite_0859B968[] = {
    2,
    0x4000, 0x0000, 0x1830,
    0x0008, 0x0000, 0x1850,
};

u16 CONST_DATA sSprite_16x16_Blend[] = {
    1,
    0x0400, 0x4000, 0x0000,
};

u16 CONST_DATA sSprite_16x32_Blend[] = {
    1,
    0x8400, 0x8000, 0x0000,
};

u16 CONST_DATA sSprite_32x32_Blend[] = {
    1,
    0x0400, 0x8000, 0x0000,
};

u16 CONST_DATA sSprite_16x16_Window[] = {
    1,
    0x0800, 0x4000, 0x0000,
};

u16 CONST_DATA sSprite_16x32_Window[] = {
    1,
    0x8800, 0x8000, 0x0000,
};

u16 CONST_DATA sSprite_32x32_Window[] = {
    1,
    0x0800, 0x8000, 0x0000,
};

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

//! FE8U = 0x08026618
void sub_8026618(void) {
    gSMSSyncFlag++;
    return;
}

//! FE8U = 0x08026628
void SetupMapSpritesPalettes(void) {

    CopyToPaletteBuffer(gPal_MapSprite, 0x380, 0x80);

    if (gBmSt.gameStateBits & 0x40) {
        CopyToPaletteBuffer(gPal_MapSpriteArena, 0x360, 0x20);
    } else {
        CopyToPaletteBuffer(gPal_NotMapSprite, 0x360, 0x20);
    }

    return;
}

//! FE8U = 0x08026670
void sub_8026670(void) {
    CopyToPaletteBuffer(gPal_MapSpriteSepia, 0x3c0, 0x20);

    return;
}

//! FE8U = 0x08026688
void ResetUnitSprites(void) {

    int i;

    for (i = 0xD0-1; i >= 0; i--) {
        gSMSGfxIndexLookup[i] |= 0xff;
    }

    gSMS32xGfxIndexCounter = 0;
    gSMS16xGfxIndexCounter = 0x40-1;

    return;
}

//! FE8U = 0x080266BC
void ResetUnitSpritesB(void) {

    int i;

    for (i = 0xD0-1; i >= 0; i--) {
        gSMSGfxIndexLookup[i] |= 0xff;
    }

    gSMS32xGfxIndexCounter = 0;
    gSMS16xGfxIndexCounter = 0x60-1;

    return;
}

//! FE8U = 0x080266F0
int SMS_80266F0(int smsId, int frameId) {

    int slot = gSomeSMSLookupTable_859B66C[frameId];

    Decompress(GetInfo(smsId).sheet, gpSMSGfxDecompBuffer);

    switch (GetInfo(smsId).size) {
        case UNIT_ICON_SIZE_16x16:
            gSMSGfxIndexLookup[frameId] = SomethingSMS_16x16(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_16x32:
            gSMSGfxIndexLookup[frameId] = ApplyUnitSpriteImage16x32(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_32x32:
            gSMSGfxIndexLookup[frameId] = ApplyUnitSpriteImage32x32(slot, smsId) / 2;

            break;
    }

    return gSMSGfxIndexLookup[frameId] << 1;
}

//! FE8U = 0x0802677C
int SMS_SomethingGmapUnit(int smsId, int frameId, int slot) {

    Decompress(GetInfo(smsId).sheet, gpSMSGfxDecompBuffer);

    switch (GetInfo(smsId).size) {
        case UNIT_ICON_SIZE_16x16:
            gSMSGfxIndexLookup[frameId] = SomethingSMS_16x16(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_16x32:

            gSMSGfxIndexLookup[frameId] = ApplyUnitSpriteImage16x32(slot, smsId) / 2;

            break;

        case UNIT_ICON_SIZE_32x32:
            gSMSGfxIndexLookup[frameId] = ApplyUnitSpriteImage32x32(slot, smsId) / 2;

            break;
    }

    return gSMSGfxIndexLookup[frameId] << 1;
}

//! FE8U = 0x080267FC
int UseUnitSprite(u32 id) {

    if (gSMSGfxIndexLookup[id] == 0xFF) {

        Decompress(GetInfo(id).sheet, gpSMSGfxDecompBuffer);

        switch (GetInfo(id).size) {
            case UNIT_ICON_SIZE_16x16:
                gSMSGfxIndexLookup[id] = ApplyUnitSpriteImage16x16(gSMS16xGfxIndexCounter, id) / 2;
                gSMS16xGfxIndexCounter -= 1;

                break;

            case UNIT_ICON_SIZE_16x32:
                gSMSGfxIndexLookup[id] = ApplyUnitSpriteImage16x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += 2;

                break;

            case UNIT_ICON_SIZE_32x32:
                if ((gSMS32xGfxIndexCounter & 0x1e) == 0x1e) {
                    gSMS32xGfxIndexCounter += 2;
                }

                gSMSGfxIndexLookup[id] = ApplyUnitSpriteImage32x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += 4;

                break;
        }

        gSMSSyncFlag++;

    }

    return gSMSGfxIndexLookup[id] << 1;
}

//! FE8U = 0x080268C8
int ApplyUnitSpriteImage16x16(int slot, u32 id) {
    int i;

    int outOff = sSlotToChrLut[slot] * CHR_SIZE;
    id = ((id >> 7) ^ 1) & 1;

    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastCopy(gpSMSGfxDecompBuffer + 0 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 2 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
}

//! FE8U = 0x0802695C
int SomethingSMS_16x16(int slot, u32 id) {
    int i;

    int outOff = sSlotToChrLut[slot] * CHR_SIZE;
    id = ((id >> 7) ^ 1) & 1;

    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastFill(
            0,
            gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );
        CpuFastFill(
            0,
            gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );

        CpuFastCopy(
            gpSMSGfxDecompBuffer + 0 * CHR_SIZE + imgOff,
            gSMSGfxBuffer[i] + 2 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );
        CpuFastCopy(
            gpSMSGfxDecompBuffer + 2 * CHR_SIZE + imgOff,
            gSMSGfxBuffer[i] + 3 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE
        );
    }

    return sSlotToChrLut[slot];
}

//! FE8U = 0x08026A38
int ApplyUnitSpriteImage16x32(int slot, u32 id) {

    int i;

    int outOff = sSlotToChrLut[slot] * CHR_SIZE;
    id = ((id >> 7) ^ 1) & 1;

    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 8 * CHR_SIZE;

        CpuFastCopy(gpSMSGfxDecompBuffer + 0 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 2 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 4 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 6 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
}

//! FE8U = 0x08026B28
int ApplyUnitSpriteImage32x32(int slot, u32 id) {
    int i;

    int outOff = sSlotToChrLut[slot] * CHR_SIZE;

    id = ((id >> 7) ^ 1) & 1;


    for (i = 0; i < 3; i++) {
        int imgOff = (i * id) * 16 * CHR_SIZE;

        CpuFastCopy(gpSMSGfxDecompBuffer + 0 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 4 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 8 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(gpSMSGfxDecompBuffer + 12 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
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
    iVar7 = UseUnitSprite(uVar6) * 0x20;

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
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar17 * CHR_SIZE) + (uVar1 >> 1) + 0 * CHR_SIZE * CHR_LINE] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar17 * CHR_SIZE) + (uVar1 >> 1) + 1 * CHR_SIZE * CHR_LINE] &= (0xf << (!(uVar1 & 1) << 2));
                }
            }

            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011000), 2 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011400), 2 * CHR_SIZE);

            break;

        case UNIT_ICON_SIZE_16x32:

            for (iVar9 = 0; iVar9 < 3; iVar9++) {
                for (iVar18 = 0; iVar18 < 2; iVar18++) {

                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 0 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 1 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 2 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * CHR_SIZE) + 3 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                }
            }

            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011000), 2 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011400), 2 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 2 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011800), 2 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 3 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011C00), 2 * CHR_SIZE);

            break;

        case UNIT_ICON_SIZE_32x32:

            for (iVar9 = 0; iVar9 < 3; iVar9++) {
                for (iVar18 = 0; iVar18 < 4; iVar18++) {

                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * 0x20) + 0 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * 0x20) + 1 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * 0x20) + 2 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                    gSMSGfxBuffer[iVar9][iVar7 + (iVar18 * 0x20) + 3 * CHR_SIZE * CHR_LINE + (uVar1 >> 1)] &= (0xf << (!(uVar1 & 1) << 2));
                }
            }

            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011000), 4 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011400), 4 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 2 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011800), 4 * CHR_SIZE);
            CpuFastCopy(&gSMSGfxBuffer[uVar15][iVar7 + 3 * CHR_SIZE * CHR_LINE], (u8*)(iVar7 + 0x06011C00), 4 * CHR_SIZE);

            break;

    }

_08026EF2:
    if (param_2 == 0x3f) {
        gSMSGfxIndexLookup[uVar6] |= 0xff;
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
        bl UseUnitSprite\n\
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
        ldr r0, _08026D0C  @ gSMSGfxBuffer\n\
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
        ldr r2, _08026D0C  @ gSMSGfxBuffer\n\
        adds r0, r7, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        ldr r2, _08026D10  @ 0x06011000\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        ldr r1, _08026D0C  @ gSMSGfxBuffer\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r0, r1, r2\n\
        ldr r1, [sp, #8]\n\
        adds r0, r1, r0\n\
        adds r0, r0, r7\n\
        ldr r2, _08026D14  @ 0x06011400\n\
        b _08026DF2\n\
        .align 2, 0\n\
    _08026D0C: .4byte gSMSGfxBuffer\n\
    _08026D10: .4byte 0x06011000\n\
    _08026D14: .4byte 0x06011400\n\
    _08026D18:\n\
        movs r1, #0\n\
        lsls r4, r4, #0xd\n\
        str r4, [sp, #8]\n\
        ldr r2, _08026DFC  @ gSMSGfxBuffer\n\
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
        ldr r1, _08026DFC  @ gSMSGfxBuffer\n\
        adds r0, r7, r1\n\
        ldr r2, [sp, #8]\n\
        adds r0, r2, r0\n\
        ldr r2, _08026E00  @ 0x06011000\n\
        adds r1, r7, r2\n\
        movs r2, #0x10\n\
        bl CpuFastSet\n\
        ldr r1, _08026DFC  @ gSMSGfxBuffer\n\
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
        ldr r1, _08026DFC  @ gSMSGfxBuffer\n\
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
        ldr r1, _08026DFC  @ gSMSGfxBuffer\n\
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
    _08026DFC: .4byte gSMSGfxBuffer\n\
    _08026E00: .4byte 0x06011000\n\
    _08026E04: .4byte 0x06011400\n\
    _08026E08: .4byte 0x06011800\n\
    _08026E0C: .4byte 0x06011C00\n\
    _08026E10:\n\
        movs r1, #0\n\
        lsls r4, r4, #0xd\n\
        str r4, [sp, #8]\n\
        ldr r0, _08026F14  @ gSMSGfxBuffer\n\
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
        ldr r1, _08026F14  @ gSMSGfxBuffer\n\
        adds r0, r7, r1\n\
        ldr r2, [sp, #8]\n\
        adds r0, r2, r0\n\
        ldr r2, _08026F18  @ 0x06011000\n\
        adds r1, r7, r2\n\
        movs r2, #0x20\n\
        bl CpuFastSet\n\
        ldr r1, _08026F14  @ gSMSGfxBuffer\n\
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
        ldr r1, _08026F14  @ gSMSGfxBuffer\n\
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
        ldr r1, _08026F14  @ gSMSGfxBuffer\n\
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
        ldr r0, _08026F28  @ gSMSGfxIndexLookup\n\
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
    _08026F14: .4byte gSMSGfxBuffer\n\
    _08026F18: .4byte 0x06011000\n\
    _08026F1C: .4byte 0x06011400\n\
    _08026F20: .4byte 0x06011800\n\
    _08026F24: .4byte 0x06011C00\n\
    _08026F28: .4byte gSMSGfxIndexLookup\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING

//! FE8U = 0x08026F2C
void SyncUnitSpriteSheet(void) {
    int frame = GetGameClock() % 72;

    if (frame == 0) {
        CpuFastCopy(gSMSGfxBuffer[0], (void*)0x06011000, sizeof(gSMSGfxBuffer[0]));
    }

    if (frame == 32) {
        CpuFastCopy(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
    }

    if (frame == 36) {
        CpuFastCopy(gSMSGfxBuffer[2], (void*)0x06011000, sizeof(gSMSGfxBuffer[2]));
    }

    if (frame == 68) {
        CpuFastCopy(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
    }

    return;
}

//! FE8U = 0x08026F94
void ForceSyncUnitSpriteSheet(void) {
    int frame;

    gSMSSyncFlag = 0;

    frame = GetGameClock() % 72;

    if (frame >= 68) {
        RegisterTileGraphics(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
        return;
    }

    if (frame >= 36) {
        RegisterTileGraphics(gSMSGfxBuffer[2], (void*)0x06011000, sizeof(gSMSGfxBuffer[2]));
        return;
    }

    if (frame >= 32) {
        RegisterTileGraphics(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
        return;
    }

    if (frame >= 0) {
        RegisterTileGraphics(gSMSGfxBuffer[0], (void*)0x06011000, sizeof(gSMSGfxBuffer[0]));
        return;
    }

    return;
}

//! FE8U = 0x08026FF4
void sub_8026FF4(int frameId, u8* dst) {
    int i;
    int off;

    int frame = GetGameClock() % 72;

    u8* src = NULL;

    if (frame == 0) {
        src = gSMSGfxBuffer[0];
    }

    if (frame == 32) {
        src = gSMSGfxBuffer[1];
    }

    if (frame == 36) {
        src = gSMSGfxBuffer[2];
    }

    if (frame == 68) {
        src = gSMSGfxBuffer[1];
    }

    if (src == NULL) {
        return;
    }

    off = gSomeSMSLookupTable_859B66C[frameId] * CHR_SIZE;

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

    int frame = GetGameClock() % 72;

    u8* src = NULL;

    if (frame >= 68) {
        src = gSMSGfxBuffer[1];
    } else if (frame >= 36) {
        src = gSMSGfxBuffer[2];
    } else if (frame >= 32) {
        src = gSMSGfxBuffer[1];
    } else if (frame >= 0) {
        src = gSMSGfxBuffer[0];
    }

    if (src == NULL) {
        return;
    }

    off = gSomeSMSLookupTable_859B66C[frameId] * 0x20;

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

    int frame = GetGameClock() % 72;

    #if NONMATCHING

    u8* src = NULL;

    #else // if !NONMATCHING

    register u8* src asm("r5") = NULL;

    #endif // NONMATCHING

    if (frame >= 68) {
        src = gSMSGfxBuffer[1];
    } else if (frame >= 36) {
        src = gSMSGfxBuffer[2];
    } else if (frame >= 32) {
        src = gSMSGfxBuffer[1];
    } else if (frame >= 0) {
        src = gSMSGfxBuffer[0];
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
int GetUnitDisplayedSpritePalette(const struct Unit* unit) {

    if (unit->state & US_BIT27) {
        return 0xB;
    }

    if (unit->state & US_UNSELECTABLE) {
        return 0xF;
    }

    return GetUnitSpritePalette(unit);
}

//! FE8U = 0x08027168
int GetUnitSpritePalette(const struct Unit* unit) {

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

//! FE8U = 0x080271A0
void RefreshUnitSprites(void) {
    struct SMSHandle* smsHandle;

    struct Trap* trap;
    int i;
    u16 oam2 = 0;
    struct SMSHandle* nullHandle = NULL;

    gSMSHandleIt = &gSMSHandleArray[0];

    gSMSHandleIt->pNext = nullHandle;
    gSMSHandleIt->yDisplay = 0x400;

    gSMSHandleIt = &gSMSHandleArray[1];

    for (i = 1; i < 0xC6; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        unit->pMapSpriteHandle = NULL;

        if (unit->state & (US_HIDDEN | US_BIT9)) {
            continue;
        }

        if (gBmMapUnit[unit->yPos][unit->xPos] == 0) {
            continue;
        }

        if (unit->statusIndex == UNIT_STATUS_PETRIFY || unit->statusIndex == UNIT_STATUS_13) {
            unit->state |= US_UNSELECTABLE;
        }

        smsHandle = AddUnitSprite(unit->yPos * 16);

        smsHandle->yDisplay = unit->yPos * 16;
        smsHandle->xDisplay = unit->xPos * 16;

        smsHandle->oam2Base = UseUnitSprite(GetUnitSMSId(unit)) + 0x80 + (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000;

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
        if (trap->type == 1 && trap->data[1] == 0) {
            switch (trap->extra) {
                case 0x35:
                    oam2 = UseUnitSprite(0x5b) - 0x4000 + 0x80;
                    break;

                case 0x36:
                    oam2 = UseUnitSprite(0x5c) - 0x4000 + 0x80;
                    break;

                case 0x37:
                    oam2 = UseUnitSprite(0x5d) - 0x4000 + 0x80;
                    break;
            }

            smsHandle = AddUnitSprite(trap->yPos * 16);

            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = oam2;

            smsHandle->config = GetInfo(0x5b).size;
        }

        if (trap->type == 0xd) {
            smsHandle = AddUnitSprite(trap->yPos * 16);
            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = UseUnitSprite(0x66) - 0x5000 + 0x80;

            smsHandle->config = GetInfo(0x66).size;
        }
    }

    if (gSMSSyncFlag != 0) {
        ForceSyncUnitSpriteSheet();
    }


    return;
}

//! FE8U = 0x0802736C
struct SMSHandle* AddUnitSprite(int y) {
    struct SMSHandle* it = gSMSHandleArray;

    while (1) {
        if (it->pNext == NULL || it->pNext->yDisplay < y) {
            gSMSHandleIt->pNext = it->pNext;
            gSMSHandleIt = (it->pNext = gSMSHandleIt) + 1;

            return it->pNext;
        }

        it = it->pNext;
    }

    return;
}

//! FE8U = 0x080273A4
void PutUnitSpritesOam(void) {

    struct SMSHandle* it = gSMSHandleArray->pNext;

    PutUnitSpriteIconsOam();

    if (it == NULL) {
        return;
    }

    for (; it != NULL; it = it->pNext) {
        int r3 = 0;

        int x = it->xDisplay - gBmSt.camera.x;
        int y = it->yDisplay - gBmSt.camera.y;

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
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y - 16), gObject_16x32, it->oam2Base + OAM2_LAYER(2));
                break;

            case 2:
                CallARM_PushToSecondaryOAM(OAM1_X((x-8)+r3+0x200), OAM0_Y(0x100+y - 16), gObject_32x32, it->oam2Base + OAM2_LAYER(2));
                break;

            case 3:
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y), gObject_16x16, it->oam2Base + OAM2_LAYER(3));;
                break;

            case 4:
                CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y - 16), gObject_16x32, it->oam2Base + OAM2_LAYER(3));
                break;

            case 5:
                CallARM_PushToSecondaryOAM(OAM1_X((x-8)+r3+0x200), OAM0_Y(0x100+y - 16), gObject_32x32, it->oam2Base + OAM2_LAYER(3));
                break;
        }
    }

    return;
}

//! FE8U = 0x08027530
void PutChapterMarkedTileIconOam(void) {
    int x;
    int y;
    int xTile;
    int yTile;
    int shouldDisplay;

    xTile = GetROMChapterStruct(gPlaySt.chapterIndex)->destPosX;
    yTile = GetROMChapterStruct(gPlaySt.chapterIndex)->destPosY;

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

    x = xTile * 16 - gBmSt.camera.x;
    y = yTile * 16 - gBmSt.camera.y;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -16 || y > DISPLAY_HEIGHT) {
        return;
    }

    CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 4), OAM0_Y(0x100+y + 7), gObject_8x8, 0xC51);

    return;
}

//! FE8U = 0x080275E8
void PutUnitSpriteIconsOam(void) {
    u8 protectCharacterId;
    int i;
    int x;
    int y;
    s8 displayRescueIcon;

    int poisonIconFrame;
    int sleepIconFrame;
    int berserkIconFrame;
    int silenceIconFrame;

    u16 rescuePalLut[] = {
        0xC,
        0xE,
        0xD,
    };

    if (GetChapterThing() != 2) {
        protectCharacterId = GetROMChapterStruct(gPlaySt.chapterIndex)->protectCharacterIndex;
    } else {
        protectCharacterId = 0;
    }

    displayRescueIcon = (GetGameClock() % 32) < 20 ? 1 : 0;

    poisonIconFrame = GetGameClock() / 8 % ARRAY_COUNT(sPoisonIconSprites);
    sleepIconFrame = GetGameClock() / 16 % ARRAY_COUNT(sSleepIconSprites);
    berserkIconFrame = GetGameClock() / 8 % ARRAY_COUNT(sBerserkIconSprites);
    silenceIconFrame = GetGameClock() / 4 % ARRAY_COUNT(sSilenceIconSprites);

    if (CheckEventId(0x84) != 0) {
        return;
    }

    PutChapterMarkedTileIconOam();

    for (i = 1; i < 0xc0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & US_HIDDEN) {
            continue;
        }

        if (GetUnitSpriteHideFlag(unit) != 0) {
            continue;
        }

        switch (unit->statusIndex) {
            case UNIT_STATUS_POISON:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 2), OAM0_Y(0x100+y - 4), sPoisonIconSprites[poisonIconFrame], 0);

                break;

            case UNIT_STATUS_SILENCED:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 2), OAM0_Y(0x100+y - 4), sSilenceIconSprites[silenceIconFrame], 0);

                break;

            case UNIT_STATUS_SLEEP:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 2), OAM0_Y(0x100+y), sSleepIconSprites[sleepIconFrame], 0);

                break;

            case UNIT_STATUS_BERSERK:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 1), OAM0_Y(0x100+y - 5), sBerserkIconSprites[berserkIconFrame], 0);

                break;

            case UNIT_STATUS_ATTACK:
            case UNIT_STATUS_DEFENSE:
            case UNIT_STATUS_CRIT:
            case UNIT_STATUS_AVOID:
                if (!displayRescueIcon) {
                    continue;
                }

                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH) {
                    break;
                }

                if (y < -16 || y > DISPLAY_HEIGHT) {
                    break;
                }

                CallARM_PushToSecondaryOAM(OAM1_X(0x200+x - 1), OAM0_Y(0x100+y - 5), sSprite_0859B968, 0);
                break;

            case UNIT_STATUS_SICK:
            case UNIT_STATUS_RECOVER:
                break;
        }

        if (!displayRescueIcon) {
            continue;
        }

        if (unit->state & US_RESCUING) {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH) {
                continue;
            }

            if (y < -16 || y > DISPLAY_HEIGHT) {
                continue;
            }

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, (rescuePalLut[unit->rescue >> 6] & 0xf) * 0x1000 + 0x803);
        } else if ((UNIT_FACTION(unit) != FACTION_BLUE) && (UNIT_CATTRIBUTES(unit) & CA_BOSS)) {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH) {
                continue;
            }

            if (y < -16 || y > DISPLAY_HEIGHT) {
                continue;
            }

            CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 9), OAM0_Y(0x100+y + 7), gObject_8x8, 0x810);
        } else if (protectCharacterId == unit->pCharacterData->number) {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

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
    gBmSt.cursorPrevious.x = -1;
    return;
}

//! FE8U = 0x08027A40
void ResetUnitSpriteHover(void) {
    gMapSpriteSwitchHoverTimer = 0;
    return;
}

//! FE8U = 0x08027A4C
void UnitSpriteHoverUpdate(void) {
    struct Unit* unit;

    unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    if (unit) {
        if (!(unit->state & US_UNSELECTABLE)
            && (UNIT_FACTION(unit) == FACTION_BLUE)
            && unit->statusIndex != UNIT_STATUS_BERSERK
            && unit->statusIndex != UNIT_STATUS_SLEEP) {

            gMapSpriteSwitchHoverTimer++;

            if (gMapSpriteSwitchHoverTimer == 5) {
                MU_Create(unit);
                HideUnitSprite(unit);

                return;
            }
        }
    }

    if (gBmSt.cursorPrevious.x != gBmSt.playerCursor.x || gBmSt.cursorPrevious.y != gBmSt.playerCursor.y) {
        gMapSpriteSwitchHoverTimer = 0;

        unit = GetUnit(gBmMapUnit[gBmSt.cursorPrevious.y][gBmSt.cursorPrevious.x]);

        if (unit) {
            MU_EndAll();
            ShowUnitSprite(unit);
        }
    }

    return;
}

//! FE8U = 0x08027B0C
s8 IsUnitSpriteHoverEnabledAt(int x, int y) {

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
    int chr = UseUnitSprite(id);

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, gObject_16x32, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);

            break;
    }

    return;
}

//! FE8U = 0x08027C48
void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int class) {
    u32 id = GetClassSMSId(class);
    int chr = UseUnitSprite(id) + 0x80;

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
            PutSprite(layer, x, y - 16, gObject_16x32, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, oam2 + chr);

            break;
    }

    return;
}

//! FE8U = 0x08027CFC
void sub_8027CFC(int layer, int x, int y, int class) {
    u32 id = GetClassSMSId(class);
    int chr = UseUnitSprite(id) + 0x80;

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
            PutSpriteExt(layer, x, OAM0_Y(y - 16) + OAM0_WINDOW, gObject_16x32, chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSpriteExt(layer, OAM1_X(x - 8), OAM0_Y(y - 16) + OAM0_WINDOW, gObject_32x32, chr);

            break;
    }

    return;
}

//! FE8U = 0x08027DB4
void sub_8027DB4(int layer, int x, int y, u16 oam2, int class, int idx) {
    u32 id = GetClassSMSId(class);
    int chr = gSomeSMSLookupTable_859B66C[idx] + 1;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, gObject_16x32, (oam2) + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, (oam2) + chr);

            break;

    }

    return;
}

//! FE8U = 0x08027E4C
void sub_8027E4C(int layer, int x, int y, int oam2, struct Unit* unit) {
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }

    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, gObject_16x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);

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
            PutSpriteExt(layer, OAM1_X(x - 8), isBlend ? OAM0_Y(y - 16) | OAM0_BLEND : OAM0_Y(y - 16), gObject_16x16, oam2 + 0x40);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSpriteExt(layer, OAM1_X(x - 8), isBlend ? OAM0_Y(y - 32) | OAM0_BLEND : OAM0_Y(y - 32), gObject_16x32, oam2);

            break;

        case UNIT_ICON_SIZE_32x32:

            PutSpriteExt(layer, OAM1_X(x - 16), isBlend ? OAM0_Y(y - 32) | OAM0_BLEND : OAM0_Y(y - 32), gObject_32x32, oam2);
            break;
    }

    return;
}

//! FE8U = 0x08028014
void PutBlendWindowUnitSprite(int layer, int x, int y, int oam2, struct Unit* unit) {
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH) {
        return;
    }

    if (y < -32 || y > DISPLAY_HEIGHT) {
        return;
    }


    switch (GetInfo(id).size) {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, sSprite_16x16_Blend, oam2 + chr);
            PutSprite(layer, x, y, sSprite_16x16_Window, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, sSprite_16x32_Blend, oam2 + chr);
            PutSprite(layer, x, y - 16, sSprite_16x32_Window, oam2 + chr);

            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, sSprite_32x32_Blend, oam2 + chr);
            PutSprite(layer, x - 8, y - 16, sSprite_32x32_Window, oam2 + chr);

            break;
    }

    return;
}

//! FE8U = 0x08028100
void sub_8028100(void) {
    gSMSHandleArray[0].pNext = NULL;
    return;
}

//! FE8U = 0x0802810C
void HideUnitSprite(struct Unit* unit) {

    if (!unit) {
        RefreshUnitSprites();
    }

    if (!unit->pMapSpriteHandle) {
        return;
    }

    unit->pMapSpriteHandle->config |= 0x80;

    return;
}

//! FE8U = 0x08028130
void ShowUnitSprite(struct Unit* unit) {

    if (!unit->pMapSpriteHandle) {
        return;
    }

    unit->pMapSpriteHandle->config &= ~(0x80);

    return;
}

//! FE8U = 0x08028144
u8 GetUnitSpriteHideFlag(struct Unit* unit) {
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

            a[i][l + j * 16] &= (7 & unk) << 2;

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
