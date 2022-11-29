/**
 * Some unused functions and seems cropped.
 * maybe for debug and the source code is not compiled after test.
 */

#include "global.h"
#include "variables.h"
#include "functions.h"

#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "player_interface.h"
#include "bmtrick.h"

struct Struct089ED67C {
    /* 00 */ u8 _pad00[0x0C];
    /* 0C */ s8 (*func)();
    /* 10 */ u8 _pad10[0x18 - 0x10];
};

extern const struct Struct089ED67C gUnknown_089ED67C[];
extern const struct Struct089ED67C gUnknown_089ED694[];
extern const struct Struct089ED67C gUnknown_089ED6AC[];

u8 sub_8084880()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUnknown_089ED67C[i].func; i++, val++) {
        if (1 == gUnknown_089ED67C[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;
    
    return buf[(GetGameClock() % 0x40) % loc];
}

u8 sub_80848E0()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUnknown_089ED694[i].func; i++, val++) {
        if (1 == gUnknown_089ED694[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;
    
    return buf[(GetGameClock() % 0x40) % loc];
}

u8 sub_8084940()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUnknown_089ED6AC[i].func; i++, val++) {
        if (1 == gUnknown_089ED6AC[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;

    return buf[(GetGameClock() % 0x40) % loc];
}

u8 sub_80849A0()
{
    int i, val = 0;
    for (i = 0; gUnknown_089ED6AC[i].func; i++, val++);

    return (GetGameClock() % 0x10) % val;
}

u8 sub_80849D8()
{
    int i, val = 0;
    for (i = 0; gUnknown_089ED6AC[i].func; i++, val++);

    return ((GetGameClock() / 2) % 0x10) % val;
}

u8 sub_8084A10()
{
    int i, val = 0;
    for (i = 0; gUnknown_089ED6AC[i].func; i++, val++);

    return ((GetGameClock() / 4) % 0x10) % val;
}

int sub_8084A48()
{
    int i, ret = 0;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);

    if (2 == ret)
        return 1;
    else
        return 0;
}

int sub_8084A68()
{
    int i;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);
    
    return 0;
}

int sub_8084A80() {return 1;}
int sub_8084A84() {return 0;}
int sub_8084A88() {return 0;}
int sub_8084A8C() {return 0;}
int sub_8084A90() {return 0;}
int sub_8084A94() {return 0;}
int sub_8084A98() {return 0;}
int sub_8084A9C() {return 0;}
int sub_8084AA0() {return 0;}
int sub_8084AA4() {return 0;}
int sub_8084AA8() {return 0;}
int sub_8084AAC() {return 0;}
int sub_8084AB0() {return 0;}
int sub_8084AB4() {return 0;}
int sub_8084AB8() {return 0;}
int sub_8084ABC() {return 0;}
int sub_8084AC0() {return 0;}
int sub_8084AC4() {return 0;}
int sub_8084AC8() {return 0;}
int sub_8084ACC() {return 0;}
int sub_8084AD0() {return 0;}
int sub_8084AD4() {return 0;}
int sub_8084AD8() {return 0;}

void sub_8084ADC()
{
    EndPlayerPhaseSideWindows();
    sub_802F760(GetUnitFromCharId(0x100), 0);
}

int sub_8084AF4()
{
    int i;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);
    
    return 0;
}

void sub_8084B0C()
{
    struct Trap *cur;
    
    for (cur = GetTrap(0); TRAP_NONE != cur->type; cur++)
        if (TRAP_LIGHT_RUNE == cur->type) {
            RemoveLightRune(cur);
            cur--;
        }
}

void sub_8084B34()
{
    SoftReset(0xFE);
}

int sub_8084B40()
{
    if (A_BUTTON & gKeyStatusPtr->newKeys)
        return 0;
    else
        return 1;
}

void sub_8084B60()
{
    SoftReset(0xFE);
}

int sub_8084B6C()
{
    if (A_BUTTON & gKeyStatusPtr->newKeys)
        return 1;
    else
        return 0;
}

void sub_8084B8C()
{
    UpdateMapViewWithFog(0);
}

void sub_8084B98()
{
    SetPartyGoldAmount(GetPartyGoldAmount() + 5000);
}

void sub_8084BB0(int sub_val)
{
    if ((int)GetPartyGoldAmount() < sub_val)
        return;

    SetPartyGoldAmount(GetPartyGoldAmount() - sub_val);
}

void sub_8084BCC(struct Unit *unit)
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

void sub_8084C38(u8 pid)
{
    sub_8084BCC(GetUnitFromCharId(pid));
}

s8 sub_8084C4C(u8 pid)
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

s8 sub_8084C8C() {return sub_8084C4C(0);}
s8 sub_8084C9C() {return sub_8084C4C(0);}

s8 sub_8084CAC(u8 pid)
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

s8 sub_8084CE8() {return sub_8084CAC(0);}
s8 sub_8084CF8() {return sub_8084CAC(0);}
s8 sub_8084D08() {return sub_8084CAC(0);}
s8 sub_8084D18() {return sub_8084CAC(0);}
s8 sub_8084D28() {return sub_8084CAC(0);}
s8 sub_8084D38() {return sub_8084CAC(0);}
s8 sub_8084D48() {return sub_8084CAC(0);}
s8 sub_8084D58() {return sub_8084CAC(0);}
s8 sub_8084D68() {return sub_8084CAC(0);}
s8 sub_8084D78() {return sub_8084CAC(0);}
s8 sub_8084D88() {return sub_8084CAC(0);}
s8 sub_8084D98() {return sub_8084CAC(0);}
s8 sub_8084DA8() {return sub_8084CAC(0);}
s8 sub_8084DB8() {return sub_8084CAC(0);}
s8 sub_8084DC8() {return sub_8084CAC(0);}
s8 sub_8084DD8() {return sub_8084CAC(0);}
s8 sub_8084DE8() {return sub_8084CAC(0);}
s8 sub_8084DF8() {return sub_8084CAC(0);}
s8 sub_8084E08() {return sub_8084CAC(0);}
s8 sub_8084E18() {return sub_8084CAC(0);}
s8 sub_8084E28() {return sub_8084CAC(0);}
s8 sub_8084E38() {return sub_8084CAC(0);}
s8 sub_8084E48() {return sub_8084CAC(0);}
s8 sub_8084E58() {return sub_8084CAC(0);}
s8 sub_8084E68() {return sub_8084CAC(0);}
s8 sub_8084E78() {return sub_8084CAC(0);}

s8 sub_8084E88(u8 pid)
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

s8 sub_8084EB8() {return sub_8084E88(0);}
s8 sub_8084EC8() {return sub_8084E88(0);}
s8 sub_8084ED8() {return sub_8084E88(0);}
