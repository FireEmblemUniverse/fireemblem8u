#ifndef PREP_SCREEN_H

#include "proc.h"
#include "fontgrp.h"

struct PrepUnitList {
    struct Unit *units[0x40];
    int max_num;        /* A cunter maybe related to the amount of units in team */
    int latest_pid;     /* Last unit char-id when you leave the prep-unit-screen */
};

enum prep_atmenu_item_index {
    PREP_MAINMENU_UNIT = 0,
    PREP_MAINMENU_ITEM = 1,
    PREP_MAINMENU_SAVE = 2,
    PREP_MAINMENU_UNK3 = 3,
    PREP_MAINMENU_SUPPORT = 4,
    PREP_MAINMENU_CHECKMAP = 7,
};

struct ProcAtMenu {
    PROC_HEADER;
    /* 29 */ u8 unit_count;
    /* 2A */ u8 max_counter; // Total unit number can be on battle
    /* 2B */ u8 cur_counter; // Total unit number to be on battle
    /* 2C */ u8 unk_2C;
    /* 2D */ u8 cur_cmd;
    /* 2E */ u8 hand_pos;     // related to the displayed line maybe (also for handle sprite)
    /* 2F */ u8 unk_2F;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 state;
    /* 34 */ u8 do_help;     // 1 if helpBox on
    /* 35 */ u8 unk_35;
    /* 36 */ bool8 end_prep;
    /* 38 */ u8 unk_38[0x3C - 0x38];
    /* 3C */ u16 yDiff; // y Pos offset of Unit SMS
    /* 3E */ u16 unk3E;
    /* 40 */ u32 xDiff;
};

struct ProcPrepMenuDesc {
    PROC_HEADER;
    /* 29 */ u8 _pad29_[0x4C - 0x29];
    /* 4C */ u16 unk4C;
    /* 4E */ u8 _pad4E_[0x58 - 0x4E];
    /* 58 */ int msg;
};

struct Proc08A184B4 {
    PROC_HEADER;
    /* 29 */ u8 _pad29_[0x4C - 0x29];
    /* 4C */ s16 game_lock;
};

struct ProcPrepSpecialChar {
     PROC_HEADER;
    /* 29 */ u8 _pad29_[0x2A - 0x29];
    /* 2A */ u8 unk2A;
    /* 2B */ u8 unk2B;
    /* 29 */ u8 _pad2C_[0x2F - 0x2C];
    /* 2F */ u8 unk2F;
    /* 30 */ u8 unk30;
    /* 31 */ u8 unk31;
    /* 32 */ u8 unk32;
    /* 33 */ u8 blink_Start;
    /* 34 */ u8 blink_B;
    /* 35 */ u8 unk35;
    /* 36 */ u16 unk36;
    /* 38 */ ProcPtr apProc;
};

struct ProcPrepMenuItem {
	PROC_HEADER;
	/* 29 */ u8 pad_29[0x2C - 0x29];
	/* 2C */ void (*effect)(ProcPtr);
	/* 30 */ int msg_rtext;
	/* 34 */ u32 msg;
	/* 38 */ u8 color;
	/* 39 */ u8 index;
	/* 3A */ u8 pad_3A[0x3C - 0x3A];
	/* 3C */ struct TextHandle text;
};

struct ProcPrepMenu {
    PROC_HEADER;
    /* 29 */ s8 do_help;
    /* 2A */ u8 cur_index;
    /* 2B */ u8 max_index;
    /* 2C */ void (*unk2C)(ProcPtr);
    /* 30 */ int msg_rtext;
    /* 34 */ s16 xPos;
    /* 36 */ s16 yPos;
    /* 38 */ struct ProcPrepMenuItem* cmds[0x8];
    /* 58 */ u8 (*on_PressB)(ProcPtr);
    /* 5C */ u8 (*on_PressStart)(ProcPtr);
    /* 60 */ u8 (*on_End)(ProcPtr);
};

