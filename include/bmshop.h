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
};

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

typedef void (* ShopFunc)(struct BmShopProc *, int);

struct ShopState {
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0A;
    /* 0C */ u16 unk_0C;
    /* 10 */ int unk_10;
    /* 14 */ ShopFunc draw_line;
    /* 18 */ ProcPtr proc;
    /* 1C */ int unk1C;
};

int Shop_GetPortraitIndex(struct BmShopProc * proc);
void StartShopDialogue(int baseMsgId, struct BmShopProc * proc);
void StartDefaultArmoryScreen(struct Unit* unit, ProcPtr proc);
void StartArmoryScreenOrphaned(struct Unit* unit, u16* shopItems);
void StartArmoryScreen(struct Unit* unit, u16* shopItems, ProcPtr parent);
void StartVendorScreenOrphaned(struct Unit* unit, u16* shopItems);
void StartVendorScreen(struct Unit* unit, u16* shopItems, ProcPtr parent);
void StartSecretShopScreenOrphaned(struct Unit* unit, u16* shopItems);
void StartSecretShopScreen(struct Unit* unit, u16* shopItems, ProcPtr parent);
void StartArmoryScreen2(struct Unit* unit, u16* shopItems);
void StartShopScreen(struct Unit*, u16*, u8, ProcPtr);
void UpdateShopItemCounts(struct BmShopProc*);
void sub_80B42E8(void);
void sub_80B4308(void);
// ??? sub_80B4328(???);
void Shop_EnterShopDialogue(struct BmShopProc * proc);
void Shop_HandleEntryPrompt(struct BmShopProc * proc);
void Shop_BuyDialogue(struct BmShopProc * proc);
void ShopDrawBuyItemLine(struct BmShopProc * proc, int itemIndex);
void ShopDrawSellItemLine(struct BmShopProc * proc, int itemIndex);
void Shop_InitBuyState(struct BmShopProc * proc);
void Shop_Loop_BuyKeyHandler(struct BmShopProc * proc);
void Shop_HandleBuyConfirmPrompt(struct BmShopProc * proc);
void Shop_TryAddItemToInventory(struct BmShopProc * proc);
void Shop_HandleSendToConvoyPrompt(struct BmShopProc * proc);
void Shop_SendToConvoyDialogue(struct BmShopProc * proc);
void Shop_NoSendToConvoyDialogue(struct BmShopProc * proc);
void Shop_AddItemToConvoy(struct BmShopProc * proc);
void Shop_CheckIfConvoyFull(struct BmShopProc * proc);
void Shop_ConvoyFullDialogue(struct BmShopProc * proc);
void Shop_AnythingElseDialogue(struct BmShopProc * proc);
void Shop_SellDialogue(struct BmShopProc * proc);
void Shop_InitSellState(struct BmShopProc * proc);
void Shop_Loop_SellKeyHandler(struct BmShopProc * proc);
void Shop_HandleSellConfirmPrompt(struct BmShopProc * proc);
void Shop_SellAnythingElseDialogue(struct BmShopProc * proc);
void Shop_AnythingElseRestartDialogue(struct BmShopProc * proc);
void Shop_AnythingElseContinueDialogue(struct BmShopProc * proc);
void Shop_ExitShopDialogue(struct BmShopProc * proc);
void Shop_OnExit(void);
void Shop_EnterPrepScreenShopDialogue(struct BmShopProc * proc);
void Shop_Loop_UnkKeyHandler(struct BmShopProc * proc);
void StartShopFadeIn(struct BmShopProc * proc);
void StartShopFadeOut(struct BmShopProc * proc);
void Shop_Init(struct BmShopProc * proc);
void StartUiGoldBox(ProcPtr);
void InitGoldBoxText(u16 *);
// ??? sub_80B4EB4(???);
void DisplayGoldBoxText(u16 *);
void sub_80B4F04(struct BmShopProc * proc);
void DrawShopSoldItems(struct BmShopProc * proc);
void sub_80B5040(struct BmShop2Proc * proc);
void sub_80B505C(struct BmShopProc * proc);
// ??? sub_80B50C8(???);
void sub_80B5148(struct BmShop2Proc * proc);
void DrawShopItemPriceLine(struct Text *, int, struct Unit *, u16 *);
void DrawShopItemLine(struct Text *, int, struct Unit *, u16 *);
u16 GetItemPurchasePrice(struct Unit *, int);
u16 GetItemSellPrice(int);
s8 IsItemSellable(int);
void GoldBox_OnLoop(struct BmShopProc * proc);
void InitShopScreenConfig(void);
void _DisplayShopUiArrows(void);
void DisplayShopUiArrows(void);
void UnpackUiVArrowGfx(int, int);
void DisplayUiVArrow(int, int, u16, int);
void HandleShopBuyAction(struct BmShopProc * proc);
// ??? sub_80B5498(???);
// ??? sub_80B5528(???);
// ??? sub_80B5534(???);
// ??? sub_80B557C(???);
void RegisterShopState(u16, u16, u16, u16, int, ShopFunc, struct BmShopProc * proc);
void sub_80B5604(void);
u16 sub_80B568C(void);
int sub_80B5698(void);
u16 sub_80B56A8(void);
// ??? sub_80B56B4(???);
// ??? sub_80B56C0(???);
s8 sub_80B56CC(void);
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
