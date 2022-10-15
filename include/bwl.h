#ifndef GUARD_BWL_H
#define GUARD_BWL_H

#define BWL_ARRAY_NUM 0x46

/**
 * need unit struct defined
 * #include "bmunit.h"
 */

struct BwlData {
	/* 000 */ unsigned lossAmt     : 8;
	/* 008 */ unsigned favval      : 16;
	/* 024 */ unsigned actAmt      : 8;
	/* 032 */ unsigned statViewAmt : 8;
	/* 040 */ unsigned deathLoc    : 6;
	/* 046 */ unsigned deathTurn   : 10;
	/* 056 */ unsigned deployAmt   : 6;
	/* 062 */ unsigned moveAmt     : 10;
	/* 072 */ unsigned deathCause  : 4;
	/* 076 */ unsigned expGained   : 12;
	/* 088 */ unsigned winAmt      : 10;
	/* 098 */ unsigned battleAmt   : 12;
	/* 110 */ unsigned killerPid   : 9;
	/* 119 */ unsigned deathSkirm  : 1;
	/* 120 */ /* 8bit pad */
};

extern struct BwlData *gpBWLSaveTarget;
extern struct BwlData gBWLDataStorage[BWL_ARRAY_NUM];
#define gBWLDataArray (&gBWLDataStorage[-1])

static inline struct BwlData *GetBWL(u8 char_id)
{
    if (char_id >= BWL_ARRAY_NUM)
        return 0;
    else if (0 == GetCharacterData(char_id)->affinity)
        return 0;
    else
        return &gBWLDataArray[char_id];  
}

struct BwlData *BWL_GetEntry(u8 char_id);

void BWL_IncrementBattleCount(struct Unit* unit);
void BWL_IncrementWinCount(u8 char_id);
void BWL_IncrementAndSaveLossCount(u8 char_id);
void BWL_SetUnitLossInfo(u8 char_id, u8 killer, int deathCause);
void BWL_IncrementMoveValue(u8 char_id);
void BWL_IncrementStatScreenViews(u8 char_id);
void BWL_IncrementDeployCount(u8 char_id);
void BWL_AddTilesMoved(u8 char_id, int amount);
void BWL_AddExpGained(u8 char_id, int expGain);
void BWL_FavorDecreaseSlightly(u8 char_id);
void BWL_FavorDecreaseDrastically(u8 char_id);
int BWL_CalcTotalBattleCount();
int BWL_CalcTotalWinCount();
int BWL_CalcTotalLossCount();
int BWL_CalcTotalLevel();
int BWL_CalcTotalExpGain();
int GetBwlExpGain(u8 char_id);
int GetBwlFavoritism(u8 char_id);

#endif /* GUARD_BWL_H */
