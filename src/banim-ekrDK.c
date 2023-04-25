#include "global.h"
#include "proc.h"
#include "bmbattle.h"
#include "constants/items.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmmap.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void EfxDoDemonKingIntroAnim(struct Anim *anim)
{
    struct EkrSpEff *ekrsp = GetEkrSpEff(anim);
    struct ProcEfxDKHandler *proc = Proc_Start(ProcScr_EkrDemoKingIntro, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrSpEffAttr(anim, 1);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
    gEkrXQuakeOff = 0;
    gEkrYQuakeOff = 0;
    sub_8077DB4(0, 0);
    sub_80729A4(0x380, 0x100, 0x78, 0);
}

void sub_8076598(void)
{
    return;
}

int CheckEkrWpnDemonLight(struct Anim *anim)
{
    struct BattleUnit *bu;
    if (GetAISSubjectId(anim) == 0)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    if (bu->weaponBefore == ITEM_DEMONLIGHT)
        return true;
    else
        return false;
}

void EkrDKIntroStartBaseHide(struct ProcEfxDKHandler *proc)
{
    NewEkrDragonBaseHide(proc->anim);
    Proc_Break(proc);
}

void sub_80765E4(struct ProcEfxDKHandler *proc)
{
    EkrUpdateSomePalMaybe(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void FillMem32_02019790(u32 val)
{
    int i;
    u32 tmp, *buf;

    val = (val << 0x10);
    buf = (u32 *)gUnknown_02019790;
    tmp = val | val >> 0x10;

    for (i = 0; i < 0x400; i++)
        *buf++ = tmp;
}

void sub_8076640(struct ProcEfxDKHandler *proc)
{
    int val1 = Interpolate(INTERPOLATE_RCUBIC, -0x20, 0, proc->unk2E, 0x78);
    int val2 = Interpolate(INTERPOLATE_RCUBIC, -0x50, 0, proc->unk2E, 0x78);

    sub_806FB2C(gUnknown_0201FB0C + val1, val2);
    
    if (proc->unk2E == 0x78) {
        Proc_Break(proc);
    } else
        proc->unk2E++;
}

void sub_807669C(struct ProcEfxDKHandler *proc)
{
    if (CheckEkrWpnDemonLight(proc->anim) != false)
        sub_80589E0(proc->anim, 0xC2);
    else
        sub_80589E0(proc->anim, 0xC1);
    
    SetAnimStateUnHidden(GetAISSubjectId(proc->anim));
    gEkrSpellAnimIndexLutMaybe[0] = 0x40;
    AddEkrSpEffAttr(proc->anim, 1 << 1);
    Proc_Break(proc);
}

void PrepareDemonKingBGFx(struct ProcEfxDKHandler *proc)
{
    FillMem32_02019790(1);
    sub_80559D0((void *)0x60016001);
    BG_Fill(gBG3TilemapBuffer, 1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    Decompress(Img_DemonKingBG, (void *)0x06008000);
    Decompress(Tsa_DemonKingBG1, gUnknown_02019790);
    sub_806FBB8();
    sub_806FB2C(gUnknown_0201FB0C - 0x20, -0x50);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;

    sub_8013A84(0x6);
    sub_8013928(Pal_DemonKingBG, 6, 0x78, proc);
    SetEkrSpEffUnk1(1 << 0);
    proc->unk2E = 0;
}

void sub_8076798(struct ProcEfxDKHandler *proc)
{
    u16 attr1 = GetEkrSpEffAttr(proc->anim);
    u16 attr2 = GetEkrSpEffAttr(GetCoreAIStruct(proc->anim));

    if (attr2 != 1 && attr1 & 4) {
        proc->timer = 0;
        Proc_End(proc->fxproc);

        if (sub_8070214(proc->anim) == false)
            proc->fxproc = NewEkrDragonBodvBlack(proc->anim);
        else
            proc->fxproc = NewEkrDragonTunk(proc->anim);

        Proc_Break(proc);
    }
}

void sub_80767F4(struct ProcEfxDKHandler *proc)
{
    struct ProcEfxDKfx *fxproc = proc->fxproc;
    if (fxproc->unk29 == 1) {
        Proc_End(fxproc);
        Proc_Break(proc);
    }
}

void sub_8076818(struct ProcEfxDKHandler *proc)
{
    SetEkrSpEffUnk1(0);
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetAnimStateHidden(GetAISSubjectId(proc->anim));
    gBanimSideVaildFlagMaybe[GetAISSubjectId(proc->anim)] = false;
    NewEkrDragonBaseAppear(proc->anim);
    BG_Fill(gBG3TilemapBuffer, 0x601F);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    EkrUpdateSomePalMaybe(0x10);
    Proc_Break(proc);
}

void sub_80768A0(struct ProcEfxDKHandler *proc)
{
    if (proc->timer == 0) {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderBmMap();
    }

    EkrUpdateSomePalMaybe(Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void sub_80768F8(struct ProcEfxDKHandler *proc)
{
    AddEkrSpEffAttr(proc->anim, 1 << 3);
    Proc_Break(proc);
}

ProcPtr NewEkrDragonBaseHide(struct Anim *anim)
{
    struct ProcEfxDKfx *proc = Proc_Start(ProcScr_ekrDragonBaseHide, PROC_TREE_3);
    proc->anim = anim;
    proc->unk29 = 0;
    proc->timer = 0;
    return proc;
}

void EkrDragonBaseHide_8076934(struct ProcEfxDKfx *proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0, 0x10, proc->timer, 8);
    CpuFastCopy(gEkrSomePalBuf, PAL_BG(4), 0x40);
    sub_80712B0(PAL_BG(0), 4, 2, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        proc->unk29 = 1;
        Proc_Break(proc);
    }
}

void EkrDragonBaseHide_807699C(struct ProcEfxDKfx *proc)
{
    Proc_Break(proc);
}

ProcPtr NewEkrDragonBaseAppear(struct Anim *anim)
{
    struct ProcEfxDKfx *proc = Proc_Start(ProcScr_ekrDragonBaseAppear, PROC_TREE_3);
    proc->anim = anim;
    proc->unk29 = 0;
    proc->timer = 0;
    FillBGRect(gBG2TilemapBuffer, 0x20, 0x20, 0, 0);
    sub_805AA68(&gUnknown_0201FADC);
    CpuFastCopy(PAL_BG(4), gEkrSomePalBuf, 0x40);
    sub_80712B0(PAL_BG(0), 4, 2, 0x10);
    return proc;
}

void EkrDragonBaseAppear_8076A10(struct ProcEfxDKfx *proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0x10, 0, proc->timer, 8);
    CpuFastCopy(gEkrSomePalBuf, PAL_BG(4), 0x40);
    sub_80712B0(PAL_BG(0), 4, 2, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        proc->unk29 = 1;
        Proc_Break(proc);
    }
}

void EkrDragonBaseAppear_8076A78(struct ProcEfxDKfx *proc)
{
    Proc_Break(proc);
}

void EkrDKHandler_NewDragonAnime(struct ProcEfxDKHandler *proc)
{
    proc->fxproc = NewEkrDragonBodyAnime(proc->anim);
    AddEkrSpEffAttr(proc->anim, 1 << 1);
    Proc_Break(proc);
}

ProcPtr NewEkrDragonBodyAnime(struct Anim *anim)
{
    struct ProcEfxDKfx *proc = Proc_Start(ProcScr_ekrDragonBodyAnime, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = 0;
    proc->unk48 = NULL;
    proc->tsa_set = TsaSet_DKBody;
    proc->unk54 = -1;

    return proc;
}

void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx *proc)
{
    int val1, val2, val3, val4;

    if (sub_806FAB0() != 0) {
        val1 = gEkrXPosBase[0] - gUnknown_02017760[0] - gUnknown_0201FB0C - gUnknown_03004FA0;
        val2 = gEkrYPosBase[0] - gUnknown_02017760[1] - gUnknown_03004FA4;
    } else {
        val1 = gEkrXPosBase[0] + gUnknown_02017760[0] - gUnknown_0201FB0C;
        val2 = gEkrYPosBase[0] - gUnknown_02017760[1];
    }

    val3 = gEkrXPosBase[1] + gUnknown_02017760[0] - gUnknown_0201FB0C - gUnknown_03004FA0;
    val4 = gEkrYPosBase[1] - gUnknown_02017760[1] - gUnknown_03004FA4;

    switch (gEkrSomeType) {
    case 0:
        SetEkrFrontAnimPostion(0, val1, val2);
        SetEkrFrontAnimPostion(1, val3, val4);
        break;

    case 1:
    case 2:
        if (GetAISSubjectId(proc->anim) == 0)
            SetEkrFrontAnimPostion(0, val1, val2);
        else
            SetEkrFrontAnimPostion(1, val3, val4);
        break;

        default:
        break;
    }
}

void sub_8076C10(struct ProcEfxDKBody1 *proc)
{
    proc->timer = 0;
    proc->xPos = gEkrXPosBase[0];
    proc->yPos = gEkrYPosBase[0];
    proc->unk64 = 0;
}

void sub_8076C34(struct ProcEfxDKBody1 *proc)
{
    gEkrXPosBase[0] = proc->xPos;
    gEkrYPosBase[0] = proc->yPos;
    EfxDKUpdateFrontAnimPostion(proc->fxproc);
}

void sub_8076C54(struct ProcEfxDKBody1 *proc)
{
    s16 val1;
    s16 val2;
    u32 val3;
    
    GetCoreAIStruct(proc->fxproc->anim);
    
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

    val1 += gUnknown_0201FB0C;
    sub_806FB2C(val1, val2);
    if (proc->timer > 0x1E) {
        gEkrXQuakeOff = -56;
        gEkrYQuakeOff = 16;
    } else {
        gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -56, proc->timer, 0x1E);
        gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0,  16, proc->timer, 0x1E);
    }

    gEkrXPosBase[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosBase[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x31) {
        proc->timer = 0;
        sub_8077DB4(0, 0);
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076D60(struct ProcEfxDKBody1 *proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_LINEAR, -56, 8, proc->timer, 0xA);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_LINEAR, 16, -8, proc->timer, 0xA);

    sub_806FB2C(gUnknown_0201FB0C, 0);

    gEkrXPosBase[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosBase[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 9) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076DE8(struct ProcEfxDKBody1 *proc)
{
    if (sub_80522CC() == true)
        Proc_Break(proc);
}

void sub_8076E00(struct ProcEfxDKBody1 *proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 8, 0, proc->timer, 20);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -8, 0, proc->timer, 20);

    sub_806FB2C(gUnknown_0201FB0C, 0);

    gEkrXPosBase[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosBase[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x13) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076E84(struct ProcEfxDKBody1 *proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, 0, proc->timer, 0x32);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, 0, proc->timer, 0x32);

    sub_806FB2C(gUnknown_0201FB0C, 0);

    gEkrXPosBase[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosBase[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x31) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076F08(struct ProcEfxDKBody1 *proc)
{
    proc->timer = 0;
    proc->xPos = gEkrXPosBase[0];
    proc->yPos = gEkrYPosBase[0];
}

void sub_8076F28(struct ProcEfxDKBody1 *proc)
{
    gEkrXPosBase[0] = proc->xPos;
    gEkrYPosBase[0] = proc->yPos;
    EfxDKUpdateFrontAnimPostion(proc->fxproc);
}

void sub_8076F48(struct ProcEfxDKBody1 *proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -20, proc->timer, 5);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, 0, -10, proc->timer, 5);

    sub_806FB2C(gUnknown_0201FB0C, 0);

    gEkrXPosBase[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosBase[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x4) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void sub_8076FD0(struct ProcEfxDKBody1 *proc)
{
    return;
}

void sub_8076FD4(struct ProcEfxDKBody1 *proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -20, 0, proc->timer, 4);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -10, 0, proc->timer, 4);

    sub_806FB2C(gUnknown_0201FB0C, 0);

    gEkrXPosBase[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosBase[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x3) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void EkrDragonBodyAnimeSet54(struct Anim *anim)
{
    struct ProcEfxDKfx *proc;

    if (GetEkrSpEffType(anim) == 2) {
        proc = Proc_Find(ProcScr_ekrDragonBodyAnime);

        /**
         * if (!proc)
         *     return;
         */

        proc->unk54 = -1;
    }
}

void EkrDragonBodyAnimeMain(struct ProcEfxDKfx *proc)
{
    s16 ret;
    struct ProcEfxDKBody1 *child;
    int round_type;

    if (proc->unk54 != proc->anim->currentRoundType) {
        round_type = proc->anim->currentRoundType;
        proc->unk54 = round_type;
        proc->timer = 0;
        proc->unk2E = 0;
        proc->unk44 = 0;

        switch (round_type) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 9:
            proc->unk48 = gUnknown_080E8318;
            NewEkrDragonBodyUnk4(proc->anim, round_type);
            break;

        case 4:
        case 5:
            proc->unk48 = gUnknown_080E838E;
            break;

        case 6:
        case 7:
        case 8:
            proc->unk48 = gUnknown_080E8318;
            break;

        default:
            break;
        }
    }

    ret = sub_80558F4((u16 *)&proc->timer, (u16 *)&proc->unk44, (u16 *)proc->unk48);
    if (ret >= 0) {
        LZ77UnCompWram(proc->tsa_set[ret], gUnknown_02019790);
        sub_806FBB8();
        sub_806FB2C(gUnknown_0201FB0C, 0);
        return;
    }

    switch (ret) {
    case -6:
        if (proc->unk2E == 0) {
            if (GetCoreAIStruct(proc->anim)->state3 & ANIM_BIT_FROZEN)
                proc->unk2E = 1;
        } else if (sub_80522CC() == true){
            Proc_BreakEach(ProcScr_ekrDragonBodyUnk3);
            proc->timer = 0;
            proc->unk2E = 0;
            proc->unk44++;
        }
        break;

    case -5:
        if (proc->unk2E == 0)
            proc->unk2E = 1;
        else if (proc->anim->state3 & ANIM_BIT_FROZEN){
            child = Proc_Start(ProcScr_ekrDragonBodyUnk3, PROC_TREE_3);
            child->fxproc = proc;
            proc->timer = 0;
            proc->unk2E = 0;
            proc->unk44++;
        }
        break;

    case -4:
        if (proc->unk2E == 0)
            proc->unk2E = 1;
        else if (sub_80522CC() == true){
            proc->timer = 0;
            proc->unk2E = 0;
            proc->unk44++;
        }
        break;

    default:
        break;
    }
}

void NewEkrDragonBodyUnk4(struct Anim *anim, int round_type)
{
    struct ProcEfxDKBody4 *proc;
    proc = Proc_Start(ProcScr_ekrDragonBodyUnk4, PROC_TREE_3);
    proc->round_type = round_type;
    proc->anim = anim;
}

void EkrDragonBodyUnk4Main(struct ProcEfxDKBody4 *proc)
{
    struct ProcEfxDKfx *fxproc;
    struct ProcEfxDKBody1 *bdproc;

    if (proc->anim->state3 & 0x20)
        if (!(proc->anim->state3 & 0x40))
            return;

    Proc_Break(proc);

    fxproc = Proc_Find(ProcScr_ekrDragonBodyAnime);
    fxproc->timer = 0;
    fxproc->unk2E = 0;
    fxproc->unk44 = 0;

    switch (proc->round_type) {
    case 0:
    case 2:
    case 9:
        if (CheckEkrWpnDemonLight(proc->anim) != false)
            fxproc->unk48 = gUnknown_080E831E;
        else {
            fxproc->unk48 = gUnknown_080E834E;
            bdproc = Proc_Start(ProcScr_ekrDragonBodyUnk2, PROC_TREE_3);
            bdproc->fxproc = fxproc;
        }
        break;

    case 1:
    case 3:
        if (CheckEkrWpnDemonLight(proc->anim) != false) {
            fxproc->unk48 = gUnknown_080E8334;
            NewEkrSelfThunder(proc->anim);
        } else {
            fxproc->unk48 = gUnknown_080E836C;
            bdproc = Proc_Start(ProcScr_ekrDragonBodyUnk1, PROC_TREE_3);
            bdproc->fxproc = fxproc;
            NewEkrSelfThunder(proc->anim);
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_EkrDemoKingIntro[] = {
    PROC_YIELD,
    PROC_REPEAT(EkrDKIntroStartBaseHide),
    PROC_REPEAT(sub_80765E4),
    PROC_CALL(PrepareDemonKingBGFx),
    PROC_REPEAT(sub_8076640),
    PROC_REPEAT(sub_807669C),
    PROC_REPEAT(EkrDKHandler_NewDragonAnime),
    PROC_REPEAT(sub_8076798),
    PROC_REPEAT(sub_80767F4),
    PROC_REPEAT(sub_8076818),
    PROC_REPEAT(sub_80768A0),
    PROC_REPEAT(sub_80768F8),
    PROC_END,
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_ekrDragonBaseHide[] = {
    PROC_NAME("ekrDragonBaseHide"),
    PROC_REPEAT(EkrDragonBaseHide_8076934),
    PROC_REPEAT(EkrDragonBaseHide_807699C),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_ekrDragonBaseAppear[] = {
    PROC_NAME("ekrDragonBaseAppear"),
    PROC_REPEAT(EkrDragonBaseAppear_8076A10),
    PROC_REPEAT(EkrDragonBaseAppear_8076A78),
    PROC_END
};

void EkrDragonBodyAnimeMain(struct ProcEfxDKfx *proc);

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

CONST_DATA struct ProcCmd ProcScr_ekrDragonBodyUnk1[] = {
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

CONST_DATA struct ProcCmd ProcScr_ekrDragonBodyUnk2[] = {
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

CONST_DATA struct ProcCmd ProcScr_ekrDragonBodyUnk3[] = {
    PROC_SET_END_CB(sub_8076F28),
    PROC_CALL(sub_8076F08),
    PROC_REPEAT(sub_8076F48),
    PROC_REPEAT(sub_8076FD0),
    PROC_REPEAT(sub_8076FD4),
    PROC_END
};
