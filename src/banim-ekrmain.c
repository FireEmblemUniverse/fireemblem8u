#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "banim_data.h"
#include "constants/classes.h"

CONST_DATA AnimScr BanimScr_DefaultAnim[] = {
    ANIMSCR_FRAME(1, NULL, 0x57F0),
    ANIMSCR_BLOCKED
};

CONST_DATA void * gUnknown_085B9D6C[] =
{
    gUnknown_085B9E58,
    gUnknown_085B9EF0,
    gUnknown_085B9F88,
    gUnknown_085BA020,
    gUnknown_085B9F88,
    gUnknown_085BA020,
    gUnknown_085B9F88,
    gUnknown_085BA020,
    gUnknown_085B9E58,
    gUnknown_085B9EF0,
};

const u8 BanimDefaultModeConfig[ANIM_ROUND_MAX * 4] = {
    /**
     * 00: front mode
     * 01: front priority
     * 02: back mode
     * 03: back priority
    */

    /* ANIM_ROUND_HIT_CLOSE */
    BANIM_MODE_NORMAL_ATK, 0x64, BANIM_MODE_NORMAL_ATK_PRIORITY_L, 0x3C,

    /* ANIM_ROUND_CRIT_CLOSE */
    BANIM_MODE_CRIT_ATK, 0x64, BANIM_MODE_CRIT_ATK_PRIORITY_L, 0x3C,

    /* ANIM_ROUND_NONCRIT_FAR */
    BANIM_MODE_RANGED_ATK, 0x64, BANIM_MODE_INVALID, 0x3C,

    /* ANIM_ROUND_CRIT_FAR */
    BANIM_MODE_RANGED_CRIT_ATK, 0x64, BANIM_MODE_INVALID, 0x3C,

    /* ANIM_ROUND_TAKING_MISS_CLOSE */
    BANIM_MODE_CLOSE_DODGE, 0x28, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_MISS_FAR */
    BANIM_MODE_RANGED_DODGE, 0x28, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_HIT_CLOSE */
    BANIM_MODE_STANDING, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_STANDING */
    BANIM_MODE_STANDING2, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_HIT_FAR */
    BANIM_MODE_RANGED_STANDING, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_MISS_CLOSE */
    BANIM_MODE_MISSED_ATK, 0x64, BANIM_MODE_INVALID, 0x28,
};

const u8 BattleTypeToAnimModeEndOfDodge[5] = {
    [EKR_DISTANCE_CLOSE]      = BANIM_MODE_CLOSE_DODGE,
    [EKR_DISTANCE_FAR]        = BANIM_MODE_STANDING,
    [EKR_DISTANCE_FARFAR]     = BANIM_MODE_STANDING,
    [EKR_DISTANCE_MONOCOMBAT] = BANIM_MODE_CLOSE_DODGE,
    [EKR_DISTANCE_PROMOTION]  = BANIM_MODE_CLOSE_DODGE
};

const u8 BanimTypesPosLeft[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x5C,
    [EKR_DISTANCE_FAR]        = 0x44,
    [EKR_DISTANCE_FARFAR]     = 0x44,
    [EKR_DISTANCE_MONOCOMBAT] = 0x78,
    [EKR_DISTANCE_PROMOTION]  = 0x5C
};

const u8 BanimTypesPosRight[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x94,
    [EKR_DISTANCE_FAR]        = 0xAC,
    [EKR_DISTANCE_FARFAR]     = 0xAC,
    [EKR_DISTANCE_MONOCOMBAT] = 0x78,
    [EKR_DISTANCE_PROMOTION]  = 0x94
};

const u16 BanimLeftDefaultPos[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x00,
    [EKR_DISTANCE_FAR]        = 0x20,
    [EKR_DISTANCE_FARFAR]     = 0xF0,
    [EKR_DISTANCE_MONOCOMBAT] = 0x00,
    [EKR_DISTANCE_PROMOTION]  = 0x00
};

