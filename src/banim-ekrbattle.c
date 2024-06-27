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
#include "ekrclasschg.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrdragon.h"
#include "ekrtriangle.h"
#include "eventinfo.h"

/* ekr */
EWRAM_OVERLAY(banim) struct Anim * gAnims[4] = {NULL};
EWRAM_OVERLAY(banim) void * gUnknown_02000010[2] = {NULL};
EWRAM_OVERLAY(banim) int gEkrDebugTimer = 0;
EWRAM_OVERLAY(banim) int gEkrDebugUnk1 = 0;
EWRAM_OVERLAY(banim) int gEkrDebugUnk2 = 0;
EWRAM_OVERLAY(banim) int gCtrlC01Blocking = 0;
EWRAM_OVERLAY(banim) s16 gEkrXPosReal[2] = {0};
EWRAM_OVERLAY(banim) s16 gEkrYPosReal[2] = {0};
EWRAM_OVERLAY(banim) u16 gEkrXPosBase[2] = {0};
EWRAM_OVERLAY(banim) u16 gEkrYPosBase[2] = {0};
EWRAM_OVERLAY(banim) struct Vec2 gEkrBg0QuakeVec = {0};
EWRAM_OVERLAY(banim) void * gUnknown_0200003C[2] = {0};
EWRAM_OVERLAY(banim) void * gUnknown_02000044[2] = {0};
EWRAM_OVERLAY(banim) void * gBanimTerrainPaletteMaybe[2] = {0};
EWRAM_OVERLAY(banim) u16 * gpEfxUnitPaletteBackup[2] = {0};
EWRAM_OVERLAY(banim) int * gpBanimModesLeft = NULL;
EWRAM_OVERLAY(banim) int * gpBanimModesRight = NULL;
EWRAM_OVERLAY(banim) struct ProcEkrBattle * gpProcEkrBattle = NULL;
EWRAM_OVERLAY(banim) struct ProcEkrGauge * gpProcEkrGauge = NULL;
EWRAM_OVERLAY(banim) struct ProcEkrDispUP * gpProcEkrDispUP = NULL;
EWRAM_OVERLAY(banim) u8 gUnk_Banim_20000700[0x18] = {0};
EWRAM_OVERLAY(banim) u8 gBanimLeftImgSheetBuf[0x1000] = {0};
EWRAM_OVERLAY(banim) u8 gEkrKakudaiSomeBufLeft[0x1000] = {0};
EWRAM_OVERLAY(banim) u8 gBanimRightImgSheetBuf[0x1000] = {0};
EWRAM_OVERLAY(banim) u8 gEkrKakudaiSomeBufRight[0x1000] = {0};
EWRAM_OVERLAY(banim) u16 gBanimPaletteLeft[0x50] = {0};
EWRAM_OVERLAY(banim) u16 gBanimPaletteRight[0x50] = {0};
EWRAM_OVERLAY(banim) u32 gBanimOaml[0x1600] = {0};
EWRAM_OVERLAY(banim) u32 gBanimOamr2[0x1600] = {0};
EWRAM_OVERLAY(banim) u8 gBanimScrLeft[0x2A00] = {0};
EWRAM_OVERLAY(banim) u8 gBanimScrRight[0x2A00] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_020145C8[0x2000] = {0};
EWRAM_OVERLAY(banim) u16 gEfxPal[0x130] = {0};
EWRAM_OVERLAY(banim) u16 gEfxTerrainPalette[0xD0] = {0};
EWRAM_OVERLAY(banim) u16 gObjBuf_EkrSideHitDmgCrit[0x200] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_02016DC8[0x80] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_02016E48[0x200] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_02017048[0x200] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_02017248[0x200] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_02017448[0x200] = {0};
EWRAM_OVERLAY(banim) struct Font gBanimFont = {0};
EWRAM_OVERLAY(banim) struct Text gBanimText[20] = {0};
EWRAM_OVERLAY(banim) u16 gEkrGaugeDecoder[18] = {0};
EWRAM_OVERLAY(banim) u32 gEkrBattleEndFlag = 0;

