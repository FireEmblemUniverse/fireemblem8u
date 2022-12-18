#ifndef GUARD_UI_CONFIG_H
#define GUARD_UI_CONFIG_H

enum {
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

// ??? GetSelectedGameOption(???);
// ??? GetSelectedOptionValue(???);
// ??? DrawGameOptionIcon(???);
// ??? DrawGameOptionHelpText(???);
// ??? DrawGameOptionText(???);
// ??? DrawOptionValueTexts(???);
// ??? ConfigSprites_Init(???);
// ??? DrawConfigUiSprites(???);
// ??? Config_Init(???);
// ??? WindowColorOptionChangeHandler(???);
// ??? MusicOptionChangeHandler(???);
// ??? GenericOptionChangeHandler(???);
// ??? GetGameOption(???);
// ??? SetGameOption(???);
// ??? sub_80B2188(???);
// ??? Config_Loop_KeyHandler(???);
// ??? sub_80B2464(???);
// ??? sub_80B24AC(???);
// ??? sub_80B24C0(???);


// extern ??? gConfigUiState
// extern ??? gGameOptionsUiOrder
// extern ??? gSprite_ConfigurationUiHeader
// extern ??? gGameOptions
// extern ??? gProcScr_RedrawConfigHelpText
// extern ??? gProcScr_DrawConfigUiSprites
extern struct ProcCmd CONST_DATA gProcScr_Config1[];
extern struct ProcCmd CONST_DATA gProcScr_Config2[];
// extern ??? gProcScr_Config3

#endif // GUARD_UI_CONFIG_H
