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
#include "bmmind.h"
#include "scene.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "bmlib.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "gba_sprites.h"
#include "constants/faces.h"
#include "constants/items.h"

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
    PROC_CALL(LockGame),
    PROC_SLEEP(1),

    PROC_CALL_ARG(_FadeBgmOut, -1),
    PROC_CALL(StartMidFadeToBlack),

    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_ShopFadeOut[] = {
    PROC_CALL(ResetDialogueScreen),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),

    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_Shop[] = {
    PROC_CALL(StartShopFadeIn),
    PROC_SLEEP(0),
    PROC_CALL(LockGame),
    PROC_CALL(Shop_Init),
    PROC_CALL(Shop_InitBuyState),
    PROC_START_CHILD(ProcScr_ShopDrawHand),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(1),
    PROC_CALL(Shop_EntryDialogue),

PROC_LABEL(PL_SHOP_ENTRY),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_HandleEntryDialoguePrompt),
    // fallthrough

PROC_LABEL(PL_SHOP_BUY),
    PROC_CALL(Shop_BuyDialogue),
    // fallthrough

PROC_LABEL(PL_SHOP_BUY_MAIN),
    PROC_CALL(Shop_InitBuyState),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_Loop_BuyKeyHandler),
    PROC_CALL(Shop_HandleBuyConfirmPrompt),
    PROC_GOTO(PL_SHOP_SENDTO_INVENTORY),

PROC_LABEL(PL_SHOP_BUY_DONE),
    PROC_CALL(Shop_AnythingElseDialogue),
    PROC_GOTO(PL_SHOP_BUY_MAIN),

PROC_LABEL(PL_SHOP_SELL),
    PROC_CALL(Shop_SellDialogue),

    // fallthrough

PROC_LABEL(PL_SHOP_SELL_MAIN),
    PROC_CALL(Shop_InitSellState),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_Loop_SellKeyHandler),
    PROC_CALL(Shop_HandleSellConfirmPrompt),
    PROC_SLEEP(2),
    PROC_CALL(Shop_SellAnythingElseDialogue),
    PROC_GOTO(PL_SHOP_SELL_MAIN),

PROC_LABEL(PL_SHOP_SELL_NOITEM),
    PROC_SLEEP(2),
    PROC_CALL(Shop_AnythingElseRestartDialogue),
    PROC_GOTO(PL_SHOP_ENTRY),

PROC_LABEL(PL_SHOP_ANYTHING_ELSE),
    PROC_SLEEP(1),
    PROC_CALL(Shop_AnythingElseContinueDialogue),
    PROC_GOTO(PL_SHOP_ENTRY),

PROC_LABEL(PL_SHOP_SENDTO_INVENTORY),
    PROC_CALL(Shop_TryAddItemToInventory),
    PROC_SLEEP(0),
    PROC_CALL(Shop_HandleSendToConvoyPrompt),
    PROC_SLEEP(0),
    PROC_CALL(Shop_CheckIfConvoyFull),
    PROC_CALL(Shop_ConvoyFullDialogue),
    PROC_SLEEP(0),
    PROC_GOTO(PL_SHOP_SELL_NOITEM),

PROC_LABEL(PL_SHOP_SENDTO_INVENTORY_EXT),
    PROC_CALL(Shop_AddItemToConvoy),
    PROC_SLEEP(0),
    PROC_CALL(Shop_SendToConvoyDialogue),
    PROC_SLEEP(0),
    PROC_GOTO(PL_SHOP_BUY_DONE),

PROC_LABEL(PL_SHOP_BUY_FULL_NO_INEVNTORY),
    PROC_SLEEP(0),
    PROC_CALL(Shop_NoSendToConvoyDialogue),
    PROC_SLEEP(0),
    PROC_GOTO(PL_SHOP_SELL_NOITEM),

PROC_LABEL(PL_SHOP_PREP_ENTRY),
    PROC_CALL(Shop_PrepEntryDialogue),
    PROC_SLEEP(0),

    PROC_REPEAT(Shop_Loop_UnkKeyHandler),

    // fallthrough

PROC_LABEL(PL_SHOP_EXIT),
    PROC_CALL(Shop_ExitShopDialogue),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(sub_8013F40),
    PROC_SLEEP(1),
    PROC_CALL(Shop_OnExit),
    PROC_END_EACH(ProcScr_ShopDrawHand),
    PROC_CALL(StartShopFadeOut),
    PROC_SLEEP(0),
    PROC_CALL(UnlockGame),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ShopBuyInit[] = {
    PROC_REPEAT(InitShopBuyStatus),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ShopSellInit[] = {
    PROC_REPEAT(InitShopSellStatus),
    PROC_END,
};

u16 CONST_DATA Sprite_ShopGoldBox[] = {
    6,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_LAYER(1),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0x6) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0xC) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xE) + OAM2_LAYER(1),
};

