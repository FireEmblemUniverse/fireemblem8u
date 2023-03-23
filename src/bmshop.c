#include "global.h"

#include "bmunit.h"
#include "player_interface.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmcontainer.h"
#include "mu.h"
#include "icon.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "scene.h"

#include "bmshop.h"

#include "constants/faces.h"
#include "constants/items.h"

struct BmShopProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;
    /* 30 */ u16 shopItems[20];

    /* 58 */ u16 unk_58;

    /* 5A */ u8 shopItemCount;
    /* 5B */ u8 unitItemCount;
    /* 5C */ u8 curIndex;
    /* 5D */ u8 unk_5d;
    /* 5E */ u8 unk_5e;
    /* 5F */ u8 unk_5f; // maybe top visible item in menu?
    /* 60 */ u8 unk_60;
    /* 61 */ u8 shopType;
    /* 62 */ u8 helpTextActive;

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

struct BmShop2Proc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x54-0x29];

    /* 54 */ struct BmShopProc* unk_54;
};

typedef void (*ShopFunc)(struct BmShopProc*, int);

struct ShopState {
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0A;
    /* 0C */ u16 unk_0C;
    /* 10 */ int unk_10;
    /* 14 */ ShopFunc unk_14;
    /* 18 */ ProcPtr unk_18;
};

u16 CONST_DATA gDefaultShopInventory[] = {
    ITEM_SWORD_IRON,
    ITEM_LANCE_IRON,
    ITEM_AXE_IRON,
    ITEM_BOW_IRON,
    ITEM_ANIMA_FIRE,
    ITEM_STAFF_HEAL,
    ITEM_NONE,
    ITEM_NONE,
};

int CONST_DATA gShopDialogueOffsetLut[] = {
    [SHOP_TYPE_ARMORY]      = 0,
    [SHOP_TYPE_VENDOR]      = 1,
    [SHOP_TYPE_SECRET_SHOP] = 2
};

int CONST_DATA gShopPortraitLut[] = {
    [SHOP_TYPE_ARMORY]      = FID_SHOP_ARMORY,
    [SHOP_TYPE_VENDOR]      = FID_SHOP_VENDOR,
    [SHOP_TYPE_SECRET_SHOP] = FID_SHOP_SECRET
};

struct ProcCmd CONST_DATA gProcScr_ShopFadeIn[] = {
    PROC_CALL(AddSkipThread2),
    PROC_SLEEP(1),

    PROC_CALL_ARG(sub_8014BD0, -1),
    PROC_CALL(StartFadeInBlackMedium),

    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_ShopFadeOut[] = {
    PROC_CALL(ResetDialogueScreen),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(StartMapSongBgm),
    PROC_CALL(sub_8013D8C),

    PROC_REPEAT(WaitForFade),
    PROC_CALL(SubSkipThread2),

    PROC_END,
};

void StartShopFadeIn(struct BmShopProc* proc);
void ShopProc_Init(struct BmShopProc* proc);
void ShopProc_InitBuyState(struct BmShopProc* proc);
void ShopProc_EnterShopDialogue(struct BmShopProc* proc);
void ShopProc_HandleEntryPrompt(struct BmShopProc* proc);
void ShopProc_BuyDialogue(struct BmShopProc* proc);
void ShopProc_Loop_BuyKeyHandler(struct BmShopProc* proc);
void ShopProc_HandleBuyConfirmPrompt(struct BmShopProc* proc);
void ShopProc_AnythingElseDialogue(struct BmShopProc* proc);
void ShopProc_SellDialogue(struct BmShopProc* proc);
void ShopProc_InitSellState(struct BmShopProc* proc);
void ShopProc_Loop_SellKeyHandler(struct BmShopProc* proc);
void ShopProc_HandleSellConfirmPrompt(struct BmShopProc* proc);
void ShopProc_SellAnythingElseDialogue(struct BmShopProc* proc);
void ShopProc_AnythingElseRestartDialogue(struct BmShopProc* proc);
void ShopProc_AnythingElseContinueDialogue(struct BmShopProc* proc);
void ShopProc_TryAddItemToInventory(struct BmShopProc* proc);
void ShopProc_HandleSendToConvoyPrompt(struct BmShopProc* proc);
void ShopProc_CheckIfConvoyFull(struct BmShopProc* proc);
void ShopProc_ConvoyFullDialogue(struct BmShopProc* proc);
void ShopProc_AddItemToConvoy(struct BmShopProc* proc);
void ShopProc_SendToConvoyDialogue(struct BmShopProc* proc);
void ShopProc_NoSendToConvoyDialogue(struct BmShopProc* proc);
void ShopProc_EnterPrepScreenShopDialogue(struct BmShopProc* proc);
void ShopProc_Loop_UnkKeyHandler(struct BmShopProc* proc);
void ShopProc_ExitShopDialogue(struct BmShopProc* proc);
void ShopProc_OnExit(void);
void StartShopFadeOut(struct BmShopProc* proc);

extern struct ProcCmd CONST_DATA gProcScr_08A394D0[];

struct ProcCmd CONST_DATA gProcScr_Shop[] = {
    PROC_CALL(StartShopFadeIn),
    PROC_SLEEP(0),

    PROC_CALL(AddSkipThread2),

    PROC_CALL(ShopProc_Init),
    PROC_CALL(ShopProc_InitBuyState),

    PROC_START_CHILD(gProcScr_08A394D0),

    PROC_CALL(sub_8013FC4),
    PROC_SLEEP(1),

    PROC_CALL(ShopProc_EnterShopDialogue),

PROC_LABEL(0),
    PROC_SLEEP(1),

    PROC_REPEAT(ShopProc_HandleEntryPrompt),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(ShopProc_BuyDialogue),

