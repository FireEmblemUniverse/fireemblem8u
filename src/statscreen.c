
#include "global.h"

#include <stdlib.h>
#include <string.h> // TODO: remove

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"

#include "constants/classes.h"

#include "statscreen.h"

struct StatScreenInfo
{
    /* 00 */ u8  unk00;
    /* 01 */ u8  unitId;
    /* 02 */ u16 config;
};

struct SSTextDispInfo
{
    /* 00 */ struct TextHandle* text;
    /* 04 */ u16* tilemap;
    /* 08 */ u8 color;
    /* 09 */ u8 xoff;
    /* 0C */ const unsigned* mid;
};

// TODO: figure out what to do with those
// (It's in the weird EWRAM overlay area)

extern struct StatScreenSt gStatScreen; // statscreen state
extern u16 gBmFrameTmap0[0x280]; // bg0 tilemap buffer for stat screen page
extern u16 gBmFrameTmap1[0x240]; // bg2 tilemap buffer for stat screen page

static struct StatScreenInfo EWRAM_DATA sStatScreenInfo = {};

static struct HelpBoxInfo EWRAM_DATA sMutableHbi = {};
static const struct HelpBoxInfo* EWRAM_DATA sLastHbi = NULL;
static struct Vec2 EWRAM_DATA sHbOrigin = {};

static
struct SSTextDispInfo const sPage0TextInfo[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_SKLLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 3),  TEXT_COLOR_GOLD, 0, &gUnknown_08A0116C },
    { gStatScreen.text + STATSCREEN_TEXT_SPDLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 5),  TEXT_COLOR_GOLD, 0, &gUnknown_08A01170 },
    { gStatScreen.text + STATSCREEN_TEXT_LCKLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 7),  TEXT_COLOR_GOLD, 0, &gUnknown_08A0117C },
    { gStatScreen.text + STATSCREEN_TEXT_DEFLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 9),  TEXT_COLOR_GOLD, 0, &gUnknown_08A01174 },
    { gStatScreen.text + STATSCREEN_TEXT_RESLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 11), TEXT_COLOR_GOLD, 0, &gUnknown_08A01178 },
    { gStatScreen.text + STATSCREEN_TEXT_MOVLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(9, 1),  TEXT_COLOR_GOLD, 0, &gUnknown_08A01188 },
    { gStatScreen.text + STATSCREEN_TEXT_CONLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(9, 3),  TEXT_COLOR_GOLD, 0, &gUnknown_08A01180 },
    { gStatScreen.text + STATSCREEN_TEXT_AIDLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(9, 5),  TEXT_COLOR_GOLD, 0, &gUnknown_08A01184 },
    { gStatScreen.text + STATSCREEN_TEXT_RESCUENAME, gBmFrameTmap0 + TILEMAP_INDEX(9, 7),  TEXT_COLOR_GOLD, 0, &gUnknown_08A0118C },
    { gStatScreen.text + STATSCREEN_TEXT_AFFINLABEL, gBmFrameTmap0 + TILEMAP_INDEX(9, 9),  TEXT_COLOR_GOLD, 0, &gUnknown_08A01190 },
    { gStatScreen.text + STATSCREEN_TEXT_STATUS,     gBmFrameTmap0 + TILEMAP_INDEX(9, 11), TEXT_COLOR_GOLD, 0, &gUnknown_08A011A8 },

    { }, // end
};

static
struct SSTextDispInfo const sPage1TextInfo[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_BSATKLABEL, gBmFrameTmap0 + TILEMAP_INDEX(2, 13), TEXT_COLOR_GOLD, 6, &gUnknown_08A01198 },
    { gStatScreen.text + STATSCREEN_TEXT_BSHITLABEL, gBmFrameTmap0 + TILEMAP_INDEX(2, 15), TEXT_COLOR_GOLD, 6, &gUnknown_08A0119C },
    { gStatScreen.text + STATSCREEN_TEXT_BSRANGE,    gBmFrameTmap0 + TILEMAP_INDEX(9, 11), TEXT_COLOR_GOLD, 6, &gUnknown_08A01194 },
    { gStatScreen.text + STATSCREEN_TEXT_BSCRTLABEL, gBmFrameTmap0 + TILEMAP_INDEX(9, 13), TEXT_COLOR_GOLD, 6, &gUnknown_08A011A0 },
    { gStatScreen.text + STATSCREEN_TEXT_BSAVOLABEL, gBmFrameTmap0 + TILEMAP_INDEX(9, 15), TEXT_COLOR_GOLD, 6, &gUnknown_08A011A4 },

    { }, // end
};

static
struct SSTextDispInfo const sPage2TextInfo_Physical[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0, gBmFrameTmap0 + TILEMAP_INDEX(3,  1), TEXT_COLOR_NORMAL, 0, &gUnknown_08A011E8 },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1, gBmFrameTmap0 + TILEMAP_INDEX(3,  3), TEXT_COLOR_NORMAL, 0, &gUnknown_08A011EC },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2, gBmFrameTmap0 + TILEMAP_INDEX(11, 1), TEXT_COLOR_NORMAL, 0, &gUnknown_08A011F0 },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3, gBmFrameTmap0 + TILEMAP_INDEX(11, 3), TEXT_COLOR_NORMAL, 0, &gUnknown_08A011F4 },

    { }, // end
};

static
struct SSTextDispInfo const sPage2TextInfo_Magical[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0, gBmFrameTmap0 + TILEMAP_INDEX(3,  1), TEXT_COLOR_NORMAL, 0, &gUnknown_08A011FC },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1, gBmFrameTmap0 + TILEMAP_INDEX(3,  3), TEXT_COLOR_NORMAL, 0, &gUnknown_08A01200 },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2, gBmFrameTmap0 + TILEMAP_INDEX(11, 1), TEXT_COLOR_NORMAL, 0, &gUnknown_08A01204 },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3, gBmFrameTmap0 + TILEMAP_INDEX(11, 3), TEXT_COLOR_NORMAL, 0, &gUnknown_08A011F8 },

    { }, // end
};

static
struct TextBatch CONST_DATA sSSMasterTextBatch[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_CHARANAME,  7  },
    { gStatScreen.text + STATSCREEN_TEXT_CLASSNAME,  8  },
    { gStatScreen.text + STATSCREEN_TEXT_UNUSUED,    3  },
    { gStatScreen.text + STATSCREEN_TEXT_POWLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_SKLLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_SPDLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_LCKLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_DEFLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_RESLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_MOVLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_CONLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_AIDLABEL,   3  },
    { gStatScreen.text + STATSCREEN_TEXT_RESCUENAME, 9  },
    { gStatScreen.text + STATSCREEN_TEXT_AFFINLABEL, 7  },
    { gStatScreen.text + STATSCREEN_TEXT_STATUS,     9  },
    { gStatScreen.text + STATSCREEN_TEXT_ITEM0,      7  },
    { gStatScreen.text + STATSCREEN_TEXT_ITEM1,      7  },
    { gStatScreen.text + STATSCREEN_TEXT_ITEM2,      7  },
    { gStatScreen.text + STATSCREEN_TEXT_ITEM3,      7  },
    { gStatScreen.text + STATSCREEN_TEXT_ITEM4,      7  },
    { gStatScreen.text + STATSCREEN_TEXT_BSRANGE,    7  },
    { gStatScreen.text + STATSCREEN_TEXT_BSATKLABEL, 3  },
    { gStatScreen.text + STATSCREEN_TEXT_BSHITLABEL, 3  },
    { gStatScreen.text + STATSCREEN_TEXT_BSCRTLABEL, 3  },
    { gStatScreen.text + STATSCREEN_TEXT_BSAVOLABEL, 4  },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0,      2  },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1,      2  },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2,      2  },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3,      2  },
    { gStatScreen.text + STATSCREEN_TEXT_SUPPORT0,   7  },
    { gStatScreen.text + STATSCREEN_TEXT_SUPPORT1,   7  },
    { gStatScreen.text + STATSCREEN_TEXT_SUPPORT2,   7  },
    { gStatScreen.text + STATSCREEN_TEXT_SUPPORT3,   7  },
    { gStatScreen.text + STATSCREEN_TEXT_SUPPORT4,   7  },
    { gStatScreen.text + STATSCREEN_TEXT_BWL,        16 },

    { }, // end
};

static
s8 CONST_DATA sPageSlideOffsetLut[] = // stat screen page transition draw offset lut
{
    // transition page out
    -4, -7, -10, -12, -14,

    INT8_MAX, // draw new page

    // transition page in
    13, 9, 7, 5, 3, 2, 1, 0,

    INT8_MIN, // end
};