struct ProcCmd CONST_DATA gProcScr_GoldBox[] = {
    PROC_REPEAT(GoldBox_OnLoop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ShopDrawHand[] = {
    PROC_REPEAT(_DisplayShopUiArrows),
};

EWRAM_DATA struct Text gShopItemTexts[SHOP_TEXT_LINES + 1] = {0};
EWRAM_DATA struct ShopState sShopState = {0};
struct ShopState * CONST_DATA gShopState = &sShopState;
struct Text gText_GoldBox;

int Shop_GetPortraitIndex(struct ProcShop * proc)
{
    return gShopPortraitLut[proc->shopType];
}

void StartShopDialogue(int baseMsgId, struct ProcShop * proc)
{
    int msgId = baseMsgId + gShopDialogueOffsetLut[proc->shopType];

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, GetStringFromIndex(msgId), proc);

    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(1);
}

void StartDefaultArmoryScreen(struct Unit * unit, ProcPtr proc)
{
    StartShopScreen(unit, NULL, SHOP_TYPE_ARMORY, proc);
}

void StartArmoryScreenOrphaned(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, NULL);
}

void StartArmoryScreen(struct Unit * unit, u16 * shopItems, ProcPtr parent)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, parent);
}

void StartVendorScreenOrphaned(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_VENDOR, NULL);
}

void StartVendorScreen(struct Unit * unit, u16 * shopItems, ProcPtr parent)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_VENDOR, parent);
}

void StartSecretShopScreenOrphaned(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_SECRET_SHOP, NULL);
}

void StartSecretShopScreen(struct Unit * unit, u16 * shopItems, ProcPtr parent)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_SECRET_SHOP, parent);
}

// duplicate??
void StartArmoryScreen2(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, NULL);
}

void StartShopScreen(struct Unit * unit, const u16 * inventory, u8 shopType, ProcPtr parent)
{
    struct ProcShop * proc;
    const u16 * shopItems;
    int i;

    EndPlayerPhaseSideWindows();

    if (parent)
        proc = Proc_StartBlocking(gProcScr_Shop, parent);
    else
        proc = Proc_Start(gProcScr_Shop, PROC_TREE_3);

    proc->shopType = shopType;
    proc->unit = unit;

    shopItems = gDefaultShopInventory;
    if (inventory != 0)
        shopItems = inventory;

    for (i = 0; i <= SHOP_ITEMS_MAX_AMT; i++)
        proc->shopItems[i] = MakeNewItem(*shopItems++);

    UpdateShopItemCounts(proc);
}

void UpdateShopItemCounts(struct ProcShop * proc)
{
    int i;
    for (i = 0; proc->shopItems[i] != 0; i++);

    proc->shopItemCount = i;
    proc->unitItemCount = GetUnitItemCount(proc->unit);
}

void TalkChoice_OnBuy(void)
{
    struct ProcShop * proc = Proc_Find(gProcScr_Shop);
    if (proc->buy_or_sel != SHOP_ST_BUY)
        ShopInitTexts_OnBuy(proc);
}

void TalkChoice_OnSell(void)
{
    struct ProcShop * proc = Proc_Find(gProcScr_Shop);
    if (proc->buy_or_sel != SHOP_ST_SELL)
        ShopInitTexts_OnSell(proc);
}

void Shop_null_80B4328(void)
{}

void Shop_EntryDialogue(struct ProcShop * proc)
{

    if (!proc->unit)
    {
        Proc_Goto(proc, PL_SHOP_PREP_ENTRY);
    }
    else
    {
        StartShopDialogue(0x89A, proc);
        // SHOP_TYPE_ARMORY: "Welcome to the armory.[A][NL2][NL]I deal in all sorts of goods.[.][NL][BuySell]"
        // SHOP_TYPE_VENDOR: "Welcome to the general store.[.][A][NL2][NL]How can I help you?[.][NL][BuySell]"
        // SHOP_TYPE_SECRET_SHOP: "Shhh... Hee hee...[A][NL2][NL]This is a secret shop![NL][BuySell]"
    }
}

void Shop_HandleEntryDialoguePrompt(struct ProcShop * proc)
{
    switch (GetTalkChoiceResult()) {
    case TALK_CHOICE_CANCEL:
    default:
        Proc_Goto(proc, PL_SHOP_EXIT);
        return;

    case TALK_CHOICE_YES:
        Proc_Goto(proc, PL_SHOP_BUY);
        return;

    case TALK_CHOICE_NO:
        if (GetUnitItemCount(proc->unit) == 0)
        {
            StartShopDialogue(0x8AC, proc);
            // SHOP_TYPE_ARMORY: "You've got nothing to sell![.][A]"
            // SHOP_TYPE_VENDOR: "You have nothing to sell.[.][A]"
            // SHOP_TYPE_SECRET_SHOP: "You've got nothing to sell![.][A]"

            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        }
        else
        {
            Proc_Goto(proc, PL_SHOP_SELL);
        }
    }
}

