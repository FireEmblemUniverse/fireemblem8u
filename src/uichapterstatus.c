#include "global.h"

#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

struct ChapterStatusProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 restoreStateOnExit;
    /* 2A */ u8 focusUnitOnExit;
    /* 2B */ u8 timesCompleted;
    /* 2C */ u8 numObjectiveTextLines;
    /* 2D */ u8 unk_2d; // initialized to 0 and unreferenced
    /* 2E */ u8 unitIndex;
    /* 2F */ u8 unitIndexPrev;
    /* 30 */ u8 numAllyUnits;
    /* 31 */ u8 numEnemyUnits;

    /* 34 */ struct Unit* units[2];

    /* 3C */ u16 unk_3c; // initialized to 0 and unreferenced
    /* 3E */ u8 helpTextActive;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 timer;

    /* 41 */ STRUCT_PAD(0x41, 0x64);

    /* 64 */ u16 unk_64; // initialized to 0 and unreferenced
};

struct StatusScreenSt
{
    /* 00 */ struct Text th;
    /* 08 */ struct Font font;
};

EWRAM_OVERLAY(0) struct Text gChapterStatusText[2] = {0};
EWRAM_OVERLAY(0) struct StatusScreenSt gStatusScreenSt = {0};

// clang-format off

u16 CONST_DATA Sprite_ChapterStatus_PlayCountLabel[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x340) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_ChapterStatus_PlayerLabel[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x354) + OAM2_LAYER(1) + OAM2_PAL(4),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(32), OAM2_CHR(0x358) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_ChapterStatus_EnemyLabel[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x35A) + OAM2_LAYER(1) + OAM2_PAL(4),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(32), OAM2_CHR(0x35E) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_ChapterStatus_ObjectiveLabel[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x343) + OAM2_LAYER(1) + OAM2_PAL(4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x347) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_ChapterStatus_TurnLabel[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x34B) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_ChapterStatus_FundsLabel[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x34F) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_ChapterStatus_FactionSelector[] =
{
    8,
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8, OAM2_CHR(0x18),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(16), OAM2_CHR(0x19),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(32), OAM2_CHR(0x19),
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(48) + OAM1_HFLIP, OAM2_CHR(0x18),
    OAM0_SHAPE_16x8 + OAM0_Y(8), OAM1_SIZE_16x8 + OAM1_VFLIP, OAM2_CHR(0x18),
    OAM0_SHAPE_16x8 + OAM0_Y(8), OAM1_SIZE_16x8 + OAM1_X(16) + OAM1_VFLIP, OAM2_CHR(0x19),
    OAM0_SHAPE_16x8 + OAM0_Y(8), OAM1_SIZE_16x8 + OAM1_X(32) + OAM1_VFLIP, OAM2_CHR(0x19),
    OAM0_SHAPE_16x8 + OAM0_Y(8), OAM1_SIZE_16x8 + OAM1_X(48) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x18),
};

u16 CONST_DATA Sprite_ChapterStatus_ChapterBanner[] =
{
    3,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, 0,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(128), OAM2_CHR(0x10),
};

u16 CONST_DATA Sprite_ChapterStatus_PlaytimeBanner[] =
{
    2,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x90),
    OAM0_SHAPE_16x32, OAM1_SIZE_16x32 + OAM1_X(64), OAM2_CHR(0x98),
};

struct TextInitInfo CONST_DATA gTextInitInfo_ChapterStatus[] =
{
    { gChapterStatusText + 0, 12 },
    { gChapterStatusText + 1, 12 },

    { 0 }, // end
};

// clang-format on

