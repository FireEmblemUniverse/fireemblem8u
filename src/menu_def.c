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
    {gTextRyoukai, 0x6bd, 0, 4, 7, MenuAlwaysEnabled, 0, DebugClearMenu_ClearFile, 0, 0, 0}, // OK > (Do action: clear file)
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
    {gTextNull, 0, 0, 0, 0x1a, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {gTextNull, 0, 0, 0, 0x1b, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {gTextNull, 0, 0, 0, 0x1c, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {gTextNull, 0, 0, 0, 0x1d, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {gTextNull, 0, 0, 0, 0x1e, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut},
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

const struct MenuItemDef gStaffItemSelectMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x3e, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {gTextNull, 0, 0, 0, 0x3f, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {gTextNull, 0, 0, 0, 0x40, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {gTextNull, 0, 0, 0, 0x41, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {gTextNull, 0, 0, 0, 0x42, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    MenuItemsEnd
};

const struct MenuItemDef gItemSelectMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x43, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x44, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x45, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x46, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {gTextNull, 0, 0, 0, 0x47, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    MenuItemsEnd
};

const struct MenuItemDef gBallistaRangeMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x48, BallistaRangeMenu_BallistaUsability, BallistaRangeMenu_Draw, BallistaRangeMenu_Select, 0, FillBallistaRange, BallistaRangeMenu_SwitchOut},
    MenuItemsEnd
};

const struct MenuItemDef gUnknownMenuItems[] = {
    {gTextNull, 0, 0, 0, 0x49, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {gTextNull, 0, 0, 0, 0x4A, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {gTextNull, 0, 0, 0, 0x4B, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {gTextNull, 0, 0, 0, 0x4C, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {gTextNull, 0, 0, 0, 0x4D, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    MenuItemsEnd
};

const struct MenuItemDef gUnitActionMenuItems[] = {
    {gTextSeiatsu, 0x67A, 0x6CC, 0, 0x4E, UnitActionMenu_CanSeize, 0, UnitActionMenu_Seize, 0, 0, 0}, // Seize
    {gTextKougeki, 0x67B, 0x6C0, 0, 0x4F, AttackCommandUsability, 0, UnitActionMenu_Attack, 0, DisplayUnitStandingAttackRange, HideMoveRangeGraphicsWrapper}, // Attack >
    {gTextKougeki, 0x67B, 0x6C0, 0, 0x50, AttackBallistaCommandUsability, 0, UnitActionMenu_Attack, 0, DisplayUnitStandingAttackRange, HideMoveRangeGraphicsWrapper}, // Attack w/Ballista >
    {gTextTsue, 0x67C, 0x6C1, 0, 0x51, StaffCommandUsability, 0, StaffCommandEffect, 0, StaffCommandRange, HideMoveRangeGraphicsWrapper2}, // Staff
    {gTextNoru, 0x691, 0x6D6, 4, 0x52, RideCommandUsability, 0, RideCommandEffect, 0, 0, 0}, // Ride (Ballista) >
    {gTextOriru, 0x692, 0x6D7, 4, 0x53, ExitCommandUsability, 0, ExitCommandEffect, 0, 0, 0}, // Exit (Ballista) >
    {gTextKanaderu, 0x67D, 0x6C3, 0, 0x54, PlayCommandUsability, 0, PlayCommandEffect, 0, 0, 0}, // Play >
    {gTextOdoru, 0x67E, 0x6C2, 0, 0x55, DanceCommandUsability, 0, PlayCommandEffect, 0, 0, 0}, // Dance
    {gTextNusumu, 0x67F, 0x6C4, 0, 0x56, StealCommandUsability, 0, StealCommandEffect, 0, 0, 0}, // Steal
    {gTextShoukan, 0x693, 0x6DD, 0, 0x57, SummonCommandUsability, 0, SummonCommandEffect, 0, 0, 0}, // Summon (Shoukanshi) >
    {gTextYobima, 0x693, 0x6DD, 0, 0x58, YobimaCommandUsability, 0, YobimaCommandEffect, 0, 0, 0}, // Summon (Deamon King) >
    {gTextKagihiraku, 0x694, 0x6DE, 0, 0x59, PickCommandUsability, 0, PickCommandEffect, 0, 0, 0}, // Pick >
    {gTextHanasu, 0x680, 0x6C9, 0, 0x5A, TalkCommandUsability, 0, TalkCommandEffect, 0, 0, 0}, // Talk >
    {gTextShien, 0x681, 0x6CA, 0, 0x5B, SupportCommandUsability, 0, SupportCommandEffect, 0, 0, 0}, // Support
    {gTextHoumon, 0x682, 0x6CB, 0, 0x5C, VisitCommandUsability, 0, VisitCommandEffect, 0, 0, 0}, // Visit
    {gTextTakarabako, 0x683, 0x6CE, 0, 0x5D, ChestCommandUsability, 0, ChestCommandEffect, 0, 0, 0}, // Chest
    {gTextTobira, 0x684, 0x6CD, 0, 0x5E, DoorCommandUsability, 0, DoorCommandEffect, 0, 0, 0}, // Door >
    {gTextBukiya, 0x685, 0x6CF, 0, 0x5F, ArmoryCommandUsability, 0, ArmoryCommandEffect, 0, 0, 0}, //Armory > 
    {gTextDouguya, 0x686, 0x6D0, 0, 0x60, VendorCommandUsability, 0, VendorCommandEffect, 0, 0, 0}, //Vendor > 
    {gTextHimitsuten, 0x687, 0x6D1, 0, 0x61, SecretShopCommandUsability, 0, SecretShopCommandEffect, 0, 0, 0}, //SecretShop > 
    {gTextTougijou, 0x688, 0x6D2, 0, 0x62, ArenaCommandUsability, 0, ArenaCommandEffect, 0, 0, 0}, // Arena
    {gTextKyuushutsu, 0x689, 0x6C5, 0, 0x63, RescueUsability, 0, RescueEffect, 0, 0, 0}, // Rescue > 
    {gTextOrosu, 0x68A, 0x6C6, 0, 0x64, DropUsability, 0, DropEffect, 0, 0, 0}, // Drop > 
    {gTextHikiuke, 0x68B, 0x6C8, 4, 0x65, TakeUsability, 0, TakeEffect, 0, 0, 0}, // Take > 
    {gTextHikiwatashi, 0x68C, 0x6C7, 4, 0x66, GiveUsability, 0, GiveEffect, 0, 0, 0}, // Give > 
    {gTextMochimono, 0x68D, 0x6D3, 0, 0x67, ItemCommandUsability, 0, ItemCommandEffect, 0, 0, 0}, // Item > 
    {gTextKoukan2, 0x68E, 0x6D4, 4, 0x68, ItemSubMenu_IsTradeAvailable, 0, TradeCommandEffect, 0, 0, 0}, // Trade > 
    {gTextYuusoutai, 0x68F, 0x6D5, 4, 0x69, SupplyUsability, 0, SupplyCommandEffect, 0, 0, 0}, // Supply > 
    {gTextTaiki, 0x695, 0x6BF, 0, 0x6B, MenuAlwaysEnabled, 0, EffectWait, 0, 0, 0}, // Wait > 
    MenuItemsEnd
};

const struct MenuItemDef gMapMenuItems[] = {
    {gTextButai, 0x69A, 0x6DF, 0, 0x6e, MenuAlwaysEnabled, 0, MapMenu_UnitCommand, 0, 0, 0}, // Unit >
    {gTextJoukyou, 0x690, 0x6E0, 0, 0x6f, MenuAlwaysEnabled, 0, MapMenu_StatusCommand, 0, 0, 0}, // Status >
    {gTextJisho, 0x69C, 0x6E5, 4, 0x74, MapMenu_IsGuideCommandAvailable, MapMenu_GuideCommandDraw, Make6CE_Guide}, // Guide
    {gTextSenki, 0x69E, 0x6E3, 0, 0x70, MapMenu_IsRecordsCommandAvailable, 0, MapMenu_RecordsCommand, 0, 0, 0}, // Records
    {gTextSettei, 0x69B, 0x6E1, 0, 0x71, MenuAlwaysEnabled, 0, MapMenu_OptionsCommand, 0, 0, 0}, // Options
    {gTextTaikyaku, 0x69D, 0x6E2, 0, 0x72, MapMenu_IsRetreatCommandAvailable, 0, MapMenu_RetreatCommand, 0, 0, 0}, // Retreat
    {gTextChuudan, 0x69F, 0x6E4, 0, 0x73, MapMenu_IsSuspendCommandAvailable, 0, MapMenu_SuspendCommand, 0, 0, 0}, // Suspend
    {gTextShuuryou, 0x6A0, 0x6E6, 0, 0x78, MenuAlwaysEnabled, 0, CommandEffectEndPlayerPhase, 0, 0, 0}, // End Phase
    MenuItemsEnd
};

const struct MenuDef gDebugClearMenuDef = {
    {1, 6, 0xd, 0},
    0,
    gDebugClearMenuItems,
    0, 0, 0,
    EndMenuAndClear,
    0, 0
};

const struct MenuDef gDebugChargeMenuDef = {
    {1, 1, 0xa, 0},
    0,
    gDebugChargeMenuItems,
    0, 0, 0,
    EndMenuAndClear,
    0, 0
};

const struct MenuDef gDebugContinueMenuDef = {
    {9, 4, 0xc, 0},
    0,
    gDebugContinueMenuItems,
    DebugContinueMenuInit, 
    DebugContinueMenuEnd,
    0, 0, 0, 0
};

const struct MenuDef gDebugChuudanMenuDef = {
    {1, 1, 0xa, 0},
    0,
    gDebugChuudanMenuItems,
    0, 0, 0,
    EndMenuAndClear,
    0, 0
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

const struct MenuDef gMenuInfo_RepairItems = {
    {0, 1, 0x10, 0},
    0,
    gItemUseMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed, 
    MenuAutoHelpBoxSelect,
    ItemMenu_HelpBox
};

const struct MenuDef gStealItemMenuDef = {
    {0xe, 4, 0xe, 0},
    0,
    gStealItemMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed, 
    MenuAutoHelpBoxSelect,
    ItemMenu_HelpBox
};

const struct MenuDef gConvoyMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gConvoyMenuItems,
    0, 0, 0, 0,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

const struct MenuDef gSendToConvoyMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gSendToConvoyMenuItems,
    0, 0, 0, 0,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

const struct MenuDef gYesNoSelectionMenuDef = {
    {0, 0, 5, 0},
    1,
    gYesNoSelectionMenuItems,
    0, 0, 0,
    MenuCommand_SelectNo,
    0, 0
};

const struct MenuDef gItemSubMenuDef = {
    {0, 0, 7, 0},
    1,
    gItemSubMenuItems,
    0,
    ItemSubMenuEnd,
    0,
    MenuCommand_SelectNo,
    MenuAutoHelpBoxSelect,
    (void(*)(struct MenuProc*, struct MenuItemProc*))MenuStdHelpBox
};

const struct MenuDef gItemMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gItemMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ItemMenuHelpBox
};

const struct MenuDef gStaffItemSelectMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gStaffItemSelectMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

const struct MenuDef gItemSelectMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gItemSelectMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

const struct MenuDef gBallistaRangeMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gBallistaRangeMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    BallistaRangeMenuHelpBox
};

const struct MenuDef gUnknownMenuDef = {
    {1, 1, 0xe, 0},
    0,
    gUnknownMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

const struct MenuDef gUnitActionMenuDef = {
    {1, 3, 7, 0},
    0,
    gUnitActionMenuItems,
    0, 0, 0,
    MenuCancelSelect,
    MenuAutoHelpBoxSelect,
    (void(*)(struct MenuProc*, struct MenuItemProc*))MenuStdHelpBox
};

const struct MenuDef gMapMenuDef = {
    {1, 2, 7, 0},
    0,
    gMapMenuItems,
    0, 0, 0,
    MenuCancelSelect,
    MenuAutoHelpBoxSelect,
    (void(*)(struct MenuProc*, struct MenuItemProc*))MenuStdHelpBox
};

