#include "global.h"

#include "ev_triggercheck.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"

const char gProcName_E_guideSub[] = "E_guideSub";
const char gProcName_E_guMenu1ReWrite[] = "E_guMenu1ReWrite";
const char gProcName_E_guMenu2ReWriteFirst[] = "E_guMenu2ReWriteFirst";
const char gProcName_E_guMenu2ReWriteUp[] = "E_guMenu2ReWriteUp";
const char gProcName_E_guMenu2ReWriteDown[] = "E_guMenu2ReWriteDown";
const char gProcName_E_guMess3ReWrite[] = "E_guMess3ReWrite";
const char gProcName_E_Guide[] = "E_Guide";

// Pad the data here so that the linker script doesn't need to specify the
// exact location of data after this file.
const u8 TextFiller[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

struct GuideEnt
{
    /* 00 */ u8 title;
    /* 01 */ u8 chapterTitle;
    /* 02 */ u16 itemName;
    /* 04 */ u16 details;
    /* 06 */ u16 displayFlag;
    /* 08 */ u16 readFlag;
};

extern struct GuideEnt gUnknown_08B19E0C[];

struct GuideMenu
{
    /* 00 */ STRUCT_PAD(0x00, 0x29);
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ s8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ s8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ STRUCT_PAD(0x31, 0x3c);
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 unk_40[5];

    /* 45 */ STRUCT_PAD(0x45, 0x54);

    /* 54 */ u8 unk_54[5]; // size unknown

    /* 59 */ STRUCT_PAD(0x59, 0x68);

    /* 68 */ u8 unk_68[5];

    /* 6D */ STRUCT_PAD(0x6d, 0x7c);

    /* 7C */ struct Text unk_7c[6];
    /* AC */ struct Text unk_ac;
    /* B4 */ struct Text unk_b4[6];
    /* E4 */ struct Text unk_e4;
    /* EC */ struct Text unk_ec;
};


struct GuideProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 3C */ int unk_3c;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

extern struct GuideMenu * gpBuf;

extern u16 gUnknown_08B12AA8[];
extern u16 gUnknown_08B12AC2[];
extern u16 gUnknown_08B12AD0[];
extern int gUnknown_08B12AE0[];
extern u16 gUnknown_08B12B04[];

extern u8 gUnknown_08B176CC[]; // tsa
extern u8 gUnknown_08B177C0[]; // gfx
extern u8 gUnknown_08B17864[]; // gfx
extern u16 gUnknown_08B17B44[]; // pal

// TODO: Implicit declarations
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void sub_8097668(void);
void LockMenuScrollBar(void);
void EndMenuScrollBar(void);

//! FE8U = 0x080CDF4C
bool sub_80CDF4C(void)
{
    struct GuideEnt * it = gUnknown_08B19E0C;

    while (1)
    {
        if (it->title == 12)
        {
            return TRUE;
        }

        if (CheckFlag(it->displayFlag))
        {
            return FALSE;
        }

        it++;
    }
}

//! FE8U = 0x080CDF78
void sub_80CDF78(void)
{
    UnpackUiVArrowGfx(0xe0, 3);
    return;
}

//! FE8U = 0x080CDF88
void sub_80CDF88(void)
{
    int y1;
    int y2;

    GetGameClock();

    PutSprite(3, 16, 8, gUnknown_08B12AA8, OAM2_PAL(2));

    if (gpBuf->unk_2f == 0)
    {
        PutSprite(3, 176, 3, gUnknown_08B12AC2, OAM2_PAL(2));
    }

    PutSprite(3, 176, 15, gUnknown_08B12AD0, OAM2_PAL(2));

    y1 = (gpBuf->unk_29 - gpBuf->unk_2a) * 2 + 5;
    y2 = (gpBuf->unk_2b - gpBuf->unk_2c) * 2 + 5;

    switch (gpBuf->unk_2f)
    {
        case 0:
            DisplayUiHand(12, y1 * 8);

            if (((gpBuf->unk_30 != 0) ? gpBuf->unk_3c : gpBuf->unk_3d) > 6)
            {
                if (gpBuf->unk_2a != 0)
                {
                    DisplayUiVArrow(32, 32, OAM2_CHR(0xE0) + OAM2_PAL(3), 1);
                }

                if (gpBuf->unk_2a < ((gpBuf->unk_30 != 0) ? gpBuf->unk_3c : gpBuf->unk_3d) - 6)
                {
                    DisplayUiVArrow(32, 136, OAM2_CHR(0xE0) + OAM2_PAL(3), 0);
                }
            }

            break;

        case 1:
            DisplayFrozenUiHand(12, y1 * 8);
            DisplayUiHand(80, y2 * 8);

            break;

        case 2:
            DisplayFrozenUiHand(12, y1 * 8);

            if (gpBuf->unk_3f > 4)
            {
                if ((gpBuf->unk_2e) != 0)
                {
                    DisplayUiVArrow(144, 56, OAM2_CHR(0xE0) + OAM2_PAL(3), 1);
                }

                if (gpBuf->unk_2e < gpBuf->unk_3f - 4)
                {
                    DisplayUiVArrow(144, 128, OAM2_CHR(0xE0) + OAM2_PAL(3), 0);
                }
            }

            break;
    }

    UpdateMenuScrollBarConfig(10, gpBuf->unk_2c * 16, gpBuf->unk_3e, 6);

    return;
}

//! FE8U = 0x080CE148
void sub_80CE148(void)
{
    if (gpBuf->unk_30 != 0)
    {
        return;
    }

    ClearText(&gpBuf->unk_ec);
    PutDrawText(
        &gpBuf->unk_ec, TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 22,
        GetStringFromIndex(0x05D4));

    Text_DrawString(&gpBuf->unk_ec, GetStringFromIndex(gUnknown_08B12B04[gpBuf->unk_54[gpBuf->unk_29]]));

    return;
}

//! FE8U = 0x080CE1C0
void sub_80CE1C0(int strIndex, int textIndex, int y)
{
    const char * str;

    ClearText(&gpBuf->unk_7c[textIndex]);

    str = (gpBuf->unk_30 != 0) ? GetStringFromIndex(gUnknown_08B12AE0[gpBuf->unk_40[strIndex]])
                               : GetStringFromIndex(gUnknown_08B12B04[gpBuf->unk_54[strIndex]]);

    PutDrawText(
        &gpBuf->unk_7c[textIndex], TILEMAP_LOCATED(gBG1TilemapBuffer, 2, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);
    return;
}

//! FE8U = 0x080CE248
void sub_80CE248(void)
{
    int i;

    int a = (gpBuf->unk_30 != 0) ? gpBuf->unk_3c : gpBuf->unk_3d;

    for (i = 0; i <= 5; i++)
    {
        if (i < a)
        {
            sub_80CE1C0(i, i, (i * 2) + 5);
        }
    }

    return;
}

//! FE8U = 0x080CE28C
void sub_80CE28C(void)
{
    int iy;
    int ix;

    int yBase = 160;

    for (iy = 0; iy < 12; iy++)
    {
        for (ix = 0; ix < 28; ix++)
        {
            gBG1TilemapBuffer[(yBase + 1) + ix] = 0;
        }
        yBase += 0x20;
    }

    for (ix = 0; ix < 28; ix++)
    {
        gBG0TilemapBuffer[0x241 + ix + 0x00] = 0;
        gBG0TilemapBuffer[0x241 + ix + 0x20] = 0;
    }

    return;
}

//! FE8U = 0x080CE2E4
void sub_80CE2E4(void)
{
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    return;
}

//! FE8U = 0x080CE2F0
void sub_80CE2F0(void)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    return;
}

//! FE8U = 0x080CE2FC
void sub_80CE2FC(struct GuideProc * proc)
{
    int idx = proc->unk_34;
    int textIdx = idx % 6;

    ClearText(&gpBuf->unk_b4[textIdx]);

    PutDrawText(
        &gpBuf->unk_b4[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5),
        CheckFlag(gUnknown_08B19E0C[gpBuf->unk_68[idx]].readFlag) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GREEN,
        0, 18, GetStringFromIndex(gUnknown_08B19E0C[gpBuf->unk_68[idx]].itemName));

    return;
}

//! FE8U = 0x080CE388
void sub_80CE388(struct GuideProc * proc)
{

    int idx = proc->unk_34;
    int textIdx = idx % 6;

    ClearText(&gpBuf->unk_b4[textIdx]);

    PutDrawText(
        &gpBuf->unk_b4[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 15),
        CheckFlag(gUnknown_08B19E0C[gpBuf->unk_68[idx]].readFlag) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GREEN,
        0, 18, GetStringFromIndex(gUnknown_08B19E0C[gpBuf->unk_68[idx]].itemName));

    return;
}

//! FE8U = 0x080CE414
void sub_80CE414(void)
{
    int r6;

    register int r4 asm("r4");
    int r5;
    int r8;

    int y = 5;
    int idx = 0;

    for (r8 = 0, gpBuf->unk_3e = 0; gUnknown_08B19E0C[r8].title != 12; r8++)
    {

        if (!CheckFlag(gUnknown_08B19E0C[r8].displayFlag))
        {
            continue;
        }

        if (gpBuf->unk_30 != 0)
        {
            if (gUnknown_08B19E0C[r8].chapterTitle == gpBuf->unk_40[gpBuf->unk_29])
            {
                gpBuf->unk_68[idx] = r8;
                idx++;
            }
        }
        else
        {
            if (gUnknown_08B19E0C[r8].title == gpBuf->unk_54[gpBuf->unk_29])
            {
                gpBuf->unk_68[idx] = r8;
                idx++;
            }
        }
    }

    r6 = gpBuf->unk_3e = idx;

    r5 = r4 = gpBuf->unk_2c;

    for (r8 = 0; r8 <= 5 && r6 != 0; y += 2, r5++, r6--, r4++, r8++)
    {
        r5 = r5 % 6;

        ClearText(&gpBuf->unk_b4[r5]);

        PutDrawText(
            &gpBuf->unk_b4[r5], gBG1TilemapBuffer + TILEMAP_INDEX(11, y),
            (!CheckFlag(gUnknown_08B19E0C[gpBuf->unk_68[r4]].readFlag)) ? TEXT_COLOR_SYSTEM_GREEN
                                                                        : TEXT_COLOR_SYSTEM_WHITE,
            0, 18, GetStringFromIndex(gUnknown_08B19E0C[gpBuf->unk_68[r4]].itemName));
    }

    return;
}

//! FE8U = 0x080CE588
void sub_80CE588(void)
{
    int ix;
    int iy;

    int base = 160;

    for (iy = 0; iy < 12; iy++)
    {
        for (ix = 0; ix < 19; ix++)
        {
            int x = 10 + ix;

            gBG1TilemapBuffer[x + base] = 0;
        }

        base += 0x20;
    }

    return;
}

//! FE8U = 0x080CE5BC
const char * sub_80CE5BC(const char * str)
{
    if (str == NULL)
    {
        return NULL;
    }

    if (*str == 0) // [X]
    {
        return NULL;
    }

    while (1)
    {
        char c = *str;
        u32 width;

        if (c != 0)
        {
            if (c == 1) // [NL]
            {
                return str + 1;
            }
        }
        else
        {
            return NULL;
        }

        str = GetCharTextLen(str, &width);
    }
}

//! FE8U = 0x080CE5F0
void sub_80CE5F0(int idx, int b)
{
    int unk_2e;
    int i;

    int unk_3f = 1;

    const char * str = GetStringFromIndex(gUnknown_08B19E0C[idx].details);
    while (1)
    {
        str = sub_80CE5BC(str);
        if (str == NULL)
        {
            break;
        }

        unk_3f++;
    }

    gpBuf->unk_3f = unk_3f;

    unk_2e = gpBuf->unk_2e;

    if (b != 0)
    {
        if (unk_3f > 4)
        {
            if (b == 1)
            {
                if (unk_2e + 4 <= unk_3f - 4)
                {
                    unk_2e = unk_2e + 4;
                }
                else
                {
                    unk_2e = unk_3f - 4;
                }
            }
            else
            {
                if (unk_2e - 4 >= 0)
                {
                    unk_2e = unk_2e - 4;
                }
                else
                {
                    unk_2e = 0;
                }
            }
        }

        if ((b != 0) && (gpBuf->unk_2e == unk_2e))
        {
            return;
        }
    }

    sub_80CE588();

    gpBuf->unk_2e = unk_2e;

    ClearText(gpBuf->unk_b4);

    PutDrawText(
        gpBuf->unk_b4, TILEMAP_LOCATED(gBG1TilemapBuffer, 10, 5), TEXT_COLOR_SYSTEM_GOLD, 2, 18,
        GetStringFromIndex(gUnknown_08B19E0C[idx].itemName));

    str = GetStringFromIndex(gUnknown_08B19E0C[idx].details);

    for (i = 0; i < unk_2e + 4; i++)
    {

        if (i != 0)
        {
            str = sub_80CE5BC(str);
            if (str == NULL)
            {
                break;
            }
        }

        if (i >= unk_2e)
        {
            int off;
            int textIndex = i % 5;

            ClearText(&gpBuf->unk_b4[1 + textIndex]);

            PutDrawText(
                &gpBuf->unk_b4[1 + textIndex], gBG1TilemapBuffer + 11 + ((((i - unk_2e) % 4) * 0x40) + (off = 0x100)),
                TEXT_COLOR_SYSTEM_WHITE, 0, 17, str);
        }
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

extern struct ProcCmd gUnknown_08B12BEC[];

//! FE8U = 0x080CE750
void sub_80CE750(ProcPtr proc, int b)
{
    struct GuideProc * child;
    int iy;
    int ix;
    register int hm asm("r9") = b;

    int off = 0x1a0;

    switch (gpBuf->unk_2f)
    {
        case 0:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 8; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x42] = gBG1TilemapBuffer[ix + off + 0x02];
                    gBG1TilemapBuffer[ix + off + 0x62] = gBG1TilemapBuffer[ix + off + 0x22];
                }
                off = off - 0x40;
            }

            sub_80CE1C0(hm, hm % 6, 5);

            break;

        case 1:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 19; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x4a] = gBG1TilemapBuffer[ix + off + 0x0a];
                    gBG1TilemapBuffer[ix + off + 0x6a] = gBG1TilemapBuffer[ix + off + 0x2a];
                }
                off = off - 0x40;
            }

            child = Proc_Start(gUnknown_08B12BEC, proc);
            child->unk_34 = hm;
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

