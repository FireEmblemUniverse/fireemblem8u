#pragma once

#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "ekrlevelup.h"

struct ProcPrepSallyCursor {
    PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3C;
    /* 40 */ int unk_40;

    /* 44 */ u8 _pad44[0x49-0x44];

    /* 4A */ s16 unk_4A;
    /* 4C */ short unk_4C;

    /* 4E */ u8 _pad4E[0x53-0x4E];

    /* 54 */ struct APHandle* unk_54;

    /* 58 */ u32 unk_58;
};

struct PrepUnitList {
    struct Unit *units[0x40];
    int max_num;        /* A cunter maybe related to the amount of units in team */
    int latest_pid;     /* Last unit char-id when you leave the prep-unit-screen */
};

struct PrepScreenItemListEnt {
    /* 00 */ u8 pid; // 0 if item is in Supply inventory
    /* 01 */ u8 itemSlot;
    /* 02 */ u16 item;
};

enum prep_atmenu_item_index {
    PREP_MAINMENU_UNIT = 0,
    PREP_MAINMENU_ITEM = 1,
    PREP_MAINMENU_SAVE = 2,
    PREP_MAINMENU_UNK3 = 3,
    PREP_MAINMENU_SUPPORT = 4,
    PREP_MAINMENU_CHECKMAP = 7,
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
	/* 3C */ struct Text text;
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

enum prepitem_textindex {
    TEXT_PREPITEM_HP,
    TEXT_PREPITEM_POW,
    TEXT_PREPITEM_SKL,
    TEXT_PREPITEM_SPD,
    TEXT_PREPITEM_LCK,
    TEXT_PREPITEM_DEF,
    TEXT_PREPITEM_RES,
    TEXT_PREPITEM_CON,
    TEXT_PREPITEM_CLASS,
    TEXT_PREPITEM_LEVEL,

    TEXT_PREPITEM_DESC1 = 25,
    TEXT_PREPITEM_DESC2 = 26,
    TEXT_PREPITEM_POPUP = 27,
    TEXT_PREPITEM_DESC3 = 29,
};

extern struct Text gPrepItemTexts[32];

struct PrepItemSupplyProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unitInvIdx;
    /* 32 */ s8 scrollAmount;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 currentPage;
    /* 36 */ u16 unk_36;
    /* 38 */ u16 unk_38;
    /* 3A */ u16 idxPerPage[9];
    /* 4C */ u16 yOffsetPerPage[9];
};

// TODO: Move to a common "worldmap.h"
struct GMapBaseMenuProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
};

struct GMapBaseMenuProc* sub_80C4048(void);

struct PrepItemListProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ u8 unitInvIdx;
    /* 31 */ s8 scrollAmount;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 currentPage; // item type / category
    /* 34 */ u16 unk_34; // initialized to 0xff and untouched
    /* 36 */ u16 unk_36; // 1 when helpbox is open, 0 (or 0xff?) when closed
    /* 38 */ u16 idxPerPage[9];
    /* 4A */ u16 yOffsetPerPage[9];
};

extern struct Text gPrepMainMenuTexts[9];
extern u8 gPrepUnitPool[];
extern u8 gBanimScrRight[];
extern struct PrepUnitList gPrepUnitList;
extern struct PrepScreenItemListEnt gPrepScreenItemList[];
extern struct PrepScreenItemListEnt gUnknown_02012914[];
extern u16 gUnknown_02012F54;
extern u16 gUnknown_02012F56;
// extern ??? gUnknown_02012F58
// extern ??? gUnknown_02013458
// extern ??? gUnknown_02013460
extern struct Text gPrepItemScreenTexts[16];
extern struct Text gUnknown_02013590[];
extern struct Text gPrepUnitTexts[];
// extern ??? gUnknown_02013648
extern struct Text gUnknown_02013660[16];
// extern ??? gUnknown_02013668
// extern ??? gUnknown_02013670
// extern ??? gUnknown_02013698
// extern ??? gUnknown_020136D8
extern int sSupportScreenUnitCount;
extern u16 gUnknown_020136F4[];

