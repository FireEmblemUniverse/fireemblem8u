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
void sub_80C3590(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        CpuFastFill(0, (void *)(0x06014000 + i * 0x400), 0x380);
    }

    return;
}

struct GMap8A3EE44Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
};

//! FE8U = 0x080C35C4
void sub_80C35C4(struct GMap8A3EE44Proc * proc)
{
    proc->unk_29 = 1;
    proc->unk_2a = 0;

    sub_80C3590();

    gWmHblankStatus &= ~1;

    return;
}

// clang-format off

u16 CONST_DATA gUnknown_08A3EE28[] =
{
    4,
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM1_X(8), OAM2_CHR(0x200),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM1_X(72), OAM2_CHR(0x208),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM1_X(136), OAM2_CHR(0x210),
    OAM0_SHAPE_32x32 + OAM0_Y(8), OAM1_SIZE_32x32 + OAM1_X(200), OAM2_CHR(0x218),
};

// clang-format on

//! FE8U = 0x080C35EC
void sub_80C35EC(struct GMap8A3EE44Proc * proc)
{
    int y;

    if (proc->unk_2a == 0)
    {
        return;
    }

    y = 0;

    if (proc->unk_29 == 1)
    {
        y = 111;
    }

    PutSpriteExt(1, 0, y, gUnknown_08A3EE28, OAM2_PAL(2));

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3EE44[] =
{
    PROC_MARK(PROC_MARK_8),

    PROC_CALL(sub_80C35C4),
    PROC_YIELD,

    PROC_REPEAT(sub_80C35EC),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C3624
void StartWmText(u8 flag)
{
    struct GMap8A3EE44Proc * proc = Proc_Find(gUnknown_08A3EE44);

    if (proc != NULL)
    {
        sub_80C3590();
        gWmHblankStatus &= ~1;
        proc->unk_29 = flag;
        proc->unk_2a = 1;
    }

    return;
}

//! FE8U = 0x0800CDC8
void RemoveWmText(void)
{
    struct GMap8A3EE44Proc * proc = Proc_Find(gUnknown_08A3EE44);

    if (proc != NULL)
    {
        gWmHblankStatus &= ~1;
        proc->unk_2a = 0;
    }

    return;
}

//! FE8U = 0x080C368C
ProcPtr sub_80C368C(ProcPtr parent)
{
    return Proc_Start(gUnknown_08A3EE44, parent);
}

//! FE8U = 0x080C36A0
void sub_80C36A0(int textId)
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
