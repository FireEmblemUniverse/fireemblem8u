#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"

extern struct Anim *gAnims[4];

void sub_80598CC(struct Anim *anim)
{
    u32 inst;

    if (sub_805A1D0(anim->currentRoundType) == false)
        return;

    if (anim->pScrCurrent == gUnknown_085B9D5C)
        return;

    while (1) {
        inst = ANINS_GET_TYPE(*anim->pScrCurrent);

        if (inst == 0) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == 5) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == 6)
            anim->pScrCurrent += 3;
    }

}

void NewEkrChienCHR(struct Anim *anim)
{
    struct ProcEkrChienCHR *proc;
    proc = Proc_Start(gProc_ekrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}

void EkrChienCHRMain(struct ProcEkrChienCHR *proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}

void RegisterAISSheetGraphics(struct Anim *anim)
{
    void *mmap;
    mmap = (void *)0x06010000 + (anim->oam2Base & 0x3FF) * 0x20;
    LZ77UnCompWram(anim->pImgSheet, anim->pUnk2C);
    RegisterDataMove(anim->pUnk2C, mmap, 0x2000);
}

void sub_8059970(u32 *buf, int pos)
{
    u32 i;

    if (gUnknown_0203E1DC[pos] == 0)
        return;

    for (i = 0; i < 8; i++)
        buf[i] = buf[i + 0x20];
}

int GetBanimPalette(int banim_id, enum ekr_battle_unit_position pos)
{
    u32 jid;
    struct BattleUnit *bu;

    if (EKR_POS_L == pos)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    jid = bu->unit.pClassData->number;
    switch (jid) {
    case CLASS_ARCHER:
        return 0x25;
    
    case CLASS_ARCHER_F:
        return 0x27;
    
    case CLASS_SNIPER:
        return 0x29;
    
    case CLASS_SNIPER_F:
        return 0x2B;
    
    default:
        return banim_id;
    }
}

/* https://decomp.me/scratch/fa65Y */
#if NONMATCHING

void UpdateBanimFrame(void)
{
    int val1;
    struct Unit *unit;
    BattleAnim *banim = banim_data;

    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gEkrPairSideVaild[EKR_POS_L] == true) {
        int bid = gEkrPairBanimID2[EKR_POS_L];
        int bid_pal = gBanimSomeObjPalIndex[EKR_POS_L];
        int bside = gBattleInitSide[EKR_POS_L];

        LZ77UnCompWram(banim[bid].script, gBanimScrLeft);
        gpBanimModesLeft = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 0)].pal, gBanimPal1);

        if (bside != -1) {
            LZ77UnCompWram(character_battle_animation_palette_table[bside].pal, gBanimPal1);
            sub_8059970((u32 *)gBanimPal1, 0);
        }

        gpEfxUnitPaletteBackup[0] = &PAL_BUF_COLOR(gBanimPal1, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPal1, bid_pal, 0), PAL_OBJ(0x7), 0x20);
        CpuFastCopy(gBanimCharacterTSAs[0], PAL_OBJ(0x8), 0x20);

        if (gBattleActor.unit.statusIndex == 0xB || gBattleActor.unit.statusIndex == 0xD)
            sub_8071468(gPaletteBuffer, PAL_OBJ(0x7), 0x1);

        if (gBattleTarget.unit.statusIndex == 0xB || gBattleTarget.unit.statusIndex == 0xD)
            sub_8071468(gPaletteBuffer, PAL_OBJ(0x8), 0x1);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_l, gBanimOaml);
        gBanimOaml[0x57F0 / 4] = 1;
    }

    if (gEkrPairSideVaild[EKR_POS_R] == true) {
        int bid = gEkrPairBanimID2[EKR_POS_R];
        int bid_pal = gBanimSomeObjPalIndex[EKR_POS_R];
        int bside = gBattleInitSide[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPal2);

        if (bside != -1) {
            LZ77UnCompWram(character_battle_animation_palette_table[bside].pal, gBanimPal2);
            sub_8059970((u32 *)gBanimPal2, 1);
        }

        gpEfxUnitPaletteBackup[1] = &PAL_BUF_COLOR(gBanimPal2, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPal2, bid_pal, 0), PAL_OBJ(0x9), 0x20);
        CpuFastCopy(gBanimCharacterTSAs[1], PAL_OBJ(0xA), 0x20);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_r, gBanimOamr2);
        gBanimOamr2[0x57F0 / 4] = 1;
    }

    if (gpEkrTriangleUnits[0] != NULL) {
        u16 pid, jid;
        u32 i;

        gBanimCharacterTSAs[0] = banim_data[sub_8057CAC(gpEkrTriangleUnits[0], gpEkrTriangleUnits[0]->pClassData->pBattleAnimDef, 0, &val1)].pal;

        pid = gpEkrTriangleUnits[0]->pCharacterData->number - 1;
        jid = gpEkrTriangleUnits[0]->pClassData->number;


        for (i = 0; i < 7; i++) {
            if (gUnknown_0895E0A4[i + pid * 7] == jid) {
                gBanimCharacterTSAs[1] = character_battle_animation_palette_table[gUnknown_0895EEA4[i + pid * 7] - 1].pal;
                return;
            }
        }
    }
}

