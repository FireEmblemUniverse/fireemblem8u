#include "gbafe.h"

void sub_805AA68(void *);
void sub_805AE14(void *);
void sub_805AE40(void *, s16, s16, s16, s16);

EWRAM_OVERLAY(banim) u16 gEkrBgPaletteBackup[0x20] = {0};

CONST_DATA struct ProcCmd ProcScr_EkrDK[] = {
    PROC_YIELD,
    PROC_REPEAT(EkrDKStartBaseHide),

    /* Make the background and terrain fade into darkness */
    PROC_REPEAT(EkrDK_CustomBgFadeIn),

    /* Decompress images and set palatte fade in effect */
    PROC_CALL(PrepareDemonKingBGFx),

    /* Here only move the DK BG, but not handle the palette change */
    PROC_REPEAT(EkrDK_BgMovement),

    /* Decompress spell and ekr banimfx */
    PROC_REPEAT(EkrDK_PrepareBanimfx),

    PROC_REPEAT(EkrDKHandler_NewDragonAnime),

    /* Check the attr bitfile to wait for end effect */
    PROC_REPEAT(EkrDK_IdleInBattle),

    /* If DK dead, here wait for fade-out proc (ProcScr_ekrDragonTunk) */
    PROC_REPEAT(EkrDK_WaitForFadeOut),

    /* Reload the screen and terrain palette */
    PROC_REPEAT(EkrDK_ReloadTerrainEtc),

    /* Gradullay fade out the normal battle background */
    PROC_REPEAT(EkrDK_ReloadCustomBgAndFadeOut),

    PROC_REPEAT(EkrDK_SetDragonStatusBit3),
    PROC_END,
    PROC_END
};

