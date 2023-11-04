#ifndef BONUSCLAIM_H
#define BONUSCLAIM_H

#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "fontgrp.h"

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

struct BonusClaimConfig {
    /* 00 */ s8 hasInventorySpace;
    /* 04 */ struct Unit * unit;
};

void PutChapterBannerSprites(void);
void sub_80B0674(void);
void sub_80B06FC(void);
s8 InitBonusClaimData(void);
void DrawBonusClaimItemText(int idx);
void SetBonusItemClaimed(int idx);
void SetupBonusClaimTargets(struct BonusClaimProc * proc);
void sub_80B0ABC(void);
void BonusClaim_Init(struct BonusClaimProc * proc);
void BonusClaim_Loop_MainKeyHandler(struct BonusClaimProc * proc);
void BonusClaim_DrawTargetUnitSprites(struct BonusClaimProc * proc);
void sub_80B1008(struct BonusClaimProc * proc);
void BonusClaim_StartSelectTargetSubMenu(struct BonusClaimProc * proc);
s8 TryClaimBonusItem(struct BonusClaimProc * proc);
void BonusClaim_Loop_SelectTargetKeyHandler(struct BonusClaimProc * proc);
void BonusClaim_EndSelectTargetSubMenu(struct BonusClaimProc * proc);
void BonusClaim_DrawItemSentPopup(struct BonusClaimProc * proc);
void BonusClaim_Loop_PopupDisplayTimer(struct BonusClaimProc * proc);
void BonusClaim_ClearItemSentPopup(void);
void BonusClaim_OnEnd(struct BonusClaimProc * proc);
void StartBonusClaimScreen(ProcPtr);

extern struct BonusClaimEnt gBonusClaimData[];
extern struct BonusClaimEnt gBonusClaimDataUpdated[];
extern struct BonusClaimItemEnt gBonusClaimItemList[];
extern struct BonusClaimConfig gBonusClaimConfig[];
extern int gBonusClaimItemCount;
extern struct Text gBonusClaimText[];

extern struct BonusClaimEnt * gpBonusClaimData;
extern struct BonusClaimEnt * gpBonusClaimDataUpdated;
extern struct BonusClaimItemEnt * gpBonusClaimItemList;
extern int * gpBonusClaimItemCount;
extern struct Text * gpBonusClaimText;
extern struct BonusClaimConfig * gpBonusClaimConfig;

#endif // BONUSCLAIM_H
