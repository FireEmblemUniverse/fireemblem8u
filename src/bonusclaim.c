#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"

struct BonusClaimEnt * CONST_DATA gpBonusClaimData = gBonusClaimData;
struct BonusClaimEnt * CONST_DATA gpBonusClaimDataUpdated = gBonusClaimDataUpdated;
struct BonusClaimItemEnt * CONST_DATA gpBonusClaimItemList = gBonusClaimItemList;
int* CONST_DATA gpBonusClaimItemCount = &gBonusClaimItemCount;
struct Text * CONST_DATA gpBonusClaimText = gBonusClaimText;
struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig = gBonusClaimConfig;

int LoadBonusContentData(void*);

//! FE8U = 0x080B0638
void PutChapterBannerSprites(void) {
    PutSpriteExt(4, 24, 8, *SpriteArray_08A209F0, 0x8000);
    PutSpriteExt(4, 24, 16, *SpriteArray_08A209E4, 0x9000);
    return;
}

//! FE8U = 0x080B0674
void sub_80B0674(void)
{
    u32 flags = (-(gPlaySt.chapterStateBits & 0x40) >> 0x1f) & 4;

    if (gPlaySt.config.controller == 0)
    {
        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_COMMON)
            flags |= 0x10;

        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EIRIKA)
            flags |= 0x20;

        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EPHRAIM)
            flags |= 0x40;
    }
    else
    {
        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EPHRAIM)
            flags |= 0x40;
        else
            flags |= 0x20;
    }

    sub_80895B4(flags | 1, 0x18);
    sub_80895B4(flags, 0x19);

    EnablePaletteSync();

    PutChapterTitleBG(0xac0);
    PutChapterTitleGfx(0xb40, GetChapterTitleExtra(&gPlaySt));

    return;
}

//! FE8U = 0x080B06FC
void sub_80B06FC(void) {

    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        vcount = 0;
    }

    if ((vcount & 1) == 0) {
        if (vcount < 100) {
            REG_BLDCNT = 200;
            // TODO: In "bb.c", REG_BLDY matches as vu8, but here it is vu16
            (*(vu16*)REG_ADDR_BLDY) = ((100 - vcount) * 16) / 100;
        }

        if (vcount == 0) {
            REG_BG0VOFS = gLCDControlBuffer.bgoffset[0].y;
        }

        if (vcount == 120) {
            REG_BG0VOFS = 4;
        }
    }

    return;
}

