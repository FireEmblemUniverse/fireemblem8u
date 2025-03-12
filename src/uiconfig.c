#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmshop.h"
#include "uiutils.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "statscreen.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "unitlistscreen.h"
#include "uiconfig.h"
#include "sysutil.h"

#include "constants/msg.h"
#include "constants/songs.h"

struct ConfigScreen * CONST_DATA gConfigUiState = (struct ConfigScreen *)gGenericBuffer;

u8 CONST_DATA gGameOptionsUiOrder[] =
{
    [ 0] = GAME_OPTION_ANIMATION,
    [ 1] = GAME_OPTION_GAME_SPEED,
    [ 2] = GAME_OPTION_TEXT_SPEED,
    [ 3] = GAME_OPTION_TERRAIN,
    [ 4] = GAME_OPTION_UNIT,
    [ 5] = GAME_OPTION_COMBAT,
    [ 6] = GAME_OPTION_OBJECTIVE,
    [ 7] = GAME_OPTION_SUBTITLE_HELP,
    [ 8] = GAME_OPTION_AUTOCURSOR,
    [ 9] = GAME_OPTION_AUTOEND_TURNS,
    [10] = GAME_OPTION_MUSIC,
    [11] = GAME_OPTION_SOUND_EFFECTS,
    [12] = GAME_OPTION_WINDOW_COLOR,
};

// clang-format off

u16 CONST_DATA gSprite_ConfigurationUiHeader[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
};

struct GameOption CONST_DATA gGameOptions[] =
{
    [GAME_OPTION_ANIMATION] =
    {
        .msgId = MSG_090, // Animation[.]
        .selectors =
        {
            {
                MSG_0A1, // "Show animation without backgrounds"
                MSG_0BF, // "1[.]"
                112,
                1
            },
            {
                MSG_0A2, // "Show animation with backgrounds[.]"
                MSG_0C0, // "2[.]"
                127,
                1
            },
            {
                MSG_0A3, // "Turn combat animation off[.]"
                MSG_0BE, // "OFF[.]"
                142,
                2
            },
            {
                MSG_0A4, // "Set animation for each unit manually"
                MSG_0C7, // "Solo"
                165,
                2
            },
        },
        .icon = 0x0,
        .func = GenericOptionChangeHandler
    },

