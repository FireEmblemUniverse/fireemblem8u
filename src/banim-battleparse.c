#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "spellassoc.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"
#include "constants/items.h"

static inline s8 _GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    switch (tileset) {
    case 0x01:
        return BanimTerrainGround_Tileset01[terrain];

    case 0x02:
        return BanimTerrainGround_Tileset02[terrain];

    case 0x03:
        return BanimTerrainGround_Tileset03[terrain];

    case 0x04:
        return BanimTerrainGround_Tileset04[terrain];

    case 0x05:
        return BanimTerrainGround_Tileset05[terrain];

    case 0x06:
        return BanimTerrainGround_Tileset06[terrain];

    case 0x07:
        return BanimTerrainGround_Tileset07[terrain];

    case 0x08:
        return BanimTerrainGround_Tileset08[terrain];

    case 0x09:
        return BanimTerrainGround_Tileset09[terrain];

    case 0x0A:
        return BanimTerrainGround_Tileset0A[terrain];

    case 0x0B:
        return BanimTerrainGround_Tileset0B[terrain];

    case 0x0C:
        return BanimTerrainGround_Tileset0C[terrain];

    case 0x0D:
        return BanimTerrainGround_Tileset0D[terrain];

    case 0x0E:
        return BanimTerrainGround_Tileset0E[terrain];

    case 0x0F:
        return BanimTerrainGround_Tileset0F[terrain];

    case 0x10:
        return BanimTerrainGround_Tileset10[terrain];

    case 0x11:
        return BanimTerrainGround_Tileset11[terrain];

    case 0x12:
        return BanimTerrainGround_Tileset12[terrain];

    case 0x13:
        return BanimTerrainGround_Tileset13[terrain];

    case 0x14:
        return BanimTerrainGround_Tileset14[terrain];

    case 0:
    default:
        return BanimTerrainGroundDefault[terrain];
    }
}

int GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    int ret = _GetBanimTerrainGround(terrain, tileset);
    return ret - 1;
}

int GetBanimBackgroundIndex(u16 terrain, u16 tileset)
{
    switch (tileset) {
    case 0x01:
        return gBanimBGLut01[terrain];

    case 0x02:
        return gBanimBGLut02[terrain];

    case 0x03:
        return gBanimBGLut03[terrain];

    case 0x04:
        return gBanimBGLut04[terrain];

    case 0x05:
        return gBanimBGLut05[terrain];

    case 0x06:
        return gBanimBGLut06[terrain];

    case 0x07:
        return gBanimBGLut07[terrain];

    case 0x08:
        return gBanimBGLut08[terrain];

    case 0x09:
        return gBanimBGLut09[terrain];

    case 0x0A:
        return gBanimBGLut0A[terrain];

    case 0x0B:
        return gBanimBGLut0B[terrain];

    case 0x0C:
        return gBanimBGLut0C[terrain];

    case 0x0D:
        return gBanimBGLut0D[terrain];

    case 0x0E:
        return gBanimBGLut0E[terrain];

    case 0x0F:
        return gBanimBGLut0F[terrain];

    case 0x10:
        return gBanimBGLut10[terrain];

    case 0x11:
        return gBanimBGLut11[terrain];

    case 0x12:
        return gBanimBGLut12[terrain];

    case 0x13:
        return gBanimBGLut13[terrain];

    case 0x14:
        return gBanimBGLut14[terrain];

    case 0:
    default:
        return gBanimBGLutDefault[terrain];
    }
}

s16 GetSpellAnimId(u16 jid, u16 weapon)
{
    u16 ret;
    u16 item = GetItemIndex(weapon);
    const struct SpellAssoc * it;
    for (it = gSpellAssocData; it->item != 0xFFFF; it++)
    {
        if (it->item == item)
            break;
    }
    ret = it->efx;
    if (it->efx == 3)
    {
        switch (jid) {
        case CLASS_CAVALIER:
        case CLASS_CAVALIER_F:
            ret = 4;
            break;
    
        case CLASS_SOLDIER:
            ret = 5;
            break;
    
        case CLASS_PALADIN:
            ret = 0x6;
            break;
    
        case CLASS_PALADIN_F:
            ret = 0xD;
            break;
    
        case CLASS_PEGASUS_KNIGHT:
            ret = 0x7;
            break;
    
        case CLASS_FALCON_KNIGHT:
            ret = 0x8;
            break;
    
        case CLASS_WYVERN_RIDER:
        case CLASS_WYVERN_RIDER_F:
            ret = 0x9;
            break;
    
        case CLASS_WYVERN_LORD:
        case CLASS_WYVERN_LORD_F:
            ret = 0xA;
            break;
    
        case CLASS_GENERAL:
        case CLASS_GENERAL_F:
            ret = 0xB;
            break;
    
        default:
            break;
        }
    }
    return ret;
}

