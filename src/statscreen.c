
#include "global.h"

#include <stdlib.h>

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

struct StatScreenEffectProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x38 - 0x29];

    /* 38 */ int direction;
    /* 3C */ int yDispInit;
    /* 40 */ int yDispFinal;

    /* 44 */ u8 pad44[0x4A - 0x44];

    /* 4A */ short newItem; // page or unit depending on slide
    /* 4C */ short timer;
    /* 4E */ short blendDirection;

    /* 50 */ u8 pad50[0x52 - 0x50];

    /* 52 */ u16   key;
};

struct StatScreenPageNameProc
{
    /* 00 */ PROC_HEADER;

    // Page Num Sprite Control proc only
    /* 2A */ short xLeftCursor;
    /* 2C */ short xRightCursor;
    /* 2E */ u16 animTimerLeft;
    /* 30 */ u16 animTimerRight;
    /* 32 */ short animSpeedLeft;
    /* 34 */ short animSpeedRight;

    // Page Name Sprite Control proc only
    /* 36 */ u8 pageNum;
    /* 38 */ short yScale; // 6 == times 1
};

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

struct HelpPromptSprProc
{
    PROC_HEADER;

    /* 2C */ int xDisplay;
    /* 30 */ int yDisplay;
    /* 34 */ int tileref;
};

static void InitTexts(void);
static void DisplayTexts(const struct SSTextDispInfo* unk);
static void DisplayLeftPanel(void);
static void DisplayBwl(void);
static void DrawStatWithBar(int num, int x, int y, int base, int total, int max);
static void DisplayPage0(void);
static void DisplayPage1(void);
static void DisplaySupportList(void);
static void DisplayWeaponExp(int num, int x, int y, int wtype);
static void DisplayPage2(void);
static void DisplayPage(int pageid);
static struct Unit* FindNextUnit(struct Unit* u, int direction);
static void PageSlide_OnLoop(struct StatScreenEffectProc* proc);
static void PageSlide_OnEnd(struct StatScreenEffectProc* proc);
static void StartPageSlide(u16 config, int newPage, struct Proc* parent);
static void GlowBlendCtrl_OnInit(struct StatScreenEffectProc* proc);
static void GlowBlendCtrl_OnLoop(struct StatScreenEffectProc* proc);
static void StartGlowBlendCtrl(void);
static void EndGlowBlendCtrl(struct StatScreenEffectProc* proc);
static void UnitSlide_InitFadeOut(struct StatScreenEffectProc* proc);
static void UnitSlide_FadeOutLoop(struct StatScreenEffectProc* proc);
static void UnitSlide_InitFadeIn(struct StatScreenEffectProc* proc);
static void UnitSlide_FadeInLoop(struct StatScreenEffectProc* proc);
static void UnitSlide_SetNewUnit(struct StatScreenEffectProc* proc);
static void ClearSlide(struct Proc* proc);
static void StartUnitSlide(struct Unit* unit, int direction, struct Proc* parent);
void DisplayPageNameSprite(int pageid);
static void PageNameCtrl_OnInit(struct StatScreenPageNameProc* proc);
void PageNameCtrl_OnIdle(struct StatScreenPageNameProc* proc);
static void PageNameCtrl_AnimOut(struct StatScreenPageNameProc* proc);
static void PageNameCtrl_AnimIn(struct StatScreenPageNameProc* proc);
static void PageNumCtrl_OnInit(struct StatScreenPageNameProc* proc);
static void PageNumCtrl_CheckSlide(struct StatScreenPageNameProc* proc);
static void PageNumCtrl_UpdateArrows(struct StatScreenPageNameProc* proc);
static void PageNumCtrl_UpdatePageNum(struct StatScreenPageNameProc* proc);
static void PageNumCtrl_DisplayMuPlatform(struct StatScreenPageNameProc* proc);
static void PageNumCtrl_DisplayBlinkIcons(struct StatScreenPageNameProc* proc);
static void StatScreen_BlackenScreen(void);
static void StatScreen_InitDisplay(struct Proc* proc);
static void StatScreen_Display(struct Proc* proc);
static void StatScreen_OnIdle(struct Proc* proc);
static void StatScreen_OnClose(void);
static void StatScreen_ResumeFromHelp(void);
static void BgOffCtrl_OnLoop(void);
static void StartStatScreenHelp(int pageid, struct Proc* proc);

static void HelpBox_OnOpen(struct HelpBoxProc* proc);
static void HelpBox_OnLoop(struct HelpBoxProc* proc);
static void HelpBox_OnClose(struct HelpBoxProc* proc);
static void HelpBox_WaitClose(struct HelpBoxProc* proc);
static void HbMoveCtrl_OnInitBox(struct HelpBoxProc* proc);
static void HbMoveCtrl_OnIdle(struct HelpBoxProc* proc);
static void HbMoveCtrl_OnEnd(struct HelpBoxProc* proc);
static void ApplyHelpBoxContentSize(struct HelpBoxProc* proc, int width, int height);
static void ApplyHelpBoxPosition(struct HelpBoxProc* proc, int x, int y);
static void HbPopulate_AutoItem(struct HelpBoxProc* proc);
static void HbLock_OnIdle(struct Proc* proc);
static void HelpPrompt_OnIdle(struct HelpPromptSprProc* proc);

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
    { gStatScreen.text + STATSCREEN_TEXT_SKLLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 3),  TEXT_COLOR_GOLD, 0, &gMid_Skl },
    { gStatScreen.text + STATSCREEN_TEXT_SPDLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 5),  TEXT_COLOR_GOLD, 0, &gMid_Spd },
    { gStatScreen.text + STATSCREEN_TEXT_LCKLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 7),  TEXT_COLOR_GOLD, 0, &gMid_Lck },
    { gStatScreen.text + STATSCREEN_TEXT_DEFLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 9),  TEXT_COLOR_GOLD, 0, &gMid_Def },
    { gStatScreen.text + STATSCREEN_TEXT_RESLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(1, 11), TEXT_COLOR_GOLD, 0, &gMid_Res },
    { gStatScreen.text + STATSCREEN_TEXT_MOVLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(9, 1),  TEXT_COLOR_GOLD, 0, &gMid_Mov },
    { gStatScreen.text + STATSCREEN_TEXT_CONLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(9, 3),  TEXT_COLOR_GOLD, 0, &gMid_Con },
    { gStatScreen.text + STATSCREEN_TEXT_AIDLABEL,   gBmFrameTmap0 + TILEMAP_INDEX(9, 5),  TEXT_COLOR_GOLD, 0, &gMid_Aid },
    { gStatScreen.text + STATSCREEN_TEXT_RESCUENAME, gBmFrameTmap0 + TILEMAP_INDEX(9, 7),  TEXT_COLOR_GOLD, 0, &gMid_Trv },
    { gStatScreen.text + STATSCREEN_TEXT_AFFINLABEL, gBmFrameTmap0 + TILEMAP_INDEX(9, 9),  TEXT_COLOR_GOLD, 0, &gMid_Affin },
    { gStatScreen.text + STATSCREEN_TEXT_STATUS,     gBmFrameTmap0 + TILEMAP_INDEX(9, 11), TEXT_COLOR_GOLD, 0, &gMid_Cnd },

    { }, // end
};

static
struct SSTextDispInfo const sPage1TextInfo[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_BSATKLABEL, gBmFrameTmap0 + TILEMAP_INDEX(2, 13), TEXT_COLOR_GOLD, 6, &gMid_Atk },
    { gStatScreen.text + STATSCREEN_TEXT_BSHITLABEL, gBmFrameTmap0 + TILEMAP_INDEX(2, 15), TEXT_COLOR_GOLD, 6, &gMid_Hit },
    { gStatScreen.text + STATSCREEN_TEXT_BSRANGE,    gBmFrameTmap0 + TILEMAP_INDEX(9, 11), TEXT_COLOR_GOLD, 6, &gMid_Rng },
    { gStatScreen.text + STATSCREEN_TEXT_BSCRTLABEL, gBmFrameTmap0 + TILEMAP_INDEX(9, 13), TEXT_COLOR_GOLD, 6, &gMid_Crt },
    { gStatScreen.text + STATSCREEN_TEXT_BSAVOLABEL, gBmFrameTmap0 + TILEMAP_INDEX(9, 15), TEXT_COLOR_GOLD, 6, &gMid_Avo },

    { }, // end
};

