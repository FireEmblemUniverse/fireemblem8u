#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "bmsave.h"
#include "ap.h"
#include "sysutil.h"

struct BonusClaimHelpBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);

    /* 58 */ int msgId;
};

//! FE8U = 0x080AEAE8
const char * sub_80AEAE8(char ** src, char ** dst)
{
    const char * result;
    int len;

    result = GetCharTextLen(*src, &len);
    result -= (uintptr_t)*src;

    memcpy(*dst, *src, (uintptr_t)result);

    *src = *src + (uintptr_t)result;
    *dst = *dst + (uintptr_t)result;

    return result;
}

//! FE8U = 0x080AEB1C
void sub_80AEB1C(void)
{
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x080AEB28
void sub_80AEB28(int unk)
{
    CallSomeSoundMaybe(0, 0x100, 0, unk, NULL);
    return;
}

//! FE8U = 0x080AEB44
void sub_80AEB44(int songId)
{
    CallSomeSoundMaybe(songId, 0x100, 0x100, 0x20, NULL);
    return;
}

//! FE8U = 0x080AEB60
void BonusClaimHelp_Init(struct BonusClaimHelpBoxProc * proc)
{
    PlaySoundEffect(0x70);
    StartHelpBox_Unk(proc->x, proc->y, proc->msgId);
    return;
}

//! FE8U = 0x080AEB8C
void BonusClaimHelp_Loop(struct BonusClaimHelpBoxProc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON | L_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
        PlaySoundEffect(0x71);
        CloseHelpBox();
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_BonusClaimHelpBox[] =
{
    PROC_YIELD,

    PROC_CALL(BonusClaimHelp_Init),
    PROC_SLEEP(8),

    PROC_REPEAT(BonusClaimHelp_Loop),
    PROC_SLEEP(8),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AEBCC
void StartBonusClaimHelpBox(int x, int y, int msgId, ProcPtr parent)
{
    struct BonusClaimHelpBoxProc * proc = Proc_StartBlocking(gProcScr_BonusClaimHelpBox, parent);
    proc->x = x;
    proc->y = y;
    proc->msgId = msgId;

    return;
}

//! FE8U = 0x080AEBEC
int CountDigits(int number)
{
    int remainingDigits = number;
    int digitCount = 0;

    do
    {
        digitCount++;
        remainingDigits = (remainingDigits / 10);
    } while (remainingDigits != 0);

    return digitCount;
}

//! FE8U = 0x080AEC04
bool sub_80AEC04(int a, int b, int c, int d, int e, int f, int g, int h)
{

    if (((c - a) * (f - b) - (d - b) * (e - a)) < 0)
    {
        return FALSE;
    }

    if (((e - a) * (h - b) - (f - b) * (g - a)) < 0)
    {
        return FALSE;
    }

    if (((g - a) * (d - b) - (h - b) * (c - a)) < 0)
    {
        return FALSE;
    }

    return TRUE;
}

//! FE8U = 0x080AEC54
bool sub_80AEC54(void)
{
    struct GlobalSaveInfo saveInfo;
    ReadGlobalSaveInfo(&saveInfo);
    return FALSE;
}

//! FE8U = 0x080AEC68
bool sub_80AEC68(void)
{
    struct GlobalSaveInfo saveInfo;
    ReadGlobalSaveInfo(&saveInfo);
    return FALSE;
}