void Shop_BuyDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8A3, proc);
    // SHOP_TYPE_ARMORY: "What would you like?"
    // SHOP_TYPE_VENDOR: "What can I get for you?[.]"
    // SHOP_TYPE_SECRET_SHOP: "What do you need?[.]"
}

void ShopDrawBuyItemLine(struct ProcShop * proc, int itemIndex)
{
    u16 item;
    int index = DivRem(itemIndex, 6);

    SetTextFont(0);
    InitSystemTextFont();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item != 0)
        DrawShopItemPriceLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, (itemIndex * 2 & 0x1F))
        );
}

void ShopDrawSellItemLine(struct ProcShop * proc, int itemIndex)
{
    u16 item;

    int index = DivRem(itemIndex, 6);

    SetTextFont(0);
    InitSystemTextFont();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item != 0)
        DrawShopItemLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, (itemIndex * 2 & 0x1F))
        );
}

void Shop_InitBuyState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_idx,
        proc->shopItemCount,
        5,
        proc->hand_idx,
        72,
        ShopDrawBuyItemLine,
        proc);
}

void Shop_Loop_BuyKeyHandler(struct ProcShop * proc)
{
    u8 head_loc;
    u32 cursor_at_head;
    int price;
    int a;
    int b;

    Shop_TryMoveHandPage();

    BG_SetPosition(2, 0, ShopSt_GetBg2Offset());

    head_loc = proc->head_loc;
    cursor_at_head = ShopSt_GetHeadLoc() != head_loc;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    proc->head_idx = proc->head_loc;
    proc->hand_idx = proc->hand_loc;

    a = proc->head_loc;
    a *= 16;

    b = ((proc->hand_loc * 16)) - 72;

    DisplayUiHand(56, a - b);

    if ((proc->helpTextActive != 0) && (cursor_at_head != 0))
    {
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
    }

    DisplayShopUiArrows();

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive != 0)
    {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = 1;
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
        return;
    }

    price = GetItemPurchasePrice(proc->unit, proc->shopItems[proc->head_loc]);

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (price > (int)GetPartyGoldAmount())
        {
            StartShopDialogue(0x8B2, proc);
            // SHOP_TYPE_ARMORY: "You don't have the money![.][A]"
            // SHOP_TYPE_VENDOR: "You're short of funds.[A]"
            // SHOP_TYPE_SECRET_SHOP: "Heh! Not enough money![A]"

            Proc_Goto(proc, 1);
        }
        else
        {
            SetTalkNumber(price);
            StartShopDialogue(0x8B5, proc);
            // SHOP_TYPE_ARMORY: "How does [.][G] gold[.][NL]sound to you?[.][Yes]"
            // SHOP_TYPE_VENDOR: "That's worth [.][G] gold.[NL]Is that all right?[Yes]"
            // SHOP_TYPE_SECRET_SHOP: "That is worth [G] gold.[NL]Is that acceptable?[.][Yes]"

            Proc_Break(proc);
        }
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        return;
    }
}

void Shop_HandleBuyConfirmPrompt(struct ProcShop * proc)
{
    if (GetTalkChoiceResult() != TALK_CHOICE_YES)
        Proc_Goto(proc, PL_SHOP_BUY);
}

void Shop_TryAddItemToInventory(struct ProcShop * proc)
{
    if (proc->unitItemCount >= UNIT_ITEM_COUNT)
    {
        if (HasConvoyAccess())
        {
            StartShopDialogue(0x8BE, proc);
            // SHOP_TYPE_ARMORY: "Looks like you're full.[.][A][NL2][NL]Send it to storage?[.][NL][Yes]"
            // SHOP_TYPE_VENDOR: "Your hands are full.[A][NL2][NL]Send it to storage?[.][NL][Yes]"
            // SHOP_TYPE_SECRET_SHOP: "Your hands are full.[A][NL2][NL]Send it to storage?[.][NL][Yes]"
        }
        else
        {
            StartShopDialogue(0x8C1, proc);
            // SHOP_TYPE_ARMORY: "Looks like you're full.[.][A]"
            // SHOP_TYPE_VENDOR: "Your hands are full.[A]"
            // SHOP_TYPE_SECRET_SHOP: "Your hands are full.[A]"

            Proc_Goto(proc, PL_SHOP_BUY_FULL_NO_INEVNTORY);
        }
        return;
    }

    UnitAddItem(proc->unit, proc->shopItems[proc->head_loc]);
    HandleShopBuyAction(proc);

    Proc_Goto(proc, PL_SHOP_BUY_DONE);
}

