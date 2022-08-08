#include "global.h"

#include "constants/items.h"

#include "proc.h"
#include "mu.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmarch.h"

#include "bmtrap.h"

// code.s
void sub_80A4594(u8);
void BWL_AddWinOrLossIdk(u8, u8, int);

// trapfx.s
void sub_801F68C(ProcPtr, int, int);
void sub_801F6BC(ProcPtr, int, int);

// bb.s
void sub_80357A8(ProcPtr, struct Unit*, int, int);

// ev_triggercheck.s
s8 CheckForWaitEvents(void);
void RunWaitEvents(void);
struct TrapData* GetCurrentChapterBallistaePtr(void);
struct TrapData* GetCurrentChapterBallistae2Ptr(void);

// notifybox.s
void sub_801F9FC(ProcPtr, int, char*);

struct UnknownBMTrapProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad_29[0x50-0x29];

    /* 50 */ s16 unk_50;
    /* 52 */ s8 unk_52;
    /* 53 */ s8 unk_53;
    /* 54 */ struct Unit* unit;
};

void sub_80374F4(struct UnknownBMTrapProc* proc);
void sub_8037510(struct UnknownBMTrapProc* proc);
void sub_8037528(struct UnknownBMTrapProc* proc);
void sub_8037540(struct UnknownBMTrapProc* proc);
void sub_80375A0(struct UnknownBMTrapProc* proc);

struct ProcCmd CONST_DATA sProcScr_ExecTrap8[] = {
    PROC_SLEEP(1),
    PROC_WHILE(MU_IsAnyActive),
    PROC_CALL(sub_80374F4),
    PROC_CALL(sub_8037510),
    PROC_SLEEP(0),

    PROC_CALL(sub_8037540),
    PROC_SLEEP(0),

    PROC_CALL(sub_80375A0),
    PROC_SLEEP(0),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_ExecTrapMine[] = {
    PROC_SLEEP(1),
    PROC_WHILE(MU_IsAnyActive),
    PROC_CALL(sub_80374F4),
    PROC_CALL(sub_8037528),
    PROC_SLEEP(0),

    PROC_CALL(sub_8037540),
    PROC_SLEEP(0),

    PROC_CALL(sub_80375A0),
    PROC_SLEEP(0),

    PROC_END,
};

void sub_80374F4(struct UnknownBMTrapProc* proc) {
    struct Unit* unit = proc->unit;

    if (GetUnitCurrentHp(unit) <= 10) {
        sub_80A4594(unit->pCharacterData->number);
    }

    return;
}

void sub_8037510(struct UnknownBMTrapProc* proc) {
    sub_801F68C(proc, proc->unit->xPos, proc->unit->yPos);
    return;
}

void sub_8037528(struct UnknownBMTrapProc* proc) {
    sub_801F6BC(proc, proc->unit->xPos, proc->unit->yPos);
    return;
}

void sub_8037540(struct UnknownBMTrapProc* proc) {
    struct Unit* unit = proc->unit;

    switch (proc->unk_50) {
        case 0:
            MU_EndAll();
            break;

        case 1:
            MU_EndAll();
            MU_Create(gActiveUnit);
            MU_SetDefaultFacing_Auto();
            break;

        case 2:
            MU_End(MU_GetByUnit(unit));
            break;
    }

    gActionData.trapType = TRAP_TORCHLIGHT;
    sub_803592C(unit, TRAP_TORCHLIGHT);

    return;
}

void sub_80375A0(struct UnknownBMTrapProc* proc) {
    struct Unit* unit = proc->unit;

    sub_80357A8(proc, unit, -10, -1);

    if (GetUnitCurrentHp(unit) == 0) {
        struct Unit* tmp = gActiveUnit;
        gActiveUnit = unit;
        
        BWL_AddWinOrLossIdk(unit->pCharacterData->number, 0, 3);

        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }

        gActiveUnit = tmp;
    }

    return;
}

int GetPickTrapType(struct Unit* unit) {
    struct Trap* trap;

    if ((trap = GetTrapAt(unit->xPos, unit->yPos)) == NULL) {
        return 0;
    }

    switch (trap->type) {
        case TRAP_BALLISTA:
            return 0;

        case TRAP_FIRETILE:
            if ((UNIT_CATTRIBUTES(unit) & CA_THIEF)) {
                return 0xF;
            }
            break;

        case TRAP_MINE:
            if ((UNIT_CATTRIBUTES(unit) & CA_ASSASSIN)) {
                if (GetUnitItemCount(unit) != 5) {
                    return 0x10;
                }
                return 0;
            } else if ((UNIT_CATTRIBUTES(unit) & CA_STEAL)) {
                return 0;
            }
            break;
    }

    return trap->type;
}

