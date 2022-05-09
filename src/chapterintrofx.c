#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"

struct ChapterIntroFXProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;

    u8 _pad1[0x4C-0x34];

    /* 4C */ s16 unk_4C;
    /* 4E */ s16 unk_4E;
    /* 50 */ s16 unk_50;
    /* 52 */ u16 unk_52;

    u8 _pad2[0x64-0x54];

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

// arm_call.s
void sub_80D74B0();

// code.s
void sub_80895B4(int, int);
int sub_808979C(struct RAMChapterData*);
void sub_808966C(int, int);
void sub_80896FC(u16*, int, int);

void sub_80ADDFC(int, int, int, int, int, int);
void sub_80ADE90(int, s16, s16);
void sub_80ADEE0(int, int, int, int, int);


extern u8 gUnknown_08B1754C[];
extern u8 gUnknown_08B12DB4[];
extern struct ProcCmd gUnknown_0859B108[];

extern u8 gUnknown_08B17B64[];
extern u8 gUnknown_08B18ED4[];
extern u8 gUnknown_08B18D68[];
extern u8 gUnknown_08B19874[];
extern u8 gUnknown_08B19DEC[];

extern u8 gUnknown_0859B120[];
extern u8 gUnknown_0859B132[];

extern u16 gUnknown_0859B144[];

extern struct ProcCmd gUnknown_0859B180[];

extern u16 gUnknown_08B18F34[];
extern u16 gUnknown_08B19854[];
extern u16 gUnknown_08B196D8[];

extern u16 gUnknown_02022928[];

extern u16 gUnknown_02022968[];

extern struct ProcCmd gUnknown_0859B0E0[];
extern struct ProcCmd gUnknown_0859B160[];

void sub_801FD90() {
    int unk = (GetGameClock() / 2) & 0xFF;
    BG_SetPosition(2, unk, unk);

    return;
}

void sub_801FDAC(struct ChapterIntroFXProc* proc) {
    struct ChapterIntroFXProc* parent = (struct ChapterIntroFXProc*) proc->proc_parent;

    parent->unk_50 = 0;
    proc->unk_50 = 0;

    return;
}

void sub_801FDBC(struct ChapterIntroFXProc* proc) {
    struct ChapterIntroFXProc* parent;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON)) {
        if (((struct ChapterIntroFXProc*) proc->proc_parent)->unk_52 != 0) {
            proc->unk_50 = 1;
        } else {
            ((struct ChapterIntroFXProc*) proc->proc_parent)->unk_52 = 1;
        }
    }

    if (proc->unk_50 != 0) {
        parent = (struct ChapterIntroFXProc*) proc->proc_parent;
        if (parent->unk_50 != 0) {
            Proc_Goto(parent, parent->unk_50);
            Proc_End(proc);
        }
    }

    return;
}

void sub_801FE14() {
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);

    for (iy = 0; iy < 8; ++iy) {
        for (ix = 0; ix < 16; ++ix) {

            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x10)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x10)] = tileRefA;

            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x18)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x18)] = tileRefB;

            tileRefA++;
            tileRefB++;
        }

        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

void sub_801FEE8() {
    int iVar10;
    int iVar11;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);
    
    for (iVar11 = 0; iVar11 < 8; ++iVar11) {
        for (iVar10 = 0; iVar10 < 16; ++iVar10) {
            
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-iVar10, iVar11+0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-iVar10, iVar11+0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-iVar10, iVar11+0x10)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-iVar10, iVar11+0x10)] = tileRefA + 0x400;
            
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-iVar10, iVar11+0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-iVar10, iVar11+0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-iVar10, iVar11+0x18)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-iVar10, iVar11+0x18)] = tileRefB + 0x400;
            
            tileRefA++;
            tileRefB++;
        }
        
        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

void sub_801FFD0(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;

    return;
}

void sub_801FFD8(struct ChapterIntroFXProc* proc) {
    proc->unk_4C++;

    BG_SetPosition(1, proc->unk_4C / 2, 0);
    REG_BG3HOFS = proc->unk_4C / 2;

    return;
}

