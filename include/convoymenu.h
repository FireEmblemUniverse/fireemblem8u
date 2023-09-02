#ifndef CONVOYMENU_H
#define CONVOYMENU_H

int SendToConvoyMenu_Draw(struct MenuProc*, struct MenuItemProc*);
u8 SendToConvoyMenu_Selected(struct MenuProc*, struct MenuItemProc*);
u8 SendToConvoyMenu_Selected2(struct MenuProc*, struct MenuItemProc*);
u8 SendToConvoyMenu_Idle(struct MenuProc*, struct MenuItemProc*);
int MenuCommand_DrawExtraItem(struct MenuProc*, struct MenuItemProc*);
u8 SendToConvoyMenu_NormalEffect(struct MenuProc*, struct MenuItemProc*);
u8 MenuCommand_SendItemToConvoy(struct MenuProc*, struct MenuItemProc*);

#endif //CONVOYMENU_H