extern struct ProcCmd gProcScr_SALLYCURSOR[];
extern struct ProcCmd gProcScr_SALLYCURSORHelpPrompt[];
extern u16 gBgConfig_ItemUseScreen[];
// extern ??? gUnknown_08A18200
extern CONST_DATA struct ProcCmd ProcScr_PrepMenuDescHandler[];
extern CONST_DATA struct ProcCmd ProcScr_AtMenu[];
extern CONST_DATA struct ProcCmd ProcScr_PrepPromoteDebug[];
extern CONST_DATA struct ProcCmd ProcScr_PrepTraineePromo[];
extern CONST_DATA u16 obj_8A1856E[];
extern CONST_DATA u16 obj_8A18582[];
extern CONST_DATA u16 obj_8A18590[];
extern CONST_DATA u16 obj_8A1859E[];
extern CONST_DATA u16 obj_8A185AC[];
extern CONST_DATA u16 *objs_8A18614[];
extern CONST_DATA struct ProcCmd ProcScr_PrepSpecialCharEff[];
extern CONST_DATA struct ProcCmd ProcScr_PrepScreenMenuDummyItem[];
extern CONST_DATA struct ProcCmd ProcScr_PrepMenu[];
extern CONST_DATA u16 gSprite_MenuScrollContainer[];
extern CONST_DATA u16 gSprite_MenuScroll_TopDecal[];
extern CONST_DATA u16 gSprite_MenuScroll_BottomDecal[];
extern const u16 * CONST_DATA gMenuScrollBarSegmentSprites[];
extern const u16 * CONST_DATA gMenuScrollArrowSprites[];
extern CONST_DATA struct ProcCmd ProcScr_menu_scroll[];
extern CONST_DATA struct ProcCmd ProcScr_SallyCir[];
extern CONST_DATA struct ProcCmd ProcScr_ViewCounter[];
extern CONST_DATA struct ProcCmd gProcScr_PrepHelpboxListener[];

struct PrepItemTypePageEnt {
    /* 00 */ u8 lowerBound;
    /* 01 */ u8 upperBound;
};

