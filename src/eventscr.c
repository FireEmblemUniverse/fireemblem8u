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
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"

void BgChangeChr(int, int);

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
                gEventActiveQueue[i].evt1 = NULL;
                gEventActiveQueue[i].evt2 = NULL;
            }
        }

        if (gEventActiveQueue[0].evt1 != NULL)
        {
            proc->pEventIdk = gEventActiveQueue[0].evt1;
            proc->pEventCurrent = gEventActiveQueue[0].evt2;

            for (i = 0; i < 7; i++)
            {
                gEventActiveQueue[i].evt1 = gEventActiveQueue[i + 1].evt1;
                gEventActiveQueue[i].evt2 = gEventActiveQueue[i + 1].evt2;
            }

            gEventActiveQueue[i].evt1 = NULL;
            gEventActiveQueue[i].evt2 = NULL;
            return EVC_ADVANCE_CONTINUE;
        }

        switch (proc->execType) {
            case EV_EXEC_WORLDMAP:
                proc->execType = EV_EXEC_UNK4;
                return EVC_END;

            case EV_EXEC_CUTSCENE:
                proc->evStateBits &= ~EV_STATE_SKIPPING;
                proc->evStateBits |= EV_STATE_NOSKIP;

                proc->execType = EV_EXEC_UNK5;

                proc->pEventIdk = (u16 *)EventScr_08592114;
                proc->pEventCurrent = (u16 *)EventScr_08592114;

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

    switch (sub_cmd) {
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

    switch (sub_cmd) {
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

    switch (sub_cmd) {
    case EVSUBCMD_SENQUEUE:
        slot = EVT_CMD_ARGV(scr)[0];
        SlotQueuePush(gEventSlots[slot]);
        break;

    case EVSUBCMD_SENQUEUE_S1:
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
        gEventActiveQueue[i].evt1 = gEventActiveQueue[i - 1].evt1;
        gEventActiveQueue[i].evt2 = gEventActiveQueue[i - 1].evt2;
    }

    gEventActiveQueue[0].evt1 = proc->pEventIdk;
    gEventActiveQueue[0].evt2 = proc->pEventCurrent;

    proc->pEventIdk = (const u16 *)dst;
    proc->pEventCurrent = (const u16 *)dst;
    return EVC_UNK4;
}

//! FE8U = 0x0800DA2C
u8 Event0B_EnqueueCall(struct EventEngineProc * proc)
{
    int sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 exec_type = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    uintptr_t ptr = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if ((int)ptr < 0)
        ptr = gEventSlots[0x02];

    if (ptr != 0)
    {
        switch (sub_cmd) {
        case 0:
            CallEvent((const u16 *)ptr, proc->execType);
            break;

        case 1:
            EnqueueTutEvent(ptr, exec_type);
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

    switch (sub_cmd) {
    case EVSUBCMD_BEQ:
        if (val1 == val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BNE:
        if (val1 != val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BGE:
        if (val1 >= val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BGT:
        if (val1 > val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BLE:
        if (val1 <= val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BLT:
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
u8 Event0F_CounterOps(struct EventEngineProc * proc)
{
    do
    {
        s8 newValue;
        u8 subcode   = EVT_SUB_CMD(proc->pEventCurrent);
        u32 argument = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[0];
        u32 shift    = 4 * (*(const u8*)(proc->pEventCurrent + 1) % 8);

        switch (subcode)
        {
        case EVSUBCMD_COUNTER_CHECK: // Check
            gEventSlots[0xC] = (gEventSlotCounter >> shift) & 0xF;

            return EVC_ADVANCE_CONTINUE;

        case EVSUBCMD_COUNTER_SET: // Set
            newValue = (u16)argument >> 8;
            break;

        case EVSUBCMD_COUNTER_INC: // Increment
            newValue = ((gEventSlotCounter >> shift) & 0xF) + 1;

            if (newValue > 0xF)
                newValue = 0xF;

            break;

        case EVSUBCMD_COUNTER_DEC: // Decrement
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

    switch (evArgument) {
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

u8 Event12_StartBGM(struct EventEngineProc * proc)
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

u8 Event13_BgmFadeIn(struct EventEngineProc * proc)
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
u8 Event14_BgmOverideRestore(struct EventEngineProc * proc)
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

u8 Event15_BgmVolume(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcode) {
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

u8 Event17_Fade(struct EventEngineProc * proc)
{
    u8 subcode;
    u16 evArgument;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    subcode = EVT_SUB_CMD(proc->pEventCurrent);
    evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (subcode) {
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
u8 Event18_ColorFade(struct EventEngineProc * proc)
{
    u32 mask;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    u8 start = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 size  = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    u16 speed = proc->pEventCurrent[2];
    u16 r = proc->pEventCurrent[3];
    u16 g = proc->pEventCurrent[4];
    u16 b = proc->pEventCurrent[5];

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
                speed = 0;

            mask = 0;

            for (i = size; i > 0; --i)
            {
                s8 tmp = start;
                mask = mask | (1 << tmp);
                start = tmp + 1;
            }

            NewEventFadefx(speed, mask, r, g, b, proc);

            return EVC_ADVANCE_YIELD;
        }

        default:
            return EVC_ERROR;

    } // switch (subcode)
}


u8 Event19_Checks(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    switch (subcode) {
    case EVSUBCMD_CHECK_MODE: // Check Mode
        gEventSlots[0xC] = gPlaySt.chapterModeIndex;
        break;

    case EVSUBCMD_CHECK_CHAPTER_NUMBER: // Check (Next?) Chapter Index
        gEventSlots[0xC] = proc->chapterIndex;
        break;

    case EVSUBCMD_CHECK_HARD: // Check Difficult Mode
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            gEventSlots[0xC] = FALSE;
        else
            gEventSlots[0xC] = TRUE;

        break;

    case EVSUBCMD_CHECK_TURNS: // Check Turn Number
        gEventSlots[0xC] = gPlaySt.chapterTurnNumber;
        break;

    case EVSUBCMD_CHECK_ENEMIES: // Check Red Unit Count
        gEventSlots[0xC] = CountRedUnits();
        break;

    case EVSUBCMD_CHECK_OTHERS: // Check Green Unit Count
        gEventSlots[0xC] = CountGreenUnits();
        break;

    case EVSUBCMD_CHECK_SKIRMISH: // Check Chapter Type?
        gEventSlots[0xC] = GetBattleMapKind();
        break;

    case EVSUBCMD_CHECK_TUTORIAL: // Check Some option or difficult mode
        if (gPlaySt.config.controller || (gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            gEventSlots[0xC] = FALSE;
        else
            gEventSlots[0xC] = TRUE;

        break;

    case EVSUBCMD_CHECK_MONEY: // Check gold
        gEventSlots[0xC] = GetPartyGoldAmount();
        break;

    case EVSUBCMD_19CHECK_EVENTID: // Check Event Trigger ID
        gEventSlots[0xC] = GetEventTriggerId(proc->pEventStart);
        break;

    case EVSUBCMD_CHECK_POSTGAME: // Check Game Complete
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

    if (subcode != proc->activeTextType && subcode != EVSUBCMD_0x1A25)
    {
        EndTalk();
        EndCgText();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        sub_800E640(proc);
    }

    proc->activeTextType = subcode;

    switch (subcode) {
    case EVSUBCMD_TEXTSTART:
    case EVSUBCMD_TUTORIALTEXTBOXSTART:
    case EVSUBCMD_SOLOTEXTBOXSTART:
    case EVSUBCMD_0x1A25:
        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_REMOVEPORTRAITS:
    case EVSUBCMD_0x1A22:
        return Event23_DisaleMapDisp(proc);

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

        GetBoxDialogueSize(StringInsertSpecialPrefixByCtrl(), &boxWidth, &boxHeight);

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

        case EVSUBCMD_TEXTSHOW:
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

        case EVSUBCMD_TEXTSHOW2:
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

        case EVSUBCMD_REMA: // REMA
            proc->evStateBits &= ~EV_STATE_0008;

            EndTalk();
            EndCgText();
            sub_808BB74();

            if (proc->execType == EV_EXEC_CUTSCENE)
                ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

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
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

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
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

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


struct ProcCmd CONST_DATA gUnknown_08591DE8[] =
{
    PROC_REPEAT(_WhileFace6CExists),
    PROC_YIELD,

    PROC_END,
};

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
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

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
u8 EventShowTextBgDirect(u8 mode, u16 bgIndex)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    switch (mode)
    {

        case EVSUBCMD_TEXTSTART:
            return EVC_ERROR;

        case EVSUBCMD_TUTORIALTEXTBOXSTART:
            return EVC_ERROR;

        case EVSUBCMD_SOLOTEXTBOXSTART:
            return EVC_ERROR;

        case EVSUBCMD_0x1A25:
            return EVC_ERROR;

        case EVSUBCMD_REMOVEPORTRAITS:
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

        case EVSUBCMD_0x1A22:
            DisplayCGfx(gBG3TilemapBuffer, GetBackgroundTileDataOffset(BG_3), 8, 8, bgIndex);

            BG_EnableSyncByMask(BG3_SYNC_BIT);
            EnablePaletteSync();

            return EVC_ADVANCE_YIELD;

        default:
            return EVC_ADVANCE_YIELD;

    } // switch (mode)
}

//! FE8U = 0x0800E8CC
u8 Event21_TextBg(struct EventEngineProc * proc)
{
    u16 evArgument2_a, evArgument2_b, evArgument3;
    struct ConvoBackgroundFadeProc * otherProc;

    int subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    switch (subcode) {
    case EVSUBCMD_BACG:
        return EventShowTextBgDirect(proc->activeTextType, evArgument);

    case EVSUBCMD_0x2141:
        evArgument2_a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
        evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

        switch (proc->activeTextType) {
        case 0:
        case 3:
        case 4:
        case 5:
            switch (evArgument2_a)
            {

                case EVSUBCMD_TEXTSTART:
                case EVSUBCMD_TUTORIALTEXTBOXSTART:
                case EVSUBCMD_SOLOTEXTBOXSTART:
                case EVSUBCMD_0x1A25:
                    return EVC_ERROR;

                case EVSUBCMD_REMOVEPORTRAITS:
                case EVSUBCMD_0x1A22:
                    if (EVENT_IS_SKIPPING(proc))
                        return EVC_ADVANCE_CONTINUE;

                    otherProc = Proc_StartBlocking(gUnknown_08591E58, proc);
                    otherProc->fadeType = 1;

                    break;

            } // switch (a)

            break;

        case EVSUBCMD_0x2141:
        case EVSUBCMD_2142:
            switch (evArgument2_a) {
            case 0:
            case 3:
            case 4:
            case 5:
                if (EVENT_IS_SKIPPING(proc))
                    return Event22_ClearScreen(proc); // CLEAN

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

        case EVSUBCMD_2142:
            evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            if (EventShowTextBgDirect(proc->activeTextType, evArgument) == EVC_ERROR)
                return EVC_ERROR;

            NewColFadeIn(evArgument3, 0, evArgument2_b, proc);

            break;

        case EVSUBCMD_2143:
            evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            evArgument3 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            NewColFadeOut(evArgument3, 0, evArgument2_b, proc);

            break;
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
    CopyBgImage(3, 2, 10);
    CopyBgTiles(BG_3, BG_2, 1);
    CopyBgPalette(8, 0, 6);
    BgChangeChr(BG_2, -8);

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EC00
void sub_800EC00(struct ConvoBackgroundFadeProc * proc)
{
    CopyBgImage(2, 3, 10);
    CopyBgTiles(BG_2, BG_3, 1);
    CopyBgPalette(0, 8, 6);
    BgChangeChr(BG_3, 8);

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
            DisplayCGfx(gBG2TilemapBuffer, GetBackgroundTileDataOffset(BG_2), 0, 6, proc->bgIndex);

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
            DisplayCGfx(gBG3TilemapBuffer, GetBackgroundTileDataOffset(BG_3), 8, 6, proc->bgIndex);

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

            ChangeUnitSpritePalette(proc->pEventEngine->mapSpritePalIdOverride);
            ForceSyncUnitSpriteSheet();

            Event24_EnableMapDisp(proc->pEventEngine);
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
        case EVSUBCMD_TEXTSTART:
        case EVSUBCMD_REMOVEPORTRAITS:
            SetBlendAlpha(currentFadeLevel, 0x10 - currentFadeLevel);
            break;

        case EVSUBCMD_0x1A22:
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
            Event23_DisaleMapDisp(proc->pEventEngine);

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


struct ProcCmd CONST_DATA gUnknown_08591E50[] =
{
    PROC_END,
};


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

u8 Event22_ClearScreen(struct EventEngineProc * proc)
{
    RefreshBMapGraphics();
    ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    ClearTalkBubble();

    Proc_EndEach(gProcScr_E_FACE); // end all faces
    ResetFaces();

    ClearTalkFaceRefs();

    return Event24_EnableMapDisp(proc);
}

//! FE8U = 0x0800F124
u8 Event23_DisaleMapDisp(struct EventEngineProc * proc)
{
    if (!(proc->evStateBits & EV_STATE_GFXLOCKED))
    {
        BMapDispSuspend();
        LockMus();
    }

    proc->evStateBits |= EV_STATE_GFXLOCKED;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F150
u8 Event24_EnableMapDisp(struct EventEngineProc * proc)
{
    if (proc->evStateBits & EV_STATE_GFXLOCKED)
    {
        BMapDispResume();
        ReleaseMus();
    }

    proc->evStateBits &= ~EV_STATE_GFXLOCKED;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F17C
u8 Event25_ChangeMap(struct EventEngineProc * proc)
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
    Event24_EnableMapDisp(proc);

    gPlaySt.chapterIndex = chIndex;

    RestartBattleMap();

    gBmSt.camera.x = GetCameraCenteredX(x * 16);
    gBmSt.camera.y = GetCameraCenteredY(y * 16);

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    RefreshBMapGraphics();

    ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return EVC_ADVANCE_YIELD;
}

u8 Event26_CameraControl(struct EventEngineProc * proc)
{
    s8 x, y;
    struct Unit * unit;

    u8 subcode = EVT_SUB_CMD_LO(proc->pEventCurrent);
    u8 sc2 = EVT_SUB_CMD_HI(proc->pEventCurrent);

    switch (subcode) {
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
        unit = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);
        if (!unit)
            return EVC_ERROR;

        x = unit->xPos;
        y = unit->yPos;

        break;
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

    switch (mapChangeId) {
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
            switch (subcode) {
            case EVSUBCMD_TILECHANGE:
                TriggerMapChanges(mapChangeId, FALSE, proc);
                break;

            case EVSUBCMD_TILEREVERT:
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

    EventSetFogVisionExt(newVision, doDisplay, proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F42C
u8 Event2A_MoveToChapter(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 chIndex = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (chIndex < 0)
        chIndex = gEventSlots[2];

    switch (subcode) {
    case EVSUBCMD_MNTS:
        SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case EVSUBCMD_MNCH:
        SetNextChapterId(chIndex);

        gPlaySt.save_menu_type = 1;

        SetNextGameActionId(GAME_ACTION_CLASS_REEL);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case EVSUBCMD_MNC2:
        SetNextChapterId(chIndex);

        gPlaySt.save_menu_type = 2;

        SetNextGameActionId(GAME_ACTION_USR_SKIPPED);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case EVSUBCMD_MNC3:
        GotoChapterWithoutSave(chIndex);
        break;

    case EVSUBCMD_MNC4:
        gPlaySt.save_menu_type = 3;
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
u16 GetLoadUnitsAmount(const struct UnitDefinition * unitDefinition)
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
void EventLoadUnitWithMovement(struct EventEngineProc * proc)
{
    const struct UnitDefinition * pUnitDefinition = proc->pUnitLoadData;

    s16 count = proc->unitLoadCount;
    u8 param = proc->unitLoadParameter;

    u16 something = ModifyMoveUnitFlag(proc, TRUE);

    s8 r3 = FALSE;

    if (param == 2)
        r3 = TRUE;

    if ((proc->evStateBits >> 2) & 1)
    {
        EventLoadUnitSliently(pUnitDefinition, count, param);
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
    proc->chance = 0;
    proc->pCallback = NULL;
}

void EventLoadUnitSliently(const struct UnitDefinition * def, s16 count, u8 param)
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
        MoveUnitExt(unit, unitDefition->redas, unitDefition->redaCount, flags);
    else
        MuCtr_StartDefinedMove(unit, unitDefition->redas, unitDefition->redaCount, flags);
}

#if NONMATCHING

/* https://decomp.me/scratch/IyKOH */

//! FE8U = 0x0800F914
struct UnitDefinition * GetUnitDefinitionFormEventScr(struct UnitDefinition * source, short count, u8 arg2, s8 arg3, s8 arg4)
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
struct UnitDefinition * GetUnitDefinitionFormEventScr(struct UnitDefinition * source, short count, u8 arg2, s8 arg3, s8 arg4)
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
u8 Event2B_ConfigLoadUnit(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (argument < 0)
        argument = gEventSlots[2];

    switch (subcode) {
    case EVSUBCMD_LOAD_SETCOUNT:
        proc->unitLoadCount = argument;
        break;

    case EVSUBCMD_LOAD_SETCHANCE:
        if (argument < 0)
            argument = 0;

        if (argument > 100)
            argument = 100;

        proc->chance = argument;

        break;

    case 2:
        proc->diable_REDA = TRUE;
        break;
    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}

u8 Event2C_LoadUnits(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    u8 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    const struct UnitDefinition * ud = (const struct UnitDefinition *)EVT_CMD_ARG32_LE(proc->pEventCurrent);

    u16 count = proc->unitLoadCount;

    switch (subcode) {
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
        count = GetLoadUnitsAmount(ud);

    ud = GetUnitDefinitionFormEventScr((void *)ud, count, proc->chance, subcode == 2, proc->diable_REDA);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
    {
        EventLoadUnitSliently(ud, count, argument);

        proc->unitLoadCount = 0;
        proc->chance = 0;
    }
    else
    {
        proc->pUnitLoadData = ud;
        proc->unitLoadCount = count;
        proc->unitLoadParameter = argument;

        proc->pCallback = EventLoadUnitWithMovement;
        proc->pCallback(proc);
    }

    proc->diable_REDA = FALSE;
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

    if (!CanStartMu())
        return FALSE; // No room to make MU for the moving unit

    return TRUE; // Yay!
}

//! FE8U = 0x0800FCD8
u32 ModifyMoveUnitFlag(struct EventEngineProc * proc, s8 unk)
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
u8 Event2D_ChangeSpritePal(struct EventEngineProc * proc)
{
    u16 palId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    ChangeUnitSpritePalette(palId);
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
        gEventSlots[0xC] = unit->pCharacterData->number;

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

    switch (subcmd) {
    case EVSUBCMD_MOVE:
        xOut = EVT_CMD_ARGV(proc->pEventCurrent)[2];
        yOut = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;

        queue = NULL;

        break;

    case EVSUBCMD_MOVEONTO:
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

    case EVSUBCMD_MOVE_1STEP:
        direction = EVT_CMD_ARGV(proc->pEventCurrent)[2];
        xOut = xIn;
        yOut = yIn;

        switch (direction) {
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

    case EVSUBCMD_MOVE_DEFINED:
        queue = gEventSlotQueue;
        break;
    }

    flags = ModifyMoveUnitFlag(proc, subHi);

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
        SetMuMaxWalkSpeed_();
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
        case EVSUBCMD_SHOW_ATTACK_RANGE:
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

        case EVSUBCMD_HIDE_ATTACK_RANGE:
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

    unitDef.ai[UDEF_AIIDX_AI_A] = 0;
    unitDef.ai[UDEF_AIIDX_AI_B] = 0;
    unitDef.ai[UDEF_AIIDX_AI_CONF_L] = 0;
    unitDef.ai[UDEF_AIIDX_AI_CONF_H] = 0;

    LoadUnit_800F704(&unitDef, 0, 0, subcmd == 0xf);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010110
u8 Event33_CheckUnitVarious(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    struct Unit * unit = GetUnitStructFromEventParameter(pid);

    switch (subcmd) {
    case EVSUBCMD_CHECK_EXISTS:
        if (unit)
            gEventSlots[0xC] = 1;
        else
            gEventSlots[0xC] = 0;

        break;

    case EVSUBCMD_CHECK_STATUS:
        if (!unit)
            return EVC_ERROR;

        gEventSlots[0xC] = unit->pCharacterData->visit_group;

        break;

    case EVSUBCMD_CHECK_ALIVE:
        if (!unit)
        {
            gEventSlots[0xC] = 0;
            break;
        }

        if (unit->state & US_DEAD)
            gEventSlots[0xC] = 0;
        else
            gEventSlots[0xC] = 1;

        break;

    case EVSUBCMD_CHECK_DEPLOYED:
        if (!unit)
            return EVC_ERROR;

        if (unit->state & US_NOT_DEPLOYED)
            gEventSlots[0xC] = 0;
        else
        {
            if (unit->xPos >= 0)
                gEventSlots[0xC] = 1;
            else
                gEventSlots[0xC] = 0;
        }

        break;

    case EVSUBCMD_CHECK_ACTIVEID:
        if (!unit)
            return EVC_ERROR;

        if (gActiveUnit->pCharacterData->number != pid)
            gEventSlots[0xC] = 0;
        else
            gEventSlots[0xC] = 1;

        break;

    case EVSUBCMD_CHECK_ALLEGIANCE:
        if (!unit)
            return EVC_ERROR;

        switch (UNIT_FACTION(unit)) {
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

    case EVSUBCMD_CHECK_COORDS:
        if (!unit)
            return EVC_ERROR;

        ((u16 *)(gEventSlots + 0xC))[0] = unit->xPos;
        ((u16 *)(gEventSlots + 0xC))[1] = unit->yPos;

        break;

    case EVSUBCMD_CHECK_CLASS:
        if (!unit)
            return EVC_ERROR;

        gEventSlots[0xC] = unit->pClassData->number;

        break;

    case EVSUBCMD_CHECK_LUCK:
        if (!unit)
            return EVC_ERROR;

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

    switch (subcmd) {
    case EVSUBCMD_CLEA:
    case EVSUBCMD_CLEN:
    case EVSUBCMD_CLEE:
        break;

    case EVSUBCMD_KILL:
    case EVSUBCMD_DISA_IF:
    case EVSUBCMD_DISA:
        if (!unit)
            return EVC_ADVANCE_CONTINUE;

        break;

    default:
        if (!unit)
            return EVC_ERROR;

        break;
    }

    switch (subcmd) {
    case EVSUBCMD_REMU:
        unit->state |= (US_HIDDEN | US_BIT16 | US_BIT26);
        break;

    case EVSUBCMD_REVEAL:
        unit->state &= ~(US_HIDDEN | US_BIT16 | US_BIT26);
        break;

    case EVSUBCMD_CUSA:
    case EVSUBCMD_CUSN:
    case EVSUBCMD_CUSE:
        UnitChangeFaction(unit, allegianceLookup[subcmd - 2]);
        break;

    case EVSUBCMD_SET_HP:
        SetUnitHp(unit, gEventSlots[1]);
        if (gEventSlots[1] == 0)
            unit->state |= US_DEAD;

        break;

    case EVSUBCMD_SET_ENDTURN:
        unit->state |= US_UNSELECTABLE;
        break;

    case EVSUBCMD_3427:
        unit->state |= US_HAS_MOVED;
        break;

    case EVSUBCMD_SET_STATE:
        switch (gEventSlots[1]) {
        case 1:
            unit->state &= ~US_NOT_DEPLOYED;
            break;

        case 0:
            unit->state |= US_NOT_DEPLOYED;
            break;

        case -1:
            if (unit->state & US_BIT21)
                unit->state |= US_NOT_DEPLOYED;
            else
                unit->state &= ~US_NOT_DEPLOYED;

            break;
        }

        break;

    case EVSUBCMD_3529:
        break;

    case EVSUBCMD_CLEA:
        EndAllMus();

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
        {
            struct Unit * it = GetUnit(i);
            if (!UNIT_IS_VALID(it))
                continue;

            it->state |= US_HIDDEN;
            it->state &= ~US_UNSELECTABLE;
            it->state &= ~(US_RESCUING | US_RESCUED);
        }
        ClearCutsceneUnits();
        break;

    case EVSUBCMD_CLEN:
        EndAllMus();

        for (i = FACTION_GREEN + 1; i < FACTION_RED; i++)
        {
            struct Unit * it = GetUnit(i);
            if (!UNIT_IS_VALID(it))
                continue;

            ClearUnit(it);
        }
        break;

    case EVSUBCMD_CLEE:
        EndAllMus();
        for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
        {
            struct Unit * it = GetUnit(i);

            if (!UNIT_IS_VALID(it))
                continue;

            ClearUnit(it);
        }
        break;

    case EVSUBCMD_KILL:
        if (!EVENT_IS_SKIPPING(proc))
        {
            struct MuProc * muProc;

            HideUnitSprite(unit);
            unit->state |= US_HIDDEN;
            muProc = StartMu(unit);
            SetAutoMuDefaultFacing();
            MU_StartDeathFade(muProc);

            return EVC_ADVANCE_YIELD;
        }

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_DISA_IF:
    {
        s8 a = Proc_Find(ProcScr_MuDeathFade) != 0;
        if (-a | a)
            return EVC_STOP_YIELD;
    }

    // Fall through

    case EVSUBCMD_DISA:
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
    s32 gold;
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * target = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

    if (!target)
        return EVC_ERROR;

    switch (subcmd) {
    case EVSUBCMD_GIVEITEMTO:
        NewPopup_ItemGot(proc, target, gEventSlots[3]);

        break;

    case EVSUBCMD_GIVEITEMTOMAIN:
        NewPopup_GoldGot(proc, target, gEventSlots[3]);

        break;

    case EVSUBCMD_GIVETOSLOT3:
        gold = GetPartyGoldAmount() - gEventSlots[3];
        if (gold < 0)
            gold = 0;

        SetPartyGoldAmount(gold);

        break;
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

    struct Unit * unit;
    s8 x, y;
    u16 pid;

    switch (subcmd) {
    case EVTSUBCMD_CHAI:
        pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
        if (EVT_CMD_ARGV(proc->pEventCurrent)[0] < 0)
            pid = gEventSlots[2];

        ChangeAiForCharacter(pid, ai1, ai2, unused);

        break;

    case EVTSUBCMD_CHAI_AT:

#if !BUGFIX
        /* I think this maybe a bug */
        x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;
#else
        x = (EVT_CMD_ARGV(proc->pEventCurrent)[0] & 0x0F);
        y = (EVT_CMD_ARGV(proc->pEventCurrent)[0] & 0xF0) >> 8;
#endif

        if (x < 0 || y < 0)
        {
            x = ((u16 *)(gEventSlots + 0xB))[0];
            y = ((u16 *)(gEventSlots + 0xB))[1];
        }

        if (gBmMapUnit[y][x] != 0)
            unit = GetUnit(gBmMapUnit[y][x]);
        else
            unit = NULL;

        ChangeUnitAi(unit, ai1, ai2, unused);

        break;
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

    switch (subcmd) {
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

    /* 64 */ s16 x;
    /* 66 */ s16 y;
    /* 68 */ u16 subcmd;
    /* 6A */ u16 timer;
};

// Implicit?
u16 EventShinningCursorAdvance(int x, int y, int counter);

//! FE8U = 0x08010748
void EventDisplayCursor_Loop(struct MapCursorProc * proc)
{
    switch (proc->subcmd & 0xc) {
    case 0:
        PutMapCursor(proc->x * 16, proc->y * 16, 0);
        break;

    case 4:
        proc->timer = EventShinningCursorAdvance(proc->x, proc->y, proc->timer);
        break;
    }

    return;
}

struct ProcCmd CONST_DATA gUnknown_08591F00[] =
{
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_EventDisplayCursor[] =
{
    PROC_REPEAT(EventDisplayCursor_Loop),
    PROC_END,
};

u8 Event3B_DisplayCursor(struct EventEngineProc * proc)
{
    struct MapCursorProc * childProc;
    struct Unit * unit;
    u8 subcmd;
    s8 x;
    s8 y;

    if (EVENT_IS_SKIPPING(proc))
    {
        Proc_EndEach(ProcScr_EventDisplayCursor);
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd & 3) {
    case EVSUBCMD_CURSOR_AT:
        x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

        if (x < 0 || y < 0)
        {
            x = ((u16 *)(gEventSlots + 0xB))[0];
            y = ((u16 *)(gEventSlots + 0xB))[1];
        }

        break;

    case EVSUBCMD_CURSOR_UNIT:
        unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
        if (!unit)
            return EVC_ERROR;

        x = unit->xPos;
        y = unit->yPos;

        break;

    case EVSUBCMD_CURE:
        Proc_EndEach(ProcScr_EventDisplayCursor);
        return EVC_ADVANCE_YIELD;
    }

    childProc = Proc_Start(ProcScr_EventDisplayCursor, proc);
    childProc->x = x;
    childProc->y = y;
    childProc->subcmd = subcmd;
    childProc->timer = 0;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010850
u8 Event3C_MoveCursor(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;

    switch (EVT_SUB_CMD(proc->pEventCurrent)) {
    case EVSUBCMD_CHECK_CURSOR:
        ((u16 *)(gEventSlots + 0xC))[0] = gBmSt.playerCursor.x;
        ((u16 *)(gEventSlots + 0xC))[1] = gBmSt.playerCursor.y;

        break;

    case EVSUBCMD_SET_CURSOR:
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
u8 Event3D_MenuOverride(struct EventEngineProc * proc)
{
    u8 i;
    u16 bit;

    u8 UnitMenuOverrideConf[15] =
    {
        0x4F, /* 攻撃 */
        0x51, /* 杖 */
        0x6B, /* 待機 */
        0x63, /* 救出 */
        0x64, /* 降ろす */
        0x5C, /* 訪問 */
        0x5A, /* 話す */
        0x67, /* 持ち物 */
        0x37, /* 捨てる */
        0x68, /* 交換 */
        0x69, /* 輸送隊 */
        0x5B, /* 支援 */
        0x5F, /* 武器屋 */
        0x71, /* 設定 */
        0x78, /* 終了 */
    };

    u8 ItemMenuOverrideConf[5] =
    {
        0x49, /* unit->items[0] */
        0x4A, /* unit->items[1] */
        0x4B, /* unit->items[2] */
        0x4C, /* unit->items[3] */
        0x4D, /* unit->items[4] */
    };

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 flags = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    ResetMenuOverrides();

    bit = 1;

    switch (subcmd) {
    case EVSUBCMD_DISABLEOPTIONS:
        for (i = 0; i < ARRAY_COUNT(UnitMenuOverrideConf); i++)
        {
            if (flags & bit)
                AddMenuOverride(UnitMenuOverrideConf[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysNotShown);

            bit <<= 1;
        }
        break;

    case EVSUBCMD_DISABLEWEAPONS:
        for (i = 0; i < ARRAY_COUNT(ItemMenuOverrideConf); i++)
        {
            if (flags & bit)
            {
                AddMenuOverride(ItemMenuOverrideConf[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysDisabled);
                AddMenuOverride(ItemMenuOverrideConf[i], MENU_OVERRIDE_ONSELECT, Get8);
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

//! FE8U = 0x0801098C
struct BattleHit * GenerateScriptBattleHitFormEventQueue(void)
{
    u8 i;
    u32 * queueIt = gEventSlotQueue;
    struct BattleHit * bhIt = gActionData.script_hits;

    for (i = 0; i < gEventSlots[0xd] && ((u8 *)(queueIt))[0] != 0xff; bhIt++, queueIt++, i++)
    {
        bhIt->attributes = ((u16 *)(queueIt))[1];
        bhIt->info = 0;

        if (i == 0)
            bhIt->info |= BATTLE_HIT_INFO_BEGIN;

        if (((u8 *)(queueIt))[0] == 1)
            bhIt->info |= BATTLE_HIT_INFO_RETALIATION;

        bhIt->hpChange = ((u8 *)(queueIt))[1];
    }

    bhIt->info = BATTLE_HIT_INFO_END;
    return gActionData.script_hits;
}

//! FE8U = 0x08010A28
void ScriptBattleDeamon(struct ScriptedBattleProc * proc)
{
    if (proc->lock == GetGameLock())
    {
        EventBattleReloadBmStatus();
        Proc_SetMark(proc->evtproc, PROC_MARK_EVENT);
        Proc_Break(proc);
    }
}


struct ProcCmd CONST_DATA ProcScr_ScriptBattleDeamon[] =
{
    PROC_REPEAT(ScriptBattleDeamon),
    PROC_END,
};

/* Script battle */
u8 Event3F_ScriptBattle(struct EventEngineProc * proc)
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
        hits = NULL;
    else
        hits = GenerateScriptBattleHitFormEventQueue();

    switch (subcmd) {
    case EVSUBCMD_FIGHT:
    case EVSUBCMD_FIGHT_MAP:
        if (charIdA < 0)
            charIdA = -2;

        if (charIdB < 0)
            charIdB = -2;

        unitA = GetUnitStructFromEventParameter(charIdA);
        unitB = GetUnitStructFromEventParameter(charIdB);

        if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            scriptted = 0;
        else
        {
            scriptted = 1;
            childProc = Proc_StartBlocking(ProcScr_ScriptBattleDeamon, proc);
            childProc->evtproc = proc;
            childProc->lock = GetGameLock();
            Proc_SetMark(proc, PROC_MARK_EVENT_ANIM);
        }

        StartEventBattle(unitA, unitB, isBallista, scriptted, weaponId, hits, -subcmd || subcmd);

        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_FIGHT_SCRIPT:
        SetScriptedBattle(hits);
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ERROR;
}

struct ProcEventPromote
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * event_engine;

    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 lock;
};

//! FE8U = 0x08010B48
void WaitEventPromoteDone(struct ProcEventPromote * proc)
{
    if (proc->lock == GetGameLock())
    {
        sub_8012324();
        Proc_SetMark(proc->event_engine, PROC_MARK_EVENT);
        Proc_Break(proc);
    }

    return;
}


struct ProcCmd CONST_DATA ProcScr_EventPromoteUnit[] =
{
    PROC_REPEAT(WaitEventPromoteDone),
    PROC_END,
};

//! FE8U = 0x08010B78
u8 Event40_PromoteUnit(struct EventEngineProc * proc)
{
    struct Unit * unit;

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 itemId = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    struct ProcEventPromote * childProc = Proc_StartBlocking(ProcScr_EventPromoteUnit, proc);
    childProc->event_engine = proc;
    childProc->lock = GetGameLock();

    Proc_SetMark(proc, PROC_MARK_EVENT_ANIM);

    unit = GetUnitStructFromEventParameter(pid);
    SetUnitStatus(unit, 0);
    EventPromoteUnitExt(unit, jid, itemId);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010BEC
u8 Event41_Warp(struct EventEngineProc * proc)
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
        case EVSUBCMD_WARP_OUT:
        case EVSUBCMD_WARP_IN:
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
u8 Event42_EarthQuake(struct EventEngineProc * proc)
{
    u8 c;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u8 direction = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 play_sound = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

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

            StartEventEarthQuake(subcmd, direction, play_sound);

            break;

        case 0xf:
            EndEventEarthQuake();
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010CF0
u8 Event43_SummonUnit(struct EventEngineProc * proc)
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
u8 Event45_GlowingCross(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    switch (subcmd)
    {
        case EVSUBCMD_GLOWINGCROSS:
            if (!EVENT_IS_SKIPPING(proc))
            {
                StartGlowingCross(proc, unit);
            }

            break;

        case EVSUBCMD_GLOWINGCROSS_END:
            if (!EVENT_IS_SKIPPING(proc))
            {
                RemoveGlowingCrossDirectlyWithAnim(proc, 0x78);
                return EVC_ADVANCE_YIELD;
            }

            RemoveGlowingCrossDirectly();

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

CONST_DATA EventListScr EventScr_Nop[] = {
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_RemoveBGIfNeeded[] = {
    EVBIT_MODIFY(0x1)
    EVBIT_F(2)
    CHECK_EVBIT(8)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    FADU(16)
LABEL(0x0)
    EVBIT_MODIFY(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_08591F64[] = {
    EVBIT_MODIFY(0x1)
    EVBIT_F(2)
    CHECK_EVBIT(8)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    FADI(16)
LABEL(0x0)
    EVBIT_MODIFY(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_DisplayBattleQuote[] = {
    EVBIT_MODIFY(0x3)
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_TriggerQueuedTileChanges[] = {
    EVBIT_MODIFY(0x1)
    TILECHANGE(0xfffd)
    ENDA
};

CONST_DATA EventListScr EventScr_OpenChest[] = {
    EVBIT_MODIFY(0x1)
    TILECHANGE(0xfffd)
    SVAL(EVT_SLOT_7, 0xff)
    BGT(0x0, EVT_SLOT_3, EVT_SLOT_7)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    GOTO(0x1)
LABEL(0x0)
    GIVEITEMTOMAIN(CHAR_EVT_ACTIVE_UNIT)
LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_08591FD8[] = {
    CALL(EventScr_08591F64)
    CLEAN
    PREP
    CLEAN
    ENDA
};

CONST_DATA EventListScr EventScr_MapSupportConversation[] = {
    EVBIT_MODIFY(0x3)
    BEQ(0x0, EVT_SLOT_2, EVT_SLOT_0)
    MUSC(0xffff)
    GOTO(0x1)
LABEL(0x0)
    MUSI
LABEL(0x1)
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    NOTIFY(0xc, 0x5a)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_SupportViewerConversation[] = {
    EVBIT_MODIFY(0x3)
    REMOVEPORTRAITS
    BACG(0x37)
    FADU(16)
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    FADI(16)
    ENDA
};

CONST_DATA EventListScr EventScr_SkirmishRetreat[] = {
    EVBIT_MODIFY(0x4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x8fc)
    TEXTEND
    IfNoSelectedGoto(0x0)
    MUSCMID(0x7fff)
    FADI(4)
    MNCH(0xffff)
    CHECK_SKIRMISH
    SVAL(EVT_SLOT_1, 0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    ASMC(StartRetreatProcessing)
LABEL(0x0)
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_SuspendPrompt[] = {
    EVBIT_MODIFY(0x4)
    TEXTSTART
    TEXTSHOW(0x8fe)
    TEXTEND
    IfNoSelectedGoto(0x0)
    ASMC(WriteSuspandPlaterIdle)
    EvtTextShow2(0x8ff)
    TEXTEND
    MUSCMID(0x7fff)
    FADI(4)
    MNTS(0x0)
LABEL(0x0)
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_GameOver[] = {
    EVBIT_MODIFY(0x4)
    ASMC(EventCallGameOverExt)
    ENDA
};

CONST_DATA EventListScr EventScr_08592114[] = {
    CHECK_EVBIT(10)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_08592140)
    GOTO(0x1)
LABEL(0x0)
    CALL(0x8592170)
LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_08592140[] = {
    CHECK_EVBIT(8)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_EVBIT(7)
    BNE(0x63, EVT_SLOT_C, EVT_SLOT_0)
    FADI(16)
LABEL(0x0)
    CLEAN
    FADU(16)
LABEL(0x63)
    ENDA
};

CONST_DATA EventListScr EventScr_08592170[] = {
    CHECK_EVBIT(8)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    FADI(16)
LABEL(0x0)
    CHECK_EVBIT(11)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_CHAPTER_NUMBER
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xffff)
LABEL(0x1)
    ENDA
};

CONST_DATA u16 Obj_EventShinningCursor[] = {
    4,
    0x0, 0x01FF, 0x0,
    0x0, 0x1008, 0x0,
    0x9, 0x21FF, 0x0,
    0x9, 0x3008, 0x0,
};
