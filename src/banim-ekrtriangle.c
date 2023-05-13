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

/* https://decomp.me/scratch/Ar1qL */
#if NONMATCHING

void EkrTriangleMain(struct ProcEkrTriangle *proc)
{
    int jid, jid1, jid2, wpn_type;
    int ekrtri_type2;
    int banim_type1;
    int banim_type2;
    int ekrtri_type1;
    struct Unit *unit;
    u16 wpn;

    ekrtri_type1 = 0;
    ekrtri_type2 = 0;
    banim_type1 = 0;
    banim_type2 = 0;

    jid = (GetAISSubjectId(proc->anim) == EKR_BATTLE_LEFT) 
        ? gpEkrBattleUnitLeft->unit.pClassData->number
        : gpEkrBattleUnitRight->unit.pClassData->number; 

    switch (jid) {
    case 0xC:
    case 0xB:
    case 0xA:
    case 0x9:
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
        break;

    default:
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
        break;
    }

    Proc_Break(proc);
}

#else
__attribute__((naked))
void EkrTriangleMain(struct ProcEkrTriangle *proc)
{
    asm(".syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        adds r6, r0, #0\n\
        movs r0, #0\n\
        mov r9, r0\n\
        mov sl, r0\n\
        mov r8, r0\n\
        movs r7, #0\n\
        ldr r0, [r6, #0x5c]\n\
        bl GetAISSubjectId\n\
        cmp r0, #0\n\
        bne _08074FAC\n\
        ldr r0, _08074FA8  @ gpEkrBattleUnitLeft\n\
        b _08074FAE\n\
        .align 2, 0\n\
    _08074FA8: .4byte gpEkrBattleUnitLeft\n\
    _08074FAC:\n\
        ldr r0, _08074FFC  @ gpEkrBattleUnitRight\n\
    _08074FAE:\n\
        ldr r0, [r0]\n\
        ldr r0, [r0, #4]\n\
        ldrb r5, [r0, #4]\n\
        cmp r5, #9\n\
        bge _08074FBA\n\
        b _080750BC\n\
    _08074FBA:\n\
        cmp r5, #0xc\n\
        ble _08074FC0\n\
        b _080750BC\n\
    _08074FC0:\n\
        ldr r0, _08075000  @ gpEkrTriangleUnits\n\
        ldr r1, [r0]\n\
        ldr r0, [r1, #4]\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, #9\n\
        bne _08074FD0\n\
        movs r2, #0\n\
        mov r9, r2\n\
    _08074FD0:\n\
        cmp r0, #0xa\n\
        bne _08074FD8\n\
        movs r2, #0\n\
        mov r9, r2\n\
    _08074FD8:\n\
        cmp r0, #0xb\n\
        bne _08074FE0\n\
        movs r2, #1\n\
        mov r9, r2\n\
    _08074FE0:\n\
        cmp r0, #0xc\n\
        bne _08074FE8\n\
        movs r0, #1\n\
        mov r9, r0\n\
    _08074FE8:\n\
        adds r0, r1, #0\n\
        bl GetUnitEquippedWeapon\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        cmp r4, #0\n\
        bne _08075004\n\
        movs r0, #1\n\
        b _0807500A\n\
        .align 2, 0\n\
    _08074FFC: .4byte gpEkrBattleUnitRight\n\
    _08075000: .4byte gpEkrTriangleUnits\n\
    _08075004:\n\
        adds r0, r4, #0\n\
        bl GetItemType\n\
    _0807500A:\n\
        cmp r0, #1\n\
        beq _08075014\n\
        cmp r0, #2\n\
        beq _0807501A\n\
        b _0807502C\n\
    _08075014:\n\
        movs r1, #0\n\
        mov r8, r1\n\
        b _0807502C\n\
    _0807501A:\n\
        adds r0, r4, #0\n\
        bl GetItemIndex\n\
        movs r2, #1\n\
        mov r8, r2\n\
        cmp r0, #0x28\n\
        bne _0807502C\n\
        movs r0, #2\n\
        mov r8, r0\n\
    _0807502C:\n\
        ldr r0, _08075068  @ gpEkrTriangleUnits\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r1, #4]\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, #9\n\
        bne _0807503C\n\
        movs r2, #0\n\
        mov sl, r2\n\
    _0807503C:\n\
        cmp r0, #0xa\n\
        bne _08075044\n\
        movs r2, #0\n\
        mov sl, r2\n\
    _08075044:\n\
        cmp r0, #0xb\n\
        bne _0807504C\n\
        movs r2, #1\n\
        mov sl, r2\n\
    _0807504C:\n\
        cmp r0, #0xc\n\
        bne _08075054\n\
        movs r0, #1\n\
        mov sl, r0\n\
    _08075054:\n\
        adds r0, r1, #0\n\
        bl GetUnitEquippedWeapon\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        cmp r4, #0\n\
        bne _0807506C\n\
        movs r0, #1\n\
        b _08075072\n\
        .align 2, 0\n\
    _08075068: .4byte gpEkrTriangleUnits\n\
    _0807506C:\n\
        adds r0, r4, #0\n\
        bl GetItemType\n\
    _08075072:\n\
        cmp r0, #1\n\
        beq _0807507C\n\
        cmp r0, #2\n\
        beq _08075080\n\
        b _0807508E\n\
    _0807507C:\n\
        movs r7, #0\n\
        b _0807508E\n\
    _08075080:\n\
        adds r0, r4, #0\n\
        bl GetItemIndex\n\
        movs r7, #1\n\
        cmp r0, #0x28\n\
        bne _0807508E\n\
        movs r7, #2\n\
    _0807508E:\n\
        ldr r0, [r6, #0x5c]\n\
        str r7, [sp]\n\
        mov r1, r9\n\
        mov r2, sl\n\
        mov r3, r8\n\
        bl NewEkrTriArmorKnight\n\
        ldr r0, _080750B4  @ gpEkrBattleUnitRight\n\
        ldr r0, [r0]\n\
        adds r0, #0x4a\n\
        ldrh r0, [r0]\n\
        bl GetItemIndex\n\
        cmp r0, #0x28\n\
        bne _08075164\n\
        ldr r1, _080750B8  @ gEkrTriangleInvalid\n\
        movs r0, #0\n\
        b _08075168\n\
        .align 2, 0\n\
    _080750B4: .4byte gpEkrBattleUnitRight\n\
    _080750B8: .4byte gEkrTriangleInvalid\n\
    _080750BC:\n\
        ldr r0, _080750E8  @ gpEkrTriangleUnits\n\
        ldr r1, [r0]\n\
        ldr r0, [r1, #4]\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, #0x48\n\
        bne _080750CC\n\
        movs r2, #0\n\
        mov r9, r2\n\
    _080750CC:\n\
        cmp r0, #0x49\n\
        bne _080750D4\n\
        movs r0, #1\n\
        mov r9, r0\n\
    _080750D4:\n\
        adds r0, r1, #0\n\
        bl GetUnitEquippedWeapon\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        cmp r4, #0\n\
        bne _080750EC\n\
        movs r0, #1\n\
        b _080750F6\n\
        .align 2, 0\n\
    _080750E8: .4byte gpEkrTriangleUnits\n\
    _080750EC:\n\
        adds r0, r4, #0\n\
        bl GetItemType\n\
        cmp r0, #0\n\
        beq _08075100\n\
    _080750F6:\n\
        cmp r0, #1\n\
        bne _08075104\n\
        movs r1, #0\n\
        mov r8, r1\n\
        b _08075104\n\
    _08075100:\n\
        movs r2, #1\n\
        mov r8, r2\n\
    _08075104:\n\
        ldr r0, _08075130  @ gpEkrTriangleUnits\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r1, #4]\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, #0x48\n\
        bne _08075114\n\
        movs r2, #0\n\
        mov sl, r2\n\
    _08075114:\n\
        cmp r0, #0x49\n\
        bne _0807511C\n\
        movs r0, #1\n\
        mov sl, r0\n\
    _0807511C:\n\
        adds r0, r1, #0\n\
        bl GetUnitEquippedWeapon\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        cmp r4, #0\n\
        bne _08075134\n\
        movs r0, #1\n\
        b _0807513E\n\
        .align 2, 0\n\
    _08075130: .4byte gpEkrTriangleUnits\n\
    _08075134:\n\
        adds r0, r4, #0\n\
        bl GetItemType\n\
        cmp r0, #0\n\
        beq _08075146\n\
    _0807513E:\n\
        cmp r0, #1\n\
        bne _08075148\n\
        movs r7, #0\n\
        b _08075148\n\
    _08075146:\n\
        movs r7, #1\n\
    _08075148:\n\
        ldr r0, [r6, #0x5c]\n\
        str r7, [sp]\n\
        mov r1, r9\n\
        mov r2, sl\n\
        mov r3, r8\n\
        bl NewEkrTriPegasusKnight\n\
        cmp r5, #0x48\n\
        bne _08075164\n\
        ldr r1, _08075160  @ gEkrTriangleInvalid\n\
        movs r0, #0\n\
        b _08075168\n\
        .align 2, 0\n\
    _08075160: .4byte gEkrTriangleInvalid\n\
    _08075164:\n\
        ldr r1, _08075180  @ gEkrTriangleInvalid\n\
        movs r0, #1\n\
    _08075168:\n\
        str r0, [r1]\n\
        adds r0, r6, #0\n\
        bl Proc_Break\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08075180: .4byte gEkrTriangleInvalid\n\
        .syntax divided");
}
#endif

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
