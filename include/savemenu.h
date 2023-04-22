#ifndef GUARD_SAVEMENU_H
#define GUARD_SAVEMENU_H

enum {
    MAIN_MENU_OPTION_RESUME     = (1 << 0),
    MAIN_MENU_OPTION_RESTART    = (1 << 1),
    MAIN_MENU_OPTION_COPY       = (1 << 2),
    MAIN_MENU_OPTION_ERASE      = (1 << 3),
    MAIN_MENU_OPTION_NEW_GAME   = (1 << 4),
    MAIN_MENU_OPTION_EXTRAS     = (1 << 5),
};

enum {
    EXTRA_MENU_OPTION_LINK_ARENA   = (1 << 0),
    EXTRA_MENU_OPTION_SOUND_ROOM   = (1 << 1),
    EXTRA_MENU_OPTION_SUPPORT      = (1 << 2),
    // (1 << 3)
    EXTRA_MENU_OPTION_MAP          = (1 << 4),
    EXTRA_MENU_OPTION_BONUS_CLAIM  = (1 << 5),
};

struct SaveMenuProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29; // seems to be related to scrolling frame counter when scrolling from "resume" to "chapter options"
    /* 2A */ u8 unk_2a; // difficulty
    /* 2B */ u8 unk_2b; // main menu current index
    /* 2C */ u8 unk_2c; // save file menu current index
    /* 2D */ u8 unk_2d; // static cursor index, 0xff if not showing any
    /* 2E */ u8 unk_2e; // ??
    /* 2F */ u8 unk_2f; // horizontal offset for menu
    /* 30 */ u8 unk_30; // main screen active menu options (bitfield)
    /* 31 */ u8 unk_31; // # menu options
    /* 32 */ u8 unk_32; // extras menu current index
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34; // confirm / cancel options
    /* 35 */ u8 unk_35;
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37[3];
    /* 3A */ u8 unk_3a[3];
    /* 3D */ u8 unk_3d;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;

    /* 48 */ u8 _pad3[0x58-0x48];

    /* 58 */ ProcPtr unk_58;
    /* 5C */ u32 unk_5c;
    /* 60 */ ProcPtr unk_60;
};

#endif // GUARD_SAVEMENU_H
