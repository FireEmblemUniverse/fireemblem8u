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

#include "constants/characters.h"
#include "constants/items.h"

struct BonusClaimProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 menuIndex;
    /* 2A */ u8 submenuIndex;
    /* 2B */ u8 targets;
    /* 2C */ s16 unk_2c;
    /* 2E */ s8 unk_2e;
    /* 30 */ int timer;
    /* 34 */ ProcPtr unk_34;
};

struct Unknown8A215A4 {
    /* 00 */ s8 hasInventorySpace;
    /* 04 */ struct Unit* unit;
};

struct BonusClaimEnt {
    /* 00 */ u8 unseen;
    /* 01 */ u8 kind;
    /* 02 */ u8 itemId;
    /* 03 */ char str[0x11]; // Only used in FE8
};

enum {
    BONUSKIND_ITEM0 = 0,
    BONUSKIND_ITEM1 = 1,
    BONUSKIND_MONEY = 2,
    BONUSKIND_SONG3 = 3,
    BONUSKIND_SONG4 = 4,
};

struct BonusClaimItemEnt {
    /* 00 */ s8 unk_00;
    /* 01 */ s8 claimable;
};

extern struct BonusClaimEnt gUnknown_02000968[];
extern struct BonusClaimEnt gUnknown_02000D68[];
extern struct BonusClaimItemEnt gUnknown_02001168[];
extern struct Unknown8A215A4 gUnknown_02001368[];
extern int gUnknown_02001568;
extern struct TextHandle gUnknown_02001668[];

struct BonusClaimEnt* CONST_DATA gpBonusClaimData = gUnknown_02000968;
struct BonusClaimEnt* CONST_DATA gpBonusClaimDataUpdated = gUnknown_02000D68;
struct BonusClaimItemEnt* CONST_DATA gpBonusClaimItemList = gUnknown_02001168;
int* CONST_DATA gpBonusClaimItemCount = &gUnknown_02001568;
struct TextHandle* CONST_DATA gpBonusClaimText = gUnknown_02001668;
struct Unknown8A215A4* CONST_DATA gUnknown_08A215A4 = gUnknown_02001368;

int LoadBonusContentData(void*);

//! FE8U = 0x080B0638
void PutChapterBannerSprites(void) {
    PutSpriteExt(4, 24, 8, *gUnknown_08A209F0, 0x8000);
    PutSpriteExt(4, 24, 16, *gUnknown_08A209E4, 0x9000);
    return;
}