struct ProcCmd CONST_DATA gProcScr_SSPageSlide[] =
{
    PROC_LOOP_ROUTINE(sub_80879DC),
    PROC_CALL_ROUTINE(sub_8087ACC),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSGlowyBlendCtrl[] =
{
    PROC_SLEEP(0),

    PROC_CALL_ROUTINE(sub_8087B40),
    PROC_LOOP_ROUTINE(sub_8087BA0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSUnitSlide[] =
{
    PROC_SLEEP(0),

    PROC_CALL_ROUTINE(sub_8087C04),
    PROC_CALL_ROUTINE(sub_8087C34),

    PROC_LOOP_ROUTINE(sub_8087CC0),

    PROC_CALL_ROUTINE(sub_8087DF8),
    PROC_CALL_ROUTINE(sub_8087D24),

    PROC_LOOP_ROUTINE(sub_8087D98),
    PROC_SLEEP(0),

    PROC_CALL_ROUTINE(sub_8087BF0),
    PROC_CALL_ROUTINE(sub_8087E28),

    PROC_END,
};

static u16 CONST_DATA sSprite_Page0Name[] =
{
    3,
    0x4104, 0x9008, TILEREF(0, 0),
    0x4104, 0x9028, TILEREF(4, 0),
    0x4104, 0x9048, TILEREF(8, 0),
};

static u16 CONST_DATA sSprite_Page1Name[] =
{
    2,
    0x4104, 0x901E, TILEREF(0, 0),
    0x4104, 0x903E, TILEREF(4, 0),
};

static u16 CONST_DATA sSprite_Page2Name[] =
{
    5,
    0x4108, 0x9004, TILEREF(6,  0),
    0x4108, 0x9024, TILEREF(10, 0),
    0x4108, 0x9044, TILEREF(14, 0),
    0x4100, 0x9000, TILEREF(0,  0),
    0x0100, 0x5020, TILEREF(4,  0),
};

static u16 CONST_DATA sSprite_PageNameBack[] =
{
    6,
    0x4002, 0x8000, TILEREF(0, 0),
    0x0002, 0x4020, TILEREF(4, 0),
    0x8002, 0x0030, TILEREF(6, 0),
    0x8002, 0x1032, TILEREF(6, 0),
    0x0002, 0x503A, TILEREF(4, 0),
    0x4002, 0x904A, TILEREF(0, 0),
};

static u16 const* CONST_DATA sPageNameSpriteLut[] =
{
    sSprite_Page0Name,
    sSprite_Page1Name,
    sSprite_Page2Name,
};

static u16 CONST_DATA sPageNameChrOffsetLut[] = { 0, 64, 14 }; // tile offsets within an image

struct ProcCmd CONST_DATA gProcScr_SSPageNameCtrl[] =
{
    PROC_CALL_ROUTINE(sub_8087F48),

PROC_LABEL(0),
    PROC_LOOP_ROUTINE(sub_8087FE0),
    PROC_LOOP_ROUTINE(sub_8088014),

    PROC_SLEEP(1),

    PROC_LOOP_ROUTINE(sub_80880DC),

    PROC_GOTO(0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSPageNumCtrl[] =
{
    PROC_CALL_ROUTINE(sub_80881AC),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL_ROUTINE(sub_80881C4),
    PROC_CALL_ROUTINE(sub_80881FC),
    PROC_CALL_ROUTINE(sub_80882E4),
    PROC_CALL_ROUTINE(sub_8088354),
    PROC_CALL_ROUTINE(sub_8088384),

    PROC_GOTO(0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSBgOffsetCtrl[] =
{
    PROC_LOOP_ROUTINE(sub_8088920),
    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_StatScreen[] =
{
    PROC_CALL_ROUTINE(sub_808844C),
    PROC_CALL_ROUTINE(BMapDispSuspend),

    PROC_SLEEP(2),

    PROC_CALL_ROUTINE(sub_80884B0),
    PROC_CALL_ROUTINE(NewGreenTextColorManager),

    PROC_CALL_ROUTINE(sub_8088670),

    PROC_NEW_CHILD(gProcScr_SSGlowyBlendCtrl),
    PROC_NEW_CHILD(gProcScr_SSPageNameCtrl),
    PROC_NEW_CHILD(gProcScr_SSPageNumCtrl),
    PROC_NEW_CHILD(gProcScr_SSBgOffsetCtrl),

    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_CALL_ROUTINE(sub_808890C),

    // fallthrough

PROC_LABEL(1),
    PROC_SLEEP(2),

    PROC_LOOP_ROUTINE(sub_808873C),

PROC_LABEL(10),
    PROC_SLEEP(2),

    PROC_END_ALL(gProcScr_SSGlowyBlendCtrl),

    PROC_CALL_ROUTINE(sub_80888B4),

    PROC_CALL_ROUTINE(BMapDispResume),
    PROC_CALL_ROUTINE(MU_EndAll),
    PROC_CALL_ROUTINE(EndGreenTextColorManager),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_HelpBox[] =
{
    PROC_SLEEP(0),

    PROC_CALL_ROUTINE(sub_8088CFC),
    PROC_LOOP_ROUTINE(sub_8088D3C),

PROC_LABEL(0x63),
    PROC_CALL_ROUTINE(sub_8088D64),
    PROC_LOOP_ROUTINE(sub_8088DB8),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_HelpBoxMoveCtrl[] =
{
    PROC_SLEEP(1),

PROC_LABEL(0),
    PROC_CALL_ROUTINE(sub_8089060),
    PROC_LOOP_ROUTINE(sub_8089088),
    PROC_CALL_ROUTINE(sub_8089018),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_HelpBoxLock[] =
{
    PROC_LOOP_ROUTINE(sub_8089430),
    PROC_END,
};

static
u16 CONST_DATA sSprite_MetaHelp[] = // 'R is info'
{
    2,
    0x4000, 0x8000, TILEREF(11, 0),
    0x8000, 0x0020, TILEREF(15, 0),
};

struct ProcCmd CONST_DATA gProcScr_MetaHelpSprCtrl[] = // proc displaying 'R is Info'
{
    PROC_SLEEP(0),

    PROC_LOOP_ROUTINE(Loop6C_8A00B20_UpdateOAMData),
    PROC_END,
};

extern struct HelpBoxInfo CONST_DATA gUnknown_08A00BC4; // page 0 root help
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00D14; // hardcoded thing bad
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00DA0; // page 1 root help
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00F44; // page 2 root help

extern u16 CONST_DATA gUnknown_08A01EE4[]; // some face-related palette (if portrait)
extern u16 CONST_DATA gUnknown_08A01F04[]; // some face-related palette (if card)
extern u8  CONST_DATA gUnknown_08A01F24[]; // img?
extern u8  CONST_DATA gUnknown_08A020F0[]; // img?
extern u16 CONST_DATA gUnknown_08A021E4[]; // pal
extern u8  CONST_DATA gUnknown_08A02204[]; // tsa
extern u8  CONST_DATA gUnknown_08A02250[]; // tsa
extern u8  CONST_DATA gUnknown_08A02274[]; // img objects
extern u16 CONST_DATA gUnknown_08A027FC[][0x10]; // color animation for each page
extern u8  CONST_DATA gUnknown_08A064E0[]; // halo img
extern u8  CONST_DATA gUnknown_08A071FC[]; // halo tsa
extern u16 CONST_DATA gUnknown_08A0731C[]; // halo pal
extern u8  CONST_DATA gUnknown_08A03368[]; // background img
extern u8  CONST_DATA gUnknown_08A05F10[]; // background tsa
extern u16 CONST_DATA gUnknown_08A06460[]; // background pal

extern u16 CONST_DATA gUnknown_08A1D79C[]; // 'R is info' palette

static void sub_8086E00(const struct SSTextDispInfo* unk);

void sub_8088670(struct Proc* proc);
void MakeStatScreenRText6C(int pageid, struct Proc* proc);
const struct HelpBoxInfo* sub_80895A8(void);
void Create6CRText(const struct HelpBoxInfo* helpinfo, struct Proc* parent); // StartMoveableHelpBox
int sub_8089354(struct HelpBoxProc* proc);
int sub_8089384(struct HelpBoxProc* proc);
int sub_80893B4(struct HelpBoxProc* proc);
int sub_80893E4(struct HelpBoxProc* proc);
void sub_8089980(int a, int b, int c, int d, int e);
void sub_80892C0(struct HelpBoxProc* proc);
void sub_808929C(struct HelpBoxProc* proc, int x, int y);
void sub_80891AC(struct HelpBoxProc* proc, int width, int height);
void sub_8089210(struct HelpBoxProc* proc, int x, int y);
void sub_808A118(void);

void sub_808A0FC(int item, int msgid);

void sub_8088E9C(const struct HelpBoxInfo* info, int unk);
void sub_8089320(struct HelpBoxProc* proc);

int sub_80892D0(int item);

int GetSomeUnitId(void)
{
    return sStatScreenInfo.unitId;
}

void sub_8086DD8(int uid)
{
    sStatScreenInfo.unitId = uid;
}

void sub_8086DE4(int config)
{
    sStatScreenInfo.config = config;
}

void sub_8086DF0(void)
{
    InitTextBatch(sSSMasterTextBatch);
}

static void sub_8086E00(const struct SSTextDispInfo* unk)
{
    while (unk->text)
    {
        if (unk->mid)
        {
            DrawTextInline(
                unk->text,
                unk->tilemap,
                unk->color,
                unk->xoff, 0,
                GetStringFromIndex(*unk->mid));
        }
        else
        {
            Text_Draw(unk->text, unk->tilemap);
        }

        ++unk;
    }
}

void sub_8086E44(void)
{
    const char* namestr = GetStringFromIndex(UNIT_NAME_ID(gStatScreen.unit));
    unsigned namexoff = GetStringTextCenteredPos(0x30, namestr);

    BG_Fill(gBG0TilemapBuffer, 0);

    // Generate battle stats for unit for display later
    BattleGenerateUiStats(
        gStatScreen.unit,
        GetUnitEquippedWeaponSlot(gStatScreen.unit));

    // Display character name
    DrawTextInline(
        &gStatScreen.text[STATSCREEN_TEXT_CHARANAME],
        gBG0TilemapBuffer + TILEMAP_INDEX(3, 10),
        TEXT_COLOR_NORMAL, namexoff, 0, namestr);

    // Display class name
    DrawTextInline(
        &gStatScreen.text[STATSCREEN_TEXT_CLASSNAME],
        gBG0TilemapBuffer + TILEMAP_INDEX(1, 13),
        TEXT_COLOR_NORMAL, 0, 0,
        GetStringFromIndex(gStatScreen.unit->pClassData->nameTextId));

    // Display Lv/E labels
    sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(1, 15), TEXT_COLOR_GOLD, 0x24, 0x25);
    sub_8004B0C(gBG0TilemapBuffer + TILEMAP_INDEX(5, 15), TEXT_COLOR_GOLD, 0x1D);

    // Display Hp/'/' labels
    sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(1, 17), TEXT_COLOR_GOLD, 0x22, 0x23);
    sub_8004B0C(gBG0TilemapBuffer + TILEMAP_INDEX(5, 17), TEXT_COLOR_GOLD, 0x16);

    // Display level
    DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(4, 15), TEXT_COLOR_BLUE,
        gStatScreen.unit->level);

    // Display exp
    DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(7, 15), TEXT_COLOR_BLUE,
        gStatScreen.unit->exp);

    // Display current hp

    if (GetUnitCurrentHp(gStatScreen.unit) > 99)
    {
        // Display '--' if current hp > 99
        sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(3, 17), TEXT_COLOR_BLUE,
            0x14, 0x14);
    }
    else
    {
        // Display current hp
        DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(4, 17), TEXT_COLOR_BLUE,
            GetUnitCurrentHp(gStatScreen.unit));
    }

    // Display max hp

    if (GetUnitMaxHp(gStatScreen.unit) > 99)
    {
        // Display '--' if max hp > 99
        sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(6, 17), TEXT_COLOR_BLUE,
            0x14, 0x14);
    }
    else
    {
        // Display max hp
        DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(7, 17), TEXT_COLOR_BLUE,
            GetUnitMaxHp(gStatScreen.unit));
    }
}

void sub_8086FAC(void)
{
    struct UnitUsageStats* stats = BWL_GetEntry(gStatScreen.unit->pCharacterData->number);

    if (!stats)
        return;

    if (gUnknown_0202BCB0.gameStateBits & 0x40)
        return;

    if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_3)
        return;

    if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_7)
        return;

    if (IsFirstPlaythrough() == TRUE)
        return;

    if (UNIT_FACTION(gStatScreen.unit) != FACTION_BLUE)
        return;

    Text_Clear(&gStatScreen.text[STATSCREEN_TEXT_BWL]);

    // Draw B label
    Text_InsertString(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        0, TEXT_COLOR_GOLD, GetStringFromIndex(0x51F));

    // Draw W label
    Text_InsertString(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        32, TEXT_COLOR_GOLD, GetStringFromIndex(0x520));

    // Draw L label
    Text_InsertString(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        64, TEXT_COLOR_GOLD, GetStringFromIndex(0x521));

    // Display labels
    Text_Draw(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        gBmFrameTmap0 + TILEMAP_INDEX(3, 14));

    // Display Battle Amt
    sub_8004B88(gBmFrameTmap0 + TILEMAP_INDEX(3 + sub_80AEBEC(stats->battleAmt), 14),
        TEXT_COLOR_BLUE, stats->battleAmt);

    // Display Win Amt
    sub_8004B88(gBmFrameTmap0 + TILEMAP_INDEX(7 + sub_80AEBEC(stats->winAmt), 14),
        TEXT_COLOR_BLUE, stats->winAmt);

    // Display Loss Amt
    sub_8004B88(gBmFrameTmap0 + TILEMAP_INDEX(11 + sub_80AEBEC(stats->lossAmt), 14),
        TEXT_COLOR_BLUE, stats->lossAmt);
}

#ifdef NONMATCHING

void DrawStatScreenBar(int num, int x, int y, int base, int total, int max)
{
    int diff = total - base;

    DrawDecNumber(gBmFrameTmap0 + TILEMAP_INDEX(x, y),
        (base == max) ? TEXT_COLOR_GREEN : TEXT_COLOR_BLUE, base);

    sub_8004BF0(diff, gBmFrameTmap0 + TILEMAP_INDEX(x + 1, y));

    if (total > 30)
        diff = 30 - base;

    sub_8086B2C(0x401 + num*6, 6,
        gBmFrameTmap1 + TILEMAP_INDEX(x - 2, y + 1),
        TILEREF(0, STATSCREEN_BGPAL_3), max * 41 / 30, base * 41 / 30, diff * 41 / 30);
}

#else // NONMATCHING

__attribute__((naked))
void DrawStatScreenBar(int num, int x, int y, int base, int total, int max)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x10\n\
        mov sl, r0\n\
        mov r8, r1\n\
        str r2, [sp, #0xc]\n\
        adds r7, r3, #0\n\
        ldr r5, [sp, #0x30]\n\
        subs r0, r5, r7\n\
        mov r9, r0\n\
        lsls r6, r2, #5\n\
        adds r0, r6, r1\n\
        lsls r0, r0, #1\n\
        ldr r4, _08087178  @ gBmFrameTmap0\n\
        adds r0, r0, r4\n\
        movs r1, #2\n\
        ldr r2, [sp, #0x34]\n\
        cmp r7, r2\n\
        bne _080870EA\n\
        movs r1, #4\n\
    _080870EA:\n\
        adds r2, r7, #0\n\
        bl DrawDecNumber\n\
        adds r1, r6, #1\n\
        add r1, r8\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r4\n\
        mov r0, r9\n\
        bl sub_8004BF0\n\
        cmp r5, #0x1e\n\
        ble _08087108\n\
        movs r5, #0x1e\n\
        subs r5, r5, r7\n\
        mov r9, r5\n\
    _08087108:\n\
        mov r0, sl\n\
        lsls r5, r0, #1\n\
        add r5, sl\n\
        lsls r5, r5, #1\n\
        ldr r1, _0808717C  @ 0x00000401\n\
        adds r5, r5, r1\n\
        ldr r4, [sp, #0xc]\n\
        adds r4, #1\n\
        lsls r4, r4, #5\n\
        subs r4, #2\n\
        add r4, r8\n\
        lsls r4, r4, #1\n\
        ldr r0, _08087180  @ gBmFrameTmap1\n\
        adds r4, r4, r0\n\
        movs r6, #0xc0\n\
        lsls r6, r6, #7\n\
        ldr r2, [sp, #0x34]\n\
        lsls r0, r2, #2\n\
        adds r0, r0, r2\n\
        lsls r0, r0, #3\n\
        adds r0, r0, r2\n\
        movs r1, #0x1e\n\
        bl __divsi3\n\
        str r0, [sp]\n\
        lsls r0, r7, #2\n\
        adds r0, r0, r7\n\
        lsls r0, r0, #3\n\
        adds r0, r0, r7\n\
        movs r1, #0x1e\n\
        bl __divsi3\n\
        str r0, [sp, #4]\n\
        mov r1, r9\n\
        lsls r0, r1, #2\n\
        add r0, r9\n\
        lsls r0, r0, #3\n\
        add r0, r9\n\
        movs r1, #0x1e\n\
        bl __divsi3\n\
        str r0, [sp, #8]\n\
        adds r0, r5, #0\n\
        movs r1, #6\n\
        adds r2, r4, #0\n\
        adds r3, r6, #0\n\
        bl sub_8086B2C\n\
        add sp, #0x10\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08087178: .4byte gBmFrameTmap0\n\
    _0808717C: .4byte 0x00000401\n\
    _08087180: .4byte gBmFrameTmap1\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void DrawUnitStatScreen(void)
{
    sub_8086E00(sPage0TextInfo);

    // Displaying str/mag label
    if (UnitHasMagicRank(gStatScreen.unit))
    {
        // mag
        DrawTextInline(
            &gStatScreen.text[STATSCREEN_TEXT_POWLABEL],
            gBmFrameTmap0 + TILEMAP_INDEX(1, 1),
            TEXT_COLOR_GOLD, 0, 0,
            GetStringFromIndex(0x4FF)); // Mag
    }
    else
    {
        // str
        DrawTextInline(
            &gStatScreen.text[STATSCREEN_TEXT_POWLABEL],
            gBmFrameTmap0 + TILEMAP_INDEX(1, 1),
            TEXT_COLOR_GOLD, 0, 0,
            GetStringFromIndex(0x4FE)); // Str
    }

    // displaying str/mag stat value
    DrawStatScreenBar(0, 5, 1,
        gStatScreen.unit->pow,
        GetUnitPower(gStatScreen.unit),
        UNIT_POW_MAX(gStatScreen.unit));

    // displaying skl stat value
    DrawStatScreenBar(1, 5, 3,
        gStatScreen.unit->state & US_RESCUING
            ? gStatScreen.unit->skl/2
            : gStatScreen.unit->skl,
        GetUnitSkill(gStatScreen.unit),
        gStatScreen.unit->state & US_RESCUING
            ? UNIT_SKL_MAX(gStatScreen.unit)/2
            : UNIT_SKL_MAX(gStatScreen.unit));

    // displaying spd stat value
    DrawStatScreenBar(2, 5, 5,
        gStatScreen.unit->state & US_RESCUING
            ? gStatScreen.unit->spd/2
            : gStatScreen.unit->spd,
        GetUnitSpeed(gStatScreen.unit),
        gStatScreen.unit->state & US_RESCUING
            ? UNIT_SPD_MAX(gStatScreen.unit)/2
            : UNIT_SPD_MAX(gStatScreen.unit));

    // displaying lck stat value
    DrawStatScreenBar(3, 5, 7,
        gStatScreen.unit->lck,
        GetUnitLuck(gStatScreen.unit),
        UNIT_LCK_MAX(gStatScreen.unit));

    // displaying def stat value
    DrawStatScreenBar(4, 5, 9,
        gStatScreen.unit->def,
        GetUnitDefense(gStatScreen.unit),
        UNIT_DEF_MAX(gStatScreen.unit));

    // displaying res stat value
    DrawStatScreenBar(5, 5, 11,
        gStatScreen.unit->res,
        GetUnitResistance(gStatScreen.unit),
        UNIT_RES_MAX(gStatScreen.unit));

    // displaying mov stat value
    DrawStatScreenBar(6, 13, 1,
        UNIT_MOV_BASE(gStatScreen.unit),
        UNIT_MOV(gStatScreen.unit),
        UNIT_MOV_MAX(gStatScreen.unit));

    // displaying con stat value
    DrawStatScreenBar(7, 13, 3,
        UNIT_CON_BASE(gStatScreen.unit),
        UNIT_CON(gStatScreen.unit),
        UNIT_CON_MAX(gStatScreen.unit));

    // displaying unit aid
    DrawDecNumber(gBmFrameTmap0 + TILEMAP_INDEX(13, 5), TEXT_COLOR_BLUE,
        GetUnitAid(gStatScreen.unit));

    // displaying unit aid icon
    DrawIcon(gBmFrameTmap0 + TILEMAP_INDEX(14, 5),
        GetUnitAidIconId(UNIT_CATTRIBUTES(gStatScreen.unit)),
        TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

    // displaying unit rescue name
    Text_InsertString(
        &gStatScreen.text[STATSCREEN_TEXT_RESCUENAME],
        24, TEXT_COLOR_BLUE,
        GetUnitRescueName(gStatScreen.unit));

    // displaying unit status name and turns

    if (gStatScreen.unit->statusIndex != UNIT_STATUS_RECOVER)
    {
        // display name

        if (gStatScreen.unit->statusIndex == UNIT_STATUS_NONE)
        {
            Text_InsertString(
                &gStatScreen.text[STATSCREEN_TEXT_STATUS],
                24, TEXT_COLOR_BLUE,
                GetUnitStatusName(gStatScreen.unit));
        }
        else
        {
            Text_InsertString(
                &gStatScreen.text[STATSCREEN_TEXT_STATUS],
                22, TEXT_COLOR_BLUE,
                GetUnitStatusName(gStatScreen.unit));
        }

        // display turns

        if (gStatScreen.unit->statusIndex != UNIT_STATUS_NONE)
        {
            sub_8004BE4(
                gBmFrameTmap0 + TILEMAP_INDEX(16, 11),
                0, gStatScreen.unit->statusDuration);
        }
    }
    else
    {
        // I do not understand what this is for

        struct Unit tmp = *gStatScreen.unit;

        tmp.statusIndex = 0;

        if (gStatScreen.unit->statusIndex == UNIT_STATUS_NONE)
        {
            Text_InsertString(
                &gStatScreen.text[STATSCREEN_TEXT_STATUS],
                24, TEXT_COLOR_BLUE,
                GetUnitStatusName(&tmp));
        }
        else
        {
            Text_InsertString(
                &gStatScreen.text[STATSCREEN_TEXT_STATUS],
                22, TEXT_COLOR_BLUE,
                GetUnitStatusName(&tmp));
        }
    }

    // display affininity icon

    DrawIcon(
        gBmFrameTmap0 + TILEMAP_INDEX(12, 9),
        GetUnitAffinityIcon(gStatScreen.unit),
        TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

    sub_8086FAC();
}

void DrawUnitItemScreen(void)
{
    int i, item;
    const char* str;

    CopyDataWithPossibleUncomp(
        gUnknown_08A02204,
        gUnknown_02020188);

    CallARM_FillTileRect(
        gBmFrameTmap1 + TILEMAP_INDEX(1, 11),
        gUnknown_02020188, TILEREF(0x40, STATSCREEN_BGPAL_3));

    sub_8086E00(sPage1TextInfo);

    if (!UNIT_IS_GORGON_EGG(gStatScreen.unit))
    {
        for (i = 0; (i < UNIT_ITEM_COUNT) && (item = gStatScreen.unit->items[i]); ++i)
        {
            int color;

            if ((gStatScreen.unit->state & US_DROP_ITEM) && (i == GetUnitItemCount(gStatScreen.unit) - 1))
                color = TEXT_COLOR_GREEN;
            else
                color = IsItemDisplayUsable(gStatScreen.unit, item)
                    ? TEXT_COLOR_NORMAL
                    : TEXT_COLOR_GRAY;

            DrawItemStatScreenLine(
                &gStatScreen.text[STATSCREEN_TEXT_ITEM0 + i],
                item, color,
                gBmFrameTmap0 + TILEMAP_INDEX(1, 1 + i*2));
        }
    }

    i = GetUnitEquippedWeaponSlot(gStatScreen.unit);
    item = 0;

    if (gStatScreen.unit->pClassData->number != CLASS_GORGONEGG)
    {
        if ((gStatScreen.unit->pClassData->number != CLASS_GORGONEGG2) && (i >= 0))
        {
            sub_8004B0C(
                gBmFrameTmap0 + TILEMAP_INDEX(16, 1 + i*2),
                0, 0x35);

            CallARM_FillTileRect(
                gBmFrameTmap1 + TILEMAP_INDEX(1, 2 + i*2),
                gUnknown_08A02250, TILEREF(0x40, STATSCREEN_BGPAL_3));

            item = gStatScreen.unit->items[i];
        }
    }

    if (!UNIT_IS_GORGON_EGG(gStatScreen.unit))
    {
        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(8,  13),
            TEXT_COLOR_BLUE, gBattleActor.battleAttack);

        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(8,  15),
            TEXT_COLOR_BLUE, gBattleActor.battleHitRate);

        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(15, 13),
            TEXT_COLOR_BLUE, gBattleActor.battleCritRate);

        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(15, 15),
            TEXT_COLOR_BLUE, gBattleActor.battleAvoidRate);
    }
    else
    {
        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(8,  13),
            TEXT_COLOR_BLUE, 0xFF);

        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(8,  15),
            TEXT_COLOR_BLUE, 0xFF);

        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(15, 13),
            TEXT_COLOR_BLUE, 0xFF);

        DrawDecNumber(
            gBmFrameTmap0 + TILEMAP_INDEX(15, 15),
            TEXT_COLOR_BLUE, gBattleActor.battleAvoidRate);

        item = 0;
    }

    // TODO: macro, maybe?

    str = GetItemDisplayRangeString(item);
    Text_InsertString(
        &gStatScreen.text[STATSCREEN_TEXT_BSRANGE],
        55 - GetStringTextWidth(str),
        TEXT_COLOR_BLUE, str);

    for (i = 0; i < 8; ++i)
    {
        gBmFrameTmap0[TILEMAP_INDEX(1 + i, 11)] = TILEREF(0x60 + i, STATSCREEN_BGPAL_7);
        gBmFrameTmap0[TILEMAP_INDEX(1 + i, 12)] = TILEREF(0x68 + i, STATSCREEN_BGPAL_7);
    }
}

void DrawUnitScreenSupportList(void)
{
    int yTile = 6, lineNum = 0;

    int textColor = GetUnitTotalSupportLevel(gStatScreen.unit) == MAX_SIMULTANEOUS_SUPPORT_COUNT
        ? TEXT_COLOR_GREEN
        : TEXT_COLOR_NORMAL;

    int supportAmt = GetUnitSupporterCount(gStatScreen.unit);
    int supportId  = 0;

    while (supportId < supportAmt)
    {
        int level = GetUnitSupportLevel(gStatScreen.unit, supportId);

        if (level != 0)
        {
            int rankColor;

            u8 pid = GetUnitSupporterCharacter(gStatScreen.unit, supportId);

            DrawIcon(
                gBmFrameTmap0 + TILEMAP_INDEX(4, yTile),
                GetCharacterAffinityIcon(pid),
                TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

            DrawTextInline(&gStatScreen.text[STATSCREEN_TEXT_SUPPORT0 + lineNum],
                gBmFrameTmap0 + TILEMAP_INDEX(7, yTile),
                textColor, 0, 0,
                GetStringFromIndex(GetCharacterData(pid)->nameTextId));

            rankColor = TEXT_COLOR_BLUE;

            if (level == 3)
                rankColor = TEXT_COLOR_GREEN;

            if (textColor == TEXT_COLOR_GREEN)
                rankColor = TEXT_COLOR_GREEN;

            sub_8004B0C(gBmFrameTmap0 + TILEMAP_INDEX(13, yTile),
                rankColor, GetSupportLevelUiChar(level));

            yTile += 2;
            lineNum++;
        }

        supportId++;
    }
}

void DrawUnitWeaponRank(int num, int x, int y, int wtype)
{
    int progress, progressMax, color;

    int wexp = gStatScreen.unit->ranks[wtype];

    // Display weapon type icon
    DrawIcon(gBmFrameTmap0 + TILEMAP_INDEX(x, y),
        0x70 + wtype, // TODO: icon id definitions
        TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

    color = wexp >= WPN_EXP_S
        ? TEXT_COLOR_GREEN
        : TEXT_COLOR_BLUE;

    // Display rank letter
    sub_8004B0C(gBmFrameTmap0 + TILEMAP_INDEX(x + 4, y),
        color,
        GetDisplayRankStringFromExp(wexp));

    GetWeaponExpProgressState(wexp, &progress, &progressMax);

    sub_8086B2C(0x401 + num*6, 5,
        gBmFrameTmap1 + TILEMAP_INDEX(x + 2, y + 1), TILEREF(0, STATSCREEN_BGPAL_6),
        0x22, (progress*34)/(progressMax-1), 0);
}

void DrawUnitWeaponScreen(void)
{
    if (UnitHasMagicRank(gStatScreen.unit))
    {
        DrawUnitWeaponRank(0, 1, 1, ITYPE_ANIMA);
        DrawUnitWeaponRank(1, 1, 3, ITYPE_LIGHT);
        DrawUnitWeaponRank(2, 9, 1, ITYPE_DARK);
        DrawUnitWeaponRank(3, 9, 3, ITYPE_STAFF);
    }
    else
    {
        DrawUnitWeaponRank(0, 1, 1, ITYPE_SWORD);
        DrawUnitWeaponRank(1, 1, 3, ITYPE_LANCE);
        DrawUnitWeaponRank(2, 9, 1, ITYPE_AXE);
        DrawUnitWeaponRank(3, 9, 3, ITYPE_BOW);
    }

    DrawUnitScreenSupportList();
}

void sub_80878CC(int pageid)
{
    typedef void(*func_type)(void);

    func_type funcLut[4] =
    {
        DrawUnitStatScreen,
        DrawUnitItemScreen,
        DrawUnitWeaponScreen,
        DrawUnitStatScreen,
    };

    CpuFastFill(0, gBmFrameTmap0, sizeof(gBmFrameTmap0));
    CpuFastFill(0, gBmFrameTmap1, sizeof(gBmFrameTmap1));

    funcLut[pageid]();
}

struct Unit* sub_8087920(struct Unit* u, int direction)
{
    int faction = UNIT_FACTION(u);
    int i       = u->index;

    struct Unit* unit;

    while (TRUE)
    {
        i = (i + direction) & 0x3F;
        unit = GetUnit(faction + i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if ((sStatScreenInfo.config & 1) && (unit->state & US_DEAD))
            continue;

        if ((sStatScreenInfo.config & 2) && (unit->state & US_NOT_DEPLOYED))
            continue;

        if ((sStatScreenInfo.config & 4) && (unit->state & US_BIT9))
            continue;

        if ((sStatScreenInfo.config & 8) && (unit->state & US_UNDER_A_ROOF))
            continue;

        if ((sStatScreenInfo.config & 0x10) && (unit->state & US_BIT16))
            continue;

        if ((sStatScreenInfo.config & 0x20) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
            continue;

        if (UNIT_IS_GORGON_EGG(unit))
            continue;

        return unit;
    }
}

void sub_80879DC(struct StatScreenTransitionProc* proc)
{
    int off;

    int len, dstOff, srcOff;

    // clear bg0, bg2 page area
    TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18, 0);
    TileMap_FillRect(gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18, 0);

    off = sPageSlideOffsetLut[proc->unk4C];

    if (off == INT8_MAX)
    {
        // INT8_MAX offset means switch to displaying next page

        sub_80878CC(proc->unk4A);

        proc->unk4C++;
        off = sPageSlideOffsetLut[proc->unk4C];
    }

    // compute len, dstOff and srcOff
    // len is the length of the display bit of the page
    // dstOff is the x offset to which to copy the page to
    // srcOff is the x offset from which to copy the page from

    if (proc->unk52 & 0x20)
        off = -off;

    len = 18 - abs(off);

    if (off < 0)
    {
        dstOff = 0;
        srcOff = -off;
    }
    else
    {
        dstOff = off;
        srcOff = 0;
    }

    TileMap_CopyRect(
        gBmFrameTmap0 + srcOff,
        gBG0TilemapBuffer + dstOff + TILEMAP_INDEX(12, 2),
        len, 18);

    TileMap_CopyRect(
        gBmFrameTmap1 + srcOff,
        gBG2TilemapBuffer + dstOff + TILEMAP_INDEX(12, 2),
        len, 18);

    BG_EnableSyncByMask(BG0_SYNC_BIT + BG1_SYNC_BIT + BG2_SYNC_BIT);

    proc->unk4C++;
    off = sPageSlideOffsetLut[proc->unk4C];

    if (off == INT8_MIN)
        Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087ACC(void)
{
    gStatScreen.inTransition = FALSE;
}

void sub_8087AD8(u16 config, int newPage, struct Proc* parent)
{
    struct StatScreenTransitionProc* proc;

    if (Proc_Find(gProcScr_SSPageSlide))
        return;

    PlaySoundEffect(0x6F); // TODO: song ids

    proc = (void*) Proc_CreateBlockingChild(gProcScr_SSPageSlide, parent);

    proc->unk4C = 0;
    proc->unk4A = newPage;
    proc->unk52 = config;

    gStatScreen.unk02 = config;
    gStatScreen.help = NULL;
    gStatScreen.inTransition = TRUE;
}

void sub_8087B40(struct StatScreenTransitionProc* proc)
{
    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;

    proc->unk4C = 0;
    proc->unk4E = 0;

    SetSpecialColorEffectsParameters(1, proc->unk4C, 0x10, 0);

    sub_8001ED0(0, 1, 0, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 0);
}

void sub_8087BA0(struct StatScreenTransitionProc* proc)
{
    if (proc->unk4E == 0)
    {
        if (++proc->unk4C >= 0x40)
            proc->unk4E++;
    }
    else
    {
        if (--proc->unk4C <= 0)
            proc->unk4E = 0;
    }

    SetSpecialColorEffectsParameters(1, proc->unk4C >> 3, 0x10, 0);
}

void sub_8087BF0(void)
{
    Proc_Create(gProcScr_SSGlowyBlendCtrl, ROOT_PROC_3);
}

void sub_8087C04(void)
{
    Proc_DeleteAllWithScript(gProcScr_SSGlowyBlendCtrl);

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;
}

void sub_8087C34(struct StatScreenTransitionProc* proc)
{
    gStatScreen.inTransition = TRUE;

    proc->unk4C = 4;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 0;

    sub_8001ED0(0, 0, 0, 1, 0);
    sub_8001F0C(1, 1, 1, 0, 1);

    sub_8001F64(0);

    if (proc->unk38 > 0)
    {
        proc->unk3C = 0;
        proc->unk40 = -60;
    }
    else
    {
        proc->unk3C = 0;
        proc->unk40 = +60;
    }
}

void sub_8087CC0(struct StatScreenTransitionProc* proc)
{
    SetSpecialColorEffectsParameters(1, proc->unk4C, 0x10 - proc->unk4C, 0);

    MU_SetDisplayPosition(gStatScreen.mu,
        80, 138 + gStatScreen.yDispOff);

    gStatScreen.yDispOff = sub_8012DCC(2, proc->unk3C, proc->unk40, proc->unk4C, 0x10);

    proc->unk4C += 3;

    if (proc->unk4C > 0x10)
        Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087D24(struct StatScreenTransitionProc* proc)
{
    proc->unk4C = 1;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 0;

    sub_8001ED0(0, 0, 0, 1, 0);
    sub_8001F0C(1, 1, 1, 0, 1);

    if (proc->unk38 > 0)
    {
        proc->unk3C = +60;
        proc->unk40 = 0;
    }
    else
    {
        proc->unk3C = -60;
        proc->unk40 = 0;
    }
}

void sub_8087D98(struct StatScreenTransitionProc* proc)
{
    SetSpecialColorEffectsParameters(1, 0x10 - proc->unk4C, proc->unk4C, 0);

    MU_SetDisplayPosition(gStatScreen.mu,
        80, 138 + gStatScreen.yDispOff);

    gStatScreen.yDispOff = sub_8012DCC(5, proc->unk3C, proc->unk40, proc->unk4C, 0x10);

    proc->unk4C += 3;

    if (proc->unk4C >= 0x10)
        Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087DF8(struct StatScreenTransitionProc* proc)
{
    gStatScreen.unit = GetUnit(proc->unk4A);

    sub_8088670(Proc_Find(gProcScr_StatScreen));
    Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087E28(struct Proc* proc)
{
    if (gStatScreen.mu)
        MU_SetDisplayPosition(gStatScreen.mu,
            80, 138);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDefaultColorEffects();

    gStatScreen.inTransition = FALSE;
}

void sub_8087E7C(struct Unit* unit, int direction, struct Proc* parent)
{
    struct StatScreenTransitionProc* proc = (void*) Proc_CreateBlockingChild(gProcScr_SSUnitSlide, parent);

    proc->unk4A = unit->index;
    proc->unk38 = direction;

    PlaySoundEffect(0xC8); // TODO: song ids
}

void sub_8087EB8(int pageid)
{
    int colorid;

    RegisterObjectAttributes_SafeMaybe(4,
        111 + gStatScreen.unk04, 1 + gStatScreen.yDispOff,
        sSprite_PageNameBack, TILEREF(0x293, 4) + 0xC00);

    RegisterObjectAttributes_SafeMaybe(4,
        114 + gStatScreen.unk04, 0 + gStatScreen.yDispOff,
        sPageNameSpriteLut[pageid], TILEREF(0x240 + sPageNameChrOffsetLut[pageid], 3) + 0xC00);

    colorid = (GetGameClock()/4) % 16;

    CpuCopy16(
        gUnknown_08A027FC[pageid] + colorid,
        gPaletteBuffer + 0x13E,
        sizeof(u16));

    EnablePaletteSync();
}

void sub_8087F48(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    WriteOAMRotScaleData(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, 0x100), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, 0x100)  // pd
    );

    proc->unk36 = gStatScreen.page;
}

void sub_8087FE0(struct StatScreenPageNameProc* proc)
{
    sub_8087EB8(proc->unk36);

    if (gStatScreen.unk02)
    {
        proc->unk38 = 5;

        Proc_ClearNativeCallback((struct Proc*) proc);
        return;
    }

    proc->unk36 = gStatScreen.page;
}

void sub_8088014(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    WriteOAMRotScaleData(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, proc->unk38 * 0x100 / 6), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, proc->unk38 * 0x100 / 6)  // pd
    );

    sub_8087EB8(proc->unk36);

    proc->unk38--;

    if (proc->unk38 == 0)
    {
        proc->unk38 = 1;
        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

void sub_80880DC(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    WriteOAMRotScaleData(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, proc->unk38 * 0x100 / 6), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, proc->unk38 * 0x100 / 6)  // pd
    );

    sub_8087EB8(gStatScreen.page);

    proc->unk38++;

    if (proc->unk38 > 6)
    {
        proc->unk36 = gStatScreen.page;
        Proc_ClearNativeCallback((struct Proc*) proc);
    }
}

void sub_80881AC(struct StatScreenUnkProc* proc)
{
    proc->unk2A = 103;
    proc->unk2C = 217;

    proc->unk30 = 0;
    proc->unk2E = 0;

    proc->unk34 = 4;
    proc->unk32 = 4;
}

void sub_80881C4(struct StatScreenUnkProc* proc)
{
    if (gStatScreen.unk02 & 0x20)
    {
        proc->unk32 = 31;
        proc->unk2A = 97;
    }

    if (gStatScreen.unk02 & 0x10)
    {
        proc->unk34 = 31;
        proc->unk2C = 223;
    }

    gStatScreen.unk02 = 0;
}

void sub_80881FC(struct StatScreenUnkProc* proc)
{
    int baseref = TILEREF(0x240, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(1);

    proc->unk2E += proc->unk32;
    proc->unk30 += proc->unk34;

    if (proc->unk32 > 4)
        proc->unk32--;

    if (proc->unk34 > 4)
        proc->unk34--;

    if ((GetGameClock() % 4) == 0)
    {
        if (proc->unk2A < 103)
            proc->unk2A++;

        if (proc->unk2C > 217)
            proc->unk2C--;
    }

    RegisterObjectAttributes_SafeMaybe(0,
        gStatScreen.unk04 + proc->unk2A,
        gStatScreen.yDispOff + 3,
        gUnknown_08590F64, baseref + 0x5A + (proc->unk2E >> 5) % 6);

    RegisterObjectAttributes_SafeMaybe(0,
        gStatScreen.unk04 + proc->unk2C,
        gStatScreen.yDispOff + 3,
        gUnknown_08590FB4, baseref + 0x5A + (proc->unk30 >> 5) % 6);
}

void sub_80882E4(void)
{
    int chr = 0x289;

    // page amt
    RegisterObjectAttributes_SafeMaybe(2,
        gStatScreen.unk04 + 228,
        gStatScreen.yDispOff + 17,
        gUnknown_08590F44, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3) + gStatScreen.pageAmt);

    // '/'
    RegisterObjectAttributes_SafeMaybe(2,
        gStatScreen.unk04 + 222,
        gStatScreen.yDispOff + 17,
        gUnknown_08590F44, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3));

    // page num
    RegisterObjectAttributes_SafeMaybe(2,
        gStatScreen.unk04 + 215,
        gStatScreen.yDispOff + 17,
        gUnknown_08590F44, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3) + gStatScreen.page + 1);
}

void sub_8088354(void)
{
    RegisterObjectAttributes_SafeMaybe(11,
        gStatScreen.unk04 + 64,
        gStatScreen.yDispOff + 131,
        gUnknown_08590F8C, TILEREF(0x28F, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3));
}

void sub_8088384(void)
{
    s8 displayIcon = (GetGameClock() % 32) < 20;

    u16 palidLut[3] = { 0xC, 0xE, 0xD }; // TODO: palid constants

    if (!gStatScreen.inTransition)
    {
        if ((gStatScreen.page == STATSCREEN_PAGE_0) && (gStatScreen.unit->state & US_RESCUING))
        {
            sub_8015BD4(120, 40, 1);
            sub_8015BD4(120, 56, 1);

            if (displayIcon)
            {
                RegisterObjectAttributes_SafeMaybe(4,
                    184, 78, gUnknown_08590F44,
                    TILEREF(3, 0xF & palidLut[gStatScreen.unit->rescueOtherUnit>>6]) + OAM2_PRIORITY(2));
            }
        }

        if (gStatScreen.unit->state & US_RESCUED)
        {
            if (displayIcon)
            {
                RegisterObjectAttributes_SafeMaybe(4,
                    10, 86, gUnknown_08590F44,
                    TILEREF(3, 0xF & palidLut[gStatScreen.unit->rescueOtherUnit>>6]) + OAM2_PRIORITY(2));
            }
        }
    }
}

void sub_808844C(void)
{
    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

    sub_8001ED0(0, 0, 0, 0, 0);
    sub_8001F48(1);
    sub_8001F64(0);

    // TODO: ResetBackdropColor macro?
    gPaletteBuffer[0] = 0;
    EnablePaletteSync();
}

void sub_80884B0(struct Proc* proc)
{
    u16 bgConfig[12] =
    {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x8000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };

    SetupBackgrounds(bgConfig);

    UnpackUiFramePalette(STATSCREEN_BGPAL_3);
    RegisterBlankTile(0x400);

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    sub_80156D4();
    SetupMapSpritesPalettes();

    // TODO: port the macros from mapanim wip

    gLCDControlBuffer.dispcnt.win0_on   = TRUE;
    gLCDControlBuffer.dispcnt.win1_on   = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    gLCDControlBuffer.win0_left   = 96;
    gLCDControlBuffer.win0_top    = 0;
    gLCDControlBuffer.win0_right  = 98;
    gLCDControlBuffer.win0_bottom = 160;

    gLCDControlBuffer.wincnt.win0_enableBg0 = FALSE;
    gLCDControlBuffer.wincnt.win0_enableBg1 = FALSE;
    gLCDControlBuffer.wincnt.win0_enableBg2 = FALSE;
    gLCDControlBuffer.wincnt.win0_enableBg3 = TRUE;
    gLCDControlBuffer.wincnt.win0_enableObj = TRUE;

    gLCDControlBuffer.wincnt.wout_enableBg0 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg1 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg2 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg3 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableObj = TRUE;

    gLCDControlBuffer.wincnt.win0_enableBlend = TRUE;
    gLCDControlBuffer.wincnt.win1_enableBlend = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBlend = TRUE;

    // Load and display Halo

    CopyDataWithPossibleUncomp(
        gUnknown_08A064E0, (void*)(VRAM + 0x220 * 0x20));

    ApplyPalette(gUnknown_08A0731C, STATSCREEN_BGPAL_HALO);

    CopyDataWithPossibleUncomp(
        gUnknown_08A071FC, gUnknown_02020188);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(12, 0),
        gUnknown_02020188, TILEREF(0x220, STATSCREEN_BGPAL_HALO));

    // Load and display Background

    CopyDataWithPossibleUncomp(
        gUnknown_08A03368, (void*)(VRAM + 0x580 * 0x20));

    ApplyPalettes(gUnknown_08A06460, STATSCREEN_BGPAL_BACKGROUND, 4);

    CopyDataWithPossibleUncomp(gUnknown_08A05F10, gUnknown_02020188);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_02020188,
        TILEREF(0x180, 12));

    // Load object graphics

    CopyDataWithPossibleUncomp(
        gUnknown_08A02274, (void*)(VRAM + 0x10000 + 0x240 * 0x20));

    LoadIconPalettes(STATSCREEN_BGPAL_ITEMICONS);

    UnpackUiBarPalette(STATSCREEN_BGPAL_6);

    LoadIconPalette(1, 0x13);

    CopyDataWithPossibleUncomp(
        gUnknown_08A01F24, (void*)(VRAM + 0x440 * 0x20));

    ApplyPalette(gUnknown_08A021E4, STATSCREEN_BGPAL_7);

    LoadIconPalette(1, 0x14);

    CopyDataWithPossibleUncomp(
        gUnknown_08A020F0, (void*)(VRAM + 0x60 * 0x20));

    gStatScreen.mu = NULL;

    sub_8087E28(proc);
}

void sub_8088670(struct Proc* proc)
{
    // Get portrait id

    int fid = GetUnitPortraitId(gStatScreen.unit);

    if (gStatScreen.unit->state & US_BIT23)
        fid++;

    // Set page amount (in FE6, this was dependant on whether this is ally or enemy)
    gStatScreen.pageAmt = STATSCREEN_PAGE_MAX;

    // Init text and icons

    Font_InitForUIDefault();
    ResetIconGraphics_();

    sub_8086DF0();

    // Display portrait

    sub_8005E98(proc, gBG2TilemapBuffer + TILEMAP_INDEX(1, 1), fid,
        0x4E0, STATSCREEN_BGPAL_FACE);

    if (GetPortraitStructPointer(fid)->img)
        ApplyPalette(gUnknown_08A01EE4, STATSCREEN_BGPAL_2);
    else
        ApplyPalette(gUnknown_08A01F04, STATSCREEN_BGPAL_2);

    // Display Map Sprite

    MU_EndAll();
    gStatScreen.mu = MU_CreateForUI(gStatScreen.unit, 80, 138);

    // Draw left panel labels and info

    sub_8086E44();

    // Draw page content

    sub_80878CC(gStatScreen.page);

    TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);
    TileMap_CopyRect(gBmFrameTmap1, gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void sub_808873C(struct Proc* proc)
{
    struct Unit* unit;

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        gLCDControlBuffer.dispcnt.bg0_on = TRUE;
        gLCDControlBuffer.dispcnt.bg1_on = FALSE;
        gLCDControlBuffer.dispcnt.bg2_on = TRUE;
        gLCDControlBuffer.dispcnt.bg3_on = TRUE;
        gLCDControlBuffer.dispcnt.obj_on = TRUE;

        SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

        sub_8001ED0(0, 0, 0, 0, 0);
        sub_8001F48(1);

        // TODO: ResetBackdropColor macro?
        gPaletteBuffer[0] = 0;
        EnablePaletteSync();

        Proc_ClearNativeCallback(proc);

        PlaySoundEffect(0x6B); // TODO: song ids
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
    {
        gStatScreen.page = (gStatScreen.page + gStatScreen.pageAmt - 1) % gStatScreen.pageAmt;
        sub_8087AD8(0x20, gStatScreen.page, proc);
        return;
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
    {
        gStatScreen.page = (gStatScreen.page + gStatScreen.pageAmt + 1) % gStatScreen.pageAmt;
        sub_8087AD8(0x10, gStatScreen.page, proc);
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        unit = sub_8087920(gStatScreen.unit, -1);
        sub_8087E7C(unit, -1, proc);
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        unit = sub_8087920(gStatScreen.unit, +1);
        sub_8087E7C(unit, +1, proc);
    }

    else if ((gKeyStatusPtr->repeatedKeys & A_BUTTON) && (gStatScreen.unit->rescueOtherUnit))
    {
        unit = GetUnit(gStatScreen.unit->rescueOtherUnit);
        sub_8087E7C(unit, (gStatScreen.unit->state & US_RESCUING) ? +1 : -1, proc);
    }

    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        Proc_GotoLabel(proc, 0); // TODO: label name
        MakeStatScreenRText6C(gStatScreen.page, proc);
    }
}

void sub_80888B4(void)
{
    gUnknown_0202BCF0.chapterStateBits = (gUnknown_0202BCF0.chapterStateBits &~ 3) | (gStatScreen.page & 3);
    sStatScreenInfo.unitId = gStatScreen.unit->index;

    SetInterrupt_LCDVCountMatch(NULL);

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;
}

void sub_808890C(void)
{
    gStatScreen.help = sub_80895A8();
}

void sub_8088920(void)
{
    int yBg = 0xFF & -gStatScreen.yDispOff;

    BG_SetPosition(0, 0, yBg);
    BG_SetPosition(2, 0, yBg);
}

void sub_808894C(struct Unit* unit, struct Proc* parent)
{
    gStatScreen.unk04 = 0;
    gStatScreen.yDispOff = 0;
    gStatScreen.page = gUnknown_0202BCF0.chapterStateBits & 3;
    gStatScreen.unit = unit;
    gStatScreen.help = NULL;
    gStatScreen.unk02 = 0;
    gStatScreen.inTransition = FALSE;

    BWL_IncrementStatScreenViews(unit->pCharacterData->number);

    PlaySoundEffect(0x6A); // TODO: song ids

    Proc_CreateBlockingChild(gProcScr_StatScreen, parent);
}

void MakeStatScreenRText6C(int pageid, struct Proc* proc)
{
    LoadDialogueBoxGfx(NULL, -1); // default

    if (!gStatScreen.help)
    {
        switch (pageid)
        {

        case STATSCREEN_PAGE_0:
            gStatScreen.help = &gUnknown_08A00BC4;
            break;
        
        case STATSCREEN_PAGE_1:
            gStatScreen.help = &gUnknown_08A00DA0;
            break;

        case STATSCREEN_PAGE_2:
            gStatScreen.help = &gUnknown_08A00F44;
            break;

        } // switch (pageid)
    }

    Create6CRText(gStatScreen.help, proc);
}

void sub_8088A00(struct HelpBoxProc* proc)
{
    int item = gStatScreen.unit->items[proc->info->msgId];

    proc->item_maybe  = item;
    proc->msgId_maybe = GetItemDescId(item);
}

void sub_8088A2C(struct HelpBoxProc* proc)
{
    switch (gStatScreen.unit->statusIndex)
    {

    case UNIT_STATUS_NONE:
        proc->msgId_maybe = 0x552; // TODO: mid constants
        break;

    case UNIT_STATUS_POISON:
        proc->msgId_maybe = 0x553; // TODO: mid constants
        break;

    case UNIT_STATUS_SLEEP:
        proc->msgId_maybe = 0x554; // TODO: mid constants
        break;

    case UNIT_STATUS_SILENCED:
        proc->msgId_maybe = 0x556; // TODO: mid constants
        break;

    case UNIT_STATUS_BERSERK:
        proc->msgId_maybe = 0x555; // TODO: mid constants
        break;

    case UNIT_STATUS_ATTACK:
        proc->msgId_maybe = 0x558; // TODO: mid constants
        break;

    case UNIT_STATUS_DEFENSE:
        proc->msgId_maybe = 0x559; // TODO: mid constants
        break;

    case UNIT_STATUS_CRIT:
        proc->msgId_maybe = 0x55A; // TODO: mid constants
        break;

    case UNIT_STATUS_AVOID:
        proc->msgId_maybe = 0x55B; // TODO: mid constants
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        proc->msgId_maybe = 0x557; // TODO: mid constants
        break;

    } // switch (gStatScreen.unit->statusIndex)
}

void sub_8088B08(struct HelpBoxProc* proc)
{
    if (UnitHasMagicRank(gStatScreen.unit))
        proc->msgId_maybe = 0x547; // TODO: mid constants
    else
        proc->msgId_maybe = 0x546; // TODO: mid constants
}

void sub_8088B40(struct HelpBoxProc* proc)
{
    if (!gStatScreen.unit->items[0])
        sub_80893B4(proc);

    if (!gStatScreen.unit->items[proc->info->msgId])
    {
        if (proc->unk50 == 0 || proc->unk50 == 0x10 || proc->unk50 == 0x40)
            sub_8089354(proc);
        else if (proc->unk50 == 0x80)
            sub_8089384(proc);
    }
}

void sub_8088B94(struct HelpBoxProc* proc)
{
    u16 rankMsgLut[8] =
    {
        0x561, 0x562, 0x563, 0x564, 0x565, 0x566, 0x567, 0x568
    };

    int itemKind = proc->info->msgId;

    if (UnitHasMagicRank(gStatScreen.unit))
        itemKind += 4;

    proc->msgId_maybe = rankMsgLut[itemKind];
}

void sub_8088BD4(struct HelpBoxProc* proc)
{
    int midDesc = gStatScreen.unit->pCharacterData->descTextId;

    if (midDesc)
        proc->msgId_maybe = midDesc;
    else
        proc->msgId_maybe = 0x6BE; // TODO: mid constants
}

void sub_8088C00(struct HelpBoxProc* proc)
{
    proc->msgId_maybe = gStatScreen.unit->pClassData->descTextId;
}

void sub_8088C14(struct HelpBoxProc* proc)
{
    if (GetUnitTotalSupportLevel(gStatScreen.unit) == 0)
    {
        if (proc->unk50 == 0x80)
            sub_8089384(proc);
        else
            sub_8089354(proc);
    }
}

void sub_8088C48(struct HelpBoxProc* proc, int arg1)
{
    proc->unk30 = sub_8012DCC(arg1, proc->unk38, proc->unk3C, proc->unk48, proc->unk4A);
    proc->unk32 = sub_8012DCC(arg1, proc->unk3A, proc->unk3E, proc->unk48, proc->unk4A);
    proc->unk34 = sub_8012DCC(arg1, proc->unk40, proc->unk44, proc->unk48, proc->unk4A);
    proc->unk36 = sub_8012DCC(arg1, proc->unk42, proc->unk46, proc->unk48, proc->unk4A);

    sub_8089980(proc->unk30, proc->unk32, proc->unk34, proc->unk36, proc->unk52);
}

void sub_8088CFC(struct HelpBoxProc* proc)
{
    struct Proc* found = Proc_Find(gProcScr_MetaHelpSprCtrl);

    if (found)
        found->blockSemaphore = 1; // lock (disabled) proc

    if (proc->unk52 == 0)
        PlaySoundEffect(0x70); // TODO: song ids
}

void sub_8088D3C(struct HelpBoxProc* proc)
{
    sub_8088C48(proc, 5);

    if (proc->unk48 < proc->unk4A)
        proc->unk48++;
}

void sub_8088D64(struct HelpBoxProc* proc)
{
    struct Proc* found = Proc_Find(gProcScr_MetaHelpSprCtrl);

    if (found)
        found->blockSemaphore = 0; // unlock (enable) proc

    if (proc->unk52 == 0)
    {
        PlaySoundEffect(0x71); // TODO: song ids

        sub_80892C0(proc);
        sub_808929C(proc, proc->info->xDisplay, proc->info->yDisplay);
    }
}

void sub_8088DB8(struct HelpBoxProc* proc)
{
    sub_8088C48(proc, 0);

    proc->unk48 -= 3;

    if (proc->unk48 < 0)
        Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8088DE0(int x, int y, int msgid)
{
    sMutableHbi.adj1 = NULL;
    sMutableHbi.adj2 = NULL;
    sMutableHbi.adj3 = NULL;
    sMutableHbi.adj4 = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.msgId    = msgid;

    sMutableHbi.onInitMoveable = NULL;
    sMutableHbi.onInit = NULL;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    sub_8088E9C(&sMutableHbi, FALSE);
}

void sub_8088E14(int x, int y, int msgid)
{
    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    sMutableHbi.adj1 = NULL;
    sMutableHbi.adj2 = NULL;
    sMutableHbi.adj3 = NULL;
    sMutableHbi.adj4 = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.msgId    = msgid;

    sMutableHbi.onInitMoveable = NULL;
    sMutableHbi.onInit = NULL;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    sub_8088E9C(&sMutableHbi, TRUE);
}

void sub_8088E60(int x, int y, int item)
{
    sMutableHbi.adj1 = NULL;
    sMutableHbi.adj2 = NULL;
    sMutableHbi.adj3 = NULL;
    sMutableHbi.adj4 = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.msgId    = item;

    sMutableHbi.onInitMoveable = NULL;
    sMutableHbi.onInit = sub_8089320;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    sub_8088E9C(&sMutableHbi, FALSE);
}

void sub_8088E9C(const struct HelpBoxInfo* info, int unk)
{
    struct HelpBoxProc* proc;
    int wBox, hBox;

    proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (!proc)
    {
        proc = (void*) Proc_Create(gProcScr_HelpBox, ROOT_PROC_3);

        proc->unk52 = unk;

        sub_808929C(proc, info->xDisplay, info->yDisplay);
        sub_80892C0(proc);
    }
    else
    {
        proc->unk38 = proc->unk30;
        proc->unk3A = proc->unk32;
        proc->unk40 = proc->unk34;
        proc->unk42 = proc->unk36;
    }

    proc->info = info;

    proc->unk48 = 0;
    proc->unk4A = 12;

    proc->item_maybe = 0;
    proc->msgId_maybe = info->msgId;

    if (proc->info->onInit)
        proc->info->onInit(proc);

    SetFontGlyphSet(1);
    sub_8003FAC(GetStringFromIndex(proc->msgId_maybe), &wBox, &hBox);
    SetFontGlyphSet(0);

    sub_80891AC(proc, wBox, hBox);
    sub_8089210(proc, info->xDisplay, info->yDisplay);

    sub_808A118();
    sub_808A0FC(proc->item_maybe, proc->msgId_maybe);

    sLastHbi = info;
}

void sub_8088F68(int x, int y, int msgid)
{
    struct HelpBoxProc* proc;
    int wBox, hBox;

    proc = (void*) Proc_Create(gProcScr_HelpBox, ROOT_PROC_3);

    proc->unk52 = TRUE;

    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    proc->unk48 = 0;
    proc->unk4A = 12;

    proc->item_maybe = 0;
    proc->msgId_maybe = msgid;

    SetFontGlyphSet(1);
    sub_8003FAC(GetStringFromIndex(proc->msgId_maybe), &wBox, &hBox);
    SetFontGlyphSet(0);

    sub_80892C0(proc);
    sub_80891AC(proc, wBox, hBox);

    proc->unk38 = x + 8;
    proc->unk3A = y + 8;

    proc->unk3C = x + 8;
    proc->unk3E = y + 8;

    sub_808A118();
    sub_808A0FC(proc->item_maybe, proc->msgId_maybe);
}

void sub_8089018(void)
{
    struct HelpBoxProc* proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (proc)
    {
        sub_808A118();
        Proc_GotoLabel((struct Proc*) proc, 0x63);
    }
}

void sub_808903C(void)
{
    struct HelpBoxProc* proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (proc)
    {
        sub_808A118();
        Proc_Delete((struct Proc*) proc);
    }
}

void sub_8089060(struct HelpBoxProc* proc)
{
    proc->unk50 = 0;

    if (proc->info->onInitMoveable)
        proc->info->onInitMoveable(proc);

    sub_8088E9C(proc->info, FALSE);
}

void sub_8089088(struct HelpBoxProc* proc)
{
    u8 boxMoved = FALSE;

    DisplayUiHand(
        sHbOrigin.x*8 + proc->info->xDisplay,
        sHbOrigin.y*8 + proc->info->yDisplay);

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
        boxMoved |= sub_8089354(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
        boxMoved |= sub_8089384(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
        boxMoved |= sub_80893B4(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
        boxMoved |= sub_80893E4(proc);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_ClearNativeCallback((void*) proc);
        return;
    }

    if (boxMoved)
    {
        PlaySoundEffect(0x67);
        Proc_GotoLabel((void*) proc, 0); // TODO: label constants?
    }
}

void sub_8089150(struct HelpBoxProc* proc)
{
    sub_8089018();
    Proc_Delete((void*) proc);
}

void Create6CRText(const struct HelpBoxInfo* info, struct Proc* parent)
{
    struct HelpBoxProc* proc = (void*) Proc_CreateBlockingChild(gProcScr_HelpBoxMoveCtrl, parent);

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    proc->info = info;
}

void sub_8089188(const struct HelpBoxInfo* info, struct Proc* parent, int x, int y)
{
    struct HelpBoxProc* proc = (void*) Proc_CreateBlockingChild(gProcScr_HelpBoxMoveCtrl, parent);

    sHbOrigin.x = x;
    sHbOrigin.y = y;

    proc->info = info;
}

void sub_80891AC(struct HelpBoxProc* proc, int width, int height)
{
    width = 0xF0 & (width + 15); // align to 16 pixel multiple

    switch (sub_80892D0(proc->item_maybe))
    {

    case 1: // weapon
        if (width < 0x90)
            width = 0x90;

        if (GetStringTextWidth(GetStringFromIndex(proc->msgId_maybe)) > 8)
            height += 0x20;
        else
            height += 0x10;

        break;
    
    case 2: // staff
        if (width < 0x60)
            width = 0x60;

        height += 0x10;

        break;

    case 3: // save stuff
        width = 0x80;
        height += 0x10;

        break;

    } // switch (sub_80892D0(proc->item_maybe))

    proc->unk44 = width;
    proc->unk46 = height;
}

void sub_8089210(struct HelpBoxProc* proc, int x, int y)
{
    int xSpan = proc->unk44 + 0x10;
    int ySpan = proc->unk46 + 0x10;

    x += sHbOrigin.x*8;
    y += sHbOrigin.y*8;

    proc->unk3C = x - 0x10 - xSpan/6;

    if (proc->unk3C < 0)
        proc->unk3C = 0;

    if (proc->unk3C + xSpan > DISPLAY_WIDTH)
        proc->unk3C = DISPLAY_WIDTH - xSpan;

    proc->unk3E = y + 0x10;

    if (proc->unk3E + ySpan > DISPLAY_HEIGHT)
        proc->unk3E = y - ySpan;

    proc->unk3C += 8;
    proc->unk3E += 8;
}

void sub_808929C(struct HelpBoxProc* proc, int x, int y)
{
    x += sHbOrigin.x*8;
    y += sHbOrigin.y*8;

    proc->unk38 = x;
    proc->unk3A = y;
}

void sub_80892C0(struct HelpBoxProc* proc)
{
    proc->unk40 = 32;
    proc->unk42 = 16;
}

int sub_80892D0(int item)
{
    if (item == 0xFFFE)
        return 3;

    if (GetItemAttributes(item) & IA_LOCK_3)
        return 0;

    if (GetItemAttributes(item) & IA_WEAPON)
        return 1;

    if (GetItemAttributes(item) & IA_STAFF)
        return 2;

    return 0;
}

void sub_8089320(struct HelpBoxProc* proc)
{
    int item = proc->info->msgId;

    proc->item_maybe = item;

    if (sub_80892D0(proc->item_maybe) == 3)
        proc->msgId_maybe = 0;
    else
        proc->msgId_maybe = GetItemDescId(item);
}

int sub_8089354(struct HelpBoxProc* proc)
{
    if (!proc->info->adj1)
        return FALSE;

    proc->info = proc->info->adj1;
    proc->unk50 = 0x40;

    if (proc->info->onInitMoveable)
        proc->info->onInitMoveable(proc);

    return TRUE;
}

int sub_8089384(struct HelpBoxProc* proc)
{
    if (!proc->info->adj2)
        return FALSE;

    proc->info = proc->info->adj2;
    proc->unk50 = 0x80;

    if (proc->info->onInitMoveable)
        proc->info->onInitMoveable(proc);

    return TRUE;
}

int sub_80893B4(struct HelpBoxProc* proc)
{
    if (!proc->info->adj3)
        return FALSE;

    proc->info = proc->info->adj3;
    proc->unk50 = 0x20;

    if (proc->info->onInitMoveable)
        proc->info->onInitMoveable(proc);

    return TRUE;
}

int sub_80893E4(struct HelpBoxProc* proc)
{
    // whoa bad hardcoded thing!
    if (!proc->info->adj4 || (proc->info == &gUnknown_08A00D14 && !gStatScreen.unit->items[0]))
        return FALSE;

    proc->info = proc->info->adj4;
    proc->unk50 = 0x10;

    if (proc->info->onInitMoveable)
        proc->info->onInitMoveable(proc);

    return TRUE;
}

void sub_8089430(struct Proc* proc)
{
    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        Proc_ClearNativeCallback(proc);
}

int sub_8089454(int msgid, struct Proc* parent)
{
    LoadDialogueBoxGfx(NULL, -1);

    sub_8088DE0(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), msgid);
    Proc_CreateBlockingChild(gProcScr_HelpBoxLock, parent);

    return TRUE;
}

void Loop6C_8A00B20_UpdateOAMData(struct HelpPromptObjectProc* proc)
{
    RegisterObjectAttributes_SafeMaybe(0,
        proc->xDisplay, proc->yDisplay,
        sSprite_MetaHelp, proc->tileref);
}

struct Proc* sub_80894AC(int x, int y, struct Proc* parent)
{
    struct HelpPromptObjectProc* proc = (void*) Proc_Find(gProcScr_MetaHelpSprCtrl);

    if (!proc)
        proc = (void*) Proc_Create(gProcScr_MetaHelpSprCtrl, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0);

    return (void*) proc;
}

struct Proc* sub_80894E0(int x, int y, int palid, struct Proc* parent)
{
    struct HelpPromptObjectProc* proc = (void*) Proc_Find(gProcScr_MetaHelpSprCtrl);

    ApplyPalette(gUnknown_08A1D79C, palid + 0x10);

    if (!proc)
        proc = (void*) Proc_Create(gProcScr_MetaHelpSprCtrl, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0xF & palid);

    return (void*) proc;
}

struct Proc* sub_808953C(int x, int y, struct Proc* parent)
{
    struct HelpPromptObjectProc* proc = (void*) Proc_Find(gProcScr_MetaHelpSprCtrl);

    if (!proc)
        proc = (void*) Proc_CreateBlockingChild(gProcScr_MetaHelpSprCtrl, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0);

    return (void*) proc;
}

void sub_8089570(void)
{
    struct Proc* proc = Proc_Find(gProcScr_MetaHelpSprCtrl);

    if (proc)
        Proc_Delete(proc);
}

void sub_8089588(int x, int y)
{
    struct HelpPromptObjectProc* proc = (void*) Proc_Find(gProcScr_MetaHelpSprCtrl);

    if (proc)
    {
        proc->xDisplay = x;
        proc->yDisplay = y;
    }
}

const struct HelpBoxInfo* sub_80895A8(void)
{
    return sLastHbi;
}

// =================
// = HELP BOX INFO =
// =================

#define DECL_INFO struct HelpBoxInfo CONST_DATA

// TODO (maybe, eventually): maybe generate this from file(s)?

// Stat Screen Page 0 (Core stats & status)

static DECL_INFO sHelpInfo_08A00B38;
static DECL_INFO sHelpInfo_08A00B54;
static DECL_INFO sHelpInfo_08A00B70;
static DECL_INFO sHelpInfo_08A00B8C;
static DECL_INFO sHelpInfo_08A00BA8;
extern DECL_INFO gUnknown_08A00BC4;
static DECL_INFO sHelpInfo_08A00BE0;
static DECL_INFO sHelpInfo_08A00BFC;
static DECL_INFO sHelpInfo_08A00C18;
static DECL_INFO sHelpInfo_08A00C34;
static DECL_INFO sHelpInfo_08A00C50;
static DECL_INFO sHelpInfo_08A00C6C;
static DECL_INFO sHelpInfo_08A00C88;
static DECL_INFO sHelpInfo_08A00CA4;
static DECL_INFO sHelpInfo_08A00CC0;
static DECL_INFO sHelpInfo_08A00CDC;
static DECL_INFO sHelpInfo_08A00CF8;

static DECL_INFO sHelpInfo_08A00B38 =
{
    NULL, &sHelpInfo_08A00B54, NULL, &sHelpInfo_08A00C18,
    24, 80, 0, NULL, sub_8088BD4,
};

static DECL_INFO sHelpInfo_08A00B54 =
{
    &sHelpInfo_08A00B38, &sHelpInfo_08A00B70, NULL, &sHelpInfo_08A00C50,
    6, 104, 0x6E8, NULL, sub_8088C00,
};

static DECL_INFO sHelpInfo_08A00B70 =
{
    &sHelpInfo_08A00B54, &sHelpInfo_08A00BA8, NULL, &sHelpInfo_08A00B8C,
    6, 120, 0x542,
};

static DECL_INFO sHelpInfo_08A00B8C =
{
    &sHelpInfo_08A00B54, &sHelpInfo_08A00BA8, &sHelpInfo_08A00B70, &sHelpInfo_08A00C50,
    38, 120, 0x543,
};

static DECL_INFO sHelpInfo_08A00BA8 =
{
    &sHelpInfo_08A00B70, NULL, NULL, &sHelpInfo_08A00C50,
    6, 136, 0x544,
};

DECL_INFO gUnknown_08A00BC4 =
{
    NULL, &sHelpInfo_08A00BE0, &sHelpInfo_08A00B38, &sHelpInfo_08A00C6C,
    102, 24, 0x546, NULL, sub_8088B08,
};

static DECL_INFO sHelpInfo_08A00BE0 =
{
    &gUnknown_08A00BC4, &sHelpInfo_08A00BFC, &sHelpInfo_08A00B38, &sHelpInfo_08A00C88,
    105, 40, 0x548,
};

static DECL_INFO sHelpInfo_08A00BFC =
{
    &sHelpInfo_08A00BE0, &sHelpInfo_08A00C18, &sHelpInfo_08A00B38, &sHelpInfo_08A00CA4,
    102, 56, 0x549,
};

static DECL_INFO sHelpInfo_08A00C18 =
{
    &sHelpInfo_08A00BFC, &sHelpInfo_08A00C34, &sHelpInfo_08A00B38, &sHelpInfo_08A00CC0,
    102, 72, 0x54A,
};

static DECL_INFO sHelpInfo_08A00C34 =
{
    &sHelpInfo_08A00C18, &sHelpInfo_08A00C50, &sHelpInfo_08A00B38, &sHelpInfo_08A00CDC,
    102, 88, 0x54B,
};

static DECL_INFO sHelpInfo_08A00C50 =
{
    &sHelpInfo_08A00C34, NULL, &sHelpInfo_08A00B54, &sHelpInfo_08A00CF8,
    102, 104, 0x54C,
};

static DECL_INFO sHelpInfo_08A00C6C =
{
    NULL, &sHelpInfo_08A00C88, &gUnknown_08A00BC4, NULL,
    166, 24, 0x54D,
};

static DECL_INFO sHelpInfo_08A00C88 =
{
    &sHelpInfo_08A00C6C, &sHelpInfo_08A00CA4, &sHelpInfo_08A00BE0, NULL,
    166, 40, 0x54E,
};

static DECL_INFO sHelpInfo_08A00CA4 =
{
    &sHelpInfo_08A00C88, &sHelpInfo_08A00CC0, &sHelpInfo_08A00BFC, NULL,
    166, 56, 0x54F,
};

static DECL_INFO sHelpInfo_08A00CC0 =
{
    &sHelpInfo_08A00CA4, &sHelpInfo_08A00CDC, &sHelpInfo_08A00C18, NULL,
    166, 72, 0x550,
};

static DECL_INFO sHelpInfo_08A00CDC =
{
    &sHelpInfo_08A00CC0, &sHelpInfo_08A00CF8, &sHelpInfo_08A00C34, NULL,
    166, 88, 0x551,
};

static DECL_INFO sHelpInfo_08A00CF8 =
{
    &sHelpInfo_08A00CDC, NULL, &sHelpInfo_08A00C50, NULL,
    166, 104, 0, NULL, sub_8088A2C,
};

// Stat Screen Page 1 (Items & battle stats)

extern DECL_INFO gUnknown_08A00D14;
static DECL_INFO sHelpInfo_08A00D30;
static DECL_INFO sHelpInfo_08A00D4C;
static DECL_INFO sHelpInfo_08A00D68;
static DECL_INFO sHelpInfo_08A00D84;
extern DECL_INFO gUnknown_08A00DA0;
static DECL_INFO sHelpInfo_08A00DBC;
static DECL_INFO sHelpInfo_08A00DD8;
static DECL_INFO sHelpInfo_08A00DF4;
static DECL_INFO sHelpInfo_08A00E10;
static DECL_INFO sHelpInfo_08A00E2C;
static DECL_INFO sHelpInfo_08A00E48;
static DECL_INFO sHelpInfo_08A00E64;
static DECL_INFO sHelpInfo_08A00E80;
static DECL_INFO sHelpInfo_08A00E9C;

DECL_INFO gUnknown_08A00D14 =
{
    NULL, &sHelpInfo_08A00D30, NULL, &sHelpInfo_08A00DF4,
    24, 80, 0, NULL, sub_8088BD4,
};

static DECL_INFO sHelpInfo_08A00D30 =
{
    &gUnknown_08A00D14, &sHelpInfo_08A00D4C, NULL, &sHelpInfo_08A00E2C,
    6, 104, 0x6E8, NULL, sub_8088C00,
};

static DECL_INFO sHelpInfo_08A00D4C =
{
    &sHelpInfo_08A00D30, &sHelpInfo_08A00D84, NULL, &sHelpInfo_08A00D68,
    6, 120, 0x542,
};

static DECL_INFO sHelpInfo_08A00D68 =
{
    &sHelpInfo_08A00D30, &sHelpInfo_08A00D84, &sHelpInfo_08A00D4C, &sHelpInfo_08A00E2C,
    38, 120, 0x543,
};

static DECL_INFO sHelpInfo_08A00D84 =
{
    &sHelpInfo_08A00D4C, NULL, NULL, &sHelpInfo_08A00E48,
    6, 136, 0x544,
};

DECL_INFO gUnknown_08A00DA0 =
{
    NULL, &sHelpInfo_08A00DBC, &gUnknown_08A00D14, NULL,
    104, 24, 0, sub_8088B40, sub_8088A00,
};

static DECL_INFO sHelpInfo_08A00DBC =
{
    &gUnknown_08A00DA0, &sHelpInfo_08A00DD8, &gUnknown_08A00D14, NULL,
    104, 40, 1, sub_8088B40, sub_8088A00,
};

static DECL_INFO sHelpInfo_08A00DD8 =
{
    &sHelpInfo_08A00DBC, &sHelpInfo_08A00DF4, &gUnknown_08A00D14, NULL,
    104, 56, 2, sub_8088B40, sub_8088A00,
};

static DECL_INFO sHelpInfo_08A00DF4 =
{
    &sHelpInfo_08A00DD8, &sHelpInfo_08A00E10, &gUnknown_08A00D14, NULL,
    104, 72, 3, sub_8088B40, sub_8088A00,
};

static DECL_INFO sHelpInfo_08A00E10 =
{
    &sHelpInfo_08A00DF4, &sHelpInfo_08A00E2C, &gUnknown_08A00D14, &sHelpInfo_08A00E64,
    104, 88, 4, sub_8088B40, sub_8088A00,
};

static DECL_INFO sHelpInfo_08A00E2C =
{
    &sHelpInfo_08A00E10, &sHelpInfo_08A00E48, &sHelpInfo_08A00D68, &sHelpInfo_08A00E80,
    118, 120, 0x55C,
};

static DECL_INFO sHelpInfo_08A00E48 =
{
    &sHelpInfo_08A00E2C, NULL, &sHelpInfo_08A00D84, &sHelpInfo_08A00E9C,
    118, 136, 0x55D,
};

static DECL_INFO sHelpInfo_08A00E64 =
{
    &sHelpInfo_08A00E10, &sHelpInfo_08A00E80, &sHelpInfo_08A00E2C, NULL,
    174, 104, 0x55E,
};

static DECL_INFO sHelpInfo_08A00E80 =
{
    &sHelpInfo_08A00E64, &sHelpInfo_08A00E9C, &sHelpInfo_08A00E2C, NULL,
    174, 120, 0x55F,
};

static DECL_INFO sHelpInfo_08A00E9C =
{
    &sHelpInfo_08A00E80, NULL, &sHelpInfo_08A00E48, NULL,
    174, 136, 0x560,
};

// Stat Screen Page 2 (Weapon ranks & supports)

static DECL_INFO sHelpInfo_08A00EB8;
static DECL_INFO sHelpInfo_08A00ED4;
static DECL_INFO sHelpInfo_08A00EF0;
static DECL_INFO sHelpInfo_08A00F0C;
static DECL_INFO sHelpInfo_08A00F28;
extern DECL_INFO gUnknown_08A00F44;
static DECL_INFO sHelpInfo_08A00F60;
static DECL_INFO sHelpInfo_08A00F7C;
static DECL_INFO sHelpInfo_08A00F98;
static DECL_INFO sHelpInfo_08A00FB4;

static DECL_INFO sHelpInfo_08A00EB8 =
{
    NULL, &sHelpInfo_08A00ED4, NULL, &sHelpInfo_08A00FB4,
    24, 80, 0, NULL, sub_8088BD4,
};

static DECL_INFO sHelpInfo_08A00ED4 =
{
    &sHelpInfo_08A00EB8, &sHelpInfo_08A00EF0, NULL, &sHelpInfo_08A00FB4,
    6, 104, 0x6E8, NULL, sub_8088C00,
};

static DECL_INFO sHelpInfo_08A00EF0 =
{
    &sHelpInfo_08A00ED4, &sHelpInfo_08A00F28, NULL, &sHelpInfo_08A00F0C,
    6, 120, 0x542,
};

static DECL_INFO sHelpInfo_08A00F0C =
{
    &sHelpInfo_08A00ED4, &sHelpInfo_08A00F28, &sHelpInfo_08A00EF0, &sHelpInfo_08A00FB4,
    38, 120, 0x543,
};

static DECL_INFO sHelpInfo_08A00F28 =
{
    &sHelpInfo_08A00EF0, NULL, NULL, &sHelpInfo_08A00FB4,
    6, 136, 0x544,
};

DECL_INFO gUnknown_08A00F44 =
{
    NULL, &sHelpInfo_08A00F60, &sHelpInfo_08A00EB8, &sHelpInfo_08A00F7C,
    104, 24, 0, NULL, sub_8088B94,
};

static DECL_INFO sHelpInfo_08A00F60 =
{
    &gUnknown_08A00F44, &sHelpInfo_08A00FB4, &sHelpInfo_08A00EB8, &sHelpInfo_08A00F98,
    104, 40, 1, NULL, sub_8088B94,
};

static DECL_INFO sHelpInfo_08A00F7C =
{
    NULL, &sHelpInfo_08A00F98, &gUnknown_08A00F44, NULL,
    168, 24, 2, NULL, sub_8088B94,
};

static DECL_INFO sHelpInfo_08A00F98 =
{
    &sHelpInfo_08A00F7C, &sHelpInfo_08A00FB4, &sHelpInfo_08A00F60, NULL,
    168, 40, 3, NULL, sub_8088B94,
};

static DECL_INFO sHelpInfo_08A00FB4 =
{
    &sHelpInfo_08A00F60, &sHelpInfo_08A00EB8, &sHelpInfo_08A00EB8, NULL,
    128, 64, 0x569, sub_8088C14, NULL,
};

// BKSEL (Select Battle Target Window) HELP INFOS

void sub_8037494(struct HelpBoxProc* proc);
void sub_80374C4(struct HelpBoxProc* proc);

// Simple/Modern mode

static DECL_INFO sHelpInfo_08A00FD0;
extern DECL_INFO gUnknown_08A00FEC;
static DECL_INFO sHelpInfo_08A01008;
static DECL_INFO sHelpInfo_08A01024;
static DECL_INFO sHelpInfo_08A01040;
static DECL_INFO sHelpInfo_08A0105C;

static DECL_INFO sHelpInfo_08A00FD0 =
{
    NULL, &gUnknown_08A00FEC, NULL, NULL,
    8, 8, 0, NULL, sub_8037494,
};

DECL_INFO gUnknown_08A00FEC =
{
    &sHelpInfo_08A00FD0, &sHelpInfo_08A01008, NULL, NULL,
    28, 24, 0x544,
};

static DECL_INFO sHelpInfo_08A01008 =
{
    &gUnknown_08A00FEC, &sHelpInfo_08A01024, NULL, NULL,
    28, 40, 0x571,
};

static DECL_INFO sHelpInfo_08A01024 =
{
    &sHelpInfo_08A01008, &sHelpInfo_08A01040, NULL, NULL,
    28, 56, 0x55D,
};

static DECL_INFO sHelpInfo_08A01040 =
{
    &sHelpInfo_08A01024, &sHelpInfo_08A0105C, NULL, NULL,
    28, 72, 0x55F,
};

static DECL_INFO sHelpInfo_08A0105C =
{
    &sHelpInfo_08A01040, NULL, NULL, NULL,
    56, 88, 0, NULL, sub_80374C4,
};

// Detailed/Classic mode

static DECL_INFO sHelpInfo_08A01078;
extern DECL_INFO gUnknown_08A01094;
static DECL_INFO sHelpInfo_08A010B0;
static DECL_INFO sHelpInfo_08A010CC;
static DECL_INFO sHelpInfo_08A010E8;
static DECL_INFO sHelpInfo_08A01104;
static DECL_INFO sHelpInfo_08A01120;
static DECL_INFO sHelpInfo_08A0113C;

static DECL_INFO sHelpInfo_08A01078 =
{
    NULL, &gUnknown_08A01094, NULL, NULL,
    8, 8, 0, NULL, sub_8037494,
};

DECL_INFO gUnknown_08A01094 =
{
    &sHelpInfo_08A01078, &sHelpInfo_08A010B0, NULL, NULL,
    28, 24, 0x544,
};

static DECL_INFO sHelpInfo_08A010B0 =
{
    &gUnknown_08A01094, &sHelpInfo_08A010CC, NULL, NULL,
    28, 40, 0x55C,
};

static DECL_INFO sHelpInfo_08A010CC =
{
    &sHelpInfo_08A010B0, &sHelpInfo_08A010E8, NULL, NULL,
    28, 56, 0x573,
};

static DECL_INFO sHelpInfo_08A010E8 =
{
    &sHelpInfo_08A010CC, &sHelpInfo_08A01104, NULL, NULL,
    28, 72, 0x55D,
};

static DECL_INFO sHelpInfo_08A01104 =
{
    &sHelpInfo_08A010E8, &sHelpInfo_08A01120, NULL, NULL,
    28, 88, 0x55F,
};

static DECL_INFO sHelpInfo_08A01120 =
{
    &sHelpInfo_08A01104, &sHelpInfo_08A0113C, NULL, NULL,
    28, 104, 0x572,
};

static DECL_INFO sHelpInfo_08A0113C =
{
    &sHelpInfo_08A01120, NULL, NULL, NULL,
    56, 120, 0, NULL, sub_80374C4,
};

#undef DECL_INFO

// ==========================
// = SOME TEXT ID CONSTANTS =
// ==========================

// TODO: msg constants
unsigned CONST_DATA gUnknown_08A01158 = 0x4E7; // Lv
unsigned CONST_DATA gUnused_08A0115C  = 0x4E8; // Exp
unsigned CONST_DATA gUnknown_08A01160 = 0x4E9; // HP
unsigned CONST_DATA gUnknown_08A01164 = 0x4FE; // Str
unsigned CONST_DATA gUnknown_08A01168 = 0x4FF; // Mag
unsigned CONST_DATA gUnknown_08A0116C = 0x4EC; // Skill
unsigned CONST_DATA gUnknown_08A01170 = 0x4ED; // Spd
unsigned CONST_DATA gUnknown_08A01174 = 0x4EF; // Def
unsigned CONST_DATA gUnknown_08A01178 = 0x4F0; // Res
unsigned CONST_DATA gUnknown_08A0117C = 0x4EE; // Luck
unsigned CONST_DATA gUnknown_08A01180 = 0x4F7; // Con
unsigned CONST_DATA gUnknown_08A01184 = 0x4F8; // Aid
unsigned CONST_DATA gUnknown_08A01188 = 0x4F6; // Move
unsigned CONST_DATA gUnknown_08A0118C = 0x4F9; // Trv
unsigned CONST_DATA gUnknown_08A01190 = 0x4F1; // Affin
unsigned CONST_DATA gUnknown_08A01194 = 0x500; // Rng
unsigned CONST_DATA gUnknown_08A01198 = 0x4F3; // Atk
unsigned CONST_DATA gUnknown_08A0119C = 0x4F4; // Hit
unsigned CONST_DATA gUnknown_08A011A0 = 0x501; // Crit
unsigned CONST_DATA gUnknown_08A011A4 = 0x4F5; // Avoid
unsigned CONST_DATA gUnknown_08A011A8 = 0x4FA; // Cond
unsigned CONST_DATA gUnused_08A011AC  = 0x503; // Mt
unsigned CONST_DATA gUnused_08A011B0  = 0x502; // Wt
unsigned CONST_DATA gUnused_08A011B4  = 0x522; // MP/2
unsigned CONST_DATA gUnused_08A011B8  = 0x523; //    1
unsigned CONST_DATA gUnused_08A011BC  = 0x524; //  1-2
unsigned CONST_DATA gUnused_08A011C0  = 0x525; //  1-3
unsigned CONST_DATA gUnused_08A011C4  = 0x526; //    2
unsigned CONST_DATA gUnused_08A011C8  = 0x527; //  2-3
unsigned CONST_DATA gUnused_08A011CC  = 0x528; // 3-10
unsigned CONST_DATA gUnused_08A011D0  = 0x529; // 3-15
unsigned CONST_DATA gUnused_08A011D4  = 0x536; // ????
unsigned CONST_DATA gUnused_08A011D8  = 0x514; // Poison
unsigned CONST_DATA gUnused_08A011DC  = 0x515; // Sleep
unsigned CONST_DATA gUnused_08A011E0  = 0x516; // Silence
unsigned CONST_DATA gUnused_08A011E4  = 0x517; // Berserk
unsigned CONST_DATA gUnknown_08A011E8 = 0x505; // Sword
unsigned CONST_DATA gUnknown_08A011EC = 0x506; // Lance
unsigned CONST_DATA gUnknown_08A011F0 = 0x507; // Axe
unsigned CONST_DATA gUnknown_08A011F4 = 0x508; // Bow
unsigned CONST_DATA gUnknown_08A011F8 = 0x509; // Staff
unsigned CONST_DATA gUnknown_08A011FC = 0x50A; // Anima
unsigned CONST_DATA gUnknown_08A01200 = 0x50B; // Light
unsigned CONST_DATA gUnknown_08A01204 = 0x50C; // Dark
