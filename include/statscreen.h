#ifndef GUARD_STATSCREEN_H
#define GUARD_STATSCREEN_H

enum
{
	STATSCREEN_BGPAL_HALO = 1,
	STATSCREEN_BGPAL_2 = 2,
	STATSCREEN_BGPAL_3 = 3,
	STATSCREEN_BGPAL_ITEMICONS = 4,
	STATSCREEN_BGPAL_EXTICONS = 5,
	STATSCREEN_BGPAL_6 = 6,
	STATSCREEN_BGPAL_7 = 7,
	STATSCREEN_BGPAL_FACE = 11,
	STATSCREEN_BGPAL_BACKGROUND = 12, // 4 palettes

	STATSCREEN_OBJPAL_4 = 4,
};

enum
{
	STATSCREEN_PAGE_0,
	STATSCREEN_PAGE_1,
	STATSCREEN_PAGE_2,

	STATSCREEN_PAGE_MAX,
};

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

struct HelpBoxInfo;

struct StatScreenSt
{
	/* 00 */ u8 page;
	/* 01 */ u8 pageAmt;
	/* 02 */ u16 unk02;
	/* 04 */ short unk04;
	/* 06 */ short yDispOff;
	/* 08 */ s8 inTransition;
	/* 0C */ struct Unit* unit;
	/* 10 */ struct MUProc* mu;
	/* 14 */ const struct HelpBoxInfo* help;
	/* 18 */ struct TextHandle text[STATSCREEN_TEXT_MAX];
};

struct StatScreenTransitionProc
{
	PROC_HEADER;

	/* 29 */ u8 pad29[0x38 - 0x29];

	/* 38 */ int unk38;
	/* 3C */ int unk3C;
	/* 40 */ int unk40;

	/* 44 */ u8 pad44[0x4A - 0x44];

	/* 4A */ short unk4A;
	/* 4C */ short unk4C;
	/* 4E */ short unk4E;
	/* 50 */ short unk50;
	/* 52 */ u16   unk52;
};

struct StatScreenPageNameProc
{
	/* 00 */ PROC_HEADER;

	/* 29 */ u8 pad29[0x36 - 0x29];
	/* 36 */ u8 unk36;
	/* 38 */ short unk38;
};

struct StatScreenUnkProc
{
	/* 00 */ PROC_HEADER;

	/* 2A */ short unk2A;
	/* 2C */ short unk2C;
	/* 2E */ u16 unk2E;
	/* 30 */ u16 unk30;
	/* 32 */ short unk32;
	/* 34 */ short unk34;
};

struct HelpBoxProc
{
	/* 00 */ PROC_HEADER;

	/* 2C */ const struct HelpBoxInfo* info;

	/* 30 */ short unk30;
	/* 32 */ short unk32;
	/* 34 */ short unk34;
	/* 36 */ short unk36;
	/* 38 */ short unk38;
	/* 3A */ short unk3A;
	/* 3C */ short unk3C;
	/* 3E */ short unk3E;
	/* 40 */ short unk40;
	/* 42 */ short unk42;
	/* 44 */ short unk44;
	/* 46 */ short unk46;
	/* 48 */ short unk48;
	/* 4A */ short unk4A;

	/* 4C */ u16 msgId_maybe;
	/* 4E */ u16 item_maybe;

	/* 50 */ u16 unk50;

	/* 52 */ u8 unk52;
};

struct HelpBoxInfo
{
	/* 00 */ const struct HelpBoxInfo* adj1;
	/* 04 */ const struct HelpBoxInfo* adj2;
	/* 08 */ const struct HelpBoxInfo* adj3;
	/* 0C */ const struct HelpBoxInfo* adj4;
	/* 10 */ u8 xDisplay;
	/* 11 */ u8 yDisplay;
	/* 12 */ u16 msgId;
	/* 14 */ void(*onInitMoveable)(struct HelpBoxProc* proc);
	/* 18 */ void(*onInit)(struct HelpBoxProc* proc);
};

