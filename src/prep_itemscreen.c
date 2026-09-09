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

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);

EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32] = {};

u16 CONST_DATA gPrepShopInventory[] =
{
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

int CONST_DATA gHelpTextIds_PrepItemScreen[] =
{
    MSG_5AF, // "Exchange items[NL]between units."
    MSG_5B3, // "Display all units' items.[.]"
    MSG_5B0, // "Use items."
    MSG_5B5, // "Place all items in storage.[.]"
    MSG_5B1, // "Transfer items to and[.][NL]from storage.[.]"
    MSG_5B2, // "Buy and sell items.[.]"
};

int CONST_DATA gHelpTextIds_GMapItemScreen[] =
{
    MSG_5AF, // "Exchange items[NL]between units."
    MSG_5B3, // "Display all units' items.[.]"
    MSG_5B0, // "Use items."
    MSG_5B5, // "Place all items in storage.[.]"
    MSG_5B1, // "Transfer items to and[.][NL]from storage.[.]"
    MSG_5B4, // "Sell your unneeded items.[.][NL]Important items cannot be sold.[.]"
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
    proc->helpboxActiveIdx = -1;
    proc->popupPromptIdx = 0;
    proc->scrollOffset = 0;
    proc->pUnits[1] = NULL;
    proc->pUnits[0] = NULL;
    proc->hasConvoyAccess = HasConvoyAccess_();
    return;
}

//! FE8U = 0x08098448
void DrawFundsSprite_Init(struct DrawFundsSpriteProc * proc)
{
    Decompress(Img_PrepFunds, OBJ_CHR_ADDR(0x180));
    ApplyPalette(Pal_PrepFunds, proc->pal + 0x10);
    return;
}

// clang-format off

u16 CONST_DATA gSprite_PrepFunds[] =
{
    4,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x50),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x54),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16, OAM2_CHR(0x58),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x5C),
};

// clang-format on

