#ifndef GUARD_ITEMUSE_H
#define GUARD_ITEMUSE_H

#include "global.h"
#include "proc.h"

struct MenuItemDef;
struct MenuProc;
struct MenuItemProc;
struct SelectTarget;

struct WarpSelectProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4A);
    /* 4A */ s16 prevWarpAllowed;
    /* 4C */ STRUCT_PAD(0x4C, 0x54);
    /* 54 */ struct APHandle * ap;
};

s8 CanUnitUseItem(struct Unit * unit, int item);
int GetItemCantUseMsgid(struct Unit * unit, int item);
void DoItemUse(struct Unit * unit, int item);
s8 HasSelectTarget(struct Unit * unit, void (*func)(struct Unit *));
s8 CanUnitUseHealItem(struct Unit * unit);
s8 sub_802909C(struct Unit * unit);
s8 CanUnitUsePureWaterItem(struct Unit * unit);
s8 CanUnitUseTorchItem(struct Unit * unit);
s8 CanUnitUseAntitoxinItem(struct Unit * unit);
s8 CanUnitUseChestKeyItem(struct Unit * unit);
s8 CanUnitUseDoorKeyItem(struct Unit * unit);
s8 CanUnitOpenBridge(struct Unit * unit);
s8 CanUnitUseLockpickItem(struct Unit * unit);
s8 CanUnitUsePromotionItem(struct Unit * unit, int item);
s8 CanUnitUseStatGainItem(struct Unit * unit, int item);
s8 CanUnitUseFruitItem(struct Unit * unit);

void SetStaffUseAction(struct Unit * unit);
void SetItemUseAction(struct Unit * unit);
u8 StaffSelectOnSelect(ProcPtr proc, struct SelectTarget * target);

void DoUseRescueStaff(struct Unit * unit, void (*func)(struct Unit *));
void DoUseSpecialDance(struct Unit * unit, void (*func)(struct Unit *), int msgHelp);

void WarpSelect_OnInit(struct WarpSelectProc * proc);
void WarpSelect_OnIdle(struct WarpSelectProc * proc);
void WarpSelect_OnConfirm(struct WarpSelectProc * proc);
void WarpSelect_OnCancel(struct WarpSelectProc * proc);
void WarpSelect_OnEnd(struct WarpSelectProc * proc);
u8 WarpOnSelectTarget(ProcPtr proc, struct SelectTarget * target);
void DoUseWarpStaff(struct Unit * unit);

u8 OnSelectPutTrap(ProcPtr proc, struct SelectTarget * target);
void DoUsePutTrap(struct Unit * unit, void (*func)(struct Unit *), int msgHelp);

u8 RepairSelectOnSelect(ProcPtr proc, struct SelectTarget * target);
void DoUseRepairStaff(struct Unit * unit);
u8 RepairSelectOnChange(ProcPtr proc, struct SelectTarget * target);
void RepairSelectOnInit(ProcPtr proc);
int RepairMenuItemOnChange(struct MenuProc * menu, struct MenuItemProc * item);
int RepairMenuItemOnChangeOut(struct MenuProc * menu, struct MenuItemProc * item);
u8 RepairMenuItemIsAvailable(const struct MenuItemDef * def, int number);
int RepairMenuItemDraw(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 RepairMenuItemSelect(struct MenuProc * menu, struct MenuItemProc * menuItem);

void DoUseHealStaff(struct Unit * unit, void (*func)(struct Unit *));
void DoUseRestoreStaff(struct Unit * unit, void (*func)(struct Unit *));
int RestoreMapSelect_Init(ProcPtr proc);
u8 RestoreMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target);

void DoUseBarrierStaff(struct Unit * unit);
int BarrierMapSelect_Init(ProcPtr proc);
u8 BarrierMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target);

void DoUseAttackStaff(struct Unit * unit, void (*func)(struct Unit *));
int AttackStaffMapSelect_Init(ProcPtr proc);
u8 AttackStaffMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target);

void SubtitleMapSelect_End(ProcPtr proc);
int sub_8029D38(struct Unit * unit);
void sub_8029D6C(void);

void TorchSelect_OnInit(struct WarpSelectProc * proc);
void TorchSelect_OnIdle(struct WarpSelectProc * proc);
void DoUseTorchStaff(struct Unit * unit);

s8 CanUnitUseItemPrepScreen(struct Unit * unit, int item);
s8 sub_802A108(struct Unit * unit);

#endif // GUARD_ITEMUSE_H
