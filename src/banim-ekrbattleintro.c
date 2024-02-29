#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "spellassoc.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"

EWRAM_DATA s16 gEkrDebugModeMaybe = 0;
EWRAM_DATA s16 gBanimBG = 0;
EWRAM_DATA s16 gEkrInitialHitSide = 0;
EWRAM_DATA s16 gEkrSnowWeather = 0;
EWRAM_DATA s16 gBanimValid[2] = {0};
EWRAM_DATA s16 gEkrInitialPosition[2] = {0};
EWRAM_DATA u16 gBanimIdx_bak[2] = {0};
EWRAM_DATA s16 gBanimUniquePal[2] = {0};
EWRAM_DATA s16 gBanimFactionPal[2] = {0};
EWRAM_DATA s16 gEkrSpellAnimIndex[2] = {0};
EWRAM_DATA s16 gBanimFloorfx[2] = {0};
EWRAM_DATA s16 gEkrDistanceType = EKR_DISTANCE_CLOSE;
EWRAM_DATA s16 gEkrBmLocation[4] = {0};
EWRAM_DATA u16 gAnimRoundData[20] = {0};
EWRAM_DATA s16 gEfxHpLutOff[2] = {0};
EWRAM_DATA u16 gEfxHpLut[22] = {0};
EWRAM_DATA s16 gBanimIdx[2] = {0};
EWRAM_DATA struct BattleUnit * gpEkrBattleUnitLeft = NULL;
EWRAM_DATA struct BattleUnit * gpEkrBattleUnitRight = NULL;
EWRAM_DATA u8 gEkrPids[2] = {0};
EWRAM_DATA struct Unit * gpEkrTriangleUnits[2] = {0};
EWRAM_DATA char * gBanimTriAtkPalettes[2] = {0};
EWRAM_DATA void * gBanimForceUnitChgDebug[2] = {0};
EWRAM_DATA s16 gEkrGaugeHp[2] = {0};
EWRAM_DATA s16 gBanimMaxHP[2] = {0};
EWRAM_DATA s16 gEkrGaugeHpBak[2] = {0};
EWRAM_DATA s16 gEkrGaugeHit[2] = {0};
EWRAM_DATA s16 gEkrGaugeDmg[2] = {0};
EWRAM_DATA s16 gEkrGaugeCrt[2] = {0};
EWRAM_DATA s16 gBanimExpPrevious[2] = {0};
EWRAM_DATA s16 gBanimExpGain[2] = {0};
EWRAM_DATA s16 gBanimTerrain[2] = {0};
EWRAM_DATA s16 gBanimCon[2] = {0};
EWRAM_DATA s16 gBanimWtaBonus[2] = {0};
EWRAM_DATA s16 gBanimEffectiveness[2] = {0};
EWRAM_DATA s16 gBanimUniquePaletteDisabled[2] = {0};

CONST_DATA struct ProcCmd ProcScr_EkrBaseKaiten[] = {
    PROC_NAME("ekrBaseKaiten"),
    PROC_REPEAT(EkrBaseKaitenMain),
    PROC_END
};

const u8 * CONST_DATA Imgs_085B9B84[] = {
    Img_080DB538, NULL,
    Img_080DB538, NULL,
    Img_080DB034, NULL,
    Img_080DB538, NULL
};

const u8 * CONST_DATA Imgs_085B9BA4[] = {
    Img_080DB9C4,
    Img_080DBE1C,
    Img_080DBE1C,
    Img_080DBE1C,
    Img_080DC350,
    Img_080DBE1C,
    Img_080DBE1C,
    Img_080DBE1C
};

CONST_DATA u32 * AnimScrs_085B9BC4[] = {
    AnimScr_EkrBaseKaiten3, NULL,
    AnimScr_EkrBaseKaiten4, NULL,
    AnimScr_EkrBaseKaiten1, NULL,
    AnimScr_EkrBaseKaiten5, NULL
};

CONST_DATA u32 * AnimScrs_085B9BE4[] = {
    AnimScr_EkrBaseKaiten10,
    AnimScr_EkrBaseKaiten15,
    AnimScr_EkrBaseKaiten15,
    AnimScr_EkrBaseKaiten15,
    AnimScr_EkrBaseKaiten22,
    AnimScr_EkrBaseKaiten16,
    AnimScr_EkrBaseKaiten16,
    AnimScr_EkrBaseKaiten16,
};

CONST_DATA u32 * AnimScrs_085B9C04[] = {
    AnimScr_EkrBaseKaiten9,
    AnimScr_EkrBaseKaiten13,
    AnimScr_EkrBaseKaiten13,
    AnimScr_EkrBaseKaiten13,
    AnimScr_EkrBaseKaiten21,
    AnimScr_EkrBaseKaiten14,
    AnimScr_EkrBaseKaiten14,
    AnimScr_EkrBaseKaiten14,
};

CONST_DATA u32 * AnimScrs_085B9C24[] = {
    AnimScr_EkrBaseKaiten6, NULL,
    AnimScr_EkrBaseKaiten7, NULL,
    AnimScr_EkrBaseKaiten2, NULL,
    AnimScr_EkrBaseKaiten8, NULL
};

CONST_DATA u32 * AnimScrs_085B9C44[] = {
    AnimScr_EkrBaseKaiten12,
    AnimScr_EkrBaseKaiten19,
    AnimScr_EkrBaseKaiten19,
    AnimScr_EkrBaseKaiten19,
    AnimScr_EkrBaseKaiten24,
    AnimScr_EkrBaseKaiten20,
    AnimScr_EkrBaseKaiten20,
    AnimScr_EkrBaseKaiten20,
};