    // fallthrough

PROC_LABEL(2),
    PROC_CALL(ShopProc_InitBuyState),

    PROC_SLEEP(1),
    PROC_REPEAT(ShopProc_Loop_BuyKeyHandler),

    PROC_CALL(ShopProc_HandleBuyConfirmPrompt),

    PROC_GOTO(9),

PROC_LABEL(3),
    PROC_CALL(ShopProc_AnythingElseDialogue),

    PROC_GOTO(2),

PROC_LABEL(4),
    PROC_CALL(ShopProc_SellDialogue),

    // fallthrough

PROC_LABEL(5),
    PROC_CALL(ShopProc_InitSellState),
    PROC_SLEEP(1),

    PROC_REPEAT(ShopProc_Loop_SellKeyHandler),

    PROC_CALL(ShopProc_HandleSellConfirmPrompt),
    PROC_SLEEP(2),

    PROC_CALL(ShopProc_SellAnythingElseDialogue),

    PROC_GOTO(5),

PROC_LABEL(7),
    PROC_SLEEP(2),
    PROC_CALL(ShopProc_AnythingElseRestartDialogue),

    PROC_GOTO(0),

PROC_LABEL(8),
    PROC_SLEEP(1),
    PROC_CALL(ShopProc_AnythingElseContinueDialogue),

    PROC_GOTO(0),

PROC_LABEL(9),
    PROC_CALL(ShopProc_TryAddItemToInventory),
    PROC_SLEEP(0),

    PROC_CALL(ShopProc_HandleSendToConvoyPrompt),
    PROC_SLEEP(0),

    PROC_CALL(ShopProc_CheckIfConvoyFull),

    PROC_CALL(ShopProc_ConvoyFullDialogue),
    PROC_SLEEP(0),

    PROC_GOTO(7),

PROC_LABEL(10),
    PROC_CALL(ShopProc_AddItemToConvoy),
    PROC_SLEEP(0),

    PROC_CALL(ShopProc_SendToConvoyDialogue),
    PROC_SLEEP(0),

    PROC_GOTO(3),

PROC_LABEL(11),
    PROC_SLEEP(0),

    PROC_CALL(ShopProc_NoSendToConvoyDialogue),
    PROC_SLEEP(0),

    PROC_GOTO(7),

PROC_LABEL(13),
    PROC_CALL(ShopProc_EnterPrepScreenShopDialogue),
    PROC_SLEEP(0),

    PROC_REPEAT(ShopProc_Loop_UnkKeyHandler),

    // fallthrough

PROC_LABEL(12),
    PROC_CALL(ShopProc_ExitShopDialogue),
    PROC_SLEEP(1),

    PROC_CALL_ARG(sub_8014BD0, 2),

    PROC_CALL(sub_8013F40),
    PROC_SLEEP(1),

    PROC_CALL(ShopProc_OnExit),

    PROC_END_EACH(gProcScr_08A394D0),

    PROC_CALL(StartShopFadeOut),
    PROC_SLEEP(0),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};

void sub_80B5040(struct BmShop2Proc* proc);

struct ProcCmd CONST_DATA gProcScr_08A39478[] = {
    PROC_REPEAT(sub_80B5040),

    PROC_END,
};

void sub_80B5148(struct BmShop2Proc* proc);

struct ProcCmd CONST_DATA gProcScr_08A39488[] = {
    PROC_REPEAT(sub_80B5148),

    PROC_END,
};

u16 CONST_DATA gSprite_08A39498[] = {
    6,
    0x4000, 0x4000, 0x0400,
    0x4000, 0x4020, 0x0402,
    0x4008, 0x4000, 0x0406,
    0x4008, 0x4020, 0x0408,
    0x4010, 0x4000, 0x040C,
    0x4010, 0x4020, 0x040E,
};

void GoldBox_OnLoop(struct BmShopProc* proc);

struct ProcCmd CONST_DATA gProcScr_GoldBox[] = {
    PROC_REPEAT(GoldBox_OnLoop),

    PROC_END,
};

void sub_80B5378(void);

struct ProcCmd CONST_DATA gProcScr_08A394D0[] = {
    PROC_REPEAT(sub_80B5378),
};

extern struct TextHandle gShopItemTexts[6];

extern struct ShopState sShopState;
extern int gUnknown_0203EFB4; // TODO: Is this meant to be part of ShopState?
struct ShopState* CONST_DATA gShopState = &sShopState;

struct TextHandle gText_GoldBox;

// forward declaration
void StartShopScreen(struct Unit*, u16*, u8, ProcPtr);
void UpdateShopItemCounts(struct BmShopProc*);
void sub_80B4F04(struct BmShopProc*);
void sub_80B505C(struct BmShopProc*);
void sub_80B5164(struct TextHandle*, int, struct Unit*, u16*);
void DrawShopItemLine(struct TextHandle*, int, struct Unit*, u16*);
void sub_80B55AC(u16, u16, u16, u16, int, ShopFunc, struct BmShopProc*);
void sub_80B5604(void);
int sub_80B5698(void);
u16 sub_80B568C(void);
u16 sub_80B56A8(void);
void DisplayShopUiArrows(void);
s8 sub_80B56CC(void);
u16 GetItemPurchasePrice(struct Unit*, int);
void HandleShopBuyAction(struct BmShopProc*);
s8 IsItemSellable(int);
void DisplayGoldBoxText(u16*);
void sub_80B52CC(void);
void sub_80B4F90(struct BmShopProc*);
void InitGoldBoxText(u16*);
s8 ShouldDisplayUpArrow(void);
s8 ShouldDisplayDownArrow(void);


int ShopProc_GetPortraitIndex(struct BmShopProc* proc) {
    return gShopPortraitLut[proc->shopType];
}

void StartShopDialogue(int baseMsgId, struct BmShopProc* proc) {
    int msgId = baseMsgId + gShopDialogueOffsetLut[proc->shopType];

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, GetStringFromIndex(msgId), proc);

    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(1);