void UnsetMapStaffAnim(s16 * out, u16 pos, u16 weapon)
{
    u16 item = GetItemIndex(weapon);
    if (*out == -1)
        *out = 0;

    if (gEkrInitialHitSide == pos)
        return;

    switch (item) {
    case ITEM_STAFF_WARP:
    case ITEM_STAFF_RESCUE:
    case ITEM_STAFF_TORCH:
    case ITEM_STAFF_UNLOCK:
        *out = 0;
    }
}

const u16 gUnknown_080DAE8C[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_HIT_CLOSE,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_HIT_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_HIT_CLOSE
};

const u16 gUnknown_080DAE96[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_MISS_CLOSE,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_MISS_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_MISS_CLOSE
};

const u16 gUnknown_080DAEA0[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_CLOSE,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_CRIT_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_CRIT_CLOSE
};

const u16 gUnknown_080DAEAA[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_TAKING_MISS_CLOSE,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_TAKING_MISS_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_TAKING_MISS_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_TAKING_MISS_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_TAKING_MISS_CLOSE
};

const u16 gUnknown_080DAEB4[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_TAKING_HIT_CLOSE,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_TAKING_HIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_TAKING_HIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_TAKING_HIT_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_TAKING_HIT_CLOSE
};

const u16 gUnknown_080DAEBE[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_HIT_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_HIT_CLOSE
};

const u16 gUnknown_080DAEC8[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_CRIT_CLOSE,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_CRIT_CLOSE
};

