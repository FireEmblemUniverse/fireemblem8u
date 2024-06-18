#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/items.h"

#include "prepscreen.h"

int CheckInLinkArena(void);

u16 CONST_DATA gPrepShopInventory[] = {
    ITEM_SWORD_IRON,
    ITEM_LANCE_IRON,
    ITEM_AXE_IRON,
    ITEM_BOW_IRON,
    ITEM_ANIMA_FIRE,
    ITEM_DARK_FLUX,
    ITEM_LIGHT_LIGHTNING,
    ITEM_STAFF_HEAL,

    ITEM_NONE,
};

int CONST_DATA gHelpTextIds_PrepItemScreen[] = {
    0x05AF, // TODO: msgid "Exchange items[NL]between units."
    0x05B3, // TODO: msgid "Display all units' items.[.]"
    0x05B0, // TODO: msgid "Use items."
    0x05B5, // TODO: msgid "Place all items in storage.[.]"
    0x05B1, // TODO: msgid "Transfer items to and[.][NL]from storage.[.]"
    0x05B2, // TODO: msgid "Buy and sell items.[.]"
};

int CONST_DATA gHelpTextIds_GMapItemScreen[] = {
    0x05AF, // TODO: msgid "Exchange items[NL]between units."
    0x05B3, // TODO: msgid "Display all units' items.[.]"
    0x05B0, // TODO: msgid "Use items."
    0x05B5, // TODO: msgid "Place all items in storage.[.]"
    0x05B1, // TODO: msgid "Transfer items to and[.][NL]from storage.[.]"
    0x05B4, // TODO: msgid "Sell your unneeded items.[.][NL]Important items cannot be sold.[.]"
};

//! FE8U = 0x080983D4
void PrepItemScreen_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 0)
        REG_BG0VOFS = 248;

    if (vcount == 72)
        REG_BG0VOFS = 252;
}

//! FE8U = 0x08098408
void PrepItemScreen_Init(struct PrepItemScreenProc * proc)
{
    proc->unk_29 = 0;
    proc->selectedUnitIdx = -1;
    proc->unk_2d = -1;
    proc->popupPromptIdx = 0;
    proc->unk_34 = 0;
    proc->pUnits[1] = NULL;
    proc->pUnits[0] = NULL;
    proc->hasConvoyAccess = HasConvoyAccess_();
    return;
}

//! FE8U = 0x08098448
void DrawFundsSprite_Init(struct DrawFundsSpriteProc * proc)
{
    Decompress(gUnknown_08A1B1FC, (void *)0x06013000);
    ApplyPalette(gUnknown_08A1B638, proc->pal + 0x10);
    return;
}

u16 CONST_DATA gSprite_PrepFunds[] = {
    4,
    0x4000, 0x8000, 0x0050,
    0x4000, 0x8020, 0x0054,
    0x4010, 0x8000, 0x0058,
    0x4010, 0x8020, 0x005C,
};

//! FE8U = 0x08098474
void DrawFundsSprite_Loop(struct DrawFundsSpriteProc* proc) {
    if (proc->visible) {
        PutSpriteExt(
            4,
            proc->x,
            proc->y,
            gSprite_PrepFunds,
            OAM2_PAL(proc->pal) + OAM2_CHR(0x180) + OAM2_LAYER(1)
        );
    }
    return;
}

struct ProcCmd CONST_DATA gProcScr_DrawPrepFundsSprite[] = {
    PROC_SLEEP(0),

    PROC_CALL(DrawFundsSprite_Init),
    PROC_REPEAT(DrawFundsSprite_Loop),

    PROC_END,
};

//! FE8U = 0x080984A8
void StartDrawPrepFundsSprite(int x, int y, int pal, ProcPtr parent) {
    struct DrawFundsSpriteProc* proc = Proc_Start(gProcScr_DrawPrepFundsSprite, parent);
    proc->visible = false;
    proc->x = x;
    proc->y = y;
    proc->pal = pal;
    return;
}

//! FE8U = 0x080984CC
void ShowPrepFundsSpriteAt(int x, int y) {
    struct DrawFundsSpriteProc* proc = Proc_Find(gProcScr_DrawPrepFundsSprite);
    proc->visible = true;
    proc->x = x;
    proc->y = y;
    return;
}

//! FE8U = 0x080984EC
void HidePrepFundsSprite(void)
{
    struct DrawFundsSpriteProc* proc = Proc_Find(gProcScr_DrawPrepFundsSprite);
    proc->visible = false;
    return;
}

//! FE8U = 0x08098500
void EndDrawPrepFundsSprite(void) {
    Proc_End(Proc_Find(gProcScr_DrawPrepFundsSprite));
    return;
}

//! FE8U = 0x08098514
void DrawUnitInfoBg_Init(void) {
    ApplyPalette(gUiFramePaletteA, 0x12);
    return;
}

u16 CONST_DATA gSprite_PrepUnitInfoBg[] = {
    6,
    0x4000, 0xC000, 0x0000,
    0x4000, 0xC040, 0x0008,
    0x4020, 0x8000, 0x0010,
    0x4020, 0x8020, 0x0014,
    0x4020, 0x8040, 0x0018,
    0x4020, 0x8060, 0x001C,
};

//! FE8U = 0x0809852C
void DrawUnitInfoBg_Loop(struct DrawPrepUnitInfoBgProc * proc)
{
    if (proc->visible) {
        PutSpriteExt(
            4,
            proc->x,
            proc->y,
            gSprite_PrepUnitInfoBg,
            OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(2)
        );
    }
    return;
}

struct ProcCmd CONST_DATA gProcScr_DrawUnitInfoBgSprites[] = {
    PROC_CALL(DrawUnitInfoBg_Init),
    PROC_REPEAT(DrawUnitInfoBg_Loop),

    PROC_END,
};

