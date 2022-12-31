#ifndef PREP_SCREEN_H

#include "proc.h"

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
    /* 00 */ PROC_HEADER;
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
    /* 3C */ u32 yDiff; // y Pos offset of Unit SMS
    /* 40 */ u32 xDiff;
};

struct ProcPrepMenuDesc {
    PROC_HEADER;
    /* 29 */ u8 _pad29_[0x4C - 0x29];
    /* 4C */ u16 unk4C;
    /* 4E */ u8 _pad4E_[0x58 - 0x4E];
    /* 58 */ int msg;
};

#endif /* PREP_SCREEN_H */