CONST_DATA u32 * AnimScrs_085B9C64[] = {
    AnimScr_EkrBaseKaiten11,
    AnimScr_EkrBaseKaiten17,
    AnimScr_EkrBaseKaiten17,
    AnimScr_EkrBaseKaiten17,
    AnimScr_EkrBaseKaiten23,
    AnimScr_EkrBaseKaiten18,
    AnimScr_EkrBaseKaiten18,
    AnimScr_EkrBaseKaiten18,
};

const u16 gUnknown_080DAD86[12][8] = {
    {0xA0, 0xB8, 0xE0, 0xF0, 0x01, 0x30, 0x60, 0xFFFF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
    {0xC0, 0xD8, 0xF0, 0x01, 0x10, 0x28, 0x40, 0xFFFF},
    {0x40, 0x28, 0x10, 0x01, 0xE8, 0xD0, 0xC0, 0xFFFF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
    {0x40, 0x40, 0x4C, 0x58, 0x64, 0x70, 0x80, 0xFFFF},
    {0x40, 0x30, 0x20, 0x10, 0xE8, 0xD0, 0xC0, 0xFFFF},
    {0xC0, 0xC8, 0xD0, 0xD8, 0xE0, 0xF0, 0xF8, 0xFFFF},
    {0xC8, 0xC0, 0xB8, 0xB0, 0xA0, 0x90, 0x80, 0xFFFF},
    {0xF0, 0xC0, 0x90, 0x60, 0x30, 0x00, 0xD0, 0xFFFF},
    {0x70, 0x40, 0x10, 0xE0, 0xB0, 0x80, 0x50, 0xFFFF}
};

const u16 * CONST_DATA gUnknown_085B9C84[] = {
    gUnknown_080DAD86[1], NULL,
    gUnknown_080DAD86[2], NULL,
    gUnknown_080DAD86[0], NULL,
    gUnknown_080DAD86[3], NULL,
};

const u16 * CONST_DATA gUnknown_085B9CA4[] = {
    gUnknown_080DAD86[5],
    gUnknown_080DAD86[8],
    gUnknown_080DAD86[8],
    gUnknown_080DAD86[8],
    gUnknown_080DAD86[11],
    gUnknown_080DAD86[9],
    gUnknown_080DAD86[9],
    gUnknown_080DAD86[9]
};

const u16 * CONST_DATA gUnknown_085B9CC4[] = {
    gUnknown_080DAD86[4],
    gUnknown_080DAD86[6],
    gUnknown_080DAD86[6],
    gUnknown_080DAD86[6],
    gUnknown_080DAD86[10],
    gUnknown_080DAD86[7],
    gUnknown_080DAD86[7],
    gUnknown_080DAD86[7]
};

/* https://decomp.me/scratch/vwNsr */
void NewEkrBaseKaiten(int identifier)
{
#ifdef NONMATCHING
    #define AccessArray(array, index, offset) ((array)[index])
#else
    #define AccessArray(array, index, offset) (*(typeof(&*(array)))((void *)(array) + (offset)))
#endif

    int mode;
    const u8 ** pptr;
    struct Anim * anim;
    struct ProcEkrBaseKaiten * proc;
    u32 r6;
    const u8 * src;

    SetBlendConfig(0, 10, 6, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    if (gEkrBmLocation[POS_L] == gEkrBmLocation[2])
    {
        if (gEkrBmLocation[POS_R] >= gEkrBmLocation[3])
            mode = 6;
        else
            mode = 2;
    }
    else
    {
        if (gEkrBmLocation[POS_R] == gEkrBmLocation[3])
        {
            if (gEkrBmLocation[0] < gEkrBmLocation[2])
                mode = 0;
            else
                mode = 4;
        }
        else
        {
            if (gEkrBmLocation[0] < gEkrBmLocation[2])
            {
                if (gEkrBmLocation[1] >= gEkrBmLocation[3])
                    mode = 7;
                else
                    mode = 1;
            }
            else
            {
                if (gEkrBmLocation[1] >= gEkrBmLocation[3])
                    mode = 5;
                else
                    mode = 3;
            }
        }
    }

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        pptr = Imgs_085B9B84;
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
    default:
        pptr = Imgs_085B9BA4;
        break;
    }

    src = pptr[mode];
    r6 = mode * 4;
    LZ77UnCompVram(src, OBJ_VRAM0);
    CpuFastCopy(Pal_080DC85C, PAL_OBJ(4), 4);
    EnablePaletteSync();

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
        proc->y1 = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
        proc->x2 = 0x78;
        proc->y2 = 0x68;

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9BC4, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C24, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9C84, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = gEkrBmLocation[0] * 0x10 + 8;
        proc->y1 = gEkrBmLocation[1] * 0x10 + 8;
        proc->x2 = 0x48;
        proc->y2 = 0x68;

        if (gEkrInitPosReal == POS_R)
            proc->x2 -= BanimLeftDefaultPos[gEkrDistanceType];

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9BE4, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C44, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9CA4, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;

        /* Another proc ? */
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 1;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = gEkrBmLocation[2] * 0x10 + 8;
        proc->y1 = gEkrBmLocation[3] * 0x10 + 8;
        proc->x2 = 0xA8;
        proc->y2 = 0x68;

        if (gEkrInitPosReal == POS_L)
            proc->x2 = BanimLeftDefaultPos[gEkrDistanceType] + 0xA8;

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9C04, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C64, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9CC4, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;
        break;

    case EKR_DISTANCE_MONOCOMBAT:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = gEkrBmLocation[2] * 0x10 + 8;
        proc->y1 = gEkrBmLocation[3] * 0x10 + 8;
        proc->x2 = 0x78;
        proc->y2 = 0x68;

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9C04, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C64, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9CC4, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;
        break;

    default:
        break;
    }
}

void EkrBaseKaitenMain(struct ProcEkrBaseKaiten * proc)
{
    struct Anim * anim = proc->anim;

    if (proc->timer >= proc->terminator)
    {
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    if (proc->type == 0)
    {
        anim->xPosition =
            Interpolate(0, proc->x1, proc->x2, proc->timer, proc->terminator);

        anim->yPosition =
            Interpolate(0, proc->y1, proc->y2, proc->timer, proc->terminator);
    }
    else
    {
        anim->xPosition =
            Interpolate(0, proc->x2, proc->x1, proc->timer, proc->terminator);

        anim->yPosition =
            Interpolate(0, proc->y2, proc->y1, proc->timer, proc->terminator);
    }

    if (proc->timer <= proc->terminator)
        proc->timer++;
}

CONST_DATA struct ProcCmd ProcScr_ekrUnitKakudai[] = {
    PROC_NAME("ekrUnitKakudai"),
    PROC_REPEAT(UnitKakudaiPrepareAnimScript),
    PROC_REPEAT(UnitKakudaiMain),
    PROC_REPEAT(UnitKakudaiEndNop),
    PROC_END
};

void NewEkrUnitKakudai(int identifier)
{
    struct ProcUnitKakudai * proc =
        Proc_Start(ProcScr_ekrUnitKakudai, PROC_TREE_3);

    proc->type = identifier;
    proc->valid_r = 0;
    proc->valid_l = 0;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        if (gBanimValid[POS_L] == true && GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
            proc->valid_l = 1;

        if (gBanimValid[POS_R] == true)
            proc->valid_r = 1;
        return;

    case EKR_DISTANCE_PROMOTION:
        if (identifier == 0)
        {
            proc->valid_l = 0;
            proc->valid_r = 1;
        }
        else
        {
            proc->valid_l = 1;
            proc->valid_r = 0;
        }
        break;

    default:
        break;
    }
}

void UnitKakudaiPrepareAnimScript(struct ProcUnitKakudai * proc)
{
    void * ptr;
    struct Anim * anim;
    int status, front_mode;

#ifndef NONMATCHING
    const u8 * cfg;
    register int mode asm("r2");
    register int r0 asm("r0");
    u8 mode2;

    mode2 = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];
    asm("":::"r0", "r1");
    cfg = BanimDefaultModeConfig;
    r0 = mode2 * 4;
    front_mode = cfg[r0 + 0];
#else
    int mode;
    u8 mode2;

    mode2 = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];
    front_mode = BanimDefaultModeConfig[mode2 * 4 + 0];
#endif

    UpdateBanimFrame();

    if(gEkrBattleEndFlag != 0)
    {
        anim = gAnims[2];
        if (anim)
            EndEfxStatusUnits(anim);

        anim = gAnims[0];
        if (anim)
            EndEfxStatusUnits(anim);

        DeleteEach6C_efxStatusUnit();
    }

    if (gpEkrBattleUnitRight->unit.statusIndex == UNIT_STATUS_PETRIFY || gpEkrBattleUnitRight->unit.statusIndex == UNIT_STATUS_13)
        EfxPalModifyPetrifyEffect(gPaletteBuffer, 0x19, 1);

    if (gpEkrBattleUnitLeft->unit.statusIndex == UNIT_STATUS_PETRIFY || gpEkrBattleUnitLeft->unit.statusIndex == UNIT_STATUS_13)
        EfxPalModifyPetrifyEffect(gPaletteBuffer, 0x17, 1);

    if (proc->type == 0)
        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            EfxPalModifyPetrifyEffect(gPaletteBuffer, 0x17, 1);

    if (gBanimValid[POS_L] == true)
    {
        struct BanimModeData * unk;
        const void * src;
        mode = gpBanimModesLeft[front_mode];
        unk = (void *)(gBanimScrLeft + mode);
        src = unk->img;
        proc->pOaml = (void *)gBanimOaml + unk->unk2;
        LZ77UnCompWram(src, gBanimLeftImgSheetBuf);
    }

    if (gBanimValid[POS_R] == true)
    {
        struct BanimModeData * unk;
        const void * src;
        mode = gpBanimModesRight[front_mode];
        unk = (void *)(gBanimScrRight + mode);
        src = unk->img;
        proc->pOamr = (void *)gBanimOamr2 + unk->unk2;
        LZ77UnCompWram(src, gBanimRightImgSheetBuf);
    }

    if (gBanimForceUnitChgDebug[POS_L] != NULL)
        LZ77UnCompWram(gBanimForceUnitChgDebug[POS_L], gEkrKakudaiSomeBufLeft);

    if (gBanimForceUnitChgDebug[POS_R] != NULL)
        LZ77UnCompWram(gBanimForceUnitChgDebug[POS_R], gEkrKakudaiSomeBufRight);

    ptr = OBJ_VRAM1;
    RegisterDataMove(gBanimLeftImgSheetBuf, ptr, 0x4000);

    proc->timer = 0;
    proc->terminator = 0xB;

    proc->x1 = gEkrBmLocation[0] * 0x10 + 8;
    proc->y1 = gEkrBmLocation[1] * 0x10 + 8;
    proc->x2 = gEkrBmLocation[2] * 0x10 + 8;
    proc->y2 = gEkrBmLocation[3] * 0x10 + 8;
    proc->left_pos = BanimTypesPosLeft[gEkrDistanceType];
    proc->right_pos = BanimTypesPosRight[gEkrDistanceType];

    if (gEkrInitPosReal == POS_L)
        proc->right_pos += BanimLeftDefaultPos[gEkrDistanceType];
    else
        proc->left_pos -= BanimLeftDefaultPos[gEkrDistanceType];

    Proc_Break(proc);
}

