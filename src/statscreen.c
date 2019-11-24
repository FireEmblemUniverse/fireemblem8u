
#include "global.h"

#include <stdlib.h>
#include <string.h> // TODO: remove

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"

#include "constants/classes.h"

#include "statscreen.h"

extern struct StatScreenSt gUnknown_02003BFC; // statscreen state
extern u16 gUnknown_02003D2C[0x280]; // bg0 tilemap buffer for stat screen page
extern u16 gUnknown_0200472C[0x240]; // bg2 tilemap buffer for stat screen page

extern struct Unk0203E764 gUnknown_0203E764; // big unk

extern const struct HelpBoxInfo* gUnknown_0203E784;
extern struct HelpBoxInfo gUnknown_0203E768;
extern struct Vec2 gUnknown_0203E788;

const struct Unk8086E00 gUnknown_08205964[] =
{
	{ gUnknown_02003BFC.text + 4,  gUnknown_02003D2C + TILEMAP_INDEX(1, 3),  TEXT_COLOR_GOLD, 0, (void*) 0x8A0116C },
	{ gUnknown_02003BFC.text + 5,  gUnknown_02003D2C + TILEMAP_INDEX(1, 5),  TEXT_COLOR_GOLD, 0, (void*) 0x8A01170 },
	{ gUnknown_02003BFC.text + 6,  gUnknown_02003D2C + TILEMAP_INDEX(1, 7),  TEXT_COLOR_GOLD, 0, (void*) 0x8A0117C },
	{ gUnknown_02003BFC.text + 7,  gUnknown_02003D2C + TILEMAP_INDEX(1, 9),  TEXT_COLOR_GOLD, 0, (void*) 0x8A01174 },
	{ gUnknown_02003BFC.text + 8,  gUnknown_02003D2C + TILEMAP_INDEX(1, 11), TEXT_COLOR_GOLD, 0, (void*) 0x8A01178 },
	{ gUnknown_02003BFC.text + 9,  gUnknown_02003D2C + TILEMAP_INDEX(9, 1),  TEXT_COLOR_GOLD, 0, (void*) 0x8A01188 },
	{ gUnknown_02003BFC.text + 10, gUnknown_02003D2C + TILEMAP_INDEX(9, 3),  TEXT_COLOR_GOLD, 0, (void*) 0x8A01180 },
	{ gUnknown_02003BFC.text + 11, gUnknown_02003D2C + TILEMAP_INDEX(9, 5),  TEXT_COLOR_GOLD, 0, (void*) 0x8A01184 },
	{ gUnknown_02003BFC.text + 12, gUnknown_02003D2C + TILEMAP_INDEX(9, 7),  TEXT_COLOR_GOLD, 0, (void*) 0x8A0118C },
	{ gUnknown_02003BFC.text + 13, gUnknown_02003D2C + TILEMAP_INDEX(9, 9),  TEXT_COLOR_GOLD, 0, (void*) 0x8A01190 },
	{ gUnknown_02003BFC.text + 14, gUnknown_02003D2C + TILEMAP_INDEX(9, 11), TEXT_COLOR_GOLD, 0, (void*) 0x8A011A8 },

	{ }, // end
};

const struct Unk8086E00 gUnknown_08205A24[] =
{
	{ gUnknown_02003BFC.text + 21, gUnknown_02003D2C + TILEMAP_INDEX(2, 13), TEXT_COLOR_GOLD, 6, (void*) 0x8A01198 },
	{ gUnknown_02003BFC.text + 22, gUnknown_02003D2C + TILEMAP_INDEX(2, 15), TEXT_COLOR_GOLD, 6, (void*) 0x8A0119C },
	{ gUnknown_02003BFC.text + 20, gUnknown_02003D2C + TILEMAP_INDEX(9, 11), TEXT_COLOR_GOLD, 6, (void*) 0x8A01194 },
	{ gUnknown_02003BFC.text + 23, gUnknown_02003D2C + TILEMAP_INDEX(9, 13), TEXT_COLOR_GOLD, 6, (void*) 0x8A011A0 },
	{ gUnknown_02003BFC.text + 24, gUnknown_02003D2C + TILEMAP_INDEX(9, 15), TEXT_COLOR_GOLD, 6, (void*) 0x8A011A4 },

	{ }, // end
};

const struct Unk8086E00 gUnused_08205A84[] =
{
	{ gUnknown_02003BFC.text + 25, gUnknown_02003D2C + TILEMAP_INDEX(3,  1), TEXT_COLOR_NORMAL, 0, (void*) 0x8A011E8 },
	{ gUnknown_02003BFC.text + 26, gUnknown_02003D2C + TILEMAP_INDEX(3,  3), TEXT_COLOR_NORMAL, 0, (void*) 0x8A011EC },
	{ gUnknown_02003BFC.text + 27, gUnknown_02003D2C + TILEMAP_INDEX(11, 1), TEXT_COLOR_NORMAL, 0, (void*) 0x8A011F0 },
	{ gUnknown_02003BFC.text + 28, gUnknown_02003D2C + TILEMAP_INDEX(11, 3), TEXT_COLOR_NORMAL, 0, (void*) 0x8A011F4 },

	{ }, // end
};

const struct Unk8086E00 gUnused_08205AD4[] =
{
	{ gUnknown_02003BFC.text + 25, gUnknown_02003D2C + TILEMAP_INDEX(3,  1), TEXT_COLOR_NORMAL, 0, (void*) 0x8A011FC },
	{ gUnknown_02003BFC.text + 26, gUnknown_02003D2C + TILEMAP_INDEX(3,  3), TEXT_COLOR_NORMAL, 0, (void*) 0x8A01200 },
	{ gUnknown_02003BFC.text + 27, gUnknown_02003D2C + TILEMAP_INDEX(11, 1), TEXT_COLOR_NORMAL, 0, (void*) 0x8A01204 },
	{ gUnknown_02003BFC.text + 28, gUnknown_02003D2C + TILEMAP_INDEX(11, 3), TEXT_COLOR_NORMAL, 0, (void*) 0x8A011F8 },

	{ }, // end
};

extern struct TextBatch CONST_DATA gUnknown_08A006FC[];
extern s8 CONST_DATA gUnknown_08A0081C[]; /* stat screen page transition draw offset lut */
extern struct ProcCmd CONST_DATA gUnknown_08A0082C[]; // page transition proc
extern struct ProcCmd CONST_DATA gUnknown_08A00844[]; // unk
extern struct ProcCmd CONST_DATA gUnknown_08A00864[]; // unit transition proc
extern u16 CONST_DATA gUnknown_08A008FE[]; // obj for page name bg
extern u16 const* CONST_DATA gUnknown_08A00924[]; // objs for page names
extern u16 CONST_DATA gUnknown_08A00930[]; // tile offsets within an image
extern struct ProcCmd CONST_DATA gUnknown_08A009D8[]; // main proc
extern struct ProcCmd CONST_DATA gUnknown_08A00A98[]; // help box core proc
extern struct ProcCmd CONST_DATA gUnknown_08A00AD0[]; // help box mover proc
extern u16 CONST_DATA gUnknown_08A00B10[]; // 'R is info' object
extern struct ProcCmd CONST_DATA gUnknown_08A00B20[]; // proc displaying 'R is Info'
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00BC4; // page 0 root help
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00D14; // hardcoded thing bad
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00DA0; // page 1 root help
extern struct HelpBoxInfo CONST_DATA gUnknown_08A00F44; // page 2 root help

