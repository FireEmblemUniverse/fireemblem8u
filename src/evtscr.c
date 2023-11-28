#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "worldmap.h"
#include "cgtext.h"

#include "ev_triggercheck.h"
#include "event.h"

void sub_800B910(int, int, int);
void sub_800B954(int, int, int);
void sub_800B994(int, int, int);
void sub_800B9B8(int, int);
void sub_800BA04(int, int);
extern u16 gEvent_PostEnd[]; // gEvent_PostEnd

//! FE8U = 0x0800D5A0
u8 Event00_NULL(struct EventEngineProc * proc)
{
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D5A4
u8 Event01_End(struct EventEngineProc * proc)
{
    s8 i;
    u16 flag;

    if (!(proc->evStateBits & EV_STATE_ABORT))
    {
        if (EVT_SUB_CMD(proc->pEventCurrent) == EVSUBCMD_ENDB)
        {
            for (i = 0; i < 8; i++)
            {
                gUnknown_03000570[i].evt1 = NULL;
                gUnknown_03000570[i].evt2 = NULL;
            }
        }

        if (gUnknown_03000570[0].evt1 != NULL)
        {
            proc->pEventIdk = gUnknown_03000570[0].evt1;
            proc->pEventCurrent = gUnknown_03000570[0].evt2;

            for (i = 0; i < 7; i++)
            {
                gUnknown_03000570[i].evt1 = gUnknown_03000570[i + 1].evt1;
                gUnknown_03000570[i].evt2 = gUnknown_03000570[i + 1].evt2;
            }

            gUnknown_03000570[i].evt1 = NULL;
            gUnknown_03000570[i].evt2 = NULL;
            return EVC_ADVANCE_CONTINUE;
        }

        switch (proc->execType)
        {
            case EV_EXEC_WORLDMAP:
                proc->execType = EV_EXEC_UNK4;
                return EVC_END;

            case EV_EXEC_CUTSCENE:
                proc->evStateBits &= ~EV_STATE_SKIPPING;
                proc->evStateBits |= EV_STATE_NOSKIP;

                proc->execType = EV_EXEC_UNK5;

                proc->pEventIdk = gEvent_08592114;
                proc->pEventCurrent = gEvent_08592114;

                return EVC_STOP_CONTINUE;

            default:
                return EVC_END;
        }
    }

    return EVC_END;
}

//! FE8U = 0x0800D670
u8 Event02_EvBitAndIdMod(struct EventEngineProc * proc)
{
    int sub_cmd_lo = EVT_SUB_CMD_LO(proc->pEventCurrent);
    int sub_cmd_hi = EVT_SUB_CMD_HI(proc->pEventCurrent);
    u16 arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (EVT_CMD_ARGV(proc->pEventCurrent)[0] < 0)
        arg = gEventSlots[2];

    switch (sub_cmd_lo)
    {
        case 0:
            if (sub_cmd_hi == 0)
                proc->evStateBits &= ~(1 << (s16)arg); /* EVSUBCMD_EVBIT_F */
            else
                proc->evStateBits |= (1 << (s16)arg); /* EVSUBCMD_EVBIT_T */
            break;

        case 1:
            if (sub_cmd_hi == 0)
                ClearFlag((s16)arg); /* EVSUBCMD_ENUF */
            else
                SetFlag((s16)arg); /* EVSUBCMD_ENUT */
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D6E4
u8 Event03_CheckEvBitOrId(struct EventEngineProc * proc)
{
    int sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 bitck, tst;

    if (EVT_CMD_ARGV(proc->pEventCurrent)[0] < 0)
        arg = gEventSlots[2];

    switch (sub_cmd)
    {
        case EVSUBCMD_CHECK_EVBIT:
            if ((proc->evStateBits >> (s16)arg) & 0x1)
                gEventSlots[0xC] = true;
            else
                gEventSlots[0xC] = false;
            break;

        case EVSUBCMD_CHECK_EVENTID:
            tst = arg;
            if (CheckFlag(tst) == false)
                gEventSlots[0xC] = false;
            else
                gEventSlots[0xC] = true;
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D754
u8 Event04_CheckRandom(struct EventEngineProc * proc)
{
    u16 max = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (max == 0)
        gEventSlots[0xC] = 0;
    else
        gEventSlots[0xC] = NextRN_N(max + 1);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D77C
u8 Event05_SetSlot(struct EventEngineProc * proc)
{
    u16 index = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 value = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    gEventSlots[index] = value;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D794
u8 Event06_SlotOperation(struct EventEngineProc * proc)
{
    u8 sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    u8 slotDest = (((u16)EVT_CMD_ARGV(proc->pEventCurrent)[0]) >> 0) & 0xF;
    u8 slotSrc1 = (((u16)EVT_CMD_ARGV(proc->pEventCurrent)[0]) >> 4) & 0xF;
    u8 slotSrc2 = (((u16)EVT_CMD_ARGV(proc->pEventCurrent)[0]) >> 8) & 0xF;

    switch (sub_cmd)
    {
        case EVSUBCMD_SADD:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] + gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SSUB:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] - gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SMUL:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] * gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SDIV:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] / gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SMOD:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] % gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SAND:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] & gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SORR:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] | gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SXOR:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] ^ gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SLSL:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] << gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_SLSR:
            gEventSlots[slotDest] = gEventSlots[slotSrc1] >> gEventSlots[slotSrc2];
            return EVC_ADVANCE_CONTINUE;

        default:
            return EVC_ERROR;
    }
}