extern struct PrepItemTypePageEnt CONST_DATA gPrepItemTypePageLut[] ;
extern u16 CONST_DATA gPrepShopInventory[];
extern int CONST_DATA gHelpTextIds_PrepItemScreen[];
extern int CONST_DATA gHelpTextIds_GMapItemScreen[];
extern CONST_DATA u16 gSprite_PrepFunds[];
extern CONST_DATA struct ProcCmd gProcScr_DrawPrepFundsSprite[];
extern CONST_DATA u16 gSprite_PrepUnitInfoBg[];
extern CONST_DATA struct ProcCmd gProcScr_DrawUnitInfoBgSprites[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemScreen[];
extern CONST_DATA u16 obj_08A18E34[];
extern CONST_DATA u16 obj_08A18E4E[];
extern CONST_DATA u16 obj_08A18E62[];
extern CONST_DATA u16 obj_08A18E76[];
extern CONST_DATA struct ProcCmd ProcScr_PrepUnitScreen[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemTradeScreen[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemUseScreen[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemUseBooster[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemUseJunaFruit[];
extern int CONST_DATA gSupplyTextIndexLookup[];
extern char * CONST_DATA gpPrepItemSupplyStringBuffer;
extern int CONST_DATA gSupplyHelpTextIndexLookup[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemSupplyScreen[];
extern CONST_DATA struct ProcCmd ProcScr_BmSupplyScreen[];
extern CONST_DATA struct ProcCmd ProcScr_PrepItemListScreen[];
extern u16 gUnknown_08A195F8[];
extern u16 * gUnknown_08A19608[];
extern CONST_DATA struct ProcCmd gProcScr_FortuneSubMenu[];
extern int gUnknown_08A196BC[]; /* msg lists */
extern int CONST_DATA gUnknown_08A196D0[];
extern int CONST_DATA gUnused_08A196E4[];
extern u16 CONST_DATA gUnknown_08A199C8[]; // TODO - Not sure; used in sallycursor
extern u8 Img_MenuScrollBar[];
extern u16 Pal_MenuScrollBar[];
extern u8 gUnknown_08A19CCC[]; // gfx
extern u16 gUnknown_08A1A084[]; // pal
extern u8 gUnknown_08A1A0A4[]; // gfx
extern u8 gUnknown_08A1A23C[]; // gfx
extern u16 gUnknown_08A1A3FC[]; // pal
extern u8 CONST_DATA gUnknown_08A1A41C[];
extern u8 CONST_DATA gUnknown_08A1A434[];
extern u8 CONST_DATA gUnknown_08A1A474[];
extern u8 CONST_DATA gUnknown_08A1A4C8[];
extern u8 gGfx_SupportScreenBanner[];
extern u8 CONST_DATA gUnknown_08A1AC88[];
extern u16 CONST_DATA Img_SysBrownBox[];
extern u16 CONST_DATA Pal_SysBrownBox[]; // TODO - palette data from sallycursor
extern u16 CONST_DATA gPal_SupportScreenBanner[];
extern u16 CONST_DATA gUnknown_08A1B194[];
extern u8 gUnknown_08A1B1FC[]; // gfx
extern u16 gUnknown_08A1B638[]; // pal
extern u8 CONST_DATA gUnknown_08A1B658[];
extern u8 CONST_DATA gUnknown_08A1B698[];
extern u8 CONST_DATA gUnknown_08A1B730[];
extern u8 CONST_DATA gUnknown_08A1B7C8[];
extern u8 gUnknown_08A1B8B8[]; // tsa
extern u8 gUnknown_08A1B990[]; // tsa
extern u8 gUnknown_08A1B9EC[]; // tsa
extern u16 CONST_DATA Img_PrepItemUseScreen[];
extern u16 CONST_DATA Tsa_PrepItemUseScreen[];
extern u8 gUnknown_08A1BBD0[]; // tsa?
extern u8 gUnknown_08A1BCC0[];
// extern ??? gUnknown_08A1BD00
// extern ??? gUnknown_08A1BD40
extern u16 gUnknown_08A1BD60[];
extern u8 gImg_UiSpinningArrow_Vertical[]; // arrow gfx
extern u8 gImg_UiSpinningArrow_Horizontal[];
// extern ??? gUnknown_08A1C8B4
// extern ??? gUnknown_08A1CD68
// extern ??? gUnknown_08A1CDC4
// extern ??? gUnknown_08A1D288
extern u16 Pal_08A1D448[];
extern u16 CONST_DATA gUnknown_08A1D4C8[];
extern u8 Img_PrepTextShadow[];
extern u8 CONST_DATA gUnknown_08A1D510[];
extern u16 CONST_DATA Pal_MapBattleInfoNum[]; // 'R is info' palette
extern u8 Img_PrepPopupWindow[];
extern u16 gUnknown_08A1D850[];
extern u16 gUnknown_08A1D870[];
extern u16 gUnknown_08A1D890[];
extern u16 gUnknown_08A1D8B0[];
extern u8 Img_PrepWindow[];
extern u8 gUnknown_08A1DB80[];
extern u8 gTsa_SupportSubScreen[];
extern u8 gGfx_SupportMenu[];
extern u16 gPal_SupportMenu[];

/* sally-cursor */
int GetPlayerLeaderUnitId(void);
void sub_80332D0(void);
void sub_803334C(void);
void PrepMapMenu_OnViewMap(struct ProcPrepSallyCursor*);
void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor*);
bool8 PrepMapMenu_OnStartPress(ProcPtr);
bool8 PrepMapMenu_OnBPress(ProcPtr);
void SALLYCURSOR_DeploySupplyUnit(void);
void PrepMapMenu_OnOptions(struct ProcPrepSallyCursor*);
void SALLYCURSOR_RemoveSupplyUnit(void);
void PrepMapMenu_OnSave(struct ProcPrepSallyCursor*);
void sub_8033468(struct ProcPrepSallyCursor*);
void sub_803348C(ProcPtr);
void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor*);
void sub_80334CC(void);
void sub_80334E8(ProcPtr);
void sub_8033514(ProcPtr);
void sub_8033548(ProcPtr);
void sub_8033574(void);
void sub_8033608(void);
void sub_8033620(ProcPtr);
void PrepMapMenu_OnEnd(void);
void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor*);
bool8 CanCharacterBePrepMoved(int);
void sub_8033770(struct ProcPrepSallyCursor*);
void sub_8033798(struct ProcPrepSallyCursor*);
void sub_80337B4(struct ProcPrepSallyCursor*);
void sub_80337D4(struct ProcPrepSallyCursor*);
void sub_80337F0(struct ProcPrepSallyCursor*);
void InitPrepScreenUnitsAndCamera(void);
void sub_80338C0(void);
void sub_8033940(struct ProcPrepSallyCursor*);
void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor* proc);
int sub_8033BF8(void);
void SALLYCURSOR6C_StartUnitSwap(struct ProcPrepSallyCursor*);
void sub_8033C90(struct ProcPrepSallyCursor*);
void sub_8033DD8(ProcPtr);
void sub_8033E08(ProcPtr);
void sub_8033E8C(void);
void sub_8033EA4(void);
void sub_8033EC0(ProcPtr);
void CallCursorShop(ProcPtr);
void PrepScreenProc_MapMovementLoop(ProcPtr);
void sub_8034078(ProcPtr);
void sub_8034090(ProcPtr);
void StartPrepSaveScreen(ProcPtr);
void sub_8034168(void);
void sub_8034194(void);
void sub_80341D0(void);
void sub_8034200(void);
void ShrinkPlayerUnits(void);
void EndPrepScreen(void);
bool8 sub_80342FC(void);

void Prep_DrawChapterGoal(int VRAM_offset, int pal);

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

void PrepAtMenu_OnInit(struct ProcAtMenu * proc);
void ResetPrepMenuDescTexts();
void ParsePrepMenuDescTexts(int msg);
void DrawPrepMenuDescTexts();

struct ProcPrepMenuDesc {
    PROC_HEADER;
    /* 29 */ u8 _pad29_[0x4C - 0x29];
    /* 4C */ u16 unk4C;
    /* 4E */ u8 _pad4E_[0x58 - 0x4E];
    /* 58 */ int msg;
};

void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnDraw();
void sub_8095C00(int msg, ProcPtr parent);
void sub_8095C2C(struct ProcAtMenu * proc);
void sub_8095C50(int tile, int pal);
void AtMenu_Reinitialize(struct ProcAtMenu * proc);
void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu * proc);
void sub_8095F2C(struct ProcAtMenu * proc);
void sub_8095F54(struct ProcAtMenu *proc);
void CleanupPrepMenuScreen(ProcPtr proc);
void sub_8096004(struct ProcAtMenu * proc);
void AtMenu_CtrlLoop(struct ProcAtMenu * proc);
void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu * proc);
void AtMenu_ResetScreenEffect(struct ProcAtMenu * proc);
void AtMenu_ResetBmUiEffect(struct ProcAtMenu * proc);
void AtMenu_StartSubmenu(struct ProcAtMenu * proc);
void AtMenu_OnSubmenuEnd(struct ProcAtMenu * proc);
void sub_8096404();
void AtMenu_LockGame();
void AtMenu_UnlockGame();
void StartPrepAtMenu();
void StartPrepAtMenuWithConfig();
s8 HasConvoyAccess_(void);
void TraineePromo_ResetScreenEffect();