//! FE8U = 0x08098474
void DrawFundsSprite_Loop(struct DrawFundsSpriteProc * proc)
{
    if (proc->visible)
    {
        PutSpriteExt(4, proc->x, proc->y, gSprite_PrepFunds, OAM2_PAL(proc->pal) + OAM2_CHR(0x180) + OAM2_LAYER(1));
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_DrawPrepFundsSprite[] =
{
    PROC_YIELD,

    PROC_CALL(DrawFundsSprite_Init),
    PROC_REPEAT(DrawFundsSprite_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080984A8
void StartDrawPrepFundsSprite(int x, int y, int pal, ProcPtr parent)
{
    struct DrawFundsSpriteProc * proc = Proc_Start(gProcScr_DrawPrepFundsSprite, parent);
    proc->visible = false;
    proc->x = x;
    proc->y = y;
    proc->pal = pal;
    return;
}

//! FE8U = 0x080984CC
void ShowPrepFundsSpriteAt(int x, int y)
{
    struct DrawFundsSpriteProc * proc = Proc_Find(gProcScr_DrawPrepFundsSprite);
    proc->visible = true;
    proc->x = x;
    proc->y = y;
    return;
}

//! FE8U = 0x080984EC
void HidePrepFundsSprite(void)
{
    struct DrawFundsSpriteProc * proc = Proc_Find(gProcScr_DrawPrepFundsSprite);
    proc->visible = false;
    return;
}

//! FE8U = 0x08098500
void EndDrawPrepFundsSprite(void)
{
    Proc_End(Proc_Find(gProcScr_DrawPrepFundsSprite));
    return;
}

//! FE8U = 0x08098514
void DrawUnitInfoBg_Init(void)
{
    ApplyPalette(gUiFramePaletteA, 0x12);
    return;
}

// clang-format off

u16 CONST_DATA gSprite_PrepUnitInfoBg[] =
{
    6,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, 0,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16, OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x14),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x18),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(96), OAM2_CHR(0x1C),
};

// clang-format on

//! FE8U = 0x0809852C
void DrawUnitInfoBg_Loop(struct DrawPrepUnitInfoBgProc * proc)
{
    if (proc->visible)
    {
        PutSpriteExt(4, proc->x, proc->y, gSprite_PrepUnitInfoBg, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(2));
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_DrawUnitInfoBgSprites[] =
{
    PROC_CALL(DrawUnitInfoBg_Init),
    PROC_REPEAT(DrawUnitInfoBg_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08098554
void StartDrawPrepUnitInfoBgSprites(ProcPtr parent)
{
    struct DrawPrepUnitInfoBgProc * proc = Proc_Start(gProcScr_DrawUnitInfoBgSprites, parent);
    proc->visible = false;
    proc->x = 0;
    proc->y = 0;
    return;
}

//! FE8U = 0x08098570
void ShowUnitInfoBgSpritesAt(int x, int y)
{
    struct DrawPrepUnitInfoBgProc * proc = Proc_Find(gProcScr_DrawUnitInfoBgSprites);
    proc->visible = true;
    proc->x = x;
    proc->y = y;
    return;
}

//! FE8U = 0x08098590
void HideUnitInfoBgSprites(void)
{
    struct DrawPrepUnitInfoBgProc * proc = Proc_Find(gProcScr_DrawUnitInfoBgSprites);
    proc->visible = false;
    return;
}

//! FE8U = 0x080985A4
void EndDrawPrepUnitInfoBgSprites(void)
{
    Proc_End(Proc_Find(gProcScr_DrawUnitInfoBgSprites));
    return;
}

//! FE8U = 0x080985B8
void PrepItemScreen_DrawFunds(void)
{
    PutText(&gPrepItemTexts[30], TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17));
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 17), TEXT_COLOR_SYSTEM_BLUE, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 28, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    ShowPrepFundsSpriteAt(168, 133);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08098600
void PrepItemScreen_HideFunds(void)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17), 10, 1, 0);
    HidePrepFundsSprite();

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08098620
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc)
{
    int i;

    struct FaceVramEntry faceConfig[4] =
    {
        {
            0x2C0 * CHR_SIZE,
            6,
        },
        {
            0x340 * CHR_SIZE,
            7,
        },
        {
            0,
            0,
        },
        {
            0,
            0,
        },
    };

    SetupBackgrounds(gBgConfig_ItemUseScreen);

    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    SetupFaceGfxData(faceConfig);

    SetDispEnable(0, 0, 0, 0, 0);

    SetupDebugFontForOBJ((u32)OBJ_CHR_ADDR(0x3C0), 0);

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
    StartParallelWorker(PrepItem_PutUnitGridSprites, proc);
    StartUiCursorHand(proc);

    SetPrimaryHBlankHandler(NULL);

    BG_Fill(BG_GetMapBuffer(BG_0), 0);
    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    for (i = 0; i < 15; i++)
    {
        InitText(gPrepItemTexts + i, 5);
    }

    for (i = 0; i < 5; i++)
    {
        InitText(&gPrepItemTexts[15 + i], 7);
        InitText(&gPrepItemTexts[20 + i], 7);
    }

    InitTextDb(&gPrepItemTexts[25], 8);
    InitTextDb(&gPrepItemTexts[26], 8);
    InitText(&gPrepItemTexts[27], 8);
    InitText(&gPrepItemTexts[30], 7);
    InitText(&gPrepItemTexts[31], 5);

    LoadHelpBoxGfx(OBJ_CHR_ADDR(0x200), -1);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 4, 240, 68);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    BG_SetPosition(BG_0, 4, -4);
    BG_SetPosition(BG_1, 0, 4);
    BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ApplyUnitSpritePalettes();
    CpuFastFill(RGB_BLACK, PAL_OBJ(11), PLTT_SIZE_4BPP);

    ForceSyncUnitSpriteSheet();

    Decompress(Img_PrepTextShadow, OBJ_CHR_ADDR(0x1F0));
    UiCursorHand_0(0, 0, 0, 208, 60);
    DisplaySysHandCursorTextShadow(0x30 * CHR_SIZE, 1);

    RestartMuralBackground();

    if (proc->selectedUnitIdx != 0xff)
    {
        SetUiCursorHandConfig(
            0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        UpdatePrepItemScreenFace(
            0, GetUnitFromPrepList(proc->selectedUnitIdx), 60, 76,
            FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);
    }

    StartMenuScrollBarExt(proc, 224, 11, 0x200, 4);
    UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    UnlockMenuScrollBar();

    PrepUpdateSMS();

    SetBlendAlpha(8, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    SetPrimaryHBlankHandler(PrepItemScreen_OnHBlank);

    StartDrawPrepFundsSprite(168, 133, 11, proc);
    StartDrawPrepUnitInfoBgSprites(proc);

    return;
}

//! FE8U = 0x080989BC
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc)
{
    struct Unit * unit = GetUnitFromPrepList(proc->hoverUnitIdx);
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
void PutPrepItemScreenPromptText(u16 * tilemap)
{
    TileMap_FillRect(tilemap, 10, 6, 0);

    ClearText(&gPrepItemTexts[25]);
    ClearText(&gPrepItemTexts[26]);

    PutDrawText(
        &gPrepItemTexts[25], TILEMAP_LOCATED(tilemap, 1, 1), TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(MSG_583) // "Choose unit[.]"
    );
    PutDrawText(
        &gPrepItemTexts[26], TILEMAP_LOCATED(tilemap, 1, 3), TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(MSG_584) // " [.]"
    );

    return;
}

//! FE8U = 0x08098A74
void PutWmItemScreenPromptText(u16 * tilemap)
{
    int textId;

    TileMap_FillRect(tilemap, 10, 8, 0);

    ClearText(&gPrepItemTexts[25]);
    ClearText(&gPrepItemTexts[26]);
    ClearText(&gPrepItemTexts[27]);

    switch (GetGMapBaseMenuKind())
    {
    case SHOP_TYPE_ARMORY:
        textId = MSG_672; // "Enter Armory"
        break;

    case SHOP_TYPE_VENDOR:
        textId = MSG_673; // "Enter Shop"
        break;

    case SHOP_TYPE_SECRET_SHOP:
        textId = MSG_674; // "Enter ? Shop"
        break;

    case SHOP_TYPE_MANAGE_ITEMS:
        textId = MSG_675; // "Manage Items"
        break;
    }

    PutDrawText(
        &gPrepItemTexts[25], TILEMAP_LOCATED(tilemap, 0, 2), TEXT_COLOR_SYSTEM_WHITE, 4, 0, GetStringFromIndex(textId));
    PutDrawText(
        &gPrepItemTexts[26], TILEMAP_LOCATED(tilemap, 0, 4), TEXT_COLOR_SYSTEM_WHITE, 4, 0,
        GetStringFromIndex(MSG_583)); // "Choose unit"
    PutDrawText(
        &gPrepItemTexts[27], TILEMAP_LOCATED(tilemap, 0, 6), TEXT_COLOR_SYSTEM_WHITE, 4, 0,
        GetStringFromIndex(MSG_584)); // " [.]"

    return;
}

//! FE8U = 0x08098B48
void PrepItem_DrawPromptBox(void)
{
    PrepItemDrawPopupBox(136, 89, 9, 4, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
    return;
}

//! FE8U = 0x08098B68
void PrepItem_DrawPromptBoxGMap(void)
{
    switch (GetGMapBaseMenuKind())
    {
    case SHOP_TYPE_MANAGE_ITEMS:
        PrepItemDrawPopupBox(136, 81, 9, 6, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
        break;

    default:
        PrepItemDrawPopupBox(136, 81, 9, 6, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
        break;
    }

    return;
}

//! FE8U = 0x08098BA8
void PrepItem_DrawItemListBox(void)
{
    PrepItemDrawPopupBox(8, 92, 10, 5, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
    return;
}

//! FE8U = 0x08098BC8
void PrepItem_DrawCommandMenuBox(void)
{
    PrepItemDrawPopupBox(136, 81, 9, 6, OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(10));
    return;
}

//! FE8U = 0x08098BE8
void PrepItem_EndPopupBoxWorkers(void)
{
    if (gGMData.state.bits.state_0)
    {
        Proc_End(GetParallelWorker(PrepItem_DrawPromptBoxGMap));
    }
    else
    {
        Proc_End(GetParallelWorker(PrepItem_DrawPromptBox));
    }

    Proc_End(GetParallelWorker(PrepItem_DrawItemListBox));
    Proc_End(GetParallelWorker(PrepItem_DrawCommandMenuBox));

    return;
}

//! FE8U = 0x08098C3C
void PutImg_PrepItemUseUnk(int vram, int pal)
{
    u16 * Pals_PrepWindow[] =
    {
        Pal_PrepWindowA,
        Pal_PrepWindowB,
        Pal_PrepWindowC,
        Pal_PrepWindowD,
    };

    Decompress(Img_PrepWindow, BG_CHR_ADDR(0x0) + vram);
    ApplyPalette(Pals_PrepWindow[gPlaySt.config.windowColor], pal);
    return;
}

//! FE8U = 0x08098C8C
void PutImg_PrepPopupWindow(int vram, int pal)
{
    Decompress(Img_PrepPopupWindow, OBJ_CHR_ADDR(0x0) + vram);
    ApplyPalette(gUiFramePaletteD, pal + 0x10);
    return;
}

//! FE8U = 0x08098CC0
void PrepItem_DrawUnitGridScreen(struct PrepItemScreenProc * proc)
{
    LoadUiFrameGraphics();

    BG_SetPosition(BG_1, 0, 4);

    PrepItem_SnapGridScroll(proc);

    BG_Fill(BG_GetMapBuffer(BG_0), 0);
    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    PutImg_PrepItemUseUnk(0x300 * CHR_SIZE, 5);
    PutImg_PrepPopupWindow(0x40 * CHR_SIZE, 10);

    Decompress(Tsa_PrepItemScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, TILEREF(0x0, 1));
    ApplyPalette(gUiFramePaletteD, 2);

    UpdatePrepItemScreenFace(
        0, GetUnitFromPrepList(proc->hoverUnitIdx), 60, 76,
        FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);

    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);

    if (gGMData.state.bits.state_0)
    {
        PutWmItemScreenPromptText(TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 8));
    }
    else
    {
        PutPrepItemScreenPromptText(TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 10));
    }

    proc->unitSelected = false;

    ShowSysHandCursor(
        (proc->hoverUnitIdx % 3) * 64 + 24, ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 7, 0x40 * CHR_SIZE);

    PrepItemScreen_DrawVisibleUnitNames(proc, 0);
    UnblockUiCursorHand();
    ClearAllUiCursorHandConfig();
    StartHelpPromptSprite(120, 140, 9, proc);

    PrepItem_EndPopupBoxWorkers();

    if (gGMData.state.bits.state_0)
    {
        StartParallelWorker(PrepItem_DrawPromptBoxGMap, proc);
    }
    else
    {
        StartParallelWorker(PrepItem_DrawPromptBox, proc);
    }

    PrepItemScreen_DrawFunds();
    HideUnitInfoBgSprites();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x08098E40
s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc * proc)
{
    int previous = proc->hoverUnitIdx;

    u16 keys = gKeyStatusPtr->repeatedKeys;

    proc->scrollAmount = 4;

    if (gKeyStatusPtr->heldKeys & L_BUTTON)
    {
        keys = gKeyStatusPtr->heldKeys;
        proc->scrollAmount = 8;
    }

    if (keys & DPAD_UP)
    {
        if ((proc->hoverUnitIdx - 3) >= 0)
        {
            proc->hoverUnitIdx -= 3;
        }
    }

    if (keys & DPAD_DOWN)
    {
        if ((proc->hoverUnitIdx + 3) < PrepGetUnitAmount())
        {
            proc->hoverUnitIdx += 3;
        }
    }

    if (keys & DPAD_LEFT)
    {
        if ((proc->hoverUnitIdx % 3) != 0)
        {
            proc->hoverUnitIdx--;
        }
    }

    if (keys & DPAD_RIGHT)
    {
        if (((proc->hoverUnitIdx % 3) < 2) && ((proc->hoverUnitIdx + 1) < PrepGetUnitAmount()))
        {
            proc->hoverUnitIdx++;
        }
    }

    if (proc->hoverUnitIdx != previous)
    {
        int hoverYPos = proc->hoverUnitIdx / 3 * 16;
        int yMax = (PrepGetUnitAmount() - 1) / 3 * 16;

        if (hoverYPos - proc->scrollOffset > 32 && proc->scrollOffset + 48 < yMax)
        {
            PrepItem_DrawUnitNameRow(proc, (proc->scrollOffset >> 4) + 4, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        }
        else if (hoverYPos - proc->scrollOffset < 0x10 && ({ proc->scrollOffset + 0; }) != 0)
        {
            PrepItem_DrawUnitNameRow(proc, (proc->scrollOffset >> 4) - 1, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        }
        else
        {
            ShowSysHandCursor(
                (proc->hoverUnitIdx % 3) * 64 + 24, (proc->hoverUnitIdx / 3) * 16 + 4 - proc->scrollOffset, 7,
                0x40 * CHR_SIZE);
        }

        PlaySoundEffect(SONG_65);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08098FAC
void PrepItem_UpdateGridScroll(struct PrepItemScreenProc * proc)
{
    int hoverYPos = (proc->hoverUnitIdx / 3) * 16;
    int yMax = ((PrepGetUnitAmount() - 1) / 3) * 16;

    if (((hoverYPos - proc->scrollOffset) > 32) && ((proc->scrollOffset + 48) < yMax))
    {
        proc->scrollOffset += proc->scrollAmount;

        BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);

        if (proc->selectedUnitIdx != 0xFF)
        {
            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        }

        UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    if (((hoverYPos - proc->scrollOffset) < 16) && (proc->scrollOffset != 0))
    {
        proc->scrollOffset -= proc->scrollAmount;

        BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);

        if (proc->selectedUnitIdx != 0xFF)
        {
            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        }

        UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    return;
}

//! FE8U = 0x080990D4
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_OnEnd(proc);
    SetStatScreenConfig(STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONUNK16 | STATSCREEN_CONFIG_NONSUPPLY);
    StartStatScreen(GetUnitFromPrepList(proc->hoverUnitIdx), proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x08099100
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_SetupGfx(proc);
    proc->hoverUnitIdx = GetLatestUnitIndexInPrepListByUId();
    PrepItem_SnapGridScroll(proc);
    return;
}

//! FE8U = 0x08099120
void PrepItem_GridSelectLoop(struct PrepItemScreenProc * proc)
{
    int tmp = proc->scrollOffset;

    if (!(tmp & 15))
    {
        if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            if (gGMData.state.bits.state_0)
            {
                switch (GetGMapBaseMenuKind())
                {
                case SHOP_TYPE_MANAGE_ITEMS:
                    proc->selectedUnitIdx = proc->hoverUnitIdx;

                    if (((proc->hoverUnitIdx % 3) <= 1) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1))
                    {
                        proc->hoverUnitIdx++;
                    }
                    else
                    {
                        proc->hoverUnitIdx--;
                    }

                    break;

                case SHOP_TYPE_SECRET_SHOP:
                    if (UnitHasItem(GetUnitFromPrepList(proc->hoverUnitIdx), ITEM_MEMBERCARD))
                    {
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        Proc_Goto(proc, 13);
                        return;
                    }

                    PlaySoundEffect(SONG_6C);

                    return;

                default:
                    Proc_Goto(proc, 13);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                    return;
                }
            }
            else
            {
                proc->selectedUnitIdx = proc->hoverUnitIdx;

                if (((proc->hoverUnitIdx % 3) < 2) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1))
                {
                    proc->hoverUnitIdx++;
                }
                else
                {
                    proc->hoverUnitIdx--;
                }
            }

            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, (proc->selectedUnitIdx / 3) * 16 + 4 - proc->scrollOffset, 2);

            Proc_Goto(proc, 2);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            if (gGMData.state.bits.state_0)
            {
                proc->unk_29 = 1;
            }

            Proc_Goto(proc, 13);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (PrepItemScreen_DpadKeyHandler(proc) != 0)
        {
            UpdatePrepItemScreenFace(
                0, GetUnitFromPrepList(proc->hoverUnitIdx), 60, 76,
                FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);
            PrepItemScreen_DrawUnitItems(
                &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->hoverUnitIdx),
                2);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    PrepItem_UpdateGridScroll(proc);

    return;
}

//! FE8U = 0x08099328
void PrepItem_DrawCommandMenuText(struct PrepItemScreenProc * proc, u16 * tilemap, struct Unit * unit)
{
    TileMap_FillRect(tilemap, 10, 6, 0);

    ClearText(&gPrepItemTexts[25]);
    Text_InsertDrawString(
        &gPrepItemTexts[25], 0, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(MSG_594)); // "Trade"
    Text_InsertDrawString(
        &gPrepItemTexts[25], 32, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(MSG_595)); // "List"
    PutText(&gPrepItemTexts[25], TILEMAP_LOCATED(tilemap, 0, 1));

    ClearText(&gPrepItemTexts[26]);
    Text_InsertDrawString(
        &gPrepItemTexts[26], 0, !CanUnitPrepScreenUse(unit) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(MSG_596)); // "Use"
    Text_InsertDrawString(
        &gPrepItemTexts[26], 32, !proc->hasConvoyAccess ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(MSG_59A)); // "Give all"
    PutText(&gPrepItemTexts[26], TILEMAP_LOCATED(tilemap, 0, 3));

    ClearText(&gPrepItemTexts[27]);
    Text_InsertDrawString(
        &gPrepItemTexts[27], 0, !proc->hasConvoyAccess ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(MSG_598)); // "Supply"

    if (gGMData.state.bits.state_0)
    {
        struct Text * th = &gPrepItemTexts[27];
        int color = TEXT_COLOR_SYSTEM_WHITE;
        if ((!proc->hasConvoyAccess) || (GetUnitItemCount(unit) < 1) || CheckInLinkArena())
        {
            color = TEXT_COLOR_SYSTEM_GRAY;
        }
        Text_InsertDrawString(th, 32, color, GetStringFromIndex(MSG_597)); // "Sell"
    }
    else
    {
        if (CheckInLinkArena())
        {
            Text_InsertDrawString(
                &gPrepItemTexts[27], 32, TEXT_COLOR_SYSTEM_GRAY, GetStringFromIndex(MSG_599)); // "Armory"
        }
        else
        {
            Text_InsertDrawString(
                &gPrepItemTexts[27], 32, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_599)); // "Armory"
        }
    }

    PutText(&gPrepItemTexts[27], TILEMAP_LOCATED(tilemap, 0, 5));

    return;
}

//! FE8U = 0x080994C4
void PrepItemScreen_DrawSelectedUnitDetails(struct PrepItemScreenProc * proc)
{
    const char * str;
    int x;

    struct Unit * unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    proc->unitSelected = true;
    BG_Fill(BG_GetMapBuffer(BG_0), 0);

    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);

    Decompress(Tsa_PrepItemScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, TILEREF(0x0, 1));

    ShowUnitInfoBgSpritesAt(0, 31);

    PutFaceChibi(GetUnitPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 4), 0x270, 3, false);

    ClearText(&gPrepItemTexts[31]);

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(40, str);

    PutDrawText(&gPrepItemTexts[31], TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 4), TEXT_COLOR_SYSTEM_WHITE, x, 0, str);

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 6), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 6), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_E);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 10, 6), TEXT_COLOR_SYSTEM_BLUE, unit->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 13, 6), TEXT_COLOR_SYSTEM_BLUE, unit->exp);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080995D4
void PrepItem_DrawSelectedUnitScreen(struct PrepItemScreenProc * proc)
{
    bool isCoordHidden;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 9), 12, 20, 0);

    PutImg_PrepItemUseUnk(0x300 * CHR_SIZE, 5);
    PutImg_PrepPopupWindow(0x40 * CHR_SIZE, 10);
    PrepItemScreen_DrawSelectedUnitDetails(proc);

    isCoordHidden = IsCoordHiddenByMinimug(((proc->selectedUnitIdx % 3) * 64) + 20, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset);

    if (isCoordHidden)
    {
        BlockUiCursorHand();
    }
    else
    {
        UnblockUiCursorHand();
    }

    PrepItem_EndPopupBoxWorkers();

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08099654
void PrepItem_InitCommandMenu(struct PrepItemScreenProc * proc)
{
    PrepItem_DrawCommandMenuText(proc, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 9), GetUnitFromPrepList(proc->selectedUnitIdx));
    StartParallelWorker(PrepItem_DrawCommandMenuBox, proc);
    StartHelpPromptSprite(120, 140, 9, proc);

    ShowSysHandCursor((proc->popupPromptIdx & 1) * 32 + 144, (proc->popupPromptIdx >> 1) * 16 + 84, 3, 0x20 * CHR_SIZE);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x080996B0
