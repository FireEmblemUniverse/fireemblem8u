#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"

/* https://decomp.me/scratch/CnHiW */
#if NONMATCHING
u16 GetBattleAnimationId(struct Unit * unit, const struct BattleAnimDef * anim_def, u16 wpn, u32 * out)
{
    int i, j, ret, idx;
    u16 type;
    u16 wtype;

    idx = 0;

    if (!anim_def)
        return -1;

    if (GetItemType(wpn) == ITYPE_ITEM && !IsItemDisplayedInBattle(wpn))
        return -1;

    if (wpn == 0)
        type = ITYPE_ITEM;
    else
        type = GetItemType(wpn);

    *out = 0;
    ret = 0;
    for (i = 0; i < 2; i++)
    {
        for (j = 0; ; j++)
        {
            wtype = anim_def[j].wtype;
            if (wtype == 0)
                break;

            if (i == 0 && wtype > 0xFF)
                continue;

            if (i == 1 && anim_def[j].wtype < 0x100)
                continue;

            if (anim_def[j].wtype == GetItemIndex(wpn) || (anim_def[j].wtype + 0xFFFFFF00) == type)
            {
                idx = anim_def[j].index;
                *out = j;
                ret = 1;
                break;
            }
        }

        if (ret == 1)
            break;
    }
    return (idx - 1);
}

#else

NAKEDFUNC
u16 GetBattleAnimationId(struct Unit * unit, const struct BattleAnimDef * anim_def, u16 wpn, u32 * out)
{
    asm("\
	.syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0xc\n\
        adds r4, r1, #0\n\
        mov r9, r3\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov r8, r2\n\
        movs r0, #0\n\
        mov sl, r0\n\
        cmp r4, #0\n\
        beq _0805887C\n\
        mov r0, r8\n\
        bl GetItemType\n\
        cmp r0, #9\n\
        bne _08058884\n\
        mov r0, r8\n\
        bl IsItemDisplayedInBattle\n\
        lsls r0, r0, #0x10\n\
        cmp r0, #0\n\
        bne _08058884\n\
    _0805887C:\n\
        ldr r0, _08058880  @ 0x0000FFFF\n\
        b _08058908\n\
        .align 2, 0\n\
    _08058880: .4byte 0x0000FFFF\n\
    _08058884:\n\
        mov r1, r8\n\
        cmp r1, #0\n\
        bne _0805888E\n\
        movs r2, #9\n\
        b _08058898\n\
    _0805888E:\n\
        mov r0, r8\n\
        bl GetItemType\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
    _08058898:\n\
        str r4, [sp]\n\
        movs r0, #0\n\
        mov r3, r9\n\
        str r0, [r3]\n\
        movs r7, #0\n\
        movs r1, #0\n\
    _080588A4:\n\
        ldr r5, [sp]\n\
        movs r6, #0\n\
        b _080588F0\n\
    _080588AA:\n\
        cmp r7, #0\n\
        bne _080588B2\n\
        cmp r0, #0xff\n\
        bhi _080588EC\n\
    _080588B2:\n\
        cmp r7, #1\n\
        bne _080588BC\n\
        ldrh r0, [r5]\n\
        cmp r0, #0xff\n\
        bls _080588EC\n\
    _080588BC:\n\
        ldrh r4, [r5]\n\
        mov r0, r8\n\
        str r1, [sp, #4]\n\
        str r2, [sp, #8]\n\
        bl GetItemIndex\n\
        ldr r1, [sp, #4]\n\
        ldr r2, [sp, #8]\n\
        cmp r4, r0\n\
        beq _080588DA\n\
        ldrh r0, [r5]\n\
        ldr r3, _080588E8  @ 0xFFFFFF00\n\
        adds r0, r0, r3\n\
        cmp r0, r2\n\
        bne _080588EC\n\
    _080588DA:\n\
        ldrh r5, [r5, #2]\n\
        mov sl, r5\n\
        mov r0, r9\n\
        str r6, [r0]\n\
        movs r1, #1\n\
        b _080588F6\n\
        .align 2, 0\n\
    _080588E8: .4byte 0xFFFFFF00\n\
    _080588EC:\n\
        adds r5, #4\n\
        adds r6, #1\n\
    _080588F0:\n\
        ldrh r0, [r5]\n\
        cmp r0, #0\n\
        bne _080588AA\n\
    _080588F6:\n\
        cmp r1, #1\n\
        beq _08058900\n\
        adds r7, #1\n\
        cmp r7, #1\n\
        ble _080588A4\n\
    _08058900:\n\
        mov r0, sl\n\
        subs r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
    _08058908:\n\
        add sp, #0xc\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
	.syntax divided\n\
    ");
}

#endif

#if NONMATCHING
bool sub_8058918(void)
{
    u32 info = gBattleHitArray[0].info;

    info = info & BATTLE_HIT_INFO_FINISHES;
    if (info == 0)
        return false;

    return true;
}
#else

NAKEDFUNC
bool sub_8058918(void)
{
    asm("\
        .syntax unified\n\
        push {lr}\n\
        ldr r0, _08058930  @ gBattleHitArray\n\
        ldr r0, [r0]\n\
        lsls r0, r0, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #2\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        bne _08058934\n\
        movs r0, #0\n\
        b _08058936\n\
        .align 2, 0\n\
    _08058930: .4byte gBattleHitArray\n\
    _08058934:\n\
        movs r0, #1\n\
    _08058936:\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}

#endif

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
