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

#if NONMATCHING

void ParseBattleHitToBanimCmd(void)
{
    u16 r0;
    s16 * anim_round;
    u32 i;
    s16 r3;
    s16 new_hp;
    u16 distance;
    u32 distance_r4;
    s16 * anim_round_r4;
    u16 * r5;
    s16 * anim_round_r5;
    struct Unit * unit_r6;
    struct BattleHit * hit = gBattleHitArray;
    u16 * r8, r9, r10;
    u16 sp00[2];
    struct BattleUnit * bul_sp04, * bur_sp08;
    int round_sp0C, ret_sp10;
    u32 distance_sp14, distance_sp18, distance_sp1C;

    for (i = 0; i < 0x14; i++)
        gAnimRoundData[i] = gAnimRoundData[i] | 0xFFFF;

    for (i = 0; i < 0x14; i++)
        gEfxHpLut[2 + i] = gEfxHpLut[2 + i] | 0xFFFF;

    gpEkrTriangleUnits[1] = NULL;
    gpEkrTriangleUnits[0] = NULL;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gAnimRoundData[0] = 4;
        gAnimRoundData[1] = 4;
        return;
    }

    if (gBattleStats.config & 0x40)
    {
        gAnimRoundData[0] = 0x6;
        gAnimRoundData[1] = 0x0;
        return;
    }

    /* _08058274 */
    distance = gEkrDistanceType;
    distance_sp14 = distance;
    distance_sp18 = distance;
    bul_sp04 = gpEkrBattleUnitLeft;
    bur_sp08 = gpEkrBattleUnitRight;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x11 && distance == 0)
        distance_sp14 = 1;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x11 && distance_sp18 == 0)
        distance_sp18 = 1;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x28 && distance_sp14 == 0)
        distance_sp14 = 1;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x28 && distance_sp18 == 0)
        distance_sp18 = 1;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x29 && distance_sp14 == 0)
        distance_sp14 = 1;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x29 && distance_sp18 == 0)
        distance_sp18 = 1;

    if (GetItemIndex(bul_sp04->weaponBefore) == 0x2C && distance_sp14 == 0)
        distance_sp14 = 1;
    if (GetItemIndex(bur_sp08->weaponBefore) == 0x2C && distance_sp18 == 0)
        distance_sp18 = 1;

    /* _08058332 */
    gEfxHpLut[0] = gEkrGaugeHp[0];
    gEfxHpLut[1] = gEkrGaugeHp[1];

    round_sp0C = 0;
    r10 = 0;
    r9 = 0;

    for (; 0 == (hit->info & BATTLE_HIT_INFO_END); hit++, round_sp0C++)
    {
        if (hit->info & BATTLE_HIT_INFO_RETALIATION)
            ret_sp10 = true;
        else
            ret_sp10 = false;

        if (gEkrInitialPosition[POS_L] == ret_sp10)
        {
            r5 = &sp00[POS_L];
            r8 = &sp00[POS_R];
            distance_r4 = distance_sp14;
            distance_sp1C = distance_sp18;
            unit_r6 = &bul_sp04->unit;
            r3 = 0;

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
                *r5 = gUnknown_080DAEA0[(s16)distance_r4];
            else
                *r5 = gUnknown_080DAEC8[(s16)distance_r4];
        }
        else if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAEA0[(s16)distance_r4];
            else
                *r5 = gUnknown_080DAEC8[(s16)distance_r4];
        }
        else if (r3 >= 0)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAE8C[(s16)distance_r4];
            else
                *r5 = gUnknown_080DAEBE[(s16)distance_r4];
        }
        else
        {
            switch (sub_80716B0(2)) {
            case 0:
                *r5 = gUnknown_080DAED2[(s16)distance_r4];
                break;

            case 1:
                *r5 = gUnknown_080DAEDC[(s16)distance_r4];
                break;

            case 2:
                *r5 = gUnknown_080DAEE6[(s16)distance_r4];
                break;

            default:
                break;
            }
        }
        r8++; r8--;
        /* _0805848C */
        if (hit->attributes & BATTLE_HIT_ATTR_MISS)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gUnknown_080DAE96[(s16)distance_r4];
            else
                *r5 = gUnknown_080DAEBE[(s16)distance_r4];

            *r8 = gUnknown_080DAEAA[(s16)distance_sp1C];
        }
        else
        {
            *r8 = gUnknown_080DAEB4[(s16)distance_sp1C];
        }
        /* _080584EC */
