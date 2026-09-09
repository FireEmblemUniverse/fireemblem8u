#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"

EWRAM_OVERLAY(0) struct PrepItemSuppyText PrepItemSuppyTexts = {};

//! FE8U = 0x0809D244
void PrepItemSupply_PutPromptBoxSprites(void)
{
    int i;
    for (i = 0; i < 4; i++)
        PutSpriteExt(4, 48 + i * 32, 16, gObject_32x16, 0xDFC0 + i * 4);
}

int CONST_DATA gSupplyTextIndexLookup[] = {
    0x5A5, // TODO: msgid "What'll you do?[.]"
    0x5A6, // TODO: msgid "I'll take it.[.]"
    0x5A7, // TODO: msgid "Here you go!"
};

char* CONST_DATA gpPrepItemSupplyStringBuffer = gBufPrep;

//! FE8U = 0x0809D278
void PrepItemSupply_StartPromptText(int idx, ProcPtr proc)
{
    StartParallelWorker(PrepItemSupply_PutPromptBoxSprites, proc);

    NewSysboxText(
        0x7800,
        0xd,
        GetStringFromIndexInBuffer(gSupplyTextIndexLookup[idx], gpPrepItemSupplyStringBuffer),
        1,
        2,
        3,
        proc
    );

    return;
}

//! FE8U = 0x0809D2C4
void StoreConvoyWeaponIconGraphics(int vramOffset, int pal) {
    ApplyPalette(Pal_PrepConvoyWeaponIcon, pal);
    Decompress(Img_PrepConvoyWeaponIconGfxA, (void*)(VRAM + vramOffset));
    Decompress(Img_PrepConvoyWeaponIconGfxB, (void*)(0x6000200 + vramOffset));
    return;
}

//! FE8U = 0x0809D300
void PrepItemSupply_DrawItemList(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit)
{
    int i;

    TileMap_FillRect(tm, 12, 31, 0);

    if (gPrepscreen_2 == 0) {
        ClearText(textBase);
        Text_InsertDrawString(textBase, 0, 1, GetStringFromIndex(0x5a8)); // TODO: msgid "Nothing[.]"
        PutText(textBase, tm + 3);
        return;
    }

    for (i = yLines; (i < yLines + 7) && (i < gPrepscreen_2); i++) {
        struct Text* th = textBase + (i & 7);
        int item = gPrepScreenItemList[i].item;
        int unusable = !IsItemDisplayUsable(unit, item);

        ClearText(th);

        Text_InsertDrawString(
            th,
            0,
            unusable,
            GetItemName(item)
        );

        DrawIcon(tm + TILEMAP_INDEX(1, i*2 & 0x1f), GetItemIconId(item), 0x4000);

        PutText(th, tm + TILEMAP_INDEX(3, i*2 & 0x1f));

        PutNumberOrBlank(tm + TILEMAP_INDEX(12, i*2 & 0x1f), !unusable ? 2 : 1, GetItemUses(item));
    }

    return;
}

//! FE8U = 0x0809D418
void PrepItemSupply_DrawItemListIcons(u16 * tm, int yLines) {
    int i;

    for (i = yLines; i < yLines + 7 && i < gPrepscreen_2; i++) {
        int item = gPrepScreenItemList[i].item;
        DrawIcon(tm + TILEMAP_INDEX(1, i * 2 & 0x1f), GetItemIconId(item), 0x4000);
    }

    return;
}

//! FE8U = 0x0809D47C
void PrepItemSupply_DrawItemListRow(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit)
{
    if (gPrepscreen_2 > yLines) {
        int y = (yLines * 2) & 0x1f;
        struct Text* th = textBase + (yLines & 7);
        int item = gPrepScreenItemList[yLines].item;
        int unusable = !IsItemDisplayUsable(unit, item);

        int offset = TILEMAP_INDEX(0, y);
        TileMap_FillRect(tm + offset, 12, 1, 0);

        ClearText(th);
        Text_InsertDrawString(th, 0, unusable, GetItemName(item));
        DrawIcon(tm + offset + 1, GetItemIconId(item), 0x4000);
        PutText(th, tm + offset + 3);

        PutNumberOrBlank(tm + offset + 12, !unusable ? 2 : 1,  GetItemUses(item));
    }
}

