#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "icon.h"
#include "bmitemuse.h"
#include "face.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "sysutil.h"
#include "helpbox.h"
#include "prepscreen.h"

//! FE8U = 0x0809B538
void PrepItemTrade_ApplyItemSwap(struct Unit * unitA, int itemSlotA, struct Unit * unitB, int itemSlotB)
{
    u16 itemTmp = unitA->items[itemSlotA];
    unitA->items[itemSlotA] = unitB->items[itemSlotB];
    unitB->items[itemSlotB] = itemTmp;

    UnitRemoveInvalidItems(unitA);
    UnitRemoveInvalidItems(unitB);

    return;
}

//! FE8U = 0x0809B564
s8 PrepItemTrade_DpadKeyHandler(struct PrepMenuTradeProc * proc)
{
    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        int itemCount;

        if ((proc->cursorItemSlot & 8) == 0) {
            return 0;
        }

        itemCount = GetUnitItemCount(proc->units[0]);
        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if (((proc->cursorItemSlot + 8) >> 3 & 1) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if (itemCount <= 0) {
            return 0;
        }

        if (itemCount > (proc->cursorItemSlot & 7)) {
            proc->cursorItemSlot = proc->cursorItemSlot - 8;
        } else {
            proc->cursorItemSlot = itemCount - 1;
        }

        PlaySoundEffect(0x67);

        return 1;
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        int itemCount;

        if ((proc->cursorItemSlot & 8) != 0) {
            return 0;
        }

        itemCount = GetUnitItemCount(proc->units[1]);
        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if (((proc->cursorItemSlot + 8) >> 3 & 1) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if (itemCount <= 0) {
            return 0;
        }

        if (itemCount > (proc->cursorItemSlot & 7)) {
            proc->cursorItemSlot = proc->cursorItemSlot + 8;
        } else {
            proc->cursorItemSlot = itemCount + 7;
        }

        PlaySoundEffect(0x67);

        return 1;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        int itemCount = GetUnitItemCount(proc->units[proc->cursorItemSlot >> 3]);

        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if ((proc->cursorItemSlot >> 3) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if ((proc->cursorItemSlot & 7) > 0) {
            proc->cursorItemSlot--;
            PlaySoundEffect(0x66);
            return 1;
        }

        if (gKeyStatusPtr->newKeys & DPAD_UP) {
            proc->cursorItemSlot = (proc->cursorItemSlot & 8) + itemCount - 1;
            PlaySoundEffect(0x66);
            return 1;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        int itemCount = GetUnitItemCount(proc->units[proc->cursorItemSlot >> 3]);
        if (proc->selectedItemSlot != 0xff) {
            if (proc->helpBoxItemSlot == 0xff) {
                if ((proc->cursorItemSlot >> 3) != proc->selectedItemSlot >> 3) {
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
                }
            }
        }

        if ((proc->cursorItemSlot & 7) < itemCount - 1) {
            proc->cursorItemSlot++;
            PlaySoundEffect(0x66);
            return 1;
        }

        if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            proc->cursorItemSlot = proc->cursorItemSlot & 8;
            PlaySoundEffect(0x66);
            return 1;
        }

    }

    return 0;
}

//! FE8U = 0x0809B74C
void DrawPrepScreenItems(u16* tm, struct Text* th, struct Unit* unit, u8 checkPrepUsability) {
    s8 isUsable;
    int i;
    int itemCount;

    TileMap_FillRect(tm, 11, 9, 0);

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++) {
        int item = unit->items[i];

        if (checkPrepUsability != 0) {
            isUsable = CanUnitUseItemPrepScreen(unit, item);
        } else {
            isUsable = IsItemDisplayUsable(unit, item);
        }

        ClearText(th);
        PutDrawText(
            th,
            tm + i * 0x40 + 2,
            !isUsable ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
            0,
            0,
            GetItemName(item)
        );

        PutNumberOrBlank(tm + i * 0x40 + 0xB, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));
        DrawIcon(tm + i * 0x40, GetItemIconId(item), 0x4000);

        th++;
    }

    return;
}