#ifndef NONMATCHING
        {
            register u16 * r3 asm("r3");
            anim_round = gAnimRoundData;
            anim_round_r5 = anim_round + round_sp0C * 2;
            r0 = sp00[0];

            asm(""::"r"(unit_r6 = 0));
    
            *anim_round_r5 = r0;
            anim_round_r4 = anim_round + ({round_sp0C * 2 + 1;});
            r3 = sp00;
            *anim_round_r4 = r3[1];
        }
#else
        anim_round = gAnimRoundData;
        anim_round_r5 = anim_round + round_sp0C * 2;
        *anim_round_r5 = sp00[0];
        anim_round_r4 = anim_round + ({round_sp0C * 2 + 1;});
        *anim_round_r4 = sp00[1];
#endif
        if (0 == (hit->attributes & BATTLE_HIT_ATTR_MISS))
        {
            if (hit->attributes & BATTLE_HIT_ATTR_DEVIL)
            {
                if (gEkrInitialPosition[POS_L] == ret_sp10)
                {
                    new_hp = GetEfxHp(r9 * 2) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9 = r9 + 1;
                    gEfxHpLut[r9 * 2] = new_hp;
                    *anim_round_r5 = (u32)*anim_round_r5 | ({0xFFFF8000 + 0;});
                }
                else
                {
                    new_hp = GetEfxHp(r10 * 2 + 1) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10 = r10 + 1;
                    gEfxHpLut[r10 * 2 + 1] = new_hp;
                    *anim_round_r4 = (u32)*anim_round_r4 | ({0xFFFF8000 + 0;});
                }
            }
            /* _080585B4 */
            else if (hit->attributes & BATTLE_HIT_ATTR_HPSTEAL)
            {
                if (gEkrInitialPosition[POS_L] == ret_sp10)
                {
                    new_hp = GetEfxHp(r10 * 2 + 1) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10 = r10 + 1;
                    gEfxHpLut[r10 * 2 + 1] = new_hp;

                    new_hp = GetEfxHp(r9 * 2) + hit->hpChange;
                    if (new_hp > gBanimMaxHP[POS_L])
                        new_hp = gBanimMaxHP[POS_L];

                    r9 = r9 + 1;
                    gEfxHpLut[r9 * 2] = new_hp;
                }
                else
                {
                    new_hp = GetEfxHp(r9 * 2) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9 = r9 + 1;
                    gEfxHpLut[r9 * 2] = new_hp;

                    new_hp = GetEfxHp(r10 * 2 + 1) + hit->hpChange;
                    if (new_hp > gBanimMaxHP[POS_R])
                        new_hp = gBanimMaxHP[POS_R];

                    r10 = r10 + 1;
                    gEfxHpLut[r10 * 2 + 1] = new_hp;
                }
            }
            /* _080586A0 */
            else
            {
                if (gEkrInitialPosition[POS_L] == ret_sp10)
                {
                    new_hp = GetEfxHp(r10 * 2 + 1) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10 = r10 + 1;
                    gEfxHpLut[r10 * 2 + 1] = new_hp;

                    if (hit->attributes & 0x40)
                        *anim_round_r4 |= 0x2000;

                    if (hit->attributes & 0x800)
                        *anim_round_r5 |= 0x1000;

                    if (hit->attributes & 0x4000)
                        *anim_round_r5 |= 0x800;

                    if (hit->attributes & 0x10000)
                        *anim_round_r5 |= 0x200;

                    if (hit->attributes & 0x8000)
                        *anim_round_r5 |= 0x400;
                }
                /* _0805876C */
                else
                {
                    new_hp = GetEfxHp(r9 * 2) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9 = r9 + 1;
                    gEfxHpLut[r9 * 2] = new_hp;

                    if (hit->attributes & 0x40)
                        *anim_round_r5 |= 0x2000;

                    if (hit->attributes & 0x800)
                        *anim_round_r4 |= 0x1000;

                    if (hit->attributes & 0x4000)
                        *anim_round_r4 |= 0x800;

                    if (hit->attributes & 0x10000)
                        *anim_round_r4 |= 0x200;

                    if (hit->attributes & 0x8000)
                        *anim_round_r4 |= 0x400;
                }
            }
        }
    }
}