int ExecTrap(ProcPtr proc, struct Unit* unit, int param_3) {
    struct UnknownBMTrapProc* proc2;

    switch (GetPickTrapType(unit)) {
        case TRAP_8:
            proc2 = Proc_StartBlocking(sProcScr_ExecTrap8, proc);
            proc2->unk_50 = param_3;
            proc2->unit = unit;
            break;

        case TRAP_MINE:
            RemoveTrap(GetTypedTrapAt(unit->xPos, unit->yPos, TRAP_MINE));
            proc2 = Proc_StartBlocking(sProcScr_ExecTrapMine, proc);
            proc2->unk_50 = param_3;
            proc2->unit = unit;
            break;

        case 0xF:
            RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
            PlaySoundEffect(0xB1);
            sub_801F9FC(proc, -1, GetStringFromIndex(0x20));
            break;

        case 0x10:
            RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
            PlaySoundEffect(0xB1);
            sub_801F9FC(proc, -1, GetStringFromIndex(0x21));
            UnitAddItem(unit, MakeNewItem(ITEM_MINE));
            break;
    }

    return 0;
}

s8 HandlePostActionTraps(ProcPtr proc) {

    if (GetUnitCurrentHp(gActiveUnit) <= 0) {
        return 1;
    }

    if ((UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO) && !(gActiveUnit->state & US_CANTOING)) {
        switch (gActionData.unitActionType) {
            case UNIT_ACTION_WAIT:
            case UNIT_ACTION_COMBAT:
            case UNIT_ACTION_STAFF:
                break;

            default:
                return 1;
        }
    }

    if (!GetPickTrapType(gActiveUnit)) {
        return 1;
    }

    gActionData.suspendPointType = 1;
    gActionData.unitActionType = 1;

    SaveSuspendedGame(3);

    if (GetBattleAnimType() == 1) {
        SMS_UpdateFromGameData();
    }

    return ExecTrap(proc, gActiveUnit, 0);
}

s8 sub_80377CC(ProcPtr proc) {
    return ExecTrap(proc, GetUnit(gActionData.targetIndex), 1);
}

s8 sub_80377F0(ProcPtr proc, struct Unit* unit) {
    if (!GetPickTrapType(unit)) {
        MU_End(MU_GetByUnit(unit));
        RenderBmMap();
        RefreshEntityBmMaps();
        SMS_FlushIndirect();
        return 1;
    }

    return ExecTrap(proc, unit, 2);
}

s8 sub_8037830(ProcPtr proc, struct Unit* unit) {
    return ExecTrap(proc, unit, 3);
}

void LoadTrapData(struct TrapData* data) {
    if (!data || !data->type) {
        return;
    } else {
        while (data->type) {
            switch (data->type) {
                case TRAP_BALLISTA:
                    AddBallista(data->xPos, data->yPos, data->unk_03);
                    break;

                case TRAP_FIRETILE:
                    AddFireTile(data->xPos, data->yPos, data->unk_04, data->unk_05);
                    break;

                case TRAP_GAS:
                    AddGasTrap(data->xPos, data->yPos, data->unk_03, data->unk_04, data->unk_05);
                    break;

                case TRAP_8:
                    AddTrap8(data->xPos, data->yPos);
                    break;

                case TRAP_9:
                    AddTrap9(data->xPos, data->yPos, data->unk_03);
                    break;

                case TRAP_MINE:
                    AddTrap(data->xPos, data->yPos, data->type, 0);
                    break;

                case TRAP_LIGHTARROW:
                    AddArrowTrap(data->xPos, data->unk_04, data->unk_05);
                    // break; // BUG?

                case TRAP_GORGON_EGG:
                    AddGorgonEggTrap(data->xPos, data->yPos, data->unk_03, data->unk_04, data->unk_05);
                    break;
            }
            
            data++;
        }
    }

    return;
}

void LoadChapterBallistae() {
    LoadTrapData(GetCurrentChapterBallistaePtr());
    LoadTrapData(GetCurrentChapterBallistae2Ptr());

    return;
}

void AddGorgonEggTrap(s8 x, s8 y, u8 turnsToHatch, u8 level, u8 unk_05) {
    AddDamagingTrap(x, y, TRAP_GORGON_EGG, turnsToHatch, level, 1, unk_05);

    return;
}