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

    if (true == GetBattleAnimArenaFlag())
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
    BG_SetPosition(BG_0, gUnknown_02000038.x, gUnknown_02000038.y);
    BG_SetPosition(BG_1, 0, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    EkrGauge_Set4C50();

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
        switch (sub_806FA6C(proc->anim)) {
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
        switch (sub_806FA6C(proc->anim)) {
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

    if (GetEkrEventFlagMaybe() != 1 && gUnknown_0203E1C8[0] != -gUnknown_0203E1C8[1])
        proc->proc_idleCb = (ProcFunc)ekrBattle_80506C8;
    else
        proc->proc_idleCb = (ProcFunc)ekrNewEkrPopup;
}

/* https://decomp.me/scratch/EFIZ1 */
#if NONMATCHING

void ekrBattle_80506C8(struct ProcEkrBattle *proc)
{
    int i;
    u32 ret, val0, val1, val2, val3;

    u16 *buf0, *buf = gUnknown_02019490;
    buf += 0x80;

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0x94, 0xF0, 0x94);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 0);
    RegisterTileGraphics(gUnknown_08802D44, (void *)0x6002000, 0x300);
    sub_8070E94(gUnknown_08803524, gUnknown_020238F4, 18, 3, 1, 0x100);
    CpuFastSet(gUnknown_08803590, pPalette1Buffer, 8);
    BG_EnableSyncByMask(2);
    EnablePaletteSync();
    ret = sub_806FAB0();

    switch (ret) {
    case 1:
    case 2:
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

    buf0 = gUnknown_02019490;
    for (i = 0; i < 13; i++) {
        CpuFastSet(&gUnknown_088030C4[buf0[i] * 0x10], &buf[0x10 * i], 8);
    }

    CpuFastSet(&gUnknown_088033C4[val2 * 0x10], &buf[0xD0], 8);
    CpuFastSet(&gUnknown_088033C4[val3 * 0x10], &buf[0xE0], 8);
    RegisterTileGraphics(buf, (void *)0x60021A0, 0x1E0);

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80508F0;
}

#else

__attribute__((naked))
void ekrBattle_80506C8(struct ProcEkrBattle *proc)
{
    asm("\n\
    .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0xc\n\
        str r0, [sp, #8]\n\
        ldr r0, _080507CC  @ gUnknown_02019490\n\
        movs r1, #0x80\n\
        lsls r1, r1, #1\n\
        adds r0, r0, r1\n\
        mov sl, r0\n\
        movs r0, #1\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        ldr r7, _080507D0  @ gLCDControlBuffer\n\
        ldrb r0, [r7, #1]\n\
        movs r1, #0x20\n\
        orrs r0, r1\n\
        movs r1, #0x41\n\
        negs r1, r1\n\
        ands r0, r1\n\
        movs r1, #0x7f\n\
        ands r0, r1\n\
        strb r0, [r7, #1]\n\
        adds r1, r7, #0\n\
        adds r1, #0x2d\n\
        movs r0, #0\n\
        strb r0, [r1]\n\
        adds r0, r7, #0\n\
        adds r0, #0x31\n\
        movs r2, #0x94\n\
        strb r2, [r0]\n\
        subs r1, #1\n\
        movs r0, #0xf0\n\
        strb r0, [r1]\n\
        adds r0, r7, #0\n\
        adds r0, #0x30\n\
        strb r2, [r0]\n\
        adds r6, r7, #0\n\
        adds r6, #0x34\n\
        ldrb r1, [r6]\n\
        movs r2, #1\n\
        mov r8, r2\n\
        mov r0, r8\n\
        orrs r1, r0\n\
        movs r2, #2\n\
        mov r9, r2\n\
        mov r0, r9\n\
        orrs r1, r0\n\
        movs r5, #4\n\
        orrs r1, r5\n\
        movs r4, #8\n\
        orrs r1, r4\n\
        movs r3, #0x10\n\
        orrs r1, r3\n\
        movs r2, #0x36\n\
        adds r2, r2, r7\n\
        mov ip, r2\n\
        ldrb r0, [r2]\n\
        mov r2, r8\n\
        orrs r0, r2\n\
        movs r2, #3\n\
        negs r2, r2\n\
        ands r0, r2\n\
        orrs r0, r5\n\
        orrs r0, r4\n\
        orrs r0, r3\n\
        subs r2, #0x1e\n\
        ands r1, r2\n\
        strb r1, [r6]\n\
        ands r0, r2\n\
        mov r1, ip\n\
        strb r0, [r1]\n\
        ldr r0, _080507D4  @ gUnknown_08802D44\n\
        ldr r1, _080507D8  @ 0x06002000\n\
        movs r2, #0xc0\n\
        lsls r2, r2, #2\n\
        bl RegisterTileGraphics\n\
        ldr r0, _080507DC  @ gUnknown_08803524\n\
        ldr r1, _080507E0  @ gUnknown_020238F4\n\
        movs r2, #1\n\
        str r2, [sp]\n\
        adds r2, #0xff\n\
        str r2, [sp, #4]\n\
        movs r2, #0x12\n\
        movs r3, #3\n\
        bl sub_8070E94\n\
        ldr r0, _080507E4  @ gUnknown_08803590\n\
        ldr r1, _080507E8  @ pPalette1Buffer\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        movs r0, #2\n\
        bl BG_EnableSyncByMask\n\
        bl EnablePaletteSync\n\
        bl sub_806FAB0\n\
        cmp r0, #2\n\
        bhi _080507EC\n\
        cmp r0, #1\n\
        bcc _080507EC\n\
        ldrb r2, [r7, #0x10]\n\
        movs r1, #4\n\
        negs r1, r1\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        strb r0, [r7, #0x10]\n\
        ldrb r2, [r7, #0xc]\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        mov r2, r8\n\
        orrs r0, r2\n\
        strb r0, [r7, #0xc]\n\
        ldrb r0, [r7, #0x18]\n\
        ands r1, r0\n\
        mov r0, r9\n\
        orrs r1, r0\n\
        strb r1, [r7, #0x18]\n\
        ldrb r0, [r7, #0x14]\n\
        movs r1, #3\n\
        orrs r0, r1\n\
        strb r0, [r7, #0x14]\n\
        b _08050818\n\
        .align 2, 0\n\
    _080507CC: .4byte gUnknown_02019490\n\
    _080507D0: .4byte gLCDControlBuffer\n\
    _080507D4: .4byte gUnknown_08802D44\n\
    _080507D8: .4byte 0x06002000\n\
    _080507DC: .4byte gUnknown_08803524\n\
    _080507E0: .4byte gUnknown_020238F4\n\
    _080507E4: .4byte gUnknown_08803590\n\
    _080507E8: .4byte pPalette1Buffer\n\
    _080507EC:\n\
        ldr r3, _08050830  @ gLCDControlBuffer\n\
        ldrb r2, [r3, #0x10]\n\
        movs r1, #4\n\
        negs r1, r1\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        strb r0, [r3, #0x10]\n\
        ldrb r2, [r3, #0xc]\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        movs r2, #1\n\
        orrs r0, r2\n\
        strb r0, [r3, #0xc]\n\
        ldrb r0, [r3, #0x14]\n\
        ands r1, r0\n\
        movs r0, #2\n\
        orrs r1, r0\n\
        strb r1, [r3, #0x14]\n\
        ldrb r0, [r3, #0x18]\n\
        movs r1, #3\n\
        orrs r0, r1\n\
        strb r0, [r3, #0x18]\n\
    _08050818:\n\
        movs r0, #1\n\
        bl EkrGauge_Setup44\n\
        ldr r0, _08050834  @ gUnknown_0203E1C8\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        cmp r0, #0\n\
        beq _0805083C\n\
        ldr r0, _08050838  @ gUnknown_0203E1C4\n\
        movs r2, #0\n\
        ldrsh r0, [r0, r2]\n\
        b _08050842\n\
        .align 2, 0\n\
    _08050830: .4byte gLCDControlBuffer\n\
    _08050834: .4byte gUnknown_0203E1C8\n\
    _08050838: .4byte gUnknown_0203E1C4\n\
    _0805083C:\n\
        ldr r0, _080508D8  @ gUnknown_0203E1C4\n\
        movs r1, #2\n\
        ldrsh r0, [r0, r1]\n\
    _08050842:\n\
        movs r1, #0x64\n\
        bl DivRem\n\
        adds r6, r0, #0\n\
        movs r1, #0xa\n\
        bl Div\n\
        adds r5, r0, #0\n\
        lsls r0, r5, #2\n\
        adds r0, r0, r5\n\
        lsls r0, r0, #1\n\
        subs r4, r6, r0\n\
        cmp r5, #0\n\
        bne _08050860\n\
        movs r5, #0xa\n\
    _08050860:\n\
        ldr r0, _080508DC  @ gUnknown_02019490\n\
        adds r1, r6, #0\n\
        bl sub_8071140\n\
        lsls r5, r5, #5\n\
        mov r8, r5\n\
        lsls r4, r4, #5\n\
        mov r9, r4\n\
        mov r5, sl\n\
        ldr r4, _080508DC  @ gUnknown_02019490\n\
        ldr r7, _080508E0  @ gUnknown_088030C4\n\
        movs r6, #0xc\n\
    _08050878:\n\
        ldrh r0, [r4]\n\
        lsls r0, r0, #5\n\
        adds r0, r0, r7\n\
        adds r1, r5, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        adds r5, #0x20\n\
        adds r4, #2\n\
        subs r6, #1\n\
        cmp r6, #0\n\
        bge _08050878\n\
        ldr r4, _080508E4  @ gUnknown_088033C4\n\
        mov r2, r8\n\
        adds r0, r2, r4\n\
        movs r1, #0xd0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        add r4, r9\n\
        movs r1, #0xe0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        adds r0, r4, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        ldr r1, _080508E8  @ 0x060021A0\n\
        movs r2, #0xf0\n\
        lsls r2, r2, #1\n\
        mov r0, sl\n\
        bl RegisterTileGraphics\n\
        movs r0, #0\n\
        ldr r1, [sp, #8]\n\
        strh r0, [r1, #0x2c]\n\
        ldr r0, _080508EC  @ ekrBattle_80508F0\n\
        str r0, [r1, #0xc]\n\
        add sp, #0xc\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080508D8: .4byte gUnknown_0203E1C4\n\
    _080508DC: .4byte gUnknown_02019490\n\
    _080508E0: .4byte gUnknown_088030C4\n\
    _080508E4: .4byte gUnknown_088033C4\n\
    _080508E8: .4byte 0x060021A0\n\
    _080508EC: .4byte ekrBattle_80508F0\n\
    .syntax divided\n\
    ");
}

#endif

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

/* https://decomp.me/scratch/9JW0S */
#if NONMATCHING

void ekrBattle_80509A8(struct ProcEkrBattle *proc)
{
    int i, val1, val2, val3;

    u16 *buf0;
    u16 register *buf;
    buf = gUnknown_02019490;
    buf += 0x80;

    val1 = DivRem(proc->timer, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    sub_8071140(gUnknown_02019490, val1);

    for (i = 0; i < 13; i++) {
        CpuFastSet(&gUnknown_088030C4[gUnknown_02019490[i] * 0x10], &gUnknown_02019490[0x10 * i], 8);
    }

    CpuFastSet(&gUnknown_088033C4[val2 * 0x10], &buf[0xD0], 8);
    CpuFastSet(&gUnknown_088033C4[val3 * 0x10], &buf[0xE0], 8);
    RegisterTileGraphics(buf, (void *)0x60021A0, 0x1E0);

    if (++proc->timer > proc->unk2E) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050A84;
    }
}

#else

__attribute__((naked))
void ekrBattle_80509A8(struct ProcEkrBattle *proc)
{
    asm("\n\
    .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        adds r7, r0, #0\n\
        ldr r0, _08050A70  @ gUnknown_02019490\n\
        mov r8, r0\n\
        movs r1, #0x80\n\
        lsls r1, r1, #1\n\
        add r1, r8\n\
        mov sl, r1\n\
        movs r2, #0x2c\n\
        ldrsh r0, [r7, r2]\n\
        movs r1, #0x64\n\
        bl DivRem\n\
        adds r5, r0, #0\n\
        movs r1, #0xa\n\
        bl Div\n\
        adds r4, r0, #0\n\
        lsls r0, r4, #2\n\
        adds r0, r0, r4\n\
        lsls r0, r0, #1\n\
        subs r6, r5, r0\n\
        cmp r4, #0\n\
        bne _080509E4\n\
        movs r4, #0xa\n\
    _080509E4:\n\
        mov r0, r8\n\
        adds r1, r5, #0\n\
        bl sub_8071140\n\
        lsls r4, r4, #5\n\
        mov r9, r4\n\
        lsls r6, r6, #5\n\
        str r6, [sp]\n\
        mov r6, sl\n\
        mov r5, r8\n\
        ldr r0, _08050A74  @ gUnknown_088030C4\n\
        mov r8, r0\n\
        movs r4, #0xc\n\
    _080509FE:\n\
        ldrh r0, [r5]\n\
        lsls r0, r0, #5\n\
        add r0, r8\n\
        adds r1, r6, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        adds r6, #0x20\n\
        adds r5, #2\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bge _080509FE\n\
        ldr r4, _08050A78  @ gUnknown_088033C4\n\
        mov r1, r9\n\
        adds r0, r1, r4\n\
        movs r1, #0xd0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        ldr r2, [sp]\n\
        adds r4, r2, r4\n\
        movs r1, #0xe0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        adds r0, r4, #0\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        ldr r1, _08050A7C  @ 0x060021A0\n\
        movs r2, #0xf0\n\
        lsls r2, r2, #1\n\
        mov r0, sl\n\
        bl RegisterTileGraphics\n\
        ldrh r0, [r7, #0x2c]\n\
        adds r0, #1\n\
        strh r0, [r7, #0x2c]\n\
        lsls r0, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        movs r2, #0x2e\n\
        ldrsh r1, [r7, r2]\n\
        cmp r0, r1\n\
        ble _08050A60\n\
        movs r0, #0\n\
        strh r0, [r7, #0x2c]\n\
        ldr r0, _08050A80  @ ekrBattle_8050A84\n\
        str r0, [r7, #0xc]\n\
    _08050A60:\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08050A70: .4byte gUnknown_02019490\n\
    _08050A74: .4byte gUnknown_088030C4\n\
    _08050A78: .4byte gUnknown_088033C4\n\
    _08050A7C: .4byte 0x060021A0\n\
    _08050A80: .4byte ekrBattle_8050A84\n\
    .syntax divided\n\
    ");
}

#endif

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

    ret = sub_806FAB0();
    switch (ret) {
    case 1:
    case 2:
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
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050CCC;
    }
}