int sub_8020010(ProcPtr proc, void* unk_2, int unk_3) {
    int ref1;
    int ref2;
    int i;

    u16* buffer = gBG1TilemapBuffer;

    if (unk_2 == 0) {
        unk_2 = (void*)BG_VRAM;
    }

    CopyToPaletteBuffer(gUnknown_08B1754C, unk_3 * 32, 0x40);
    CopyDataWithPossibleUncomp(gUnknown_08B12DB4, unk_2);

    ref1 = TILEREF(0, unk_3 & 0xF);
    ref2 = TILEREF(0, (unk_3 + 1) & 0xF);

    for (i = 0; i <= 0xDF; i++) {
        *buffer = i + ref1;
        buffer++;
    }

    for (; i <= 0x19F; i++) {
        *buffer = i + ref2;
        buffer++;
    }

    for (; i <= 0x27F; i++) {
        *buffer = i + ref1;
        buffer++;
    }

    Proc_Start(gUnknown_0859B108, proc);

    // return; // BUG?
}

void sub_802009C() {
    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundTileDataOffset(2, 0x8000);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg2cnt.screenSize = 0;

    return;
}

void sub_80200F0(struct ChapterIntroFXProc* proc) {
    SetupBackgrounds(0);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    SetBackgroundTileDataOffset(2, 0x8000);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = 0;
    gLCDControlBuffer.win0_bottom = 0;

    SetSpecialColorEffectsParameters(0, 0, 0, 0);

    sub_8001710();

    sub_80017B4(0, 2, 0x40, -1);

    sub_80D74B0();

    EnablePaletteSync();

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 1;

    CopyDataWithPossibleUncomp(gUnknown_08B17B64, BG_CHAR_ADDR(2));
    CopyToPaletteBuffer(gUnknown_08B18ED4, 0, 0x60);

    sub_800154C(gBG2TilemapBuffer, gUnknown_08B18D68, 0, 5);

    CopyDataWithPossibleUncomp(gUnknown_08B19874, OBJ_VRAM1);
    CopyToPaletteBuffer(gUnknown_08B19DEC, 0x240, 0x20);

    sub_8020010(proc, 0, 0xE);

    BG_EnableSyncByMask(6);

    proc->unk_52 = 0;

    return;
}

void sub_80202BC(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;
    proc->unk_4E = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 3;

    PlaySoundEffect(0x316);

    return;
}

void sub_80202F8(struct ChapterIntroFXProc* proc) {
    proc->unk_2C = sub_8012DCC(0, gUnknown_0859B120[proc->unk_4C], gUnknown_0859B120[proc->unk_4C + 1], proc->unk_4E, proc->unk_68);

    proc->unk_30 = sub_8012DCC(0, gUnknown_0859B132[proc->unk_4C], gUnknown_0859B132[proc->unk_4C + 1], proc->unk_4E, proc->unk_68);

    if (proc->unk_64 < 0x65) {
        int uVar8 = sub_8012DCC(4, 0x140, 0x40, proc->unk_64, 100);

        WriteOAMRotScaleData(
            0,
            Div(+COS(0) * 16, uVar8),
            Div(-SIN(0) * 16, uVar8),
            Div(+SIN(0) * 16, uVar8),
            Div(+COS(0) * 16, uVar8)
        );

        proc->unk_64++;
    }

    CallARM_PushToSecondaryOAM(
        (proc->unk_2C - 0x10) & 0x1FF,
        ((proc->unk_30 - 0x10) & 0x1FF) | 0x100,
        gObject_32x32,
        0x2210
    );
    CallARM_PushToSecondaryOAM(
        (0xE0 - proc->unk_2C) & 0x1FF,
        ((0x90 - proc->unk_30) & 0x1FF) | 0x100,
        gObject_32x32,
        0x2214
    );

    proc->unk_4E++;

    if (proc->unk_4E >= proc->unk_68) {
        proc->unk_4E = 0;

        proc->unk_4C++;

        proc->unk_68 = sub_8012DCC(0, 3, 8, proc->unk_66, 0x12);

        proc->unk_66++;

        if (gUnknown_0859B120[proc->unk_4C + 1] == 0) {
            Proc_Break(proc);
        }
    }

    return;
}

void sub_80204AC(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    proc->unk_4C = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}

void sub_80204E4(struct ChapterIntroFXProc* proc, int unk2, int unk3, int unk4) {
    int a = sub_8012DCC(5, 0x78, unk3, proc->unk_4C, 0x46);

    int b = sub_8012DCC(5, 0x50, unk4, proc->unk_4C, 0x46);

    CallARM_PushToSecondaryOAM(
        ((a - 8) & 0x1FF) | unk2 << 9,
        ((b - 8) & 0x1FF) | 0x100,
        gObject_16x16,
        0x2218
    );

    CallARM_PushToSecondaryOAM(
        ((0xE8 - a) & 0x1FF) | unk2 << 9,
        ((0x98 - b) & 0x1FF) | 0x100,
        gObject_16x16,
        0x2218
    );

    return;
}

