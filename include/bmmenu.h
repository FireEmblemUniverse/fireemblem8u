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
u8 StaffItemSelect_Usability(const struct MenuItemDef*, int number);
void StaffItemSelect_TextDraw(struct MenuProc*, struct MenuItemProc*);
u8 StaffItemSelect_Effect(struct MenuProc*, struct MenuItemProc*);
void StaffItemSelect_OnHover(struct MenuProc*, struct MenuItemProc*);
void StaffItemSelect_SwitchOut(struct MenuProc*, struct MenuItemProc*);
u8 ItemSelectMenu_Usability(const struct MenuItemDef*, int number);
void ItemSelectMenu_TextDraw(struct MenuProc*, struct MenuItemProc*);
u8 ItemSelectMenu_Effect(struct MenuProc*, struct MenuItemProc*);
u8 BallistaRangeMenu_BallistaUsability(const struct MenuItemDef*, int number);
void BallistaRangeMenu_Draw(struct MenuProc*, struct MenuItemProc*);
u8 BallistaRangeMenu_Select(struct MenuProc*, struct MenuItemProc*);
void FillBallistaRange(struct MenuProc*, struct MenuItemProc*);
void BallistaRangeMenu_SwitchOut(struct MenuProc*, struct MenuItemProc*);
u8 UnknownMenu_IsAvailable(const struct MenuItemDef*, int number);
void UnknownMenu_Draw(struct MenuProc*, struct MenuItemProc*);
u8 UnknownMenu_Selected(struct MenuProc*, struct MenuItemProc*);
void UnknownMenu_SwitchIn(struct MenuProc*, struct MenuItemProc*);
u8 UnitActionMenu_CanSeize(const struct MenuItemDef*, int number);
u8 UnitActionMenu_Seize(struct MenuProc*, struct MenuItemProc*);
u8 AttackCommandUsability(const struct MenuItemDef*, int number);
u8 AttackBallistaCommandUsability(const struct MenuItemDef*, int number);
u8 UnitActionMenu_Attack(struct MenuProc*, struct MenuItemProc*);
void DisplayUnitStandingAttackRange(struct MenuProc*, struct MenuItemProc*);
void HideMoveRangeGraphicsWrapper(struct MenuProc*, struct MenuItemProc*);
u8 StaffCommandUsability(const struct MenuItemDef*, int number);
u8 StaffCommandEffect(struct MenuProc*, struct MenuItemProc*);
void StaffCommandRange(struct MenuProc*, struct MenuItemProc*);
void HideMoveRangeGraphicsWrapper2(struct MenuProc*, struct MenuItemProc*);
u8 RideCommandUsability(const struct MenuItemDef*, int number);
u8 ExitCommandUsability(const struct MenuItemDef*, int number);
u8 RideCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 ExitCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 PlayCommandUsability(const struct MenuItemDef*, int number);
u8 PlayCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 DanceCommandUsability(const struct MenuItemDef*, int number);
u8 StealCommandUsability(const struct MenuItemDef*, int number);
u8 StealCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 SummonCommandUsability(const struct MenuItemDef*, int number);
u8 SummonCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 YobimaCommandUsability(const struct MenuItemDef*, int number);
u8 YobimaCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 PickCommandUsability(const struct MenuItemDef*, int number);
u8 PickCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 TalkCommandUsability(const struct MenuItemDef*, int number);
u8 TalkCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 SupportCommandUsability(const struct MenuItemDef*, int number);
u8 SupportCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 VisitCommandUsability(const struct MenuItemDef*, int number);
u8 VisitCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 ChestCommandUsability(const struct MenuItemDef*, int number);
u8 ChestCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 DoorCommandUsability(const struct MenuItemDef*, int number);
u8 DoorCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 ArmoryCommandUsability(const struct MenuItemDef*, int number);
u8 ArmoryCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 VendorCommandUsability(const struct MenuItemDef*, int number);
u8 VendorCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 SecretShopCommandUsability(const struct MenuItemDef*, int number);
u8 SecretShopCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 ArenaCommandUsability(const struct MenuItemDef*, int number);
u8 ArenaCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 RescueUsability(const struct MenuItemDef*, int number);
u8 RescueEffect(struct MenuProc*, struct MenuItemProc*);
u8 DropUsability(const struct MenuItemDef*, int number);
u8 DropEffect(struct MenuProc*, struct MenuItemProc*);
u8 TakeUsability(const struct MenuItemDef*, int number);
u8 TakeEffect(struct MenuProc*, struct MenuItemProc*);
u8 GiveUsability(const struct MenuItemDef*, int number);
u8 GiveEffect(struct MenuProc*, struct MenuItemProc*);
u8 ItemCommandUsability(const struct MenuItemDef*, int number);
u8 ItemCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 TradeCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 SupplyUsability(const struct MenuItemDef*, int number);
u8 SupplyCommandEffect(struct MenuProc*, struct MenuItemProc*);
u8 EffectWait(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_UnitCommand(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_StatusCommand(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_IsGuideCommandAvailable(const struct MenuItemDef*, int number);
void MapMenu_GuideCommandDraw(struct MenuProc*, struct MenuItemProc*);
u8 Make6CE_Guide(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_IsRecordsCommandAvailable(const struct MenuItemDef*, int number);
u8 MapMenu_RecordsCommand(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_OptionsCommand(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_IsRetreatCommandAvailable(const struct MenuItemDef*, int number);
u8 MapMenu_RetreatCommand(struct MenuProc*, struct MenuItemProc*);
u8 MapMenu_IsSuspendCommandAvailable(const struct MenuItemDef*, int number);
u8 MapMenu_SuspendCommand(struct MenuProc*, struct MenuItemProc*);
u8 CommandEffectEndPlayerPhase(struct MenuProc*, struct MenuItemProc*);
u8 ItemMenu_ButtonBPressed(struct MenuProc*, struct MenuItemProc*);
void ItemMenu_HelpBox(struct MenuProc*, struct MenuItemProc*);
void ConvoyMenu_HelpBox(struct MenuProc*, struct MenuItemProc*);
void ItemSubMenuEnd(struct MenuProc*);
void ItemMenuHelpBox(struct MenuProc*, struct MenuItemProc*);
void BallistaRangeMenuHelpBox(struct MenuProc*, struct MenuItemProc*);

#endif //BMMENU_H
