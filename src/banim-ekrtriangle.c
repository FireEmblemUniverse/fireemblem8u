#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"

EWRAM_DATA int gEkrTriangleInvalid = false;

bool CheckEkrTriangleInvalid(void)
{
    if (gEkrTriangleInvalid == true)
        return true;

    return false;
}

void nullsub_18(void)
{
    return;
}

void EkrTriangleMain(struct ProcEkrTriangle *proc);

CONST_DATA struct ProcCmd ProcScr_ekrTriangle[] = {
    PROC_NAME("ekrTriangle"),
    PROC_REPEAT(EkrTriangleMain),
    PROC_END
};

void NewEkrTriangle(struct Anim *anim)
{
    struct ProcEkrTriangle *proc;
    proc = Proc_Start(ProcScr_ekrTriangle, PROC_TREE_3);
    proc->anim = anim;
    gEkrTriangleInvalid = false;
}

void EkrTriangleMain(struct ProcEkrTriangle *proc)
{
    int jid, jid1, jid2, wpn_type;
    int ekrtri_type2;
    int banim_type1;
    int banim_type2;
    int ekrtri_type1;
    struct Unit *unit;
    u16 wpn;
    s32 nine = 9;

    ekrtri_type1 = 0;
    ekrtri_type2 = 0;
    banim_type1 = 0;
    banim_type2 = 0;

    jid = (GetAISSubjectId(proc->anim) == EKR_POS_L) 
        ? gpEkrBattleUnitLeft->unit.pClassData->number
        : gpEkrBattleUnitRight->unit.pClassData->number; 

    if (jid >= nine) {
        if (jid <= 0xC) {
            unit = gpEkrTriangleUnits[0];
            jid1 = unit->pClassData->number;
            if (jid1 == 0x9)
                ekrtri_type1 = 0;
            if (jid1 == 0xA)
                ekrtri_type1 = 0;
            if (jid1 == 0xB)
                ekrtri_type1 = 1;
            if (jid1 == 0xC)
                ekrtri_type1 = 1;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = 1;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case 1:
                banim_type1 = 0;
                break;

            case 2:
                banim_type1 = GetItemIndex(wpn) == 0x28 ? 2 : 1;

            default:
                break;
            }

            unit = gpEkrTriangleUnits[1];
            jid2 = unit->pClassData->number;
            if (jid2 == 0x9)
                ekrtri_type2 = 0;
            if (jid2 == 0xA)
                ekrtri_type2 = 0;
            if (jid2 == 0xB)
                ekrtri_type2 = 1;
            if (jid2 == 0xC)
                ekrtri_type2 = 1;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = 1;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case 1:
                banim_type2 = 0;
                break;

            case 2:
                banim_type2 = GetItemIndex(wpn) == 0x28 ? 2 : 1;
                break;

            default:
                break;
            }

            NewEkrTriArmorKnight(proc->anim, ekrtri_type1, ekrtri_type2, banim_type1, banim_type2);

            if (GetItemIndex(gpEkrBattleUnitRight->weaponBefore) == 0x28)
                gEkrTriangleInvalid = false;
            else
                gEkrTriangleInvalid = true;
            goto proc_break;
        }
    }

    unit = gpEkrTriangleUnits[0];
    jid1 = unit->pClassData->number;
    if (jid1 == 0x48)
        ekrtri_type1 = 0;
    if (jid1 == 0x49)
        ekrtri_type1 = 1;
    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = 1;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case 1:
        banim_type1 = 0;
        break;

    case 0:
        banim_type1 = 1;
        break;

    default:
        break;
    }

    unit = gpEkrTriangleUnits[1];
    jid2 = unit->pClassData->number;
    if (jid2 == 0x48)
        ekrtri_type2 = 0;
    if (jid2 == 0x49)
        ekrtri_type2 = 1;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = 1;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case 1:
        banim_type2 = 0;
        break;

    case 0:
        banim_type2 = 1;
        break;
    }

    NewEkrTriPegasusKnight(proc->anim, ekrtri_type1, ekrtri_type2, banim_type1, banim_type2);

    if (jid == 0x48)
        gEkrTriangleInvalid = false;
    else
        gEkrTriangleInvalid = true;
proc_break:
    Proc_Break(proc);
}

ProcPtr NewEkrTriPegasusKnight(struct Anim *anim, int ekr1, int ekr2, int banim1, int banim2)
{
    struct ProcEkrTriPegasusKnight *proc;
    proc = Proc_Start(ProcScr_ekrTriPegasusKnight, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->ekr1 = ekr1;
    proc->ekr2 = ekr2;
    proc->banim1 = banim1;
    proc->banim2 = banim2;
    return proc;
}