void sub_8020578(struct ChapterIntroFXProc* proc) {
    int var;

    if (proc->unk_64 < 0x47) {
        var = sub_8012DCC(4, 0x140, 0x10, proc->unk_64, 0x46);

        WriteOAMRotScaleData(
            1,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_64++;
    }

    sub_80204E4(proc, 1, 0xD7, 0x11);

    if (proc->unk_66 < 0x47) {
        var = sub_8012DCC(4, 0x140, 0x10, proc->unk_66, 0x46);

        WriteOAMRotScaleData(
            2,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_66++;
    }

    sub_80204E4(proc, 2, 0xC0, 0x20);

    if (proc->unk_68 < 0x47) {
        var = sub_8012DCC(4, 0x140, 0x10, proc->unk_68, 0x46);

        WriteOAMRotScaleData(
            3,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_68++;
    }

    sub_80204E4(proc, 3, 0xA9, 0x2F);

    proc->unk_4C++;

    if (proc->unk_4C > 0x45) {
        Proc_Break(proc);
    }

    return;
}

void sub_8020778() {
    int var;

    BG_Fill(gBG0TilemapBuffer, 0x1280);
    sub_80895B4(8, 5);

    var = sub_808979C(&gRAMChapterData);
    sub_808966C(0x280, var);
    sub_80896FC(gBG0TilemapBuffer + 0x123, 5, var);

    BG_EnableSyncByMask(1);

    return;
}

void sub_80207C8() {
    CallARM_PushToSecondaryOAM(0, 0x40, gUnknown_0859B144, 0x2200);
    CallARM_PushToSecondaryOAM(0, 0x40, gUnknown_0859B144, 0x2200);

    return;
}

void sub_80207F4(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;
    proc->unk_4E = 0;
    proc->unk_66 = 0;

    return;
}

void sub_8020808(struct ChapterIntroFXProc* proc) {
    if (proc->unk_66 == 0) {
        SetSpecialColorEffectsParameters(1, 0x10, proc->unk_4E, 0);
        proc->unk_4E++;
    } else {
        SetSpecialColorEffectsParameters(1, ((u16)proc->unk_4E << 0x10) >> 0x11 & 0xFF, 0x10, 0);
        proc->unk_4E--;
    }

    if (proc->unk_4C <= 0xFF) {
        sub_80ADDFC(2, 0, 0, 0, 0x180, 0x180);
        sub_80ADE90(2, (u16)proc->unk_4C + 0xF0, (u16)proc->unk_4C + 0xF0);
        sub_80ADEE0(2, 0x70, 0x58, 0x4c, 0x4c);
        FlushLCDControl();

        if (proc->unk_66 == 0) {
            // TODO: Is there a way to avoid having to do this?
            goto _080208AC;
        }

        proc->unk_4C += 4;
    }

    if (proc->unk_66 == 0) {
_080208AC:
        if (proc->unk_4E <= 0xF) {
            return;
        }

        proc->unk_4E = 0x20;
        SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);
        proc->unk_66++;

        return;
    }

    if (0 < proc->unk_4E) {
        return;
    }

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
    Proc_EndEach(gUnknown_0859B180);
    Proc_Break(proc);

    return;
}

void sub_80208F8() {
    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F0C(0, 1, 0, 0, 0);

    return;
}

void sub_8020944(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    proc->unk_4C = 0;

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F0C(0, 1, 0, 0, 0);

    CopyDataWithPossibleUncomp(gUnknown_08B18F34, BG_CHAR_ADDR(2));
    CopyToPaletteBuffer(gUnknown_08B19854, 0x80, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08B196D8, gUnknown_02020188);
    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_02020188, 0x4000);

    BG_EnableSyncByMask(4);

    return;
}

void sub_80209D8(struct ChapterIntroFXProc* proc) {
    SetSpecialColorEffectsParameters(1, proc->unk_4C, 0x10, 0);

    if ((proc->unk_50 == 3) || ((GetGameClock() & 3) == 0)) {
        if (proc->unk_52 != 0) {
            proc->unk_4C += 4;
        } else {
            proc->unk_4C++;
        }

        if (proc->unk_4C > 5) {
            SetSpecialColorEffectsParameters(1, 6, 0x10, 0);
            Proc_Break(proc);
        }
    }

    return;
}

void sub_8020A40(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0x1E;

    sub_8001710();

    sub_800172C(gUnknown_02022928, 4, 2, -1);
    sub_800172C(gUnknown_02022928 + 0xA0, 0xE, 2, -1);
    sub_800172C(gUnknown_02022928 + 0xE0, 0x12, 1, -1);

    return;
}

void sub_8020A8C(struct ChapterIntroFXProc* proc) {
    int clock = GetGameClock() & 3;

    if ((clock) == 0) {
        sub_80D74B0();
        EnablePaletteSync();

        proc->unk_4C--;

        if (proc->unk_4C < 0) {
            gLCDControlBuffer.dispcnt.bg0_on = 1;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 1;

            SetBackgroundTileDataOffset(2, 0);
            gPaletteBuffer[0] = clock;
            EnablePaletteSync();
            Proc_Break(proc);
        }
    }

    return;
}

void sub_8020AF8() {
    SetupBackgrounds(0);
    sub_80156D4();
    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);
    SMS_UpdateFromGameData();
    SMS_FlushIndirect();
    Font_LoadForUI();

    return;
}

