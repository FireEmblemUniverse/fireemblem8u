#ifndef GUARD_SAVEMENU_H
#define GUARD_SAVEMENU_H

#include "fontgrp.h"
#include "bonusclaim.h"

enum {
    PL_SAVEMENU_INIT,
    PL_SAVEMENU_DIFFICULTY_SEL,
    PL_SAVEMENU_MAIN_LOOP,
    PL_SAVEMENU_SCROLL_SLOT,
    PL_SAVEMENU_BACK_TO_MAIN,
    PL_SAVEMENU_SAVE_SLOT_SEL,
    PL_SAVEMENU_SLOT_SELECTED,
    PL_SAVEMENU_EXEC_MISC_OPTION,
    PL_SAVEMENU_8,
    PL_SAVEMENU_9,
    PL_SAVEMENU_10,
    PL_SAVEMENU_POST_BONUS_CLAIM,
    PL_SAVEMENU_12,
    PL_SAVEMENU_13,
    PL_SAVEMENU_EXEC_EXTRA_MISC_OPTION,
    PL_SAVEMENU_EXIT,
    PL_SAVEMENU_16,
    PL_SAVEMENU_EXIT_FADE,
    PL_SAVEMENU_NEW_GAME,
    PL_SAVEMENU_19,
    PL_SAVEMENU_SAVE_SLOT_SEL_FADEIN,
    PL_SAVEMENU_BLOCKING,
};

enum {
    /* SaveMenuProc::main_select */
    MAIN_MENU_RESUME     = 0,
    MAIN_MENU_RESTART    = 1,
    MAIN_MENU_COPY       = 2,
    MAIN_MENU_ERASE      = 3,
    MAIN_MENU_NEW_GAME   = 4,
    MAIN_MENU_EXTRAS     = 5,
    MAIN_MENU_INVALID    = 6,
    MAIN_MENU_7          = 7,
    MAIN_MENU_EXIT       = 8,

    /* SaveMenuProc::main_options and main_sel_bitfile */
    MAIN_MENU_OPTION_RESUME     = (1 << MAIN_MENU_RESUME),
    MAIN_MENU_OPTION_RESTART    = (1 << MAIN_MENU_RESTART),
    MAIN_MENU_OPTION_COPY       = (1 << MAIN_MENU_COPY),
    MAIN_MENU_OPTION_ERASE      = (1 << MAIN_MENU_ERASE),
    MAIN_MENU_OPTION_NEW_GAME   = (1 << MAIN_MENU_NEW_GAME),
    MAIN_MENU_OPTION_EXTRAS     = (1 << MAIN_MENU_EXTRAS),
    MAIN_MENU_OPTION_INVALID    = (1 << MAIN_MENU_INVALID),
    MAIN_MENU_OPTION_7          = (1 << MAIN_MENU_7),
    MAIN_MENU_OPTION_EXIT       = (1 << MAIN_MENU_EXIT),

    /* SaveMenuProc::extra_select */
    EXTRA_MENU_LINK_ARENA   = 0,
    EXTRA_MENU_SOUND_ROOM   = 1,
    EXTRA_MENU_SUPPORT      = 2,
    EXTRA_MENU_MAP          = 4,
    EXTRA_MENU_BONUS_CLAIM  = 5,
    EXTRA_MENU_6            = 6,

    /* SaveMenuProc::extra_sel_bitfile */
    EXTRA_MENU_OPTION_LINK_ARENA   = (1 << EXTRA_MENU_LINK_ARENA),
    EXTRA_MENU_OPTION_SOUND_ROOM   = (1 << EXTRA_MENU_SOUND_ROOM),
    EXTRA_MENU_OPTION_SUPPORT      = (1 << EXTRA_MENU_SUPPORT),
    EXTRA_MENU_OPTION_MAP          = (1 << EXTRA_MENU_MAP),
    EXTRA_MENU_OPTION_BONUS_CLAIM  = (1 << EXTRA_MENU_BONUS_CLAIM),
    EXTRA_MENU_OPTION_6            = (1 << EXTRA_MENU_6),
};

enum video_savemenu {
    BGCHR_SAVEMENU_SUBBOX_TEXT = 0x80,
    BGPAL_SAVEMENU_SUBBOX_TEXT = 4,

    BGCHR_SAVEMENU_BGFOG = 0x260,
    BGPAL_SAVEMENU_BGFOG = 7,

    OBJCHR_SAVEMENU_SPRITES = 0x40,
    OBJPAL_SAVEMENU_SPRITES = 2,

