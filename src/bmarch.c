#include "global.h"

#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmudisp.h"

#include "bmarch.h"

// To avoid compilation errors with modern gcc compilers due to forced function type conversion during external calls,
// the function implementing the same logic was divided into two versions with different return types.
// Theoretically, this should be a bug in the official code, and there should only be one version of the function with a return type of s8:
//   1. In the header file (.h), the function is declared with a return type of s32, while in the source file (.c), the function is defined with a return type of s8.
//   2. In such a case, if the current .c file does not include the corresponding .h file, it can be compiled successfully with the agbcc compiler,
//      but this affects the compilation dependency relations in the Makefile.
// If we keep only one version of the function with a return type of s8,
// while declaring a version with a return type of s32 before external calls,
// it can also be compiled successfully with agbcc.
// However, since all function implementations are fully inlined in the current compilation unit,
// the resulting assembly file (.s) will not contain the symbol for this function, causing it to disappear eventually.
// Adding the extern keyword before the function definition can force modern gcc compilers to retain the function,
// but this leads to the issue of the function eventually disappearing when compiled with agbcc.
inline s32 IsBallista(struct Trap* trap) {

    if (!trap) {
        return 0;
    }

    if (trap->type != TRAP_BALLISTA) {
        return 0;
    }

    return 1;
}

static inline s8 IsBallistaInternal(struct Trap* trap) {

    if (!trap) {
        return 0;
    }

    if (trap->type != TRAP_BALLISTA) {
        return 0;
    }

    return 1;
}

inline int sub_8037AC0(struct Trap* trap) {
    if (!IsBallistaInternal(trap)) {
        return 0;
    }

    return trap->extra + trap->data[TRAP_EXTDATA_BLST_ITEMUSES] * 0x100;
}

inline int sub_8037AEC(struct Trap* trap) {
    if (!IsBallistaInternal(trap)) {
        return 0;
    }

    return trap->extra;
}

inline int GetBallistaItemUses(struct Trap* trap) {
    if (!IsBallistaInternal(trap)) {
        return 0;
    }

    return trap->data[TRAP_EXTDATA_BLST_ITEMUSES];
}

inline void ClearBallistaOccupied(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
    return;
}

inline void SetBallistaOccupied(struct Trap* trap) {
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

    ClearBallistaOccupied(trap);

    return trap;
}

void RideBallista(struct Unit* unit) {
    struct Trap* trap = GetTrapAt(unit->xPos, unit->yPos);

    SetBallistaOccupied(trap);

    RefreshUnitSprites();

    unit->state |= US_IN_BALLISTA;

    unit->ballistaIndex = TRAP_INDEX(trap);

    return;
}

void TryRemoveUnitFromBallista(struct Unit* unit) {
    struct Trap* trap;

    if ((unit->state & US_IN_BALLISTA) != 0) {
        trap = GetTrap(unit->ballistaIndex);

        unit->state &= ~US_IN_BALLISTA;

        ClearBallistaOccupied(trap);

        unit->ballistaIndex = 0;

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;

        RefreshUnitSprites();
    }

    return;
}