/* efx */
EWRAM_OVERLAY(banim) u32 gEkrHpBarCount = 0;
EWRAM_OVERLAY(banim) u32 gEfxSpellAnimExists = 0;
EWRAM_OVERLAY(banim) u32 gUnknown_02017730 = 0;
EWRAM_OVERLAY(banim) u32 gEkrDeadExist = 0;
EWRAM_OVERLAY(banim) u32 gEkrDeadEventExist = 0;
EWRAM_OVERLAY(banim) u32 gEfxQuakeExist = 0;
EWRAM_OVERLAY(banim) u32 gEfxHitQuakeExist = 0;
EWRAM_OVERLAY(banim) u32 gEkrInitPosReal = 0;
EWRAM_OVERLAY(banim) u32 gEfxFarAttackExist = 0;
EWRAM_OVERLAY(banim) u32 gEfxBgSemaphore = 0;
EWRAM_OVERLAY(banim) u32 gEfxHpBarResireFlag = 0;
EWRAM_OVERLAY(banim) u32 gUnknown_02017754 = 0;
EWRAM_OVERLAY(banim) u32 gEfxTeonoState = 0;
EWRAM_OVERLAY(banim) u32 gUnknown_0201775C = 0;
EWRAM_OVERLAY(banim) struct Vec2 gEkrBg2QuakeVec = {0};
EWRAM_OVERLAY(banim) s16 gUnknown_02017764[2] = {0};
EWRAM_OVERLAY(banim) s16 gEfxSpecalEffectExist[2] = {0};
EWRAM_OVERLAY(banim) struct ProcEfxStatusUnit *gpProcEfxStatusUnits[2] = {NULL};
EWRAM_OVERLAY(banim) struct ProcEfxWeaponIcon *gpProcEfxWeaponIcon = NULL;
EWRAM_OVERLAY(banim) struct ProcEfxSpellCast * gpProcEfxSpellCast = NULL;
EWRAM_OVERLAY(banim) struct ProcEfxHpBarColorChange * gpProcEfxHpBarColorChange =NULL;
EWRAM_OVERLAY(banim) s16 gEkrHitNow[2] = {0};
EWRAM_OVERLAY(banim) s16 gUnk_Banim_02017784[6] = {0};
EWRAM_OVERLAY(banim) u8 gSpellAnimBgfx[0x1D00] = {0};
EWRAM_OVERLAY(banim) u16 gEkrBarfxBuf[0x180] = {0};
EWRAM_OVERLAY(banim) u16 gEkrTsaBuffer[0x1000 / sizeof(u16)] = {0};
EWRAM_OVERLAY(banim) u8 gBuf_Banim[0x2000] = {0};
EWRAM_OVERLAY(banim) u16 gPal_Banim[0xA0] = {0};
EWRAM_OVERLAY(banim) u16 gTmA_Banim[0xB58 / sizeof(u16)] = {0};
EWRAM_OVERLAY(banim) u16 gTmB_Banim[0x2520 / sizeof(u16)] = {0};
EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufA[0x30] = {0};
EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufB[0x30] = {0};
EWRAM_OVERLAY(banim) s16 gEfxSplitedColorBufC[0x30 / 2] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_0201F9D8[0x30] = {0};
EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufD[0x30] = {0};
EWRAM_OVERLAY(banim) u8 gEfxSplitedColorBufE[0x30] = {0};
EWRAM_OVERLAY(banim) s16 gEfxSplitedColorBufF[0x30 / 2] = {0};
EWRAM_OVERLAY(banim) u8 gUnk_Banim_0201FA98[0x30] = {0};
EWRAM_OVERLAY(banim) int gUnknown_0201FAC8 = 0;