    OBJCHR_SAVEMENU_MAINCHOICE_STR = 0x200,

    OBJCHR_SAVEMENU_TITLEBG = 0x2C0,
    OBJPAL_SAVEMENU_TITLEBG = 8,

    OBJCHR_SAVEMENU_TITLEGFX = 0x340,
};

enum video_savemenu_slotsel {
    OBJCHR_SAVEMENU_SLOTSEL_HELPBOX = 0x200,
    OBJPAL_SAVEMENU_SLOTSEL_HELPBOX = 9,
};

struct SaveDrawProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ bool unk_29;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u16 unk_2e;
    /* 30 */ u16 unk_30;
    /* 32 */ s8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ ProcPtr unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
    // 3D - unused?
    /* 3E */ u16 bg_x;
    /* 40 */ u16 bg_y;
};

struct SaveMenuProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 scroll_cnt; // seems to be related to scrolling frame counter when scrolling from "resume" to "chapter options"
    /* 2A */ u8 difficulty;
    /* 2B */ u8 main_select; // main menu current index
    /* 2C */ u8 sus_slot; // save file menu current index
    /* 2D */ u8 cursor_slot; // static cursor index, 0xff if not showing any
    /* 2E */ u8 jump_label;
    /* 2F */ u8 unk_2f; // horizontal offset for menu
    /* 30 */ u8 main_options; // main screen active menu options (bitfield)
    /* 31 */ u8 unk_31; // # menu options
    /* 32 */ u8 extra_options; // extras menu current index
    /* 33 */ u8 max_choice;
    /* 34 */ u8 extra_select; // confirm / cancel options
    /* 35 */ u8 extra_sel_bitfile; // bit mask
    /* 36 */ u8 cursor_config;
    /* 37 */ u8 chapter_idx[3];
    /* 3A */ u8 unk_3a[3];
    /* 3D */ u8 unk_3d;
    /* 3E */ u8 hb_en;
    /* 3F */ u8 sus_slot_cur;
    /* 40 */ u8 ctrl_timer;
    /* 41 */ u8 unk_41;
    /* 42 */ u16 main_sel_bitfile;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;

    int played_time[3];
    int total_time;

    /* 58 */ struct SaveDrawProc * savedraw;
    /* 5C */ u32 unk_5c;
    /* 60 */ ProcPtr approc;
};

enum savemenuproc_st {
    /* ctrl_st */
    CTRL_TIMER_MAX = 8,
};

struct DifficultyMenuSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 flags_0 : 1;
    /* 29 */ u8 flags_1 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 current_selection;
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
    // Frame counter?
    /* 2C */ int unk_2c;
    /* 30 */ u8 current_selection;
    /* 34 */ struct DifficultyMenuSpritesProc * sprites_proc;
    /* 38 */ struct Text unk_38[5];
};

struct SaveMenuRTextData
{
    u8 pid;
    s8 level;
    s8 nodeId;
};

extern struct SaveMenuRTextData gSaveMenuRTextData;

struct SaveMenu8A20068Proc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 _pad[0x58-0x34];

    /* 58 */ int msgId;
};

struct ProcBonusClaimMenu
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
};

