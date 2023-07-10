#include "global.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmmap.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/banims.h"

extern struct Anim *gAnims[4];

CONST_DATA struct ProcCmd ProcScr_EkrMyrrh[] = {
    PROC_SLEEP(0x3C),
    PROC_REPEAT(EkrMyr_PrepareBanimfx),
    PROC_REPEAT(EkrMyr_WaitForTransform),

PROC_LABEL(0),
    PROC_REPEAT(EkrMyr_TrigerForPrepared),
    PROC_REPEAT(EkrMyr_InBattleIdle),
    PROC_REPEAT(EkrMyr_ReturnToLoli),
    PROC_REPEAT(sub_8070AE4),
    PROC_END
};

void NewEkrDragonManakete(struct Anim *anim)
{
    struct EkrDragonStatus *ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon *proc = Proc_Start(ProcScr_EkrMyrrh, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}

void EkrMyr_PrepareBanimfx(struct ProcEkrDragon *proc)
{
    BattleAnim *banim = banim_data;
    struct Anim *anim = proc->anim;
    proc->timer = 0;

    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_INTRO - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPalBackupEkrUnitMaybe);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
    Proc_Break(proc);
}

void EkrMyr_WaitForTransform(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;

    if (++proc->timer == 0x1A) {
        EfxPlaySE(0xDC, 0x100);
        M4aPlayWithPostionCtrl(0xDC, anim->xPosition, 1);
    }

    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EfxPlaySE(0xDE, 0x100);
        M4aPlayWithPostionCtrl(0xDE, anim->xPosition, 1);
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_MAIN - 1);
        Proc_Break(proc);
    }
}

void EkrMyr_TrigerForPrepared(struct ProcEkrDragon *proc)
{
    (void)GetAnimAnotherSide(proc->anim);
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

void EkrMyr_InBattleIdle(struct ProcEkrDragon *proc)
{
    u16 attr = GetEkrDragonStatusAttr(proc->anim);
    if (attr & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrMyr_ReturnToLoli(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    BattleAnim *banim = banim_data;

    if (GetEfxHp(2 * gEfxPairHpBufOffset[GetAnimPosition(anim)] + GetAnimPosition(anim)) <= 0) {

        /* Transform from dragon to loli */
        proc->timer = 0;
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        gEkrSpellAnimIndex[0] = -1;
        Proc_Break(proc);
        return;
    }

    EfxPlaySE(0xDD, 0x100);
    M4aPlayWithPostionCtrl(0xDD, anim->xPosition, 1);
    EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_EXIT - 1);
    SwitchAISFrameDataFromBARoundType(anim, 0);
    Proc_Break(proc);
    LZ77UnCompWram(banim[BANIM_INDEX_MYRRH_INTRO - 1].pal, gPalBackupEkrUnitMaybe);

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x7), 0x40);
    else
        CpuFastCopy(gPalBackupEkrUnitMaybe, PAL_OBJ(0x9), 0x40);

    EnablePaletteSync();
}

void sub_8070AE4(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;
    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_NOWPN - 1);
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);

        if (GetAnimPosition(anim) == EKR_POS_L)
            SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        else
            SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);

        Proc_Break(proc);
    }
}

#if NONMATCHING

static inline void EkrDrgonMyrrhJudge(struct BattleUnit *bu1, struct BattleUnit *bu2, int valid)
{
    int status = bu1->unit.statusIndex;

    if (status == UNIT_STATUS_SLEEP)
        return;

    if (status == UNIT_STATUS_PETRIFY)
        return;

    if (status == UNIT_STATUS_13)
        return;

    if (GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_SLEEP)
        return;

    if (GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_BERSERK)
        return;

    if (GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_SILENCE)
        return;

    if (GetItemIndex(bu2->weaponBefore) == ITEM_MONSTER_STONE)
        return;

    if (UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bu1->unit))) == UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bu2->unit))))
        return;

    if (valid == false)
        return;

    if (GetItemIndex(bu1->weaponBefore) == ITEM_DIVINESTONE)
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_MYRRH);
}

