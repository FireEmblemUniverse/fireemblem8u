#ifndef GUARD_BMSHOP_H
#define GUARD_BMSHOP_H

#include "global.h"
#include "proc.h"
#include "bmunit.h"

enum {
    SHOP_TYPE_ARMORY        = 0,
    SHOP_TYPE_VENDOR        = 1,
    SHOP_TYPE_SECRET_SHOP   = 2
};

enum {
    PL_SHOP_ENTRY = 0,
    PL_SHOP_BUY,
    PL_SHOP_BUY_MAIN,
    PL_SHOP_BUY_DONE,
    PL_SHOP_SELL,
    PL_SHOP_SELL_MAIN,
    PL_SHOP_6_UNUSED, // unused
    PL_SHOP_SELL_NOITEM,
    PL_SHOP_ANYTHING_ELSE,
    PL_SHOP_SENDTO_INVENTORY,
    PL_SHOP_SENDTO_INVENTORY_EXT,
    PL_SHOP_BUY_FULL_NO_INEVNTORY,
    PL_SHOP_EXIT,
    PL_SHOP_PREP_ENTRY,
    PL_SHOP_14,
    PL_SHOP_15,
    PL_SHOP_16,
    PL_SHOP_17,
};

enum { SHOP_ITEMS_MAX_AMT = 20 };

#define SHOP_ITEMS_MAX_AMT 20
#define SHOP_TEXT_LINES 5

enum bmshop_bgchr {
    OBJCHR_SHOP_SPINARROW = 0x4800 / 0x20,
    OBJPAL_SHOP_SPINARROW = 3,

    OBJCHR_SHOP_GOLDBOX = 0x4C00 / 0x20,
    OBJPAL_SHOP_GOLDBOX = 4,

    BGPAL_SHOP_4 = 4,
    BGPAL_SHOP_MAINBG = 14,
};

enum {
    SHOP_ST_BUY,
    SHOP_ST_SELL
};

struct ProcShop {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;
    /* 30 */ u16 shopItems[20];

    /* 58 */ u16 unk_58;

    /* 5A */ u8 shopItemCount;
    /* 5B */ u8 unitItemCount;
    /* 5C */ u8 head_loc;
    /* 5D */ u8 hand_loc;
    /* 5E */ u8 head_idx;
    /* 5F */ u8 hand_idx; // maybe top visible item in menu?
    /* 60 */ u8 buy_or_sel;
    /* 61 */ u8 shopType;
    /* 62 */ u8 helpTextActive;

    /* 64 */ s16 goldbox_x;
    /* 66 */ s16 goldbox_y;
    /* 68 */ s16 goldbox_oam2;
};

struct ProcShopInit {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x54-0x29];

    /* 54 */ struct ProcShop * shopproc;
};

typedef void (* ShopFunc)(struct ProcShop *, int);

struct ShopState {
    /* 00 */ u16 head_loc;
    /* 02 */ u16 item_cnt;
    /* 04 */ u16 lines;
    /* 06 */ u16 hand_loc;
    /* 08 */ u16 px_per_line;
    /* 0A */ u16 trig;
    /* 0C */ u16 bg2_off;
    /* 10 */ int bg2_base;
    /* 14 */ ShopFunc draw_line;
    /* 18 */ ProcPtr proc;
    /* 1C */ int head_loc_bak;
};

