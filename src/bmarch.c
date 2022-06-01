#include "global.h"

#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"


struct Trap* GetRiddenBallistaAt(int xPos, int yPos) {
    s8 isBallista;
    struct Trap* trap = GetTrapAt(xPos, yPos);

     if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");
    
    if (isBallista == 0) {
        return 0;
    }

    if (trap->data[TRAP_EXTDATA_BLST_ITEMUSES] != 0) {
        return trap;
    }

    return 0;
}

#if NONMATCHING

int GetBallistaItemAt(int xPos, int yPos) {
    s8 isBallista;
    int tmp;
    struct Trap* trap = GetTrapAt(xPos, yPos);

    if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");

    if (isBallista == 0) {
        return 0;
    }

    tmp = trap->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (tmp == 0) {
        return 0;
    }

    if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");

    if (isBallista != 0) {
        return (tmp * 256) + trap->extra;
    }
    
    return 0;
}

#else // !NONMATCHING

__attribute__((naked))
int GetBallistaItemAt(int xPos, int yPos) {
    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        bl GetTrapAt\n\
        adds r1, r0, #0\n\
        cmp r1, #0\n\
        beq _0803799E\n\
        ldrb r0, [r1, #2]\n\
        cmp r0, #1\n\
        beq _080379A2\n\
    _0803799E:\n\
        movs r0, #0\n\
        b _080379A4\n\
    _080379A2:\n\
        movs r0, #1\n\
    _080379A4:\n\
        cmp r0, #0\n\
        beq _080379C4\n\
        movs r2, #6\n\
        ldrsb r2, [r1, r2]\n\
        cmp r2, #0\n\
        beq _080379C4\n\
        cmp r1, #0\n\
        beq _080379BA\n\
        ldrb r0, [r1, #2]\n\
        cmp r0, #1\n\
        beq _080379BE\n\
    _080379BA:\n\
        movs r0, #0\n\
        b _080379C0\n\
    _080379BE:\n\
        movs r0, #1\n\
    _080379C0:\n\
        cmp r0, #0\n\
        bne _080379C8\n\
    _080379C4:\n\
        movs r0, #0\n\
        b _080379CE\n\
    _080379C8:\n\
        ldrb r1, [r1, #3]\n\
        lsls r0, r2, #8\n\
        adds r0, r1, r0\n\
    _080379CE:\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

int GetSomeBallistaItemAt(int xPos, int yPos) {
    s8 isBallista;
    int tmp;
    struct Trap* trap = GetTrapAt(xPos, yPos);

    if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");

    if (isBallista == 0) {
        return 0;
    }

    tmp = trap->extra;
    if (tmp != 0) {
        return 0x100 + tmp;
    }

    return 0;
}

struct Trap* AddBallista(int xPos, int yPos, int ballistaType) {
    struct Trap* trap = AddTrap(xPos, yPos, 1, 0);

    trap->extra = GetItemIndex(ballistaType);
    trap->data[TRAP_EXTDATA_BLST_ITEMUSES] = GetItemUses(MakeNewItem(ballistaType));
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;

    return trap;
}

void RideBallista(struct Unit* unit) {
    struct Trap* trap = GetTrapAt(unit->xPos, unit->yPos);

    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 1;

    SMS_UpdateFromGameData();

    unit->state |= US_IN_BALLISTA;

    unit->ballistaIndex = TRAP_INDEX(trap);

    return;
}

void TryRemoveUnitFromBallista(struct Unit* unit) {
    struct Trap* trap;

    if ((unit->state & US_IN_BALLISTA) != 0) {
        trap = GetTrap(unit->ballistaIndex);

        unit->state &= ~US_IN_BALLISTA;

        trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
        unit->ballistaIndex = 0;

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;

        SMS_UpdateFromGameData();
    }

    return;
}

s8 IsBallista(struct Trap* trap) {

    if (trap && trap->type == TRAP_BALLISTA) {
        return 1;
    }

    return 0;
}

int sub_8037AC0(struct Trap* trap) {
    s8 isBallista;

     if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");

    if (isBallista == 0) {
        return 0;
    }

    return trap->extra + trap->data[TRAP_EXTDATA_BLST_ITEMUSES] * 0x100;
}

int sub_8037AEC(struct Trap* trap) {
    s8 isBallista;

     if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");

    if (isBallista == 0) {
        return 0;
    }

    return trap->extra;
}

int GetBallistaItemUses(struct Trap* trap) {
    s8 isBallista;

     if (!trap || trap->type != TRAP_BALLISTA) {
        isBallista = 0;
    } else {
        isBallista = 1;
    }

    asm("");

    if (isBallista == 0) {
        return 0;
    }

    return trap->data[TRAP_EXTDATA_BLST_ITEMUSES];
}

void sub_8037B34(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
    return;
}

void sub_8037B3C(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 1;
    return;
}