    return;
}

void StartDefaultArmoryScreen(struct Unit* unit, ProcPtr proc) {
    StartShopScreen(unit, NULL, SHOP_TYPE_ARMORY, proc);
    return;
}

void StartArmoryScreenOrphaned(struct Unit* unit, u16* shopItems) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, NULL);
    return;
}

void StartArmoryScreen(struct Unit* unit, u16* shopItems, ProcPtr parent) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, parent);
    return;
}

void StartVendorScreenOrphaned(struct Unit* unit, u16* shopItems) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_VENDOR, NULL);
    return;
}

void StartVendorScreen(struct Unit* unit, u16* shopItems, ProcPtr parent) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_VENDOR, parent);
    return;
}

void StartSecretShopScreenOrphaned(struct Unit* unit, u16* shopItems) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_SECRET_SHOP, NULL);
    return;
}

void StartSecretShopScreen(struct Unit* unit, u16* shopItems, ProcPtr parent) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_SECRET_SHOP, parent);
    return;
}

// duplicate??
void StartArmoryScreen2(struct Unit* unit, u16* shopItems) {
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, NULL);
    return;
}

void StartShopScreen(struct Unit* unit, u16* inventory, u8 shopType, ProcPtr parent) {
    struct BmShopProc* proc;
    u16* shopItems;
    int i;

    EndPlayerPhaseSideWindows();

    if (parent != 0) {
        proc = Proc_StartBlocking(gProcScr_Shop, parent);
    } else {
        proc = Proc_Start(gProcScr_Shop, PROC_TREE_3);
    }

    proc->shopType = shopType;
    proc->unit = unit;

    shopItems = gDefaultShopInventory;
    if (inventory != 0) {
        shopItems = inventory;
    }

    for (i = 0; i <= 20; i++) {
        u16 itemId = *shopItems++;

        proc->shopItems[i] = MakeNewItem(itemId);
    }

    UpdateShopItemCounts(proc);

    return;
}

void UpdateShopItemCounts(struct BmShopProc* proc) {
    int count = 0;

    if (*(proc->shopItems) != 0) {
        u16* item = proc->shopItems;
        count = 0;

        while (*item != 0) {
            item++;
            count++;
        }
    }

    proc->shopItemCount = count;
    proc->unitItemCount = GetUnitItemCount(proc->unit);

    return;
}

void sub_80B42E8(void) {
    struct BmShopProc* proc = Proc_Find(gProcScr_Shop);

    if (proc->unk_60 != 0) {
        sub_80B4F04(proc);
    }

    return;
}

void sub_80B4308(void) {
    struct BmShopProc* proc = Proc_Find(gProcScr_Shop);

    if (proc->unk_60 != 1) {
        sub_80B505C(proc);
    }

    return;
}

void sub_80B4328(void) {
    return;
}

void ShopProc_EnterShopDialogue(struct BmShopProc* proc) {

    if (proc->unit == 0) {
        Proc_Goto(proc, 13);
    } else {
        StartShopDialogue(0x89A, proc);
        // SHOP_TYPE_ARMORY: "Welcome to the armory.[A][NL2][NL]I deal in all sorts of goods.[.][NL][BuySell]"
        // SHOP_TYPE_VENDOR: "Welcome to the general store.[.][A][NL2][NL]How can I help you?[.][NL][BuySell]"
        // SHOP_TYPE_SECRET_SHOP: "Shhh... Hee hee...[A][NL2][NL]This is a secret shop![NL][BuySell]"
    }

    return;
}

void ShopProc_HandleEntryPrompt(struct BmShopProc* proc) {
    switch (GetTalkChoiceResult()) {
        case 0:
        default:
            Proc_Goto(proc, 12);

            return;

        case 1:
            Proc_Goto(proc, 1);

            return;

        case 2:
            if (GetUnitItemCount(proc->unit) == 0) {
                StartShopDialogue(0x8AC, proc);
                // SHOP_TYPE_ARMORY: "You've got nothing to sell![.][A]"
                // SHOP_TYPE_VENDOR: "You have nothing to sell.[.][A]"
                // SHOP_TYPE_SECRET_SHOP: "You've got nothing to sell![.][A]"

                Proc_Goto(proc, 7);
            } else {
                Proc_Goto(proc, 4);
            }
    }

    return;
}

void ShopProc_BuyDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8A3, proc);
    // SHOP_TYPE_ARMORY: "What would you like?"
    // SHOP_TYPE_VENDOR: "What can I get for you?[.]"
    // SHOP_TYPE_SECRET_SHOP: "What do you need?[.]"

    return;
}

void sub_80B43BC(struct BmShopProc* proc, int itemIndex) {
    u16 item;

    int index = DivRem(itemIndex, 6);

    SetFont(0);
    Font_LoadForUI();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    Text_Clear(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item != 0) {
        sub_80B5164(&gShopItemTexts[index], item, proc->unit, gBG2TilemapBuffer + TILEMAP_INDEX(7, (itemIndex * 2 & 0x1F)));
    }

    return;
}

void sub_80B4418(struct BmShopProc* proc, int itemIndex) {
    u16 item;

    int index = DivRem(itemIndex, 6);

    SetFont(0);
    Font_LoadForUI();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    Text_Clear(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item != 0) {
        DrawShopItemLine(&gShopItemTexts[index], item, proc->unit, gBG2TilemapBuffer + TILEMAP_INDEX(7, (itemIndex * 2 & 0x1F)));
    }

    return;
}

