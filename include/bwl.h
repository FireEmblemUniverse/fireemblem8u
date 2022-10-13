#ifndef GUARD_BWL_H
#define GUARD_BWL_H

#define BWL_ARRAY_NUM 0x46

/**
 * need unit struct defined
 * #include "bmunit.h"
 */

struct BwlData {
    /* 00 */ u32 loss_count : 0x08;
             u32 favoritism : 0x10;
             u32 unit_move_count : 0x08;
             
    /* 04 */ u32 stat_screen_view_count : 0x08;
             u32 death_loc_id : 0x06;
             u32 death_turn_num : 0x0A;
             u32 deploy_count : 0x06;
             u32 tiles_move_count : 0x0A;
             u32 death_type : 0x04;
             u32 total_exp_gain : 0x0C;
             u32 win_count : 0x0A;
             u32 battle_count : 0x0C;
             u32 killer : 0x09;
             u32 dead_in_skirmish : 0x01;

             u32 _pad_ : 0x08;
};

extern struct BwlData *gpBWLSaveTarget;
extern struct BwlData gBWLDataStorage[BWL_ARRAY_NUM];
#define gBWLDataArray (&gBWLDataStorage[-1])

static inline struct BwlData *GetBWL(u8 char_id)
{
    if (char_id >= BWL_ARRAY_NUM)
        return 0;

    if (0 == GetCharacterData(char_id)->affinity)
        return 0;

    return &gBWLDataArray[char_id];
}

void BWL_IncrementBattleCount(struct Unit* unit);
void BWL_IncrementWinCount(u8 char_id);
void BWL_IncrementAndSaveLossCount(u8 char_id);
void BWL_SetUnitLossInfo(u8 char_id, u8 killer, int death_type);
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
