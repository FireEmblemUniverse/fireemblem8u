
#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "mu.h"

#include "constants/classes.h"

enum
{
	STATSCREEN_BGPAL_3 = 3,
	STATSCREEN_BGPAL_ITEMICONS = 4,
	STATSCREEN_BGPAL_EXTICONS = 5,
	STATSCREEN_BGPAL_6 = 6,
	STATSCREEN_BGPAL_7 = 7,
};

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

	STATSCREEN_TEXT_CHARANAME, // 0
	STATSCREEN_TEXT_CLASSNAME, // 1

	STATSCREEN_TEXT_POWLABEL = 3,
	STATSCREEN_TEXT_RESCUENAME = 12,
	STATSCREEN_TEXT_STATUS = 14,

	STATSCREEN_TEXT_ITEM0, // 15
	STATSCREEN_TEXT_ITEM1, // 16
	STATSCREEN_TEXT_ITEM2, // 17
	STATSCREEN_TEXT_ITEM3, // 18
	STATSCREEN_TEXT_ITEM4, // 19

	STATSCREEN_TEXT_BSRANGE, // 20

	STATSCREEN_TEXT_SUPPORT0 = 29,
	STATSCREEN_TEXT_SUPPORT1, // 30
	STATSCREEN_TEXT_SUPPORT2, // 31
	STATSCREEN_TEXT_SUPPORT3, // 32
	STATSCREEN_TEXT_SUPPORT4, // 33

	STATSCREEN_TEXT_BWL, // 34

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

#ifdef NONMATCHING

void DrawStatScreenBar(int arg0, int x, int y, int base, int total, int max)
{
	int diff = total - base;

	DrawDecNumber(gUnknown_02003D2C + TILEMAP_INDEX(x, y),
		(base == max) ? TEXT_COLOR_GREEN : TEXT_COLOR_BLUE, base);

	sub_8004BF0(diff, gUnknown_02003D2C + TILEMAP_INDEX(x + 1, y));

	if (total > 30)
		diff = 30 - base;

	sub_8086B2C(0x401 + arg0*3, 6,
		gUnknown_0200472C + TILEMAP_INDEX(x - 2, y + 1),
		TILEREF(0, STATSCREEN_BGPAL_3), max * 41 / 30, base * 41 / 30, diff * 41 / 30);
}

#else // NONMATCHING

__attribute__((naked))
void DrawStatScreenBar(int arg0, int x, int y, int base, int total, int max)
{
	asm("\n\
		.syntax unified\n\
		push {r4, r5, r6, r7, lr}\n\
		mov r7, sl\n\
		mov r6, r9\n\
		mov r5, r8\n\
		push {r5, r6, r7}\n\
		sub sp, #0x10\n\
		mov sl, r0\n\
		mov r8, r1\n\
		str r2, [sp, #0xc]\n\
		adds r7, r3, #0\n\
		ldr r5, [sp, #0x30]\n\
		subs r0, r5, r7\n\
		mov r9, r0\n\
		lsls r6, r2, #5\n\
		adds r0, r6, r1\n\
		lsls r0, r0, #1\n\
		ldr r4, _08087178  @ gUnknown_02003D2C\n\
		adds r0, r0, r4\n\
		movs r1, #2\n\
		ldr r2, [sp, #0x34]\n\
		cmp r7, r2\n\
		bne _080870EA\n\
		movs r1, #4\n\
	_080870EA:\n\
		adds r2, r7, #0\n\
		bl DrawDecNumber\n\
		adds r1, r6, #1\n\
		add r1, r8\n\
		lsls r1, r1, #1\n\
		adds r1, r1, r4\n\
		mov r0, r9\n\
		bl sub_8004BF0\n\
		cmp r5, #0x1e\n\
		ble _08087108\n\
		movs r5, #0x1e\n\
		subs r5, r5, r7\n\
		mov r9, r5\n\
	_08087108:\n\
		mov r0, sl\n\
		lsls r5, r0, #1\n\
		add r5, sl\n\
		lsls r5, r5, #1\n\
		ldr r1, _0808717C  @ 0x00000401\n\
		adds r5, r5, r1\n\
		ldr r4, [sp, #0xc]\n\
		adds r4, #1\n\
		lsls r4, r4, #5\n\
		subs r4, #2\n\
		add r4, r8\n\
		lsls r4, r4, #1\n\
		ldr r0, _08087180  @ gUnknown_0200472C\n\
		adds r4, r4, r0\n\
		movs r6, #0xc0\n\
		lsls r6, r6, #7\n\
		ldr r2, [sp, #0x34]\n\
		lsls r0, r2, #2\n\
		adds r0, r0, r2\n\
		lsls r0, r0, #3\n\
		adds r0, r0, r2\n\
		movs r1, #0x1e\n\
		bl __divsi3\n\
		str r0, [sp]\n\
		lsls r0, r7, #2\n\
		adds r0, r0, r7\n\
		lsls r0, r0, #3\n\
		adds r0, r0, r7\n\
		movs r1, #0x1e\n\
		bl __divsi3\n\
		str r0, [sp, #4]\n\
		mov r1, r9\n\
		lsls r0, r1, #2\n\
		add r0, r9\n\
		lsls r0, r0, #3\n\
		add r0, r9\n\
		movs r1, #0x1e\n\
		bl __divsi3\n\
		str r0, [sp, #8]\n\
		adds r0, r5, #0\n\
		movs r1, #6\n\
		adds r2, r4, #0\n\
		adds r3, r6, #0\n\
		bl sub_8086B2C\n\
		add sp, #0x10\n\
		pop {r3, r4, r5}\n\
		mov r8, r3\n\
		mov r9, r4\n\
		mov sl, r5\n\
		pop {r4, r5, r6, r7}\n\
		pop {r0}\n\
		bx r0\n\
		.align 2, 0\n\
	_08087178: .4byte gUnknown_02003D2C\n\
	_0808717C: .4byte 0x00000401\n\
	_08087180: .4byte gUnknown_0200472C\n\
		.syntax divided\n\
	");
}