void ShopProc_InitBuyState(struct BmShopProc* proc) {
    sub_80B55AC(proc->unk_5e, proc->shopItemCount, 5, proc->unk_5f, 72, sub_80B43BC, proc);
    return;
}

void ShopProc_Loop_BuyKeyHandler(struct BmShopProc* proc) {
    u8 unkA;
    u32 unkC;
    int price;
    int a;
    int b;

    sub_80B5604();

    BG_SetPosition(2, 0, sub_80B5698());

    unkA = proc->curIndex;
    unkC = sub_80B568C() != unkA;

    proc->curIndex = sub_80B568C();
    proc->unk_5d = sub_80B56A8();

    proc->unk_5e = proc->curIndex;
    proc->unk_5f = proc->unk_5d;

    a = proc->curIndex;
    a *= 16;

    b = ((proc->unk_5d * 16)) - 72;

    DisplayUiHand(56, a - b);

    if ((proc->helpTextActive != 0) && (unkC != 0)) {
        a = (proc->curIndex * 16);
        b = ((proc->unk_5d * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->curIndex]);
    }

    DisplayShopUiArrows();

    if (sub_80B56CC() != 0) {
        return;
    }

    if (proc->helpTextActive != 0) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->helpTextActive = 1;
        a = (proc->curIndex * 16);
        b = ((proc->unk_5d * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->curIndex]);

        return;
    }

    price = GetItemPurchasePrice(proc->unit, proc->shopItems[proc->curIndex]);

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (price > (int)GetPartyGoldAmount()) {
            StartShopDialogue(0x8B2, proc);
            // SHOP_TYPE_ARMORY: "You don't have the money![.][A]"
            // SHOP_TYPE_VENDOR: "You're short of funds.[A]"
            // SHOP_TYPE_SECRET_SHOP: "Heh! Not enough money![A]"

            Proc_Goto(proc, 1);
        } else {
            SetTalkNumber(price);
            StartShopDialogue(0x8B5, proc);
            // SHOP_TYPE_ARMORY: "How does [.][G] gold[.][NL]sound to you?[.][Yes]"
            // SHOP_TYPE_VENDOR: "That's worth [.][G] gold.[NL]Is that all right?[Yes]"
            // SHOP_TYPE_SECRET_SHOP: "That is worth [G] gold.[NL]Is that acceptable?[.][Yes]"

            Proc_Break(proc);
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 7);

        return;
    }

    return;
}

void ShopProc_HandleBuyConfirmPrompt(struct BmShopProc* proc) {
    if (GetTalkChoiceResult() != 1) {
        Proc_Goto(proc, 1);
    }

    return;
}

void ShopProc_TryAddItemToInventory(struct BmShopProc* proc) {
    if (proc->unitItemCount >= UNIT_ITEM_COUNT) {
        if (HasConvoyAccess()) {
            StartShopDialogue(0x8BE, proc);
            // SHOP_TYPE_ARMORY: "Looks like you're full.[.][A][NL2][NL]Send it to storage?[.][NL][Yes]"
            // SHOP_TYPE_VENDOR: "Your hands are full.[A][NL2][NL]Send it to storage?[.][NL][Yes]"
            // SHOP_TYPE_SECRET_SHOP: "Your hands are full.[A][NL2][NL]Send it to storage?[.][NL][Yes]"
        } else {
            StartShopDialogue(0x8C1, proc);
            // SHOP_TYPE_ARMORY: "Looks like you're full.[.][A]"
            // SHOP_TYPE_VENDOR: "Your hands are full.[A]"
            // SHOP_TYPE_SECRET_SHOP: "Your hands are full.[A]"

            Proc_Goto(proc, 11);
        }

        return;
    }

    UnitAddItem(proc->unit, proc->shopItems[proc->curIndex]);
    HandleShopBuyAction(proc);

    Proc_Goto(proc, 3);

    return;
}

void ShopProc_HandleSendToConvoyPrompt(struct BmShopProc* proc) {
    if (GetTalkChoiceResult() != 1) {
        Proc_Goto(proc, 11);
    }

    return;
}

void ShopProc_NoSendToConvoyDialogue(struct BmShopProc* proc) {
    if (HasConvoyAccess()) {
        StartShopDialogue(0x8C7, proc);
        // SHOP_TYPE_ARMORY: "No? Too bad. You could[NL]take it if you made room.[.][A]"
        // SHOP_TYPE_VENDOR: "That's a shame. You could[.][NL]carry it if you made room.[A]"
        // SHOP_TYPE_SECRET_SHOP: "Ah, well... You could take[NL]it if you made room.[A]"
    } else {
        StartShopDialogue(0x8CA, proc);
        // SHOP_TYPE_ARMORY: "Too bad you don't have a[NL]supply convoy to send it to.[A]"
        // SHOP_TYPE_VENDOR: "If you had some storage,[NL]I could send it there...[A]"
        // SHOP_TYPE_SECRET_SHOP: "If you had some storage,[NL]I could send it to you.[.][A]"
    }

    return;
}

void ShopProc_AddItemToConvoy(struct BmShopProc* proc) {
    AddItemToConvoy(proc->shopItems[proc->curIndex]);
    HandleShopBuyAction(proc);
    return;
}

void ShopProc_SendToConvoyDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8C4, proc);
    // SHOP_TYPE_ARMORY: "Right. I'll send it now.[A]"
    // SHOP_TYPE_VENDOR: "Right. I'll have it sent.[.][A]"
    // SHOP_TYPE_SECRET_SHOP: "Heh heh... I'll send it then.[.][A]"

    return;
}

void ShopProc_CheckIfConvoyFull(struct BmShopProc* proc) {
    if (GetConvoyItemCount() < CONVOY_ITEM_COUNT) {
        Proc_Goto(proc, 10);
    }

    return;
}