#else
__attribute__((naked))
void UpdateBanimFrame(void)
{
    asm("\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        ldr r0, _08059BD8  @ banim_data\n\
        mov sl, r0\n\
        ldr r1, _08059BDC  @ gpImgSheet\n\
        movs r0, #0\n\
        str r0, [r1, #4]\n\
        str r0, [r1]\n\
        ldr r0, _08059BE0  @ gEkrPairSideVaild\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        cmp r0, #1\n\
        bne _08059ADE\n\
        ldr r0, _08059BE4  @ gEkrPairBanimID2\n\
        movs r2, #0\n\
        ldrsh r7, [r0, r2]\n\
        ldr r0, _08059BE8  @ gBanimSomeObjPalIndex\n\
        movs r2, #0\n\
        ldrsh r1, [r0, r2]\n\
        mov r8, r1\n\
        ldr r0, _08059BEC  @ gBattleInitSide\n\
        movs r1, #0\n\
        ldrsh r5, [r0, r1]\n\
        lsls r4, r7, #5\n\
        add r4, sl\n\
        ldr r0, [r4, #0x10]\n\
        ldr r1, _08059BF0  @ gBanimScrLeft\n\
        bl LZ77UnCompWram\n\
        ldr r1, _08059BF4  @ gpBanimModesLeft\n\
        ldr r0, [r4, #0xc]\n\
        str r0, [r1]\n\
        adds r0, r7, #0\n\
        movs r1, #0\n\
        bl GetBanimPalette\n\
        lsls r0, r0, #5\n\
        add r0, sl\n\
        ldr r0, [r0, #0x1c]\n\
        ldr r4, _08059BF8  @ gBanimPal1\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r5, r0\n\
        beq _08059A64\n\
        lsls r0, r5, #4\n\
        ldr r2, _08059BFC  @ character_battle_animation_palette_table\n\
        adds r0, r0, r2\n\
        ldr r0, [r0, #0xc]\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        adds r0, r4, #0\n\
        movs r1, #0\n\
        bl sub_8059970\n\
    _08059A64:\n\
        ldr r1, _08059C00  @ gpEfxUnitPaletteBackup\n\
        mov r2, r8\n\
        lsls r0, r2, #5\n\
        adds r0, r0, r4\n\
        str r0, [r1]\n\
        ldr r4, _08059C04  @ gUnknown_02022B88\n\
        adds r1, r4, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        ldr r0, _08059C08  @ gBanimCharacterTSAs\n\
        ldr r0, [r0]\n\
        adds r1, r4, #0\n\
        adds r1, #0x20\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        ldr r0, _08059C0C  @ gBattleActor\n\
        adds r0, #0x30\n\
        ldrb r0, [r0]\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        cmp r1, #0xb\n\
        beq _08059A98\n\
        cmp r1, #0xd\n\
        bne _08059AA4\n\
    _08059A98:\n\
        ldr r1, _08059C10  @ 0xFFFFFD20\n\
        adds r0, r4, r1\n\
        adds r1, r4, #0\n\
        movs r2, #1\n\
        bl sub_8071468\n\
    _08059AA4:\n\
        ldr r0, _08059C14  @ gBattleTarget\n\
        adds r0, #0x30\n\
        ldrb r0, [r0]\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        cmp r1, #0xb\n\
        beq _08059AB6\n\
        cmp r1, #0xd\n\
        bne _08059AC4\n\
    _08059AB6:\n\
        ldr r0, _08059C18  @ gPaletteBuffer\n\
        movs r2, #0xc0\n\
        lsls r2, r2, #2\n\
        adds r1, r0, r2\n\
        movs r2, #1\n\
        bl sub_8071468\n\
    _08059AC4:\n\
        bl EnablePaletteSync\n\
        lsls r0, r7, #5\n\
        add r0, sl\n\
        ldr r0, [r0, #0x18]\n\
        ldr r4, _08059C1C  @ gBanimOaml\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        ldr r0, _08059C20  @ 0x000057F0\n\
        adds r4, r4, r0\n\
        movs r0, #1\n\
        str r0, [r4]\n\
    _08059ADE:\n\
        ldr r0, _08059BE0  @ gEkrPairSideVaild\n\
        movs r2, #2\n\
        ldrsh r1, [r0, r2]\n\
        mov r9, r1\n\
        cmp r1, #1\n\
        bne _08059B7E\n\
        ldr r0, _08059BE4  @ gEkrPairBanimID2\n\
        movs r1, #2\n\
        ldrsh r7, [r0, r1]\n\
        ldr r0, _08059BE8  @ gBanimSomeObjPalIndex\n\
        movs r1, #2\n\
        ldrsh r2, [r0, r1]\n\
        mov r8, r2\n\
        ldr r0, _08059BEC  @ gBattleInitSide\n\
        movs r2, #2\n\
        ldrsh r5, [r0, r2]\n\
        lsls r0, r7, #5\n\
        mov r1, sl\n\
        adds r6, r0, r1\n\
        ldr r0, [r6, #0x10]\n\
        ldr r1, _08059C24  @ gBanimScrRight\n\
        bl LZ77UnCompWram\n\
        ldr r1, _08059C28  @ gpBanimModesRight\n\
        ldr r0, [r6, #0xc]\n\
        str r0, [r1]\n\
        adds r0, r7, #0\n\
        movs r1, #1\n\
        bl GetBanimPalette\n\
        lsls r0, r0, #5\n\
        add r0, sl\n\
        ldr r0, [r0, #0x1c]\n\
        ldr r4, _08059C2C  @ gBanimPal2\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r5, r0\n\
        beq _08059B46\n\
        lsls r0, r5, #4\n\
        ldr r2, _08059BFC  @ character_battle_animation_palette_table\n\
        adds r0, r0, r2\n\
        ldr r0, [r0, #0xc]\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        adds r0, r4, #0\n\
        movs r1, #1\n\
        bl sub_8059970\n\
    _08059B46:\n\
        ldr r1, _08059C00  @ gpEfxUnitPaletteBackup\n\
        mov r2, r8\n\
        lsls r0, r2, #5\n\
        adds r0, r0, r4\n\
        str r0, [r1, #4]\n\
        ldr r4, _08059C30  @ gUnknown_02022BC8\n\
        adds r1, r4, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        ldr r0, _08059C08  @ gBanimCharacterTSAs\n\
        ldr r0, [r0, #4]\n\
        adds r4, #0x20\n\
        adds r1, r4, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        bl EnablePaletteSync\n\
        ldr r0, [r6, #0x14]\n\
        ldr r4, _08059C34  @ gBanimOamr2\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        ldr r0, _08059C20  @ 0x000057F0\n\
        adds r4, r4, r0\n\
        mov r1, r9\n\
        str r1, [r4]\n\
    _08059B7E:\n\
        ldr r4, _08059C38  @ gpEkrTriangleUnits\n\
        ldr r2, [r4]\n\
        cmp r2, #0\n\
        bne _08059B88\n\
        b _08059D06\n\
    _08059B88:\n\
        ldr r0, [r2, #4]\n\
        ldr r1, [r0, #0x34]\n\
        adds r0, r2, #0\n\
        movs r2, #0\n\
        mov r3, sp\n\
        bl sub_8057CAC\n\
        lsls r0, r0, #0x10\n\
        ldr r2, _08059C08  @ gBanimCharacterTSAs\n\
        lsrs r0, r0, #0xb\n\
        add r0, sl\n\
        ldr r0, [r0, #0x1c]\n\
        str r0, [r2]\n\
        ldr r1, [r4]\n\
        ldr r0, [r1]\n\
        ldrb r0, [r0, #4]\n\
        subs r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        ldr r0, [r1, #4]\n\
        ldrb r5, [r0, #4]\n\
        movs r3, #0\n\
        ldr r0, _08059C3C  @ gUnknown_0895E0A4\n\
        lsls r1, r4, #3\n\
        subs r1, r1, r4\n\
        adds r0, r1, r0\n\
        ldrb r0, [r0]\n\
        cmp r0, r5\n\
        bne _08059C44\n\
        ldr r0, _08059C40  @ gUnknown_0895EEA4\n\
        adds r0, r1, r0\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #4\n\
        ldr r1, _08059BFC  @ character_battle_animation_palette_table\n\
        adds r0, r0, r1\n\
        subs r0, #0x10\n\
        ldr r0, [r0, #0xc]\n\
        str r0, [r2]\n\
        b _08059C72\n\
        .align 2, 0\n\
    _08059BD8: .4byte banim_data\n\
    _08059BDC: .4byte gpImgSheet\n\
    _08059BE0: .4byte gEkrPairSideVaild\n\
    _08059BE4: .4byte gEkrPairBanimID2\n\
    _08059BE8: .4byte gBanimSomeObjPalIndex\n\
    _08059BEC: .4byte gBattleInitSide\n\
    _08059BF0: .4byte gBanimScrLeft\n\
    _08059BF4: .4byte gpBanimModesLeft\n\
    _08059BF8: .4byte gBanimPal1\n\
    _08059BFC: .4byte character_battle_animation_palette_table\n\
    _08059C00: .4byte gpEfxUnitPaletteBackup\n\
    _08059C04: .4byte gUnknown_02022B88\n\
    _08059C08: .4byte gBanimCharacterTSAs\n\
    _08059C0C: .4byte gBattleActor\n\
    _08059C10: .4byte 0xFFFFFD20\n\
    _08059C14: .4byte gBattleTarget\n\
    _08059C18: .4byte gPaletteBuffer\n\
    _08059C1C: .4byte gBanimOaml\n\
    _08059C20: .4byte 0x000057F0\n\
    _08059C24: .4byte gBanimScrRight\n\
    _08059C28: .4byte gpBanimModesRight\n\
    _08059C2C: .4byte gBanimPal2\n\
    _08059C30: .4byte gUnknown_02022BC8\n\
    _08059C34: .4byte gBanimOamr2\n\
    _08059C38: .4byte gpEkrTriangleUnits\n\
    _08059C3C: .4byte gUnknown_0895E0A4\n\
    _08059C40: .4byte gUnknown_0895EEA4\n\
    _08059C44:\n\
        adds r0, r3, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r3, r0, #0x10\n\
        cmp r3, #6\n\
        bhi _08059C72\n\
        ldr r0, _08059CC4  @ gUnknown_0895E0A4\n\
        lsls r1, r4, #3\n\
        subs r1, r1, r4\n\
        adds r2, r3, r1\n\
        adds r0, r2, r0\n\
        ldrb r0, [r0]\n\
        cmp r0, r5\n\
        bne _08059C44\n\
        ldr r1, _08059CC8  @ gBanimCharacterTSAs\n\
        ldr r0, _08059CCC  @ gUnknown_0895EEA4\n\
        adds r0, r2, r0\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #4\n\
        ldr r2, _08059CD0  @ character_battle_animation_palette_table\n\
        adds r0, r0, r2\n\
        subs r0, #0x10\n\
        ldr r0, [r0, #0xc]\n\
        str r0, [r1]\n\
    _08059C72:\n\
        ldr r4, _08059CD4  @ gpEkrTriangleUnits\n\
        ldr r0, [r4, #4]\n\
        ldr r1, [r0, #4]\n\
        ldr r1, [r1, #0x34]\n\
        movs r2, #0\n\
        mov r3, sp\n\
        bl sub_8057CAC\n\
        lsls r0, r0, #0x10\n\
        ldr r2, _08059CC8  @ gBanimCharacterTSAs\n\
        lsrs r0, r0, #0xb\n\
        add r0, sl\n\
        ldr r0, [r0, #0x1c]\n\
        str r0, [r2, #4]\n\
        ldr r1, [r4, #4]\n\
        ldr r0, [r1]\n\
        ldrb r0, [r0, #4]\n\
        subs r0, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        ldr r0, [r1, #4]\n\
        ldrb r5, [r0, #4]\n\
        movs r3, #0\n\
        ldr r0, _08059CC4  @ gUnknown_0895E0A4\n\
        lsls r1, r4, #3\n\
        subs r1, r1, r4\n\
        adds r0, r1, r0\n\
        ldrb r0, [r0]\n\
        cmp r0, r5\n\
        bne _08059CD8\n\
        ldr r0, _08059CCC  @ gUnknown_0895EEA4\n\
        adds r0, r1, r0\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #4\n\
        ldr r1, _08059CD0  @ character_battle_animation_palette_table\n\
        adds r0, r0, r1\n\
        subs r0, #0x10\n\
        ldr r0, [r0, #0xc]\n\
        str r0, [r2, #4]\n\
        b _08059D06\n\
        .align 2, 0\n\
    _08059CC4: .4byte gUnknown_0895E0A4\n\
    _08059CC8: .4byte gBanimCharacterTSAs\n\
    _08059CCC: .4byte gUnknown_0895EEA4\n\
    _08059CD0: .4byte character_battle_animation_palette_table\n\
    _08059CD4: .4byte gpEkrTriangleUnits\n\
    _08059CD8:\n\
        adds r0, r3, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r3, r0, #0x10\n\
        cmp r3, #6\n\
        bhi _08059D06\n\
        ldr r0, _08059D18  @ gUnknown_0895E0A4\n\
        lsls r1, r4, #3\n\
        subs r1, r1, r4\n\
        adds r2, r3, r1\n\
        adds r0, r2, r0\n\
        ldrb r0, [r0]\n\
        cmp r0, r5\n\
        bne _08059CD8\n\
        ldr r1, _08059D1C  @ gBanimCharacterTSAs\n\
        ldr r0, _08059D20  @ gUnknown_0895EEA4\n\
        adds r0, r2, r0\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #4\n\
        ldr r2, _08059D24  @ character_battle_animation_palette_table\n\
        adds r0, r0, r2\n\
        subs r0, #0x10\n\
        ldr r0, [r0, #0xc]\n\
        str r0, [r1, #4]\n\
    _08059D06:\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08059D18: .4byte gUnknown_0895E0A4\n\
    _08059D1C: .4byte gBanimCharacterTSAs\n\
    _08059D20: .4byte gUnknown_0895EEA4\n\
    _08059D24: .4byte character_battle_animation_palette_table\n\
        .syntax divided\n\
    ");
}
#endif