/* ekrmain */
EWRAM_OVERLAY(banim) int gEkrWindowAppearExist = false;
EWRAM_OVERLAY(banim) int gEkrNamewinAppearExist = false;
EWRAM_OVERLAY(banim) int gProcEkrBaseAppearExist = false;
EWRAM_OVERLAY(banim) u32 gUnknown_0201FAD8 = 0;
EWRAM_OVERLAY(banim) struct BanimUnkStructComm gUnknown_0201FADC = {0};
EWRAM_OVERLAY(banim) u32 gBanimDoneFlag[2] = {0};
EWRAM_OVERLAY(banim) u32 gEkrBgPosition = 0;
EWRAM_OVERLAY(banim) u32 gUnk_Banim_0201FB10[2] = {0};
EWRAM_OVERLAY(banim) ProcPtr gpProcEfxAnimeDrv = NULL;
EWRAM_OVERLAY(banim) const void * gpImgSheet[2] = {0};
EWRAM_OVERLAY(banim) struct ProcEfxBGCOL * gpProcEkrTogiColor = NULL;
EWRAM_OVERLAY(banim) int gUnk_Banim_0201FB28 = 0;

/* EWRAM data */
EWRAM_DATA int gBanimLinkArenaFlag = 0;
EWRAM_DATA int gBattleDeamonActive = 0;
EWRAM_DATA struct ProcEkrBattleDeamon * gpProcEkrBattleDeamon = NULL;

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
    gCtrlC01Blocking = 0;

    if (0 == gEkrDebugModeMaybe)
        EkrPlayMainBGM();
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

    gBmSt.sync_hardware = true;
    gBmSt.prevVCount = REG_VCOUNT;
    VBlankIntrWait();
}

void MainUpdateEkrBattle(void)
{
    ClearSprites();
    UnregisterEfxSoundSeExist();

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

    if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) != 2)
        gEkrDebugTimer++;

    PushSpriteLayerObjects(0xD);
}

void nullsub_36(void)
{
    return;
}

void ekrBattle_Init(struct ProcEkrBattle *proc)
{
    gEkrBgPosition = 0;
    if (gEkrInitPosReal == 0) {
        if (gEkrDistanceType == EKR_DISTANCE_FAR)
            gEkrBgPosition = -0x20;
        else
            gEkrBgPosition = -0xF0;
    }

    InitMainAnims();
    RegisterEkrDragonStatusType();
    InitEkrDragonStatus();

    gCtrlC01Blocking = 1;

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
    if (CheckEkrWindowAppearUnexist() != true)
        return;

    EnableEkrGauge();
    AsyncEkrDispUP();
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
    DisableEkrGauge();
    UnAsyncEkrDispUP();
    EkrGauge_Clr4C50();
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050134;
}

