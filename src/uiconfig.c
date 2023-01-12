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

#include "uiconfig.h"

struct Selector {
    /* 00 */ u16 helpTextId;
    /* 02 */ u16 optionTextId;
    /* 04 */ u8 xPos;
    /* 05 */ u8 unk_05;
};

struct GameOption {
    /* 00 */ u16 msgId;
    /* 04 */ struct Selector selectors[4];
    /* 24 */ u8 icon;
    /* 28 */ s8 (*func)(ProcPtr);
};

struct ConfigScreen {
    /* 00 */ u8 _pad[0x2A-0x00];
    /* 2A */ s16 unk_2a; // current index
    /* 2C */ s16 unk_2c; // top of menu index
    /* 2E */ u16 unk_2e; // ? maybe offset on current bg?
    /* 30 */ u16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u8 unk_36;
    /* 37 */ s8 unk_37; // some flags / state var
    /* 38 */ struct TextHandle unk_38[6]; // size: 0x30

    /* 68 */ struct TextHandle unk_68;
    /* 70 */ struct TextHandle unk_70[6];

    /* A0 */ struct TextHandle unk_a0;
    /* A8 */ struct TextHandle unk_a8;
};

struct ConfigProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad1[0x30-0x29];

    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;

    /* 36 */ u8 unk_36;
};

struct ConfigScreen* CONST_DATA gConfigUiState = (struct ConfigScreen*) gGenericBuffer;