//! FE8U = 0x08098554
void StartDrawPrepUnitInfoBgSprites(ProcPtr parent)
{
    struct DrawPrepUnitInfoBgProc* proc = Proc_Start(gProcScr_DrawUnitInfoBgSprites, parent);
    proc->visible = false;
    proc->x = 0;
    proc->y = 0;
    return;
}

//! FE8U = 0x08098570
void ShowUnitInfoBgSpritesAt(int x, int y)
{
    struct DrawPrepUnitInfoBgProc* proc = Proc_Find(gProcScr_DrawUnitInfoBgSprites);
    proc->visible = true;
    proc->x = x;
    proc->y = y;
    return;
}

//! FE8U = 0x08098590
void HideUnitInfoBgSprites(void) {
    struct DrawPrepUnitInfoBgProc* proc = Proc_Find(gProcScr_DrawUnitInfoBgSprites);
    proc->visible = false;
    return;
}

//! FE8U = 0x080985A4
void EndDrawPrepUnitInfoBgSprites(void) {
    Proc_End(Proc_Find(gProcScr_DrawUnitInfoBgSprites));
    return;
}

//! FE8U = 0x080985B8
void PrepItemScreen_DrawFunds(void) {
    PutText(&gPrepItemScreenTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17));
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 17), 2, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 28, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);
    ShowPrepFundsSpriteAt(168, 133);
    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x08098600
