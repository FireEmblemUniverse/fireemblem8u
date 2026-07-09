/**
 * Some unused functions and seems cropped.
 * maybe for debug and the source code is not compiled after test.
 */

#include "global.h"
#include "variables.h"
#include "functions.h"

#include "hardware.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "player_interface.h"
#include "bmtrick.h"
#include "bmreliance.h"
#include "scene.h"

struct Struct089ED67C {
    /* 00 */ u8 _pad00[0x0C];
    /* 0C */ s8 (*func)();
    /* 10 */ u8 _pad10[0x18 - 0x10];
};

CONST_DATA struct Struct089ED67C gUidebug_0[] = { 0 };
CONST_DATA struct Struct089ED67C gUidebug_1[] = { 0 };
CONST_DATA struct Struct089ED67C gUidebug_2[] = {
    {0},
    {0},
    {0},
    {0},
};

u8 Uidebug_PickRandomActiveCond0()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUidebug_0[i].func; i++, val++) {
        if (1 == gUidebug_0[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;
    
    return buf[(GetGameClock() % 0x40) % loc];
}

u8 Uidebug_PickRandomActiveCond1()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUidebug_1[i].func; i++, val++) {
        if (1 == gUidebug_1[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;
    
    return buf[(GetGameClock() % 0x40) % loc];
}

u8 Uidebug_PickRandomActiveCond2()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUidebug_2[i].func; i++, val++) {
        if (1 == gUidebug_2[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;

    return buf[(GetGameClock() % 0x40) % loc];
}

u8 Uidebug_GetClockCyclingIndex()
{
    int i, val = 0;
    for (i = 0; gUidebug_2[i].func; i++, val++);

    return (GetGameClock() % 0x10) % val;
}

u8 Uidebug_GetClockCyclingIndexHalf()
{
    int i, val = 0;
    for (i = 0; gUidebug_2[i].func; i++, val++);

    return ((GetGameClock() / 2) % 0x10) % val;
}

u8 Uidebug_GetClockCyclingIndexQuarter()
{
    int i, val = 0;
    for (i = 0; gUidebug_2[i].func; i++, val++);

    return ((GetGameClock() / 4) % 0x10) % val;
}

int Uidebug_ScanUnitsCond2RetFalse()
{
    int i, ret = 0;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);

    if (2 == ret)
        return 1;
    else
        return 0;
}

int Uidebug_ScanUnitsRetZero()
{
    int i;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);
    
    return 0;
}

int Uidebug_ConstTrue() {return 1;}
int Uidebug_ConstFalse03() {return 0;}
int Uidebug_ConstFalse04() {return 0;}
int Uidebug_ConstFalse05() {return 0;}
int Uidebug_ConstFalse06() {return 0;}
int Uidebug_ConstFalse07() {return 0;}
int Uidebug_ConstFalse08() {return 0;}
int Uidebug_ConstFalse09() {return 0;}
int Uidebug_ConstFalse10() {return 0;}
int Uidebug_ConstFalse11() {return 0;}
int Uidebug_ConstFalse12() {return 0;}
int Uidebug_ConstFalse13() {return 0;}
int Uidebug_ConstFalse14() {return 0;}
int Uidebug_ConstFalse_03() {return 0;}
int Uidebug_ConstFalse_04() {return 0;}
int Uidebug_ConstFalse_05() {return 0;}
int Uidebug_ConstFalse_06() {return 0;}
int Uidebug_ConstFalse_07() {return 0;}
int Uidebug_ConstFalse_08() {return 0;}
int Uidebug_ConstFalse_09() {return 0;}
int Uidebug_ConstFalse_10() {return 0;}
int Uidebug_ConstFalse_11() {return 0;}
int Uidebug_ConstFalse_12() {return 0;}

void Debug_PromoteUnit0x100()
{
    EndPlayerPhaseSideWindows();
    ExecUnitDefaultPromotionAndHide(GetUnitFromCharId(0x100), 0);
}

int Uidebug_ScanAllUnitsRetZero()
{
    int i;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);
    
    return 0;
}

void Debug_RemoveAllLightRunes()
{
    struct Trap *cur;
    
    for (cur = GetTrap(0); TRAP_NONE != cur->type; cur++)
        if (TRAP_LIGHT_RUNE == cur->type) {
            RemoveLightRune(cur);
            cur--;
        }
}

void Debug_SoftReset()
{
    SoftReset(0xFE);
}

int Debug_CondAButtonNotPressed()
{
    if (A_BUTTON & gKeyStatusPtr->newKeys)
        return 0;
    else
        return 1;
}

void Debug_SoftReset2()
{
    SoftReset(0xFE);
}

int Debug_CondAButtonPressed()
{
    if (A_BUTTON & gKeyStatusPtr->newKeys)
        return 1;
    else
        return 0;
}

void Debug_RefreshMapFog()
{
    UpdateMapViewWithFog(0);
}

void Debug_AddGold()
{
    SetPartyGoldAmount(GetPartyGoldAmount() + 5000);
}

void Debug_SubtractPartyGold(int sub_val)
{
    if ((int)GetPartyGoldAmount() < sub_val)
        return;

    SetPartyGoldAmount(GetPartyGoldAmount() - sub_val);
}

void Debug_DecrementUnitStats(struct Unit *unit)
{
    if (unit->maxHP > 0)
        unit->maxHP -= 1;
    
    if (unit->pow > 0)
        unit->pow -= 1;
    
    if (unit->skl > 0)
        unit->skl -= 1;

    if (unit->spd > 0)
        unit->spd -= 1;

    if (unit->def > 0)
        unit->def -= 1;

    if (unit->res > 0)
        unit->res -= 1;

    if (unit->lck > 0)
        unit->lck -= 1;
}

void Debug_DecrementCharStatsByPid(u8 pid)
{
    Debug_DecrementUnitStats(GetUnitFromCharId(pid));
}

s8 IsCharDeployedPlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    const struct CharacterData *chara;

    for (i = 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (NULL == unit)
            continue;
        
        chara = unit->pCharacterData;
        if (NULL == chara)
            continue;

        if (0 == ((US_BIT16 | US_NOT_DEPLOYED | US_DEAD) & unit->state))
            if (chara->number == pid)
                return 1;
    }

    return 0;
}

