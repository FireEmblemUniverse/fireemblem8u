#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "bmbattle.h"
#include "uimenu.h"
#include "icon.h"
#include "bmitem.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "functions.h"

struct MenuItemPanelProc{
	PROC_HEADER;
	
	/* 2C */ struct Unit *unit;
	/* 30 */ u8 x;
	/* 31 */ u8 y;
	/* 32 */ u8 IconPalIndex;
	/* 33 */ s8 ItemSlotIndex;
	/* 34 */ struct TextHandle text[6];
	/* 64 */ u8 draw_arrow;
};

extern struct ProcCmd CONST_DATA gProcCmd_MenuItemPanel[];

void MenuItemPanelIdle(struct MenuItemPanelProc *proc) {
    if (0 == proc->draw_arrow)
        return;

    if (proc->ItemSlotIndex < 0)
        return;
    
	/* atk */
    if (gBattleActor.battleAttack > gBattleTarget.battleAttack)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 3) * 8, 0);
	if (gBattleActor.battleAttack < gBattleTarget.battleAttack)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 3) * 8, 1);

	/* hit */
	if (gBattleActor.battleHitRate > gBattleTarget.battleHitRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 5) * 8, 0);
	if (gBattleActor.battleHitRate < gBattleTarget.battleHitRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x33, (proc->y + 5) * 8, 1);

	/* crit */
	if (gBattleActor.battleCritRate > gBattleTarget.battleCritRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 3) * 8, 0);
	if (gBattleActor.battleCritRate < gBattleTarget.battleCritRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 3) * 8, 1);

	/* avoid */
	if (gBattleActor.battleAvoidRate > gBattleTarget.battleAvoidRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 5) * 8, 0);
	if (gBattleActor.battleAvoidRate < gBattleTarget.battleAvoidRate)
		UpdateStatArrowSprites(proc->x * 8 + 0x63, (proc->y + 5) * 8, 1);

}

void ForceMenuItemPanel(ProcPtr _menu_proc, struct Unit *unit, int x, int y)
{
	struct MenuProc *menu_proc = _menu_proc;
	struct MenuItemPanelProc *proc;

	if (NULL == Proc_Find(gProcCmd_MenuItemPanel)) {
		proc = Proc_Start(gProcCmd_MenuItemPanel, menu_proc);
		proc->unit = unit;
		proc->x = x;
		proc->y = y;
		proc->IconPalIndex = 3;
		proc->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
		proc->draw_arrow = TRUE;

		Text_Allocate(&proc->text[0], 0xC);
		Text_Allocate(&proc->text[1], 0xC);
		Text_Allocate(&proc->text[2], 0xC);

		LoadIconPalette(1, proc->IconPalIndex);
		BattleGenerateUiStats(proc->unit, BU_ISLOT_AUTO);

		gBattleTarget.battleAttack = gBattleActor.battleAttack;
		gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
		gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
		gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
	}
}

void UpdateMenuItemPanel(int slot) {
    struct MenuItemPanelProc *proc = Proc_Find(gProcCmd_MenuItemPanel);
	struct Unit *unit = proc->unit;
	int icon_pal = proc->IconPalIndex;
	u16 item, color;
	char *str;
	int i;

	Text_Clear(&proc->text[0]);
	Text_Clear(&proc->text[1]);
	Text_Clear(&proc->text[2]);

	DrawUiFrame2(proc->x, proc->y, 0xE, 0x8, 0x0);

	switch (slot) {
	case 0:
	case 1:
	case 2:
	case 3:
	case 4:
		item = unit->items[slot];
		break;

	case 5:
		item = gGameState.itemUnk2C;
		break;

	default:
		item = slot;
		slot = BU_ISLOT_BALLISTA;
		break;
	} /* switch slot */

	switch (GetItemType(item)) {
	case ITYPE_STAFF:
	case ITYPE_ITEM:
	case ITYPE_12:
		str = GetStringFromIndex(GetItemUseDescId(item));

		for (i = 0; 0 != *str; i++, str++) {
			Text_InsertString(&proc->text[i], 0, TEXT_COLOR_NORMAL, str);
			str = String_GetEnd(str);
		}
		
		gBattleTarget.battleAttack = gBattleActor.battleAttack;
		gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
		gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
		gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;

		Text_Draw(&proc->text[0], TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x, proc->y + 0x1));
		Text_Draw(&proc->text[1], TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x, proc->y + 0x3));
		Text_Draw(&proc->text[2], TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x, proc->y + 0xA));
		break;
	
	case ITYPE_SWORD:
	case ITYPE_LANCE:
	case ITYPE_AXE:
	case ITYPE_BOW:
	case ITYPE_ANIMA:
	case ITYPE_LIGHT:
	case ITYPE_DARK:
	case ITYPE_BLLST:
	case ITYPE_DRAGN:
	default:
		BattleGenerateUiStats(unit, slot);

		if (BU_ISLOT_BALLISTA == slot) {
			gBattleTarget.battleAttack = gBattleActor.battleAttack;
			gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
			gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
			gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
		}

		color = CanUnitUseWeapon(unit, item) ? TEXT_COLOR_BLUE : TEXT_COLOR_GRAY;

		Text_InsertString(&proc->text[0], 0x1C, TEXT_COLOR_NORMAL, GetStringFromIndex(0x4F1));
		Text_InsertString(&proc->text[1], 0x02, TEXT_COLOR_NORMAL, GetStringFromIndex(0x4F3));
		Text_InsertString(&proc->text[2], 0x02, TEXT_COLOR_NORMAL, GetStringFromIndex(0x4F4));
		Text_InsertString(&proc->text[1], 0x32, TEXT_COLOR_NORMAL, GetStringFromIndex(0x501));
		Text_InsertString(&proc->text[2], 0x32, TEXT_COLOR_NORMAL, GetStringFromIndex(0x4F5));
		
		Text_InsertNumberOr2Dashes(&proc->text[1], 0x24, color, gBattleActor.battleAttack);
		Text_InsertNumberOr2Dashes(&proc->text[2], 0x24, color, gBattleActor.battleHitRate);
		Text_InsertNumberOr2Dashes(&proc->text[1], 0x54, color, gBattleActor.battleCritRate);
		Text_InsertNumberOr2Dashes(&proc->text[2], 0x54, color, gBattleActor.battleAvoidRate);
		
		Text_Draw(&proc->text[0], TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x, proc->y + 0x1));
		Text_Draw(&proc->text[1], TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x, proc->y + 0x3));
		Text_Draw(&proc->text[2], TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x, proc->y + 0xA));
		
		DrawIcon(
			TILEMAP_LOCATED(BG_GetMapBuffer(0), proc->x + 8, proc->y + 0x1),
			GetItemType(item) + 0x70,
			proc->IconPalIndex << 0xC);
		break;
	} /* switch item type */

	BG_EnableSyncByMask(BG0_SYNC_BIT);
}