//! FE8U = 0x0809D530
void PrepItemSupply_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 12)
    {
        REG_BLDCNT = (BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
        // FIXME: No cast
        *(vu16*)(REG_ADDR_BLDY) = 8;
    }

    if ((vcount == 52) || (vcount == 0))
    {
        REG_BLDCNT = 0;
        // FIXME: No cast
        *(vu16*)(REG_ADDR_BLDY) = 0;
    }
}

//! FE8U = 0x0809D570
void PrepItemSupply_Init(struct PrepItemSupplyProc * proc)
{
    int i;

    proc->unk_38 = 0;
    proc->unk_36 = 0xff;

    if (GetUnitItemCount(proc->unit) == 0) {
        proc->unk_33 = 1;
    } else {
        proc->unk_33 = 0;
    }

    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();
        if (pGMapBaseMenuProc) {
            proc->currentPage = pGMapBaseMenuProc->unk_2b;
        } else {
            proc->currentPage = 0;
        }
    } else {
        if (proc->unk_30 == 0) {
            struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
            proc->currentPage = pAtMenuProc->unk_32;
        } else {
            proc->currentPage = 0;
        }
    }

    proc->scrollAmount = 4;
    proc->unitInvIdx = 0;

    for (i = 0; i < 9; i++) {
        proc->idxPerPage[i] = 0;
        proc->yOffsetPerPage[i] = 0;
    }
    return;
}

//! FE8U = 0x0809D608
void PrepItemSupply_InitGiveTakeText(void)
{
    InitSpriteTextFont(&PrepItemSuppyTexts.font, (void*)0x06011000, 0xb);
    ApplyPalette(Pal_Text, 0x1B);
    InitSpriteText(&PrepItemSuppyTexts.th[0xf]);
    SetTextFont(NULL);
    return;
}

//! FE8U = 0x0809D644
void PrepItemSupply_DrawGiveTakeText(struct PrepItemSupplyProc * proc)
{
    int color;
    struct Text* th;

    int convoyItemCount = GetConvoyItemCount_();
    int unitItemCount = GetUnitItemCount(proc->unit);

    SetTextFont(&PrepItemSuppyTexts.font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&PrepItemSuppyTexts.th[0xf], 0);
    th = &PrepItemSuppyTexts.th[0xf];

    color = 0;
    if ((convoyItemCount == CONVOY_ITEM_COUNT) || (unitItemCount == 0))
        color = 1;

    Text_InsertDrawString(
        th,
        0,
        color,
        GetStringFromIndex(0x59E) // TODO: msgid "Give"
    );

    Text_InsertDrawString(
        &PrepItemSuppyTexts.th[0xf],
        0x40,
        unitItemCount == UNIT_ITEM_COUNT ? 1 : 0,
        GetStringFromIndex(0x59F) // TODO: msgid "Take"
    );

    SetTextFont(NULL);
}

//! FE8U = 0x0809D6CC
void PrepItemSupply_DrawConvoyHeader(void)
{
    SetTextFont(NULL);
    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 12, 1, 0);

    PutDrawText(&PrepItemSuppyTexts.th[0], gBG0TilemapBuffer + 0x34 + 0x6d, 0, 2, 0, GetStringFromIndex(0x598));
    PutFaceChibi(FID_SUPPLY, gBG0TilemapBuffer + 0x34 - 0x13, 0x270, 2, 1);
    PutDrawText(&PrepItemSuppyTexts.th[0] + 1, gBG0TilemapBuffer + 0x34 - 1, 0, 4, 0, GetStringFromIndex(0x5a0));

    PutNumber(
        gBG0TilemapBuffer + 0x34 + 5,
        (GetConvoyItemCount_() == CONVOY_ITEM_COUNT) ? 4 : 2,
        GetConvoyItemCount_()
    );
    PutSpecialChar(gBG0TilemapBuffer + 0x34 + 6, TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_SLASH);
    PutNumber(gBG0TilemapBuffer + 0x34 + 9, 2, CONVOY_ITEM_COUNT);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x0809D784
void PutGiveTakeBoxSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x21, 5, 4, 0xA840);
    PutSpriteExt(4, 72, 0x25, gObject_32x16, 0xB080);
    PutSpriteExt(4, 72, 0x35, gObject_32x16, 0xB088);
    return;
}

//! FE8U = 0x0809D7D4
void PutGiveSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x21, 5, 2, 0xA840);
    PutSpriteExt(4, 72, 0x25, gObject_32x16, 0xB080);
    return;
}

//! FE8U = 0x0809D80C
void PutTakeSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x31, 5, 2, 0xA840);
    PutSpriteExt(4, 72, 0x35, gObject_32x16, 0xB088);
    return;
}

//! FE8U = 0x0809D844
void Supply_PutHighlightedCategorySprites(struct PrepItemSupplyProc * proc)
{
    int x = proc->currentPage * 12 + 124;

    gPaletteBuffer[0x14D] = *(Pal_PrepItemListSpinningArrowCycle + (GetGameClock() >> 2 & 0xf));
    EnablePaletteSync();

    PutSprite(4, x, 24, gPrepWmSell_1[proc->currentPage], 0x4280);
    PutSprite(4, x, 24, gPrepWmSell_0, 0x4280);

    UpdateMenuScrollBarConfig(0xc, proc->yOffsetPerPage[proc->currentPage], gPrepscreen_2, 7);

    return;
}

#define TILEREF_(aChar, aPal) (((aPal) << 12) + (aChar))

//! FE8U = 0x0809D8D4
void PrepItemSupply_DrawConvoyWeaponIconTiles(u16 * tm, u32 chr, int pal)
{
    int i;

    for (i = 0; i < 0xf; i++) {
        tm[i] = TILEREF_(((chr) & 0x1ffff) / 0x20, pal) + i;
        tm[0x20 + i] = TILEREF_(((chr + 0x200) & 0x1ffff) / 0x20, pal) + i;
    }
}

#undef TILEREF_

//! FE8U = 0x0809D914
void PrepItemSupply_ResetBackgrounds(struct PrepItemSupplyProc * proc)
{

    gLCDControlBuffer.dispcnt.mode = 0;
    SetupBackgrounds(NULL);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 1;
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
    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 0x28);

    LoadHelpBoxGfx((void*)0x06013000, -1);
    LoadIconPalettes(4);
    RestartMuralBackground();
    BG_EnableSyncByMask(8);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x0809DA00
void PrepItemSupply_InitGfx(struct PrepItemSupplyProc * proc)
{
    int i;
    int unk;

    PutImg_PrepItemUseUnk(0x5000, 5);
    PutImg_PrepPopupWindow(0x800, 10);

    Decompress(Tsa_PrepItemSupplyBgA, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(Tsa_PrepItemSupplyBgB, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    BG_EnableSyncByMask(7);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0, proc);
    EnableSysBrownBox(0, 0x90, 6, 2);
    GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
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

    SetBlendConfig(0, 0, 0, 8);
    StartGreenText(proc);
    StartHelpPromptSprite(195, 147, 9, proc);

    InitText(&PrepItemSuppyTexts.th[0], 4);
    InitText(&PrepItemSuppyTexts.th[1], 4);

    PrepItemSupply_InitGiveTakeText();

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        InitText(&PrepItemSuppyTexts.th[2 + i], 7);
    }

    for (i = 0; i < 8; i++) {
        InitTextDb(&PrepItemSuppyTexts.th[7 + i], 7);
    }

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(PrepItemSupply_OnHBlank);

    StoreConvoyWeaponIconGraphics(0x4000, 6);
    PrepItemSupply_DrawConvoyWeaponIconTiles(gBG0TilemapBuffer + 0x6F, 0x4000, 6);

    Decompress(Img_PrepItemListSpinningArrow, (void*)0x06015000);
    ApplyPalette(Pal_SpinningArrow, 0x14);

    StartMenuScrollBarExt(proc, 0xe1, 0x2f, 0x5800, 9);
    UnlockMenuScrollBar();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);

    PrepItemSupply_DrawItemList(
        &PrepItemSuppyTexts.th[7],
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );
    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x6F + 0xb3, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    PrepItemSupply_DrawConvoyHeader();
    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowPositions(0x78, 0x18, 0xe9, 0x18);
    SetUiSpinningArrowConfig(3);
    StartParallelWorker(Supply_PutHighlightedCategorySprites, proc);

    return;
}