const u16 gUnknown_080DAED2[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_HIT_CLOSE,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_HIT_CLOSE,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_HIT_CLOSE,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

const u16 gUnknown_080DAEDC[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

const u16 gUnknown_080DAEE6[EKR_DISTANCE_MAX] = {
    [EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
    [EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
    [EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

#define ANIM_REF_OFFSET(off_ref_round, off_ref_pos) ((off_ref_round) * 2 + off_ref_pos)

void ParseBattleHitToBanimCmd(void)
{
    u32 i;
    struct BattleHit * hit; // r7
    u16 r9;
    u16 r10;
    u16 sp00[2];
    struct BattleUnit * bul_sp04;
    struct BattleUnit * bur_sp08;
    s32 round_sp0C;
    s32 is_enemy;
    s32 distance_sp14;
    s32 distance_sp18;
    s16 distance_sp1C;
    s32 is_dark_breath;

    hit = gBattleHitArray;

    for (i = 0; i < 20; i++)
        gAnimRoundData[i] = 0xFFFF;

    for (i = 0; i < 20; i++)
        gEfxHpLut[2 + i] = 0xFFFF;

    gpEkrTriangleUnits[0] = gpEkrTriangleUnits[1] = NULL;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gAnimRoundData[0] = 4;
        gAnimRoundData[1] = 4;
        return;
    }

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
    {
        gAnimRoundData[0] = 6;
        gAnimRoundData[1] = 0;
        return;
    }

    /* _08058274 */
    distance_sp14 = (u16)gEkrDistanceType;
    distance_sp18 = distance_sp14;

    is_dark_breath = false;

    bul_sp04 = gpEkrBattleUnitLeft;
    bur_sp08 = gpEkrBattleUnitRight;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_SWORD_RUNESWORD && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_SWORD_RUNESWORD && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_AXE_HANDAXE && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_AXE_HANDAXE && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_AXE_TOMAHAWK && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_AXE_TOMAHAWK && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_AXE_HATCHET && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_AXE_HATCHET && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    /* _08058332 */
    gEfxHpLut[0] = gEkrGaugeHp[0];
    gEfxHpLut[1] = gEkrGaugeHp[1];

    round_sp0C = 0;
    r10 = 0;
    r9 = 0;
    for (; !(hit->info & BATTLE_HIT_INFO_END); hit++, round_sp0C++)
    {
        s16 r3;
        s16 distance_r4;
        u16 * r5;
        struct Unit * unit_r6;
        u16 * r8;
        u16 * tmp;

        if (hit->info & BATTLE_HIT_INFO_RETALIATION)
            is_enemy = true;
        else
            is_enemy = false;

        if (gBanimPositionIsEnemy[POS_L] == is_enemy)
        {
            r5 = &sp00[POS_L];
            r8 = &sp00[POS_R];
            distance_r4 = distance_sp14;
            distance_sp1C = distance_sp18;
            unit_r6 = &bul_sp04->unit;
            r3 = is_dark_breath;

            if (round_sp0C == 0)
                gEkrInitialHitSide = POS_L;
        }
        else
        {
            /* _08058398 */
            r5 = &sp00[POS_R];
            r8 = &sp00[POS_L];
            distance_r4 = distance_sp18;
            distance_sp1C = distance_sp14;
            unit_r6 = &bur_sp08->unit;
            r3 = 0;

            if (round_sp0C == 0)
                gEkrInitialHitSide = POS_R;
        }

        /* _080583B4 */
        if (hit->attributes & BATTLE_HIT_ATTR_TATTACK)
        {
            gpEkrTriangleUnits[0] = gBattleStats.taUnitA;
            gpEkrTriangleUnits[1] = gBattleStats.taUnitB;
        }

        /* _080583D0 */
        if (hit->attributes & BATTLE_HIT_ATTR_CRIT)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAEA0[distance_r4];
            else
                *r5 = gUnknown_080DAEC8[distance_r4];
        }
        else if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAEA0[distance_r4];
            else
                *r5 = gUnknown_080DAEC8[distance_r4];
        }
        else if (r3 >= 0)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAE8C[distance_r4];
            else
                *r5 = gUnknown_080DAEBE[distance_r4];
        }
        else
        {
            switch (sub_80716B0(2)) {
            case 0:
                *r5 = gUnknown_080DAED2[distance_r4];
                break;

            case 1:
                *r5 = gUnknown_080DAEDC[distance_r4];
                break;

            case 2:
                *r5 = gUnknown_080DAEE6[distance_r4];
                break;

            default:
                break;
            }
        }

        /* _0805848C */
        if (hit->attributes & BATTLE_HIT_ATTR_MISS)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAE96[distance_r4];
            else
                *r5 = gUnknown_080DAEBE[distance_r4];

            *r8 = gUnknown_080DAEAA[distance_sp1C];
        }
        else
        {
            *r8 = gUnknown_080DAEB4[distance_sp1C];
        }

        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = r8[sp00 - r8 + POS_L];
        tmp = sp00 + POS_R;
        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = *tmp;

        if (!(hit->attributes & BATTLE_HIT_ATTR_MISS))
        {
            s16 new_hp;

            if (hit->attributes & BATTLE_HIT_ATTR_DEVIL)
            {
                if (gBanimPositionIsEnemy[POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;
                    gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_DEVIL; /* r5 */
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;
                    gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_DEVIL; /* r4 */
                }
            }
            /* _080585B4 */
            else if (hit->attributes & BATTLE_HIT_ATTR_HPSTEAL)
            {
                if (gBanimPositionIsEnemy[POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;

                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) + hit->hpChange;
                    if (new_hp > gBanimMaxHP[POS_L])
                        new_hp = gBanimMaxHP[POS_L];

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;

                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) + hit->hpChange;
                    if (new_hp > gBanimMaxHP[POS_R])
                        new_hp = gBanimMaxHP[POS_R];

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;
                }
            }
            /* _080586A0 */
            else
            {
                if (gBanimPositionIsEnemy[POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;

                    if (hit->attributes & BATTLE_HIT_ATTR_POISON)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_POISON;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_SILENCER;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SURESHOT)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_SURE_SHOT;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_PIERCE)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_PIERCE;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_GREATSHLD)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_GREAT_SHIELD;
                    }
                }
                /* _0805876C */
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;

                    if (hit->attributes & BATTLE_HIT_ATTR_POISON)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_POISON;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_SILENCER;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SURESHOT)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_SURE_SHOT;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_PIERCE)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_PIERCE;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_GREATSHLD)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_GREAT_SHIELD;
                    }
                }
            }
        }
    }
}
