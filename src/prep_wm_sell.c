#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"

struct WmSellProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u16 unk_32;
    /* 34 */ u16 unk_34;
};

struct Unknown02013648 {
    /* 00 */ struct Font font;
    /* 18 */ struct Text textA;
    /* 20 */ struct Text textB;
    /* 28 */ struct Text textArray[5];
    /* 50 */ u8 _pad[0x90-0x50];
    /* 90 */ struct Text textC;
};

extern struct Unknown02013648 gUnknown_02013648;

//! FE8U = 0x0809FDA0
void WmSell_DrawSupplyDialogueSpriteText(void) {
    int i;

    for (i = 0; i < 4; i++) {
        PutSpriteExt(4, 48 + i * 32, 16, gObject_32x16, 0xDF80 + i * 4);
    }

    return;
}

int CONST_DATA gShopSellTextIndexLookup[] = {
    0x5A3, // TODO msgid "Sell unwanted items."
    0x5A4, // TODO msgid "Are you sure?"
};

char* CONST_DATA gpShopSellStringBuffer = gStringBufferAlt;

//! FE8U = 0x0809FDD4
void sub_809FDD4(int index, ProcPtr parent) {

    StartParallelWorker(WmSell_DrawSupplyDialogueSpriteText, parent);

    NewSysboxText(
        0x7000,
        13,
        GetStringFromIndexInBuffer(gShopSellTextIndexLookup[index], gpShopSellStringBuffer),
        1,
        1,
        1,
        parent
    );

    return;
}

//! FE8U = 0x0809FE1C
void sub_809FE1C(void) {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT) {
        vcount = 0;
    }

    if (vcount == 12) {
        REG_BLDCNT = 200;
    }

    if ((vcount == 52) || (vcount == 0)) {
        REG_BLDCNT = 578;
    }

    return;
}

//! FE8U = 0x0809FE58
void WmSell_Init(struct WmSellProc* proc) {
    proc->unk_34 = 0;
    proc->unk_32 = 0xff;
    proc->unk_30 = 0;
    return;
}

//! FE8U = 0x0809FE68
void sub_809FE68(void) {
    InitSpriteTextFont(&gUnknown_02013648.font, (void*)0x06011000, 11);
    ApplyPalette(Pal_Text, 0x1B);

    InitSpriteText(&gUnknown_02013648.textC);

    SetTextFont(&gUnknown_02013648.font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&gUnknown_02013648.textC, 0);

    Text_InsertDrawString(&gUnknown_02013648.textC, 0, 0, GetStringFromIndex(0x059C)); // TODO msgid "Sell     Quit[.]"
    Text_InsertDrawString(&gUnknown_02013648.textC, 64, 0, GetStringFromIndex(0x059B)); // TODO msgid "Sell?[.]"
    Text_InsertDrawString(&gUnknown_02013648.textC, 128, 3, GetStringFromIndex(0x059D)); // TODO msgid "Value[.]"

    SetTextFont(0);

    return;
}

//! FE8U = 0x0809FEFC
void WmSell_DrawSellOptionSpriteText(void) {
    PrepItemDrawPopupBox(160, 91, 8, 4, 0x8840);

    PutSpriteExt(4, 176, 94, gObject_32x16, 0xB088);
    PutSpriteExt(4, 208, 94, gObject_32x16, 0xB08C);
    PutSpriteExt(4, 168, 110, gObject_32x16, 0xB080);
    PutSpriteExt(4, 200, 110, gObject_32x16, 0xB084);

    return;
}

//! FE8U = 0x0809FF74
void WmSell_DrawValueSpriteText(void) {
    PutSpriteExt(4, 136, 72, gObject_32x16, 0xB090);
    PutSpriteExt(4, 168, 72, gObject_8x16, 0xB094);
    return;
}