void PrepItem_RefreshSelectedUnitItems(struct PrepItemScreenProc * proc)
{
    struct Unit * unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    PrepItemScreen_DrawVisibleUnitNames(proc, 0);
    PrepItemScreen_DrawUnitItems(&gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), unit, 0);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080996E8
void PrepItem_CommandMenuLoop(struct PrepItemScreenProc * proc)
{
    int previous = proc->popupPromptIdx;

    if (proc->helpboxActiveIdx == 0xff)
    {
        if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            proc->helpboxActiveIdx = proc->popupPromptIdx;

            if (gGMData.state.bits.state_0)
            {
                StartHelpBox(
                    (proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84,
                    gHelpTextIds_GMapItemScreen[proc->popupPromptIdx]);
                return;
            }
            else
            {
                StartHelpBox(
                    (proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84,
                    gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]);
                return;
            }
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            switch (proc->popupPromptIdx)
            {
            case 0:
                if (PrepGetUnitAmount() < 2)
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 4);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 1:
                if (PrepGetUnitAmount() < 2)
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 8);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 2:
                if (!CanUnitPrepScreenUse(GetUnitFromPrepList(proc->selectedUnitIdx)))
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 9);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 3:
                if (CheckInLinkArena() && (!(GetUnitFromPrepList(proc->selectedUnitIdx)->state & US_NOT_DEPLOYED)))
                {
                    StartPrepErrorHelpbox(
                        -1, -1, MSG_88B, proc); // "If you have no usable[.][NL]weapons, you cannot attack.[.][X]"
                    return;
                }

                if (proc->hasConvoyAccess)
                {
                    if (PrepItemScreen_GiveAll(GetUnitFromPrepList(proc->selectedUnitIdx)) != 0)
                    {
                        PrepItem_DrawCommandMenuText(
                            proc, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 9),
                            GetUnitFromPrepList(proc->selectedUnitIdx));
                        PrepItemScreen_DrawUnitItems(
                            &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
                            GetUnitFromPrepList(proc->selectedUnitIdx), 0);

                        BG_EnableSyncByMask(BG0_SYNC_BIT);

                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        return;
                    }
                }

                PlaySoundEffect(SONG_6C);
                break;

            case 4:
                if (!proc->hasConvoyAccess)
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 10);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 5:
                if (gGMData.state.bits.state_0)
                {
                    if (proc->hasConvoyAccess)
                    {
                        int itemCount = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));
                        if ((itemCount > 0) && (!CheckInLinkArena()))
                        {
                            Proc_Goto(proc, 11);
                            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                            return;
                        }
                    }
                }
                else
                {
                    if (!CheckInLinkArena())
                    {
                        Proc_Goto(proc, 12);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        return;
                    }
                }

                PlaySoundEffect(SONG_6C);
                break;

            default:
                PlaySoundEffect(SONG_6C);
                break;
            }

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            proc->hoverUnitIdx = proc->selectedUnitIdx;
            proc->selectedUnitIdx = 0xff;
            ClearUiCursorHandConfig(0);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Goto(proc, 0);
            return;
        }
    }
    else if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        proc->helpboxActiveIdx = 0xff;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
    {
        if ((proc->popupPromptIdx & 1) != 0)
        {
            proc->popupPromptIdx--;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_LEFT)
        {
            proc->popupPromptIdx++;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
    {
        if ((proc->popupPromptIdx & 1) == 0)
        {
            proc->popupPromptIdx++;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
        {
            proc->popupPromptIdx--;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->popupPromptIdx >= 2)
        {
            proc->popupPromptIdx -= 2;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_UP)
        {
            proc->popupPromptIdx += 4;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->popupPromptIdx < 4)
        {
            proc->popupPromptIdx += 2;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_DOWN)
        {
            proc->popupPromptIdx -= 4;
        }
    }

    if (previous == proc->popupPromptIdx)
    {
        return;
    }

    PlaySoundEffect(SONG_65);

    ShowSysHandCursor((proc->popupPromptIdx & 1) * 32 + 144, (proc->popupPromptIdx >> 1) * 16 + 84, 3, 0x20 * CHR_SIZE);

    if (proc->helpboxActiveIdx == 0xff)
    {
        return;
    }

    if (gGMData.state.bits.state_0)
    {
        StartHelpBox(
            (proc->popupPromptIdx & 1) * 38 + 144, (proc->popupPromptIdx >> 1) * 16 + 84,
            gHelpTextIds_GMapItemScreen[proc->popupPromptIdx]);
    }
    else
    {
        StartHelpBox(
            (proc->popupPromptIdx & 1) * 38 + 144, (proc->popupPromptIdx >> 1) * 16 + 84,
            gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]);
    }

    return;
}

//! FE8U = 0x08099AA0
void PrepItem_TradeRedrawItems(struct PrepItemScreenProc * proc)
{
    BG_Fill(BG_GetMapBuffer(BG_0), 0);

    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);
    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[20], TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08099AF8
void PrepItem_InitTradeScreen(struct PrepItemScreenProc * proc)
{
    BG_SetPosition(BG_1, 0, 4);

    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    TileMap_FillRect(gBG0TilemapBuffer, 31, 8, 0);

    PutImg_PrepItemUseUnk(0x300 * CHR_SIZE, 5);

    Decompress(Tsa_PrepItemScreen, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0, 0), gGenericBuffer, TILEREF(0x0, 1));

    Decompress(Tsa_PrepItemTradeUnitPanel, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 15, 9), gGenericBuffer, TILEREF(0x0, 1));

    proc->unitSelected = false;

    ShowSysHandCursor(
        ((proc->hoverUnitIdx % 3) * 64) + 24, ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 7, 0x40 * CHR_SIZE);
    PrepItemScreen_DrawVisibleUnitNames(proc, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    UpdatePrepItemScreenFace(
        0, GetUnitFromPrepList(proc->selectedUnitIdx), 60, 76,
        FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);
    UpdatePrepItemScreenFace(
        1, GetUnitFromPrepList(proc->hoverUnitIdx), 180, 76,
        FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4) | FACE_DISP_BLEND);

    SetUiCursorHandConfig(
        0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);

    StartParallelFiniteLoop(PrepItem_TradeRedrawItems, 1, proc);

    UnblockUiCursorHand();
    HideUnitInfoBgSprites();
    EndHelpPromptSprite();

    return;
}