static
struct SSTextDispInfo const sPage2TextInfo_Physical[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0, gBmFrameTmap0 + TILEMAP_INDEX(3,  1), TEXT_COLOR_NORMAL, 0, &gMid_Sword },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1, gBmFrameTmap0 + TILEMAP_INDEX(3,  3), TEXT_COLOR_NORMAL, 0, &gMid_Lance },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2, gBmFrameTmap0 + TILEMAP_INDEX(11, 1), TEXT_COLOR_NORMAL, 0, &gMid_Axe },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3, gBmFrameTmap0 + TILEMAP_INDEX(11, 3), TEXT_COLOR_NORMAL, 0, &gMid_Bow },

    { }, // end
};

static
struct SSTextDispInfo const sPage2TextInfo_Magical[] =
{
    { gStatScreen.text + STATSCREEN_TEXT_WEXP0, gBmFrameTmap0 + TILEMAP_INDEX(3,  1), TEXT_COLOR_NORMAL, 0, &gMid_Anima },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP1, gBmFrameTmap0 + TILEMAP_INDEX(3,  3), TEXT_COLOR_NORMAL, 0, &gMid_Light },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP2, gBmFrameTmap0 + TILEMAP_INDEX(11, 1), TEXT_COLOR_NORMAL, 0, &gMid_Dark },
    { gStatScreen.text + STATSCREEN_TEXT_WEXP3, gBmFrameTmap0 + TILEMAP_INDEX(11, 3), TEXT_COLOR_NORMAL, 0, &gMid_Staff },

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
    PROC_REPEAT(PageSlide_OnLoop),
    PROC_CALL(PageSlide_OnEnd),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSGlowyBlendCtrl[] =
{
    PROC_SLEEP(0),

    PROC_CALL(GlowBlendCtrl_OnInit),
    PROC_REPEAT(GlowBlendCtrl_OnLoop),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSUnitSlide[] =
{
    PROC_SLEEP(0),

    PROC_CALL(EndGlowBlendCtrl),
    PROC_CALL(UnitSlide_InitFadeOut),

    PROC_REPEAT(UnitSlide_FadeOutLoop),

    PROC_CALL(UnitSlide_SetNewUnit),
    PROC_CALL(UnitSlide_InitFadeIn),

    PROC_REPEAT(UnitSlide_FadeInLoop),
    PROC_SLEEP(0),

    PROC_CALL(StartGlowBlendCtrl),
    PROC_CALL(ClearSlide),

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
    PROC_CALL(PageNameCtrl_OnInit),

PROC_LABEL(0),
    PROC_REPEAT(PageNameCtrl_OnIdle),
    PROC_REPEAT(PageNameCtrl_AnimOut),

    PROC_SLEEP(1),

    PROC_REPEAT(PageNameCtrl_AnimIn),

    PROC_GOTO(0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSPageNumCtrl[] =
{
    PROC_CALL(PageNumCtrl_OnInit),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(PageNumCtrl_CheckSlide),
    PROC_CALL(PageNumCtrl_UpdateArrows),
    PROC_CALL(PageNumCtrl_UpdatePageNum),
    PROC_CALL(PageNumCtrl_DisplayMuPlatform),
    PROC_CALL(PageNumCtrl_DisplayBlinkIcons),

    PROC_GOTO(0),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SSBgOffsetCtrl[] =
{
    PROC_REPEAT(BgOffCtrl_OnLoop),
    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_StatScreen[] =
{
    PROC_CALL(StatScreen_BlackenScreen),
    PROC_CALL(BMapDispSuspend),

    PROC_SLEEP(2),

    PROC_CALL(StatScreen_InitDisplay),
    PROC_CALL(NewGreenTextColorManager),

    PROC_CALL(StatScreen_Display),

    PROC_START_CHILD(gProcScr_SSGlowyBlendCtrl),
    PROC_START_CHILD(gProcScr_SSPageNameCtrl),
    PROC_START_CHILD(gProcScr_SSPageNumCtrl),
    PROC_START_CHILD(gProcScr_SSBgOffsetCtrl),

    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_CALL(StatScreen_ResumeFromHelp),

    // fallthrough

PROC_LABEL(1),
    PROC_SLEEP(2),

    PROC_REPEAT(StatScreen_OnIdle),

PROC_LABEL(10),
    PROC_SLEEP(2),

    PROC_END_EACH(gProcScr_SSGlowyBlendCtrl),

    PROC_CALL(StatScreen_OnClose),

    PROC_CALL(BMapDispResume),
    PROC_CALL(MU_EndAll),
    PROC_CALL(EndGreenTextColorManager),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_HelpBox[] =
{
    PROC_SLEEP(0),

    PROC_CALL(HelpBox_OnOpen),
    PROC_REPEAT(HelpBox_OnLoop),

PROC_LABEL(0x63),
    PROC_CALL(HelpBox_OnClose),
    PROC_REPEAT(HelpBox_WaitClose),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_HelpBoxMoveCtrl[] =
{
    PROC_SLEEP(1),

PROC_LABEL(0),
    PROC_CALL(HbMoveCtrl_OnInitBox),
    PROC_REPEAT(HbMoveCtrl_OnIdle),
    PROC_CALL(CloseHelpBox),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_HelpBoxLock[] =
{
    PROC_REPEAT(HbLock_OnIdle),
    PROC_END,
};

static
u16 CONST_DATA sSprite_MetaHelp[] = // 'R is info'
{
    2,
    0x4000, 0x8000, TILEREF(11, 0),
    0x8000, 0x0020, TILEREF(15, 0),
};

struct ProcCmd CONST_DATA gProcScr_HelpPromptSpr[] = // proc displaying 'R is Info'
{
    PROC_SLEEP(0),

    PROC_REPEAT(HelpPrompt_OnIdle),
    PROC_END,
};

int GetLastStatScreenUid(void)
{
    return sStatScreenInfo.unitId;
}

void SetLastStatScreenUid(int uid)
{
    sStatScreenInfo.unitId = uid;
}

void SetStatScreenConfig(int config)
{
    sStatScreenInfo.config = config;
}

static
void InitTexts(void)
{
    InitTextBatch(sSSMasterTextBatch);
}

static
void DisplayTexts(const struct SSTextDispInfo* infos)
{
    while (infos->text)
    {
        if (infos->mid)
        {
            DrawTextInline(
                infos->text,
                infos->tilemap,
                infos->color,
                infos->xoff, 0,
                GetStringFromIndex(*infos->mid));
        }
        else
        {
            Text_Draw(infos->text, infos->tilemap);
        }

        ++infos;
    }
}

static
void DisplayLeftPanel(void)
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

static
void DisplayBwl(void)
{
    struct UnitUsageStats* stats = BWL_GetEntry(gStatScreen.unit->pCharacterData->number);

    if (!stats)
        return;

    if (gUnknown_0202BCB0.gameStateBits & 0x40)
        return;

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_3)
        return;

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_7)
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

static
void DrawStatWithBar(int num, int x, int y, int base, int total, int max)
{
    int diff = total - base;

    DrawDecNumber(gBmFrameTmap0 + TILEMAP_INDEX(x, y),
        (base == max) ? TEXT_COLOR_GREEN : TEXT_COLOR_BLUE, base);

    sub_8004BF0(diff, gBmFrameTmap0 + TILEMAP_INDEX(x + 1, y));

    if (total > 30)
    {
        total = 30;
        diff = total - base;
    }

    sub_8086B2C(0x401 + num*6, 6,
        gBmFrameTmap1 + TILEMAP_INDEX(x - 2, y + 1),
        TILEREF(0, STATSCREEN_BGPAL_6), max * 41 / 30, base * 41 / 30, diff * 41 / 30);
}

static
void DisplayPage0(void)
{
    DisplayTexts(sPage0TextInfo);

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
    DrawStatWithBar(0, 5, 1,
        gStatScreen.unit->pow,
        GetUnitPower(gStatScreen.unit),
        UNIT_POW_MAX(gStatScreen.unit));

    // displaying skl stat value
    DrawStatWithBar(1, 5, 3,
        gStatScreen.unit->state & US_RESCUING
            ? gStatScreen.unit->skl/2
            : gStatScreen.unit->skl,
        GetUnitSkill(gStatScreen.unit),
        gStatScreen.unit->state & US_RESCUING
            ? UNIT_SKL_MAX(gStatScreen.unit)/2
            : UNIT_SKL_MAX(gStatScreen.unit));

    // displaying spd stat value
    DrawStatWithBar(2, 5, 5,
        gStatScreen.unit->state & US_RESCUING
            ? gStatScreen.unit->spd/2
            : gStatScreen.unit->spd,
        GetUnitSpeed(gStatScreen.unit),
        gStatScreen.unit->state & US_RESCUING
            ? UNIT_SPD_MAX(gStatScreen.unit)/2
            : UNIT_SPD_MAX(gStatScreen.unit));

    // displaying lck stat value
    DrawStatWithBar(3, 5, 7,
        gStatScreen.unit->lck,
        GetUnitLuck(gStatScreen.unit),
        UNIT_LCK_MAX(gStatScreen.unit));

    // displaying def stat value
    DrawStatWithBar(4, 5, 9,
        gStatScreen.unit->def,
        GetUnitDefense(gStatScreen.unit),
        UNIT_DEF_MAX(gStatScreen.unit));

    // displaying res stat value
    DrawStatWithBar(5, 5, 11,
        gStatScreen.unit->res,
        GetUnitResistance(gStatScreen.unit),
        UNIT_RES_MAX(gStatScreen.unit));

    // displaying mov stat value
    DrawStatWithBar(6, 13, 1,
        UNIT_MOV_BASE(gStatScreen.unit),
        UNIT_MOV(gStatScreen.unit),
        UNIT_MOV_MAX(gStatScreen.unit));

    // displaying con stat value
    DrawStatWithBar(7, 13, 3,
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

    DisplayBwl();
}

static
void DisplayPage1(void)
{
    int i, item;
    const char* str;

    CopyDataWithPossibleUncomp(
        gUnknown_08A02204,
        gUnknown_02020188);

    CallARM_FillTileRect(
        gBmFrameTmap1 + TILEMAP_INDEX(1, 11),
        gUnknown_02020188, TILEREF(0x40, STATSCREEN_BGPAL_3));

    DisplayTexts(sPage1TextInfo);

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

static
void DisplaySupportList(void)
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

static
void DisplayWeaponExp(int num, int x, int y, int wtype)
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

static
void DisplayPage2(void)
{
    if (UnitHasMagicRank(gStatScreen.unit))
    {
        // NOTE: this was likely present in the J version
        // DisplayTexts(sPage2TextInfo_Magical);

        DisplayWeaponExp(0, 1, 1, ITYPE_ANIMA);
        DisplayWeaponExp(1, 1, 3, ITYPE_LIGHT);
        DisplayWeaponExp(2, 9, 1, ITYPE_DARK);
        DisplayWeaponExp(3, 9, 3, ITYPE_STAFF);
    }
    else
    {
        // NOTE: this was likely present in the J version
        // DisplayTexts(sPage2TextInfo_Physical);

        DisplayWeaponExp(0, 1, 1, ITYPE_SWORD);
        DisplayWeaponExp(1, 1, 3, ITYPE_LANCE);
        DisplayWeaponExp(2, 9, 1, ITYPE_AXE);
        DisplayWeaponExp(3, 9, 3, ITYPE_BOW);
    }

    DisplaySupportList();
}

static
void DisplayPage(int pageid)
{
    typedef void(*func_type)(void);

    func_type funcLut[4] =
    {
        DisplayPage0,
        DisplayPage1,
        DisplayPage2,
        DisplayPage0,
    };

    CpuFastFill(0, gBmFrameTmap0, sizeof(gBmFrameTmap0));
    CpuFastFill(0, gBmFrameTmap1, sizeof(gBmFrameTmap1));

    funcLut[pageid]();
}

static
struct Unit* FindNextUnit(struct Unit* u, int direction)
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

        if ((sStatScreenInfo.config & STATSCREEN_CONFIG_NONDEAD) && (unit->state & US_DEAD))
            continue;

        if ((sStatScreenInfo.config & STATSCREEN_CONFIG_NONBENCHED) && (unit->state & US_NOT_DEPLOYED))
            continue;

        if ((sStatScreenInfo.config & STATSCREEN_CONFIG_NONUNK9) && (unit->state & US_BIT9))
            continue;

        if ((sStatScreenInfo.config & STATSCREEN_CONFIG_NONROOFED) && (unit->state & US_UNDER_A_ROOF))
            continue;

        if ((sStatScreenInfo.config & STATSCREEN_CONFIG_NONUNK16) && (unit->state & US_BIT16))
            continue;

        if ((sStatScreenInfo.config & STATSCREEN_CONFIG_NONSUPPLY) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
            continue;

        if (UNIT_IS_GORGON_EGG(unit))
            continue;

        return unit;
    }
}

static
void PageSlide_OnLoop(struct StatScreenEffectProc* proc)
{
    int off;

    int len, dstOff, srcOff;

    // clear bg0, bg2 page area
    TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18, 0);
    TileMap_FillRect(gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18, 0);

    off = sPageSlideOffsetLut[proc->timer];

    if (off == INT8_MAX)
    {
        // INT8_MAX offset means switch to displaying next page

        DisplayPage(proc->newItem);

        proc->timer++;
        off = sPageSlideOffsetLut[proc->timer];
    }

    // compute len, dstOff and srcOff
    // len is the length of the display bit of the page
    // dstOff is the x offset to which to copy the page to
    // srcOff is the x offset from which to copy the page from

    if (proc->key & DPAD_LEFT)
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

    proc->timer++;
    off = sPageSlideOffsetLut[proc->timer];

    if (off == INT8_MIN)
        Proc_Break(proc);
}

static
void PageSlide_OnEnd(struct StatScreenEffectProc* proc)
{
    gStatScreen.inTransition = FALSE;
}

static
void StartPageSlide(u16 key, int newPage, struct Proc* parent)
{
    struct StatScreenEffectProc* proc;

    if (Proc_Find(gProcScr_SSPageSlide))
        return;

    PlaySoundEffect(0x6F); // TODO: song ids

    proc = (void*) Proc_StartBlocking(gProcScr_SSPageSlide, parent);

    proc->timer = 0;
    proc->newItem = newPage;
    proc->key = key;

    gStatScreen.pageSlideKey = key;
    gStatScreen.help         = NULL;
    gStatScreen.inTransition = TRUE;
}

static
void GlowBlendCtrl_OnInit(struct StatScreenEffectProc* proc)
{
    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;

    proc->timer = 0;
    proc->blendDirection = 0;

    SetSpecialColorEffectsParameters(1, proc->timer, 0x10, 0);

    sub_8001ED0(0, 1, 0, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 0);
}

static
void GlowBlendCtrl_OnLoop(struct StatScreenEffectProc* proc)
{
    if (proc->blendDirection == 0)
    {
        if (++proc->timer >= 0x40)
            proc->blendDirection++;
    }
    else
    {
        if (--proc->timer <= 0)
            proc->blendDirection = 0;
    }

    SetSpecialColorEffectsParameters(1, proc->timer >> 3, 0x10, 0);
}

static
void StartGlowBlendCtrl(void)
{
    Proc_Start(gProcScr_SSGlowyBlendCtrl, PROC_TREE_3);
}

static
void EndGlowBlendCtrl(struct StatScreenEffectProc* proc)
{
    Proc_EndEach(gProcScr_SSGlowyBlendCtrl);

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;
}

static
void UnitSlide_InitFadeOut(struct StatScreenEffectProc* proc)
{
    gStatScreen.inTransition = TRUE;

    proc->timer = 4;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 0;

    sub_8001ED0(0, 0, 0, 1, 0);
    sub_8001F0C(1, 1, 1, 0, 1);

    sub_8001F64(0);

    if (proc->direction > 0)
    {
        proc->yDispInit  = 0;
        proc->yDispFinal = -60;
    }
    else
    {
        proc->yDispInit  = 0;
        proc->yDispFinal = +60;
    }
}

static
void UnitSlide_FadeOutLoop(struct StatScreenEffectProc* proc)
{
    SetSpecialColorEffectsParameters(1, proc->timer, 0x10 - proc->timer, 0);

    MU_SetDisplayPosition(gStatScreen.mu,
        80, 138 + gStatScreen.yDispOff);

    gStatScreen.yDispOff = sub_8012DCC(2, proc->yDispInit, proc->yDispFinal, proc->timer, 0x10);

    proc->timer += 3;

    if (proc->timer > 0x10)
        Proc_Break(proc);
}

static
void UnitSlide_InitFadeIn(struct StatScreenEffectProc* proc)
{
    proc->timer = 1;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 0;

    sub_8001ED0(0, 0, 0, 1, 0);
    sub_8001F0C(1, 1, 1, 0, 1);

    if (proc->direction > 0)
    {
        proc->yDispInit = +60;
        proc->yDispFinal = 0;
    }
    else
    {
        proc->yDispInit = -60;
        proc->yDispFinal = 0;
    }
}

static
void UnitSlide_FadeInLoop(struct StatScreenEffectProc* proc)
{
    SetSpecialColorEffectsParameters(1, 0x10 - proc->timer, proc->timer, 0);

    MU_SetDisplayPosition(gStatScreen.mu,
        80, 138 + gStatScreen.yDispOff);

    gStatScreen.yDispOff = sub_8012DCC(5, proc->yDispInit, proc->yDispFinal, proc->timer, 0x10);

    proc->timer += 3;

    if (proc->timer >= 0x10)
        Proc_Break(proc);
}

static
void UnitSlide_SetNewUnit(struct StatScreenEffectProc* proc)
{
    gStatScreen.unit = GetUnit(proc->newItem);

    StatScreen_Display(Proc_Find(gProcScr_StatScreen));
    Proc_Break(proc);
}

static
void ClearSlide(struct Proc* proc)
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

static
void StartUnitSlide(struct Unit* unit, int direction, struct Proc* parent)
{
    struct StatScreenEffectProc* proc = (void*) Proc_StartBlocking(gProcScr_SSUnitSlide, parent);

    proc->newItem = unit->index;
    proc->direction = direction;

    PlaySoundEffect(0xC8); // TODO: song ids
}

enum
{
    // Magical constants

    // Neutral left arrow position
    PAGENUM_LEFTARROW_X = 103,
    PAGENUM_LEFTARROW_Y = 3,

    // Neutral right arrow position
    PAGENUM_RIGHTARROW_X = 217,
    PAGENUM_RIGHTARROW_Y = 3,

    // initial arrow offset on select
    PAGENUM_SELECT_XOFF = 6,

    // arrow animation speeds
    PAGENUM_ANIMSPEED = 4,
    PAGENUM_SELECT_ANIMSPEED = 31,

    PAGENUM_DISPLAY_X = 215,
    PAGENUM_DISPLAY_Y = 17,

    // name animation scaling time
    PAGENAME_SCALE_TIME = 6,
};

void DisplayPageNameSprite(int pageid)
{
    int colorid;

    PutSprite(4,
        111 + gStatScreen.xDispOff, 1 + gStatScreen.yDispOff,
        sSprite_PageNameBack, TILEREF(0x293, 4) + 0xC00);

    PutSprite(4,
        114 + gStatScreen.xDispOff, 0 + gStatScreen.yDispOff,
        sPageNameSpriteLut[pageid], TILEREF(0x240 + sPageNameChrOffsetLut[pageid], 3) + 0xC00);

    colorid = (GetGameClock()/4) % 16;

    CpuCopy16(
        gUnknown_08A027FC[pageid] + colorid,
        gPaletteBuffer + 0x13E,
        sizeof(u16));

    EnablePaletteSync();
}

static
void PageNameCtrl_OnInit(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    WriteOAMRotScaleData(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, 0x100), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, 0x100)  // pd
    );

    proc->pageNum = gStatScreen.page;
}

void PageNameCtrl_OnIdle(struct StatScreenPageNameProc* proc)
{
    DisplayPageNameSprite(proc->pageNum);

    if (gStatScreen.pageSlideKey)
    {
        proc->yScale = PAGENAME_SCALE_TIME - 1;

        Proc_Break(proc);
        return;
    }

    proc->pageNum = gStatScreen.page;
}

static
void PageNameCtrl_AnimOut(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    WriteOAMRotScaleData(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, proc->yScale * 0x100 / PAGENAME_SCALE_TIME), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, proc->yScale * 0x100 / PAGENAME_SCALE_TIME)  // pd
    );

    DisplayPageNameSprite(proc->pageNum);

    proc->yScale--;

    if (proc->yScale == 0)
    {
        proc->yScale = 1;
        Proc_Break(proc);
    }
}

static
void PageNameCtrl_AnimIn(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    WriteOAMRotScaleData(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, proc->yScale * 0x100 / PAGENAME_SCALE_TIME), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, proc->yScale * 0x100 / PAGENAME_SCALE_TIME)  // pd
    );

    DisplayPageNameSprite(gStatScreen.page);

    proc->yScale++;

    if (proc->yScale > PAGENAME_SCALE_TIME)
    {
        proc->pageNum = gStatScreen.page;
        Proc_Break(proc);
    }
}

static
void PageNumCtrl_OnInit(struct StatScreenPageNameProc* proc)
{
    proc->xLeftCursor  = PAGENUM_LEFTARROW_X;
    proc->xRightCursor = PAGENUM_RIGHTARROW_X;

    proc->animTimerRight = 0;
    proc->animTimerLeft  = 0;

    proc->animSpeedRight = PAGENUM_ANIMSPEED;
    proc->animSpeedLeft = PAGENUM_ANIMSPEED;
}

static
void PageNumCtrl_CheckSlide(struct StatScreenPageNameProc* proc)
{
    if (gStatScreen.pageSlideKey & DPAD_LEFT)
    {
        proc->animSpeedLeft = PAGENUM_SELECT_ANIMSPEED;
        proc->xLeftCursor = PAGENUM_LEFTARROW_X - PAGENUM_SELECT_XOFF;
    }

    if (gStatScreen.pageSlideKey & DPAD_RIGHT)
    {
        proc->animSpeedRight = PAGENUM_SELECT_ANIMSPEED;
        proc->xRightCursor = PAGENUM_RIGHTARROW_X + PAGENUM_SELECT_XOFF;
    }

    gStatScreen.pageSlideKey = 0;
}

static
void PageNumCtrl_UpdateArrows(struct StatScreenPageNameProc* proc)
{
    int baseref = TILEREF(0x240, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(1);

    proc->animTimerLeft  += proc->animSpeedLeft;
    proc->animTimerRight += proc->animSpeedRight;

    if (proc->animSpeedLeft > PAGENUM_ANIMSPEED)
        proc->animSpeedLeft--;

    if (proc->animSpeedRight > PAGENUM_ANIMSPEED)
        proc->animSpeedRight--;

    if ((GetGameClock() % 4) == 0)
    {
        if (proc->xLeftCursor < PAGENUM_LEFTARROW_X)
            proc->xLeftCursor++;

        if (proc->xRightCursor > PAGENUM_RIGHTARROW_X)
            proc->xRightCursor--;
    }

    PutSprite(0,
        gStatScreen.xDispOff + proc->xLeftCursor,
        gStatScreen.yDispOff + PAGENUM_LEFTARROW_Y,
        gObject_8x16, baseref + 0x5A + (proc->animTimerLeft >> 5) % 6);

    PutSprite(0,
        gStatScreen.xDispOff + proc->xRightCursor,
        gStatScreen.yDispOff + PAGENUM_RIGHTARROW_Y,
        gObject_8x16_HFlipped, baseref + 0x5A + (proc->animTimerRight >> 5) % 6);
}

static
void PageNumCtrl_UpdatePageNum(struct StatScreenPageNameProc* proc)
{
    int chr = 0x289;

    // page amt
    PutSprite(2,
        gStatScreen.xDispOff + PAGENUM_DISPLAY_X + 13,
        gStatScreen.yDispOff + PAGENUM_DISPLAY_Y,
        gObject_8x8, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3) + gStatScreen.pageAmt);

    // '/'
    PutSprite(2,
        gStatScreen.xDispOff + PAGENUM_DISPLAY_X + 7,
        gStatScreen.yDispOff + PAGENUM_DISPLAY_Y,
        gObject_8x8, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3));

    // page num
    PutSprite(2,
        gStatScreen.xDispOff + PAGENUM_DISPLAY_X,
        gStatScreen.yDispOff + PAGENUM_DISPLAY_Y,
        gObject_8x8, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3) + gStatScreen.page + 1);
}

