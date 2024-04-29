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
#include "bmusailment.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "eventinfo.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "popup.h"

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
        PidStatsRecordLoseData(unit->pCharacterData->number);
    }

    return;
}

void sub_8037510(struct UnknownBMTrapProc* proc) {
    StartFireTrapAnim(proc, proc->unit->xPos, proc->unit->yPos);
    return;
}

void sub_8037528(struct UnknownBMTrapProc* proc) {
    StartFireTrapAnim2(proc, proc->unit->xPos, proc->unit->yPos);
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
    BeginUnitCritDamageAnim(unit, TRAP_TORCHLIGHT);

    return;
}

void sub_80375A0(struct UnknownBMTrapProc * proc)
{
    struct Unit* unit = proc->unit;

    ApplyHazardHealing(proc, unit, -10, -1);

    if (GetUnitCurrentHp(unit) == 0) {
        struct Unit* tmp = gActiveUnit;
        gActiveUnit = unit;
        
        PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, 3);

        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }

        gActiveUnit = tmp;
    }

    return;
}

int GetPickTrapType(struct Unit * unit)
{
    struct Trap * trap;

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

int ExecTrap(ProcPtr proc, struct Unit * unit, int param_3)
{
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
            NewPopup2_PlanA(proc, -1, GetStringFromIndex(0x20));
            break;

        case 0x10:
            RemoveTrap(GetTrapAt(unit->xPos, unit->yPos));
            PlaySoundEffect(0xB1);
            NewPopup2_PlanA(proc, -1, GetStringFromIndex(0x21));
            UnitAddItem(unit, MakeNewItem(ITEM_MINE));
            break;
    }

    return 0;
}

bool HandlePostActionTraps(ProcPtr proc) {

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

    WriteSuspendSave(3);

    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_OFF) {
        RefreshUnitSprites();
    }

    return ExecTrap(proc, gActiveUnit, 0);
}

bool sub_80377CC(ProcPtr proc)
{
    return ExecTrap(proc, GetUnit(gActionData.targetIndex), 1);
}

bool sub_80377F0(ProcPtr proc, struct Unit * unit)
{
    if (!GetPickTrapType(unit)) {
        MU_End(MU_GetByUnit(unit));
        RenderBmMap();
        RefreshEntityBmMaps();
        ForceSyncUnitSpriteSheet();
        return 1;
    }

    return ExecTrap(proc, unit, 2);
}

bool sub_8037830(ProcPtr proc, struct Unit * unit)
{
    return ExecTrap(proc, unit, 3);
}

void LoadTrapData(const struct TrapData * data)
{
    if (!data || !data->type) {
        return;
    } else {
        while (data->type) {
            switch (data->type) {
                case TRAP_BALLISTA:
                    AddBallista(data->xPos, data->yPos, data->subtype);
                    break;

                case TRAP_FIRETILE:
                    AddFireTile(data->xPos, data->yPos, data->turn_counter, data->turn);
                    break;

                case TRAP_GAS:
                    AddGasTrap(data->xPos, data->yPos, data->subtype, data->turn_counter, data->turn);
                    break;

                case TRAP_8:
                    AddTrap8(data->xPos, data->yPos);
                    break;

                case TRAP_9:
                    AddTrap9(data->xPos, data->yPos, data->subtype);
                    break;

                case TRAP_MINE:
                    AddTrap(data->xPos, data->yPos, data->type, 0);
                    break;

                case TRAP_LIGHTARROW:
                    AddArrowTrap(data->xPos, data->turn_counter, data->turn);

                case TRAP_GORGON_EGG:
                    AddGorgonEggTrap(data->xPos, data->yPos, data->subtype, data->turn_counter, data->turn);
                    break;
            }
            data++;
        }
    }

    return;
}

//! FE8U = 0x08037910
void LoadChapterTraps(void)
{
    LoadTrapData(GetTrapPointer());
    LoadTrapData(GetHardModeTrapPointer());

    return;
}

//! FE8U = 0x08037928
void AddGorgonEggTrap(s8 x, s8 y, u8 meta, u8 delay, u8 level)
{
    // The value of the "meta" parameter appears to be unused in the game logic
    AddDamagingTrap(x, y, TRAP_GORGON_EGG, meta, delay, 1, level);

    return;
}
