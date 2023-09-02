#ifndef GUARD_BM_CONTAINER_H
#define GUARD_BM_CONTAINER_H

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

#endif // GUARD_BM_CONTAINER_H