//! FE8U = 0x0809B830
void DrawPrepScreenItemIcons(u16* tm, struct Unit* unit) {
    int i;

    int itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++) {
        DrawIcon(tm + i * 0x40, GetItemIconId(unit->items[i]), 0x4000);
    }

    return;
}

//! FE8U = 0x0809B86C
void PrepItemTrade_Init(struct PrepMenuTradeProc * proc)
{
    const char* str;
    int i;

    struct FaceVramEntry faceConfig[4] = {
        { 0x5800, 6 },
        { 0x6800, 7 },
        { 0x0000, 0 },
        { 0x0000, 0 }
    };

    // TODO: Seems to be necessary to match - there is a "ldrh" here...
    SetupBackgrounds((void*)(u32)*gBgConfig_ItemUseScreen);

    SetupFaceGfxData(faceConfig);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

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

    for (i = 0; i < 5; i++) {
        InitTextDb(gPrepItemScreenTexts + 0 + i, 7);
        InitTextDb(gPrepItemScreenTexts + 5 + i, 7);
    }

    proc->selectedItemSlot = 0xff;

    if (proc->unk_40 != -1) {
        proc->cursorItemSlot = proc->unk_40 + 8;
    } else {
        if (GetUnitItemCount(proc->units[0]) == 0) {
            proc->cursorItemSlot = 8;
        } else {
            proc->cursorItemSlot = 0;
        }
    }

    proc->helpBoxItemSlot = 0xff;

    StartFace2(0, GetUnitPortraitId(proc->units[0]), 64, -4, (FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(FACE_HLAYER_3)));
    StartFace2(1, GetUnitPortraitId(proc->units[1]), 174, -4, (FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_3)));

    DrawUiFrame2(1, 8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    BG_EnableSyncByMask(7);

    str = GetStringFromIndex(proc->units[0]->pCharacterData->nameTextId);
    PutDrawText(0, gBG0TilemapBuffer, 0, ((48 - GetStringTextLen(str)) / 2), 6, str);

    str = GetStringFromIndex(proc->units[1]->pCharacterData->nameTextId);
    PutDrawText(0, gBG0TilemapBuffer + 0x18, 0, ((48 - GetStringTextLen(str)) / 2), 6, str);

    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gPrepItemScreenTexts + 0, proc->units[0], 0);
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x130, gPrepItemScreenTexts + 5, proc->units[1], 0);

    StartUiCursorHand(proc);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);
    ShowSysHandCursor(
        (proc->cursorItemSlot >> 3) * 0x70 + 0x10,
        (proc->cursorItemSlot & 7) * 0x10 + 0x48,
        0xb,
        0x800
    );

    StartHelpPromptSprite(200, 0x93, 2, proc);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0x400, proc);

    EnableSysBrownBox(0, -0x28, -1, 1);
    EnableSysBrownBox(1, 0xb8, -1, 0);

    SetBlendConfig(1, 0xe, 4, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

//! FE8U = 0x0809BB34
void PrepItemTrade_Loop_MainKeyHandler(struct PrepMenuTradeProc* proc) {
    int item;

    if (proc->helpBoxItemSlot != 0xff) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            CloseHelpBox();
            proc->helpBoxItemSlot = 0xff;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            item = proc->units[proc->cursorItemSlot >> 3]->items[proc->cursorItemSlot & 7];
            if (item == 0) {
                return;
            }
            StartItemHelpBox((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, item);
            proc->helpBoxItemSlot = proc->cursorItemSlot;
            return;
        }

        if (proc->selectedItemSlot != 0xff) {
            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                int itemCount;

                if (CheckValidLinkArenaItemSwap(proc->units[proc->selectedItemSlot >> 3], proc->selectedItemSlot & 7, proc->units[proc->cursorItemSlot >> 3], proc->cursorItemSlot & 7) == 0) {
                    StartPrepErrorHelpbox(-1, -1, 0x88B, proc); // TODO: msgid "If you have no usable[.][NL]weapons, you cannot attack.[.]"
                    return;
                }

                PrepItemTrade_ApplyItemSwap(
                    proc->units[proc->selectedItemSlot >> 3],
                    proc->selectedItemSlot & 7,
                    proc->units[proc->cursorItemSlot >> 3],
                    proc->cursorItemSlot & 7
                );

                DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, gPrepItemScreenTexts + 0, proc->units[0], 0);
                DrawPrepScreenItems(gBG0TilemapBuffer + 0x122 + 0xe, gPrepItemScreenTexts + 5, proc->units[1], 0);

                BG_EnableSyncByMask(1);

                itemCount = GetUnitItemCount(proc->units[proc->selectedItemSlot >> 3]);
                if (itemCount == 0) {
                    proc->selectedItemSlot = (proc->selectedItemSlot + 8) & 8;
                } else if (itemCount <= (proc->selectedItemSlot & 7)) {
                    proc->selectedItemSlot = ((proc->selectedItemSlot & 8) + itemCount) - 1;
                }

                PlaySoundEffect(0x6a);
                sub_80ACA84(0);
                proc->cursorItemSlot = proc->selectedItemSlot;
                proc->selectedItemSlot = 0xff;
                ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                proc->cursorItemSlot = proc->selectedItemSlot;
                proc->selectedItemSlot = 0xff;
                ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

                PlaySoundEffect(0x6b);

                sub_80ACA84(0);

                return;
            }
        } else {
            if (gKeyStatusPtr->newKeys & A_BUTTON) {
                int itemCount = GetUnitItemCount(proc->units[((proc->cursorItemSlot >> 3) + 1) & 1]);
                proc->selectedItemSlot = proc->cursorItemSlot;
                SetUiCursorHandConfig(0, (proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0);
                if (itemCount < 5) {
                    proc->cursorItemSlot = ((proc->cursorItemSlot + 8) & 8) + itemCount;
                } else {
                    proc->cursorItemSlot = (proc->cursorItemSlot + 8) & 0xf;
                }

                ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);
                PlaySoundEffect(0x6a);
                return;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON) {
                Proc_Break(proc);
                PlaySoundEffect(0x6b);
                return;
            }
        }
    }

    if (PrepItemTrade_DpadKeyHandler(proc) == 0) {
        return;
    }

    ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

    if (proc->helpBoxItemSlot == 0xff) {
        return;
    }

    item = proc->units[proc->cursorItemSlot >> 3]->items[proc->cursorItemSlot & 7];
    if (item == 0) {
        return;
    }

    StartItemHelpBox((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, item);

    proc->helpBoxItemSlot = proc->cursorItemSlot;

    return;
}

//! FE8U = 0x0809BE24
void PrepItemTrade_OnEnd(void) {
    EndMuralBackground_();
    EndFaceById(0);
    EndFaceById(1);
    return;
}

struct ProcCmd CONST_DATA ProcScr_PrepItemTradeScreen[] = {
    PROC_SLEEP(0),

    PROC_CALL(PrepItemTrade_Init),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(PrepItemTrade_Loop_MainKeyHandler),

    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(PrepItemTrade_OnEnd),

    PROC_END,
};

//! FE8U = 0x0809BE3C
void StartPrepItemTradeScreenProc(struct Unit* unitA, struct Unit* unitB, ProcPtr parent) {
    struct PrepMenuTradeProc* proc = Proc_StartBlocking(ProcScr_PrepItemTradeScreen, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->unk_40 = -1;

    return;
}

//! FE8U = 0x0809BE60
void sub_809BE60(struct Unit* unitA, struct Unit* unitB, int rightItemIdx, ProcPtr parent) {
    struct PrepMenuTradeProc* proc = Proc_StartBlocking(ProcScr_PrepItemTradeScreen, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    // Position the cursor on this item slot on unit B's inventory
    proc->unk_40 = rightItemIdx;

    return;
}