void UnitKakudaiMain(struct ProcUnitKakudai * proc)
{
    u16 ret1, x, y;
    struct AnimSpriteData sprite_data[0x40];
    struct Anim _anim;
    struct Anim * anim = &_anim;

    if (proc->timer >= proc->terminator)
    {
        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        ret1 = Interpolate(0, 0x250, 0x100, proc->timer, proc->terminator);
    else
        ret1 = Interpolate(0, 0x100, 0x250, proc->timer, proc->terminator);

    if (proc->valid_l == 1)
    {
        BanimUpdateSpriteRotScale(proc->pOaml, sprite_data, ret1, ret1, 0);

        if (proc->type == 0)
        {
            x = Interpolate(0, proc->x1, proc->left_pos, proc->timer, proc->terminator);
            y = Interpolate(0, proc->y1, 0x58, proc->timer, proc->terminator);
        }
        else
        {
            x = Interpolate(0, proc->left_pos, proc->x1, proc->timer, proc->terminator);
            y = Interpolate(0, 0x58, proc->y1, proc->timer, proc->terminator);
        }
        anim->pSpriteData = sprite_data;
        anim->xPosition = x;
        anim->yPosition = y;
        anim->state2 = 0x400;
        anim->oam2Base = 0x7200;
        anim->oamBase = 0;
        AnimDisplay(anim);
    }

    if (proc->valid_r == 1)
    {
        BanimUpdateSpriteRotScale(proc->pOamr, sprite_data, ret1, ret1, 1);

        if (proc->type == 0)
        {
            x = Interpolate(0, proc->x2, proc->right_pos, proc->timer, proc->terminator);
            y = Interpolate(0, proc->y2, 0x58, proc->timer, proc->terminator);
        }
        else
        {
            x = Interpolate(0, proc->right_pos, proc->x2, proc->timer, proc->terminator);
            y = Interpolate(0, 0x58, proc->y2, proc->timer, proc->terminator);
        }
        anim->pSpriteData = sprite_data;
        anim->xPosition = x;
        anim->yPosition = y;
        anim->state2 = 0x400;
        anim->oam2Base = 0x9300;
        anim->oamBase = 0;
        AnimDisplay(anim);
    }
}

void UnitKakudaiEndNop(struct ProcUnitKakudai * proc)
{
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_ekrWindowAppear[] = {
    PROC_NAME("ekrWindowAppear"),
    PROC_REPEAT(EkrWindowAppearMain),
    PROC_END
};

void NewEkrWindowAppear(int identifier, int duration)
{
    int iy;

    struct ProcEkrIntroWindow * proc =
        Proc_Start(ProcScr_ekrWindowAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = 0x39;

    if (identifier == 0)
        iy = 0x39;
    else
        iy = 0x00;

    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, (u16)gEkrBg0QuakeVec.y + iy);
    gEkrWindowAppearExist = true;
    EkrGauge_ClrInitFlag();
}

bool CheckEkrWindowAppearUnexist(void)
{
    if (gEkrWindowAppearExist == false)
        return true;

    return false;
}

void EkrWindowAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrWindowAppearExist = false;
        EkrGauge_SetInitFlag();
        Proc_Break(proc);
        return;
    }
    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax, proc->timer, proc->terminator);

    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, (u16)gEkrBg0QuakeVec.y + iy);
}

