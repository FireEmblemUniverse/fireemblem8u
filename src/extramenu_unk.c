#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "savemenu.h"

struct Proc8A21568 {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad[0x58-0x29];
    /* 58 */ int unk_58;
};

extern u16 gMenuMainObjs_4[]; // pal
extern u8 gMenuMainObjs_2[]; // gfx
extern u8 gMenuMainObjs_3[]; // gfx

//! FE8U = 0x080B0458
void ExtramenuUnk_HBlank(void) {
    u16 vcount = (REG_VCOUNT + 1);

    if (vcount > 160) {
        vcount = 0;
    }

    if ((vcount & 1) == 0) {
        if (vcount < 100) {
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_DARKEN;
            (*(vu16*)REG_ADDR_BLDY) = (100 - vcount) * 16 / 100;
        } else {
            REG_BLDCNT = BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0;
            REG_BLDALPHA = BLDALPHA_BLEND(10, 16);
        }
    }

    return;
}

u16 CONST_DATA gExtramenuUnk_0[] = {
    0x0000, 0x6000, 0x0000,
    0x0000, 0x6800, 0x0000,
    0x8000, 0x7800, 0x0000,
    0x8000, 0x7800, 0x0000,
};

//! FE8U = 0x080B04BC
void ExtramenuUnk_Init(struct Proc8A21568* proc) {
    proc->unk_58 = 4;

    SetupBackgrounds(gExtramenuUnk_0);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    return;
}

//! FE8U = 0x080B04F8
void ExtramenuUnk_LoadGfx(void) {
    ApplyPalettes(Pal_CommGameBgScreenInShop, 0, 2);
    ApplyPalette(Pal_MenuMainObjs_0, 2);
    Decompress(Img_CommGameBgScreen, (void*)0x06001000);
    CallARM_FillTileRect(gBG0TilemapBuffer, Tsa_CommGameBgScreenInShop, 0x80);

    BG_EnableSyncByMask(1);

    ApplyPalettes(gMenuMainObjs_4, 0x11, 8);
    Decompress(gMenuMainObjs_2, (void*)0x06010800);
    Decompress(gMenuMainObjs_3, (void*)0x06014000);

    SetPrimaryHBlankHandler(ExtramenuUnk_HBlank);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 2;

    return;
}

//! FE8U = 0x080B05C0
void Nop_ExtramenuUnk_0(void) {
    return;
}

//! FE8U = 0x080B05C4
void ExtramenuUnk_DrawIconLoop(struct Proc8A21568* proc) {
    if (proc->unk_58 >= 0) {
        PutSpriteExt(4, 56, 8, Sprite_Savedraw_0, 0x2000);
        PutSpriteExt(4, 64, 16, SpriteArray_SavemenuData_0[proc->unk_58], 0x3000);
    }
    return;
}

struct ProcCmd CONST_DATA gExtramenuUnk_1[] = {
    PROC_CALL(ExtramenuUnk_Init),
    PROC_CALL(ExtramenuUnk_LoadGfx),

    PROC_SET_END_CB(Nop_ExtramenuUnk_0),

    PROC_REPEAT(ExtramenuUnk_DrawIconLoop),

    PROC_END,
};

//! FE8U = 0x080B060C
void StartExtramenuUnk(ProcPtr parent) {
    Proc_Start(gExtramenuUnk_1, parent);
    return;
}

//! FE8U = 0x080B0620
void ExtramenuUnk_SetIconIndex(int unk) {
    struct Proc8A21568* proc = Proc_Find(gExtramenuUnk_1);
    proc->unk_58 = unk;

    return;
}
