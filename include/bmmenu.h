#ifndef BMMENU_H
#define BMMENU_H

u8 StealItemMenuCommand_Usability(const struct MenuItemDef*, int number);
void StealItemMenuCommand_Draw(struct MenuProc*, struct MenuItemProc*);
u8 StealItemMenuCommand_Effect(struct MenuProc*, struct MenuItemProc*);
void Menu_SwitchIn(struct MenuProc*, struct MenuItemProc*);
void Menu_SwitchOut_DoNothing(struct MenuProc*, struct MenuItemProc*);
u8 MenuCommand_SelectYes(struct MenuProc*, struct MenuItemProc*);
u8 MenuCommand_SelectNo(struct MenuProc*, struct MenuItemProc*);
u8 ItemSubMenu_IsUseAvailable(const struct MenuItemDef*, int number);
u8 ItemSubMenu_UseItem(struct MenuProc*, struct MenuItemProc*);
u8 ItemSubMenu_IsEquipAvailable(const struct MenuItemDef*, int number);
u8 ItemSubMenu_EquipItem(struct MenuProc*, struct MenuItemProc*);
u8 ItemSubMenu_IsTradeAvailable(const struct MenuItemDef*, int number);
u8 ItemSubMenu_TradeItem(struct MenuProc*, struct MenuItemProc*);
u8 ItemSubMenu_IsDiscardAvailable(const struct MenuItemDef*, int number);
u8 ItemSubMenu_DiscardItem(struct MenuProc*, struct MenuItemProc*);
void ItemMenu_SwitchIn(struct MenuProc*, struct MenuItemProc*);
void ItemMenu_SwitchOut_DoNothing(struct MenuProc*, struct MenuItemProc*);
u8 ItemMenu_Is1stCommandAvailable(const struct MenuItemDef*, int number);
u8 ItemMenu_AreOtherCommandsAvailable(const struct MenuItemDef*, int number);
void ItemMenu_DrawOtherCommands(struct MenuProc*, struct MenuItemProc*);
void ItemMenu_Draw1stCommand(struct MenuProc*, struct MenuItemProc*);
u8 ItemMenu_Select1stCommand(struct MenuProc*, struct MenuItemProc*);
u8 ItemMenu_SelectOtherCommands(struct MenuProc*, struct MenuItemProc*);

#endif //BMMENU_H