void AnimScrAdvance(struct Anim * anim)
{
    u32 inst;

    if (CheckRound1(anim->currentRoundType) == false)
        return;

    if (anim->pScrCurrent == BanimScr_DefaultAnim)
        return;

    while (1) {
        inst = ANINS_GET_TYPE(*anim->pScrCurrent);

        if (inst == ANIM_INS_TYPE_STOP) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == ANIM_INS_TYPE_COMMAND) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == ANIM_INS_TYPE_FRAME)
            anim->pScrCurrent += 3;
    }

}

void EkrChienCHRMain(struct ProcEkrChienCHR * proc);

// clang-format off

struct ProcCmd CONST_DATA gProc_ekrChienCHR[] =
{
    PROC_NAME("ekrChienCHR"),
    PROC_REPEAT(EkrChienCHRMain),
    PROC_END,
};

// clang-format on

void NewEkrChienCHR(struct Anim * anim)
{
    struct ProcEkrChienCHR * proc;
    proc = Proc_Start(gProc_ekrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}

void EkrChienCHRMain(struct ProcEkrChienCHR * proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}

void RegisterAISSheetGraphics(struct Anim * anim)
{
    void *mmap;
    mmap = (void *)0x06010000 + (anim->oam2Base & 0x3FF) * 0x20;
    LZ77UnCompWram(anim->pImgSheet, anim->pImgSheetBuf);
    RegisterDataMove(anim->pImgSheetBuf, mmap, 0x2000);
}

void ApplyBanimUniquePalette(u32 *buf, int pos)
{
    u32 i;

    if (gBanimUniquePaletteDisabled[pos] == 0)
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
    int bid, bid_pal, chara_pal;
    struct BattleAnimCharaPal * cbapt = character_battle_animation_palette_table;
    struct BattleAnim * banim = banim_data;

    ++banim; --banim;
    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gBanimValid[EKR_POS_L] == true) {
        bid = gBanimIdx[EKR_POS_L];
        bid_pal = gBanimFactionPal[EKR_POS_L];
        chara_pal = gBanimUniquePal[EKR_POS_L];

        LZ77UnCompWram(banim[bid].script, gBanimScrLeft);
        gpBanimModesLeft = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 0)].pal, gBanimPaletteLeft);

        if (chara_pal != -1) {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteLeft);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteLeft, POS_L);
        }

        gpEfxUnitPaletteBackup[POS_L] = &PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0), PAL_OBJ(0x7), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[0], PAL_OBJ(0x8), 0x20);

        /* WTF a horrible bug... */
        if (gBattleActor.unit.statusIndex == 0xB || gBattleActor.unit.statusIndex == 0xD)
            EfxPalModifyPetrifyEffect(gPaletteBuffer, (int)PAL_OBJ(0x7), 0x1);

        if (gBattleTarget.unit.statusIndex == 0xB || gBattleTarget.unit.statusIndex == 0xD)
            EfxPalModifyPetrifyEffect(gPaletteBuffer, (int)PAL_OBJ(0x8), 0x1);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_l, gBanimOaml);
        gBanimOaml[0x57F0 / 4] = 1;
    }

    if (gBanimValid[EKR_POS_R] == true) {
        bid = gBanimIdx[EKR_POS_R];
        bid_pal = gBanimFactionPal[EKR_POS_R];
        chara_pal = gBanimUniquePal[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPaletteRight);

        if (chara_pal != -1) {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteRight);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteRight, POS_R);
        }

        gpEfxUnitPaletteBackup[POS_R] = &PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0), PAL_OBJ(0x9), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[1], PAL_OBJ(0xA), 0x20);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_r, gBanimOamr2);
        gBanimOamr2[0x57F0 / 4] = 1;
    }

    if (gpEkrTriangleUnits[0] != NULL) {
        {
            u16 pid, jid;
            u16 i;
            u16 idx = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[0], gpEkrTriangleUnits[0]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimTriAtkPalettes[0] = banim[idx].pal;

            pid = gpEkrTriangleUnits[0]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[0]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gAnimCharaPalConfig[pid][i] == jid) {
                    gBanimTriAtkPalettes[0] = cbapt[gAnimCharaPalIt[pid][i] - 1].pal;
                    break;
                }
            }
        }
        {
            u16 pid, jid;
            u16 i;
            u16 idx = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[1], gpEkrTriangleUnits[1]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimTriAtkPalettes[1] = banim[idx].pal;

            pid = gpEkrTriangleUnits[1]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[1]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gAnimCharaPalConfig[pid][i] == jid) {
                    gBanimTriAtkPalettes[1] = cbapt[gAnimCharaPalIt[pid][i] - 1].pal;
                    break;
                }
            }
        }
    }
}

