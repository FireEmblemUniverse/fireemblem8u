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
#include "constants/songs.h"

/**
 * Contains Link Arena functions that are called by events
 */



//! FE8U = 0x08048260
void StartTacticianNameEntry(ProcPtr parent)
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

    InitTextFont(&Font_0, (void *)(0x06001800), 0xc0, 0);

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    gPlaySt.config.windowColor = 0;

    proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 5;
    proc->unk32 = 1;

    return;
}

extern struct SioMessage gUnk_73;

//! FE8U = 0x080482E0
bool XMapTransfer_0(ProcPtr proc)
{
    int i;
    u8 buf[4];

    int numTimeouts = 0;

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
        {
            Nop_Scene_0(proc, 4);
            return false;
        }

        return true;
    }

    if ((gSioSt->selfId > 1) || (gSioSt->playerStatus[gSioSt->selfId] == PLAYER_STATUS_2))
    {
        Nop_Scene_0(proc, 0);
        return false;
    }

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!Sio_CheckLinkAlive() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        Nop_Scene_0(proc, 0);
        return false;
    }

    gUnk_73.kind = SIO_MSG_8C;
    gUnk_73.sender = gSioSt->selfId;
    gUnk_73.param = gSioSt->unk_000;
    SioSend(&gUnk_73, 10);

    if ((gSioSt->selfId == 0) && !IsExtraMapAvailable())
    {
        buf[0] = 1;
        SioEmitData(buf, sizeof(buf));
        Nop_Scene_0(proc, 3);
        return false;
    }

    if ((gSioSt->unk_009 & 3) == 3)
    {
        gSioSt->unk_009 = 3;
        SioClearOutgoingQueue();

        gSioSt->unk_004 = 6;
        gSioSt->unk_01E = 0;

        if (gSioSt->selfId != 0)
        {
            Nop_Scene_0(proc, 1);
        }

        return false;
    }

    return true;
}

//! FE8U = 0x080483F8
void XMapTransfer_1(ProcPtr proc)
{
    if (gSioSt->unk_009 > 3)
    {
        Nop_Scene_0(proc, 0);
    }

    return;
}

//! FE8U = 0x08048418
void XMapTransfer_2(ProcPtr proc)
{
    u8 buf[4];

    if (GetTalkChoiceResult() == 1)
    {
        gUnk_Sio_15 = 0;
    }
    else
    {
        gUnk_Sio_15 = 1;
    }

    buf[0] = gUnk_Sio_15;
    SioEmitData(buf, sizeof(buf));

    if (gUnk_Sio_15 != 0)
    {
        Nop_Scene_0(proc, 5);
    }

    return;
}

//! FE8U = 0x08048460
bool XMapTransfer_3(ProcPtr proc)
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

    if (!Sio_CheckLinkAlive() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        Nop_Scene_0(proc, 0);
        return 0;
    }

    got = SioReceiveData(buf, bufSenderId, NULL);

    if (got != 0)
    {
        if (buf[0] != 0)
        {
            Nop_Scene_0(proc, 5);
        }

        return false;
    }

    return true;
}

//! FE8U = 0x080484D8
void PutXMapProgressPercent(struct Text * th, const char * str, int number)
{
    ClearText(th);

    Text_InsertDrawString(th, 0, 0, str);
    SioDrawNumber(th, 54, 2, number);
    Text_InsertDrawString(th, 62, 0, GetStringFromIndex(0x5AE));

    PutText(th, TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12));

    return;
}

//! FE8U = 0x08048524
void DrawXMapSendProgress(struct SioBigSendProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(SONG_7D);
        proc->unk_3C++;

        PutXMapProgressPercent(&gUnk_Sio_7[0], "送信中" /* "Sending" */, proc->unk_3C);
        DrawStatBarGfx(
            0x100, 0xe, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}

//! FE8U = 0x08048594
void DrawXMapReceiveProgress(struct SioBigReceiveProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(SONG_7D);
        proc->unk_3C++;

        PutXMapProgressPercent(&gUnk_Sio_7[0], "受信中" /* "Receiving" */, proc->unk_3C);
        DrawStatBarGfx(
            0x100, 0xe, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}

//! FE8U = 0x08048604
void StartXMapTransfer(struct SioBigSendProc * proc)
{
    SetTextFont(&Font_0);
    InitSystemTextFont();

    if (gSioSt->selfId == 0)
    {
        ReadSramFast(CART_SRAM + SRAM_OFFSET_XMAP, gUnk_Sio_0, SRAM_SIZE_XMAP);
        StartSioBigSend(gUnk_Sio_0, SRAM_SIZE_XMAP, DrawXMapSendProgress, 0, proc);
    }
    else
    {
        StartSioBigReceive(gUnk_Sio_0, DrawXMapReceiveProgress, proc);
    }

    return;
}

//! FE8U = 0x0804867C
bool XMapTransfer_AwaitCompletion(void)
{
    if (IsSioBigTransferActive())
    {
        return true;
    }

    PlaySoundEffect(SONG_7E);

    InitTalkTextFont();

    if (gSioSt->selfId != 0)
    {
        WriteAndVerifySramFast(gUnk_Sio_0, CART_SRAM + SRAM_OFFSET_XMAP, SRAM_SIZE_XMAP);
    }

    return false;
}

//! FE8U = 0x080486D4
void Sio_InitAckMask(void)
{
    gSioSt->unk_00A = 1 << gSioSt->selfId;
    return;
}

//! FE8U = 0x080486E8
bool Sio_SyncWaitAllAck(void)
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
void XMapTransfer_4(void)
{
    UnpackUiBarPalette(6);
    DrawUiFrame2(0xd, 0xb, 0x10, 6, 0);

    SetTextFont(&Font_0);
    InitSystemTextFont();

    PutXMapProgressPercent(&gUnk_Sio_7[0], GetStringFromIndex(0x77E), 0);
    DrawStatBarGfx(0x100, 0xd, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, 0, 100);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x0804879C
void Sio_EnableAllWOutLayers(void)
{
    SetWOutLayers(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x080487C0
void EndSioMenuForXMapTransfer(struct Proc * proc)
{
    int i;
    struct SioMenuItemProc ** iter;

    struct SioMenuProc * pSioMenuProc = proc->proc_parent;

    EndFaceById(3);

    iter = pSioMenuProc->menuItems;

    for (i = 0; i < 5; i++)
    {
        Proc_End(*iter++);
    }

    InitSioBG();
    Nop_SioUiutils_1(0, 0);

    gSioSt->unk_000 = 3;

    SetTextFont(&Font_0);
    InitSystemTextFont();

    InitTextDb(gUnk_Sio_7, 10);

    Sound_FadeOutBGM(1);

    return;
}

//! FE8U = 0x0804881C
void EndSioSessionAndLoadSuspend(void)
{
    ClearSioBG();

    EndSioProcs();
    SioBat_ReleaseIrq();
    Sio_ResetState();

    LoadAndVerfySuspendSave();

    return;
}

//! FE8U = 0x08048838
void EraseSaveData(void)
{
    InitGlobalSaveInfodata();

    EraseSaveRankData();
    EraseSoundRoomSaveData();
    EraseLinkArenaStruct2();

    return;
}

// clang-format off

EventScr CONST_DATA EventScr_EraseSaveInfo[] =
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
        ASMC(EraseSaveData)
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
    CallEvent((void *)EventScr_EraseSaveInfo, EV_EXEC_QUIET);
    return;
}