//! FE8U = 0x0800D918
u8 Event07_SlotQueueOperations(struct EventEngineProc * proc)
{
    const u16 * scr = proc->pEventCurrent;
    u8 sub_cmd = EVT_SUB_CMD(scr);
    s16 slot;

    switch (sub_cmd)
    {
        case EVSUBCMD_SENQUEUE:
            slot = EVT_CMD_ARGV(scr)[0];
            SlotQueuePush(gEventSlots[slot]);
            break;

        case EVSUBCMD_SDEQUEUE_S1:
            SlotQueuePush(gEventSlots[0x1]);
            break;

        case EVSUBCMD_SDEQUEUE:
            slot = EVT_CMD_ARGV(scr)[0];
            gEventSlots[slot] = SlotQueuePop();
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D97C
u8 Event08_Label(struct EventEngineProc * proc)
{
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D980
u8 Event09_Goto(struct EventEngineProc * proc)
{
    u16 arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 ref = (arg << 0x10) | (EV_CMD_LABEL << 0x08) | 0x20;
    u32 scr;
    const u16 * cur;

    cur = proc->pEventIdk;
    proc->pEventCurrent = cur;
    scr = *(const u32 *)cur;

    if (scr == ref)
        return EVC_ADVANCE_CONTINUE;

    while (scr != ref)
    {
        cur += EVT_CMD_LEN(cur);
        scr = *(const u32 *)cur;
    }

    if (scr == ref)
        proc->pEventCurrent = cur;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800D9B8
u8 Event0A_Call(struct EventEngineProc * proc)
{
    s8 i;
    int dst = EVT_CMD_ARG32_BE(proc->pEventCurrent);

    if (dst < 0)
        dst = gEventSlots[2];

    for (i = 7; i > 0; i--)
    {
        gUnknown_03000570[i].evt1 = gUnknown_03000570[i - 1].evt1;
        gUnknown_03000570[i].evt2 = gUnknown_03000570[i - 1].evt2;
    }

    gUnknown_03000570[0].evt1 = proc->pEventIdk;
    gUnknown_03000570[0].evt2 = proc->pEventCurrent;

    proc->pEventIdk = (const u16 *)dst;
    proc->pEventCurrent = (const u16 *)dst;
    return EVC_UNK4;
}

//! FE8U = 0x0800DA2C
u8 Event0B_(struct EventEngineProc * proc)
{
    int sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    int ptr = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (ptr < 0)
        ptr = gEventSlots[0x02];

    if (ptr != 0)
    {
        switch (sub_cmd)
        {
            case 0:
                CallEvent((const u16 *)ptr, proc->execType);
                break;

            case 1:
                sub_8083DD8(ptr, arg);
                break;
        }
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800DA78
u8 Event0C_Branch(struct EventEngineProc * proc)
{
    u8 sub_cmd;
    int val1, val2;

    sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);

    val1 = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[1];
    val2 = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[2];

    val1 = gEventSlots[val1];
    val2 = gEventSlots[val2];

    switch (sub_cmd)
    {
        case 0:
            if (val1 == val2)
                return Event09_Goto(proc);

            return EVC_ADVANCE_CONTINUE;

        case 1:
            if (val1 != val2)
                return Event09_Goto(proc);

            return EVC_ADVANCE_CONTINUE;

        case 2:
            if (val1 >= val2)
                return Event09_Goto(proc);

            return EVC_ADVANCE_CONTINUE;

        case 3:
            if (val1 > val2)
                return Event09_Goto(proc);

            return EVC_ADVANCE_CONTINUE;

        case 4:
            if (val1 <= val2)
                return Event09_Goto(proc);

            return EVC_ADVANCE_CONTINUE;

        case 5:
            if (val1 < val2)
                return Event09_Goto(proc);

            return EVC_ADVANCE_CONTINUE;

        default:
            return EVC_ERROR;
    }
}

//! FE8U = 0x0800DB00
u8 Event0D_AsmCall(struct EventEngineProc * proc)
{
    u32 _cmd_mask;
    u8 _cmd;
    void (*func)(struct EventEngineProc *);

    _cmd = *proc->pEventCurrent;
    _cmd_mask = 0xF;

    func = (void *)EVT_CMD_ARG32_BE(proc->pEventCurrent);

    if ((_cmd_mask &= _cmd) == 0x1 && EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    func(proc);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800DB38
u8 Event0E_STAL(struct EventEngineProc * proc)
{
    u8 subcode;
    s16 stallTimer;

    subcode = EVT_SUB_CMD(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        proc->evStallTimer = 0;
        return EVC_ADVANCE_CONTINUE;
    }

    if (((subcode & 1) && (((proc->evStateBits >> 0x3) & 1) || (gKeyStatusPtr->newKeys & B_BUTTON))))
        goto end_stall; // I can't get it to match without that (ugh)

    stallTimer = proc->evStallTimer;

    if (stallTimer <= 0)
    {
        proc->evStallTimer = proc->pEventCurrent[1];
    }
    else
    {
        int timeStep = 1;

        if (!(proc->evStateBits & EV_STATE_0040) && (subcode & 2))
            if ((gPlaySt.config.gameSpeed != 0) || (gKeyStatusPtr->heldKeys & A_BUTTON))
                timeStep = 4;

        stallTimer = stallTimer - timeStep;

        if (stallTimer <= 0)
        {

        end_stall:
            proc->evStallTimer = 0;
            return EVC_ADVANCE_CONTINUE;
        }

        proc->evStallTimer = stallTimer;
    }

    return EVC_STOP_YIELD;
}

// Counter Operations
//! FE8U = 0x0800DBE0
u8 Event0F_(struct EventEngineProc * proc)
{
    do
    {
        s8 newValue;
        u8 subcode   = EVT_SUB_CMD(proc->pEventCurrent);
        u32 argument = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[0];
        u32 shift    = 4 * (*(const u8*)(proc->pEventCurrent + 1) % 8);

        switch (subcode)
        {
        case 0: // Check
            gEventSlots[0xC] = (gEventSlotCounter >> shift) & 0xF;

            return EVC_ADVANCE_CONTINUE;

        case 1: // Set
            newValue = (u16)argument >> 8;
            break;

        case 2: // Increment
            newValue = ((gEventSlotCounter >> shift) & 0xF) + 1;

            if (newValue > 0xF)
                newValue = 0xF;

            break;

        case 3: // Decrement
            newValue = ((gEventSlotCounter >> shift) & 0xF) - 1;

            if (newValue < 0)
                newValue = 0;

            break;

        } // switch (subcode)

        argument = ~(0xF << shift);
        gEventSlotCounter = (
            (gEventSlotCounter &~ (0xF << shift)) |
            ((newValue & 0xF) << shift)
        );
    } while (0);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800DC98
u8 Event10_ModifyEvBit(struct EventEngineProc * proc)
{
    u16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (EVENT_IS_SKIPPING(proc) && evArgument)
        proc->evStateBits = (proc->evStateBits & ~EV_STATE_SKIPPING) | EV_STATE_FADEDIN;

    switch (evArgument)
    {

        case 0:
            proc->evStateBits &= ~EV_STATE_NOSKIP;
            proc->evStateBits &= ~EV_STATE_0020;
            proc->evStateBits &= ~EV_STATE_0040;

            return EVC_ADVANCE_CONTINUE;

        case 1:
            proc->evStateBits |= EV_STATE_NOSKIP;
            proc->evStateBits |= EV_STATE_0020;
            proc->evStateBits |= EV_STATE_0040;

            return EVC_ADVANCE_CONTINUE;

        case 2:
            proc->evStateBits &= ~EV_STATE_NOSKIP;
            proc->evStateBits &= ~EV_STATE_0020;
            proc->evStateBits |= EV_STATE_0040;

            return EVC_ADVANCE_CONTINUE;

        case 3:
            proc->evStateBits |= EV_STATE_NOSKIP;
            proc->evStateBits &= ~EV_STATE_0020;
            proc->evStateBits &= ~EV_STATE_0040;

            return EVC_ADVANCE_CONTINUE;

        case 4:
            proc->evStateBits |= EV_STATE_NOSKIP;
            proc->evStateBits |= EV_STATE_0020;
            proc->evStateBits &= ~EV_STATE_0040;

            return EVC_ADVANCE_CONTINUE;

        default:
            return EVC_ERROR;

    } // switch (evArgument)
}

//! FE8U = 0x0800DD58
u8 Event11_SetIgnoredKeys(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    u16 mask = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (subcode == 0)
        SetKeyStatus_IgnoreMask(mask);

    return EVC_ADVANCE_CONTINUE;
}

// SOUND EVENT CODES

//! FE8U = 0x0800DD74
u8 Event12_(struct EventEngineProc * proc)
{
    s16 evArgument;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    StartBgmExt(evArgument, 3, NULL);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800DDB0
u8 Event13_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    if (evArgument != INT16_MAX)
    {
        if (EVENT_IS_SKIPPING(proc))
            return EVC_ADVANCE_CONTINUE;

        StartBgmFadeIn(evArgument, subcode, 0);
        return EVC_ADVANCE_YIELD;
    }
    else
    {
        if (EVENT_IS_SKIPPING(proc))
            subcode = 1;

        Sound_FadeOutBGM(subcode);
        return EVC_ADVANCE_YIELD;
    }
}

//! FE8U = 0x0800DE14
u8 Event14_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (subcode)
    {
        case 0:
            if (EVENT_IS_SKIPPING(proc) || ((proc->evStateBits >> 3) & 1))
                return EVC_ADVANCE_CONTINUE;

            if (evArgument < 0)
                evArgument = gEventSlots[2];

            OverrideBgm(evArgument);

            break;

        case 1:
            DeleteAll6CWaitMusicRelated();
            _RestoreBgm(evArgument);

            break;

    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800DE74
u8 Event15_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcode)
    {
        case 0:
            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            StartBgmVolumeChange(0x100, 0x90, 10, proc);

            break;

        case 1:
            if (EVENT_IS_SKIPPING(proc))
            {
                Sound_SetSEVolume(0x100);
                return EVC_ADVANCE_CONTINUE;
            }

            StartBgmVolumeChange(0x90, 0x100, 10, proc);

            break;

    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800DED4
u8 Event16_(struct EventEngineProc * proc)
{
    s16 evArgument;

    if (EVENT_IS_SKIPPING(proc) || ((proc->evStateBits >> 3) & 1))
        return EVC_ADVANCE_CONTINUE;

    evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    PlaySoundEffect(evArgument);

    return EVC_ADVANCE_CONTINUE;
}

// Fade
//! FE8U = 0x0800DF20
u8 Event17_(struct EventEngineProc * proc)
{
    u8 subcode;
    u16 evArgument;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    subcode = EVT_SUB_CMD(proc->pEventCurrent);
    evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (subcode)
    {
        case 0: // FADU
            StartLockingFadeFromBlack(evArgument, proc);

            proc->evStateBits &= ~EV_STATE_FADEDIN;

            SetDispEnable(TRUE, TRUE, TRUE, TRUE, TRUE);

            return EVC_ADVANCE_YIELD;

        case 1: // FADI
            StartLockingFadeToBlack(evArgument, proc);

            proc->evStateBits |= EV_STATE_FADEDIN;

            return EVC_ADVANCE_YIELD;

        case 2: // FAWU
            StartLockingFadeFromWhite(evArgument, proc);

            proc->evStateBits &= ~EV_STATE_FADEDIN;

            SetDispEnable(TRUE, TRUE, TRUE, TRUE, TRUE);

            return EVC_ADVANCE_YIELD;

        case 3: // FAWI
            StartLockingFadeToWhite(evArgument, proc);

            proc->evStateBits |= EV_STATE_FADEDIN;

            return EVC_ADVANCE_YIELD;

        default:
            return EVC_ERROR;

    } // switch (subcode)
}

// I think this is related to some color filtering effect (?)
// Messes with palettes
//! FE8U = 0x0800DFBC
u8 Event18_(struct EventEngineProc * proc)
{
    u32 mask;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    u8 evArgumentBitStart = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 evArgumentBitCount = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    u32 evArgument2 = proc->pEventCurrent[2];
    u32 evArgument3 = proc->pEventCurrent[3];
    u32 evArgument4 = proc->pEventCurrent[4];
    u32 evArgument5 = proc->pEventCurrent[5];

    switch (subcode)
    {
        case 0:
            sub_80127C4();
            return EVC_ADVANCE_YIELD;

        case 1:
            sub_8012824();
            return EVC_ADVANCE_YIELD;

        case 2:
        {
            s8 i;

            if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
                evArgument2 = 0;

            mask = 0;

            for (i = evArgumentBitCount; i > 0; --i)
            {
                s8 tmp = evArgumentBitStart;
                mask = mask | (1 << tmp);
                evArgumentBitStart = tmp + 1;
            }

            sub_8012890(evArgument2, mask, evArgument3, evArgument4, evArgument5, proc);

            return EVC_ADVANCE_YIELD;
        }

        default:
            return EVC_ERROR;

    } // switch (subcode)
}

// Various Checks
//! FE8U = 0x0800E070
u8 Event19_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcode)
    {
        case 0: // Check Mode
            gEventSlots[0xC] = gPlaySt.chapterModeIndex;
            break;

        case 1: // Check (Next?) Chapter Index
            gEventSlots[0xC] = proc->chapterIndex;
            break;

        case 2: // Check Difficult Mode
            if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
                gEventSlots[0xC] = FALSE;
            else
                gEventSlots[0xC] = TRUE;

            break;

        case 3: // Check Turn Number
            gEventSlots[0xC] = gPlaySt.chapterTurnNumber;
            break;

        case 4: // Check Red Unit Count
            gEventSlots[0xC] = CountRedUnits();
            break;

        case 5: // Check Green Unit Count
            gEventSlots[0xC] = CountGreenUnits();
            break;

        case 6: // Check Chapter Type?
            gEventSlots[0xC] = GetChapterThing();
            break;

        case 7: // Check Some option or difficult mode
            if (gPlaySt.config.controller || (gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
                gEventSlots[0xC] = FALSE;
            else
                gEventSlots[0xC] = TRUE;

            break;

        case 8: // Check gold
            gEventSlots[0xC] = GetPartyGoldAmount();
            break;

        case 9: // Check Event Trigger ID
            gEventSlots[0xC] = GetEventTriggerId(proc->pEventStart);
            break;

        case 10: // Check Game Complete
            if (gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)
                gEventSlots[0xC] = TRUE;
            else
                gEventSlots[0xC] = FALSE;

            break;

        default:
            break;

    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800E188
u8 Event1A_TEXTSTART(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    if (subcode != proc->activeTextType && subcode != 5)
    {
        EndTalk();
        EndCgText();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);
    }

    proc->activeTextType = subcode;

    switch (subcode)
    {
        case 0:
        case 3:
        case 4:
        case 5:
            return EVC_ADVANCE_YIELD;

        case 1:
        case 2:
            return Event23_(proc);

        default:
            return EVC_ERROR;

    } // switch (subcode)
}

void sub_800E210(struct EventEngineProc * proc, u16 stringIndex, s8 b)
{
    if (b == TRUE)
        InitTalk(0x80, 2, 1);

    if ((proc->evStateBits & EV_STATE_0040) == 1)
    { // ?????
        proc->overwrittenTextSpeed = gPlaySt.config.textSpeed;
        gPlaySt.config.textSpeed = 1;
    }
    else
    {
        proc->overwrittenTextSpeed = 0xFF;
    }

    StartTalkMsg(1, 1, stringIndex);

    if (proc->evStateBits & EV_STATE_0020)
        SetTalkFlag(TALK_FLAG_NOSKIP);

    if (proc->evStateBits & EV_STATE_0040)
        SetTalkFlag(TALK_FLAG_NOFAST);
}

void sub_800E290(struct EventEngineProc * proc, u16 stringIndex, u32 flags)
{
    flags |= 0x0400;

    if (proc->evStateBits & EV_STATE_0020)
        flags |= 0x0040;

    if (proc->evStateBits & EV_STATE_0040)
        flags |= 0x2000 | 0x0800 | 0x0020;

    SetWinEnable(FALSE, FALSE, FALSE);

    LoadObjUIGfx();
    InitTalk(0x80, 0, 1);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    StartCgText(
        3, 0x12, 0x14, 4, stringIndex, OBJ_VRAM0 + 0x1000, -1,
        NULL // parent proc
    );

    SetCgTextFlags(flags);
}

void sub_800E31C(struct EventEngineProc * proc, u16 stringIndex, u32 flags)
{
    u8 x = ((u16 *)(gEventSlots + 0xB))[0];
    u8 y = ((u16 *)(gEventSlots + 0xB))[1];

    if (x == (u8)(-1) && y == (u8)(-1))
    {
        x = 0;
        y = 0;
        flags |= 0x0100;
    }
    else
    {
        int boxWidth, boxHeight;
        GetStringFromIndex(stringIndex);

        sub_808AADC(StringInsertSpecialPrefixByCtrl(), &boxWidth, &boxHeight);

        if (x == (u8)(-1))
            x = (224 - boxWidth) / 2 - 8;
        else if (y == (u8)(-1))
            y = (144 - boxHeight) / 2;
    }

    if (proc->evStateBits & EV_STATE_0020)
        flags |= 0x0080;

    if (proc->evStateBits & EV_STATE_0040)
        flags |= 0x0008;

    sub_808AA04(x, y, stringIndex, NULL);
    SetDialogueBoxConfig(flags);
}

/* https://decomp.me/scratch/rVCJU */
//! FE8U = 0x0800E3C8
u8 Event1B_TEXTSHOW(struct EventEngineProc * proc)
{
    u8 subcode = 0xF & *(const u8 *)(proc->pEventCurrent);
    short evArgument = proc->pEventCurrent[1];
    unsigned zeroFlag = 0;
    u16 ea;
    u32 flags;

    if (subcode != 2)
    {
        if (evArgument < 0)
            evArgument = gEventSlots[2];

        if (evArgument == 0)
            return EVC_ADVANCE_CONTINUE;
    }

    switch (subcode)
    {

        case 0:
            proc->evStateBits &= ~EV_STATE_0008;

            if ((proc->evStateBits >> 2) & 1)
                break;

            switch (proc->activeTextType)
            {

                case 0:
                    sub_800E210(proc, evArgument, TRUE);
                    break;

                case 1:
                    sub_800E210(proc, evArgument, TRUE);
                    break;

                case 2:
                    sub_800E290(proc, evArgument, zeroFlag);
                    break;

                case 3:
                    ea = evArgument;
#ifdef NONMATCHING
                    flags = 0x0010;
#else
                    asm("movs %0, #0x10":"=r"(flags)::"cc");
#endif
                    goto label;

                case 4:
                    sub_800E31C(proc, evArgument, zeroFlag);
                    break;

                case 5:
                    ea = evArgument;
                    flags = 0x0010 | 0x0020;
                    goto label;

            } // switch (proc->activeTextType)

            break;

        case 1:
            if ((proc->evStateBits >> 2) & 1)
                break;

            if ((proc->evStateBits >> 3) & 1)
                break;

            switch (proc->activeTextType)
            {

                case 0:
                    sub_800E210(proc, evArgument, FALSE);
                    break;

                case 1:
                    sub_800E210(proc, evArgument, FALSE);
                    break;

                case 2:
                    sub_800E290(proc, evArgument, zeroFlag);
                    break;

                case 3:
                    ea = evArgument;
                    flags = 0x0010;
                    goto label;

                case 4:
                    sub_800E31C(proc, evArgument, zeroFlag);
                    break;

                case 5:
                    ea = evArgument;
                    flags = 0x0010 | 0x0020;
                label:
                    sub_800E31C(proc, ea, flags);
                    break;

            } // switch (proc->activeTextType)

            break;

        case 2: // REMA
            proc->evStateBits &= ~EV_STATE_0008;

            EndTalk();
            EndCgText();
            sub_808BB74();

            if (proc->execType == EV_EXEC_CUTSCENE)
                sub_800BCDC(proc->mapSpritePalIdOverride);

            sub_800E640(proc);

            return EVC_ADVANCE_YIELD;

    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800E51C
u8 Event1C_TEXTCONT(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndTalk();
        EndCgText();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);
    }
    else
    {
        ResumeTalk();
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800E560
u8 Event1D_TEXTEND(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndTalk();
        EndCgText();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);

        gEventSlots[0xC] = 0;
    }
    else
    {
        u32 flag = FALSE;

        if ((IsTalkActive() && !IsTalkLocked()) || CgTextExists() || Proc_Find(gProcScr_BoxDialogue))
            flag = TRUE;

        if (flag == TRUE)
        {
            switch (proc->execType)
            {

                case EV_EXEC_WORLDMAP:
                case EV_EXEC_UNK4:
                    return EVC_STOP_YIELD;

                default:
                    switch (proc->activeTextType)
                    {

                        case 0:
                        case 1:
                        case 2:
                            SetBlendAlpha(0x10, 1);
                            break;

                        case 3:
                        case 4:
                        case 5:
                            break;

                    } // switch (proc->activeTextType)

                    return EVC_STOP_YIELD;

            } // switch (proc->execType)
        }
        else
        {
            gEventSlots[0xC] = GetTalkChoiceResult();
        }
    }

    if (proc->overwrittenTextSpeed != -1)
        gPlaySt.config.textSpeed = proc->overwrittenTextSpeed;

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800E640
void sub_800E640(struct EventEngineProc * proc)
{
    if (proc->evStateBits & EV_STATE_FADEDIN)
    {
        ClearTalkBubble();
        Proc_EndEach(gProcScr_E_FACE); // end all faces
        ResetFaces();
        ClearTalkFaceRefs();
    }
    else if (FaceExists())
    {
        ClearTalkBubble();
        Proc_ForEach(gProcScr_E_FACE, (ProcFunc)StartFaceFadeOut);
        Proc_StartBlocking(gUnknown_08591DE8, proc);
    }
}

//! FE8U = 0x0800E698
void _WhileFace6CExists(struct Proc * proc)
{
    if (!FaceExists())
        Proc_Break(proc);
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591DE8[] =
{
    PROC_REPEAT(_WhileFace6CExists),
    PROC_YIELD,

    PROC_END,
};

// clang-format on

//! FE8U = 0x0800E6B4
u8 Event1E_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument == -1)
        evArgument = gEventSlots[2];

    if (evArgument != -3)
    {
        if (evArgument != -2)
        {
            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            gUnknown_03000428.str[0] = subcode + 8;
            gUnknown_03000428.str[1] = 0x10;
            gUnknown_03000428.str[2] = evArgument;
            gUnknown_03000428.str[3] = 1;

            gUnknown_03000428.unk04 = 1;
            gUnknown_03000428.unk05 = 0;

            InitTalk(0x80, 2, 1);
        }
        else
        {
            gUnknown_03000428.str[0] = subcode + 8;
            gUnknown_03000428.str[1] = 0x11;
            gUnknown_03000428.str[2] = 1;
            gUnknown_03000428.str[3] = 0;

            ClearTalkBubble();
        }
    }
    else
    {
        EndTalk();
        EndCgText();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);

        return EVC_ADVANCE_YIELD;
    }

    StartTalk(0, 0, gUnknown_03000428.str);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800E77C
u8 Event1F_(struct EventEngineProc * proc)
{
    u8 evX;
    u8 evY;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    if (((proc->evStateBits >> 3) & 1)) // is skipping dialogue?
        return EVC_ADVANCE_CONTINUE;

    evX = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    evY = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    gUnknown_03000430[0] = evX + 8;
    gUnknown_03000430[1] = 0x80;
    gUnknown_03000430[2] = evY + 10;
    gUnknown_03000430[3] = 0;

    StartTalk(0, 0, gUnknown_03000430);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800E7C4
u8 Event20_(struct EventEngineProc * proc)
{
    ClearTalkBubble();
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800E7D0
u8 sub_800E7D0(u8 mode, u16 bgIndex)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    switch (mode)
    {

        case 0:
            return EVC_ERROR;

        case 3:
            return EVC_ERROR;

        case 4:
            return EVC_ERROR;

        case 5:
            return EVC_ERROR;

        case 1:
            // Randomize background (for support viewers)
            if (bgIndex == 0x37) // TODO: use an enum for convo backgrounds
                bgIndex = NextRN_N(0x35);

            // Loading Background Tile Graphics

            Decompress(gConvoBackgroundData[bgIndex].gfx, (void *)(VRAM + GetBackgroundTileDataOffset(3)));

            // Loading Background Tile Arrangement

            CallARM_FillTileRect(
                gBG3TilemapBuffer, gConvoBackgroundData[bgIndex].tsa,
                0x8000 // base palette is bg palette 8
            );

            // Loading Background Palettes

            ApplyPalettes(gConvoBackgroundData[bgIndex].pal, 8, 8);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            gPaletteBuffer[0] = 0;

            return EVC_ADVANCE_YIELD;

        case 2:
            sub_80B65F8(gBG3TilemapBuffer, GetBackgroundTileDataOffset(BG_3), 8, 8, bgIndex);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            return EVC_ADVANCE_YIELD;

        default:
            return EVC_ADVANCE_YIELD;

    } // switch (mode)
}

//! FE8U = 0x0800E8CC
u8 Event21_(struct EventEngineProc * proc)
{
    u16 evArgument2_a, evArgument2_b, evArgument3;
    struct ConvoBackgroundFadeProc * otherProc;

    int subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    switch (subcode)
    {
        case 0:
            return sub_800E7D0(proc->activeTextType, evArgument);

        case 1:
        {
            evArgument2_a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            switch (proc->activeTextType)
            {

                case 0:
                case 3:
                case 4:
                case 5:
                    switch (evArgument2_a)
                    {

                        case 0:
                        case 3:
                        case 4:
                        case 5:
                            return EVC_ERROR;

                        case 1:
                        case 2:
                            if (EVENT_IS_SKIPPING(proc))
                                return EVC_ADVANCE_CONTINUE;

                            otherProc = Proc_StartBlocking(gUnknown_08591E58, proc);
                            otherProc->fadeType = 1;

                            break;

                    } // switch (a)

                    break;

                case 1:
                case 2:
                    switch (evArgument2_a)
                    {

                        case 0:
                        case 3:
                        case 4:
                        case 5:
                            if (EVENT_IS_SKIPPING(proc))
                                return Event22_(proc); // CLEAN

                            otherProc = Proc_StartBlocking(gUnknown_08591EB0, proc);
                            otherProc->fadeType = 2;

                            break;

                        case 1:
                        case 2:
                            if (EVENT_IS_SKIPPING(proc))
                                return EVC_ADVANCE_CONTINUE;

                            otherProc = Proc_StartBlocking(gUnknown_08591E00, proc);
                            otherProc->fadeType = 0;

                            break;
                    }

                    break;
            }

            otherProc->unkType = evArgument2_a;
            otherProc->bgIndex = evArgument;
            otherProc->fadeSpeed = evArgument3;
            otherProc->fadeTimer = 0;
            otherProc->pEventEngine = proc;

            break;
        }

        case 2:
        {
            evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            if (sub_800E7D0(proc->activeTextType, evArgument) == EVC_ERROR)
                return EVC_ERROR;

            NewColFadeIn(evArgument3, 0, evArgument2_b, proc);

            break;
        }

        case 3:
        {
            evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            NewColFadeOut(evArgument3, 0, evArgument2_b, proc);

            break;
        }

    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800EA84
void sub_800EA84(struct ConvoBackgroundFadeProc * proc)
{
    SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

    BG_SetPosition(BG_2, 0, 0);

    switch (proc->fadeType)
    {
        case 0:
            SetBlendAlpha(0, 0x10);

            // First: BG3; Second: BG2
            SetBlendTargetA(FALSE, FALSE, FALSE, TRUE, FALSE);
            SetBlendTargetB(FALSE, FALSE, TRUE, FALSE, FALSE);

            // BG0 > BG1 > BG3 > BG2
            gLCDControlBuffer.bg0cnt.priority = 0;
            gLCDControlBuffer.bg1cnt.priority = 1;
            gLCDControlBuffer.bg2cnt.priority = 3;
            gLCDControlBuffer.bg3cnt.priority = 2;

            break;

        case 1:
            SetBlendAlpha(0, 0x10);

            // First: BG2; Second: BG3|OBJ
            SetBlendTargetA(FALSE, FALSE, TRUE, FALSE, FALSE);
            SetBlendTargetB(FALSE, FALSE, FALSE, TRUE, TRUE);

            // BG2 > BG0 > BG1 > BG3
            gLCDControlBuffer.bg0cnt.priority = 1;
            gLCDControlBuffer.bg1cnt.priority = 2;
            gLCDControlBuffer.bg2cnt.priority = 0;
            gLCDControlBuffer.bg3cnt.priority = 3;

            break;

        case 2:
            SetBlendAlpha(0x10, 0);

            // First: BG2; Second: BG3|OBJ
            SetBlendTargetA(FALSE, FALSE, TRUE, FALSE, FALSE);
            SetBlendTargetB(FALSE, FALSE, FALSE, TRUE, TRUE);

            // BG2 > BG0 > BG1 > BG3
            gLCDControlBuffer.bg0cnt.priority = 1;
            gLCDControlBuffer.bg1cnt.priority = 2;
            gLCDControlBuffer.bg2cnt.priority = 0;
            gLCDControlBuffer.bg3cnt.priority = 3;

            break;
    }

    SetBlendBackdropA(TRUE);
    SetBlendBackdropB(FALSE);

    sub_800BA04(0, 6);
}

//! FE8U = 0x0800EBB0
void sub_800EBB0(struct ConvoBackgroundFadeProc * proc)
{
    sub_800B910(3, 2, 10);
    sub_800B954(3, 2, 1);
    sub_800B994(8, 0, 6);
    sub_800B9B8(2, -8);

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EC00
void sub_800EC00(struct ConvoBackgroundFadeProc * proc)
{
    sub_800B910(2, 3, 10);
    sub_800B954(2, 3, 1);
    sub_800B994(0, 8, 6);
    sub_800B9B8(3, 8);

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EC50
void sub_800EC50(struct ConvoBackgroundFadeProc * proc)
{
    switch (proc->unkType)
    {
        case 0:
        case 3:
        case 4:
        case 5:
            while (1)
            {
            } // oh

        case 1:
            if (proc->bgIndex == 0x37) // TODO: use an enum for convo backgrounds
                proc->bgIndex = NextRN_N(0x35);

            // Loading Background Tile Graphics

            Decompress(
                gConvoBackgroundData[proc->bgIndex].gfx, (void *)(VRAM + GetBackgroundTileDataOffset(BG_2)));

            // Loading Background Tile Arrangement

            CallARM_FillTileRect(
                gBG2TilemapBuffer, gConvoBackgroundData[proc->bgIndex].tsa,
                0 // base palette is bg palette 0
            );

            // Loading Background Palettes

            ApplyPalettes(gConvoBackgroundData[proc->bgIndex].pal, 0, 6);

            BG_EnableSyncByMask(BG2_SYNC_BIT);
            EnablePaletteSync();

            gPaletteBuffer[0] = 0;

            break;

        case 2:
            sub_80B65F8(gBG2TilemapBuffer, GetBackgroundTileDataOffset(BG_2), 0, 6, proc->bgIndex);

            BG_EnableSyncByMask(BG2_SYNC_BIT);
            EnablePaletteSync();

            break;
    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800ED50
void sub_800ED50(struct ConvoBackgroundFadeProc * proc)
{
    switch (proc->unkType)
    {
        case 0:
        case 3:
        case 4:
        case 5:
            while (1)
            {
            } // oh

        case 1:
            if (proc->bgIndex == 0x37) // TODO: use an enum for convo backgrounds
                proc->bgIndex = NextRN_N(0x35);

            // Loading Background Tile Graphics

            Decompress(
                gConvoBackgroundData[proc->bgIndex].gfx, (void *)(VRAM + GetBackgroundTileDataOffset(BG_3)));

            // Loading Background Tile Arrangement

            CallARM_FillTileRect(
                gBG3TilemapBuffer, gConvoBackgroundData[proc->bgIndex].tsa,
                0x8000 // base palette is bg palette 8
            );

            // Loading Background Palettes

            ApplyPalettes(gConvoBackgroundData[proc->bgIndex].pal, 8, 6);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            gPaletteBuffer[0] = 0;

            break;

        case 2:
            sub_80B65F8(gBG3TilemapBuffer, GetBackgroundTileDataOffset(BG_3), 8, 6, proc->bgIndex);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            break;
    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EE54
void sub_800EE54(struct ConvoBackgroundFadeProc * proc)
{
    switch (proc->unkType)
    {
        case 0:
        case 3:
        case 4:
        case 5:
            UnpackChapterMapGraphics(gPlaySt.chapterIndex);
            AllocWeatherParticles(gPlaySt.chapterWeatherId);
            RenderBmMap();
            RefreshUnitSprites();

            sub_800BCDC(proc->pEventEngine->mapSpritePalIdOverride);
            ForceSyncUnitSpriteSheet();

            Event24_(proc->pEventEngine);
            break;

        case 1:
        case 2:
            while (1)
            {
            } // oh
    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EEE8
void sub_800EEE8(struct ConvoBackgroundFadeProc * proc)
{
    u32 currentFadeLevel = (proc->fadeTimer += proc->fadeSpeed) / 16;

    switch (proc->fadeType)
    {
        case 0:
        case 1:
            SetBlendAlpha(currentFadeLevel, 0x10 - currentFadeLevel);
            break;

        case 2:
            SetBlendAlpha(0x10 - currentFadeLevel, currentFadeLevel);
            break;
    }

    if (currentFadeLevel >= 0x10)
        Proc_Break(proc);
}

//! FE8U = 0x0800EF48
void sub_800EF48(struct ConvoBackgroundFadeProc * proc)
{
    switch (proc->fadeType)
    {
        case 0:
            SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

            break;

        case 1:
            SetDispEnable(FALSE, FALSE, FALSE, TRUE, FALSE);
            Event23_(proc->pEventEngine);

            break;

        case 2:
            SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

            InitSystemTextFont();
            sub_80156D4();

            break;
    }

    // BG0 > BG1 > BG2 > BG3
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_2, 0, 0);

    SetBlendNone();

    SetBlendTargetA(FALSE, FALSE, FALSE, FALSE, FALSE);
    SetBlendTargetB(FALSE, FALSE, FALSE, FALSE, FALSE);

    SetBlendBackdropA(TRUE);
    SetBlendBackdropB(TRUE);

    sub_800BA34();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    CpuFastFill(0, (void *)(VRAM + GetBackgroundTileDataOffset(0)), 0x20);
    CpuFastFill(0, (void *)(VRAM + GetBackgroundTileDataOffset(1)), 0x20);
    CpuFastFill(0, (void *)(VRAM + GetBackgroundTileDataOffset(2)), 0x20);
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591E00[] =
{
    PROC_YIELD,

    PROC_CALL(sub_800EA84),
    PROC_YIELD,

    PROC_CALL(sub_800EBB0),
    PROC_YIELD,

    PROC_CALL(sub_800ED50),
    PROC_YIELD,

    PROC_REPEAT(sub_800EEE8),
    PROC_CALL(sub_800EF48),

    PROC_END,
};

// clang-format on

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591E50[] =
{
    PROC_END,
};

// clang-format on

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591E58[] =
{
    PROC_YIELD,

    PROC_CALL(sub_800EA84),
    PROC_YIELD,

    PROC_CALL(sub_800EC50),
    PROC_YIELD,

    PROC_REPEAT(sub_800EEE8),
    PROC_YIELD,

    PROC_CALL(sub_800EC00),
    PROC_YIELD,

    PROC_CALL(sub_800EF48),

    PROC_END,
};

// clang-format on

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591EB0[] =
{
    PROC_YIELD,

    PROC_CALL(sub_800EA84),
    PROC_YIELD,

    PROC_CALL(sub_800EBB0),
    PROC_YIELD,

    PROC_CALL(sub_800EE54),
    PROC_YIELD,

    PROC_REPEAT(sub_800EEE8),
    PROC_CALL(sub_800EF48),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0800F0C8
u8 Event22_(struct EventEngineProc * proc)
{
    RefreshBMapGraphics();
    sub_800BCDC(proc->mapSpritePalIdOverride);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    ClearTalkBubble();

    Proc_EndEach(gProcScr_E_FACE); // end all faces
    ResetFaces();

    ClearTalkFaceRefs();

    return Event24_(proc);
}

//! FE8U = 0x0800F124
u8 Event23_(struct EventEngineProc * proc)
{
    if (!(proc->evStateBits & EV_STATE_GFXLOCKED))
    {
        BMapDispSuspend();
        MU_AllDisable();
    }

    proc->evStateBits |= EV_STATE_GFXLOCKED;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F150
u8 Event24_(struct EventEngineProc * proc)
{
    if (proc->evStateBits & EV_STATE_GFXLOCKED)
    {
        BMapDispResume();
        MU_AllEnable();
    }

    proc->evStateBits &= ~EV_STATE_GFXLOCKED;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F17C
u8 Event25_(struct EventEngineProc * proc)
{
    u8 x, y;
    short chIndex;

    {
        // order needed to match
        const u16 * current = proc->pEventCurrent;

        x = ((u16 *)(gEventSlots + 0xB))[0];
        y = ((u16 *)(gEventSlots + 0xB))[1];

        chIndex = current[1];
    }

    if (chIndex < 0)
        chIndex = gEventSlots[2];

    // ensure gfx are unlocked
    Event24_(proc);

    gPlaySt.chapterIndex = chIndex;

    RestartBattleMap();

    gBmSt.camera.x = GetCameraCenteredX(x * 16);
    gBmSt.camera.y = GetCameraCenteredY(y * 16);

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    RefreshBMapGraphics();

    sub_800BCDC(proc->mapSpritePalIdOverride);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F20C
u8 Event26_CameraControlMaybe(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;

    u8 subcode = EVT_SUB_CMD_LO(proc->pEventCurrent);
    u8 sc2 = EVT_SUB_CMD_HI(proc->pEventCurrent);

    switch (subcode)
    {

        case 0: // position
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if (x < 0 || y < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            break;

        case 1:
        { // unit
            struct Unit * unit = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

            if (!unit)
                return EVC_ERROR;

            x = unit->xPos;
            y = unit->yPos;

            break;
        }

    } // switch (subcode)

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
    {
        SetSomeRealCamPos(x, y, sc2);
        SetCursorMapPosition(x, y);
        RenderBmMap();

        return EVC_ADVANCE_CONTINUE;
    }
    else
    {
        if (!sc2)
            EnsureCameraOntoPosition(proc, x, y);
        else
            sub_8015D84(proc, x, y);

        SetCursorMapPosition(x, y);

        return EVC_ADVANCE_YIELD;
    }
}

//! FE8U = 0x0800F2D4
u8 Event27_MapChange(struct EventEngineProc * proc)
{
    u8 i;
    u8 count = 1;

    u32 * mapChangeIt;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 mapChangeId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (mapChangeId)
    {
        case (-1): // "at position in Slot B"
            mapChangeId = GetMapChangeIdAt(((u16 *)(gEventSlots + 0xB))[0], ((u16 *)(gEventSlots + 0xB))[1]);

            if (mapChangeId < 0)
                return EVC_ERROR;

            break;

        case (-2): // "at position of active unit"
            mapChangeId = GetMapChangeIdAt((u8)(gActiveUnit->xPos), (u8)(gActiveUnit->yPos));

            if (mapChangeId < 0)
                return EVC_ERROR;

            break;

        case (-3):
            mapChangeIt = gEventSlotQueue;

            mapChangeId = *mapChangeIt++;
            count = gEventSlots[0xD]; // qp

            break;

    } // switch (mapChangeId)

    if (proc->evStateBits & EV_STATE_FADEDIN)
    {
        // Quietly apply tile changes

        for (i = 0; i < count; ++i)
        {
            switch (subcode)
            {
                case 0:
                    TriggerMapChanges(mapChangeId, FALSE, proc);
                    break;

                case 1:
                    UntriggerMapChange(mapChangeId, FALSE, proc);
                    break;

            } // switch (subcode)

            mapChangeId = *mapChangeIt++; // ??? potentially not initialized?
        }
    }
    else
    {
        // Display tile changes

        u8 doDisplay = TRUE;

        for (i = 0; i < count; ++i)
        {
            switch (subcode)
            {
                case 0:
                    TriggerMapChanges(mapChangeId, doDisplay, proc);
                    break;

                case 1:
                    UntriggerMapChange(mapChangeId, doDisplay, proc);
                    break;

            } // switch (subcode)

            mapChangeId = *mapChangeIt++; // ??? potentially not initialized?
            doDisplay = FALSE;            // Only display the first listed map change
        }
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F3EC
u8 Event28_ChangeWeather(struct EventEngineProc * proc)
{
    SetWeather(proc->pEventCurrent[1]);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F3FC
u8 Event29_SetFogVision(struct EventEngineProc * proc)
{
    u8 doDisplay = EVT_SUB_CMD(proc->pEventCurrent);
    u16 newVision = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (EVENT_IS_SKIPPING(proc))
        doDisplay = 0;

    sub_800BAA8(newVision, doDisplay, proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F42C
u8 Event2A_MoveToChapter(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 chIndex = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (chIndex < 0)
        chIndex = gEventSlots[2];

    switch (subcode)
    {
        case 0:
            SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
            proc->evStateBits |= EV_STATE_CHANGEGM;

            break;

        case 1:
            SetNextChapterId(chIndex);

            gPlaySt.unk4A_2 = 1;

            SetNextGameActionId(GAME_ACTION_CLASS_REEL);
            proc->evStateBits |= EV_STATE_CHANGEGM;

            break;

        case 2:
            SetNextChapterId(chIndex);

            gPlaySt.unk4A_2 = 2;

            SetNextGameActionId(GAME_ACTION_USR_SKIPPED);
            proc->evStateBits |= EV_STATE_CHANGEGM;

            break;

        case 3:
            GotoChapterWithoutSave(chIndex);
            break;

        case 4:
            gPlaySt.unk4A_2 = 3;
            SetNextGameActionId(GAME_ACTION_PLAYED_THROUGH);
            proc->evStateBits |= EV_STATE_CHANGEGM;
            break;

    } // switch (subcode)

    proc->evStateBits |= EV_STATE_CHANGECH;

    DeleteAll6CWaitMusicRelated();
    Sound_FadeOutBGM(4);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800F50C
u16 sub_800F50C(const struct UnitDefinition * unitDefinition)
{
    u16 result = 0;

    while (unitDefinition->charIndex)
    {
        ++result;
        ++unitDefinition;
    }

    return result;
}

//! FE8U = 0x0800F528
s8 ShouldUNITBeLoaded(const struct UnitDefinition * unitDefinition, u8 unk)
{
    const u8 tmp = unk; // needed to match :/

    if (unitDefinition->allegiance == 0 && tmp != 1)
    {
        struct Unit * unit = GetUnitFromCharId(unitDefinition->charIndex);

        if (unit && (unit->state & US_DEAD))
        {
            switch (tmp)
            {

                case 0:
                    return FALSE;

                case 2:
                    if (IsSethLArachelMyrrhInnes(unitDefinition->charIndex))
                        break;

                    return FALSE;
            }
        }
    }

    if (unitDefinition->allegiance != FACTION_ID_RED)
        return TRUE;

    if (!unitDefinition->sumFlag && !unitDefinition->redaCount)
    {
        if (gBmMapUnit[unitDefinition->yPosition][unitDefinition->xPosition])
            return FALSE;
    }

    if (IsUnitSlotAvailable(0x80))
        return TRUE;

    return FALSE;
}

//! FE8U = 0x0800F5B8
void sub_800F5B8(struct EventEngineProc * proc)
{
    const struct UnitDefinition * pUnitDefinition = proc->pUnitLoadData;

    s16 count = proc->unitLoadCount;
    u8 param = proc->unitLoadParameter;

    u16 something = GetSomeEventEngineMoveRelatedBitfield(proc, TRUE);

    s8 r3 = FALSE;

    if (param == 2)
        r3 = TRUE;

    if ((proc->evStateBits >> 2) & 1)
    {
        sub_800F698(pUnitDefinition, count, param);
    }
    else
    {
        for (; pUnitDefinition->charIndex && count > 0; ++pUnitDefinition)
        {
            if (ShouldUNITBeLoaded(pUnitDefinition, param) != TRUE)
                continue;

            if (!TryPrepareEventUnitMovement(proc, pUnitDefinition->xPosition, pUnitDefinition->yPosition))
            {
                proc->pUnitLoadData = pUnitDefinition;
                proc->unitLoadCount = count;
                return;
            }

            LoadUnit_800F704(pUnitDefinition, something, FALSE, r3);
            count--;
        }
    }

    proc->unitLoadCount = 0;
    proc->idk4E = 0;
    proc->pCallback = NULL;
}

void sub_800F698(const struct UnitDefinition * def, s16 count, u8 param)
{
    s8 r3 = FALSE;

    if (param == 2)
        r3 = TRUE;

    for (; def->charIndex && count > 0; ++def)
    {
        if (ShouldUNITBeLoaded(def, param) != TRUE)
            continue;

        LoadUnit_800F704(def, 1, TRUE, r3);
        count--;
    }
}

//! FE8U = 0x0800F704
void LoadUnit_800F704(const struct UnitDefinition * def, u16 b, s8 quiet, s8 d)
{
    struct Unit * unit;

    const u8 allegianceLookup[3] = {
        [FACTION_ID_BLUE] = FACTION_BLUE,
        [FACTION_ID_GREEN] = FACTION_GREEN,
        [FACTION_ID_RED] = FACTION_RED,
    };

    if (def->allegiance == 0)
    {
        unit = GetUnitFromCharIdAndFaction(def->charIndex, FACTION_BLUE);
    }
    else
    {
        unit = GetUnitFromCharIdAndFaction(def->charIndex, FACTION_BLUE);

        if (unit)
        {
            UnitChangeFaction(unit, allegianceLookup[def->allegiance]);
            unit = GetUnitFromCharId(def->charIndex);
        }
    }

    if (!unit)
    {
        unit = LoadUnit(def);

        if ((d == 1) && (def->allegiance == FACTION_ID_BLUE))
            unit->state |= US_BIT22;
    }
    else if (def->allegiance == FACTION_ID_BLUE)
    {
        s8 x, y;

        unit->state &= ~US_UNSELECTABLE;

        if (d == 1)
        {
            if (unit->state & US_DEAD)
                unit->state |= US_BIT22;
        }
        else
        {
            if (unit->state & US_BIT22)
                unit->state &= ~US_BIT22;
        }

        GenUnitDefinitionFinalPosition(def, &x, &y, 0);

        if (unit->xPos == x && unit->yPos == y)
            b &= ~0x0001;
    }

    unit->xPos = def->xPosition;
    unit->yPos = def->yPosition;

    if (def->allegiance == FACTION_ID_RED && unit->pCharacterData->number >= 0x3C)
    {
        if (!gPlaySt.config.controller)
        {
            if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
                UnitApplyBonusLevels(unit, -GetROMChapterStruct(gPlaySt.chapterIndex)->easyModeLevelMalus);
            else
                goto hard_mode;
        }
        else
        {
            if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
            hard_mode:
                UnitApplyBonusLevels(unit, GetROMChapterStruct(gPlaySt.chapterIndex)->difficultModeLevelBonus);
            else
                UnitApplyBonusLevels(unit, -GetROMChapterStruct(gPlaySt.chapterIndex)->normalModeLevelMalus);
        }
    }

    sub_800F8A8(unit, def, b, quiet);
}

//! FE8U = 0x0800F8A8
void sub_800F8A8(struct Unit * unit, const struct UnitDefinition * unitDefition, u16 flags, s8 unk)
{
    if (!unit)
        return;

    if (unitDefition->sumFlag == 1)
        flags |= 0x0002;

    if (!unitDefition->redaCount)
    {
        MoveUnit_(unit, unitDefition->xPosition, unitDefition->yPosition, flags);
        return;
    }

    if (unk == 1 || (unit->state & US_UNDER_A_ROOF))
        sub_8079FA8(unit, unitDefition->redas, unitDefition->redaCount, flags);
    else
        MuCtr_StartDefinedMove(unit, unitDefition->redas, unitDefition->redaCount, flags);
}

#if NONMATCHING

/* https://decomp.me/scratch/IyKOH */

//! FE8U = 0x0800F914
struct UnitDefinition * sub_800F914(struct UnitDefinition * source, short count, u8 arg2, s8 arg3, s8 arg4)
{
    u8  array[0x40];
    u16 r;
    u16 i;
    u16 arraySize;
    const struct UnitDefinition * itSource;
    struct
    {
        unsigned loBits, hiBits;
    } mask;

    arraySize = 0;
    i = 0;
    if (arg2)
    {
        itSource = source;
        ++i; --i;
        for (; i < count; i++)
        {
            if (itSource->sumFlag)
            {
                array[arraySize] = i;
                arraySize++;
            }

            itSource++;
        }

        i = Div((arraySize * arg2) + 50, 100);
    }

#define MASK_BIT_GET(i) (((i) < 0x20) ? (mask.loBits & (1 << (i))) : (mask.hiBits & (1 << ((i)-0x20))))
#define MASK_BIT_SET(i) (((i) < 0x20) ? (mask.loBits |= (1 << (i))) : (mask.hiBits |= (1 << ((i)-0x20))))

    mask.loBits = 0;
    mask.hiBits = 0;

    while (i)
    {
        r = NextRN_N(arraySize);
        r = array[r];

        if (!MASK_BIT_GET(r))
        {
            MASK_BIT_SET(r);
            i--;
        }
    }
    itSource = source;
    source = gLoadUnitBuffer;

    for (i = 0; i < count; i++)
    {
        if (!MASK_BIT_GET(i))
        {
            *source = itSource[i];
            source->sumFlag = FALSE;
            source++;
        }
    }

    for (i = 0; i < count; i++)
    {
        if (MASK_BIT_GET(i))
        {
            *source = itSource[i];
            source->sumFlag = TRUE;
            source++;
        }
    }

    source->charIndex = 0; // marks the end of the unit block

    if (arg4 == TRUE)
    {
        source = gLoadUnitBuffer;

        for (i = 0; i < count; i++)
        {
            source->redaCount = 0;
            source->redas     = NULL;
            source++;
        }
    }

    source = gLoadUnitBuffer;

    if (arg3 == TRUE)
        sub_80125C0(source);

#undef MASK_BIT_GET
#undef MASK_BIT_SET

    return source;
}

#else // #if !NONMATCHING

__attribute__((naked))
struct UnitDefinition * sub_800F914(struct UnitDefinition * source, short count, u8 arg2, s8 arg3, s8 arg4)
{
    asm(".syntax unified\n"

        "push {r4, r5, r6, r7, lr}\n"
        "mov r7, sl\n"
        "mov r6, r9\n"
        "mov r5, r8\n"
        "push {r5, r6, r7}\n"
        "sub sp, #0x60\n"
        "adds r6, r0, #0\n"
        "ldr r0, [sp, #0x80]\n"
        "lsls r1, r1, #0x10\n"
        "lsrs r1, r1, #0x10\n"
        "mov sl, r1\n"
        "lsls r2, r2, #0x18\n"
        "lsrs r2, r2, #0x18\n"
        "mov ip, r2\n"
        "lsls r3, r3, #0x18\n"
        "lsrs r3, r3, #0x18\n"
        "str r3, [sp, #0x40]\n"
        "lsls r0, r0, #0x18\n"
        "lsrs r0, r0, #0x18\n"
        "str r0, [sp, #0x44]\n"
        "movs r0, #0\n"
        "mov r8, r0\n"
        "movs r3, #0\n"
        "cmp r2, #0\n"
        "beq _0800F994\n"
        "str r6, [sp, #0x54]\n"
        "lsls r0, r1, #0x10\n"
        "asrs r0, r0, #0x10\n"
        "cmp r3, r0\n"
        "bge _0800F982\n"
        "movs r1, #0x40\n"
        "mov r9, r1\n"
        "adds r7, r0, #0\n"
    "_0800F956:\n"
        "ldr r2, [sp, #0x54]\n"
        "ldrb r1, [r2, #5]\n"
        "mov r0, r9\n"
        "ands r0, r1\n"
        "cmp r0, #0\n"
        "beq _0800F972\n"
        "mov r0, sp\n"
        "add r0, r8\n"
        "strb r3, [r0]\n"
        "mov r0, r8\n"
        "adds r0, #1\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r0, r0, #0x10\n"
        "mov r8, r0\n"
    "_0800F972:\n"
        "ldr r4, [sp, #0x54]\n"
        "adds r4, #0x14\n"
        "str r4, [sp, #0x54]\n"
        "adds r0, r3, #1\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r3, r0, #0x10\n"
        "cmp r3, r7\n"
        "blt _0800F956\n"
    "_0800F982:\n"
        "mov r5, ip\n"
        "mov r0, r8\n"
        "muls r0, r5, r0\n"
        "adds r0, #0x32\n"
        "movs r1, #0x64\n"
        "bl Div\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r3, r0, #0x10\n"
    "_0800F994:\n"
        "movs r0, #0\n"
        "str r0, [sp, #0x58]\n"
        "str r0, [sp, #0x5c]\n"
        "mov r1, sl\n"
        "lsls r1, r1, #0x10\n"
        "mov r9, r1\n"
        "ldr r2, [sp, #0x44]\n"
        "lsls r2, r2, #0x18\n"
        "str r2, [sp, #0x4c]\n"
        "ldr r4, [sp, #0x40]\n"
        "lsls r4, r4, #0x18\n"
        "str r4, [sp, #0x48]\n"
        "cmp r3, #0\n"
        "beq _0800FA0C\n"
        "movs r7, #1\n"
    "_0800F9B2:\n"
        "mov r0, r8\n"
        "str r3, [sp, #0x50]\n"
        "bl NextRN_N\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r2, r0, #0x10\n"
        "mov r5, sp\n"
        "adds r0, r5, r2\n"
        "ldrb r2, [r0]\n"
        "ldr r3, [sp, #0x50]\n"
        "cmp r2, #0x1f\n"
        "bhi _0800F9D4\n"
        "adds r0, r7, #0\n"
        "lsls r0, r2\n"
        "ldr r1, [sp, #0x58]\n"
        "ands r0, r1\n"
        "b _0800F9E0\n"
    "_0800F9D4:\n"
        "adds r1, r2, #0\n"
        "subs r1, #0x20\n"
        "adds r0, r7, #0\n"
        "lsls r0, r1\n"
        "ldr r4, [sp, #0x5c]\n"
        "ands r0, r4\n"
    "_0800F9E0:\n"
        "cmp r0, #0\n"
        "bne _0800FA08\n"
        "cmp r2, #0x1f\n"
        "bhi _0800F9F4\n"
        "adds r0, r7, #0\n"
        "lsls r0, r2\n"
        "ldr r5, [sp, #0x58]\n"
        "orrs r5, r0\n"
        "str r5, [sp, #0x58]\n"
        "b _0800FA02\n"
    "_0800F9F4:\n"
        "adds r1, r2, #0\n"
        "subs r1, #0x20\n"
        "adds r0, r7, #0\n"
        "lsls r0, r1\n"
        "ldr r1, [sp, #0x5c]\n"
        "orrs r1, r0\n"
        "str r1, [sp, #0x5c]\n"
    "_0800FA02:\n"
        "subs r0, r3, #1\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r3, r0, #0x10\n"
    "_0800FA08:\n"
        "cmp r3, #0\n"
        "bne _0800F9B2\n"
    "_0800FA0C:\n"
        "str r6, [sp, #0x54]\n"
        "ldr r6, _0800FA34\n" // end
        "movs r3, #0\n"
        "mov r2, r9\n"
        "asrs r0, r2, #0x10\n"
        "mov ip, r6\n"
        "cmp r3, r0\n"
        "bge _0800FA70\n"
        "movs r4, #0x41\n"
        "negs r4, r4\n"
        "mov sl, r4\n"
        "mov r8, r0\n"
    "_0800FA24:\n"
        "cmp r3, #0x1f\n"
        "bhi _0800FA38\n"
        "movs r0, #1\n"
        "lsls r0, r3\n"
        "ldr r5, [sp, #0x58]\n"
        "ands r0, r5\n"
        "b _0800FA44\n"
        ".align 2, 0\n"
    "_0800FA34: .4byte gLoadUnitBuffer\n"
    "_0800FA38:\n"
        "adds r1, r3, #0\n"
        "subs r1, #0x20\n"
        "movs r0, #1\n"
        "lsls r0, r1\n"
        "ldr r1, [sp, #0x5c]\n"
        "ands r0, r1\n"
    "_0800FA44:\n"
        "cmp r0, #0\n"
        "bne _0800FA66\n"
        "lsls r0, r3, #2\n"
        "adds r0, r0, r3\n"
        "lsls r0, r0, #2\n"
        "adds r1, r6, #0\n"
        "ldr r2, [sp, #0x54]\n"
        "adds r0, r0, r2\n"
        "ldm r0!, {r2, r4, r5}\n"
        "stm r1!, {r2, r4, r5}\n"
        "ldm r0!, {r4, r5}\n"
        "stm r1!, {r4, r5}\n"
        "ldrb r1, [r6, #5]\n"
        "mov r0, sl\n"
        "ands r0, r1\n"
        "strb r0, [r6, #5]\n"
        "adds r6, #0x14\n"
    "_0800FA66:\n"
        "adds r0, r3, #1\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r3, r0, #0x10\n"
        "cmp r3, r8\n"
        "blt _0800FA24\n"
    "_0800FA70:\n"
        "movs r3, #0\n"
        "mov r1, r9\n"
        "asrs r0, r1, #0x10\n"
        "cmp r3, r0\n"
        "bge _0800FACA\n"
        "movs r2, #1\n"
        "mov sl, r2\n"
        "mov r8, r0\n"
    "_0800FA80:\n"
        "cmp r3, #0x1f\n"
        "bhi _0800FA92\n"
        "mov r0, sl\n"
        "lsls r0, r3\n"
        "ldr r4, [sp, #0x58]\n"
        "ands r0, r4\n"
        "cmp r0, #0\n"
        "bne _0800FAA2\n"
        "b _0800FAC0\n"
    "_0800FA92:\n"
        "adds r1, r3, #0\n"
        "subs r1, #0x20\n"
        "mov r0, sl\n"
        "lsls r0, r1\n"
        "ldr r5, [sp, #0x5c]\n"
        "ands r0, r5\n"
        "cmp r0, #0\n"
        "beq _0800FAC0\n"
    "_0800FAA2:\n"
        "lsls r0, r3, #2\n"
        "adds r0, r0, r3\n"
        "lsls r0, r0, #2\n"
        "adds r1, r6, #0\n"
        "ldr r2, [sp, #0x54]\n"
        "adds r0, r0, r2\n"
        "ldm r0!, {r2, r4, r5}\n"
        "stm r1!, {r2, r4, r5}\n"
        "ldm r0!, {r4, r5}\n"
        "stm r1!, {r4, r5}\n"
        "ldrb r0, [r6, #5]\n"
        "movs r1, #0x40\n"
        "orrs r0, r1\n"
        "strb r0, [r6, #5]\n"
        "adds r6, #0x14\n"
    "_0800FAC0:\n"
        "adds r0, r3, #1\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r3, r0, #0x10\n"
        "cmp r3, r8\n"
        "blt _0800FA80\n"
    "_0800FACA:\n"
        "movs r0, #0\n"
        "strb r0, [r6]\n"
        "ldr r1, [sp, #0x4c]\n"
        "asrs r0, r1, #0x18\n"
        "cmp r0, #1\n"
        "bne _0800FAF6\n"
        "mov r6, ip\n"
        "movs r3, #0\n"
        "mov r2, r9\n"
        "asrs r0, r2, #0x10\n"
        "cmp r3, r0\n"
        "bge _0800FAF6\n"
        "movs r2, #0\n"
        "adds r1, r0, #0\n"
    "_0800FAE6:\n"
        "strb r2, [r6, #7]\n"
        "str r2, [r6, #8]\n"
        "adds r6, #0x14\n"
        "adds r0, r3, #1\n"
        "lsls r0, r0, #0x10\n"
        "lsrs r3, r0, #0x10\n"
        "cmp r3, r1\n"
        "blt _0800FAE6\n"
    "_0800FAF6:\n"
        "mov r6, ip\n"
        "ldr r4, [sp, #0x48]\n"
        "asrs r0, r4, #0x18\n"
        "cmp r0, #1\n"
        "bne _0800FB06\n"
        "adds r0, r6, #0\n"
        "bl sub_80125C0\n"
    "_0800FB06:\n"
        "adds r0, r6, #0\n"
        "add sp, #0x60\n"
        "pop {r3, r4, r5}\n"
        "mov r8, r3\n"
        "mov r9, r4\n"
        "mov sl, r5\n"
        "pop {r4, r5, r6, r7}\n"
        "pop {r1}\n"
        "bx r1\n"

        ".syntax divided\n");
}

#endif // !NONMATCHING

//! FE8U = 0x0800FB18
u8 Event2B_(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (argument < 0)
        argument = gEventSlots[2];

    switch (subcode)
    {
        case 0:
        {
            proc->unitLoadCount = argument;
            break;
        }

        case 1:
        {
            if (argument < 0)
                argument = 0;

            if (argument > 100)
                argument = 100;

            proc->idk4E = argument;

            break;
        }

        case 2:
        {
            proc->unk4F_7 = TRUE;
            break;
        }

    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FB84
u8 Event2C_LoadUnits(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    u8 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    const struct UnitDefinition * ud = (const struct UnitDefinition *)EVT_CMD_ARG32_LE(proc->pEventCurrent);

    u16 count = proc->unitLoadCount;

    switch (subcode)
    {
        case 1:
            argument = 2;

        case 0:
        case 2:
            if ((int)(ud) < 0)
                ud = (const struct UnitDefinition *)(gEventSlots[2]);

            break;

        case 3:
            ud = GetChapterEnemyUnitDefinitions();

            break;

    } // switch (subcode)

    if (count == 0)
        count = sub_800F50C(ud);

    ud = sub_800F914((void *)ud, count, proc->idk4E, subcode == 2, proc->unk4F_7);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
    {
        sub_800F698(ud, count, argument);

        proc->unitLoadCount = 0;
        proc->idk4E = 0;
    }
    else
    {
        proc->pUnitLoadData = ud;
        proc->unitLoadCount = count;
        proc->unitLoadParameter = argument;

        proc->pCallback = sub_800F5B8;
        proc->pCallback(proc);
    }

    proc->unk4F_7 = FALSE;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800FC90
u8 TryPrepareEventUnitMovement(struct EventEngineProc * proc, int x, int y)
{
    if (proc->evStateBits & EV_STATE_UNITCAM)
    {
        if (Proc_Find(gProcScr_CamMove))
            return FALSE; // Camera proc already exists

        if (EnsureCameraOntoPosition(proc, x, y))
            return FALSE; // Failed to start camera movement
    }

    if (!MU_CanStart())
        return FALSE; // No room to make MU for the moving unit

    return TRUE; // Yay!
}

//! FE8U = 0x0800FCD8
u32 GetSomeEventEngineMoveRelatedBitfield(struct EventEngineProc * proc, s8 unk)
{
    u16 result = 0;

    // TODO: use some enum constants

    if (unk == TRUE)
        result = 1;

    if (proc->evStateBits & EV_STATE_UNITCAM)
        result = result | 4;

    if (proc->evStateBits & EV_STATE_0040)
        result = result | 8;

    return result;
}

//! FE8U = 0x0800FD0C
u8 Event2D_(struct EventEngineProc * proc)
{
    u16 palId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    sub_800BCDC(palId);
    proc->mapSpritePalIdOverride = palId;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FD28
u8 Event2E_CheckAt(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    u8 x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    struct Unit * unit;

    switch (subcode)
    {
        case 0:
            if (gBmMapUnit[y][x] != 0)
            {
                unit = GetUnit(gBmMapUnit[y][x]);
            }
            else
            {
                goto _0800FD68;
            }

            break;

        case 1:
            unit = gActiveUnit;
            break;
    }

    if (!unit)
    {
    _0800FD68:
        gEventSlots[0xC] = 0;
    }
    else
    {
        gEventSlots[0xC] = unit->pCharacterData->number;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FD8C
u8 Event2F_MoveUnit(struct EventEngineProc * proc)
{
    s8 xIn;
    s8 yIn;
    u8 subcmd;
    s8 subHi;
    s16 speed;
    u16 direction;
    u16 flags;
    struct Unit * unit;
    struct Unit * targetUnit;
    s16 targetPid;
    s8 xOut;
    s8 yOut;
    void * queue;

    subcmd = EVT_SUB_CMD_LO(proc->pEventCurrent);
    subHi = EVT_SUB_CMD_HI(proc->pEventCurrent);

    speed = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[1]);
    if (!unit)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    xIn = unit->xPos;
    yIn = unit->yPos;

    if (!(unit->state & US_BIT22))
    {
        if (unit->state & US_DEAD)
        {
            return EVC_ADVANCE_CONTINUE;
        }
    }

    switch (subcmd)
    {
        case 0:
            xOut = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            yOut = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;

            queue = NULL;

            break;

        case 1:
            targetPid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            if (targetPid < 0)
            {
                targetPid = 0;
            }

            targetUnit = GetUnitStructFromEventParameter(targetPid);
            if (!targetUnit)
            {
                return EVC_ERROR;
            }

            xOut = targetUnit->xPos;
            yOut = targetUnit->yPos;

            queue = NULL;

            break;

        case 2:
            direction = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            xOut = xIn;
            yOut = yIn;

            switch (direction)
            {
                case 3:
                    yOut--;
                    break;

                case 2:
                    yOut++;
                    break;

                case 0:
                    xOut--;
                    break;

                case 1:
                    xOut++;
                    break;
            }

            queue = NULL;

            break;

        case 3:
            queue = gEventSlotQueue;
            break;
    }

    flags = GetSomeEventEngineMoveRelatedBitfield(proc, subHi);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(proc) || (speed < 0))
    {
        MoveUnit_(unit, xOut, yOut, flags);
        return EVC_ADVANCE_CONTINUE;
    }

    if (!TryPrepareEventUnitMovement(proc, xIn, yIn))
    {
        return EVC_STOP_YIELD;
    }

    if (queue == NULL)
    {
        MuCtr_StartMoveTowards(unit, xOut, yOut, speed, flags);
    }
    else
    {
        MuCtr_StartDefinedMove(unit, queue, gEventSlots[0xD] / 2, flags);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FF24
u8 Event30_ENUN(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        MU_AllForceSetMaxMoveSpeed_();
    }

    if (MuCtrExists() == 1)
    {
        return EVC_STOP_YIELD;
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();
    BmMapFill(gBmMapOther, 0);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800FF68
u8 Event31_DisplayEffectRange(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    switch (EVT_SUB_CMD(proc->pEventCurrent))
    {
        case 0:
            unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
            if (!unit)
            {
                return EVC_ERROR;
            }

            PlaySoundEffect(0x68);

            gLoadedUnitBuffer = gActiveUnit;
            gActiveUnit = unit;

            HideMoveRangeGraphics();
            DisplayUnitEffectRange(unit);

            break;

        case 1:
            HideMoveRangeGraphics();
            if (gLoadedUnitBuffer != 0)
            {
                gActiveUnit = gLoadedUnitBuffer;
                gLoadedUnitBuffer = NULL;
            }

            break;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800FFF8
u8 Event32_SpawnSingleUnit(struct EventEngineProc * proc)
{
    struct UnitDefinition unitDef;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    s8 x = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s8 y = EVT_CMD_ARGV(proc->pEventCurrent)[1] >> 8;

    if (pid == -3)
    {
        pid = gEventSlots[2];
    }

    if ((x < 0) || (y < 0))
    {
        x = ((s16 *)(gEventSlots + 0xB))[0];
        y = ((s16 *)(gEventSlots + 0xB))[1];
    }

    unitDef.charIndex = pid;
    unitDef.classIndex = gCharacterData[pid - 1].defaultClass;
    unitDef.leaderCharIndex = 0;

    unitDef.autolevel = 0;
    unitDef.allegiance = subcmd == 0xF ? 0 : subcmd;
    unitDef.level = gCharacterData[pid - 1].baseLevel;

    unitDef.xPosition = x;
    unitDef.yPosition = y;

    unitDef.genMonster = 0;

    unitDef.itemDrop = 1;
    unitDef.sumFlag = 0;
    unitDef.unk_05_7 = 0;
    unitDef.extraData = 0;

    unitDef.redaCount = 0;

    unitDef.redas = NULL;

    unitDef.items[0] = 0;
    unitDef.items[1] = 0;
    unitDef.items[2] = 0;
    unitDef.items[3] = 0;

    unitDef.ai[0] = 0;
    unitDef.ai[1] = 0;
    unitDef.ai[2] = 0;
    unitDef.ai[3] = 0;

    LoadUnit_800F704(&unitDef, 0, 0, subcmd == 0xf);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010110
u8 Event33_CheckUnitVarious(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    struct Unit * unit = GetUnitStructFromEventParameter(pid);

    switch (subcmd)
    {
        case 0:
            if (unit)
            {
                gEventSlots[0xC] = 1;
            }
            else
            {
                gEventSlots[0xC] = 0;
            }

            break;

        case 1:
            if (!unit)
            {
                return EVC_ERROR;
            }

            gEventSlots[0xC] = unit->pCharacterData->visit_group;

            break;

        case 2:
            if (!unit)
            {
                gEventSlots[0xC] = 0;
                break;
            }

            if (unit->state & US_DEAD)
            {
                gEventSlots[0xC] = 0;
            }
            else
            {
                gEventSlots[0xC] = 1;
            }

            break;

        case 3:
            if (!unit)
            {
                return EVC_ERROR;
            }

            if (unit->state & US_NOT_DEPLOYED)
            {
                gEventSlots[0xC] = 0;
            }
            else
            {
                if (unit->xPos >= 0)
                {
                    gEventSlots[0xC] = 1;
                }
                else
                {
                    gEventSlots[0xC] = 0;
                }
            }

            break;

        case 4:
            if (!unit)
            {
                return EVC_ERROR;
            }

            if (gActiveUnit->pCharacterData->number != pid)
            {
                gEventSlots[0xC] = 0;
            }
            else
            {
                gEventSlots[0xC] = 1;
            }

            break;

        case 5:
            if (!unit)
            {
                return EVC_ERROR;
            }

            switch (UNIT_FACTION(unit))
            {
                case FACTION_BLUE:
                    gEventSlots[0xC] = FACTION_ID_BLUE;
                    break;

                case FACTION_RED:
                    gEventSlots[0xC] = FACTION_ID_RED;
                    break;

                default:
                    gEventSlots[0xC] = FACTION_ID_GREEN;
                    break;
            }

            break;

        case 6:
            if (!unit)
            {
                return EVC_ERROR;
            }

            ((u16 *)(gEventSlots + 0xC))[0] = unit->xPos;
            ((u16 *)(gEventSlots + 0xC))[1] = unit->yPos;

            break;

        case 7:
            if (!unit)
            {
                return EVC_ERROR;
            }

            gEventSlots[0xC] = unit->pClassData->number;

            break;

        case 8:
            if (!unit)
            {
                return EVC_ERROR;
            }

            gEventSlots[0xC] = GetUnitLuck(unit);

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010298
u8 Event34_MessWithUnitState(struct EventEngineProc * proc)
{
    int i;

    const u8 allegianceLookup[3] = {
        [FACTION_ID_BLUE] = FACTION_BLUE,
        [FACTION_ID_GREEN] = FACTION_GREEN,
        [FACTION_ID_RED] = FACTION_RED,
    };

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);

    switch (subcmd)
    {
        case 0xa:
        case 0xb:
        case 0xc:
            break;

        case 0xd:
        case 0xe:
        case 0xf:
            if (!unit)
            {
                return EVC_ADVANCE_CONTINUE;
            }
            break;

        default:
            if (!unit)
            {
                return EVC_ERROR;
            }
            break;
    }

    switch (subcmd)
    {
        case 0:
            unit->state |= (US_HIDDEN | US_BIT16 | US_BIT26);
            break;

        case 1:
            unit->state &= ~(US_HIDDEN | US_BIT16 | US_BIT26);
            break;

        case 2:
        case 3:
        case 4:
            UnitChangeFaction(unit, allegianceLookup[subcmd - 2]);
            break;

        case 5:
            SetUnitHp(unit, gEventSlots[1]);
            if (gEventSlots[1] == 0)
            {
                unit->state |= US_DEAD;
            }

            break;

        case 6:
            unit->state |= US_UNSELECTABLE;
            break;

        case 7:
            unit->state |= US_HAS_MOVED;
            break;

        case 8:
            switch (gEventSlots[1])
            {
                case 1:
                    unit->state &= ~US_NOT_DEPLOYED;
                    break;

                case 0:
                    unit->state |= US_NOT_DEPLOYED;
                    break;

                case -1:
                    if (unit->state & US_BIT21)
                    {
                        unit->state |= US_NOT_DEPLOYED;
                    }
                    else
                    {
                        unit->state &= ~US_NOT_DEPLOYED;
                    }

                    break;
            }

            break;

        case 9:
            break;

        case 0xa:
            MU_EndAll();

            for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
            {
                struct Unit * it = GetUnit(i);

                if (!UNIT_IS_VALID(it))
                {
                    continue;
                }

                it->state |= US_HIDDEN;
                it->state &= ~US_UNSELECTABLE;
                it->state &= ~(US_RESCUING | US_RESCUED);
            }

            ClearCutsceneUnits();

            break;

        case 0xb:
            MU_EndAll();

            for (i = FACTION_GREEN + 1; i < FACTION_RED; i++)
            {
                struct Unit * it = GetUnit(i);

                if (!UNIT_IS_VALID(it))
                {
                    continue;
                }

                ClearUnit(it);
            }

            break;

        case 0xc:
            MU_EndAll();

            for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
            {
                struct Unit * it = GetUnit(i);

                if (!UNIT_IS_VALID(it))
                {
                    continue;
                }

                ClearUnit(it);
            }

            break;

        case 0xd:
            if (!EVENT_IS_SKIPPING(proc))
            {
                struct MUProc * muProc;

                HideUnitSprite(unit);
                unit->state |= US_HIDDEN;
                muProc = MU_Create(unit);
                MU_SetDefaultFacing_Auto();
                MU_StartDeathFade(muProc);

                return EVC_ADVANCE_YIELD;
            }

            return EVC_ADVANCE_CONTINUE;

        case 0xe:
        {
            s8 a = Proc_Find(gProcScr_MUDeathFade) != 0;
            if (-a | a)
            {
                return EVC_STOP_YIELD;
            }

            // fallthrough
        }

        case 0xf:
            ClearUnit(unit);
            break;
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x080104B0
u8 Event35_UnitClassChanging(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    switch (subcmd)
    {
        case 0:
            if (jid == 0)
            {
                jid = gCharacterData[pid - 1].defaultClass;
            }

            unit->pClassData = GetClassData(jid);

            break;

        case 1:
        {
            s16 r4 = jid;
            jid = unit->pClassData->number;

            unit->pClassData = GetClassData(gCharacterData[r4 - 1].defaultClass);

            unit = GetUnitFromCharId(r4);
            if (!unit)
            {
                return EVC_ADVANCE_CONTINUE;
            };

            unit->pClassData = GetClassData(jid);

            break;
        }
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0801053C
u8 Event36_CheckInArea(struct EventEngineProc * param_1)
{
    u16 pid;
    s8 x1, y1, x2, y2;
    u8 ret;
    struct Unit * unit;

    pid = EVT_CMD_ARGV(param_1->pEventCurrent)[0];

    x1 = EVT_CMD_ARGV(param_1->pEventCurrent)[1];
    y1 = EVT_CMD_ARGV(param_1->pEventCurrent)[1] >> 8;

    x2 = x1 + ((u16 *)EVT_CMD_ARGV(param_1->pEventCurrent))[2] - 1;
    y2 = y1 + (((u16 *)EVT_CMD_ARGV(param_1->pEventCurrent))[2] >> 8) - 1;

    unit = GetUnitStructFromEventParameter(pid);

    gEventSlots[0xc] = ret = 0;
    if (unit->xPos < x1)
        return ret;
    if (x2 >= unit->xPos && unit->yPos >= y1 && y2 >= unit->yPos)
        gEventSlots[0xc] = 1;

    ret = 0;
    return ret;
}

// TODO: Give this a more human name (EventCmd_GiveItem?)

//! FE8U = 0x080105A4
u8 Event37_GiveItem(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * target = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

    if (!target)
    {
        return EVC_ERROR;
    }

    switch (subcmd)
    {
        case 0:
            NewPopup_ItemGot(proc, target, gEventSlots[3]);

            break;

        case 1:
            NewPopup_GoldGot(proc, target, gEventSlots[3]);

            break;

        case 2:
        {
            s32 gold = GetPartyGoldAmount() - gEventSlots[3];
            if (gold < 0)
            {
                gold = 0;
            }
            SetPartyGoldAmount(gold);

            break;
        }
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010618
u8 Event38_ChangeActiveUnit(struct EventEngineProc * proc)
{
    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);

    if (!unit)
    {
        return EVC_ERROR;
    }

    ClearActiveUnit(unit);
    gActiveUnit = unit;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010644
u8 Event39_ChangeAiScript(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    u8 ai1 = gEventSlots[1];
    u8 ai2 = (gEventSlots[1] >> 8);
    u8 unused = (gEventSlots[1] >> 16);

    switch (subcmd)
    {
        case 0:
        {
            u16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];

            if (EVT_CMD_ARGV(proc->pEventCurrent)[0] < 0)
            {
                pid = gEventSlots[2];
            }

            ChangeAiForCharacter(pid, ai1, ai2, unused);

            break;
        }
        case 1:
        {
            struct Unit * unit;

            s8 x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            s8 y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if (x < 0 || y < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            if (gBmMapUnit[y][x] != 0)
            {
                unit = GetUnit(gBmMapUnit[y][x]);
            }
            else
            {
                unit = NULL;
            }

            ChangeUnitAi(unit, ai1, ai2, unused);

            break;
        }
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x080106E4
u8 Event3A_DisplayPopup(struct EventEngineProc * proc)
{
    s16 textId;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    textId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (textId < 0)
    {
        textId = gEventSlots[2];
    }

    switch (subcmd)
    {
        case 0:
        {
            u16 songId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            NewPopup_VerySimple(textId, songId, proc);
            break;
        }

        case 1:
        {
            s8 x = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            s8 y = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;
            StartBrownTextBox(textId, x, y, proc);
            break;
        }
    }

    return EVC_ADVANCE_YIELD;
}

struct MapCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ u16 unk_68;
    /* 6A */ u16 unk_6a;
};

// Implicit?
u16 sub_8010E6C(int x, int y, int counter);

//! FE8U = 0x08010748
void sub_8010748(struct MapCursorProc * proc)
{
    switch (proc->unk_68 & 0xc)
    {
        case 0:
            PutMapCursor(proc->unk_64 * 16, proc->unk_66 * 16, 0);
            break;

        case 4:
            proc->unk_6a = sub_8010E6C(proc->unk_64, proc->unk_66, proc->unk_6a);
            break;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591F00[] =
{
    PROC_END,
};

// clang-format on

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591F08[] =
{
    PROC_REPEAT(sub_8010748),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0801079C
u8 Event3B_DisplayCursor(struct EventEngineProc * proc)
{
    struct MapCursorProc * childProc;
    struct Unit * unit;
    u8 subcmd;
    s8 x;
    s8 y;

    if (EVENT_IS_SKIPPING(proc))
    {
        Proc_EndEach(gUnknown_08591F08);
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd & 3)
    {
        case 0:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if (x < 0 || y < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            break;

        case 1:
            unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
            if (!unit)
            {
                return EVC_ERROR;
            }

            x = unit->xPos;
            y = unit->yPos;

            break;

        case 2:
            Proc_EndEach(gUnknown_08591F08);
            return EVC_ADVANCE_YIELD;
    }

    childProc = Proc_Start(gUnknown_08591F08, proc);
    childProc->unk_64 = x;
    childProc->unk_66 = y;
    childProc->unk_68 = subcmd;
    childProc->unk_6a = 0;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010850
u8 Event3C_(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;

    switch (EVT_SUB_CMD(proc->pEventCurrent))
    {
        case 0:
            ((u16 *)(gEventSlots + 0xC))[0] = gBmSt.playerCursor.x;
            ((u16 *)(gEventSlots + 0xC))[1] = gBmSt.playerCursor.y;

            break;

        case 1:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if ((x < 0) || (y < 0))
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            SetCursorMapPosition(x, y);

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

int Get8(void);

//! FE8U = 0x080108AC
u8 Event3D_(struct EventEngineProc * proc)
{
    u8 i;
    u16 bit;

    // clang-format off

    u8 gUnknown_080D793F[15] =
    {
        0x4F, 0x51, 0x6B, 0x63, 0x64,
        0x5C, 0x5A, 0x67, 0x37, 0x68,
        0x69, 0x5B, 0x5F, 0x71, 0x78,
    };

    u8 gUnknown_080D794E[5] =
    {
        0x49, 0x4A, 0x4B, 0x4C, 0x4D,
    };

    // clang-format on

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 flags = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    ResetMenuOverrides();

    bit = 1;

    switch (subcmd)
    {
        case 0:
            for (i = 0; i < ARRAY_COUNT(gUnknown_080D793F); i++)
            {
                if (flags & bit)
                {
                    AddMenuOverride(gUnknown_080D793F[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysNotShown);
                }

                bit <<= 1;
            }

            break;

        case 1:
            for (i = 0; i < ARRAY_COUNT(gUnknown_080D794E); i++)
            {
                if (flags & bit)
                {
                    AddMenuOverride(gUnknown_080D794E[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysDisabled);
                    AddMenuOverride(gUnknown_080D794E[i], MENU_OVERRIDE_ONSELECT, Get8);
                }

                bit <<= 1;
            }

            break;

        case 2:
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010968
u8 Event3E_PrepScreenCall(struct EventEngineProc * proc)
{
    HideAllUnits();
    ClearFlag(0x84);
    Proc_StartBlocking(gProcScr_SALLYCURSOR, proc);

    return EVC_ADVANCE_YIELD;
}

extern struct BattleHit gUnknown_0203A974[];

//! FE8U = 0x0801098C
struct BattleHit * sub_801098C(void)
{
    u8 i;

    u32 * queueIt = gEventSlotQueue;
    struct BattleHit * bhIt = gUnknown_0203A974;

    for (i = 0; i < gEventSlots[0xd] && ((u8 *)(queueIt))[0] != 0xff; bhIt++, queueIt++, i++)
    {
        bhIt->attributes = ((u16 *)(queueIt))[1];

        bhIt->info = 0;

        if (i == 0)
        {
            bhIt->info |= BATTLE_HIT_INFO_BEGIN;
        }

        if (((u8 *)(queueIt))[0] == 1)
        {
            bhIt->info |= BATTLE_HIT_INFO_RETALIATION;
        }

        bhIt->hpChange = ((u8 *)(queueIt))[1];
    }

    bhIt->info = BATTLE_HIT_INFO_END;

    return gUnknown_0203A974;
}

//! FE8U = 0x08010A28
void ScriptBattleDeamon(struct ScriptedBattleProc * proc)
{
    if (proc->lock == GetGameLock())
    {
        EventBattleReloadBmStatus();
        Proc_SetMark(proc->evtproc, PROC_MARK_6);
        Proc_Break(proc);
    }
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ScriptBattleDeamon[] =
{
    PROC_REPEAT(ScriptBattleDeamon),
    PROC_END,
};

// clang-format on

/* Script battle */
u8 Event3F_(struct EventEngineProc * proc)
{
    struct BattleHit * hits;
    struct ScriptedBattleProc * childProc;
    struct Unit * unitA;
    struct Unit * unitB;
    s8 scriptted;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 charIdA = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 charIdB = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u8 weaponId = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u8 isBallista = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;

    if (gEventSlots[0xd] == 0)
    {
        hits = NULL;
    }
    else
    {
        hits = sub_801098C();
    }

    switch (subcmd)
    {
        case 0:
        case 1:
            if (charIdA < 0)
            {
                charIdA = -2;
            }

            if (charIdB < 0)
            {
                charIdB = -2;
            }

            unitA = GetUnitStructFromEventParameter(charIdA);
            unitB = GetUnitStructFromEventParameter(charIdB);

            if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            {
                scriptted = 0;
            }
            else
            {
                scriptted = 1;
                childProc = Proc_StartBlocking(ProcScr_ScriptBattleDeamon, proc);
                childProc->evtproc = proc;
                childProc->lock = GetGameLock();
                Proc_SetMark(proc, PROC_MARK_7);
            }

            StartEventBattle(unitA, unitB, isBallista, scriptted, weaponId, hits, -subcmd || subcmd);

            return EVC_ADVANCE_YIELD;

        case 2:
            SetScriptedBattle(hits);
            return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ERROR;
}

struct Event40Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * unk_58;
    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 unk_64;
};

//! FE8U = 0x08010B48
void sub_8010B48(struct Event40Proc * proc)
{
    if (proc->unk_64 == GetGameLock())
    {
        sub_8012324();
        Proc_SetMark(proc->unk_58, PROC_MARK_6);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591F28[] =
{
    PROC_REPEAT(sub_8010B48),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08010B78
u8 Event40_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 itemId = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    struct Event40Proc * childProc = Proc_StartBlocking(gUnknown_08591F28, proc);
    childProc->unk_58 = proc;
    childProc->unk_64 = GetGameLock();

    Proc_SetMark(proc, PROC_MARK_7);

    unit = GetUnitStructFromEventParameter(pid);
    SetUnitStatus(unit, 0);
    sub_8012270(unit, jid, itemId);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010BEC
u8 Event41_(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd)
    {
        case 0:
        case 1:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0];

            if (x < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            if (!(proc->evStateBits & EV_STATE_0040))
            {
                StartEventWarpAnim_ret(proc, x, y, subcmd, 1);
            }
            else
            {
                StartEventWarpAnim_ret(proc, x, y, subcmd, 0);
            }

            break;

        case 0xf:
            if (EventWarpAnimExists_ret() == 1)
            {
                return EVC_STOP_YIELD;
            }

            break;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010C70
u8 Event42_(struct EventEngineProc * proc)
{
    u8 c;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u8 a = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 b = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    switch (subcmd)
    {
        case 0:
            if (EVENT_IS_SKIPPING(proc))
            {
                return EVC_ADVANCE_CONTINUE;
            }

            switch (proc->activeTextType)
            {
                case 0:
                case 3:
                case 4:
                    subcmd = 0;
                    break;

                case 1:
                    subcmd = 1;
                    break;

                case 2:
                case 5:
                    return EVC_ERROR;
            }

            sub_8012C34(subcmd, a, b);

            break;

        case 0xf:
            sub_8012C88();
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010CF0
u8 Event43_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    sub_8080E9C(proc, unit);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010D28
u8 Event44_BreakingSacredStone(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    StartStoneShatterAnim(unit, proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010D5C
u8 Event45_(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    switch (subcmd)
    {
        case 0:
            if (!EVENT_IS_SKIPPING(proc))
            {
                sub_8081020(proc, unit);
            }

            break;

        case 0xf:
            if (!EVENT_IS_SKIPPING(proc))
            {
                sub_80811D0(proc, 0x78);
                return EVC_ADVANCE_YIELD;
            }

            sub_8081068();

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}