void sub_8059D28(void)
{
    struct Anim *anim1, *anim2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_3:
    case EKR_DISTANCE_PROMOTION:
        sub_8059DB8(6, 6);
        break;

    case EKR_DISTANCE_FAR:
        sub_8059DB8(8, 8);
        break;

    case EKR_DISTANCE_FARFAR:
        sub_8059DB8(8, 8);

        if (GetEkrSomePosMaybe() == EKR_POS_L) {
            anim1 = gAnims[2];
            anim1->xPosition = 0x180;

            anim2 = gAnims[3];
            anim2->xPosition = 0x180;
        } else {
            anim1 = gAnims[0];
            anim1->xPosition = 0x180;

            anim2 = gAnims[1];
            anim2->xPosition = 0x180;
        }
        break;

    default:
        break;
    }

    gEfxPairHpBufOffset[0] = 0;
    gEfxPairHpBufOffset[1] = 0;
}

void sub_8059DB8(int a, int b)
{
    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    if (gEkrPairSideVaild[EKR_POS_L] == true)
        sub_8059E18(a);

    if (gEkrPairSideVaild[EKR_POS_R] == true)
        sub_8059F5C(b);
    
    if (gEkrDistanceType == 4) {
        gAnims[0]->state |= 0x2;
        gAnims[1]->state |= 0x2;
    }
}

