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

#include "ev_triggercheck.h"
#include "event.h"

struct Struct03000428 {
    char str[4];
    u8 unk04;
    u8 unk05;
};

// temp rodata (TODO: move directly into the various functions that use those)
extern u8 gUnknown_080D793C[];

void sub_800F8A8(struct Unit*, const struct UnitDefinition*, u16, s8);

void sub_800F698(const struct UnitDefinition* def, s16 count, u8 param);

// TODO: Implicit declaration?
int IsSethLArachelMyrrhInnes(int);

void sub_8079FA8(struct Unit* unit, const void* redas, u32 count, u16 flags);

// TODO: #include "evtcmd_gmap.h" (?)
void sub_800B910(int, int, int);
void sub_800B954(int, int, int);
void sub_800B994(int, int, int);
void sub_800B9B8(int, int);
void sub_800BA04(int, int);

// TODO: #include "hino.h"
void sub_8012890(int, int, int, int, int, ProcPtr); // aka idk

// ???
void SetDialogueBoxConfig(u16);
void sub_808AADC(const char*, int*, int*);
void sub_808E9D8(int);

extern struct ProcCmd gProcScr_BoxDialogue[];

// ????

void sub_80B272C(int, int, int, ProcPtr);
void sub_80B2780(int, int, int, ProcPtr);

void sub_80B65F8(u16* buf, u32 offset, int, int, u32);

// local

struct ConvoBackgroundFadeProc
{
    PROC_HEADER;

    /* 29 */ u8  fadeType;
    /* 2A */ u8  unkType;

    /* 2C */ u16 bgIndex;
    /* 2E */ u16 fadeSpeed;
    /* 30 */ u16 fadeTimer;

    /* 34 */ struct EventEngineProc* pEventEngine;
};

void sub_800E640(struct EventEngineProc*);
u8 Event22_(struct EventEngineProc*); // CLEAN
u8 Event23_(struct EventEngineProc*); // Lock Game Graphics
u8 Event24_(struct EventEngineProc*); // Resume Game Graphics

extern const struct ProcCmd gUnknown_08591DE8[]; // "face witness"

extern struct Struct03000428 gUnknown_03000428;
extern char gUnknown_03000430[4];

extern const struct ProcCmd gUnknown_08591E58[];
extern const struct ProcCmd gUnknown_08591E00[];
extern const struct ProcCmd gUnknown_08591EB0[];

// other

extern const struct {
    const void* pTileGraphics;
    const void* pTileArrangement;
    const void* pColorPalettes;
} gConvoBackgroundData[];

extern u16 gUnknown_08592114[]; // gEvent_PostEnd

void sub_80125C0(struct UnitDefinition*);

