#include "global.h"

#include "raw_text_jp.h"

#include "bmdebug.h"
#include "bmitemuse.h"
#include "bmmenu.h"
#include "convoymenu.h"
#include "uiselecttarget.h"
#include "bmitemuse.h"
#include "bksel.h"

#include "menu_def.h"

CONST_DATA struct MenuItemDef gDebugClearMenuItems[] = {
    {"ファイルをクリアずみに", 0x6b9, 0, 0, 3, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // Erase
    {"しますか？", 0x6ba, 0, 0, 4, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // File?
    {"クリアずみファイルでは", 0x6bb, 0, 0, 5, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // Erased files are >
    {"以後プレイできません", 0x6bc, 0, 0, 6, MenuAlwaysEnabled, 0, 0, 0, 0, 0}, // gone forever!
    {"　　　　　　　　　了解", 0x6bd, 0, 4, 7, MenuAlwaysEnabled, 0, DebugClearMenu_ClearFile, 0, 0, 0}, // OK > (Do action: clear file)
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gDebugChargeMenuItems[] = {
    {"", 0, 0, 0, 8, MenuAlwaysEnabled, DebugChargeMenu_Draw, 0, DebugChargeMenu_Idle, 0, 0 
},
    {"", 0, 0, 0, 9, MenuAlwaysEnabled, DebugChargeMenu_Draw, 0, DebugChargeMenu_Idle, 0, 0},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gDebugContinueMenuItems[] = {
    {"　リリースエントリ", 0x26, 0, 0, 0xa, MenuAlwaysEnabled, 0, DebugContinueMenu_ReleaseEntry, 0, 0, 0}, // Release Entry
    {"　どこでも再開", 0x27, 0, 0, 0xb, DebugContinueMenu_IsContinueChapterAvailable, 0, DebugContinueMenu_ContinueChapter, 0, 0, 0}, // Continue Chpater
    {"　手再開", 0x28, 0, 0, 0xc, DebugContinueMenu_IsManualContinueAvailable, 0, DebugContinueMenu_ManualContinue, 0, 0, 0}, // Manual Continue
    {"　ファイル初期化", 0x29, 0, 0, 0xd, MenuAlwaysEnabled,0, DebugContinueMenu_InitializeFile, 0, 0, 0}, // Initialize File
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gDebugChuudanMenuItems[] = {
    {"　手中断", 0x6a4, 0, 0, 0x10, DebugChuudanMenu_IsManualSaveAvailable, 0, DebugChuudanMenu_ManualSave, 0, 0, 0}, // Manual Save
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gDebugMenuItems[] = {
    {"　マップ", 0x6aa, 0, 0, 0x11, MenuAlwaysEnabled, 0, DebugMenu_MapEffect, DebugMenu_MapIdle, 0, 0}, // Map
    {"　デブ情報", 0x6ab, 0, 0, 0x12, MenuAlwaysEnabled, DebugMapMenu_DisplayInfoDraw, DebugMapMenu_DisplayInfoEffect, DebugMapMenu_DisplayInfoIdle, 0, 0}, // Debug Info
    {"　天気", 0x6ac, 0, 0, 0x13, MenuAlwaysEnabled, DebugMenu_WeatherDraw, DebugMenu_WeatherEffect, DebugMenu_WeatherIdle, 0, 0}, // Weather
    {"　索敵", 0x6ad, 0, 0, 0x14, MenuAlwaysEnabled, DebugMenu_FogDraw, DebugMenu_FogEffect, DebugMenu_FogIdle, }, // Fog
    {"　周回数", 0x6ae, 0, 0, 0x15, MenuAlwaysEnabled, DebugMenu_ClearDraw, DebugMenu_ClearEffect, DebugMenu_ClearIdle, 0, 0}, // Clears >
    {"　クリアずみ", 0x6af, 0, 0, 0x16, MenuAlwaysEnabled, 0, DebugMenu_ErasedEffect, 0, 0, 0}, // Erased >
    {"　おやすみなさい", 0x6b0, 0, 0, 0x18, MenuAlwaysEnabled, 0, DebugMenu_GNightEffect, 0, 0, 0}, // Good Night! >
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gItemUseMenuItems[] = {
    {"", 0, 0, 0, 0x1a, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {"", 0, 0, 0, 0x1b, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {"", 0, 0, 0, 0x1c, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {"", 0, 0, 0, 0x1d, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut}, 
    {"", 0, 0, 0, 0x1e, RepairMenuItemIsAvailable, RepairMenuItemDraw, RepairMenuItemSelect, 0, RepairMenuItemOnChange, RepairMenuItemOnChangeOut},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gStealItemMenuItems[] = {
    {"", 0, 0, 0, 0x1f, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {"", 0, 0, 0, 0x20, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {"", 0, 0, 0, 0x21, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {"", 0, 0, 0, 0x22, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    {"", 0, 0, 0, 0x23, StealItemMenuCommand_Usability, StealItemMenuCommand_Draw, StealItemMenuCommand_Effect, 0, 0, 0},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gConvoyMenuItems[] = {
    {"", 0, 0, 0, 0x24, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x25, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x26, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x27, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x28, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_Selected, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x29, MenuAlwaysEnabled, MenuCommand_DrawExtraItem, SendToConvoyMenu_Selected2, SendToConvoyMenu_Idle, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gSendToConvoyMenuItems[] = {
    {"", 0, 0, 0, 0x2a, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x2b, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x2c, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x2d, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x2e, MenuAlwaysEnabled, SendToConvoyMenu_Draw, SendToConvoyMenu_NormalEffect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x2f, MenuAlwaysEnabled, MenuCommand_DrawExtraItem, MenuCommand_SendItemToConvoy, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gYesNoSelectionMenuItems[] = {
    {"はい", 0x843, 0, 0, 0x32, MenuAlwaysEnabled, 0, MenuCommand_SelectYes, 0, 0, 0}, // Yes >
    {"いいえ", 0x844, 0, 0, 0x33, MenuAlwaysEnabled, 0, MenuCommand_SelectNo, 0, 0, 0}, // No
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gItemSubMenuItems[] = {
    {"使う", 0x696, 0x6DB, 0, 0x34, ItemSubMenu_IsUseAvailable, 0, ItemSubMenu_UseItem, 0, 0, 0}, // Use >
    {"装備", 0x697, 0x6DA, 4, 0x35, ItemSubMenu_IsEquipAvailable, 0, ItemSubMenu_EquipItem, 0, 0, 0}, // Equip >
    {"交換", 0x698, 0x6D4, 4, 0x36, ItemSubMenu_IsTradeAvailable, 0, ItemSubMenu_TradeItem, 0, 0, 0}, // Trade >
    {"捨てる", 0x699, 0x6DC, 4, 0x37, ItemSubMenu_IsDiscardAvailable, 0, ItemSubMenu_DiscardItem, 0, 0, 0}, // Discard >
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gItemMenuItems[] = {
    {"", 0, 0, 0, 0x38, ItemMenu_Is1stCommandAvailable, ItemMenu_Draw1stCommand, ItemMenu_Select1stCommand, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x39, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x3A, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x3B, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x3C, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x3D, ItemMenu_AreOtherCommandsAvailable, ItemMenu_DrawOtherCommands, ItemMenu_SelectOtherCommands, 0, ItemMenu_SwitchIn, ItemMenu_SwitchOut_DoNothing},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gStaffItemSelectMenuItems[] = {
    {"", 0, 0, 0, 0x3e, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {"", 0, 0, 0, 0x3f, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {"", 0, 0, 0, 0x40, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {"", 0, 0, 0, 0x41, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    {"", 0, 0, 0, 0x42, StaffItemSelect_Usability, StaffItemSelect_TextDraw, StaffItemSelect_Effect, 0, StaffItemSelect_OnHover, StaffItemSelect_SwitchOut},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gItemSelectMenuItems[] = {
    {"", 0, 0, 0, 0x43, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x44, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x45, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x46, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    {"", 0, 0, 0, 0x47, ItemSelectMenu_Usability, ItemSelectMenu_TextDraw, ItemSelectMenu_Effect, 0, Menu_SwitchIn, Menu_SwitchOut_DoNothing},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gBallistaRangeMenuItems[] = {
    {"", 0, 0, 0, 0x48, BallistaRangeMenu_BallistaUsability, BallistaRangeMenu_Draw, BallistaRangeMenu_Select, 0, FillBallistaRange, BallistaRangeMenu_SwitchOut},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gUnknownMenuItems[] = {
    {"", 0, 0, 0, 0x49, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {"", 0, 0, 0, 0x4A, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {"", 0, 0, 0, 0x4B, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {"", 0, 0, 0, 0x4C, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    {"", 0, 0, 0, 0x4D, UnknownMenu_IsAvailable, UnknownMenu_Draw, UnknownMenu_Selected, 0, UnknownMenu_SwitchIn, BallistaRangeMenu_SwitchOut},
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gUnitActionMenuItems[] = {
    {"　制圧", 0x67A, 0x6CC, 0, 0x4E, UnitActionMenu_CanSeize, 0, UnitActionMenu_Seize, 0, 0, 0}, // Seize
    {"　攻撃", 0x67B, 0x6C0, 0, 0x4F, AttackCommandUsability, 0, UnitActionMenu_Attack, 0, DisplayUnitStandingAttackRange, HideMoveRangeGraphicsWrapper}, // Attack >
    {"　攻撃", 0x67B, 0x6C0, 0, 0x50, AttackBallistaCommandUsability, 0, UnitActionMenu_Attack, 0, DisplayUnitStandingAttackRange, HideMoveRangeGraphicsWrapper}, // Attack w/Ballista >
    {"　杖", 0x67C, 0x6C1, 0, 0x51, StaffCommandUsability, 0, StaffCommandEffect, 0, StaffCommandRange, HideMoveRangeGraphicsWrapper2}, // Staff
    {"　乗る", 0x691, 0x6D6, 4, 0x52, RideCommandUsability, 0, RideCommandEffect, 0, 0, 0}, // Ride (Ballista) >
    {"　降りる", 0x692, 0x6D7, 4, 0x53, ExitCommandUsability, 0, ExitCommandEffect, 0, 0, 0}, // Exit (Ballista) >
    {"　奏でる", 0x67D, 0x6C3, 0, 0x54, PlayCommandUsability, 0, PlayCommandEffect, 0, 0, 0}, // Play >
    {"　踊る", 0x67E, 0x6C2, 0, 0x55, DanceCommandUsability, 0, PlayCommandEffect, 0, 0, 0}, // Dance
    {"　盗む", 0x67F, 0x6C4, 0, 0x56, StealCommandUsability, 0, StealCommandEffect, 0, 0, 0}, // Steal
    {"　召喚", 0x693, 0x6DD, 0, 0x57, SummonCommandUsability, 0, SummonCommandEffect, 0, 0, 0}, // Summon (Shoukanshi) >
    {"　呼魔", 0x693, 0x6DD, 0, 0x58, YobimaCommandUsability, 0, YobimaCommandEffect, 0, 0, 0}, // Summon (Deamon King) >
    {"　かぎ開", 0x694, 0x6DE, 0, 0x59, PickCommandUsability, 0, PickCommandEffect, 0, 0, 0}, // Pick >
    {"　話す", 0x680, 0x6C9, 0, 0x5A, TalkCommandUsability, 0, TalkCommandEffect, 0, 0, 0}, // Talk >
    {"　支援", 0x681, 0x6CA, 0, 0x5B, SupportCommandUsability, 0, SupportCommandEffect, 0, 0, 0}, // Support
    {"　訪問", 0x682, 0x6CB, 0, 0x5C, VisitCommandUsability, 0, VisitCommandEffect, 0, 0, 0}, // Visit
    {"　宝箱", 0x683, 0x6CE, 0, 0x5D, ChestCommandUsability, 0, ChestCommandEffect, 0, 0, 0}, // Chest
    {"　扉", 0x684, 0x6CD, 0, 0x5E, DoorCommandUsability, 0, DoorCommandEffect, 0, 0, 0}, // Door >
    {"　武器屋", 0x685, 0x6CF, 0, 0x5F, ArmoryCommandUsability, 0, ArmoryCommandEffect, 0, 0, 0}, //Armory > 
    {"　道具屋", 0x686, 0x6D0, 0, 0x60, VendorCommandUsability, 0, VendorCommandEffect, 0, 0, 0}, //Vendor > 
    {"　秘密店", 0x687, 0x6D1, 0, 0x61, SecretShopCommandUsability, 0, SecretShopCommandEffect, 0, 0, 0}, //SecretShop > 
    {"　闘技場", 0x688, 0x6D2, 0, 0x62, ArenaCommandUsability, 0, ArenaCommandEffect, 0, 0, 0}, // Arena
    {"　救出", 0x689, 0x6C5, 0, 0x63, RescueUsability, 0, RescueEffect, 0, 0, 0}, // Rescue > 
    {"　降ろす", 0x68A, 0x6C6, 0, 0x64, DropUsability, 0, DropEffect, 0, 0, 0}, // Drop > 
    {"　引受け", 0x68B, 0x6C8, 4, 0x65, TakeUsability, 0, TakeEffect, 0, 0, 0}, // Take > 
    {"　引渡し", 0x68C, 0x6C7, 4, 0x66, GiveUsability, 0, GiveEffect, 0, 0, 0}, // Give > 
    {"　持ち物", 0x68D, 0x6D3, 0, 0x67, ItemCommandUsability, 0, ItemCommandEffect, 0, 0, 0}, // Item > 
    {"　交換", 0x68E, 0x6D4, 4, 0x68, ItemSubMenu_IsTradeAvailable, 0, TradeCommandEffect, 0, 0, 0}, // Trade > 
    {"　輸送隊", 0x68F, 0x6D5, 4, 0x69, SupplyUsability, 0, SupplyCommandEffect, 0, 0, 0}, // Supply > 
    {"　待機", 0x695, 0x6BF, 0, 0x6B, MenuAlwaysEnabled, 0, EffectWait, 0, 0, 0}, // Wait > 
    MenuItemsEnd
};

CONST_DATA struct MenuItemDef gMapMenuItems[] = {
    {"　部隊", 0x69A, 0x6DF, 0, 0x6e, MenuAlwaysEnabled, 0, MapMenu_UnitCommand, 0, 0, 0}, // Unit >
    {"　状況", 0x690, 0x6E0, 0, 0x6f, MenuAlwaysEnabled, 0, MapMenu_StatusCommand, 0, 0, 0}, // Status >
    {"　辞書", 0x69C, 0x6E5, 4, 0x74, MapMenu_IsGuideCommandAvailable, MapMenu_GuideCommandDraw, MapMenu_GuideCommand}, // Guide
    {"　戦績", 0x69E, 0x6E3, 0, 0x70, MapMenu_IsRecordsCommandAvailable, 0, MapMenu_RecordsCommand, 0, 0, 0}, // Records
    {"　設定", 0x69B, 0x6E1, 0, 0x71, MenuAlwaysEnabled, 0, MapMenu_OptionsCommand, 0, 0, 0}, // Options
    {"　退却", 0x69D, 0x6E2, 0, 0x72, MapMenu_IsRetreatCommandAvailable, 0, MapMenu_RetreatCommand, 0, 0, 0}, // Retreat
    {"　中断", 0x69F, 0x6E4, 0, 0x73, MapMenu_IsSuspendCommandAvailable, 0, MapMenu_SuspendCommand, 0, 0, 0}, // Suspend
    {"　終了", 0x6A0, 0x6E6, 0, 0x78, MenuAlwaysEnabled, 0, CommandEffectEndPlayerPhase, 0, 0, 0}, // End Phase
    MenuItemsEnd
};

CONST_DATA struct MenuDef gDebugClearMenuDef = {
    {1, 6, 13, 0},
    0,
    gDebugClearMenuItems,
    0, 0, 0,
    EndMenuAndClear,
    0, 0
};

CONST_DATA struct MenuDef gDebugChargeMenuDef = {
    {1, 1, 10, 0},
    0,
    gDebugChargeMenuItems,
    0, 0, 0,
    EndMenuAndClear,
    0, 0
};

CONST_DATA struct MenuDef gDebugContinueMenuDef = {
    {9, 4, 12, 0},
    0,
    gDebugContinueMenuItems,
    MISMATCHED_SIGNATURE(DebugContinueMenuInit),
    MISMATCHED_SIGNATURE(DebugContinueMenuEnd),
    0, 0, 0, 0
};

CONST_DATA struct MenuDef gDebugChuudanMenuDef = {
    {1, 1, 10, 0},
    0,
    gDebugChuudanMenuItems,
    0, 0, 0,
    EndMenuAndClear,
    0, 0
};

CONST_DATA struct MenuDef gDebugMenuDef = {
    {1, 1, 15, 0},
    0,
    gDebugMenuItems,
    MISMATCHED_SIGNATURE(DebugMenuInit),
    NULL, 
    NULL,
    EndMenuAndClear,
    NULL,
    0
};

CONST_DATA struct MenuDef gMenuInfo_RepairItems = {
    {0, 1, 16, 0},
    0,
    gItemUseMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed, 
    MenuAutoHelpBoxSelect,
    ItemMenu_HelpBox
};

CONST_DATA struct MenuDef gStealItemMenuDef = {
    {14, 4, 14, 0},
    0,
    gStealItemMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed, 
    MenuAutoHelpBoxSelect,
    ItemMenu_HelpBox
};

CONST_DATA struct MenuDef gConvoyMenuDef = {
    {1, 1, 14, 0},
    0,
    gConvoyMenuItems,
    0, 0, 0, 0,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

CONST_DATA struct MenuDef gSendToConvoyMenuDef = {
    {1, 1, 14, 0},
    0,
    gSendToConvoyMenuItems,
    0, 0, 0, 0,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

CONST_DATA struct MenuDef gYesNoSelectionMenuDef = {
    {0, 0, 5, 0},
    1,
    gYesNoSelectionMenuItems,
    0, 0, 0,
    MenuCommand_SelectNo,
    0, 0
};

CONST_DATA struct MenuDef gItemSubMenuDef = {
    {0, 0, 7, 0},
    1,
    gItemSubMenuItems,
    0,
    ItemSubMenuEnd,
    0,
    MenuCommand_SelectNo,
    MenuAutoHelpBoxSelect,
    MenuStdHelpBox
};

CONST_DATA struct MenuDef gItemMenuDef = {
    {1, 1, 14, 0},
    0,
    gItemMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ItemMenuHelpBox
};

CONST_DATA struct MenuDef gStaffItemSelectMenuDef = {
    {1, 1, 14, 0},
    0,
    gStaffItemSelectMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

CONST_DATA struct MenuDef gItemSelectMenuDef = {
    {1, 1, 14, 0},
    0,
    gItemSelectMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

CONST_DATA struct MenuDef gBallistaRangeMenuDef = {
    {1, 1, 14, 0},
    0,
    gBallistaRangeMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    BallistaRangeMenuHelpBox
};

CONST_DATA struct MenuDef gUnknownMenuDef = {
    {1, 1, 14, 0},
    0,
    gUnknownMenuItems,
    0, 0, 0,
    ItemMenu_ButtonBPressed,
    MenuAutoHelpBoxSelect,
    ConvoyMenu_HelpBox
};

CONST_DATA struct MenuDef gUnitActionMenuDef = {
    {1, 3, 7, 0},
    0,
    gUnitActionMenuItems,
    0, 0, 0,
    MenuCancelSelect,
    MenuAutoHelpBoxSelect,
    MenuStdHelpBox
};

CONST_DATA struct MenuDef gMapMenuDef = {
    {1, 2, 7, 0},
    0,
    gMapMenuItems,
    0, 0, 0,
    MenuCancelSelect,
    MenuAutoHelpBoxSelect,
    MenuStdHelpBox
};

struct SelectInfo CONST_DATA gSelectInfo_OffensiveStaff =
{
    .onInit = MISMATCHED_SIGNATURE(AttackStaffMapSelect_Init),
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = AttackStaffMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM_CamWait,
};

struct SelectInfo CONST_DATA gSelectInfo_Barrier =
{
    .onInit = MISMATCHED_SIGNATURE(BarrierMapSelect_Init),
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = BarrierMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Restore =
{
    .onInit = MISMATCHED_SIGNATURE(RestoreMapSelect_Init),
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = RestoreMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Heal =
{
    .onInit = HealMapSelect_Init,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = HealMapSelect_SwitchIn,
    .onSelect = StaffSelectOnSelect,
    .onCancel = GenericSelection_BackToUM_CamWait,
};

struct SelectInfo CONST_DATA gSelectInfo_Dance =
{
    .onInit = RefreshMapSelect_Init,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = RefreshMapSelect_SwitchIn,
    .onSelect = RefreshMapSelect_Select,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_PutTrap =
{
    .onEnd = SubtitleMapSelect_End,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_WarpUnit =
{
    .onInit = WarpUnitMapSelect_Init,
    .onEnd = SubtitleMapSelect_End,
    .onSwitchIn = WarpUnitMapSelect_SwitchIn,
    .onCancel = GenericSelection_BackToUM_CamWait,
};

struct SelectInfo CONST_DATA gSelectInfo_Steal =
{
    .onInit = StealMapSelect_Init,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = StealMapSelect_SwitchIn,
    .onSelect = StealMapSelect_Select,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Summon =
{
    .onInit = SummonSelection_OnInit,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = SummonSelection_OnChange,
    .onSelect = SummonSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Pick =
{
    .onInit = PickSelection_OnInit,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSelect = PickSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Support =
{
    .onInit = TalkSupportSelection_OnInit,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = TalkSupportSelection_OnChange,
    .onSelect = SupportSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Talk =
{
    .onInit = TalkSupportSelection_OnInit,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = TalkSupportSelection_OnChange,
    .onSelect = TalkSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Repair =
{
    .onInit = RepairSelectOnInit,
    .onSwitchIn = RepairSelectOnChange,
    .onSelect = RepairSelectOnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Trade =
{
    .onInit = TradeTargetSelection_OnInit,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSwitchIn = TradeSelection_OnChange,
    .onSelect = TradeSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Attack =
{
    .onInit = MISMATCHED_SIGNATURE(NewBattleForecast),
    .onEnd = MISMATCHED_SIGNATURE(AttackMapSelect_End),
    .onSwitchIn = AttackMapSelect_SwitchIn,
    .onSelect = AttackMapSelect_Select,
    .onCancel = AttackMapSelect_Cancel,
    .onHelp = StartBattleForecastHelpBox,
};

struct SelectInfo CONST_DATA gSelectInfo_Give =
{
    .onInit = GiveSelection_OnInit,
    .onSwitchIn = GiveSelection_OnChange,
    .onSelect = GiveSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Take =
{
    .onInit = TakeSelection_OnInit,
    .onSwitchIn = TakeSelection_OnChange,
    .onSelect = TakeSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Drop =
{
    .onInit = DropSelection_OnConstruction,
    .onEnd = MISMATCHED_SIGNATURE(ClearBg0Bg1),
    .onSelect = DropSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
};

struct SelectInfo CONST_DATA gSelectInfo_Rescue =
{
    .onInit = RescueSelection_OnConstruction,
    .onSwitchIn = RescueSelection_OnChange,
    .onSelect = RescueSelection_OnSelect,
    .onCancel = GenericSelection_BackToUM,
    .onHelp = RescueSelection_OnHelp,
};
