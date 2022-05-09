#include "global.h"

#include "hardware.h"
#include "proc.h"

struct ChapterIntroFXProc {
    /* 00 */ PROC_HEADER;

    u8 _pad1[0x4C-0x29];

    /* 4C */ s16 unk_4C;

    u8 _pad2[0x50-0x4E];

    /* 50 */ s16 unk_50;
    /* 52 */ u16 unk_52;

};

// arm_call.s
void sub_80D74B0();

extern u8 gUnknown_08B1754C[];
extern u8 gUnknown_08B12DB4[];
extern struct ProcCmd gUnknown_0859B108[];

extern u8 gUnknown_08B17B64[];
extern u8 gUnknown_08B18ED4[];
extern u8 gUnknown_08B18D68[];
extern u8 gUnknown_08B19874[];
extern u8 gUnknown_08B19DEC[];

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