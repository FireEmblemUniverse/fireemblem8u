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
                MSG_0A1,
                MSG_0BF,
                112,
                1
            },
            {
                MSG_0A2,
                MSG_0C0,
                127,
                1
            },
            {
                MSG_0A3,
                MSG_0BE,
                142,
                2
            },
            {
                MSG_0A4,
                MSG_0C7,
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
                MSG_0AB,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0AB,
                MSG_0BE,
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
                MSG_0AC,
                MSG_0CA,
                112,
                3
            },
            {
                MSG_0AD,
                MSG_0CB,
                143,
                4
            },
            {
                MSG_0AE,
                MSG_0BE,
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
                MSG_0B3,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0B3,
                MSG_0BE,
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
                MSG_0A7,
                MSG_0C3,
                112,
                3
            },
            {
                MSG_0A8,
                MSG_0C4,
                143,
                3
            },
            {
                MSG_0A9,
                MSG_0C5,
                174,
                3
            },
            {
                MSG_0AA,
                MSG_0C6,
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
                MSG_0A5,
                MSG_0C4,
                112,
                3
            },
            {
                MSG_0A6,
                MSG_0C5,
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
                MSG_0B5,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0B5,
                MSG_0BE,
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
                MSG_0B6,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0B6,
                MSG_0BE,
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
                MSG_0B7,
                MSG_0BF,
                112,
                1
            },
            {
                MSG_0B7,
                MSG_0C0,
                127,
                1
            },
            {
                MSG_0B7,
                MSG_0C1,
                142,
                1
            },
            {
                MSG_0B7,
                MSG_0C2,
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
                MSG_0B8,
                MSG_0BF,
                112,
                1
            },
            {
                MSG_0B8,
                MSG_0C0,
                127,
                1
            },
            {
                MSG_0B8,
                MSG_0C1,
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
                MSG_0AF,
                MSG_0C8,
                112,
                3
            },
            {
                MSG_0B0,
                MSG_0C9,
                143,
                3
            },
            {
                MSG_0B1,
                MSG_0BE,
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
                MSG_0B2,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0B2,
                MSG_0BE,
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
                MSG_0B4,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0B4,
                MSG_0BE,
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
                MSG_0B9,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0B9,
                MSG_0BE,
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
                MSG_0BA,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0BA,
                MSG_0BE,
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
                MSG_0BB,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0BB,
                MSG_0BE,
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
                MSG_0BC,
                MSG_0BD,
                112,
                2
            },
            {
                MSG_0BC,
                MSG_0BE,
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
    return gConfigUiState->unk_2a;
}

//! FE8U = 0x080B16DC
u8 GetSelectedOptionValue(void)
{
    return GetGameOption(gGameOptionsUiOrder[gConfigUiState->unk_2a]);
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

    ClearText(&gConfigUiState->unk_a8);

    str = GetStringFromIndex(
        gGameOptions[gGameOptionsUiOrder[gConfigUiState->unk_2a]].selectors[GetSelectedOptionValue()].helpTextId);
    PutDrawText(
        &gConfigUiState->unk_a8, TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 22, str);

    return;
}