//! FE8U = 0x0809FFB0
void WmSell_DrawItemGoldValue(int item) {
    TileMap_FillRect(gBG0TilemapBuffer + 0x134, 10, 1, 0);

    if (item != 0) {
        u16 sellPrice = GetItemSellPrice(item);

        if ((sellPrice == 0) || (GetItemAttributes(item) & IA_UNSELLABLE)) {
            PutSpecialChar(gBG0TilemapBuffer + 0x134 + 5, TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
            PutSpecialChar(gBG0TilemapBuffer + 0x134 + 6, TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
            PutSpecialChar(gBG0TilemapBuffer + 0x134 + 7, TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
        } else {
            PutNumber(gBG0TilemapBuffer + 0x134 + 6, 2, sellPrice);
        }

        PutSpecialChar(gBG0TilemapBuffer + 0x13B, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);
    }

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080A0034
void WmSell_DrawPartyFunds(void) {
    TileMap_FillRect(gBG0TilemapBuffer + 0xF4, 10, 1, 0);

    PutNumber(gBG0TilemapBuffer + 0xF4 + 0x146, 2, GetPartyGoldAmount());
    PutSpecialChar(gBG0TilemapBuffer + 0xF4 + 0x147, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080A007C
void WmSell_PutSupplyFaceAndText(void) {
    SetTextFont(0);

    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 12, 1, 0);

    PutDrawText(&gUnknown_02013648.textA, gBG0TilemapBuffer + 0x34 + 0x6d, 0, 2, 0, GetStringFromIndex(0x598)); // TODO msgid "Supply"
    PutFaceChibi(FID_SUPPLY, gBG0TilemapBuffer + 0x34 - 0x13, 0x270, 2, 1);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080A00DC
void WmSell_Setup(struct WmSellProc* proc) {
    int i;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();

    ResetText();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    LoadHelpBoxGfx((void*)0x06014000, -1);
    LoadIconPalettes(4);

    RestartMuralBackground();

    PutImg_PrepItemUseUnk(0x5000, 5);
    PutImg_PrepPopupWindow(0x800, 8);

    Decompress(gUnknown_08A1BBD0, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    BG_EnableSyncByMask(7);

    StartFace2(
        0,
        GetUnitPortraitId(proc->unit),
        68,
        72,
        FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(FACE_HLAYER_2) | FACE_DISP_BLEND
    );
    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 128;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 224;
    gLCDControlBuffer.win0_bottom = 152;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetBlendConfig(0, 8, 8, 8);

    StartGreenText((struct Proc*)proc);

    StartHelpPromptSprite(120, 140, 2, (struct Proc*)proc);
    StartDrawPrepFundsSprite(165, 128, 10, proc);
    ShowPrepFundsSpriteAt(165, 128);

    InitText(&gUnknown_02013648.textA, 4);
    InitText(&gUnknown_02013648.textB, 2);

    sub_809FE68();

    for (i = 0; i < 5; i++) {
        InitText(&gUnknown_02013648.textArray[i], 7);
    }

    SetPrimaryHBlankHandler(0);
    SetPrimaryHBlankHandler(sub_809FE1C);

    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &gUnknown_02013648.textArray[0], proc->unit, 0);
    WmSell_PutSupplyFaceAndText();

    StartParallelWorker(WmSell_DrawValueSpriteText, proc);

    WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);
    WmSell_DrawPartyFunds();

    return;
}

//! FE8U = 0x080A032C
s8 WmSell_MainLoop_HandleDpadKeys(struct WmSellProc* proc) {
    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unk_30 != 0) {
            proc->unk_30--;
            PlaySoundEffect(0x66);
            return 1;
        } else {
            if (!(gKeyStatusPtr->newKeys & DPAD_UP)) {
                return 0;
            }

            proc->unk_30 = count - 1;
            PlaySoundEffect(0x66);
            return 1;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unk_30 < count - 1) {
            proc->unk_30++;
            PlaySoundEffect(0x66);
            return 1;
        } else {
            if (!(gKeyStatusPtr->newKeys & DPAD_DOWN)) {
                return 0;
            }

            proc->unk_30 = 0;
            PlaySoundEffect(0x66);
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080A03C4
void sub_80A03C4(struct WmSellProc* proc) {
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &gUnknown_02013648.textArray[0], proc->unit, 0);

    WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);

    sub_80ACA84(0);

    Proc_End(GetParallelWorker(WmSell_DrawSellOptionSpriteText));

    ShowSysHandCursor(16, proc->unk_30 * 16 + 72, 11, 0x400);
    sub_809FDD4(0, proc);

    return;
}

//! FE8U = 0x080A0424
void WmSell_OnLoop_MainKeyHandler(struct WmSellProc* proc) {
    u16 item;

    if (proc->unk_34 == 1) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_34 = 0;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->unit->items[proc->unk_30];
            if (item) {
                StartItemHelpBox(0x10, proc->unk_30 * 0x10 + 0x48, item);
                proc->unk_34 = 1;
            }

            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            u16 item = proc->unit->items[proc->unk_30];
            if ((GetItemSellPrice(item) == 0) || (GetItemAttributes(item) & IA_UNSELLABLE)) {
                StartPrepErrorHelpbox(
                    16,
                    proc->unk_30 * 16 + 72,
                    0x850, // TODO: msgid "Treasure can't be sold.[.]"
                    proc
                );
            } else {
                Proc_Goto(proc, 2);
                PlaySoundEffect(0x6a);
            }
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 3);
            PlaySoundEffect(0x6b);
            return;
        }
    }

    if (WmSell_MainLoop_HandleDpadKeys(proc) != 0) {
        ShowSysHandCursor(16, proc->unk_30 * 16 + 72, 11, 0x400);
        WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);
        if (proc->unk_34 == 1) {
            item = proc->unit->items[proc->unk_30];
            if (item) {
                StartItemHelpBox(0x10, proc->unk_30 * 0x10 + 0x48, item);
            }
        }
    }

    return;
}

