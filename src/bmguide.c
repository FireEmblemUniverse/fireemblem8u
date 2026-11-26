#include "global.h"

#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"

#include "bmguide.h"
#include "constants/songs.h"

struct GuideSt * CONST_DATA gGuideSt = (void *)gGenericBuffer;

// clang-format off

u16 CONST_DATA gSprite_GuideBannerText[] =
{
    4,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0xC0),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xC4),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0xC8),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xCC),
};

u16 CONST_DATA gSprite_SelectButtonSort[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x92),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x98),
};

u16 CONST_DATA gSprite_BButtonBack[] =
{
    2,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(16), OAM2_CHR(0x96),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x9C),
};

int CONST_DATA gTextIds_GuideCategoriesChapter[] =
{
    0x05C0, // TODO: msgid "Prologue"
    0x05C1, // TODO: msgid "Chapter 1"
    0x05C2, // TODO: msgid "Chapter 2"
    0x05C3, // TODO: msgid "Chapter 3"
    0x05C4, // TODO: msgid "Chapter 4"
    0x05C5, // TODO: msgid "Chapter 5"
    0x05C6, // TODO: msgid "Chapter 6"
    0x05C7, // TODO: msgid "Chapter 7"
    0x05C8, // TODO: msgid "Chapter 8"
};

u16 CONST_DATA gTextIds_GuideCategoriesTopic[] =
{
    0x0000,
    0x05C9, // TODO: msgid "Basic Rules"
    0x05CA, // TODO: msgid "Movement"
    0x05CB, // TODO: msgid "Combat"
    0x05CC, // TODO: msgid "Rescue"
    0x05CD, // TODO: msgid "Items"
    0x05CE, // TODO: msgid "Terrain"
    0x05CF, // TODO: msgid "Allies"
    0x05D0, // TODO: msgid "Victory"
    0x05D1, // TODO: msgid "Save"
    0x05D2, // TODO: msgid "World Map"
    0x05D3, // TODO: msgid "Other"
};

// clang-format on

extern u8 Tsa_08B176CC[]; // tsa
extern u8 Img_08B177C0[]; // gfx
extern u8 Img_08B17864[]; // gfx
extern u16 Pal_08B17B44[]; // pal

// TODO: Implicit declarations
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void UnlockMenuScrollBar(void);
void LockMenuScrollBar(void);
void EndMenuScrollBar(void);