struct Proc08A184B4 {
    PROC_HEADER;
    /* 29 */ u8 _pad29_[0x4C - 0x29];
    /* 4C */ s16 game_lock;
};

void DoPromoteAnimForChar100(struct Proc08A184B4 * proc);
void IsGameLockLevelReserved(struct Proc08A184B4 *proc);
void NullExpForChar100AndResetScreen();
void IsGameLockLevelReserved(struct Proc08A184B4 *proc);
void sub_8096668();
void NewPrepScreenTraineePromotionManager();
int PrepScreenTraineePromotionManagerExists(ProcPtr proc);
int PrepAtMenuExists(ProcPtr proc);
void PutObj8A1856E(int xOam1, int yOam0, u16 oam2);
void PutObj8A18582_WithConfigs(int xOam1, int yOam0, int a3, u16 oam2);
void PutObj8A18590_WithConfigs(int xOam1, int yOam0, int a3, u16 oam2);
void PutObj8A1859E_WithConfigs(int xOam1, int yOam0, int a3, u16 oam2);
void PutObj8A185AC(int xOam1, int yOam0, u16 oam2);

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

void sub_8096958(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_OnInit(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_Idle(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_OnEnd(struct ProcPrepSpecialChar *proc);

struct Unit * GetUnitFromPrepList(int index);
void RegisterPrepUnitList(int index, struct Unit *);
int PrepGetUnitAmount();
void PrepSetUnitAmount(int);
int PrepGetLatestCharId();
void PrepSetLatestCharId(int);
s8 IsCharacterForceDeployed(int char_id);
int CalcForceDeployedUnitCounts();
s8 SomeLeftoverFunctionThatReturns0(struct Unit *unit);
s8 IsUnitInCurrentRoster(struct Unit *unit);
void AtMenu_AddPrepScreenSupportMenuItem(struct ProcAtMenu *proc);
s8 CanPrepScreenCheckMap();
void InitPrepScreenMainMenu(struct ProcAtMenu*);
int GetLatestUnitIndexInPrepListByUId();
int PrepGetLatestUnitIndex();
void ReorderPlayerUnitsBasedOnDeployment();
void SortPlayerUnitsForPrepScreen();
void RemoveSomeUnitItems();
void MakePrepUnitList();
int UnitGetIndexInPrepList(int pid);
void PrepUpdateSMS();
int PrepGetDeployedUnitAmt(void);
void PrepAutoCapDeployUnits(struct ProcAtMenu* proc);
void RestartMuralBackground();
void EndMuralBackground_(void);
void PrepSpecialChar_BlinkButtonStart();
void PrepSpecialChar_BlinkButtonB();
ProcPtr StartPrepSpecialCharEffect(ProcPtr parent);
void EndPrepSpecialCharEffect(void);
// ??? sub_8096C34(???);

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

void PrepMenu_OnInit(struct ProcPrepMenu * proc);
void PrepMenu_CtrlLoop(struct ProcPrepMenu * proc);
void PrepMenu_ShowFrozenHand(struct ProcPrepMenu * proc);
void PrepMenu_ShowActiveHand(struct ProcPrepMenu * proc);
void PrepMenu_OnEnd(struct ProcPrepMenu * proc);
void PrepMenu_OnInit(struct ProcPrepMenu * proc);
void PrepMenu_OnInit(struct ProcPrepMenu * proc);
void StartPrepScreenMenu(ProcPtr);
void SetPrepScreenMenuOnBPress(const void*);
void SetPrepScreenMenuOnStartPress(const void*);
void SetPrepScreenMenuOnEnd(const void * func);
void SetPrepScreenMenuItem(int index, const void * func, int color, int msg, int msg_rtext);
void SetPrepScreenMenuSelectedItem(int);
int GetActivePrepMenuItemIndex();
void DrawPrepScreenMenuFrameAt(int x, int y);
void SetPrepScreenMenuPosition(int x, int y);
int GetPrepMenuItemAmt(void);
void EndPrepScreenMenu();
void ResetPrepMenuScreen();
int PrepScreenMenuExists();
void ShowPrepScreenMenuFrozenHand();
void ShowPrepScreenMenuActiveHand();
void EnablePrepScreenMenu();

struct MenuScrollBarProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 xBase;
    /* 2C */ u8 yBase;
    /* 2D */ u8 numSegments;
    /* 2E */ u16 currentSegment;
    /* 30 */ u16 prevSegment;
    /* 32 */ u16 numTotalRows;
    /* 34 */ u8 numVisibleRows;
    /* 36 */ u16 oam2Chr;
    /* 38 */ u16 oam2Pal;
    /* 3A */ u8 topArrowFrameIdx;
    /* 3B */ u8 bottomArrowFrameIdx;
};

void MenuScroll_Init(struct MenuScrollBarProc * proc);
void MenuScroll_Loop(struct MenuScrollBarProc * proc);

void LockMenuScrollBar(void);
void sub_8097668(void);
void EndMenuScrollBar(void);
ProcPtr StartMenuScrollBar(ProcPtr);
void PutMenuScrollBarAt(int, int);
void UpdateMenuScrollBarConfig(u8, u16, u16, u8);
void InitMenuScrollBarImg(int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void sub_80977AC(struct Text * th, u16 * tm, int color, int x, const char * str);
void sub_80977EC(u8 * a, u16 * b);
void SallyCir_OnHBlank(void);

struct SallyCirProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2C */ int unk_2c;
};

void SallyCir_Init(struct SallyCirProc * proc);
void SallyCir_Loop(struct SallyCirProc * proc);
void SallyCir_OnEnd(void);
struct SallyCirProc* StartSallyCirProc(ProcPtr parent, u8 unk);
void sub_8097ACC(struct SallyCirProc * proc);
void sub_8097B98(struct SallyCirProc * proc);
int sub_8097CC4(void);
u8 GetConvoyItemCount_(void);

struct ViewCounterProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 targetFrameCount;
    /* 2C */ u16 counter;
};

void ViewCounter_Loop(struct ViewCounterProc * proc);
void StartViewCounter(u16 frames, ProcPtr parent);
void TryLockProc(ProcPtr);
void TryUnlockProc(ProcPtr);
void PrepHbKeyListener_Loop(ProcPtr proc);
ProcPtr StartPrepErrorHelpbox(int, int, int, ProcPtr);
s8 IsWeaponUsable(struct Unit * unit, int item);
int CountUnitUsableWeapons(struct Unit * unit);
s8 sub_8097E38(struct Unit *unit);
s8 CanUnitBeDeployedLinkArena(struct Unit *unit);
s8 CheckValidLinkArenaItemSwap(struct Unit*, int, struct Unit*, int);
s8 CheckValidLinkArenaItemSupply(struct Unit*, int, int);
s8 sub_8097F98(struct Unit*, int);
void sub_8097FDC(void);
int GetPrepPageForItem(int);
void sub_8098048(int page);
void SomethingPrepListRelated(struct Unit*, int, int);
void sub_80982B8(void);
void sub_80982FC(void);
int sub_809831C(u16 a);
int sub_8098344(u16 a, int b);
int sub_8098378(u16 a);

struct PrepItemScreenProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29 : 1;
    /* 2A */ u8 hoverUnitIdx;
    /* 2B */ u8 selectedUnitIdx;
    /* 2C */ s8 hasConvoyAccess;
    /* 2D */ u8 unk_2d; // popup prompt R-text index, when R is pressed
    /* 2E */ u8 popupPromptIdx;
    /* 2F */ u8 unk_2f; // unreferenced
    /* 30 */ u8 unk_30; // unreferenced
    /* 31 */ u8 scrollAmount;
    /* 32 */ s8 unitSelected; // opens the popup prompt for Trade/List/Use/etc.
    /* 34 */ u16 unk_34;
    /* 36 */ u16 unk_36; // unreferenced
    /* 38 */ u16 xFacePosBySlot[2];
    /* 3C */ u16 yFacePosBySlot[2];
    /* 40 */ u16 faceDispBySlot[2];
    /* 44 */ struct Unit* pUnits[2];
};