//! FE8U = 0x08099C60
void PrepItem_EndPopupBoxesAndSync(void)
{
    PrepItem_EndPopupBoxWorkers();
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return;
}

//! FE8U = 0x08099C70
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc * proc)
{
    int tmp = proc->scrollOffset;

    if (!(tmp & 15))
    {
        if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_Break(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            int itemCountA = GetUnitItemCount(GetUnitFromPrepList(proc->hoverUnitIdx));
            int itemCountB = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));

            if ((proc->hoverUnitIdx != proc->selectedUnitIdx) && ((itemCountA > 0) || (itemCountB > 0)))
            {
                Proc_Goto(proc, 6);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }

            PlaySoundEffect(SONG_6C);

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            EndPrepItemScreenFace(1);
            Proc_Goto(proc, 2);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (PrepItemScreen_DpadKeyHandler(proc) != 0)
        {
            UpdatePrepItemScreenFace(1, GetUnitFromPrepList(proc->hoverUnitIdx), 180, 76, 0x0502);
            PrepItemScreen_DrawUnitItems(
                &gPrepItemTexts[20], TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), GetUnitFromPrepList(proc->hoverUnitIdx),
                2);
            PrepItemScreen_DrawUnitItems(
                &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
                GetUnitFromPrepList(proc->selectedUnitIdx), 1);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    PrepItem_UpdateGridScroll(proc);

    return;
}