#if 0
void sub_8059E18(int arg)
{
    void *scr;
    struct Anim *anim;
    int r5 = gBanimRoundScripts[arg].frame_front;
    int r6 = gBanimRoundScripts[arg].priority_front;
    int r8 = gBanimRoundScripts[arg].frame_back;
    int r9 = gBanimRoundScripts[arg].priority_back;
    int r4 = gUnknown_080DAF1D[gEkrDistanceType];

    gUnknown_02000030[0] = -gUnknown_080DAF28[gEkrDistanceType];
    gUnknown_02000034[0] = 0;
    gEkrXPosBase[0] = r4 - gUnknown_080DAF28[gEkrDistanceType];
    gEkrYPosBase[0] = 0x58;

    scr = gBanimScrLeft + (*gpBanimModesLeft)[r5];

    if (r5 == 0xFF)
        scr = gUnknown_085B9D5C;
    
    anim = AnimCreate(scr, r6);
    anim->xPosition = gEkrXPosBase[0] - gEkrBgXOffset;
    anim->yPosition = gEkrYPosBase[0];
    anim->oam2Base = 0x7A00;
    anim->state2 |= 0x400;
    anim->nextRoundId = 0x0;
    anim->currentRoundType = arg;
    anim->pUnk2C = gUnknown_02000088;
    anim->pSpriteDataPool = gBanimOaml;
    gAnims[0] = anim;

    scr = gBanimScrLeft + (*gpBanimModesLeft)[r8];

    if (r8 == 0xFF)
        scr = gUnknown_085B9D5C;
    
    anim = AnimCreate(scr, r9);
    anim->xPosition = gEkrXPosBase[0] - gEkrBgXOffset;
    anim->yPosition = gEkrYPosBase[0];
    anim->oam2Base = 0x7A00;
    anim->state2 |= 0x500;
    anim->nextRoundId = 0x0;
    anim->currentRoundType = arg;
    anim->pUnk2C = gUnknown_02000088;
    anim->pSpriteDataPool = gBanimOaml;
    gAnims[1] = anim;
}
#endif
