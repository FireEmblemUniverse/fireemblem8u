#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"

//! FE8U = 0x0809EB78
void PrepItemList_Init(struct PrepItemListProc * proc)
{
    int i;

    struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);

    proc->unk_36 = 0;
    proc->unk_34 = 0xff;

    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();

        if (pGMapBaseMenuProc) {
            proc->currentPage = pGMapBaseMenuProc->unk_2a;
        } else {
            proc->currentPage = 0;
        }
    } else {
        proc->currentPage = pAtMenuProc->unk_31;
    }

    proc->scrollAmount = 4;
    proc->unitInvIdx = 0;

    for (i = 0; i < 9; i++) {
        proc->idxPerPage[i] = 0;
        proc->yOffsetPerPage[i] = 0;
    }

    return;
}

//! FE8U = 0x0809EBF0
void sub_809EBF0(void)
{
    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 0xc, 1, 0);

    PutDrawText(gUnknown_02013660 + 15, gBG0TilemapBuffer + 0x34, 0, 0, 0, GetStringFromIndex(0x5A9)); // TODO: msgid "Owner"

    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x0809EC38
void PrepItemList_DrawCurrentOwnerText(struct PrepItemListProc* proc) {
    int idx = proc->idxPerPage[proc->currentPage];

    TileMap_FillRect(gBG0TilemapBuffer + 0x38, 10, 1, 0);

    ClearText(gUnknown_02013660 + 1);

    if (gUnknown_02012F56 <= idx) {
        PutDrawText(gUnknown_02013660 + 1, gBG0TilemapBuffer + 0x38, 1, 0, 0, GetStringFromIndex(0x536));
    } else {
        int pid = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].pid;

        if (pid == 0) {
            PutDrawText(gUnknown_02013660 + 1, gBG0TilemapBuffer + 0x38, 3, 0, 0, GetStringFromIndex(0x598)); // TODO: msgid "Supply"
        } else {
            PutDrawText(gUnknown_02013660 + 1, gBG0TilemapBuffer + 0x38, 0, 0, 0, GetStringFromIndex(GetUnitFromCharId(pid)->pCharacterData->nameTextId));
        }
    }

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x0809ECFC
void List_PutHighlightedCategorySprites(struct PrepItemListProc* proc) {
    int x = proc->currentPage * 12 + 124;

    gPaletteBuffer[0x14D] = *(gUnknown_08A1BD60 + (GetGameClock() >> 2 & 0xf));
    EnablePaletteSync();

    PutSprite(4, x, 24, gUnknown_08A19608[proc->currentPage], 0x4280);
    PutSprite(4, x, 24, gUnknown_08A195F8, 0x4280);

    UpdateMenuScrollBarConfig(0xc, proc->yOffsetPerPage[proc->currentPage], gUnknown_02012F56, 7);

    return;
}

//! FE8U = 0x0809ED8C
void PrepItemList_InitGfx(struct PrepItemListProc * proc)
{
    int i;
    const char* str;

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
    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    LoadHelpBoxGfx((void*)0x06012000, -1);
    LoadIconPalettes(4);

    RestartMuralBackground();

    PutImg_PrepItemUseUnk(0x5000, 5);

    Decompress(gUnknown_08A1B9EC, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    BG_EnableSyncByMask(7);

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

    StartGreenText(proc);

    StartHelpPromptSprite(195, 147, 9, proc);

    InitText(gUnknown_02013660 + 0, 6);
    InitText(gUnknown_02013660 + 1, 5);

    InitText(gUnknown_02013660 + 15, 4);

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        InitText(gUnknown_02013660 + 2 + i, 7);
    }

    for (i = 0; i < 8; i++) {
        InitTextDb(gUnknown_02013660 + 7 + i, 7);
    }

    StoreConvoyWeaponIconGraphics(0x4000, 6);

    sub_809D8D4(gBG0TilemapBuffer + 0x6F, 0x4000, 6);

    Decompress(gUnknown_08A19CCC, (void*)0x06015000);
    ApplyPalette(Pal_08A1A084, 0x14);

    StartMenuScrollBarExt(proc, 225, 47, 0x5800, 9);
    sub_8097668();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    sub_809F5F4(proc);

    sub_809D300(
        gUnknown_02013660 + 7,
        gBG2TilemapBuffer + 0xF,
        (proc->yOffsetPerPage[proc->currentPage]) >> 4,
        proc->unit
    );

    BG_EnableSyncByMask(4);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x6F + 0xb3, gUnknown_02013660 + 2, proc->unit, 0);
    sub_809EBF0();

    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowPositions(0x78, 0x18, 0xe9, 0x18);
    SetUiSpinningArrowConfig(3);

    StartParallelWorker(List_PutHighlightedCategorySprites, proc);

    StartFace2(0, GetUnitPortraitId(proc->unit), 64, -4, FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(FACE_HLAYER_3));

    str = GetStringFromIndex(proc->unit->pCharacterData->nameTextId);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0x400, proc);

    EnableSysBrownBox(0, -40, -1, 1);
    EnableSysBrownBox(1, 0x98, 6, 2);

    SetBlendConfig(1, 0xe, 4, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    PutDrawText(gUnknown_02013660, gBG0TilemapBuffer, 0, GetStringTextCenteredPos(48, str), 0, str);

    PrepItemList_DrawCurrentOwnerText(proc);

    return;
}