void PrepItemScreen_HideFunds(void) {
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17), 10, 1, 0);
    HidePrepFundsSprite();
    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x08098620
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc)
{
    int i;

    struct FaceVramEntry faceConfig[4] = {
        { 0x5800, 6, },
        { 0x6800, 7, },
        { 0x0000, 0, },
        { 0x0000, 0, },
    };

    SetupBackgrounds(gBgConfig_ItemUseScreen);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupFaceGfxData(faceConfig);

    SetDispEnable(0, 0, 0, 0, 0);

    SetupDebugFontForOBJ(0x06017800, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetText();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadUiFrameGraphics();
    ApplyPalette(gUiFramePaletteD, 2);
    LoadObjUIGfx();

    MakePrepUnitList();
    proc->hoverUnitIdx = UnitGetIndexInPrepList(PrepGetLatestCharId());

    ResetSysHandCursor(proc);
    StartParallelWorker(sub_809A274, proc);
    StartUiCursorHand(proc);

    SetPrimaryHBlankHandler(NULL);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    for (i = 0; i < 15; i++) {
        InitText(gPrepItemTexts + i, 5);
    }

    for (i = 0; i < 5; i++) {
        InitText(&gPrepItemScreenTexts[0 + i], 7);
        InitText(&gPrepItemScreenTexts[5 + i], 7);
    }

    InitTextDb(&gPrepItemScreenTexts[10], 8);
    InitTextDb(&gPrepItemScreenTexts[11], 8);
    InitText(&gPrepItemScreenTexts[12], 8);
    InitText(&gPrepItemScreenTexts[15], 7);
    InitText(&gPrepItemScreenTexts[16], 5);

    LoadHelpBoxGfx((void *)0x06014000, -1);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 4, 240, 68);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    BG_SetPosition(0, 4, -4);
    BG_SetPosition(1, 0, 4);
    BG_SetPosition(2, -40, (proc->unk_34 - 4) & 0xff);
    BG_EnableSyncByMask(7);

    SetupMapSpritesPalettes();
    CpuFastFill(0, PAL_OBJ(0x0B), 0x20);

    ForceSyncUnitSpriteSheet();

    Decompress(Img_PrepTextShadow, (void *)0x06013E00);
    UiCursorHand_80ACA4C(0, 0, 0, 0xd0, 0x3c);
    DisplaySysHandCursorTextShadow(0x600, 1);

    RestartMuralBackground();

    if (proc->selectedUnitIdx != 0xff) {
        SetUiCursorHandConfig(
            0,
            ((proc->selectedUnitIdx % 3) * 64) + 24,
            ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->unk_34,
            2
        );
        UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->selectedUnitIdx), 60, 76, 0x0503);
    }

    StartMenuScrollBarExt(proc, 224, 11, 0x200, 4);

    UpdateMenuScrollBarConfig(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    sub_8097668();
    PrepUpdateSMS();
    SetBlendConfig(1, 8, 8, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    SetPrimaryHBlankHandler(PrepItemScreen_OnHBlank);

    StartDrawPrepFundsSprite(168, 133, 11, proc);

    StartDrawPrepUnitInfoBgSprites(proc);

    return;
}

//! FE8U = 0x080989BC
void PrepItemScreen_OnEnd(struct PrepItemScreenProc* proc) {
    struct Unit* unit = GetUnitFromPrepList(proc->hoverUnitIdx);
    PrepSetLatestCharId(unit->pCharacterData->number);

    EndAllParallelWorkers();
    EndSysHandCursor();

    EndUiCursorHand();

    EndPrepItemScreenFace(0);
    EndPrepItemScreenFace(1);

    EndMuralBackground_();
    EndHelpPromptSprite();

    EndMenuScrollBar();

    EndDrawPrepFundsSprite();
    EndDrawPrepUnitInfoBgSprites();

    SetPrimaryHBlankHandler(NULL);

    return;
}

//! FE8U = 0x08098A04
void sub_8098A04(u16 * tm)
{
    TileMap_FillRect(tm, 10, 6, 0);

    ClearText(&gPrepItemScreenTexts[10]);
    ClearText(&gPrepItemScreenTexts[11]);

    PutDrawText(
        &gPrepItemScreenTexts[10],
        tm + TILEMAP_INDEX(1, 1),
        TEXT_COLOR_SYSTEM_WHITE,
        0,
        0,
        GetStringFromIndex(0x0583) // TODO: msgid "Choose unit[.]"
    );
    PutDrawText(
        &gPrepItemScreenTexts[11],
        tm + TILEMAP_INDEX(1, 3),
        TEXT_COLOR_SYSTEM_WHITE,
        0,
        0, 
        GetStringFromIndex(0x0584) // TODO: msgid " [.]"
    );

    return;
}

//! FE8U = 0x08098A74
void sub_8098A74(u16 * tm) {
    int textId;

    TileMap_FillRect(tm, 10, 8, 0);

    ClearText(&gPrepItemScreenTexts[10]);
    ClearText(&gPrepItemScreenTexts[11]);
    ClearText(&gPrepItemScreenTexts[12]);

    switch (GetGMapBaseMenuKind()) {
        case 0:
            textId = 0x0672; // TODO: msgid "Enter Armory"
            break;

        case 1:
            textId = 0x0673; // TODO: msgid "Enter Shop"
            break;

        case 2:
            textId = 0x0674; // TODO: msgid "Enter ? Shop"
            break;

        case 3:
            textId = 0x0675; // TODO: msgid "Manage Items"
            break;
    }

    PutDrawText(&gPrepItemScreenTexts[10], tm + TILEMAP_INDEX(0, 2), TEXT_COLOR_SYSTEM_WHITE, 4, 0, GetStringFromIndex(textId));
    PutDrawText(&gPrepItemScreenTexts[11], tm + TILEMAP_INDEX(0, 4), TEXT_COLOR_SYSTEM_WHITE, 4, 0, GetStringFromIndex(0x0583)); // TODO: msgid "Choose unit"
    PutDrawText(&gPrepItemScreenTexts[12], tm + TILEMAP_INDEX(0, 6), TEXT_COLOR_SYSTEM_WHITE, 4, 0, GetStringFromIndex(0x0584)); // TODO: msgid " [.]"
    return;
}

//! FE8U = 0x08098B48
void sub_8098B48(void) {
    PrepItemDrawPopupBox(136, 89, 9, 4, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
    return;
}

//! FE8U = 0x08098B68
void sub_8098B68(void) {
    switch (GetGMapBaseMenuKind()) {
        case 3:
            PrepItemDrawPopupBox(136, 81, 9, 6, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
            break;
        default:
            PrepItemDrawPopupBox(136, 81, 9, 6, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
            break;
    }

    return;
}

//! FE8U = 0x08098BA8
void sub_8098BA8(void) {
    PrepItemDrawPopupBox(8, 92, 10, 5, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
    return;
}

//! FE8U = 0x08098BC8
void sub_8098BC8(void) {
    PrepItemDrawPopupBox(136, 81, 9, 6, OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(10));
    return;
}

//! FE8U = 0x08098BE8
void sub_8098BE8(void) {
    if (gGMData.state.bits.state_0) {
        Proc_End(GetParallelWorker(sub_8098B68));
    } else {
        Proc_End(GetParallelWorker(sub_8098B48));
    }
    Proc_End(GetParallelWorker(sub_8098BA8));
    Proc_End(GetParallelWorker(sub_8098BC8));
    return;
}

//! FE8U = 0x08098C3C
void PutImg_PrepItemUseUnk(int vram, int pal) {
    u16* Pals_PrepWindow[] = {
        Pal_08A1D850,
        Pal_08A1D870,
        Pal_08A1D890,
        Pal_08A1D8B0,
    };

    Decompress(Img_PrepWindow, (void *)(0x6000000 + vram));
    ApplyPalette(Pals_PrepWindow[gPlaySt.config.windowColor], pal);
    return;
}

//! FE8U = 0x08098C8C
void PutImg_PrepPopupWindow(int vram, int pal) {
    Decompress(Img_PrepPopupWindow, (void *)(0x06010000 + vram));
    ApplyPalette(gUiFramePaletteD, pal + 0x10);
    return;
}

//! FE8U = 0x08098CC0
void sub_8098CC0(struct PrepItemScreenProc * proc)
{
    LoadUiFrameGraphics();

    BG_SetPosition(1, 0, 4);

    sub_809A08C(proc);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    PutImg_PrepItemUseUnk(0x6000, 5);

    PutImg_PrepPopupWindow(0x800, 10);

    Decompress(gUnknown_08A1B8B8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    ApplyPalette(gUiFramePaletteD, 2);

    UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->hoverUnitIdx), 60, 76, 0x0503);

    sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);

    if (gGMData.state.bits.state_0) {
        sub_8098A74(TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 8));
    } else {
        sub_8098A04(TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 10));
    }

    proc->unitSelected = 0;

    ShowSysHandCursor(
        (proc->hoverUnitIdx % 3) * 64 + 24,
        ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->unk_34,
        7,
        0x800
    );

    sub_809A504(proc, 0);
    UnblockUiCursorHand();
    sub_80ACAA4();
    StartHelpPromptSprite(120, 140, 9, proc);

    sub_8098BE8();

    if (gGMData.state.bits.state_0) {
        StartParallelWorker(sub_8098B68, proc);
    } else {
        StartParallelWorker(sub_8098B48, proc);
    }

    PrepItemScreen_DrawFunds();
    HideUnitInfoBgSprites();

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x08098E40
s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc* proc) {
    int previous = proc->hoverUnitIdx;

    u16 keys = gKeyStatusPtr->repeatedKeys;

    proc->scrollAmount = 4;

    if (gKeyStatusPtr->heldKeys & L_BUTTON) {
        keys = gKeyStatusPtr->heldKeys;
        proc->scrollAmount = 8;
    }

    if (keys & DPAD_UP) {
        if ((proc->hoverUnitIdx - 3) >= 0) {
           proc->hoverUnitIdx -= 3;
        }
    }

    if (keys & DPAD_DOWN) {
        if ((proc->hoverUnitIdx + 3) < PrepGetUnitAmount()) {
            proc->hoverUnitIdx += 3;
        }
    }

    if (keys & DPAD_LEFT) {
        if ((proc->hoverUnitIdx % 3) != 0) {
            proc->hoverUnitIdx--;
        }
    }

    if (keys & DPAD_RIGHT) {
        if (((proc->hoverUnitIdx % 3) < 2) && ((proc->hoverUnitIdx + 1) < PrepGetUnitAmount())) {
            proc->hoverUnitIdx++;
        }
    }

    if (proc->hoverUnitIdx != previous) {
        int a = proc->hoverUnitIdx / 3 * 16;
        int b = (PrepGetUnitAmount() - 1) / 3 * 16;

        if (a - proc->unk_34 > 32 && proc->unk_34 + 48 < b) {
            sub_809A114(proc, (proc->unk_34 >> 4) + 4, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        } else if (a - proc->unk_34 < 0x10 && ({ proc->unk_34 + 0; }) != 0) {
            sub_809A114(proc, (proc->unk_34 >> 4) - 1, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        } else {
            ShowSysHandCursor(
                (proc->hoverUnitIdx % 3) * 64 + 24,
                (proc->hoverUnitIdx / 3) * 16 + 4 - proc->unk_34,
                7,
                0x800
            );
        }

        PlaySoundEffect(0x65);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08098FAC
void sub_8098FAC(struct PrepItemScreenProc* proc) {
    int a = (proc->hoverUnitIdx / 3) * 16;
    int b = ((PrepGetUnitAmount() - 1) / 3) * 16;

    if (((a - proc->unk_34) > 32) && ((proc->unk_34 + 48) < b)) {
        proc->unk_34 += proc->scrollAmount;
        BG_SetPosition(2, -40, (proc->unk_34 - 4) & 0xff);
        if (proc->selectedUnitIdx != 0xFF) {
            SetUiCursorHandConfig(
                0,
                ((proc->selectedUnitIdx % 3) * 64) + 24,
                ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->unk_34,
                2
            );
        }
        UpdateMenuScrollBarConfig(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    if (((a - proc->unk_34) < 16) && (proc->unk_34 != 0)) {
        proc->unk_34 -= proc->scrollAmount;
        BG_SetPosition(2, -40, (proc->unk_34 - 4) & 0xff);
        if (proc->selectedUnitIdx != 0xFF) {
            SetUiCursorHandConfig(
                0,
                ((proc->selectedUnitIdx % 3) * 64) + 24,
                ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->unk_34,
                2
            );
        }

        UpdateMenuScrollBarConfig(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }
    return;
}

//! FE8U = 0x080990D4
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_OnEnd(proc);
    SetStatScreenConfig(0x31);
    StartStatScreen(GetUnitFromPrepList(proc->hoverUnitIdx), proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x08099100
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc* proc) {
    PrepItemScreen_SetupGfx(proc);
    proc->hoverUnitIdx = GetLatestUnitIndexInPrepListByUId();
    sub_809A08C(proc);
    return;
}

//! FE8U = 0x08099120
void sub_8099120(struct PrepItemScreenProc* proc) {
    int tmp = proc->unk_34;

    if (!(tmp & 0xf)) {

        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            if (gGMData.state.bits.state_0) {
                switch (GetGMapBaseMenuKind()) {
                    case 3:
                        proc->selectedUnitIdx = proc->hoverUnitIdx;

                        if (((proc->hoverUnitIdx % 3) <= 1) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1)) {
                            proc->hoverUnitIdx++;
                        } else {
                            proc->hoverUnitIdx--;
                        }

                        break;

                    case 2:
                        if (UnitHasItem(GetUnitFromPrepList(proc->hoverUnitIdx), ITEM_MEMBERCARD)) {
                            PlaySoundEffect(0x6a);
                            Proc_Goto(proc, 13);
                            return;
                        }

                        PlaySoundEffect(0x6c);

                        return;

                    default:
                        Proc_Goto(proc, 0xd);
                        PlaySoundEffect(0x6a);
                        return;
                }
            } else {
                proc->selectedUnitIdx = proc->hoverUnitIdx;

                if (((proc->hoverUnitIdx % 3) < 2) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1)) {
                    proc->hoverUnitIdx++;
                } else {
                    proc->hoverUnitIdx--;
                }
            }

            SetUiCursorHandConfig(
                0,
                ((proc->selectedUnitIdx % 3) * 64) + 24,
                (proc->selectedUnitIdx / 3) * 16 + 4 - proc->unk_34,
                2
            );

            Proc_Goto(proc, 2);
            PlaySoundEffect(0x6a);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            if (gGMData.state.bits.state_0) {
                proc->unk_29 = 1;
            }

            Proc_Goto(proc, 13);
            PlaySoundEffect(0x6b);
            return;
        }

        if (PrepItemScreen_DpadKeyHandler(proc) != 0) {
            UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->hoverUnitIdx), 60, 76, 0x0503);
            sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);
            BG_EnableSyncByMask(1);
        }
    }

    sub_8098FAC(proc);

    return;
}

//! FE8U = 0x08099328
void sub_8099328(struct PrepItemScreenProc* proc, u16 * tm, struct Unit* unit) {
    TileMap_FillRect(tm, 10, 6, 0);

    ClearText(&gPrepItemScreenTexts[10]);
    Text_InsertDrawString(&gPrepItemScreenTexts[10], 0, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x594)); // TODO: msgid "Trade"
    Text_InsertDrawString(&gPrepItemScreenTexts[10], 32, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x595)); // TODO: msgid "List"

    PutText(&gPrepItemScreenTexts[10], tm + TILEMAP_INDEX(0, 1));

    ClearText(&gPrepItemScreenTexts[11]);
    Text_InsertDrawString(&gPrepItemScreenTexts[11], 0, !CanUnitPrepScreenUse(unit) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x596)); // TODO: msgid "Use"
    Text_InsertDrawString(&gPrepItemScreenTexts[11], 32, !proc->hasConvoyAccess ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x59A)); // TODO: msgid "Give all"
    PutText(&gPrepItemScreenTexts[11], tm + TILEMAP_INDEX(0, 3));

    ClearText(&gPrepItemScreenTexts[12]);
    Text_InsertDrawString(&gPrepItemScreenTexts[12], 0, !proc->hasConvoyAccess ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x598)); // TODO: msgid "Supply"

    if (gGMData.state.bits.state_0) {
        struct Text* th = &gPrepItemScreenTexts[12];
        int color = TEXT_COLOR_SYSTEM_WHITE;
        if ((!proc->hasConvoyAccess) || (GetUnitItemCount(unit) < 1) || CheckInLinkArena()) {
            color = TEXT_COLOR_SYSTEM_GRAY;
        }
        Text_InsertDrawString(th, 32, color, GetStringFromIndex(0x597)); // TODO: msgid "Sell"
    } else {
        if (CheckInLinkArena()) {
            Text_InsertDrawString(&gPrepItemScreenTexts[12], 32, TEXT_COLOR_SYSTEM_GRAY, GetStringFromIndex(0x599)); // TODO: msgid "Armory"
        } else {
            Text_InsertDrawString(&gPrepItemScreenTexts[12], 32, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x599)); // TODO: msgid "Armory"
        }
    }

    PutText(&gPrepItemScreenTexts[12], tm + TILEMAP_INDEX(0, 5));
    return;
}

