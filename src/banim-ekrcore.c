#include "global.h"
#include "anime.h"
#include "bm.h"
#include "hardware.h"
#include "ctc.h"
#include "event.h"
#include "proc.h"
#include "bmbattle.h"
#include "bmarena.h"
#include "ekrbattle.h"

extern struct Anim *gUnknown_02000000[4];

void sub_804FD48(int unk)
{
    gUnknown_0203E0F0 = unk;
}

int sub_804FD54(void)
{
    return gUnknown_0203E0F0;
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
    sub_8052220();

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
        MainUpdate_804FEE4();
    else if (gUnknown_02000020 == 1)
        MainUpdate_804FEE4();
    
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

void MainUpdate_804FEE4(void)
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
    gUnknown_0201FB0C = 0;
    if (gUnknown_02017744 == 0) {
        if (gUnknown_0203E120 == 1)
            gUnknown_0201FB0C = -0x20;
        else
            gUnknown_0201FB0C = -0xF0;
    }

    sub_8059D28();
    sub_8070B3C();
    sub_8070254();

    gUnknown_02000024 = 1;

    if (true == sub_805B028())
        proc->timer = 0;
    else
        proc->timer = 0x1E;

    if (0 == gUnknown_0203E100)
        proc->is_quote = ShouldCallBattleQuote(gEkrBuIndexes[0], gEkrBuIndexes[1]);
    else
        proc->is_quote = ShouldCallBattleQuote(gEkrBuIndexes[1], gEkrBuIndexes[0]);

    proc->unk58 = 0;
    Proc_Break(proc);
}

void ekrBattle_8050000(struct ProcEkrBattle *proc)
{
    if (++proc->timer == 0x1F) {
        if (sub_804FD54() != 1 && (proc->is_quote == true || proc->unk58 == true)) {
            NewEkrWindowAppear(1, 7);
            NewEkrNamewinAppear(1, 7, 0);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050054;
            proc->timer = 0;
        } else {
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050158;
            proc->timer = 0;
        }
    }
}

void ekrBattle_8050054(struct ProcEkrBattle *proc)
{
    if (DoesEkrWindowAppearExist() != true)
        return;

    EkrGauge_8051218();
    sub_8051B90();
    CpuFastFill(0, gBG0TilemapBuffer, 0x800);
    BG_SetPosition(BG_0, gUnknown_02000038.x, gUnknown_02000038.y);
    BG_SetPosition(BG_1, 0, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    EkrGauge_8051190();

    if (proc->is_quote == true) {
        if (gUnknown_0203E100 == 0)
            CallBattleQuoteEventsIfAny(gEkrBuIndexes[0], gEkrBuIndexes[1]);
        else
            CallBattleQuoteEventsIfAny(gEkrBuIndexes[1], gEkrBuIndexes[0]);

        proc->is_quote = false;
    }

    proc->proc_idleCb = (ProcFunc)ekrBattle_80500F0;
}

void ekrBattle_80500F0(struct ProcEkrBattle *proc)
{
    if (BattleEventEngineExists() != false)
        return;

    sub_8051F1C();
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    NewEkrWindowAppear(0, 7);
    NewEkrNamewinAppear(0, 7, 0);
    EkrGauge_8051228();
    sub_8051BA0();
    EkrGauge_8051180();
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
    proc->unk44 = gUnknown_0203E100;
    proc->unk48 = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050174;
}

void ekrBattle_8050174(struct ProcEkrBattle *proc)
{
    if (proc->unk48 == 2) {
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050244;
        return;
    }

    if (proc->unk44 == 0) {
        proc->anim = gUnknown_02000000[0];

        switch (sub_806FA6C()) {
        case 1:
            sub_80701B8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050224;
            break;

        case 2:
            sub_8076540(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050224;
            break;

        case 3:
            sub_80708CC(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050224;
            break;
        }

        proc->unk44 = 1;

    } else {
        proc->anim = gUnknown_02000000[2];

        switch (sub_806FA6C()) {
        case 1:
            sub_80701B8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050224;
            break;

        case 2:
            sub_8076540(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050224;
            break;

        case 3:
            sub_80708CC(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050224;
            break;
        }

        proc->unk44 = 0;
    }

    proc->unk48++;
}

void ekrBattle_8050224(struct ProcEkrBattle *proc)
{
    if (sub_806FBF8(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050174;
}

void ekrBattle_8050244(struct ProcEkrBattle *proc)
{
    if (gUnknown_0203E100 != gUnknown_02017744) {
        sub_80533D0(gUnknown_02000000[gUnknown_02017744 * 2], -1);
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
    sub_8054E8C(gUnknown_0203E1D8.x, gUnknown_0203E1D8.y);

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
        sub_8054B64(gUnknown_02000000[0]);

    sub_80545C0(gUnknown_02000000[0]);
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

    if (gUnknown_0203E104[0] == true) {
        anim = gUnknown_02000000[0];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;

        anim = gUnknown_02000000[1];
        anim->state3 = 0x8000;
        anim->state2 |= 0x4000;
    }

    if (gUnknown_0203E104[1] == true) {
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
    if (gUnknown_0203E120 == 4) {
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

    switch (gUnknown_0203E120) {
    case 0:
    case 1:
    case 2:
        if ((gUnknown_0201FB04[0] + gUnknown_0201FB04[1]) == 2) {
            if (sub_805B028() == 0)
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

    if (gUnknown_02017728 != 0)
        return;

    if (gUnknown_02017738 != 0)
        return;

    ret = sub_8056E60();
    if (ret != true)
        return;

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPostBattleAct;

    if (sub_8070214(gUnknown_02000000[0]) != false)
        return;

    if (gUnknown_0203E1C8[0] != 0)
        val = 0;
    else
        val = 1;

    if (val != gUnknown_02017744)
        proc->unk29 = ret;

    if (proc->unk29 == 1)
        sub_80533D0(gUnknown_02000000[gUnknown_02017744 * 2], -1);
}

/**
 * Battle anim has done and prepare to draw up exp bar
 */
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc)
{
    if (++proc->timer < 0x1E)
        return;

    if (sub_804FD54() != 1 && gUnknown_0203E1C8[0] != -gUnknown_0203E1C8[1])
        proc->proc_idleCb = (ProcFunc)ekrBattle_80506C8;
    else
        proc->proc_idleCb = (ProcFunc)ekrBattle_MakePopups;
}