void ShopProc_ConvoyFullDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8CD, proc);
    // SHOP_TYPE_ARMORY: "Your storage is full, too![NL]Rearrange your things![A]"
    // SHOP_TYPE_VENDOR: "Your storage is full,[.][NL]too. Try again later.[.][A]"
    // SHOP_TYPE_SECRET_SHOP: "Heh... Your storage is full,[NL]too. Rearrange things...[A]"

    return;
}

void ShopProc_AnythingElseDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8A6, proc);
    // SHOP_TYPE_ARMORY: "Anything else?"
    // SHOP_TYPE_VENDOR: "Anything else?"
    // SHOP_TYPE_SECRET_SHOP: "Any other requests?[.]"

    return;
}

void ShopProc_SellDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8A9, proc);
    // SHOP_TYPE_ARMORY: "What do you want to sell?[.]"
    // SHOP_TYPE_VENDOR: "What are you selling?[.]"
    // SHOP_TYPE_SECRET_SHOP: "What would you sell?"

    return;
}

void ShopProc_InitSellState(struct BmShopProc* proc) {
    sub_80B55AC(proc->curIndex, proc->unitItemCount, 5, 0, 72, sub_80B4418, proc);
    return;
}

void ShopProc_Loop_SellKeyHandler(struct BmShopProc* proc) {
    u8 unkA;
    u32 unkC;
    int a;
    int b;

    sub_80B5604();

    BG_SetPosition(2, 0, sub_80B5698());

    unkA = proc->curIndex;
    unkC = sub_80B568C() != unkA;

    proc->curIndex = sub_80B568C();
    proc->unk_5d = sub_80B56A8();

    a = proc->curIndex;
    a *= 16;

    b = ((proc->unk_5d * 16)) - 72;

    DisplayUiHand(56, a - b);

    if ((proc->helpTextActive != 0) && (unkC != 0)) {
        a = (proc->curIndex * 16);
        b = ((proc->unk_5d * 16) - 72);
        StartItemHelpBox(56, a - b, proc->unit->items[proc->curIndex]);
    }

    if (sub_80B56CC() != 0) {
        return;
    }

    if (proc->helpTextActive != 0) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->helpTextActive = 1;
        a = (proc->curIndex * 16);
        b = ((proc->unk_5d * 16) - 72);
        StartItemHelpBox(56, a - b, proc->unit->items[proc->curIndex]);

        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        if (!IsItemSellable(proc->unit->items[proc->curIndex])) {
            StartShopDialogue(0x8BB, proc);
            // SHOP_TYPE_ARMORY: "I can't buy that.[.][A]"
            // SHOP_TYPE_VENDOR: "I can't buy that.[.][A]"
            // SHOP_TYPE_SECRET_SHOP: "Hee hee... Wait a minute.[.][NL]I can't buy that![.][A]"

            Proc_Goto(proc, 4);
        } else {
            SetTalkNumber(GetItemSellPrice(proc->unit->items[proc->curIndex]));
            StartShopDialogue(0x8B5, proc);
            // SHOP_TYPE_ARMORY: "How does [.][G] gold[.][NL]sound to you?[.][Yes]"
            // SHOP_TYPE_VENDOR: "That's worth [.][G] gold.[NL]Is that all right?[Yes]"
            // SHOP_TYPE_SECRET_SHOP: "That is worth [G] gold.[NL]Is that acceptable?[.][Yes]"

            Proc_Break(proc);
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 8);

        return;
    }

    return;
}

void ShopProc_HandleSellConfirmPrompt(struct BmShopProc* proc) {
    if (GetTalkChoiceResult() == 1) {
        sub_8014B88(0xB9, 8);

        gActionData.unitActionType = UNIT_ACTION_SHOPPED;

        SetPartyGoldAmount(GetPartyGoldAmount() + GetItemSellPrice(proc->unit->items[proc->curIndex]));

        UnitRemoveItem(proc->unit, proc->curIndex);

        UpdateShopItemCounts(proc);
        sub_80B505C(proc);
        DisplayGoldBoxText(gBG0TilemapBuffer + 0xDB);

        if (proc->unitItemCount == 0) {
            Proc_Goto(proc, 7);
        }
    } else {
        Proc_Goto(proc, 4);
    }

    return;
}

void ShopProc_SellAnythingElseDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8AF, proc);
    // SHOP_TYPE_ARMORY: "Selling anything else?"
    // SHOP_TYPE_VENDOR: "Anything else to sell?"
    // SHOP_TYPE_SECRET_SHOP: "What else are you selling?"

    return;
}

void ShopProc_AnythingElseRestartDialogue(struct BmShopProc* proc) {
    proc->curIndex = 0;
    StartShopDialogue(0x89D, proc);
    // SHOP_TYPE_ARMORY: "Do you need anything else?[NL][BuySell]"
    // SHOP_TYPE_VENDOR: "Anything else for you?[NL][BuySell]"
    // SHOP_TYPE_SECRET_SHOP: "Well? Anything else for you?[NL][BuySell]"

    return;
}

void ShopProc_AnythingElseContinueDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x8A0, proc);
    // SHOP_TYPE_ARMORY: "Do you need anything else?[NL][ShopContinue]"
    // SHOP_TYPE_VENDOR: "Can I do anything else for you?[.][NL][ShopContinue]"
    // SHOP_TYPE_SECRET_SHOP: "Is there anything else you need?[NL][ShopContinue]"

    return;
}

void ShopProc_ExitShopDialogue(struct BmShopProc* proc) {

    if (proc->unit == 0) {
        StartShopDialogue(0x898, proc);
        // SHOP_TYPE_ARMORY: "Come back again.[A]"
        // SHOP_TYPE_VENDOR: "Hope to see you again![A]"
        // SHOP_TYPE_SECRET_SHOP: "[N/A]"
    } else {
        StartShopDialogue(0x8B8, proc);
        // SHOP_TYPE_ARMORY: "Come back again.[A]"
        // SHOP_TYPE_VENDOR: "Drop in again.[A]"
        // SHOP_TYPE_SECRET_SHOP: "Hee hee... Buh-bye![.][A]"
    }

    return;
}