//! FE8U = 0x080B0674
void sub_80B0674(void) {

    u32 flags = (-(gPlaySt.chapterStateBits & 0x40) >> 0x1f) & 4;

    if (gPlaySt.cfgController == 0) {
        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_COMMON) {
            flags |= 0x10;
        }

        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EIRIKA) {
            flags |= 0x20;
        }

        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EPHRAIM) {
            flags |= 0x40;
        }
    } else {
        if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EPHRAIM) {
            flags |= 0x40;
        } else {
            flags |= 0x20;
        }
    }

    sub_80895B4(flags | 1, 0x18);
    sub_80895B4(flags, 0x19);

    EnablePaletteSync();

    sub_8089678(0xac0);
    sub_8089624(0xb40, sub_8089768(&gPlaySt));

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

    struct TextHandle* th = gpBonusClaimText + ((idx % 6) << 1);

    unk1 = idx * 2;
    unk1 &= 0x1f;

    claimable = gpBonusClaimItemList[idx].claimable;
    unk3 = gpBonusClaimItemList[idx].unk_00;

    ent = gpBonusClaimData;
    ent += unk3;

    itemId = ent->itemId;

    color = TEXT_COLOR_NORMAL;

    TileMap_FillRect(gBG2TilemapBuffer + ((unk1) * 0x20), 0x14, 1, 0);

    Text_Clear(th);

    if (idx >= 0x20) {
        return;
    }

    ent2 = &gpBonusClaimData[unk3];
    if ((ent2->unseen & 3) == 0) {
        return;
    }

    if ((ent2->unseen & 3) == 1) {
        color = TEXT_COLOR_GREEN;
    }

    if (claimable == 0) {
        color = TEXT_COLOR_GRAY;
    }

    switch (gpBonusClaimData[unk3].kind) {
        case BONUSKIND_ITEM0:
        case BONUSKIND_ITEM1:
            DrawTextInline(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            DrawDecNumber(
                gBG2TilemapBuffer + (unk1 * 0x20) + 0xA,
                color == 0 ? TEXT_COLOR_BLUE : color,
                GetItemMaxUses(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;

        case BONUSKIND_MONEY:
            DrawTextInline(
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

    Text_Clear(th);

    DrawTextInline(
        th,
        gBG2TilemapBuffer + 12 + unk1 * 0x20,
        color == 0 ? TEXT_COLOR_GOLD : color,
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
void SetupBonusClaimTargets(struct BonusClaimProc* proc) {
    int i;

    int count = 0;

    ResetUnitSprites();

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_BIT16)) {
            continue;
        }

        if (unit->pCharacterData->number != CHARACTER_EIRIKA && unit->pCharacterData->number != CHARACTER_EPHRAIM) {
            continue;
        }

        (gUnknown_08A215A4 + count)->unit = unit;
        count++;
        UseUnitSprite(GetUnitSMSId(unit));
    }

    proc->targets = count + 1;

    SetupMapSpritesPalettes();

    ForceSyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080B0ABC
void sub_80B0ABC(void) {
    DrawUiFrame2(3, 6, 24, 12, 0);
    BG_EnableSyncByMask(3);
    return;
}

//! FE8U = 0x080B0ADC
void BonusClaim_Init(struct BonusClaimProc* proc) {
    int i;

    SetupBackgrounds(0);

    CopyToPaletteBuffer(gUnknown_08B1754C, 0x180, 0x40);
    CopyToPaletteBuffer(gUnknown_08A295B4, 0x1c0, 0x20);
    Decompress(Img_CommGameBgScreen, (void*)0x06008000);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A295D4, 0xc000);

    BG_EnableSyncByMask(8);

    LoadUiFrameGraphics();
    Font_InitForUIDefault();
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
        struct TextHandle* th = gpBonusClaimText + i * 2;
        Text_Init(th, 7);
        th++;
        Text_Init(th, 10);
        DrawBonusClaimItemText(i);
    }

    for (i = 0; i < 2; i++) {
        Text_Init(gpBonusClaimText + 12 + i, 6);
    }

    Text_Init(gpBonusClaimText + 14, 15);

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

    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x600, 1);
    ShowPrepScreenHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    NewGreenTextColorManager(proc);

    Make6CMenuScroll(proc);

    sub_80976AC(200, 0x40);

    InitPrepSideBarImg(0x200, 2);

    sub_80976CC(8, proc->unk_2c, *gpBonusClaimItemCount, 5);

    sub_80AC9C0(proc);

    SetupBonusClaimTargets(proc);

    LoadDialogueBoxGfx((void*)0x06013800, 5);

    return;
}

//! FE8U = 0x080B0D38
void BonusClaim_Loop_MainKeyHandler(struct BonusClaimProc* proc) {
    u16 tmp;
    struct BonusClaimEnt* ent;

    int curIdx = proc->menuIndex;

    if (proc->unk_2e == 0) {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            int itemIdx = gpBonusClaimItemList[curIdx].unk_00;

            if (((1 << itemIdx) & GetBonusContentClaimFlags()) != 0) {
                sub_80AEBCC(-1, -1, 0x88F, proc); // TODO: msgid "Already used"
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
                    ShowPrepScreenHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);
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

    sub_80976CC(8, proc->unk_2c, *gpBonusClaimItemCount, 5);

    return;
}

//! FE8U = 0x080B0F94
void BonusClaim_DrawTargetUnitSprites(struct BonusClaimProc* proc) {
    int i;

    for (i = 0; i < proc->targets - 1; i++) {
        struct Unit* unit = gUnknown_08A215A4[i].unit;

        if (gUnknown_08A215A4[i].hasInventorySpace != 0) {
            PutUnitSpriteForClassId(0, 96, 48 + i * 16, 0xc400, unit->pClassData->number);
        } else {
            PutUnitSpriteForClassId(0, 96, 48 + i * 16, 0xf400, unit->pClassData->number);
        }
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080B1008
void sub_80B1008(struct BonusClaimProc* proc) {

    if (proc->unk_34 != NULL) {
        Proc_End(proc->unk_34);
        proc->unk_34 = NULL;
    }

    return;
}

//! FE8U = 0x080B1020
void BonusClaim_StartSelectTargetSubMenu(struct BonusClaimProc* proc) {
    int i;

    struct TextHandle* th = gpBonusClaimText + 12;
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

    sub_80AC9D4(0, 40, proc->menuIndex * 16 + 56 - proc->unk_2c, 1);

    ShowPrepScreenHandCursor(92, proc->submenuIndex * 16 + 48, 12, 0x800);

    for (i = 0; i < sl; th++, i++) {
        int count;
        int color = 0;
        struct Unit* unit = gUnknown_08A215A4[i].unit;
        u16* tm = gBG0TilemapBuffer + 14;

        Text_Clear(th);
        Text_SetXCursor(th, 0);

        if (i == sl - 1) {
            count = GetConvoyItemCount();
            color = (count == CONVOY_ITEM_COUNT) ? TEXT_COLOR_GRAY : TEXT_COLOR_NORMAL;
            Text_SetParameters(th, 0, color);
            Text_AppendString(th, GetStringFromIndex(0x308)); // TODO: msgid "Supply"
        } else {
            count = GetUnitItemCount(unit);
            color = (count == UNIT_ITEM_COUNT) ? TEXT_COLOR_GRAY : TEXT_COLOR_NORMAL;
            Text_SetParameters(th, 0, color);
            Text_AppendString(th, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        if (color == 0) {
            gUnknown_08A215A4[i].hasInventorySpace = 1;
        } else {
            gUnknown_08A215A4[i].hasInventorySpace = 0;
        }

        Text_Draw(th, tm + 0xc0 + 0x40 * i);

        sub_8004B88(
            tm + 0xc9 + 0x40 * i,
            color == 0 ? TEXT_COLOR_BLUE : TEXT_COLOR_GRAY,
            count
        );
    }

    proc->unk_34 = StartParallelWorker(BonusClaim_DrawTargetUnitSprites, proc);

    return;
}

//! FE8U = 0x080B11E4
s8 TryClaimBonusItem(struct BonusClaimProc* proc) {
    int itemId;

    int tmp = proc->submenuIndex;
    struct Unknown8A215A4* base = gUnknown_08A215A4;
    struct Unknown8A215A4* unk = base - (-tmp);

    struct BonusClaimItemEnt* itemEnt = gpBonusClaimItemList + proc->menuIndex;
    int tmp2 = itemEnt->unk_00;

    struct BonusClaimEnt* ent = gpBonusClaimData;
    ent += tmp2;

    itemId = ent->itemId;

    if (unk->hasInventorySpace == 0) {
        return 0;
    }

    SetBonusItemClaimed(proc->menuIndex);
    DrawBonusClaimItemText(proc->menuIndex);

    if (proc->submenuIndex == proc->targets - 1) {
        AddItemToConvoy(MakeNewItem(itemId));
    } else {
        UnitAddItem(gUnknown_08A215A4[proc->submenuIndex].unit, MakeNewItem(itemId));
    }

    return 1;
}

//! FE8U = 0x080B1288
void BonusClaim_Loop_SelectTargetKeyHandler(struct BonusClaimProc* proc) {
    int tmp = proc->submenuIndex;

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (TryClaimBonusItem(proc) != 0) {
            Proc_Goto(proc, 2);
            return;
        }

        sub_80AEBCC(-1, -1, 0x890, proc);
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
        ShowPrepScreenHandCursor(92, proc->submenuIndex * 16 + 48, 12, 0x800);
    }

    return;
}

//! FE8U = 0x080B1350
void BonusClaim_EndSelectTargetSubMenu(struct BonusClaimProc* proc) {
    sub_80B1008(proc);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG0TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    sub_80ACA84(0);

    ShowPrepScreenHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    return;
}

//! FE8U = 0x080B13BC
void BonusClaim_DrawItemSentPopup(struct BonusClaimProc* proc) {
    const char* itemNameStr;
    const char* otherStr;
    int width;
    int x;
    struct TextHandle* th;
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

    ShowPrepScreenHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    Text_Clear(th);
    Text_SetParameters(th, 0, TEXT_COLOR_NORMAL);
    Text_SetXCursor(th, 0);

    itemNameStr = GetItemName(itemId);
    otherStr = GetStringFromIndexInBuffer(0x883, buf); // TODO: msgid "Sent[.]"

    width = ((GetStringTextWidth(itemNameStr) + GetStringTextWidth(otherStr) + 7) / 8) + 4;
    x = 15 - width / 2;

    Text_AppendString(th, itemNameStr);
    Text_AppendString(th, otherStr);

    Text_Draw(th, gBG0TilemapBuffer + x + 0x143);

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
void BonusClaim_Loop_PopupDisplayTimer(struct BonusClaimProc* proc) {

    proc->timer++;

    if ((proc->timer > 30) && (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))) {
        Proc_Break(proc);
        return;
    } else {
        if (proc->timer > 120) {
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x080B1620
void BonusClaim_ClearItemSentPopup(void) {

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_SetPosition(0, 0, 0);

    return;
}

//! FE8U = 0x080B166C
void BonusClaim_OnEnd(struct BonusClaimProc* proc) {
    EndGreenTextColorManager();
    EndAllProcChildren(proc);
    SetPrimaryHBlankHandler(NULL);
    return;
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
void StartBonusClaimScreen(ProcPtr parent) {
    Proc_StartBlocking(gProcScr_BonusClaim, parent);
    return;
}