struct DrawFundsSpriteProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ int pal;
    /* 38 */ int visible;
};

struct DrawPrepUnitInfoBgProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ int visible;
};

s8 CanUnitPrepScreenUse(struct Unit*);
void PrepItemScreen_OnHBlank(void);
void PrepItemScreen_Init(struct PrepItemScreenProc * proc);
void DrawFundsSprite_Init(struct DrawFundsSpriteProc * proc);
void DrawFundsSprite_Loop(struct DrawFundsSpriteProc * proc);
void StartDrawPrepFundsSprite(int, int, int, ProcPtr);
void ShowPrepFundsSpriteAt(int, int);
void HidePrepFundsSprite(void);
void EndDrawPrepFundsSprite(void);
void DrawUnitInfoBg_Init(void);
void DrawUnitInfoBg_Loop(struct DrawPrepUnitInfoBgProc * proc);
void StartDrawPrepUnitInfoBgSprites(ProcPtr parent);
void ShowUnitInfoBgSpritesAt(int x, int y);
void HideUnitInfoBgSprites(void);
void EndDrawPrepUnitInfoBgSprites(void);
void PrepItemScreen_DrawFunds(void);
void PrepItemScreen_HideFunds(void);
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc);
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc);
void sub_8098A04(u16 * tm);
void sub_8098A74(u16 * tm);
void sub_8098B48(void);
void sub_8098B68(void);
void sub_8098BA8(void);
void sub_8098BC8(void);
void sub_8098BE8(void);
void PutImg_PrepItemUseUnk(int, int);
void PutImg_PrepPopupWindow(int, int);
void sub_8098CC0(struct PrepItemScreenProc * proc);
s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc *);
void sub_8098FAC(struct PrepItemScreenProc *);
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc *);
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc *);
void sub_8099120(struct PrepItemScreenProc *);
void sub_8099328(struct PrepItemScreenProc* proc, u16 * tm, struct Unit * unit);
void sub_80994C4(struct PrepItemScreenProc *);
void sub_80995D4(struct PrepItemScreenProc *);
void sub_8099654(struct PrepItemScreenProc *);
void sub_80996B0(struct PrepItemScreenProc *);
void sub_80996E8(struct PrepItemScreenProc *);
void sub_8099AA0(struct PrepItemScreenProc *);
void sub_8099AF8(struct PrepItemScreenProc *);
void sub_8099C60(void);
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc *);
void StartPrepItemTradeScreen(struct PrepItemScreenProc *);
void StartPrepItemUse(struct PrepItemScreenProc *);
void StartPrepItemSupply(struct PrepItemScreenProc *);
void StartPrepSell(struct PrepItemScreenProc *);
void StartPrepItemListScreen(struct PrepItemScreenProc *);
void StartPrepArmory(struct PrepItemScreenProc *);
void sub_8099E68(struct PrepItemScreenProc * proc);
void UpdatePrepItemScreenFace(int, struct Unit*, u16, u16, u16);
void EndPrepItemScreenFace(int);
ProcPtr StartPrepItemScreen(ProcPtr);
void sub_8099F7C(struct Text*, u16*, struct Unit*, u16);
void sub_809A08C(struct PrepItemScreenProc *);
void sub_809A114(struct PrepItemScreenProc *, u8, s8);
s8 sub_809A21C(u32, int);
void sub_809A230(struct Unit * unit, u16 x, u16 y);
void sub_809A274(struct PrepItemScreenProc *);
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2);
void sub_809A504(struct PrepItemScreenProc *, u8);
s8 PrepItemScreen_GiveAll(struct Unit * unit);