//! FE8U = 0x0809DC70
void PrepItemSupply_EnterGiveTakeMenu(struct PrepItemSupplyProc * proc)
{
    PrepItemSupply_StartPromptText(0, proc);
    ClearUiCursorHandConfig(0);
    PrepItemSupply_DrawGiveTakeText(proc);
    ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
    Proc_End(GetParallelWorker(PutGiveSprites));
    Proc_End(GetParallelWorker(PutTakeSprites));
    StartParallelWorker(PutGiveTakeBoxSprites, proc);
    BG_EnableSyncByMask(7);
    return;
}

int CONST_DATA gSupplyHelpTextIndexLookup[] = {
    0x5B6, // TODO: msgid "Put items in storage. Up to[.][NL]100 items can be put in storage."
    0x5B7, // TODO: msgid "Receive item.[.][NL]A unit can carry up to 5 items.[.]"
};

//! FE8U = 0x0809DCD4
void PrepItemSupply_Loop_GiveTakeKeyHandler(struct PrepItemSupplyProc * proc)
{
    int idx = proc->unk_33;

    if (proc->unk_38 == 0) {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            switch (idx) {
                case 0:
                    if ((GetConvoyItemCount_() < CONVOY_ITEM_COUNT) && (GetUnitItemCount(proc->unit) > 0)) {
                        SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                        Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                        StartParallelWorker(PutGiveSprites, proc);
                        PrepItemSupply_StartPromptText(1, proc);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        Proc_Goto(proc, 3);
                        return;
                    }

                    PlaySoundEffect(SONG_6C);
                    break;
                case 1:
                    if (GetUnitItemCount(proc->unit) < UNIT_ITEM_COUNT) {
                        SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                        Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                        StartParallelWorker(PutTakeSprites, proc);
                        PrepItemSupply_StartPromptText(2, proc);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        Proc_Goto(proc, 4);
                        return;
                    }

                    PlaySoundEffect(SONG_6C);
                    break;
            }
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 8);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[idx]);
            proc->unk_38 = 1;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_38 = 0;
            return;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (proc->unk_33 != 0) {
            proc->unk_33--;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unk_33 = 1;
            }
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (proc->unk_33 == 0) {
            proc->unk_33++;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unk_33 = 0;
            }
        }
    }

    if (idx != proc->unk_33) {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
        if (proc->unk_38 != 0) {
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[proc->unk_33]);
        }
    }
    return;
}

//! FE8U = 0x0809DEFC
void PrepItemSupply_RedrawAfterPageSwitch(struct PrepItemSupplyProc * proc)
{
    ResetIconGraphics_();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    PrepItemSupply_DrawItemList(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);
    ShowSysHandCursor(0x80, proc->idxPerPage[proc->currentPage] * 16 + 0x28 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);

    BG_EnableSyncByMask(5);

    if (proc->unk_38 == 0) {
        return;
    }

    if (gPrepscreen_2 != 0) {
        int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        StartItemHelpBox(
            0x80,
            proc->idxPerPage[proc->currentPage] * 0x10 + 0x28 - proc->yOffsetPerPage[proc->currentPage],
            item
        );
        proc->unk_38 = 1;
    } else {
        CloseHelpBox();
        proc->unk_38 = 0xff;
    }

    return;
}

