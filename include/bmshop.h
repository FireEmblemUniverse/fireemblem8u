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
    /* 1C */ int unk1C;
};

int ShopProc_GetPortraitIndex(struct BmShopProc* proc);
void StartShopDialogue(int baseMsgId, struct BmShopProc* proc);
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
// ??? ShopProc_EnterShopDialogue(???);
// ??? ShopProc_HandleEntryPrompt(???);
// ??? ShopProc_BuyDialogue(???);
// ??? sub_80B43BC(???);
// ??? sub_80B4418(???);
// ??? ShopProc_InitBuyState(???);
// ??? ShopProc_Loop_BuyKeyHandler(???);
// ??? ShopProc_HandleBuyConfirmPrompt(???);
// ??? ShopProc_TryAddItemToInventory(???);
// ??? ShopProc_HandleSendToConvoyPrompt(???);
// ??? ShopProc_NoSendToConvoyDialogue(???);
// ??? ShopProc_AddItemToConvoy(???);
void ShopProc_CheckIfConvoyFull(struct BmShopProc * proc);
// ??? ShopProc_ConvoyFullDialogue(???);
// ??? ShopProc_AnythingElseDialogue(???);
// ??? ShopProc_SellDialogue(???);
// ??? ShopProc_InitSellState(???);
// ??? ShopProc_Loop_SellKeyHandler(???);
// ??? ShopProc_HandleSellConfirmPrompt(???);
// ??? ShopProc_SellAnythingElseDialogue(???);
// ??? ShopProc_AnythingElseRestartDialogue(???);
// ??? ShopProc_AnythingElseContinueDialogue(???);
// ??? ShopProc_ExitShopDialogue(???);
// ??? ShopProc_OnExit(???);
// ??? ShopProc_EnterPrepScreenShopDialogue(???);
// ??? ShopProc_Loop_UnkKeyHandler(???);
// ??? StartShopFadeIn(???);
// ??? StartShopFadeOut(???);
// ??? ShopProc_Init(???);
void StartUiGoldBox(ProcPtr);
// ??? InitGoldBoxText(???);
// ??? sub_80B4EB4(???);
void DisplayGoldBoxText(u16* tm);
// ??? sub_80B4F04(???);
// ??? sub_80B4F90(???);
// ??? sub_80B5040(???);
// ??? sub_80B505C(???);
// ??? sub_80B50C8(???);
// ??? sub_80B5148(???);
// ??? sub_80B5164(???);
// ??? DrawShopItemLine(???);
// ??? GetItemPurchasePrice(???);
u16 GetItemSellPrice(int);
// ??? IsItemSellable(???);
// ??? GoldBox_OnLoop(???);
void sub_80B52CC(void);
// ??? sub_80B5378(???);
// ??? DisplayShopUiArrows(???);
void UnpackUiVArrowGfx(int, int);
void DisplayUiVArrow(int, int, u16, int);
// ??? HandleShopBuyAction(???);
// ??? sub_80B5498(???);
// ??? sub_80B5528(???);
// ??? sub_80B5534(???);
// ??? sub_80B557C(???);
// ??? sub_80B55AC(???);
// ??? sub_80B5604(???);
// ??? sub_80B568C(???);
// ??? sub_80B5698(???);
// ??? sub_80B56A8(???);
// ??? sub_80B56B4(???);
// ??? sub_80B56C0(???);
// ??? sub_80B56CC(???);
// ??? ShouldDisplayUpArrow(???);
// ??? ShouldDisplayDownArrow(???);

extern struct ProcCmd CONST_DATA gProcScr_Shop[];
extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];

#endif  // GUARD_BMSHOP_H