u8 CONST_DATA gGameOptionsUiOrder[] = {
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

u16 CONST_DATA gSprite_ConfigurationUiHeader[] = {
    3,
    0x4000, 0x8000, 0x0000,
    0x4000, 0x8020, 0x0004,
    0x4000, 0x8040, 0x0008,
};

s8 WindowColorOptionChangeHandler(ProcPtr proc);
s8 MusicOptionChangeHandler(ProcPtr proc);
s8 GenericOptionChangeHandler(ProcPtr);

struct GameOption CONST_DATA gGameOptions[] = {
    [GAME_OPTION_ANIMATION] = {
        .msgId = 0x90, // Animation[.]
        .selectors = {
            { 0xa1, 0xbf, 0x70, 1 },
            { 0xa2, 0xc0, 0x7f, 1 },
            { 0xa3, 0xbe, 0x8e, 2 },
            { 0xa4, 0xc7, 0xa5, 2 },
        },
        .icon = 0x0,
        .func = GenericOptionChangeHandler
    },

    [GAME_OPTION_TERRAIN] = {
        .msgId = 0x91, // Terrain[.]
        .selectors = {
            { 0xab, 0xbd, 0x70, 2 },
            { 0xab, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x02,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_UNIT] = {
        .msgId = 0x92, // Unit
        .selectors = {
            { 0xac, 0xca, 0x70, 3 },
            { 0xad, 0xcb, 0x8f, 4 },
            { 0xae, 0xbe, 0xb6, 2 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x04,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_AUTOCURSOR] = {
        .msgId = 0x95, // Autocursor
        .selectors = {
            { 0xb3, 0xbd, 0x70, 2 },
            { 0xb3, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x06,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_TEXT_SPEED] = {
        .msgId = 0x96, // Text Speed
        .selectors = {
            { 0xa7, 0xc3, 0x70, 3 },
            { 0xa8, 0xc4, 0x8f, 3 },
            { 0xa9, 0xc5, 0xae, 3 },
            { 0xaa, 0xc6, 0xcd, 2 },
        },
        .icon = 0x08,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_GAME_SPEED] = {
        .msgId = 0x97, // Game Speed
        .selectors = {
            { 0xa5, 0xc4, 0x70, 3 },
            { 0xa6, 0xc5, 0x8f, 3 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x0a,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_MUSIC] =  {
        .msgId = 0x98, // Music[.]
        .selectors = {
            { 0xb5, 0xbd, 0x70, 2 },
            { 0xb5, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x0c,
        .func = MusicOptionChangeHandler,
    },

    [GAME_OPTION_SOUND_EFFECTS] = {
        .msgId = 0x99, // Sound Effects[.],
        .selectors = {
            { 0xb6, 0xbd, 0x70, 2 },
            { 0xb6, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x0e,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_WINDOW_COLOR] = {
        .msgId = 0x9a, // Window Color
        .selectors = {
            { 0xb7, 0xbf, 0x70, 1 },
            { 0xb7, 0xc0, 0x7f, 1 },
            { 0xb7, 0xc1, 0x8e, 1 },
            { 0xb7, 0xc2, 0x9d, 1 },
        },
        .icon = 0x10,
        .func = WindowColorOptionChangeHandler,
    },

    [GAME_OPTION_CPU_LEVEL] = {
        .msgId = 0x9b, // CPU Level[.]
        .selectors = {
            { 0xb8, 0xbf, 0x70, 1 },
            { 0xb8, 0xc0, 0x7f, 1 },
            { 0xb8, 0xc1, 0x8e, 1 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x12,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_COMBAT] = {
        .msgId = 0x93, // Combat
        .selectors = {
            { 0xaf, 0xc8, 0x70, 3 },
            { 0xb0, 0xc9, 0x8f, 3 },
            { 0xb1, 0xbe, 0xb6, 2 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x14,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_SUBTITLE_HELP] = {
        .msgId = 0x94, // Subtitle Help[.]
        .selectors = {
            { 0xb2, 0xbd, 0x70, 2 },
            { 0xb2, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x16,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_AUTOEND_TURNS] = {
        .msgId = 0x9c, // Autoend Turns[.]
        .selectors = {
            { 0xb4, 0xbd, 0x70, 2 },
            { 0xb4, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x18,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_UNIT_COLOR] = {
        .msgId = 0x9d, // Unit Color
        .selectors = {
            { 0xb9, 0xbd, 0x70, 2 },
            { 0xb9, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x1a,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_OBJECTIVE] = {
        .msgId = 0x9e, // Show Objective
        .selectors = {
            { 0xba, 0xbd, 0x70, 2 },
            { 0xba, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x1c,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_CONTROLLER] = {
        .msgId = 0x9f, // Controller
        .selectors = {
            { 0xbb, 0xbd, 0x70, 2 },
            { 0xbb, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x1e,
        .func = GenericOptionChangeHandler,
    },

    [GAME_OPTION_RANK_DISPLAY] = {
        .msgId = 0xa0, // Rank Display
        .selectors = {
            { 0xbc, 0xbd, 0x70, 2 },
            { 0xbc, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x20,
        .func = GenericOptionChangeHandler,
    }
};

void DrawGameOptionHelpText(void);

struct ProcCmd CONST_DATA gProcScr_RedrawConfigHelpText[] = {
    PROC_NAME("E_CfExplReWrite"),

    PROC_SLEEP(1),
    PROC_CALL(DrawGameOptionHelpText),

    PROC_END,
};

void ConfigSprites_Init(void);
void DrawConfigUiSprites(void);

struct ProcCmd CONST_DATA gProcScr_DrawConfigUiSprites[] = {
    PROC_NAME("E_cfObj"),

    PROC_CALL(ConfigSprites_Init),

PROC_LABEL(0),
    PROC_CALL(DrawConfigUiSprites),
    PROC_SLEEP(0),

    PROC_GOTO(0),

    PROC_END,
};

extern u16 gUnknown_08A07A98[]; // pal
extern u8 gUnknown_08A0733C[]; // gfx
extern u8 gUnknown_08A0754C[]; // gfx
extern u8 gUnknown_08A079B4[]; // tsa

u8 GetGameOption(u8);
void SetGameOption(u8, u8);

//! FE8U: 0x080B169C
s16 sub_80B169C(void) {
    int unk = gConfigUiState->unk_32;

    if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT)) {
        return unk;
    }

    return unk + 3;
}

//! FE8U = 0x080B16CC
u8 GetSelectedGameOption(void) {
    return gConfigUiState->unk_2a;
}

//! FE8U = 0x080B16DC
u8 GetSelectedOptionValue(void) {
    return GetGameOption(gGameOptionsUiOrder[gConfigUiState->unk_2a]);
}

//! FE8U: 0x080B1700
void DrawGameOptionIcon(int a, int b) {
    int tmpA;
    int tmpB;
    int tmpC;
    int tmpE;

    tmpC = (a * 2 + b) & 0x1f;
    tmpE = 0x20 * tmpC;

    tmpA = gGameOptions[gGameOptionsUiOrder[a]].icon;
    tmpB = (tmpA & 0x1f) + ({ (((tmpA) << 1) & 0xFFC0) + 0x200; });

    tmpA = tmpB + 0x4000;
    gBG1TilemapBuffer[tmpE + 0x02] = tmpA;
    gBG1TilemapBuffer[tmpE + 0x03] = tmpB + 0x4001;

    gBG1TilemapBuffer[tmpE + 0x22] = tmpB + 0x4020;
    gBG1TilemapBuffer[tmpE + 0x23] = tmpB + 0x4021;

    return;
}

//! FE8U: 0x080B1784
void DrawGameOptionHelpText(void) {
    const char* str;

    Text_Clear(&gConfigUiState->unk_a8);

    str = GetStringFromIndex(gGameOptions[gGameOptionsUiOrder[gConfigUiState->unk_2a]].selectors[GetSelectedOptionValue()].helpTextId);

    DrawTextInline(&gConfigUiState->unk_a8, gBG0TilemapBuffer + 0x244, 0, 0, 22, str);

    return;
}

//! FE8U = 0x080B17E4
void DrawGameOptionText(int selectedIdx, int textIdx, int y) {
    const char* str;

    Text_Clear(&gConfigUiState->unk_38[textIdx]);

    str = GetStringFromIndex(gGameOptions[gGameOptionsUiOrder[selectedIdx]].msgId);

    DrawTextInline(&gConfigUiState->unk_38[textIdx], gBG1TilemapBuffer + 4 + y * 0x20, 0, 0, 9, str);

    return;
}

//! FE8U: 0x080B1850
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y) {
    int i;

    int optionIdx = gGameOptionsUiOrder[selectedIdx];

    int x = gGameOptions[optionIdx].selectors[0].xPos / 8;

    Text_Clear(&gConfigUiState->unk_70[textIdx]);

    for (i = 0; i < 4; i++) {

        if (gGameOptions[optionIdx].selectors[i].optionTextId == 0) {
            break;
        }

        Text_InsertString(
            &gConfigUiState->unk_70[textIdx],
            gGameOptions[optionIdx].selectors[i].xPos - 0x70,
            (i == GetGameOption(optionIdx)) ? 2 : 1,
            GetStringFromIndex(gGameOptions[optionIdx].selectors[i].optionTextId)
        );

    }

    Text_Draw(&gConfigUiState->unk_70[textIdx], gBG1TilemapBuffer + (y * 0x20 + (x)));

    return;
}

//! FE8U: 0x080B1920
void ConfigSprites_Init(void) {
    LoadIconPalette(1, 0x12);
    UnpackUiVArrowGfx(0x80, 3);
    return;
}

//! FE8U = 0x080B1938
void DrawConfigUiSprites(void) {
    int y;

    int optionIdx = gGameOptionsUiOrder[gConfigUiState->unk_2a];

    u8 time = (GetGameClock() % 16) & 8;

    CallARM_PushToSecondaryOAM(18, 8, gSprite_ConfigurationUiHeader, 0x20C0);

    // current option position on screen (cur index - top index)
    y = (gConfigUiState->unk_2a - gConfigUiState->unk_2c) * 16 + 40;

    DisplayFrozenUiHand(16, y);

    DisplayUiHand(gGameOptions[optionIdx].selectors[GetGameOption(optionIdx)].xPos - 2, y);

    if (((gConfigUiState->unk_37 & 1) == 0) || (PrepGetDeployedUnitAmt() != 0)) {
        if ((GetSelectedGameOption() == GAME_OPTION_ANIMATION) && (GetSelectedOptionValue() == 3)) {
            CallARM_PushToSecondaryOAM(192, 40, gObject_16x16, (time  != 0) ? 0x20CC + 2 : 0x20CC);
        }
    }

    sub_80976CC(10, gConfigUiState->unk_2e, (u16)gConfigUiState->unk_34, 6);

    return;
}

//! FE8U = 0x080B1A08
void Config_Init(struct ConfigProc* proc) {
    int i;

    u16 bgConfig[12] = {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x0000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };

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

    Font_InitForUIDefault();

    sub_80156BC();

    LoadUiFrameGraphics();

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, gConfigUiState->unk_2e);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 136;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    SetSpecialColorEffectsParameters(1, 14, 4, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    CopyToPaletteBuffer(gUnknown_08A07A98, 0x80, 0x20);
    CopyToPaletteBuffer(gUnknown_08A07A98, 0x240, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A0733C, (void*)0x06011800);
    CopyDataWithPossibleUncomp(gUnknown_08A0754C, (void*)0x06004000);

    CopyDataWithPossibleUncomp(gUnknown_08A079B4, gGenericBuffer + 0x80);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x80, 0x1000);

    Font_ResetAllocation();

    Text_Init(&gConfigUiState->unk_a8, 22);

    DrawGameOptionHelpText();

    sub_8097748(proc, 224, 47, 0x7200, 1);

    Text_Init(&gConfigUiState->unk_68, 9);
    Text_Init(&gConfigUiState->unk_a0, 14);


    for (; i < 6; i++) {
        int y = (i * 2) + 5;

        DrawGameOptionIcon(i, 5);

        Text_Init(&gConfigUiState->unk_38[i], 9);
        Text_Init(&gConfigUiState->unk_70[i], 14);

        DrawGameOptionText(i, i, y);
        DrawOptionValueTexts(i, i, y);
    }

    sub_8086CE8(proc, 0, 18, 2, 0);

    Proc_Start(gProcScr_DrawConfigUiSprites, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080B1C90
s8 WindowColorOptionChangeHandler(ProcPtr proc) {

    if (GenericOptionChangeHandler(proc) != 0) {
        UnpackUiFrameBuffered(-1);
    }

    return 0;
}

//! FE8U: 0x080B1CAC
s8 MusicOptionChangeHandler(ProcPtr proc) {

    if (GenericOptionChangeHandler(proc) == 0) {
        return 0;
    }

    if (GetGameOption(gGameOptionsUiOrder[gConfigUiState->unk_2a]) != 0) {
        sub_8002AC8();
        return 0;
    }

    if ((gConfigUiState->unk_37 & 1) != 0) {
        Sound_PlaySong80024D4(0x34, 0);
        return 0;
    }

    if ((gConfigUiState->unk_37 & 2) != 0) {
        sub_80B9FC0();
    } else {
        StartMapSongBgm();
    }

    return 0;
}

//! FE8U: 0x080B1D14
s8 GenericOptionChangeHandler(ProcPtr proc) {

    int valueChanged = 0;

    int selectedIdx = gConfigUiState->unk_2a;
    u8 optionIdx = gGameOptionsUiOrder[selectedIdx];

    u8 selectedValue = GetSelectedOptionValue();

    if (gKeyStatusPtr->repeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {

        if (gKeyStatusPtr->repeatedKeys & (DPAD_LEFT)) {
            if (selectedValue != 0) {
                selectedValue--;
                SetGameOption(optionIdx, selectedValue);

                valueChanged = 1;
            }
        } else { // if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT))
            if (gGameOptions[optionIdx].selectors[selectedValue+1].optionTextId != 0) {
                if (selectedValue < 3) {
                    selectedValue++;
                    SetGameOption(optionIdx, selectedValue);

                    valueChanged = 1;
                }
            }
        }

        if (valueChanged != 0) {

            Proc_Start(gProcScr_RedrawConfigHelpText, proc);

            DrawOptionValueTexts(selectedIdx, selectedIdx % 7, selectedIdx * 2 + 5);

            BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

            PlaySoundEffect(0x67);
        }
    }

    return valueChanged;
}

//! FE8U: 0x080B1DE8
u8 GetGameOption(u8 index) {
    int value = 0;

    switch (index) {
        case GAME_OPTION_ANIMATION:
            switch (gRAMChapterData.cfgAnimationType) {
                case 0:
                    return 0;
                case 3:
                    return 1;
                case 1:
                    return 2;
                case 2:
                    return 3;
            }

            // fallthrough

        case GAME_OPTION_TERRAIN:
            value = gRAMChapterData.cfgDisableTerrainDisplay;

            break;

        case GAME_OPTION_UNIT:
            value = gRAMChapterData.cfgUnitDisplayType;

            break;

        case GAME_OPTION_AUTOCURSOR:
            value = gRAMChapterData.cfgAutoCursor;

            break;

        case GAME_OPTION_TEXT_SPEED:
            value = gRAMChapterData.cfgTextSpeed;

            break;

        case GAME_OPTION_GAME_SPEED:
            value = gRAMChapterData.cfgGameSpeed;

            break;

        case GAME_OPTION_MUSIC:
            value = gRAMChapterData.cfgDisableBgm;

            break;

        case GAME_OPTION_SOUND_EFFECTS:
            value = gRAMChapterData.cfgDisableSoundEffects;

            break;

        case GAME_OPTION_WINDOW_COLOR:
            value = gRAMChapterData.cfgWindowColor;

            break;

        case GAME_OPTION_COMBAT:
            value = gRAMChapterData.cfgBattleForecastType;

            break;

        case GAME_OPTION_SUBTITLE_HELP:
            value = gRAMChapterData.cfgNoSubtitleHelp;

            break;

        case GAME_OPTION_AUTOEND_TURNS:
            value = gRAMChapterData.cfgDisableAutoEndTurns;

            break;

        case GAME_OPTION_UNIT_COLOR:
            value = gRAMChapterData.cfgUnitColor;

            break;

        case GAME_OPTION_OBJECTIVE:
            value = gRAMChapterData.cfgDisableGoalDisplay;

            break;

        case GAME_OPTION_CONTROLLER:
            value = gRAMChapterData.cfgController;

            break;

        case GAME_OPTION_RANK_DISPLAY:
            value = gRAMChapterData.cfgRankDisplay;

            break;

    }

    return value;
}

//! FE8U: 0x080B1F64
void SetGameOption(u8 index, u8 newValue) {

    switch (index) {
        case GAME_OPTION_ANIMATION:
            switch (newValue) {
                case 0:
                    gRAMChapterData.cfgAnimationType = 0;
                    return;

                case 1:
                    gRAMChapterData.cfgAnimationType = 3;
                    return;

                case 2:
                    gRAMChapterData.cfgAnimationType = 1;
                    return;

                case 3:
                    gRAMChapterData.cfgAnimationType = 2;
                    return;
            }

            // fallthrough

        case GAME_OPTION_TERRAIN:
            gRAMChapterData.cfgDisableTerrainDisplay = newValue;

            break;

        case GAME_OPTION_UNIT:
            gRAMChapterData.cfgUnitDisplayType = newValue;

            break;

        case GAME_OPTION_AUTOCURSOR:
            gRAMChapterData.cfgAutoCursor = newValue;

            break;

        case GAME_OPTION_TEXT_SPEED:
            gRAMChapterData.cfgTextSpeed = newValue;

            break;

        case GAME_OPTION_GAME_SPEED:
            gRAMChapterData.cfgGameSpeed = newValue;

            break;

        case GAME_OPTION_MUSIC:
            gRAMChapterData.cfgDisableBgm = newValue;

            break;

        case GAME_OPTION_SOUND_EFFECTS:
            gRAMChapterData.cfgDisableSoundEffects = newValue;

            break;

        case GAME_OPTION_WINDOW_COLOR:
            gRAMChapterData.cfgWindowColor = newValue;

            break;

        case GAME_OPTION_COMBAT:
            gRAMChapterData.cfgBattleForecastType = newValue;

            break;

        case GAME_OPTION_SUBTITLE_HELP:
            gRAMChapterData.cfgNoSubtitleHelp = newValue;

            break;

        case GAME_OPTION_AUTOEND_TURNS:
            gRAMChapterData.cfgDisableAutoEndTurns = newValue;

            break;

        case GAME_OPTION_UNIT_COLOR:
            gRAMChapterData.cfgUnitColor = newValue;

            break;

        case GAME_OPTION_OBJECTIVE:
            gRAMChapterData.cfgDisableGoalDisplay = newValue;

            break;

        case GAME_OPTION_CONTROLLER:
            gRAMChapterData.cfgController = newValue;

            break;

        case GAME_OPTION_RANK_DISPLAY:
            gRAMChapterData.cfgRankDisplay = newValue;

            break;

    }

    return;
}

//! FE8U: 0x080B2188
void sub_80B2188(ProcPtr proc, int selectedIdx, int c) {
    int i;
    int textIdx;

    int y = ((selectedIdx * 2) + 5) & 0x1f;

    int yTmp = 0x20 * y;

    for (i = 0; i <= 0x1a; i++) {
        gBG1TilemapBuffer[yTmp + 0x02 + i] = 0;
        gBG1TilemapBuffer[yTmp + 0x22 + i] = 0;
    }

    textIdx = selectedIdx % 7;

    DrawGameOptionIcon(selectedIdx, 5);
    DrawGameOptionText(selectedIdx, textIdx, y);
    DrawOptionValueTexts(selectedIdx, textIdx, y);

    for (i = 0; i <= 0x1a; i++) {
        gBG0TilemapBuffer[c + 0x62 + i] = 0;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U: 0x080B220C
void Config_Loop_KeyHandler(struct ConfigProc* proc) {
    s8 valueChanged = 0;

    switch (proc->unk_30) {
        case 0:
            if (gKeyStatusPtr->newKeys & (B_BUTTON)) {
                PlaySoundEffect(0x6B);

                Proc_Break(proc);

                break;

            } else if (gKeyStatusPtr->newKeys & (A_BUTTON)) {
                if (((gConfigUiState->unk_37 & 1) != 0) && (PrepGetDeployedUnitAmt() == 0)) {
                    break;
                }

                if (gGameOptionsUiOrder[gConfigUiState->unk_2a] != 0) {
                    break;
                }

                if (GetGameOption(0) != 3) {
                    break;
                }

                PlaySoundEffect(0x6A);

                proc->unk_36 = 1;

                Proc_Break(proc);

                break;

            } else if (gKeyStatusPtr->repeatedKeys & (DPAD_UP | DPAD_DOWN)) {
                if (gKeyStatusPtr->repeatedKeys & (DPAD_UP)) {

                    if (gConfigUiState->unk_2a != 0) {
                        gConfigUiState->unk_2a--;

                        if ((gConfigUiState->unk_2a - gConfigUiState->unk_2c < 1)
                            && (gConfigUiState->unk_2c != 0)) {
                            gConfigUiState->unk_2c--;

                            sub_80B2188(proc, gConfigUiState->unk_2a - 1, 0);

                            gConfigUiState->unk_2e -= 4;

                            proc->unk_30 = 1;

                        }

                        valueChanged = 1;

                    }

                } else { // if (gKeyStatusPtr->repeatedKeys & (DPAD_DOWN))

                    if (gConfigUiState->unk_2a < gConfigUiState->unk_34 - 1) {
                        gConfigUiState->unk_2a++;

                        if ((gConfigUiState->unk_2a - gConfigUiState->unk_2c > 4)
                            && (gConfigUiState->unk_2a < gConfigUiState->unk_34 - 1)) {
                            gConfigUiState->unk_2c++;

                            sub_80B2188(proc, gConfigUiState->unk_2a + 1, 0x140);

                            gConfigUiState->unk_2e += 4;

                            proc->unk_30 = 4;

                        }

                        valueChanged = 1;
                    }
                }

                if (valueChanged != 0) {

                    Proc_Start(gProcScr_RedrawConfigHelpText, proc);

                    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

                    PlaySoundEffect(0x66);

                    break;
                }
            }

            if (gKeyStatusPtr->newKeys & (DPAD_LEFT | DPAD_RIGHT)) {

                if (gGameOptions[gGameOptionsUiOrder[gConfigUiState->unk_2a]].func != 0) {
                    gGameOptions[gGameOptionsUiOrder[gConfigUiState->unk_2a]].func(proc);
                }

            }

            break;

        case 1:
        case 2:
        case 3:

            gConfigUiState->unk_2e -= 4;

            if (proc->unk_30 == 3) {
                proc->unk_30 = 0;
            } else {
                proc->unk_30++;
            }

            break;

        case 4:
        case 5:
        case 6:

            gConfigUiState->unk_2e += 4;

            if (proc->unk_30 == 6) {
                proc->unk_30 = 0;
            } else {
                proc->unk_30++;
            }

            break;
    }

    BG_SetPosition(1, 0, gConfigUiState->unk_2e);

    return;
}

//! FE8U: 0x080B2464
s8 sub_80B2464(struct ConfigProc* proc) {
    Delete6CMenuScroll();

    EndBG3Slider();

    Proc_EndEach(gProcScr_DrawConfigUiSprites);
    Proc_EndEach(gProcScr_RedrawConfigHelpText);

    if (proc->unk_36 != 0) {
        sub_8092134(proc);
        Proc_Goto(proc, 0);

        return 0;
    }

    return 1;
}

static inline s8* GetConfigUnk37() {
    return &gConfigUiState->unk_37;
}

//! FE8U: 0x080B24AC
void sub_80B24AC(void) {
    s8* flag = GetConfigUnk37();
    *flag |= 1;
    return;
}

//! FE8U: 0x080B24C0
void sub_80B24C0(void) {
    s8* flag = GetConfigUnk37();
    *flag |= 2;
    ResetUnitSprites();

    return;
}

struct ProcCmd CONST_DATA gProcScr_Config1[] = {
    PROC_NAME("E_config"),

    PROC_CALL(AddSkipThread2),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(Config_Init),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(Config_Loop_KeyHandler),
    PROC_CALL(sub_8013D80),

    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(sub_8013DA4),

    PROC_REPEAT(WaitForFade),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_Config2[] = {
    PROC_NAME("E_config"),

    PROC_CALL(AddSkipThread2),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(Config_Init),
    PROC_CALL(sub_80B24AC),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(Config_Loop_KeyHandler),

    PROC_CALL(sub_8013D80),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_Config3[] = {
    PROC_NAME("E_config"),

    PROC_CALL(AddSkipThread2),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(Config_Init),
    PROC_CALL(sub_80B24C0),

    PROC_CALL(sub_8013DA4),
    PROC_REPEAT(WaitForFade),

    PROC_REPEAT(Config_Loop_KeyHandler),

    PROC_CALL(sub_8013D80),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};