void ChapterStatus_Init(struct ChapterStatusProc * proc);
void ChapterStatus_DrawText(struct ChapterStatusProc * proc);
void ChapterStatus_ShowAllLayers(void);
void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc * proc);
void ChapterStatus_OnEnd(struct ChapterStatusProc * proc);
void ChapterStatus_FocusLeaderUnit(struct ChapterStatusProc * proc);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_ChapterStatusScreen[] =
{
    PROC_CALL(LockGame),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(ChapterStatus_Init),
    PROC_CALL(ChapterStatus_DrawText),
    PROC_CALL(ChapterStatus_ShowAllLayers),

PROC_LABEL(0),
    PROC_REPEAT(ChapterStatus_LoopKeyHandler),

PROC_LABEL(1),
    PROC_CALL(sub_8013F58),
    PROC_YIELD,
    PROC_CALL(EndMuralBackground),

    PROC_CALL(ChapterStatus_OnEnd),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(ChapterStatus_FocusLeaderUnit),
    PROC_YIELD,

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ChapterStatusScreen_FromPrep[] =
{
    PROC_YIELD,

    PROC_CALL(ChapterStatus_Init),
    PROC_CALL(ChapterStatus_DrawText),
    PROC_YIELD,

    PROC_CALL(ChapterStatus_ShowAllLayers),
    PROC_CALL(FadeInBlackSpeed40),
    PROC_YIELD,

PROC_LABEL(0),
    PROC_REPEAT(ChapterStatus_LoopKeyHandler),

PROC_LABEL(1),
    PROC_CALL(sub_8013F58),
    PROC_YIELD,

    PROC_CALL(EndMuralBackground),
    PROC_CALL(ChapterStatus_OnEnd),

    PROC_END,
};

u16 CONST_DATA Sprite_ChapterStatus_ChapterName[] =
{
    6,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(96), OAM2_CHR(0xC),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(128), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(160), OAM2_CHR(0x14),
};

// clang-format on

void StatusScreenSpriteDraw_Init(struct ChapterStatusProc * proc);
void StatusScreenSpriteDraw_Loop(struct ChapterStatusProc * proc);

// clang-format off

struct ProcCmd CONST_DATA ProcScr_StatusScreenSpriteDraw[] =
{
    PROC_YIELD,

    PROC_CALL(StatusScreenSpriteDraw_Init),
    PROC_REPEAT(StatusScreenSpriteDraw_Loop),

    PROC_END,
};

// clang-format on

extern struct HelpBoxInfo sHelpInfo_ChapterStatus_TurnCount;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_Funds;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_AllyUnits;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_EnemyUnits;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_Leader;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_TimePlayed;

// clang-format off

struct HelpBoxInfo sHelpInfo_ChapterStatus_Goal =
{
    &sHelpInfo_ChapterStatus_AllyUnits,
    &sHelpInfo_ChapterStatus_TurnCount,
    NULL,
    &sHelpInfo_ChapterStatus_Leader,
    36,
    68,
    MSG_6F1, // "The goal of this chapter.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_TurnCount =
{
    &sHelpInfo_ChapterStatus_Goal,
    &sHelpInfo_ChapterStatus_Funds,
    NULL,
    &sHelpInfo_ChapterStatus_TimePlayed,
    16,
    116,
    MSG_6F2, // "Number of turns played at this[NL]point in the current chapter.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_Funds =
{
    &sHelpInfo_ChapterStatus_TurnCount,
    &sHelpInfo_ChapterStatus_AllyUnits,
    NULL,
    &sHelpInfo_ChapterStatus_TimePlayed,
    16,
    132,
    MSG_6F3, // "Money on hand."
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_AllyUnits =
{
    &sHelpInfo_ChapterStatus_Funds,
    &sHelpInfo_ChapterStatus_Goal,
    NULL,
    &sHelpInfo_ChapterStatus_EnemyUnits,
    20,
    43,
    MSG_6ED, // "Number of allied units.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_EnemyUnits =
{
    &sHelpInfo_ChapterStatus_Funds,
    &sHelpInfo_ChapterStatus_Goal,
    &sHelpInfo_ChapterStatus_AllyUnits,
    &sHelpInfo_ChapterStatus_Leader,
    76,
    43,
    MSG_6EE, // "Number of enemy units."
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_Leader =
{
    &sHelpInfo_ChapterStatus_TimePlayed,
    &sHelpInfo_ChapterStatus_TimePlayed,
    &sHelpInfo_ChapterStatus_Goal,
    NULL,
    136,
    62,
    MSG_6EF, // "Name of the army commander.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_TimePlayed =
{
    &sHelpInfo_ChapterStatus_Leader,
    &sHelpInfo_ChapterStatus_Leader,
    &sHelpInfo_ChapterStatus_Funds,
    NULL,
    152,
    127,
    MSG_6F0, // "Total time played."
    NULL,
    NULL,
};

// clang-format on

//! FE8U = 0x0808DCAC
void StartChapterStatusHelpBox(ProcPtr proc)
{
    LoadHelpBoxGfx(OBJ_CHR_ADDR(0x280), 6);
    StartMovingHelpBox(&sHelpInfo_ChapterStatus_AllyUnits, proc);

    return;
}

//! FE8U = 0x0808DCD0
struct Unit * GetFirstValidBlueUnit_Unused(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        return unit;
    }

    return NULL;
}

//! FE8U = 0x0808DCF8
struct Unit * GetEnemyBossUnit(void)
{
    int i;

    struct Unit * unit = NULL;

    switch (gPlaySt.chapterIndex)
    {
    case CHAPTER_E_13:
        unit = GetUnitFromCharId(CHARACTER_AIAS);
        break;

    case CHAPTER_E_15:
        unit = GetUnitFromCharId(CHARACTER_VALTER);
        break;

    case CHAPTER_I_15:
        unit = GetUnitFromCharId(CHARACTER_CAELLACH);
        break;

    case CHAPTER_E_20:
    case CHAPTER_I_20:
        unit = GetUnitFromCharId(CHARACTER_MORVA);
        break;
    }

    if (unit != NULL)
    {
        return unit;
    }

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            continue;
        }

        return unit;
    }

    return NULL;
}

//! FE8U = 0x0808DDC0
int CountEnemyBossUnits(void)
{
    int count;
    int i;

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x0808DDF8
int CountUnitsByFaction(int faction)
{
    int count;
    int i;

    count = 0;

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & US_UNAVAILABLE)
        {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x0808DE38
void UpdateStatusFactionSelectorGlow(struct ChapterStatusProc * proc)
{
    u16 * palPtr;
    u16 base;
    int mod;

    base = Pal_08A2E8F0[0x2F];
    palPtr = &PAL_OBJ_COLOR(7, 14);

    mod = RED_VALUE(proc->timer >> 1);

    proc->timer++;

    if (mod > 16)
    {
        mod = 16 - (mod & 15);
    }

    if (proc->unitIndex != proc->unitIndexPrev)
    {
        proc->unitIndexPrev = proc->unitIndex;
        proc->timer = 0;
    }

    *palPtr = ((((base & RED_MASK) * (16 - mod)) >> 4) & RED_MASK) +
        ((((base & GREEN_MASK) * (16 - mod)) >> 4) & GREEN_MASK) +
        ((((base & BLUE_MASK) * (16 - mod)) >> 4) & BLUE_MASK);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x0808DEBC
const char * SplitObjectiveTextOnNewline(const char * str)
{
    if (str == NULL)
    {
        return NULL;
    }

    if (*str == CHFE_L_X)
    {
        return NULL;
    }

    while (true)
    {
        char c = *str;
        u32 width;

        if (c != CHFE_L_X)
        {
            if (c == CHFE_L_NL)
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

//! FE8U = 0x0808DEF0
void UpdateUnitSpritePal(bool isHidden)
{
    if (isHidden)
    {
        // If unit is under a roof or obscured by fog, use a fully-black palette
        CpuFastFill16(RGB_BLACK, PAL_OBJ(13), PLTT_SIZE_4BPP);
        EnablePaletteSync();
    }
    else
    {
        ApplyUnitSpritePalettes();
    }

    return;
}

//! FE8U = 0x0808DF24
void ChapterStatus_Init(struct ChapterStatusProc * proc)
{
    int i;

    SetupBackgrounds(NULL);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 2;

    ResetText();
    LoadUiFrameGraphics();

    proc->unk_3c = 0;
    proc->helpTextActive = false;
    proc->focusUnitOnExit = false;

    BG_SetPosition(BG_0, -2, -4);
    BG_SetPosition(BG_1, 0, -2);
    BG_SetPosition(BG_2, 0, -36);
    BG_SetPosition(BG_3, 0, 0);

    ClearBg0Bg1();

    ApplyPalettes(gUiFramePaletteA, 2, 3);
    Decompress(Img_08A2E5EC, BG_CHR_ADDR(0x2C0));

    Decompress(Tsa_ChapterStatusUi, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(0x0, 1));

    Decompress(Img_PlayStatusSprites, OBJ_CHR_ADDR(0x180));
    ApplyPalettes(Pal_PlayStatusSprites, 0x18, 2);

    Decompress(Img_ChapterStatusSelectorSprite, OBJ_CHR_ADDR(0x198));

    SetDefaultColorEffects();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->unk_2d = 0;
    proc->unitIndex = 0;
    proc->timer = 0;

    proc->units[0] = GetUnitFromCharId(GetPlayerLeaderUnitId());

    proc->numAllyUnits = CountUnitsByFaction(FACTION_BLUE);

    proc->timesCompleted = GetGlobalCompletionCount();

    if (proc->units[0]->state & US_UNSELECTABLE)
    {
        // Unit had already taken a turn, but we don't want to show them
        // greyed out in the status screen.
        proc->units[0]->state &= ~US_UNSELECTABLE;
        proc->restoreStateOnExit = true;
    }
    else
    {
        proc->restoreStateOnExit = false;
    }

    if (CountEnemyBossUnits() != 0)
    {
        proc->units[1] = GetEnemyBossUnit();
    }
    else
    {
        proc->units[1] = NULL;
    }

    proc->numEnemyUnits = CountUnitsByFaction(FACTION_RED);

    ApplyUnitSpritePalettes();

    for (i = 0; i < 2; i++)
    {
        if (proc->units[i] == NULL)
        {
            continue;
        }

        UseUnitSprite(GetUnitSMSId(proc->units[i]));
    }

    ForceSyncUnitSpriteSheet();

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 40, DISPLAY_WIDTH, 72);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    StartMuralBackground(proc, 0, 14);

    ApplyPalettes(Pal_CommGameBgScreenInShop, 14, 2);

    StartHelpPromptSprite(200, 18, 2, proc);

    Proc_Start(ProcScr_StatusScreenSpriteDraw, proc);

    SetDispEnable(0, 0, 0, 0, 0);

    return;
}

//! FE8U = 0x0808E19C
void DrawChapterStatusTextForUnit(struct Unit * unit)
{
    struct StatusScreenSt * ptr = &gStatusScreenSt;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 25, 9), 3, 3, 0);

    SetTextFont(&ptr->font);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    SpriteText_DrawBackgroundExt(&ptr->th, 0);

    if (unit != NULL)
    {
        if (unit->state & (US_UNDER_A_ROOF | US_BIT9))
        {
            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

            Text_SetCursor(&ptr->th, 130);
            Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

            Text_SetCursor(&ptr->th, 162);
            Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

            Text_SetCursor(&ptr->th, 186);
            Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

            UpdateUnitSpritePal(true);
        }
        else
        {
            char * str;

            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_WHITE);

            str = GetStringFromIndex(unit->pCharacterData->nameTextId);
            Text_SetCursor(&ptr->th, GetStringTextCenteredPos(48, str));
            Text_DrawString(&ptr->th, str);

            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

            Text_SetCursor(&ptr->th, 138);
            Text_DrawNumberOrBlank(&ptr->th, unit->level);

            if (GetUnitCurrentHp(unit) >= 100)
            {
                Text_SetCursor(&ptr->th, 162);
                Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));
            }
            else
            {
                Text_SetCursor(&ptr->th, 170);
                Text_DrawNumberOrBlank(&ptr->th, GetUnitCurrentHp(unit));
            }

            if (GetUnitMaxHp(unit) >= 100)
            {
                Text_SetCursor(&ptr->th, 186);
                Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));
            }
            else
            {
                Text_SetCursor(&ptr->th, 194);
                Text_DrawNumberOrBlank(&ptr->th, GetUnitMaxHp(unit));
            }

            PutFaceChibi(GetUnitMiniPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 25, 9), 0x280, 4, 0);

            UpdateUnitSpritePal(false);
        }
    }
    else
    {
        Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

        Text_SetCursor(&ptr->th, 130);
        Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

        Text_SetCursor(&ptr->th, 162);
        Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

        Text_SetCursor(&ptr->th, 186);
        Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));
    }

    Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_WHITE);

    Text_SetCursor(&ptr->th, 179);
    Text_DrawString(&ptr->th, GetStringFromIndex(MSG_539));

    SetTextFont(NULL);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendAlpha(13, 3);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}

