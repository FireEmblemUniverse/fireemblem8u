#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

u16 GetBattleAnimationId(struct Unit * unit, const struct BattleAnimDef * anim_def, u16 wpn, u32 * out)
{
    int i, j, ret;
    u16 type;
    int idx;
    const struct BattleAnimDef * sp00, * src;

    idx = 0;

    if (!anim_def)
        return -1;

    if (GetItemType(wpn) == ITYPE_ITEM && !IsItemDisplayedInBattle(wpn))
        return -1;

    if (wpn == 0)
        type = ITYPE_ITEM;
    else
        type = GetItemType(wpn);
    sp00 = anim_def;
    *out = 0;
    for (i = 0, ret = 0; i < 2; i++)
    {
        src = sp00;
        for (j = 0; src->wtype; j++)
        {
            if ((i || src->wtype < 0x100)
                && (i != 1 || src->wtype >= 0x100)
                && (src->wtype == GetItemIndex(wpn) || (src->wtype - 0x100) == type))
            {
                idx = src->index;
                *out = j;
                ret = 1;
                break;
            }
            src++;
        }

        if (ret == 1)
            break;
    }

    return (idx - 1);
}

bool sub_8058918(void)
{
    const struct BattleHit *bh = &gBattleHitArray[0];
    if (bh->info & BATTLE_HIT_INFO_FINISHES)
        return true;
    else
        return false;
}

struct UnkStruct1_sub_805893C {
    u8 _pad_[0x23];
    u8 unk23[5];
    u32 unk28;
};

struct UnkStruct2_sub_805893C {
    struct UnkStruct1_sub_805893C * unk1;
    struct UnkStruct1_sub_805893C * unk2;
};

int sub_805893C(struct UnkStruct2_sub_805893C * arg)
{
    u32 val;
    u32 val1;
    u16 * buf = gUnknown_030018F0;
    val = ((arg->unk1->unk28 | arg->unk2->unk28) >> 0x8) & 0x1;
    *buf = val = arg->unk1->unk23[val];
    return val - 1;
}

u16 * SomethingFilterBattleAnimId(s16 index, u16 item)
{
    switch (index)
    {
    case 0x9E:
    case 0xC9:
    case 0xCA:
    case 0xCB:
        switch (GetItemIndex(item))
        {
        case ITEM_BALLISTA_REGULAR:
            return gUnknown_085BA300;

        case ITEM_BALLISTA_LONG:
            return gUnknown_085BA2E0;

        case ITEM_BALLISTA_KILLER:
            return gUnknown_085BA320;

        default:
            return NULL;
        }
        break;

    default:
        return NULL;
    }
}

int GetAllegienceId(u32 arg)
{
    u8 _arg = arg;
    switch (_arg)
    {
    /*  ? */
    case FACTION_RED:
        return FACTION_ID_GREEN;

    /* ? */
    case FACTION_GREEN:
        return FACTION_ID_RED;

    case FACTION_PURPLE:
        return FACTION_ID_PURPLE;

    case FACTION_BLUE:
        return FACTION_ID_BLUE;
    }

    return FACTION_ID_BLUE;
}

void EkrPrepareBanimfx(struct Anim * anim, u16 index)
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
    s16 * buf = (s16 *)gEfxHpLut;
    return buf[index] & (-0x100);
}

u16 IsItemDisplayedInBattle(u16 item)
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
