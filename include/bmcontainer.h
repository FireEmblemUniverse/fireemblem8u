#ifndef GUARD_BM_CONTAINER_H
#define GUARD_BM_CONTAINER_H

#include "global.h"
#include "uimenu.h"

enum { CONVOY_ITEM_COUNT = 100 };

u16* GetConvoyItemArray(void);
void ClearSupplyItems(void);
void ShrinkConvoyItemList(void);
int GetConvoyItemCount(void);
int AddItemToConvoy(int);
void RemoveItemFromConvoy(int);
int GetConvoyItemSlot(int);
bool8 HasConvoyAccess(void);
bool8 sub_8031660(void);
struct Unit* GetSupplyUnit(void);

extern EWRAM_DATA u8 gConvoyItemCount;
extern const struct MenuDef gSendToConvoyMenuDef;
extern const struct MenuDef gConvoyMenuDef;

#endif // GUARD_BM_CONTAINER_H