//! FE8U = 0x0808E3D4
void ChapterStatus_ShowAllLayers(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x0808E3F4
void ChapterStatus_SetupFont(ProcPtr proc)
{
    ApplyPalette(Pal_Text, 0x1A);

    InitSpriteTextFont(&gStatusScreenSt.font, OBJ_CHR_ADDR(0x3C0), 0x1A);

    SetTextFont(&gStatusScreenSt.font);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    InitSpriteText(&gStatusScreenSt.th);

    SetTextFont(NULL);

    return;
}

//! FE8U = 0x0808E43C
void DrawChapterStatusStatValues(void)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 14), 15, 6, 0);

    // Draw turn number
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 14), TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);

    // Draw gold
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 16), TEXT_COLOR_SYSTEM_BLUE, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 16), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    // Draw LV
    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);

    // Draw HP
    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 11), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x0808E4AC
void ChapterStatus_DrawText(struct ChapterStatusProc * proc)
{
    const char * str;

    InitTextInitInfo(gTextInitInfo_ChapterStatus);

    ChapterStatus_SetupFont(proc);

    DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);

    PutNumber(TILEMAP_LOCATED(gBG1TilemapBuffer, 4, 5), TEXT_COLOR_SYSTEM_BLUE, proc->numAllyUnits);

    if (gPlaySt.chapterVisionRange != 0)
    {
        PutSpecialChar(TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH);
        PutSpecialChar(TILEMAP_LOCATED(gBG1TilemapBuffer, 12, 5), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumber(TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5), TEXT_COLOR_SYSTEM_BLUE, proc->numEnemyUnits);
    }

    proc->numObjectiveTextLines = 1;

    str = GetStringFromIndex(
        GetBattleMapKind() != 2
            ? GetROMChapterStruct(gPlaySt.chapterIndex)->statusObjectiveTextId
            : MSG_1C0 // "Defeat all monsters[.]"
    );

    Text_InsertDrawString(gChapterStatusText, GetStringTextCenteredPos(96, str), TEXT_COLOR_SYSTEM_WHITE, str);

    str = SplitObjectiveTextOnNewline(str);

    if (str != NULL)
    {
        Text_InsertDrawString(gChapterStatusText + 1, GetStringTextCenteredPos(96, str), TEXT_COLOR_SYSTEM_WHITE, str);
        proc->numObjectiveTextLines = 2;
    }

    if (proc->numObjectiveTextLines == 2)
    {
        PutText(gChapterStatusText + 0, TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 10));
        PutText(gChapterStatusText + 1, TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 12));
    }
    else
    {
        PutText(gChapterStatusText + 0, TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 11));
    }

    if (proc->timesCompleted != 0)
    {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
        {
            PutNumberOrBlank(
                TILEMAP_LOCATED(gBG0TilemapBuffer, 26, 0), TEXT_COLOR_SYSTEM_WHITE, proc->timesCompleted + 1);
        }
    }

    DrawChapterStatusStatValues();

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x0808E608
void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc * proc)
{
    int previous = proc->unitIndex;

    proc->helpTextActive = false;

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = true;
        StartChapterStatusHelpBox(proc);

        return;
    }
    else if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if ((proc->units[proc->unitIndex] != NULL) && !(proc->units[proc->unitIndex]->state & (US_UNDER_A_ROOF | US_BIT9)))
        {
            SetLastStatScreenUid(proc->units[proc->unitIndex]->index);
            proc->focusUnitOnExit = true;
        }

        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        Proc_Goto(proc, 1);

        return;
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && (proc->unitIndex != 0))
    {
        proc->unitIndex--;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && (proc->unitIndex == 0))
    {
        proc->unitIndex++;
    }

    if (proc->unitIndex != previous)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);
    }

    return;
}