CONST_DATA struct ProcCmd ProcScr_ekrNamewinAppear[] = {
    PROC_NAME("ekrNamewinAppear"),
    PROC_REPEAT(EkrNamewinAppearDelay),
    PROC_REPEAT(EkrNamewinAppearMain),
    PROC_END
};

void NewEkrNamewinAppear(int identifier, int duration, int delay)
{
    int iy;

    struct ProcEkrIntroWindow * proc =
        Proc_Start(ProcScr_ekrNamewinAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = delay;
    proc->ymax_name = -49;

    if (identifier == 0)
        EkrDispUP_SetPositionUnsync(0, proc->ymax_name);
    else
        EkrDispUP_SetPositionUnsync(0, 0);

    gEkrNamewinAppearExist = true;
    UnsyncEkrDispUP();
}

bool CheckEkrNamewinAppearUnexist(void)
{
    if (gEkrNamewinAppearExist == false)
        return true;

    return false;
}

void EkrNamewinAppearDelay(struct ProcEkrIntroWindow * proc)
{
    if (proc->timer == proc->ymax)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}

void EkrNamewinAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrNamewinAppearExist = false;
        SyncEkrDispUP();

        if (proc->type == 2)
            EndEkrDispUP();

        Proc_Break(proc);
        return;
    }
    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax_name, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax_name, proc->timer, proc->terminator);

    EkrDispUP_SetPositionUnsync(0, iy);
}

CONST_DATA struct ProcCmd ProcScr_ekrBaseAppear[] = {
    PROC_NAME("ekrBaseAppear"),
    PROC_REPEAT(EkrBaseAppearMain),
    PROC_END
};