//! FE8U = 0x080A0570
void sub_80A0570(struct WmSellProc* proc) {
    proc->unk_31 = 1;

    StartParallelWorker(WmSell_DrawSellOptionSpriteText, proc);

    SetUiCursorHandConfig(0, 16, proc->unk_30 * 16 + 72, 2);
    ShowSysHandCursor(proc->unk_31 * 32 + 164, 111, 0, 0x400);
    sub_809FDD4(1, proc);

    return;
}

//! FE8U = 0x080A05BC
void WmSell_ConfirmSellItem(struct WmSellProc* proc) {
    int count;

    sub_8024E20(GetItemSellPrice(proc->unit->items[proc->unk_30]));

    proc->unit->items[proc->unk_30] = 0;

    UnitRemoveInvalidItems(proc->unit);

    PlaySoundEffect(0xb9);

    WmSell_DrawPartyFunds();

    count = GetUnitItemCount(proc->unit);
    if (count == 0) {
        DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &gUnknown_02013648.textArray[0], proc->unit, 0);

        Proc_Goto(proc, 3);
    } else {
        if (count == proc->unk_30) {
            proc->unk_30 = count - 1;
        }

        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080A064C
void WmSell_OnLoop_ConfirmSellKeyHandler(struct WmSellProc* proc) {
    int previous = proc->unk_31;

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (previous == 0) {
            WmSell_ConfirmSellItem(proc);
            return;
        } else {
            Proc_Goto(proc, 1);

            PlaySoundEffect(0x6b);

            return;
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 1);

        PlaySoundEffect(0x6b);

        return;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        proc->unk_31 = 0;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        proc->unk_31 = 1;
    }

    if (previous == proc->unk_31) {
        return;
    }

    PlaySoundEffect(0x67);

    ShowSysHandCursor(proc->unk_31 * 32 + 164, 111, 0, 0x400);

    return;
}

//! FE8U = 0x080A06F0
void WmSell_OnEnd(void) {
    EndMuralBackground_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(NULL);
    EndDrawPrepFundsSprite();

    return;
}

struct ProcCmd CONST_DATA gProcScr_PrepWMShopSell[] = {
    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(WmSell_Init),
    PROC_CALL(WmSell_Setup),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

PROC_LABEL(1),
    PROC_CALL(sub_80A03C4),
    PROC_REPEAT(WmSell_OnLoop_MainKeyHandler),

PROC_LABEL(2),
    PROC_CALL(sub_80A0570),
    PROC_REPEAT(WmSell_OnLoop_ConfirmSellKeyHandler),

PROC_LABEL(3),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(WmSell_OnEnd),

    PROC_END,
};

//! FE8U = 0x080A070C
void StartWorldMapSellScreen(struct Unit* unit, ProcPtr parent) {
    struct WmSellProc* proc = Proc_StartBlocking(gProcScr_PrepWMShopSell, parent);
    proc->unit = unit;

    return;
}

// TODO: Below sprite data is used in "prep_itemlist.s" and "prep_itemsupply.s"

u16 CONST_DATA gSprite_08A195B0[] = {
    1,
    0x0000, 0x4000, 0x0406,
};

u16 CONST_DATA gSprite_08A195B8[] = {
    1,
    0x0000, 0x4000, 0x0408,
};

u16 CONST_DATA gSprite_08A195C0[] = {
    1,
    0x0000, 0x4000, 0x040A,
};

u16 CONST_DATA gSprite_08A195C8[] = {
    1,
    0x0000, 0x4000, 0x040C,
};

u16 CONST_DATA gSprite_08A195D0[] = {
    1,
    0x0000, 0x4000, 0x040E,
};

u16 CONST_DATA gSprite_08A195D8[] = {
    1,
    0x0000, 0x4000, 0x0410,
};

u16 CONST_DATA gSprite_08A195E0[] = {
    1,
    0x0000, 0x4000, 0x0412,
};

u16 CONST_DATA gSprite_08A195E8[] = {
    1,
    0x0000, 0x4000, 0x0414,
};

u16 CONST_DATA gSprite_08A195F0[] = {
    1,
    0x0000, 0x4000, 0x0416,
};

u16 CONST_DATA gUnknown_08A195F8[] = {
    2,
    0x4000, 0x8000, 0x0400,
    0x4010, 0x0000, 0x0404,
};

u16* CONST_DATA gUnknown_08A19608[] = {
    gSprite_08A195B0,
    gSprite_08A195B8,
    gSprite_08A195C0,
    gSprite_08A195C8,
    gSprite_08A195D0,
    gSprite_08A195D8,
    gSprite_08A195E0,
    gSprite_08A195E8,
    gSprite_08A195F0,
};