void ekrBattle_8050134(struct ProcEkrBattle *proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
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
    if (gEkrInitialHitSide != gEkrInitPosReal) {
        NewEfxFarAttackWithDistance(gAnims[gEkrInitPosReal * 2], -1);
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
    NewEfxWeaponIcon(gBanimEffectiveness[0], gBanimEffectiveness[1]);

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
        DisableEfxStatusUnits(gAnims[0]);

    NewEfxHpBarColorChange(gAnims[0]);
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

    if (gBanimValid[0] == true) {
        anim = gAnims[0];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;

        anim = gAnims[1];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;
    }

    if (gBanimValid[1] == true) {
        anim = gAnims[2];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;

        anim = gAnims[3];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;
    }

    gBanimDoneFlag[0] = false;
    gBanimDoneFlag[1] = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80503EC;
}

void ekrBattle_80503EC(struct ProcEkrBattle *proc)
{
    gCtrlC01Blocking = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_StartPromotion;
}

void ekrBattle_StartPromotion(struct ProcEkrBattle *proc)
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
        gBanimExpGain[0] = 1;
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
        if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) == 2) {
            if (GetBattleAnimArenaFlag() == 0)
                ret = 1;
            else {
                gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain;
                gBanimExpGain[1] = gpEkrBattleUnitRight->expGain;

                if (gEkrGaugeHp[0] == 0) {
                    ArenaSetResult(1);
                    ret = 1;
                } else if (gEkrGaugeHp[1] == 0) {
                    ArenaSetResult(2);
                    gBanimExpGain[1] = 0;
                    ret = 1;
                } else if (proc->speedup == true) {
                    sub_805B094();
                    ArenaSetResult(4);
                    gBanimExpGain[1] = 0;
                    ret = 1;
                } else {
                    u8 val = 0;
                    struct Anim *anim1 = gAnims[0];
                    struct Anim *anim2 = gAnims[2];

                    switch (anim1->currentRoundType) {
                    case BANIM_MODE_CLOSE_DODGE:
                    case BANIM_MODE_RANGED_DODGE:
                    case BANIM_MODE_STANDING:
                        val = 1;
                        break;

                    default:
                        break;
                    } /* switch */

                    switch (anim2->currentRoundType) {
                    case BANIM_MODE_CLOSE_DODGE:
                    case BANIM_MODE_RANGED_DODGE:
                    case BANIM_MODE_STANDING:
                        val++;
                        break;

                    default:
                        break;
                    } /* switch */

                    if (val == 2) {
                        /**
                         * After both side of banim is done, exec new frame.
                         * Both of actor and target use C0D to update Anim::currentRoundType
                         *
                         * However, in the most cases, this part will not be exec.
                         * Becase the actor anim will use C06 to trigger another side battle anim's state:
                         *
                         * Anim::state3::ANIM_BIT3_NEXT_ROUND_START,
                         *
                         * which may cause target anim automatically
                         * update its anim in BattleAIS_ExecCommands()
                         *
                         * As a result, this part of code is only used if:
                         * 1. the developer failed to insert C06 for attack anim in mistake
                         * 2. arena
                         */
                        if (GetUnitEfxDebuff(anim1) & 0xC)
                            SetUnitEfxDebuff(anim1, UNIT_STATUS_NONE);

                        if (GetUnitEfxDebuff(anim2) & 0xC)
                            SetUnitEfxDebuff(anim2, UNIT_STATUS_NONE);

                        if (anim1->xPosition == 0x44)
                            NewEfxFarAttackWithDistance(anim1, -1);

                        ArenaContinueBattle();
                        ParseBattleHitToBanimCmd();
                        AnimClearAll();
                        UpdateBanimFrame();
                        InitMainAnims();

                        proc->timer = 0;
                        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
                    } /* if */
                }
            } /* if */
        } /* switch */
        break;

    case EKR_DISTANCE_MONOCOMBAT:
        if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) == 1)
            ret = 1;
        break;

    case EKR_DISTANCE_PROMOTION:
        ret = 1;
        break;
    }

    if (ret == 1)
        proc->proc_idleCb = (ProcFunc)ekrBattleOnBattleEnd;
}

void ekrBattleOnBattleEnd(struct ProcEkrBattle *proc)
{
    proc->speedup = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050600;
}

void ekrBattle_8050600(struct ProcEkrBattle *proc)
{
    int pos, ret;

    if (gEkrHpBarCount != 0)
        return;

    if (gEkrDeadEventExist != 0)
        return;

    ret = CheckEkrNamewinAppearUnexist();
    if (ret != true)
        return;

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPostBattleAct;

    if (CheckEkrDragonDead(gAnims[0]) != false)
        return;

    if (gBanimExpGain[EKR_POS_L] != 0)
        pos = EKR_POS_L;
    else
        pos = EKR_POS_R;

    if (pos != gEkrInitPosReal)
        proc->speedup = ret;

    if (proc->speedup == true)
        NewEfxFarAttackWithDistance(gAnims[gEkrInitPosReal * 2], -1);
}

