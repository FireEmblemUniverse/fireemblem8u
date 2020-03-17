#include "global.h"

#include "raw_text_jp.h"

#include "bmdebug.h"
#include "bmitemuse.h"
#include "bmmenu.h"
#include "convoymenu.h"

#define MenuItemsEnd {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

const struct MenuItemDef gDebugClearMenuItems[] = {
    {gTextFairuwokuriazumini, 0x6b9, 0, 0, 3, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // Erase
    {gTextShimasuka, 0x6ba, 0, 0, 4, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // File?
    {gTextKuriazumifairudeha, 0x6bb, 0, 0, 5, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // Erased files are >
    {gTextIgopureidekimasen, 0x6bc, 0, 0, 6, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // gone forever!
    {gTextRyoukai, 0x6bd, 0, 4, 7, MenuAlwaysEnabled, 0, 0, 0, 0, DebugClearMenu_ClearFile}, // OK > (Do action: clear file)
    MenuItemsEnd
};

const struct MenuItemDef gDebugChargeMenuItems[] = {
    {gTextNull, 0, 0, 0, 8, MenuAlwaysEnabled, DebugChargeMenu_Draw, 0, DebugChargeMenu_Idle, 0, 0 
},
    {gTextNull, 0, 0, 0, 9, MenuAlwaysEnabled, DebugChargeMenu_Draw, 0, DebugChargeMenu_Idle, 0, 0},
    MenuItemsEnd
};

const struct MenuItemDef gDebugContinueMenuItems[] = {
    {gTextRiriisuentori, 0x26, 0, 0, 0xa, MenuAlwaysEnabled, 0, DebugContinueMenu_ReleaseEntry, 0, 0, 0}, // Release Entry
    {gTextDokodemosaikai, 0x27, 0, 0, 0xb, DebugContinueMenu_IsContinueChapterAvailable, 0, DebugContinueMenu_ContinueChapter, 0, 0, 0}, // Continue Chpater
    {gTextTesaikai, 0x28, 0, 0, 0xc, DebugContinueMenu_IsManualContinueAvailable, 0, DebugContinueMenu_ManualContinue, 0, 0, 0}, // Manual Continue
    {gTextFairushokika, 0x29, 0, 0, 0xd, MenuAlwaysEnabled,0, DebugContinueMenu_InitializeFile, 0, 0, 0}, // Initialize File
    MenuItemsEnd
};

const struct MenuItemDef gDebugChuudanMenuItems[] = {
    {gTextTechuudan, 0x6a4, 0, 0, 0x10, DebugChuudanMenu_IsManualSaveAvailable, 0, DebugChuudanMenu_ManualSave, 0, 0, 0}, // Manual Save
    MenuItemsEnd
};

const struct MenuItemDef gDebugMenuItems[] = {
    {gTextMappu, 0x6aa, 0, 0, 0x11, MenuAlwaysEnabled, 0, DebugMenu_MapEffect, DebugMenu_MapIdle, 0, 0}, // Map
    {gTextDebujouhou, 0x6ab, 0, 0, 0x12, MenuAlwaysEnabled, DebugMapMenu_DisplayInfoDraw, DebugMapMenu_DisplayInfoEffect, DebugMapMenu_DisplayInfoIdle, 0, 0}, // Debug Info
    {gTextTenki, 0x6ac, 0, 0, 0x13, MenuAlwaysEnabled, DebugMenu_WeatherDraw, DebugMenu_WeatherEffect, DebugMenu_WeatherIdle, 0, 0}, // Weather
    {gTextSakuteki, 0x6ad, 0, 0, 0x14, MenuAlwaysEnabled, DebugMenu_FogDraw, DebugMenu_FogEffect, DebugMenu_FogIdle, }, // Fog
    {gTextShuukaisuu, 0x6ae, 0, 0, 0x15, MenuAlwaysEnabled, DebugMenu_ClearDraw, DebugMenu_ClearEffect, DebugMenu_ClearIdle, 0, 0}, // Clears >
    {gTextKuriazumi, 0x6af, 0, 0, 0x16, MenuAlwaysEnabled, 0, DebugMenu_ErasedEffect, 0, 0, 0}, // Erased >
    {gTextOyasuminasai, 0x6b0, 0, 0, 0x18, MenuAlwaysEnabled, 0, DebugMenu_GNightEffect, 0, 0, 0}, // Good Night! >
    MenuItemsEnd
};

const struct MenuItemDef gItemUseMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x1a, ItemUseMenu_IsAvailable, ItemUseMenu_Draw, ItemUseMenu_Selected, 0, ItemUseMenu_SwitchIn, ItemUseMenu_SwitchOut_DoNothing}, 
    {gTextNull, 0, 0, 0, 0x1b, ItemUseMenu_IsAvailable, ItemUseMenu_Draw, ItemUseMenu_Selected, 0, ItemUseMenu_SwitchIn, ItemUseMenu_SwitchOut_DoNothing}, 
    {gTextNull, 0, 0, 0, 0x1c, ItemUseMenu_IsAvailable, ItemUseMenu_Draw, ItemUseMenu_Selected, 0, ItemUseMenu_SwitchIn, ItemUseMenu_SwitchOut_DoNothing}, 
    {gTextNull, 0, 0, 0, 0x1d, ItemUseMenu_IsAvailable, ItemUseMenu_Draw, ItemUseMenu_Selected, 0, ItemUseMenu_SwitchIn, ItemUseMenu_SwitchOut_DoNothing}, 
    {gTextNull, 0, 0, 0, 0x1e, ItemUseMenu_IsAvailable, ItemUseMenu_Draw, ItemUseMenu_Selected, 0, ItemUseMenu_SwitchIn, ItemUseMenu_SwitchOut_DoNothing},
    MenuItemsEnd
};

const struct MenuItemDef gStealItemMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x1f, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {gTextNull, 0, 0, 0, 0x20, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {gTextNull, 0, 0, 0, 0x21, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {gTextNull, 0, 0, 0, 0x22, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {gTextNull, 0, 0, 0, 0x23, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    MenuItemsEnd
};

const struct MenuItemDef gConvoyMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x24, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x25, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x26, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x27, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x28, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x29, MenuAlwaysEnabled, MenuCommand_DrawExtraItem, SendToConvoyMenu_Selected2, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    MenuItemsEnd
};

const struct MenuItemDef gSendToConvoyMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x2a, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x2b, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x2c, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x2d, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x2e, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x2f, MenuAlwaysEnabled, MenuCommand_DrawExtraItem, MenuCommand_SendItemToConvoy, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    MenuItemsEnd
};

const struct MenuItemDef gYesNoSelectionMenuItems[] = {
    {gTextHai, 0x843, 0, 0, 0x32, MenuAlwaysEnabled, 0, MenuCommand_SelectYes, 0, 0, 0}, // Yes >
    {gTextIie, 0x844, 0, 0, 0x33, MenuAlwaysEnabled, 0, MenuCommand_SelectNo, 0, 0, 0}, // No
    MenuItemsEnd
};

const struct MenuItemDef gItemSubMenuItems[] = {
    {gTextTsukau, 0x696, 0x6DB, 0, 0x34, ItemSubMenu_IsUseAvailable, 0, ItemSubMenu_UseItem, 0, 0, 0}, // Use >
    {gTextSoubi, 0x697, 0x6DA, 4, 0x35, ItemSubMenu_IsEquipAvailable, 0, ItemSubMenu_EquipItem, 0, 0, 0}, // Equip >
    {gTextKoukan, 0x698, 0x6D4, 4, 0x36, ItemSubMenu_IsTradeAvailable, 0, ItemSubMenu_TradeItem, 0, 0, 0}, // Trade >
    {gTextSuteru, 0x699, 0x6DC, 4, 0x37, ItemSubMenu_IsDiscardAvailable, 0, ItemSubMenu_DiscardItem, 0, 0, 0}, // Discard >
    MenuItemsEnd
};

const struct MenuItemDef gItemMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x38, ItemMenu_Is1stCommandAvailable, ItemMenu_Draw1stCommand, ItemMenu_Select1stCommand, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x39, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x3A, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x3B, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x3C, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x3D, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    MenuItemsEnd
};

const struct MenuDef gDebugMenuDef = {
    {1, 1, 15, 0},
    0,
    gDebugMenuItems,
    DebugMenuInit,
    (void(*)(struct MenuProc*))0, 
    (void(*)(struct MenuProc*))0,
    EndMenuAndClear,
    (u8(*)(struct MenuProc*))0,
    (void(*)(struct MenuProc*, struct MenuItemProc*))0
};

