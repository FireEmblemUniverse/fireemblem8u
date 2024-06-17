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

extern u16 gUnknown_08A2C11C[]; // pal
extern u8 gUnknown_08A29A88[]; // gfx
extern u8 gUnknown_08A2B1E4[]; // gfx

//! FE8U = 0x080B0458
void sub_80B0458(void) {
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

u16 CONST_DATA gUnknown_08A21550[] = {
    0x0000, 0x6000, 0x0000,
    0x0000, 0x6800, 0x0000,
    0x8000, 0x7800, 0x0000,
    0x8000, 0x7800, 0x0000,
};

//! FE8U = 0x080B04BC
void sub_80B04BC(struct Proc8A21568* proc) {
    proc->unk_58 = 4;

    SetupBackgrounds(gUnknown_08A21550);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    return;
}

//! FE8U = 0x080B04F8
void sub_80B04F8(void) {
    ApplyPalettes(Pal_CommGameBgScreenInShop, 0, 2);
    ApplyPalette(gUnknown_08A295B4, 2);
    Decompress(Img_CommGameBgScreen, (void*)0x06001000);
    CallARM_FillTileRect(gBG0TilemapBuffer, Tsa_CommGameBgScreenInShop, 0x80);

    BG_EnableSyncByMask(1);

    ApplyPalettes(gUnknown_08A2C11C, 0x11, 8);
    Decompress(gUnknown_08A29A88, (void*)0x06010800);
    Decompress(gUnknown_08A2B1E4, (void*)0x06014000);

    SetPrimaryHBlankHandler(sub_80B0458);

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
void nullsub_66(void) {
    return;
}

//! FE8U = 0x080B05C4
void sub_80B05C4(struct Proc8A21568* proc) {
    if (proc->unk_58 >= 0) {
        PutSpriteExt(4, 56, 8, Sprite_08A2051C, 0x2000);
        PutSpriteExt(4, 64, 16, SpriteArray_08A2099C[proc->unk_58], 0x3000);
    }
    return;
}

struct ProcCmd CONST_DATA gUnknown_08A21568[] = {
    PROC_CALL(sub_80B04BC),
    PROC_CALL(sub_80B04F8),

    PROC_SET_END_CB(nullsub_66),

    PROC_REPEAT(sub_80B05C4),

    PROC_END,
};

//! FE8U = 0x080B060C
void sub_80B060C(ProcPtr parent) {
    Proc_Start(gUnknown_08A21568, parent);
    return;
}

//! FE8U = 0x080B0620
void sub_80B0620(int unk) {
    struct Proc8A21568* proc = Proc_Find(gUnknown_08A21568);
    proc->unk_58 = unk;

    return;
}