    [GAME_OPTION_TERRAIN] =
    {
        .msgId = MSG_091, // Terrain[.]
        .selectors =
        {
            {
                MSG_0AB, // "Turn Terrain window on or off[.]"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0AB, // "Turn Terrain window on or off[.]"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x02,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_UNIT] =
    {
        .msgId = MSG_092, // Unit
        .selectors =
        {
            {
                MSG_0AC, // "Show normal unit window[.]"
                MSG_0CA, // "Panel[.]"
                112,
                3
            },
            {
                MSG_0AD, // "Show unit window with tail"
                MSG_0CB, // "Burst[.]"
                143,
                4
            },
            {
                MSG_0AE, // "Turn unit window off"
                MSG_0BE, // "OFF[.]"
                182,
                2
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x04,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_AUTOCURSOR] =
    {
        .msgId = MSG_095, // Autocursor
        .selectors =
        {
            {
                MSG_0B3, // "Set cursor to start on main hero"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0B3, // "Set cursor to start on main hero"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x06,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_TEXT_SPEED] =
    {
        .msgId = MSG_096, // Text Speed
        .selectors = {
            {
                MSG_0A7, // "Set message speed (slow)"
                MSG_0C3, // "Slow"
                112,
                3
            },
            {
                MSG_0A8, // "Set message speed[.]"
                MSG_0C4, // "Norm"
                143,
                3
            },
            {
                MSG_0A9, // "Set message speed (fast)"
                MSG_0C5, // "Fast"
                174,
                3
            },
            {
                MSG_0AA, // "Set message speed (autoscroll)"
                MSG_0C6, // "Max[.]"
                205,
                2
            },
        },
        .icon = 0x08,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_GAME_SPEED] =
    {
        .msgId = MSG_097, // Game Speed
        .selectors =
        {
            {
                MSG_0A5, // "Set unit movement speed[.]"
                MSG_0C4, // "Norm"
                112,
                3
            },
            {
                MSG_0A6, // "Set unit movement speed (fast)"
                MSG_0C5, // "Fast"
                143,
                3
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x0a,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_MUSIC] =
    {
        .msgId = MSG_098, // Music[.]
        .selectors =
        {
            {
                MSG_0B5, // "Turn music on or off"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0B5, // "Turn music on or off"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x0c,
        .func = MusicOptionChangeHandler,
    },

    [GAME_OPTION_SOUND_EFFECTS] =
    {
        .msgId = MSG_099, // Sound Effects[.],
        .selectors =
        {
            {
                MSG_0B6, // "Turn sound effects on or off"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0B6, // "Turn sound effects on or off"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x0e,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_WINDOW_COLOR] =
    {
        .msgId = MSG_09A, // Window Color
        .selectors =
        {
            {
                MSG_0B7, // "Change window color[.]"
                MSG_0BF, // "1[.]"
                112,
                1
            },
            {
                MSG_0B7, // "Change window color[.]"
                MSG_0C0, // "2[.]"
                127,
                1
            },
            {
                MSG_0B7, // "Change window color[.]"
                MSG_0C1, // "3[.]"
                142,
                1
            },
            {
                MSG_0B7, // "Change window color[.]"
                MSG_0C2, // "4[.]"
                157,
                1
            },
        },
        .icon = 0x10,
        .func = WindowColorOptionChangeHandler,
    },

    [GAME_OPTION_CPU_LEVEL] =
    {
        .msgId = MSG_09B, // CPU Level[.]
        .selectors = {
            {
                MSG_0B8, // "Set enemy AI"
                MSG_0BF, // "1[.]"
                112,
                1
            },
            {
                MSG_0B8, // "Set enemy AI"
                MSG_0C0, // "2[.]"
                127,
                1
            },
            {
                MSG_0B8, // "Set enemy AI"
                MSG_0C1, // "3[.]"
                142,
                1
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x12,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_COMBAT] =
    {
        .msgId = MSG_093, // Combat
        .selectors = {
            {
                MSG_0AF, // "Show basic Combat Info window[.]"
                MSG_0C8, // "Strat[.]"
                112,
                3
            },
            {
                MSG_0B0, // "Show detailed Combat Info window"
                MSG_0C9, // "Detail"
                143,
                3
            },
            {
                MSG_0B1, // "Turn Combat Info window off[.]"
                MSG_0BE, // "OFF[.]"
                182,
                2
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x14,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_SUBTITLE_HELP] =
    {
        .msgId = MSG_094, // Subtitle Help[.]
        .selectors =
        {
            {
                MSG_0B2, // "Set Easy/Help Scroll display"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0B2, // "Set Easy/Help Scroll display"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x16,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_AUTOEND_TURNS] =
    {
        .msgId = MSG_09C, // Autoend Turns[.]
        .selectors =
        {
            {
                MSG_0B4, // "Set turn to end automatically[.]"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0B4, // "Set turn to end automatically[.]"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x18,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_UNIT_COLOR] =
    {
        .msgId = MSG_09D, // Unit Color
        .selectors =
        {
            {
                MSG_0B9, // "Set colors for individual units[.]"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0B9, // "Set colors for individual units[.]"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x1a,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_OBJECTIVE] =
    {
        .msgId = MSG_09E, // Show Objective
        .selectors =
        {
            {
                MSG_0BA, // "Turn Chapter Goal display on or off[.]"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0BA, // "Turn Chapter Goal display on or off[.]"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x1c,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_CONTROLLER] =
    {
        .msgId = MSG_09F, // Controller
        .selectors =
        {
            {
                MSG_0BB, // "Set Control Window display"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0BB, // "Set Control Window display"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x1e,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_RANK_DISPLAY] =
    {
        .msgId = MSG_0A0, // Rank Display
        .selectors =
        {
            {
                MSG_0BC, // "Rank Display"
                MSG_0BD, // "ON"
                112,
                2
            },
            {
                MSG_0BC, // "Rank Display"
                MSG_0BE, // "OFF[.]"
                135,
                2
            },
            {
                MSG_000,
                MSG_000,
                190,
                0
            },
            {
                MSG_000,
                MSG_000,
                189,
                0
            },
        },
        .icon = 0x20,
        .func = GenericOptionChangeHandler,
    }
};

struct ProcCmd CONST_DATA gProcScr_RedrawConfigHelpText[] =
{
    PROC_NAME("E_CfExplReWrite"),

    PROC_SLEEP(1),
    PROC_CALL(DrawGameOptionHelpText),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_DrawConfigUiSprites[] =
{
    PROC_NAME("E_cfObj"),

    PROC_CALL(ConfigSprites_Init),

PROC_LABEL(0),
    PROC_CALL(DrawConfigUiSprites),
    PROC_YIELD,

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

//! FE8U: 0x080B169C
// Unused in FE8; appears to be leftover from FE7
s16 sub_80B169C(void)
{
    int unk = gConfigUiState->unk_32;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
        return unk;

    return unk + 3;
}

//! FE8U = 0x080B16CC
u8 GetSelectedGameOption(void)
{
    return gConfigUiState->selectedOptionIdx;
}

//! FE8U = 0x080B16DC
u8 GetSelectedOptionValue(void)
{
    return GetGameOption(gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]);
}

static inline int GetGameOptionIconChr(int icon)
{
    return 0x200
        + (icon & 0x1f)
        + ((icon << 1) & 0xFFC0);
}

//! FE8U: 0x080B1700
void DrawGameOptionIcon(int selectedIdx, int yBase)
{
    int y = 0x20 * ((selectedIdx * 2 + yBase) & 0x1f);

    int icon = gGameOptions[gGameOptionsUiOrder[selectedIdx]].icon;
    int chr = GetGameOptionIconChr(icon);

    // Variable reuse seems to be required to match
    icon = TILEREF(chr, 4);

    gBG1TilemapBuffer[TILEMAP_INDEX(2, 0) + y] = icon + 0;
    gBG1TilemapBuffer[TILEMAP_INDEX(3, 0) + y] = icon + 1;
    gBG1TilemapBuffer[TILEMAP_INDEX(2, 1) + y] = icon + 0x20;
    gBG1TilemapBuffer[TILEMAP_INDEX(3, 1) + y] = icon + 0x21;

    return;
}

//! FE8U: 0x080B1784
void DrawGameOptionHelpText(void)
{
    const char * str;

    ClearText(&gConfigUiState->optionHelpText);

    str = GetStringFromIndex(
        gGameOptions[gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]].selectors[GetSelectedOptionValue()].helpTextId);
    PutDrawText(
        &gConfigUiState->optionHelpText, TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 22, str);

    return;
}

//! FE8U = 0x080B17E4
void DrawGameOptionText(int selectedIdx, int textIdx, int y)
{
    const char * str;

    ClearText(&gConfigUiState->optionTexts[textIdx]);

    str = GetStringFromIndex(gGameOptions[gGameOptionsUiOrder[selectedIdx]].msgId);
    PutDrawText(
        &gConfigUiState->optionTexts[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 4, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);

    return;
}

//! FE8U: 0x080B1850
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y)
{
    int i;

    int optionIdx = gGameOptionsUiOrder[selectedIdx];

    int x = gGameOptions[optionIdx].selectors[0].xPos / 8;

    ClearText(&gConfigUiState->valueTexts[textIdx]);

    for (i = 0; i < 4; i++)
    {
        if (gGameOptions[optionIdx].selectors[i].optionTextId == MSG_000)
        {
            break;
        }

        Text_InsertDrawString(
            &gConfigUiState->valueTexts[textIdx], gGameOptions[optionIdx].selectors[i].xPos - 112,
            (i == GetGameOption(optionIdx)) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            GetStringFromIndex(gGameOptions[optionIdx].selectors[i].optionTextId));
    }

    PutText(&gConfigUiState->valueTexts[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, x, y));

    return;
}

//! FE8U: 0x080B1920
void ConfigSprites_Init(void)
{
    LoadIconPalette(1, 18);
    UnpackUiVArrowGfx(0x80, 3);
    return;
}

//! FE8U = 0x080B1938
void DrawConfigUiSprites(void)
{
    int y;

    int optionIdx = gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx];

    u8 time = (GetGameClock() % 16) & 8;

    CallARM_PushToSecondaryOAM(18, 8, gSprite_ConfigurationUiHeader, OAM2_CHR(0xC0) + OAM2_PAL(2));

    // current option position on screen (cur index - top index)
    y = (gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx) * 16 + 40;

    DisplayFrozenUiHand(16, y);

    DisplayUiHand(gGameOptions[optionIdx].selectors[GetGameOption(optionIdx)].xPos - 2, y);

    if (!(gConfigUiState->source & CONFIG_UI_SOURCE_FROMPREP) || (PrepGetDeployedUnitAmt() != 0))
    {
        if ((GetSelectedGameOption() == GAME_OPTION_ANIMATION) && (GetSelectedOptionValue() == 3))
        {
            // Draw sprite for blinking "A Press" prompt
            CallARM_PushToSecondaryOAM(192, 40, gObject_16x16, (time != 0) ? OAM2_CHR(0xCE) + OAM2_PAL(2) : OAM2_CHR(0xCC) + OAM2_PAL(2));
        }
    }

    UpdateMenuScrollBarConfig(10, gConfigUiState->bg1YOffset, gConfigUiState->maxOption, 6);

    return;
}

//! FE8U = 0x080B1A08
void Config_Init(struct ConfigProc * proc)
{
    int i;

    // clang-format off
    u16 bgConfig[12] =
    {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x0000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };
    // clang-format on

    i = 0;

    SetupBackgrounds(bgConfig);

    gConfigUiState->unk_32 = 0;
    gConfigUiState->maxOption = ARRAY_COUNT(gGameOptionsUiOrder);
    gConfigUiState->selectedOptionIdx = 0;
    gConfigUiState->headOptionIdx = 0;
    gConfigUiState->bg1YOffset = 0;

    proc->moving = CONFIG_MOVE_NONE;
    proc->loadSoloAnimScreen = false;

    gConfigUiState->source &= ~CONFIG_UI_SOURCE_FROMPREP;
    gConfigUiState->source &= ~CONFIG_UI_SOURCE_FROMWM;

    ResetText();

    ApplySystemObjectsPalettes();
    LoadUiFrameGraphics();

    SetDispEnable(1, 1, 1, 1, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, gConfigUiState->bg1YOffset);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 40, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    SetBlendAlpha(14, 4);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    ApplyPalette(Pal_ConfigUiSprites, 4);
    ApplyPalette(Pal_ConfigUiSprites, 18);

    Decompress(Img_ConfigUiSprites, OBJ_CHR_ADDR(0xC0));
    Decompress(Img_ConfigUiIcons, BG_CHR_ADDR(0x200));

    Decompress(Tsa_ConfigUiFrame, gGenericBuffer + 0x80);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x80, TILEREF(0x0, 1));

    ResetTextFont();

    InitText(&gConfigUiState->optionHelpText, 22);

    DrawGameOptionHelpText();

    StartMenuScrollBarExt(proc, 224, 47, 0x390 * CHR_SIZE, 1);

    InitText(&gConfigUiState->text_68, 9);
    InitText(&gConfigUiState->text_a0, 14);

    for (; i < 6; i++)
    {
        int y = (i * 2) + 5;

        DrawGameOptionIcon(i, 5);

        InitText(&gConfigUiState->optionTexts[i], 9);
        InitText(&gConfigUiState->valueTexts[i], 14);

        DrawGameOptionText(i, i, y);
        DrawOptionValueTexts(i, i, y);
    }

    StartMuralBackgroundExt(proc, NULL, 18, 2, 0);

    Proc_Start(gProcScr_DrawConfigUiSprites, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080B1C90
bool WindowColorOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) != 0)
        UnpackUiFrameBuffered(-1);

    return false;
}

//! FE8U: 0x080B1CAC
bool MusicOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) == 0)
        return false;

    if (GetGameOption(gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]) != 0)
    {
        sub_8002AC8();
        return false;
    }

    if (gConfigUiState->source & CONFIG_UI_SOURCE_FROMPREP)
    {
        StartBgm(SONG_BGM_SELECT, NULL);
        return false;
    }

    if (gConfigUiState->source & CONFIG_UI_SOURCE_FROMWM)
        UpdateWorldMapBgm();
    else
        StartMapSongBgm();

    return false;
}

//! FE8U: 0x080B1D14
bool GenericOptionChangeHandler(ProcPtr proc)
{
    int valueChanged = false;

    int selectedIdx = gConfigUiState->selectedOptionIdx;
    u8 optionIdx = gGameOptionsUiOrder[selectedIdx];

    u8 selectedValue = GetSelectedOptionValue();

    if (gKeyStatusPtr->repeatedKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        if (gKeyStatusPtr->repeatedKeys & (DPAD_LEFT))
        {
            if (selectedValue != 0)
            {
                selectedValue--;
                SetGameOption(optionIdx, selectedValue);

                valueChanged = true;
            }
        }
        else // if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT))
        {
            if (gGameOptions[optionIdx].selectors[selectedValue + 1].optionTextId != 0)
            {
                if (selectedValue < 3)
                {
                    selectedValue++;
                    SetGameOption(optionIdx, selectedValue);

                    valueChanged = true;
                }
            }
        }

        if (valueChanged)
        {
            Proc_Start(gProcScr_RedrawConfigHelpText, proc);
            DrawOptionValueTexts(selectedIdx, selectedIdx % 7, selectedIdx * 2 + 5);
            BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        }
    }

    return valueChanged;
}

//! FE8U: 0x080B1DE8
u8 GetGameOption(u8 index)
{
    int value = 0;

    switch (index)
    {
    case GAME_OPTION_ANIMATION:
        switch (gPlaySt.config.animationType)
        {
        case PLAY_ANIMCONF_ON:
            return 0;
        case PLAY_ANIMCONF_ON_UNIQUE_BG:
            return 1;
        case PLAY_ANIMCONF_OFF:
            return 2;
        case PLAY_ANIMCONF_SOLO_ANIM:
            return 3;
        }

        // fallthrough

    case GAME_OPTION_TERRAIN:
        value = gPlaySt.config.disableTerrainDisplay;

        break;

    case GAME_OPTION_UNIT:
        value = gPlaySt.config.unitDisplayType;

        break;

    case GAME_OPTION_AUTOCURSOR:
        value = gPlaySt.config.autoCursor;

        break;

    case GAME_OPTION_TEXT_SPEED:
        value = gPlaySt.config.textSpeed;

        break;

    case GAME_OPTION_GAME_SPEED:
        value = gPlaySt.config.gameSpeed;

        break;

    case GAME_OPTION_MUSIC:
        value = gPlaySt.config.disableBgm;

        break;

    case GAME_OPTION_SOUND_EFFECTS:
        value = gPlaySt.config.disableSoundEffects;

        break;

    case GAME_OPTION_WINDOW_COLOR:
        value = gPlaySt.config.windowColor;

        break;

    case GAME_OPTION_COMBAT:
        value = gPlaySt.config.battleForecastType;

        break;

    case GAME_OPTION_SUBTITLE_HELP:
        value = gPlaySt.config.noSubtitleHelp;

        break;

    case GAME_OPTION_AUTOEND_TURNS:
        value = gPlaySt.config.disableAutoEndTurns;

        break;

    case GAME_OPTION_UNIT_COLOR:
        value = gPlaySt.config.unitColor;

        break;

    case GAME_OPTION_OBJECTIVE:
        value = gPlaySt.config.disableGoalDisplay;

        break;

    case GAME_OPTION_CONTROLLER:
        value = gPlaySt.config.controller;

        break;

    case GAME_OPTION_RANK_DISPLAY:
        value = gPlaySt.config.rankDisplay;

        break;
    }

    return value;
}

//! FE8U: 0x080B1F64
void SetGameOption(u8 index, u8 newValue)
{
    switch (index)
    {
    case GAME_OPTION_ANIMATION:
        switch (newValue)
        {
        case 0:
            gPlaySt.config.animationType = PLAY_ANIMCONF_ON;
            return;

        case 1:
            gPlaySt.config.animationType = PLAY_ANIMCONF_ON_UNIQUE_BG;
            return;

        case 2:
            gPlaySt.config.animationType = PLAY_ANIMCONF_OFF;
            return;

        case 3:
            gPlaySt.config.animationType = PLAY_ANIMCONF_SOLO_ANIM;
            return;
        }

        // fallthrough

    case GAME_OPTION_TERRAIN:
        gPlaySt.config.disableTerrainDisplay = newValue;

        break;

    case GAME_OPTION_UNIT:
        gPlaySt.config.unitDisplayType = newValue;

        break;

    case GAME_OPTION_AUTOCURSOR:
        gPlaySt.config.autoCursor = newValue;

        break;

    case GAME_OPTION_TEXT_SPEED:
        gPlaySt.config.textSpeed = newValue;

        break;

    case GAME_OPTION_GAME_SPEED:
        gPlaySt.config.gameSpeed = newValue;

        break;

    case GAME_OPTION_MUSIC:
        gPlaySt.config.disableBgm = newValue;

        break;

    case GAME_OPTION_SOUND_EFFECTS:
        gPlaySt.config.disableSoundEffects = newValue;

        break;

    case GAME_OPTION_WINDOW_COLOR:
        gPlaySt.config.windowColor = newValue;

        break;

    case GAME_OPTION_COMBAT:
        gPlaySt.config.battleForecastType = newValue;

        break;

    case GAME_OPTION_SUBTITLE_HELP:
        gPlaySt.config.noSubtitleHelp = newValue;

        break;

    case GAME_OPTION_AUTOEND_TURNS:
        gPlaySt.config.disableAutoEndTurns = newValue;

        break;

    case GAME_OPTION_UNIT_COLOR:
        gPlaySt.config.unitColor = newValue;

        break;

    case GAME_OPTION_OBJECTIVE:
        gPlaySt.config.disableGoalDisplay = newValue;

        break;

    case GAME_OPTION_CONTROLLER:
        gPlaySt.config.controller = newValue;

        break;

    case GAME_OPTION_RANK_DISPLAY:
        gPlaySt.config.rankDisplay = newValue;

        break;
    }

    return;
}

//! FE8U: 0x080B2188
void PutGameOptionRow(ProcPtr proc, int selectedIdx, int c)
{
    int i;
    int textIdx;

    int y = ((selectedIdx * 2) + 5) & 0x1f;

    int yTmp = 0x20 * y;

    for (i = 0; i <= 26; i++)
    {
        gBG1TilemapBuffer[yTmp + 0x02 + i] = 0;
        gBG1TilemapBuffer[yTmp + 0x22 + i] = 0;
    }

    textIdx = selectedIdx % 7;

    DrawGameOptionIcon(selectedIdx, 5);
    DrawGameOptionText(selectedIdx, textIdx, y);
    DrawOptionValueTexts(selectedIdx, textIdx, y);

    for (i = 0; i <= 26; i++)
    {
        gBG0TilemapBuffer[c + 0x62 + i] = 0;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U: 0x080B220C
void Config_Loop_KeyHandler(struct ConfigProc * proc)
{
    bool valueChanged = false;

    switch (proc->moving)
    {
    case CONFIG_MOVE_NONE:
        if (gKeyStatusPtr->newKeys & (B_BUTTON))
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Break(proc);

            break;
        }
        else if (gKeyStatusPtr->newKeys & (A_BUTTON))
        {
            if ((gConfigUiState->source & CONFIG_UI_SOURCE_FROMPREP) && (PrepGetDeployedUnitAmt() == 0))
            {
                break;
            }

            if (gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx] != 0)
            {
                break;
            }

            if (GetGameOption(GAME_OPTION_ANIMATION) != 3)
            {
                break;
            }

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            proc->loadSoloAnimScreen = true;
            Proc_Break(proc);

            break;
        }
        else if (gKeyStatusPtr->repeatedKeys & (DPAD_UP | DPAD_DOWN))
        {
            if (gKeyStatusPtr->repeatedKeys & (DPAD_UP))
            {
                if (gConfigUiState->selectedOptionIdx != 0)
                {
                    gConfigUiState->selectedOptionIdx--;

                    if ((gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx < 1) && (gConfigUiState->headOptionIdx != 0))
                    {
                        gConfigUiState->headOptionIdx--;

                        PutGameOptionRow(proc, gConfigUiState->selectedOptionIdx - 1, 0);

                        gConfigUiState->bg1YOffset -= 4;
                        proc->moving = CONFIG_MOVE_UP;
                    }

                    valueChanged = true;
                }
            }
            else // if (gKeyStatusPtr->repeatedKeys & (DPAD_DOWN))
            {
                if (gConfigUiState->selectedOptionIdx < gConfigUiState->maxOption - 1)
                {
                    gConfigUiState->selectedOptionIdx++;

                    if ((gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx > 4) &&
                        (gConfigUiState->selectedOptionIdx < gConfigUiState->maxOption - 1))
                    {
                        gConfigUiState->headOptionIdx++;

                        PutGameOptionRow(proc, gConfigUiState->selectedOptionIdx + 1, 320);

                        gConfigUiState->bg1YOffset += 4;
                        proc->moving = CONFIG_MOVE_DOWN;
                    }

                    valueChanged = true;
                }
            }

            if (valueChanged)
            {
                Proc_Start(gProcScr_RedrawConfigHelpText, proc);
                BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

                break;
            }
        }

        if (gKeyStatusPtr->newKeys & (DPAD_LEFT | DPAD_RIGHT))
        {
            if (gGameOptions[gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]].func != NULL)
            {
                gGameOptions[gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]].func(proc);
            }
        }

        break;

    case CONFIG_MOVE_UP:
    case CONFIG_MOVE_UP_FRAME_2:
    case CONFIG_MOVE_UP_FRAME_3:
        // Moving up (duration of 3 frames)

        gConfigUiState->bg1YOffset -= 4;

        if (proc->moving == CONFIG_MOVE_UP_FRAME_3)
        {
            proc->moving = CONFIG_MOVE_NONE;
        }
        else
        {
            proc->moving++;
        }

        break;

    case CONFIG_MOVE_DOWN:
    case CONFIG_MOVE_DOWN_FRAME_2:
    case CONFIG_MOVE_DOWN_FRAME_3:
        // Moving down (duration of 3 frames)

        gConfigUiState->bg1YOffset += 4;

        if (proc->moving == CONFIG_MOVE_DOWN_FRAME_3)
        {
            proc->moving = CONFIG_MOVE_NONE;
        }
        else
        {
            proc->moving++;
        }

        break;
    }

    BG_SetPosition(BG_1, 0, gConfigUiState->bg1YOffset);

    return;
}

//! FE8U: 0x080B2464
bool Config_HandleExit(struct ConfigProc * proc)
{
    EndMenuScrollBar();
    EndMuralBackground();

    Proc_EndEach(gProcScr_DrawConfigUiSprites);
    Proc_EndEach(gProcScr_RedrawConfigHelpText);

    if (proc->loadSoloAnimScreen)
    {
        // Load the Solo Anim unit list and reposition
        // this proc to reload after it ends
        StartUnitListScreenForSoloAnim(proc);
        Proc_Goto(proc, 0);

        return false;
    }

    // Exit the config UI
    return true;
}

static inline s8 * GetConfigSource()
{
    return &gConfigUiState->source;
}

//! FE8U: 0x080B24AC
void Config_SetSourceFromPrep(void)
{
    s8 * source = GetConfigSource();
    *source |= CONFIG_UI_SOURCE_FROMPREP;
    return;
}

//! FE8U: 0x080B24C0
void Config_SetSourceFromWorldMap(void)
{
    s8 * source = GetConfigSource();
    *source |= CONFIG_UI_SOURCE_FROMWM;
    ResetUnitSprites();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_Config_Field[] =
{
    PROC_NAME("E_config"),

    PROC_CALL(LockGame),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_YIELD,

    PROC_CALL(Config_Init),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(Config_Loop_KeyHandler),
    PROC_CALL(StartFastFadeToBlack),

    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(Config_HandleExit),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack),

    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Config_PrepMapMenu[] =
{
    PROC_NAME("E_config"),

    PROC_CALL(LockGame),

PROC_LABEL(0),
    PROC_YIELD,

    PROC_CALL(Config_Init),
    PROC_CALL(Config_SetSourceFromPrep),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(Config_Loop_KeyHandler),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(Config_HandleExit),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Config_WorldMap[] =
{
    PROC_NAME("E_config"),

    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_YIELD,

    PROC_CALL(Config_Init),
    PROC_CALL(Config_SetSourceFromWorldMap),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_REPEAT(Config_Loop_KeyHandler),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(Config_HandleExit),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(UnlockGame),

    PROC_END,
};

// clang-format on