#endif // NONMATCHING

extern const struct Unk8086E00 gUnknown_08205964[];

void DrawUnitStatScreen(void)
{
	sub_8086E00(gUnknown_08205964);

	// Displaying str/mag label
	if (UnitHasMagicRank(gUnknown_02003BFC.unit))
	{
		// mag
		DrawTextInline(
			&gUnknown_02003BFC.text[STATSCREEN_TEXT_POWLABEL],
			gUnknown_02003D2C + TILEMAP_INDEX(1, 1),
			TEXT_COLOR_GOLD, 0, 0,
			GetStringFromIndex(0x4FF)); // Mag
	}
	else
	{
		// str
		DrawTextInline(
			&gUnknown_02003BFC.text[STATSCREEN_TEXT_POWLABEL],
			gUnknown_02003D2C + TILEMAP_INDEX(1, 1),
			TEXT_COLOR_GOLD, 0, 0,
			GetStringFromIndex(0x4FE)); // Str
	}

	// displaying str/mag stat value
	DrawStatScreenBar(0, 5, 1,
		gUnknown_02003BFC.unit->pow,
		GetUnitPower(gUnknown_02003BFC.unit),
		UNIT_POW_MAX(gUnknown_02003BFC.unit));

	// displaying skl stat value
	DrawStatScreenBar(1, 5, 3,
		gUnknown_02003BFC.unit->state & US_RESCUING
			? gUnknown_02003BFC.unit->skl/2
			: gUnknown_02003BFC.unit->skl,
		GetUnitSkill(gUnknown_02003BFC.unit),
		gUnknown_02003BFC.unit->state & US_RESCUING
			? UNIT_SKL_MAX(gUnknown_02003BFC.unit)/2
			: UNIT_SKL_MAX(gUnknown_02003BFC.unit));

	// displaying spd stat value
	DrawStatScreenBar(2, 5, 5,
		gUnknown_02003BFC.unit->state & US_RESCUING
			? gUnknown_02003BFC.unit->spd/2
			: gUnknown_02003BFC.unit->spd,
		GetUnitSpeed(gUnknown_02003BFC.unit),
		gUnknown_02003BFC.unit->state & US_RESCUING
			? UNIT_SPD_MAX(gUnknown_02003BFC.unit)/2
			: UNIT_SPD_MAX(gUnknown_02003BFC.unit));

	// displaying lck stat value
	DrawStatScreenBar(3, 5, 7,
		gUnknown_02003BFC.unit->lck,
		GetUnitLuck(gUnknown_02003BFC.unit),
		UNIT_LCK_MAX(gUnknown_02003BFC.unit));

	// displaying def stat value
	DrawStatScreenBar(4, 5, 9,
		gUnknown_02003BFC.unit->def,
		GetUnitDefense(gUnknown_02003BFC.unit),
		UNIT_DEF_MAX(gUnknown_02003BFC.unit));

	// displaying res stat value
	DrawStatScreenBar(5, 5, 11,
		gUnknown_02003BFC.unit->res,
		GetUnitResistance(gUnknown_02003BFC.unit),
		UNIT_RES_MAX(gUnknown_02003BFC.unit));

	// displaying mov stat value
	DrawStatScreenBar(6, 13, 1,
		UNIT_MOV_BASE(gUnknown_02003BFC.unit),
		UNIT_MOV(gUnknown_02003BFC.unit),
		UNIT_MOV_MAX(gUnknown_02003BFC.unit));

	// displaying con stat value
	DrawStatScreenBar(7, 13, 3,
		UNIT_CON_BASE(gUnknown_02003BFC.unit),
		UNIT_CON(gUnknown_02003BFC.unit),
		UNIT_CON_MAX(gUnknown_02003BFC.unit));

	// displaying unit aid
	DrawDecNumber(gUnknown_02003D2C + TILEMAP_INDEX(13, 5), TEXT_COLOR_BLUE,
		GetUnitAid(gUnknown_02003BFC.unit));

	// displaying unit aid icon
	DrawIcon(gUnknown_02003D2C + TILEMAP_INDEX(14, 5),
		GetUnitAidIconId(UNIT_CATTRIBUTES(gUnknown_02003BFC.unit)),
		TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

	// displaying unit rescue name
	Text_InsertString(
		&gUnknown_02003BFC.text[STATSCREEN_TEXT_RESCUENAME],
		24, TEXT_COLOR_BLUE,
		GetUnitRescueName(gUnknown_02003BFC.unit));

	// displaying unit status name and turns

	if (gUnknown_02003BFC.unit->statusIndex != UNIT_STATUS_RECOVER)
	{
		// display name

		if (gUnknown_02003BFC.unit->statusIndex == UNIT_STATUS_NONE)
		{
			Text_InsertString(
				&gUnknown_02003BFC.text[STATSCREEN_TEXT_STATUS],
				24, TEXT_COLOR_BLUE,
				GetUnitStatusName(gUnknown_02003BFC.unit));
		}
		else
		{
			Text_InsertString(
				&gUnknown_02003BFC.text[STATSCREEN_TEXT_STATUS],
				22, TEXT_COLOR_BLUE,
				GetUnitStatusName(gUnknown_02003BFC.unit));
		}

		// display turns

		if (gUnknown_02003BFC.unit->statusIndex != UNIT_STATUS_NONE)
		{
			sub_8004BE4(
				gUnknown_02003D2C + TILEMAP_INDEX(16, 11),
				0, gUnknown_02003BFC.unit->statusDuration);
		}
	}
	else
	{
		// I do not understand what this is for

		struct Unit tmp = *gUnknown_02003BFC.unit;

		tmp.statusIndex = 0;

		if (gUnknown_02003BFC.unit->statusIndex == UNIT_STATUS_NONE)
		{
			Text_InsertString(
				&gUnknown_02003BFC.text[STATSCREEN_TEXT_STATUS],
				24, TEXT_COLOR_BLUE,
				GetUnitStatusName(&tmp));
		}
		else
		{
			Text_InsertString(
				&gUnknown_02003BFC.text[STATSCREEN_TEXT_STATUS],
				22, TEXT_COLOR_BLUE,
				GetUnitStatusName(&tmp));
		}
	}

	// display affininity icon

	DrawIcon(
		gUnknown_02003D2C + TILEMAP_INDEX(12, 9),
		GetUnitAffinityIcon(gUnknown_02003BFC.unit),
		TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

	sub_8086FAC();
}

extern u8 CONST_DATA gUnknown_08A02204[]; // tsa
extern u8 CONST_DATA gUnknown_08A02250[]; // tsa

void CallARM_FillTileRect(u16* tilemap, const void* tsa, int tileref);

extern const struct Unk8086E00 gUnknown_08205A24[];

void DrawUnitItemScreen(void)
{
	int i, item;
	const char* str;

	CopyDataWithPossibleUncomp(
		gUnknown_08A02204,
		gUnknown_02020188);

	CallARM_FillTileRect(
		gUnknown_0200472C + TILEMAP_INDEX(1, 11),
		gUnknown_02020188, TILEREF(0x40, STATSCREEN_BGPAL_3));

	sub_8086E00(gUnknown_08205A24);

	if (!UNIT_IS_GORGON_EGG(gUnknown_02003BFC.unit))
	{
		for (i = 0; (i < UNIT_ITEM_COUNT) && (item = gUnknown_02003BFC.unit->items[i]); ++i)
		{
			int color;

			if ((gUnknown_02003BFC.unit->state & US_DROP_ITEM) && (i == GetUnitItemCount(gUnknown_02003BFC.unit) - 1))
				color = TEXT_COLOR_GREEN;
			else
				color = IsItemDisplayUsable(gUnknown_02003BFC.unit, item)
					? TEXT_COLOR_NORMAL
					: TEXT_COLOR_GRAY;

			DrawItemStatScreenLine(
				&gUnknown_02003BFC.text[STATSCREEN_TEXT_ITEM0 + i],
				item, color,
				gUnknown_02003D2C + TILEMAP_INDEX(1, 1 + i*2));
		}
	}

	i = GetUnitEquippedWeaponSlot(gUnknown_02003BFC.unit);
	item = 0;

	if (gUnknown_02003BFC.unit->pClassData->number != CLASS_GORGONEGG)
	{
		if ((gUnknown_02003BFC.unit->pClassData->number != CLASS_GORGONEGG2) && (i >= 0))
		{
			sub_8004B0C(
				gUnknown_02003D2C + TILEMAP_INDEX(16, 1 + i*2),
				0, 0x35);

			CallARM_FillTileRect(
				gUnknown_0200472C + TILEMAP_INDEX(1, 2 + i*2),
				gUnknown_08A02250, TILEREF(0x40, STATSCREEN_BGPAL_3));

			item = gUnknown_02003BFC.unit->items[i];
		}
	}

	if (!UNIT_IS_GORGON_EGG(gUnknown_02003BFC.unit))
	{
		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(8,  13),
			TEXT_COLOR_BLUE, gBattleActor.battleAttack);

		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(8,  15),
			TEXT_COLOR_BLUE, gBattleActor.battleHitRate);

		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(15, 13),
			TEXT_COLOR_BLUE, gBattleActor.battleCritRate);

		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(15, 15),
			TEXT_COLOR_BLUE, gBattleActor.battleAvoidRate);
	}
	else
	{
		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(8,  13),
			TEXT_COLOR_BLUE, 0xFF);

		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(8,  15),
			TEXT_COLOR_BLUE, 0xFF);

		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(15, 13),
			TEXT_COLOR_BLUE, 0xFF);

		DrawDecNumber(
			gUnknown_02003D2C + TILEMAP_INDEX(15, 15),
			TEXT_COLOR_BLUE, gBattleActor.battleAvoidRate);

		item = 0;
	}

	// TODO: macro, maybe?

	str = GetItemDisplayRangeString(item);
	Text_InsertString(
		&gUnknown_02003BFC.text[STATSCREEN_TEXT_BSRANGE],
		55 - GetStringTextWidth(str),
		TEXT_COLOR_BLUE, str);

	for (i = 0; i < 8; ++i)
	{
		gUnknown_02003D2C[TILEMAP_INDEX(1 + i, 11)] = TILEREF(0x60 + i, STATSCREEN_BGPAL_7);
		gUnknown_02003D2C[TILEMAP_INDEX(1 + i, 12)] = TILEREF(0x68 + i, STATSCREEN_BGPAL_7);
	}
}