//! FE8U = 0x080B17E4
void DrawGameOptionText(int selectedIdx, int textIdx, int y)
{
    const char * str;

    ClearText(&gConfigUiState->unk_38[textIdx]);

    str = GetStringFromIndex(gGameOptions[gGameOptionsUiOrder[selectedIdx]].msgId);
    PutDrawText(
        &gConfigUiState->unk_38[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 4, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);

    return;
}

//! FE8U: 0x080B1850
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y)
{
    int i;

    int optionIdx = gGameOptionsUiOrder[selectedIdx];

    int x = gGameOptions[optionIdx].selectors[0].xPos / 8;

    ClearText(&gConfigUiState->unk_70[textIdx]);

    for (i = 0; i < 4; i++)
    {
        if (gGameOptions[optionIdx].selectors[i].optionTextId == MSG_000)
        {
            break;
        }

        Text_InsertDrawString(
            &gConfigUiState->unk_70[textIdx], gGameOptions[optionIdx].selectors[i].xPos - 112,
            (i == GetGameOption(optionIdx)) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            GetStringFromIndex(gGameOptions[optionIdx].selectors[i].optionTextId));
    }

    PutText(&gConfigUiState->unk_70[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, x, y));

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

    int optionIdx = gGameOptionsUiOrder[gConfigUiState->unk_2a];

    u8 time = (GetGameClock() % 16) & 8;

    CallARM_PushToSecondaryOAM(18, 8, gSprite_ConfigurationUiHeader, OAM2_CHR(0xC0) + OAM2_PAL(2));

    // current option position on screen (cur index - top index)
    y = (gConfigUiState->unk_2a - gConfigUiState->unk_2c) * 16 + 40;

    DisplayFrozenUiHand(16, y);

    DisplayUiHand(gGameOptions[optionIdx].selectors[GetGameOption(optionIdx)].xPos - 2, y);

    if (((gConfigUiState->unk_37 & 1) == 0) || (PrepGetDeployedUnitAmt() != 0))
    {
        if ((GetSelectedGameOption() == GAME_OPTION_ANIMATION) && (GetSelectedOptionValue() == 3))
        {
            CallARM_PushToSecondaryOAM(192, 40, gObject_16x16, (time != 0) ? OAM2_CHR(0xCE) + OAM2_PAL(2) : OAM2_CHR(0xCC) + OAM2_PAL(2));
        }
    }

    UpdateMenuScrollBarConfig(10, gConfigUiState->unk_2e, gConfigUiState->unk_34, 6);

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
    gConfigUiState->unk_34 = 13;
    gConfigUiState->unk_2a = 0;
    gConfigUiState->unk_2c = 0;
    gConfigUiState->unk_2e = 0;

    proc->unk_30 = 0;
    proc->unk_36 = 0;

    gConfigUiState->unk_37 &= ~1;
    gConfigUiState->unk_37 &= ~2;

    ResetText();

    sub_80156BC();

    LoadUiFrameGraphics();

    SetDispEnable(1, 1, 1, 1, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, gConfigUiState->unk_2e);
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

    ApplyPalette(gUnknown_08A07A98, 4);
    ApplyPalette(gUnknown_08A07A98, 18);

    Decompress(gUnknown_08A0733C, OBJ_CHR_ADDR(0xC0));
    Decompress(gUnknown_08A0754C, BG_CHR_ADDR(0x200));

    Decompress(gUnknown_08A079B4, gGenericBuffer + 0x80);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x80, TILEREF(0x0, 1));

    ResetTextFont();

    InitText(&gConfigUiState->unk_a8, 22);

    DrawGameOptionHelpText();

    StartMenuScrollBarExt(proc, 224, 47, 0x390 * CHR_SIZE, 1);

    InitText(&gConfigUiState->unk_68, 9);
    InitText(&gConfigUiState->unk_a0, 14);

    for (; i < 6; i++)
    {
        int y = (i * 2) + 5;

        DrawGameOptionIcon(i, 5);

        InitText(&gConfigUiState->unk_38[i], 9);
        InitText(&gConfigUiState->unk_70[i], 14);

        DrawGameOptionText(i, i, y);
        DrawOptionValueTexts(i, i, y);
    }

    StartMuralBackgroundExt(proc, NULL, 18, 2, 0);

    Proc_Start(gProcScr_DrawConfigUiSprites, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080B1C90
s8 WindowColorOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) != 0)
        UnpackUiFrameBuffered(-1);

    return false;
}

//! FE8U: 0x080B1CAC
s8 MusicOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) == 0)
        return false;

    if (GetGameOption(gGameOptionsUiOrder[gConfigUiState->unk_2a]) != 0)
    {
        sub_8002AC8();
        return false;
    }

    if ((gConfigUiState->unk_37 & 1) != 0)
    {
        StartBgm(SONG_34, NULL);
        return false;
    }

    if ((gConfigUiState->unk_37 & 2) != 0)
        sub_80B9FC0();
    else
        StartMapSongBgm();

    return false;
}