void Shop_HandleSendToConvoyPrompt(struct ProcShop * proc)
{
    if (GetTalkChoiceResult() != TALK_CHOICE_YES)
        Proc_Goto(proc, PL_SHOP_BUY_FULL_NO_INEVNTORY);
}

void Shop_NoSendToConvoyDialogue(struct ProcShop * proc)
{
    if (HasConvoyAccess())
    {
        StartShopDialogue(0x8C7, proc);
        // SHOP_TYPE_ARMORY: "No? Too bad. You could[NL]take it if you made room.[.][A]"
        // SHOP_TYPE_VENDOR: "That's a shame. You could[.][NL]carry it if you made room.[A]"
        // SHOP_TYPE_SECRET_SHOP: "Ah, well... You could take[NL]it if you made room.[A]"
    }
    else
    {
        StartShopDialogue(0x8CA, proc);
        // SHOP_TYPE_ARMORY: "Too bad you don't have a[NL]supply convoy to send it to.[A]"
        // SHOP_TYPE_VENDOR: "If you had some storage,[NL]I could send it there...[A]"
        // SHOP_TYPE_SECRET_SHOP: "If you had some storage,[NL]I could send it to you.[.][A]"
    }
}

void Shop_AddItemToConvoy(struct ProcShop * proc)
{
    AddItemToConvoy(proc->shopItems[proc->head_loc]);
    HandleShopBuyAction(proc);
}

void Shop_SendToConvoyDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8C4, proc);
    // SHOP_TYPE_ARMORY: "Right. I'll send it now.[A]"
    // SHOP_TYPE_VENDOR: "Right. I'll have it sent.[.][A]"
    // SHOP_TYPE_SECRET_SHOP: "Heh heh... I'll send it then.[.][A]"
}

void Shop_CheckIfConvoyFull(struct ProcShop * proc)
{
    if (GetConvoyItemCount() < CONVOY_ITEM_COUNT)
        Proc_Goto(proc, PL_SHOP_SENDTO_INVENTORY_EXT);
}

void Shop_ConvoyFullDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8CD, proc);
    // SHOP_TYPE_ARMORY: "Your storage is full, too![NL]Rearrange your things![A]"
    // SHOP_TYPE_VENDOR: "Your storage is full,[.][NL]too. Try again later.[.][A]"
    // SHOP_TYPE_SECRET_SHOP: "Heh... Your storage is full,[NL]too. Rearrange things...[A]"
}

void Shop_AnythingElseDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8A6, proc);
    // SHOP_TYPE_ARMORY: "Anything else?"
    // SHOP_TYPE_VENDOR: "Anything else?"
    // SHOP_TYPE_SECRET_SHOP: "Any other requests?[.]"
}

void Shop_SellDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8A9, proc);
    // SHOP_TYPE_ARMORY: "What do you want to sell?[.]"
    // SHOP_TYPE_VENDOR: "What are you selling?[.]"
    // SHOP_TYPE_SECRET_SHOP: "What would you sell?"
}

void Shop_InitSellState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_loc,
        proc->unitItemCount,
        5,
        0,
        72,
        ShopDrawSellItemLine,
        proc);
}

void Shop_Loop_SellKeyHandler(struct ProcShop * proc)
{
    u8 cur;
    u32 cursor_at_head;
    int a;
    int b;

    Shop_TryMoveHandPage();

    BG_SetPosition(BG_2, 0, ShopSt_GetBg2Offset());

    cur = proc->head_loc;
    cursor_at_head = ShopSt_GetHeadLoc() != cur;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    a = proc->head_loc;
    a *= 16;
    b = ((proc->hand_loc * 16)) - 0x48;

    DisplayUiHand(56, a - b);

    if (proc->helpTextActive && (cursor_at_head != 0))
    {
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 0x48);
        StartItemHelpBox(56, a - b, proc->unit->items[proc->head_loc]);
    }

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive)
    {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = false;
            CloseHelpBox();
        }
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = true;
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 72);
        StartItemHelpBox(56, a - b, proc->unit->items[proc->head_loc]);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (!IsItemSellable(proc->unit->items[proc->head_loc]))
        {
            StartShopDialogue(0x8BB, proc);
            // SHOP_TYPE_ARMORY: "I can't buy that.[.][A]"
            // SHOP_TYPE_VENDOR: "I can't buy that.[.][A]"
            // SHOP_TYPE_SECRET_SHOP: "Hee hee... Wait a minute.[.][NL]I can't buy that![.][A]"

            Proc_Goto(proc, PL_SHOP_SELL);
        }
        else
        {
            SetTalkNumber(GetItemSellPrice(proc->unit->items[proc->head_loc]));
            StartShopDialogue(0x8B5, proc);
            // SHOP_TYPE_ARMORY: "How does [.][G] gold[.][NL]sound to you?[.][Yes]"
            // SHOP_TYPE_VENDOR: "That's worth [.][G] gold.[NL]Is that all right?[Yes]"
            // SHOP_TYPE_SECRET_SHOP: "That is worth [G] gold.[NL]Is that acceptable?[.][Yes]"

            Proc_Break(proc);
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, PL_SHOP_ANYTHING_ELSE);
        return;
    }
}

