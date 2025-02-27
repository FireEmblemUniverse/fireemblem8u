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
    /* 28 */ s8 (*func)(ProcPtr);
};

struct ConfigScreen
{
    /* 00 */ STRUCT_PAD(0x00, 0x2A);
    /* 2A */ s16 unk_2a; // current index
    /* 2C */ s16 unk_2c; // top of menu index
    /* 2E */ u16 unk_2e; // ? maybe offset on current bg?
    /* 30 */ u16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u8 unk_36;
    /* 37 */ s8 unk_37; // some flags / state var
    /* 38 */ struct Text unk_38[6]; // size: 0x30

    /* 68 */ struct Text unk_68;
    /* 70 */ struct Text unk_70[6];

    /* A0 */ struct Text unk_a0;
    /* A8 */ struct Text unk_a8;
};

struct ConfigProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);

    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;

    /* 36 */ u8 unk_36;
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

s16 sub_80B169C(void);
u8 GetSelectedGameOption(void);
u8 GetSelectedOptionValue(void);
void DrawGameOptionIcon(int a, int b);
void DrawGameOptionHelpText(void);
void DrawGameOptionText(int selectedIdx, int textIdx, int y);
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y);
void ConfigSprites_Init(void);
void DrawConfigUiSprites(void);
void Config_Init(struct ConfigProc * proc);
s8 WindowColorOptionChangeHandler(ProcPtr proc);
s8 MusicOptionChangeHandler(ProcPtr proc);
s8 GenericOptionChangeHandler(ProcPtr proc);
u8 GetGameOption(u8 index);
void SetGameOption(u8 index, u8 newValue);
void sub_80B2188(ProcPtr proc, int selectedIdx, int c);
void Config_Loop_KeyHandler(struct ConfigProc * proc);
s8 sub_80B2464(struct ConfigProc * proc);
void sub_80B24AC(void);
void sub_80B24C0(void);

extern struct ConfigScreen * CONST_DATA gConfigUiState;
extern u8 CONST_DATA gGameOptionsUiOrder[];
extern u16 CONST_DATA gSprite_ConfigurationUiHeader[];
extern struct GameOption CONST_DATA gGameOptions[];
extern struct ProcCmd CONST_DATA gProcScr_RedrawConfigHelpText[];
extern struct ProcCmd CONST_DATA gProcScr_DrawConfigUiSprites[];
extern struct ProcCmd CONST_DATA ProcScr_Config1[];
extern struct ProcCmd CONST_DATA ProcScr_Config2[];
extern struct ProcCmd CONST_DATA ProcScr_Config3[];

#endif // GUARD_UI_CONFIG_H