void InitMainAnims(void)
{
    struct Anim * anim1, *anim2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_CLOSE, ANIM_ROUND_TAKING_HIT_CLOSE);
        break;

    case EKR_DISTANCE_FAR:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_FAR, ANIM_ROUND_TAKING_HIT_FAR);
        break;

    case EKR_DISTANCE_FARFAR:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_FAR, ANIM_ROUND_TAKING_HIT_FAR);

        if (GetBanimInitPosReal() == EKR_POS_L) {
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

    gEfxHpLutOff[0] = 0;
    gEfxHpLutOff[1] = 0;
}

void InitBattleAnimFrame(int round_type_left, int round_type_right)
{
    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    if (gBanimValid[EKR_POS_L] == true)
        InitLeftAnim(round_type_left);

    if (gBanimValid[EKR_POS_R] == true)
        InitRightAnim(round_type_right);

    /* Hide the left anim on init promotion */
    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
        gAnims[0]->state |= ANIM_BIT_HIDDEN;
        gAnims[1]->state |= ANIM_BIT_HIDDEN;
    }
}

void InitLeftAnim(int round_type)
{
    struct Anim * anim;
    u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
    u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
    u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
    u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
    u32 r4 = BanimTypesPosLeft[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;

    gEkrXPosBase[0] = -BanimLeftDefaultPos[gEkrDistanceType];
    gEkrYPosBase[0] = 0;
    gEkrXPosReal[0] = gEkrXPosBase[0] + r4;
    gEkrYPosReal[0] = 0x58;

label1:
    {
        u32 idx = gpBanimModesLeft[frame_front];
        void *scr = gBanimScrLeft + idx;
        if (frame_front == 0xFF)
            scr = BanimScr_DefaultAnim;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[0];
        anim->oam2Base = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
        anim->state2 |= ANIM_BIT2_0400 | ANIM_BIT2_BACK_FRAME;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimLeftImgSheetBuf;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[0] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesLeft[frame_back];
        void *scr = gBanimScrLeft + idx;
        if (frame_back == 0xFF)
            scr = BanimScr_DefaultAnim;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[0];
        anim->oam2Base = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
        anim->state2 |= ANIM_BIT2_0400 | ANIM_BIT2_FRONT_FRAME;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimLeftImgSheetBuf;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[1] = anim;
    }
}

void InitRightAnim(int round_type)
{
    struct Anim * anim;
    u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
    u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
    u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
    u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
    u32 r2 = BanimTypesPosRight[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;
    
    gEkrXPosBase[1] = 0;
    gEkrYPosBase[1] = 0;
    gEkrXPosReal[1] = r2;
    gEkrYPosReal[1] = 0x58;

label1:
    {
        u32 idx = gpBanimModesRight[frame_front];
        void *scr = gBanimScrRight + idx;
        if (frame_front == 0xFF)
            scr = BanimScr_DefaultAnim;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[1];
        anim->oam2Base = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
        anim->state2 |= ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimRightImgSheetBuf;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[2] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesRight[frame_back];
        void *scr = gBanimScrRight + idx;
        if (frame_back == 0xFF)
            scr = BanimScr_DefaultAnim;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[1];
        anim->oam2Base = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
        anim->state2 |= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimRightImgSheetBuf;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[3] = anim;
    }
}

void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int type)
{
    u32 frame, priority;
    const u32 *scr;

    if (GetAISLayerId(anim) == 0) {
        frame    = BanimDefaultModeConfig[4 * type + 0];
        priority = BanimDefaultModeConfig[4 * type + 1];
    } else {
        frame    = BanimDefaultModeConfig[4 * type + 2];
        priority = BanimDefaultModeConfig[4 * type + 3];
    }

    if (frame != 0xFF) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            // use r1 for scr
            scr = gpBanimModesLeft;
            scr = (void *)gBanimScrLeft + scr[frame];
        } else {
            scr = (void *)gBanimScrRight + gpBanimModesRight[frame];
        }
        anim->pScrStart = scr;
        anim->pScrCurrent = scr;
    } else {
        anim->pScrStart = BanimScr_DefaultAnim;
        anim->pScrCurrent = BanimScr_DefaultAnim;
        anim->state3 = 0;
    }

    anim->drawLayerPriority = priority;
    anim->oam2Base &= ~0xC00;
    anim->oam2Base |= 0x800;
    anim->timer = 0;
    anim->state2 &= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
    anim->currentRoundType = type;
    anim->commandQueueSize = 0;
    anim->pSpriteDataPool = gBanimOaml + GetAnimPosition(anim) * 0x5800 / 4;
    AnimSort();
    EkrDragonBodyAnimeSet54(anim);
}

