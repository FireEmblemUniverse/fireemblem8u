#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "mu.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "scene.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

int gUnknown_08591AB4[3] = { 0, 0, 0 };

CONST_DATA struct ProcCmd ProcScr_StdEventEngine[] = {
    PROC_MARK(PROC_MARK_EVENT),
    PROC_SET_END_CB(EventEngine_OnEnd),
    PROC_YIELD,
    PROC_CALL(_FreezeMenu),
    PROC_REPEAT(EventEngine_OnUpdate),
    PROC_YIELD,
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_BattleEventEngine[] = {
    PROC_MARK(PROC_MARK_EVENT),
    PROC_SET_END_CB(EventEngine_OnEnd),
    PROC_YIELD,
    PROC_REPEAT(EventEngine_OnUpdate),
    PROC_YIELD,
    PROC_END
};

CONST_DATA EventFuncType gEventLoCmdTable[] = {
    _EventLoCmds
};

CONST_DATA struct ProcCmd ProcScr_SomeEventDeamon[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_YIELD,
    PROC_CALL(nop_800CCE8),
    PROC_REPEAT(nullsub_32),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EventFaceDeamon[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_SET_END_CB(EventFaceDeamonDelete),
    PROC_YIELD,
    PROC_CALL(nop_800CD38),
    PROC_REPEAT(nullsub_34),
    PROC_END
};

CONST_DATA EventFuncType gEventHiCmdTable[] = {
    _EventHiCmds
};

void _FreezeMenu(void)
{
    FreezeMenu();
}

void EventEngine_OnUpdate(struct EventEngineProc * proc)
{
    if (DoesBMXFADEExist())
        return;

    if (EventEngine_CanStartSkip(proc) && (gKeyStatusPtr->newKeys & START_BUTTON)) {
        EventEngine_StartSkip(proc);
        return;
    }

    if (proc->execType != EV_EXEC_WORLDMAP && proc->execType != EV_EXEC_UNK4) {
        gLCDControlBuffer.dispcnt.bg0_on = TRUE;
        gLCDControlBuffer.dispcnt.bg1_on = TRUE;
        gLCDControlBuffer.dispcnt.bg2_on = TRUE;
        gLCDControlBuffer.dispcnt.bg3_on = TRUE;
        gLCDControlBuffer.dispcnt.obj_on = TRUE;
    }

    if (proc->pCallback) {
        proc->pCallback(proc);
        return;
    }

    proc->evStateBits |= EV_STATE_0002;

    while (TRUE) {
        unsigned evCode;
        EventFuncType evFunc;

        // Event Slot 0
        gEventSlots[0] = 0;

        evCode = (*proc->pEventCurrent) >> 8;
        evFunc = (evCode < 0x80) ? gEventLoCmdTable[evCode] : gEventHiCmdTable[evCode - 0x80];

        switch (evFunc(proc)) {
        case EVC_ADVANCE_CONTINUE:
            proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
        case EVC_STOP_CONTINUE:
        case EVC_UNK4:
        case EVC_ERROR:
            break;
        
        case EVC_ADVANCE_YIELD:
            proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
        case EVC_STOP_YIELD:
            return;
        
        case EVC_END:
            Proc_Break(proc);
            return;
        }
    }
}

void EventEngine_OnEnd(struct EventEngineProc* proc) {
    SetTextFont(NULL);
    InitSystemTextFont();
    LoadUiFrameGraphics();

    switch (proc->execType) {
    case EV_EXEC_UNK4:
        break;

    case EV_EXEC_UNK5:
        ReadGameSaveCoreGfx();
        UnpackChapterMapPalette();
        ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        if (proc->evStateBits & EV_STATE_CHANGEGM) {
            EndAllMus();
            EndBMapMain();
            memset((u8*)(gEventCallQueue), 0, 0x80);
        }

    case EV_EXEC_GAMEPLAY:
        UnlockGame();
        ResumeMenu();
        ResetBkselPalette();
        ClearCutsceneUnits();

        break;
    }

    if (proc->execType != EV_EXEC_QUIET) {
        EndTalk();
        EndCgText(); // End some thing
        sub_808BB74(); // End some more things

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        sub_800E640(proc);
    }

    if (!(proc->evStateBits & EV_STATE_ABORT))
        CallNextQueuedEvent();
}

void EnqueueEventCall(const u16* events, u8 execType) {
    struct EnqueuedEventCall* it;
    u8 i;

    it = gEventCallQueue;

    for (i = -1; ++i <= 0xf;) {
        if (!it->isUsed) {
            it->events   = events;
            it->execType = execType;
            it->isUsed   = TRUE;

            break;
        }

        ++it;
    }
}

void CallNextQueuedEvent(void) {
    struct EnqueuedEventCall* it;
    u8 i;

    it = gEventCallQueue;

    if (it->isUsed == 1)
        EventEngine_Create(it->events, it->execType);

    for (i = 0; i < 15; ++i, ++it)
        *it = *(it + 1);

    it->events   = NULL;
    it->execType = 0;
    it->isUsed   = 0;
}

void CallEvent(const u16* events, u8 execType) {
    bool8 found = Proc_Find(ProcScr_StdEventEngine) != 0;

    if (found)
        EnqueueEventCall(events, execType);
    else
        EventEngine_Create(events, execType);
}

struct EventEngineProc* EventEngine_Create(const u16* events, u8 execType) {
    struct EventEngineProc* proc = Proc_Start(ProcScr_StdEventEngine, PROC_TREE_3);

    proc->pCallback      = NULL;

    proc->pEventStart    = events;
    proc->pEventIdk      = events;
    proc->pEventCurrent  = events;

    proc->evStateBits    = EV_STATE_NONE;
    proc->evStallTimer   = 0;

    proc->overwrittenTextSpeed = -1;
    proc->execType       = execType;
    proc->activeTextType = 0;
    proc->chapterIndex   = -1;

    proc->mapSpritePalIdOverride = 0x000;

    proc->pUnitLoadData  = NULL;
    proc->unitLoadCount  = 0;
    proc->chance          = 0;

    if (gLCDControlBuffer.blendY == 0x10)
        proc->evStateBits |= EV_STATE_FADEDIN;

    switch (execType) {
    case EV_EXEC_WORLDMAP:
        break;

    case EV_EXEC_CUTSCENE:
    case EV_EXEC_GAMEPLAY:
        proc->chapterIndex = gPlaySt.chapterIndex;
        LockGame();
        break;
    }

    return proc;
}

void EventEngine_CreateBattle(const u16* events) {
    struct EventEngineProc* proc = Proc_Start(ProcScr_BattleEventEngine, PROC_TREE_3);

    proc->pCallback     = NULL;

    proc->pEventStart    = events;
    proc->pEventIdk      = events;
    proc->pEventCurrent  = events;

    proc->evStateBits    = EV_STATE_NONE;
    proc->evStallTimer   = 0;

    proc->overwrittenTextSpeed = -1;
    proc->execType       = EV_EXEC_QUIET;
    proc->activeTextType = 0;

    proc->mapSpritePalIdOverride = 0x000;

    proc->pUnitLoadData  = NULL;
    proc->unitLoadCount  = 0;
    proc->chance          = 0;

    proc->evStateBits |= EV_STATE_ABORT;
}

s8 EventEngineExists(void) {
    return Proc_Find(ProcScr_StdEventEngine) ? TRUE : FALSE;
}

int BattleEventEngineExists(void) {
    return Proc_Find(ProcScr_BattleEventEngine) ? TRUE : FALSE;
}

void DeleteEventEngines(void) {
    Proc_EndEach(ProcScr_StdEventEngine);
    Proc_EndEach(ProcScr_BattleEventEngine);
}

CONST_DATA struct ProcCmd ProcScr_EventEngineDeamon[] = {
    PROC_WHILE(EventEngineExists),
    PROC_END
};

void BlockProcForEventEngine(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_EventEngineDeamon, proc);
}

void SetEventSlotC(unsigned value) {
    gEventSlots[0xC] = value;
}

void sub_800D204(void) {} // nullsub

int sub_800D208(void) {
    struct EventEngineProc* proc;

    if (!(proc = Proc_Find(ProcScr_StdEventEngine)))
        if (!(proc = Proc_Find(ProcScr_BattleEventEngine)))
            return FALSE;

    switch (proc->activeTextType) {

    case 0:
        return FALSE;

    case 1:
        return TRUE;

    case 2:
        return TRUE;

    case 3:
        return FALSE;

    case 4:
        return FALSE;

    case 5:
        return FALSE;

    }

    return FALSE;
}

void CallBattleQuoteEvent(u16 textIndex) {
    // Battle quote (unused?)
    CallEvent((u16 *)EventScr_DisplayBattleQuote, EV_EXEC_GAMEPLAY);

    gEventSlots[0x02] = textIndex;
}

void CallBattleQuoteEventInBattle(u16 textIndex) {
    // Battle quote
    EventEngine_CreateBattle((u16 *)EventScr_DisplayBattleQuote);

    gEventSlots[0x2] = textIndex;
}

void CallTileChangeEvent(u16 tileChangeIndex) {
    // Generic tile change events?
    CallEvent((u16 *)EventScr_TriggerQueuedTileChanges, EV_EXEC_GAMEPLAY);

    gEventSlots[0xD] = 1; // qp
    gEventSlotQueue[0]   = tileChangeIndex;
}

void CallChestOpeningEvent(u16 tileChangeIndex, u16 idr) {
    // Chest opening events?
    CallEvent((u16 *)EventScr_OpenChest, EV_EXEC_GAMEPLAY);

    gEventSlots[0xD] = 1; // qp
    gEventSlotQueue[0]   = tileChangeIndex;
    gEventSlots[0x3] = idr;
}

void CallMapSupportEvent(u16 musicIndex, u16 textIndex) {
    // Calls text with music (just quiets music when id is 0)
    // On-map supports?
    CallEvent((u16 *)EventScr_MapSupportConversation, EV_EXEC_CUTSCENE);

    gEventSlots[0x2] = musicIndex;
    gEventSlots[0x3] = textIndex;
}

void CallSupportViewerEvent(u16 textIndex) {
    // Calls text with random background (support viewer?)
    CallEvent((u16 *)EventScr_SupportViewerConversation, EV_EXEC_QUIET);

    gEventSlots[0x2] = textIndex;
}

void CallRetreatPromptEvent(void) {
    // Calls Retreat events
    CallEvent((u16 *)EventScr_SkirmishRetreat, EV_EXEC_CUTSCENE);

    gEventSlots[0x2] = gPlaySt.chapterIndex;
}

void CallSuspendPromptEvent(void) {
    // Calls Suspend events
    CallEvent((u16 *)EventScr_SuspendPrompt, EV_EXEC_CUTSCENE);
}

void CallGameOverEvent(void) {
    // Calls Game Over
    EventEngine_Create((u16 *)EventScr_GameOver, EV_EXEC_GAMEPLAY);
}

bool8 EventEngine_CanStartSkip(struct EventEngineProc* proc) { // Events_CanSkip
    if (!(proc->evStateBits & EV_STATE_0002))
        return FALSE;

    // Why is this check so different??
    if (((proc->evStateBits >> 2) & 1)) // & EV_STATE_SKIPPING
        return FALSE;

    if ((proc->evStateBits & EV_STATE_NOSKIP))
        return FALSE;

    if (IsBattleDeamonActive())
        return FALSE;

    if (Proc_Find(ProcScr_MuDeathFade))
        return FALSE;

    return TRUE;
}

void SetDialogueSkipEvBit(void) {
    struct EventEngineProc* proc;

    if (!(proc = Proc_Find(ProcScr_StdEventEngine)))
        if (!(proc = Proc_Find(ProcScr_BattleEventEngine)))
            return;

    proc->evStateBits |= EV_STATE_0008;
}

void EventEngine_StartSkip(struct EventEngineProc* proc) {
    proc->evStateBits |= EV_STATE_SKIPPING;

    if (!GetZero()) {
        if (WM_Exists() == TRUE) // World Map check
            sub_800D488(proc);
        else if (!(proc->evStateBits & EV_STATE_NOFADE)) {
            if (proc->evStateBits & EV_STATE_FADEDIN)
                sub_800D488(proc);
            else
                StartLockingFadeToBlack(0x40, (struct Proc*)(proc));

            proc->evStateBits |= EV_STATE_FADEDIN;
        }
    }

    if (proc->execType == EV_EXEC_WORLDMAP)
        sub_80BA424();

    Proc_BlockEachMarked(5);
}

void sub_800D488(struct EventEngineProc* unused) {
    sub_80141B0(); // disables layers
    Proc_EndEach(gProcScr_TalkOpen);
}

void SetEventTriggerState(u16 triggerId, bool8 value) {
    if (!value)
        ClearFlag(triggerId);
    else
        SetFlag(triggerId);
}

s8 GetEventTriggerState(u16 triggerId) {
    if (!CheckFlag(triggerId))
        return FALSE;
    return TRUE;
}

ProcPtr MergeGenericProc(ProcPtr parent, ProcFunc init, ProcFunc loop, ProcFunc dest) {
    struct ProcCmd code[] = {
        PROC_SET_END_CB(dest),
        PROC_CALL(init),
        PROC_REPEAT(loop),
        PROC_END
    };

    memcpy(gGenericProc, code, sizeof code);
    return Proc_Start(gGenericProc, parent);
}

void sub_800D524(void) {} // nullsub

void SlotQueuePush(unsigned value) {
    gEventSlotQueue[gEventSlots[0xD]] = value;
    gEventSlots[0xD]++;
}

unsigned SlotQueuePop(void) {
    s16 i;
    unsigned result;

    result = gEventSlotQueue[0];

    gEventSlots[0xD]--;

    for (i = 0; i < gEventSlots[0xD]; ++i)
        gEventSlotQueue[i] = gEventSlotQueue[i+1];

    return result;
}

void SetEventSlotCounter(unsigned value) {
    gEventSlotCounter = value;
}

unsigned GetEventSlotCounter(void) {
    return gEventSlotCounter;
}