void SaveMenu_NewGame(ProcPtr proc);
u8 SaveMenuGetBitfile(u8 bitfile, u32 index);
u8 SaveMenuGetBitfileByMask(u8 a, u8 b);
u8 BitfileToIndex(u8);
void SaveMenuHandleHelpBox(struct SaveMenuProc * proc);
int LoadSaveMenuInfo(int slot);
bool SaveMenuWaitHelpBoxAnim(struct SaveMenuProc * proc);
void SaveMenuPutChapterTitle(struct SaveMenuProc * proc);
void SaveMenu_SetLcdChapterIdx(void);
void SaveMenu_Init(void);
void SaveMenu_InitScreen(struct SaveMenuProc * proc);
void SaveMenu_LoadExtraMenuGraphics(struct SaveMenuProc * proc);
void SaveMenuInit(struct SaveMenuProc * proc);
void SaveMenuInitUnused(struct SaveMenuProc * proc);
void SaveMenu_JumpToTarget(struct SaveMenuProc * proc);
void SameMenu_CtrlLoop(struct SaveMenuProc * proc);
void SaveMenuWriteNewGame(struct SaveMenuProc * proc);
void ExecSaveMenuMiscOption(struct SaveMenuProc * proc);
void SaveMenu_SaveSlotSelectLoop(struct SaveMenuProc * proc);
void _ExecSaveMenuMiscOption(struct SaveMenuProc * proc);
void SaveMenuRegisterSlotSelected(struct SaveMenuProc * proc);
void SaveMenuWaitSlotBoxScrolling(struct SaveMenuProc * proc);
void SaveMenuScrollSlot(struct SaveMenuProc * proc);
void sub_80A9A08(struct SaveMenuProc * proc);
void SaveMenuScrollBackToMain(struct SaveMenuProc * proc);
void sub_80A9A68(struct SaveMenuProc * proc);
void sub_80A9AB0(struct SaveMenuProc * proc);
void sub_80A9AF4(struct SaveMenuProc * proc);
void sub_80A9B44(struct SaveMenuProc * proc);
void sub_80A9B90(struct SaveMenuProc * proc);
s8 sub_80A9D20(struct SaveMenuProc *, int);
void sub_80A9D84(struct SaveMenu8A20068Proc * proc);
void sub_80A9DBC(struct SaveMenu8A20068Proc * proc);
void sub_80A9DFC(int x, int y, int msgId, ProcPtr parent);
void sub_80A9E1C(struct SaveMenuProc * proc);
void sub_80AA018(struct SaveMenuProc * proc);
void PostSaveMenuHandler(struct SaveMenuProc * proc);
void ExtraMapStartSomeBgm(struct SaveMenuProc * proc);
void ExecExtraMap(struct SaveMenuProc * proc);
void SaveMenuStartExtraMiscScreen(struct SaveMenuProc * proc);
void SaveMenuPostExtraMiscScreen(struct SaveMenuProc * proc);
void SaveMenu_ResetLcdFormDifficulty(struct SaveMenuProc * proc);
void sub_80AA248(struct SaveMenuProc * proc);
void sub_80AA2A8(struct SaveMenuProc * proc);
void SaveMenu_ReloadScreenFormDifficulty(struct SaveMenuProc * proc);
void SaveMenu_PostDifficultHandler(struct SaveMenuProc * proc);
void SaveMenuSlotSelDrawSprite(struct SaveMenuProc * proc);
void SaveMenuStartBonusClaim(struct SaveMenuProc * proc);
void SaveMenu_EndHelpPromptSprite(void);
void StartSaveMenu(ProcPtr);
void SaveMenuDirectlySelectSlotOnPrepScreen(ProcPtr proc);
void Make6C_SaveMenuPostChapter(ProcPtr);
void SaveMenu_SetDifficultyChoice(int, int);
void sub_80AA550(struct ProcBonusClaimMenu * proc);
void sub_80AA614(struct ProcBonusClaimMenu * proc);
void sub_80AA658(struct ProcBonusClaimMenu * proc);
void sub_80AA69C(struct ProcBonusClaimMenu * proc);
void sub_80AA6D8(void);
void StartBonusClaimMenu(ProcPtr);
void InitSaveMenuHelpTextSt(void);
const char * GetLeaderNameForSaveMenu(void);
int GetLeaderLevelForSaveMenu(void);
const char * GetWMNodeNameForSaveMenu(void);
void SaveMenuCopyPalette(u16 *, u16 *, int);
void sub_80AA7AC(int a, int b);
// ??? sub_80AA7EC(???);
void SaveDraw_ScrollFogBG(struct SaveDrawProc *);
// ??? SaveDraw_OnEnd(???);
// ??? SaveDraw_Init(???);
// ??? sub_80AAB78(???);
// ??? sub_80AABC4(???);
// ??? sub_80AAC40(???);
// ??? sub_80AACBC(???);
// ??? sub_80AADE0(???);
// ??? sub_80AAE90(???);
// ??? sub_80AAF6C(???);
// ??? sub_80AB05C(???);
// ??? SaveDraw_Loop_Main(???);
struct SaveDrawProc * StartSaveDraw(ProcPtr);

struct SaveDrawCursorProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;
    /* 2C */ u8 sus_slot;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 main_options;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u8 cursor_en;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
};

struct SqMaskProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ u8 unk_2b;
};

struct Unknown020007E0 {
    /* 00 */ u32 unk_00;
    /* 04 */ int unk_04;
    /* 08 */ s16 unk_08;
    /* 0A */ s16 unk_0a;
    /* 0C */ s8 unk_0c;
    /* 0D */ s8 unk_0d;
    /* 0E */ s8 unk_0e;
};
// sizeof = 0x10

extern struct Unknown020007E0 gUnknown_020007E0[];

extern struct Font gSaveMenuSubBoxFont;
extern struct Text gSaveMenuSubBoxText;