void NewEkrDragonDemonKing(struct Anim * anim)
{
    struct EkrDragonStatus *ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon * proc = Proc_Start(ProcScr_EkrDK, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
    gEkrXQuakeOff = 0;
    gEkrYQuakeOff = 0;
    sub_8077DB4(0, 0);
    PlaySFX(0x380, 0x100, 0x78, 0);
}

void sub_8076598(void)
{
    return;
}

int CheckEkrWpnDemonLight(struct Anim * anim)
{
    struct BattleUnit *bu;
    if (GetAnimPosition(anim) == 0)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    if (bu->weaponBefore == ITEM_DEMONLIGHT)
        return true;
    else
        return false;
}

void EkrDKStartBaseHide(struct ProcEkrDragon * proc)
{
    NewEkrDragonBaseHide(proc->anim);
    Proc_Break(proc);
}

void EkrDK_CustomBgFadeIn(struct ProcEkrDragon * proc)
{
    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void Fill16_EkrTsaBuffer_(u32 val)
{
    int i;
    u32 tmp, *buf;

    val = (val << 0x10);
    buf = (u32 *)gEkrTsaBuffer;
    tmp = val | val >> 0x10;

    for (i = 0; i < 0x400; i++)
        *buf++ = tmp;
}

void EkrDK_BgMovement(struct ProcEkrDragon * proc)
{
    int val1 = Interpolate(INTERPOLATE_RCUBIC, -0x20, 0, proc->tcounter, 0x78);
    int val2 = Interpolate(INTERPOLATE_RCUBIC, -0x50, 0, proc->tcounter, 0x78);

    EkrDragonTmCpyExt(gEkrBgPosition + val1, val2);
    
    if (proc->tcounter == 0x78) {
        Proc_Break(proc);
    } else
        proc->tcounter++;
}

void EkrDK_PrepareBanimfx(struct ProcEkrDragon * proc)
{
    if (CheckEkrWpnDemonLight(proc->anim) != false)
        EkrPrepareBanimfx(proc->anim, 0xC2);    /* index for DK Ravager in banim table */
    else
        EkrPrepareBanimfx(proc->anim, 0xC1);    /* index for DK Demon Light in banim table */
    
    SetAnimStateUnHidden(GetAnimPosition(proc->anim));
    gEkrSpellAnimIndex[0] = 0x40;
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

void PrepareDemonKingBGFx(struct ProcEkrDragon * proc)
{
    Fill16_EkrTsaBuffer_(1);
    EfxTmFill(0x60016001);
    BG_Fill(gBG3TilemapBuffer, 1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    Decompress(Img_DemonKingBG, (void *)0x06008000);
    Decompress(Tsa_DemonKingBG1, gEkrTsaBuffer);
    EkrDragonTmCpyWithDistance();
    EkrDragonTmCpyExt(gEkrBgPosition - 0x20, -0x50);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;

    SetBlackPal(0x6);

    /* Setup palette fade in process */
    StartPalFade(Pal_DemonKingBG, 6, 0x78, proc);

    SetEkrDragonStatusUnk1(1);
    proc->tcounter = 0;
}

void EkrDK_IdleInBattle(struct ProcEkrDragon * proc)
{
    u16 attr1 = GetEkrDragonStatusAttr(proc->anim);
    u16 attr2 = GetEkrDragonStatusAttr(GetAnimAnotherSide(proc->anim));

    /* 1 << 2 seems to be the end of battle */
    if (attr2 != EKRDRGON_ATTR_START && attr1 & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;
        Proc_End(proc->fxproc);

        if (CheckEkrDragonDead(proc->anim) == false)
            /* Normal end banim */
            proc->fxproc = NewEkrDragonBodvBlack(proc->anim);
        else
            /* Demon King dead */
            proc->fxproc = NewEkrDragonTunk(proc->anim);

        Proc_Break(proc);
    }
}

void EkrDK_WaitForFadeOut(struct ProcEkrDragon * proc)
{
    struct ProcEfxDKfx *fxproc = proc->fxproc;
    if (fxproc->finished == true) {
        Proc_End(fxproc);
        Proc_Break(proc);
    }
}

void EkrDK_ReloadTerrainEtc(struct ProcEkrDragon * proc)
{
    SetEkrDragonStatusUnk1(0);
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetAnimStateHidden(GetAnimPosition(proc->anim));
    gBanimValid[GetAnimPosition(proc->anim)] = false;

    /* Reload the terrain palette */
    NewEkrDragonBaseAppear(proc->anim);
    BG_Fill(gBG3TilemapBuffer, 0x601F);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    EfxChapterMapFadeOUT(0x10);
    Proc_Break(proc);
}

void EkrDK_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc)
{
    if (proc->timer == 0) {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderBmMap();
    }

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrDK_SetDragonStatusBit3(struct ProcEkrDragon * proc)
{
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonBaseHide[] = {
    PROC_NAME("ekrDragonBaseHide"),
    PROC_REPEAT(EkrDragonBaseHideMain),
    PROC_REPEAT(EkrDragonBaseHide_Nop),
    PROC_END
};

ProcPtr NewEkrDragonBaseHide(struct Anim * anim)
{
    struct ProcEfxDKfx * proc = Proc_Start(ProcScr_ekrDragonBaseHide, PROC_TREE_3);
    proc->anim = anim;
    proc->finished = false;
    proc->timer = 0;
    return proc;
}

/* Gradullay fade the terrain palette into darkness */
void EkrDragonBaseHideMain(struct ProcEfxDKfx * proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0, 0x10, proc->timer, 8);
    CpuFastCopy(gEkrBgPaletteBackup, PAL_BG(4), 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        proc->finished = true;
        Proc_Break(proc);
    }
}

void EkrDragonBaseHide_Nop(struct ProcEfxDKfx * proc)
{
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonBaseAppear[] = {
    PROC_NAME("ekrDragonBaseAppear"),
    PROC_REPEAT(EkrDragonBaseAppearMain),
    PROC_REPEAT(EkrDragonBaseAppear_Nop),
    PROC_END
};

ProcPtr NewEkrDragonBaseAppear(struct Anim * anim)
{
    struct ProcEfxDKfx * proc = Proc_Start(ProcScr_ekrDragonBaseAppear, PROC_TREE_3);
    proc->anim = anim;
    proc->finished = false;
    proc->timer = 0;
    FillBGRect(gBG2TilemapBuffer, 0x20, 0x20, 0, 0);
    sub_805AA68(&gUnknown_0201FADC);
    CpuFastCopy(PAL_BG(4), gEkrBgPaletteBackup, 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, 0x10);
    return proc;
}

/* Gradullay reload the terrain palette */
void EkrDragonBaseAppearMain(struct ProcEfxDKfx * proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0x10, 0, proc->timer, 8);
    CpuFastCopy(gEkrBgPaletteBackup, PAL_BG(4), 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        proc->finished = true;
        Proc_Break(proc);
    }
}

void EkrDragonBaseAppear_Nop(struct ProcEfxDKfx * proc)
{
    Proc_Break(proc);
}

void EkrDKHandler_NewDragonAnime(struct ProcEkrDragon * proc)
{
    proc->fxproc = NewEkrDragonBodyAnime(proc->anim);
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonBodyAnime[] = {
    PROC_NAME("ekrDragonBodyAnime"),
    PROC_REPEAT(EkrDragonBodyAnimeMain),
    PROC_END
};

CONST_DATA u16 *TsaSet_DKBody[] = {
    Tsa_DemonKingBG1,
    Tsa_DemonKingBG3,
    Tsa_DemonKingBG2
};

ProcPtr NewEkrDragonBodyAnime(struct Anim * anim)
{
    struct ProcEfxDKfx * proc = Proc_Start(ProcScr_ekrDragonBodyAnime, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0;
    proc->frame = 0;
    proc->frame_lut = NULL;
    proc->tsa_set = TsaSet_DKBody;
    proc->round_cur = -1;

    return proc;
}

void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc)
{
    int val1, val2, val3, val4;

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL) {
        val1 = gEkrXPosReal[0] - gEkrBg2QuakeVec.x - gEkrBgPosition - gUnknown_03004FA0;
        val2 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y - gUnknown_03004FA4;
    } else {
        val1 = gEkrXPosReal[0] + gEkrBg2QuakeVec.x - gEkrBgPosition;
        val2 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
    }

    val3 = gEkrXPosReal[1] + gEkrBg2QuakeVec.x - gEkrBgPosition - gUnknown_03004FA0;
    val4 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y - gUnknown_03004FA4;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        SetEkrFrontAnimPostion(0, val1, val2);
        SetEkrFrontAnimPostion(1, val3, val4);
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        if (GetAnimPosition(proc->anim) == 0)
            SetEkrFrontAnimPostion(0, val1, val2);
        else
            SetEkrFrontAnimPostion(1, val3, val4);
        break;

        default:
        break;
    }
}

void sub_8076C10(struct ProcEfxDKBody1 * proc)
{
    proc->timer = 0;
    proc->xPos = gEkrXPosReal[0];
    proc->yPos = gEkrYPosReal[0];
    proc->unk64 = 0;
}

void sub_8076C34(struct ProcEfxDKBody1 * proc)
{
    gEkrXPosReal[0] = proc->xPos;
    gEkrYPosReal[0] = proc->yPos;
    EfxDKUpdateFrontAnimPostion(proc->fxproc);
}

void sub_8076C54(struct ProcEfxDKBody1 * proc)
{
    s16 val1;
    s16 val2;
    u32 val3;
    
    GetAnimAnotherSide(proc->fxproc->anim);
    
    val1 = 0;
    val2 = 0;

    val3 = proc->timer - 0x12;
    if (val3 <= 0x27) {
    do {
        sub_8077D80(&val1, &val2, proc->unk64, 1);
        sub_8077DB4(val1, val2);
        sub_8077C54(val1, val2);
        proc->unk64++;
    }while(0);
    }

    val1 += gEkrBgPosition;
    EkrDragonTmCpyExt(val1, val2);
    if (proc->timer > 0x1E) {
        gEkrXQuakeOff = -56;
        gEkrYQuakeOff = 16;
    } else {
        gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -56, proc->timer, 0x1E);
        gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0,  16, proc->timer, 0x1E);
    }

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x31) {
        proc->timer = 0;
        sub_8077DB4(0, 0);
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076D60(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_LINEAR, -56, 8, proc->timer, 0xA);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_LINEAR, 16, -8, proc->timer, 0xA);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 9) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076DE8(struct ProcEfxDKBody1 * proc)
{
    if (CheckEkrHitDone() == true)
        Proc_Break(proc);
}