extern u16 CONST_DATA gUnknown_08A01EE4[]; // some face-related palette (if portrait)
extern u16 CONST_DATA gUnknown_08A01F04[]; // some face-related palette (if card)
extern u8  CONST_DATA gUnknown_08A01F24[]; // img?
extern u8  CONST_DATA gUnknown_08A020F0[]; // img?
extern u16 CONST_DATA gUnknown_08A021E4[]; // pal
extern u8  CONST_DATA gUnknown_08A02204[]; // tsa
extern u8  CONST_DATA gUnknown_08A02250[]; // tsa
extern u8  CONST_DATA gUnknown_08A02274[]; // img objects
extern u16 CONST_DATA gUnknown_08A027FC[][0x10]; // color animation for each page
extern u8  CONST_DATA gUnknown_08A064E0[]; // halo img
extern u8  CONST_DATA gUnknown_08A071FC[]; // halo tsa
extern u16 CONST_DATA gUnknown_08A0731C[]; // halo pal
extern u8  CONST_DATA gUnknown_08A03368[]; // background img
extern u8  CONST_DATA gUnknown_08A05F10[]; // background tsa
extern u16 CONST_DATA gUnknown_08A06460[]; // background pal

extern u16 CONST_DATA gUnknown_08A1D79C[]; // 'R is info' palette

void sub_8088670(struct Proc* proc);
void MakeStatScreenRText6C(int pageid, struct Proc* proc);
const struct HelpBoxInfo* sub_80895A8(void);
void Create6CRText(const struct HelpBoxInfo* helpinfo, struct Proc* parent); // StartMoveableHelpBox
int sub_8089354(struct HelpBoxProc* proc);
int sub_8089384(struct HelpBoxProc* proc);
int sub_80893B4(struct HelpBoxProc* proc);
int sub_80893E4(struct HelpBoxProc* proc);
void sub_8089980(int a, int b, int c, int d, int e);
void sub_80892C0(struct HelpBoxProc* proc);
void sub_808929C(struct HelpBoxProc* proc, int x, int y);
void sub_80891AC(struct HelpBoxProc* proc, int width, int height);
void sub_8089210(struct HelpBoxProc* proc, int x, int y);
void sub_808A118(void);

void sub_808A0FC(int item, int msgid);

void sub_8088E9C(const struct HelpBoxInfo* info, int unk);
void sub_8089320(struct HelpBoxProc* proc);

int sub_80892D0(int item);

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

void DrawStatScreenBar(int num, int x, int y, int base, int total, int max)
{
	int diff = total - base;

	DrawDecNumber(gUnknown_02003D2C + TILEMAP_INDEX(x, y),
		(base == max) ? TEXT_COLOR_GREEN : TEXT_COLOR_BLUE, base);

	sub_8004BF0(diff, gUnknown_02003D2C + TILEMAP_INDEX(x + 1, y));

	if (total > 30)
		diff = 30 - base;

	sub_8086B2C(0x401 + num*6, 6,
		gUnknown_0200472C + TILEMAP_INDEX(x - 2, y + 1),
		TILEREF(0, STATSCREEN_BGPAL_3), max * 41 / 30, base * 41 / 30, diff * 41 / 30);
}

#else // NONMATCHING

__attribute__((naked))
void DrawStatScreenBar(int num, int x, int y, int base, int total, int max)
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