extern u16 Sprite_08A20570[];
extern u16 Sprite_08A20578[];
extern u16 Sprite_08A20580[];

void SaveDrawCursor_Init(struct SaveDrawCursorProc * proc);
void SaveDrawCursor_Loop(struct SaveDrawCursorProc * proc);
void sub_80AB4F4(int a, s16 b, s16 c, struct SaveDrawProc * proc);
void sub_80AB514(int a, u8 b, struct SaveDrawProc * proc);
struct SaveMenuCursorProc * StartSaveDrawCursor(ProcPtr parent);
void sub_80AB548(void);
void sub_80AB56C(u32 a);
// ??? sub_80AB720(???);
void sub_80AB760(void*);
void sub_80AB77C(void);
void SaveMenuInitSubBoxText(void);
// ??? SaveMenuDrawSubSelBoxExt(???);
void SaveMenuDrawSubSelBox(struct SaveMenuProc *, s8);
// ??? AddMainMenuOption(???);
// ??? AddExtraMenuOption(???);
void InitSaveMenuChoice(struct SaveMenuProc *);
u8 SaveMenuModifySaveSlot(u8 slot, s8 valid, s8 position);
s8 SaveMenuTryMoveSaveSlotCursor(struct SaveMenuProc *, s8 position);
bool SaveMenuHasOptions(struct SaveMenuProc * proc);
void StartSqMask(struct SaveMenuProc * parent, int b, int c);
void StartSqMask(struct SaveMenuProc *, int, int);
void SaveBgUp_Loop(void);
ProcPtr StartSaveBgUp(ProcPtr parent);
void SaveMenuInitSaveSlotData(u8, struct SaveMenuProc *);
void SaveMenuInitSlotPalette(u8);
void SaveDrawSetDifficultSlotPalette(int param_1, int param_2);
u8 SaveMenuGetValidMenuAmt(u8 endMask, struct SaveMenuProc * proc);
void sub_80ABF74(u8);
void DrawDifficultyModeText(struct DifficultyMenuProc *);
void sub_80AC034(struct DifficultyMenuProc *);
void DifficultySelect_OnEnd(struct DifficultyMenuProc * proc);
void InitDifficultySelectScreen(struct DifficultyMenuProc * proc);
void DifficultySelect_Init(struct DifficultyMenuProc * proc);
void sub_80AC1BC(struct DifficultyMenuProc * proc);
void sub_80AC22C(struct DifficultyMenuProc * proc);
void DifficultySelect_Loop_KeyHandler(struct DifficultyMenuProc * proc);
void nullsub_64(void);
void NewNewGameDifficultySelect(ProcPtr);
void DrawDifficultySprite_Init(struct DifficultyMenuSpritesProc * proc);
void DrawDifficultyMenuCursorMaybe(struct DifficultyMenuSpritesProc * proc);
void sub_80AC4F8(u8 frameMaybe, u8 selectedIdx);
void DrawDifficultySprites_Loop(struct DifficultyMenuSpritesProc * proc);
void sub_80AC680(struct DifficultyMenuSpritesProc *, int, int);
ProcPtr StartDrawDifficultyMenuSprites(ProcPtr);

extern u16 gBgConfig_SaveMenu[]; // bg config
// extern ??? gProcScr_08A20068
// extern ??? ProcScr_CallExtraMap
// extern ??? ProcScr_SaveMenu
// extern ??? gProcScr_SaveMenuPostChapter
extern CONST_DATA struct BonusClaimEnt * gpBonusClaimData;
// extern ??? ProcScr_BonusClaimMenu;
extern u16 Sprite_08A2051C[];
extern u16 Sprite_08A20536[];
extern u16 Sprite_08A20570[];
extern u16 Sprite_08A20578[];
extern u16 Sprite_08A20580[];
extern u16 Sprite_08A20588[];
extern u16 Sprite_08A20590[];
extern u16 * SpriteArray_08A20650[];
extern u16 * SpriteArray_08A2067C[];
// extern ??? ProcScr_savedraw
// extern ??? gProcScr_SaveDrawCursor
// extern ??? gProcScr_08A206F8
// extern ??? SaveMenuSubSelBoxTexts
// extern ??? gProcScr_SqMask
// extern ??? gProcScr_SaveBgUp
extern u16 * SpriteArray_08A2099C[];
extern u16 * SpriteArray_08A209B8[];
extern u16 * SpriteArray_08A209E4[];
extern u16 * SpriteArray_08A209F0[];

#endif // GUARD_SAVEMENU_H
