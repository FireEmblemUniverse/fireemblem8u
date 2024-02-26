#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "bmsave.h"

struct Proc08A20E24
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int targetPalId;
    /* 34 */ int palCount;
    /* 38 */ int unk_38;
    /* 3C */ u16 * srcA;
    /* 40 */ u16 * srcB;
};

struct BonusClaimHelpBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);

    /* 58 */ int msgId;
};

// TODO: Implicit declaration
ProcPtr APProc_Create(const void * apDefinition, int xPos, int yPos, int tileBase, int anim, int aObjNode);

//! FE8U = 0x080AE86C
void sub_80AE86C(struct Proc08A20E24 * proc, int val)
{
    int i;
    int j;

    u16 * dst = gPaletteBuffer + PAL_COLOR_OFFSET(proc->targetPalId, 0);
    u16 * ptrA = proc->srcA;
    u16 * ptrB = proc->srcB;

    for (i = 0; i < proc->palCount; i++)
    {
        for (j = 0; j < 0x10; j++)
        {
            *dst = ((((*ptrA & RED_MASK) * (0x80 - val) + val * (*ptrB & RED_MASK)) >> 7) & RED_MASK) +
                ((((*ptrA & GREEN_MASK) * (0x80 - val) + val * (*ptrB & GREEN_MASK)) >> 7) & GREEN_MASK) +
                ((((*ptrA & BLUE_MASK) * (0x80 - val) + val * (*ptrB & BLUE_MASK)) >> 7) & BLUE_MASK);

            dst++;

            ptrA++;
            ptrB++;
        }
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080AE930
void sub_80AE930(struct Proc08A20E24 * proc)
{
    proc->unk_38 = 0;
    return;
}

//! FE8U = 0x080AE938
void sub_80AE938(struct Proc08A20E24 * proc)
{
    proc->unk_38 += proc->unk_2c;

    if (proc->unk_38 > 0x100)
    {
        proc->unk_38 = 0;
    }

    sub_80AE86C(proc, proc->unk_38 < 0x80 ? proc->unk_38 : 0x100 - proc->unk_38);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_08A20E24[] =
{
    PROC_YIELD,
    PROC_CALL(sub_80AE930),
    PROC_REPEAT(sub_80AE938),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AE964
void sub_80AE964(u16 * palA, u16 * palB, int c, int targetPalId, int palCount, ProcPtr parent)
{
    struct Proc08A20E24 * proc = Proc_Start(gProcScr_08A20E24, parent);

    proc->unk_2c = c;
    proc->targetPalId = targetPalId;
    proc->palCount = palCount;

    proc->srcA = palA;
    proc->srcB = palB;

    return;
}

//! FE8U = 0x080AE99C
void sub_80AE99C(void)
{
    Proc_End(Proc_Find(gProcScr_08A20E24));
    return;
}

//! FE8U = 0x080AE9B0
ProcPtr StartSpriteAnimfx(const u8 * gfx, const u16 * pal, const void * apDef, int x, int y, int animId, int palId, int palCount, u16 chr, int aObjNode)
{
    if (gfx != NULL)
    {
        Decompress(gfx, (void *)(0x06010000 + OAM2_CHR(chr) * CHR_SIZE));
    }

    if (pal != NULL)
    {
        ApplyPalettes(pal, (palId + 0x10), palCount);
    }

    return APProc_Create(apDef, x, y, OAM2_PAL(palId) + chr, animId, aObjNode);
}

//! FE8U = 0x080AEA24
int GetBgXOffset(int bg)
{
    switch (bg)
    {
        case BG_0:
            return gLCDControlBuffer.bgoffset[BG_0].x;

        case BG_1:
            return gLCDControlBuffer.bgoffset[BG_1].x;

        case BG_2:
            return gLCDControlBuffer.bgoffset[BG_2].x;

        case BG_3:
            return gLCDControlBuffer.bgoffset[BG_3].x;
    }
}

//! FE8U = 0x080AEA70
int GetBgYOffset(int bg)
{
    switch (bg)
    {
        case BG_0:
            return gLCDControlBuffer.bgoffset[BG_0].y;

        case BG_1:
            return gLCDControlBuffer.bgoffset[BG_1].y;

        case BG_2:
            return gLCDControlBuffer.bgoffset[BG_2].y;

        case BG_3:
            return gLCDControlBuffer.bgoffset[BG_3].y;
    }
}

//! FE8U = 0x080AEABC
char * AppendTextBuffer_80AEABC(const char * srcStr, char * dstStr)
{
    strcpy(dstStr, srcStr);
    return dstStr + strlen(srcStr);
}

//! FE8U = 0x080AEADC
char * AppendCharAndTerminate(int character, char * str)
{
    *str = character;
    str++;
    *str = 0;
    return str;
}

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
