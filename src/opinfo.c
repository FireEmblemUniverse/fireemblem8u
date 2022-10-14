#include "global.h"

#include <stdio.h>
#include <string.h>

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"


struct ClassReelEnt {
    /* 00 */ u32 unk_00;

    /* 04 */ s8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ u8 unk_06;
    /* 07 */ u8 unk_07;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0A */ u8 unk_0A;
    /* 0B */ u8 unk_0B;
    /* 0C */ u8 unk_0C;
    /* 0D */ u8 unk_0D;
    /* 0E */ u8 unk_0E;

    /* 14 */ void* unk_14;
};

struct OpInfoProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u16 unk_30;

    /* 32 */ s8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;

    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;

    /* 40 */ u8 _pad[0x4C-0x40];

    /* 4C */ struct ClassReelEnt* unk_4c;
};

struct OpInfoEnterProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e;

    /* 2F */ u8 _pad1[0x34-0x2F];

    /* 34 */ ProcPtr** unk_34;
    /* 38 */ ProcPtr unk_38;
    /* 3C */ ProcPtr unk_3c;
    /* 40 */ struct ClassReelEnt* unk_40;
};

struct OpInfoViewProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u16 unk_2a;

    /* 2C */ u8 unk_2c;

    /* 2E */ s16 unk_2e;

    /* 30 */ s16 unk_30;
};

struct OpInfoIconProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;

    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
};

struct OpInfo8A2F038Proc {
    PROC_HEADER;

    u8 _pad[0x4C-0x29];

    s16 unk_4c;
    s16 unk_4e;
};

struct OpInfo8A2F068Proc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x4C-0x29];

    /* 4C */ s16 unk_4c;

    /* 4E */ u8 _pad2[0x64-0x4E];

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

struct OpInfoClassDisplayProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;

    /* 30 */ ProcPtr unk_30;
    /* 34 */ struct ClassReelEnt* unk_34;
    /* 38 */ void* unk_38;
    /* 3C */ ProcPtr unk_3c;
    /* 40 */ u8 unk_40[6];
    /* 46 */ u8 unk_46;
};

struct OpInfoGaugeDrawProc {
    PROC_HEADER;

    u16 unk_2a;
    u16 unk_2c;
    struct OpInfoClassDisplayProc* unk_30;
    u8 unk_34;
    u8 unk_35;
};

// TODO: Duplicated in branched_promotion.c
struct Struct_80B4108 {
    u16* a;
    s8 b;
    s8 c;
    s8 d;
};

// TODO: Move elsewhere

void sub_805A7B4(void*);
s8 sub_805A96C(void*);
void sub_805A990(void*);
void sub_805AA28(void*);
void sub_805AE14(void*);

// TODO: Forward declarations

void sub_80B40E4(ProcPtr, int);
struct ClassReelEnt* sub_80B40EC(int, int);
ProcPtr sub_80B2F3C(ProcPtr, struct ClassReelEnt*);
ProcPtr sub_80B3EDC(ProcPtr, struct ClassReelEnt*);
signed char* sub_80B369C(u8, signed char*);
ProcPtr sub_80B305C(ProcPtr, u8);
ProcPtr sub_80B325C(ProcPtr, u8);
struct Struct_80B4108* sub_80B4108(char);


extern struct ProcCmd gUnknown_08A20DA4[];
extern struct ProcCmd gUnknown_08A20DCC[];
extern struct ProcCmd gUnknown_08A2EEF0[];
extern u16 gUnknown_08A2EF48[];
extern struct ProcCmd gUnknown_08A2EF50[];
extern struct ProcCmd gUnknown_08A2EFC0[];
extern struct ProcCmd gUnknown_08A2EFF8[];
extern struct ProcCmd gUnknown_08A2F038[];
extern struct ProcCmd gUnknown_08A2F088[];

extern struct ProcCmd gUnknown_08A2F138[];
extern u16* gUnknown_08A2F180[];
extern u16* gUnknown_08A2F1D0[];
extern u16 gUnknown_08A2F1F0[];

extern u8 gUnknown_08A2FBD4[];
extern struct ClassReelEnt* gUnknown_08A2FBE0[];

extern struct Struct_80B4108 gUnknown_08A2FDD0[];
extern struct Struct_80B4108 gUnknown_08A2FE00[];
extern struct Struct_80B4108 gUnknown_08A301A8;

extern const char gUnknown_08205ED0[]; // "Kn."
extern const char gUnknown_08205ED4[]; // "Knight"

extern u16 gUnknown_08205E94[];
extern ProcPtr* gUnknown_03001D50;

extern u16 gUnknown_08A37300[]; // pal
extern u16 gUnknown_08A30780[]; // pal
extern u16 gUnknown_08A360C8[]; // pal
extern u16 gUnknown_08B18ED4[]; // pal

extern u8 gUnknown_08A301B0[]; // gfx?
extern u8 gUnknown_08A360E8[]; // gfx?
extern u8 gUnknown_08B17B64[]; // gfx?
extern u8 gUnknown_08A35A3C[]; // gfx?

extern u8 gUnknown_08A36284[]; // tsa?
extern u8 gUnknown_08A35FD0[]; // tsa?

extern u8 gUnknown_08A36338[]; // gfx
extern u8 gUnknown_08A372C0[]; // pal

extern u8 gUnknown_08A30E2C[]; // gfx
extern u16 gUnknown_08A3593C[]; // pal
extern u16 gUnknown_08A35488[]; // tsa

extern u8 gUnknown_08A30800[]; // gfx

extern u16 gUnknown_08A30978[]; // tsa

extern u8 gUnknown_08B18D68[];

extern u16 gUnknown_02022E68[];

extern int* gUnknown_08A2F2C0[];


static inline int DarknessCoeff(int darkness, u8 lsr) {
    return 0x10 - (darkness >> (lsr));
}

void sub_80B2818(struct OpInfoProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    NewEfxAnimeDrvProc();

    sub_806E8F0();

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    proc->unk_34 = 0;
    proc->unk_2c = 2;
    proc->unk_32 = 0;

    return;
}

void sub_80B28A0(struct OpInfoProc* proc) {

    Proc_End(Proc_Find(gUnknown_08A20DA4));
    Proc_End(Proc_Find(gUnknown_08A20DCC));

    sub_80ADDD4(proc);

    Sound_FadeOutBGM(1);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    SetNextGameActionId(0);

    Proc_Goto(proc, 5);

    return;
}

void sub_80B2904(struct OpInfoProc* proc) {

    switch (proc->unk_2c) {
        case 2:
            proc->unk_4c = sub_80B40EC(proc->unk_33, proc->unk_34);

            if (proc->unk_4c == 0) {
                SetNextGameActionId(1);
                Proc_Goto(proc, 4);
            } else {
                proc->unk_34++;
                proc->unk_2c = 1;
                sub_80B2F3C(proc, proc->unk_4c);
            }

            break;

        case 3:
            sub_80B3EDC(proc, proc->unk_4c);
            proc->unk_2c = 1;

            break;

        case 1:
            if (gKeyStatusPtr->heldKeys & (A_BUTTON | B_BUTTON | START_BUTTON)) {
                sub_80B28A0(proc);
            }

            break;
    }

    return;
}

s8 sub_80B2988(void) {
    struct OpInfoProc* proc = Proc_Find(gUnknown_08A2EEF0);

    if (proc && !sub_80B40EC(proc->unk_33, proc->unk_34)) {
        return 1;
    }

    return 0;
}

void sub_80B29B8(int mode) {
    struct OpInfoProc* proc = Proc_Find(gUnknown_08A2EEF0);

    if (proc != 0) {
        proc->unk_2c = mode;
    }

    return;
}

void sub_80B29D4(void) {
    Sound_FadeOutBGM(3);

    return;
}

void sub_80B29E0(ProcPtr proc) {

    sub_80ADDD4(proc);

    sub_805A9E0();
    sub_8009A84(0);
    sub_806E920();

    return;
}

void Make6C_opinfo(u8 classSet, ProcPtr parent) {
    struct OpInfoProc* proc = Proc_StartBlocking(gUnknown_08A2EEF0, parent);
    proc->unk_33 = classSet;

    return;
}

#if NONMATCHING