void ShopProc_OnExit(void) {
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Show);

    return;
}

void ShopProc_EnterPrepScreenShopDialogue(struct BmShopProc* proc) {
    StartShopDialogue(0x896, proc);
    // SHOP_TYPE_ARMORY: "Welcome to the armory![A][NL2][NL]These are the weapons[.][NL]we have for sale.[.][A]"
    // SHOP_TYPE_VENDOR: "Welcome to the[NL]general store![A][NL2][NL]Here are all the items[NL]we have for sale.[.][A]"
    // SHOP_TYPE_SECRET_SHOP: "[N/A]"

    return;
}

void ShopProc_Loop_UnkKeyHandler(struct BmShopProc* proc) {
    u8 unkA;
    u32 unkC;
    int a;
    int b;

    sub_80B5604();

    BG_SetPosition(2, 0, sub_80B5698());

    unkA = proc->curIndex;
    unkC = sub_80B568C() != unkA;

    proc->curIndex = sub_80B568C();
    proc->unk_5d = sub_80B56A8();

    proc->unk_5e = proc->curIndex;
    proc->unk_5f = proc->unk_5d;

    a = proc->curIndex;
    a *= 16;

    b = ((proc->unk_5d * 16)) - 72;

    DisplayUiHand(56, a - b);

    if ((proc->helpTextActive != 0) && (unkC != 0)) {
        a = (proc->curIndex * 16);
        b = ((proc->unk_5d * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->curIndex]);
    }

    DisplayShopUiArrows();

    if (sub_80B56CC() != 0) {
        return;
    }

    if (proc->helpTextActive != 0) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->helpTextActive = 1;
        a = (proc->curIndex * 16);
        b = ((proc->unk_5d * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->curIndex]);

        return;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 12);

        return;
    }

    return;
}

void StartShopFadeIn(struct BmShopProc* proc) {

    if (gBmSt.gameStateBits & 0x10) {
        return;
    }

    if (gGMData.state & GMAP_STATE_BIT0) {
        return;
    }

    Proc_StartBlocking(gProcScr_ShopFadeIn, proc);

    return;
}

void StartShopFadeOut(struct BmShopProc* proc) {

    if ((!(gBmSt.gameStateBits & 0x10)) && (!(gGMData.state & GMAP_STATE_BIT0))) {
        Proc_StartBlocking(gProcScr_ShopFadeOut, proc);
        return;
    }

    ResetDialogueScreen();

    return;
}