//! FE8U = 0x0809F0FC
void PrepItemList_OnEnd(struct PrepItemListProc * proc)
{
    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();
        if (pGMapBaseMenuProc) {
            pGMapBaseMenuProc->unk_2a = proc->currentPage;
        }
    } else {
        struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
        pAtMenuProc->unk_31 = proc->currentPage;
    }

    EndAllProcChildren(proc);
    EndFaceById(0);
    EndMuralBackground_();

    return;
}

//! FE8U = 0x0809F150
void sub_809F150(struct PrepItemListProc * proc)
{
    ResetIconGraphics_();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    sub_809F370(proc);

    sub_809D300(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 2, proc);

    if (proc->unk_36 == 0) {
        return;
    }

    if (gUnknown_02012F56 != 0) {
        int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        StartItemHelpBox(
            0x80,
            proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
            item
        );
        proc->unk_36 = 1;
    } else {
        CloseHelpBox();
        proc->unk_36 = 0xff;
    }

    return;
}

//! FE8U = 0x0809F218
void PrepItemList_SwitchPageLeft(struct PrepItemListProc * proc)
{
    int x;

    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four) {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = tmp - 0x60;
    }

    if (proc->unk_32 == four) {
        if (proc->currentPage == 0) {
            proc->currentPage = 8;
        } else {
            proc->currentPage--;
        }
        sub_809F150(proc);
    }

    if (proc->unk_32 >= four) {
        int tmp = four - (proc->unk_32 - four);
        x = (tmp * 0x60 * tmp) / (four * four);
    }

    BG_SetPosition(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_32 == four * 2) {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x0809F2C4
void PrepItemList_SwitchPageRight(struct PrepItemListProc* proc) {
    int x;

    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four) {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = 0x60 - tmp;
    }

    if (proc->unk_32 == four) {
        if (proc->currentPage == 8) {
            proc->currentPage = 0;
        } else {
            proc->currentPage++;
        }
        sub_809F150(proc);
    }

    if (proc->unk_32 >= four) {
        int tmp = four - (proc->unk_32 - four);
        x = -((tmp * 0x60 * tmp) / (four * four));
    }

    BG_SetPosition(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_32 == four * 2) {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x0809F370
void sub_809F370(struct PrepItemListProc* proc) {
    if (gUnknown_02012F56 == 0) {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    } else {
        if (proc->idxPerPage[proc->currentPage] > gUnknown_02012F56 - 1) {
            proc->idxPerPage[proc->currentPage] = gUnknown_02012F56 - 1;
        }
    }

    if (gUnknown_02012F56 > 6) {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > gUnknown_02012F56) {
            proc->yOffsetPerPage[proc->currentPage] = (gUnknown_02012F56 - 7) * 0x10;
        }
    }

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}

//! FE8U = 0x0809F3F4
void PrepItemList_ScrollVertical(struct PrepItemListProc * proc, int amount)
{
    ResetIconGraphics_();

    sub_809D418(gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBG0TilemapBuffer + 0x122, proc->unit);

    BG_EnableSyncByMask(5);

    if (amount < 0) {
        sub_809D47C(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1,  proc->unit);
    }

    if (amount > 0) {
        sub_809D47C(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);
    }

    proc->yOffsetPerPage[proc->currentPage] += amount;

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}

//! FE8U = 0x0809F498
void sub_809F498(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if ((count == UNIT_ITEM_COUNT) || (gUnknown_02012F56 == 0)) {
        PlaySoundEffect(0x6c);
        return;
    }

    proc->unk_36 = 0;

    proc->unit->items[count] = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item = 0;

    sub_80982B8();

    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    sub_809F370(proc);
    ResetIconGraphics_();

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gUnknown_02013660 + 2, proc->unit, 0);
    sub_809D300(
        gUnknown_02013660 + 7,
        gBG2TilemapBuffer + 0xF,
        proc->yOffsetPerPage[proc->currentPage] >> 4,
        proc->unit
    );

    if (gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].pid != 0) {
        StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 1, proc);
    }

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    BG_EnableSyncByMask(5);

    if (GetUnitItemCount(proc->unit) == UNIT_ITEM_COUNT) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x6b);
    } else {
        PlaySoundEffect(0x6a);
    }

    return;
}