static
void PageNumCtrl_DisplayMuPlatform(struct StatScreenPageNameProc* proc)
{
    PutSprite(11,
        gStatScreen.xDispOff + 64,
        gStatScreen.yDispOff + 131,
        gObject_32x16, TILEREF(0x28F, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3));
}

static
void PageNumCtrl_DisplayBlinkIcons(struct StatScreenPageNameProc* proc)
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
                PutSprite(4,
                    184, 78, gObject_8x8,
                    TILEREF(3, 0xF & palidLut[gStatScreen.unit->rescueOtherUnit >> 6]) + OAM2_PRIORITY(2));
            }
        }

        if (gStatScreen.unit->state & US_RESCUED)
        {
            if (displayIcon)
            {
                PutSprite(4,
                    10, 86, gObject_8x8,
                    TILEREF(3, 0xF & palidLut[gStatScreen.unit->rescueOtherUnit>>6]) + OAM2_PRIORITY(2));
            }
        }
    }
}

static
void StatScreen_BlackenScreen(void)
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

static
void StatScreen_InitDisplay(struct Proc* proc)
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

    ClearSlide(proc);
}

static
void StatScreen_Display(struct Proc* proc)
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

    InitTexts();

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

    DisplayLeftPanel();

    // Draw page content

    DisplayPage(gStatScreen.page);

    TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);
    TileMap_CopyRect(gBmFrameTmap1, gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

static
void StatScreen_OnIdle(struct Proc* proc)
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

        Proc_Break(proc);

        PlaySoundEffect(0x6B); // TODO: song ids
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
    {
        gStatScreen.page = (gStatScreen.page + gStatScreen.pageAmt - 1) % gStatScreen.pageAmt;
        StartPageSlide(DPAD_LEFT, gStatScreen.page, proc);
        return;
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
    {
        gStatScreen.page = (gStatScreen.page + gStatScreen.pageAmt + 1) % gStatScreen.pageAmt;
        StartPageSlide(DPAD_RIGHT, gStatScreen.page, proc);
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        unit = FindNextUnit(gStatScreen.unit, -1);
        StartUnitSlide(unit, -1, proc);
    }

    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        unit = FindNextUnit(gStatScreen.unit, +1);
        StartUnitSlide(unit, +1, proc);
    }

    else if ((gKeyStatusPtr->repeatedKeys & A_BUTTON) && (gStatScreen.unit->rescueOtherUnit))
    {
        unit = GetUnit(gStatScreen.unit->rescueOtherUnit);
        StartUnitSlide(unit, (gStatScreen.unit->state & US_RESCUING) ? +1 : -1, proc);
    }

    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        Proc_Goto(proc, 0); // TODO: label name
        StartStatScreenHelp(gStatScreen.page, proc);
    }
}