//! FE8U = 0x080994C4
void sub_80994C4(struct PrepItemScreenProc* proc) {
    const char* str;
    int x;
    struct Text* th;

    struct Unit* unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    proc->unitSelected = 1;
    BG_Fill(BG_GetMapBuffer(0), 0);

    sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);

    Decompress(gUnknown_08A1B8B8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    ShowUnitInfoBgSpritesAt(0, 31);

    PutFaceChibi(GetUnitPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9) - 0xa0, 0x270, 3, 0);

    ClearText(&gPrepItemScreenTexts[16]);

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(40, str);
    PutDrawText(&gPrepItemScreenTexts[16], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9) - 0x9a, 0, x, 0, str);

    PutTwoSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9) - 0x5b, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9) - 0x57, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_E);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9) - 0x58, 2, unit->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9) - 0x55, 2, unit->exp);

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x080995D4
void sub_80995D4(struct PrepItemScreenProc* proc) {
    s8 unk;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 9), 12, 20, 0);

    PutImg_PrepItemUseUnk(0x6000, 5);
    PutImg_PrepPopupWindow(0x800, 10);
    sub_80994C4(proc);

    unk = sub_809A21C(
        ((proc->selectedUnitIdx % 3) * 64) + 20,
        ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->unk_34
    );

    if (unk != 0) {
        BlockUiCursorHand();
    } else {
        UnblockUiCursorHand();
    }

    sub_8098BE8();

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x08099654
void sub_8099654(struct PrepItemScreenProc* proc) {
    sub_8099328(proc, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 9), GetUnitFromPrepList(proc->selectedUnitIdx));
    StartParallelWorker(sub_8098BC8, proc);
    StartHelpPromptSprite(120, 140, 9, proc);

    ShowSysHandCursor(
        (proc->popupPromptIdx & 1) * 32 + 144,
        (proc->popupPromptIdx >> 1) * 16 + 84,
        3,
        0x400
    );

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080996B0
void sub_80996B0(struct PrepItemScreenProc* proc) {
    struct Unit* unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    sub_809A504(proc, 0);
    sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), unit, 0);

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080996E8
void sub_80996E8(struct PrepItemScreenProc* proc) {
    int previous = proc->popupPromptIdx;

    if (proc->unk_2d == 0xff) {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            proc->unk_2d = proc->popupPromptIdx;

            if ((gGMData.state.bits.state_0)) {
                StartHelpBox(
                    (proc->popupPromptIdx & 1) * 32 + 136,
                    (proc->popupPromptIdx >> 1) * 16 + 84,
                    gHelpTextIds_GMapItemScreen[proc->popupPromptIdx]
                );
                return;
            } else {
                StartHelpBox(
                    (proc->popupPromptIdx & 1) * 32 + 136,
                    (proc->popupPromptIdx >> 1) * 16 + 84,
                    gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]
                );
                return;
            }
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            switch (proc->popupPromptIdx) {
                case 0:
                    if (PrepGetUnitAmount() < 2) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 4);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 1:
                    if (PrepGetUnitAmount() < 2) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 8);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 2:
                    if (!CanUnitPrepScreenUse(GetUnitFromPrepList(proc->selectedUnitIdx))) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 9);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 3:
                    if (CheckInLinkArena() && (!(GetUnitFromPrepList(proc->selectedUnitIdx)->state & US_NOT_DEPLOYED))) {
                        StartPrepErrorHelpbox(-1, -1, 0x088B, proc);
                        return;
                    }

                    if (proc->hasConvoyAccess) {
                        if (PrepItemScreen_GiveAll(GetUnitFromPrepList(proc->selectedUnitIdx)) != 0) {
                            sub_8099328(proc, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 9), GetUnitFromPrepList(proc->selectedUnitIdx));
                            sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);

                            BG_EnableSyncByMask(1);

                            PlaySoundEffect(0x6a);
                            return;
                        }
                    }

                    PlaySoundEffect(0x6c);
                    break;

                case 4:
                    if (!proc->hasConvoyAccess) {
                        PlaySoundEffect(0x6c);
                    } else {
                        Proc_Goto(proc, 10);
                        PlaySoundEffect(0x6a);
                    }

                    break;

                case 5:
                    if ((gGMData.state.bits.state_0) != 0) {
                        if (proc->hasConvoyAccess) {
                            int itemCount = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));
                            if ((itemCount > 0) && (!CheckInLinkArena())) {
                                Proc_Goto(proc, 11);
                                PlaySoundEffect(0x6a);
                                return;
                            }
                        }
                    } else {
                        if (!CheckInLinkArena()) {
                            Proc_Goto(proc, 12);
                            PlaySoundEffect(0x6a);
                            return;
                        }
                    }

                    PlaySoundEffect(0x6c);
                    break;

                default:
                    PlaySoundEffect(0x6c);
                    break;
            }

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            proc->hoverUnitIdx = proc->selectedUnitIdx;
            proc->selectedUnitIdx = 0xff;
            sub_80ACA84(0);
            PlaySoundEffect(0x6b);
            Proc_Goto(proc, 0);
            return;
        }
    } else if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
        CloseHelpBox();
        proc->unk_2d = 0xff;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        if ((proc->popupPromptIdx & 1) != 0) {
            proc->popupPromptIdx--;
        } else if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
            proc->popupPromptIdx++;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        if ((proc->popupPromptIdx & 1) == 0) {
            proc->popupPromptIdx++;
        } else if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
            proc->popupPromptIdx--;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (proc->popupPromptIdx >= 2) {
            proc->popupPromptIdx -= 2;
        } else if (gKeyStatusPtr->newKeys & DPAD_UP) {
            proc->popupPromptIdx += 4;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (proc->popupPromptIdx < 4) {
            proc->popupPromptIdx += 2;
        } else if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            proc->popupPromptIdx -= 4;
        }
    }

    if (previous == proc->popupPromptIdx) {
        return;
    }

    PlaySoundEffect(0x65);
    ShowSysHandCursor(
        (proc->popupPromptIdx & 1) * 32 + 144,
        (proc->popupPromptIdx >> 1) * 16 + 84,
        3,
        0x400
    );

    if (proc->unk_2d == 0xff) {
        return;
    }

    if (gGMData.state.bits.state_0) {
        StartHelpBox(
            (proc->popupPromptIdx & 1) * 38 + 144,
            (proc->popupPromptIdx >> 1) * 16 + 84,
            gHelpTextIds_GMapItemScreen[proc->popupPromptIdx]
        );
    } else {
        StartHelpBox(
            (proc->popupPromptIdx & 1) * 38 + 144,
            (proc->popupPromptIdx >> 1) * 16 + 84,
            gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]
        );
    }

    return;
}

