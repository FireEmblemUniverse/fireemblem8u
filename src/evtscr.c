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

    /* u32 arg1, todo for getting a better format */
    u32 value = *((u32 *)(EVT_CMD_ARGV(proc->pEventCurrent) + 1));

    gEventSlots[index] = value;
    return EV_RET_DEFAULT;
}

#if NONMATCHING

u8 Event06_SlotOperation(struct EventEngineProc * proc)
{
    int sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 arg = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 reg1 = arg & 0xF;
    u8 reg2 = ((arg << 0x10) >> 0x14) & 0xF;
    u8 reg3 = ((arg << 0x10) >> 0x18) & 0xF;

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
    const u16 * scr = proc->pEventCurrent;
    int sub_cmd = EVT_SUB_CMD(scr);
    u16 slot;

    switch (sub_cmd)
    {
    case EVSUBCMD_SENQUEUE:
        SlotQueuePush(gEventSlots[EVT_CMD_ARGV(scr)[0]]);
        break;

    case EVSUBCMD_SDEQUEUE_S1:
        SlotQueuePush(gEventSlots[0x1]);
        break;

    case EVSUBCMD_SDEQUEUE:
        slot = EVT_CMD_ARGV(scr)[0];
        gEventSlots[(s16)slot] = SlotQueuePop();
        break;
    }

    return EV_RET_DEFAULT;
}

#else