//! FE8U = 0x0809DFB0
void PrepItemSupply_SwitchPageLeft(struct PrepItemSupplyProc * proc)
{
    int x = 0;
    int four = 4;

    proc->unk_34++;

    if (proc->unk_34 < four) {
        int tmp = (((4 - proc->unk_34) * 0x60 * (4 - proc->unk_34)) / (four * four));
        x = tmp - 0x60;
    }

    if (proc->unk_34 == four) {
        if (proc->currentPage == 0) {
            proc->currentPage = 8;
        } else {
            proc->currentPage--;
        }
        PrepItemSupply_RedrawAfterPageSwitch(proc);
    }

    if (proc->unk_34 >= four) {
        int tmp = four - (proc->unk_34 - four);
        x = (tmp * 0x60 * tmp) / (four * four);
    }

    BG_SetPosition(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_34 == four * 2) {
        Proc_Goto(proc, 4);
    }

    return;
}

//! FE8U = 0x0809E054
void PrepItemSupply_SwitchPageRight(struct PrepItemSupplyProc * proc)
{
    int x;

    int four = 4;

    proc->unk_34++;

    if (proc->unk_34 < four) {
        int tmp = (((4 - proc->unk_34) * 0x60 * (4 - proc->unk_34)) / (four * four));
        x = 0x60 - tmp;
    }

    if (proc->unk_34 == four) {
        if (proc->currentPage == 8) {
            proc->currentPage = 0;
        } else {
            proc->currentPage++;
        }
        PrepItemSupply_RedrawAfterPageSwitch(proc);
    }

    if (proc->unk_34 >= four) {
        int tmp = four - (proc->unk_34 - four);
        x = -((tmp * 0x60 * tmp) / (four * four));
    }

    BG_SetPosition(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_34 == four * 2) {
        Proc_Goto(proc, 4);
    }

    return;
}

//! FE8U = 0x0809E100
void PrepItemSupply_ClampScroll(struct PrepItemSupplyProc * proc)
{

    if (gPrepscreen_2 == 0) {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    } else {
        if (proc->idxPerPage[proc->currentPage] > (gPrepscreen_2 - 1)) {
            proc->idxPerPage[proc->currentPage] = gPrepscreen_2 - 1;
        }
    }

    if (gPrepscreen_2 > 6) {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > gPrepscreen_2) {
            proc->yOffsetPerPage[proc->currentPage] = (gPrepscreen_2 - 7) * 0x10;
        }
    }

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 0x28);

    return;
}

//! FE8U = 0x0809E184
void PrepItemSupply_AdjustCursorAndScroll(struct PrepItemSupplyProc * proc)
{
    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) &&
        (proc->idxPerPage[proc->currentPage] != 0)) {
        proc->idxPerPage[proc->currentPage]++;
    }

    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78) &&
        (proc->idxPerPage[proc->currentPage] != gPrepscreen_2 - 1)) {
        proc->idxPerPage[proc->currentPage]--;
    }

    PrepItemSupply_ClampScroll(proc);

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    return;
}