void sub_8076E00(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 8, 0, proc->timer, 20);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -8, 0, proc->timer, 20);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x13) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076E84(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, 0, proc->timer, 0x32);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, 0, proc->timer, 0x32);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x31) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076F08(struct ProcEfxDKBody1 * proc)
{
    proc->timer = 0;
    proc->xPos = gEkrXPosReal[0];
    proc->yPos = gEkrYPosReal[0];
}

void sub_8076F28(struct ProcEfxDKBody1 * proc)
{
    gEkrXPosReal[0] = proc->xPos;
    gEkrYPosReal[0] = proc->yPos;
    EfxDKUpdateFrontAnimPostion(proc->fxproc);
}

void sub_8076F48(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -20, proc->timer, 5);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -10, proc->timer, 5);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x4) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076FD0(struct ProcEfxDKBody1 * proc)
{
    return;
}

void sub_8076FD4(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -20, 0, proc->timer, 4);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -10, 0, proc->timer, 4);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x3) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void EkrDragonBodyAnimeSet54(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;

    if (GetEkrDragonStatusType(anim) == EKRDRGON_TYPE_DEMON_KING) {
        proc = Proc_Find(ProcScr_ekrDragonBodyAnime);

#if BUGFIX
        if (!proc)
            return;
#endif

        proc->round_cur = -1;
    }
}

