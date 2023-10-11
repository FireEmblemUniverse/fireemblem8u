#ifndef GUARD_SAVEMENU_H
#define GUARD_SAVEMENU_H

#include "fontgrp.h"

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

struct SaveDrawProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
};

struct SaveMenuProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29; // seems to be related to scrolling frame counter when scrolling from "resume" to "chapter options"
    /* 2A */ u8 unk_2a; // difficulty
    /* 2B */ u8 menu_index; // main menu current index
    /* 2C */ u8 save_slot; // save file menu current index
    /* 2D */ u8 unk_2d; // static cursor index, 0xff if not showing any
    /* 2E */ u8 unk_2e; // ??
    /* 2F */ u8 unk_2f; // horizontal offset for menu
    /* 30 */ u8 active_options; // main screen active menu options (bitfield)
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
    /* 42 */ u16 action_flag;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;

    int unk_48[3];

    int unk_54;

    /* 58 */ struct SaveDrawProc * unk_58;
    /* 5C */ u32 unk_5c;
    /* 60 */ ProcPtr unk_60;
};

struct DifficultyMenuSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29_0 : 1;
    /* 29 */ u8 unk_29_1 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32;
    /* 34 */ u16 unk_34;
    /* 36 */ u16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 unk_3c;
};

struct DifficultyMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ u8 unk_30;
    /* 34 */ struct DifficultyMenuSpritesProc * unk_34;
    /* 38 */ struct Text unk_38[5];
};

// ??? sub_80A882C(???);
// ??? SaveMenuIndexToValidBitfile(???);
// ??? sub_80A887C(???);
// ??? sub_80A88B8(???);
// ??? sub_80A88E0(???);
// ??? LoadSaveMenuHelpText(???);
// ??? SaveMenuPostChapterHandleHelpBox(???);
// ??? sub_80A8A9C(???);
// ??? sub_80A8AF0(???);
// ??? SaveMenu_Init(???);
// ??? ProcSaveMenu_InitScreen(???);
// ??? SaveMenu_LoadExtraMenuGraphics(???);
// ??? SaveMenuInit(???);
// ??? SaveMenuInitUnused(???);
// ??? sub_80A9014(???);
// ??? Loop6C_savemenu(???);
// ??? SaveMenuWriteNewGame(???);
// ??? sub_80A9290(???);
// ??? SaveMenuPostChapterIDLE(???);
// ??? sub_80A96D0(???);
// ??? sub_80A96DC(???);
// ??? sub_80A96EC(???);
// ??? sub_80A99C0(???);
// ??? sub_80A9A08(???);
// ??? sub_80A9A18(???);
// ??? sub_80A9A68(???);
// ??? sub_80A9AB0(???);
// ??? sub_80A9AF4(???);
// ??? sub_80A9B44(???);
// ??? sub_80A9B90(???);
s8 sub_80A9D20(struct SaveMenuProc*, int);
// ??? sub_80A9D84(???);
// ??? sub_80A9DBC(???);
// ??? sub_80A9DFC(???);
// ??? sub_80A9E1C(???);
// ??? sub_80AA018(???);
// ??? PostSaveMenuHandler(???);
// ??? ExtraMapStartSomeBgm(???);
// ??? ExecExtraMap(???);
// ??? CallExtraMap(???);
// ??? sub_80AA158(???);
// ??? sub_80AA1BC(???);
// ??? sub_80AA1EC(???);
// ??? sub_80AA248(???);
// ??? sub_80AA2A8(???);
// ??? sub_80AA30C(???);
// ??? sub_80AA458(???);
// ??? sub_80AA47C(???);
// ??? sub_80AA49C(???);
// ??? sub_80AA4B4(???);
void Make6C_SaveMenuNewGame(ProcPtr);
// ??? sub_80AA4F8(???);
void Make6C_SaveMenuPostChapter(ProcPtr);
void savemenu_SetDifficultyChoice(int, int);
// ??? sub_80AA550(???);
// ??? sub_80AA614(???);
// ??? sub_80AA658(???);
// ??? sub_80AA69C(???);
// ??? sub_80AA6D8(???);
void sub_80AA6EC(ProcPtr);
void sub_80AA700(void);
// ??? GetLeaderNameForSaveMenu(???);
int GetLeaderLevelForSaveMenu(void);
const char * GetWMNodeNameForSaveMenu(void);
void sub_80AA790(u16 *, u16 *, int);
// ??? sub_80AA7AC(???);
// ??? sub_80AA7EC(???);
// ??? sub_80AA9D8(???);
// ??? sub_80AAA6C(???);
// ??? sub_80AAA78(???);
// ??? sub_80AAB78(???);
// ??? sub_80AABC4(???);
// ??? sub_80AAC40(???);
// ??? sub_80AACBC(???);
// ??? sub_80AADE0(???);
// ??? sub_80AAE90(???);
// ??? sub_80AAF6C(???);
// ??? sub_80AB05C(???);
// ??? sub_80AB2A0(???);
ProcPtr New6C_savedraw(ProcPtr);
// ??? SaveDrawCursor_Init(???);
// ??? SaveDrawCursor_Loop(???);
// ??? sub_80AB4F4(???);
// ??? sub_80AB514(???);
// ??? StartSaveDrawCursor(???);
// ??? sub_80AB548(???);
// ??? sub_80AB56C(???);
// ??? sub_80AB720(???);
void sub_80AB760(void*);
void sub_80AB77C(void);
void sub_80AB794(void);
// ??? sub_80AB7BC(???);
void sub_80AB83C(struct SaveMenuProc*, s8);
// ??? AddMainMenuOption(???);
// ??? AddExtraMenuOption(???);
void sub_80AB89C(struct SaveMenuProc*);
u8 SaveMenuModifySaveSlot(u8, int, int);
s8 sub_80AB9FC(struct SaveMenuProc*, int);
s8 sub_80ABA98(struct SaveMenuProc*);
// ??? SqMask_Loop(???);
void StartSqMask(struct SaveMenuProc*, int, int);
// ??? SaveBgUp_Loop(???);
// ??? StartSaveBgUp(???);
void sub_80ABC14(u8, struct SaveMenuProc*);
void sub_80ABD88(u8);
// ??? sub_80ABE3C(???);
u8 SaveMenuGetValidMenuAmt(u8 endMask, struct SaveMenuProc * proc);
void sub_80ABF74(u8);
void DrawDifficultyModeText(struct DifficultyMenuProc *);
void sub_80AC034(struct DifficultyMenuProc *);
// ??? DifficultySelect_OnEnd(???);
// ??? InitDifficultySelectScreen(???);
// ??? DifficultySelect_Init(???);
// ??? sub_80AC1BC(???);
// ??? sub_80AC22C(???);
// ??? DifficultySelect_Loop_KeyHandler(???);
// ??? nullsub_64(???);
void NewNewGameDifficultySelect(ProcPtr);
// ??? DrawDifficultySprite_Init(???);
// ??? DrawDifficultyMenuCursorMaybe(???);
// ??? sub_80AC4F8(???);
// ??? DrawDifficultySprites_Loop(???);
void sub_80AC680(struct DifficultyMenuSpritesProc *, int, int);
ProcPtr StartDrawDifficultyMenuSprites(ProcPtr);

#endif // GUARD_SAVEMENU_H