void sub_8020B20() {
    gUnknown_0202BCB0.camera.y = 0xA0 * 4;

    return;
}

#if NONMATCHING

void sub_8020B30() {
    u16 var;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetSpecialColorEffectsParameters(1, 0x10, 0, 0);

    sub_8001ED0(0, 1, 0, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 1);

    sub_8001F64(1);

    CpuFastFill(0, (void *)BG_VRAM, 32);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(7);

    DisableMapPaletteAnimations();

    UnpackChapterMapGraphics(gRAMChapterData.chapterIndex);

    SetupMapSpritesPalettes();
    LoadObjUIGfx();

    // TODO - Nonmatching is caused by an extra use of r2 around here for the results of this operation

    var = GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk10[2];
    var = sub_8015A40(var * 16);
    var = (var + 0xF) & 0x1F0;
    gUnknown_0202BCB0.camera.x = var;

    var = GetROMChapterStruct(gRAMChapterData.chapterIndex)->_unk10[3];
    var = sub_8015A6C(var * 16);
    var = (var + 0xF) & 0x3F0;
    gUnknown_0202BCB0.camera.y = var;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}

#else // !NONMATCHING

__attribute__((naked))
void sub_8020B30() {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        sub sp, #8\n\
        ldr r2, _08020C10  @ gLCDControlBuffer\n\
        ldrb r0, [r2, #1]\n\
        movs r1, #1\n\
        orrs r0, r1\n\
        movs r1, #2\n\
        orrs r0, r1\n\
        movs r1, #4\n\
        orrs r0, r1\n\
        movs r1, #8\n\
        orrs r0, r1\n\
        movs r1, #0x10\n\
        orrs r0, r1\n\
        strb r0, [r2, #1]\n\
        movs r0, #1\n\
        movs r1, #0x10\n\
        movs r2, #0\n\
        movs r3, #0\n\
        bl SetSpecialColorEffectsParameters\n\
        movs r4, #0\n\
        str r4, [sp]\n\
        movs r0, #0\n\
        movs r1, #1\n\
        movs r2, #0\n\
        movs r3, #0\n\
        bl sub_8001ED0\n\
        movs r0, #1\n\
        str r0, [sp]\n\
        movs r0, #0\n\
        movs r1, #0\n\
        movs r2, #0\n\
        movs r3, #1\n\
        bl sub_8001F0C\n\
        movs r0, #1\n\
        bl sub_8001F64\n\
        str r4, [sp, #4]\n\
        movs r1, #0xc0\n\
        lsls r1, r1, #0x13\n\
        ldr r2, _08020C14  @ 0x01000008\n\
        add r0, sp, #4\n\
        bl CpuFastSet\n\
        ldr r0, _08020C18  @ gBG0TilemapBuffer\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        ldr r0, _08020C1C  @ gBG1TilemapBuffer\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        ldr r0, _08020C20  @ gBG2TilemapBuffer\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        movs r0, #7\n\
        bl BG_EnableSyncByMask\n\
        bl DisableMapPaletteAnimations\n\
        ldr r4, _08020C24  @ gRAMChapterData\n\
        movs r0, #0xe\n\
        ldrsb r0, [r4, r0]\n\
        bl UnpackChapterMapGraphics\n\
        bl SetupMapSpritesPalettes\n\
        bl LoadObjUIGfx\n\
        movs r0, #0xe\n\
        ldrsb r0, [r4, r0]\n\
        bl GetROMChapterStruct\n\
        ldrb r0, [r0, #0x10]\n\
        lsls r0, r0, #4\n\
        bl sub_8015A40\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        adds r0, #0xf\n\
        movs r1, #0xf8\n\
        lsls r1, r1, #1\n\
        ands r0, r1\n\
        ldr r5, _08020C28  @ gUnknown_0202BCB0\n\
        strh r0, [r5, #0xc]\n\
        movs r0, #0xe\n\
        ldrsb r0, [r4, r0]\n\
        bl GetROMChapterStruct\n\
        ldrb r0, [r0, #0x11]\n\
        lsls r0, r0, #4\n\
        bl sub_8015A6C\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        adds r0, #0xf\n\
        movs r1, #0xfc\n\
        lsls r1, r1, #2\n\
        ands r0, r1\n\
        strh r0, [r5, #0xe]\n\
        bl RefreshEntityBmMaps\n\
        bl RenderBmMap\n\
        add sp, #8\n\
        pop {r4, r5}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08020C10: .4byte gLCDControlBuffer\n\
    _08020C14: .4byte 0x01000008\n\
    _08020C18: .4byte gBG0TilemapBuffer\n\
    _08020C1C: .4byte gBG1TilemapBuffer\n\
    _08020C20: .4byte gBG2TilemapBuffer\n\
    _08020C24: .4byte gRAMChapterData\n\
    _08020C28: .4byte gUnknown_0202BCB0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_8020C2C(struct ChapterIntroFXProc* proc) {
    sub_8001710();

    sub_800172C(gUnknown_02022968, 6, 10, 1);
    sub_800172C(gUnknown_02022968 + 0x140, 0x1A, 6, 1);
    sub_800172C(gUnknown_02022968 + 0xA0, 0x10, 2, 1);
    sub_800172C(gUnknown_02022968 + 0x110, 0x17, 1, 1);

    sub_80D74B0();

    EnablePaletteSync();

    proc->unk_4C = 0x1E;

    if (GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialWeather == 5) {
        WfxFlamesInitGradientPublic();
    }

    return;
}

void sub_8020CA4(struct ChapterIntroFXProc* proc) {
    if ((GetGameClock() & 1) == 0) {
        sub_80D74B0();
        if (GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialWeather == 5) {
            WfxFlamesInitGradientPublic();
        }

        if ((GetChapterThing() == 2) || GetROMChapterStruct(gRAMChapterData.chapterIndex)->boolFadeToBlack) {
            if ((GetROMChapterStruct(gRAMChapterData.chapterIndex)->unk28) != 0xFFFF) {
                Sound_PlaySong80024D4(GetROMChapterStruct(gRAMChapterData.chapterIndex)->unk28, 0);
            }

            proc->unk_4C = 0;

            gLCDControlBuffer.dispcnt.bg0_on = 1;
            gLCDControlBuffer.dispcnt.bg1_on = 1;
            gLCDControlBuffer.dispcnt.bg2_on = 1;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;
        } else {
            int tmp;
            EnablePaletteSync();

            tmp = proc->unk_4C + 7;
            if (tmp < 0) {
                tmp = proc->unk_4C + 0xE;
            }

            SetSpecialColorEffectsParameters(
                1,
                ((tmp >> 3) + 0xC) & 0xFF,
                (4 - (tmp >> 3)) & 0xFF,
                0
            );
        }

        proc->unk_4C--;

        if ((proc->unk_4C == 0x18) &&
            ((GetROMChapterStruct(gRAMChapterData.chapterIndex)->unk28) != 0xFFFF)) {
            Sound_PlaySong80024D4(GetROMChapterStruct(gRAMChapterData.chapterIndex)->unk28, 0);
        }

        if (proc->unk_4C < 0) {
            ResetMapPaletteAnimations();
            Proc_Break(proc);
        }
    }

    return;
}

void sub_8020DBC(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    return;
}

void sub_8020DE8(struct ChapterIntroFXProc* proc) {
    int var;

    var = sub_8012DCC(5, 0, 0x78, proc->unk_4C, 0x28);

    gLCDControlBuffer.win0_left = 0x78 - var;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = var + 0x78;
    gLCDControlBuffer.win0_bottom = 0xA0;

    proc->unk_4C++;

    if (proc->unk_4C > 0x28) {
        Proc_Break(proc);
    }

    return;
}

void sub_8020E48(struct ChapterIntroFXProc* proc) {
    Sound_FadeOutBGM(4);

    sub_8001710();

    sub_800172C(gPaletteBuffer, 0, 3, -2);
    sub_800172C(gPaletteBuffer + 0x40, 4, 2, -2);
    sub_800172C(gPaletteBuffer + 0xE0, 0xE, 2, -2);
    sub_800172C(gPaletteBuffer + 0x120, 0x12, 1, -2);

    proc->unk_4C = 0xF;

    Sound_FadeOutSE(1);

    return;
}

void sub_8020EAC(struct ChapterIntroFXProc* proc) {
    sub_80D74B0();
    EnablePaletteSync();

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        gLCDControlBuffer.dispcnt.bg0_on = 0;
        gLCDControlBuffer.dispcnt.bg1_on = 0;
        gLCDControlBuffer.dispcnt.bg2_on = 0;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;

        SetBackgroundTileDataOffset(2, 0);
        Proc_Break(proc);
    }

    return;
}

void sub_8020F00(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    CpuFastFill(0, (void *)BG_VRAM, 32);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(7);

    Proc_EndEach(gUnknown_0859B0E0);
    Proc_EndEach(gUnknown_0859B108);
    Proc_EndEach(gUnknown_0859B160);

    sub_8001710();

    sub_800172C(gUnknown_02022968, 6, 10, 2);
    sub_800172C(gUnknown_02022968 + 0x140, 0x1A, 6, 2);
    sub_800172C(gUnknown_02022968 + 0xA0, 0x10, 2, 2);
    sub_800172C(gUnknown_02022968 + 0x110, 0x17, 1, 2);

    sub_80D74B0();

    EnablePaletteSync();

    proc->unk_4C = 0xE;

    if ((GetROMChapterStruct(gRAMChapterData.chapterIndex)->unk28) != 0xFFFF) {
        Sound_PlaySong80024D4(GetROMChapterStruct(gRAMChapterData.chapterIndex)->unk28, 0);
    }

    return;
}

void sub_8020FF8(struct ChapterIntroFXProc* proc) {
    sub_80D74B0();

    if ((GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialWeather) == 5) {
        WfxFlamesInitGradientPublic();
    }

    if ((GetChapterThing() == 2) || (GetROMChapterStruct(gRAMChapterData.chapterIndex)->boolFadeToBlack)) {
        proc->unk_4C = 0;

        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;
    } else {
        EnablePaletteSync();
    }

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}

void sub_8021080(s16 unk0, struct ChapterIntroFXProc* param_2) {
    param_2->unk_50 = unk0;

    return;
}


void sub_8021088(s16 unk0, struct ChapterIntroFXProc* param_2) {
    param_2->unk_4C = unk0;

    return;
}

#if NONMATCHING

void sub_8021090(struct ChapterIntroFXProc* proc) {
    if (proc->unk_52 != 0) {
        Proc_Break(proc);
        return;
    }

    // TODO: Register usage is incorrect
    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

#else // !NONMATCHING

__attribute__((naked))
void sub_8021090(struct ChapterIntroFXProc* proc) {
    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        adds r3, r0, #0\n\
        adds r0, #0x52\n\
        ldrh r0, [r0]\n\
        cmp r0, #0\n\
        beq _080210A4\n\
        adds r0, r3, #0\n\
        bl Proc_Break\n\
        b _080210BA\n\
    _080210A4:\n\
        adds r0, r3, #0\n\
        adds r0, #0x4c\n\
        ldrh r1, [r0]\n\
        subs r2, r1, #1\n\
        strh r2, [r0]\n\
        lsls r1, r1, #0x10\n\
        cmp r1, #0\n\
        bge _080210BA\n\
        adds r0, r3, #0\n\
        bl Proc_Break\n\
    _080210BA:\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_80210C0(struct ChapterIntroFXProc* proc) {
    proc->unk_52 = 2;

    return;
}

void sub_80210C8() {
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(1);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    if ((GetChapterThing() == 2) ||
    (GetROMChapterStruct(gRAMChapterData.chapterIndex)->boolFadeToBlack)) {
        RefreshBMapGraphics();
        sub_80141B0();
    }

    return;
}

void sub_8021188(struct ChapterIntroFXProc* proc) {
    if ((GetGameClock() & 1) == 0) {
        sub_80D74B0();

        if (GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialWeather == 5) {
            WfxFlamesInitGradientPublic();
        }

        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}