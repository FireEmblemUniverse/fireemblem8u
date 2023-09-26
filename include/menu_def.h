#ifndef GUARD_MENU_DEF_H
#define GUARD_MENU_DEF_H

struct MenuDef;
struct SelectTarget;

extern const struct MenuDef gDebugClearMenuDef;
extern const struct MenuDef gDebugChargeMenuDef;
extern const struct MenuDef gDebugContinueMenuDef;
extern const struct MenuDef gDebugChuudanMenuDef;
extern const struct MenuDef gDebugMenuDef;
extern const struct MenuDef gMenuInfo_RepairItems;
extern const struct MenuDef gStealItemMenuDef;
extern const struct MenuDef gYesNoSelectionMenuDef;
extern const struct MenuDef gItemSubMenuDef;
extern const struct MenuDef gItemMenuDef;
extern const struct MenuDef gStaffItemSelectMenuDef;
extern const struct MenuDef gItemSelectMenuDef;
extern const struct MenuDef gBallistaRangeMenuDef;
extern const struct MenuDef gUnknownMenuDef;
extern const struct MenuDef gUnitActionMenuDef;

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
