#ifndef BMITEMUSE_H
#define BMITEMUSE_H

u8 ItemUseMenu_IsAvailable(const struct MenuItemDef*, int number);
void ItemUseMenu_Draw(struct MenuProc*, struct            MenuItemProc*);
u8 ItemUseMenu_Selected(struct MenuProc*, struct          MenuItemProc*);
void ItemUseMenu_SwitchIn(struct MenuProc*, struct        MenuItemProc*);
void ItemUseMenu_SwitchOut_DoNothing(struct MenuProc*, struct MenuItemProc*);

#endif //BMITEMUSE_H