//! FE8U = 0x08099DB8
void StartPrepItemTradeScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_OnEnd(proc);

    StartPrepItemTradeScreenProc(
        GetUnitFromPrepList(proc->selectedUnitIdx), GetUnitFromPrepList(proc->hoverUnitIdx), proc);

    return;
}

//! FE8U = 0x08099DE8
void StartPrepItemUse(struct PrepItemScreenProc * proc)
{
    StartPrepItemUseScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E00
void StartPrepItemSupply(struct PrepItemScreenProc * proc)
{
    StartPrepItemSupplyProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E18
void StartPrepSell(struct PrepItemScreenProc * proc)
{
    StartWorldMapSellScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E30
void StartPrepItemListScreen(struct PrepItemScreenProc * proc)
{
    StartPrepItemListScreenProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E48
void StartPrepArmory(struct PrepItemScreenProc * proc)
{
    StartArmoryScreen(GetUnitFromPrepList(proc->selectedUnitIdx), gPrepShopInventory, proc);
    return;
}

//! FE8U = 0x08099E68
void PrepItem_ClearGMapMenuOnCancel(struct PrepItemScreenProc * proc)
{
    if (!gGMData.state.bits.state_0)
    {
        return;
    }

    if (!proc->unk_29)
    {
        return;
    }

    SetGMapBaseMenuPid(CHARACTER_NONE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_PrepItemScreen[] =
{
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_Init),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_CALL(PrepItem_DrawUnitGridScreen),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_YIELD,

    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_CALL(PrepItem_DrawUnitGridScreen),

    // fallthrough

PROC_LABEL(1),
    PROC_REPEAT(PrepItem_GridSelectLoop),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(PrepItem_DrawUnitGridScreen),
    PROC_YIELD,

    PROC_CALL(EnableAllGfx),

    PROC_GOTO(1),

PROC_LABEL(2),
    PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_YIELD,

    PROC_CALL(PrepItem_InitCommandMenu),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(PrepItem_CommandMenuLoop),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(PrepItemScreen_HideFunds),
    PROC_CALL(PrepItem_InitTradeScreen),
    PROC_YIELD,

    PROC_CALL(PrepItem_EndPopupBoxesAndSync),

    // fallthrough

PROC_LABEL(5),
    PROC_REPEAT(PrepItemScreen_Loop_MainKeyHandler),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(PrepItem_InitTradeScreen),
    PROC_CALL(PrepItem_EndPopupBoxesAndSync),
    PROC_YIELD,

    PROC_CALL(EnableAllGfx),

    PROC_GOTO(5),

PROC_LABEL(6),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(StartPrepItemTradeScreen),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,

    PROC_CALL(PrepItem_InitTradeScreen),
    PROC_CALL(PrepItem_EndPopupBoxesAndSync),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(5),

PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepItemListScreen),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepItem_RefreshSelectedUnitItems),
    PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(PrepItem_InitCommandMenu),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(9),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepItemUse),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepItem_RefreshSelectedUnitItems),
    PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(PrepItem_InitCommandMenu),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepItemSupply),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepItem_RefreshSelectedUnitItems),
    PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(PrepItem_InitCommandMenu),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(11),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepSell),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepItem_RefreshSelectedUnitItems),
    PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(PrepItem_InitCommandMenu),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(12),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepArmory),
    PROC_YIELD,

    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepItem_RefreshSelectedUnitItems),
    PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(PrepItem_InitCommandMenu),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(3),