//! FE8U = 0x0809E218
void PrepItemSupply_ScrollVertical(struct PrepItemSupplyProc * proc, int amount)
{
    ResetIconGraphics_();

    PrepItemSupply_DrawItemListIcons(gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    BG_EnableSyncByMask(5);

    if (amount < 0) {
        PrepItemSupply_DrawItemListRow(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1,  proc->unit);
    }

    if (amount > 0) {
        PrepItemSupply_DrawItemListRow(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);
    }

    proc->yOffsetPerPage[proc->currentPage] += amount;

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}

//! FE8U = 0x0809E2BC
void PrepItemSupply_RedrawConvoyHeaderWorker(void)
{
    PrepItemSupply_DrawConvoyHeader();
    return;
}

//! FE8U = 0x0809E2C8
void PrepItemSupply_TakeItemFromSupply(struct PrepItemSupplyProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if ((count == UNIT_ITEM_COUNT) || (gPrepscreen_2 == 0)) {
        PlaySoundEffect(SONG_6C);
        return;
    }

    proc->unk_38 = 0;

    proc->unit->items[count] = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item = 0;

    RebuildConvoyFromPrepList();

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    PrepItemSupply_ClampScroll(proc);
    ResetIconGraphics_();

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    PrepItemSupply_DrawItemList(
        &PrepItemSuppyTexts.th[7],
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );

    StartParallelFiniteLoop(PrepItemSupply_RedrawConvoyHeaderWorker, 1, proc);

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    gActionData.unitActionType = UNIT_ACTION_TRADED_SUPPLY;

    if (GetUnitItemCount(proc->unit) == UNIT_ITEM_COUNT) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    } else {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
    }

    return;
}

//! FE8U = 0x0809E420
void PrepItemSupply_Loop_ItemListKeyHandler(struct PrepItemSupplyProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    if ((proc->yOffsetPerPage[proc->currentPage] & 0xf) == 0) {
        if ((proc->unk_38 == 0) || (proc->unk_38 == 0xff)) {
            if (gKeyStatusPtr->newKeys & R_BUTTON) {
                if (gPrepscreen_2 != 0) {
                    int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item
                    );
                    proc->unk_38 = 1;
                    return;
                } else {
                    PlaySoundEffect(SONG_6C);
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                PrepItemSupply_TakeItemFromSupply(proc);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Goto(proc, 1);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
                proc->unk_38 = 0;
                return;
            }
        } else {
            if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
                CloseHelpBox();
                proc->unk_38 = 0;
                return;
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            SetUiSpinningArrowFastMaybe(0);
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
            Proc_Goto(proc, 5);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageLeft(proc);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            SetUiSpinningArrowFastMaybe(1);
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
            Proc_Goto(proc, 6);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageRight(proc);
            return;
        }

        if (gKeyStatusPtr->heldKeys & L_BUTTON) {
            proc->scrollAmount = 8;
        } else {
            proc->scrollAmount = 4;
        }

        if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) ||
            ((gKeyStatusPtr->heldKeys & DPAD_UP) && (proc->scrollAmount == 8))) {
            if (proc->idxPerPage[proc->currentPage] != 0) {
                proc->idxPerPage[proc->currentPage]--;
            }
        }

        if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) ||
            ((gKeyStatusPtr->heldKeys & DPAD_DOWN) && (proc->scrollAmount == 8))) {
            if (proc->idxPerPage[proc->currentPage] < gPrepscreen_2 - 1) {
                proc->idxPerPage[proc->currentPage]++;
            }
        }
    } else {
        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage]) < 0x38) {
            proc->yOffsetPerPage[proc->currentPage] -= proc->scrollAmount;
        }

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage]) > 0x78) {
            proc->yOffsetPerPage[proc->currentPage] += proc->scrollAmount;
        }

        BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);
    }

    if (idx != proc->idxPerPage[proc->currentPage]) {
        u16 item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) && (proc->idxPerPage[proc->currentPage] != 0)) {
            if (proc->unk_38 != 0) {
                StartItemHelpBox(
                    0x80,
                    proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] + 16,
                    item
                );
            }

            PrepItemSupply_ScrollVertical(proc, -proc->scrollAmount);
        } else {
            if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78)
                && (proc->idxPerPage[proc->currentPage] != gPrepscreen_2 - 1)) {

                if (proc->unk_38 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] - 0x10,
                        item
                    );
                }
                PrepItemSupply_ScrollVertical(proc, +proc->scrollAmount);
            } else {
                if (proc->unk_38 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item
                    );
                }

                ShowSysHandCursor(
                    0x80,
                    proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                    0xb,
                    0x800
                );
            }
        }
    }

    return;
}

