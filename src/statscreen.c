
#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"

__attribute__((packed, aligned(4)))
struct UnitUsageStats
{
	/* 000 */ unsigned lossAmt     : 8;
	/* 008 */ unsigned favval      : 16;
	/* 024 */ unsigned actAmt      : 8;
	/* 032 */ unsigned statViewAmt : 8;
	/* 040 */ unsigned deathLoc    : 6;
	/* 046 */ unsigned deathTurn   : 10;
	/* 056 */ unsigned deployAmt   : 6;
	/* 062 */ unsigned moveAmt     : 10;
	/* 072 */ unsigned deathCause  : 4;
	/* 076 */ unsigned expGained   : 12;
	/* 088 */ unsigned winAmt      : 10;
	/* 098 */ unsigned battleAmt   : 12;
	/* 110 */ unsigned killerPid   : 9;
	/* 119 */ unsigned deathSkirm  : 1;
	/* 120 */ /* 8bit pad */
};

extern struct UnitUsageStats* BWL_GetEntry(int pid);

struct Unk0203E764
{
	/* 00 */ u8  unk00;
	/* 01 */ u8  uid01;
	/* 02 */ u16 unk02;
};

struct Unk8086E00
{
	/* 00 */ struct TextHandle* text;
	/* 04 */ u16* tilemap;
	/* 08 */ u8 color;
	/* 09 */ u8 xoff;
	/* 0C */ u32* mid;
};

enum
{
	// Enumerate stat screen texts

	STATSCREEN_TEXT_CHARANAME,
	STATSCREEN_TEXT_CLASSNAME,

	STATSCREEN_TEXT_BWL = 34,

	STATSCREEN_TEXT_MAX
};

struct StatScreenSt
{
	/* 00 */ u8 page;
	/* 01 */ u8 pageAmt;
	/* 02 */ u16 unk02;
	/* 04 */ u16 unk04;
	/* 06 */ u16 yDispOff;
	/* 08 */ u8 inTransition;
	/* 0C */ struct Unit* unit;
	/* 10 */ struct MUProc* mu;
	/* 14 */ void* help;
	/* 18 */ struct TextHandle text[STATSCREEN_TEXT_MAX];
};

extern struct StatScreenSt gUnknown_02003BFC; // statscreen state
extern u16 gUnknown_02003D2C[]; // bg0 tilemap buffer for stat screen page
extern u16 gUnknown_0200472C[]; // bg2 tilemap buffer for stat screen page

extern struct Unk0203E764 gUnknown_0203E764; // big unk

extern struct TextBatch CONST_DATA gUnknown_08A006FC[];

int GetSomeUnitId(void)
{
	return gUnknown_0203E764.uid01;
}

void sub_8086DD8(int uid)
{
	gUnknown_0203E764.uid01 = uid;
}

void sub_8086DE4(int unk)
{
	gUnknown_0203E764.unk02 = unk;
}

void sub_8086DF0(void)
{
	InitTextBatch(gUnknown_08A006FC);
}

void sub_8086E00(const struct Unk8086E00* unk)
{
	while (unk->text)
	{
		if (unk->mid)
		{
			DrawTextInline(
				unk->text,
				unk->tilemap,
				unk->color,
				unk->xoff, 0,
				GetStringFromIndex(*unk->mid));
		}
		else
		{
			Text_Draw(unk->text, unk->tilemap);
		}

		++unk;
	}
}