struct ProcPrepUnit {
    PROC_HEADER;
    /* 29 */ u8 cur_counter; // Total unit number to be on battle
    /* 2A */ u8 max_counter; // Total unit number can be on battle
    /* 2B */ u8 unk_2B;
    /* 2C */ u16 list_num_pre; // pre unit index in prep-list(for scroll)
    /* 2E */ u16 list_num_cur; // current unit index in prep-list
    /* 30 */ u16 yDiff_cur; // y Pos offset of Unit SMS (current)
    /* 32 */ u16 unk_32;
    /* 34 */ u16 unk34;
    /* 36 */ u8 scroll_val; // each px to scroll at each frame
    /* 37 */ u8 button_blank;
    /* 38 */ u8 pad_38[0x3C - 0x38];
    /* 3C */ u16 unk_3C;
};

enum proc_label_prep_unit_select {
    PROC_LABEL_PREPUNIT_0 = 0,
    PROC_LABEL_PREPUNIT_IDLE,
    PROC_LABEL_PREPUNIT_2,
    PROC_LABEL_PREPUNIT_PRESS_SELECT,
    PROC_LABEL_PREPUNIT_PRESS_R,
    PROC_LABEL_PREPUNIT_PRESS_B = 0xA,
    PROC_LABEL_PREPUNIT_GAME_START = 0x63,
    PROC_LABEL_PREPUNIT_END = 0x64,
};

extern struct TextHandle gPrepMainMenuTexts[9];

void Prep_DrawChapterGoal(int VRAM_offset, int pal);
// ??? PrepAtMenu_OnInit(???);
// ??? ResetPrepMenuDescTexts(???);
void ParsePrepMenuDescTexts(int msg);
// ??? DrawPrepMenuDescTexts(???);
// ??? PrepMenuDescOnInit(???);
// ??? PrepMenuDescOnParse(???);
// ??? PrepMenuDescOnDraw(???);
void sub_8095C00(int msg, ProcPtr parent);
// ??? sub_8095C2C(???);
// ??? sub_8095C50(???);
// ??? AtMenu_Reinitialize(???);
// ??? EndPrepAtMenuIfNoUnitAvailable(???);
// ??? sub_8095F2C(???);
void sub_8095F54(struct ProcAtMenu *proc);
void CleanupPrepMenuScreen(ProcPtr proc);
// ??? sub_8096004(???);
// ??? AtMenu_CtrlLoop(???);
// ??? AtMenuSetUnitStateAndEndFlag(???);
// ??? AtMenu_ResetScreenEffect(???);
// ??? AtMenu_ResetBmUiEffect(???);
// ??? AtMenu_StartSubmenu(???);
// ??? AtMenu_OnSubmenuEnd(???);
void sub_8096404();
void AtMenu_LockGame();
void AtMenu_UnlockGame();
void StartPrepAtMenu();
void StartPrepAtMenuWithConfig();
// ??? HasConvoyAccess_(???);
// ??? TraineePromo_ResetScreenEffect(???);
// ??? DoPromoteAnimForChar100(???);
// ??? IsGameLockLevelReserved(???);
// ??? NullExpForChar100AndResetScreen(???);
// ??? sub_80965F0(???);
// ??? sub_8096668(???);
// ??? NewPrepScreenTraineePromotionManager(???);
// ??? PrepScreenTraineePromotionManagerExists(???);
// ??? PrepAtMenuExists(???);
// ??? PutObj8A1856E(???);
// ??? PutObj8A18582_WithConfigs(???);
// ??? PutObj8A18590_WithConfigs(???);
// ??? PutObj8A1859E_WithConfigs(???);
// ??? PutObj8A185AC(???);
// ??? sub_8096958(???);
// ??? ProcPrepSpChar_OnInit(???);
// ??? ProcPrepSpChar_Idle(???);
// ??? ProcPrepSpChar_OnEnd(???);

#endif /* PREP_SCREEN_H */
