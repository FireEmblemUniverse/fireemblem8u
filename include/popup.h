#ifndef GUARD_POPUP_H
#define GUARD_POPUP_H

enum popup_opcode_index {
    POPUP_END,              /* 00 */
    POPUP_SPACE,            /* 01 */
    POPUP_ITEM_NAME,        /* 02 */
    POPUP_ITEM_STR_CAP,     /* 03 */
    POPUP_ITEM_STR,         /* 04 */
    POPUP_UNIT_NAME,        /* 05 */
    POPUP_MSG,              /* 06 */
    POPUP_STR,              /* 07 */
    POPUP_COLOR,            /* 08 */
    POPUP_ITEM_ICON,        /* 09 */
    POPUP_WTYPE_ICON,       /* 0A */
    POPUP_NUM,              /* 0B */
    POPUP_SOUND,            /* 0C */
};

struct PopupInstruction {
    u8 opcode;
    u32 data;
};

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

#endif /* GUARD_POPUP_H */
