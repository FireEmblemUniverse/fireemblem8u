#include "global.h"

#include "fontgrp.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmsave.h"
#include "scene.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "agb_sram.h"
#include "sram-layout.h"
#include "face.h"
#include "event.h"

#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

/**
 * Contains Link Arena functions that are called by events
 */

extern struct ProcCmd ProcScr_TacticianNameSelection[];

//! FE8U = 0x08048260
void sub_8048260(ProcPtr parent)
{
    struct ProcTactician * proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 7;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x08048280
void StartTacticianNameSelect(ProcPtr parent)
{
    struct ProcTactician * proc;

    LoadLegacyUiFrameGraphics();
    UnsetBmStLinkArenaFlag();

    InitTextFont(&Font_0203DB64, (void *)(0x06001800), 0xc0, 0);

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    gPlaySt.config.windowColor = 0;

    proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 5;
    proc->unk32 = 1;

    return;
}

extern struct SioMessage gUnknown_03004E80;

//! FE8U = 0x080482E0
bool sub_80482E0(ProcPtr proc)
{
    int i;
    u8 buf[4];

    int numTimeouts = 0;

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
        {
            nullsub_15(proc, 4);
            return false;
        }

        return true;
    }

    if ((gSioSt->selfId > 1) || (gSioSt->playerStatus[gSioSt->selfId] == 2))
    {
        nullsub_15(proc, 0);
        return false;
    }

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!sub_80421E4() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        nullsub_15(proc, 0);
        return false;
    }

    gUnknown_03004E80.kind = SIO_MSG_8C;
    gUnknown_03004E80.sender = gSioSt->selfId;
    gUnknown_03004E80.param = gSioSt->unk_000;
    SioSend(&gUnknown_03004E80, 10);

    if ((gSioSt->selfId == 0) && !IsExtraMapAvailable())
    {
        buf[0] = 1;
        SioEmitData(buf, sizeof(buf));
        nullsub_15(proc, 3);
        return false;
    }

    if ((gSioSt->unk_009 & 3) == 3)
    {
        gSioSt->unk_009 = 3;
        sub_8042AF4();

        gSioSt->unk_004 = 6;
        gSioSt->unk_01E = 0;

        if (gSioSt->selfId != 0)
        {
            nullsub_15(proc, 1);
        }

        return false;
    }

    return true;
}

//! FE8U = 0x080483F8
void sub_80483F8(ProcPtr proc)
{
    if (gSioSt->unk_009 > 3)
    {
        nullsub_15(proc, 0);
    }

    return;
}

//! FE8U = 0x08048418
void sub_8048418(ProcPtr proc)
{
    u8 buf[4];

    if (GetTalkChoiceResult() == 1)
    {
        gUnk_Sio_0203DD8C = 0;
    }
    else
    {
        gUnk_Sio_0203DD8C = 1;
    }

    buf[0] = gUnk_Sio_0203DD8C;

    SioEmitData(buf, sizeof(buf));

    if (gUnk_Sio_0203DD8C != 0)
    {
        nullsub_15(proc, 5);
    }

    return;
}

//! FE8U = 0x08048460
bool sub_8048460(ProcPtr proc)
{
    u16 got;
    int i;
    u8 buf[4];
    u8 bufSenderId[4];

    int numTimeouts = 0;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if ((!sub_80421E4()) || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        nullsub_15(proc, 0);
        return 0;
    }

    got = SioReceiveData(buf, bufSenderId, NULL);

    if (got != 0)
    {
        if (buf[0] != 0)
        {
            nullsub_15(proc, 5);
        }

        return false;
    }

    return true;
}

//! FE8U = 0x080484D8
void sub_80484D8(struct Text * th, const char * str, int number)
{
    ClearText(th);

    Text_InsertDrawString(th, 0, 0, str);
    SioDrawNumber(th, 54, 2, number);
    Text_InsertDrawString(th, 62, 0, GetStringFromIndex(0x5AE));

    PutText(th, TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12));

    return;
}