void ShopProc_Init(struct BmShopProc* proc) {
    int i;

    if (proc->shopType == 0) {
        Sound_PlaySong80024D4(0x36, 0);
    } else {
        Sound_PlaySong80024D4(0x35, 0);
    }

    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Hide);

    sub_80B52CC();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitTalk(0x200, 2, 0);

    ResetFaces();

    proc->curIndex = 0;
    proc->unk_5e = 0;
    proc->unk_5f = 0;
    proc->unk_5d = 0;
    proc->unk_60 = 0;
    proc->helpTextActive = 0;

    UnpackUiVArrowGfx(0x240, 3);

    StartTalkFace(ShopProc_GetPortraitIndex(proc), 32, 8, 3, 1);

    CopyDataWithPossibleUncomp(gUnknown_089AD934, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    DrawUiFrame2(6, 8, 20, 12, 0);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    StartUiGoldBox(proc);

    for (i = 0; i <= 5; i++) {
        Text_Init(&gShopItemTexts[i], 20);
    }

    sub_80B4F90(proc);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win0_left = 56;
    gLCDControlBuffer.win0_top = 72;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 152;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 8;
    gLCDControlBuffer.win1_right = 240;
    gLCDControlBuffer.win1_bottom = 56;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetSpecialColorEffectsParameters(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    CopyToPaletteBuffer(gUnknown_08B1754C, 0x1C0, 0x20);

    CopyDataWithPossibleUncomp(Img_CommGameBgScreen, (void *)(GetBackgroundTileDataOffset(3) + 0x6000000));

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A295D4, 0xE000);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

void StartUiGoldBox(ProcPtr parent) {
    struct BmShopProc* proc;

    CopyDataWithPossibleUncomp(gUnknown_089AD9F8, (void *)0x06014C00);

    proc = Proc_Start(gProcScr_GoldBox, parent);
    proc->unk_64 = 0xAC;
    proc->unk_66 = 0x2D;
    proc->unk_68 = 0x4260;

    CopyToPaletteBuffer(gUiFramePaletteA, 0x280, 0x20);

    InitGoldBoxText(gBG0TilemapBuffer + 0xDC);

    DisplayGoldBoxText(gBG0TilemapBuffer + 0xDB);

    return;
}

void InitGoldBoxText(u16* tm) {
    SetFont(0);
    Font_LoadForUI();

    Text_Init(&gText_GoldBox, 1);

    sub_8004B0C(tm, 3, 30);

    return;
}

void sub_80B4EB4(u16* tm, int num) {

    while (num > 0) {
        *tm = 0;
        *(tm + 0x20) = 0;

        tm--;
        num--;
    }

    return;
}

void DisplayGoldBoxText(u16* tm) {
    SetFont(0);
    Font_LoadForUI();

    sub_80B4EB4(tm, 6);
    sub_8004B88(tm, 2, GetPartyGoldAmount());

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

void sub_80B4F04(struct BmShopProc* parent) {
    struct BmShop2Proc* proc;
    int i;

    parent->unk_60 = 0;

    proc = Proc_Start(gProcScr_08A39478, PROC_TREE_3);
    proc->unk_54 = parent;

    SetFont(0);
    Font_LoadForUI();

    for (i = parent->unk_5f; i < parent->unk_5f + 5; i++) {
        Text_DrawBlank(&gShopItemTexts[DivRem(i, 6)], gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));
    }

    BG_SetPosition(2, 0, (((parent->unk_5f) << 0x14) + 0xFFB80000) >> 0x10);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B4F90(struct BmShopProc* proc) {
    int item;
    int index;
    int i;

    SetFont(0);
    Font_LoadForUI();

    for (i = proc->unk_5f; i < proc->unk_5f + 5; i++) {
        index = DivRem(i, 6);
        Text_Clear(&gShopItemTexts[index]);
    }

    for (i = proc->unk_5f; i < proc->unk_5f + 5; i++) {
        index = DivRem(i,6);
        item = proc->shopItems[i];

        if (item == 0) {
            break;
        }

        sub_80B5164(&gShopItemTexts[index], item, proc->unit, gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));
    }

    BG_SetPosition(2, 0, ((proc->unk_5f << 0x14) + 0xFFB80000) >> 0x10);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B5040(struct BmShop2Proc* proc) {
    ShopProc_InitBuyState(proc->unk_54);
    sub_80B4F90(proc->unk_54);

    Proc_Break(proc);

    return;
}

void sub_80B505C(struct BmShopProc* parent) {
    struct BmShop2Proc* proc;
    int i;

    parent->unk_60 = 1;

    proc = Proc_Start(gProcScr_08A39488, PROC_TREE_3);
    proc->unk_54 = parent;

    SetFont(0);
    Font_LoadForUI();

    for (i = 0; i < 5; i++) {
        Text_DrawBlank(&gShopItemTexts[DivRem(i, 6)], gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));
    }

    BG_SetPosition(2, 0, 0x0000FFB8);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B50C8(struct BmShopProc* proc) {
    int i;
    int index;

    SetFont(0);
    Font_LoadForUI();

    for (i = 0; i < 5; i++) {
        index = DivRem(i, 6);
        Text_Clear(&gShopItemTexts[index]);
    }

    for (i = 0; i < 5; i++) {
        int item;

        index = DivRem(i, 6);
        item = proc->unit->items[i];

        if (item == 0) {
            break;
        }

        DrawShopItemLine(&gShopItemTexts[index], item, proc->unit, gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void sub_80B5148(struct BmShop2Proc* proc) {
    ShopProc_InitSellState(proc->unk_54);
    sub_80B50C8(proc->unk_54);

    Proc_Break(proc);

    return;
}

void sub_80B5164(struct TextHandle* th, int item, struct Unit* unit, u16* dst) {
    u8 visible;

    int price = GetItemPurchasePrice(unit, item);

    if (unit == 0) {
        visible = 1;
    } else {
        visible = IsItemDisplayUsable(unit, item);
    }

    DrawItemMenuLine(th, item, visible, dst);

    sub_8004B88(
        dst + 0x11,
        (int)GetPartyGoldAmount() >= price
            ? 2
            : 1,
        price
    );

    return;
}

void DrawShopItemLine(struct TextHandle* th, int item, struct Unit* unit, u16* dst) {

    DrawItemMenuLine(th, item, IsItemDisplayUsable(unit, item), dst);

    if (IsItemSellable(item) != 0) {
        sub_8004B88(dst + 0x11, 2, GetItemSellPrice(item));
    } else {
        Text_InsertString(th, 0x5C, 2, GetStringFromIndex(0x537));
    }

    return;
}

u16 GetItemPurchasePrice(struct Unit* unit, int item) {
    int cost = GetItemCost(item);

    if (gBmSt.gameStateBits & 0x10) {
        cost = cost + (cost / 2);
    }

    if (UnitHasItem(unit, ITEM_SILVERCARD)) {
        return (cost / 2);
    } else {
        return cost;
    }
}

u16 GetItemSellPrice(int item) {
    return GetItemCost(item) / 2;
}

s8 IsItemSellable(int item) {
    if (GetItemAttributes(item) & IA_UNSELLABLE) {
        return 0;
    }

    if (GetItemSellPrice(item) == 0) {
        return 0;
    }

    return 1;
}

void GoldBox_OnLoop(struct BmShopProc* proc) {
    CallARM_PushToSecondaryOAM(proc->unk_64, proc->unk_66, gSprite_08A39498, proc->unk_68);
    return;
}

void sub_80B52CC(void) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(0xF);

    Font_InitForUIDefault();
    LoadUiFrameGraphics();

    ResetIconGraphics_();

    LoadIconPalettes(4);

    LoadDialogueBoxGfx(0, -1);

    return;
}

void sub_80B5378(void) {
    DisplayShopUiArrows();
    return;
}

void DisplayShopUiArrows(void) {
    if (ShouldDisplayUpArrow() != 0) {
        DisplayUiVArrow(120, 64, 0x3240, 1);
    }

    if (ShouldDisplayDownArrow() != 0) {
        DisplayUiVArrow(120, 152, 0x3240, 0);
    }

    return;
}

void UnpackUiVArrowGfx(int index, int palIdx) {
    CopyDataWithPossibleUncomp(gUnknown_08A1C704, (void *)((0x3FF & index) * 0x20 + 0x06010000));
    CopyToPaletteBuffer(gUnknown_08A1A084, (palIdx + 0x10) * 0x20, 0x20);

    return;
}

void DisplayUiVArrow(int x, int y, u16 oam2Base, int d) {
    int vflip;

    int offset = Div(DivRem(GetGameClock(), 40), 8) * 2;

    vflip = 0;
    if (d == 0) {
        vflip = 0x2000;
    }

    PutSpriteExt(
        2,
        x | vflip,
        y,
        gObject_16x8,
        (oam2Base) + offset
    );

    return;
}

void HandleShopBuyAction(struct BmShopProc* proc) {
    sub_8014B88(0xB9, 8);

    gActionData.unitActionType = UNIT_ACTION_SHOPPED;

    SetPartyGoldAmount(GetPartyGoldAmount() - GetItemPurchasePrice(proc->unit, proc->shopItems[proc->curIndex]));

    UpdateShopItemCounts(proc);
    sub_80B4F90(proc);

    DisplayGoldBoxText(gBG0TilemapBuffer + 0xDB);

    return;
}

int sub_80B5498(int pos, int lastIdx, s8 unk) {
    int previous;

    if (pos < 0) {
        pos = 0;
    }

    if (pos >= lastIdx) {
        pos = lastIdx - 1;
    }

    previous = pos;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (pos == 0) {
            if ((unk != 0) && (gKeyStatusPtr->newKeys & DPAD_UP)) {
                pos = lastIdx - 1;
            }
        } else {
            pos--;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (pos == (lastIdx - 1)) {
            if ((unk != 0) && (gKeyStatusPtr->newKeys & DPAD_DOWN)) {
                pos = 0;
            }
        } else {
            pos++;
        }
    }

    if (previous != pos) {
        PlaySoundEffect(0x66);
    }

    return pos;
}

void sub_80B5528(int unk) {
    gUnknown_0203EFB4 = unk;
    return;
}

int sub_80B5534(int a, int b, int c, int d) {
    int var = gUnknown_0203EFB4;

    gUnknown_0203EFB4 = a;

    if (a == var) {
        return 0;
    }

    if (c > b) {
        return 0;
    }

    if (a < var) {
        if ((d != 0) && ((a - d) < 1)) {
            return -1;
        }
    } else if (((c + d) != b) && ((a - d) >= (c - 1))) {
        return 1;
    }

    return 0;
}

#if NONMATCHING

int sub_80B557C(int a, int b, int c) {

    if (a - b >= 0) {
        if (a - b < c) {
            return b;
        }

    } else {
        if (b - a < c) {
            return b;
        }
    }

    if (b - a <= 0) {
        return b - a >= 0
            ? a
            : a - c;
    } else {
        b = a + c;
    }

    return b;
}

#else // if !NONMATCHING

__attribute__((naked))
int sub_80B557C(int a, int b, int c) {

    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        subs r3, r0, r1\n\
        cmp r3, #0\n\
        blt _080B558C\n\
        cmp r3, r2\n\
        blt _080B5592\n\
        subs r3, r1, r0\n\
        b _080B5596\n\
    _080B558C:\n\
        subs r3, r1, r0\n\
        cmp r3, r2\n\
        bge _080B5596\n\
    _080B5592:\n\
        adds r0, r1, #0\n\
        b _080B55A8\n\
    _080B5596:\n\
        cmp r3, #0\n\
        bgt _080B55A4\n\
        adds r1, r0, #0\n\
        cmp r3, #0\n\
        bge _080B55A6\n\
        subs r1, r0, r2\n\
        b _080B55A6\n\
    _080B55A4:\n\
        adds r1, r0, r2\n\
    _080B55A6:\n\
        adds r0, r1, #0\n\
    _080B55A8:\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");

}

#endif

void sub_80B55AC(u16 a, u16 b, u16 c, u16 d, int e, ShopFunc func, struct BmShopProc* proc) {

    sub_80B5528(a);

    gShopState->unk_00 = a;
    gShopState->unk_02 = b;
    gShopState->unk_04 = c;
    gShopState->unk_06 = d;
    gShopState->unk_08 = 16;
    gShopState->unk_0A = 4;

    gShopState->unk_14 = func;
    gShopState->unk_18 = proc;

    gShopState->unk_10 = -e;

    gShopState->unk_0C = d * 16;

    return;
}

void sub_80B5604(void) {

    gShopState->unk_00 = sub_80B5498(gShopState->unk_00, gShopState->unk_02, 0);

    switch (sub_80B5534(gShopState->unk_00, gShopState->unk_02, gShopState->unk_04, gShopState->unk_06)) {
        case 0:
            break;

        case +1:
            gShopState->unk_06++;

            gShopState->unk_14(gShopState->unk_18, gShopState->unk_06 + gShopState->unk_04 - 1);

            break;

        case -1:
            gShopState->unk_06--;

            gShopState->unk_14(gShopState->unk_18, gShopState->unk_06);

            break;
    }

    gShopState->unk_0C = sub_80B557C(gShopState->unk_0C, gShopState->unk_06 * gShopState->unk_08, gShopState->unk_0A);

    return;
}

u16 sub_80B568C(void) {
    return gShopState->unk_00;
}

int sub_80B5698(void) {
    return gShopState->unk_10 + gShopState->unk_0C;
}

u16 sub_80B56A8(void) {
    return gShopState->unk_06;
}

void sub_80B56B4(int unk) {
    gShopState->unk_08 = unk;
    return;
}

void sub_80B56C0(int unk) {
    gShopState->unk_0A = unk;
    return;
}

s8 sub_80B56CC(void) {
    if (gShopState->unk_0C != (gShopState->unk_06 * gShopState->unk_08)) {
        return 1;
    }

    return 0;
}

s8 ShouldDisplayUpArrow(void) {
    if (gShopState->unk_06 != 0) {
        return 1;
    }

    return 0;
}

s8 ShouldDisplayDownArrow(void) {
    if (gShopState->unk_06 + gShopState->unk_04 < gShopState->unk_02) {
        return 1;
    }

    return 0;
}