//! FE8U = 0x08099AA0
void sub_8099AA0(struct PrepItemScreenProc* proc) {
    BG_Fill(BG_GetMapBuffer(0), 0);

    sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);
    sub_8099F7C(&gPrepItemScreenTexts[5], TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 0);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x08099AF8
void sub_8099AF8(struct PrepItemScreenProc* proc) {
    BG_SetPosition(1, 0, 4);

    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    TileMap_FillRect(gBG0TilemapBuffer, 31, 8, 0);

    PutImg_PrepItemUseUnk(0x6000, 5);

    Decompress(gUnknown_08A1B8B8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(gUnknown_08A1B990, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(15, 9), gGenericBuffer, 0x1000);

    proc->unitSelected = 0;

    ShowSysHandCursor(
        ((proc->hoverUnitIdx % 3) * 64) + 24,
        ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->unk_34,
        7,
        0x800
    );
    sub_809A504(proc, 0);

    BG_EnableSyncByMask(7);

    UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->selectedUnitIdx), 60, 76, 0x0503);
    UpdatePrepItemScreenFace(1, GetUnitFromPrepList(proc->hoverUnitIdx), 180, 76, 0x0502);

    SetUiCursorHandConfig(
        0,
        ((proc->selectedUnitIdx % 3) * 64) + 24,
        ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->unk_34,
        2
    );

    StartParallelFiniteLoop(sub_8099AA0, 1, proc);

    UnblockUiCursorHand();
    HideUnitInfoBgSprites();
    EndHelpPromptSprite();

    return;
}