int GetAISLayerId(struct Anim * anim)
{
    if (!(anim->state2 & ANIM_BIT2_FRONT_FRAME))
        return 0;

    return 1;
}

int GetAnimPosition(struct Anim * anim)
{
    if (!(anim->state2 & ANIM_BIT2_POS_RIGHT))
        return EKR_POS_L;

    return EKR_POS_R;
}

int CheckRoundMiss(s16 type)
{
    switch(type) {
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

int CheckRound1(s16 type)
{
    switch(type) {
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

int CheckRound2(s16 type)
{
    switch(type) {
    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
        return true;

    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    default:
        return false;
    }
}

int CheckRoundCrit(struct Anim * anim)
{
    switch(anim->currentRoundType) {
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_CRIT_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

struct Anim *GetAnimAnotherSide(struct Anim * anim)
{
    return gAnims[(1 ^ GetAnimPosition(anim)) * 2];
}

s16 GetAnimRoundType(struct Anim * anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim));
}

s16 GetAnimNextRoundType(struct Anim * anim)
{
    return GetBattleAnimRoundType(anim->nextRoundId * 2 + GetAnimPosition(anim));
}

s16 GetAnimRoundTypeAnotherSide(struct Anim * anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + (1 ^ GetAnimPosition(anim)));
}

s16 GetAnimNextRoundTypeAnotherSide(struct Anim * anim)
{
    return GetBattleAnimRoundType(anim->nextRoundId * 2 + (1 ^ GetAnimPosition(anim)));
}

void SetAnimStateHidden(int pos)
{
    if (pos == EKR_POS_L) {
        struct Anim * anim;

        anim = gAnims[0];
        anim->state |= ANIM_BIT_HIDDEN;

        anim = gAnims[1];
        anim->state |= ANIM_BIT_HIDDEN;
        return;
    }

    if (pos == EKR_POS_R) {
        struct Anim * anim;

        anim = gAnims[2];
        anim->state |= ANIM_BIT_HIDDEN;

        anim = gAnims[3];
        anim->state |= ANIM_BIT_HIDDEN;
        return;
    }
}

void SetAnimStateUnHidden(int pos)
{
    if (pos == EKR_POS_L) {
        struct Anim * anim;

        anim = gAnims[0];
        anim->state &= ~ANIM_BIT_HIDDEN;

        anim = gAnims[1];
        anim->state &= ~ANIM_BIT_HIDDEN;
        return;
    }

    if (pos == EKR_POS_R) {
        struct Anim * anim;

        anim = gAnims[2];
        anim->state &= ~ANIM_BIT_HIDDEN;

        anim = gAnims[3];
        anim->state &= ~ANIM_BIT_HIDDEN;
        return;
    }
}