static
void StatScreen_OnClose(void)
{
    gRAMChapterData.chapterStateBits = (gRAMChapterData.chapterStateBits &~ 3) | (gStatScreen.page & 3);
    sStatScreenInfo.unitId = gStatScreen.unit->index;

    SetInterrupt_LCDVCountMatch(NULL);

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;
}

static
void StatScreen_ResumeFromHelp(void)
{
    gStatScreen.help = GetLastHelpBoxInfo();
}

static
void BgOffCtrl_OnLoop(void)
{
    int yBg = 0xFF & -gStatScreen.yDispOff;

    BG_SetPosition(0, 0, yBg);
    BG_SetPosition(2, 0, yBg);
}

void StartStatScreen(struct Unit* unit, struct Proc* parent)
{
    gStatScreen.xDispOff = 0;
    gStatScreen.yDispOff = 0;
    gStatScreen.page = gRAMChapterData.chapterStateBits & 3;
    gStatScreen.unit = unit;
    gStatScreen.help = NULL;
    gStatScreen.pageSlideKey = 0;
    gStatScreen.inTransition = FALSE;

    BWL_IncrementStatScreenViews(unit->pCharacterData->number);

    PlaySoundEffect(0x6A); // TODO: song ids

    Proc_StartBlocking(gProcScr_StatScreen, parent);
}