NAKEDFUNC
u8 Event06_SlotOperation(struct EventEngineProc * proc)
{
    asm("\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        ldr r2, [r0, #0x38]\n\
        ldrb r0, [r2]\n\
        movs r1, #0xf\n\
        adds r4, r1, #0\n\
        ands r4, r0\n\
        ldrh r0, [r2, #2]\n\
        adds r3, r1, #0\n\
        ands r3, r0\n\
        lsls r0, r0, #0x10\n\
        lsrs r5, r0, #0x14\n\
        ands r5, r1\n\
        lsrs r6, r0, #0x18\n\
        ands r6, r1\n\
        cmp r4, #9\n\
        bls _0800D7B6\n\
        b _0800D910\n\
    _0800D7B6:\n\
        lsls r0, r4, #2\n\
        ldr r1, _0800D7C0  @ _0800D7C4\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
    _0800D7C0: .4byte _0800D7C4\n\
    _0800D7C4: @ jump table\n\
        .4byte _0800D7EC @ case 0\n\
        .4byte _0800D808 @ case 1\n\
        .4byte _0800D824 @ case 2\n\
        .4byte _0800D844 @ case 3\n\
        .4byte _0800D860 @ case 4\n\
        .4byte _0800D880 @ case 5\n\
        .4byte _0800D89C @ case 6\n\
        .4byte _0800D8B8 @ case 7\n\
        .4byte _0800D8D4 @ case 8\n\
        .4byte _0800D8F0 @ case 9\n\
    _0800D7EC:\n\
        ldr r2, _0800D804  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        adds r1, r1, r0\n\
        b _0800D904\n\
        .align 2, 0\n\
    _0800D804: .4byte gEventSlots\n\
    _0800D808:\n\
        ldr r2, _0800D820  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        subs r1, r1, r0\n\
        b _0800D904\n\
        .align 2, 0\n\
    _0800D820: .4byte gEventSlots\n\
    _0800D824:\n\
        ldr r2, _0800D840  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        muls r0, r1, r0\n\
        str r0, [r3]\n\
        movs r0, #0\n\
        b _0800D912\n\
        .align 2, 0\n\
    _0800D840: .4byte gEventSlots\n\
    _0800D844:\n\
        ldr r2, _0800D85C  @ gEventSlots\n\
        lsls r4, r3, #2\n\
        adds r4, r4, r2\n\
        lsls r0, r5, #2\n\
        adds r0, r0, r2\n\
        lsls r1, r6, #2\n\
        adds r1, r1, r2\n\
        ldr r0, [r0]\n\
        ldr r1, [r1]\n\
        bl __udivsi3\n\
        b _0800D876\n\
        .align 2, 0\n\
    _0800D85C: .4byte gEventSlots\n\
    _0800D860:\n\
        ldr r2, _0800D87C  @ gEventSlots\n\
        lsls r4, r3, #2\n\
        adds r4, r4, r2\n\
        lsls r0, r5, #2\n\
        adds r0, r0, r2\n\
        lsls r1, r6, #2\n\
        adds r1, r1, r2\n\
        ldr r0, [r0]\n\
        ldr r1, [r1]\n\
        bl __umodsi3\n\
    _0800D876:\n\
        str r0, [r4]\n\
        movs r0, #0\n\
        b _0800D912\n\
        .align 2, 0\n\
    _0800D87C: .4byte gEventSlots\n\
    _0800D880:\n\
        ldr r2, _0800D898  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        ands r1, r0\n\
        b _0800D904\n\
        .align 2, 0\n\
    _0800D898: .4byte gEventSlots\n\
    _0800D89C:\n\
        ldr r2, _0800D8B4  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        orrs r1, r0\n\
        b _0800D904\n\
        .align 2, 0\n\
    _0800D8B4: .4byte gEventSlots\n\
    _0800D8B8:\n\
        ldr r2, _0800D8D0  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        eors r1, r0\n\
        b _0800D904\n\
        .align 2, 0\n\
    _0800D8D0: .4byte gEventSlots\n\
    _0800D8D4:\n\
        ldr r2, _0800D8EC  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        lsls r1, r0\n\
        b _0800D904\n\
        .align 2, 0\n\
    _0800D8EC: .4byte gEventSlots\n\
    _0800D8F0:\n\
        ldr r2, _0800D90C  @ gEventSlots\n\
        lsls r3, r3, #2\n\
        adds r3, r3, r2\n\
        lsls r1, r5, #2\n\
        adds r1, r1, r2\n\
        lsls r0, r6, #2\n\
        adds r0, r0, r2\n\
        ldr r1, [r1]\n\
        ldr r0, [r0]\n\
        lsrs r1, r0\n\
    _0800D904:\n\
        str r1, [r3]\n\
        movs r0, #0\n\
        b _0800D912\n\
        .align 2, 0\n\
    _0800D90C: .4byte gEventSlots\n\
    _0800D910:\n\
        movs r0, #6\n\
    _0800D912:\n\
        pop {r4, r5, r6}\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}

NAKEDFUNC
u8 Event07_SlotQueueOperations(struct EventEngineProc * proc)
{
    asm("\
	.syntax unified\n\
        push {r4, lr}\n\
        ldr r1, [r0, #0x38]\n\
        ldrb r0, [r1]\n\
        movs r2, #0xf\n\
        ands r2, r0\n\
        adds r0, r2, #0\n\
        cmp r2, #1\n\
        beq _0800D950\n\
        cmp r2, #1\n\
        bgt _0800D932\n\
        cmp r2, #0\n\
        beq _0800D938\n\
        b _0800D970\n\
    _0800D932:\n\
        cmp r0, #2\n\
        beq _0800D960\n\
        b _0800D970\n\
    _0800D938:\n\
        ldr r0, _0800D94C  @ gEventSlots\n\
        movs r2, #2\n\
        ldrsh r1, [r1, r2]\n\
        lsls r1, r1, #2\n\
        adds r1, r1, r0\n\
        ldr r0, [r1]\n\
        bl SlotQueuePush\n\
        b _0800D970\n\
        .align 2, 0\n\
    _0800D94C: .4byte gEventSlots\n\
    _0800D950:\n\
        ldr r0, _0800D95C  @ gEventSlots\n\
        ldr r0, [r0, #4]\n\
        bl SlotQueuePush\n\
        b _0800D970\n\
        .align 2, 0\n\
    _0800D95C: .4byte gEventSlots\n\
    _0800D960:\n\
        ldrh r4, [r1, #2]\n\
        bl SlotQueuePop\n\
        ldr r2, _0800D978  @ gEventSlots\n\
        lsls r1, r4, #0x10\n\
        asrs r1, r1, #0xe\n\
        adds r1, r1, r2\n\
        str r0, [r1]\n\
    _0800D970:\n\
        movs r0, #0\n\
        pop {r4}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _0800D978: .4byte gEventSlots\n\
	.syntax divided\n\
    ");
}

#endif

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
    int dst = EVT_CMD_ARG_PTR(proc->pEventCurrent);

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

    /* u32 arg1, todo for getting a better format */
    int ptr = *((u32 *)(EVT_CMD_ARGV(proc->pEventCurrent) + 1));

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

#if NONMATCHING

u8 Event0C_Branch(struct EventEngineProc * proc)
{
    int sub_cmd;
    u16 arg1;
    u16 arg2;
    int val1;
    int val2;

    sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);

    arg1 = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    arg2 = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    val1 = gEventSlots[arg1];
    val2 = gEventSlots[arg2];

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
    u8 _cmd_mask;
    u8 _cmd;
    void (* func)(struct EventEngineProc *);

    _cmd = *(const u8 *)(proc->pEventCurrent);
    _cmd_mask = 0xF;

    func = (void *)EVT_CMD_ARG_PTR(proc->pEventCurrent);

    if ((_cmd & _cmd_mask) == 0x1 && ((proc->evStateBits >> 2) & 0x1))
        return EV_RET_DEFAULT;

    func(proc);
    return EV_RET_2;
}