struct PrepMenuTradeProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];
    /* 34 */ int cursorItemSlot; // 0x0-0x4 = left side, 0x8-0xC = right side
    /* 38 */ int selectedItemSlot;
    /* 3C */ int helpBoxItemSlot;
    /* 40 */ int unk_40; // Starting item slot for right unit? Seems to be used when starting trade from "List"
};

void PrepItemTrade_ApplyItemSwap(struct Unit * unitA, int itemSlotA, struct Unit * unitB, int itemSlotB);
s8 PrepItemTrade_DpadKeyHandler(struct PrepMenuTradeProc * proc);
void DrawPrepScreenItems(u16*, struct Text*, struct Unit*, u8);
void DrawPrepScreenItemIcons(u16* tm, struct Unit* unit);
void PrepItemTrade_Init(struct PrepMenuTradeProc * proc);
void PrepItemTrade_Loop_MainKeyHandler(struct PrepMenuTradeProc * proc);
void PrepItemTrade_OnEnd(void);
void StartPrepItemTradeScreenProc(struct Unit* unitA, struct Unit* unitB, ProcPtr parent);
void sub_809BE60(struct Unit* unitA, struct Unit* unitB, int rightItemIdx, ProcPtr parent);

/* PrepItemUse */
struct ProcPrepItemUse {
    PROC_HEADER;