int Shop_GetPortraitIndex(struct ProcShop * proc);
void StartShopDialogue(int baseMsgId, struct ProcShop * proc);
void StartDefaultArmoryScreen(struct Unit* unit, ProcPtr proc);
void StartArmoryScreenOrphaned(struct Unit* unit, u16* shopItems);
void StartArmoryScreen(struct Unit* unit, u16* shopItems, ProcPtr parent);
void StartVendorScreenOrphaned(struct Unit* unit, u16* shopItems);
void StartVendorScreen(struct Unit* unit, u16* shopItems, ProcPtr parent);
void StartSecretShopScreenOrphaned(struct Unit* unit, u16* shopItems);
void StartSecretShopScreen(struct Unit* unit, u16* shopItems, ProcPtr parent);
void StartArmoryScreen2(struct Unit* unit, u16* shopItems);
void StartShopScreen(struct Unit * unit, const u16 * inventory, u8 shopType, ProcPtr parent);
void UpdateShopItemCounts(struct ProcShop*);
void TalkChoice_OnBuy(void);
void TalkChoice_OnSell(void);
// ??? Shop_null_80B4328(???);
void Shop_EntryDialogue(struct ProcShop * proc);
void Shop_HandleEntryDialoguePrompt(struct ProcShop * proc);
void Shop_BuyDialogue(struct ProcShop * proc);
void ShopDrawBuyItemLine(struct ProcShop * proc, int itemIndex);
void ShopDrawSellItemLine(struct ProcShop * proc, int itemIndex);
void Shop_InitBuyState(struct ProcShop * proc);
void Shop_Loop_BuyKeyHandler(struct ProcShop * proc);
void Shop_HandleBuyConfirmPrompt(struct ProcShop * proc);
void Shop_TryAddItemToInventory(struct ProcShop * proc);
void Shop_HandleSendToConvoyPrompt(struct ProcShop * proc);
void Shop_SendToConvoyDialogue(struct ProcShop * proc);
void Shop_NoSendToConvoyDialogue(struct ProcShop * proc);
void Shop_AddItemToConvoy(struct ProcShop * proc);
void Shop_CheckIfConvoyFull(struct ProcShop * proc);
void Shop_ConvoyFullDialogue(struct ProcShop * proc);
void Shop_AnythingElseDialogue(struct ProcShop * proc);
void Shop_SellDialogue(struct ProcShop * proc);
void Shop_InitSellState(struct ProcShop * proc);
void Shop_Loop_SellKeyHandler(struct ProcShop * proc);
void Shop_HandleSellConfirmPrompt(struct ProcShop * proc);
void Shop_SellAnythingElseDialogue(struct ProcShop * proc);
void Shop_AnythingElseRestartDialogue(struct ProcShop * proc);
void Shop_AnythingElseContinueDialogue(struct ProcShop * proc);
void Shop_ExitShopDialogue(struct ProcShop * proc);
void Shop_OnExit(void);
void Shop_PrepEntryDialogue(struct ProcShop * proc);
void Shop_Loop_UnkKeyHandler(struct ProcShop * proc);
void StartShopFadeIn(struct ProcShop * proc);
void StartShopFadeOut(struct ProcShop * proc);
void Shop_Init(struct ProcShop * proc);
void StartUiGoldBox(ProcPtr);
void InitGoldBoxText(u16 *);
void ClearGoldBoxTextTm2Line(u16 * tm, int lines);
void DisplayGoldBoxText(u16 *);
void ShopInitTexts_OnBuy(struct ProcShop * proc);
void DrawShopSoldItems(struct ProcShop * proc);
void InitShopBuyStatus(struct ProcShopInit * proc);
void ShopInitTexts_OnSell(struct ProcShop * proc);
void ShopDrawDefaultSellItemLine(struct ProcShop * proc);
void InitShopSellStatus(struct ProcShopInit * proc);
void DrawShopItemPriceLine(struct Text *, int, struct Unit *, u16 *);
void DrawShopItemLine(struct Text *, int, struct Unit *, u16 *);
u16 GetItemPurchasePrice(struct Unit *, int);
u16 GetItemSellPrice(int);
bool IsItemSellable(int item);
void GoldBox_OnLoop(struct ProcShop * proc);
void InitShopScreenConfig(void);
void _DisplayShopUiArrows(void);
void DisplayShopUiArrows(void);
void UnpackUiVArrowGfx(int, int);
void DisplayUiVArrow(int, int, u16, int);
void HandleShopBuyAction(struct ProcShop * proc);
int ShopTryMoveHand(int pos, int pre, bool scroll);
// ??? ShopSt_SetHeadLocBak(???);
// ??? ShopTryScrollPage(???);
// ??? ShopUpdateBg2Offset(???);
void RegisterShopState(u16, u16 item_cnt, u16 lines, u16 cur_sel, int bg_off, ShopFunc, struct ProcShop * proc);
void Shop_TryMoveHandPage(void);
u16 ShopSt_GetHeadLoc(void);
int ShopSt_GetBg2Offset(void);
u16 ShopSt_GetHandLoc(void);
void ShopSt_SetLineHeight(int px);
void ShopSt_SetSetPageScrollTrigOffset(int trig);
bool IsShopPageScrolling(void);
s8 ShouldDisplayUpArrow(void);
s8 ShouldDisplayDownArrow(void);

extern struct ProcCmd CONST_DATA gProcScr_Shop[];
extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];
extern struct ProcCmd CONST_DATA ProcScr_ShopDrawHand[];
extern struct Text gText_GoldBox;
extern EWRAM_DATA struct ShopState sShopState;
extern struct ShopState * CONST_DATA gShopState;

#define SHOP_ITEM_LINE 6
extern EWRAM_DATA struct Text gShopItemTexts[SHOP_ITEM_LINE];

extern u16 CONST_DATA gDefaultShopInventory[];
extern int CONST_DATA gShopDialogueOffsetLut[];
extern int CONST_DATA gShopPortraitLut[];

#endif  // GUARD_BMSHOP_H