//! FE8U = 0x080B0760
s8 InitBonusClaimData(void) {
    int i;

    int count = 0;

    CpuFill16(0, gpBonusClaimItemList, 0x80);
    CpuFill16(0, gpBonusClaimData, 0x144);

    if (LoadBonusContentData(gpBonusClaimData) != 0) {
        CpuFastCopy(gpBonusClaimData, gpBonusClaimDataUpdated, 0x144);

        for (i = 0; i < 0x10; i++) {
            struct BonusClaimEnt* ent = &gpBonusClaimData[i];
            struct BonusClaimEnt* ent2;

            if ((ent->unseen & 3) == 0) {
                continue;
            }

            switch (ent->kind) {
                case BONUSKIND_ITEM1:
                    if ((gPlaySt.unk_2B_00) == 0) {
                        continue;
                    }

                case BONUSKIND_ITEM0:
                case BONUSKIND_MONEY:
                    gpBonusClaimItemList[count].unk_00 = i;

                    if (((1 << i) & GetBonusContentClaimFlags()) != 0) {
                        gpBonusClaimItemList[count].claimable = 0;
                    } else {
                        gpBonusClaimItemList[count].claimable = 1;
                    }

                    count++;

                    break;
            }

            ent2 = &gpBonusClaimData[i];
            if ((ent2->unseen & 3) == 1) {
                struct BonusClaimEnt* ent3 = &gpBonusClaimDataUpdated[i];
                ent3->unseen = (ent3->unseen & 0xfc) + 2;
            }
        }

        *gpBonusClaimItemCount = count;

        SaveBonusContentData(gpBonusClaimDataUpdated);
    }

    if (count == 0) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080B0894
void DrawBonusClaimItemText(int idx) {
    int unk1;
    s8 claimable;
    int unk3;
    int itemId;
    int color;
    struct BonusClaimEnt* ent;
    struct BonusClaimEnt* ent2;

    struct Text* th = gpBonusClaimText + ((idx % 6) << 1);

    unk1 = idx * 2;
    unk1 &= 0x1f;

    claimable = gpBonusClaimItemList[idx].claimable;
    unk3 = gpBonusClaimItemList[idx].unk_00;

    ent = gpBonusClaimData;
    ent += unk3;

    itemId = ent->itemId;

    color = TEXT_COLOR_SYSTEM_WHITE;

    TileMap_FillRect(gBG2TilemapBuffer + ((unk1) * 0x20), 0x14, 1, 0);

    ClearText(th);

    if (idx >= 0x20) {
        return;
    }

    ent2 = &gpBonusClaimData[unk3];
    if ((ent2->unseen & 3) == 0) {
        return;
    }

    if ((ent2->unseen & 3) == 1) {
        color = TEXT_COLOR_SYSTEM_GREEN;
    }

    if (claimable == 0) {
        color = TEXT_COLOR_SYSTEM_GRAY;
    }

    switch (gpBonusClaimData[unk3].kind) {
        case BONUSKIND_ITEM0:
        case BONUSKIND_ITEM1:
            PutDrawText(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            PutNumberOrBlank(
                gBG2TilemapBuffer + (unk1 * 0x20) + 0xA,
                color == 0 ? TEXT_COLOR_SYSTEM_BLUE : color,
                GetItemMaxUses(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;

        case BONUSKIND_MONEY:
            PutDrawText(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;
    }

    th++;

    ClearText(th);

    PutDrawText(
        th,
        gBG2TilemapBuffer + 12 + unk1 * 0x20,
        color == 0 ? TEXT_COLOR_SYSTEM_GOLD : color,
        0,
        0,
        gpBonusClaimData[unk3].str
    );

    BG_EnableSyncByMask(4);

    return;
}


//! FE8U = 0x080B0A24
void SetBonusItemClaimed(int idx) {
    struct BonusClaimItemEnt* ent = &gpBonusClaimItemList[idx];

    int itemFlag = ent->unk_00;

    SetBonusContentClaimFlags((1 << itemFlag) | GetBonusContentClaimFlags());

    ent->claimable = 0;

    return;
}

//! FE8U = 0x080B0A50
void SetupBonusClaimTargets(struct BonusClaimProc * proc)
{
    int i, count = 0;

    ResetUnitSprites();
    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if (unit->pCharacterData->number != CHARACTER_EIRIKA && unit->pCharacterData->number != CHARACTER_EPHRAIM)
            continue;

        (gpBonusClaimConfig + count)->unit = unit;
        count++;
        UseUnitSprite(GetUnitSMSId(unit));
    }

    proc->targets = count + 1;
    SetupMapSpritesPalettes();
    ForceSyncUnitSpriteSheet();
}

//! FE8U = 0x080B0ABC
void sub_80B0ABC(void) {
    DrawUiFrame2(3, 6, 24, 12, 0);
    BG_EnableSyncByMask(3);
    return;
}

//! FE8U = 0x080B0ADC
void BonusClaim_Init(struct BonusClaimProc * proc)
{
    int i;

    SetupBackgrounds(0);

    ApplyPalettes(Pal_CommGameBgScreenInShop, 0xC, 2);
    ApplyPalette(Pal_08A295B4, 0xE);
    Decompress(Img_CommGameBgScreen, (void*)0x06008000);

    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_CommGameBgScreenInShop, 0xc000);

    BG_EnableSyncByMask(8);

    LoadUiFrameGraphics();
    ResetText();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    sub_80B0674();
    sub_80B0ABC();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 2;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 56;
    gLCDControlBuffer.win1_right = 240;
    gLCDControlBuffer.win1_bottom = 136;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitBonusClaimData();

    for (i = 0; i <= 5 && i < *gpBonusClaimItemCount; i++) {
        struct Text* th = gpBonusClaimText + i * 2;
        InitText(th, 7);
        th++;
        InitText(th, 10);
        DrawBonusClaimItemText(i);
    }

    for (i = 0; i < 2; i++) {
        InitText(gpBonusClaimText + 12 + i, 6);
    }

    InitText(gpBonusClaimText + 14, 15);

    StartParallelWorker(PutChapterBannerSprites, proc);

    BG_EnableSyncByMask(2);

    SetPrimaryHBlankHandler(sub_80B06FC);

    proc->menuIndex = 0;
    proc->unk_2c = 0;
    proc->unk_2e = 0;
    proc->submenuIndex = 0;
    proc->targets = 2;

    proc->unk_34 = NULL;

    BG_SetPosition(2, -40, (proc->unk_2c - 56) & 0xff);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);
    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    StartGreenText(proc);

    StartMenuScrollBar(proc);

    PutMenuScrollBarAt(200, 0x40);

    InitMenuScrollBarImg(0x200, 2);

    UpdateMenuScrollBarConfig(8, proc->unk_2c, *gpBonusClaimItemCount, 5);

    StartUiCursorHand(proc);

    SetupBonusClaimTargets(proc);

    LoadHelpBoxGfx((void*)0x06013800, 5);

    return;
}

//! FE8U = 0x080B0D38
void BonusClaim_Loop_MainKeyHandler(struct BonusClaimProc * proc)
{
    u16 tmp;
    struct BonusClaimEnt* ent;

    int curIdx = proc->menuIndex;

    if (proc->unk_2e == 0) {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            int itemIdx = gpBonusClaimItemList[curIdx].unk_00;

            if (((1 << itemIdx) & GetBonusContentClaimFlags()) != 0) {
                StartBonusClaimHelpBox(-1, -1, 0x88F, proc); // TODO: msgid "Already used"
                return;
            }

            if (proc->targets != 0) {
                struct BonusClaimEnt* ent2 = gpBonusClaimData;
                ent2 += itemIdx;

                switch (ent2->kind) {
                    case BONUSKIND_ITEM0:
                    case BONUSKIND_ITEM1:
                        Proc_Goto(proc, 1);
                        PlaySoundEffect(0x6a);

                    default:
                        return;

                    case BONUSKIND_MONEY:
                        if (ent2->itemId == ITEM_3000G) {
                            sub_8024E20(3000);
                        }

                        ent = &gpBonusClaimData[itemIdx];
                        if (ent->itemId == ITEM_5000G) {
                            sub_8024E20(5000);
                        }

                        SetBonusItemClaimed(proc->menuIndex);
                        DrawBonusClaimItemText(proc->menuIndex);

                        Proc_Goto(proc, 2);

                        return;
                }
            }

            PlaySoundEffect(0x6c);

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Break(proc);
            PlaySoundEffect(0x6b);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            curIdx -= 1;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            curIdx += 1;
        }

        if (proc->menuIndex != curIdx) {
            if (curIdx >= 0) {

                if (curIdx >= *gpBonusClaimItemCount) {
                    return;
                }

                PlaySoundEffect(0x66);

                proc->menuIndex = curIdx;

                if ((proc->menuIndex * 16 - proc->unk_2c == 0) && (proc->menuIndex != 0)) {
                    proc->unk_2e = -1;
                    DrawBonusClaimItemText(proc->menuIndex - 1);
                } else if ((proc->menuIndex * 16 - proc->unk_2c == 64) && (proc->menuIndex < *gpBonusClaimItemCount - 1)) {
                    proc->unk_2e = 1;
                    DrawBonusClaimItemText(proc->menuIndex + 1);
                } else {
                    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);
                }
            } else {
                return;
            }
        }

        if (proc->unk_2e == 0) {
            return;
        }
    }

    if (proc->unk_2e < 0) {
        proc->unk_2c -= 4;
    }

    if (proc->unk_2e > 0) {
        proc->unk_2c += 4;
    }

    tmp = (proc->unk_2c);
    tmp &= 0xf;

    if (tmp == 0) {
        proc->unk_2e = 0;
    }

    BG_SetPosition(2, -40, (proc->unk_2c - 56) & 0xff);

    UpdateMenuScrollBarConfig(8, proc->unk_2c, *gpBonusClaimItemCount, 5);

    return;
}

