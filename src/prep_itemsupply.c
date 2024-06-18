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

struct Struct02013648 {
    /* 00 */ struct Font font;
    /* 18 */ struct Text th[16];
};

extern struct Struct02013648 gUnknown_02013648;

//! FE8U = 0x0809D244
void sub_809D244(void)
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

char* CONST_DATA gpPrepItemSupplyStringBuffer = gStringBufferAlt;

//! FE8U = 0x0809D278
void sub_809D278(int idx, ProcPtr proc)
{
    StartParallelWorker(sub_809D244, proc);

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
    ApplyPalette(gUnknown_08A1A3FC, pal);
    Decompress(gUnknown_08A1A0A4, (void*)(0x6000000 + vramOffset));
    Decompress(gUnknown_08A1A23C, (void*)(0x6000200 + vramOffset));
    return;
}

//! FE8U = 0x0809D300
void sub_809D300(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit)
{
    int i;

    TileMap_FillRect(tm, 12, 31, 0);

    if (gUnknown_02012F56 == 0) {
        ClearText(textBase);
        Text_InsertDrawString(textBase, 0, 1, GetStringFromIndex(0x5a8)); // TODO: msgid "Nothing[.]"
        PutText(textBase, tm + 3);
        return;
    }

    for (i = yLines; (i < yLines + 7) && (i < gUnknown_02012F56); i++) {
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
void sub_809D418(u16 * tm, int yLines) {
    int i;

    for (i = yLines; i < yLines + 7 && i < gUnknown_02012F56; i++) {
        int item = gPrepScreenItemList[i].item;
        DrawIcon(tm + TILEMAP_INDEX(1, i * 2 & 0x1f), GetItemIconId(item), 0x4000);
    }

    return;
}

//! FE8U = 0x0809D47C
void sub_809D47C(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit)
{
    if (gUnknown_02012F56 > yLines) {
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
void sub_809D608(void)
{
    InitSpriteTextFont(&gUnknown_02013648.font, (void*)0x06011000, 0xb);
    ApplyPalette(Pal_Text, 0x1B);
    InitSpriteText(&gUnknown_02013648.th[0xf]);
    SetTextFont(NULL);
    return;
}

//! FE8U = 0x0809D644
void sub_809D644(struct PrepItemSupplyProc * proc)
{
    int color;
    struct Text* th;

    int convoyItemCount = GetConvoyItemCount_();
    int unitItemCount = GetUnitItemCount(proc->unit);

    SetTextFont(&gUnknown_02013648.font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&gUnknown_02013648.th[0xf], 0);
    th = &gUnknown_02013648.th[0xf];

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
        &gUnknown_02013648.th[0xf],
        0x40,
        unitItemCount == UNIT_ITEM_COUNT ? 1 : 0,
        GetStringFromIndex(0x59F) // TODO: msgid "Take"
    );

    SetTextFont(NULL);
}

//! FE8U = 0x0809D6CC
void sub_809D6CC(void)
{
    SetTextFont(NULL);
    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 12, 1, 0);

    PutDrawText(&gUnknown_02013648.th[0], gBG0TilemapBuffer + 0x34 + 0x6d, 0, 2, 0, GetStringFromIndex(0x598));
    PutFaceChibi(FID_SUPPLY, gBG0TilemapBuffer + 0x34 - 0x13, 0x270, 2, 1);
    PutDrawText(&gUnknown_02013648.th[0] + 1, gBG0TilemapBuffer + 0x34 - 1, 0, 4, 0, GetStringFromIndex(0x5a0));

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

    gPaletteBuffer[0x14D] = *(gUnknown_08A1BD60 + (GetGameClock() >> 2 & 0xf));
    EnablePaletteSync();

    PutSprite(4, x, 24, gUnknown_08A19608[proc->currentPage], 0x4280);
    PutSprite(4, x, 24, gUnknown_08A195F8, 0x4280);

    UpdateMenuScrollBarConfig(0xc, proc->yOffsetPerPage[proc->currentPage], gUnknown_02012F56, 7);

    return;
}

#define TILEREF_(aChar, aPal) (((aPal) << 12) + (aChar))

//! FE8U = 0x0809D8D4
void sub_809D8D4(u16 * tm, u32 chr, int pal)
{
    int i;

    for (i = 0; i < 0xf; i++) {
        tm[i] = TILEREF_(((chr) & 0x1ffff) / 0x20, pal) + i;
        tm[0x20 + i] = TILEREF_(((chr + 0x200) & 0x1ffff) / 0x20, pal) + i;
    }
}

#undef TILEREF_

//! FE8U = 0x0809D914
void sub_809D914(struct PrepItemSupplyProc * proc)
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

    Decompress(gUnknown_08A1B9EC, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(gUnknown_08A1BCC0, gGenericBuffer);
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

    InitText(&gUnknown_02013648.th[0], 4);
    InitText(&gUnknown_02013648.th[1], 4);

    sub_809D608();

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        InitText(&gUnknown_02013648.th[2 + i], 7);
    }

    for (i = 0; i < 8; i++) {
        InitTextDb(&gUnknown_02013648.th[7 + i], 7);
    }

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(PrepItemSupply_OnHBlank);

    StoreConvoyWeaponIconGraphics(0x4000, 6);
    sub_809D8D4(gBG0TilemapBuffer + 0x6F, 0x4000, 6);

    Decompress(gUnknown_08A19CCC, (void*)0x06015000);
    ApplyPalette(Pal_SpinningArrow, 0x14);

    StartMenuScrollBarExt(proc, 0xe1, 0x2f, 0x5800, 9);
    sub_8097668();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);

    sub_809D300(
        &gUnknown_02013648.th[7],
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );
    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x6F + 0xb3, &gUnknown_02013648.th[2], proc->unit, 0);
    sub_809D6CC();
    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowPositions(0x78, 0x18, 0xe9, 0x18);
    SetUiSpinningArrowConfig(3);
    StartParallelWorker(Supply_PutHighlightedCategorySprites, proc);

    return;
}

