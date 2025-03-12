#ifndef GUARD_UI_CONFIG_H
#define GUARD_UI_CONFIG_H

struct Selector
{
    /* 00 */ u16 helpTextId;
    /* 02 */ u16 optionTextId;
    /* 04 */ u8 xPos;
    /* 05 */ u8 unk_05;
    STRUCT_PAD(0x06, 0x08);
};

struct GameOption
{
    /* 00 */ u16 msgId;
    /* 04 */ struct Selector selectors[4];
    /* 24 */ u8 icon;
    /* 28 */ bool (*func)(ProcPtr);
};

struct ConfigScreen
{
    /* 00 */ STRUCT_PAD(0x00, 0x2A);
    /* 2A */ s16 selectedOptionIdx;
    /* 2C */ s16 headOptionIdx; // option index at the top of the menu
    /* 2E */ u16 bg1YOffset;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 unk_32; // unused in FE8; appears to be leftover from FE7
    /* 34 */ s16 maxOption;
    /* 36 */ STRUCT_PAD(0x36, 0x37);
    /* 37 */ s8 source;
    /* 38 */ struct Text optionTexts[6];

    /* 68 */ struct Text text_68; // initialized but unused
    /* 70 */ struct Text valueTexts[6];

    /* A0 */ struct Text text_a0; // initialized but unused
    /* A8 */ struct Text optionHelpText;
};

struct ConfigProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);

    /* 30 */ s16 moving;
    /* 32 */ STRUCT_PAD(0x32, 0x36);
    /* 36 */ u8 loadSoloAnimScreen;
};

enum
{
    GAME_OPTION_ANIMATION      =  0,
    GAME_OPTION_TERRAIN        =  1,
    GAME_OPTION_UNIT           =  2,
    GAME_OPTION_AUTOCURSOR     =  3,
    GAME_OPTION_TEXT_SPEED     =  4,
    GAME_OPTION_GAME_SPEED     =  5,
    GAME_OPTION_MUSIC          =  6,
    GAME_OPTION_SOUND_EFFECTS  =  7,
    GAME_OPTION_WINDOW_COLOR   =  8,
    GAME_OPTION_CPU_LEVEL      =  9,
    GAME_OPTION_COMBAT         = 10,
    GAME_OPTION_SUBTITLE_HELP  = 11,
    GAME_OPTION_AUTOEND_TURNS  = 12,
    GAME_OPTION_UNIT_COLOR     = 13,
    GAME_OPTION_OBJECTIVE      = 14,
    GAME_OPTION_CONTROLLER     = 15,
    GAME_OPTION_RANK_DISPLAY   = 16,
};

enum
{
    CONFIG_UI_SOURCE_FROMPREP = (1 << 0),
    CONFIG_UI_SOURCE_FROMWM = (1 << 1),
};

enum
{
    CONFIG_MOVE_NONE = 0,

    CONFIG_MOVE_UP = 1,
    CONFIG_MOVE_UP_FRAME_2 = CONFIG_MOVE_UP + 1,
    CONFIG_MOVE_UP_FRAME_3 = CONFIG_MOVE_UP + 2,

    CONFIG_MOVE_DOWN = 4,
    CONFIG_MOVE_DOWN_FRAME_2 = CONFIG_MOVE_DOWN + 1,
    CONFIG_MOVE_DOWN_FRAME_3 = CONFIG_MOVE_DOWN + 2,
};

s16 sub_80B169C(void);
u8 GetSelectedGameOption(void);
u8 GetSelectedOptionValue(void);
void DrawGameOptionIcon(int selectedIdx, int yBase);
void DrawGameOptionHelpText(void);
void DrawGameOptionText(int selectedIdx, int textIdx, int y);
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y);
void ConfigSprites_Init(void);
void DrawConfigUiSprites(void);
void Config_Init(struct ConfigProc * proc);
bool WindowColorOptionChangeHandler(ProcPtr proc);
bool MusicOptionChangeHandler(ProcPtr proc);
bool GenericOptionChangeHandler(ProcPtr proc);
u8 GetGameOption(u8 index);
void SetGameOption(u8 index, u8 newValue);
void PutGameOptionRow(ProcPtr proc, int selectedIdx, int c);
void Config_Loop_KeyHandler(struct ConfigProc * proc);
bool Config_HandleExit(struct ConfigProc * proc);
void Config_SetSourceFromPrep(void);
void Config_SetSourceFromWorldMap(void);

extern struct ConfigScreen * CONST_DATA gConfigUiState;
extern u8 CONST_DATA gGameOptionsUiOrder[];
extern u16 CONST_DATA gSprite_ConfigurationUiHeader[];
extern struct GameOption CONST_DATA gGameOptions[];
extern struct ProcCmd CONST_DATA gProcScr_RedrawConfigHelpText[];
extern struct ProcCmd CONST_DATA gProcScr_DrawConfigUiSprites[];
extern struct ProcCmd CONST_DATA ProcScr_Config_Field[];
extern struct ProcCmd CONST_DATA ProcScr_Config_PrepMapMenu[];
extern struct ProcCmd CONST_DATA ProcScr_Config_WorldMap[];

#endif // GUARD_UI_CONFIG_H
