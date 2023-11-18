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
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u16 * unk_3c;
    /* 40 */ u16 * unk_40;
};

struct Proc08A20E44
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x58);

    /* 58 */ int unk_58;
};

// TODO: Implicit declaration
ProcPtr APProc_Create(const void * apDefinition, int xPos, int yPos, int tileBase, int anim, int aObjNode);

//! FE8U = 0x080AE86C
void sub_80AE86C(struct Proc08A20E24 * proc, int val)
{
    int i;
    int j;

    u16 * dst = gPaletteBuffer + PAL_COLOR_OFFSET(proc->unk_30, 0);
    u16 * ptrA = proc->unk_3c;
    u16 * ptrB = proc->unk_40;

    for (i = 0; i < proc->unk_34; i++)
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

extern struct ProcCmd gUnknown_08A20E24[];

//! FE8U = 0x080AE964
void sub_80AE964(u16 * palA, u16 * palB, int c, int d, int e, ProcPtr parent)
{
    struct Proc08A20E24 * proc = Proc_Start(gUnknown_08A20E24, parent);

    proc->unk_2c = c;
    proc->unk_30 = d;
    proc->unk_34 = e;

    proc->unk_3c = palA;
    proc->unk_40 = palB;

    return;
}

//! FE8U = 0x080AE99C
void sub_80AE99C(void)
{
    Proc_End(Proc_Find(gUnknown_08A20E24));
    return;
}

//! FE8U = 0x080AE9B0
ProcPtr sub_80AE9B0(u8 * gfx, u16 * pal, const void * apDef, int x, int y, int animId, int palId, int palCount, u16 chr, int aObjNode)
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
int sub_80AEA24(int bg)
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
int sub_80AEA70(int bg)
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
char * sub_80AEABC(const char * srcStr, char * dstStr)
{
    strcpy(dstStr, srcStr);
    return dstStr + strlen(srcStr);
}

//! FE8U = 0x080AEADC
char * sub_80AEADC(int unk, char * str)
{
    *str = unk;
    str++;
    *str = 0;
    return str;
}

//! FE8U = 0x080AEAE8
const char * sub_80AEAE8(char ** a, char ** b)
{
    const char * res;
    int len;

    res = GetCharTextLen(*a, &len);
    res -= (u32)*a;

    memcpy(*b, *a, (u32)res);

    *a = *a + (u32)res;
    *b = *b + (u32)res;

    return res;
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
void sub_80AEB60(struct Proc08A20E44 * proc)
{
    PlaySoundEffect(0x70);
    StartHelpBox_Unk(proc->unk_2c, proc->unk_30, proc->unk_58);
    return;
}

//! FE8U = 0x080AEB8C
void sub_80AEB8C(struct Proc08A20E44 * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON | L_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
        PlaySoundEffect(0x71);
        CloseHelpBox();
    }

    return;
}

extern struct ProcCmd gUnknown_08A20E44[];

//! FE8U = 0x080AEBCC
void sub_80AEBCC(int x, int y, int msgId, ProcPtr parent)
{
    struct Proc08A20E44 * proc = Proc_StartBlocking(gUnknown_08A20E44, parent);
    proc->unk_2c = x;
    proc->unk_30 = y;
    proc->unk_58 = msgId;

    return;
}

//! FE8U = 0x080AEBEC
int sub_80AEBEC(int number)
{
    int num_ = number;
    int numDivisions = 0;

    do
    {
        numDivisions++;
        num_ = (num_ / 10);
    } while (num_ != 0);

    return numDivisions;
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
