#ifndef GUARD_MENU_DEF_H
#define GUARD_MENU_DEF_H

struct MenuDef;
struct SelectTarget;

extern CONST_DATA struct MenuDef gDebugClearMenuDef;
extern CONST_DATA struct MenuDef gDebugChargeMenuDef;
extern CONST_DATA struct MenuDef gDebugContinueMenuDef;
extern CONST_DATA struct MenuDef gDebugChuudanMenuDef;
extern CONST_DATA struct MenuDef gDebugMenuDef;
extern CONST_DATA struct MenuDef gMenuInfo_RepairItems;
extern CONST_DATA struct MenuDef gStealItemMenuDef;
extern CONST_DATA struct MenuDef gYesNoSelectionMenuDef;
extern CONST_DATA struct MenuDef gItemSubMenuDef;
extern CONST_DATA struct MenuDef gItemMenuDef;
extern CONST_DATA struct MenuDef gStaffItemSelectMenuDef;
extern CONST_DATA struct MenuDef gItemSelectMenuDef;
extern CONST_DATA struct MenuDef gBallistaRangeMenuDef;
extern CONST_DATA struct MenuDef gUnknownMenuDef;
extern CONST_DATA struct MenuDef gUnitActionMenuDef;

extern struct SelectInfo CONST_DATA gSelectInfo_OffensiveStaff;
extern struct SelectInfo CONST_DATA gSelectInfo_Barrier;
extern struct SelectInfo CONST_DATA gSelectInfo_Restore;
extern struct SelectInfo CONST_DATA gSelectInfo_Heal;
extern struct SelectInfo CONST_DATA gSelectInfo_Dance;
extern struct SelectInfo CONST_DATA gSelectInfo_PutTrap;
extern struct SelectInfo CONST_DATA gSelectInfo_WarpUnit;
extern struct SelectInfo CONST_DATA gSelectInfo_Steal;
extern struct SelectInfo CONST_DATA gSelectInfo_Summon;
extern struct SelectInfo CONST_DATA gSelectInfo_Pick;
extern struct SelectInfo CONST_DATA gSelectInfo_Support;
extern struct SelectInfo CONST_DATA gSelectInfo_Talk;
extern struct SelectInfo CONST_DATA gSelectInfo_Repair;
extern struct SelectInfo CONST_DATA gSelectInfo_Trade;
extern struct SelectInfo CONST_DATA gSelectInfo_Attack;
extern struct SelectInfo CONST_DATA gSelectInfo_Give;
extern struct SelectInfo CONST_DATA gSelectInfo_Take;
extern struct SelectInfo CONST_DATA gSelectInfo_Drop;
extern struct SelectInfo CONST_DATA gSelectInfo_Rescue;

#endif // GUARD_MENU_DEF_H