//! FE8U = 0x0809F5F4
void sub_809F5F4(struct PrepItemListProc* proc) {

    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) &&
        (proc->idxPerPage[proc->currentPage] != 0)) {
        proc->idxPerPage[proc->currentPage]++;
    }

    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78) &&
        (proc->idxPerPage[proc->currentPage] != gUnknown_02012F56 - 1)) {
        proc->idxPerPage[proc->currentPage]--;
    }

    sub_809F370(proc);

    ShowSysHandCursor(
        0x80,
        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
        0xb,
        0x800
    );

    return;
}

//! FE8U = 0x0809F688
void PrepItemList_Loop_MainKeyHandler(struct PrepItemListProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    if ((proc->yOffsetPerPage[proc->currentPage] & 0xf) == 0) {
        if ((proc->unk_36 == 0) || (proc->unk_36 == 0xff)) {
            if (gKeyStatusPtr->newKeys & R_BUTTON) {
                if (gUnknown_02012F56 == 0) {
                    PlaySoundEffect(0x6c);
                    return;
                } else {
                    int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item
                    );
                    proc->unk_36 = 1;
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                if (gUnknown_02012F56 == 0) {
                    PlaySoundEffect(0x6c);
                    return;
                }

                if (gPrepScreenItemList[idx].pid == 0) {
                    SetUiCursorHandConfig(
                        0,
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        2
                    );
                    Proc_Goto(proc, 7);
                    PlaySoundEffect(0x6a);
                    return;
                } else {
                    Proc_Goto(proc, 6);
                    PlaySoundEffect(0x6a);
                    return;
                }
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Goto(proc, 8);
                PlaySoundEffect(0x6b);
                proc->unk_36 = 0;
                return;
            }
        } else {
            if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
                CloseHelpBox();
                proc->unk_36 = 0;
                return;
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            SetUiSpinningArrowFastMaybe(0);
            PlaySoundEffect(0x67);
            Proc_Goto(proc, 3);
            proc->unk_32 = 0;
            PrepItemList_SwitchPageLeft(proc);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            SetUiSpinningArrowFastMaybe(1);
            PlaySoundEffect(0x67);
            Proc_Goto(proc, 4);
            proc->unk_32 = 0;
            PrepItemList_SwitchPageRight(proc);
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

        if (gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].pid != gPrepScreenItemList[idx].pid) {
            PrepItemList_DrawCurrentOwnerText(proc);
        }

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) && (proc->idxPerPage[proc->currentPage] != 0)) {
            if (proc->unk_36 != 0) {
                StartItemHelpBox(
                    0x80,
                    proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] + 16,
                    item
                );
            }

            PrepItemList_ScrollVertical(proc, -proc->scrollAmount);
        } else {
            if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78)
                && (proc->idxPerPage[proc->currentPage] != gUnknown_02012F56 - 1)) {

                if (proc->unk_36 != 0) {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] - 0x10,
                        item
                    );
                }
                PrepItemList_ScrollVertical(proc, +proc->scrollAmount);
            } else {
                if (proc->unk_36 != 0) {
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

//! FE8U = 0x0809FA88
s8 sub_809FA88(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);
    u8 unitInvSlot = proc->unitInvIdx;

    int maxSlot = count;
    if (count == UNIT_ITEM_COUNT) {
        maxSlot = 4;
    } else {
        if (proc->unk_36 != 0) {
            maxSlot = count - 1;
        }
    }

    if (count != 0) {
        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            if (proc->unitInvIdx != 0) {
                proc->unitInvIdx--;
            } else {
                if (gKeyStatusPtr->newKeys & DPAD_UP) {
                    proc->unitInvIdx = maxSlot;
                }
            }
        }
        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            if (proc->unitInvIdx < maxSlot) {
                proc->unitInvIdx++;
            } else {
                if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                    proc->unitInvIdx = 0;
                }
            }
        }

        if (unitInvSlot != proc->unitInvIdx) {
            PlaySoundEffect(0x66);
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x0809FB34
void PrepItemList_SwitchToUnitInventory(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if (count == UNIT_ITEM_COUNT)
        proc->unitInvIdx = 4;
    else
        proc->unitInvIdx = count;

    ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
}

//! FE8U = 0x0809FB70
void sub_809FB70(struct PrepItemListProc * proc)
{
    u16 idx = proc->idxPerPage[proc->currentPage];
    u16 item = proc->unit->items[proc->unitInvIdx];

    proc->unit->items[proc->unitInvIdx] = gPrepScreenItemList[idx].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[idx].item = item;

    sub_80982B8();
    if (item == 0) {
        SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    }

    sub_809F370(proc);
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gUnknown_02013660 + 2, proc->unit, 0);
    sub_809D300(gUnknown_02013660 + 7, gBG2TilemapBuffer + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 1, proc);
    BG_EnableSyncByMask(4);

    PlaySoundEffect(0x6a);

    return;
}