PROC_LABEL(13),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemScreen_OnEnd),

    PROC_CALL(PrepItem_ClearGMapMenuOnCancel),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08099E98
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp)
{
    struct PrepItemScreenProc * proc = Proc_Find(ProcScr_PrepItemScreen);

    if (proc->pUnits[slot] != unit)
    {
        if (proc->pUnits[slot] != NULL)
        {
            EndFaceById(slot);
        }

        if (unit != NULL)
        {
            StartFace2(slot, GetUnitPortraitId(unit), (s16)x, (s16)y, disp);
        }
    }
    else
    {
        if (unit != NULL)
        {
            SetFacePosition(slot, (s16)x, (s16)y);
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
void EndPrepItemScreenFace(int slot)
{
    UpdatePrepItemScreenFace(slot, NULL, 0, 0, 0);
    return;
}

//! FE8U = 0x08099F68
ProcPtr StartPrepItemScreen(ProcPtr proc)
{
    return Proc_StartBlocking(ProcScr_PrepItemScreen, proc);
}

//! FE8U = 0x08099F7C
void PrepItemScreen_DrawUnitItems(struct Text * text, u16 * tilemap, struct Unit * unit, u16 flags)
{
    int itemCount;
    int i;

    TileMap_FillRect(tilemap, 12, 20, 0);

    if (flags & 2)
    {
        ResetIconGraphics();
    }

    if (unit == NULL)
    {
        return;
    }

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; text++, i++)
    {
        u16 item = unit->items[i];

        int isUnusable = (flags & 4) ? !CanUnitUseItemPrepScreen(unit, item) : !IsItemDisplayUsable(unit, item);

        if (!(flags & 1))
        {
            ClearText(text);
            Text_SetColor(text, isUnusable);
            Text_SetCursor(text, 0);
            Text_DrawString(text, GetItemName(item));
        }

        DrawIcon(TILEMAP_LOCATED(tilemap, 0, i * 2), GetItemIconId(item), OAM2_PAL(4));

        PutText(text, TILEMAP_LOCATED(tilemap, 2, i * 2));
        PutNumberOrBlank(
            TILEMAP_LOCATED(tilemap, 11, i * 2), !isUnusable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            GetItemUses(item));
    }

    return;
}

//! FE8U = 0x0809A08C
void PrepItem_SnapGridScroll(struct PrepItemScreenProc * proc)
{
    int hoverRow = proc->hoverUnitIdx / 3;
    int hoverYPos = hoverRow * 16;
    int yMax = ((PrepGetUnitAmount() - 1) / 3) * 16;
    int yDiff = hoverYPos - proc->scrollOffset;

    if (yDiff > 32)
    {
        if (hoverYPos == yMax)
        {
            proc->scrollOffset = hoverYPos - 48;
        }
        else
        {
            proc->scrollOffset = hoverYPos - 32;
        }
    }
    else if (yDiff < 16)
    {
        if (hoverYPos == 0)
        {
            proc->scrollOffset = hoverYPos;
        }
        else
        {
            proc->scrollOffset = hoverYPos - 16;
        }
    }

    BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);
    UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);

    return;
}