//! FE8U = 0x08099C60
void sub_8099C60(void)
{
    sub_8098BE8();
    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x08099C70
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc* proc) {
    int tmp = proc->unk_34;

    if (!(tmp & 0xf)) {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            int itemCountA = GetUnitItemCount(GetUnitFromPrepList(proc->hoverUnitIdx));
            int itemCountB = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));
            if ((proc->hoverUnitIdx != proc->selectedUnitIdx) && ((itemCountA > 0) || (itemCountB > 0))) {
                Proc_Goto(proc, 6);
                PlaySoundEffect(0x6a);
                return;
            }
            PlaySoundEffect(0x6c);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            EndPrepItemScreenFace(1);
            Proc_Goto(proc, 2);
            PlaySoundEffect(0x6b);
            return;
        }

        if (PrepItemScreen_DpadKeyHandler(proc) != 0) {
            UpdatePrepItemScreenFace(1, GetUnitFromPrepList(proc->hoverUnitIdx), 180, 76, 0x0502);
            sub_8099F7C(&gPrepItemScreenTexts[5], TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);
            sub_8099F7C(&gPrepItemScreenTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 1);
            BG_EnableSyncByMask(1);
        }
    }

    sub_8098FAC(proc);

    return;
}

//! FE8U = 0x08099DB8
void StartPrepItemTradeScreen(struct PrepItemScreenProc* proc) {
    PrepItemScreen_OnEnd(proc);

    StartPrepItemTradeScreenProc(
        GetUnitFromPrepList(proc->selectedUnitIdx),
        GetUnitFromPrepList(proc->hoverUnitIdx),
        proc
    );

    return;
}