struct HelpPromptObjectProc
{
	PROC_HEADER;

	/* 2C */ int xDisplay;
	/* 30 */ int yDisplay;
	/* 34 */ int tileref;
};

// ??? GetSomeUnitId(???);
// ??? sub_8086DD8(???);
// ??? sub_8086DE4(???);
// ??? sub_8086DF0(???);
// ??? sub_8086E00(???);
// ??? sub_8086E44(???);
// ??? sub_8086FAC(???);
// ??? DrawStatScreenBar(???);
// ??? DrawUnitStatScreen(???);
// ??? DrawUnitItemScreen(???);
// ??? DrawUnitScreenSupportList(???);
// ??? DrawUnitWeaponRank(???);
// ??? DrawUnitWeaponScreen(???);
// ??? sub_80878CC(???);
// ??? sub_8087920(???);
// ??? sub_80879DC(???);
// ??? sub_8087ACC(???);
// ??? sub_8087AD8(???);
// ??? sub_8087B40(???);
// ??? sub_8087BA0(???);
// ??? sub_8087BF0(???);
// ??? sub_8087C04(???);
// ??? sub_8087C34(???);
// ??? sub_8087CC0(???);
// ??? sub_8087D24(???);
// ??? sub_8087D98(???);
// ??? sub_8087DF8(???);
// ??? sub_8087E28(???);
// ??? sub_8087E7C(???);
// ??? sub_8087EB8(???);
// ??? sub_8087F48(???);
// ??? sub_8087FE0(???);
// ??? sub_8088014(???);
// ??? sub_80880DC(???);
// ??? sub_80881AC(???);
// ??? sub_80881C4(???);
// ??? sub_80881FC(???);
// ??? sub_80882E4(???);
// ??? sub_8088354(???);
// ??? sub_8088384(???);
// ??? sub_808844C(???);
// ??? sub_80884B0(???);
// ??? sub_8088670(???);
// ??? sub_808873C(???);
// ??? sub_80888B4(???);
// ??? sub_808890C(???);
// ??? sub_8088920(???);
// ??? sub_808894C(???);
// ??? MakeStatScreenRText6C(???);
// ??? sub_8088A00(???);
// ??? sub_8088A2C(???);
// ??? sub_8088B08(???);
// ??? sub_8088B40(???);
// ??? sub_8088B94(???);
// ??? sub_8088BD4(???);
// ??? sub_8088C00(???);
// ??? sub_8088C14(???);
// ??? sub_8088C48(???);
// ??? sub_8088CFC(???);
// ??? sub_8088D3C(???);
// ??? sub_8088D64(???);
// ??? sub_8088DB8(???);
void sub_8088DE0(int x, int y, int msgid);
// ??? sub_8088E14(???);
void sub_8088E60(int x, int y, int item);
// ??? sub_8088E9C(???);
// ??? sub_8088F68(???);
void sub_8089018(void);
// ??? sub_808903C(???);
// ??? sub_8089060(???);
// ??? sub_8089088(???);
// ??? sub_8089150(???);
// void Create6CRText(const struct HelpBoxInfo* helpinfo, struct Proc* parent); // StartMoveableHelpBox
// ??? sub_8089188(???);
// ??? sub_80891AC(???);
// ??? sub_8089210(???);
// ??? sub_808929C(???);
// ??? sub_80892C0(???);
// ??? sub_80892D0(???);
// ??? sub_8089320(???);
// ??? sub_8089354(???);
// ??? sub_8089384(???);
// ??? sub_80893B4(???);
// ??? sub_80893E4(???);
// ??? sub_8089430(???);
// ??? sub_8089454(???);
// ??? Loop6C_8A00B20_UpdateOAMData(???);
// ??? sub_80894AC(???);
// ??? sub_80894E0(???);
// ??? sub_808953C(???);
// ??? sub_8089570(???);
// ??? sub_8089588(???);
// ??? sub_80895A8(???);

#endif // GUARD_STATSCREEN_H