void DrawUnitWeaponRank(int num, int x, int y, int wtype)
{
	int progress, progressMax, color;

	int wexp = gUnknown_02003BFC.unit->ranks[wtype];

	// Display weapon type icon
	DrawIcon(gUnknown_02003D2C + TILEMAP_INDEX(x, y),
		0x70 + wtype, // TODO: icon id definitions
		TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

	color = wexp >= WPN_EXP_S
		? TEXT_COLOR_GREEN
		: TEXT_COLOR_BLUE;

	// Display rank letter
	sub_8004B0C(gUnknown_02003D2C + TILEMAP_INDEX(x + 4, y),
		color,
		GetDisplayRankStringFromExp(wexp));

	GetWeaponExpProgressState(wexp, &progress, &progressMax);

	sub_8086B2C(0x401 + num*6, 5,
		gUnknown_0200472C + TILEMAP_INDEX(x + 2, y + 1), TILEREF(0, STATSCREEN_BGPAL_6),
		0x22, (progress*34)/(progressMax-1), 0);
}

void DrawUnitWeaponScreen(void)
{
	if (UnitHasMagicRank(gUnknown_02003BFC.unit))
	{
		DrawUnitWeaponRank(0, 1, 1, ITYPE_ANIMA);
		DrawUnitWeaponRank(1, 1, 3, ITYPE_LIGHT);
		DrawUnitWeaponRank(2, 9, 1, ITYPE_DARK);
		DrawUnitWeaponRank(3, 9, 3, ITYPE_STAFF);
	}
	else
	{
		DrawUnitWeaponRank(0, 1, 1, ITYPE_SWORD);
		DrawUnitWeaponRank(1, 1, 3, ITYPE_LANCE);
		DrawUnitWeaponRank(2, 9, 1, ITYPE_AXE);
		DrawUnitWeaponRank(3, 9, 3, ITYPE_BOW);
	}

	DrawUnitScreenSupportList();
}

void sub_80878CC(int pageid)
{
	typedef void(*func_type)(void);

	func_type funcLut[4] =
	{
		DrawUnitStatScreen,
		DrawUnitItemScreen,
		DrawUnitWeaponScreen,
		DrawUnitStatScreen,
	};

	CpuFastFill(0, gUnknown_02003D2C, sizeof(gUnknown_02003D2C));
	CpuFastFill(0, gUnknown_0200472C, sizeof(gUnknown_0200472C));

	funcLut[pageid]();
}

struct Unit* sub_8087920(struct Unit* u, int direction)
{
	int faction = UNIT_FACTION(u);
	int i       = u->index;

	struct Unit* unit;

	while (TRUE)
	{
		i = (i + direction) & 0x3F;
		unit = GetUnit(faction + i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if ((gUnknown_0203E764.unk02 & 1) && (unit->state & US_DEAD))
			continue;

		if ((gUnknown_0203E764.unk02 & 2) && (unit->state & US_NOT_DEPLOYED))
			continue;

		if ((gUnknown_0203E764.unk02 & 4) && (unit->state & US_BIT9))
			continue;

		if ((gUnknown_0203E764.unk02 & 8) && (unit->state & US_UNDER_A_ROOF))
			continue;

		if ((gUnknown_0203E764.unk02 & 0x10) && (unit->state & US_BIT16))
			continue;

		if ((gUnknown_0203E764.unk02 & 0x20) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
			continue;

		if (UNIT_IS_GORGON_EGG(unit))
			continue;

		return unit;
	}
}

void sub_80879DC(struct StatScreenTransitionProc* proc)
{
	int off;

	int len, dstOff, srcOff;

	// clear bg0, bg2 page area
	TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18, 0);
	TileMap_FillRect(gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18, 0);

	off = gUnknown_08A0081C[proc->unk4C];

	if (off == INT8_MAX)
	{
		// INT8_MAX offset means switch to displaying next page

		sub_80878CC(proc->unk4A);

		proc->unk4C++;
		off = gUnknown_08A0081C[proc->unk4C];
	}

	// compute len, dstOff and srcOff
	// len is the length of the display bit of the page
	// dstOff is the x offset to which to copy the page to
	// srcOff is the x offset from which to copy the page from

	if (proc->unk52 & 0x20)
		off = -off;

	len = 18 - abs(off);

	if (off < 0)
	{
		dstOff = 0;
		srcOff = -off;
	}
	else
	{
		dstOff = off;
		srcOff = 0;
	}

	TileMap_CopyRect(
		gUnknown_02003D2C + srcOff,
		gBG0TilemapBuffer + dstOff + TILEMAP_INDEX(12, 2),
		len, 18);

	TileMap_CopyRect(
		gUnknown_0200472C + srcOff,
		gBG2TilemapBuffer + dstOff + TILEMAP_INDEX(12, 2),
		len, 18);

	BG_EnableSyncByMask(BG0_SYNC_BIT + BG1_SYNC_BIT + BG2_SYNC_BIT);

	proc->unk4C++;
	off = gUnknown_08A0081C[proc->unk4C];

	if (off == INT8_MIN)
		Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087ACC(void)
{
	gUnknown_02003BFC.inTransition = FALSE;
}

void sub_8087AD8(u16 config, int newPage, struct Proc* parent)
{
	struct StatScreenTransitionProc* proc;

	if (Proc_Find(gUnknown_08A0082C))
		return;

	PlaySoundEffect(0x6F); // TODO: song ids

	proc = (void*) Proc_CreateBlockingChild(gUnknown_08A0082C, parent);

	proc->unk4C = 0;
	proc->unk4A = newPage;
	proc->unk52 = config;

	gUnknown_02003BFC.unk02 = config;
	gUnknown_02003BFC.help = NULL;
	gUnknown_02003BFC.inTransition = TRUE;
}

void sub_8087B40(struct StatScreenTransitionProc* proc)
{
	gLCDControlBuffer.dispcnt.bg0_on = TRUE;
	gLCDControlBuffer.dispcnt.bg1_on = TRUE;
	gLCDControlBuffer.dispcnt.bg2_on = TRUE;
	gLCDControlBuffer.dispcnt.bg3_on = TRUE;
	gLCDControlBuffer.dispcnt.obj_on = TRUE;

	proc->unk4C = 0;
	proc->unk4E = 0;

	SetSpecialColorEffectsParameters(1, proc->unk4C, 0x10, 0);

	sub_8001ED0(0, 1, 0, 0, 0);
	sub_8001F0C(0, 0, 0, 1, 0);
}

void sub_8087BA0(struct StatScreenTransitionProc* proc)
{
	if (proc->unk4E == 0)
	{
		if (++proc->unk4C >= 0x40)
			proc->unk4E++;
	}
	else
	{
		if (--proc->unk4C <= 0)
			proc->unk4E = 0;
	}

	SetSpecialColorEffectsParameters(1, proc->unk4C >> 3, 0x10, 0);
}

void sub_8087BF0(void)
{
	Proc_Create(gUnknown_08A00844, ROOT_PROC_3);
}

void sub_8087C04(void)
{
	Proc_DeleteAllWithScript(gUnknown_08A00844);

	gLCDControlBuffer.dispcnt.bg0_on = TRUE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = TRUE;
	gLCDControlBuffer.dispcnt.bg3_on = TRUE;
	gLCDControlBuffer.dispcnt.obj_on = TRUE;
}

void sub_8087C34(struct StatScreenTransitionProc* proc)
{
	gUnknown_02003BFC.inTransition = TRUE;

	proc->unk4C = 4;

	gLCDControlBuffer.bg0cnt.priority = 1;
	gLCDControlBuffer.bg1cnt.priority = 3;
	gLCDControlBuffer.bg2cnt.priority = 2;
	gLCDControlBuffer.bg3cnt.priority = 0;

	sub_8001ED0(0, 0, 0, 1, 0);
	sub_8001F0C(1, 1, 1, 0, 1);

	sub_8001F64(0);

	if (proc->unk38 > 0)
	{
		proc->unk3C = 0;
		proc->unk40 = -60;
	}
	else
	{
		proc->unk3C = 0;
		proc->unk40 = +60;
	}
}

void sub_8087CC0(struct StatScreenTransitionProc* proc)
{
	SetSpecialColorEffectsParameters(1, proc->unk4C, 0x10 - proc->unk4C, 0);

	MU_SetDisplayPosition(gUnknown_02003BFC.mu,
		80, 138 + gUnknown_02003BFC.yDispOff);

	gUnknown_02003BFC.yDispOff = sub_8012DCC(2, proc->unk3C, proc->unk40, proc->unk4C, 0x10);

	proc->unk4C += 3;

	if (proc->unk4C > 0x10)
		Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087D24(struct StatScreenTransitionProc* proc)
{
	proc->unk4C = 1;

	gLCDControlBuffer.bg0cnt.priority = 1;
	gLCDControlBuffer.bg1cnt.priority = 3;
	gLCDControlBuffer.bg2cnt.priority = 2;
	gLCDControlBuffer.bg3cnt.priority = 0;

	sub_8001ED0(0, 0, 0, 1, 0);
	sub_8001F0C(1, 1, 1, 0, 1);

	if (proc->unk38 > 0)
	{
		proc->unk3C = +60;
		proc->unk40 = 0;
	}
	else
	{
		proc->unk3C = -60;
		proc->unk40 = 0;
	}
}

void sub_8087D98(struct StatScreenTransitionProc* proc)
{
	SetSpecialColorEffectsParameters(1, 0x10 - proc->unk4C, proc->unk4C, 0);

	MU_SetDisplayPosition(gUnknown_02003BFC.mu,
		80, 138 + gUnknown_02003BFC.yDispOff);

	gUnknown_02003BFC.yDispOff = sub_8012DCC(5, proc->unk3C, proc->unk40, proc->unk4C, 0x10);

	proc->unk4C += 3;

	if (proc->unk4C >= 0x10)
		Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087DF8(struct StatScreenTransitionProc* proc)
{
	gUnknown_02003BFC.unit = GetUnit(proc->unk4A);

	sub_8088670(Proc_Find(gUnknown_08A009D8));
	Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8087E28(struct Proc* proc)
{
	if (gUnknown_02003BFC.mu)
		MU_SetDisplayPosition(gUnknown_02003BFC.mu,
			80, 138);

	gLCDControlBuffer.bg0cnt.priority = 1;
	gLCDControlBuffer.bg1cnt.priority = 3;
	gLCDControlBuffer.bg2cnt.priority = 2;
	gLCDControlBuffer.bg3cnt.priority = 3;

	SetDefaultColorEffects();

	gUnknown_02003BFC.inTransition = FALSE;
}

void sub_8087E7C(struct Unit* unit, int direction, struct Proc* parent)
{
	struct StatScreenTransitionProc* proc = (void*) Proc_CreateBlockingChild(gUnknown_08A00864, parent);

	proc->unk4A = unit->index;
	proc->unk38 = direction;

	PlaySoundEffect(0xC8); // TODO: song ids
}

void sub_8087EB8(int pageid)
{
	int colorid;

	RegisterObjectAttributes_SafeMaybe(4,
		111 + gUnknown_02003BFC.unk04, 1 + gUnknown_02003BFC.yDispOff,
		gUnknown_08A008FE, TILEREF(0x293, 4) + 0xC00);

	RegisterObjectAttributes_SafeMaybe(4,
		114 + gUnknown_02003BFC.unk04, 0 + gUnknown_02003BFC.yDispOff,
		gUnknown_08A00924[pageid], TILEREF(0x240 + gUnknown_08A00930[pageid], 3) + 0xC00);

	colorid = (GetGameClock()/4) % 16;

	CpuCopy16(
		gUnknown_08A027FC[pageid] + colorid,
		gPaletteBuffer + 0x13E,
		sizeof(u16));

	EnablePaletteSync();
}

void sub_8087F48(struct StatScreenPageNameProc* proc)
{
	// TODO: maybe a macro that takes angle/xScale/yScale?

	WriteOAMRotScaleData(
		8,  // oam rotscale index

		Div(+COS(0) * 16, 0x100), // pa
		Div(-SIN(0) * 16, 0x100), // pb
		Div(+SIN(0) * 16, 0x100), // pc
		Div(+COS(0) * 16, 0x100)  // pd
	);

	proc->unk36 = gUnknown_02003BFC.page;
}

void sub_8087FE0(struct StatScreenPageNameProc* proc)
{
	sub_8087EB8(proc->unk36);

	if (gUnknown_02003BFC.unk02)
	{
		proc->unk38 = 5;

		Proc_ClearNativeCallback((struct Proc*) proc);
		return;
	}

	proc->unk36 = gUnknown_02003BFC.page;
}

void sub_8088014(struct StatScreenPageNameProc* proc)
{
	// TODO: maybe a macro that takes angle/xScale/yScale?

	WriteOAMRotScaleData(
		8,  // oam rotscale index

		Div(+COS(0) * 16, 0x100), // pa
		Div(-SIN(0) * 16, proc->unk38 * 0x100 / 6), // pb
		Div(+SIN(0) * 16, 0x100), // pc
		Div(+COS(0) * 16, proc->unk38 * 0x100 / 6)  // pd
	);

	sub_8087EB8(proc->unk36);

	proc->unk38--;

	if (proc->unk38 == 0)
	{
		proc->unk38 = 1;
		Proc_ClearNativeCallback((struct Proc*) proc);
	}
}

void sub_80880DC(struct StatScreenPageNameProc* proc)
{
	// TODO: maybe a macro that takes angle/xScale/yScale?

	WriteOAMRotScaleData(
		8,  // oam rotscale index

		Div(+COS(0) * 16, 0x100), // pa
		Div(-SIN(0) * 16, proc->unk38 * 0x100 / 6), // pb
		Div(+SIN(0) * 16, 0x100), // pc
		Div(+COS(0) * 16, proc->unk38 * 0x100 / 6)  // pd
	);

	sub_8087EB8(gUnknown_02003BFC.page);

	proc->unk38++;

	if (proc->unk38 > 6)
	{
		proc->unk36 = gUnknown_02003BFC.page;
		Proc_ClearNativeCallback((struct Proc*) proc);
	}
}

void sub_80881AC(struct StatScreenUnkProc* proc)
{
	proc->unk2A = 103;
	proc->unk2C = 217;

	proc->unk30 = 0;
	proc->unk2E = 0;

	proc->unk34 = 4;
	proc->unk32 = 4;
}

void sub_80881C4(struct StatScreenUnkProc* proc)
{
	if (gUnknown_02003BFC.unk02 & 0x20)
	{
		proc->unk32 = 31;
		proc->unk2A = 97;
	}

	if (gUnknown_02003BFC.unk02 & 0x10)
	{
		proc->unk34 = 31;
		proc->unk2C = 223;
	}

	gUnknown_02003BFC.unk02 = 0;
}

void sub_80881FC(struct StatScreenUnkProc* proc)
{
	int baseref = TILEREF(0x240, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(1);

	proc->unk2E += proc->unk32;
	proc->unk30 += proc->unk34;

	if (proc->unk32 > 4)
		proc->unk32--;

	if (proc->unk34 > 4)
		proc->unk34--;

	if ((GetGameClock() % 4) == 0)
	{
		if (proc->unk2A < 103)
			proc->unk2A++;

		if (proc->unk2C > 217)
			proc->unk2C--;
	}

	RegisterObjectAttributes_SafeMaybe(0,
		gUnknown_02003BFC.unk04 + proc->unk2A,
		gUnknown_02003BFC.yDispOff + 3,
		gUnknown_08590F64, baseref + 0x5A + (proc->unk2E >> 5) % 6);

	RegisterObjectAttributes_SafeMaybe(0,
		gUnknown_02003BFC.unk04 + proc->unk2C,
		gUnknown_02003BFC.yDispOff + 3,
		gUnknown_08590FB4, baseref + 0x5A + (proc->unk30 >> 5) % 6);
}

void sub_80882E4(void)
{
	int chr = 0x289;

	// page amt
	RegisterObjectAttributes_SafeMaybe(2,
		gUnknown_02003BFC.unk04 + 228,
		gUnknown_02003BFC.yDispOff + 17,
		gUnknown_08590F44, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3) + gUnknown_02003BFC.pageAmt);

	// '/'
	RegisterObjectAttributes_SafeMaybe(2,
		gUnknown_02003BFC.unk04 + 222,
		gUnknown_02003BFC.yDispOff + 17,
		gUnknown_08590F44, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3));

	// page num
	RegisterObjectAttributes_SafeMaybe(2,
		gUnknown_02003BFC.unk04 + 215,
		gUnknown_02003BFC.yDispOff + 17,
		gUnknown_08590F44, TILEREF(chr, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3) + gUnknown_02003BFC.page + 1);
}

void sub_8088354(void)
{
	RegisterObjectAttributes_SafeMaybe(11,
		gUnknown_02003BFC.unk04 + 64,
		gUnknown_02003BFC.yDispOff + 131,
		gUnknown_08590F8C, TILEREF(0x28F, STATSCREEN_OBJPAL_4) + OAM2_PRIORITY(3));
}

void sub_8088384(void)
{
	s8 displayIcon = (GetGameClock() % 32) < 20;

	u16 palidLut[3] = { 0xC, 0xE, 0xD }; // TODO: palid constants

	if (!gUnknown_02003BFC.inTransition)
	{
		if ((gUnknown_02003BFC.page == STATSCREEN_PAGE_0) && (gUnknown_02003BFC.unit->state & US_RESCUING))
		{
			sub_8015BD4(120, 40, 1);
			sub_8015BD4(120, 56, 1);

			if (displayIcon)
			{
				RegisterObjectAttributes_SafeMaybe(4,
					184, 78, gUnknown_08590F44,
					TILEREF(3, 0xF & palidLut[gUnknown_02003BFC.unit->rescueOtherUnit>>6]) + OAM2_PRIORITY(2));
			}
		}

		if (gUnknown_02003BFC.unit->state & US_RESCUED)
		{
			if (displayIcon)
			{
				RegisterObjectAttributes_SafeMaybe(4,
					10, 86, gUnknown_08590F44,
					TILEREF(3, 0xF & palidLut[gUnknown_02003BFC.unit->rescueOtherUnit>>6]) + OAM2_PRIORITY(2));
			}
		}
	}
}

void sub_808844C(void)
{
	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;

	SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

	sub_8001ED0(0, 0, 0, 0, 0);
	sub_8001F48(1);
	sub_8001F64(0);

	// TODO: ResetBackdropColor macro?
	gPaletteBuffer[0] = 0;
	EnablePaletteSync();
}

void sub_80884B0(struct Proc* proc)
{
	u16 bgConfig[12] =
	{
		0x0000, 0x6000, 0,
		0x0000, 0x6800, 0,
		0x8000, 0x7000, 0,
		0x8000, 0x7800, 0,
	};

	SetupBackgrounds(bgConfig);

	UnpackUiFramePalette(STATSCREEN_BGPAL_3);
	RegisterBlankTile(0x400);

	BG_Fill(gBG2TilemapBuffer, 0);
	BG_EnableSyncByMask(BG2_SYNC_BIT);

	sub_80156D4();
	SetupMapSpritesPalettes();

	// TODO: port the macros from mapanim wip

	gLCDControlBuffer.dispcnt.win0_on   = TRUE;
	gLCDControlBuffer.dispcnt.win1_on   = FALSE;
	gLCDControlBuffer.dispcnt.objWin_on = FALSE;

	gLCDControlBuffer.win0_left   = 96;
	gLCDControlBuffer.win0_top    = 0;
	gLCDControlBuffer.win0_right  = 98;
	gLCDControlBuffer.win0_bottom = 160;

	gLCDControlBuffer.wincnt.win0_enableBg0 = FALSE;
	gLCDControlBuffer.wincnt.win0_enableBg1 = FALSE;
	gLCDControlBuffer.wincnt.win0_enableBg2 = FALSE;
	gLCDControlBuffer.wincnt.win0_enableBg3 = TRUE;
	gLCDControlBuffer.wincnt.win0_enableObj = TRUE;

	gLCDControlBuffer.wincnt.wout_enableBg0 = TRUE;
	gLCDControlBuffer.wincnt.wout_enableBg1 = TRUE;
	gLCDControlBuffer.wincnt.wout_enableBg2 = TRUE;
	gLCDControlBuffer.wincnt.wout_enableBg3 = TRUE;
	gLCDControlBuffer.wincnt.wout_enableObj = TRUE;

	gLCDControlBuffer.wincnt.win0_enableBlend = TRUE;
	gLCDControlBuffer.wincnt.win1_enableBlend = TRUE;
	gLCDControlBuffer.wincnt.wout_enableBlend = TRUE;

	// Load and display Halo

	CopyDataWithPossibleUncomp(
		gUnknown_08A064E0, (void*)(VRAM + 0x220 * 0x20));

	ApplyPalette(gUnknown_08A0731C, STATSCREEN_BGPAL_HALO);

	CopyDataWithPossibleUncomp(
		gUnknown_08A071FC, gUnknown_02020188);

	CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(12, 0),
		gUnknown_02020188, TILEREF(0x220, STATSCREEN_BGPAL_HALO));

	// Load and display Background

	CopyDataWithPossibleUncomp(
		gUnknown_08A03368, (void*)(VRAM + 0x580 * 0x20));

	ApplyPalettes(gUnknown_08A06460, STATSCREEN_BGPAL_BACKGROUND, 4);

	CopyDataWithPossibleUncomp(gUnknown_08A05F10, gUnknown_02020188);

	CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_02020188,
		TILEREF(0x180, 12));

	// Load object graphics

	CopyDataWithPossibleUncomp(
		gUnknown_08A02274, (void*)(VRAM + 0x10000 + 0x240 * 0x20));

	LoadIconPalettes(STATSCREEN_BGPAL_ITEMICONS);

	UnpackUiBarPalette(STATSCREEN_BGPAL_6);

	LoadIconPalette(1, 0x13);

	CopyDataWithPossibleUncomp(
		gUnknown_08A01F24, (void*)(VRAM + 0x440 * 0x20));

	ApplyPalette(gUnknown_08A021E4, STATSCREEN_BGPAL_7);

	LoadIconPalette(1, 0x14);

	CopyDataWithPossibleUncomp(
		gUnknown_08A020F0, (void*)(VRAM + 0x60 * 0x20));

	gUnknown_02003BFC.mu = NULL;

	sub_8087E28(proc);
}

void sub_8088670(struct Proc* proc)
{
	// Get portrait id

	int fid = GetUnitPortraitId(gUnknown_02003BFC.unit);

	if (gUnknown_02003BFC.unit->state & US_BIT23)
		fid++;

	// Set page amount (in FE6, this was dependant on whether this is ally or enemy)
	gUnknown_02003BFC.pageAmt = STATSCREEN_PAGE_MAX;

	// Init text and icons

	Font_InitForUIDefault();
	ResetIconGraphics_();

	sub_8086DF0();

	// Display portrait

	sub_8005E98(proc, gBG2TilemapBuffer + TILEMAP_INDEX(1, 1), fid,
		0x4E0, STATSCREEN_BGPAL_FACE);

	if (GetPortraitStructPointer(fid)->img)
		ApplyPalette(gUnknown_08A01EE4, STATSCREEN_BGPAL_2);
	else
		ApplyPalette(gUnknown_08A01F04, STATSCREEN_BGPAL_2);

	// Display Map Sprite

	MU_EndAll();
	gUnknown_02003BFC.mu = MU_CreateForUI(gUnknown_02003BFC.unit, 80, 138);

	// Draw left panel labels and info

	sub_8086E44();

	// Draw page content

	sub_80878CC(gUnknown_02003BFC.page);

	TileMap_CopyRect(gUnknown_02003D2C, gBG0TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);
	TileMap_CopyRect(gUnknown_0200472C, gBG2TilemapBuffer + TILEMAP_INDEX(12, 2), 18, 18);

	BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void sub_808873C(struct Proc* proc)
{
	struct Unit* unit;

	if (gKeyStatusPtr->newKeys & B_BUTTON)
	{
		gLCDControlBuffer.dispcnt.bg0_on = TRUE;
		gLCDControlBuffer.dispcnt.bg1_on = FALSE;
		gLCDControlBuffer.dispcnt.bg2_on = TRUE;
		gLCDControlBuffer.dispcnt.bg3_on = TRUE;
		gLCDControlBuffer.dispcnt.obj_on = TRUE;

		SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

		sub_8001ED0(0, 0, 0, 0, 0);
		sub_8001F48(1);

		// TODO: ResetBackdropColor macro?
		gPaletteBuffer[0] = 0;
		EnablePaletteSync();

		Proc_ClearNativeCallback(proc);

		PlaySoundEffect(0x6B); // TODO: song ids
	}

	else if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
	{
		gUnknown_02003BFC.page = (gUnknown_02003BFC.page + gUnknown_02003BFC.pageAmt - 1) % gUnknown_02003BFC.pageAmt;
		sub_8087AD8(0x20, gUnknown_02003BFC.page, proc);
		return;
	}

	else if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
	{
		gUnknown_02003BFC.page = (gUnknown_02003BFC.page + gUnknown_02003BFC.pageAmt + 1) % gUnknown_02003BFC.pageAmt;
		sub_8087AD8(0x10, gUnknown_02003BFC.page, proc);
	}

	else if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
	{
		unit = sub_8087920(gUnknown_02003BFC.unit, -1);
		sub_8087E7C(unit, -1, proc);
	}

	else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
	{
		unit = sub_8087920(gUnknown_02003BFC.unit, +1);
		sub_8087E7C(unit, +1, proc);
	}

	else if ((gKeyStatusPtr->repeatedKeys & A_BUTTON) && (gUnknown_02003BFC.unit->rescueOtherUnit))
	{
		unit = GetUnit(gUnknown_02003BFC.unit->rescueOtherUnit);
		sub_8087E7C(unit, (gUnknown_02003BFC.unit->state & US_RESCUING) ? +1 : -1, proc);
	}

	else if (gKeyStatusPtr->newKeys & R_BUTTON)
	{
		Proc_GotoLabel(proc, 0); // TODO: label name
		MakeStatScreenRText6C(gUnknown_02003BFC.page, proc);
	}
}

void sub_80888B4(void)
{
	gUnknown_0202BCF0.chapterStateBits = (gUnknown_0202BCF0.chapterStateBits &~ 3) | (gUnknown_02003BFC.page & 3);
	gUnknown_0203E764.uid01 = gUnknown_02003BFC.unit->index;

	SetInterrupt_LCDVCountMatch(NULL);

	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;
}

void sub_808890C(void)
{
	gUnknown_02003BFC.help = sub_80895A8();
}

void sub_8088920(void)
{
	int yBg = 0xFF & -gUnknown_02003BFC.yDispOff;

	BG_SetPosition(0, 0, yBg);
	BG_SetPosition(2, 0, yBg);
}

void sub_808894C(struct Unit* unit, struct Proc* parent)
{
	gUnknown_02003BFC.unk04 = 0;
	gUnknown_02003BFC.yDispOff = 0;
	gUnknown_02003BFC.page = gUnknown_0202BCF0.chapterStateBits & 3;
	gUnknown_02003BFC.unit = unit;
	gUnknown_02003BFC.help = NULL;
	gUnknown_02003BFC.unk02 = 0;
	gUnknown_02003BFC.inTransition = FALSE;

	BWL_IncrementStatScreenViews(unit->pCharacterData->number);

	PlaySoundEffect(0x6A); // TODO: song ids

	Proc_CreateBlockingChild(gUnknown_08A009D8, parent);
}

void MakeStatScreenRText6C(int pageid, struct Proc* proc)
{
	LoadDialogueBoxGfx(NULL, -1); // default

	if (!gUnknown_02003BFC.help)
	{
		switch (pageid)
		{

		case STATSCREEN_PAGE_0:
			gUnknown_02003BFC.help = &gUnknown_08A00BC4;
			break;
		
		case STATSCREEN_PAGE_1:
			gUnknown_02003BFC.help = &gUnknown_08A00DA0;
			break;

		case STATSCREEN_PAGE_2:
			gUnknown_02003BFC.help = &gUnknown_08A00F44;
			break;

		} // switch (pageid)
	}

	Create6CRText(gUnknown_02003BFC.help, proc);
}

void sub_8088A00(struct HelpBoxProc* proc)
{
	int item = gUnknown_02003BFC.unit->items[proc->info->msgId];

	proc->item_maybe  = item;
	proc->msgId_maybe = GetItemDescId(item);
}

void sub_8088A2C(struct HelpBoxProc* proc)
{
	switch (gUnknown_02003BFC.unit->statusIndex)
	{

	case UNIT_STATUS_NONE:
		proc->msgId_maybe = 0x552; // TODO: mid constants
		break;

	case UNIT_STATUS_POISON:
		proc->msgId_maybe = 0x553; // TODO: mid constants
		break;

	case UNIT_STATUS_SLEEP:
		proc->msgId_maybe = 0x554; // TODO: mid constants
		break;

	case UNIT_STATUS_SILENCED:
		proc->msgId_maybe = 0x556; // TODO: mid constants
		break;

	case UNIT_STATUS_BERSERK:
		proc->msgId_maybe = 0x555; // TODO: mid constants
		break;

	case UNIT_STATUS_ATTACK:
		proc->msgId_maybe = 0x558; // TODO: mid constants
		break;

	case UNIT_STATUS_DEFENSE:
		proc->msgId_maybe = 0x559; // TODO: mid constants
		break;

	case UNIT_STATUS_CRIT:
		proc->msgId_maybe = 0x55A; // TODO: mid constants
		break;

	case UNIT_STATUS_AVOID:
		proc->msgId_maybe = 0x55B; // TODO: mid constants
		break;

	case UNIT_STATUS_PETRIFY:
	case UNIT_STATUS_13:
		proc->msgId_maybe = 0x557; // TODO: mid constants
		break;

	} // switch (gUnknown_02003BFC.unit->statusIndex)
}

void sub_8088B08(struct HelpBoxProc* proc)
{
	if (UnitHasMagicRank(gUnknown_02003BFC.unit))
		proc->msgId_maybe = 0x547; // TODO: mid constants
	else
		proc->msgId_maybe = 0x546; // TODO: mid constants
}

void sub_8088B40(struct HelpBoxProc* proc)
{
	if (!gUnknown_02003BFC.unit->items[0])
		sub_80893B4(proc);

	if (!gUnknown_02003BFC.unit->items[proc->info->msgId])
	{
		if (proc->unk50 == 0 || proc->unk50 == 0x10 || proc->unk50 == 0x40)
			sub_8089354(proc);
		else if (proc->unk50 == 0x80)
			sub_8089384(proc);
	}
}

void sub_8088B94(struct HelpBoxProc* proc)
{
	u16 rankMsgLut[8] =
	{
		0x561, 0x562, 0x563, 0x564, 0x565, 0x566, 0x567, 0x568
	};

	int itemKind = proc->info->msgId;

	if (UnitHasMagicRank(gUnknown_02003BFC.unit))
		itemKind += 4;

	proc->msgId_maybe = rankMsgLut[itemKind];
}

void sub_8088BD4(struct HelpBoxProc* proc)
{
	int midDesc = gUnknown_02003BFC.unit->pCharacterData->descTextId;

	if (midDesc)
		proc->msgId_maybe = midDesc;
	else
		proc->msgId_maybe = 0x6BE; // TODO: mid constants
}

void sub_8088C00(struct HelpBoxProc* proc)
{
	proc->msgId_maybe = gUnknown_02003BFC.unit->pClassData->descTextId;
}

void sub_8088C14(struct HelpBoxProc* proc)
{
	if (GetUnitTotalSupportLevel(gUnknown_02003BFC.unit) == 0)
	{
		if (proc->unk50 == 0x80)
			sub_8089384(proc);
		else
			sub_8089354(proc);
	}
}

void sub_8088C48(struct HelpBoxProc* proc, int arg1)
{
	proc->unk30 = sub_8012DCC(arg1, proc->unk38, proc->unk3C, proc->unk48, proc->unk4A);
	proc->unk32 = sub_8012DCC(arg1, proc->unk3A, proc->unk3E, proc->unk48, proc->unk4A);
	proc->unk34 = sub_8012DCC(arg1, proc->unk40, proc->unk44, proc->unk48, proc->unk4A);
	proc->unk36 = sub_8012DCC(arg1, proc->unk42, proc->unk46, proc->unk48, proc->unk4A);

	sub_8089980(proc->unk30, proc->unk32, proc->unk34, proc->unk36, proc->unk52);
}

void sub_8088CFC(struct HelpBoxProc* proc)
{
	struct Proc* found = Proc_Find(gUnknown_08A00B20);

	if (found)
		found->blockSemaphore = 1; // lock (disabled) proc

	if (proc->unk52 == 0)
		PlaySoundEffect(0x70); // TODO: song ids
}

void sub_8088D3C(struct HelpBoxProc* proc)
{
	sub_8088C48(proc, 5);

	if (proc->unk48 < proc->unk4A)
		proc->unk48++;
}

void sub_8088D64(struct HelpBoxProc* proc)
{
	struct Proc* found = Proc_Find(gUnknown_08A00B20);

	if (found)
		found->blockSemaphore = 0; // unlock (enable) proc

	if (proc->unk52 == 0)
	{
		PlaySoundEffect(0x71); // TODO: song ids

		sub_80892C0(proc);
		sub_808929C(proc, proc->info->xDisplay, proc->info->yDisplay);
	}
}

void sub_8088DB8(struct HelpBoxProc* proc)
{
	sub_8088C48(proc, 0);

	proc->unk48 -= 3;

	if (proc->unk48 < 0)
		Proc_ClearNativeCallback((struct Proc*) proc);
}

void sub_8088DE0(int x, int y, int msgid)
{
	gUnknown_0203E768.adj1 = NULL;
	gUnknown_0203E768.adj2 = NULL;
	gUnknown_0203E768.adj3 = NULL;
	gUnknown_0203E768.adj4 = NULL;

	gUnknown_0203E768.xDisplay = x;
	gUnknown_0203E768.yDisplay = y;
	gUnknown_0203E768.msgId    = msgid;

	gUnknown_0203E768.onInitMoveable = NULL;
	gUnknown_0203E768.onInit = NULL;

	gUnknown_0203E788.x = 0;
	gUnknown_0203E788.y = 0;

	sub_8088E9C(&gUnknown_0203E768, FALSE);
}

void sub_8088E14(int x, int y, int msgid)
{
	if (x < 0 && y < 0)
	{
		x = GetUiHandPrevDisplayX();
		y = GetUiHandPrevDisplayY();
	}

	gUnknown_0203E768.adj1 = NULL;
	gUnknown_0203E768.adj2 = NULL;
	gUnknown_0203E768.adj3 = NULL;
	gUnknown_0203E768.adj4 = NULL;

	gUnknown_0203E768.xDisplay = x;
	gUnknown_0203E768.yDisplay = y;
	gUnknown_0203E768.msgId    = msgid;

	gUnknown_0203E768.onInitMoveable = NULL;
	gUnknown_0203E768.onInit = NULL;

	gUnknown_0203E788.x = 0;
	gUnknown_0203E788.y = 0;

	sub_8088E9C(&gUnknown_0203E768, TRUE);
}

void sub_8088E60(int x, int y, int item)
{
	gUnknown_0203E768.adj1 = NULL;
	gUnknown_0203E768.adj2 = NULL;
	gUnknown_0203E768.adj3 = NULL;
	gUnknown_0203E768.adj4 = NULL;

	gUnknown_0203E768.xDisplay = x;
	gUnknown_0203E768.yDisplay = y;
	gUnknown_0203E768.msgId    = item;

	gUnknown_0203E768.onInitMoveable = NULL;
	gUnknown_0203E768.onInit = sub_8089320;

	gUnknown_0203E788.x = 0;
	gUnknown_0203E788.y = 0;

	sub_8088E9C(&gUnknown_0203E768, FALSE);
}

void sub_8088E9C(const struct HelpBoxInfo* info, int unk)
{
	struct HelpBoxProc* proc;
	int wBox, hBox;

	proc = (void*) Proc_Find(gUnknown_08A00A98);

	if (!proc)
	{
		proc = (void*) Proc_Create(gUnknown_08A00A98, ROOT_PROC_3);

		proc->unk52 = unk;

		sub_808929C(proc, info->xDisplay, info->yDisplay);
		sub_80892C0(proc);
	}
	else
	{
		proc->unk38 = proc->unk30;
		proc->unk3A = proc->unk32;
		proc->unk40 = proc->unk34;
		proc->unk42 = proc->unk36;
	}

	proc->info = info;

	proc->unk48 = 0;
	proc->unk4A = 12;

	proc->item_maybe = 0;
	proc->msgId_maybe = info->msgId;

	if (proc->info->onInit)
		proc->info->onInit(proc);

	SetFontGlyphSet(1);
	sub_8003FAC(GetStringFromIndex(proc->msgId_maybe), &wBox, &hBox);
	SetFontGlyphSet(0);

	sub_80891AC(proc, wBox, hBox);
	sub_8089210(proc, info->xDisplay, info->yDisplay);

	sub_808A118();
	sub_808A0FC(proc->item_maybe, proc->msgId_maybe);

	gUnknown_0203E784 = info;
}

void sub_8088F68(int x, int y, int msgid)
{
	struct HelpBoxProc* proc;
	int wBox, hBox;

	proc = (void*) Proc_Create(gUnknown_08A00A98, ROOT_PROC_3);

	proc->unk52 = TRUE;

	if (x < 0 && y < 0)
	{
		x = GetUiHandPrevDisplayX();
		y = GetUiHandPrevDisplayY();
	}

	proc->unk48 = 0;
	proc->unk4A = 12;

	proc->item_maybe = 0;
	proc->msgId_maybe = msgid;

	SetFontGlyphSet(1);
	sub_8003FAC(GetStringFromIndex(proc->msgId_maybe), &wBox, &hBox);
	SetFontGlyphSet(0);

	sub_80892C0(proc);
	sub_80891AC(proc, wBox, hBox);

	proc->unk38 = x + 8;
	proc->unk3A = y + 8;

	proc->unk3C = x + 8;
	proc->unk3E = y + 8;

	sub_808A118();
	sub_808A0FC(proc->item_maybe, proc->msgId_maybe);
}

void sub_8089018(void)
{
	struct HelpBoxProc* proc = (void*) Proc_Find(gUnknown_08A00A98);

	if (proc)
	{
		sub_808A118();
		Proc_GotoLabel((struct Proc*) proc, 0x63);
	}
}

void sub_808903C(void)
{
	struct HelpBoxProc* proc = (void*) Proc_Find(gUnknown_08A00A98);

	if (proc)
	{
		sub_808A118();
		Proc_Delete((struct Proc*) proc);
	}
}

void sub_8089060(struct HelpBoxProc* proc)
{
	proc->unk50 = 0;

	if (proc->info->onInitMoveable)
		proc->info->onInitMoveable(proc);

	sub_8088E9C(proc->info, FALSE);
}

void sub_8089088(struct HelpBoxProc* proc)
{
	u8 boxMoved = FALSE;

	DisplayUiHand(
		gUnknown_0203E788.x*8 + proc->info->xDisplay,
		gUnknown_0203E788.y*8 + proc->info->yDisplay);

	if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
		boxMoved |= sub_8089354(proc);

	if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
		boxMoved |= sub_8089384(proc);

	if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
		boxMoved |= sub_80893B4(proc);

	if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
		boxMoved |= sub_80893E4(proc);

	if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
	{
		Proc_ClearNativeCallback((void*) proc);
		return;
	}

	if (boxMoved)
	{
		PlaySoundEffect(0x67);
		Proc_GotoLabel((void*) proc, 0); // TODO: label constants?
	}
}

void sub_8089150(struct HelpBoxProc* proc)
{
	sub_8089018();
	Proc_Delete((void*) proc);
}

void Create6CRText(const struct HelpBoxInfo* info, struct Proc* parent)
{
	struct HelpBoxProc* proc = (void*) Proc_CreateBlockingChild(gUnknown_08A00AD0, parent);

	gUnknown_0203E788.x = 0;
	gUnknown_0203E788.y = 0;

	proc->info = info;
}

void sub_8089188(const struct HelpBoxInfo* info, struct Proc* parent, int x, int y)
{
	struct HelpBoxProc* proc = (void*) Proc_CreateBlockingChild(gUnknown_08A00AD0, parent);

	gUnknown_0203E788.x = x;
	gUnknown_0203E788.y = y;

	proc->info = info;
}

void sub_80891AC(struct HelpBoxProc* proc, int width, int height)
{
	width = 0xF0 & (width + 15); // align to 16 pixel multiple

	switch (sub_80892D0(proc->item_maybe))
	{

	case 1: // weapon
		if (width < 0x90)
			width = 0x90;

		if (GetStringTextWidth(GetStringFromIndex(proc->msgId_maybe)) > 8)
			height += 0x20;
		else
			height += 0x10;

		break;
	
	case 2: // staff
		if (width < 0x60)
			width = 0x60;

		height += 0x10;

		break;

	case 3: // save stuff
		width = 0x80;
		height += 0x10;

		break;

	} // switch (sub_80892D0(proc->item_maybe))

	proc->unk44 = width;
	proc->unk46 = height;
}

void sub_8089210(struct HelpBoxProc* proc, int x, int y)
{
	int xSpan = proc->unk44 + 0x10;
	int ySpan = proc->unk46 + 0x10;

	x += gUnknown_0203E788.x*8;
	y += gUnknown_0203E788.y*8;

	proc->unk3C = x - 0x10 - xSpan/6;

	if (proc->unk3C < 0)
		proc->unk3C = 0;

	if (proc->unk3C + xSpan > DISPLAY_WIDTH)
		proc->unk3C = DISPLAY_WIDTH - xSpan;

	proc->unk3E = y + 0x10;

	if (proc->unk3E + ySpan > DISPLAY_HEIGHT)
		proc->unk3E = y - ySpan;

	proc->unk3C += 8;
	proc->unk3E += 8;
}

void sub_808929C(struct HelpBoxProc* proc, int x, int y)
{
	x += gUnknown_0203E788.x*8;
	y += gUnknown_0203E788.y*8;

	proc->unk38 = x;
	proc->unk3A = y;
}

void sub_80892C0(struct HelpBoxProc* proc)
{
	proc->unk40 = 32;
	proc->unk42 = 16;
}

int sub_80892D0(int item)
{
	if (item == 0xFFFE)
		return 3;

	if (GetItemAttributes(item) & IA_LOCK_3)
		return 0;

	if (GetItemAttributes(item) & IA_WEAPON)
		return 1;

	if (GetItemAttributes(item) & IA_STAFF)
		return 2;

	return 0;
}

void sub_8089320(struct HelpBoxProc* proc)
{
	int item = proc->info->msgId;

	proc->item_maybe = item;

	if (sub_80892D0(proc->item_maybe) == 3)
		proc->msgId_maybe = 0;
	else
		proc->msgId_maybe = GetItemDescId(item);
}

int sub_8089354(struct HelpBoxProc* proc)
{
	if (!proc->info->adj1)
		return FALSE;

	proc->info = proc->info->adj1;
	proc->unk50 = 0x40;

	if (proc->info->onInitMoveable)
		proc->info->onInitMoveable(proc);

	return TRUE;
}

int sub_8089384(struct HelpBoxProc* proc)
{
	if (!proc->info->adj2)
		return FALSE;

	proc->info = proc->info->adj2;
	proc->unk50 = 0x80;

	if (proc->info->onInitMoveable)
		proc->info->onInitMoveable(proc);

	return TRUE;
}

int sub_80893B4(struct HelpBoxProc* proc)
{
	if (!proc->info->adj3)
		return FALSE;

	proc->info = proc->info->adj3;
	proc->unk50 = 0x20;

	if (proc->info->onInitMoveable)
		proc->info->onInitMoveable(proc);

	return TRUE;
}

int sub_80893E4(struct HelpBoxProc* proc)
{
	// whoa bad hardcoded thing!
	if (!proc->info->adj4 || (proc->info == &gUnknown_08A00D14 && !gUnknown_02003BFC.unit->items[0]))
		return FALSE;

	proc->info = proc->info->adj4;
	proc->unk50 = 0x10;

	if (proc->info->onInitMoveable)
		proc->info->onInitMoveable(proc);

	return TRUE;
}

extern struct ProcCmd CONST_DATA gUnknown_08A00B00[];

void sub_8089430(struct Proc* proc)
{
	if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
		Proc_ClearNativeCallback(proc);
}

int sub_8089454(int msgid, struct Proc* parent)
{
	LoadDialogueBoxGfx(NULL, -1);

	sub_8088DE0(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), msgid);
	Proc_CreateBlockingChild(gUnknown_08A00B00, parent);

	return TRUE;
}

void Loop6C_8A00B20_UpdateOAMData(struct HelpPromptObjectProc* proc)
{
	RegisterObjectAttributes_SafeMaybe(0,
		proc->xDisplay, proc->yDisplay,
		gUnknown_08A00B10, proc->tileref);
}

struct Proc* sub_80894AC(int x, int y, struct Proc* parent)
{
	struct HelpPromptObjectProc* proc = (void*) Proc_Find(gUnknown_08A00B20);

	if (!proc)
		proc = (void*) Proc_Create(gUnknown_08A00B20, parent);

	proc->xDisplay = x;
	proc->yDisplay = y;
	proc->tileref  = TILEREF(0, 0);

	return (void*) proc;
}

struct Proc* sub_80894E0(int x, int y, int palid, struct Proc* parent)
{
	struct HelpPromptObjectProc* proc = (void*) Proc_Find(gUnknown_08A00B20);

	ApplyPalette(gUnknown_08A1D79C, palid + 0x10);

	if (!proc)
		proc = (void*) Proc_Create(gUnknown_08A00B20, parent);

	proc->xDisplay = x;
	proc->yDisplay = y;
	proc->tileref  = TILEREF(0, 0xF & palid);

	return (void*) proc;
}

struct Proc* sub_808953C(int x, int y, struct Proc* parent)
{
	struct HelpPromptObjectProc* proc = (void*) Proc_Find(gUnknown_08A00B20);

	if (!proc)
		proc = (void*) Proc_CreateBlockingChild(gUnknown_08A00B20, parent);

	proc->xDisplay = x;
	proc->yDisplay = y;
	proc->tileref  = TILEREF(0, 0);

	return (void*) proc;
}

void sub_8089570(void)
{
	struct Proc* proc = Proc_Find(gUnknown_08A00B20);

	if (proc)
		Proc_Delete(proc);
}

void sub_8089588(int x, int y)
{
	struct HelpPromptObjectProc* proc = (void*) Proc_Find(gUnknown_08A00B20);

	if (proc)
	{
		proc->xDisplay = x;
		proc->yDisplay = y;
	}
}

const struct HelpBoxInfo* sub_80895A8(void)
{
	return gUnknown_0203E784;
}
