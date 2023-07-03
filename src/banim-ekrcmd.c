#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

extern struct Anim *gAnims[4];

void EkrPrepareBanimfx(struct Anim *anim, u16 index)
{
    gEkrPairBanimID2[GetAnimPosition(anim)] = index;
    UpdateBanimFrame();
    SwitchAISFrameDataFromBARoundType(anim, 6);
}

s16 GetBattleAnimRoundType(int index)
{
    if (gAnimRoundData[index] == -1)
        return -1;
    else
        return gAnimRoundData[index] & 0xFF;
}

s16 GetBattleAnimRoundTypeFlags(int index)
{
    if (gAnimRoundData[index] == -1)
        return 0;
    else
        return gAnimRoundData[index] & 0xFF00;
}

s16 GetEfxHp(int index)
{
    return gEfxHpLut[index * 2];
}

s16 GetEfxHpModMaybe(int index)
{
    s16 *buf = (s16 *)gEfxHpLut;
    return buf[index] & (-0x100);
}

bool IsItemDisplayedInBattle(u16 item)
{
    if (GetItemIndex(item) == ITEM_FILLAS_MIGHT)
        return true;

    if (GetItemIndex(item) == ITEM_NINISS_GRACE)
        return true;

    if (GetItemIndex(item) == ITEM_THORS_IRE)
        return true;

    if (GetItemIndex(item) == ITEM_SETS_LITANY)
        return true;

    return false;
}

u16 IsWeaponLegency(u16 item)
{
    switch (GetItemIndex(item)) {
    case ITEM_ANIMA_EXCALIBUR:
    case ITEM_DARK_GLEIPNIR:
    case ITEM_SWORD_SIEGLINDE:
    case ITEM_LIGHT_IVALDI:
    case ITEM_LANCE_VIDOFNIR:
    case ITEM_SWORD_AUDHULMA:
    case ITEM_LANCE_SIEGMUND:
    case ITEM_AXE_GARM:
    case ITEM_BOW_NIDHOGG:
        return true;

    default:
        return false;
    }
}

bool sub_8058B08(u16 item)
{
    switch (GetItemIndex(item)) {
    case ITEM_SWORD_SIEGLINDE:
    case ITEM_LANCE_SIEGMUND:
        return true;

    default:
        return false;
    }
}

bool sub_8058B24(u16 round)
{
    int i;
    s16 cur;

    for (i = round; i < 0x14; i = i + 2) {
        cur = gAnimRoundData[i];
        
        if (cur == 0)
            return true;

        if (cur == 1)
            return true;

        if (cur == 2)
            return true;

        if (cur == 3)
            return true;

        if (cur == 9)
            return true;
    }

    return false;
}

void sub_8058B64(void)
{
    gUnknown_0203E1E0 = true;
}

void sub_8058B70(void)
{
    gUnknown_0203E1E0 = false;
}

bool sub_8058B7C(void)
{
    if (gUnknown_0203E1E0 == false)
        return false;
    else
        return true;
}

int GetEkrHit(int pos)
{
    return gEkrPairHit[pos];
}

int GetEkrDmg(int pos)
{
    return gEkrPairDmgPair[pos];
}

int GetEkrCrit(int pos)
{
    return gEkrPairCritPair[pos];
}