void sub_80B2A14(u8 charId, int x, int y, u16 xScale, u16 yScale, u8 offset) {
    int i;
    int k;

    for (i = 1; i < 0x10; i++) {
        gPaletteBuffer[((charId + 0x10) * 0x10) + i] = ((offset + i) >= 0x10)
            ? gPaletteBuffer[((0 + 0x10) * 0x10) + 0xF]
            : gPaletteBuffer[((1 + 0x10) * 0x10) + i];

        k = charId + 1;
    }

    EnablePaletteSync();

    if (yScale <= 8) {
        return;
    }
    
    if (xScale < 8) {
        xScale = 8;
    }

    WriteOAMRotScaleData(
        charId, 
        Div(+COS(0) << 4, xScale), 
        Div(-SIN(0) << 4, yScale), 
        Div(+SIN(0) << 4, xScale), 
        Div(+COS(0) << 4, yScale)
    );

    if (offset != 0) {
        PutSpriteExt(
            4,
            (x & 0x1FF) + (charId << 9),
            y & 0x1FF,
            gUnknown_08A2EF48,
            charId * 2 + (k & 0xF) * 0x1000 + 0x800
        );
    } else {
        PutSpriteExt(
            4, 
            (x & 0x1FF) + (charId << 9), 
            y & 0x1FF, 
            gUnknown_08A2EF48, 
            charId * 2 + (k & 0xF) * 0x1000 + 0x400
        );
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80B2A14(u8 charId, int x, int y, u16 xScale, u16 yScale, u8 offset) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x10\n\
        mov r8, r1\n\
        str r2, [sp, #4]\n\
        ldr r1, [sp, #0x30]\n\
        ldr r2, [sp, #0x34]\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        mov r9, r0\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov sl, r3\n\
        lsls r1, r1, #0x10\n\
        lsrs r1, r1, #0x10\n\
        str r1, [sp, #8]\n\
        lsls r2, r2, #0x18\n\
        lsrs r2, r2, #0x18\n\
        str r2, [sp, #0xC]\n\
        movs r4, #1\n\
        ldr r2, _080B2A6C  @ gPaletteBuffer\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        ldr r1, _080B2A70  @ 0x0000021E\n\
        adds r5, r2, r1\n\
        ldr r3, [sp, #0xC]\n\
        adds r0, r3, r0\n\
        mov r3, r9\n\
        lsls r1, r3, #5\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r2\n\
        adds r3, r0, #2\n\
        ldr r0, _080B2A74  @ 0x00000222\n\
        adds r1, r1, r0\n\
        adds r1, r1, r2\n\
    _080B2A60:\n\
        ldr r2, [sp, #0xC]\n\
        adds r0, r4, r2\n\
        cmp r0, #0xF\n\
        ble _080B2A78\n\
        ldrh r0, [r5]\n\
        b _080B2A7A\n\
        .align 2, 0\n\
    _080B2A6C: .4byte gPaletteBuffer\n\
    _080B2A70: .4byte 0x0000021E\n\
    _080B2A74: .4byte 0x00000222\n\
    _080B2A78:\n\
        ldrh r0, [r3]\n\
    _080B2A7A:\n\
        strh r0, [r1]\n\
        mov r7, r9\n\
        adds r7, #1\n\
        adds r1, #2\n\
        adds r3, #2\n\
        adds r4, #1\n\
        cmp r4, #0xF\n\
        ble _080B2A60\n\
        bl EnablePaletteSync\n\
        ldr r3, [sp, #8]\n\
        cmp r3, #8\n\
        bls _080B2B74\n\
        mov r0, sl\n\
        cmp r0, #7\n\
        bhi _080B2A9E\n\
        movs r1, #8\n\
        mov sl, r1\n\
    _080B2A9E:\n\
        ldr r4, _080B2B34  @ gSinLookup\n\
        ldr r2, _080B2B38  @ gCosLookup\n\
        movs r3, #0\n\
        ldrsh r0, [r2, r3]\n\
        lsls r0, r0, #4\n\
        mov r1, sl\n\
        bl Div\n\
        adds r6, r0, #0\n\
        lsls r6, r6, #0x10\n\
        asrs r6, r6, #0x10\n\
        movs r1, #0\n\
        ldrsh r0, [r4, r1]\n\
        negs r0, r0\n\
        lsls r0, r0, #4\n\
        ldr r1, [sp, #8]\n\
        bl Div\n\
        adds r5, r0, #0\n\
        lsls r5, r5, #0x10\n\
        asrs r5, r5, #0x10\n\
        movs r2, #0\n\
        ldrsh r0, [r4, r2]\n\
        lsls r0, r0, #4\n\
        mov r1, sl\n\
        bl Div\n\
        adds r4, r0, #0\n\
        lsls r4, r4, #0x10\n\
        asrs r4, r4, #0x10\n\
        ldr r3, _080B2B38  @ gCosLookup\n\
        movs r1, #0\n\
        ldrsh r0, [r3, r1]\n\
        lsls r0, r0, #4\n\
        ldr r1, [sp, #8]\n\
        bl Div\n\
        lsls r0, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        str r0, [sp]\n\
        mov r0, r9\n\
        adds r1, r6, #0\n\
        adds r2, r5, #0\n\
        adds r3, r4, #0\n\
        bl WriteOAMRotScaleData\n\
        ldr r2, [sp, #0xC]\n\
        cmp r2, #0\n\
        beq _080B2B44\n\
        ldr r0, _080B2B3C  @ 0x000001FF\n\
        mov r3, r8\n\
        ands r3, r0\n\
        mov r8, r3\n\
        mov r2, r9\n\
        lsls r1, r2, #9\n\
        add r1, r8\n\
        ldr r3, [sp, #4]\n\
        ands r3, r0\n\
        str r3, [sp, #4]\n\
        ldr r3, _080B2B40  @ gUnknown_08A2EF48\n\
        lsls r0, r2, #1\n\
        movs r2, #0xF\n\
        ands r7, r2\n\
        lsls r2, r7, #0xC\n\
        adds r0, r0, r2\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        adds r0, r0, r2\n\
        str r0, [sp]\n\
        movs r0, #4\n\
        ldr r2, [sp, #4]\n\
        bl PutSpriteExt\n\
        b _080B2B74\n\
        .align 2, 0\n\
    _080B2B34: .4byte gSinLookup\n\
    _080B2B38: .4byte gCosLookup\n\
    _080B2B3C: .4byte 0x000001FF\n\
    _080B2B40: .4byte gUnknown_08A2EF48\n\
    _080B2B44:\n\
        ldr r0, _080B2B84  @ 0x000001FF\n\
        mov r3, r8\n\
        ands r3, r0\n\
        mov r8, r3\n\
        mov r2, r9\n\
        lsls r1, r2, #9\n\
        add r1, r8\n\
        ldr r3, [sp, #4]\n\
        ands r3, r0\n\
        str r3, [sp, #4]\n\
        ldr r3, _080B2B88  @ gUnknown_08A2EF48\n\
        lsls r0, r2, #1\n\
        movs r2, #0xF\n\
        ands r7, r2\n\
        lsls r2, r7, #0xC\n\
        adds r0, r0, r2\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
        adds r0, r0, r2\n\
        str r0, [sp]\n\
        movs r0, #4\n\
        ldr r2, [sp, #4]\n\
        bl PutSpriteExt\n\
        _080B2B74:\n\
        add sp, #0x10\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080B2B84: .4byte 0x000001FF\n\
    _080B2B88: .4byte gUnknown_08A2EF48\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_80B2B8C(struct OpInfoEnterProc* proc) {

    int i;
    u16 ptr;
    signed char* str;
    u16 bgConfig[12];

    memcpy(bgConfig, gUnknown_08205E94, 24);

    SetupBackgrounds(bgConfig);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 1);

    proc->unk_2a = 0;
    proc->unk_34 = &gUnknown_03001D50;

    for (i = 0; i < 0x14; i++) {
        *(proc->unk_34 + i) = 0;
    }

    proc->unk_38 = 0;

    BG_Fill(gBG0TilemapBuffer, 0);

    CopyToPaletteBuffer(gUnknown_08A37300, 0x200, 0x20);

    str = sub_80B369C(proc->unk_40->unk_05, 0);

    ptr = 0;

    proc->unk_2e = strlen(str);

    while (*str != 0) {
        CopyDataWithPossibleUncomp((gUnknown_08A2F2C0[*str] != 0) ? gUnknown_08A2F2C0[*str] : gUnknown_08A2F2C0[0x58], gUnknown_02020188);
        CopyTileGfxForObj(gUnknown_02020188, (void*)(ptr + 0x06010000), 2, 4);

        str++;
        ptr += 0x40;
    }

    CopyToPaletteBuffer(gUnknown_08A30780, 0x3C0, 0x20);
    CopyToPaletteBuffer(gUnknown_08A30780, 0x3E0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A301B0, (void *)0x06016000);

    proc->unk_2c = ((240 - (((proc->unk_2e << 1) + proc->unk_2e) << 2)) >> 1) - 8;

    *proc->unk_34 = sub_80B305C(proc, 0);

    CopyDataWithPossibleUncomp(gUnknown_08A360E8, (void *)0x6000000);

    CopyDataWithPossibleUncomp(gUnknown_08A36284, gUnknown_02020188);
    CallARM_FillTileRect(gUnknown_02022E68, gUnknown_02020188, 0x4000);

    CopyDataWithPossibleUncomp(gUnknown_08A35A3C, (void *)0x06000800);

    CopyDataWithPossibleUncomp(gUnknown_08A35FD0, gUnknown_02020188);
    CallARM_FillTileRect(gBG1TilemapBuffer, gUnknown_02020188, 0x5040);
    CopyToPaletteBuffer(gUnknown_08A360C8, 0xA0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08B17B64, (void *)0x06008000);

    sub_800154C(gBG2TilemapBuffer, gUnknown_08B18D68, 0, 5);

    CopyToPaletteBuffer(gUnknown_08B18ED4, 0, 0x60);

    BG_EnableSyncByMask(4);

    return;
}

// unused??
void sub_80B2DF0(struct OpInfoEnterProc* proc) {

    SetSpecialColorEffectsParameters(2, 0, 0, DarknessCoeff(proc->unk_2a, 1));

    sub_8001F48(1);

    proc->unk_2a++;

    if (proc->unk_2a == 0x20) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    }

    return;
}

void sub_80B2E30(struct OpInfoEnterProc* proc) {
    int unkA;
    int unkB;

    if (proc->unk_2a == 0x3C) {
        proc->unk_38 = sub_80B325C(proc, proc->unk_40->unk_05);
        Proc_Start(gUnknown_08A2F038, proc);
    }

    if (proc->unk_2a >= 0x60) {
        Proc_Break(proc);
        proc->unk_2a = 0;

        return;
    }

    if (proc->unk_2a > 0xF) {
        unkA = (proc->unk_2a - 0x10);

        if ((unkA & 1) == 0) {
            unkB = (unkA / 2);
            unkA = unkB + 1;
            if (unkA < proc->unk_2e) {

                proc->unk_34[unkB+1] = sub_80B305C(proc, unkA);
            }
        }
    }

    proc->unk_2a++;

    return;
}

void sub_80B2EA8(struct OpInfoEnterProc* proc) {

    if (proc->unk_2a == 0x14) {
        Proc_Goto(proc->unk_38, 4);
    }

    if (proc->unk_2a >= 0x50) {
        Proc_Break(proc);
        proc->unk_2a = 0;

        return;
    }

    if ((proc->unk_2a % 3) == 0) {

        if ((proc->unk_2a / 3) < proc->unk_2e) {
            Proc_Break(proc->unk_34[proc->unk_2a / 3]);
        }

    }

    proc->unk_2a++;


    return;
}

void sub_80B2F08(ProcPtr proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

void sub_80B2F2C(ProcPtr proc) {

    sub_80ADDD4(proc);
    sub_80B29B8(3);

    return;
}

ProcPtr sub_80B2F3C(ProcPtr parent, struct ClassReelEnt* entry) {
    struct OpInfoEnterProc* proc = Proc_Start(gUnknown_08A2EF50, parent);

    proc->unk_3c = parent;
    proc->unk_40 = entry;

    return proc;
}

void sub_80B2F58(struct OpInfoViewProc* proc) {
    proc->unk_2a = 0;
    proc->unk_2e =  ((struct OpInfoEnterProc*)(proc->proc_parent))->unk_2c + (proc->unk_2c * 0xC);
    return;
}

#if NONMATCHING

void sub_80B2F74(struct OpInfoViewProc* proc) {

    int c;
    int a = ((DarknessCoeff(proc->unk_2a, 4)) * 2);
    u8 r5 = proc->unk_2c;

    int r2 = proc->unk_2e;
    r2 -= a;

    c = 0x18;

    sub_80B2A14(
        r5,
        r2,
        c,
        proc->unk_2a,
        0x100,
        DarknessCoeff(proc->unk_2a, 4)
    );

    if ((proc->unk_2a += 0x10) == 0x100) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80B2F74(struct OpInfoViewProc* proc) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        sub sp, #8\n\
        adds r4, r0, #0\n\
        ldrh r3, [r4, #0x2A]\n\
        adds r1, r3, #0\n\
        asrs r1, r1, #4\n\
        movs r0, #0x10\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #1\n\
        adds r1, r4, #0\n\
        adds r1, #0x2C\n\
        ldrb r5, [r1]\n\
        movs r2, #0x2E\n\
        ldrsh r1, [r4, r2]\n\
        subs r2, r1, r0\n\
        movs r6, #0x80\n\
        lsls r6, r6, #1\n\
        str r6, [sp]\n\
        ldrh r0, [r4, #0x2A]\n\
        asrs r0, r0, #4\n\
        movs r1, #0x10\n\
        subs r1, r1, r0\n\
        lsls r1, r1, #0x18\n\
        lsrs r1, r1, #0x18\n\
        str r1, [sp, #4]\n\
        adds r0, r5, #0\n\
        adds r1, r2, #0\n\
        movs r2, #0x18\n\
        bl sub_80B2A14\n\
        ldrh r0, [r4, #0x2A]\n\
        adds r0, #0x10\n\
        strh r0, [r4, #0x2A]\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        cmp r0, r6\n\
        bne _080B2FC8\n\
        movs r0, #0\n\
        strh r0, [r4, #0x2A]\n\
        adds r0, r4, #0\n\
        bl Proc_Break\n\
    _080B2FC8:\n\
        add sp, #8\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING

void sub_80B2FD0(struct OpInfoViewProc* proc) {

    sub_80B2A14(proc->unk_2c, proc->unk_2e, 0x18, 0x100, 0x100, 0);

    proc->unk_2a = 0;

    return;
}

#if NONMATCHING

void sub_80B2FF8(struct OpInfoViewProc* proc) {

    sub_80B2A14(
        proc->unk_2c,
        proc->unk_2e,
        0x18,
        proc->unk_2a + 0x100,
        0x100 - proc->unk_2a,
        DarknessCoeff(proc->unk_2a, 4)
    );

    if (proc->unk_2a == 0x100) {
        ((struct OpInfoEnterProc*)(proc->proc_parent))->unk_34[proc->unk_2c] = 0;

        Proc_Break(proc);
    }

    proc->unk_2a = proc->unk_2a + 8;

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80B2FF8(struct OpInfoViewProc* proc) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        sub sp, #8\n\
        adds r4, r0, #0\n\
        ldrh r0, [r4, #0x2A]\n\
        movs r5, #0x80\n\
        lsls r5, r5, #1\n\
        adds r1, r0, r5\n\
        subs r0, r5, r0\n\
        adds r7, r4, #0\n\
        adds r7, #0x2C\n\
        ldrb r2, [r7]\n\
        movs r6, #0x2E\n\
        ldrsh r3, [r4, r6]\n\
        lsls r1, r1, #0x10\n\
        lsrs r6, r1, #0x10\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        str r0, [sp]\n\
        ldrh r0, [r4, #0x2A]\n\
        asrs r0, r0, #4\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        str r0, [sp, #4]\n\
        adds r0, r2, #0\n\
        adds r1, r3, #0\n\
        movs r2, #0x18\n\
        adds r3, r6, #0\n\
        bl sub_80B2A14\n\
        ldrh r0, [r4, #0x2A]\n\
        cmp r0, r5\n\
        bne _080B304C\n\
        ldr r1, [r4, #0x14]\n\
        ldrb r0, [r7]\n\
        ldr r1, [r1, #0x34]\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r1\n\
        movs r1, #0\n\
        str r1, [r0]\n\
        adds r0, r4, #0\n\
        bl Proc_Break\n\
    _080B304C:\n\
        ldrh r0, [r4, #0x2A]\n\
        adds r0, #8\n\
        strh r0, [r4, #0x2A]\n\
        add sp, #8\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

ProcPtr sub_80B305C(ProcPtr parent, u8 index) {
    struct OpInfoViewProc* proc = Proc_Start(gUnknown_08A2EFC0, parent);

    proc->unk_2c = index;

    return proc;
}

void sub_80B307C(void) {
    EnablePaletteSync();

    return;
}

void sub_80B3088(struct OpInfoIconProc* proc) {

    int i;

    proc->unk_2a = 0;

    for (i = 0; i < 0x10; i++) {
        gPaletteBuffer[0x1F0 + i] = 0;
        gPaletteBuffer[0x40  + i] = 0;
    }

    proc->unk_2e = 0;

    proc->unk_2d = 0;

    for (i = 0; i < 8; i++) {
        const struct ClassData* class = GetClassData(proc->unk_2c);

        if (class->baseRanks[i] == 0) {
            continue;
        }

        proc->unk_2e |= 1 << i;
        proc->unk_2d++;
    }

    EnablePaletteSync();

    return;
}

void sub_80B30FC(u8 a, u8 b, u8 c) {
    int i;
    int tmp;
    int tmp2;
    u16** object;

    for (i = 0; i < 0x10; i++) {
        u16 color; 

        if ((a + i) < 0x10) {
            color = a + i;
        } else {
            color = 0xF;
        }
        
        gPaletteBuffer[((0xF + 0x10) * 0x10) + i] = gPaletteBuffer[((0xE + 0x10) * 0x10) + color];
        gPaletteBuffer[(4 * 0x10) + i] = gPaletteBuffer[((0xE + 0x10) * 0x10) + color];
    }

    EnablePaletteSync();

    tmp = ((8 - (b)) << 4);

    for (i = 0, object = gUnknown_08A2F1D0, tmp2 = tmp - 8; i < 8; object++, i++) {
        if (((c >> i) & 1) != 0) {
            PutSpriteExt(4, (tmp2) & 0x1FF, 0x50, *object, 0xF000);
            tmp2 += 0x20;
        }

    }

    return;
}

void sub_80B31B0(struct OpInfoIconProc* proc) {
    u8 unk;

    proc->unk_2a++;

    if (proc->unk_2a >= 0x21) {
        unk = 0;
        Proc_Break(proc);
    } else {
        unk = 0x10 - (proc->unk_2a >> 1);
    }

    sub_80B30FC(unk, proc->unk_2d, proc->unk_2e);

    return;
}

void sub_80B31EC(struct OpInfoIconProc* proc) {

    sub_80B30FC(0, proc->unk_2d, proc->unk_2e);

    proc->unk_2a = 0;

    return;
}

void sub_80B3208(struct OpInfoIconProc* proc) {
    proc->unk_2a++;

    if ((proc->unk_2a >> 1) >= 0x11) {
        gLCDControlBuffer.dispcnt.bg0_on = 0;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 0;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 1;

        Proc_Break(proc);
    } else {
        sub_80B30FC((proc->unk_2a >> 1), proc->unk_2d, proc->unk_2e);
    }

    return;
}

ProcPtr sub_80B325C(ProcPtr parent, u8 unk) {
    struct OpInfoIconProc* proc;

    proc = Proc_Start(gUnknown_08A2EFF8, parent);
    proc->unk_2c = unk;

    return proc;
}

void sub_80B327C(struct OpInfo8A2F038Proc* proc) {
    proc->unk_4c = 0;
    proc->unk_4e = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

void sub_80B32AC(struct OpInfo8A2F038Proc* proc) {
    int unkA;
    int unkB;
    int unkC;
    int unkD;

    if (proc->unk_4c < 0x1E) {
        unkA = Interpolate(5, 4, 0x32, proc->unk_4c, 0x1E);
        unkB = Interpolate(4, 0, 0x10, proc->unk_4c, 0x1E);
    } else {
        unkA = Interpolate(0, 0x32, 100, proc->unk_4c - 0x1E, 0x1E);
        unkB = Interpolate(0, 0x10, 0, proc->unk_4c - 0x1E, 0x1E);
    }

    if (0x31 < unkA) {
        unkA = 100 - unkA;
    }

    unkC = Interpolate(0, 0, 0xD6, proc->unk_4c, 0x3C);
    unkD = Interpolate(0, 0x10, 0x80, proc->unk_4c, 0x3C);

    sub_80ADDFC(2, proc->unk_4e, 0, 0, (s16)(unkA * 5 + 0x80), (s16)(unkA * 5 + 0x80));

    sub_80ADE90(2, 0x100, 0x100);

    sub_80ADEE0(2, (s16)unkC, (s16)unkD, 0x50, 0x48);

    proc->unk_4e -= 0x40;

    SetSpecialColorEffectsParameters(1, unkB, 0x10, 0);

    proc->unk_4c++;

    if (0x3B < proc->unk_4c) {
        Proc_Break(proc);

        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 0;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 1;
    }

    return;
}

void sub_80B33E4(struct OpInfo8A2F068Proc* proc) {
    proc->unk_4c = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}

void sub_80B33FC(struct OpInfo8A2F068Proc* proc, int b, int c, int d) {

    int x = Interpolate(5, 0x78, c, proc->unk_4c, 0x46);
    int y = Interpolate(5, 0x50, d, proc->unk_4c, 0x46);

    PutSpriteExt(4, ((x - 8) & 0x1FF) | (b << 9), ((y - 8) & 0x1FF) | 0x100, gUnknown_08A2F1F0, 0xF000);

    PutSpriteExt(4, ((0xE8 - x) & 0x1FF) | (b << 9), ((0x98 - y) & 0x1FF) | 0x100, gUnknown_08A2F1F0, 0xF000);

    return;
}

void sub_80B3498(struct OpInfo8A2F068Proc* proc) {
    int scale;

    if (proc->unk_64 < 0x47) {
        scale = Interpolate(4, 0x120, 0x10, proc->unk_64, 0x46);

        WriteOAMRotScaleData(
            0x15,
            Div(+COS(0) << 4, scale),
            Div(-SIN(0) << 4, scale),
            Div(+SIN(0) << 4, scale),
            Div(+COS(0) << 4, scale)
        );

        proc->unk_64++;
    }

    sub_80B33FC(proc, 0x15, 0xD7, 0x11);

    if (proc->unk_66 < 0x47) {
        scale = Interpolate(0, 0x120, 0x10, proc->unk_66, 0x46);

        WriteOAMRotScaleData(
            0x16,
            Div(+COS(0) << 4, scale),
            Div(-SIN(0) << 4, scale),
            Div(+SIN(0) << 4, scale),
            Div(+COS(0) << 4, scale)
        );

        proc->unk_66++;
    }

    sub_80B33FC(proc, 0x16, 0xC0, 0x20);

    if (proc->unk_68 < 0x47) {
        scale = Interpolate(1, 0x120, 0x10, proc->unk_68, 0x46);

        WriteOAMRotScaleData(
            0x17,
            Div(+COS(0) << 4, scale),
            Div(-SIN(0) << 4, scale),
            Div(+SIN(0) << 4, scale),
            Div(+COS(0) << 4, scale)
        );

        proc->unk_68++;
    }

    sub_80B33FC(proc, 0x17, 0xA9, 0x2F);

    proc->unk_4c++;

    if (proc->unk_68 > 0x46) {
        Proc_Break(proc);
    }

    return;
}

signed char* sub_80B369C(u8 classId, signed char* buffer) {
    char* str;

    const struct ClassData* class = GetClassData(classId);
    if (buffer == NULL) {
        buffer = GetStringFromIndex(class->nameTextId);
    } else {
        GetStringFromIndexInBuffer(class->nameTextId, buffer);
    }

    str = strstr(buffer, gUnknown_08205ED0);
    if (str != NULL) {
        sprintf(str, gUnknown_08205ED4);
    }

    return buffer;
}

void sub_80B36E0(void) {
    u16 vcount = (REG_VCOUNT + 1);

    if (vcount < 0x6E) {

        REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 2;
        REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 2;

        return;
    }


    REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 1;
    REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 1;

    return;
}

void sub_80B3740(void) {

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = 0xF0;
    gLCDControlBuffer.win0_bottom = 0xA0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    return;
}

struct Unk2000000 {
    u8 unk_00;
    u8 unk_01;
    u16 unk_02;
    u16 unk_04;
    u16 unk_06;
    u16 unk_08;
    u16 unk_0A;
    u16 unk_0C;
    u16 unk_0E;
    u16 unk_10;
    void* unk_14;
    void* unk_18;
    void* unk_1C;
    void* unk_20;
    void* unk_24;
    void* unk_28;
    int unk_2C;
    void* unk_30;
    ProcPtr unk_34;
};

extern struct Unk2000000 gUnknown_02000000;

struct Unk200A2D8 {
    u16 unk_00;
    u16 unk_02;
    u16 unk_04;
    u16 unk_06;
    u16 unk_08;
    u16 unk_0A;
    u16 unk_0C;
    u16 unk_0E;
    u16 unk_10;
    u16 unk_12;
    void* unk_14;
    void* unk_18;
    void* unk_1C;
    void* unk_20;
    void* unk_24;
};

extern struct Unk200A2D8 gUnknown_0200A2D8;

struct Unk201DB00 {
    u16 unk_00;
    u16 unk_02;
    u16 unk_04;
    u16 unk_06;
    u16 unk_08;
    u16 unk_0A;
    u16 unk_0C;
    u16 unk_0E;
    int unk_10;
    int unk_14;
    int unk_18;
    void* unk_1C;
    void* unk_20;
};

extern struct Unk201DB00 gUnknown_0201DB00;

extern int gUnknown_08205EDC[2][6];

ProcPtr sub_80B40D0(ProcPtr);

extern u8 gUnknown_02000038[];
extern u8 gUnknown_02002038[];
extern u8 gUnknown_02007838[];
extern u8 gUnknown_020078D8[];

extern u8 gUnknown_0200A300[];
extern u8 gUnknown_0200C300[];
extern u8 gUnknown_0200CB00[];

extern struct TextHandle gUnknown_0201FB28[6];

void sub_805AA00(struct Unk200A2D8*);

extern u8 gUnknown_0201DB28[];
void sub_805AA68(struct Unk201DB00*);
void sub_805AE40(struct Unk201DB00*, int, int, int, int);

#if NONMATCHING

void sub_80B37FC(struct OpInfoClassDisplayProc* proc) {
    int hack[2][6];
    int i;
    int hasMagicRank;
    int r5;

    hasMagicRank = 0;

    memcpy(hack, gUnknown_08205EDC, 12*4);

    proc->unk_38 = proc->unk_34->unk_14;

    for (i = 4; i <= 7; i++) {

        if ((GetClassData(proc->unk_34->unk_05)->baseRanks[i]) != 0) {
            hasMagicRank = 1;
            break;
        }

    }

    SetupBackgrounds(0);

    proc->unk_2a = 0;
    proc->unk_2c = 0;

    proc->unk_46 = 0xFA;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetDefaultColorEffects();

    Font_ResetAllocation();

    Font_InitForUIDefault();

    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    CopyDataWithPossibleUncomp(gUnknown_08A30E2C, (void *)(GetBackgroundTileDataOffset(3) + 0x6000000));
    CopyToPaletteBuffer(gUnknown_08A3593C, 0xE0, 0x100);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A35488, 0x7000);

    CopyDataWithPossibleUncomp(gUnknown_08A30800, (void *)(GetBackgroundTileDataOffset(2) + 0x6000000));
    CopyToPaletteBuffer(gUiFramePaletteA, 0xC0, 0x20);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_08A30978, 0x6000);

    BG_EnableSyncByMask(0xF);

    BG_Fill(gBG0TilemapBuffer, 0);

    proc->unk_40[0] = GetClassData(proc->unk_34->unk_05)->baseHP;
    proc->unk_40[1] = GetClassData(proc->unk_34->unk_05)->basePow;
    proc->unk_40[2] = GetClassData(proc->unk_34->unk_05)->baseSkl;
    proc->unk_40[3] = GetClassData(proc->unk_34->unk_05)->baseSpd;
    proc->unk_40[4] = GetClassData(proc->unk_34->unk_05)->baseDef;
    proc->unk_40[5] = GetClassData(proc->unk_34->unk_05)->baseRes;

    for (i = 0; i <= 5; i++) {

        Text_Init(&gUnknown_0201FB28[i], 3);

        Text_Clear(&gUnknown_0201FB28[i]);

        Text_SetColorId(&gUnknown_0201FB28[i], 3);
        Text_SetXCursor(&gUnknown_0201FB28[i], 0);

        if (hasMagicRank != 0) {
            Text_AppendString(&gUnknown_0201FB28[i], GetStringFromIndex(hack[1][i]));
        } else {
            Text_AppendString(&gUnknown_0201FB28[i], GetStringFromIndex(hack[0][i]));
        }

        Text_Draw(&gUnknown_0201FB28[i], gBG0TilemapBuffer + 0x21 + (i * 0x40));

        sub_8004B88((gBG0TilemapBuffer + 0x25 + (i * 0x40)), 0, proc->unk_40[i]);
    }

    r5 = 0; // ?

    proc->unk_3c = sub_80B40D0(proc);

    sub_800680C(0x100, 2, 0);

    sub_8006978();
    sub_8008250();
    sub_8006A7C();

    sub_8006A30(2, 0xF, proc->unk_34->unk_00);

    sub_8006B10(0);

    sub_8006AA8(1);
    sub_8006AA8(2);
    sub_8006AA8(4);
    sub_8006AA8(8);
    sub_8006AA8(0x40);

    sub_8006AF0(4);

    gUnknown_02000000.unk_08 = proc->unk_34->unk_04;
    gUnknown_02000000.unk_02 = 0x104;
    gUnknown_02000000.unk_04 = 0x58;
    gUnknown_02000000.unk_06 = proc->unk_34->unk_07;
    gUnknown_02000000.unk_0A = 6;
    gUnknown_02000000.unk_01 = proc->unk_34->unk_06;
    gUnknown_02000000.unk_0C = 1;
    gUnknown_02000000.unk_0E = 0x180;
    gUnknown_02000000.unk_10 = 2;
    gUnknown_02000000.unk_1C = gUnknown_02000038;
    gUnknown_02000000.unk_24 = gUnknown_02002038;
    gUnknown_02000000.unk_20 = gUnknown_02007838;
    gUnknown_02000000.unk_28 = gUnknown_020078D8;

    gUnknown_02000000.unk_30 = &gUnknown_0200A2D8;

    gUnknown_0200A2D8.unk_00 = proc->unk_34->unk_08;
    gUnknown_0200A2D8.unk_02 = proc->unk_34->unk_09;
    gUnknown_0200A2D8.unk_04 = proc->unk_34->unk_0A;
    gUnknown_0200A2D8.unk_06 = proc->unk_34->unk_0B;
    gUnknown_0200A2D8.unk_08 = proc->unk_34->unk_0C;
    gUnknown_0200A2D8.unk_0E = 0x280;
    gUnknown_0200A2D8.unk_10 = 0xF;
    gUnknown_0200A2D8.unk_0A = 0x200;
    gUnknown_0200A2D8.unk_0C = 0xF;
    gUnknown_0200A2D8.unk_12 = 1;
    gUnknown_0200A2D8.unk_14 = gBG1TilemapBuffer;
    gUnknown_0200A2D8.unk_18 = gUnknown_0200A300;
    gUnknown_0200A2D8.unk_1C = gUnknown_0200C300;
    gUnknown_0200A2D8.unk_20 = gUnknown_0200CB00;
    gUnknown_0200A2D8.unk_24 = sub_80B3740;

    sub_805AA00(&gUnknown_0200A2D8);

    gUnknown_0201DB00.unk_00 = proc->unk_34->unk_0D;
    gUnknown_0201DB00.unk_02 = 10;
    gUnknown_0201DB00.unk_04 = 0x380;
    gUnknown_0201DB00.unk_06 = proc->unk_34->unk_0E;
    gUnknown_0201DB00.unk_08 = 0xB;
    gUnknown_0201DB00.unk_0A = 0x3C0;
    gUnknown_0201DB00.unk_0C = r5;
    gUnknown_0201DB00.unk_0E = 0xFFFF;

    gUnknown_0201DB00.unk_1C = (void*)0x06010000;
    gUnknown_0201DB00.unk_20 = &gUnknown_0201DB28;

    sub_805AA68(&gUnknown_0201DB00);
    sub_805AE40(&gUnknown_0201DB00, 0xD0, 0x68, 0x130, 0x68);

    SetPrimaryHBlankHandler(sub_80B36E0);

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80B37FC(struct OpInfoClassDisplayProc* proc) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x3C\n\
        mov r9, r0\n\
        movs r0, #0\n\
        str r0, [sp, #0x34]\n\
        add r1, sp, #4\n\
        ldr r0, _080B3830  @ gUnknown_08205EDC\n\
        ldm r0!, {r2, r3, r4}\n\
        stm r1!, {r2, r3, r4}\n\
        ldm r0!, {r2, r3, r4}\n\
        stm r1!, {r2, r3, r4}\n\
        ldm r0!, {r2, r3, r4}\n\
        stm r1!, {r2, r3, r4}\n\
        ldm r0!, {r2, r3, r4}\n\
        stm r1!, {r2, r3, r4}\n\
        mov r1, r9\n\
        ldr r0, [r1, #0x34]\n\
        ldr r0, [r0, #0x10]\n\
        str r0, [r1, #0x38]\n\
        movs r7, #4\n\
        b _080B3836\n\
        .align 2, 0\n\
    _080B3830: .4byte gUnknown_08205EDC\n\
    _080B3834:\n\
        adds r7, #1\n\
    _080B3836:\n\
        cmp r7, #7\n\
        bgt _080B3852\n\
        mov r2, r9\n\
        ldr r0, [r2, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        adds r0, #0x2C\n\
        adds r0, r0, r7\n\
        ldrb r0, [r0]\n\
        cmp r0, #0\n\
        beq _080B3834\n\
        movs r3, #1\n\
        str r3, [sp, #0x34]\n\
    _080B3852:\n\
        movs r0, #0\n\
        bl SetupBackgrounds\n\
        movs r0, #0\n\
        mov r4, r9\n\
        strh r0, [r4, #0x2A]\n\
        strh r0, [r4, #0x2C]\n\
        mov r1, r9\n\
        adds r1, #0x46\n\
        movs r0, #0xFA\n\
        strb r0, [r1]\n\
        ldr r6, _080B3A28  @ gBG0TilemapBuffer\n\
        adds r0, r6, #0\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        ldr r0, _080B3A2C  @ gBG1TilemapBuffer\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        ldr r0, _080B3A30  @ gBG2TilemapBuffer\n\
        mov r8, r0\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        ldr r4, _080B3A34  @ gLCDControlBuffer\n\
        ldrb r1, [r4, #1]\n\
        movs r0, #2\n\
        negs r0, r0\n\
        ands r0, r1\n\
        movs r1, #3\n\
        negs r1, r1\n\
        ands r0, r1\n\
        subs r1, #2\n\
        ands r0, r1\n\
        subs r1, #4\n\
        ands r0, r1\n\
        subs r1, #8\n\
        ands r0, r1\n\
        strb r0, [r4, #1]\n\
        ldrb r1, [r4]\n\
        movs r0, #8\n\
        negs r0, r0\n\
        ands r0, r1\n\
        strb r0, [r4]\n\
        bl SetDefaultColorEffects\n\
        bl Font_ResetAllocation\n\
        bl Font_InitForUIDefault\n\
        ldrb r2, [r4, #0xC]\n\
        movs r1, #4\n\
        negs r1, r1\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        movs r3, #2\n\
        orrs r0, r3\n\
        strb r0, [r4, #0xC]\n\
        ldrb r2, [r4, #0x10]\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        orrs r0, r3\n\
        strb r0, [r4, #0x10]\n\
        ldrb r0, [r4, #0x14]\n\
        ands r1, r0\n\
        orrs r1, r3\n\
        strb r1, [r4, #0x14]\n\
        ldrb r0, [r4, #0x18]\n\
        movs r1, #3\n\
        orrs r0, r1\n\
        strb r0, [r4, #0x18]\n\
        movs r0, #0\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        movs r0, #1\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        movs r0, #2\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        movs r0, #3\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        ldr r4, _080B3A38  @ gUnknown_08A30E2C\n\
        movs r0, #3\n\
        bl GetBackgroundTileDataOffset\n\
        adds r1, r0, #0\n\
        movs r5, #0xC0\n\
        lsls r5, r5, #0x13\n\
        adds r1, r1, r5\n\
        adds r0, r4, #0\n\
        bl CopyDataWithPossibleUncomp\n\
        ldr r0, _080B3A3C  @ gUnknown_08A3593C\n\
        movs r2, #0x80\n\
        lsls r2, r2, #1\n\
        movs r1, #0xE0\n\
        bl CopyToPaletteBuffer\n\
        ldr r0, _080B3A40  @ gBG3TilemapBuffer\n\
        ldr r1, _080B3A44  @ gUnknown_08A35488\n\
        movs r2, #0xE0\n\
        lsls r2, r2, #7\n\
        bl CallARM_FillTileRect\n\
        ldr r4, _080B3A48  @ gUnknown_08A30800\n\
        movs r0, #2\n\
        bl GetBackgroundTileDataOffset\n\
        adds r1, r0, #0\n\
        adds r1, r1, r5\n\
        adds r0, r4, #0\n\
        bl CopyDataWithPossibleUncomp\n\
        ldr r0, _080B3A4C  @ gUiFramePaletteA\n\
        movs r1, #0xC0\n\
        movs r2, #0x20\n\
        bl CopyToPaletteBuffer\n\
        ldr r1, _080B3A50  @ gUnknown_08A30978\n\
        movs r2, #0xC0\n\
        lsls r2, r2, #7\n\
        mov r0, r8\n\
        bl CallARM_FillTileRect\n\
        movs r0, #0xF\n\
        bl BG_EnableSyncByMask\n\
        adds r0, r6, #0\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        mov r1, r9\n\
        ldr r0, [r1, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        ldrb r0, [r0, #0xB]\n\
        mov r4, r9\n\
        adds r4, #0x40\n\
        strb r0, [r4]\n\
        mov r2, r9\n\
        ldr r0, [r2, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        ldrb r0, [r0, #0xC]\n\
        mov r1, r9\n\
        adds r1, #0x41\n\
        strb r0, [r1]\n\
        mov r3, r9\n\
        ldr r0, [r3, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        ldrb r0, [r0, #0xD]\n\
        mov r1, r9\n\
        adds r1, #0x42\n\
        strb r0, [r1]\n\
        mov r1, r9\n\
        ldr r0, [r1, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        ldrb r0, [r0, #0xE]\n\
        mov r1, r9\n\
        adds r1, #0x43\n\
        strb r0, [r1]\n\
        mov r2, r9\n\
        ldr r0, [r2, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        ldrb r1, [r0, #0xF]\n\
        mov r0, r9\n\
        adds r0, #0x44\n\
        strb r1, [r0]\n\
        mov r3, r9\n\
        ldr r0, [r3, #0x34]\n\
        ldrb r0, [r0, #5]\n\
        bl GetClassData\n\
        ldrb r0, [r0, #0x10]\n\
        mov r1, r9\n\
        adds r1, #0x45\n\
        strb r0, [r1]\n\
        movs r7, #0\n\
        str r4, [sp, #0x38]\n\
        movs r4, #0x4A\n\
        adds r4, r4, r6\n\
        mov sl, r4\n\
        adds r6, #0x42\n\
        mov r8, r6\n\
        movs r6, #0\n\
        movs r4, #0\n\
    _080B39EC:\n\
        ldr r0, _080B3A54  @ gUnknown_0201FB28\n\
        adds r5, r4, r0\n\
        adds r0, r5, #0\n\
        movs r1, #3\n\
        bl Text_Init\n\
        adds r0, r5, #0\n\
        bl Text_Clear\n\
        adds r0, r5, #0\n\
        movs r1, #3\n\
        bl Text_SetColorId\n\
        adds r0, r5, #0\n\
        movs r1, #0\n\
        bl Text_SetXCursor\n\
        ldr r0, [sp, #0x34]\n\
        cmp r0, #0\n\
        beq _080B3A58\n\
        add r0, sp, #0x1C\n\
        adds r0, r0, r6\n\
        ldr r0, [r0]\n\
        bl GetStringFromIndex\n\
        adds r1, r0, #0\n\
        adds r0, r5, #0\n\
        bl Text_AppendString\n\
        b _080B3A6C\n\
        .align 2, 0\n\
    _080B3A28: .4byte gBG0TilemapBuffer\n\
    _080B3A2C: .4byte gBG1TilemapBuffer\n\
    _080B3A30: .4byte gBG2TilemapBuffer\n\
    _080B3A34: .4byte gLCDControlBuffer\n\
    _080B3A38: .4byte gUnknown_08A30E2C\n\
    _080B3A3C: .4byte gUnknown_08A3593C\n\
    _080B3A40: .4byte gBG3TilemapBuffer\n\
    _080B3A44: .4byte gUnknown_08A35488\n\
    _080B3A48: .4byte gUnknown_08A30800\n\
    _080B3A4C: .4byte gUiFramePaletteA\n\
    _080B3A50: .4byte gUnknown_08A30978\n\
    _080B3A54: .4byte gUnknown_0201FB28\n\
    _080B3A58:\n\
        mov r0, sp\n\
        adds r0, r0, r6\n\
        adds r0, #4\n\
        ldr r0, [r0]\n\
        bl GetStringFromIndex\n\
        adds r1, r0, #0\n\
        adds r0, r5, #0\n\
        bl Text_AppendString\n\
    _080B3A6C:\n\
        ldr r0, _080B3BD0  @ gUnknown_0201FB28\n\
        adds r0, r4, r0\n\
        mov r1, r8\n\
        bl Text_Draw\n\
        ldr r1, [sp, #0x38]\n\
        adds r0, r1, r7\n\
        ldrb r2, [r0]\n\
        mov r0, sl\n\
        movs r1, #0\n\
        bl sub_8004B88\n\
        movs r2, #0x80\n\
        add sl, r2\n\
        add r8, r2\n\
        adds r6, #4\n\
        adds r4, #8\n\
        adds r7, #1\n\
        cmp r7, #5\n\
        ble _080B39EC\n\
        movs r5, #0\n\
        mov r0, r9\n\
        bl sub_80B40D0\n\
        mov r3, r9\n\
        str r0, [r3, #0x3C]\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        movs r1, #2\n\
        movs r2, #0\n\
        bl sub_800680C\n\
        bl sub_8006978\n\
        bl sub_8008250\n\
        bl sub_8006A7C\n\
        mov r4, r9\n\
        ldr r0, [r4, #0x34]\n\
        ldr r2, [r0]\n\
        movs r0, #2\n\
        movs r1, #0xF\n\
        bl sub_8006A30\n\
        movs r0, #0\n\
        bl sub_8006B10\n\
        movs r0, #1\n\
        bl sub_8006AA8\n\
        movs r0, #2\n\
        bl sub_8006AA8\n\
        movs r0, #4\n\
        bl sub_8006AA8\n\
        movs r0, #8\n\
        bl sub_8006AA8\n\
        movs r0, #0x40\n\
        bl sub_8006AA8\n\
        movs r0, #4\n\
        bl sub_8006AF0\n\
        ldr r0, _080B3BD4  @ gUnknown_02000000\n\
        ldr r3, [r4, #0x34]\n\
        movs r1, #4\n\
        ldrsb r1, [r3, r1]\n\
        strh r1, [r0, #8]\n\
        movs r1, #0x82\n\
        lsls r1, r1, #1\n\
        strh r1, [r0, #2]\n\
        movs r1, #0x58\n\
        strh r1, [r0, #4]\n\
        ldrb r1, [r3, #7]\n\
        strh r1, [r0, #6]\n\
        movs r1, #6\n\
        strh r1, [r0, #0xA]\n\
        ldrb r1, [r3, #6]\n\
        strb r1, [r0, #1]\n\
        movs r4, #1\n\
        strh r4, [r0, #0xC]\n\
        movs r1, #0xC0\n\
        lsls r1, r1, #1\n\
        strh r1, [r0, #0xE]\n\
        movs r1, #2\n\
        strh r1, [r0, #0x10]\n\
        ldr r1, _080B3BD8  @ gUnknown_02000038\n\
        str r1, [r0, #0x1C]\n\
        ldr r1, _080B3BDC  @ gUnknown_02002038\n\
        str r1, [r0, #0x24]\n\
        ldr r1, _080B3BE0  @ gUnknown_02007838\n\
        str r1, [r0, #0x20]\n\
        ldr r1, _080B3BE4  @ gUnknown_020078D8\n\
        str r1, [r0, #0x28]\n\
        ldr r1, _080B3BE8  @ gUnknown_0200A2D8\n\
        str r1, [r0, #0x30]\n\
        ldrb r2, [r3, #8]\n\
        strh r2, [r1]\n\
        ldrb r2, [r3, #9]\n\
        strh r2, [r1, #2]\n\
        ldrb r2, [r3, #0xA]\n\
        strh r2, [r1, #4]\n\
        ldrb r2, [r3, #0xB]\n\
        strh r2, [r1, #6]\n\
        ldrb r2, [r3, #0xC]\n\
        strh r2, [r1, #8]\n\
        movs r2, #0xA0\n\
        lsls r2, r2, #2\n\
        strh r2, [r1, #0xE]\n\
        movs r3, #0xF\n\
        strh r3, [r1, #0x10]\n\
        subs r2, #0x80\n\
        strh r2, [r1, #0xA]\n\
        strh r3, [r1, #0xC]\n\
        strh r4, [r1, #0x12]\n\
        ldr r2, _080B3BEC  @ gBG1TilemapBuffer\n\
        str r2, [r1, #0x14]\n\
        ldr r2, _080B3BF0  @ gUnknown_0200A300\n\
        str r2, [r1, #0x18]\n\
        ldr r2, _080B3BF4  @ gUnknown_0200C300\n\
        str r2, [r1, #0x1C]\n\
        ldr r2, _080B3BF8  @ gUnknown_0200CB00\n\
        str r2, [r1, #0x20]\n\
        ldr r2, _080B3BFC  @ sub_80B3740\n\
        str r2, [r1, #0x24]\n\
        bl sub_805AA00\n\
        ldr r4, _080B3C00  @ gUnknown_0201DB00\n\
        mov r0, r9\n\
        ldr r1, [r0, #0x34]\n\
        ldrb r0, [r1, #0xD]\n\
        strh r0, [r4]\n\
        movs r0, #0xA\n\
        strh r0, [r4, #2]\n\
        movs r0, #0xE0\n\
        lsls r0, r0, #2\n\
        strh r0, [r4, #4]\n\
        ldrb r0, [r1, #0xE]\n\
        strh r0, [r4, #6]\n\
        movs r0, #0xB\n\
        strh r0, [r4, #8]\n\
        movs r0, #0xF0\n\
        lsls r0, r0, #2\n\
        strh r0, [r4, #0xA]\n\
        strh r5, [r4, #0xC]\n\
        ldr r0, _080B3C04  @ 0x0000FFFF\n\
        strh r0, [r4, #0xE]\n\
        ldr r0, _080B3C08  @ 0x06010000\n\
        str r0, [r4, #0x1C]\n\
        ldr r0, _080B3C0C  @ gUnknown_0201DB28\n\
        str r0, [r4, #0x20]\n\
        adds r0, r4, #0\n\
        bl sub_805AA68\n\
        movs r3, #0x98\n\
        lsls r3, r3, #1\n\
        movs r0, #0x68\n\
        str r0, [sp]\n\
        adds r0, r4, #0\n\
        movs r1, #0xD0\n\
        movs r2, #0x68\n\
        bl sub_805AE40\n\
        ldr r0, _080B3C10  @ sub_80B36E0\n\
        bl SetPrimaryHBlankHandler\n\
        add sp, #0x3C\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080B3BD0: .4byte gUnknown_0201FB28\n\
    _080B3BD4: .4byte gUnknown_02000000\n\
    _080B3BD8: .4byte gUnknown_02000038\n\
    _080B3BDC: .4byte gUnknown_02002038\n\
    _080B3BE0: .4byte gUnknown_02007838\n\
    _080B3BE4: .4byte gUnknown_020078D8\n\
    _080B3BE8: .4byte gUnknown_0200A2D8\n\
    _080B3BEC: .4byte gBG1TilemapBuffer\n\
    _080B3BF0: .4byte gUnknown_0200A300\n\
    _080B3BF4: .4byte gUnknown_0200C300\n\
    _080B3BF8: .4byte gUnknown_0200CB00\n\
    _080B3BFC: .4byte sub_80B3740\n\
    _080B3C00: .4byte gUnknown_0201DB00\n\
    _080B3C04: .4byte 0x0000FFFF\n\
    _080B3C08: .4byte 0x06010000\n\
    _080B3C0C: .4byte gUnknown_0201DB28\n\
    _080B3C10: .4byte sub_80B36E0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_80B3C14(struct OpInfoClassDisplayProc* proc) {

    if (proc->unk_2c == 400) {

        if (sub_80B2988() != 0) {
            Sound_FadeOutBGM(0x3C);
            Proc_Goto(proc, 7);
        } else {
            Proc_Goto(proc, 4);
        }
    }

    proc->unk_2c++;

    return;
}

void sub_80B3C50(struct OpInfoClassDisplayProc* proc) {

    int unk;

    u8* ptr = &proc->unk_46;

    unk = ~((0x50 - proc->unk_2a) / 0xE);

    proc->unk_46 = unk + *ptr;

    if (proc->unk_46 < 0xB4) {
        proc->unk_46 = 0xB4;
    }

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0x50 - proc->unk_2a;
    gLCDControlBuffer.win0_right = 0xF0;
    gLCDControlBuffer.win0_bottom = proc->unk_2a + 0x50;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    if (proc->unk_2a == 0x50) {
        proc->unk_46 = 0xB4;
        proc->unk_2a = 0;
        
        Proc_Break(proc);
        
        Get6CDifferedLoop6C(sub_80B3C14, proc);
    } else {
        proc->unk_2a += 4;
    }

    sub_805A940(&gUnknown_02000000, proc->unk_46, 0x58);
    sub_805AE40(&gUnknown_0201DB00, proc->unk_46 - 0x30, 0x68, proc->unk_46 + 0x30, 0x68);

    sub_80B40E4(proc->unk_3c, 100);

    return;
}

struct Idk {
    u8 idk;
    u8 unk_01;
} __attribute__((packed));

void sub_80B3D84(struct OpInfoClassDisplayProc* proc) {
    switch (((struct Idk*)(proc->unk_38))->idk) {
        case 0:
            Proc_Goto(proc, 0xA);

            break;

        case 1:
            gUnknown_02000000.unk_0A = 0;
            sub_805A7B4(&gUnknown_02000000);

            break;

        case 2:
            gUnknown_02000000.unk_0A = 1;
            sub_805A7B4(&gUnknown_02000000);

            break;

        case 3:
        case 7:
            sub_805A990(&gUnknown_02000000);

            break;

        case 4:
            gUnknown_02000000.unk_0A = 2;
            sub_805A7B4(&gUnknown_02000000);

            break;

        case 6:
            gUnknown_02000000.unk_0A = 4;
            sub_805A7B4(&gUnknown_02000000);

            break;

        case 5:
        case 8:
            break;
    }

    proc->unk_2a = 0;

    return;
}

void sub_80B3E18(struct OpInfoClassDisplayProc* proc) {

    switch (((struct Idk*)(proc->unk_38))->idk) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
            ((struct Idk*)(proc->unk_38))++;
            Proc_Break(proc);

            break;

        case 5:
            proc->unk_2a++;

            if (proc->unk_2a < ((struct Idk*)(proc->unk_38))->unk_01) {
                return;
            }

            ((struct Idk*)(proc->unk_38))++;
            Proc_Break(proc);

            break;

        case 8:
            if (sub_805A96C(&gUnknown_02000000) != 0) {
                ((struct Idk*)(proc->unk_38))++;
                Proc_Break(proc);
            }
    }

    return;
}

void sub_80B3E9C(struct OpInfoClassDisplayProc* proc) {

    SetPrimaryHBlankHandler(0);

    sub_8006A7C();
    sub_806E920();
    sub_805AE14(&gUnknown_0201DB00);
    sub_806E904();
    sub_805AA28(&gUnknown_02000000);

    if (proc->unk_3c != 0) {
        Proc_End(proc->unk_3c);
    }

    sub_80B29B8(2);

    return;
}

ProcPtr sub_80B3EDC(ProcPtr parent, struct ClassReelEnt* entry) {
    struct OpInfoClassDisplayProc* proc = Proc_Start(gUnknown_08A2F088, parent);

    proc->unk_30 = parent;
    proc->unk_34 = entry;
    proc->unk_3c = 0;

    return proc;
}

void sub_80B3EFC(struct OpInfoGaugeDrawProc* proc) {
    struct Struct_80B4108* res;
    int i;

    signed char buffer[32];

    proc->unk_30 = proc->proc_parent;
    proc->unk_2a = 0;
    proc->unk_34 = 0;
    proc->unk_35 = 100;

    sub_80B369C(proc->unk_30->unk_34->unk_05, buffer);

    for (i = 0; buffer[i] != 0; ) {

        res = sub_80B4108(buffer[i]);

        if (res != 0) {
            proc->unk_34 += res->c - res->b;
        } else {
            proc->unk_34 += 4;
        }

        i++;

        if ((int)(buffer + i) > (int)(buffer + 0xD)) {
            break;
        }
    }

    CopyDataWithPossibleUncomp(gUnknown_08A36338, (void *)0x06010000);

    CopyToPaletteBuffer(gUnknown_08A372C0, 0x280, 0x40);

    return;
}

void sub_80B3F90(struct OpInfoGaugeDrawProc* proc) {
    signed char buffer[32];

    u8 value;
    int i;
    int j;


    for (i = 0; i < 6; i++) {
        value = proc->unk_30->unk_40[i];

        if (value >= 30) {
            value = 30;
        }

        for (j = 0; (j < (value >> 2)); j++) {
            PutSpriteExt(
                0xD,
                (j * 8) + 0x30,
                (i * 0x10) + 0x10,
                gUnknown_08A2F180[3],
                0x4000
            );
        }

        if ((value & 3) != 0) {
            PutSpriteExt(
                0xD,
                (j * 8) + 0x30,
                (i * 0x10) + 0x10,
                gUnknown_08A2F180[(value & 3) - 1],
                0x4000
            );
        }
    }

    j = ((0x78 - proc->unk_34) / 2) + proc->unk_35;

    sub_80B369C(proc->unk_30->unk_34->unk_05, buffer);

    for (i = 0; (buffer[i] != 0); ) {
        struct Struct_80B4108* res = sub_80B4108(buffer[i]);

        if (res != 0) {

            if (res->a != 0) {
                PutSpriteExt(
                    4,
                    j - res->b - 2,
                    5 - res->d,
                    res->a,
                    0x4000
                );

                j += (res->c - res->b);
            }

        } else {
            j += 4;
        }

        i++;

        if (i > 0xD) {
            break;
        }
    }

    if (proc->unk_2a < 0xFF) {
        proc->unk_2a++;
    }

    return;
}

ProcPtr sub_80B40D0(ProcPtr proc) {
    return Proc_Start(gUnknown_08A2F138, proc);
}

void sub_80B40E4(ProcPtr proc, int unk) {
    ((struct OpInfoGaugeDrawProc*)(proc))->unk_35 = unk;
    return;
}

struct ClassReelEnt* sub_80B40EC(int classSet, int index) {
    return gUnknown_08A2FBE0[gUnknown_08A2FBD4[classSet] + index];
}

struct Struct_80B4108* sub_80B4108(char chr) {

    if ((u8)(chr - 0x61) < 0x1A) {
        return &gUnknown_08A2FDD0[chr];
    }

    if ((u8)(chr - 0x41) < 0x1A) {
        return &gUnknown_08A2FE00[chr];
    }

    if (chr == 0x2E) {
        return &gUnknown_08A301A8;
    }

    return NULL;
}