/**
 * Battle anim has done and prepare to draw up exp bar
 */
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc)
{
    if (++proc->timer < 0x1E)
        return;

    if (GetBanimLinkArenaFlag() != 1 && gBanimExpGain[EKR_POS_L] != -gBanimExpGain[EKR_POS_R])
        proc->proc_idleCb = (ProcFunc)ekrBattleExecExpGain;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattleExecExpGain(struct ProcEkrBattle * proc)
{
    int i;
    u32 ret, val0, val1, val2, val3;

    u16 * buf = gEkrBarfxBuf;
    u16 * buf0 = gEkrBarfxBuf + 0x80;

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0x94, 0xF0, 0x94);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    RegisterDataMove(Img_EkrExpBar, (void *)0x6002000, 0x300);
    EfxTmCpyBG(Tsa_EkrExpBar, TILEMAP_LOCATED(gBG1TilemapBuffer, 6, 17), 18, 3, 1, 0x100);
    CpuFastCopy(Pal_ExpBar, PAL_BG(1), 0x20);
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

    if (gBanimExpGain[EKR_POS_L] != 0)
        val0 = gBanimExpPrevious[EKR_POS_L];
    else
        val0 = gBanimExpPrevious[EKR_POS_R];

    val1 = DivRem(val0, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    EkrModifyBarfx(gEkrBarfxBuf, val1);

    for (i = 0; i < 13; i++)
    {
        CpuFastCopy(&Img_EkrExpBarChange[buf[i] * 0x10], &buf0[0x10 * i], 0x20);
    }

    CpuFastCopy(&Img_BarNumfx[val2 * 0x10], &buf0[0xD0], 0x20);
    CpuFastCopy(&Img_BarNumfx[val3 * 0x10], &buf0[0xE0], 0x20);
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
        if (gBanimExpGain[0] != 0) {
            proc->timer = gBanimExpPrevious[0];
            proc->end = gBanimExpPrevious[0] + gBanimExpGain[0];
        } else if (gBanimExpGain[1] != 0) {
            proc->timer = gBanimExpPrevious[1];
            proc->end = gBanimExpPrevious[1] + gBanimExpGain[1];
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
    buf = gEkrBarfxBuf;
    buf0 = gEkrBarfxBuf + 0x80;

    val1 = DivRem(proc->timer, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    EkrModifyBarfx(buf, val1);

    for (i = 0; i < 13; i++)
    {
        CpuFastSet(&Img_EkrExpBarChange[buf[i] * 0x10], &buf0[0x10 * i], 8);
    }

    CpuFastSet(&Img_BarNumfx[val2 * 0x10], &buf0[0xD0], 8);
    CpuFastSet(&Img_BarNumfx[val3 * 0x10], &buf0[0xE0], 8);
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
    int c;

    if (++proc->timer == 0x18) {
        if (gBanimExpGain[EKR_POS_L] != 0)
            c = gBanimExpPrevious[EKR_POS_L] + gBanimExpGain[EKR_POS_L];
        else
            c = gBanimExpPrevious[EKR_POS_R] + gBanimExpGain[EKR_POS_R];
        if (c >= 100)
            NewEkrLvlupFan();
    }

    if (proc->timer <= 0x28)
        return;

    SpellFx_ClearBG1();
    EkrGauge_Setup44(0);

    switch (GetBanimDragonStatusType()) {
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

    if (gBanimExpGain[EKR_POS_L] != 0)
        c = gBanimExpPrevious[EKR_POS_L] + gBanimExpGain[EKR_POS_L];
    else
        c = gBanimExpPrevious[EKR_POS_R] + gBanimExpGain[EKR_POS_R];
    if (c >= 100)
        proc->proc_idleCb = (ProcFunc)ekrBattle_ExecEkrLvup;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattle_ExecEkrLvup(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (gBanimExpGain[EKR_POS_L] != 0)
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
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            SetEkrDragonExit(proc->anim);
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
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_WaitEkrDragonEndIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            SetEkrDragonExit(proc->anim);
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
        EkrRestoreBGM();
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