void NewEkrBaseAppear(int identifier, int duration)
{
    int iy;

    struct ProcEkrIntroWindow * proc =
        Proc_Start(ProcScr_ekrBaseAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;

    if (identifier == 0)
        BG_SetPosition(BG_2, 0, -0x58);
    else
        BG_SetPosition(BG_2, 0, 0);

    gProcEkrBaseAppearExist = true;
}

bool CheckEkrBaseAppearUnexist(void)
{
    if (gProcEkrBaseAppearExist == false)
        return true;

    return false;
}

void EkrBaseAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gProcEkrBaseAppearExist = false;
        Proc_Break(proc);
        return;
    }
    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, -0x50, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, -0x50, proc->timer, proc->terminator);

    BG_SetPosition(BG_2, 0, iy);
}

static inline s16 GetPosFunc(int faction1, int faction2)
{
    int pos = EKR_POS_L;
    if (GetBanimLinkArenaFlag() != true)
    {
        if (FACTION_ID_BLUE == (s16)faction1)
            pos = EKR_POS_R;
        else if (FACTION_ID_RED == (s16)faction1)
            pos = EKR_POS_R;
        else if (FACTION_ID_GREEN == (s16)faction1 && FACTION_ID_GREEN == faction2)
            pos = EKR_POS_R;
    }
    return pos;
}