//! FE8U = 0x0809DC70
void sub_809DC70(struct PrepItemSupplyProc * proc)
{
    sub_809D278(0, proc);
    sub_80ACA84(0);
    sub_809D644(proc);
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
                        sub_809D278(1, proc);
                        PlaySoundEffect(0x6a);
                        Proc_Goto(proc, 3);
                        return;
                    }

                    PlaySoundEffect(0x6c);
                    break;
                case 1:
                    if (GetUnitItemCount(proc->unit) < UNIT_ITEM_COUNT) {
                        SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                        Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                        StartParallelWorker(PutTakeSprites, proc);
                        sub_809D278(2, proc);
                        PlaySoundEffect(0x6a);
                        Proc_Goto(proc, 4);
                        return;
                    }

                    PlaySoundEffect(0x6c);
                    break;
            }
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 8);
            PlaySoundEffect(0x6b);
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
        PlaySoundEffect(0x66);
        ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
        if (proc->unk_38 != 0) {
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[proc->unk_33]);
        }
    }
    return;
}

//! FE8U = 0x0809DEFC
void sub_809DEFC(struct PrepItemSupplyProc * proc)
{
    ResetIconGraphics_();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    sub_809D300(&gUnknown_02013648.th[7], gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);
    ShowSysHandCursor(0x80, proc->idxPerPage[proc->currentPage] * 16 + 0x28 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);

    BG_EnableSyncByMask(5);

    if (proc->unk_38 == 0) {
        return;
    }

    if (gUnknown_02012F56 != 0) {
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
        sub_809DEFC(proc);
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
        sub_809DEFC(proc);
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
void sub_809E100(struct PrepItemSupplyProc * proc)
{

    if (gUnknown_02012F56 == 0) {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    } else {
        if (proc->idxPerPage[proc->currentPage] > (gUnknown_02012F56 - 1)) {
            proc->idxPerPage[proc->currentPage] = gUnknown_02012F56 - 1;
        }
    }

    if (gUnknown_02012F56 > 6) {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > gUnknown_02012F56) {
            proc->yOffsetPerPage[proc->currentPage] = (gUnknown_02012F56 - 7) * 0x10;
        }
    }

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 0x28);

    return;
}

//! FE8U = 0x0809E184
void sub_809E184(struct PrepItemSupplyProc * proc)
{
    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) &&
        (proc->idxPerPage[proc->currentPage] != 0)) {
        proc->idxPerPage[proc->currentPage]++;
    }

    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78) &&
        (proc->idxPerPage[proc->currentPage] != gUnknown_02012F56 - 1)) {
        proc->idxPerPage[proc->currentPage]--;
    }

    sub_809E100(proc);

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

    sub_809D418(gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    BG_EnableSyncByMask(5);

    if (amount < 0) {
        sub_809D47C(&gUnknown_02013648.th[7], gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1,  proc->unit);
    }

    if (amount > 0) {
        sub_809D47C(&gUnknown_02013648.th[7], gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);
    }

    proc->yOffsetPerPage[proc->currentPage] += amount;

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}

//! FE8U = 0x0809E2BC
void sub_809E2BC(void)
{
    sub_809D6CC();
    return;
}

