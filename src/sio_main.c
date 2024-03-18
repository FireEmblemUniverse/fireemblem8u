#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "sio.h"
#include "sio_core.h"

u32 SioStrCpy(u8 const * src, u8 * dst)
{
    u32 ret = 0;
    while (*src != '\0')
    {
        *dst++ = *src++;
        ret++;
    }
    *dst = *src;
    return ret;
}

void SioDrawNumber(struct Text * text, int x, int color, int number)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawNumber(text, number);
}

struct ProcCmd CONST_DATA ProcScr_SIOCON[] = {
    PROC_NAME("SIOCON"),
    PROC_15,
    PROC_CALL(SioInit),
    PROC_REPEAT(SioPollingMsgAndAck),
    PROC_END,
};

void SioInit(void)
{
    SioRegisterIrq();
    sub_8041898();

    gSioSt->unk_001 = 1;
    gSioSt->unk_004 = 0;
}

void SioPollingMsgAndAck(ProcPtr proc)
{
    u16 magic = 0x2586;
    if (SioPollingMsg() != -1)
    {
        gSioSt->unk_011 = 0;
        gSioSt->unk_004 = 5;
        gSioSt->selfId = GetSioIndex();
        SioSend16(&magic, -1);
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_SIOVSYNC[] = {
    PROC_NAME("SIOVSYNC"),
    PROC_15,
    PROC_YIELD,
    PROC_REPEAT(SioVsync_Loop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_SIOMAIN[] = {
    PROC_NAME("SIOMAIN"),
    PROC_15,
    PROC_REPEAT(SioMain_Loop),
    PROC_END,
};

CONST_DATA u8 * gpSioUnkBuffer = gGenericBuffer;

void SetBmStLinkArenaFlag(void)
{
    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;
}

void UnsetBmStLinkArenaFlag(void)
{
    gBmSt.gameStateBits &= ~BM_FLAG_LINKARENA;
}

bool CheckInLinkArena(void)
{
    return !!(gBmSt.gameStateBits & BM_FLAG_LINKARENA);
}

void sub_8042EA8(void)
{
    gLinkArenaSt.unk_04 = -1;
}

struct ProcCmd CONST_DATA gUnknown_085A93A0[] = {
    PROC_CALL(sub_8042EB4),
    PROC_REPEAT(sub_8042EF0),
    PROC_END,
};

void sub_8042EB4(struct Proc_Sio_085A93A0 * proc)
{
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    proc->timer = 0;
}

void sub_8042EF0(struct Proc_Sio_085A93A0 * proc)
{
    int time = (++proc->timer) % 0x40;

    if (time >= 0x20)
        time = 0x40 - time;

    if (time > 0x10)
        time = 0x10;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);
    SetBlendAlpha(time, 0x10 - time);
}

void sub_8042F44(void)
{
    gLCDControlBuffer.bgoffset[BG_1].x++;
    gLCDControlBuffer.bgoffset[BG_2].x--;
}

void sub_8042F58(ProcPtr proc)
{
    gSioSt->unk_030 = 0x1288;
    if (gSioSt->unk_1B7E != 0)
        Proc_Break(proc);
}

void sub_8042F84(void)
{
    gSioSt->unk_00A = 1 << gSioSt->selfId;
}

void sub_8042F98(ProcPtr proc)
{
    gSioMsgBuf.kind = 0x89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;

    SioSend(&gSioMsgBuf, 4);

    if ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->unk_009)
    {
        gSioSt->unk_00A = 1 << gSioSt->selfId;
        Proc_Break(proc);
    }
}