//! FE8U: 0x080B1D14
s8 GenericOptionChangeHandler(ProcPtr proc)
{
    int valueChanged = false;

    int selectedIdx = gConfigUiState->unk_2a;
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
            PlaySoundEffect(SONG_67);
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
void sub_80B2188(ProcPtr proc, int selectedIdx, int c)
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
    s8 valueChanged = 0;

    switch (proc->unk_30)
    {
    case 0:
        if (gKeyStatusPtr->newKeys & (B_BUTTON))
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Break(proc);

            break;
        }
        else if (gKeyStatusPtr->newKeys & (A_BUTTON))
        {
            if (((gConfigUiState->unk_37 & 1) != 0) && (PrepGetDeployedUnitAmt() == 0))
            {
                break;
            }

            if (gGameOptionsUiOrder[gConfigUiState->unk_2a] != 0)
            {
                break;
            }

            if (GetGameOption(GAME_OPTION_ANIMATION) != 3)
            {
                break;
            }

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            proc->unk_36 = 1;
            Proc_Break(proc);

            break;
        }
        else if (gKeyStatusPtr->repeatedKeys & (DPAD_UP | DPAD_DOWN))
        {
            if (gKeyStatusPtr->repeatedKeys & (DPAD_UP))
            {
                if (gConfigUiState->unk_2a != 0)
                {
                    gConfigUiState->unk_2a--;

                    if ((gConfigUiState->unk_2a - gConfigUiState->unk_2c < 1) && (gConfigUiState->unk_2c != 0))
                    {
                        gConfigUiState->unk_2c--;

                        sub_80B2188(proc, gConfigUiState->unk_2a - 1, 0);

                        gConfigUiState->unk_2e -= 4;

                        proc->unk_30 = 1;
                    }

                    valueChanged = 1;
                }
            }
            else // if (gKeyStatusPtr->repeatedKeys & (DPAD_DOWN))
            {
                if (gConfigUiState->unk_2a < gConfigUiState->unk_34 - 1)
                {
                    gConfigUiState->unk_2a++;

                    if ((gConfigUiState->unk_2a - gConfigUiState->unk_2c > 4) &&
                        (gConfigUiState->unk_2a < gConfigUiState->unk_34 - 1))
                    {
                        gConfigUiState->unk_2c++;

                        sub_80B2188(proc, gConfigUiState->unk_2a + 1, 0x140);

                        gConfigUiState->unk_2e += 4;

                        proc->unk_30 = 4;
                    }

                    valueChanged = 1;
                }
            }

            if (valueChanged != 0)
            {
                Proc_Start(gProcScr_RedrawConfigHelpText, proc);
                BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

                break;
            }
        }

        if (gKeyStatusPtr->newKeys & (DPAD_LEFT | DPAD_RIGHT))
        {
            if (gGameOptions[gGameOptionsUiOrder[gConfigUiState->unk_2a]].func != NULL)
            {
                gGameOptions[gGameOptionsUiOrder[gConfigUiState->unk_2a]].func(proc);
            }
        }

        break;

    case 1:
    case 2:
    case 3:
        gConfigUiState->unk_2e -= 4;

        if (proc->unk_30 == 3)
        {
            proc->unk_30 = 0;
        }
        else
        {
            proc->unk_30++;
        }

        break;

    case 4:
    case 5:
    case 6:
        gConfigUiState->unk_2e += 4;

        if (proc->unk_30 == 6)
        {
            proc->unk_30 = 0;
        }
        else
        {
            proc->unk_30++;
        }

        break;
    }

    BG_SetPosition(BG_1, 0, gConfigUiState->unk_2e);

    return;
}

//! FE8U: 0x080B2464
s8 sub_80B2464(struct ConfigProc * proc)
{
    EndMenuScrollBar();
    EndMuralBackground();

    Proc_EndEach(gProcScr_DrawConfigUiSprites);
    Proc_EndEach(gProcScr_RedrawConfigHelpText);

    if (proc->unk_36 != 0)
    {
        StartUnitListScreenForSoloAnim(proc);
        Proc_Goto(proc, 0);

        return false;
    }

    return true;
}

static inline s8 * GetConfigUnk37()
{
    return &gConfigUiState->unk_37;
}

//! FE8U: 0x080B24AC
void sub_80B24AC(void)
{
    s8 * flag = GetConfigUnk37();
    *flag |= 1;
    return;
}

//! FE8U: 0x080B24C0
void sub_80B24C0(void)
{
    s8 * flag = GetConfigUnk37();
    *flag |= 2;
    ResetUnitSprites();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_Config1[] =
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
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack),

    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Config2[] =
{
    PROC_NAME("E_config"),

    PROC_CALL(LockGame),

PROC_LABEL(0),
    PROC_YIELD,

    PROC_CALL(Config_Init),
    PROC_CALL(sub_80B24AC),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(Config_Loop_KeyHandler),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_Config3[] =
{
    PROC_NAME("E_config"),

    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_YIELD,

    PROC_CALL(Config_Init),
    PROC_CALL(sub_80B24C0),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_REPEAT(Config_Loop_KeyHandler),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(UnlockGame),

    PROC_END,
};

// clang-format on
