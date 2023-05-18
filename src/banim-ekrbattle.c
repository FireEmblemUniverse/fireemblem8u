#include "global.h"
#include "anime.h"
#include "bm.h"
#include "hardware.h"
#include "ctc.h"
#include "event.h"
#include "proc.h"
#include "bmbattle.h"
#include "bmarena.h"
#include "ekrlevelup.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrdragon.h"
#include "ekrtriangle.h"

EWRAM_DATA struct Anim *gAnims[4] = {NULL};
EWRAM_DATA void *gUnknown_02000010[2] = {NULL};
EWRAM_DATA int gEkrDebugTimer = 0;
EWRAM_DATA int gEkrDebugUnk1 = 0;
EWRAM_DATA int gEkrDebugUnk2 = 0;
EWRAM_DATA int gEkrDebugUnk3 = 0;
EWRAM_DATA s16 gEkrXPosBase[2] = {0};
EWRAM_DATA s16 gEkrYPosBase[2] = {0};

void SetBanimLinkArenaFlag(int flag)
{
    gBanimLinkArenaFlag = flag;
}

int GetBanimLinkArenaFlag(void)
{
    return gBanimLinkArenaFlag;
}

void NewEkrBattleDeamon(void)
{
    gpProcEkrBattleDeamon = Proc_Start(gProc_ekrBattleDeamon, PROC_TREE_3);
    gBattleDeamonActive = true;
    LockGame();
}

void EndEkrBattleDeamon(void)
{
    Proc_End(gpProcEkrBattleDeamon);
}

int IsBattleDeamonActive(void)
{
    if (gBattleDeamonActive == true)
        return true;

    return false;
}

void ekrBattleDeamon_Destructor(void)
{
    gBattleDeamonActive = false;
    UnlockGame();
}

void nullsub_35(void)
{
    return;
}

void NewEkrBattle(void)
{
    AnimClearAll();
    gpProcEkrBattle = Proc_Start(gProc_ekrBattle, PROC_TREE_3);
    SetMainUpdateRoutine(InBattleMainRoutine);
    EkrEfxStatusClear();

    gEkrBattleEndFlag = 0;
    gEkrDebugTimer = 0;
    gEkrDebugUnk1 = 0;
    gEkrDebugUnk2 = 0;
    gEkrDebugUnk3 = 0;

    if (0 == gEkrDebugModeMaybe)
        sub_80726AC();
}

void InBattleMainRoutine(void)
{
    UpdateKeyStatus(gKeyStatusPtr);
    
    if (gEkrDebugUnk1 == 0)
        MainUpdateEkrBattle();
    else if (gEkrDebugUnk2 == 1)
        MainUpdateEkrBattle();

    switch (gEkrBattleEndFlag) {
    case 0:
        break;

    case 1:
        if (0 == gEkrDebugModeMaybe) {
            Proc_End(gpProcEkrBattle);
            EkrMainEndExec();
        }
        break;

    case 2:
        if (0 == gEkrDebugModeMaybe) {
            Proc_End(gpProcEkrBattle);
            EkrMainEndExec();
        } else {
            Proc_End(gpProcEkrBattle);
            EndEkrGauge();
        }
        break;

    default:
        break;
    }

    gBmSt.mainLoopEndedFlag = true;
    gBmSt.prevVCount = REG_VCOUNT;
    VBlankIntrWait();
}

void MainUpdateEkrBattle(void)
{
    ClearSprites();
    sub_8071A8C();

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);
    
    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PushSpriteLayerObjects(0);

    Proc_Run(gProcTreeRootArray[1]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    Proc_Run(gProcTreeRootArray[4]);

    gEkrDebugUnk2 = 0;

    if ((gBanimDoneMaybe[0] + gBanimDoneMaybe[1]) != 2)
        gEkrDebugTimer++;

    PushSpriteLayerObjects(0xD);
}

void nullsub_36(void)
{
    return;
}