void StartStatScreenHelp(int pageid, struct Proc* proc)
{
    LoadDialogueBoxGfx(NULL, -1); // default

    if (!gStatScreen.help)
    {
        switch (pageid)
        {

        case STATSCREEN_PAGE_0:
            gStatScreen.help = &gHelpInfo_Ss0Pow;
            break;
        
        case STATSCREEN_PAGE_1:
            gStatScreen.help = &gHelpInfo_Ss1Item0;
            break;

        case STATSCREEN_PAGE_2:
            gStatScreen.help = &gHelpInfo_Ss2Rank0;
            break;

        } // switch (pageid)
    }

    StartMovingHelpBox(gStatScreen.help, proc);
}

void HbPopulate_SSItem(struct HelpBoxProc* proc)
{
    int item = gStatScreen.unit->items[proc->info->mid];

    proc->item = item;
    proc->mid  = GetItemDescId(item);
}

void HbPopulate_SSStatus(struct HelpBoxProc* proc)
{
    switch (gStatScreen.unit->statusIndex)
    {

    case UNIT_STATUS_NONE:
        proc->mid = 0x552; // TODO: mid constants
        break;

    case UNIT_STATUS_POISON:
        proc->mid = 0x553; // TODO: mid constants
        break;

    case UNIT_STATUS_SLEEP:
        proc->mid = 0x554; // TODO: mid constants
        break;

    case UNIT_STATUS_SILENCED:
        proc->mid = 0x556; // TODO: mid constants
        break;

    case UNIT_STATUS_BERSERK:
        proc->mid = 0x555; // TODO: mid constants
        break;

    case UNIT_STATUS_ATTACK:
        proc->mid = 0x558; // TODO: mid constants
        break;

    case UNIT_STATUS_DEFENSE:
        proc->mid = 0x559; // TODO: mid constants
        break;

    case UNIT_STATUS_CRIT:
        proc->mid = 0x55A; // TODO: mid constants
        break;

    case UNIT_STATUS_AVOID:
        proc->mid = 0x55B; // TODO: mid constants
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        proc->mid = 0x557; // TODO: mid constants
        break;

    } // switch (gStatScreen.unit->statusIndex)
}

void HbPopulate_SSPower(struct HelpBoxProc* proc)
{
    if (UnitHasMagicRank(gStatScreen.unit))
        proc->mid = 0x547; // TODO: mid constants
    else
        proc->mid = 0x546; // TODO: mid constants
}

void HbRedirect_SSItem(struct HelpBoxProc* proc)
{
    if (!gStatScreen.unit->items[0])
        TryRelocateHbLeft(proc);

    if (!gStatScreen.unit->items[proc->info->mid])
    {
        if (proc->moveKey == 0 || proc->moveKey == DPAD_RIGHT || proc->moveKey == DPAD_UP)
            TryRelocateHbUp(proc);
        else if (proc->moveKey == DPAD_DOWN)
            TryRelocateHbDown(proc);
    }
}

void HbPopulate_SSWExp(struct HelpBoxProc* proc)
{
    u16 rankMsgLut[8] =
    {
        0x561, 0x562, 0x563, 0x564, 0x565, 0x566, 0x567, 0x568
    };

    int itemKind = proc->info->mid;

    if (UnitHasMagicRank(gStatScreen.unit))
        itemKind += 4;

    proc->mid = rankMsgLut[itemKind];
}

void HbPopulate_SSCharacter(struct HelpBoxProc* proc)
{
    int midDesc = gStatScreen.unit->pCharacterData->descTextId;

    if (midDesc)
        proc->mid = midDesc;
    else
        proc->mid = 0x6BE; // TODO: mid constants
}

void HbPopulate_SSClass(struct HelpBoxProc* proc)
{
    proc->mid = gStatScreen.unit->pClassData->descTextId;
}

void HbRedirect_SSSupports(struct HelpBoxProc* proc)
{
    if (GetUnitTotalSupportLevel(gStatScreen.unit) == 0)
    {
        if (proc->moveKey == DPAD_DOWN)
            TryRelocateHbDown(proc);
        else
            TryRelocateHbUp(proc);
    }
}

void UpdateHelpBoxDisplay(struct HelpBoxProc* proc, int arg1)
{
    proc->xBox = sub_8012DCC(arg1, proc->xBoxInit, proc->xBoxFinal, proc->timer, proc->timerMax);
    proc->yBox = sub_8012DCC(arg1, proc->yBoxInit, proc->yBoxFinal, proc->timer, proc->timerMax);
    proc->wBox = sub_8012DCC(arg1, proc->wBoxInit, proc->wBoxFinal, proc->timer, proc->timerMax);
    proc->hBox = sub_8012DCC(arg1, proc->hBoxInit, proc->hBoxFinal, proc->timer, proc->timerMax);

    sub_8089980(proc->xBox, proc->yBox, proc->wBox, proc->hBox, proc->unk52);
}