void Shop_HandleSellConfirmPrompt(struct ProcShop * proc)
{
    if (GetTalkChoiceResult() == TALK_CHOICE_YES)
    {
        PlaySeDelayed(0xB9, 8);

        gActionData.unitActionType = UNIT_ACTION_SHOPPED;

        SetPartyGoldAmount(GetPartyGoldAmount() + GetItemSellPrice(proc->unit->items[proc->head_loc]));

        UnitRemoveItem(proc->unit, proc->head_loc);

        UpdateShopItemCounts(proc);
        ShopInitTexts_OnSell(proc);
        DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 6));

        if (proc->unitItemCount == 0)
            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
    }
    else
        Proc_Goto(proc, PL_SHOP_SELL);
}

void Shop_SellAnythingElseDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8AF, proc);
    // SHOP_TYPE_ARMORY: "Selling anything else?"
    // SHOP_TYPE_VENDOR: "Anything else to sell?"
    // SHOP_TYPE_SECRET_SHOP: "What else are you selling?"
}

void Shop_AnythingElseRestartDialogue(struct ProcShop * proc)
{
    proc->head_loc = 0;
    StartShopDialogue(0x89D, proc);
    // SHOP_TYPE_ARMORY: "Do you need anything else?[NL][BuySell]"
    // SHOP_TYPE_VENDOR: "Anything else for you?[NL][BuySell]"
    // SHOP_TYPE_SECRET_SHOP: "Well? Anything else for you?[NL][BuySell]"
}

void Shop_AnythingElseContinueDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x8A0, proc);
    // SHOP_TYPE_ARMORY: "Do you need anything else?[NL][ShopContinue]"
    // SHOP_TYPE_VENDOR: "Can I do anything else for you?[.][NL][ShopContinue]"
    // SHOP_TYPE_SECRET_SHOP: "Is there anything else you need?[NL][ShopContinue]"
}

void Shop_ExitShopDialogue(struct ProcShop * proc)
{

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
}

void Shop_OnExit(void)
{
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(ProcScr_Mu, (ProcFunc) ShowMu);
}

void Shop_PrepEntryDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x896, proc);
    // SHOP_TYPE_ARMORY: "Welcome to the armory![A][NL2][NL]These are the weapons[.][NL]we have for sale.[.][A]"
    // SHOP_TYPE_VENDOR: "Welcome to the[NL]general store![A][NL2][NL]Here are all the items[NL]we have for sale.[.][A]"
    // SHOP_TYPE_SECRET_SHOP: "[N/A]"
}

void Shop_Loop_UnkKeyHandler(struct ProcShop * proc)
{
    u8 head_loc;
    u32 cursor_at_head;
    int a;
    int b;

    Shop_TryMoveHandPage();

    BG_SetPosition(BG_2, 0, ShopSt_GetBg2Offset());

    head_loc = proc->head_loc;
    cursor_at_head = ShopSt_GetHeadLoc() != head_loc;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    proc->head_idx = proc->head_loc;
    proc->hand_idx = proc->hand_loc;

    a = proc->head_loc;
    a *= 16;

    b = ((proc->hand_loc * 16)) - 0x48;

    DisplayUiHand(56, a - b);

    if ((proc->helpTextActive) && (cursor_at_head != 0))
    {
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 0x48);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
    }

    DisplayShopUiArrows();

    if (IsShopPageScrolling())
        return;

    if (proc->helpTextActive)
    {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = TRUE;
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 0x48);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
        return;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
    {
        PlaySoundEffect(0x6B);
        Proc_Goto(proc, 12);
        return;
    }
}

void StartShopFadeIn(struct ProcShop * proc)
{
    if (!(gBmSt.gameStateBits & BM_FLAG_PREPSCREEN) && !(gGMData.state.bits.state_0))
        Proc_StartBlocking(gProcScr_ShopFadeIn, proc);
}

void StartShopFadeOut(struct ProcShop * proc)
{

    if (!(gBmSt.gameStateBits & BM_FLAG_PREPSCREEN) && !(gGMData.state.bits.state_0))
    {
        Proc_StartBlocking(gProcScr_ShopFadeOut, proc);
        return;
    }
    ResetDialogueScreen();
}