void RegisterEkrDragonStatusType(void)
{
    struct BattleUnit *bu1 = gpEkrBattleUnitLeft;
    struct BattleUnit *bu2 = gpEkrBattleUnitRight;


    int validl = gEkrPairSideVaild[EKR_POS_L];
    int validr = gEkrPairSideVaild[EKR_POS_R];

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        break;
    
    // case EKR_DISTANCE_3:
    // case EKR_DISTANCE_PROMOTION:
    default:
        return;
    }

    switch (UNIT_CLASS_ID(&bu1->unit)) {
    case CLASS_MANAKETE_MYRRH:
        EkrDrgonMyrrhJudge(bu1, bu2, validl);
        break;

    case CLASS_DRACO_ZOMBIE:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_DRACO_ZOMBIE);
        break;

    case CLASS_DEMON_KING:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_DEMON_KING);
        break;

    default:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        break;
    }

    /* Judge another side */
    if (UNIT_CLASS_ID(&bu2->unit) == CLASS_MANAKETE_MYRRH)
        EkrDrgonMyrrhJudge(bu2, bu1, validr);
    else
        SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);
}

#else

__attribute__((naked))
void RegisterEkrDragonStatusType(void)
{
    asm("\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        ldr r0, _08070B84  @ gpEkrBattleUnitLeft\n\
        ldr r0, [r0]\n\
        mov sl, r0\n\
        ldr r0, _08070B88  @ gpEkrBattleUnitRight\n\
        ldr r7, [r0]\n\
        mov r6, sl\n\
        mov r8, r7\n\
        ldr r0, _08070B8C  @ gEkrPairSideVaild\n\
        ldrh r1, [r0]\n\
        mov r9, r1\n\
        ldrh r0, [r0, #2]\n\
        str r0, [sp]\n\
        ldr r0, _08070B90  @ gEkrDistanceType\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        cmp r0, #0\n\
        bge _08070B6C\n\
        b _08070CEE\n\
    _08070B6C:\n\
        cmp r0, #2\n\
        ble _08070B72\n\
        b _08070CEE\n\
    _08070B72:\n\
        ldr r0, [r6, #4]\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, #0x65\n\
        beq _08070C24\n\
        cmp r0, #0x65\n\
        bgt _08070B94\n\
        cmp r0, #0x3c\n\
        beq _08070B9A\n\
        b _08070C44\n\
        .align 2, 0\n\
    _08070B84: .4byte gpEkrBattleUnitLeft\n\
    _08070B88: .4byte gpEkrBattleUnitRight\n\
    _08070B8C: .4byte gEkrPairSideVaild\n\
    _08070B90: .4byte gEkrDistanceType\n\
    _08070B94:\n\
        cmp r0, #0x66\n\
        beq _08070C34\n\
        b _08070C44\n\
    _08070B9A:\n\
        adds r0, r6, #0\n\
        adds r0, #0x30\n\
        ldrb r0, [r0]\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        cmp r1, #2\n\
        beq _08070C4E\n\
        cmp r1, #0xb\n\
        beq _08070C4E\n\
        cmp r1, #0xd\n\
        beq _08070C4E\n\
        adds r4, r7, #0\n\
        adds r4, #0x4a\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x52\n\
        beq _08070C4E\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x53\n\
        beq _08070C4E\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x51\n\
        beq _08070C4E\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0xb5\n\
        beq _08070C4E\n\
        ldr r0, [r6]\n\
        ldrb r0, [r0, #4]\n\
        bl GetUnitFromCharId\n\
        movs r5, #0xb\n\
        ldrsb r5, [r0, r5]\n\
        movs r4, #0xc0\n\
        ands r5, r4\n\
        ldr r0, [r7]\n\
        ldrb r0, [r0, #4]\n\
        bl GetUnitFromCharId\n\
        ldrb r0, [r0, #0xb]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        ands r0, r4\n\
        cmp r5, r0\n\
        beq _08070C4E\n\
        mov r0, r9\n\
        cmp r0, #0\n\
        beq _08070C4E\n\
        adds r0, r6, #0\n\
        adds r0, #0x4a\n\
        ldrh r0, [r0]\n\
        bl GetItemIndex\n\
        cmp r0, #0xaa\n\
        bne _08070C4E\n\
        ldr r0, _08070C20  @ gAnims\n\
        ldr r0, [r0]\n\
        movs r1, #3\n\
        bl SetEkrDragonStatusType\n\
        b _08070C4E\n\
        .align 2, 0\n\
    _08070C20: .4byte gAnims\n\
    _08070C24:\n\
        ldr r0, _08070C30  @ gAnims\n\
        ldr r0, [r0]\n\
        movs r1, #1\n\
        bl SetEkrDragonStatusType\n\
        b _08070C4E\n\
        .align 2, 0\n\
    _08070C30: .4byte gAnims\n\
    _08070C34:\n\
        ldr r0, _08070C40  @ gAnims\n\
        ldr r0, [r0]\n\
        movs r1, #2\n\
        bl SetEkrDragonStatusType\n\
        b _08070C4E\n\
        .align 2, 0\n\
    _08070C40: .4byte gAnims\n\
    _08070C44:\n\
        ldr r0, _08070CE0  @ gAnims\n\
        ldr r0, [r0]\n\
        movs r1, #0\n\
        bl SetEkrDragonStatusType\n\
    _08070C4E:\n\
        mov r1, r8\n\
        ldr r0, [r1, #4]\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, #0x3c\n\
        bne _08070CE4\n\
        mov r0, r8\n\
        adds r0, #0x30\n\
        ldrb r0, [r0]\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        cmp r1, #2\n\
        beq _08070CEE\n\
        cmp r1, #0xb\n\
        beq _08070CEE\n\
        cmp r1, #0xd\n\
        beq _08070CEE\n\
        mov r4, sl\n\
        adds r4, #0x4a\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x52\n\
        beq _08070CEE\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x53\n\
        beq _08070CEE\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0x51\n\
        beq _08070CEE\n\
        ldrh r0, [r4]\n\
        bl GetItemIndex\n\
        cmp r0, #0xb5\n\
        beq _08070CEE\n\
        ldr r0, [r6]\n\
        ldrb r0, [r0, #4]\n\
        bl GetUnitFromCharId\n\
        movs r5, #0xb\n\
        ldrsb r5, [r0, r5]\n\
        movs r4, #0xc0\n\
        ands r5, r4\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        ldrb r0, [r0, #4]\n\
        bl GetUnitFromCharId\n\
        ldrb r0, [r0, #0xb]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        ands r0, r4\n\
        cmp r5, r0\n\
        beq _08070CEE\n\
        ldr r0, [sp]\n\
        cmp r0, #0\n\
        beq _08070CEE\n\
        adds r0, r7, #0\n\
        adds r0, #0x4a\n\
        ldrh r0, [r0]\n\
        bl GetItemIndex\n\
        cmp r0, #0xaa\n\
        bne _08070CEE\n\
        ldr r0, _08070CE0  @ gAnims\n\
        ldr r0, [r0, #8]\n\
        movs r1, #3\n\
        bl SetEkrDragonStatusType\n\
        b _08070CEE\n\
        .align 2, 0\n\
    _08070CE0: .4byte gAnims\n\
    _08070CE4:\n\
        ldr r0, _08070D00  @ gAnims\n\
        ldr r0, [r0, #8]\n\
        movs r1, #0\n\
        bl SetEkrDragonStatusType\n\
    _08070CEE:\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08070D00: .4byte gAnims\n\
        .syntax divided\n\
    ");
}

#endif