void ekrBattle_8050CCC(struct ProcEkrBattle *proc)
{
    sub_8054ED4();
    sub_80546B0();
    proc->unk44 = gUnknown_0203E100;
    proc->unk48 = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050CF8;
}

void ekrBattle_8050CF8(struct ProcEkrBattle *proc)
{
    int val;

    if (proc->unk48 == 2) {
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050DA8;
        return;
    }

    if (proc->unk44 == 0) {
        proc->anim = gUnknown_02000000[0];
        switch (sub_806FA6C(proc->anim)) {
        case 2:
            sub_80701E8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050D88;
            break;
        case 1:
            sub_80701E8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050D88;
            break;
        case 3:
            sub_80701E8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050D88;
            break;

        default:
            break;
        }

        proc->unk44 = 1;
        proc->unk48++;

    } else {
        proc->anim = gUnknown_02000000[2];
        switch (sub_806FA6C(proc->anim)) {
        case 2:
            sub_80701E8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050D88;
            break;
        case 1:
            sub_80701E8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050D88;
            break;
        case 3:
            sub_80701E8(proc->anim);
            proc->proc_idleCb = (ProcFunc)ekrBattle_8050D88;
            break;

        default:
            break;
        }

        proc->unk44 = 0;
        proc->unk48++;
    }
}

void ekrBattle_8050D88(struct ProcEkrBattle *proc)
{
    if (sub_806FC14(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050CF8;
}

void ekrBattle_8050DA8(struct ProcEkrBattle *proc)
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