//! FE8U = 0x080B0F94
void BonusClaim_DrawTargetUnitSprites(struct BonusClaimProc * proc)
{
    int i;

    for (i = 0; i < proc->targets - 1; i++)
    {
        struct Unit * unit = gpBonusClaimConfig[i].unit;

        if (gpBonusClaimConfig[i].hasInventorySpace != 0)
            PutUnitSpriteForClassId(0, 96, 48 + i * 16, 0xc400, unit->pClassData->number);
        else
            PutUnitSpriteForClassId(0, 96, 48 + i * 16, 0xf400, unit->pClassData->number);
    }
    SyncUnitSpriteSheet();
}

//! FE8U = 0x080B1008
void sub_80B1008(struct BonusClaimProc * proc)
{

    if (proc->unk_34 != NULL) {
        Proc_End(proc->unk_34);
        proc->unk_34 = NULL;
    }

    return;
}

//! FE8U = 0x080B1020
void BonusClaim_StartSelectTargetSubMenu(struct BonusClaimProc * proc)
{
    int i;

    struct Text* th = gpBonusClaimText + 12;
    int sl = proc->targets;
    int tmp = (proc->targets * 2);

    DrawUiFrame2(11, 5, 14, tmp + 2, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.win0_left = 88;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 200;
    gLCDControlBuffer.win0_bottom = (tmp + 7) * 8;

    SetUiCursorHandConfig(0, 40, proc->menuIndex * 16 + 56 - proc->unk_2c, 1);

    ShowSysHandCursor(92, proc->submenuIndex * 16 + 48, 12, 0x800);

    for (i = 0; i < sl; th++, i++)
    {
        int count;
        int color = 0;
        struct Unit * unit = gpBonusClaimConfig[i].unit;
        u16 * tm = gBG0TilemapBuffer + 14;

        ClearText(th);
        Text_SetCursor(th, 0);

        if (i == sl - 1)
        {
            count = GetConvoyItemCount();
            color = (count == CONVOY_ITEM_COUNT) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
            Text_SetParams(th, 0, color);
            Text_DrawString(th, GetStringFromIndex(0x308)); // TODO: msgid "Supply"
        }
        else
        {
            count = GetUnitItemCount(unit);
            color = (count == UNIT_ITEM_COUNT) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
            Text_SetParams(th, 0, color);
            Text_DrawString(th, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        if (color == 0)
            gpBonusClaimConfig[i].hasInventorySpace = 1;
        else
            gpBonusClaimConfig[i].hasInventorySpace = 0;

        PutText(th, tm + 0xc0 + 0x40 * i);

        PutNumber(
            tm + 0xc9 + 0x40 * i,
            color == 0 ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            count
        );
    }

    proc->unk_34 = StartParallelWorker(BonusClaim_DrawTargetUnitSprites, proc);
}

//! FE8U = 0x080B11E4
bool TryClaimBonusItem(struct BonusClaimProc * proc)
{
    int itemId;

    int tmp = proc->submenuIndex;
    struct BonusClaimConfig * base = gpBonusClaimConfig;
    struct BonusClaimConfig * unk = base - (-tmp);
    struct BonusClaimItemEnt * itemEnt = gpBonusClaimItemList + proc->menuIndex;
    int tmp2 = itemEnt->unk_00;

    struct BonusClaimEnt* ent = gpBonusClaimData;
    ent += tmp2;

    itemId = ent->itemId;

    if (unk->hasInventorySpace == 0)
        return false;

    SetBonusItemClaimed(proc->menuIndex);
    DrawBonusClaimItemText(proc->menuIndex);

    if (proc->submenuIndex == proc->targets - 1)
        AddItemToConvoy(MakeNewItem(itemId));
    else
        UnitAddItem(gpBonusClaimConfig[proc->submenuIndex].unit, MakeNewItem(itemId));

    return true;
}

//! FE8U = 0x080B1288
void BonusClaim_Loop_SelectTargetKeyHandler(struct BonusClaimProc * proc)
{
    int tmp = proc->submenuIndex;

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (TryClaimBonusItem(proc) != 0) {
            Proc_Goto(proc, 2);
            return;
        }

        StartBonusClaimHelpBox(-1, -1, 0x890, proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Break(proc);
        PlaySoundEffect(0x6b);
        return;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        tmp--;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        tmp++;
    }

    if (((tmp != proc->submenuIndex) && (-1 < tmp)) && (tmp < proc->targets)) {
        PlaySoundEffect(0x66);
        proc->submenuIndex = tmp;
        ShowSysHandCursor(92, proc->submenuIndex * 16 + 48, 12, 0x800);
    }

    return;
}

//! FE8U = 0x080B1350
void BonusClaim_EndSelectTargetSubMenu(struct BonusClaimProc * proc){
    sub_80B1008(proc);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG0TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    sub_80ACA84(0);

    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    return;
}

//! FE8U = 0x080B13BC
void BonusClaim_DrawItemSentPopup(struct BonusClaimProc * proc)
{
    const char* itemNameStr;
    const char* otherStr;
    int width;
    int x;
    struct Text* th;
    char buf[32];
    struct BonusClaimEnt* ent;
    struct BonusClaimEnt* ent2;
    int itemId;

    int idx = gpBonusClaimItemList[proc->menuIndex].unk_00;

    ent = gpBonusClaimData;
    ent += idx;
    itemId = ent->itemId;

    th = gpBonusClaimText + 14;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    sub_80B1008(proc);

    WriteGameSave(ReadLastGameSaveId());

    proc->timer = 0;
    sub_80ACA84(0);

    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    ClearText(th);
    Text_SetParams(th, 0, TEXT_COLOR_SYSTEM_WHITE);
    Text_SetCursor(th, 0);

    itemNameStr = GetItemName(itemId);
    otherStr = GetStringFromIndexInBuffer(0x883, buf); // TODO: msgid "Sent[.]"

    width = ((GetStringTextLen(itemNameStr) + GetStringTextLen(otherStr) + 7) / 8) + 4;
    x = 15 - width / 2;

    Text_DrawString(th, itemNameStr);
    Text_DrawString(th, otherStr);

    PutText(th, gBG0TilemapBuffer + x + 0x143);

    DrawIcon(gBG0TilemapBuffer + x + 0x141, GetItemIconId(itemId), 0x4000);

    ent2 = gpBonusClaimData;
    ent2 += idx;
    switch (ent2->kind) {
        case BONUSKIND_ITEM0:
        case BONUSKIND_ITEM1:
            PlaySoundEffect(0x5a);
            break;
        case BONUSKIND_MONEY:
            PlaySoundEffect(0xb9);
            break;
    }

    DrawUiFrame(gBG1TilemapBuffer, x, 10, width, 3, 0, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 0;

    gLCDControlBuffer.win0_left = x * 8;
    gLCDControlBuffer.win0_top = 80;
    gLCDControlBuffer.win0_right = (x + width) * 8;
    gLCDControlBuffer.win0_bottom = 104;

    BG_EnableSyncByMask(3);

    BG_SetPosition(0, 0, -4);

    return;
}

//! FE8U = 0x080B15E8
void BonusClaim_Loop_PopupDisplayTimer(struct BonusClaimProc * proc)
{
    proc->timer++;

    if ((proc->timer > 30) && (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)))
    {
        Proc_Break(proc);
        return;
    }

    if (proc->timer > 120)
        Proc_Break(proc);
}

//! FE8U = 0x080B1620
void BonusClaim_ClearItemSentPopup(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    sub_80B0ABC();
    BG_EnableSyncByMask(3);
    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;
    BG_SetPosition(0, 0, 0);
}

//! FE8U = 0x080B166C
void BonusClaim_OnEnd(struct BonusClaimProc * proc)
{
    EndGreenText();
    EndAllProcChildren(proc);
    SetPrimaryHBlankHandler(NULL);
}

struct ProcCmd CONST_DATA gProcScr_BonusClaim[] = {
    PROC_SLEEP(0),

    PROC_CALL(BonusClaim_Init),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

    // fallthrough

PROC_LABEL(0),
    PROC_REPEAT(BonusClaim_Loop_MainKeyHandler),

    PROC_GOTO(100),

PROC_LABEL(1),
    PROC_CALL(BonusClaim_StartSelectTargetSubMenu),
    PROC_REPEAT(BonusClaim_Loop_SelectTargetKeyHandler),
    PROC_CALL(BonusClaim_EndSelectTargetSubMenu),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(BonusClaim_DrawItemSentPopup),
    PROC_REPEAT(BonusClaim_Loop_PopupDisplayTimer),
    PROC_CALL(BonusClaim_ClearItemSentPopup),

    PROC_GOTO(0),

PROC_LABEL(100),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(BonusClaim_OnEnd),

    PROC_END,
};

//! FE8U = 0x080B1688
void StartBonusClaimScreen(ProcPtr parent)
{
    Proc_StartBlocking(gProcScr_BonusClaim, parent);
}