static
void HelpBox_OnOpen(struct HelpBoxProc* proc)
{
    struct Proc* found = Proc_Find(gProcScr_HelpPromptSpr);

    if (found)
        found->proc_lockCnt = 1; // lock (disabled) proc

    if (proc->unk52 == 0)
        PlaySoundEffect(0x70); // TODO: song ids
}

static
void HelpBox_OnLoop(struct HelpBoxProc* proc)
{
    UpdateHelpBoxDisplay(proc, 5);

    if (proc->timer < proc->timerMax)
        proc->timer++;
}

static
void HelpBox_OnClose(struct HelpBoxProc* proc)
{
    struct Proc* found = Proc_Find(gProcScr_HelpPromptSpr);

    if (found)
        found->proc_lockCnt = 0; // unlock (enable) proc

    if (proc->unk52 == 0)
    {
        PlaySoundEffect(0x71); // TODO: song ids

        ResetHelpBoxInitSize(proc);
        SetHelpBoxInitPosition(proc, proc->info->xDisplay, proc->info->yDisplay);
    }
}

static
void HelpBox_WaitClose(struct HelpBoxProc* proc)
{
    UpdateHelpBoxDisplay(proc, 0);

    proc->timer -= 3;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void StartHelpBox(int x, int y, int mid)
{
    sMutableHbi.adjUp    = NULL;
    sMutableHbi.adjDown  = NULL;
    sMutableHbi.adjLeft  = NULL;
    sMutableHbi.adjRight = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.mid      = mid;

    sMutableHbi.redirect = NULL;
    sMutableHbi.populate = NULL;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    StartHelpBoxExt(&sMutableHbi, FALSE);
}

void StartHelpBox_Unk(int x, int y, int mid)
{
    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    sMutableHbi.adjUp    = NULL;
    sMutableHbi.adjDown  = NULL;
    sMutableHbi.adjLeft  = NULL;
    sMutableHbi.adjRight = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.mid      = mid;

    sMutableHbi.redirect = NULL;
    sMutableHbi.populate = NULL;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    StartHelpBoxExt(&sMutableHbi, TRUE);
}

void StartItemHelpBox(int x, int y, int item)
{
    sMutableHbi.adjUp    = NULL;
    sMutableHbi.adjDown  = NULL;
    sMutableHbi.adjLeft  = NULL;
    sMutableHbi.adjRight = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.mid      = item;

    sMutableHbi.redirect = NULL;
    sMutableHbi.populate = HbPopulate_AutoItem;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    StartHelpBoxExt(&sMutableHbi, FALSE);
}

void StartHelpBoxExt(const struct HelpBoxInfo* info, int unk)
{
    struct HelpBoxProc* proc;
    int wContent, hContent;

    proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (!proc)
    {
        proc = (void*) Proc_Start(gProcScr_HelpBox, PROC_TREE_3);

        proc->unk52 = unk;

        SetHelpBoxInitPosition(proc, info->xDisplay, info->yDisplay);
        ResetHelpBoxInitSize(proc);
    }
    else
    {
        proc->xBoxInit = proc->xBox;
        proc->yBoxInit = proc->yBox;

        proc->wBoxInit = proc->wBox;
        proc->hBoxInit = proc->hBox;
    }

    proc->info = info;

    proc->timer    = 0;
    proc->timerMax = 12;

    proc->item = 0;
    proc->mid = info->mid;

    if (proc->info->populate)
        proc->info->populate(proc);

    SetFontGlyphSet(1);
    sub_8003FAC(GetStringFromIndex(proc->mid), &wContent, &hContent);
    SetFontGlyphSet(0);

    ApplyHelpBoxContentSize(proc, wContent, hContent);
    ApplyHelpBoxPosition(proc, info->xDisplay, info->yDisplay);

    sub_808A118();
    sub_808A0FC(proc->item, proc->mid);

    sLastHbi = info;
}

void StartHelpBoxExt_Unk(int x, int y, int mid)
{
    struct HelpBoxProc* proc;
    int wContent, hContent;

    proc = (void*) Proc_Start(gProcScr_HelpBox, PROC_TREE_3);

    proc->unk52 = TRUE;

    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    proc->timer    = 0;
    proc->timerMax = 12;

    proc->item = 0;
    proc->mid = mid;

    SetFontGlyphSet(1);
    sub_8003FAC(GetStringFromIndex(proc->mid), &wContent, &hContent);
    SetFontGlyphSet(0);

    ResetHelpBoxInitSize(proc);
    ApplyHelpBoxContentSize(proc, wContent, hContent);

    proc->xBoxInit = x + 8;
    proc->yBoxInit = y + 8;

    proc->xBoxFinal = x + 8;
    proc->yBoxFinal = y + 8;

    sub_808A118();
    sub_808A0FC(proc->item, proc->mid);
}

void CloseHelpBox(void)
{
    struct HelpBoxProc* proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (proc)
    {
        sub_808A118();
        Proc_Goto(proc, 0x63);
    }
}

void EndHelpBox(void)
{
    struct HelpBoxProc* proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (proc)
    {
        sub_808A118();
        Proc_End(proc);
    }
}

static
void HbMoveCtrl_OnInitBox(struct HelpBoxProc* proc)
{
    proc->moveKey = 0;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    StartHelpBoxExt(proc->info, FALSE);
}

static
void HbMoveCtrl_OnIdle(struct HelpBoxProc* proc)
{
    u8 boxMoved = FALSE;

    DisplayUiHand(
        sHbOrigin.x*8 + proc->info->xDisplay,
        sHbOrigin.y*8 + proc->info->yDisplay);

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
        boxMoved |= TryRelocateHbUp(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
        boxMoved |= TryRelocateHbDown(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
        boxMoved |= TryRelocateHbLeft(proc);

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
        boxMoved |= TryRelocateHbRight(proc);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_Break((void*) proc);
        return;
    }

    if (boxMoved)
    {
        PlaySoundEffect(0x67);
        Proc_Goto((void*) proc, 0); // TODO: label constants?
    }
}

static
void HbMoveCtrl_OnEnd(struct HelpBoxProc* proc)
{
    CloseHelpBox();
    Proc_End((void*) proc);
}

void StartMovingHelpBox(const struct HelpBoxInfo* info, struct Proc* parent)
{
    struct HelpBoxProc* proc = (void*) Proc_StartBlocking(gProcScr_HelpBoxMoveCtrl, parent);

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    proc->info = info;
}

void StartMovingHelpBoxExt(const struct HelpBoxInfo* info, struct Proc* parent, int x, int y)
{
    struct HelpBoxProc* proc = (void*) Proc_StartBlocking(gProcScr_HelpBoxMoveCtrl, parent);

    sHbOrigin.x = x;
    sHbOrigin.y = y;

    proc->info = info;
}

static
void ApplyHelpBoxContentSize(struct HelpBoxProc* proc, int width, int height)
{
    width = 0xF0 & (width + 15); // align to 16 pixel multiple

    switch (GetHelpBoxItemInfoKind(proc->item))
    {

    case 1: // weapon
        if (width < 0x90)
            width = 0x90;

        if (GetStringTextWidth(GetStringFromIndex(proc->mid)) > 8)
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

    } // switch (GetHelpBoxItemInfoKind(proc->item))

    proc->wBoxFinal = width;
    proc->hBoxFinal = height;
}

static
void ApplyHelpBoxPosition(struct HelpBoxProc* proc, int x, int y)
{
    int xSpan = proc->wBoxFinal + 0x10;
    int ySpan = proc->hBoxFinal + 0x10;

    x += sHbOrigin.x*8;
    y += sHbOrigin.y*8;

    proc->xBoxFinal = x - 0x10 - xSpan/6;

    if (proc->xBoxFinal < 0)
        proc->xBoxFinal = 0;

    if (proc->xBoxFinal + xSpan > DISPLAY_WIDTH)
        proc->xBoxFinal = DISPLAY_WIDTH - xSpan;

    proc->yBoxFinal = y + 0x10;

    if (proc->yBoxFinal + ySpan > DISPLAY_HEIGHT)
        proc->yBoxFinal = y - ySpan;

    proc->xBoxFinal += 8;
    proc->yBoxFinal += 8;
}

void SetHelpBoxInitPosition(struct HelpBoxProc* proc, int x, int y)
{
    x += sHbOrigin.x*8;
    y += sHbOrigin.y*8;

    proc->xBoxInit = x;
    proc->yBoxInit = y;
}

void ResetHelpBoxInitSize(struct HelpBoxProc* proc)
{
    proc->wBoxInit = 32;
    proc->hBoxInit = 16;
}

int GetHelpBoxItemInfoKind(int item)
{
    if (item == 0xFFFE)
        return HB_EXTINFO_SAVEINFO;

    if (GetItemAttributes(item) & IA_LOCK_3)
        return HB_EXTINFO_NONE;

    if (GetItemAttributes(item) & IA_WEAPON)
        return HB_EXTINFO_WEAPON;

    if (GetItemAttributes(item) & IA_STAFF)
        return HB_EXTINFO_STAFF;

    return HB_EXTINFO_NONE;
}

void HbPopulate_AutoItem(struct HelpBoxProc* proc)
{
    int item = proc->info->mid;

    proc->item = item;

    if (GetHelpBoxItemInfoKind(proc->item) == HB_EXTINFO_SAVEINFO)
        proc->mid = 0;
    else
        proc->mid = GetItemDescId(item);
}

int TryRelocateHbUp(struct HelpBoxProc* proc)
{
    if (!proc->info->adjUp)
        return FALSE;

    proc->info    = proc->info->adjUp;
    proc->moveKey = DPAD_UP;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

int TryRelocateHbDown(struct HelpBoxProc* proc)
{
    if (!proc->info->adjDown)
        return FALSE;

    proc->info    = proc->info->adjDown;
    proc->moveKey = DPAD_DOWN;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

int TryRelocateHbLeft(struct HelpBoxProc* proc)
{
    if (!proc->info->adjLeft)
        return FALSE;

    proc->info    = proc->info->adjLeft;
    proc->moveKey = DPAD_LEFT;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

int TryRelocateHbRight(struct HelpBoxProc* proc)
{
    // whoa bad hardcoded thing!
    if (!proc->info->adjRight || (proc->info == &gHelpInfo_Ss1CharName && !gStatScreen.unit->items[0]))
        return FALSE;

    proc->info    = proc->info->adjRight;
    proc->moveKey = DPAD_RIGHT;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    return TRUE;
}

static
void HbLock_OnIdle(struct Proc* proc)
{
    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        Proc_Break(proc);
}

int StartLockingHelpBox_Unused(int mid, struct Proc* parent)
{
    LoadDialogueBoxGfx(NULL, -1);

    StartHelpBox(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), mid);
    Proc_StartBlocking(gProcScr_HelpBoxLock, parent);

    return TRUE;
}

void HelpPrompt_OnIdle(struct HelpPromptSprProc* proc)
{
    PutSprite(0,
        proc->xDisplay, proc->yDisplay,
        sSprite_MetaHelp, proc->tileref);
}

struct Proc* StartHelpPromptSprite_Unused(int x, int y, struct Proc* parent)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    if (!proc)
        proc = (void*) Proc_Start(gProcScr_HelpPromptSpr, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0);

    return (void*) proc;
}

struct Proc* StartHelpPromptSprite(int x, int y, int palid, struct Proc* parent)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    ApplyPalette(gUnknown_08A1D79C, palid + 0x10);

    if (!proc)
        proc = (void*) Proc_Start(gProcScr_HelpPromptSpr, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0xF & palid);

    return (void*) proc;
}

struct Proc* StartHelpPromptSprite_Unused2(int x, int y, struct Proc* parent)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    if (!proc)
        proc = (void*) Proc_StartBlocking(gProcScr_HelpPromptSpr, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0);

    return (void*) proc;
}

void EndHelpPromptSprite(void)
{
    struct Proc* proc = Proc_Find(gProcScr_HelpPromptSpr);

    if (proc)
        Proc_End(proc);
}

void MoveHelpPromptSprite(int x, int y)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    if (proc)
    {
        proc->xDisplay = x;
        proc->yDisplay = y;
    }
}