void sub_8086E44(void)
{
	const char* namestr = GetStringFromIndex(UNIT_NAME_ID(gUnknown_02003BFC.unit));
	unsigned namexoff = GetStringTextCenteredPos(0x30, namestr);

	BG_Fill(gBG0TilemapBuffer, 0);

	// Generate battle stats for unit for display later
	BattleGenerateUiStats(
		gUnknown_02003BFC.unit,
		GetUnitEquippedWeaponSlot(gUnknown_02003BFC.unit));

	// Display character name
	DrawTextInline(
		&gUnknown_02003BFC.text[STATSCREEN_TEXT_CHARANAME],
		gBG0TilemapBuffer + TILEMAP_INDEX(3, 10),
		TEXT_COLOR_NORMAL, namexoff, 0, namestr);

	// Display class name
	DrawTextInline(
		&gUnknown_02003BFC.text[STATSCREEN_TEXT_CLASSNAME],
		gBG0TilemapBuffer + TILEMAP_INDEX(1, 13),
		TEXT_COLOR_NORMAL, 0, 0,
		GetStringFromIndex(gUnknown_02003BFC.unit->pClassData->nameTextId));

	// Display Lv/E labels
	sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(1, 15), TEXT_COLOR_GOLD, 0x24, 0x25);
	sub_8004B0C(gBG0TilemapBuffer + TILEMAP_INDEX(5, 15), TEXT_COLOR_GOLD, 0x1D);

	// Display Hp/'/' labels
	sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(1, 17), TEXT_COLOR_GOLD, 0x22, 0x23);
	sub_8004B0C(gBG0TilemapBuffer + TILEMAP_INDEX(5, 17), TEXT_COLOR_GOLD, 0x16);

	// Display level
	DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(4, 15), TEXT_COLOR_BLUE,
		gUnknown_02003BFC.unit->level);

	// Display exp
	DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(7, 15), TEXT_COLOR_BLUE,
		gUnknown_02003BFC.unit->exp);

	// Display current hp

	if (GetUnitCurrentHp(gUnknown_02003BFC.unit) > 99)
	{
		// Display '--' if current hp > 99
		sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(3, 17), TEXT_COLOR_BLUE,
			0x14, 0x14);
	}
	else
	{
		// Display current hp
		DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(4, 17), TEXT_COLOR_BLUE,
			GetUnitCurrentHp(gUnknown_02003BFC.unit));
	}

	// Display max hp

	if (GetUnitMaxHp(gUnknown_02003BFC.unit) > 99)
	{
		// Display '--' if max hp > 99
		sub_8004D5C(gBG0TilemapBuffer + TILEMAP_INDEX(6, 17), TEXT_COLOR_BLUE,
			0x14, 0x14);
	}
	else
	{
		// Display max hp
		DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(7, 17), TEXT_COLOR_BLUE,
			GetUnitMaxHp(gUnknown_02003BFC.unit));
	}
}

void sub_8086FAC(void)
{
	struct UnitUsageStats* stats = BWL_GetEntry(gUnknown_02003BFC.unit->pCharacterData->number);

	if (!stats)
		return;

	if (gUnknown_0202BCB0.gameStateBits & 0x40)
		return;

	if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_3)
		return;

	if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_7)
		return;

	if (IsFirstPlaythrough() == TRUE)
		return;

	if (UNIT_FACTION(gUnknown_02003BFC.unit) != FACTION_BLUE)
		return;

	Text_Clear(&gUnknown_02003BFC.text[STATSCREEN_TEXT_BWL]);

	// Draw B label
	Text_InsertString(&gUnknown_02003BFC.text[STATSCREEN_TEXT_BWL],
		0, TEXT_COLOR_GOLD, GetStringFromIndex(0x51F));

	// Draw W label
	Text_InsertString(&gUnknown_02003BFC.text[STATSCREEN_TEXT_BWL],
		32, TEXT_COLOR_GOLD, GetStringFromIndex(0x520));

	// Draw L label
	Text_InsertString(&gUnknown_02003BFC.text[STATSCREEN_TEXT_BWL],
		64, TEXT_COLOR_GOLD, GetStringFromIndex(0x521));

	// Display labels
	Text_Draw(&gUnknown_02003BFC.text[STATSCREEN_TEXT_BWL],
		gUnknown_02003D2C + TILEMAP_INDEX(3, 14));

	// Display Battle Amt
	sub_8004B88(gUnknown_02003D2C + TILEMAP_INDEX(3 + sub_80AEBEC(stats->battleAmt), 14),
		TEXT_COLOR_BLUE, stats->battleAmt);

	// Display Win Amt
	sub_8004B88(gUnknown_02003D2C + TILEMAP_INDEX(7 + sub_80AEBEC(stats->winAmt), 14),
		TEXT_COLOR_BLUE, stats->winAmt);

	// Display Loss Amt
	sub_8004B88(gUnknown_02003D2C + TILEMAP_INDEX(11 + sub_80AEBEC(stats->lossAmt), 14),
		TEXT_COLOR_BLUE, stats->lossAmt);
}

/*

void sub_8086B2C(int arg0, int arg1, u16* tilemap, int arg3, int arg4, int arg5, int arg6);

void DrawStatScreenBar(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5)
{
	int diff = arg4 - arg3;

	DrawDecNumber(gUnknown_02003D2C + TILEMAP_INDEX(arg1, arg2),
		(arg3 == arg5) ? TEXT_COLOR_GREEN : TEXT_COLOR_BLUE, arg3);

	sub_8004BF0(diff, gUnknown_02003D2C + TILEMAP_INDEX(arg1 + 1, arg2));

	if (arg4 > 30)
		diff = 30 - arg3;

	sub_8086B2C(0x401 + arg0*3, 6,
		gUnknown_0200472C + TILEMAP_INDEX(arg1 - 2, arg2 + 1),
		TILEREF(0, 6), arg5 * 41 / 30, arg3 * 41 / 30, diff * 41 / 30);
}

*/

/*

*/