//! FE8U = 0x08099DE8
void StartPrepItemUse(struct PrepItemScreenProc* proc) {
    StartPrepItemUseScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E00
void StartPrepItemSupply(struct PrepItemScreenProc* proc) {
    StartPrepItemSupplyProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E18
void StartPrepSell(struct PrepItemScreenProc* proc) {
    StartWorldMapSellScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E30
void StartPrepItemListScreen(struct PrepItemScreenProc* proc) {
    StartPrepItemListScreenProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E48
void StartPrepArmory(struct PrepItemScreenProc* proc) {
    StartArmoryScreen(GetUnitFromPrepList(proc->selectedUnitIdx), gPrepShopInventory, proc);
    return;
}

//! FE8U = 0x08099E68
void sub_8099E68(struct PrepItemScreenProc * proc)
{
    if (!gGMData.state.bits.state_0) {
        return;
    }

    if (!proc->unk_29) {
        return;
    }

    SetGMapBaseMenuPid(0);

    return;
}

struct ProcCmd CONST_DATA ProcScr_PrepItemScreen[] = {
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_Init),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_CALL(sub_8098CC0),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_CALL(sub_8098CC0),

    // fallthrough

PROC_LABEL(1),
    PROC_REPEAT(sub_8099120),
    PROC_CALL(DisableAllGfx),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(sub_8098CC0),
    PROC_SLEEP(0),

    PROC_CALL(EnableAllGfx),

    PROC_GOTO(1),

PROC_LABEL(2),
    PROC_CALL(sub_80995D4),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_SLEEP(0),

    PROC_CALL(sub_8099654),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(sub_80996E8),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(PrepItemScreen_HideFunds),
    PROC_CALL(sub_8099AF8),
    PROC_SLEEP(0),

    PROC_CALL(sub_8099C60),

    // fallthrough

PROC_LABEL(5),
    PROC_REPEAT(PrepItemScreen_Loop_MainKeyHandler),
    PROC_CALL(DisableAllGfx),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(sub_8099AF8),
    PROC_CALL(sub_8099C60),
    PROC_SLEEP(0),

    PROC_CALL(EnableAllGfx),

    PROC_GOTO(5),

PROC_LABEL(6),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(StartPrepItemTradeScreen),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0),

    PROC_CALL(sub_8099AF8),
    PROC_CALL(sub_8099C60),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(5),

PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepItemListScreen),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0),

    PROC_CALL(sub_8034194),
    PROC_CALL(sub_80996B0),
    PROC_CALL(sub_80995D4),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_8099654),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(9),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepItemUse),
    PROC_SLEEP(0),

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0),

    PROC_CALL(sub_8034194),
    PROC_CALL(sub_80996B0),
    PROC_CALL(sub_80995D4),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_8099654),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepItemSupply),
    PROC_SLEEP(0),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0),
    PROC_CALL(sub_8034194),
    PROC_CALL(sub_80996B0),
    PROC_CALL(sub_80995D4),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_8099654),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(11),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepSell),
    PROC_SLEEP(0),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0),
    PROC_CALL(sub_8034194),
    PROC_CALL(sub_80996B0),
    PROC_CALL(sub_80995D4),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_8099654),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(12),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepArmory),
    PROC_SLEEP(0),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0),
    PROC_CALL(sub_8034194),
    PROC_CALL(sub_80996B0),
    PROC_CALL(sub_80995D4),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_8099654),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(13),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),

    PROC_CALL(sub_8099E68),

    PROC_END,
};

//! FE8U = 0x08099E98
void UpdatePrepItemScreenFace(int slot, struct Unit* unit, u16 x, u16 y, u16 disp) {
    struct PrepItemScreenProc* proc = Proc_Find(ProcScr_PrepItemScreen);

    if (proc->pUnits[slot] != unit) {
        if (proc->pUnits[slot] != NULL) {
            EndFaceById(slot);
        }

        if (unit != NULL) {
            StartFace2(slot, GetUnitPortraitId(unit), (s16)x, (s16)y, disp);
        }
    } else {
        if (unit != NULL) {
            sub_8006618(slot, (s16)x, (s16)y);
            SetFaceDisplayBitsById(slot, disp);
        }
    }

    proc->pUnits[slot] = unit;

    proc->xFacePosBySlot[slot] = x;
    proc->yFacePosBySlot[slot] = y;
    proc->faceDispBySlot[slot] = disp;

    return;
}

//! FE8U = 0x08099F50
void EndPrepItemScreenFace(int slot) {
    UpdatePrepItemScreenFace(slot, NULL, 0, 0, 0);
    return;
}

//! FE8U = 0x08099F68
ProcPtr StartPrepItemScreen(ProcPtr proc) {
    return Proc_StartBlocking(ProcScr_PrepItemScreen, proc);
}

//! FE8U = 0x08099F7C
void sub_8099F7C(struct Text* th, u16 * tm, struct Unit* unit, u16 flags) {
    int itemCount;
    int i;

    TileMap_FillRect(tm, 12, 20, 0);

    if ((flags & 2) != 0) {
        ResetIconGraphics();
    }

    if (!unit) {
        return;
    }

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; th++, i++) {
        u16 item = unit->items[i];

        int isUnusable = ((flags & 4) != 0)
            ? !CanUnitUseItemPrepScreen(unit, item)
            : !IsItemDisplayUsable(unit, item);

        if ((flags & 1) == 0) {
            ClearText(th);
            Text_SetColor(th, isUnusable);
            Text_SetCursor(th, 0);
            Text_DrawString(th, GetItemName(item));
        }

        DrawIcon(tm + i * 0x40, GetItemIconId(item), 0x4000);

        PutText(th, tm + 2 + i * 0x40);

        PutNumberOrBlank(tm + 11 + i * 0x40, !isUnusable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));
    }

    return;
}