//! FE8U = 0x0808E71C
void ChapterStatus_OnEnd(struct ChapterStatusProc * proc)
{
    Proc_EndEach(ProcScr_StatusScreenSpriteDraw);
    EndHelpPromptSprite();

    if (proc->restoreStateOnExit)
    {
        proc->units[0]->state |= US_UNSELECTABLE;
    }

    return;
}

//! FE8U = 0x0808E748
void ChapterStatus_FocusLeaderUnit(struct ChapterStatusProc * proc)
{
    if (proc->focusUnitOnExit)
    {
        Proc_StartBlocking(gProcScr_ADJUSTSFROMXI, proc);
    }

    return;
}

//! FE8U = 0x0808E764
void StartChapterStatusScreen(ProcPtr parent)
{
    struct ChapterStatusProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gProcScr_ChapterStatusScreen, parent);
        proc->unk_3f = 0;
    }
    else
    {
        proc = Proc_Start(gProcScr_ChapterStatusScreen, PROC_TREE_3);
        proc->unk_3f = 0;
    }

    return;
}

//! FE8U = 0x0808E79C
void StartChapterStatusScreen_FromPrep(ProcPtr parent)
{
    struct ChapterStatusProc * proc = Proc_StartBlocking(ProcScr_ChapterStatusScreen_FromPrep, parent);
    proc->unk_3f = 1;

    return;
}

