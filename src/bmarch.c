#include "global.h"

#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"


inline s8 IsBallista(struct Trap* trap) {

    if (!trap) {
        return 0;
    }

    if (trap->type != TRAP_BALLISTA) {
        return 0;
    }

    return 1;
}

inline int sub_8037AC0(struct Trap* trap) {
    if (!IsBallista(trap)) {
        return 0;
    }

    return trap->extra + trap->data[TRAP_EXTDATA_BLST_ITEMUSES] * 0x100;
}

inline int sub_8037AEC(struct Trap* trap) {
    if (!IsBallista(trap)) {
        return 0;
    }

    return trap->extra;
}

inline int GetBallistaItemUses(struct Trap* trap) {
    if (!IsBallista(trap)) {
        return 0;
    }

    return trap->data[TRAP_EXTDATA_BLST_ITEMUSES];
}

inline void sub_8037B34(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
    return;
}

inline void sub_8037B3C(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 1;
    return;
}

struct Trap* GetRiddenBallistaAt(int xPos, int yPos) {
    struct Trap* trap = GetTrapAt(xPos, yPos);

    if (GetBallistaItemUses(trap) == 0) {
        return 0;
    }

    return trap;
}

int GetBallistaItemAt(int xPos, int yPos) {
    struct Trap* trap = GetTrapAt(xPos, yPos);

    if (GetBallistaItemUses(trap) == 0) {
        return 0;
    }

    return sub_8037AC0(trap);
}

int GetSomeBallistaItemAt(int xPos, int yPos) {
    struct Trap* trap = GetTrapAt(xPos, yPos);

    int unk = sub_8037AEC(trap);

    if (unk == 0) {
        return 0;
    }

    return unk + 0x100;
}

struct Trap* AddBallista(int xPos, int yPos, int ballistaType) {
    struct Trap* trap = AddTrap(xPos, yPos, 1, 0);

    trap->extra = GetItemIndex(ballistaType);
    trap->data[TRAP_EXTDATA_BLST_ITEMUSES] = GetItemUses(MakeNewItem(ballistaType));

    sub_8037B34(trap);

    return trap;
}

void RideBallista(struct Unit* unit) {
    struct Trap* trap = GetTrapAt(unit->xPos, unit->yPos);

    sub_8037B3C(trap);

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

        sub_8037B34(trap);

        unit->ballistaIndex = 0;

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;

        SMS_UpdateFromGameData();
    }

    return;
}