void Shop_Init(struct ProcShop * proc)
{
    int i;

    if (proc->shopType == SHOP_TYPE_ARMORY)
        StartBgm(0x36, 0);
    else
        StartBgm(0x35, 0);

    Proc_ForEach(ProcScr_Mu, (ProcFunc) HideMu);

    InitShopScreenConfig();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitTalk(0x200, 2, 0);

    ResetFaces();

    proc->head_loc = 0;
    proc->head_idx = 0;
    proc->hand_idx = 0;
    proc->hand_loc = 0;
    proc->buy_or_sel = SHOP_ST_BUY;
    proc->helpTextActive = 0;

    UnpackUiVArrowGfx(OBJCHR_SHOP_SPINARROW, OBJPAL_SHOP_SPINARROW);

    StartTalkFace(Shop_GetPortraitIndex(proc), 32, 8, 3, 1);

    Decompress(Tsa_ShopWindows, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    DrawUiFrame2(6, 8, 20, 12, 0);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    StartUiGoldBox(proc);

    for (i = 0; i < SHOP_ITEM_LINE; i++)
        InitText(&gShopItemTexts[i], 20);

    DrawShopSoldItems(proc);

    SetWinEnable(1, 1, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 1, 0, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    SetWin0Box(56, 72, 240, 152);
    SetWin1Box(0, 8, 240, 56);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    ApplyPalette(Pal_CommGameBgScreenInShop, BGPAL_SHOP_MAINBG);
    Decompress(Img_CommGameBgScreen, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_3));
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_CommGameBgScreenInShop, OBJ_PALETTE(BGPAL_SHOP_MAINBG));

    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

void StartUiGoldBox(ProcPtr parent)
{
    struct ProcShop * proc;

    Decompress(Img_ShopGoldBox, OBJ_CHR_ADDR(OBJCHR_SHOP_GOLDBOX));

    proc = Proc_Start(gProcScr_GoldBox, parent);
    proc->goldbox_x = 0xAC;
    proc->goldbox_y = 0x2D;
    proc->goldbox_oam2 = OBJ_PALETTE(OBJPAL_SHOP_GOLDBOX) + OBJ_CHAR(OBJCHR_SHOP_GOLDBOX);
    ApplyPalette(gUiFramePaletteA, 0x10 + OBJPAL_SHOP_GOLDBOX);
    InitGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 28, 6));
    DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 6));
}

void InitGoldBoxText(u16 * tm)
{
    SetTextFont(0);
    InitSystemTextFont();
    InitText(&gText_GoldBox, 1);
    PutSpecialChar(tm, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);
}

void ClearGoldBoxTextTm2Line(u16 * tm, int col)
{
    while (col > 0)
    {
        *tm = 0;
        *(tm + 0x20) = 0;

        tm--;
        col--;
    }
}

void DisplayGoldBoxText(u16 * tm)
{
    SetTextFont(0);
    InitSystemTextFont();
    ClearGoldBoxTextTm2Line(tm, SHOP_TEXT_LINES + 1);
    PutNumber(tm, 2, GetPartyGoldAmount());
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void ShopInitTexts_OnBuy(struct ProcShop * parent)
{
    struct ProcShopInit * proc;
    int i;

    parent->buy_or_sel = SHOP_ST_BUY;

    proc = Proc_Start(ProcScr_ShopBuyInit, PROC_TREE_3);
    proc->shopproc = parent;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = parent->hand_idx; i < parent->hand_idx + SHOP_TEXT_LINES; i++)
        PutBlankText(
            &gShopItemTexts[DivRem(i, SHOP_TEXT_LINES + 1)],
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));

    BG_SetPosition(BG_2, 0, (parent->hand_idx * 0x10) - 0x48);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void DrawShopSoldItems(struct ProcShop * proc)
{
    int item;
    int index;
    int i;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = proc->hand_idx; i < proc->hand_idx + SHOP_TEXT_LINES; i++)
    {
        index = DivRem(i, SHOP_TEXT_LINES + 1);
        ClearText(&gShopItemTexts[index]);
    }

    for (i = proc->hand_idx; i < proc->hand_idx + SHOP_TEXT_LINES; i++)
    {
        index = DivRem(i, SHOP_TEXT_LINES + 1);
        item = proc->shopItems[i];

        if (item == 0)
            break;

        DrawShopItemPriceLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F))
        );
    }
    BG_SetPosition(BG_2, 0, (proc->hand_idx * 0x10) - 0x48);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void InitShopBuyStatus(struct ProcShopInit * proc)
{
    Shop_InitBuyState(proc->shopproc);
    DrawShopSoldItems(proc->shopproc);

    Proc_Break(proc);
}