//! FE8U = 0x0809E7A8
s8 PrepItemSupply_HandleUnitInvCursorInput(struct PrepItemSupplyProc * proc)
{

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int count = GetUnitItemCount(proc->unit);
        if (proc->unitInvIdx != 0) {
            proc->unitInvIdx--;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unitInvIdx = count - 1;
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
                return 1;
            }
        }

        return 0;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int count = GetUnitItemCount(proc->unit);
        if (proc->unitInvIdx < count - 1) {
            proc->unitInvIdx++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return 1;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unitInvIdx = 0;
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
                return 1;
            }
        }
    }

    return 0;
}

//! FE8U = 0x0809E840
void PrepItemSupply_SwitchToUnitInventory(struct PrepItemSupplyProc * proc)
{
    ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
    return;
}

//! FE8U = 0x0809E85C
void PrepItemSupply_GiveItemToSupply(struct PrepItemSupplyProc * proc)
{
    int unitItemCount;

    u16 item = proc->unit->items[proc->unitInvIdx];
    GetUnitItemCount(proc->unit); // Necessary for match, but pointless
    proc->unit->items[proc->unitInvIdx] = 0;
    UnitRemoveInvalidItems(proc->unit);

    proc->currentPage = GetPrepPageForItem(item);
    AddItemToConvoy(item);

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    PrepItemSupply_ClampScroll(proc);

    ResetIconGraphics_();
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    PrepItemSupply_DrawItemList(&PrepItemSuppyTexts.th[7], gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(PrepItemSupply_RedrawConvoyHeaderWorker, 1, proc);

    BG_EnableSyncByMask(4);

    unitItemCount = GetUnitItemCount(proc->unit);

    gActionData.unitActionType = UNIT_ACTION_TRADED_SUPPLY;

    if ((unitItemCount == 0) || (GetConvoyItemCount_() == CONVOY_ITEM_COUNT)) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    } else {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        if (unitItemCount <= proc->unitInvIdx) {
            proc->unitInvIdx = unitItemCount - 1;
            ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        }
    }

    return;
}

//! FE8U = 0x0809E974
void PrepItemSupply_Loop_UnitInvKeyHandler(struct PrepItemSupplyProc * proc)
{
    u16 item;

    if (proc->unk_38 == 1) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_38 = 0;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->unit->items[proc->unitInvIdx];
            if (item == 0) {
                return;
            }
            StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            proc->unk_38 = 1;
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            if (CheckValidLinkArenaItemRemoval(proc->unit, proc->unitInvIdx) == 0) {
                StartPrepErrorHelpbox(-1, -1, 0x88B, proc); // TODO: msgid "If you have no usable[.][NL]weapons, you cannot attack.[.]"
                return;
            }
            PrepItemSupply_GiveItemToSupply(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 1);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }
    }

    if (PrepItemSupply_HandleUnitInvCursorInput(proc) != 0) {
        ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        if (proc->unk_38 == 1) {
            item = proc->unit->items[proc->unitInvIdx];
            if (item != 0) {
                StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            }
        }
    }

    return;
}

//! FE8U = 0x0809EA7C
void PrepItemSupply_OnEnd(struct PrepItemSupplyProc * proc)
{
    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();
        if (pGMapBaseMenuProc) {
            pGMapBaseMenuProc->unk_2b = proc->currentPage;
        }
    } else {
        if (proc->unk_30 == 0) {
            struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
            pAtMenuProc->unk_32 = proc->currentPage;
        }
    }

    EndAllProcChildren(proc);
    EndMuralBackground_();

    SetPrimaryHBlankHandler(NULL);

    return;
}

struct ProcCmd CONST_DATA ProcScr_PrepItemSupplyScreen[] = {
    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(PrepItemSupply_Init),
    PROC_CALL(PrepItemSupply_ResetBackgrounds),

