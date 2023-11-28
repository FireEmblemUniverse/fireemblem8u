#pragma once

#include "global.h"
#include "proc.h"
#include "bmunit.h"

struct MenuItemPanelProc {
	PROC_HEADER;
	
	/* 2C */ struct Unit *unit;
	/* 30 */ u8 x;
	/* 31 */ u8 y;
	/* 32 */ u8 IconPalIndex;
	/* 33 */ s8 ItemSlotIndex;
	/* 34 */ struct Text text[6];
	/* 64 */ u8 draw_arrow;
};

void MenuItemPanelProcIdle(struct MenuItemPanelProc * proc);
void ForceMenuItemPanel(ProcPtr parent, struct Unit * unit, int x, int y);
void UpdateMenuItemPanel(int slot_or_item);
void EndMenuItemPanel(void);

extern struct ProcCmd CONST_DATA gProcCmd_MenuItemPanel[];