//! FE8U = 0x0809FC24
void PrepItemList_Loop_UnitInvKeyHandler(struct PrepItemListProc * proc)
{
    u16 item;

    if (proc->unk_36 == 1) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_36 = 0;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->unit->items[proc->unitInvIdx];
            if (item == 0) {
                return;
            }
            StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            proc->unk_36 = 1;
            return;
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            if (CheckValidLinkArenaItemSupply(proc->unit, proc->unitInvIdx, gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item) == 0) {
                StartPrepErrorHelpbox(-1, -1, 0x88B, proc);
                return;
            }
            sub_80ACA84(0);
            Proc_Break(proc);
            sub_809FB70(proc);
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            sub_80ACA84(0);
            Proc_Break(proc);
            PlaySoundEffect(0x6b);
            return;
        }
    }

    if (sub_809FA88(proc) != 0) {
        ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        if (proc->unk_36 == 1) {
            item = proc->unit->items[proc->unitInvIdx];
            if (item != 0) {
                StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            }
        }
    }

    return;
}

//! FE8U = 0x0809FD54
void PrepItemList_StartTradeScreen(struct PrepItemListProc * proc)
{
    struct PrepScreenItemListEnt* ent = &gPrepScreenItemList[proc->idxPerPage[proc->currentPage]];

    sub_809BE60(
        proc->unit,
        GetUnitFromCharId(ent->pid),
        ent->itemSlot,
        proc
    );

    return;
}

struct ProcCmd CONST_DATA ProcScr_PrepItemListScreen[] = {
    PROC_SLEEP(0),
    PROC_CALL(PrepItemList_Init),

PROC_LABEL(0),
    PROC_CALL(PrepItemList_InitGfx),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(sub_809F5F4),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(PrepItemList_Loop_MainKeyHandler),

    // fallthrough

PROC_LABEL(6),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemList_OnEnd),
    PROC_CALL(PrepItemList_StartTradeScreen),
    PROC_SLEEP(0),

    PROC_GOTO(0),

PROC_LABEL(7),
    PROC_CALL(PrepItemList_SwitchToUnitInventory),
    PROC_REPEAT(PrepItemList_Loop_UnitInvKeyHandler),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_REPEAT(PrepItemList_SwitchPageLeft),

    // fallthrough

PROC_LABEL(4),
    PROC_REPEAT(PrepItemList_SwitchPageRight),

    // fallthrough

PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    // fallthrough

PROC_LABEL(9),
    PROC_CALL(PrepItemList_OnEnd),

    PROC_END,
};

//! FE8U = 0x0809FD88
void StartPrepItemListScreenProc(struct Unit* unit, ProcPtr parent) {
    struct PrepItemListProc* proc = Proc_StartBlocking(ProcScr_PrepItemListScreen, parent);
    proc->unit = unit;
    return;
}
