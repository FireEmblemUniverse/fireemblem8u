#include "global.h"
#include "proc.h"
#include "rng.h"

#include "ev_triggercheck.h"
#include "event.h"

u8 Event00_NULL(struct EventEngineProc * proc)
{
    return EV_RET_DEFAULT;
}

u8 Event01_End(struct EventEngineProc * proc)
{
    s8 i;
    u16 flag;

    if ((proc->evStateBits & EV_STATE_ABORT) == 0)
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
            return EV_RET_DEFAULT;
        }

        switch (proc->execType)
        {
        case EV_EXEC_WORLDMAP:
            proc->execType = EV_EXEC_UNK4;
            return EV_RET_BREAK;

        case EV_EXEC_CUTSCENE:
            proc->evStateBits &= ~EV_STATE_SKIPPING;
            proc->evStateBits |= EV_STATE_NOSKIP;

            proc->execType = EV_EXEC_UNK5;

            proc->pEventIdk = gEvent_08592114;
            proc->pEventCurrent = gEvent_08592114;

            return EV_RET_1;

        default:
            return EV_RET_BREAK;
        }
    }

    return EV_RET_BREAK;
}

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

    return EV_RET_DEFAULT;
}

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

    return EV_RET_DEFAULT;
}

u8 Event04_CheckRandom(struct EventEngineProc * proc)
{
    u16 max = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (max == 0)
        gEventSlots[0xC] = 0;
    else
        gEventSlots[0xC] = NextRN_N(max + 1);

    return EV_RET_DEFAULT;
}

u8 Event05_SetSlot(struct EventEngineProc * proc)
{
    u16 index = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 value = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    gEventSlots[index] = value;
    return EV_RET_DEFAULT;
}

u8 Event06_SlotOperation(struct EventEngineProc * proc)
{
    u32 reg1, reg2, reg3;
    u8 sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];
#ifndef NONMATCHING
    u8 argLow;
    asm("":::"memory");
    argLow = arg;
    reg1 = argLow % 0x10;
    ++arg; --arg;
    reg2 = (arg >> 4) % 0x10;
    reg3 = (arg >> 8) % 0x10;
#else
    reg1 = arg % 0x10;
    reg2 = (arg >> 4) % 0x10;
    reg3 = (arg >> 8) % 0x10;
#endif

    switch (sub_cmd)
    {
    case EVSUBCMD_SADD:
        gEventSlots[reg1] = gEventSlots[reg2] + gEventSlots[reg3];
        return EV_RET_DEFAULT;
    
    case EVSUBCMD_SSUB:
        gEventSlots[reg1] = gEventSlots[reg2] - gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SMUL:
        gEventSlots[reg1] = gEventSlots[reg2] * gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SDIV:
        gEventSlots[reg1] = gEventSlots[reg2] / gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SMOD:
        gEventSlots[reg1] = gEventSlots[reg2] % gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SAND:
        gEventSlots[reg1] = gEventSlots[reg2] & gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SORR:
        gEventSlots[reg1] = gEventSlots[reg2] | gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SXOR:
        gEventSlots[reg1] = gEventSlots[reg2] ^ gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SLSL:
        gEventSlots[reg1] = gEventSlots[reg2] << gEventSlots[reg3];
        return EV_RET_DEFAULT;

    case EVSUBCMD_SLSR:
        gEventSlots[reg1] = gEventSlots[reg2] >> gEventSlots[reg3];
        return EV_RET_DEFAULT;
    
    default:
        return EV_RET_ERR;
    }
}

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

    return EV_RET_DEFAULT;
}

u8 Event08_Label(struct EventEngineProc * proc)
{
    return EV_RET_DEFAULT;
}

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
        return EV_RET_DEFAULT;

    while (scr != ref)
    {
        cur += EVT_CMD_LEN(cur);
        scr = *(const u32 *)cur;
    }

    if (scr == ref)
        proc->pEventCurrent = cur;

    return EV_RET_DEFAULT;
}

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
    return EV_RET_4;
}

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

    return EV_RET_DEFAULT;
}

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

        return EV_RET_DEFAULT;
    
    case 1:
        if (val1 != val2)
            return Event09_Goto(proc);

        return EV_RET_DEFAULT;
    
    case 2:
        if (val1 >= val2)
            return Event09_Goto(proc);

        return EV_RET_DEFAULT;
    
    case 3:
        if (val1 > val2)
            return Event09_Goto(proc);

        return EV_RET_DEFAULT;
    
    case 4:
        if (val1 <= val2)
            return Event09_Goto(proc);

        return EV_RET_DEFAULT;
    
    case 5:
        if (val1 < val2)
            return Event09_Goto(proc);

        return EV_RET_DEFAULT;
    
    default:
        return EV_RET_ERR;
    }
}

u8 Event0D_AsmCall(struct EventEngineProc * proc)
{
    u32 _cmd_mask;
    u8 _cmd;
    void (* func)(struct EventEngineProc *);

    _cmd = *proc->pEventCurrent;
    _cmd_mask = 0xF;

    func = (void *)EVT_CMD_ARG32_BE(proc->pEventCurrent);

    if ((_cmd_mask &= _cmd) == 0x1 && ((proc->evStateBits >> 2) & 0x1))
        return EV_RET_DEFAULT;

    func(proc);
    return EV_RET_2;
}