//! FE8U = 0x0809A08C
void sub_809A08C(struct PrepItemScreenProc* proc) {
    int a = proc->hoverUnitIdx / 3;
    int b = a * 16;
    int c = ((PrepGetUnitAmount() - 1) / 3) * 16;
    int d = b - proc->unk_34;

    if (d >= 33) {
        if (b == c) {
            proc->unk_34 = b - 48;
        } else {
            proc->unk_34 = b - 32;
        }
    } else {
        if (d <= 0xf) {
            if (b == 0) {
                proc->unk_34 = b;
            } else {
                proc->unk_34 = b - 16;
            }
        }
    }

    BG_SetPosition(2, -40, (proc->unk_34 - 4) & 0xff);
    UpdateMenuScrollBarConfig(6, proc->unk_34, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    return;
}

//! FE8U = 0x0809A114
void sub_809A114(struct PrepItemScreenProc* proc, u8 unk, s8 flag) {
    int idx;
    int isWorldMapMaybe;
    int i;
    int prepUnitAmt;
    struct Text* th;
    int newIdx;
    int x;
    int y;

    idx = ((unk) * 3);
    th = &gPrepItemTexts[idx % 0xf];

    if (gGMData.state.bits.state_0 && GetGMapBaseMenuKind() == 2) {
        isWorldMapMaybe = 1;
    } else {
        isWorldMapMaybe = 0;
    }

    for (i = 0; i < 3; th++, i++) {
        if (flag == 0) {
            ClearText(th);
        }

        newIdx = idx + i;
        prepUnitAmt = PrepGetUnitAmount();

        if (newIdx >= prepUnitAmt) {
            continue;
        }

        x = ((i % 3) * 8);
        y = ((unk * 2)) & 0x1f;
        if (flag == 0) {
            struct Unit* unit = GetUnitFromPrepList(newIdx);

            Text_SetCursor(th, 0);

            if (isWorldMapMaybe) {
                if (UnitHasItem(unit, ITEM_MEMBERCARD)) {
                    Text_SetColor(th, TEXT_COLOR_SYSTEM_WHITE);
                } else {
                    Text_SetColor(th, TEXT_COLOR_SYSTEM_GRAY);
                }
            } else {
                Text_SetColor(th, TEXT_COLOR_SYSTEM_WHITE);
            }

            Text_DrawString(th, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        PutText(th, TILEMAP_LOCATED(gBG2TilemapBuffer, x, y));
    }

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x0809A21C
s8 sub_809A21C(u32 x, int y) {
    if ((x < 97) && (y > 31)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0809A230
void sub_809A230(struct Unit * unit, u16 x, u16 y)
{
    int oam2Base;

    int classId = unit->pClassData->number;

    if (UnitHasItem(unit, ITEM_MEMBERCARD)) {
        oam2Base = OAM2_PAL(12);
    } else {
        oam2Base = OAM2_PAL(15);
    }

    PutUnitSpriteForClassId(0, x, y, oam2Base + OAM2_LAYER(2), classId);

    return;
}

//! FE8U = 0x0809A274
void sub_809A274(struct PrepItemScreenProc* proc) {
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        int x = (i % 3) * 64;
        u32 y = (i / 3) * 16 - proc->unk_34;

        if (y + 20 > 68) {
            continue;
        }

        if ((proc->unitSelected != 0) && (sub_809A21C(x, y) != 0)) {
            continue;
        }

        if (((gGMData.state.bits.state_0)) && (GetGMapBaseMenuKind() == 2)) {
            sub_809A230(GetUnitFromPrepList(i), (x + 24) & 0xffff, (y + 4) & 0xff);
        } else {
            PutUnitSprite(0, (x + 24), (y + 4) & 0xff, GetUnitFromPrepList(i));
        }
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x0809A31C
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2) {
    int i;
    int j;

    if ((w <= 0) || (h <= 0)) {
        return;
    }

    PutSpriteExt(4, x, y, gObject_8x8, oam2 + 0);
    PutSpriteExt(4, x + w * 8, y, gObject_8x8, oam2 + 3);
    PutSpriteExt(4, x + w * 8, y + h * 8, gObject_8x8, oam2 + 0xd);
    PutSpriteExt(4, x, y + h * 8, gObject_8x8, oam2 + 0xa);

    for (j = 1; j < (w - 1); j += 2) {
        PutSpriteExt(4, x + j * 8, y, gObject_16x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_16x8, oam2 + 0xb);
    }

    for (; j < w; j++) {
        PutSpriteExt(4, x + j * 8, y, gObject_8x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_8x8, oam2 + 0xb);
    }

    for (i = 1; i < h; i++) {
        PutSpriteExt(4, x, y + i * 8, gObject_8x8, oam2 + 4);
        PutSpriteExt(4, x + w * 8, y + i * 8, gObject_8x8, oam2 + 9);
    }

    for (i = 1; i < h; i++) {
        for (j = 1; j < w - 3; j += 4) {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_32x8, oam2 + 5);
        }

        for (; j < w - 1; j += 2) {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_16x8, oam2 + 5);
        }

        for (; j < w ; j++) {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_8x8, oam2 + 5);
        }
    }

    return;
}

//! FE8U = 0x0809A504
void sub_809A504(struct PrepItemScreenProc* proc, u8 unk)
{
    int i;

    for (i = (proc->unk_34 >> 4); i < (proc->unk_34 >> 4) + 4; i++)
        sub_809A114(proc, i, unk);
}

//! FE8U = 0x0809A538
bool PrepItemScreen_GiveAll(struct Unit * unit)
{
    int i;

    int unitItemCount = GetUnitItemCount(unit);
    int convoyItemCount = GetConvoyItemCount_();

    for (i = 0; (i < unitItemCount) && (i + convoyItemCount < CONVOY_ITEM_COUNT); i++)
    {
        AddItemToConvoy(unit->items[0]);
        UnitRemoveItem(unit, 0);
    }

    if (i > 0)
        return true;

    return false;
}

// Unused?
u16 CONST_DATA gSprite_08A18E1C[] = {
    3,
    0x4000, 0x0000, 0x0800,
    0x4008, 0x0000, 0x0806,
    0x4010, 0x0000, 0x080C,
};

// Unused?
u16 CONST_DATA gUnknown_08A18E30[] = {
    0x0200, 0x0204,
};