    /* 2C */ struct Unit *unit;
    /* 30 */ int slot;
    /* 34 */ int unk34;
    /* 38 */ int slot_rtext;
    /* 3C */ int pos_subbox;
    /* 40 */ int game_lock;
};

enum proc_label_prep_item_use {
    PROC_LABEL_PREPITEMUSE_INIT,
    PROC_LABEL_PREPITEMUSE_MAIN,
    PROC_LABEL_PREPITEMUSE_CONFIRM,
    PROC_LABEL_PREPITEMUSE_EXEC_ITEMEFFECT,
    PROC_LABEL_PREPITEMUSE_EXEC_JUNA,
    PROC_LABEL_PREPITEMUSE_EXEC_PROMO,
    PROC_LABEL_PREPITEMUSE_EXIT_FADE,
    PROC_LABEL_PREPITEMUSE_END
};

bool PrepItemUseTryMoveHand(struct ProcPrepItemUse *proc);
void DrawPrepScreenItemUseStatLabels(struct Unit *unit);
void DrawPrepScreenItemUseStatBars(struct Unit *unit, int mask);
void DrawPrepScreenItemUseStatValues(struct Unit *unit);
void DrawPrepScreenItemUseDesc(struct Unit *unit, int slot);
void PrepItemUseParallel_UpdateSMS();
void PrepItemUse_OnInit(struct ProcPrepItemUse * proc);
void PrepItemUse_InitDisplay(struct ProcPrepItemUse * proc);
void PrepItemUse_CtrlLoop(struct ProcPrepItemUse * proc);
void ProcPrepItemUse_OnEnd(void);
void PrepItemUseDrawSubBox(void);
void PrepItemUseClearSubBox(void);
void PrepItemUse_ConfirmWindowInit(struct ProcPrepItemUse * proc);
void PrepItemUse_ConfirmWindowCtrlLoop(struct ProcPrepItemUse * proc);
void PrepItemUse_HandleItemEffect(struct ProcPrepItemUse * proc);
void PrepItemUse_ExecPromotionItemUnused(struct ProcPrepItemUse * proc);
void PrepItemUse_ExecPromoDoneUnusedIDLE(struct ProcPrepItemUse * proc);
void PrepItemUse_PostPromotion(struct ProcPrepItemUse * proc);
void PrepItemUse_ResetBgmAfterPromo(struct ProcPrepItemUse * proc);
void sub_809CCE0(void);
void StartPrepItemUseScreen(struct Unit *unit, ProcPtr parent);

struct ProcPrepItemUseJunaFruit {
    PROC_HEADER;

    /* 2C */ int timer;
    /* 30 */ s8 lv_pre, lv_pst;

    /* 34 */ int xpos, ypos, width, height;
};

void PrepItemUseJuna_OnDraw(struct ProcPrepItemUseJunaFruit *proc, int x, int y, int msg, int level);
void PrepItemUseJuna_OnInit(struct ProcPrepItemUseJunaFruit * proc);
void PrepItemUseJuna_IDLE(struct ProcPrepItemUseJunaFruit * proc);
void PrepItemUseJuna_OnEnd(struct ProcPrepItemUseJunaFruit * proc);