const struct HelpBoxInfo* GetLastHelpBoxInfo(void)
{
    return sLastHbi;
}

// =================
// = HELP BOX INFO =
// =================

#define DECL_INFO struct HelpBoxInfo CONST_DATA

// TODO (maybe, eventually): maybe generate this from file(s)?

// Stat Screen Page 0 (Core stats & status) (Ss0)

static DECL_INFO sHelpInfo_08A00B38;
static DECL_INFO sHelpInfo_08A00B54;
static DECL_INFO sHelpInfo_08A00B70;
static DECL_INFO sHelpInfo_08A00B8C;
static DECL_INFO sHelpInfo_08A00BA8;
extern DECL_INFO gHelpInfo_Ss0Pow;
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
    24, 80, 0, NULL, HbPopulate_SSCharacter,
};

static DECL_INFO sHelpInfo_08A00B54 =
{
    &sHelpInfo_08A00B38, &sHelpInfo_08A00B70, NULL, &sHelpInfo_08A00C50,
    6, 104, 0x6E8, NULL, HbPopulate_SSClass,
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

DECL_INFO gHelpInfo_Ss0Pow =
{
    NULL, &sHelpInfo_08A00BE0, &sHelpInfo_08A00B38, &sHelpInfo_08A00C6C,
    102, 24, 0x546, NULL, HbPopulate_SSPower,
};

static DECL_INFO sHelpInfo_08A00BE0 =
{
    &gHelpInfo_Ss0Pow, &sHelpInfo_08A00BFC, &sHelpInfo_08A00B38, &sHelpInfo_08A00C88,
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
    NULL, &sHelpInfo_08A00C88, &gHelpInfo_Ss0Pow, NULL,
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
    166, 104, 0, NULL, HbPopulate_SSStatus,
};

// Stat Screen Page 1 (Items & battle stats) (Ss1)

extern DECL_INFO gHelpInfo_Ss1CharName;
static DECL_INFO sHelpInfo_08A00D30;
static DECL_INFO sHelpInfo_08A00D4C;
static DECL_INFO sHelpInfo_08A00D68;
static DECL_INFO sHelpInfo_08A00D84;
extern DECL_INFO gHelpInfo_Ss1Item0;
static DECL_INFO sHelpInfo_08A00DBC;
static DECL_INFO sHelpInfo_08A00DD8;
static DECL_INFO sHelpInfo_08A00DF4;
static DECL_INFO sHelpInfo_08A00E10;
static DECL_INFO sHelpInfo_08A00E2C;
static DECL_INFO sHelpInfo_08A00E48;
static DECL_INFO sHelpInfo_08A00E64;
static DECL_INFO sHelpInfo_08A00E80;
static DECL_INFO sHelpInfo_08A00E9C;

DECL_INFO gHelpInfo_Ss1CharName =
{
    NULL, &sHelpInfo_08A00D30, NULL, &sHelpInfo_08A00DF4,
    24, 80, 0, NULL, HbPopulate_SSCharacter,
};

static DECL_INFO sHelpInfo_08A00D30 =
{
    &gHelpInfo_Ss1CharName, &sHelpInfo_08A00D4C, NULL, &sHelpInfo_08A00E2C,
    6, 104, 0x6E8, NULL, HbPopulate_SSClass,
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

DECL_INFO gHelpInfo_Ss1Item0 =
{
    NULL, &sHelpInfo_08A00DBC, &gHelpInfo_Ss1CharName, NULL,
    104, 24, 0, HbRedirect_SSItem, HbPopulate_SSItem,
};

static DECL_INFO sHelpInfo_08A00DBC =
{
    &gHelpInfo_Ss1Item0, &sHelpInfo_08A00DD8, &gHelpInfo_Ss1CharName, NULL,
    104, 40, 1, HbRedirect_SSItem, HbPopulate_SSItem,
};

static DECL_INFO sHelpInfo_08A00DD8 =
{
    &sHelpInfo_08A00DBC, &sHelpInfo_08A00DF4, &gHelpInfo_Ss1CharName, NULL,
    104, 56, 2, HbRedirect_SSItem, HbPopulate_SSItem,
};

static DECL_INFO sHelpInfo_08A00DF4 =
{
    &sHelpInfo_08A00DD8, &sHelpInfo_08A00E10, &gHelpInfo_Ss1CharName, NULL,
    104, 72, 3, HbRedirect_SSItem, HbPopulate_SSItem,
};

static DECL_INFO sHelpInfo_08A00E10 =
{
    &sHelpInfo_08A00DF4, &sHelpInfo_08A00E2C, &gHelpInfo_Ss1CharName, &sHelpInfo_08A00E64,
    104, 88, 4, HbRedirect_SSItem, HbPopulate_SSItem,
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

// Stat Screen Page 2 (Weapon ranks & supports) (Ss2)

static DECL_INFO sHelpInfo_08A00EB8;
static DECL_INFO sHelpInfo_08A00ED4;
static DECL_INFO sHelpInfo_08A00EF0;
static DECL_INFO sHelpInfo_08A00F0C;
static DECL_INFO sHelpInfo_08A00F28;
extern DECL_INFO gHelpInfo_Ss2Rank0;
static DECL_INFO sHelpInfo_08A00F60;
static DECL_INFO sHelpInfo_08A00F7C;
static DECL_INFO sHelpInfo_08A00F98;
static DECL_INFO sHelpInfo_08A00FB4;

static DECL_INFO sHelpInfo_08A00EB8 =
{
    NULL, &sHelpInfo_08A00ED4, NULL, &sHelpInfo_08A00FB4,
    24, 80, 0, NULL, HbPopulate_SSCharacter,
};

static DECL_INFO sHelpInfo_08A00ED4 =
{
    &sHelpInfo_08A00EB8, &sHelpInfo_08A00EF0, NULL, &sHelpInfo_08A00FB4,
    6, 104, 0x6E8, NULL, HbPopulate_SSClass,
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

DECL_INFO gHelpInfo_Ss2Rank0 =
{
    NULL, &sHelpInfo_08A00F60, &sHelpInfo_08A00EB8, &sHelpInfo_08A00F7C,
    104, 24, 0, NULL, HbPopulate_SSWExp,
};

static DECL_INFO sHelpInfo_08A00F60 =
{
    &gHelpInfo_Ss2Rank0, &sHelpInfo_08A00FB4, &sHelpInfo_08A00EB8, &sHelpInfo_08A00F98,
    104, 40, 1, NULL, HbPopulate_SSWExp,
};

static DECL_INFO sHelpInfo_08A00F7C =
{
    NULL, &sHelpInfo_08A00F98, &gHelpInfo_Ss2Rank0, NULL,
    168, 24, 2, NULL, HbPopulate_SSWExp,
};

static DECL_INFO sHelpInfo_08A00F98 =
{
    &sHelpInfo_08A00F7C, &sHelpInfo_08A00FB4, &sHelpInfo_08A00F60, NULL,
    168, 40, 3, NULL, HbPopulate_SSWExp,
};

static DECL_INFO sHelpInfo_08A00FB4 =
{
    &sHelpInfo_08A00F60, &sHelpInfo_08A00EB8, &sHelpInfo_08A00EB8, NULL,
    128, 64, 0x569, HbRedirect_SSSupports, NULL,
};

// BKSEL (Select Battle Target Window) HELP INFOS

void sub_8037494(struct HelpBoxProc* proc);
void sub_80374C4(struct HelpBoxProc* proc);

// Simple/Modern mode (Mbp)

static DECL_INFO sHelpInfo_08A00FD0;
extern DECL_INFO gHelpInfo_MbpHp;
static DECL_INFO sHelpInfo_08A01008;
static DECL_INFO sHelpInfo_08A01024;
static DECL_INFO sHelpInfo_08A01040;
static DECL_INFO sHelpInfo_08A0105C;

static DECL_INFO sHelpInfo_08A00FD0 =
{
    NULL, &gHelpInfo_MbpHp, NULL, NULL,
    8, 8, 0, NULL, sub_8037494,
};

DECL_INFO gHelpInfo_MbpHp =
{
    &sHelpInfo_08A00FD0, &sHelpInfo_08A01008, NULL, NULL,
    28, 24, 0x544,
};

static DECL_INFO sHelpInfo_08A01008 =
{
    &gHelpInfo_MbpHp, &sHelpInfo_08A01024, NULL, NULL,
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

// Detailed/Classic mode (Cbp)

static DECL_INFO sHelpInfo_08A01078;
extern DECL_INFO gHelpInfo_CbpHp;
static DECL_INFO sHelpInfo_08A010B0;
static DECL_INFO sHelpInfo_08A010CC;
static DECL_INFO sHelpInfo_08A010E8;
static DECL_INFO sHelpInfo_08A01104;
static DECL_INFO sHelpInfo_08A01120;
static DECL_INFO sHelpInfo_08A0113C;

static DECL_INFO sHelpInfo_08A01078 =
{
    NULL, &gHelpInfo_CbpHp, NULL, NULL,
    8, 8, 0, NULL, sub_8037494,
};

DECL_INFO gHelpInfo_CbpHp =
{
    &sHelpInfo_08A01078, &sHelpInfo_08A010B0, NULL, NULL,
    28, 24, 0x544,
};

static DECL_INFO sHelpInfo_08A010B0 =
{
    &gHelpInfo_CbpHp, &sHelpInfo_08A010CC, NULL, NULL,
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
unsigned CONST_DATA gMid_Lv = 0x4E7; // Lv
unsigned CONST_DATA gMid_Exp_Unused = 0x4E8; // Exp
unsigned CONST_DATA gMid_Hp = 0x4E9; // HP
unsigned CONST_DATA gMid_Str = 0x4FE; // Str
unsigned CONST_DATA gMid_Mag = 0x4FF; // Mag
unsigned CONST_DATA gMid_Skl = 0x4EC; // Skill
unsigned CONST_DATA gMid_Spd = 0x4ED; // Spd
unsigned CONST_DATA gMid_Def = 0x4EF; // Def
unsigned CONST_DATA gMid_Res = 0x4F0; // Res
unsigned CONST_DATA gMid_Lck = 0x4EE; // Luck
unsigned CONST_DATA gMid_Con = 0x4F7; // Con
unsigned CONST_DATA gMid_Aid = 0x4F8; // Aid
unsigned CONST_DATA gMid_Mov = 0x4F6; // Move
unsigned CONST_DATA gMid_Trv = 0x4F9; // Trv
unsigned CONST_DATA gMid_Affin = 0x4F1; // Affin
unsigned CONST_DATA gMid_Rng = 0x500; // Rng
unsigned CONST_DATA gMid_Atk = 0x4F3; // Atk
unsigned CONST_DATA gMid_Hit = 0x4F4; // Hit
unsigned CONST_DATA gMid_Crt = 0x501; // Crit
unsigned CONST_DATA gMid_Avo = 0x4F5; // Avoid
unsigned CONST_DATA gMid_Cnd = 0x4FA; // Cond
unsigned CONST_DATA gMid_Mt = 0x503; // Mt
unsigned CONST_DATA gMid_Wt = 0x502; // Wt
unsigned CONST_DATA gMid_RangeMpOn2 = 0x522; // MP/2
unsigned CONST_DATA gMid_Range1To1 = 0x523; //    1
unsigned CONST_DATA gMid_Range1To2 = 0x524; //  1-2
unsigned CONST_DATA gMid_Range1To3 = 0x525; //  1-3
unsigned CONST_DATA gMid_Range2To2 = 0x526; //    2
unsigned CONST_DATA gMid_Range2To3 = 0x527; //  2-3
unsigned CONST_DATA gMid_Range3To10 = 0x528; // 3-10
unsigned CONST_DATA gMid_Range3To15 = 0x529; // 3-15
unsigned CONST_DATA gMid_Unk08A011D4 = 0x536; // ????
unsigned CONST_DATA gMid_Poison = 0x514; // Poison
unsigned CONST_DATA gMid_Sleep = 0x515; // Sleep
unsigned CONST_DATA gMid_Silence = 0x516; // Silence
unsigned CONST_DATA gMid_Berserk = 0x517; // Berserk
unsigned CONST_DATA gMid_Sword = 0x505; // Sword
unsigned CONST_DATA gMid_Lance = 0x506; // Lance
unsigned CONST_DATA gMid_Axe = 0x507; // Axe
unsigned CONST_DATA gMid_Bow = 0x508; // Bow
unsigned CONST_DATA gMid_Staff = 0x509; // Staff
unsigned CONST_DATA gMid_Anima = 0x50A; // Anima
unsigned CONST_DATA gMid_Light = 0x50B; // Light
unsigned CONST_DATA gMid_Dark = 0x50C; // Dark