s8 IsChar0DeployedPlayerUnit() {return IsCharDeployedPlayerUnit(0);}
s8 IsChar0DeployedPlayerUnit_Alt() {return IsCharDeployedPlayerUnit(0);}

s8 IsCharAlivePlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    const struct CharacterData *chara;

    for (i = 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (NULL == unit)
            continue;
        
        chara = unit->pCharacterData;
        if (NULL == chara)
            continue;

        if (0 == ((US_DEAD) & unit->state))
            if (chara->number == pid)
                return 1;
    }

    return 0;
}

s8 IsChar0AlivePlayerUnit() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_02() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_03() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_04() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_05() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_06() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_07() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_08() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_09() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_10() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_11() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_12() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_13() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_14() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_15() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_16() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_17() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_18() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_19() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_20() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_21() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_22() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_23() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_24() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_25() {return IsCharAlivePlayerUnit(0);}
s8 IsChar0AlivePlayerUnit_26() {return IsCharAlivePlayerUnit(0);}

s8 DoesCharExistAsPlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    const struct CharacterData *chara;

    for (i = 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (NULL == unit)
            continue;
        
        chara = unit->pCharacterData;
        if (NULL == chara)
            continue;

        if (chara->number == pid)
            return 1;
    }

    return 0;
}

s8 DoesChar0ExistAsPlayerUnit() {return DoesCharExistAsPlayerUnit(0);}
s8 DoesChar0ExistAsPlayerUnit_02() {return DoesCharExistAsPlayerUnit(0);}
s8 DoesChar0ExistAsPlayerUnit_03() {return DoesCharExistAsPlayerUnit(0);}

int AreAnyEnemyUnitDead(void)
{
    int i;
    struct Unit *unit;
    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_DEAD & unit->state))
                return 1;
        }
    }
    return 0;
}

u16 GetDeadEnemyAmount()
{
    int i;
    u16 ret = 0;
    struct Unit *unit;
    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_DEAD & unit->state))
                ret++;
        }
    }
    return ret;
}

int AreAllEnemyUnitsDead()
{
    int dead = AreAnyEnemyUnitDead();
    int ret = 0;
    u8 _dead = dead;
    ret = 0 == _dead ? 1 : 0;
    return ret;
}

s8 IsCharDeadAsNonPlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    for (i = FACTION_GREEN + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_DEAD & unit->state))
                if (unit->pCharacterData->number == pid)
                    return 1;
        }
    }
    return 0;
}

int CountDeployedSelectablePlayerUnits()
{
    int i;
    int ret = 0;
    struct Unit *unit;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == ((US_NOT_DEPLOYED | US_DEAD) & unit->state))
                if (0 == (US_UNSELECTABLE & unit->state))
                    ret++;
        }
    }
    return ret;
}

int AreAllNpcUnitsUnselectable()
{
    int i;
    struct Unit *unit;
    for (i = FACTION_GREEN + 1; i < FACTION_RED; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_UNSELECTABLE & unit->state))
                return 0;
        }
    }
    return 1;
}

s8 IsChar0AliveAsNonPlayerUnit() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_02() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_03() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_2() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_02_2() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_03_2() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_04() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_05() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_06() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_07() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0AliveAsNonPlayerUnit_08() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_09() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_10() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_11() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_12() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_13() {return IsCharDeadAsNonPlayerUnit(0);}
s8 IsChar0DeadAsNonPlayerUnit_14() {return IsCharDeadAsNonPlayerUnit(0);}

s8 DoChars0And0HaveMaxSupport() {return HaveCharactersMaxSupport(0, 0);}
s8 HaveChars0MaxSupport_02() {return HaveCharactersMaxSupport(0, 0);}
s8 HaveChars0MaxSupport_03() {return HaveCharactersMaxSupport(0, 0);}
s8 HaveChars0MaxSupport_04() {return HaveCharactersMaxSupport(0, 0);}
s8 HaveChars0MaxSupport_05() {return HaveCharactersMaxSupport(0, 0);}
s8 HaveChars0MaxSupport_06() {return HaveCharactersMaxSupport(0, 0);}

int Uidebug_CountLivingUnitsOfCharInFaction(u8 pid, int faction)
{
    int i;
    struct Unit * unit;
    int ret = 0;

    for (i = faction + 1; i < faction + 0x40; i++) {
        unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (US_DEAD & unit->state)
            continue;

        if (unit->pCharacterData->number == pid)
            ret++;
    }

    return ret;
}

int Uidebug_CountLivingUnitsInFaction(int faction)
{
    int i;
    struct Unit * unit;
    int ret = 0;

    for (i = faction + 1; i < faction + 0x40; i++) {
        unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (0 == (US_DEAD & unit->state))
            ret++;
    }
    return ret;
}

int Uidebug_IsTurnNumberOver20()
{
    return gPlaySt.chapterTurnNumber > 20;
}

int Uidebug_IsTurnNumberOver25()
{
    return gPlaySt.chapterTurnNumber > 25;
}

int Uidebug_IsTurnNumberOver30()
{
    return gPlaySt.chapterTurnNumber > 30;
}

int Uidebug_IsPlayerPhase()
{
    return FACTION_BLUE == gPlaySt.faction;
}

int Uidebug_IsEnemyPhase()
{
    return FACTION_RED == gPlaySt.faction;
}

int Uidebug_IsActiveUnitMale()
{
    return 0 == (CA_FEMALE & UNIT_CATTRIBUTES(gActiveUnit));
}

int Uidebug_IsGoldOver9999()
{
    return (int)GetPartyGoldAmount() > 9999;
}

int Uidebug_IsGoldOver7999()
{
    return (int)GetPartyGoldAmount() > 7999;
}

int Uidebug_IsGoldOver5999()
{
    return (int)GetPartyGoldAmount() > 5999;
}

int Uidebug_IsGoldOver4999()
{
    return (int)GetPartyGoldAmount() > 4999;
}

int Uidebug_IsTalkChoiceResultOne()
{
    return 1 == GetTalkChoiceResult();
}

int Uidebug_IsAliveEnemyCountAtLeast50()
{
    if (GetDeadEnemyAmount() >= 50)
        return 1;
    else
        return 0;
}

int Uidebug_ConstFalse()
{
    return 0;
}

int Uidebug_IsActiveUnitHpZero()
{
    return GetUnitCurrentHp(gActiveUnit) == 0;
}

int Uidebug_ConstFalse2()
{
    return 0;
}
