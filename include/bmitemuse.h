#ifndef GUARD_ITEMUSE_H
#define GUARD_ITEMUSE_H

s8 CanUnitUseItem(struct Unit* unit, int item);
int GetItemCantUseMsgid(struct Unit* unit, int item);
void DoItemUse(struct Unit* unit, int item);
s8 CanUnitUseHealItem(struct Unit* unit);
s8 sub_802909C(struct Unit* unit);
s8 CanUnitUsePureWaterItem(struct Unit* unit);
s8 CanUnitUseTorchItem(struct Unit* unit);
s8 CanUnitUseAntitoxinItem(struct Unit* unit);
s8 CanUnitUseChestKeyItem(struct Unit* unit);
s8 CanUnitUseDoorKeyItem(struct Unit* unit);
s8 CanUnitOpenBridge(struct Unit* unit);
s8 CanUnitUseLockpickItem(struct Unit* unit);
s8 CanUnitUsePromotionItem(struct Unit* unit, int item);
s8 CanUnitUseStatGainItem(struct Unit* unit, int item);
s8 CanUnitUseFruitItem(struct Unit* unit);
s8 CanUnitUseItemPrepScreen(struct Unit* unit, int item);
s8 sub_802A108(struct Unit* unit);

#endif // GUARD_ITEMUSE_H