extern struct ProcCmd gUnknown_08B12C14[];

//! FE8U = 0x080CE858
void sub_80CE858(ProcPtr proc, int b)
{
    struct GuideProc * child;
    int iy;
    int ix;
    register int hm asm("r9") = b;

    int off = 0xa0;

    switch (gpBuf->unk_2f)
    {
        case 0:
        {
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 8; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x02] = gBG1TilemapBuffer[ix + off + 0x42];
                    gBG1TilemapBuffer[ix + off + 0x22] = gBG1TilemapBuffer[ix + off + 0x62];
                }
                off = off + 0x40;
            }

            sub_80CE1C0(hm, hm % 6, 0xf);

            break;
        }
        case 1:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 19; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x0a] = gBG1TilemapBuffer[ix + off + 0x4a];
                    gBG1TilemapBuffer[ix + off + 0x2a] = gBG1TilemapBuffer[ix + off + 0x6a];
                }
                off = off + 0x40;
            }

            child = Proc_Start(gUnknown_08B12C14, proc);
            child->unk_34 = hm;
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080CE95C
void sub_80CE95C(struct GuideProc * proc)
{
    int textIdx;
    const char * str;
    int unk_34;

    unk_34 = proc->unk_34;
    textIdx = (unk_34 % 5);
    str = GetStringFromIndex(gUnknown_08B19E0C[gpBuf->unk_68[gpBuf->unk_2b]].details);
    while (unk_34 != 0)
    {
        str = sub_80CE5BC(str);
        if (str == NULL)
        {
            break;
        }

        unk_34--;
    }

    ClearText(&gpBuf->unk_b4[1 + textIdx]);
    PutDrawText(
        &gpBuf->unk_b4[1 + textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 17, str);

    proc->unk_34 = 0;

    return;
}

//! FE8U = 0x080CE9E8
void sub_80CE9E8(struct GuideProc * proc)
{
    int iy;
    int ix;
    int baseA;
    int baseB;

    if (proc->unk_38 == 0)
    {
        baseA = 0x1c0;
        baseB = 0x260;
        for (iy = 0; iy < 7; iy++)
        {
            for (ix = 0; ix < 19; ix++)
            {
                gBG1TilemapBuffer[baseA + 0x2a + ix] = gBG1TilemapBuffer[baseA + 0x0a + ix];
            }
            baseA -= 0x20;
        }

        if (proc->unk_34 != 0)
        {
            baseB -= 0x20;
        }

        for (ix = 0; ix < 19; ix++)
        {
            gBG1TilemapBuffer[baseA + 0x2a + ix] = gBG1TilemapBuffer[baseB + 0x0a + ix];
        }
    }
    else
    {
        baseA = 0x100;
        baseB = 0x220;
        for (iy = 0; iy < 7; iy++)
        {
            for (ix = 0; ix < 19; ix++)
            {
                gBG1TilemapBuffer[baseA + 0x0a + ix] = gBG1TilemapBuffer[baseA + 0x2a + ix];
            }
            baseA += 0x20;
        }

        if (proc->unk_34 != 0)
        {
            baseB += 0x20;
        }

        for (ix = 0; ix < 0x13; ix++)
        {
            gBG1TilemapBuffer[baseA + 0x0a + ix] = gBG1TilemapBuffer[baseB + 0x2a + ix];
        }
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (proc->unk_34 == 0)
    {
        proc->unk_34 = 1;
        return;
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080CEAE8
void sub_80CEAE8(void)
{
    int i;
    u8 local[20];
    int r3;
    int r4;

    for (i = 0; i < 20; i++)
    {
        local[i] = 0;
        gpBuf->unk_54[i] = 0;
    }

    i = 0;
    r4 = gUnknown_08B19E0C[i].title;

    while (gUnknown_08B19E0C[i].title != 0xc)
    {
        if (CheckFlag(gUnknown_08B19E0C[i].displayFlag))
        {
            local[r4] = r4;
        }

        i++;
        r4 = gUnknown_08B19E0C[i].title;
    }

    gpBuf->unk_3d = 0;

    for (i = 0; i < 0xc; i++)
    {
        int tmp2;

        r4 = local[i];
        if (r4 == 0)
        {
            continue;
        }

        if (gpBuf->unk_3d == 0)
        {
            gpBuf->unk_54[0] = r4;
            gpBuf->unk_3d++;
        }
        else
        {
            r3 = 0;
            tmp2 = (r3 < gpBuf->unk_3d) && (gpBuf->unk_54[0] == r4);
            if (tmp2 != 0)
            {
                continue;
            }
            gpBuf->unk_54[gpBuf->unk_3d] = r4;
            gpBuf->unk_3d++;
        }
    }

    return;
}

//! FE8U = 0x080CEBA4
void sub_80CEBA4(void)
{
    int i;
    u8 local[20];
    int r3;
    int r4;

    for (i = 0; i < 20; i++)
    {
        local[i] |= 0xff;
        gpBuf->unk_40[i] = 0;
    }

    i = 0;
    r4 = gUnknown_08B19E0C[i].title;

    while (r4 != 0xc)
    {
        if (CheckFlag(gUnknown_08B19E0C[i].displayFlag))
        {
            r4 = gUnknown_08B19E0C[i].chapterTitle;
            local[r4] = r4;
        }

        i++;
        r4 = gUnknown_08B19E0C[i].title;
    }

    gpBuf->unk_3c = 0;

    for (i = 0; i < 0xc; i++)
    {
        int tmp2;

        if (local[i] == 0xff)
        {
            continue;
        }
        r4 = local[i];

        if (gpBuf->unk_3c == 0)
        {
            gpBuf->unk_40[0] = r4;
            gpBuf->unk_3c++;
        }
        else
        {
            r3 = 0;
            tmp2 = (r3 < gpBuf->unk_3c) && (gpBuf->unk_40[0] == r4);
            if (tmp2 != 0)
            {
                continue;
            }
            gpBuf->unk_40[gpBuf->unk_3c] = r4;
            gpBuf->unk_3c++;
        }
    }

    return;
}

//! FE8U = 0x080CEC68
void sub_80CEC68(u16 off)
{
    int ix;
    int iy;

    int yBase = 0xa0;

    for (iy = 0; iy < 0xc; iy++)
    {
        for (ix = 0; ix < 9; ix++)
        {
            gBG2TilemapBuffer[yBase + ix] = off + (gBG2TilemapBuffer[yBase + ix] & 0xFFF);
        }

        yBase += 0x20;
    }

    return;
}

extern struct ProcCmd gUnknown_08B12B1C[];

//! FE8U = 0x080CECB0
void sub_80CECB0(ProcPtr proc)
{
    int i = 0;

    SetupBackgrounds(NULL);

    gpBuf->unk_2f = 0;

    gpBuf->unk_30 = CheckFlag(0xb3);

    gpBuf->unk_29 = 0;
    gpBuf->unk_2a = 0;
    gpBuf->unk_2b = 0;
    gpBuf->unk_2c = 0;

    sub_80CEAE8();
    sub_80CEBA4();
    LoadUiFrameGraphics();

    SetDispEnable(1, 1, 1, 1, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 40, DISPLAY_WIDTH, 136);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    ApplyPalette(gUnknown_08B17B44, 0x12);
    Decompress(gUnknown_08B17864, (void *)0x06011000);
    Decompress(gUnknown_08B177C0, (void *)0x06011800);

    Decompress(gUnknown_08B176CC, gGenericBuffer + 0x100);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x100, 0x1000);

    ApplyPalette(gUiFramePaletteA + (gPlaySt.config.windowColor + 4) * 0x10, 2);

    ResetTextFont();

    InitText(&gpBuf->unk_ec, 22);

    sub_80CE148();

    InitText(&gpBuf->unk_ac, 9);
    InitText(&gpBuf->unk_e4, 18);

    for (i = 0; i < 6; i++)
    {
        InitText(&gpBuf->unk_7c[i], 9);
        InitText(&gpBuf->unk_b4[i], 18);
    }

    sub_80CE248();
    sub_80CE414();

    StartMuralBackgroundExt(proc, 0, 18, 2, 0);
    Proc_Start(gUnknown_08B12B1C, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    StartMenuScrollBarExt(proc, 224, 47, 0x800, 4);
    UpdateMenuScrollBarConfig(10, gpBuf->unk_2c * 16, gpBuf->unk_3e, 6);

    sub_8097668();

    return;
}

void sub_80CEF10(void)
{
    SetBlendAlpha(15, 4);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}

int sub_80CEF48(ProcPtr proc)
{
    switch (gpBuf->unk_2f)
    {
        case 0:
            if ((gKeyStatusPtr->newKeys & 4) != 0)
            {
                return 4;
            }

            // fallthrough

        case 1:
            if ((gKeyStatusPtr->newKeys & 1) != 0)
            {
                return 2;
            }

            if ((gKeyStatusPtr->newKeys & 2) != 0)
            {
                return 3;
            }

            break;

        case 2:
            if ((gKeyStatusPtr->newKeys & 2) != 0)
            {
                return 3;
            }

            if ((gKeyStatusPtr->newKeys & 0x11) != 0)
            {
                return 5;
            }

            if ((gKeyStatusPtr->newKeys & 0x20) != 0)
            {
                return 6;
            }
    }

    if ((gKeyStatusPtr->repeatedKeys & 0xc0) != 0)
    {
        return 1;
    }
}

extern struct ProcCmd gUnknown_08B12B3C[];
extern struct ProcCmd gUnknown_08B12B9C[];
extern struct ProcCmd gUnknown_08B12C3C[];

void sub_80CEFD4(struct GuideProc * proc)
{
    struct GuideProc * proc_ = proc;
    s8 flag = 0;

    switch (sub_80CEF48(proc))
    {
        case 2:
            PlaySoundEffect(0x6a);

            gpBuf->unk_2f++;

            switch (gpBuf->unk_2f)
            {
                case 1:
                    sub_80CEC68(0x2000);
                    BG_EnableSyncByMask(BG2_SYNC_BIT);

                    break;

                case 2:
                    gpBuf->unk_2e = 0;
                    SetFlag(gUnknown_08B19E0C[gpBuf->unk_68[gpBuf->unk_2b]].readFlag);
                    sub_80CE5F0(gpBuf->unk_68[gpBuf->unk_2b], 0);
                    LockMenuScrollBar();

                    return;

                default:
                    return;
            }

            break;

        case 5:
            sub_80CE5F0(gpBuf->unk_68[gpBuf->unk_2b], 1);

            break;

        case 6:
            sub_80CE5F0(gpBuf->unk_68[gpBuf->unk_2b], 2);

            break;

        case 3:
            PlaySoundEffect(0x6b);

            if (gpBuf->unk_2f != 0)
            {
                gpBuf->unk_2f--;

                switch (gpBuf->unk_2f)
                {
                    case 0:
                        sub_80CEC68(0x1000);
                        BG_EnableSyncByMask(4);
                        break;

                    case 1:
                        Proc_StartBlocking(gUnknown_08B12B9C, proc_);
                        sub_8097668();
                        return;

                    default:
                        return;
                }
            }
            else
            {
                Proc_Break(proc_);
                return;
            }

            break;

        case 4:
            PlaySoundEffect(0x6a);

            gpBuf->unk_30 = (gpBuf->unk_30 + 1) & 1;
            if (gpBuf->unk_30)
            {
                SetFlag(0xb3);
            }
            else
            {
                ClearFlag(0xb3);
            }

            gpBuf->unk_29 = 0;
            gpBuf->unk_2a = 0;
            gpBuf->unk_2b = 0;
            gpBuf->unk_2c = 0;

            Proc_StartBlocking(gUnknown_08B12B3C, proc_);

            break;

        case 1:
            switch (gpBuf->unk_2f)
            {
                case 0:
                    if (gKeyStatusPtr->repeatedKeys & 0x40)
                    {
                        if (gpBuf->unk_29 != 0)
                        {
                            gpBuf->unk_29--;

                            if (((gpBuf->unk_29 - gpBuf->unk_2a) < 1) && (gpBuf->unk_2a != 0))
                            {
                                gpBuf->unk_2a--;
                                sub_80CE750(proc_, gpBuf->unk_29 - 1);
                            }

                            flag = 1;
                        }

                        if (!flag)
                        {
                            return;
                        }
                    }
                    else
                    {
                        if (gpBuf->unk_29 < ((gpBuf->unk_30 ? gpBuf->unk_3c : gpBuf->unk_3d) - 1))
                        {
                            gpBuf->unk_29++;

                            if ((gpBuf->unk_29 - gpBuf->unk_2a) > 4)
                            {
                                if (gpBuf->unk_29 < ((gpBuf->unk_30 ? gpBuf->unk_3c : gpBuf->unk_3d) - 1))
                                {
                                    gpBuf->unk_2a++;
                                    sub_80CE858(proc_, gpBuf->unk_29 + 1);
                                }
                            }
                            flag = 1;
                        }

                        if (!flag)
                        {
                            return;
                        }
                    }

                    Proc_Start(gUnknown_08B12B9C, proc_);
                    gpBuf->unk_2b = 0;
                    gpBuf->unk_2c = 0;

                    break;

                case 1:
                    if (gKeyStatusPtr->repeatedKeys & 0x40)
                    {
                        if (gpBuf->unk_2b != 0)
                        {
                            gpBuf->unk_2b--;

                            if ((gpBuf->unk_2b - gpBuf->unk_2c < 1) && (gpBuf->unk_2c != 0))
                            {
                                gpBuf->unk_2c--;
                                sub_80CE750(proc_, gpBuf->unk_2b - 1);
                            }

                            flag = 1;
                        }
                    }
                    else
                    {
                        if (gpBuf->unk_2b < (gpBuf->unk_3e - 1))
                        {
                            gpBuf->unk_2b++;

                            if ((gpBuf->unk_2b - gpBuf->unk_2c > 4) && (gpBuf->unk_2b < gpBuf->unk_3e - 1))
                            {
                                gpBuf->unk_2c++;
                                sub_80CE858(proc_, gpBuf->unk_2b + 1);
                            }

                            flag = 1;
                        }
                    }

                    break;

                case 2:
                    if (gKeyStatusPtr->repeatedKeys & 0x40)
                    {
                        if (gpBuf->unk_2e != 0)
                        {
                            gpBuf->unk_2e--;
                            proc_ = Proc_StartBlocking(gUnknown_08B12C3C, proc_);
                            proc_->unk_34 = gpBuf->unk_2e;
                            proc_->unk_38 = 0;
                            flag = 1;
                        }
                    }
                    else
                    {

                        if (gpBuf->unk_2e < gpBuf->unk_3f - 4)
                        {
                            gpBuf->unk_2e++;

                            proc_ = Proc_StartBlocking(gUnknown_08B12C3C, proc_);
                            proc_->unk_34 = gpBuf->unk_2e + 3;
                            proc_->unk_38 = 1;

                            flag = 1;
                        }
                    }
            }

            if (!flag)
            {
                return;
            }

            PlaySoundEffect(0x66);
    }

    return;
}

//! FE8U = 0x080CF448
void sub_80CF448(void)
{
    EndMuralBackground();
    Proc_EndEach(gUnknown_08B12B1C);
    EndMenuScrollBar();
    return;
}

//! FE8U = 0x080CF460
void sub_80CF460(void)
{
    struct GuideEnt * ent;

    for (ent = gUnknown_08B19E0C; ent->title != 0xc; ent++)
    {
        SetFlag(ent->displayFlag);
    }

    return;
}

//! FE8U = 0x080CF480
bool sub_80CF480(void)
{
    struct GuideEnt * ent;

    for (ent = gUnknown_08B19E0C; ent->title != 0xc; ent++)
    {
        if ((CheckFlag(ent->displayFlag)) && (!CheckFlag(ent->readFlag)))
        {
            return FALSE;
        }
    }

    return TRUE;
}