//! FE8U = 0x08048524
void sub_8048524(struct SioBigSendProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(0x7d);
        proc->unk_3C++;

        sub_80484D8(&gUnk_Sio_0203DA88[0], "送信中" /* "Sending" */, proc->unk_3C);
        DrawStatBarGfx(
            0x100, 0xe, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}

//! FE8U = 0x08048594
void sub_8048594(struct SioBigReceiveProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(0x7d);
        proc->unk_3C++;

        sub_80484D8(&gUnk_Sio_0203DA88[0], "受信中" /* "Receiving" */, proc->unk_3C);
        DrawStatBarGfx(
            0x100, 0xe, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}

extern u8 gUnk_Sio_02000000[];

//! FE8U = 0x08048604
void sub_8048604(struct SioBigSendProc * proc)
{
    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();

    if (gSioSt->selfId == 0)
    {
        ReadSramFast(CART_SRAM + SRAM_OFFSET_XMAP, gUnk_Sio_02000000, SRAM_SIZE_XMAP);
        StartSioBigSend(gUnk_Sio_02000000, SRAM_SIZE_XMAP, sub_8048524, 0, proc);
    }
    else
    {
        StartSioBigReceive(gUnk_Sio_02000000, sub_8048594, proc);
    }

    return;
}

//! FE8U = 0x0804867C
bool sub_804867C(void)
{
    if (IsSioBigTransferActive())
    {
        return true;
    }

    PlaySoundEffect(0x7e);

    InitTalkTextFont();

    if (gSioSt->selfId != 0)
    {
        WriteAndVerifySramFast(gUnk_Sio_02000000, CART_SRAM + SRAM_OFFSET_XMAP, SRAM_SIZE_XMAP);
    }

    return false;
}

//! FE8U = 0x080486D4
void sub_80486D4(void)
{
    gSioSt->unk_00A = 1 << gSioSt->selfId;
    return;
}

//! FE8U = 0x080486E8
bool sub_80486E8(void)
{
    gSioMsgBuf.kind = SIO_MSG_89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;

    SioSend(&gSioMsgBuf, 4);

    if ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->unk_009)
    {
        gSioSt->unk_00A = 1 << gSioSt->selfId;
        return false;
    }

    return true;
}

//! FE8U = 0x08048730
void sub_8048730(void)
{
    UnpackUiBarPalette(6);
    DrawUiFrame2(0xd, 0xb, 0x10, 6, 0);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();

    sub_80484D8(&gUnk_Sio_0203DA88[0], GetStringFromIndex(0x77E), 0);
    DrawStatBarGfx(0x100, 0xd, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, 0, 100);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x0804879C
void sub_804879C(void)
{
    SetWOutLayers(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x080487C0
void sub_80487C0(struct Proc * proc)
{
    int i;
    struct Proc85AA9C0 ** iter;

    struct SioMenuProc * pSioMenuProc = proc->proc_parent;

    EndFaceById(3);

    iter = pSioMenuProc->unk_2c;

    for (i = 0; i < 5; i++)
    {
        Proc_End(*iter++);
    }

    InitSioBG();
    sub_804C3A0(0, 0);

    gSioSt->unk_000 = 3;

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();

    InitTextDb(gUnk_Sio_0203DA88, 10);

    Sound_FadeOutBGM(1);

    return;
}

//! FE8U = 0x0804881C
void sub_804881C(void)
{
    ClearSioBG();

    sub_8045CBC();
    sub_8045CE0();
    sub_8041898();

    LoadAndVerfySuspendSave();

    return;
}

//! FE8U = 0x08048838
void sub_8048838(void)
{
    InitGlobalSaveInfodata();

    EraseSaveRankData();
    EraseSoundRoomSaveData();
    EraseLinkArenaStruct2();

    return;
}

// clang-format off

EventScr CONST_DATA gUnknown_085A9F48[] =
{
        EVBIT_MODIFY(0x4)
        TEXTSHOW(0x840)
        TEXTEND
        SVAL(EVT_SLOT_7, 0x1)
        BNE(0x0, EVT_SLOT_C, EVT_SLOT_7)
        EvtTextShow2(0x841) // ENOSUPP in EAstdlib
        TEXTEND
        SVAL(EVT_SLOT_7, 0x1)
        BNE(0x0, EVT_SLOT_C, EVT_SLOT_7)
        ASMC(sub_8048838)
        EvtTextShow2(0x842) // ENOSUPP in EAstdlib
        TEXTEND
LABEL(0x0)
        REMA
        ENDA
};

// clang-format on

//! FE8U = 0x08009A00
void CallEraseSaveEvent(void)
{
    CallEvent((void *)gUnknown_085A9F48, EV_EXEC_QUIET);
    return;
}
