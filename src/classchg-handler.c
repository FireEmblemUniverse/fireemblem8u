#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmmind.h"
#include "mu.h"

// TODO: Implicit declaration
u32 GetUnitEquippedWeapon(struct Unit *);

CONST_DATA struct ProcCmd ProcScr_PromoHandler[] = {
    PROC_SLEEP(3),

PROC_LABEL(0),
    PROC_CALL(PromoHandler_SetInitStat),

PROC_LABEL(1),
    PROC_REPEAT(PromoHandlerIdle),

PROC_LABEL(7),
    PROC_END,
};

CONST_DATA u32 gUnknown_08B12704[] = {
    0x00011e05,
    0x28050008,
    0x50050003,
    0x00080001,
    0x00032805,
    0x00000000,
};

struct TraineeData {
    u8 charId;
    u8 promotionLevel;
    u8 class;
};

u32 PromoHandler_SetupAndStartUI(struct ProcPromoHandler *proc)
{
    struct Unit *unit;
    u8 classNumber;
    u32 terrain;

    struct TraineeData trainees[3] = {
        { CHARACTER_ROSS,   10, CLASS_JOURNEYMAN },
        { CHARACTER_AMELIA, 10, CLASS_RECRUIT },
        { CHARACTER_EWAN,   10, CLASS_PUPIL },
    };

    switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_EIRIKA:
        default:
            terrain = TERRAIN_PLAINS;
            break;

        case CHAPTER_MODE_EPHRAIM:
            terrain = TERRAIN_DESERT;
            break;
    }

    if (proc->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        u8 i;
        u8 flag;
        proc->bmtype = PROMO_HANDLER_TYPE_TRANINEE;
        proc->sel_en = 1;
        flag = 0;

#if BUGFIX
        for (i = 0; i < 3; i++) {
#else
        for (i = 0; i < 7; i++) {
#endif
            unit = GetUnitFromCharId(trainees[i].charId);
            if (!unit)
                flag = true;

            if (unit->state & (US_BIT16 | US_DEAD))
                flag = true;

            if (unit->level < trainees[i].promotionLevel)
                flag = true;

            classNumber = unit->pClassData->number;
            if (classNumber != trainees[i].class)
                flag = true;

            if (!gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1])
                flag = true;

            if (!flag) {
                if (gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
                    proc->jid = gPromoJidLut[classNumber][0];
                    proc->sel_en = 0;
                }

                if (!gPromoJidLut[classNumber][0] && gPromoJidLut[classNumber][1]) {
                    proc->jid = gPromoJidLut[classNumber][1];
                    proc->sel_en = 0;
                }

                if (trainees[i].charId != terrain)
                    MakePromotionScreen(proc, trainees[i].charId, terrain);
                else
                    MakePromotionScreen(proc, trainees[i].charId, TERRAIN_ROAD);

                return PROMO_HANDLER_STAT_IDLE;
            }
            flag = 0;
        }
        return PROMO_HANDLER_STAT_END;
    } else if (proc->bmtype == PROMO_HANDLER_TYPE_BM) {
        proc->bmtype = PROMO_HANDLER_TYPE_BM;
        proc->sel_en = 1;
        unit = GetUnitFromCharId(proc->pid);
        classNumber = unit->pClassData->number;

        /* If no class to promote, end the handler proc */
        if (!gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1])
            return PROMO_HANDLER_STAT_END;

        if (gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][0];
            proc->sel_en = 0;
        }

        if (!gPromoJidLut[classNumber][0] && gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][1];
            proc->sel_en = 0;
        }

        MakePromotionScreen(proc, proc->pid, TERRAIN_PLAINS);
        return PROMO_HANDLER_STAT_IDLE;
    } else if (proc->bmtype == PROMO_HANDLER_TYPE_PREP) {
        proc->bmtype = PROMO_HANDLER_TYPE_PREP;
        proc->sel_en = 1;
        unit = GetUnitFromCharId(proc->pid);
        classNumber = unit->pClassData->number;
        if (!gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
            BMapDispResume();
            RefreshBMapGraphics();
            return PROMO_HANDLER_STAT_END;
        }
        if (gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][0];
            proc->sel_en = 0;
        }
        if (!gPromoJidLut[classNumber][0] && gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][1];
            proc->sel_en = 0;
        }
        MakePromotionScreen(proc, proc->pid, TERRAIN_PLAINS);
        return PROMO_HANDLER_STAT_IDLE;
    }
    else
        return PROMO_HANDLER_STAT_END;
}

u8 PromoHandler_SetInitStat(struct ProcPromoHandler *proc)
{
    proc->stat = PROMO_HANDLER_STAT_INIT;
    return 0;
}

void PromoHandlerIdle(struct ProcPromoHandler *proc)
{
    switch (proc->stat) {
    case PROMO_HANDLER_STAT_IDLE:
    default:
        return;

    case PROMO_HANDLER_STAT_INIT:
        proc->stat = PromoHandler_SetupAndStartUI(proc);
        break;

    case PROMO_HANDLER_STAT_END:
        Proc_Break(proc);
        break;
    }
}

void StartTraineePromoScreen(ProcPtr parent)
{
    struct BattleUnit *actor, *target;
    struct ProcPromoHandler *proc = Proc_StartBlocking(ProcScr_PromoHandler, parent);
    proc->bmtype = PROMO_HANDLER_TYPE_TRANINEE;
    proc->u32 = 0;
    proc->unit = NULL;
    proc->item_slot = -1;
    actor = &gBattleActor;
    target = &gBattleTarget;
    target->weaponBefore = 0;
    actor->weaponBefore = 0;
    target->weapon = 0;
    actor->weapon = 0;
    target->statusOut = -1;
}

void StartPrepScreenPromotion(struct ProcPrepItemUse *proc)
{
    struct BattleUnit *actor, *target;
    struct ProcPromoHandler *new_proc;
    struct ProcPrepItemUse *parent;

    u32 weapon;
    u32 slot = proc->slot;
    if (slot != -1) {
        struct BattleUnit *actor, *target;
        actor = &gBattleActor;
        target = &gBattleTarget;
        target->weaponBefore = proc->unit->items[slot];
        actor->weaponBefore = proc->unit->items[slot];
    }

    weapon = GetUnitEquippedWeapon(proc->unit);
    actor = &gBattleActor;
    target = &gBattleTarget;
    target->weapon = weapon;
    actor->weapon = weapon;
    target->statusOut = -1;

    new_proc = Proc_StartBlocking(ProcScr_PromoHandler, proc);
    new_proc->bmtype = PROMO_HANDLER_TYPE_BM;
    new_proc->u32 = 0;

    parent = new_proc->proc_parent;
    new_proc->pid = parent->unit->pCharacterData->number;
    new_proc->unit = parent->unit;
    new_proc->item_slot = parent->slot;
}

void StartBmPromotion(ProcPtr proc)
{
    struct Unit *unit;
    struct ProcPromoHandler *new_proc = Proc_StartBlocking(ProcScr_PromoHandler, proc);
    new_proc->bmtype = PROMO_HANDLER_TYPE_PREP;
    new_proc->u32 = 0;
    unit = GetUnit(gActionData.subjectIndex);
    new_proc->pid = unit->pCharacterData->number;
    new_proc->unit = GetUnit(gActionData.subjectIndex);
    new_proc->item_slot = gActionData.itemSlotIndex;
    BMapDispSuspend();
    EndAllMus();
}