//! FE8U = 0x0808E7B4
void StatusScreenSpriteDraw_Init(struct ChapterStatusProc * proc)
{
    LoadObjUIGfx();

    ApplyPalette(Pal_StatusScreenLabelSprites, 0x14);
    ApplyPalette(Pal_08A2E8F0, 0x17);

    Decompress(Img_StatusScreenLabelSprites, OBJ_CHR_ADDR(0x340));

    proc->unk_64 = 0;

    sub_80895B4(0x80, 0x13);
    PutChapterTitleGfx(0xB80, GetChapterTitleWM(&gPlaySt));

    return;
}

//! FE8U = 0x0808E818
void StatusScreenSpriteDraw_Loop(struct ChapterStatusProc * proc)
{
    int i;

    struct ChapterStatusProc * parent = proc->proc_parent;

    PutSprite(4, 4, 3, Sprite_ChapterStatus_ChapterBanner, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(8));
    PutSprite(4, 150, 124, Sprite_ChapterStatus_PlaytimeBanner, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(9));

    if (parent->unk_3f == 0)
    {
        PutSprite(4, 4, 11, Sprite_ChapterStatus_ChapterName, OAM2_CHR(0x380) + OAM2_LAYER(1) + OAM2_PAL(3));
    }

    // Draw rectangle around current selected faction
    PutSprite(
        4, parent->unitIndex * 56, 44, Sprite_ChapterStatus_FactionSelector, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(7));

    PutSprite(4, 8, 37, Sprite_ChapterStatus_PlayerLabel, 0);
    PutSprite(4, 64, 37, Sprite_ChapterStatus_EnemyLabel, 0);
    PutSprite(4, 18, 115, Sprite_ChapterStatus_TurnLabel, 0);
    PutSprite(4, 18, 131, Sprite_ChapterStatus_FundsLabel, 0);
    PutSprite(4, 28, 67, Sprite_ChapterStatus_ObjectiveLabel, 0);

    // Draw unit name
    for (i = 0; i < 2; i++)
    {
        PutSprite(4, 160 + (i * 32), 60, gObject_32x16, OAM2_CHR(0x3C0) + OAM2_PAL(10) + (i * 4));
    }

    // Draw unit level
    PutSprite(4, 180, 75, gObject_32x16, OAM2_CHR(0x3D0) + OAM2_PAL(10));

    // Draw unit HP
    for (i = 0; i < 2; i++)
    {
        PutSprite(4, 156 + (i * 32), 91, gObject_32x16, OAM2_CHR(0x3D4) + OAM2_PAL(10) + (i * 4));
    }

    PutTime(TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 16), TEXT_COLOR_SYSTEM_BLUE, GetGameClock(), 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    if (parent->units[parent->unitIndex] != NULL)
    {
        PutUnitSprite(4, 136, 61, parent->units[parent->unitIndex]);
    }

    SyncUnitSpriteSheet();

    if (parent->timesCompleted != 0)
    {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
        {
            PutSprite(4, 219, 3, Sprite_ChapterStatus_PlayCountLabel, 0);
        }
    }

    UpdateStatusFactionSelectorGlow(parent);

    return;
}