bool PrepareBattleGraphicsMaybe(void)
{
    u16 i;
    u16 pid, jid;
    int zero;
    struct Unit * unit_bu1;
    struct Unit * unit_bu2;
    struct BattleUnit * bu1;
    struct BattleUnit * bu2;
    const struct CharacterData * pinfo1;
    const struct CharacterData * pinfo2;
    int usrdefined_enable;
    const void * animdef1;
    const void * animdef2;
    s16 valid_l;
    s16 valid_r;
    int animid1, animid2;

    int char_cnt = 1;

    ResetEkrDragonStatus();

    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA))
        SetBanimArenaFlag(false);
    else
        SetBanimArenaFlag(true);

    if (!(gBmSt.gameStateBits & BM_FLAG_LINKARENA))
        SetBanimLinkArenaFlag(false);
    else
        SetBanimLinkArenaFlag(true);

    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION)
        gEkrDistanceType = EKR_DISTANCE_PROMOTION;
    else
        gEkrDistanceType = EKR_DISTANCE_CLOSE;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        bu1 = gpEkrBattleUnitLeft = &gBattleActor;
        bu2 = gpEkrBattleUnitRight = &gBattleTarget;

        gEkrInitialPosition[POS_L] = gEkrInitialPosition[POS_R] = 0;
        gBanimValid[EKR_POS_R] = gBanimValid[EKR_POS_L] = true;
    }
    else
    {
        int pos;
        u8 i1 = -0x40 & gBattleActor.unit.index;
        u16 faction1 = GetBanimFactionPalette(i1);
        u8 i2 = -0x40 & gBattleTarget.unit.index;
        u16 faction2 = GetBanimFactionPalette(i2);

        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            char_cnt = 2;
        else if (gBattleActor.weaponBefore == ITEM_NONE)
            char_cnt = 2;
        else
            char_cnt = GetSpellAssocCharCount(GetItemIndex(gBattleActor.weaponBefore));

        gBanimValid[EKR_POS_L] = gBanimValid[EKR_POS_R] = true;

        if (EKR_POS_R == GetPosFunc(faction1, faction2))
        {
            bu1 = gpEkrBattleUnitLeft = &gBattleTarget;
            bu2 = gpEkrBattleUnitRight = &gBattleActor;

            gEkrInitialPosition[POS_L] = true;
            gEkrInitialPosition[POS_R] = false;

            if (char_cnt == 1)
                gBanimValid[EKR_POS_L] = false;
        }
        else
        {
            bu1 = gpEkrBattleUnitLeft = &gBattleActor;
            bu2 = gpEkrBattleUnitRight = &gBattleTarget;

            gEkrInitialPosition[POS_L] = false;
            gEkrInitialPosition[POS_R] = true;

            if (char_cnt == 1)
                gBanimValid[EKR_POS_R] = false;
        }
    }

    unit_bu1 = &bu1->unit;
    unit_bu2 = &bu2->unit;

    pinfo1 = unit_bu1->pCharacterData;
    pinfo2 = unit_bu2->pCharacterData;

    animdef1 = animdef2 = 0;

    valid_l = gBanimValid[POS_L];
    valid_r = gBanimValid[POS_R];

    if (valid_l)
        animdef1 = unit_bu1->pClassData->pBattleAnimDef;

    if (valid_r)
        animdef2 = unit_bu2->pClassData->pBattleAnimDef;

    if (valid_l)
    {
        gEkrBmLocation[POS_L] = (16 * unit_bu1->xPos - gBmSt.camera.x) >> 4;
        gEkrBmLocation[POS_R] = (16 * unit_bu1->yPos - gBmSt.camera.y) >> 4;
    }

    if (valid_r)
    {
        gEkrBmLocation[2] = (16 * unit_bu2->xPos - gBmSt.camera.x) >> 4;
        gEkrBmLocation[3] = (16 * unit_bu2->yPos - gBmSt.camera.y) >> 4;
    }

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (GetItemAttributes(gBattleActor.weaponBefore) & IA_UNCOUNTERABLE)
            gEkrDistanceType = EKR_DISTANCE_FARFAR;
        else
        {
            gEkrDistanceType = EKR_DISTANCE_MONOCOMBAT;

            if (valid_l + valid_r == 2)
            {
                s16 x_distance, y_distance;
                x_distance = ABS(gEkrBmLocation[POS_L] - gEkrBmLocation[2]);
                y_distance = ABS(gEkrBmLocation[1] - gEkrBmLocation[3]);

                if (x_distance + y_distance <= 1)
                {
                    gEkrDistanceType = EKR_DISTANCE_CLOSE;
                }
                else if (x_distance + y_distance <= 3)
                {
                    gEkrDistanceType = EKR_DISTANCE_FAR;
                }
                else
                {
                    gEkrDistanceType = EKR_DISTANCE_FARFAR;
                }
            }
        }
    }

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gBanimIdx[POS_L] = gBanimIdx_bak[POS_L] = GetBattleAnimationId(unit_bu1, animdef1, bu1->weapon, &animid1);
        gBanimIdx[POS_R] = gBanimIdx_bak[POS_R] = GetBattleAnimationId(unit_bu2, animdef2, bu2->weapon, &animid2);
    }
    else
    {
        if (valid_l)
        {
            gBanimIdx[POS_L] = gBanimIdx_bak[POS_L] = GetBattleAnimationId(unit_bu1, animdef1, bu1->weaponBefore, &animid1);
        }

        if (valid_r)
        {
            gBanimIdx[POS_R] = gBanimIdx_bak[POS_R] = GetBattleAnimationId(unit_bu2, animdef2, bu2->weaponBefore, &animid2);
        }
    }

    pid = unit_bu1->pCharacterData->number - 1;
    jid = unit_bu1->pClassData->number;

    if (valid_l)
        gBanimUniquePal[POS_L] = -1;

    for (i = 0; i < 7; i++)
    {
        if (gAnimCharaPalConfig[pid][i] == jid && valid_l)
        {
            gBanimUniquePal[POS_L] = gAnimCharaPalIt[pid][i] - 1;
            break;
        }
    }

    pid = unit_bu2->pCharacterData->number - 1;
    jid = unit_bu2->pClassData->number;

    if (valid_r)
        gBanimUniquePal[POS_R] = -1;

    for (i = 0; i < 7; i++)
    {
        if (gAnimCharaPalConfig[pid][i] == jid && valid_r)
        {
            gBanimUniquePal[POS_R] = gAnimCharaPalIt[pid][i] - 1;
            break;
        }
    }

    if (valid_l)
        gBanimTriAtkPalettes[POS_L] = (void *)FilterBattleAnimCharacterPalette(gBanimIdx[POS_L], bu1->weaponBefore);

    if (valid_r)
        gBanimTriAtkPalettes[POS_R] = (void *)FilterBattleAnimCharacterPalette(gBanimIdx[POS_R], bu2->weaponBefore);

    gBanimTerrain[POS_L] = bu1->terrainId;
    gBanimTerrain[POS_R] = bu2->terrainId;

    gBanimFloorfx[POS_L] = gBanimFloorfx[POS_R] = -1;

    if (valid_l)
        gBanimFloorfx[POS_L] =
            GetBanimTerrainGround(bu1->terrainId, GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);

    if (valid_r)
        gBanimFloorfx[POS_R] =
            GetBanimTerrainGround(bu2->terrainId, GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);

    if (gBmSt.gameStateBits & BM_FLAG_LINKARENA)
    {
        gBanimTerrain[POS_R] = gBanimTerrain[POS_L] = TERRAIN_ARENA_30;

        if (valid_l)
            gBanimFloorfx[POS_L] =
                GetBanimTerrainGround(gBanimTerrain[POS_L], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);

        if (valid_r)
            gBanimFloorfx[POS_R] =
                GetBanimTerrainGround(gBanimTerrain[POS_R], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);
    }

    if (CheckBanimHensei() == true)
    {
        gBanimFloorfx[POS_L] = gBanimFloorfx[POS_R] = 20;
        gBanimTerrain[POS_L] = gBanimTerrain[POS_R] = TERRAIN_ARENA_30;
    }

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
        case EKR_DISTANCE_MONOCOMBAT:
            break;

        case EKR_DISTANCE_PROMOTION:
            gBanimFloorfx[POS_L] = gBanimFloorfx[POS_R];
            break;
    }

    switch (gPlaySt.chapterWeatherId)
    {
        case WEATHER_SNOW:
        case WEATHER_SNOWSTORM:
            gEkrSnowWeather = 1;
            break;

        default:
            gEkrSnowWeather = 0;
            break;
    }

    if (valid_l)
        gBanimCon[POS_L] = unit_bu1->pClassData->baseCon;

    if (valid_r)
        gBanimCon[POS_R] = unit_bu2->pClassData->baseCon;

    if (valid_l)
    {
        gEkrGaugeHp[POS_L] = bu1->hpInitial;
        gBanimMaxHP[POS_L] = unit_bu1->maxHP;
    }

    if (valid_r)
    {
        gEkrGaugeHp[POS_R] = bu2->hpInitial;
        gBanimMaxHP[POS_R] = unit_bu2->maxHP;
    }

    ParseBattleHitToBanimCmd();

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gEkrSpellAnimIndex[POS_R] = 1;
        gEkrSpellAnimIndex[POS_L] = 1;
    }
    else
    {
        if (valid_l)
            gEkrSpellAnimIndex[POS_L] = GetSpellAnimId(unit_bu1->pClassData->number, bu1->weaponBefore);

        if (valid_r)
            gEkrSpellAnimIndex[POS_R] = GetSpellAnimId(unit_bu2->pClassData->number, bu2->weaponBefore);

        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            if (!IsItemDisplayedInBattle(bu2->weaponBefore))
                if (unit_bu2->pClassData->number == CLASS_DANCER)
                    gEkrSpellAnimIndex[POS_R] = 0xF;
    }

    if (valid_l)
        UnsetMapStaffAnim(&gEkrSpellAnimIndex[POS_L], 0, bu1->weaponBefore);

    if (valid_r)
        UnsetMapStaffAnim(&gEkrSpellAnimIndex[POS_R], 1, bu2->weaponBefore);

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            switch (unit_bu1->pClassData->number)
            {
                case CLASS_DRACO_ZOMBIE:
                    SetEkrDragonStatusType(gAnims[POS_L], EKRDRGON_TYPE_DRACO_ZOMBIE);
                    break;

                case CLASS_DEMON_KING:
                    SetEkrDragonStatusType(gAnims[POS_L], EKRDRGON_TYPE_DEMON_KING);
                    break;
            }

            break;

        case EKR_DISTANCE_MONOCOMBAT:
        case EKR_DISTANCE_PROMOTION:
            break;

        default:
            break;
    }

    if (valid_l)
    {
        u8 i1 = -0x40 & unit_bu1->index;
        gBanimFactionPal[POS_L] = GetBanimFactionPalette(i1);
    }

    if (valid_r)
    {
        u8 i2 = -0x40 & unit_bu2->index;
        gBanimFactionPal[POS_R] = GetBanimFactionPalette(i2);
    }

    gEkrPids[POS_R] = 0;
    gEkrPids[POS_L] = 0;

    if (valid_l)
        gEkrPids[POS_L] = pinfo1->number;

    if (valid_r)
        gEkrPids[POS_R] = pinfo2->number;

    if (valid_l)
        gEkrGaugeHit[POS_L] = bu1->battleEffectiveHitRate;

    if (valid_r)
        gEkrGaugeHit[POS_R] = bu2->battleEffectiveHitRate;

    if (gEkrGaugeHit[POS_L] == 0xFF)
        gEkrGaugeHit[POS_L] = -1;

    if (gEkrGaugeHit[POS_R] == 0xFF)
        gEkrGaugeHit[POS_R] = -1;

    if (valid_l)
    {
        gEkrGaugeDmg[POS_L] = bu1->battleAttack - bu2->battleDefense;
        if (gEkrGaugeDmg[POS_L] < 0)
            gEkrGaugeDmg[POS_L] = 0;

        if (bu1->battleAttack == 0xFF)
            gEkrGaugeDmg[POS_L] = -1;

        if (GetItemIndex(bu1->weapon) == ITEM_MONSTER_STONE)
            gEkrGaugeDmg[POS_L] = -1;
    }

    if (valid_r)
    {
        gEkrGaugeDmg[POS_R] = bu2->battleAttack - bu1->battleDefense;
        if (gEkrGaugeDmg[POS_R] < 0)
            gEkrGaugeDmg[POS_R] = 0;

        if (bu2->battleAttack == 0xFF)
            gEkrGaugeDmg[POS_R] = -1;

        if (GetItemIndex(bu2->weapon) == ITEM_MONSTER_STONE)
            gEkrGaugeDmg[POS_R] = -1;
    }

    if (valid_l)
        gEkrGaugeCrt[POS_L] = bu1->battleEffectiveCritRate;

    if (valid_r)
        gEkrGaugeCrt[POS_R] = bu2->battleEffectiveCritRate;

    if (gEkrGaugeCrt[POS_L] == 0xFF)
        gEkrGaugeCrt[POS_L] = -1;

    if (gEkrGaugeCrt[POS_R] == 0xFF)
        gEkrGaugeCrt[POS_R] = -1;

    if (GetItemIndex(bu1->weapon) == ITEM_MONSTER_STONE)
        gEkrGaugeCrt[POS_L] = -1;

    if (GetItemIndex(bu2->weapon) == ITEM_MONSTER_STONE)
        gEkrGaugeCrt[POS_R] = -1;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gEkrGaugeHit[POS_R] = -1;
        gEkrGaugeDmg[POS_R] = -1;
        gEkrGaugeCrt[POS_R] = -1;
    }

    if (valid_l)
        gBanimExpPrevious[POS_L] = (s8)bu1->expPrevious; // needed explicit casts

    if (valid_r)
        gBanimExpPrevious[POS_R] = (s8)bu2->expPrevious; // needed explicit casts

    if (valid_l)
        gBanimExpGain[POS_L] = bu1->expGain;

    if (valid_r)
        gBanimExpGain[POS_R] = bu2->expGain;

    gBanimWtaBonus[POS_R] = 0;
    gBanimWtaBonus[POS_L] = 0;

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (valid_l)
            gBanimWtaBonus[POS_L] = bu1->wTriangleHitBonus;

        if (valid_r)
            gBanimWtaBonus[POS_R] = bu2->wTriangleHitBonus;

        if (valid_l)
            gBanimEffectiveness[POS_L] = IsUnitEffectiveAgainst(unit_bu1, unit_bu2);

        if (valid_r)
            gBanimEffectiveness[POS_R] = IsUnitEffectiveAgainst(unit_bu2, unit_bu1);

        if (!gBanimEffectiveness[POS_L] && valid_l)
            gBanimEffectiveness[POS_L] = IsItemEffectiveAgainst(bu1->weapon, unit_bu2);

        if (!gBanimEffectiveness[POS_R] && valid_r)
            gBanimEffectiveness[POS_R] = IsItemEffectiveAgainst(bu2->weapon, unit_bu1);
    }

    gBanimForceUnitChgDebug[POS_L] = gBanimForceUnitChgDebug[POS_R] = (void *)zero = 0;

    if (valid_l)
        (void)GetItemIndex(bu1->weaponBefore);

    if (valid_r)
        (void)GetItemIndex(bu2->weaponBefore);

    if (GetBanimLinkArenaFlag() == true || gPlaySt.config.unitColor)
    {
        gBanimUniquePaletteDisabled[POS_L] = gBanimUniquePaletteDisabled[POS_R] = 1;
    }
    else
    {
        gBanimUniquePaletteDisabled[POS_L] = gBanimUniquePaletteDisabled[POS_R] = zero;
    }

    ++zero; --zero; // :/

    gBanimBG = 0;

    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_ON_UNIQUE_BG)
    {
        if (gBanimValid[POS_L] != false)
            gBanimBG =
                GetBanimBackgroundIndex(gBanimTerrain[POS_L], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);
        else
            gBanimBG =
                GetBanimBackgroundIndex(gBanimTerrain[POS_R], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);
    }

    if (CheckBanimHensei() == 1)
        gBanimBG = 0x3C;

    usrdefined_enable = false;
    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_ON)
        usrdefined_enable = true;
    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_ON_UNIQUE_BG)
        usrdefined_enable = true;
    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_OFF)
    {
        /**
         * Banim can also display regardless used-configuration
         * in the following case:
         *
         * 1. promotion
         * 2. arena
         * 3. scriptted battle
         */
        if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
            usrdefined_enable = true;
        if (GetBattleAnimArenaFlag() == true)
            usrdefined_enable = true;
        if ((CheckBattleScriptted() == true))
            usrdefined_enable = true;
    }

    SetBattleUnscriptted();

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (unit_bu1->state & US_IN_BALLISTA)
            return false;

        if (unit_bu2->state & US_IN_BALLISTA)
            return false;
    }

    if (unit_bu1->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_SLEEP)
        return false;

    if (unit_bu2->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu1->weaponBefore) == ITEM_STAFF_SLEEP)
        return false;

    if (unit_bu1->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_BERSERK)
        return false;

    if (unit_bu2->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu1->weaponBefore) == ITEM_STAFF_BERSERK)
        return false;

    if (unit_bu1->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu2->weaponBefore) == ITEM_STAFF_SILENCE)
        return false;

    if (unit_bu2->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu1->weaponBefore) == ITEM_STAFF_SILENCE)
        return false;

    if (unit_bu1->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu2->weaponBefore) == ITEM_MONSTER_STONE)
        return false;

    if (unit_bu2->pClassData->number == CLASS_MANAKETE_MYRRH && GetItemIndex(bu1->weaponBefore) == ITEM_MONSTER_STONE)
        return false;

    if (char_cnt != 1 && unit_bu1->pClassData->number == CLASS_DEMON_KING && GetItemIndex(bu1->weaponBefore) != ITEM_NIGHTMARE &&
        unit_bu2->pClassData->number != CLASS_PHANTOM && unit_bu2->pClassData->number != CLASS_DRACO_ZOMBIE)
        return true;

    if (usrdefined_enable == false)
        return false;

    if (gBanimValid[POS_L] == true)
    {
        if (unit_bu1->statusIndex == UNIT_STATUS_BERSERK)
            return false;

        if (gBanimIdx[POS_L] == -1)
            return false;

        if (gEkrSpellAnimIndex[POS_L] == -2)
            return false;

        if (gBanimFloorfx[POS_L] == -1)
            return false;

        if (gBanimTerrain[POS_L] == TERRAIN_WALL_1B)
            return false;

        if (gBanimTerrain[POS_L] == TERRAIN_SNAG)
            return false;
    }

    if (gBanimValid[POS_R] == true)
    {
        if (unit_bu2->statusIndex == UNIT_STATUS_BERSERK)
            return false;

        if (gBanimIdx[POS_R] == -1)
            return false;

        if (gEkrSpellAnimIndex[POS_R] == -2)
            return false;

        if (gBanimFloorfx[POS_R] == -1)
            return false;

        if (gBanimTerrain[POS_R] == TERRAIN_WALL_1B)
            return false;

        if (gBanimTerrain[POS_R] == TERRAIN_SNAG)
            return false;
    }

    return true;
}