struct ProcPrepItemUseBooster {
    PROC_HEADER;

    /* 2C */ int timer;
    /* 30 */ u8 status_pre[EKRLVUP_STAT_MAX];
    /* 38 */ u8 status_pst[EKRLVUP_STAT_MAX];
    /* 40 */ int xpos, ypos, width, height;
};

void PrepItemUseBooster_OnDraw(struct ProcPrepItemUseBooster *proc, int x, int y, int msg, int item);
void PrepItemUseBooster_OnInit(struct ProcPrepItemUseBooster * proc);
void PrepItemUseBooster_IDLE(struct ProcPrepItemUseBooster * proc);
void PrepItemUseBooster_OnEnd(struct ProcPrepItemUseBooster * proc);

void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent);
void StartWorldMapSellScreen(struct Unit * unit, ProcPtr parent);

void sub_809D244(void);
void sub_809D278(int idx, ProcPtr proc);
void StoreConvoyWeaponIconGraphics(int, int);
void sub_809D300(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);
void sub_809D418(u16 *, int);
void sub_809D47C(struct Text *, u16 *, int, struct Unit *);
void sub_809D47C(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);
void PrepItemSupply_OnHBlank(void);
void PrepItemSupply_Init(struct PrepItemSupplyProc * proc);
void sub_809D608(void);
void sub_809D644(struct PrepItemSupplyProc * proc);
void sub_809D6CC(void);
void PutGiveTakeBoxSprites(void);
void PutGiveSprites(void);
void PutTakeSprites(void);
void Supply_PutHighlightedCategorySprites(struct PrepItemSupplyProc * proc);
void sub_809D8D4(u16 * tm, u32 chr, int pal);
void sub_809D914(struct PrepItemSupplyProc * proc);
void PrepItemSupply_InitGfx(struct PrepItemSupplyProc * proc);
void sub_809DC70(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_GiveTakeKeyHandler(struct PrepItemSupplyProc * proc);
void sub_809DEFC(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchPageLeft(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchPageRight(struct PrepItemSupplyProc * proc);
void sub_809E100(struct PrepItemSupplyProc * proc);
void sub_809E184(struct PrepItemSupplyProc * proc);
void PrepItemSupply_ScrollVertical(struct PrepItemSupplyProc * proc, int amount);
void sub_809E2BC(void);
void sub_809E2C8(struct PrepItemSupplyProc * proc);
void sub_809E420(struct PrepItemSupplyProc * proc);
s8 sub_809E7A8(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchToUnitInventory(struct PrepItemSupplyProc * proc);
void PrepItemSupply_GiveItemToSupply(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_UnitInvKeyHandler(struct PrepItemSupplyProc * proc);
void PrepItemSupply_OnEnd(struct PrepItemSupplyProc * proc);
void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent);
void sub_809EAF4(void);
void sub_809EB14(void);
void StartBmSupply(struct Unit *, ProcPtr);
void MaybeStartSelectConvoyItemProc(struct Unit *, ProcPtr);
void PrepItemList_Init(struct PrepItemListProc * proc);
void sub_809EBF0(void);
void PrepItemList_DrawCurrentOwnerText(struct PrepItemListProc *);
void List_PutHighlightedCategorySprites(struct PrepItemListProc *);
void PrepItemList_InitGfx(struct PrepItemListProc * proc);
void PrepItemList_OnEnd(struct PrepItemListProc * proc);
void sub_809F150(struct PrepItemListProc * proc);
void PrepItemList_SwitchPageLeft(struct PrepItemListProc * proc);
void PrepItemList_SwitchPageRight(struct PrepItemListProc * proc);
void sub_809F370(struct PrepItemListProc *);
void PrepItemList_ScrollVertical(struct PrepItemListProc * proc, int amount);
void sub_809F498(struct PrepItemListProc * proc);
void sub_809F5F4(struct PrepItemListProc *);
void PrepItemList_Loop_MainKeyHandler(struct PrepItemListProc * proc);
s8 sub_809FA88(struct PrepItemListProc * proc);
void PrepItemList_SwitchToUnitInventory(struct PrepItemListProc * proc);
void sub_809FB70(struct PrepItemListProc * proc);
void PrepItemList_Loop_UnitInvKeyHandler(struct PrepItemListProc * proc);
void PrepItemList_StartTradeScreen(struct PrepItemListProc * proc);
void StartPrepItemListScreenProc(struct Unit * unit, ProcPtr parent);
