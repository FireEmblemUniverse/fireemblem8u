#include "global.h"

#include "hardware.h"
#include "unit_icon_data.h"

/**
* Display standing map sprites and various tile/unit markers
*/

extern int gUnknown_0203A4CC; // gSMSSyncFlag

extern u8 gUnknown_02033F40[]; // gSMSGfxIndexLookup

extern int gUnknown_0203A010; // gSMS16xGfxIndexCounter
extern int gUnknown_0203A014; // gSMS32xGfxIndexCounter

extern UnitIconWait unit_icon_wait_table[];

extern u8* gUnknown_0859B668; // gpSMSGfxDecompBuffer
extern int gUnknown_0859B66C[]; // gSomeSMSLookupTable_859B66C

extern u16 gUnknown_0859B67C[]; // gSomeSMSLookupTable_859B67C
extern u8 gUnknown_02034010[3][8*0x20*0x20]; // gSMSGfxBuffer

// pal
extern u16 unit_icon_pal_player[]; // gPal_MapSprite
extern u16 gUnknown_0859EEC0[]; // gPal_NotMapSprite
extern u16 unit_icon_pal_p4[]; // gPal_MapSpriteArena
extern u16 gUnknown_0859EEE0[]; // gPal_MapSpriteSepia

// forward declarations
int SomethingSMS_16x16_0(int, u32);
int SomethingSMS_16x16(int, u32);
int SomethingSMS_16x32(int, u32);
int SomethingSMS_32x32(int, u32);


#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

//! FE8U = 0x08026618
void sub_8026618(void) {
    gUnknown_0203A4CC++;
    return;
}

//! FE8U = 0x08026628
void SetupMapSpritesPalettes(void) {

    CopyToPaletteBuffer(unit_icon_pal_player, 0x380, 0x80);

    if ((gGameState.gameStateBits & 0x40) != 0) {
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