//! FE8U = 0x080CDF4C
bool IsGuideLocked(void)
{
    struct GuideEnt * it = gGuideTable;

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
void GuideSpriteDraw_Init(void)
{
    UnpackUiVArrowGfx(0xe0, 3);
    return;
}

//! FE8U = 0x080CDF88
void GuideSpriteDraw_Loop(void)
{
    int y1;
    int y2;

    GetGameClock();

    PutSprite(3, 16, 8, gSprite_GuideBannerText, OAM2_PAL(2));

    if (gGuideSt->state == GUIDE_STATE_0)
    {
        PutSprite(3, 176, 3, gSprite_SelectButtonSort, OAM2_PAL(2));
    }

    PutSprite(3, 176, 15, gSprite_BButtonBack, OAM2_PAL(2));

    y1 = (gGuideSt->categoryIdx - gGuideSt->unk_2a) * 2 + 5;
    y2 = (gGuideSt->unk_2b - gGuideSt->unk_2c) * 2 + 5;

    switch (gGuideSt->state)
    {
        case GUIDE_STATE_0:
            DisplayUiHand(12, y1 * 8);

            if ((gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC ? gGuideSt->unk_3c : gGuideSt->unk_3d) > 6)
            {
                if (gGuideSt->unk_2a != 0)
                {
                    DisplayUiVArrow(32, 32, OAM2_CHR(0xE0) + OAM2_PAL(3), 1);
                }

                if (gGuideSt->unk_2a <
                    (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC ? gGuideSt->unk_3c : gGuideSt->unk_3d) - 6)
                {
                    DisplayUiVArrow(32, 136, OAM2_CHR(0xE0) + OAM2_PAL(3), 0);
                }
            }

            break;

        case GUIDE_STATE_1:
            DisplayFrozenUiHand(12, y1 * 8);
            DisplayUiHand(80, y2 * 8);

            break;

        case GUIDE_STATE_2:
            DisplayFrozenUiHand(12, y1 * 8);

            if (gGuideSt->numDetailLines > 4)
            {
                if ((gGuideSt->detailLinesScrolled) != 0)
                {
                    DisplayUiVArrow(144, 56, OAM2_CHR(0xE0) + OAM2_PAL(3), 1);
                }

                if (gGuideSt->detailLinesScrolled < gGuideSt->numDetailLines - 4)
                {
                    DisplayUiVArrow(144, 128, OAM2_CHR(0xE0) + OAM2_PAL(3), 0);
                }
            }

            break;
    }

    UpdateMenuScrollBarConfig(10, gGuideSt->unk_2c * 16, gGuideSt->unk_3e, 6);

    return;
}

//! FE8U = 0x080CE148
void PutGuideBottomBarText(void)
{
    if (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
    {
        return;
    }

    ClearText(&gGuideSt->unk_ec);
    PutDrawText(
        &gGuideSt->unk_ec, TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 22,
        GetStringFromIndex(0x05D4)); // TODO: msgid "About"

    Text_DrawString(
        &gGuideSt->unk_ec, GetStringFromIndex(gTextIds_GuideCategoriesTopic[gGuideSt->unk_54[gGuideSt->categoryIdx]]));

    return;
}

//! FE8U = 0x080CE1C0
void sub_80CE1C0(int strIndex, int textIndex, int y)
{
    const char * str;

    ClearText(&gGuideSt->unk_7c[textIndex]);

    str = (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
        ? GetStringFromIndex(gTextIds_GuideCategoriesChapter[gGuideSt->unk_40[strIndex]])
        : GetStringFromIndex(gTextIds_GuideCategoriesTopic[gGuideSt->unk_54[strIndex]]);

    PutDrawText(
        &gGuideSt->unk_7c[textIndex], TILEMAP_LOCATED(gBG1TilemapBuffer, 2, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);
    return;
}

//! FE8U = 0x080CE248
void sub_80CE248(void)
{
    int i;

    int a = (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC) ? gGuideSt->unk_3c : gGuideSt->unk_3d;

    for (i = 0; i < 6; i++)
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
void GuideMenuRefresh_SyncBg1(void)
{
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    return;
}

//! FE8U = 0x080CE2F0
void GuideMenuRefresh_SyncBg0Bg1(void)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    return;
}

//! FE8U = 0x080CE2FC
void GuideEntry_RedrawUp(struct GuideProc * proc)
{
    int idx = proc->unk_34;
    int textIdx = idx % 6;

    ClearText(&gGuideSt->unk_b4[textIdx]);

    PutDrawText(
        &gGuideSt->unk_b4[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5),
        CheckFlag(gGuideTable[gGuideSt->unk_68[idx]].readFlag) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GREEN, 0,
        18, GetStringFromIndex(gGuideTable[gGuideSt->unk_68[idx]].itemName));

    return;
}

//! FE8U = 0x080CE388
void GuideEntry_RedrawDown(struct GuideProc * proc)
{
    int idx = proc->unk_34;
    int textIdx = idx % 6;

    ClearText(&gGuideSt->unk_b4[textIdx]);

    PutDrawText(
        &gGuideSt->unk_b4[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 15),
        CheckFlag(gGuideTable[gGuideSt->unk_68[idx]].readFlag) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GREEN, 0,
        18, GetStringFromIndex(gGuideTable[gGuideSt->unk_68[idx]].itemName));

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

    for (r8 = 0, gGuideSt->unk_3e = 0; gGuideTable[r8].title != 12; r8++)
    {

        if (!CheckFlag(gGuideTable[r8].displayFlag))
        {
            continue;
        }

        if (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
        {
            if (gGuideTable[r8].chapterTitle == gGuideSt->unk_40[gGuideSt->categoryIdx])
            {
                gGuideSt->unk_68[idx] = r8;
                idx++;
            }
        }
        else
        {
            if (gGuideTable[r8].title == gGuideSt->unk_54[gGuideSt->categoryIdx])
            {
                gGuideSt->unk_68[idx] = r8;
                idx++;
            }
        }
    }

    r6 = gGuideSt->unk_3e = idx;

    r5 = r4 = gGuideSt->unk_2c;

    for (r8 = 0; r8 <= 5 && r6 != 0; y += 2, r5++, r6--, r4++, r8++)
    {
        r5 = r5 % 6;

        ClearText(&gGuideSt->unk_b4[r5]);

        PutDrawText(
            &gGuideSt->unk_b4[r5], gBG1TilemapBuffer + TILEMAP_INDEX(11, y),
            (!CheckFlag(gGuideTable[gGuideSt->unk_68[r4]].readFlag)) ? TEXT_COLOR_SYSTEM_GREEN
                                                                     : TEXT_COLOR_SYSTEM_WHITE,
            0, 18, GetStringFromIndex(gGuideTable[gGuideSt->unk_68[r4]].itemName));
    }

    return;
}

//! FE8U = 0x080CE588
void GuideEntry_DrawInitial(void)
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
const char * GetStringNextLine(const char * str)
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
void MoveGuideDetailText(int idx, int moveDirection)
{
    int detailLinesScrolled;
    int i;

    int numDetailLines = 1;

    const char * str = GetStringFromIndex(gGuideTable[idx].details);
    while (1)
    {
        str = GetStringNextLine(str);
        if (str == NULL)
        {
            break;
        }

        numDetailLines++;
    }

    gGuideSt->numDetailLines = numDetailLines;

    detailLinesScrolled = gGuideSt->detailLinesScrolled;

    if (moveDirection != GUIDE_DETAILS_STAY)
    {
        if (numDetailLines > 4)
        {
            if (moveDirection == GUIDE_DETAILS_ADVANCE)
            {
                if (detailLinesScrolled + 4 <= numDetailLines - 4)
                {
                    detailLinesScrolled = detailLinesScrolled + 4;
                }
                else
                {
                    detailLinesScrolled = numDetailLines - 4;
                }
            }
            else
            {
                if (detailLinesScrolled - 4 >= 0)
                {
                    detailLinesScrolled = detailLinesScrolled - 4;
                }
                else
                {
                    detailLinesScrolled = 0;
                }
            }
        }

        if ((moveDirection != GUIDE_DETAILS_STAY) && (gGuideSt->detailLinesScrolled == detailLinesScrolled))
        {
            return;
        }
    }

    GuideEntry_DrawInitial();

    gGuideSt->detailLinesScrolled = detailLinesScrolled;

    ClearText(gGuideSt->unk_b4);

    PutDrawText(
        gGuideSt->unk_b4, TILEMAP_LOCATED(gBG1TilemapBuffer, 10, 5), TEXT_COLOR_SYSTEM_GOLD, 2, 18,
        GetStringFromIndex(gGuideTable[idx].itemName));

    str = GetStringFromIndex(gGuideTable[idx].details);

    for (i = 0; i < detailLinesScrolled + 4; i++)
    {

        if (i != 0)
        {
            str = GetStringNextLine(str);
            if (str == NULL)
            {
                break;
            }
        }

        if (i >= detailLinesScrolled)
        {
            int off;
            int textIndex = i % 5;

            ClearText(&gGuideSt->unk_b4[1 + textIndex]);

            PutDrawText(
                &gGuideSt->unk_b4[1 + textIndex],
                gBG1TilemapBuffer + 11 + ((((i - detailLinesScrolled) % 4) * 0x40) + (off = 0x100)),
                TEXT_COLOR_SYSTEM_WHITE, 0, 17, str);
        }
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

extern struct ProcCmd gProcScr_GuideEntryListRedraw_Up[];

//! FE8U = 0x080CE750
void sub_80CE750(ProcPtr proc, int b)
{
    struct GuideProc * child;
    int ix;
    int iy;
    register int hm asm("r9") = b;

    int off = 0x1a0;

    switch (gGuideSt->state)
    {
        case GUIDE_STATE_0:
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

        case GUIDE_STATE_1:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 19; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x4a] = gBG1TilemapBuffer[ix + off + 0x0a];
                    gBG1TilemapBuffer[ix + off + 0x6a] = gBG1TilemapBuffer[ix + off + 0x2a];
                }
                off = off - 0x40;
            }

            child = Proc_Start(gProcScr_GuideEntryListRedraw_Up, proc);
            child->unk_34 = hm;
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

extern struct ProcCmd gProcScr_GuideEntryListRedraw_Down[];

//! FE8U = 0x080CE858
void sub_80CE858(ProcPtr proc, int b)
{
    struct GuideProc * child;
    int ix;
    int iy;
    register int hm asm("r9") = b;

    int off = 0xa0;

    switch (gGuideSt->state)
    {
        case GUIDE_STATE_0:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 8; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x02] = gBG1TilemapBuffer[ix + off + 0x42];
                    gBG1TilemapBuffer[ix + off + 0x22] = gBG1TilemapBuffer[ix + off + 0x62];
                }
                off = off + 0x40;
            }

            sub_80CE1C0(hm, hm % 6, 15);

            break;

        case GUIDE_STATE_1:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 19; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x0a] = gBG1TilemapBuffer[ix + off + 0x4a];
                    gBG1TilemapBuffer[ix + off + 0x2a] = gBG1TilemapBuffer[ix + off + 0x6a];
                }
                off = off + 0x40;
            }

            child = Proc_Start(gProcScr_GuideEntryListRedraw_Down, proc);
            child->unk_34 = hm;
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080CE95C
void GuideDetailsRedraw_Init(struct GuideProc * proc)
{
    int textIdx;
    const char * str;
    int unk_34;

    unk_34 = proc->unk_34;
    textIdx = (unk_34 % 5);

    str = GetStringFromIndex(gGuideTable[gGuideSt->unk_68[gGuideSt->unk_2b]].details);

    while (unk_34 != 0)
    {
        str = GetStringNextLine(str);
        if (str == NULL)
        {
            break;
        }

        unk_34--;
    }

    ClearText(&gGuideSt->unk_b4[1 + textIdx]);
    PutDrawText(
        &gGuideSt->unk_b4[1 + textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 17,
        str);

    proc->unk_34 = 0;

    return;
}

//! FE8U = 0x080CE9E8
void GuideDetailsRedraw_Loop(struct GuideProc * proc)
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
        gGuideSt->unk_54[i] = 0;
    }

    i = 0;
    r4 = gGuideTable[i].title;

    while (gGuideTable[i].title != 0xc)
    {
        if (CheckFlag(gGuideTable[i].displayFlag))
        {
            local[r4] = r4;
        }

        i++;
        r4 = gGuideTable[i].title;
    }

    gGuideSt->unk_3d = 0;

    for (i = 0; i < 0xc; i++)
    {
        int tmp2;

        r4 = local[i];
        if (r4 == 0)
        {
            continue;
        }

        if (gGuideSt->unk_3d == 0)
        {
            gGuideSt->unk_54[0] = r4;
            gGuideSt->unk_3d++;
        }
        else
        {
            r3 = 0;
            tmp2 = (r3 < gGuideSt->unk_3d) && (gGuideSt->unk_54[0] == r4);
            if (tmp2 != 0)
            {
                continue;
            }
            gGuideSt->unk_54[gGuideSt->unk_3d] = r4;
            gGuideSt->unk_3d++;
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
        gGuideSt->unk_40[i] = 0;
    }

    i = 0;
    r4 = gGuideTable[i].title;

    while (r4 != 12)
    {
        if (CheckFlag(gGuideTable[i].displayFlag))
        {
            r4 = gGuideTable[i].chapterTitle;
            local[r4] = r4;
        }

        i++;
        r4 = gGuideTable[i].title;
    }

    gGuideSt->unk_3c = 0;

    for (i = 0; i < 12; i++)
    {
        int tmp2;

        if (local[i] == 0xff)
        {
            continue;
        }

        r4 = local[i];

        if (gGuideSt->unk_3c == 0)
        {
            gGuideSt->unk_40[0] = r4;
            gGuideSt->unk_3c++;
        }
        else
        {
            r3 = 0;
            tmp2 = (r3 < gGuideSt->unk_3c) && (gGuideSt->unk_40[0] == r4);
            if (tmp2 != 0)
            {
                continue;
            }
            gGuideSt->unk_40[gGuideSt->unk_3c] = r4;
            gGuideSt->unk_3c++;
        }
    }

    return;
}

//! FE8U = 0x080CEC68
void sub_80CEC68(u16 off)
{
    int ix;
    int iy;

    int yBase = 160;

    for (iy = 0; iy < 12; iy++)
    {
        for (ix = 0; ix < 9; ix++)
        {
            gBG2TilemapBuffer[yBase + ix] = off + (gBG2TilemapBuffer[yBase + ix] & 0xFFF);
        }

        yBase += 32;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_Guide_DrawSprites[] =
{
    PROC_NAME("E_guideSub"),

    PROC_CALL(GuideSpriteDraw_Init),
    PROC_REPEAT(GuideSpriteDraw_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080CECB0
void Guide_Init(ProcPtr proc)
{
    int i = 0;

    SetupBackgrounds(NULL);

    gGuideSt->state = GUIDE_STATE_0;

    gGuideSt->sortMode = CheckFlag(0xb3);

    gGuideSt->categoryIdx = 0;
    gGuideSt->unk_2a = 0;
    gGuideSt->unk_2b = 0;
    gGuideSt->unk_2c = 0;

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

    ApplyPalette(Pal_08B17B44, 0x12);
    Decompress(Img_08B17864, (void *)0x06011000);
    Decompress(Img_08B177C0, (void *)0x06011800);

    Decompress(Tsa_08B176CC, gGenericBuffer + 0x100);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x100, 0x1000);

    ApplyPalette(gUiFramePaletteA + (gPlaySt.config.windowColor + 4) * 0x10, 2);

    ResetTextFont();

    InitText(&gGuideSt->unk_ec, 22);

    PutGuideBottomBarText();

    InitText(&gGuideSt->unk_ac, 9);
    InitText(&gGuideSt->unk_e4, 18);

    for (i = 0; i < 6; i++)
    {
        InitText(&gGuideSt->unk_7c[i], 9);
        InitText(&gGuideSt->unk_b4[i], 18);
    }

    sub_80CE248();
    sub_80CE414();

    StartMuralBackgroundExt(proc, 0, 18, 2, 0);
    Proc_Start(gProcScr_Guide_DrawSprites, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    StartMenuScrollBarExt(proc, 224, 47, 0x800, 4);
    UpdateMenuScrollBarConfig(10, gGuideSt->unk_2c * 16, gGuideSt->unk_3e, 6);

    UnlockMenuScrollBar();

    return;
}

//! FE8U = 0x080CEF10
void Guide_SetBlend(void)
{
    SetBlendAlpha(15, 4);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}

//! FE8U = 0x080CEF48
int GetGuideAction(ProcPtr proc)
{
    switch (gGuideSt->state)
    {
        case GUIDE_STATE_0:
            if (gKeyStatusPtr->newKeys & SELECT_BUTTON)
            {
                return GUIDE_ACTION_SORT;
            }

            // fallthrough

        case GUIDE_STATE_1:
            if (gKeyStatusPtr->newKeys & A_BUTTON)
            {
                return GUIDE_ACTION_A_PRESS;
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON)
            {
                return GUIDE_ACTION_CANCEL;
            }

            break;

        case GUIDE_STATE_2:
            if (gKeyStatusPtr->newKeys & B_BUTTON)
            {
                return GUIDE_ACTION_CANCEL;
            }

            if (gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_RIGHT))
            {
                return GUIDE_ACTION_ADVANCE_TEXT;
            }

            if (gKeyStatusPtr->newKeys & DPAD_LEFT)
            {
                return GUIDE_ACTION_REVERSE_TEXT;
            }
    }

    if (gKeyStatusPtr->repeatedKeys & (DPAD_UP | DPAD_DOWN))
    {
        return GUIDE_ACTION_1;
    }
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GuideCategoryRedraw[] =
{
    PROC_NAME("E_guMenu1ReWrite"),
    PROC_SLEEP(1),

    PROC_CALL(sub_80CE28C),
    PROC_CALL(GuideMenuRefresh_SyncBg1),
    PROC_SLEEP(1),

    PROC_CALL(sub_80CE248),
    PROC_SLEEP(1),

    PROC_CALL(sub_80CE414),
    PROC_SLEEP(1),

    PROC_CALL(PutGuideBottomBarText),
    PROC_CALL(GuideMenuRefresh_SyncBg0Bg1),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_GuideEntryListRedraw_Initial[] =
{
    PROC_NAME("E_guMenu2ReWriteFirst"),
    PROC_SLEEP(1),

    PROC_CALL(GuideEntry_DrawInitial),
    PROC_CALL(GuideMenuRefresh_SyncBg1),
    PROC_SLEEP(1),

    PROC_CALL(sub_80CE414),
    PROC_SLEEP(1),

    PROC_CALL(PutGuideBottomBarText),
    PROC_CALL(GuideMenuRefresh_SyncBg1),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_GuideEntryListRedraw_Up[] =
{
    PROC_NAME("E_guMenu2ReWriteUp"),
    PROC_SLEEP(1),

    PROC_CALL(GuideEntry_RedrawUp),
    PROC_CALL(GuideMenuRefresh_SyncBg1),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_GuideEntryListRedraw_Down[] =
{
    PROC_NAME("E_guMenu2ReWriteDown"),
    PROC_SLEEP(1),

    PROC_CALL(GuideEntry_RedrawDown),
    PROC_CALL(GuideMenuRefresh_SyncBg1),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_GuideDetailsRedraw[] =
{
    PROC_NAME("E_guMess3ReWrite"),
    PROC_SLEEP(1),

    PROC_CALL(GuideDetailsRedraw_Init),
    PROC_REPEAT(GuideDetailsRedraw_Loop),

    PROC_END,
};

// clang-format on

void Guide_MainLoop(struct GuideProc * proc)
{
    struct GuideProc * proc_ = proc;
    s8 flag = 0;

    switch (GetGuideAction(proc))
    {
        case GUIDE_ACTION_A_PRESS:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            gGuideSt->state++;

            switch (gGuideSt->state)
            {
                case GUIDE_STATE_1:
                    sub_80CEC68(0x2000);
                    BG_EnableSyncByMask(BG2_SYNC_BIT);

                    break;

                case GUIDE_STATE_2:
                    gGuideSt->detailLinesScrolled = 0;
                    SetFlag(gGuideTable[gGuideSt->unk_68[gGuideSt->unk_2b]].readFlag);
                    MoveGuideDetailText(gGuideSt->unk_68[gGuideSt->unk_2b], GUIDE_DETAILS_STAY);
                    LockMenuScrollBar();

                    return;

                default:
                    return;
            }

            break;

        case GUIDE_ACTION_ADVANCE_TEXT:
            MoveGuideDetailText(gGuideSt->unk_68[gGuideSt->unk_2b], GUIDE_DETAILS_ADVANCE);
            break;

        case GUIDE_ACTION_REVERSE_TEXT:
            MoveGuideDetailText(gGuideSt->unk_68[gGuideSt->unk_2b], GUIDE_DETAILS_REVERSE);
            break;

        case GUIDE_ACTION_CANCEL:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

            if (gGuideSt->state != GUIDE_STATE_0)
            {
                gGuideSt->state--;

                switch (gGuideSt->state)
                {
                    case GUIDE_STATE_0:
                        sub_80CEC68(0x1000);
                        BG_EnableSyncByMask(BG2_SYNC_BIT);
                        break;

                    case GUIDE_STATE_1:
                        Proc_StartBlocking(gProcScr_GuideEntryListRedraw_Initial, proc_);
                        UnlockMenuScrollBar();
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

        case GUIDE_ACTION_SORT:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            gGuideSt->sortMode = (gGuideSt->sortMode + 1) & 1;
            if (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
            {
                SetFlag(0xb3);
            }
            else
            {
                ClearFlag(0xb3);
            }

            gGuideSt->categoryIdx = 0;
            gGuideSt->unk_2a = 0;
            gGuideSt->unk_2b = 0;
            gGuideSt->unk_2c = 0;

            Proc_StartBlocking(gProcScr_GuideCategoryRedraw, proc_);

            break;

        case GUIDE_ACTION_1:
            switch (gGuideSt->state)
            {
                case GUIDE_STATE_0:
                    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
                    {
                        if (gGuideSt->categoryIdx != 0)
                        {
                            gGuideSt->categoryIdx--;

                            if (((gGuideSt->categoryIdx - gGuideSt->unk_2a) < 1) && (gGuideSt->unk_2a != 0))
                            {
                                gGuideSt->unk_2a--;
                                sub_80CE750(proc_, gGuideSt->categoryIdx - 1);
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
                        if (gGuideSt->categoryIdx <
                            ((gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC ? 
                                gGuideSt->unk_3c : gGuideSt->unk_3d) - 1))
                        {
                            gGuideSt->categoryIdx++;

                            if ((gGuideSt->categoryIdx - gGuideSt->unk_2a) > 4)
                            {
                                if (gGuideSt->categoryIdx <
                                    ((gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC
                                        ? gGuideSt->unk_3c : gGuideSt->unk_3d) - 1))
                                {
                                    gGuideSt->unk_2a++;
                                    sub_80CE858(proc_, gGuideSt->categoryIdx + 1);
                                }
                            }
                            flag = 1;
                        }

                        if (!flag)
                        {
                            return;
                        }
                    }

                    Proc_Start(gProcScr_GuideEntryListRedraw_Initial, proc_);
                    gGuideSt->unk_2b = 0;
                    gGuideSt->unk_2c = 0;

                    break;

                case GUIDE_STATE_1:
                    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
                    {
                        if (gGuideSt->unk_2b != 0)
                        {
                            gGuideSt->unk_2b--;

                            if ((gGuideSt->unk_2b - gGuideSt->unk_2c < 1) && (gGuideSt->unk_2c != 0))
                            {
                                gGuideSt->unk_2c--;
                                sub_80CE750(proc_, gGuideSt->unk_2b - 1);
                            }

                            flag = 1;
                        }
                    }
                    else
                    {
                        if (gGuideSt->unk_2b < (gGuideSt->unk_3e - 1))
                        {
                            gGuideSt->unk_2b++;

                            if ((gGuideSt->unk_2b - gGuideSt->unk_2c > 4) && (gGuideSt->unk_2b < gGuideSt->unk_3e - 1))
                            {
                                gGuideSt->unk_2c++;
                                sub_80CE858(proc_, gGuideSt->unk_2b + 1);
                            }

                            flag = 1;
                        }
                    }

                    break;

                case GUIDE_STATE_2:
                    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
                    {
                        if (gGuideSt->detailLinesScrolled != 0)
                        {
                            gGuideSt->detailLinesScrolled--;
                            proc_ = Proc_StartBlocking(gProcScr_GuideDetailsRedraw, proc_);
                            proc_->unk_34 = gGuideSt->detailLinesScrolled;
                            proc_->unk_38 = 0;
                            flag = 1;
                        }
                    }
                    else
                    {
                        if (gGuideSt->detailLinesScrolled < gGuideSt->numDetailLines - 4)
                        {
                            gGuideSt->detailLinesScrolled++;

                            proc_ = Proc_StartBlocking(gProcScr_GuideDetailsRedraw, proc_);
                            proc_->unk_34 = gGuideSt->detailLinesScrolled + 3;
                            proc_->unk_38 = 1;

                            flag = 1;
                        }
                    }
            }

            if (!flag)
            {
                return;
            }

            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }

    return;
}

//! FE8U = 0x080CF448
void Guide_OnEnd(void)
{
    EndMuralBackground();
    Proc_EndEach(gProcScr_Guide_DrawSprites);
    EndMenuScrollBar();
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_E_Guide1[] =
{
    PROC_NAME("E_Guide"),

    PROC_CALL(LockGame),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(BMapDispSuspend),
    PROC_YIELD,

    PROC_CALL(Guide_Init),
    PROC_CALL(StartGreenText),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(Guide_SetBlend),
    PROC_REPEAT(Guide_MainLoop),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndGreenText),

    PROC_CALL(Guide_OnEnd),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_E_Guide2[] =
{
    PROC_NAME("E_Guide"),

    PROC_CALL(LockGame),

    PROC_CALL(BMapDispSuspend),
    PROC_YIELD,

    PROC_CALL(Guide_Init),
    PROC_CALL(StartGreenText),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(Guide_SetBlend),
    PROC_REPEAT(Guide_MainLoop),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndGreenText),

    PROC_CALL(Guide_OnEnd),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(UnlockGame),

    PROC_END,
};

void BmGuideTextSetAllGreen(void)
{
    struct GuideEnt * it;

    for (it = gGuideTable; it->title != 12; it++)
    {
        SetFlag(it->displayFlag);
    }
    return;
}

bool BmGuideTextShowGreenOrNormal(void)
{
    struct GuideEnt * it;

    for (it = gGuideTable; it->title != 12; it++)
    {
        if (CheckFlag(it->displayFlag) && !CheckFlag(it->readFlag))
        {
            return FALSE;
        }
    }
    return TRUE;
}

// Pad the data here so that the linker script doesn't need to specify the
// exact location of data after this file.
const u8 TextFiller[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