CONST_DATA struct ProcCmd ProcScr_EkrDemoKingAtkRavagerCritical[] = {
    PROC_SET_END_CB(sub_8076C34),
    PROC_CALL(sub_8076C10),
    PROC_SLEEP(0xC),
    PROC_SLEEP(0x5A),
    PROC_REPEAT(sub_8076C54),
    PROC_REPEAT(sub_8076D60),
    PROC_SLEEP(0xA),
    PROC_REPEAT(sub_8076DE8),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(sub_8076E00),
    PROC_SLEEP(0x16),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EkrDemoKingAtkRavagerNormal[] = {
    PROC_SET_END_CB(sub_8076C34),
    PROC_CALL(sub_8076C10),
    PROC_SLEEP(0x8),
    PROC_REPEAT(sub_8076C54),
    PROC_REPEAT(sub_8076D60),
    PROC_SLEEP(0xA),
    PROC_REPEAT(sub_8076DE8),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(sub_8076E00),
    PROC_SLEEP(0x16),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EkrDemoKingBodyShake[] = {
    PROC_SET_END_CB(sub_8076F28),
    PROC_CALL(sub_8076F08),
    PROC_REPEAT(sub_8076F48),
    PROC_REPEAT(sub_8076FD0),
    PROC_REPEAT(sub_8076FD4),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EkrDemoKingAtk[] = {
    PROC_SLEEP(0x1),
    PROC_REPEAT(EkrDemoKingAtkMain),
    PROC_END
};

const s16 BnaimFrames_DkHittedNormal[] = {
    /* Index    Duration */
    0,          1,
    -1
};

const s16 BnaimFrames_DkDemonLightNormal[] = {
    /* Index    Duration */
    0,          2,
    2,          224,
    -4,         0,
    2,          9,
    0,          1,
    -1
};

const s16 BnaimFrames_DkDemonLightCritical[] = {
    /* Index    Duration */
    0,          2,
    2,          90,
    2,          224,
    -4,         0,
    2,          9,
    0,          1,
    -1
};

const s16 BnaimFrames_DkRavagerNormal[] = {
    /* Index    Duration */
    0,          2,
    0,          60,
    1,          11,
    1,          2,
    -4,         0,
    1,          52,
    0,          1,
    -1
};

const s16 BnaimFrames_DkRavagerCritical[] = {
    /* Index    Duration */
    0,          2,
    2,          90,
    0,          60,
    1,          11,
    1,          5,
    -4,         0,
    1,          52,
    0,          1,
    -1
};

const s16 BnaimFrames_DkMiss[] = {
    /* Index    Duration */
    0,          1,
    -5,         0,
    0,          2,
    0,          1,
    -6,         0,
    0,          1,
    -1,
};

void EkrDragonBodyAnimeMain(struct ProcEfxDKfx * proc)
{
    s16 ret;
    struct ProcEfxDKBody1 *child;
    int round_type;

    /* Wait for anim->round to triger DK action */
    if (proc->round_cur != proc->anim->currentRoundType) {
        round_type = proc->anim->currentRoundType;
        proc->round_cur = round_type;
        proc->timer = 0;
        proc->unk2E = 0;
        proc->frame = 0;

        switch (round_type) {
        case ANIM_ROUND_HIT_CLOSE:
        case ANIM_ROUND_CRIT_CLOSE:
        case ANIM_ROUND_NONCRIT_FAR:
        case ANIM_ROUND_CRIT_FAR:
        case ANIM_ROUND_MISS_CLOSE:
            proc->frame_lut = BnaimFrames_DkHittedNormal;
            NewEkrDemoKingAtk(proc->anim, round_type);
            break;

        case ANIM_ROUND_TAKING_MISS_CLOSE:
        case ANIM_ROUND_TAKING_MISS_FAR:
            proc->frame_lut = BnaimFrames_DkMiss;
            break;

        case ANIM_ROUND_TAKING_HIT_CLOSE:
        case ANIM_ROUND_STANDING:
        case ANIM_ROUND_TAKING_HIT_FAR:
            proc->frame_lut = BnaimFrames_DkHittedNormal;
            break;

        default:
            break;
        }
    }

    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, (const s16 *)proc->frame_lut);
    if (ret >= 0) {
        LZ77UnCompWram(proc->tsa_set[ret], gEkrTsaBuffer);
        EkrDragonTmCpyWithDistance();
        EkrDragonTmCpyExt(gEkrBgPosition, 0);
        return;
    }

    switch (ret) {
    case -6:
        if (proc->unk2E == 0) {
            if (GetAnimAnotherSide(proc->anim)->state3 & ANIM_BIT_FROZEN)
                proc->unk2E = 1;
        } else if (CheckEkrHitDone() == true){
            Proc_BreakEach(ProcScr_EkrDemoKingBodyShake);
            proc->timer = 0;
            proc->unk2E = 0;
            proc->frame++;
        }
        break;

    case -5:
        if (proc->unk2E == 0)
            proc->unk2E = 1;
        else if (proc->anim->state3 & ANIM_BIT_FROZEN){
            child = Proc_Start(ProcScr_EkrDemoKingBodyShake, PROC_TREE_3);
            child->fxproc = proc;
            proc->timer = 0;
            proc->unk2E = 0;
            proc->frame++;
        }
        break;

    case -4:
        if (proc->unk2E == 0)
            proc->unk2E = 1;
        else if (CheckEkrHitDone() == true){
            proc->timer = 0;
            proc->unk2E = 0;
            proc->frame++;
        }
        break;

    default:
        break;
    }
}

void NewEkrDemoKingAtk(struct Anim * anim, int round_type)
{
    struct ProcEfxDKBody4 * proc;
    proc = Proc_Start(ProcScr_EkrDemoKingAtk, PROC_TREE_3);
    proc->round_type = round_type;
    proc->anim = anim;
}

void EkrDemoKingAtkMain(struct ProcEfxDKBody4 * proc)
{
    struct ProcEfxDKfx *fxproc;
    struct ProcEfxDKBody1 *bdproc;

    if (proc->anim->state3 & ANIM_BIT3_BLOCKING)
        if (!(proc->anim->state3 & ANIM_BIT3_BLOCKEND))
            return;

    Proc_Break(proc);

    fxproc = Proc_Find(ProcScr_ekrDragonBodyAnime);
    fxproc->timer = 0;
    fxproc->unk2E = 0;
    fxproc->frame = 0;

    switch (proc->round_type) {
    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
        if (CheckEkrWpnDemonLight(proc->anim) != false)
            fxproc->frame_lut = BnaimFrames_DkDemonLightNormal;
        else {
            fxproc->frame_lut = BnaimFrames_DkRavagerNormal;
            bdproc = Proc_Start(ProcScr_EkrDemoKingAtkRavagerNormal, PROC_TREE_3);
            bdproc->fxproc = fxproc;
        }
        break;

    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_CRIT_FAR:
        if (CheckEkrWpnDemonLight(proc->anim) != false) {
            fxproc->frame_lut = BnaimFrames_DkDemonLightCritical;
            NewEkrSelfThunder(proc->anim);
        } else {
            fxproc->frame_lut = BnaimFrames_DkRavagerCritical;
            bdproc = Proc_Start(ProcScr_EkrDemoKingAtkRavagerCritical, PROC_TREE_3);
            bdproc->fxproc = fxproc;
            NewEkrSelfThunder(proc->anim);
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonBodvBlack[] = {
    PROC_NAME("ekrDragonBodyBlack"),
    PROC_REPEAT(EkrDragonBodyBlackMain),
    PROC_REPEAT(nop_8077394),
    PROC_END
};

ProcPtr NewEkrDragonBodvBlack(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;
    proc = Proc_Start(ProcScr_ekrDragonBodvBlack, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->finished = 0;
    return proc;
}

void sub_80772E4(int val)
{
    CpuFastCopy(Pal_080E1164, PAL_BG(4), 0x20);
    EfxPalBlackInOut(gPaletteBuffer, 4, 1, val);
}

void EkrDragonBodyBlackMain(struct ProcEfxDKfx * proc)
{
    int ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0x10, proc->timer, 0x8);
    CpuFastCopy(Pal_DemonKingBG, PAL_BG(0x6), 0x20);
    CpuFastCopy(gpEfxUnitPaletteBackup[0], PAL_OBJ(0x7), 0x20);
    EfxPalBlackInOut(gPaletteBuffer, 6, 1, ret);
    EfxPalBlackInOut(gPaletteBuffer, 0x17, 1, ret);
    EnablePaletteSync();

    if (++proc->timer == 9) {
        proc->finished = true;
        Proc_Break(proc);
    }
}

void nop_8077394(void)
{
    return;
}

void sub_8077398(void)
{
    NewEkrWhiteOUT(3, 2, 3);
    PlaySFX(0x147, 0x100, 0x78, 0x0);
}

void sub_80773BC(struct ProcEfxDKfx * proc)
{
    proc->finished = false;
    proc->timer = 0;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        proc->unk32 = -32;
    else
        proc->unk32 = 0;
}

void sub_80773E4(struct ProcEfxDKfx * proc)
{
    int time;
    s16 val1, val2;

    sub_8077D80(&val1, &val2, proc->timer, 0);
    sub_8077DB4(val1, val2);

    ++proc->timer;
    
    time = proc->timer;
    if (time == 480) {
        StartPalFade(Pal_AllBlack, 0x17, 0xF0, proc);
        StartPalFade(Pal_AllBlack, 0x06, 0xF0, proc);
    }

    if (Proc_Find(ProcScr_08801810) == NULL) {
        sub_8077DB4(0, 0);
        Proc_Break(proc);
    }
}

void sub_8077460(struct ProcEfxDKfx * proc)
{
    proc->finished = true;
    Proc_Break(proc);
}

void sub_8077474(int arg1, int arg2)
{
    int _a1 = arg1 >> 3;
    int _a2 = arg2 >> 3;

    Decompress(Tsa_DemonKingBG1, gEkrTsaBuffer);

    EfxTmCpyExtHFlip(&gEkrTsaBuffer[0x3C0], -1,
        EFX_TILEMAP_LOC(gTmB_Banim, _a1, _a2),
        EFX_BG_WIDTH, TILE_SIZE_4BPP, 2, 6, 0);

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gTmB_Banim, _a1, _a2 + 2),
        EFX_BG_WIDTH, TILE_SIZE_4BPP,
        30, 6, 0);
}

void sub_807750C(int arg1, int arg2)
{
    int _a1 = arg1 >> 3;
    int a = arg1 & 7;
    int _a2 = arg2 >> 3;
    int b = arg2 & 7;

    BG_SetPosition(BG_3, a, b);
    EfxTmCpyExt(
        EFX_TILEMAP_LOC(gTmB_Banim, _a1, _a2),
        EFX_BG_WIDTH,
        gBG3TilemapBuffer,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, TILE_SIZE_4BPP, -1, -1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_087F4518[] = {
    PROC_YIELD,
    PROC_CALL(sub_80773BC),
    PROC_START_CHILD(ProcScr_08801810),
    PROC_REPEAT(sub_80773E4),
    PROC_CALL(sub_8077460),
    PROC_END
};

ProcPtr NewProc087F4518(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;
    proc = Proc_Start(ProcScr_087F4518, PROC_TREE_3);
    proc->anim = anim;
    Sound_FadeOutBGM(1);
    return proc;
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonTunkFace[] = {
    PROC_NAME("ekrDragonTunkFace"),
    PROC_SET_END_CB(sub_8077678),
    PROC_CALL(EkrDragonTunkFaceRegisterAnim),
    PROC_REPEAT(EkrDragonTunkFaceIdle),
    PROC_REPEAT(sub_807766C),
    PROC_END
};

ProcPtr NewEkrDragonTunkFace(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;
    proc = Proc_Start(ProcScr_ekrDragonTunkFace, PROC_TREE_3);
    proc->anim = anim;
    return proc;
}

void EkrDragonTunkFaceRegisterAnim(struct ProcEfxDKfx * proc)
{
    struct Anim * anim;

    const u32 *scr = BanimScr_DemoKingTunkFace;
    SpellFx_RegisterObjPal(Pal_DemoKingTunkFace, 0x20);
    SpellFx_RegisterObjGfx(Img_DemoKingTunkFace, 0x2000);
    anim = EfxCreateBackAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;
    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;
    proc->timer = 0;
}

void EkrDragonTunkFaceIdle(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;

    if (++proc->timer > 3) {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
        EkrDragonTunkFaceRegisterAnim2(proc);
    }
}

void EkrDragonTunkFaceRegisterAnim2(struct ProcEfxDKfx * proc)
{
    struct Anim * anim;

    const u32 *scr = BanimScr_087F4314;
    SpellFx_RegisterObjPal(Pal_DemoKingTunkFace, 0x20);
    SpellFx_RegisterObjGfx(Img_DemoKingTunkFace2, 0x2000);
    anim = EfxCreateBackAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;
    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;
    proc->timer = 0;
}

void sub_807766C(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;
}

void sub_8077678(struct ProcEfxDKfx * proc)
{
    AnimDelete(proc->anim2);
}

void sub_8077684(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;

    if (++proc->timer == 4) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void sub_80776B0(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;

    if (++proc->timer == 0x12C) {
        Proc_Break(proc);
    }
}

void EfxTmDecompress(int xtile, int ytile, const u16 *tsa)
{
    int x = xtile >> 3;
    int y = ytile >> 3;

    EfxTmFill(0);
    LZ77UnCompWram(tsa, gEkrTsaBuffer);

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gTmB_Banim, x, y),
        EFX_BG_WIDTH, TILE_SIZE_4BPP,
        TILE_SIZE_4BPP, 6, 0);
}

void EfxBG3TmSetPosition(int xtile, int ytile)
{
    int x = xtile >> 3;
    int xbg = xtile & 7;
    int y = ytile >> 3;
    int ybg = ytile & 7;

    BG_SetPosition(BG_3, xbg, ybg);
    EfxTmCpyExt(
        EFX_TILEMAP_LOC(gTmB_Banim, x, y),
        EFX_BG_WIDTH,
        gBG3TilemapBuffer,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, TILE_SIZE_4BPP, -1, -1);

    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonTunk[] = {
    PROC_NAME("ekrDragonTunk"),
    PROC_REPEAT(DemonKingDeadWhiteOut),
    PROC_REPEAT(sub_807789C),
    PROC_REPEAT(sub_8077AA8),
    PROC_END
};

ProcPtr NewEkrDragonTunk(struct Anim * anim)
{
    struct ProcEkrDragonTunk * proc;
    proc = Proc_Start(ProcScr_ekrDragonTunk, PROC_TREE_3);
    proc->anim = anim;
    proc->finished = false;
    proc->timer1 = 0;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        proc->unk32 = -8;
    else
        proc->unk32 = -32;
    
    Sound_FadeOutBGM(1);
    return proc;
}

void DemonKingDeadWhiteOut(struct ProcEkrDragonTunk * proc)
{
    if (++proc->timer1 == 0x1) {
        NewEkrWhiteOUT(3, 2, 3);
        PlaySFX(0x147, 0x100, 0x78, 0x0);
    }

    if (proc->timer1 == 0x23) {
        NewEkrWhiteOUT(3, 2, 3);
        PlaySFX(0x147, 0x100, 0x78, 0x0);
    }

    if (proc->timer1 == 0x32) {
        NewEkrWhiteOUT(3, 2, 3);
        PlaySFX(0x147, 0x100, 0x78, 0x0);
    }

    if (proc->timer1 == 0x36) {
        SetAnimStateHidden(GetAnimPosition(proc->anim));
        EfxTmDecompress(proc->unk32, -8, Tsa_DemonKingBG1);
        EfxBG3TmSetPosition(0, 0);
    }

    if (proc->timer1 == 0x64) {
        proc->timer1 = 0;
        proc->timer2 = 0;
        Proc_Break(proc);
        NewProc087F4518(proc->anim);
    }
}


void sub_807789C(struct ProcEkrDragonTunk * proc)
{
    int _0 = 0;

    if (proc->timer2 <=0x18A)
        EfxBG3TmSetPosition(gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    
    BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    sub_8077EAC(gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

    EkrGauge_Setxy323A(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    
    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    
    if (++proc->timer2 == 0x2) {
        proc->qproc = NewEfxQuakePure(0xC, 0);
        PlaySFX(0x142, 0x100, 0x78, 0x0);
    }

    if (proc->timer2 == 0x78) {
        Proc_End(proc->qproc);
        proc->qproc = NewEfxQuakePure(0xD, 0);
    }

    if (proc->timer2 == 0xB4) {
        Proc_End(proc->qproc);
        proc->qproc = NewEfxQuakePure(0xE, 0);
    }

    if (proc->timer2 == 0xE6) {
        proc->unk3A = _0;
        proc->unk3C = _0;
        proc->fproc = NewEkrDragonTunkFace(proc->anim);
        proc->fproc->xPos = proc->anim->xPosition;
        proc->fproc->yPos = proc->anim->yPosition - proc->unk3A;
    }

    if (proc->timer2 == 0xE7) {
        EfxTmDecompress(proc->unk32, -8, Tsa_DemonKingBG2);
        EfxBG3TmSetPosition(0, 0);
    }

    if (proc->timer2 > 0xE5) {
        proc->fproc->xPos = proc->anim->xPosition;
        proc->fproc->yPos = proc->anim->yPosition;

        proc->fproc->xPos -= gEkrBg2QuakeVec.x;
        proc->fproc->yPos -= gEkrBg2QuakeVec.y;
    }

    if (proc->timer2 == 0xF0)
        NewEkrWhiteOUT(0x7D, 0x1E, 0x78);
    
    if (proc->timer2 == 0x18B) {
        Proc_End(proc->fproc);
        Proc_End(proc->qproc);
        gEkrBg2QuakeVec.x = _0;
        gEkrBg2QuakeVec.y = _0;

        BG_Fill(gBG3TilemapBuffer, 0x601F);
        BG_EnableSyncByMask(BG3_SYNC_BIT);

        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        sub_8077EAC(0, 0);
        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
    }

    if (proc->timer2 == 0x203) {
        proc->finished = true;
        Proc_Break(proc);
    }
}

void sub_8077AA8(void)
{
    return;
}

CONST_DATA struct ProcCmd ProcScr_ekrWhiteOUT[] = {
    PROC_NAME("ekrWhiteINOUT"),
    PROC_REPEAT(EkrWhiteOutFadeIn),
    PROC_REPEAT(EkrWhiteOutDelay),
    PROC_REPEAT(EkrWhiteOutFadeOut),
    PROC_REPEAT(EkrWhiteOutOnEnd),
    PROC_END
};

void NewEkrWhiteOUT(int a, int b, int c)
{
    struct ProcEkrWhiteOUT * proc;
    proc = Proc_Start(ProcScr_ekrWhiteOUT, PROC_TREE_VSYNC);
    proc->timer = 0;
    proc->max_time1 = a;
    proc->max_time2 = b;
    proc->max_time3 = c;

    gLCDControlBuffer.bldcnt.target1_bd_on = 0;
    gLCDControlBuffer.bldcnt.target2_bd_on = 0;
}

void EkrWhiteOutFadeIn(struct ProcEkrWhiteOUT * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->max_time1);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->max_time1) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteOutDelay(struct ProcEkrWhiteOUT * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->max_time2) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteOutFadeOut(struct ProcEkrWhiteOUT * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, proc->max_time3);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->max_time3) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteOutOnEnd(struct ProcEkrWhiteOUT * proc)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = 1;
    gLCDControlBuffer.bldcnt.target2_bd_on = 1;
    EnablePaletteSync();
    Proc_Break(proc);
}

void sub_8077C54(s16 x, s16 y)
{
    s16 ix1, iy1;
    s16 ix2, iy2;

    BG_SetPosition(BG_2, x, y);
    BG_SetPosition(BG_0, x + gEkrBg0QuakeVec.x, y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(
        -(x + gEkrBg0QuakeVec.x),
        -(y + gEkrBg0QuakeVec.y));

    EkrDispUP_SetPositionSync(
        -(x + gEkrBg0QuakeVec.x),
        -(y + gEkrBg0QuakeVec.y));

    BG_SetPosition(BG_3, x, y);

    ix1 = gEkrXPosReal[0] - x - gEkrBgPosition;
    iy1 = gEkrYPosReal[0] - y;
    ix2 = gEkrXPosReal[1] + x - gEkrBgPosition;
    iy2 = gEkrYPosReal[1] - y;

    SetEkrFrontAnimPostion(0, ix1, iy1);
    SetEkrFrontAnimPostion(1, ix2, iy2);
}
