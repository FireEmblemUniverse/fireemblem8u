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
#include "ekrdragon.h"

extern struct Anim *gUnknown_02000000[4];

void SetEkrEventFlagMaybe(int flag)
{
    gEkrEventFlagMaybe = flag;
}

int GetEkrEventFlagMaybe(void)
{
    return gEkrEventFlagMaybe;
}

void NewEkrBattleDeamon(void)
{
    gpProcEkrBattleDeamon = Proc_Start(gProc_ekrBattleDeamon, PROC_TREE_3);
    gBattleDeamonActive = true;
    AddSkipThread2();
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
    SubSkipThread2();
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

    gUnknown_02017724 = 0;
    gUnknown_02000018 = 0;
    gUnknown_0200001C = 0;
    gUnknown_02000020 = 0;
    gUnknown_02000024 = 0;

    if (0 == gUnknown_0203E0FC)
        sub_80726AC();
}

void InBattleMainRoutine(void)
{
    UpdateKeyStatus(gKeyStatusPtr);
    
    if (gUnknown_0200001C == 0)
        MainUpdateEkrBattle();
    else if (gUnknown_02000020 == 1)
        MainUpdateEkrBattle();
    
    switch (gUnknown_02017724) {
    case 0:
        break;

    case 1:
        if (0 == gUnknown_0203E0FC) {
            Proc_End(gpProcEkrBattle);
            sub_8055C38();
        }
        break;

    case 2:
        if (0 == gUnknown_0203E0FC) {
            Proc_End(gpProcEkrBattle);
            sub_8055C38();
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

    if (GetThread2SkipStack() == 0)
        Proc_Run(gProcTreeRootArray[2]);
    
    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PushSpriteLayerObjects(0);

    Proc_Run(gProcTreeRootArray[1]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    Proc_Run(gProcTreeRootArray[4]);

    gUnknown_02000020 = 0;

    if ((gUnknown_0201FB04[0] + gUnknown_0201FB04[1]) != 2)
        gUnknown_02000018++;
    
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
        if (gEkrSomeType == 1)
            gEkrBgXOffset = -0x20;
        else
            gEkrBgXOffset = -0xF0;
    }

    sub_8059D28();
    sub_8070B3C();
    SetAnimStateHiddenForDragon();

    gUnknown_02000024 = 1;

    if (true == GetBattleAnimArenaFlag())
        proc->timer = 0;
    else
        proc->timer = 0x1E;

    if (EKR_BATTLE_LEFT == gEkrInitialHitSide)
        proc->is_quote = ShouldCallBattleQuote(gEkrPids[EKR_BATTLE_LEFT], gEkrPids[EKR_BATTLE_RIGHT]);
    else
        proc->is_quote = ShouldCallBattleQuote(gEkrPids[EKR_BATTLE_RIGHT], gEkrPids[EKR_BATTLE_LEFT]);

    proc->unk58 = 0;
    Proc_Break(proc);
}

void ekrBattleMain(struct ProcEkrBattle *proc)
{
    if (++proc->timer == 0x1F) {
        if (GetEkrEventFlagMaybe() != 1 && (proc->is_quote == true || proc->unk58 == true)) {
            NewEkrWindowAppear(1, 7);
            NewEkrNamewinAppear(1, 7, 0);
            proc->proc_idleCb = (ProcFunc)ekrBattle_HandlePreEventMaybe;
            proc->timer = 0;
        } else {
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050158;
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
        if (gEkrInitialHitSide == EKR_BATTLE_LEFT)
            CallBattleQuoteEventsIfAny(gEkrPids[EKR_BATTLE_LEFT], gEkrPids[EKR_BATTLE_RIGHT]);
        else
            CallBattleQuoteEventsIfAny(gEkrPids[EKR_BATTLE_RIGHT], gEkrPids[EKR_BATTLE_LEFT]);

        proc->is_quote = false;
    }

    proc->proc_idleCb = (ProcFunc)ekrBattle_80500F0;
}

void ekrBattle_80500F0(struct ProcEkrBattle *proc)
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
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050158;
        proc->timer = 0;
    }
}

void ekrBattle_8050158(struct ProcEkrBattle *proc)
{
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattleDoSpeialClassIntro;
}

void ekrBattleDoSpeialClassIntro(struct ProcEkrBattle *proc)
{
    if (proc->counter == 2) {
        proc->proc_idleCb = (ProcFunc)ekrBattlePostEkrDragonIntro;
        return;
    }

    if (proc->side == EKR_BATTLE_LEFT) {
        proc->anim = gUnknown_02000000[EKR_BATTLE_LEFT * 2];
        switch (GetEkrDragonStatusType(proc->anim)) {
        /* Draco Zombie */
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            EfxDoDracoZombieIntroAnim(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitSpeialClassIntroAnimIdle;
            break;

        /* DemonKing */
        case EKRDRGON_TYPE_DEMON_KING:
            EfxDoDemonKingIntroAnim(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitSpeialClassIntroAnimIdle;
            break;

        /* Myrrh */
        case EKRDRGON_TYPE_MYRRH:
            EfxDoMyrrhIntroAnim(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitSpeialClassIntroAnimIdle;
            break;
        }

        proc->side = EKR_BATTLE_RIGHT;

    } else {
        proc->anim = gUnknown_02000000[EKR_BATTLE_RIGHT * 2];
        switch (GetEkrDragonStatusType(proc->anim)) {
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            EfxDoDracoZombieIntroAnim(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitSpeialClassIntroAnimIdle;
            break;

        case EKRDRGON_TYPE_DEMON_KING:
            EfxDoDemonKingIntroAnim(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitSpeialClassIntroAnimIdle;
            break;

        case EKRDRGON_TYPE_MYRRH:
            EfxDoMyrrhIntroAnim(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattleWaitSpeialClassIntroAnimIdle;
            break;
        }

        proc->side = EKR_BATTLE_LEFT;
    }

    proc->counter++;
}

void ekrBattleWaitSpeialClassIntroAnimIdle(struct ProcEkrBattle *proc)
{
    if (CheckEfrDragonStatusAttrPrepared(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)ekrBattleDoSpeialClassIntro;
}

void ekrBattlePostEkrDragonIntro(struct ProcEkrBattle *proc)
{
    if (gEkrInitialHitSide != gEkrPos2Maybe) {
        sub_80533D0(gUnknown_02000000[gEkrPos2Maybe * 2], -1);
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050290;
    } else
        proc->proc_idleCb = (ProcFunc)ekrBattle_80502B0;
}

void ekrBattle_8050290(struct ProcEkrBattle *proc)
{
    if (++proc->timer == 8)
        proc->proc_idleCb = (ProcFunc)ekrBattle_80502B0;
}

void ekrBattle_80502B0(struct ProcEkrBattle *proc)
{
    NewEfxStatusUnit(gUnknown_02000000[0]);
    NewEfxStatusUnit(gUnknown_02000000[2]);
    NewEfxWeaponIcon(gUnknown_0203E1D8.x, gUnknown_0203E1D8.y);

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
        sub_8054B64(gUnknown_02000000[0]);

    NewEfxHPBarColorChange(gUnknown_02000000[0]);
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050304;
}

void ekrBattle_8050304(struct ProcEkrBattle *proc)
{
    if (gUnknown_0203E194 != false) {
        NewEkrTriangle(gUnknown_02000000[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050338;
    } else
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050360;
}

void ekrBattle_8050338(struct ProcEkrBattle *proc)
{
    if (sub_8074F3C() == true) {
        nullsub_18();
        proc->timer = 0x1E;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050360;
    }
}

void ekrBattle_8050360(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (++proc->timer <= 0x1E)
        return;

    if (gBanimSideVaildFlagMaybe[0] == true) {
        anim = gUnknown_02000000[0];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;

        anim = gUnknown_02000000[1];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;
    }

    if (gBanimSideVaildFlagMaybe[1] == true) {
        anim = gUnknown_02000000[2];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;

        anim = gUnknown_02000000[3];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;
    }

    gUnknown_0201FB04[0] = 0;
    gUnknown_0201FB04[1] = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80503EC;
}

void ekrBattle_80503EC(struct ProcEkrBattle *proc)
{
    gUnknown_02000024 = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050400;
}

void ekrBattle_8050400(struct ProcEkrBattle *proc)
{
    if (gEkrSomeType == 4) {
        NewEkrClassChg(gUnknown_02000000[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050440;
    } else {
        proc->unk29 = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_805046C;
    }
}

void ekrBattle_8050440(struct ProcEkrBattle *proc)
{
    if (EkrClasschgFinished() == true) {
        EndEkrClasschg();
        gUnknown_0203E1C8[0] = 1;
        proc->proc_idleCb = (ProcFunc)ekrBattle_CheckForLevelup_8050C34;
    }
}

void ekrBattle_805046C(struct ProcEkrBattle *proc)
{
    int ret = 0;
    if (gKeyStatusPtr->heldKeys & 2)
        proc->unk29 = 1;

    switch (gEkrSomeType) {
    case 0:
    case 1:
    case 2:
        if ((gUnknown_0201FB04[0] + gUnknown_0201FB04[1]) == 2) {
            if (GetBattleAnimArenaFlag() == 0)
                ret = 1;
            else {
                gUnknown_0203E1C8[0] = gpEkrBattleUnitLeft->expGain;
                gUnknown_0203E1C8[1] = gpEkrBattleUnitRight->expGain;
    
                if (gUnknown_0203E1AC[0] == 0) {
                    ArenaSetResult(1);
                    ret = 1;
                } else if (gUnknown_0203E1AC[1] == 0) {
                    ArenaSetResult(2);
                    gUnknown_0203E1C8[1] = 0;
                    ret = 1;
                } else if (proc->unk29 == 1) {
                    sub_805B094();
                    ArenaSetResult(4);
                    gUnknown_0203E1C8[1] = 0;
                    ret = 1;
                } else {
                    u8 val = 0;
                    struct Anim *anim1 = gUnknown_02000000[0];
                    struct Anim *anim2 = gUnknown_02000000[2];
    
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
                        if (sub_8054BD4(anim1) & 0xC)
                            sub_8054BA4(anim1, NULL);
    
                        if (sub_8054BD4(anim2) & 0xC)
                            sub_8054BA4(anim2, NULL);
    
                        if (anim1->xPosition == 0x44)
                            sub_80533D0(anim1, -1);
    
                        ArenaContinueBattle();
                        sub_80581EC();
                        AnimClearAll();
                        sub_80599E8();
                        sub_8059D28();
    
                        proc->timer = 0;
                        proc->proc_idleCb = (ProcFunc)ekrBattle_8050360;
                    } /* if */
                }
            } /* if */
        } /* switch */
        break;

    case 3:
        if ((gUnknown_0201FB04[0] + gUnknown_0201FB04[1]) == 1)
            ret = 1;
        break;

    case 4:
        ret = 1;
        break;
    }

    if (ret == 1)
        proc->proc_idleCb = (ProcFunc)ekrBattle_80505EC;
}

void ekrBattle_80505EC(struct ProcEkrBattle *proc)
{
    proc->unk29 = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050600;
}

void ekrBattle_8050600(struct ProcEkrBattle *proc)
{
    int val, ret;

    if (gEkrHPBarCount != 0)
        return;

    if (gUnknown_02017738 != 0)
        return;

    ret = sub_8056E60();
    if (ret != true)
        return;

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPostBattleAct;

    if (CheckEkrDragonDeadEffectMaybe(gUnknown_02000000[0]) != false)
        return;

    if (gUnknown_0203E1C8[0] != 0)
        val = 0;
    else
        val = 1;

    if (val != gEkrPos2Maybe)
        proc->unk29 = ret;

    if (proc->unk29 == 1)
        sub_80533D0(gUnknown_02000000[gEkrPos2Maybe * 2], -1);
}

/**
 * Battle anim has done and prepare to draw up exp bar
 */
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc)
{
    if (++proc->timer < 0x1E)
        return;

    if (GetEkrEventFlagMaybe() != 1 && gUnknown_0203E1C8[0] != -gUnknown_0203E1C8[1])
        proc->proc_idleCb = (ProcFunc)ekrBattle_80506C8;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattle_80506C8(struct ProcEkrBattle *proc)
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

    RegisterTileGraphics(gUnknown_08802D44, (void *)0x6002000, 0x300);
    sub_8070E94(gUnknown_08803524, gUnknown_020238F4, 18, 3, 1, 0x100);
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

    if (gUnknown_0203E1C8[0] != 0)
        val0 = gUnknown_0203E1C4[0];
    else
        val0 = gUnknown_0203E1C4[1];

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
    RegisterTileGraphics(buf0, (void *)0x60021A0, 0x1E0);

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
        if (gUnknown_0203E1C8[0] != 0) {
            proc->timer = gUnknown_0203E1C4[0];
            proc->unk2E = gUnknown_0203E1C4[0] + gUnknown_0203E1C8[0];
        } else if (gUnknown_0203E1C8[1] != 0) {
            proc->timer = gUnknown_0203E1C4[1];
            proc->unk2E = gUnknown_0203E1C4[1] + gUnknown_0203E1C8[1];
        }

        proc->proc_idleCb = (ProcFunc)ekrBattle_80509A8;
        SomePlaySound_8071990(0x74, 0x100);
        sub_8071AB0(0x74, 0x78, 0);
    }
}

void ekrBattle_80509A8(struct ProcEkrBattle *proc)
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
    RegisterTileGraphics(buf0, (void *)0x60021A0, 0x1E0);

    if (++proc->timer > proc->unk2E) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050A84;
    }
}

void ekrBattle_8050A84(struct ProcEkrBattle *proc)
{
    if (proc->timer == 0)
        sub_8071A44(0x74);

    if (++proc->timer > 30) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050AB8;
    }
}

void ekrBattle_8050AB8(struct ProcEkrBattle *proc)
{
    if (++proc->timer > 12) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050B08;
    } else {
        SetWin0Box(0, proc->timer - 120, 240, -96 - proc->timer);
    }
}

void ekrBattle_8050B08(struct ProcEkrBattle *proc)
{
    u32 ret;
    int a, b;
    register int c asm("r1");

    if (++proc->timer == 0x18) {
        if (gUnknown_0203E1C8[0] != 0) {
            a = gUnknown_0203E1C4[0];
            b = gUnknown_0203E1C8[0];
        } else {
            a = gUnknown_0203E1C4[1];
            b = gUnknown_0203E1C8[1];
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

    if (gUnknown_0203E1C8[0] != 0) {
        a = gUnknown_0203E1C4[0];
        b = gUnknown_0203E1C8[0];
    } else {
        a = gUnknown_0203E1C4[1];
        b = gUnknown_0203E1C8[1];
    }

    c = a + b;
    if (c >= 100)
        proc->proc_idleCb = (ProcFunc)ekrBattle_CheckForLevelup_8050C34;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

void ekrBattle_CheckForLevelup_8050C34(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (gUnknown_0203E1C8[0] != 0)
        anim = gUnknown_02000000[0];
    else
        anim = gUnknown_02000000[2];

    NewEkrLevelup(anim);
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForLevelup_8050C6C;
}

void ekrBattle_WaitForLevelup_8050C6C(struct ProcEkrBattle *proc)
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

    if (proc->side == EKR_BATTLE_LEFT) {
        proc->anim = gUnknown_02000000[0];
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

        proc->side = EKR_BATTLE_RIGHT;
        proc->counter++;

    } else {
        proc->anim = gUnknown_02000000[2];
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

        proc->side = EKR_BATTLE_LEFT;
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
    gUnknown_02017724 = 1;

    if (gUnknown_0203E0FC == 0) {
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