//! FE8U = 0x0809A114
void PrepItem_DrawUnitNameRow(struct PrepItemScreenProc * proc, u8 row, s8 flag)
{
    int i;
    int idx;
    struct Text * text;
    bool isWmSecretShop;

    idx = row * 3;
    text = &gPrepItemTexts[idx % 15];

    if (gGMData.state.bits.state_0 && GetGMapBaseMenuKind() == SHOP_TYPE_SECRET_SHOP)
    {
        isWmSecretShop = true;
    }
    else
    {
        isWmSecretShop = false;
    }

    for (i = 0; i < 3; text++, i++)
    {
        int x;
        int y;

        if (flag == 0)
        {
            ClearText(text);
        }

        if (idx + i >= PrepGetUnitAmount())
        {
            continue;
        }

        x = (i % 3) * 8;
        y = (row * 2) & 31;

        if (flag == 0)
        {
            struct Unit * unit = GetUnitFromPrepList(idx + i);

            Text_SetCursor(text, 0);

            if (isWmSecretShop)
            {
                if (UnitHasItem(unit, ITEM_MEMBERCARD))
                {
                    Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
                }
                else
                {
                    Text_SetColor(text, TEXT_COLOR_SYSTEM_GRAY);
                }
            }
            else
            {
                Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
            }

            Text_DrawString(text, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        PutText(text, TILEMAP_LOCATED(gBG2TilemapBuffer, x, y));
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

/**
 * Checks whether the coordinate would be hidden by
 * the "unit info" minimug box, when a unit is selected
 * on the prep item screen.
 */
//! FE8U = 0x0809A21C
bool IsCoordHiddenByMinimug(u32 x, int y)
{
    if ((x < 97) && (y > 31))
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0809A230
void PutClassSpriteForSecretShop(struct Unit * unit, u16 x, u16 y)
{
    int oam2Base;

    int classId = unit->pClassData->number;

    if (UnitHasItem(unit, ITEM_MEMBERCARD))
    {
        oam2Base = OAM2_PAL(12);
    }
    else
    {
        oam2Base = OAM2_PAL(15);
    }

    PutUnitSpriteForClassId(0, x, y, oam2Base + OAM2_LAYER(2), classId);

    return;
}

//! FE8U = 0x0809A274
void PrepItem_PutUnitGridSprites(struct PrepItemScreenProc * proc)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++)
    {
        int x = (i % 3) * 64;
        u32 y = (i / 3) * 16 - proc->scrollOffset;

        if (y + 20 > 68)
        {
            continue;
        }

        if (proc->unitSelected && IsCoordHiddenByMinimug(x, y))
        {
            continue;
        }

        if (gGMData.state.bits.state_0 && GetGMapBaseMenuKind() == SHOP_TYPE_SECRET_SHOP)
        {
            PutClassSpriteForSecretShop(GetUnitFromPrepList(i), (x + 24) & 0xffff, (y + 4) & 0xff);
        }
        else
        {
            PutUnitSprite(0, (x + 24), (y + 4) & 0xff, GetUnitFromPrepList(i));
        }
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x0809A31C
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2)
{
    int i;
    int j;

    if ((w <= 0) || (h <= 0))
    {
        return;
    }

    PutSpriteExt(4, x, y, gObject_8x8, oam2 + 0);
    PutSpriteExt(4, x + w * 8, y, gObject_8x8, oam2 + 3);
    PutSpriteExt(4, x + w * 8, y + h * 8, gObject_8x8, oam2 + 13);
    PutSpriteExt(4, x, y + h * 8, gObject_8x8, oam2 + 10);

    for (j = 1; j < (w - 1); j += 2)
    {
        PutSpriteExt(4, x + j * 8, y, gObject_16x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_16x8, oam2 + 11);
    }

    for (; j < w; j++)
    {
        PutSpriteExt(4, x + j * 8, y, gObject_8x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_8x8, oam2 + 11);
    }

    for (i = 1; i < h; i++)
    {
        PutSpriteExt(4, x, y + i * 8, gObject_8x8, oam2 + 4);
        PutSpriteExt(4, x + w * 8, y + i * 8, gObject_8x8, oam2 + 9);
    }

    for (i = 1; i < h; i++)
    {
        for (j = 1; j < w - 3; j += 4)
        {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_32x8, oam2 + 5);
        }

        for (; j < w - 1; j += 2)
        {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_16x8, oam2 + 5);
        }

        for (; j < w; j++)
        {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_8x8, oam2 + 5);
        }
    }

    return;
}

//! FE8U = 0x0809A504
void PrepItemScreen_DrawVisibleUnitNames(struct PrepItemScreenProc * proc, u8 flag)
{
    int i;

    for (i = (proc->scrollOffset >> 4); i < (proc->scrollOffset >> 4) + 4; i++)
        PrepItem_DrawUnitNameRow(proc, i, flag);
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

// clang-format off

// Unused?
u16 CONST_DATA gSprite_PrepItemscreen_0[] =
{
    3,
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8, OAM2_LAYER(2),
    OAM0_SHAPE_16x8 + OAM0_Y(8), OAM1_SIZE_16x8, OAM2_CHR(0x6) + OAM2_LAYER(2),
    OAM0_SHAPE_16x8 + OAM0_Y(16), OAM1_SIZE_16x8, OAM2_CHR(0xC) + OAM2_LAYER(2),
};

// Unused?
u16 CONST_DATA gPrepItemscreen_0[] =
{
    0x0200, 0x0204,
};

// clang-format on