/*
* Same as "GetBattleAnimationId" (FE8U:0x08058848) in banim-ekrcmd.c, except
* this function accounts for the unique battle animation IDs in the
* CharacterData struct.
*/
u16 GetBattleAnimationId_WithUnique(struct Unit * unit, const struct BattleAnimDef * pBattleAnimDef, u16 item, int * out)
{
    const struct BattleAnimDef * animDef;
    int i;
    int j;
#if NONMATCHING
    int ret;
#else
    register int ret asm("sl");
#endif
    int idx;
    int found;
    u16 itemType;

    ret = 0;

    if (pBattleAnimDef == NULL)
    {
        return -1;
    }

    if (GetItemType(item) == ITYPE_ITEM && !IsItemDisplayedInBattle(item))
    {
        return -1;
    }

    if (item == 0)
    {
        itemType = ITYPE_ITEM;
    }
    else
    {
        itemType = GetItemType(item);
    }

    animDef = pBattleAnimDef;

    idx = unit->pCharacterData->_u25[(UNIT_CATTRIBUTES(unit) >> 8 & 1)];

    if (idx != 0)
    {
        animDef = gUnitSpecificBanimConfigs[idx];
    }

    *out = 0;
    i = 0;
    found = 0;

    while (i < 2)
    {
        const struct BattleAnimDef * it = animDef;
        do
        {
            for (j = 0; it->wtype != 0; it++, j++)
            {
                if (i == 0 && it->wtype >= 0x100)
                {
                    continue;
                }

                if (i == 1 && it->wtype < 0x100)
                {
                    continue;
                }

                if (it->wtype == GetItemIndex(item) || (it->wtype - 0x100 == itemType))
                {
                    ret = it->index;
                    *out = j;
                    found = 1;
                    break;
                }
            }
        } while (0);

        if (found == 1)
        {
            break;
        }

        i++;
    }

    return (ret - 1);
}