    PROC_SLEEP(1),

    PROC_CALL(PrepItemSupply_InitGfx),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

PROC_LABEL(1),
    PROC_CALL(PrepItemSupply_EnterGiveTakeMenu),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(PrepItemSupply_AdjustCursorAndScroll),
    PROC_REPEAT(PrepItemSupply_Loop_ItemListKeyHandler),

    // fallthrough

PROC_LABEL(5),
    PROC_REPEAT(PrepItemSupply_SwitchPageLeft),

    // fallthrough

PROC_LABEL(6),
    PROC_REPEAT(PrepItemSupply_SwitchPageRight),

    // fallthrough

PROC_LABEL(3),
    PROC_CALL(PrepItemSupply_SwitchToUnitInventory),
    PROC_REPEAT(PrepItemSupply_Loop_UnitInvKeyHandler),

    // fallthrough

PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    // fallthrough

PROC_LABEL(9),
    PROC_CALL(PrepItemSupply_OnEnd),

    PROC_END,
};

//! FE8U = 0x0809EAD8
void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent)
{
    struct PrepItemSupplyProc* proc = Proc_StartBlocking(ProcScr_PrepItemSupplyScreen, parent);
    proc->unit = unit;
    proc->unk_30 = 0;
    return;
}

//! FE8U = 0x0809EAF4
void PrepItemSupply_ShowActiveUnitOnEnter(void)
{
    if (gActiveUnit) {
        EndAllMus();
        ShowUnitSprite(gActiveUnit);
    }

    return;
}

//! FE8U = 0x0809EB14
void PrepItemSupply_StartActiveUnitMuOnExit(void)
{
    if (gActiveUnit) {
        HideUnitSprite(gActiveUnit);
        StartMu(gActiveUnit);
        SetAutoMuDefaultFacing();
    }

    return;
}

struct ProcCmd CONST_DATA ProcScr_BmSupplyScreen[] = {
    PROC_CALL(LockGame),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_CALL(PrepItemSupply_ShowActiveUnitOnEnter),
    PROC_CALL(PrepItemSupply_Init),
    PROC_CALL(PrepItemSupply_ResetBackgrounds),

    PROC_SLEEP(1),

    PROC_CALL(PrepItemSupply_InitGfx),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(PrepItemSupply_EnterGiveTakeMenu),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(PrepItemSupply_AdjustCursorAndScroll),
    PROC_REPEAT(PrepItemSupply_Loop_ItemListKeyHandler),

    // fallthrough

PROC_LABEL(5),
    PROC_REPEAT(PrepItemSupply_SwitchPageLeft),

    // fallthrough

PROC_LABEL(6),
    PROC_REPEAT(PrepItemSupply_SwitchPageRight),

    // fallthrough

PROC_LABEL(3),
    PROC_CALL(PrepItemSupply_SwitchToUnitInventory),
    PROC_REPEAT(PrepItemSupply_Loop_UnitInvKeyHandler),

    // fallthrough

PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    // fallthrough

PROC_LABEL(9),
    PROC_CALL(PrepItemSupply_OnEnd),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(PrepItemSupply_StartActiveUnitMuOnExit),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_SLEEP(0),

    PROC_CALL(UnlockGame),

    PROC_END,
};

//! FE8U = 0x0809EB38
void StartBmSupply(struct Unit* unit, ProcPtr unused) {
    struct PrepItemSupplyProc* proc = Proc_Start(ProcScr_BmSupplyScreen, PROC_TREE_3);
    proc->unit = unit;
    proc->unk_30 = 1;
    return;
}

//! FE8U = 0x0809EB58
void MaybeStartSelectConvoyItemProc(struct Unit * unit, ProcPtr unused)
{
    struct PrepItemSupplyProc* proc = Proc_Start(ProcScr_BmSupplyScreen, PROC_TREE_3);
    proc->unit = unit;
    proc->unk_30 = 2;
    return;
}