//! FE8U = 0x0809E2C8
void sub_809E2C8(struct PrepItemSupplyProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if ((count == UNIT_ITEM_COUNT) || (gUnknown_02012F56 == 0)) {
        PlaySoundEffect(0x6c);
        return;
    }

    proc->unk_38 = 0;

    proc->unit->items[count] = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item = 0;

    sub_80982B8();

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    sub_809E100(proc);
    ResetIconGraphics_();

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &gUnknown_02013648.th[2], proc->unit, 0);
    sub_809D300(
        &gUnknown_02013648.th[7],
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );

    StartParallelFiniteLoop(sub_809E2BC, 1, proc);

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
        PlaySoundEffect(0x6b);
    } else {
        PlaySoundEffect(0x6a);
    }

    return;
}

//! FE8U = 0x0809E420
void sub_809E420(struct PrepItemSupplyProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    if ((proc->yOffsetPerPage[proc->currentPage] & 0xf) == 0) {
        if ((proc->unk_38 == 0) || (proc->unk_38 == 0xff)) {
            if (gKeyStatusPtr->newKeys & R_BUTTON) {
                if (gUnknown_02012F56 != 0) {
                    int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item
                    );
                    proc->unk_38 = 1;
                    return;
                } else {
                    PlaySoundEffect(0x6c);
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                sub_809E2C8(proc);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Goto(proc, 1);
                PlaySoundEffect(0x6b);
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
            PlaySoundEffect(0x67);
            Proc_Goto(proc, 5);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageLeft(proc);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            SetUiSpinningArrowFastMaybe(1);
            PlaySoundEffect(0x67);
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
            if (proc->idxPerPage[proc->currentPage] < gUnknown_02012F56 - 1) {
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
        PlaySoundEffect(0x66);

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
                && (proc->idxPerPage[proc->currentPage] != gUnknown_02012F56 - 1)) {

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
s8 sub_809E7A8(struct PrepItemSupplyProc * proc)
{

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int count = GetUnitItemCount(proc->unit);
        if (proc->unitInvIdx != 0) {
            proc->unitInvIdx--;
            PlaySoundEffect(0x66);
            return 1;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unitInvIdx = count - 1;
                PlaySoundEffect(0x66);
                return 1;
            }
        }

        return 0;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int count = GetUnitItemCount(proc->unit);
        if (proc->unitInvIdx < count - 1) {
            proc->unitInvIdx++;
            PlaySoundEffect(0x66);
            return 1;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unitInvIdx = 0;
                PlaySoundEffect(0x66);
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
    sub_809E100(proc);

    ResetIconGraphics_();
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &gUnknown_02013648.th[2], proc->unit, 0);
    sub_809D300(&gUnknown_02013648.th[7], gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(sub_809E2BC, 1, proc);

    BG_EnableSyncByMask(4);

    unitItemCount = GetUnitItemCount(proc->unit);

    gActionData.unitActionType = UNIT_ACTION_TRADED_SUPPLY;

    if ((unitItemCount == 0) || (GetConvoyItemCount_() == CONVOY_ITEM_COUNT)) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x6b);
    } else {
        PlaySoundEffect(0x6a);
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
            if (sub_8097F98(proc->unit, proc->unitInvIdx) == 0) {
                StartPrepErrorHelpbox(-1, -1, 0x88B, proc); // TODO: msgid "If you have no usable[.][NL]weapons, you cannot attack.[.]"
                return;
            }
            PrepItemSupply_GiveItemToSupply(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 1);
            PlaySoundEffect(0x6b);
            return;
        }
    }

    if (sub_809E7A8(proc) != 0) {
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
    PROC_CALL(sub_809D914),

    PROC_SLEEP(1),

    PROC_CALL(PrepItemSupply_InitGfx),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

PROC_LABEL(1),
    PROC_CALL(sub_809DC70),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(sub_809E184),
    PROC_REPEAT(sub_809E420),

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
void sub_809EAF4(void)
{
    if (gActiveUnit) {
        MU_EndAll();
        ShowUnitSprite(gActiveUnit);
    }

    return;
}

//! FE8U = 0x0809EB14
void sub_809EB14(void)
{
    if (gActiveUnit) {
        HideUnitSprite(gActiveUnit);
        MU_Create(gActiveUnit);
        MU_SetDefaultFacing_Auto();
    }

    return;
}

struct ProcCmd CONST_DATA ProcScr_BmSupplyScreen[] = {
    PROC_CALL(LockGame),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_CALL(sub_809EAF4),
    PROC_CALL(PrepItemSupply_Init),
    PROC_CALL(sub_809D914),

    PROC_SLEEP(1),

    PROC_CALL(PrepItemSupply_InitGfx),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(sub_809DC70),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(sub_809E184),
    PROC_REPEAT(sub_809E420),

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

    PROC_CALL(sub_809EB14),

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
