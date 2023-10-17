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

int EWRAM_DATA gEkrWindowAppearExist = false;
int EWRAM_DATA gEkrNamewinAppearExist = false;
int EWRAM_DATA gProcEkrBaseAppearExist = false;

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

    SetSpecialColorEffectsParameters(0, 10, 6, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    if (gEkrPairBmLoc[0] == gEkrPairBmLoc[2])
    {
        if (gEkrPairBmLoc[1] >= gEkrPairBmLoc[3])
            mode = 6;
        else
            mode = 2;
    }
    else
    {
        if (gEkrPairBmLoc[1] == gEkrPairBmLoc[3])
        {
            if (gEkrPairBmLoc[0] < gEkrPairBmLoc[2])
                mode = 0;
            else
                mode = 4;
        }
        else
        {
            if (gEkrPairBmLoc[0] < gEkrPairBmLoc[2])
            {
                if (gEkrPairBmLoc[1] >= gEkrPairBmLoc[3])
                    mode = 7;
                else
                    mode = 1;
            }
            else
            {
                if (gEkrPairBmLoc[1] >= gEkrPairBmLoc[3])
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
    CpuFastCopy(gUnknown_080DC85C, PAL_OBJ(4), 4);
    EnablePaletteSync();

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = (gEkrPairBmLoc[0] + gEkrPairBmLoc[2]) * 8 + 8;
        proc->y1 = (gEkrPairBmLoc[1] + gEkrPairBmLoc[3]) * 8 + 8;
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
        proc->x1 = gEkrPairBmLoc[0] * 0x10 + 8;
        proc->y1 = gEkrPairBmLoc[1] * 0x10 + 8;
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
        proc->x1 = gEkrPairBmLoc[2] * 0x10 + 8;
        proc->y1 = gEkrPairBmLoc[3] * 0x10 + 8;
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
        proc->x1 = gEkrPairBmLoc[2] * 0x10 + 8;
        proc->y1 = gEkrPairBmLoc[3] * 0x10 + 8;
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
        if (gEkrPairSideVaild[POS_L] == true && GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
            proc->valid_l = 1;

        if (gEkrPairSideVaild[POS_R] == true)
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

    if (gEkrPairSideVaild[POS_L] == true)
    {
        struct BanimModeData * unk;
        const void * src;
        mode = gpBanimModesLeft[front_mode];
        unk = (void *)(gBanimScrLeft + mode);
        src = unk->img;
        proc->pOaml = (void *)gBanimOaml + unk->unk2;
        LZ77UnCompWram(src, gBanimLeftImgSheetBuf);
    }

    if (gEkrPairSideVaild[POS_R] == true)
    {
        struct BanimModeData * unk;
        const void * src;
        mode = gpBanimModesRight[front_mode];
        unk = (void *)(gBanimScrRight + mode);
        src = unk->img;
        proc->pOamr = (void *)gBanimOamr2 + unk->unk2;
        LZ77UnCompWram(src, gBanimRightImgSheetBuf);
    }

    if (gUnknown_0203E1A4[POS_L] != NULL)
        LZ77UnCompWram(gUnknown_0203E1A4[POS_L], gEkrKakudaiSomeBufLeft);

    if (gUnknown_0203E1A4[POS_R] != NULL)
        LZ77UnCompWram(gUnknown_0203E1A4[POS_R], gEkrKakudaiSomeBufRight);

    ptr = OBJ_VRAM1;
    RegisterDataMove(gBanimLeftImgSheetBuf, ptr, 0x4000);

    proc->timer = 0;
    proc->terminator = 0xB;

    proc->x1 = gEkrPairBmLoc[0] * 0x10 + 8;
    proc->y1 = gEkrPairBmLoc[1] * 0x10 + 8;
    proc->x2 = gEkrPairBmLoc[2] * 0x10 + 8;
    proc->y2 = gEkrPairBmLoc[3] * 0x10 + 8;
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
    u8 sprite_data[0x300];
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
        EkrGetUnitSpriteDataMaybe(proc->pOaml, sprite_data, ret1, ret1, 0);

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
        EkrGetUnitSpriteDataMaybe(proc->pOamr, sprite_data, ret1, ret1, 1);

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
        EkrDispUP_8051B48(0, proc->ymax_name);
    else
        EkrDispUP_8051B48(0, 0);

    gEkrNamewinAppearExist = true;
    sub_8051B80();
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
        sub_8051B70();

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

    EkrDispUP_8051B48(0, iy);
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