void ekrBattle_Init(struct ProcEkrBattle *proc)
{
    gEkrBgXOffset = 0;
    if (gEkrPos2Maybe == 0) {
        if (gEkrDistanceType == EKR_DISTANCE_FAR)
            gEkrBgXOffset = -0x20;
        else
            gEkrBgXOffset = -0xF0;
    }

    sub_8059D28();
    sub_8070B3C();
    SetAnimStateHiddenForDragon();

    gEkrDebugUnk3 = 1;

    if (true == GetBattleAnimArenaFlag())
        proc->timer = 0;
    else
        proc->timer = 0x1E;

    if (EKR_POS_L == gEkrInitialHitSide)
        proc->is_quote = ShouldCallBattleQuote(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
    else
        proc->is_quote = ShouldCallBattleQuote(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);

    proc->unk58 = 0;
    Proc_Break(proc);
}

void ekrBattleMain(struct ProcEkrBattle *proc)
{
    if (++proc->timer == 0x1F) {
        if (GetBanimLinkArenaFlag() != 1 && (proc->is_quote == true || proc->unk58 == true)) {
            NewEkrWindowAppear(1, 7);
            NewEkrNamewinAppear(1, 7, 0);
            proc->proc_idleCb = (ProcFunc)ekrBattle_HandlePreEventMaybe;
            proc->timer = 0;
        } else {
            proc->proc_idleCb = (ProcFunc)ekrBattlePrepareDragonIntro;
            proc->timer = 0;
        }
    }
}

void ekrBattle_HandlePreEventMaybe(struct ProcEkrBattle *proc)
{
    if (DoesEkrWindowAppearExist() != true)
        return;

    EkrGauge_Set2A();
    sub_8051B90();
    CpuFastFill(0, gBG0TilemapBuffer, 0x800);
    BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
    BG_SetPosition(BG_1, 0, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    EkrGauge_Set4C50();

    if (proc->is_quote == true) {
        if (gEkrInitialHitSide == EKR_POS_L)
            CallBattleQuoteEventsIfAny(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
        else
            CallBattleQuoteEventsIfAny(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);

        proc->is_quote = false;
    }

    proc->proc_idleCb = (ProcFunc)ekrBattleWaitPreEvent;
}

void ekrBattleWaitPreEvent(struct ProcEkrBattle *proc)
{
    if (BattleEventEngineExists() != false)
        return;

    EfxPrepareScreenFx();
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    NewEkrWindowAppear(0, 7);
    NewEkrNamewinAppear(0, 7, 0);
    EkrGauge_Clr2A();
    sub_8051BA0();
    EkrGauge_Clr4C50();
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050134;
}

void ekrBattle_8050134(struct ProcEkrBattle *proc)
{
    if (DoesEkrWindowAppearExist() == true) {
        proc->proc_idleCb = (ProcFunc)ekrBattlePrepareDragonIntro;
        proc->timer = 0;
    }
}

void ekrBattlePrepareDragonIntro(struct ProcEkrBattle *proc)
{
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattleExecDragonIntro;
}

void ekrBattleExecDragonIntro(struct ProcEkrBattle *proc)
{
    if (proc->counter == 2) {
        proc->proc_idleCb = (ProcFunc)ekrBattlePostEkrDragonIntro;
        return;
    }

    if (proc->side == EKR_POS_L) {
        proc->anim = gAnims[EKR_POS_L * 2];
        switch (GetEkrDragonStatusType(proc->anim)) {
        /* Draco Zombie */
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            NewEkrDragonDracoZombie(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitDragonIntro;
            break;

        /* DemonKing */
        case EKRDRGON_TYPE_DEMON_KING:
            NewEkrDragonDemonKing(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitDragonIntro;
            break;

        /* Myrrh */
        case EKRDRGON_TYPE_MYRRH:
            NewEkrDragonManakete(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitDragonIntro;
            break;
        }

        proc->side = EKR_POS_R;

    } else {
        proc->anim = gAnims[EKR_POS_R * 2];
        switch (GetEkrDragonStatusType(proc->anim)) {
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            NewEkrDragonDracoZombie(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitDragonIntro;
            break;

        case EKRDRGON_TYPE_DEMON_KING:
            NewEkrDragonDemonKing(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitDragonIntro;
            break;

        case EKRDRGON_TYPE_MYRRH:
            NewEkrDragonManakete(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitDragonIntro;
            break;
        }

        proc->side = EKR_POS_L;
    }

    proc->counter++;
}

void ekrBattleWaitDragonIntro(struct ProcEkrBattle *proc)
{
    if (CheckEfrDragonStatusAttrPrepared(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)ekrBattleExecDragonIntro;
}

void ekrBattlePostEkrDragonIntro(struct ProcEkrBattle *proc)
{
    if (gEkrInitialHitSide != gEkrPos2Maybe) {
        NewEfxFarAttackWithDistance(gAnims[gEkrPos2Maybe * 2], -1);
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050290;
    } else
        proc->proc_idleCb = (ProcFunc)ekrBattleSetFlashingEffect;
}

void ekrBattle_8050290(struct ProcEkrBattle *proc)
{
    if (++proc->timer == 8)
        proc->proc_idleCb = (ProcFunc)ekrBattleSetFlashingEffect;
}

void ekrBattleSetFlashingEffect(struct ProcEkrBattle *proc)
{
    NewEfxStatusUnit(gAnims[0]);
    NewEfxStatusUnit(gAnims[2]);
    NewEfxWeaponIcon(gEkrPairEffectiveAgainst[0], gEkrPairEffectiveAgainst[1]);

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
        DisableEfxStatusUnits(gAnims[0]);

    NewEfxHPBarColorChange(gAnims[0]);
    proc->proc_idleCb = (ProcFunc)ekrBattleExecTriangleAtk;
}

void ekrBattleExecTriangleAtk(struct ProcEkrBattle *proc)
{
    if (gpEkrTriangleUnits[0] != NULL) {
        NewEkrTriangle(gAnims[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattleWaitTriangleIdle;
    } else
        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
}

void ekrBattleWaitTriangleIdle(struct ProcEkrBattle *proc)
{
    if (CheckEkrTriangleInvalid() == true) {
        nullsub_18();
        proc->timer = 0x1E;
        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
    }
}

void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (++proc->timer <= 0x1E)
        return;

    if (gEkrPairSideVaild[0] == true) {
        anim = gAnims[0];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;

        anim = gAnims[1];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;
    }

    if (gEkrPairSideVaild[1] == true) {
        anim = gAnims[2];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;

        anim = gAnims[3];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;
    }

    gBanimDoneMaybe[0] = false;
    gBanimDoneMaybe[1] = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80503EC;
}

void ekrBattle_80503EC(struct ProcEkrBattle *proc)
{
    gEkrDebugUnk3 = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050400;
}

void ekrBattle_8050400(struct ProcEkrBattle *proc)
{
    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
        NewEkrClassChg(gAnims[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattle_WaitPromotionIdle;
    } else {
        proc->speedup = false;
        proc->proc_idleCb = (ProcFunc)ekrBattleInRoundIdle;
    }
}

void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle *proc)
{
    if (EkrClasschgFinished() == true) {
        EndEkrClasschg();
        gEkrPairExpGain[0] = 1;
        proc->proc_idleCb = (ProcFunc)ekrBattle_ExecEkrLvup;
    }
}

void ekrBattleInRoundIdle(struct ProcEkrBattle *proc)
{
    int ret = 0;
    if (gKeyStatusPtr->heldKeys & B_BUTTON)
        proc->speedup = true;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        if ((gBanimDoneMaybe[0] + gBanimDoneMaybe[1]) == 2) {
            if (GetBattleAnimArenaFlag() == 0)
                ret = 1;
            else {
                gEkrPairExpGain[0] = gpEkrBattleUnitLeft->expGain;
                gEkrPairExpGain[1] = gpEkrBattleUnitRight->expGain;

                if (gEkrPairHpInitial[0] == 0) {
                    ArenaSetResult(1);
                    ret = 1;
                } else if (gEkrPairHpInitial[1] == 0) {
                    ArenaSetResult(2);
                    gEkrPairExpGain[1] = 0;
                    ret = 1;
                } else if (proc->speedup == true) {
                    sub_805B094();
                    ArenaSetResult(4);
                    gEkrPairExpGain[1] = 0;
                    ret = 1;
                } else {
                    u8 val = 0;
                    struct Anim *anim1 = gAnims[0];
                    struct Anim *anim2 = gAnims[2];

                    switch (anim1->currentRoundType) {
                    case 6:
                    case 7:
                    case 8:
                        val = 1;
                        break;

                    default:
                        break;
                    } /* switch */

                    switch (anim2->currentRoundType) {
                    case 6:
                    case 7:
                    case 8:
                        val++;
                        break;

                    default:
                        break;
                    } /* switch */

                    if (val == 2) {
                        if (GettUnitEfxDebuff(anim1) & 0xC)
                            SetUnitEfxDebuff(anim1, UNIT_STATUS_NONE);

                        if (GettUnitEfxDebuff(anim2) & 0xC)
                            SetUnitEfxDebuff(anim2, UNIT_STATUS_NONE);

                        if (anim1->xPosition == 0x44)
                            NewEfxFarAttackWithDistance(anim1, -1);

                        ArenaContinueBattle();
                        ParseBattleHitToBanimCmd();
                        AnimClearAll();
                        UpdateBanimFrame();
                        sub_8059D28();

                        proc->timer = 0;
                        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
                    } /* if */
                }
            } /* if */
        } /* switch */
        break;

    case EKR_DISTANCE_3:
        if ((gBanimDoneMaybe[0] + gBanimDoneMaybe[1]) == 1)
            ret = 1;
        break;

    case EKR_DISTANCE_PROMOTION:
        ret = 1;
        break;
    }

    if (ret == 1)
        proc->proc_idleCb = (ProcFunc)ekrBattleOnBattkeEnd;
}

void ekrBattleOnBattkeEnd(struct ProcEkrBattle *proc)
{
    proc->speedup = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050600;
}

void ekrBattle_8050600(struct ProcEkrBattle *proc)
{
    int pos, ret;

    if (gEkrHPBarCount != 0)
        return;

    if (gEkrDeadEventExist != 0)
        return;

    ret = CheckEkrNamewinAppearUnexist();
    if (ret != true)
        return;

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPostBattleAct;

    if (CheckEkrDragonDeadEffectMaybe(gAnims[0]) != false)
        return;

    if (gEkrPairExpGain[EKR_POS_L] != 0)
        pos = EKR_POS_L;
    else
        pos = EKR_POS_R;

    if (pos != gEkrPos2Maybe)
        proc->speedup = ret;

    if (proc->speedup == true)
        NewEfxFarAttackWithDistance(gAnims[gEkrPos2Maybe * 2], -1);
}

/**
 * Battle anim has done and prepare to draw up exp bar
 */
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc)
{
    if (++proc->timer < 0x1E)
        return;

    if (GetBanimLinkArenaFlag() != 1 && gEkrPairExpGain[EKR_POS_L] != -gEkrPairExpGain[EKR_POS_R])
        proc->proc_idleCb = (ProcFunc)ekrBattleExecExpGain;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattleExecExpGain(struct ProcEkrBattle *proc)
{
    int i;
    u32 ret, val0, val1, val2, val3;

    u16 *buf = gUnknown_02019490;
    u16 *buf0 = gUnknown_02019490 + 0x80;

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0x94, 0xF0, 0x94);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    RegisterDataMove(gUnknown_08802D44, (void *)0x6002000, 0x300);
    sub_8070E94(gUnknown_08803524, TILEMAP_LOCATED(gBG1TilemapBuffer, 6, 17), 18, 3, 1, 0x100);
    CpuFastSet(gUnknown_08803590, &gPaletteBuffer[0x10], 8);
    BG_EnableSyncByMask(2);
    EnablePaletteSync();
    ret = GetBanimDragonStatusType();

    switch (ret) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        gLCDControlBuffer.bg1cnt.priority = 0;
        gLCDControlBuffer.bg0cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
        break;

    default:
        gLCDControlBuffer.bg1cnt.priority = 0;
        gLCDControlBuffer.bg0cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    EkrGauge_Setup44(1);

    if (gEkrPairExpGain[EKR_POS_L] != 0)
        val0 = gEkrPairExpPrevious[EKR_POS_L];
    else
        val0 = gEkrPairExpPrevious[EKR_POS_R];

    val1 = DivRem(val0, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    sub_8071140(gUnknown_02019490, val1);

    for (i = 0; i < 13; i++) {
        CpuFastSet(&gUnknown_088030C4[buf[i] * 0x10], &buf0[0x10 * i], 8);
    }

    CpuFastSet(&gUnknown_088033C4[val2 * 0x10], &buf0[0xD0], 8);
    CpuFastSet(&gUnknown_088033C4[val3 * 0x10], &buf0[0xE0], 8);
    RegisterDataMove(buf0, (void *)0x60021A0, 0x1E0);

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80508F0;
}

void ekrBattle_80508F0(struct ProcEkrBattle *proc)
{
    if (++proc->timer > 12) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050940;
    } else
        SetWin0Box(0, -108 - proc->timer, 240, proc->timer - 108);
}

void ekrBattle_8050940(struct ProcEkrBattle *proc)
{
    if (++proc->timer > 10) {
        if (gEkrPairExpGain[0] != 0) {
            proc->timer = gEkrPairExpPrevious[0];
            proc->end = gEkrPairExpPrevious[0] + gEkrPairExpGain[0];
        } else if (gEkrPairExpGain[1] != 0) {
            proc->timer = gEkrPairExpPrevious[1];
            proc->end = gEkrPairExpPrevious[1] + gEkrPairExpGain[1];
        }

        proc->proc_idleCb = (ProcFunc)ekrBattleWaitExpBarIdle;
        EfxPlaySE(0x74, 0x100);
        M4aPlayWithPostionCtrl(0x74, 0x78, 0);
    }
}

void ekrBattleWaitExpBarIdle(struct ProcEkrBattle *proc)
{
    int i, val1, val2, val3;

    u16 *buf0;
    u16 *buf;
    buf = gUnknown_02019490;
    buf0 = gUnknown_02019490 + 0x80;

    val1 = DivRem(proc->timer, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    sub_8071140(buf, val1);

    for (i = 0; i < 13; i++) {
        CpuFastSet(&gUnknown_088030C4[buf[i] * 0x10], &buf0[0x10 * i], 8);
    }

    CpuFastSet(&gUnknown_088033C4[val2 * 0x10], &buf0[0xD0], 8);
    CpuFastSet(&gUnknown_088033C4[val3 * 0x10], &buf0[0xE0], 8);
    RegisterDataMove(buf0, (void *)0x60021A0, 0x1E0);

    if (++proc->timer > proc->end) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattlePostExpBarIdle;
    }
}

void ekrBattlePostExpBarIdle(struct ProcEkrBattle *proc)
{
    if (proc->timer == 0)
        DoM4aSongNumStop(0x74);

    if (++proc->timer > 30) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050AB8;
    }
}

void ekrBattle_8050AB8(struct ProcEkrBattle *proc)
{
    if (++proc->timer > 12) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattleLvupHanlder;
    } else {
        SetWin0Box(0, proc->timer - 120, 240, -96 - proc->timer);
    }
}

void ekrBattleLvupHanlder(struct ProcEkrBattle *proc)
{
    u32 ret;
    int a, b;
    register int c asm("r1");

    if (++proc->timer == 0x18) {
        if (gEkrPairExpGain[EKR_POS_L] != 0) {
            a = gEkrPairExpPrevious[EKR_POS_L];
            b = gEkrPairExpGain[EKR_POS_L];
        } else {
            a = gEkrPairExpPrevious[EKR_POS_R];
            b = gEkrPairExpGain[EKR_POS_R];
        }

        c = a + b;
        if (c >= 100)
            NewEkrLvlupFan();
    }

    if (proc->timer <= 0x28)
        return;

    ClearBG1();
    EkrGauge_Setup44(0);

    ret = GetBanimDragonStatusType();
    switch (ret) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
        break;

    default:
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    SetWin0Box(0, 0, 0xF0, 0xA0);

    if (gEkrPairExpGain[EKR_POS_L] != 0) {
        a = gEkrPairExpPrevious[EKR_POS_L];
        b = gEkrPairExpGain[EKR_POS_L];
    } else {
        a = gEkrPairExpPrevious[EKR_POS_R];
        b = gEkrPairExpGain[EKR_POS_R];
    }

    c = a + b;
    if (c >= 100)
        proc->proc_idleCb = (ProcFunc)ekrBattle_ExecEkrLvup;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattle_ExecEkrLvup(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (gEkrPairExpGain[EKR_POS_L] != 0)
        anim = gAnims[EKR_POS_L * 2];
    else
        anim = gAnims[EKR_POS_R * 2];

    NewEkrLevelup(anim);
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrLvupIdle;
}

void ekrBattle_WaitEkrLvupIdle(struct ProcEkrBattle *proc)
{
    if (CheckEkrLvupDone() == true) {
        EndEkrLevelUp();
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
    }
}

void ekrNewEkrPopup(struct ProcEkrBattle *proc)
{
    NewEkrPopup();
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPopup;
}

void ekrBattle_WaitForPopup(struct ProcEkrBattle *proc)
{
    if (CheckEkrPopupEnded() == true) {
        DeleteAnimsOnPopup();
        proc->proc_idleCb = (ProcFunc)ekrBattle_PostPopup;
    }
}

void ekrBattle_PostPopup(struct ProcEkrBattle *proc)
{
    EndProcEfxWeaponIcon();
    EndEfxHPBarColorChange();
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_TriggerDragonStatusFinished;
}

void ekrBattle_TriggerDragonStatusFinished(struct ProcEkrBattle *proc)
{
    int val;

    /* If both side is not the ekrdragon, get here */
    if (proc->counter == 2) {
        proc->proc_idleCb = (ProcFunc)ekrBattle_PostDragonStatusEffect;
        return;
    }

    if (proc->side == EKR_POS_L) {
        proc->anim = gAnims[0];
        switch (GetEkrDragonStatusType(proc->anim)) {
        case EKRDRGON_TYPE_DEMON_KING:
            SetEkrDragonStatusAttrFinished(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            SetEkrDragonStatusAttrFinished(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            SetEkrDragonStatusAttrFinished(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        default:
            break;
        }

        proc->side = EKR_POS_R;
        proc->counter++;

    } else {
        proc->anim = gAnims[2];
        switch (GetEkrDragonStatusType(proc->anim)) {
        case EKRDRGON_TYPE_DEMON_KING:
            SetEkrDragonStatusAttrFinished(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            SetEkrDragonStatusAttrFinished(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            SetEkrDragonStatusAttrFinished(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        default:
            break;
        }

        proc->side = EKR_POS_L;
        proc->counter++;
    }
}

void ekrBattle_WaitEkrDragonEndIdle(struct ProcEkrBattle *proc)
{
    if (CheckEfrDragonStatusAttrEnd(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)ekrBattle_TriggerDragonStatusFinished;
}

void ekrBattle_PostDragonStatusEffect(struct ProcEkrBattle *proc)
{
    gEkrBattleEndFlag = 1;

    if (gEkrDebugModeMaybe == 0) {
        NewEkrNamewinAppear(2, 7, 0);
        sub_807289C();
    }

    proc->proc_idleCb = (ProcFunc)nullsub_69;
}

void nullsub_69(struct ProcEkrBattle *proc)
{
    return;
}

/**
 * section.data
 */

CONST_DATA char gNopStr[] = "\0";

CONST_DATA struct ProcCmd gProc_ekrBattleDeamon[] = {
    PROC_NAME("ekrBattleDaemon"),
    PROC_SET_END_CB(ekrBattleDeamon_Destructor),
    PROC_REPEAT(nullsub_35),
    PROC_END
};

CONST_DATA struct ProcCmd gProc_ekrBattle[] = {
    PROC_NAME("ekrBattle"),
    PROC_SET_END_CB(nullsub_36),
    PROC_REPEAT(ekrBattle_Init),
    PROC_REPEAT(ekrBattleMain),
    PROC_END
};