void DrawUnitScreenSupportList(void)
{
	int yTile = 6, lineNum = 0;

	int textColor = GetUnitTotalSupportLevel(gUnknown_02003BFC.unit) == MAX_SIMULTANEOUS_SUPPORT_COUNT
		? TEXT_COLOR_GREEN
		: TEXT_COLOR_NORMAL;

	int supportAmt = GetUnitSupporterCount(gUnknown_02003BFC.unit);
	int supportId  = 0;

	while (supportId < supportAmt)
	{
		int level = GetUnitSupportLevel(gUnknown_02003BFC.unit, supportId);

		if (level != 0)
		{
			int rankColor;

			u8 pid = GetUnitSupporterCharacter(gUnknown_02003BFC.unit, supportId);

			DrawIcon(
				gUnknown_02003D2C + TILEMAP_INDEX(4, yTile),
				GetCharacterAffinityIcon(pid),
				TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

			DrawTextInline(&gUnknown_02003BFC.text[STATSCREEN_TEXT_SUPPORT0 + lineNum],
				gUnknown_02003D2C + TILEMAP_INDEX(7, yTile),
				textColor, 0, 0,
				GetStringFromIndex(GetCharacterData(pid)->nameTextId));

			rankColor = TEXT_COLOR_BLUE;

			if (level == 3)
				rankColor = TEXT_COLOR_GREEN;

			if (textColor == TEXT_COLOR_GREEN)
				rankColor = TEXT_COLOR_GREEN;

			sub_8004B0C(gUnknown_02003D2C + TILEMAP_INDEX(13, yTile),
				rankColor, GetSupportLevelUiChar(level));

			yTile += 2;
			lineNum++;
		}

		supportId++;
	}
}
