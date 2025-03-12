#include "global.h"

#include "ctc.h"
#include "scene.h"
#include "hardware.h"

#include "worldmap.h"

//! FE8U = 0x080C34D0
void sub_80C34D0(u16 * dstPal, int b, u16 colorA, u16 colorB)
{
    int i;

    for (i = 0; i < b; i++)
    {
        int color = (b - i);

        dstPal[i] = (((color * (colorA & RED_MASK) + i * (colorB & RED_MASK)) / b) & RED_MASK) +
            (((color * (colorA & GREEN_MASK) + i * (colorB & GREEN_MASK)) / b) & GREEN_MASK) +
            (((color * (colorA & BLUE_MASK) + i * (colorB & BLUE_MASK)) / b) & BLUE_MASK);
    }

    return;
}

//! FE8U = 0x080C3590
void ClearWmTextVram(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        CpuFastFill(0, (void *)(0x06014000 + i * 0x400), 0x380);
    }

    return;
}

struct GMapTextProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 drawAtBottom;
    /* 2A */ u8 visible;
};

//! FE8U = 0x080C35C4
void WmText_Init(struct GMapTextProc * proc)
{
    proc->drawAtBottom = 1;
    proc->visible = 0;

    ClearWmTextVram();

    gWmHblankStatus &= ~1;

    return;
}

// clang-format off

u16 CONST_DATA Sprite_WmText[] =
{
    4,
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM1_X(8), OAM2_CHR(0x200),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM1_X(72), OAM2_CHR(0x208),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM1_X(136), OAM2_CHR(0x210),
    OAM0_SHAPE_32x32 + OAM0_Y(8), OAM1_SIZE_32x32 + OAM1_X(200), OAM2_CHR(0x218),
};

// clang-format on

//! FE8U = 0x080C35EC
void WmText_Loop_DrawText(struct GMapTextProc * proc)
{
    int y;

    if (proc->visible == 0)
    {
        return;
    }

    y = 0;

    if (proc->drawAtBottom == 1)
    {
        y = 111;
    }

    PutSpriteExt(1, 0, y, Sprite_WmText, OAM2_PAL(2));

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_WorldMapTextHandler[] =
{
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_CALL(WmText_Init),
    PROC_YIELD,

    PROC_REPEAT(WmText_Loop_DrawText),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C3624
void ShowWmText(u8 atBottom)
{
    struct GMapTextProc * proc = Proc_Find(ProcScr_WorldMapTextHandler);

    if (proc != NULL)
    {
        ClearWmTextVram();
        gWmHblankStatus &= ~1;
        proc->drawAtBottom = atBottom;
        proc->visible = 1;
    }

    return;
}

//! FE8U = 0x0800CDC8
void HideWmText(void)
{
    struct GMapTextProc * proc = Proc_Find(ProcScr_WorldMapTextHandler);

    if (proc != NULL)
    {
        gWmHblankStatus &= ~1;
        proc->visible = 0;
    }

    return;
}

//! FE8U = 0x080C368C
ProcPtr StartWmTextHandler(ProcPtr parent)
{
    return Proc_Start(ProcScr_WorldMapTextHandler, parent);
}

//! FE8U = 0x080C36A0
void StartWmTextMsg(int textId)
{
    EndTalk();

    InitSpriteTalk(0x200, 2, 2);
    EnablePaletteSync();

    StartTalkMsg(1, 15, textId);

    SetTalkPrintDelay(4);

    SetTalkFlag(TALK_FLAG_SPRITE);
    SetTalkFlag(TALK_FLAG_7);
    SetTalkFlag(TALK_FLAG_NOSKIP);
    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);

    return;
}