void ShopInitTexts_OnSell(struct ProcShop * parent)
{
    struct ProcShopInit * proc;
    int i;

    parent->buy_or_sel = SHOP_ST_SELL;

    proc = Proc_Start(ProcScr_ShopSellInit, PROC_TREE_3);
    proc->shopproc = parent;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = 0; i < SHOP_TEXT_LINES; i++)
        PutBlankText(
            &gShopItemTexts[DivRem(i, SHOP_TEXT_LINES + 1)],
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));

    BG_SetPosition(2, 0, -0x48);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void ShopDrawDefaultSellItemLine(struct ProcShop * proc)
{
    int i;
    int index;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = 0; i < SHOP_TEXT_LINES; i++)
    {
        index = DivRem(i, SHOP_TEXT_LINES + 1);
        ClearText(&gShopItemTexts[index]);
    }

    for (i = 0; i < SHOP_TEXT_LINES; i++)
    {
        int item;

        index = DivRem(i, SHOP_TEXT_LINES + 1);
        item = proc->unit->items[i];

        if (item == 0)
            break;

        DrawShopItemLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));
    }
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void InitShopSellStatus(struct ProcShopInit * proc)
{
    Shop_InitSellState(proc->shopproc);
    ShopDrawDefaultSellItemLine(proc->shopproc);
    Proc_Break(proc);
}

void DrawShopItemPriceLine(struct Text * th, int item, struct Unit * unit, u16 * dst)
{
    bool unuseable;

    int price = GetItemPurchasePrice(unit, item);

    if (unit == 0)
        unuseable = true;
    else
        unuseable = IsItemDisplayUsable(unit, item);

    DrawItemMenuLine(th, item, unuseable, dst);

    PutNumber(
        dst + 0x11,
        (int)GetPartyGoldAmount() >= price
            ? TEXT_COLOR_SYSTEM_BLUE
            : TEXT_COLOR_SYSTEM_GRAY,
        price
    );
}

void DrawShopItemLine(struct Text * th, int item, struct Unit * unit, u16 * dst)
{
    DrawItemMenuLine(th, item, IsItemDisplayUsable(unit, item), dst);

    if (IsItemSellable(item) != 0)
        PutNumber(dst + 0x11, TEXT_COLOR_SYSTEM_BLUE, GetItemSellPrice(item));
    else
        Text_InsertDrawString(th, 0x5C, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(0x537));
}

u16 GetItemPurchasePrice(struct Unit * unit, int item)
{
    int cost = GetItemCost(item);

    if (gBmSt.gameStateBits & BM_FLAG_PREPSCREEN)
        cost = cost + (cost / 2);

    if (UnitHasItem(unit, ITEM_SILVERCARD))
        return (cost / 2);
    else
        return cost;
}

u16 GetItemSellPrice(int item)
{
    return GetItemCost(item) / 2;
}

bool IsItemSellable(int item)
{
    if (GetItemAttributes(item) & IA_UNSELLABLE)
        return false;

    if (GetItemSellPrice(item) == 0)
        return false;

    return true;
}

void GoldBox_OnLoop(struct ProcShop * proc)
{
    CallARM_PushToSecondaryOAM(
        proc->goldbox_x,
        proc->goldbox_y,
        Sprite_ShopGoldBox,
        proc->goldbox_oam2);
}

void InitShopScreenConfig(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 0, 0);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    ResetText();
    LoadUiFrameGraphics();
    ResetIconGraphics_();
    LoadIconPalettes(BGPAL_SHOP_4);
    LoadHelpBoxGfx(0, -1);
}

void _DisplayShopUiArrows(void)
{
    DisplayShopUiArrows();
}

void DisplayShopUiArrows(void)
{
    if (ShouldDisplayUpArrow())
        DisplayUiVArrow(
            120, 64,
            OBJ_PALETTE(OBJPAL_SHOP_SPINARROW) + OBJ_CHAR(OBJCHR_SHOP_SPINARROW),
            true);

    if (ShouldDisplayDownArrow())
        DisplayUiVArrow(
            120, 152,
            OBJ_PALETTE(OBJPAL_SHOP_SPINARROW) + OBJ_CHAR(OBJCHR_SHOP_SPINARROW),
            false);
}

void UnpackUiVArrowGfx(int chr, int pal)
{
    Decompress(Img_SpinningArrow, OBJ_VRAM0 + CHR_SIZE * OBJ_CHAR(chr));
    ApplyPalette(Pal_SpinningArrow, pal + 0x10);
}

void DisplayUiVArrow(int x, int y, u16 oam2Base, int flip_en)
{
    int vflip;
    int offset = Div(DivRem(GetGameClock(), 40), 8) * 2;

    vflip = 0;
    if (flip_en == 0)
        vflip = ATTR1_FLIP_Y;

    PutSpriteExt(
        2,
        x | vflip,
        y,
        gObject_16x8,
        (oam2Base) + offset
    );
}

