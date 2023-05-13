#ifndef GUARD_POPUP_H
#define GUARD_POPUP_H

#include "global.h"

enum popup_opcode_index {
    POPUP_OP_END,              /* 00 */
    POPUP_OP_SPACE,            /* 01 */
    POPUP_OP_ITEM_NAME,        /* 02 */
    POPUP_OP_ITEM_STR_CAP,     /* 03 */
    POPUP_OP_ITEM_STR,         /* 04 */
    POPUP_OP_UNIT_NAME,        /* 05 */
    POPUP_OP_MSG,              /* 06 */
    POPUP_OP_STR,              /* 07 */
    POPUP_OP_COLOR,            /* 08 */
    POPUP_OP_ITEM_ICON,        /* 09 */
    POPUP_OP_WTYPE_ICON,       /* 0A */
    POPUP_OP_NUM,              /* 0B */
    POPUP_OP_SOUND,            /* 0C */
};

struct PopupInstruction {
    u8 opcode;
    u32 data;
};

#define POPUP_END               {POPUP_OP_END, 0}
#define POPUP_SPACE(len)        {POPUP_OP_SPACE, len}
#define POPUP_ITEM_NAME         {POPUP_OP_ITEM_NAME, 0}
#define POPUP_ITEM_STR_CAP      {POPUP_OP_ITEM_STR_CAP, 0}
#define POPUP_ITEM_STR          {POPUP_OP_ITEM_STR, 0}
#define POPUP_UNIT_NAME         {POPUP_OP_UNIT_NAME, 0}
#define POPUP_MSG(msg)          {POPUP_OP_MSG, msg}
#define POPUP_STR(ptr)          {POPUP_OP_STR, (ptr)}
#define POPUP_COLOR(color)      {POPUP_OP_COLOR, color}
#define POPUP_ITEM_ICON         {POPUP_OP_ITEM_ICON, 0}
#define POPUP_WTYPE_ICON        {POPUP_OP_WTYPE_ICON, 0}
#define POPUP_NUM               {POPUP_OP_NUM, 0}
#define POPUP_SOUND(soundId)    {POPUP_OP_SOUND, soundId}

struct PopupProc {
	PROC_HEADER;

	/* 2C */ const struct PopupInstruction *pDefinition;
	/* 30 */ int clock;

	/* 34 */ s8 xTileParam;
	/* 35 */ s8 yTileParam;

	/* 36 */ u8 winStyle;

	/* 37 */ u8 xTileReal;
	/* 38 */ u8 yTileReal;

	/* 39 */ u8 xTileSize;
	/* 3A */ u8 yTileSize;

	/* 3B */ u8 textColorId;

	/* 3C */ u16 _pad3C;

	/* 3E */ u16 iconId;
	/* 40 */ u16 iconObjTileId;
	/* 42 */ u8  iconPalId;
	/* 43 */ u8  _pad43;
	/* 44 */ u8  iconX;
	/* 45 */ u8  _pad45;

	/* 46 */ u16 xGfxSize;

	/* 48 */ u16 soundId;
};

struct PopupIconUpdateProc {
    PROC_HEADER;
    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ u8 _pad_34[0x4A - 0x34];
    /* 4A */ u16 unk_4A;
};

struct GotItemPopupProc {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x54 - 0x29];
    /* 54 */ struct Unit* unit;
    /* 58 */ int item;
};

void SetPopupUnit(struct Unit* unit);
void SetPopupItem(u16 item);
void SetPopupNumber(u32 num);

ProcPtr NewPopupCore(const struct PopupInstruction *inst,
                 int clock,
                 int winStyle,
                 int iconObjTileId,
                 int pal_base, /* proc->iconPalId - 0x10 */
                 ProcPtr parent);
ProcPtr NewPopup_Simple(const struct PopupInstruction *inst,
                       int clock,
                       int winStyle,
                       ProcPtr parent);
void NewPopup_NewAlly(ProcPtr, u8);
void NewPopup_VerySimple(u32 msg, u32 sound_index, ProcPtr parent);

void NewPopup_ItemGot_unused(struct Unit* unit, u16 item, ProcPtr parent);
void NewPopup_ItemGot(ProcPtr parent, struct Unit *unit, u16 item);
void NewPopup_GeneralItemGot(struct Unit *unit, u16 item, ProcPtr parent);
void NewPopup_GoldGot(ProcPtr parent, struct Unit *unit, int value);
void NewPopup_ItemStealing(u16 item, ProcPtr parent);
void NewPopup_WeaponBroke(u16 item, ProcPtr parent);

void NewPopup2_PlanA(ProcPtr parent, int IconIndex, char *str);
void NewPopup2_PlanB(ProcPtr proc, int icon_index, char *str0, int num, char *str1);
void NewPopup2_PlanC(ProcPtr parent, int item, int msg);
void NewPopup2_PlanD(ProcPtr parent, int item, int msg0, int msg1);
void NewPopup2_DropItem(ProcPtr parent, int item);
void NewPopup2_SendItem(ProcPtr parent, int item);

#endif /* GUARD_POPUP_H */