#else

NAKEDFUNC
u8 Event0C_Branch(struct EventEngineProc * proc)
{
    asm("\
	.syntax unified\n\
        push {r4, r5, lr}\n\
        adds r4, r0, #0\n\
        ldr r0, [r4, #0x38]\n\
        ldrb r1, [r0]\n\
        movs r5, #0xf\n\
        ands r5, r1\n\
        ldrh r3, [r0, #4]\n\
        ldrh r2, [r0, #6]\n\
        ldr r1, _0800DAA4  @ gEventSlots\n\
        lsls r0, r3, #2\n\
        adds r0, r0, r1\n\
        ldr r3, [r0]\n\
        lsls r0, r2, #2\n\
        adds r0, r0, r1\n\
        ldr r2, [r0]\n\
        cmp r5, #5\n\
        bhi _0800DAF6\n\
        lsls r0, r5, #2\n\
        ldr r1, _0800DAA8  @ _0800DAAC\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
    _0800DAA4: .4byte gEventSlots\n\
    _0800DAA8: .4byte _0800DAAC\n\
    _0800DAAC: @ jump table\n\
        .4byte _0800DAC4 @ case 0\n\
        .4byte _0800DACA @ case 1\n\
        .4byte _0800DAD0 @ case 2\n\
        .4byte _0800DAD6 @ case 3\n\
        .4byte _0800DADC @ case 4\n\
        .4byte _0800DAE2 @ case 5\n\
    _0800DAC4:\n\
        cmp r3, r2\n\
        beq _0800DAE6\n\
        b _0800DAF2\n\
    _0800DACA:\n\
        cmp r3, r2\n\
        bne _0800DAE6\n\
        b _0800DAF2\n\
    _0800DAD0:\n\
        cmp r3, r2\n\
        bge _0800DAE6\n\
        b _0800DAF2\n\
    _0800DAD6:\n\
        cmp r3, r2\n\
        bgt _0800DAE6\n\
        b _0800DAF2\n\
    _0800DADC:\n\
        cmp r3, r2\n\
        ble _0800DAE6\n\
        b _0800DAF2\n\
    _0800DAE2:\n\
        cmp r3, r2\n\
        bge _0800DAF2\n\
    _0800DAE6:\n\
        adds r0, r4, #0\n\
        bl Event09_Goto\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        b _0800DAF8\n\
    _0800DAF2:\n\
        movs r0, #0\n\
        b _0800DAF8\n\
    _0800DAF6:\n\
        movs r0, #6\n\
    _0800DAF8:\n\
        pop {r4, r5}\n\
        pop {r1}\n\
        bx r1\n\
	.syntax divided\n\
    ");
}

NAKEDFUNC
u8 Event0D_AsmCall(struct EventEngineProc * proc)
{
    asm("\
	.syntax unified\n\
        push {r4, lr}\n\
        adds r4, r0, #0\n\
        ldr r0, [r4, #0x38]\n\
        ldrb r2, [r0]\n\
        movs r1, #0xf\n\
        ldrh r3, [r0, #4]\n\
        ldrh r0, [r0, #6]\n\
        lsls r0, r0, #0x10\n\
        orrs r3, r0\n\
        ands r1, r2\n\
        cmp r1, #1\n\
        bne _0800DB28\n\
        ldrh r0, [r4, #0x3c]\n\
        lsrs r0, r0, #2\n\
        movs r1, #1\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0800DB28\n\
        movs r0, #0\n\
        b _0800DB30\n\
    _0800DB28:\n\
        adds r0, r4, #0\n\
        bl _call_via_r3\n\
        movs r0, #2\n\
    _0800DB30:\n\
        pop {r4}\n\
        pop {r1}\n\
        bx r1\n\
	.syntax divided\n\
    ");
}

#endif