void HandleShopBuyAction(struct ProcShop * proc)
{
    PlaySeDelayed(0xB9, 8);

    gActionData.unitActionType = UNIT_ACTION_SHOPPED;

    SetPartyGoldAmount(
        GetPartyGoldAmount() - GetItemPurchasePrice(proc->unit, proc->shopItems[proc->head_loc]));

    UpdateShopItemCounts(proc);
    DrawShopSoldItems(proc);

    DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 6));
}

int ShopTryMoveHand(int pos, int pre, bool hscroll_en)
{
    int previous;

    if (pos < 0)
        pos = 0;

    if (pos >= pre)
        pos = pre - 1;

    previous = pos;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (pos == 0)
        {
            if (hscroll_en && (gKeyStatusPtr->newKeys & DPAD_UP))
                pos = pre - 1;
        }
        else
        {
            pos--;
        }
    }
    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (pos == (pre - 1))
        {
            if (hscroll_en && (gKeyStatusPtr->newKeys & DPAD_DOWN))
                pos = 0;
        }
        else
            pos++;
    }

    if (previous != pos)
    {
        PlaySoundEffect(0x66);
    }
    return pos;
}

void ShopSt_SetHeadLocBak(int unk)
{
    int * pint = &sShopState.head_loc_bak;
    *pint = unk;
}

int ShopTryScrollPage(int head_loc, int total, int lines, int hand_loc)
{
    int * _head_loc_bak = &sShopState.head_loc_bak;
    int __head_loc_bak = *_head_loc_bak;

    *_head_loc_bak = head_loc;

    if (head_loc == __head_loc_bak || lines > total)
        return false;

    if (head_loc < __head_loc_bak)
    {
        if ((hand_loc != 0) && ((head_loc - hand_loc) < 1))
            return -1;
    }
    else if (((lines + hand_loc) != total) && ((head_loc - hand_loc) >= (lines - 1)))
        return +1;

    return false;
}

int ShopUpdateBg2Offset(int off, int tar, int trig)
{
    int ret, diff = off - tar;

    if (diff >= 0)
    {
        if (diff < trig)
            return tar;

        diff = tar - off;
    }
    else
    {
        diff = tar - off;
        if (diff < trig)
            return tar;
    }

    if (diff <= 0)
    {
        ret = off;
        if (diff < 0)
            ret = off - trig;
    }
    else
    {
        ret = off + trig;
    }

    off = ret;
    return off;
}

void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg2_base, ShopFunc func, struct ProcShop * proc)
{

    ShopSt_SetHeadLocBak(head_loc);

    gShopState->head_loc = head_loc;
    gShopState->item_cnt = item_cnt;
    gShopState->lines = lines;
    gShopState->hand_loc = hand_loc;
    gShopState->px_per_line = 16;
    gShopState->trig = 4;
    gShopState->draw_line = func;
    gShopState->proc = proc;
    gShopState->bg2_base = -bg2_base;
    gShopState->bg2_off = hand_loc * 16;
}

void Shop_TryMoveHandPage(void)
{

    gShopState->head_loc = ShopTryMoveHand(gShopState->head_loc, gShopState->item_cnt, 0);

    switch (ShopTryScrollPage(gShopState->head_loc, gShopState->item_cnt, gShopState->lines, gShopState->hand_loc)) {
    case 0:
        break;

    case +1:
        gShopState->hand_loc++;
        gShopState->draw_line(gShopState->proc, gShopState->hand_loc + gShopState->lines - 1);
        break;

    case -1:
        gShopState->hand_loc--;
        gShopState->draw_line(gShopState->proc, gShopState->hand_loc);
        break;
    }

    gShopState->bg2_off = ShopUpdateBg2Offset(
                            gShopState->bg2_off,
                            gShopState->hand_loc * gShopState->px_per_line,
                            gShopState->trig);
}

u16 ShopSt_GetHeadLoc(void)
{
    return gShopState->head_loc;
}

int ShopSt_GetBg2Offset(void)
{
    return gShopState->bg2_base + gShopState->bg2_off;
}

u16 ShopSt_GetHandLoc(void)
{
    return gShopState->hand_loc;
}

void ShopSt_SetLineHeight(int px)
{
    gShopState->px_per_line = px;
}

void ShopSt_SetSetPageScrollTrigOffset(int trig)
{
    gShopState->trig = trig;
}

bool IsShopPageScrolling(void)
{
    if (gShopState->bg2_off != (gShopState->hand_loc * gShopState->px_per_line))
        return true;

    return false;
}

bool ShouldDisplayUpArrow(void)
{
    if (gShopState->hand_loc != 0) {
        return true;
    }

    return false;
}

bool ShouldDisplayDownArrow(void)
{
    if (gShopState->hand_loc + gShopState->lines < gShopState->item_cnt)
        return true;

    return false;
}
