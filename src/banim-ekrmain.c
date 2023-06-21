#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "banim_data.h"
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

void UpdateBanimFrame(void)
{
    int val1;
    int bid, bid_pal, bside;
    BattleAnimCharaPal *cbapt = character_battle_animation_palette_table;
    BattleAnim *banim = banim_data;

    ++banim; --banim;
    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gEkrPairSideVaild[EKR_POS_L] == true) {
        bid = gEkrPairBanimID2[EKR_POS_L];
        bid_pal = gBanimSomeObjPalIndex[EKR_POS_L];
        bside = gBattleInitSide[EKR_POS_L];

        LZ77UnCompWram(banim[bid].script, gBanimScrLeft);
        gpBanimModesLeft = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 0)].pal, gBanimPal1);

        if (bside != -1) {
            LZ77UnCompWram(cbapt[bside].pal, gBanimPal1);
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
        bid = gEkrPairBanimID2[EKR_POS_R];
        bid_pal = gBanimSomeObjPalIndex[EKR_POS_R];
        bside = gBattleInitSide[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPal2);

        if (bside != -1) {
            LZ77UnCompWram(cbapt[bside].pal, gBanimPal2);
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
        {
            u16 pid, jid;
            u16 i;
            u16 idx = sub_8057CAC(gpEkrTriangleUnits[0], gpEkrTriangleUnits[0]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimCharacterTSAs[0] = banim[idx].pal;

            pid = gpEkrTriangleUnits[0]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[0]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gUnknown_0895E0A4[i + pid * 7] == jid) {
                    gBanimCharacterTSAs[0] = cbapt[gUnknown_0895EEA4[i + pid * 7] - 1].pal;
                    break;
                }
            }
        }
        {
            u16 pid, jid;
            u16 i;
            u16 idx = sub_8057CAC(gpEkrTriangleUnits[1], gpEkrTriangleUnits[1]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimCharacterTSAs[1] = banim[idx].pal;

            pid = gpEkrTriangleUnits[1]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[1]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gUnknown_0895E0A4[i + pid * 7] == jid) {
                    gBanimCharacterTSAs[1] = cbapt[gUnknown_0895EEA4[i + pid * 7] - 1].pal;
                    break;
                }
            }
        }
    }
}

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

void sub_8059E18(int arg)
{
    struct Anim *anim;
    u32 frame_front = gBanimRoundScripts[arg * 4 + 0];
    u32 priority_front = gBanimRoundScripts[arg * 4 + 1];
    u32 frame_back = gBanimRoundScripts[arg * 4 + 2];
    u32 priority_back = gBanimRoundScripts[arg * 4 + 3];
    u32 r4 = gUnknown_080DAF1D[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;

    gUnknown_02000030[0] = -gUnknown_080DAF28[gEkrDistanceType];
    gUnknown_02000034[0] = 0;
    gEkrXPosBase[0] = gUnknown_02000030[0] + r4;
    gEkrYPosBase[0] = 0x58;

label1:
    {
        u32 idx = gpBanimModesLeft[frame_front];
        void *scr = gBanimScrLeft + idx;
        if (frame_front == 0xFF)
            scr = gUnknown_085B9D5C;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosBase[0] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[0];
        anim->oam2Base = 0x7A00;
        anim->state2 |= 0x400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02000088;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[0] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesLeft[frame_back];
        void *scr = gBanimScrLeft + idx;
        if (frame_back == 0xFF)
            scr = gUnknown_085B9D5C;
        anim = AnimCreate(scr, priority_back);
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
}

void sub_8059F5C(int arg)
{
    struct Anim *anim;
    u32 frame_front = gBanimRoundScripts[arg * 4 + 0];
    u32 priority_front = gBanimRoundScripts[arg * 4 + 1];
    u32 frame_back = gBanimRoundScripts[arg * 4 + 2];
    u32 priority_back = gBanimRoundScripts[arg * 4 + 3];
    u32 r2 = gUnknown_080DAF22[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;
    
    gUnknown_02000030[1] = 0;
    gUnknown_02000034[1] = 0;
    gEkrXPosBase[1] = r2;
    gEkrYPosBase[1] = 0x58;

label1:
    {
        u32 idx = gpBanimModesRight[frame_front];
        void *scr = gBanimScrRight + idx;
        if (frame_front == 0xFF)
            scr = gUnknown_085B9D5C;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosBase[1] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[1];
        anim->oam2Base = 0x9B00;
        anim->state2 |= 0x600;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02002088;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[2] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesRight[frame_back];
        void *scr = gBanimScrRight + idx;
        if (frame_back == 0xFF)
            scr = gUnknown_085B9D5C;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosBase[1] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[1];
        anim->oam2Base = 0x9B00;
        anim->state2 |= 0x700;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02002088;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[3] = anim;
    }
}
