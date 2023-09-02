#ifndef BONUSCLAIM_H
#define BONUSCLAIM_H

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

// ??? PutChapterBannerSprites(???);
// ??? sub_80B0674(???);
// ??? sub_80B06FC(???);
// ??? InitBonusClaimData(???);
// ??? DrawBonusClaimItemText(???);
// ??? SetBonusItemClaimed(???);
// ??? SetupBonusClaimTargets(???);
// ??? sub_80B0ABC(???);
// ??? BonusClaim_Init(???);
// ??? BonusClaim_Loop_MainKeyHandler(???);
// ??? BonusClaim_DrawTargetUnitSprites(???);
// ??? sub_80B1008(???);
// ??? BonusClaim_StartSelectTargetSubMenu(???);
// ??? TryClaimBonusItem(???);
// ??? BonusClaim_Loop_SelectTargetKeyHandler(???);
// ??? BonusClaim_EndSelectTargetSubMenu(???);
// ??? BonusClaim_DrawItemSentPopup(???);
// ??? BonusClaim_Loop_PopupDisplayTimer(???);
// ??? BonusClaim_ClearItemSentPopup(???);
// ??? BonusClaim_OnEnd(???);
void StartBonusClaimScreen(ProcPtr);

#endif // BONUSCLAIM_H