extern struct UnitDefinition end[];

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
            proc->evStateBits |=  (1 << (s16)arg); /* EVSUBCMD_EVBIT_T */
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
    const u16 *scr = proc->pEventCurrent;
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
    void (* func)(struct EventEngineProc *);

    _cmd = *proc->pEventCurrent;
    _cmd_mask = 0xF;

    func = (void *)EVT_CMD_ARG32_BE(proc->pEventCurrent);

    if ((_cmd_mask &= _cmd) == 0x1 && EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    func(proc);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800DB38
u8 Event0E_STAL(struct EventEngineProc* proc) {
    u8 subcode;
    s16 stallTimer;

    subcode = EVT_SUB_CMD(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc)) {
        proc->evStallTimer = 0;
        return EVC_ADVANCE_CONTINUE;
    }
    
    if (((subcode & 1) && (((proc->evStateBits >> 0x3) & 1) || (gKeyStatusPtr->newKeys & B_BUTTON))))
        goto end_stall; // I can't get it to match without that (ugh)
    
    stallTimer = proc->evStallTimer;
    
    if (stallTimer <= 0) {
        proc->evStallTimer = proc->pEventCurrent[1];
    } else {
        int timeStep = 1;

        if (!(proc->evStateBits & EV_STATE_0040) && (subcode & 2))
            if ((gPlaySt.cfgGameSpeed != 0) || (gKeyStatusPtr->heldKeys & A_BUTTON))
                timeStep = 4;
        
        stallTimer = stallTimer - timeStep;

        if (stallTimer <= 0) {

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
u8 Event0F_(struct EventEngineProc* proc) {
    s8 newValue;

    u8  subcode  = EVT_SUB_CMD(proc->pEventCurrent);
    u16 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 shift    = 4 * (*(const u8*)(proc->pEventCurrent + 1) % 8);

    switch (subcode) {

    case 0: // Check
        gEventSlots[0xC] = (gEventSlotCounter >> shift) & 0xF;

        return EVC_ADVANCE_CONTINUE;

    case 1: // Set
        #if NONMATCHING

        // I can't get that particular part to match so I'll just go with asm

        newValue = (r5 << 0x10) >> 0x18;

        #else

        asm(
            "lsl r0, %1, #16\n"
            "lsr %0, r0, #24\n"

            : "=r"(newValue)
            : "r"(argument)
        );

        #endif

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

    gEventSlotCounter = (
        (gEventSlotCounter &~ (0xF << shift)) |
        ((newValue & 0xF) << shift)
    );

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800DC98
u8 Event10_ModifyEvBit(struct EventEngineProc* proc) {
    u16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (EVENT_IS_SKIPPING(proc) && evArgument)
        proc->evStateBits = (proc->evStateBits &~ EV_STATE_SKIPPING) | EV_STATE_FADEDIN;

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
u8 Event11_SetIgnoredKeys(struct EventEngineProc* proc) {
    u8  subcode = EVT_SUB_CMD(proc->pEventCurrent);
    u16 mask    = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (subcode == 0)
        SetKeyStatus_IgnoreMask(mask);

    return EVC_ADVANCE_CONTINUE;
}

// SOUND EVENT CODES

//! FE8U = 0x0800DD74
u8 Event12_(struct EventEngineProc* proc) {
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
u8 Event13_(struct EventEngineProc* proc) {
    u8  subcode    = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    if (evArgument != INT16_MAX) {
        if (EVENT_IS_SKIPPING(proc))
            return EVC_ADVANCE_CONTINUE;

        StartBgmFadeIn(evArgument, subcode, 0);
        return EVC_ADVANCE_YIELD;
    } else {
        if (EVENT_IS_SKIPPING(proc))
            subcode = 1;
        
        Sound_FadeOutBGM(subcode);
        return EVC_ADVANCE_YIELD;
    }
}

//! FE8U = 0x0800DE14
u8 Event14_(struct EventEngineProc* proc) {
    u8  subcode    = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (subcode) {

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
u8 Event15_(struct EventEngineProc* proc) {
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcode) {
    
    case 0:
        if (EVENT_IS_SKIPPING(proc))
            return EVC_ADVANCE_CONTINUE;

        StartBgmVolumeChange(0x100, 0x90, 10, proc);

        break;

    case 1:
        if (EVENT_IS_SKIPPING(proc)) {
            Sound_SetSEVolume(0x100);
            return EVC_ADVANCE_CONTINUE;
        }

        StartBgmVolumeChange(0x90, 0x100, 10, proc);

        break;

    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800DED4
u8 Event16_(struct EventEngineProc* proc) {
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
u8 Event17_(struct EventEngineProc* proc) {
    u8  subcode;
    u16 evArgument;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    subcode    = EVT_SUB_CMD(proc->pEventCurrent);
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
u8 Event18_(struct EventEngineProc* proc) {
    u32 mask;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    u8 evArgumentBitStart = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 evArgumentBitCount = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    u32 evArgument2 = proc->pEventCurrent[2];
    u32 evArgument3 = proc->pEventCurrent[3];
    u32 evArgument4 = proc->pEventCurrent[4];
    u32 evArgument5 = proc->pEventCurrent[5];

    switch (subcode) {

    case 0:
        sub_80127C4();
        return EVC_ADVANCE_YIELD;

    case 1:
        sub_8012824();
        return EVC_ADVANCE_YIELD;

    case 2: {
        s8 i;

        if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            evArgument2 = 0;

        mask = 0;

        for (i = evArgumentBitCount; i > 0; --i) {
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
u8 Event19_(struct EventEngineProc* proc) {
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcode) {

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

    case 4: // Check ?
        gEventSlots[0xC] = CountRedUnits();
        break;

    case 5: // Check ?
        gEventSlots[0xC] = CountGreenUnits();
        break;

    case 6: // Check Chapter Type?
        gEventSlots[0xC] = GetChapterThing();
        break;

    case 7: // Check Some option or difficult mode
        if (gPlaySt.cfgController || (gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
            gEventSlots[0xC] = FALSE;
        else
            gEventSlots[0xC] = TRUE;

        break;

    case 8: // Check gold
        gEventSlots[0xC] = GetPartyGoldAmount();
        break;

    case 9: // Check ?
        gEventSlots[0xC] = GetEventTriggerId(proc->pEventStart);
        break;

    case 10: // Check ?
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
u8 Event1A_TEXTSTART(struct EventEngineProc* proc) {
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    if (subcode != proc->activeTextType && subcode != 5) {
        EndTalk();
        sub_808F270();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);
    }

    proc->activeTextType = subcode;

    switch (subcode) {

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

void sub_800E210(struct EventEngineProc* proc, u16 stringIndex, s8 b) {
    if (b == TRUE)
        InitTalk(0x80, 2, 1);

    if ((proc->evStateBits & EV_STATE_0040) == 1) { // ?????
        proc->overwrittenTextSpeed = gPlaySt.cfgTextSpeed;
        gPlaySt.cfgTextSpeed = 1;
    } else {
        proc->overwrittenTextSpeed = 0xFF;
    }

    StartTalkMsg(1, 1, stringIndex);

    if (proc->evStateBits & EV_STATE_0020)
        SetTalkFlag(TALK_FLAG_NOSKIP);

    if (proc->evStateBits & EV_STATE_0040)
        SetTalkFlag(TALK_FLAG_NOFAST);
}

void sub_800E290(struct EventEngineProc* proc, u16 stringIndex, u32 flags) {
    flags |= 0x0400;

    if (proc->evStateBits & EV_STATE_0020)
        flags |= 0x0040;

    if (proc->evStateBits & EV_STATE_0040)
        flags |= 0x2000 | 0x0800 | 0x0020;

    SetWinEnable(FALSE, FALSE, FALSE);

    LoadObjUIGfx();
    InitTalk(0x80, 0, 1);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    sub_808F128(
        3,
        0x12,
        0x14,
        4,
        stringIndex,
        OBJ_VRAM0 + 0x1000,
        -1,
        NULL // parent proc
    );

    sub_808E9D8(flags);
}

void sub_800E31C(struct EventEngineProc* proc, u16 stringIndex, u32 flags) {
    u8 x = ((u16*)(gEventSlots + 0xB))[0];
    u8 y = ((u16*)(gEventSlots + 0xB))[1];

    if (x == (u8)(-1) && y == (u8)(-1)) {
        x = 0;
        y = 0;
        flags |= 0x0100;
    } else {
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

#ifdef NONMATCHING

/* https://decomp.me/scratch/SdQQm */

//! FE8U = 0x0800E3C8
u8 Event1B_TEXTSHOW(struct EventEngineProc* proc) {
    u8       subcode    = 0xF & *(const u8*)(proc->pEventCurrent);
    short    evArgument = proc->pEventCurrent[1];
    unsigned zeroFlag   = 0;

    if (subcode != 2) {
        if (evArgument < 0)
            evArgument = gEventSlots[2];

        if (evArgument == 0)
            return EVC_ADVANCE_CONTINUE;
    }

    switch (subcode) {

    case 0:
        proc->evStateBits &= ~EV_STATE_0008;

        if ((proc->evStateBits >> 2) & 1)
            break;

        switch (proc->activeTextType) {

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
            sub_800E31C(proc, evArgument, 0x0010);
            break;

        case 4:
            sub_800E31C(proc, evArgument, zeroFlag);
            break;

        case 5:
            sub_800E31C(proc, evArgument, (0x0010 | 0x0020));
            break;

        } // switch (proc->activeTextType)

        break;

    case 1:
        if ((proc->evStateBits >> 2) & 1)
            break;

        if ((proc->evStateBits >> 3) & 1)
            break;

        switch (proc->activeTextType) {

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
            sub_800E31C(proc, evArgument, 0x0010);
            break;

        case 4:
            sub_800E31C(proc, evArgument, zeroFlag);
            break;

        case 5:
            sub_800E31C(proc, evArgument, (0x0010 | 0x0020));
            break;

        } // switch (proc->activeTextType)

        break;

    case 2: // REMA
        proc->evStateBits &= ~EV_STATE_0008;

        EndTalk();
        sub_808F270();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);

        return EVC_ADVANCE_YIELD;

    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}

#else // !NONMATCHING

__attribute__((naked))
u8 Event1B_TEXTSHOW(struct EventEngineProc* proc) {
    asm(
        ".syntax unified\n"

        "push {r4, r5, lr}\n"
        "adds r4, r0, #0\n"
        "ldr r1, [r4, #0x38]\n"
        "ldrb r0, [r1]\n"
        "movs r2, #0xf\n"
        "ands r2, r0\n"
        "ldrh r3, [r1, #2]\n"
        "movs r5, #0\n"
        "cmp r2, #2\n"
        "beq _0800E3EC\n"
        "lsls r0, r3, #0x10\n"
        "cmp r0, #0\n"
        "bge _0800E3E6\n"
        "ldr r0, _0800E3FC\n" // gEventSlots
        "ldrh r3, [r0, #8]\n"
    "_0800E3E6:\n"
        "cmp r3, #0\n"
        "bne _0800E3EC\n"
        "b _0800E514\n"
    "_0800E3EC:\n"
        "cmp r2, #1\n"
        "beq _0800E462\n"
        "cmp r2, #1\n"
        "bgt _0800E400\n"
        "cmp r2, #0\n"
        "beq _0800E406\n"
        "b _0800E514\n"
        ".align 2, 0\n"
    "_0800E3FC: .4byte gEventSlots\n"
    "_0800E400:\n"
        "cmp r2, #2\n"
        "beq _0800E4DE\n"
        "b _0800E514\n"
    "_0800E406:\n"
        "ldrh r0, [r4, #0x3c]\n"
        "ldr r1, _0800E430\n" // 0x0000FFF7
        "ands r1, r0\n"
        "strh r1, [r4, #0x3c]\n"
        "lsrs r1, r1, #2\n"
        "movs r0, #1\n"
        "ands r1, r0\n"
        "cmp r1, #0\n"
        "beq _0800E41A\n"
        "b _0800E514\n"
    "_0800E41A:\n"
        "adds r0, r4, #0\n"
        "adds r0, #0x42\n"
        "ldrb r0, [r0]\n"
        "cmp r0, #5\n"
        "bhi _0800E514\n"
        "lsls r0, r0, #2\n"
        "ldr r1, _0800E434\n" // _0800E438
        "adds r0, r0, r1\n"
        "ldr r0, [r0]\n"
        "mov pc, r0\n"
        ".align 2, 0\n"
    "_0800E430: .4byte 0x0000FFF7\n"
    "_0800E434: .4byte _0800E438\n"
    "_0800E438:\n" // jump table
        ".4byte _0800E450\n" // case 0
        ".4byte _0800E450\n" // case 1
        ".4byte _0800E4B4\n" // case 2
        ".4byte _0800E45C\n" // case 3
        ".4byte _0800E4C6\n" // case 4
        ".4byte _0800E4D2\n" // case 5
    "_0800E450:\n"
        "adds r1, r3, #0\n"
        "adds r0, r4, #0\n"
        "movs r2, #1\n"
        "bl sub_800E210\n"
        "b _0800E514\n"
    "_0800E45C:\n"
        "adds r1, r3, #0\n"
        "movs r2, #0x10\n"
        "b _0800E4D6\n"
    "_0800E462:\n"
        "ldrh r0, [r4, #0x3c]\n"
        "lsls r1, r0, #0x10\n"
        "lsrs r0, r1, #0x12\n"
        "movs r2, #1\n"
        "ands r0, r2\n"
        "cmp r0, #0\n"
        "bne _0800E514\n"
        "lsrs r0, r1, #0x13\n"
        "ands r0, r2\n"
        "cmp r0, #0\n"
        "bne _0800E514\n"
        "adds r0, r4, #0\n"
        "adds r0, #0x42\n"
        "ldrb r0, [r0]\n"
        "cmp r0, #5\n"
        "bhi _0800E514\n"
        "lsls r0, r0, #2\n"
        "ldr r1, _0800E48C\n" // _0800E490
        "adds r0, r0, r1\n"
        "ldr r0, [r0]\n"
        "mov pc, r0\n"
        ".align 2, 0\n"
    "_0800E48C: .4byte _0800E490\n"
    "_0800E490:\n" // jump table
        ".4byte _0800E4A8\n" // case 0
        ".4byte _0800E4A8\n" // case 1
        ".4byte _0800E4B4\n" // case 2
        ".4byte _0800E4C0\n" // case 3
        ".4byte _0800E4C6\n" // case 4
        ".4byte _0800E4D2\n" // case 5
    "_0800E4A8:\n"
        "adds r1, r3, #0\n"
        "adds r0, r4, #0\n"
        "movs r2, #0\n"
        "bl sub_800E210\n"
        "b _0800E514\n"
    "_0800E4B4:\n"
        "adds r1, r3, #0\n"
        "adds r0, r4, #0\n"
        "adds r2, r5, #0\n"
        "bl sub_800E290\n"
        "b _0800E514\n"
    "_0800E4C0:\n"
        "adds r1, r3, #0\n"
        "movs r2, #0x10\n"
        "b _0800E4D6\n"
    "_0800E4C6:\n"
        "adds r1, r3, #0\n"
        "adds r0, r4, #0\n"
        "adds r2, r5, #0\n"
        "bl sub_800E31C\n"
        "b _0800E514\n"
    "_0800E4D2:\n"
        "adds r1, r3, #0\n"
        "movs r2, #0x30\n"
    "_0800E4D6:\n"
        "adds r0, r4, #0\n"
        "bl sub_800E31C\n"
        "b _0800E514\n"
    "_0800E4DE:\n"
        "ldrh r0, [r4, #0x3c]\n"
        "ldr r1, _0800E510\n" // 0x0000FFF7
        "ands r1, r0\n"
        "strh r1, [r4, #0x3c]\n"
        "bl EndTalk\n"
        "bl sub_808F270\n"
        "bl sub_808BB74\n"
        "adds r0, r4, #0\n"
        "adds r0, #0x41\n"
        "ldrb r0, [r0]\n"
        "cmp r0, #1\n"
        "bne _0800E506\n"
        "adds r0, r4, #0\n"
        "adds r0, #0x44\n"
        "ldrh r0, [r0]\n"
        "bl sub_800BCDC\n"
    "_0800E506:\n"
        "adds r0, r4, #0\n"
        "bl sub_800E640\n"
        "movs r0, #2\n"
        "b _0800E516\n"
        ".align 2, 0\n"
    "_0800E510: .4byte 0x0000FFF7\n"
    "_0800E514:\n"
        "movs r0, #0\n"
    "_0800E516:\n"
        "pop {r4, r5}\n"
        "pop {r1}\n"
        "bx r1\n"

        ".syntax divided\n"
    );
}

#endif // !NONMATCHING

//! FE8U = 0x0800E51C
u8 Event1C_TEXTCONT(struct EventEngineProc* proc) {
    if (EVENT_IS_SKIPPING(proc)) {
        EndTalk();
        sub_808F270();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);
    } else {
        ResumeTalk();
    }
    
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800E560
u8 Event1D_TEXTEND(struct EventEngineProc* proc) {
    if (EVENT_IS_SKIPPING(proc)) {
        EndTalk();
        sub_808F270();
        sub_808BB74();

        if (proc->execType == EV_EXEC_CUTSCENE)
            sub_800BCDC(proc->mapSpritePalIdOverride);

        sub_800E640(proc);

        gEventSlots[0xC] = 0;
    } else {
        u32 flag = FALSE;

        if ((IsTalkActive() && !IsTalkLocked()) || SomeTalkProcExists() || Proc_Find(gProcScr_BoxDialogue))
            flag = TRUE;

        if (flag == TRUE) {
            switch (proc->execType) {

            case EV_EXEC_WORLDMAP:
            case EV_EXEC_UNK4:
                return EVC_STOP_YIELD;

            default:
                switch (proc->activeTextType) {

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
        } else {
            gEventSlots[0xC] = GetTalkChoiceResult();
        }
    }

    if (proc->overwrittenTextSpeed != -1)
        gPlaySt.cfgTextSpeed = proc->overwrittenTextSpeed;

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800E640
void sub_800E640(struct EventEngineProc* proc) {
    if (proc->evStateBits & EV_STATE_FADEDIN) {
        ClearTalkBubble();
        Proc_EndEach(gProcScr_E_FACE); // end all faces
        ResetFaces();
        ClearTalkFaceRefs();
    } else if (FaceExists()) {
        ClearTalkBubble();
        Proc_ForEach(gProcScr_E_FACE, (ProcFunc) StartFaceFadeOut);
        Proc_StartBlocking(gUnknown_08591DE8, proc);
    }
}

void _WhileFace6CExists(struct Proc* proc) {
    if (!FaceExists())
        Proc_Break(proc);
}

//! FE8U = 0x0800E6B4
u8 Event1E_(struct EventEngineProc* proc) {
    u8  subcode    = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument == -1)
        evArgument = gEventSlots[2];

    if (evArgument != -3) {
        if (evArgument != -2) {
            if (EVENT_IS_SKIPPING(proc))
                return EVC_ADVANCE_CONTINUE;

            gUnknown_03000428.str[0] = subcode + 8;
            gUnknown_03000428.str[1] = 0x10;
            gUnknown_03000428.str[2] = evArgument;
            gUnknown_03000428.str[3] = 1;

            gUnknown_03000428.unk04 = 1;
            gUnknown_03000428.unk05 = 0;

            InitTalk(0x80, 2, 1);
        } else {
            gUnknown_03000428.str[0] = subcode + 8;
            gUnknown_03000428.str[1] = 0x11;
            gUnknown_03000428.str[2] = 1;
            gUnknown_03000428.str[3] = 0;

            ClearTalkBubble();
        }
    } else {
        EndTalk();
        sub_808F270();
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
u8 Event1F_(struct EventEngineProc* proc) {
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
u8 Event20_(struct EventEngineProc* proc) {
    ClearTalkBubble();
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800E7D0
u8 sub_800E7D0(u8 mode, u16 bgIndex) {
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    switch (mode) {

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

        Decompress(
            gConvoBackgroundData[bgIndex].pTileGraphics,
            (void*)(VRAM + GetBackgroundTileDataOffset(3))
        );

        // Loading Background Tile Arrangement

        CallARM_FillTileRect(
            gBG3TilemapBuffer,
            gConvoBackgroundData[bgIndex].pTileArrangement,
            0x8000 // base palette is bg palette 8
        );

        // Loading Background Palettes

        ApplyPalettes(
            gConvoBackgroundData[bgIndex].pColorPalettes,
            8,
            8
        );

        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EnablePaletteSync();

        gPaletteBuffer[0] = 0;

        return EVC_ADVANCE_YIELD;

    case 2:
        sub_80B65F8(
            gBG3TilemapBuffer,
            GetBackgroundTileDataOffset(BG_3),
            8,
            8,
            bgIndex
        );

        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EnablePaletteSync();

        return EVC_ADVANCE_YIELD;

    default:
        return EVC_ADVANCE_YIELD;

    } // switch (mode)
}

//! FE8U = 0x0800E8CC
u8 Event21_(struct EventEngineProc* proc) {
    u16 evArgument2_a, evArgument2_b, evArgument3;
    struct ConvoBackgroundFadeProc* otherProc;

    int   subcode  = EVT_SUB_CMD(proc->pEventCurrent);
    s16 evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (evArgument < 0)
        evArgument = gEventSlots[2];

    switch (subcode) {

    case 0:
        return sub_800E7D0(proc->activeTextType, evArgument);

    case 1: {
        evArgument2_a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
        evArgument3   = EVT_CMD_ARGV(proc->pEventCurrent)[2];

        switch (proc->activeTextType) {

        case 0:
        case 3:
        case 4:
        case 5:
            switch (evArgument2_a) {

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
            switch (evArgument2_a) {

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

    case 2: {
        evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
        evArgument3   = EVT_CMD_ARGV(proc->pEventCurrent)[2];

        if (EVENT_IS_SKIPPING(proc))
            return EVC_ADVANCE_CONTINUE;

        if (sub_800E7D0(proc->activeTextType, evArgument) == EVC_ERROR)
            return EVC_ERROR;

        sub_80B2780(evArgument3, 0, evArgument2_b, proc);

        break;
    }

    case 3: {
        evArgument2_b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
        evArgument3   = EVT_CMD_ARGV(proc->pEventCurrent)[2];

        if (EVENT_IS_SKIPPING(proc))
            return EVC_ADVANCE_CONTINUE;

        sub_80B272C(evArgument3, 0, evArgument2_b, proc);

        break;
    }

    } // switch (subcode)

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800EA84
void sub_800EA84(struct ConvoBackgroundFadeProc* proc) {
    SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

    BG_SetPosition(BG_2, 0, 0);

    switch (proc->fadeType) {

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
void sub_800EBB0(struct ConvoBackgroundFadeProc* proc) {
    sub_800B910(3, 2, 10);
    sub_800B954(3, 2, 1);
    sub_800B994(8, 0, 6);
    sub_800B9B8(2, -8);

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EC00
void sub_800EC00(struct ConvoBackgroundFadeProc* proc) {
    sub_800B910(2, 3, 10);
    sub_800B954(2, 3, 1);
    sub_800B994(0, 8, 6);
    sub_800B9B8(3, 8);

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EC50
void sub_800EC50(struct ConvoBackgroundFadeProc* proc) {
    switch (proc->unkType) {

    case 0:
    case 3:
    case 4:
    case 5:
        while (1) {} // oh

    case 1:
        if (proc->bgIndex == 0x37) // TODO: use an enum for convo backgrounds
            proc->bgIndex = NextRN_N(0x35);

        // Loading Background Tile Graphics

        Decompress(
            gConvoBackgroundData[proc->bgIndex].pTileGraphics,
            (void*)(VRAM + GetBackgroundTileDataOffset(BG_2))
        );

        // Loading Background Tile Arrangement

        CallARM_FillTileRect(
            gBG2TilemapBuffer,
            gConvoBackgroundData[proc->bgIndex].pTileArrangement,
            0 // base palette is bg palette 0
        );

        // Loading Background Palettes

        ApplyPalettes(
            gConvoBackgroundData[proc->bgIndex].pColorPalettes,
            0,
            6
        );

        BG_EnableSyncByMask(BG2_SYNC_BIT);
        EnablePaletteSync();

        gPaletteBuffer[0] = 0;

        break;

    case 2:
        sub_80B65F8(
            gBG2TilemapBuffer,
            GetBackgroundTileDataOffset(BG_2),
            0,
            6,
            proc->bgIndex
        );

        BG_EnableSyncByMask(BG2_SYNC_BIT);
        EnablePaletteSync();

        break;

    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800ED50
void sub_800ED50(struct ConvoBackgroundFadeProc* proc) {
    switch (proc->unkType) {

    case 0:
    case 3:
    case 4:
    case 5:
        while (1) {} // oh

    case 1:
        if (proc->bgIndex == 0x37) // TODO: use an enum for convo backgrounds
            proc->bgIndex = NextRN_N(0x35);

        // Loading Background Tile Graphics

        Decompress(
            gConvoBackgroundData[proc->bgIndex].pTileGraphics,
            (void*)(VRAM + GetBackgroundTileDataOffset(BG_3))
        );

        // Loading Background Tile Arrangement

        CallARM_FillTileRect(
            gBG3TilemapBuffer,
            gConvoBackgroundData[proc->bgIndex].pTileArrangement,
            0x8000 // base palette is bg palette 8
        );

        // Loading Background Palettes

        ApplyPalettes(
            gConvoBackgroundData[proc->bgIndex].pColorPalettes,
            8,
            6
        );

        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EnablePaletteSync();

        gPaletteBuffer[0] = 0;

        break;

    case 2:
        sub_80B65F8(
            gBG3TilemapBuffer,
            GetBackgroundTileDataOffset(BG_3),
            8,
            6,
            proc->bgIndex
        );

        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EnablePaletteSync();

        break;

    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EE54
void sub_800EE54(struct ConvoBackgroundFadeProc* proc) {
    switch (proc->unkType) {

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
        while (1) {} // oh

    }

    SetDispEnable(FALSE, FALSE, TRUE, TRUE, TRUE);
}

//! FE8U = 0x0800EEE8
void sub_800EEE8(struct ConvoBackgroundFadeProc* proc) {
    u32 currentFadeLevel = (proc->fadeTimer += proc->fadeSpeed) / 16;

    switch (proc->fadeType) {

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
void sub_800EF48(struct ConvoBackgroundFadeProc* proc) {
    switch (proc->fadeType) {

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

    CpuFastFill(0, (void*)(VRAM + GetBackgroundTileDataOffset(0)), 0x20);
    CpuFastFill(0, (void*)(VRAM + GetBackgroundTileDataOffset(1)), 0x20);
    CpuFastFill(0, (void*)(VRAM + GetBackgroundTileDataOffset(2)), 0x20);
}

//! FE8U = 0x0800F0C8
u8 Event22_(struct EventEngineProc* proc) {
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
u8 Event23_(struct EventEngineProc* proc) {
    if (!(proc->evStateBits & EV_STATE_GFXLOCKED)) {
        BMapDispSuspend();
        MU_AllDisable();
    }

    proc->evStateBits |= EV_STATE_GFXLOCKED;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F150
u8 Event24_(struct EventEngineProc* proc) {
    if (proc->evStateBits & EV_STATE_GFXLOCKED) {
        BMapDispResume();
        MU_AllEnable();
    }

    proc->evStateBits &= ~EV_STATE_GFXLOCKED;
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F17C
u8 Event25_(struct EventEngineProc* proc) {
    u8 x, y;
    short chIndex;

    {
        // order needed to match
        const u16* current = proc->pEventCurrent;

        x = ((u16*)(gEventSlots + 0xB))[0];
        y = ((u16*)(gEventSlots + 0xB))[1];

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
u8 Event26_CameraControlMaybe(struct EventEngineProc* proc) {
    s8 x;
    s8 y;

    u8 subcode = EVT_SUB_CMD_LO(proc->pEventCurrent);
    u8 sc2     = EVT_SUB_CMD_HI(proc->pEventCurrent);

    switch (subcode) {

    case 0: // position
        x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
        y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

        if (x < 0 || y < 0) {
            x = ((u16*)(gEventSlots + 0xB))[0];
            y = ((u16*)(gEventSlots + 0xB))[1];
        }

        break;

    case 1: { // unit
        struct Unit* unit = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

        if (!unit)
            return EVC_ERROR;

        x = unit->xPos;
        y = unit->yPos;

        break;
    }

    } // switch (subcode)

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN)) {
        SetSomeRealCamPos(x, y, sc2);
        SetCursorMapPosition(x, y);
        RenderBmMap();

        return EVC_ADVANCE_CONTINUE;
    } else {
        if (!sc2)
            EnsureCameraOntoPosition(proc, x, y);
        else
            sub_8015D84(proc, x, y);

        SetCursorMapPosition(x, y);

        return EVC_ADVANCE_YIELD;
    }
}

//! FE8U = 0x0800F2D4
u8 Event27_MapChange(struct EventEngineProc* proc) {
    u8 i;
    u8 count = 1;

    u32* mapChangeIt;

    u8  subcode     = EVT_SUB_CMD(proc->pEventCurrent);
    s16 mapChangeId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (mapChangeId) {

    case (-1): // "at position in Slot B"
        mapChangeId = GetMapChangeIdAt(
            ((u16*)(gEventSlots + 0xB))[0],
            ((u16*)(gEventSlots + 0xB))[1]
        );

        if (mapChangeId < 0)
            return EVC_ERROR;

        break;

    case (-2): // "at position of active unit"
        mapChangeId = GetMapChangeIdAt(
            (u8)(gActiveUnit->xPos),
            (u8)(gActiveUnit->yPos)
        );

        if (mapChangeId < 0)
            return EVC_ERROR;

        break;

    case (-3):
        mapChangeIt = gEventSlotQueue;

        mapChangeId = *mapChangeIt++;
        count = gEventSlots[0xD]; // qp

        break;

    } // switch (mapChangeId)

    if (proc->evStateBits & EV_STATE_FADEDIN) {
        // Quietly apply tile changes

        for (i = 0; i < count; ++i) {
            switch (subcode) {

            case 0:
                TriggerMapChanges(mapChangeId, FALSE, proc);
                break;

            case 1:
                sub_800BB48(mapChangeId, FALSE, proc);
                break;

            } // switch (subcode)

            mapChangeId = *mapChangeIt++; // ??? potentially not initialized?
        }
    } else {
        // Display tile changes

        u8 doDisplay = TRUE;

        for (i = 0; i < count; ++i) {
            switch (subcode) {

            case 0:
                TriggerMapChanges(mapChangeId, doDisplay, proc);
                break;

            case 1:
                sub_800BB48(mapChangeId, doDisplay, proc);
                break;

            } // switch (subcode)

            mapChangeId = *mapChangeIt++; // ??? potentially not initialized?
            doDisplay   = FALSE;          // Only display the first listed map change
        }
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F3EC
u8 Event28_ChangeWeather(struct EventEngineProc* proc) {
    SetWeather(proc->pEventCurrent[1]);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F3FC
u8 Event29_SetFogVision(struct EventEngineProc* proc) {
    u8  doDisplay = EVT_SUB_CMD(proc->pEventCurrent);
    u16 newVision = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (EVENT_IS_SKIPPING(proc))
        doDisplay = 0;

    sub_800BAA8(newVision, doDisplay, proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800F42C
u8 Event2A_MoveToChapter(struct EventEngineProc* proc) {
    u8  subcode = EVT_SUB_CMD(proc->pEventCurrent);
    s16 chIndex = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (chIndex < 0)
        chIndex = gEventSlots[2];

    switch (subcode) {

    case 0:
        SetNextGameActionId(GAME_ACTION_0);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case 1:
        SetNextChapterId(chIndex);

        gPlaySt.unk4A_2 = 1;

        SetNextGameActionId(GAME_ACTION_1);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case 2:
        SetNextChapterId(chIndex);

        gPlaySt.unk4A_2 = 2;

        SetNextGameActionId(GAME_ACTION_2);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case 3:
        GotoChapterWithoutSave(chIndex);
        break;

    case 4:
        gPlaySt.unk4A_2 = 3;

        SetNextGameActionId(GAME_ACTION_3);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    } // switch (subcode)

    proc->evStateBits |= EV_STATE_CHANGECH;

    DeleteAll6CWaitMusicRelated();
    Sound_FadeOutBGM(4);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800F50C
u16 sub_800F50C(const struct UnitDefinition* unitDefinition) {
    u16 result = 0;

    while (unitDefinition->charIndex) {
        ++result;
        ++unitDefinition;
    }

    return result;
}

//! FE8U = 0x0800F528
s8 ShouldUNITBeLoaded(const struct UnitDefinition* unitDefinition, u8 unk) {
    const u8 tmp = unk; // needed to match :/

    if (unitDefinition->allegiance == 0 && tmp != 1) {
        struct Unit* unit = GetUnitFromCharId(unitDefinition->charIndex);

        if (unit && (unit->state & US_DEAD)) {
            switch (tmp) {

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

    if (!unitDefinition->sumFlag && !unitDefinition->redaCount) {
        if (gBmMapUnit[unitDefinition->yPosition][unitDefinition->xPosition])
            return FALSE;
    }

    if (IsUnitSlotAvailable(0x80))
        return TRUE;

    return FALSE;
}

//! FE8U = 0x0800F5B8
void sub_800F5B8(struct EventEngineProc* proc) {
    const struct UnitDefinition* pUnitDefinition = proc->pUnitLoadData;

    s16 count = proc->unitLoadCount;
    u8 param = proc->unitLoadParameter;

    u16 something = GetSomeEventEngineMoveRelatedBitfield(proc, TRUE);

    s8 r3 = FALSE;

    if (param == 2)
        r3 = TRUE;

    if ((proc->evStateBits >> 2) & 1) {
        sub_800F698(pUnitDefinition, count, param);
    } else {
        for (; pUnitDefinition->charIndex && count > 0; ++pUnitDefinition) {
            if (ShouldUNITBeLoaded(pUnitDefinition, param) != TRUE)
                continue;

            if (!TryPrepareEventUnitMovement(proc, pUnitDefinition->xPosition, pUnitDefinition->yPosition)) {
                proc->pUnitLoadData = pUnitDefinition;
                proc->unitLoadCount = count;
                return;
            }

            LoadUnit_800F704(pUnitDefinition, something, FALSE, r3);
            count--;
        }
    }

    proc->unitLoadCount = 0;
    proc->idk4E         = 0;
    proc->pCallback     = NULL;
}

void sub_800F698(const struct UnitDefinition* def, s16 count, u8 param) {
    s8 r3 = FALSE;

    if (param == 2)
        r3 = TRUE;

    for (; def->charIndex && count > 0; ++def) {
        if (ShouldUNITBeLoaded(def, param) != TRUE)
            continue;

        LoadUnit_800F704(def, 1, TRUE, r3);
        count--;
    }
}

//! FE8U = 0x0800F704
void LoadUnit_800F704(const struct UnitDefinition* def, u16 b, s8 quiet, s8 d) {
    struct Unit* unit;

    u8 allegianceLookup[3];
    memcpy(allegianceLookup, gUnknown_080D793C, sizeof allegianceLookup);

    // u8 allegianceLookup[] = { 0x00, 0x40, 0x80 }; // TODO

    if (def->allegiance == 0) {
        unit = GetUnitFromCharIdAndFaction(def->charIndex, FACTION_BLUE);
    } else {
        unit = GetUnitFromCharIdAndFaction(def->charIndex, FACTION_BLUE);

        if (unit) {
            UnitChangeFaction(unit, allegianceLookup[def->allegiance]);
            unit = GetUnitFromCharId(def->charIndex);
        }
    }

    if (!unit) {
        unit = LoadUnit(def);

        if ((d == 1) && (def->allegiance == FACTION_ID_BLUE))
            unit->state |= US_BIT22;
    } else if (def->allegiance == FACTION_ID_BLUE) {
        s8 x, y;

        unit->state &= ~US_UNSELECTABLE;

        if (d == 1) {
            if (unit->state & US_DEAD)
                unit->state |= US_BIT22;
        } else {
            if (unit->state & US_BIT22)
                unit->state &= ~US_BIT22;
        }

        GetPreferredPositionForUNIT(def, &x, &y, 0);

        if (unit->xPos == x && unit->yPos == y)
            b &= ~0x0001;
    }

    unit->xPos = def->xPosition;
    unit->yPos = def->yPosition;

    if (def->allegiance == FACTION_ID_RED && unit->pCharacterData->number >= 0x3C) {
        if (!gPlaySt.cfgController) {
            if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
                UnitApplyBonusLevels(
                    unit,
                    -GetROMChapterStruct(gPlaySt.chapterIndex)->easyModeLevelMalus
                );
            else
                goto hard_mode;
        } else {
            if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
            hard_mode:
                UnitApplyBonusLevels(
                    unit,
                    GetROMChapterStruct(gPlaySt.chapterIndex)->difficultModeLevelBonus
                );
            else
                UnitApplyBonusLevels(
                    unit,
                    -GetROMChapterStruct(gPlaySt.chapterIndex)->normalModeLevelMalus
                );
        }
    }

    sub_800F8A8(
        unit,
        def,
        b,
        quiet
    );
}

//! FE8U = 0x0800F8A8
void sub_800F8A8(struct Unit* unit, const struct UnitDefinition* unitDefition, u16 flags, s8 unk) {
    if (!unit)
        return;

    if (unitDefition->sumFlag == 1)
        flags |= 0x0002;

    if (!unitDefition->redaCount) {
        MoveUnit_(unit, unitDefition->xPosition, unitDefition->yPosition, flags);
        return;
    }

    if (unk == 1 || (unit->state & US_UNDER_A_ROOF))
        sub_8079FA8(unit, unitDefition->redas, unitDefition->redaCount, flags);
    else
        sub_8079D74(unit, unitDefition->redas, unitDefition->redaCount, flags);
}

#if NONMATCHING

/* https://decomp.me/scratch/ygtjL */

//! FE8U = 0x0800F914
struct UnitDefinition* sub_800F914(const struct UnitDefinition* source, short count, u8 arg2, s8 arg3, s8 arg4) {
    struct UnitDefinition* result;

    u8  array[0x40];
    u16 arraySize = 0;

    struct {
        unsigned loBits, hiBits;
    } mask;

    u16 i = 0;

    if (arg2) {
        const struct UnitDefinition* itSource = source;

        for (; i < count; i++) {
            if (itSource->sumFlag) {
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

    while (i) {
        unsigned index = array[NextRN_N(arraySize)];

        if (!MASK_BIT_GET(index)) {
            MASK_BIT_SET(index);
            i--;
        }
    }

    result = end;

    for (i = 0; i < count; i++) {
        if (MASK_BIT_GET(i))
            continue;

        *result = source[i];
        result->sumFlag = FALSE;
        result++;
    }

    for (i = 0; i < count; i++) {
        if (!MASK_BIT_GET(i))
            continue;

        *result = source[i];
        result->sumFlag = TRUE;
        result++;
    }

    result->charIndex = 0; // marks the end of the unit block

    if (arg4 == TRUE) {
        result = end;

        for (i = 0; i < count; i++) {
            result->redaCount = 0;
            result->redas     = NULL;

            result++;
        }
    }

    result = end;

    if (arg3 == TRUE)
        sub_80125C0(result);

    #undef MASK_BIT_GET
    #undef MASK_BIT_SET

    return result;
}

#else // #if !NONMATCHING

__attribute__((naked))
struct UnitDefinition* sub_800F914(const struct UnitDefinition* source, short count, u8 arg2, s8 arg3, s8 arg4) {
    asm(
        ".syntax unified\n"

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
    "_0800FA34: .4byte end\n"
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

        ".syntax divided\n"
    );
}

#endif // !NONMATCHING

//! FE8U = 0x0800FB18
u8 Event2B_(struct EventEngineProc* proc) {
    u8  subcode  = EVT_SUB_CMD(proc->pEventCurrent);
    s16 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (argument < 0)
        argument = gEventSlots[2];

    switch (subcode) {

    case 0: {
        proc->unitLoadCount = argument;
        break;
    }

    case 1: {
        if (argument < 0)
            argument = 0;

        if (argument > 100)
            argument = 100;

        proc->idk4E = argument;

        break;
    }

    case 2: {
        proc->unk4F_7 = TRUE;
        break;
    }

    } // switch (subcode)

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FB84
u8 Event2C_LoadUnits(struct EventEngineProc* proc) {
    u8 subcode  = EVT_SUB_CMD(proc->pEventCurrent);
    u8 argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    const struct UnitDefinition* ud = (const struct UnitDefinition *)EVT_CMD_ARG32_LE(proc->pEventCurrent);

    u16 count = proc->unitLoadCount;

    switch (subcode) {

    case 1:
        argument = 2;

    case 0:
    case 2:
        if ((int)(ud) < 0)
            ud = (const struct UnitDefinition*)(gEventSlots[2]);

        break;

    case 3:
        ud = GetChapterEnemyUnitDefinitions();

        break;

    } // switch (subcode)

    if (count == 0)
        count = sub_800F50C(ud);

    ud = sub_800F914(ud, count, proc->idk4E, subcode == 2, proc->unk4F_7);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN)) {
        sub_800F698(ud, count, argument);

        proc->unitLoadCount = 0;
        proc->idk4E = 0;
    } else {
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
u8 TryPrepareEventUnitMovement(struct EventEngineProc* proc, int x, int y) {
    if (proc->evStateBits & EV_STATE_UNITCAM) {
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
u32 GetSomeEventEngineMoveRelatedBitfield(struct EventEngineProc* proc, s8 unk) {
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
u8 Event2D_(struct EventEngineProc* proc) {
    u16 palId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    sub_800BCDC(palId);
    proc->mapSpritePalIdOverride = palId;

    return EVC_ADVANCE_CONTINUE;
}