#else

NAKEDFUNC
void ParseBattleHitToBanimCmd(void)
{
    asm("\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x20\n\
        ldr r7, _08058244  @ gBattleHitArray\n\
        movs r2, #0\n\
        ldr r4, _08058248  @ gAnimRoundData\n\
        ldr r5, _0805824C  @ gpEkrTriangleUnits\n\
        ldr r6, _08058250  @ gEkrDistanceType\n\
        ldr r0, _08058254  @ 0x0000FFFF\n\
        adds r3, r0, #0\n\
        adds r1, r4, #0\n\
    _08058208:\n\
        ldrh r0, [r1]\n\
        orrs r0, r3\n\
        strh r0, [r1]\n\
        adds r1, #2\n\
        adds r2, #1\n\
        cmp r2, #0x13\n\
        bls _08058208\n\
        movs r2, #0\n\
        ldr r0, _08058258  @ gEfxHpLut\n\
        ldr r1, _08058254  @ 0x0000FFFF\n\
        adds r3, r1, #0\n\
        adds r1, r0, #4\n\
    _08058220:\n\
        ldrh r0, [r1]\n\
        orrs r0, r3\n\
        strh r0, [r1]\n\
        adds r1, #2\n\
        adds r2, #1\n\
        cmp r2, #0x13\n\
        bls _08058220\n\
        movs r2, #0\n\
        str r2, [r5, #4]\n\
        str r2, [r5]\n\
        movs r3, #0\n\
        ldrsh r0, [r6, r3]\n\
        cmp r0, #4\n\
        bne _0805825C\n\
        strh r0, [r4]\n\
        strh r0, [r4, #2]\n\
        b _08058834\n\
        .align 2, 0\n\
    _08058244: .4byte gBattleHitArray\n\
    _08058248: .4byte gAnimRoundData\n\
    _0805824C: .4byte gpEkrTriangleUnits\n\
    _08058250: .4byte gEkrDistanceType\n\
    _08058254: .4byte 0x0000FFFF\n\
    _08058258: .4byte gEfxHpLut\n\
    _0805825C:\n\
        ldr r0, _08058270  @ gBattleStats\n\
        ldrh r1, [r0]\n\
        movs r0, #0x40\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08058274\n\
        movs r0, #6\n\
        strh r0, [r4]\n\
        strh r2, [r4, #2]\n\
        b _08058834\n\
        .align 2, 0\n\
    _08058270: .4byte gBattleStats\n\
    _08058274:\n\
        ldrh r6, [r6]\n\
        str r6, [sp, #0x14]\n\
        str r6, [sp, #0x18]\n\
        ldr r0, _08058348  @ gpEkrBattleUnitLeft\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        ldr r0, _0805834C  @ gpEkrBattleUnitRight\n\
        ldr r0, [r0]\n\
        str r0, [sp, #8]\n\
        ldr r0, [sp, #4]\n\
        adds r0, #0x4a\n\
        ldrh r0, [r0]\n\
        bl GetItemIndex\n\
        cmp r0, #0x11\n\
        bne _0805829C\n\
        cmp r6, #0\n\
        bne _0805829C\n\
        movs r5, #1\n\
        str r5, [sp, #0x14]\n\
    _0805829C:\n\
        ldr r4, [sp, #8]\n\
        adds r4, #0x4a\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        adds r5, r4, #0\n\
        cmp r0, #0x11\n\
        bne _080582B6\n\
        ldr r0, [sp, #0x18]\n\
        cmp r0, #0\n\
        bne _080582B6\n\
        movs r1, #1\n\
        str r1, [sp, #0x18]\n\
    _080582B6:\n\
        ldr r4, [sp, #4]\n\
        adds r4, #0x4a\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x28\n\
        bne _080582CE\n\
        ldr r2, [sp, #0x14]\n\
        cmp r2, #0\n\
        bne _080582CE\n\
        movs r3, #1\n\
        str r3, [sp, #0x14]\n\
    _080582CE:\n\
        ldrh r0, [r5]\n\
        bl GetItemIndex\n\
        cmp r0, #0x28\n\
        bne _080582E2\n\
        ldr r0, [sp, #0x18]\n\
        cmp r0, #0\n\
        bne _080582E2\n\
        movs r1, #1\n\
        str r1, [sp, #0x18]\n\
    _080582E2:\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x29\n\
        bne _080582F6\n\
        ldr r2, [sp, #0x14]\n\
        cmp r2, #0\n\
        bne _080582F6\n\
        movs r3, #1\n\
        str r3, [sp, #0x14]\n\
    _080582F6:\n\
        ldrh r0, [r5]\n\
        bl GetItemIndex\n\
        cmp r0, #0x29\n\
        bne _0805830A\n\
        ldr r0, [sp, #0x18]\n\
        cmp r0, #0\n\
        bne _0805830A\n\
        movs r1, #1\n\
        str r1, [sp, #0x18]\n\
    _0805830A:\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x2c\n\
        bne _0805831E\n\
        ldr r2, [sp, #0x14]\n\
        cmp r2, #0\n\
        bne _0805831E\n\
        movs r3, #1\n\
        str r3, [sp, #0x14]\n\
    _0805831E:\n\
        ldrh r0, [r5]\n\
        bl GetItemIndex\n\
        cmp r0, #0x2c\n\
        bne _08058332\n\
        ldr r5, [sp, #0x18]\n\
        cmp r5, #0\n\
        bne _08058332\n\
        movs r0, #1\n\
        str r0, [sp, #0x18]\n\
    _08058332:\n\
        ldr r3, _08058350  @ gEfxHpLut\n\
        ldr r1, _08058354  @ gEkrGaugeHp\n\
        ldrh r0, [r1]\n\
        strh r0, [r3]\n\
        ldrh r0, [r1, #2]\n\
        strh r0, [r3, #2]\n\
        movs r1, #0\n\
        str r1, [sp, #0xc]\n\
        mov sl, r1\n\
        mov r9, r1\n\
        b _08058824\n\
        .align 2, 0\n\
    _08058348: .4byte gpEkrBattleUnitLeft\n\
    _0805834C: .4byte gpEkrBattleUnitRight\n\
    _08058350: .4byte gEfxHpLut\n\
    _08058354: .4byte gEkrGaugeHp\n\
    _08058358:\n\
        lsls r0, r2, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #8\n\
        ands r0, r1\n\
        negs r0, r0\n\
        lsrs r0, r0, #0x1f\n\
        str r0, [sp, #0x10]\n\
        ldr r0, _08058390  @ gEkrInitialPosition\n\
        movs r2, #0\n\
        ldrsh r0, [r0, r2]\n\
        ldr r3, [sp, #0x10]\n\
        cmp r0, r3\n\
        bne _08058398\n\
        mov r5, sp\n\
        movs r0, #2\n\
        add r0, sp\n\
        mov r8, r0\n\
        ldr r4, [sp, #0x14]\n\
        ldr r1, [sp, #0x18]\n\
        str r1, [sp, #0x1c]\n\
        ldr r6, [sp, #4]\n\
        movs r3, #0\n\
        ldr r2, [sp, #0xc]\n\
        cmp r2, #0\n\
        bne _080583B4\n\
        ldr r0, _08058394  @ gEkrInitialHitSide\n\
        strh r2, [r0]\n\
        b _080583B4\n\
        .align 2, 0\n\
    _08058390: .4byte gEkrInitialPosition\n\
    _08058394: .4byte gEkrInitialHitSide\n\
    _08058398:\n\
        mov r5, sp\n\
        adds r5, #2\n\
        mov r8, sp\n\
        ldr r4, [sp, #0x18]\n\
        ldr r3, [sp, #0x14]\n\
        str r3, [sp, #0x1c]\n\
        ldr r6, [sp, #8]\n\
        movs r3, #0\n\
        ldr r0, [sp, #0xc]\n\
        cmp r0, #0\n\
        bne _080583B4\n\
        ldr r1, _080583F0  @ gEkrInitialHitSide\n\
        movs r0, #1\n\
        strh r0, [r1]\n\
    _080583B4:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080583D0\n\
        ldr r2, _080583F4  @ gpEkrTriangleUnits\n\
        ldr r1, _080583F8  @ gBattleStats\n\
        ldr r0, [r1, #0x10]\n\
        str r0, [r2]\n\
        ldr r0, [r1, #0x14]\n\
        str r0, [r2, #4]\n\
    _080583D0:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r1, r0, #0xd\n\
        movs r0, #1\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08058408\n\
        adds r0, r6, #0\n\
        bl UnitHasMagicRank\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        bne _08058400\n\
        ldr r0, _080583FC  @ gUnknown_080DAEA0\n\
        b _08058482\n\
        .align 2, 0\n\
    _080583F0: .4byte gEkrInitialHitSide\n\
    _080583F4: .4byte gpEkrTriangleUnits\n\
    _080583F8: .4byte gBattleStats\n\
    _080583FC: .4byte gUnknown_080DAEA0\n\
    _08058400:\n\
        ldr r0, _08058404  @ gUnknown_080DAEC8\n\
        b _08058482\n\
        .align 2, 0\n\
    _08058404: .4byte gUnknown_080DAEC8\n\
    _08058408:\n\
        movs r0, #0x80\n\
        lsls r0, r0, #4\n\
        ands r1, r0\n\
        cmp r1, #0\n\
        beq _08058430\n\
        adds r0, r6, #0\n\
        bl UnitHasMagicRank\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        bne _08058428\n\
        ldr r0, _08058424  @ gUnknown_080DAEA0\n\
        b _08058482\n\
        .align 2, 0\n\
    _08058424: .4byte gUnknown_080DAEA0\n\
    _08058428:\n\
        ldr r0, _0805842C  @ gUnknown_080DAEC8\n\
        b _08058482\n\
        .align 2, 0\n\
    _0805842C: .4byte gUnknown_080DAEC8\n\
    _08058430:\n\
        lsls r0, r3, #0x10\n\
        cmp r0, #0\n\
        blt _08058454\n\
        adds r0, r6, #0\n\
        bl UnitHasMagicRank\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        bne _0805844C\n\
        ldr r0, _08058448  @ gUnknown_080DAE8C\n\
        b _08058482\n\
        .align 2, 0\n\
    _08058448: .4byte gUnknown_080DAE8C\n\
    _0805844C:\n\
        ldr r0, _08058450  @ gUnknown_080DAEBE\n\
        b _08058482\n\
        .align 2, 0\n\
    _08058450: .4byte gUnknown_080DAEBE\n\
    _08058454:\n\
        movs r0, #2\n\
        bl sub_80716B0\n\
        cmp r0, #1\n\
        beq _08058478\n\
        cmp r0, #1\n\
        bgt _08058468\n\
        cmp r0, #0\n\
        beq _0805846E\n\
        b _0805848C\n\
    _08058468:\n\
        cmp r0, #2\n\
        beq _08058480\n\
        b _0805848C\n\
    _0805846E:\n\
        ldr r0, _08058474  @ gUnknown_080DAED2\n\
        b _08058482\n\
        .align 2, 0\n\
    _08058474: .4byte gUnknown_080DAED2\n\
    _08058478:\n\
        ldr r0, _0805847C  @ gUnknown_080DAEDC\n\
        b _08058482\n\
        .align 2, 0\n\
    _0805847C: .4byte gUnknown_080DAEDC\n\
    _08058480:\n\
        ldr r0, _080584AC  @ gUnknown_080DAEE6\n\
    _08058482:\n\
        lsls r1, r4, #0x10\n\
        asrs r1, r1, #0xf\n\
        adds r1, r1, r0\n\
        ldrh r0, [r1]\n\
        strh r0, [r5]\n\
    _0805848C:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #2\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080584DC\n\
        adds r0, r6, #0\n\
        bl UnitHasMagicRank\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        bne _080584B4\n\
        ldr r0, _080584B0  @ gUnknown_080DAE96\n\
        b _080584B6\n\
        .align 2, 0\n\
    _080584AC: .4byte gUnknown_080DAEE6\n\
    _080584B0: .4byte gUnknown_080DAE96\n\
    _080584B4:\n\
        ldr r0, _080584D4  @ gUnknown_080DAEBE\n\
    _080584B6:\n\
        lsls r1, r4, #0x10\n\
        asrs r1, r1, #0xf\n\
        adds r1, r1, r0\n\
        ldrh r0, [r1]\n\
        strh r0, [r5]\n\
        ldr r0, _080584D8  @ gUnknown_080DAEAA\n\
        ldr r2, [sp, #0x1c]\n\
        lsls r1, r2, #0x10\n\
        asrs r1, r1, #0xf\n\
        adds r1, r1, r0\n\
        ldrh r0, [r1]\n\
        mov r3, r8\n\
        strh r0, [r3]\n\
        b _080584EC\n\
        .align 2, 0\n\
    _080584D4: .4byte gUnknown_080DAEBE\n\
    _080584D8: .4byte gUnknown_080DAEAA\n\
    _080584DC:\n\
        ldr r0, _08058560  @ gUnknown_080DAEB4\n\
        ldr r5, [sp, #0x1c]\n\
        lsls r1, r5, #0x10\n\
        asrs r1, r1, #0xf\n\
        adds r1, r1, r0\n\
        ldrh r0, [r1]\n\
        mov r1, r8\n\
        strh r0, [r1]\n\
    _080584EC:\n\
        ldr r1, _08058564  @ gAnimRoundData\n\
        ldr r2, [sp, #0xc]\n\
        lsls r0, r2, #2\n\
        adds r5, r0, r1\n\
        mov r0, sp\n\
        ldrh r0, [r0]\n\
        movs r6, #0\n\
        strh r0, [r5]\n\
        lsls r0, r2, #1\n\
        adds r0, #1\n\
        lsls r0, r0, #1\n\
        adds r4, r0, r1\n\
        mov r3, sp\n\
        ldrh r0, [r3, #2]\n\
        strh r0, [r4]\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r1, r0, #0xd\n\
        movs r0, #2\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0805851A\n\
        b _0805881C\n\
    _0805851A:\n\
        movs r0, #0x80\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080585B4\n\
        ldr r0, _08058568  @ gEkrInitialPosition\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        ldr r2, [sp, #0x10]\n\
        cmp r0, r2\n\
        bne _08058574\n\
        mov r3, r9\n\
        lsls r0, r3, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        cmp r0, #0\n\
        bge _08058546\n\
        movs r2, #0\n\
    _08058546:\n\
        mov r0, r9\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r9, r0\n\
        lsls r0, r0, #2\n\
        ldr r1, _0805856C  @ gEfxHpLut\n\
        adds r0, r0, r1\n\
        strh r2, [r0]\n\
        ldrh r0, [r5]\n\
        ldr r2, _08058570  @ 0xFFFF8000\n\
        adds r1, r2, #0\n\
        b _0805875E\n\
        .align 2, 0\n\
    _08058560: .4byte gUnknown_080DAEB4\n\
    _08058564: .4byte gAnimRoundData\n\
    _08058568: .4byte gEkrInitialPosition\n\
    _0805856C: .4byte gEfxHpLut\n\
    _08058570: .4byte 0xFFFF8000\n\
    _08058574:\n\
        mov r3, sl\n\
        lsls r0, r3, #1\n\
        adds r0, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        cmp r0, #0\n\
        bge _0805858E\n\
        movs r2, #0\n\
    _0805858E:\n\
        mov r0, sl\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov sl, r0\n\
        lsls r0, r0, #1\n\
        adds r0, #1\n\
        lsls r0, r0, #1\n\
        ldr r5, _080585AC  @ gEfxHpLut\n\
        adds r0, r0, r5\n\
        strh r2, [r0]\n\
        ldrh r0, [r4]\n\
        ldr r2, _080585B0  @ 0xFFFF8000\n\
        b _08058816\n\
        .align 2, 0\n\
    _080585AC: .4byte gEfxHpLut\n\
    _080585B0: .4byte 0xFFFF8000\n\
    _080585B4:\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        ands r1, r0\n\
        cmp r1, #0\n\
        beq _080586A0\n\
        ldr r0, _08058628  @ gEkrInitialPosition\n\
        movs r3, #0\n\
        ldrsh r0, [r0, r3]\n\
        ldr r5, [sp, #0x10]\n\
        cmp r0, r5\n\
        bne _08058634\n\
        mov r1, sl\n\
        lsls r0, r1, #1\n\
        adds r0, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        cmp r0, #0\n\
        bge _080585E4\n\
        movs r2, #0\n\
    _080585E4:\n\
        mov r0, sl\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov sl, r0\n\
        ldr r4, _0805862C  @ gEfxHpLut\n\
        lsls r0, r0, #1\n\
        adds r0, #1\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r4\n\
        strh r2, [r0]\n\
        mov r2, r9\n\
        lsls r0, r2, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        ldr r3, _08058630  @ gBanimMaxHP\n\
        lsrs r2, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        movs r5, #0\n\
        ldrsh r1, [r3, r5]\n\
        cmp r0, r1\n\
        ble _0805861A\n\
        ldrh r2, [r3]\n\
    _0805861A:\n\
        mov r0, r9\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r9, r0\n\
        lsls r0, r0, #2\n\
        b _08058690\n\
        .align 2, 0\n\
    _08058628: .4byte gEkrInitialPosition\n\
    _0805862C: .4byte gEfxHpLut\n\
    _08058630: .4byte gBanimMaxHP\n\
    _08058634:\n\
        mov r1, r9\n\
        lsls r0, r1, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        cmp r0, #0\n\
        bge _0805864C\n\
        movs r2, #0\n\
    _0805864C:\n\
        mov r0, r9\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r9, r0\n\
        ldr r4, _08058698  @ gEfxHpLut\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r4\n\
        strh r2, [r0]\n\
        mov r2, sl\n\
        lsls r0, r2, #1\n\
        adds r0, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        ldr r3, _0805869C  @ gBanimMaxHP\n\
        lsrs r2, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        movs r5, #2\n\
        ldrsh r1, [r3, r5]\n\
        cmp r0, r1\n\
        ble _08058680\n\
        ldrh r2, [r3, #2]\n\
    _08058680:\n\
        mov r0, sl\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov sl, r0\n\
        lsls r0, r0, #1\n\
        adds r0, #1\n\
        lsls r0, r0, #1\n\
    _08058690:\n\
        adds r0, r0, r4\n\
        strh r2, [r0]\n\
        b _0805881C\n\
        .align 2, 0\n\
    _08058698: .4byte gEfxHpLut\n\
    _0805869C: .4byte gBanimMaxHP\n\
    _080586A0:\n\
        ldr r0, _08058764  @ gEkrInitialPosition\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        ldr r2, [sp, #0x10]\n\
        cmp r0, r2\n\
        bne _0805876C\n\
        mov r3, sl\n\
        lsls r0, r3, #1\n\
        adds r0, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        cmp r0, #0\n\
        bge _080586C6\n\
        movs r2, #0\n\
    _080586C6:\n\
        mov r0, sl\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov sl, r0\n\
        lsls r0, r0, #1\n\
        adds r0, #1\n\
        lsls r0, r0, #1\n\
        ldr r1, _08058768  @ gEfxHpLut\n\
        adds r0, r0, r1\n\
        strh r2, [r0]\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x40\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080586F6\n\
        ldrh r0, [r4]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #6\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4]\n\
    _080586F6:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        ands r0, r2\n\
        cmp r0, #0\n\
        beq _08058712\n\
        ldrh r0, [r5]\n\
        movs r3, #0x80\n\
        lsls r3, r3, #5\n\
        adds r1, r3, #0\n\
        orrs r0, r1\n\
        strh r0, [r5]\n\
    _08058712:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #7\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0805872A\n\
        ldrh r1, [r5]\n\
        adds r0, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r5]\n\
    _0805872A:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #9\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08058746\n\
        ldrh r0, [r5]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #2\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r5]\n\
    _08058746:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #8\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0805881C\n\
        ldrh r0, [r5]\n\
        movs r3, #0x80\n\
        lsls r3, r3, #3\n\
        adds r1, r3, #0\n\
    _0805875E:\n\
        orrs r0, r1\n\
        strh r0, [r5]\n\
        b _0805881C\n\
        .align 2, 0\n\
    _08058764: .4byte gEkrInitialPosition\n\
    _08058768: .4byte gEfxHpLut\n\
    _0805876C:\n\
        mov r1, r9\n\
        lsls r0, r1, #1\n\
        bl GetEfxHp\n\
        movs r1, #3\n\
        ldrsb r1, [r7, r1]\n\
        subs r0, r0, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        cmp r0, #0\n\
        bge _08058784\n\
        movs r2, #0\n\
    _08058784:\n\
        mov r0, r9\n\
        adds r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r9, r0\n\
        lsls r0, r0, #2\n\
        ldr r3, _08058844  @ gEfxHpLut\n\
        adds r0, r0, r3\n\
        strh r2, [r0]\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x40\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080587B0\n\
        ldrh r0, [r5]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #6\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r5]\n\
    _080587B0:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        ands r0, r2\n\
        cmp r0, #0\n\
        beq _080587CC\n\
        ldrh r0, [r4]\n\
        movs r3, #0x80\n\
        lsls r3, r3, #5\n\
        adds r1, r3, #0\n\
        orrs r0, r1\n\
        strh r0, [r4]\n\
    _080587CC:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #7\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080587E4\n\
        ldrh r1, [r4]\n\
        adds r0, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4]\n\
    _080587E4:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #9\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _08058800\n\
        ldrh r0, [r4]\n\
        movs r5, #0x80\n\
        lsls r5, r5, #2\n\
        adds r1, r5, #0\n\
        orrs r0, r1\n\
        strh r0, [r4]\n\
    _08058800:\n\
        ldr r0, [r7]\n\
        lsls r0, r0, #0xd\n\
        lsrs r0, r0, #0xd\n\
        movs r1, #0x80\n\
        lsls r1, r1, #8\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0805881C\n\
        ldrh r0, [r4]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #3\n\
    _08058816:\n\
        adds r1, r2, #0\n\
        orrs r0, r1\n\
        strh r0, [r4]\n\
    _0805881C:\n\
        adds r7, #4\n\
        ldr r3, [sp, #0xc]\n\
        adds r3, #1\n\
        str r3, [sp, #0xc]\n\
    _08058824:\n\
        ldr r2, [r7]\n\
        lsls r0, r2, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #0x10\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        bne _08058834\n\
        b _08058358\n\
    _08058834:\n\
        add sp, #0x20\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08058844: .4byte gEfxHpLut\n\
        .syntax divided\n\
    ");

}
#endif
