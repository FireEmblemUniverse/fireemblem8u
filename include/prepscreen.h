#pragma once

#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "ekrlevelup.h"

struct ProcPrepSallyCursor
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int xCursor;
    /* 40 */ int yCursor;

    /* 44 */ STRUCT_PAD(0x44, 0x4A);

    /* 4A */ s16 unk_4A;
    /* 4C */ s16 unk_4C;

    /* 4E */ STRUCT_PAD(0x4E, 0x54);

    /* 54 */ struct APHandle * ap;

    /* 58 */ u32 lastCmd;
};

struct PrepUnitList {
    struct Unit *units[0x40];
    int max_num;        /* A counter maybe related to the amount of units in team */
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

struct PrepItemSuppyText {
    /* 00 */ struct Font font;
    /* 18 */ struct Text th[18];
};
extern struct PrepItemSuppyText PrepItemSuppyTexts;

/* This should be the same as: struct PrepItemSuppyText */
struct Unknown02013648 {
    /* 00 */ struct Font font;
    /* 18 */ struct Text textA;
    /* 20 */ struct Text textB;
    /* 28 */ struct Text textArray[5];
    /* 50 */ u8 _pad[0x90-0x50];
    /* 90 */ struct Text textC;
};
#define _PrepItemSuppyTexts ((struct Unknown02013648 *)&PrepItemSuppyTexts)

struct WmSellProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u16 unk_32;
    /* 34 */ u16 unk_34;
};

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

struct SioPidPool {
    u8 pids[8];
};

extern struct SioPidPool gSioPidPool;

struct Win1H {
    /* 00 */ u8 left;
    /* 01 */ u8 right;
};

extern struct Win1H gPrepscreen_3[][160];
extern struct Win1H* gPrepscreen_4[];

extern struct Text gPrepMainMenuTexts[10];
extern u8 gPrepUnitPool[];
extern u8 gBanimScrRight[];
extern struct PrepUnitList gPrepUnitList;
extern struct PrepScreenItemListEnt gPrepScreenItemList[];
extern struct PrepScreenItemListEnt gPrepscreen_0[];
extern u16 gPrepscreen_1;
extern u16 gPrepscreen_2;
// extern ??? gPrepscreen_3
// extern ??? gPrepscreen_4
extern u16 gPrepscreen_5[];
extern struct Text gPrepUnitTexts[0x16];
extern int sSupportScreenUnitCount;
extern u16 gUisupport_0[];

extern struct ProcCmd gProcScr_SALLYCURSOR[];
extern struct ProcCmd gProcScr_PrepHelpPrompt[];
extern u16 gBgConfig_ItemUseScreen[];
// extern ??? gPrepscreen_6
extern CONST_DATA struct ProcCmd ProcScr_PrepMenuDescHandler[];
extern CONST_DATA struct ProcCmd ProcScr_AtMenu[];
extern CONST_DATA struct ProcCmd ProcScr_PrepPromoteDebug[];
extern CONST_DATA struct ProcCmd ProcScr_PrepTraineePromo[];
extern CONST_DATA u16 Sprite_PrepInformation[];
extern CONST_DATA u16 Sprite_PrepChapter[];
extern CONST_DATA u16 Sprite_PrepTower[];
extern CONST_DATA u16 Sprite_PrepRuins[];
extern CONST_DATA u16 Sprite_PrepExMap[];
extern CONST_DATA u16 * SpriteArray_PrepChapterNumbers[];
extern CONST_DATA struct ProcCmd ProcScr_PrepScreenSpriteDraw[];
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
extern CONST_DATA u16 obj_PrepUnitselect_0[];
extern CONST_DATA u16 Sprite_PrepStartButton[];
extern CONST_DATA u16 obj_PrepUnitselect_1[];
extern CONST_DATA u16 Sprite_PrepBButton[];
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
extern u16 gPrepWmSell_0[];
extern u16 * gPrepWmSell_1[];
extern CONST_DATA struct ProcCmd gProcScr_FortuneSubMenu[];
extern int gPrepFortuneSubMenuTextIds[]; /* msg lists */
extern int CONST_DATA gPrepFortuneSubMenuTextIdsAlt[];
extern int CONST_DATA gUnusedPrepFortuneSubMenuStatTextIds[];
extern u16 CONST_DATA Img_PrepHelpButtonSprites[];
extern u8 Img_MenuScrollBar[];
extern u16 Pal_MenuScrollBar[];
extern u8 Img_PrepItemListSpinningArrow[]; // gfx
extern u16 Pal_SpinningArrow[]; // pal
extern u8 Img_PrepConvoyWeaponIconGfxA[]; // gfx
extern u8 Img_PrepConvoyWeaponIconGfxB[]; // gfx
extern u16 Pal_PrepConvoyWeaponIcon[]; // pal
extern u8 CONST_DATA Tsa_PrepWindowFrameTop[];
extern u8 CONST_DATA Tsa_PrepWindowFrameMiddle[];
extern u8 CONST_DATA Tsa_PrepWindowFrameBottom[];
extern u8 CONST_DATA gImg_PrepAtMenuTitleText[];
extern u8 gGfx_SupportScreenBanner[];
extern u8 CONST_DATA gImg_PrepBannerText[];
extern u16 CONST_DATA Img_SysBrownBox[];
extern u16 CONST_DATA Pal_SysBrownBox[];
extern u16 CONST_DATA gPal_SupportScreenBanner[];
extern u16 CONST_DATA AP_DrawPreparationsBanner[];
extern u8 Img_PrepFunds[]; // gfx
extern u16 Pal_PrepFunds[]; // pal
extern u8 CONST_DATA gTsa_PrepAtMenuRightPanel[];
extern u8 CONST_DATA gTsa_PrepAtMenuLeftPanel[];
extern u8 CONST_DATA gImg_PrepUnitSelectBg[];
extern u8 CONST_DATA gTsa_PrepUnitSelectBg[];
extern u8 Tsa_PrepItemScreen[]; // tsa
extern u8 Tsa_PrepItemTradeUnitPanel[]; // tsa
extern u8 Tsa_PrepItemSupplyBgA[]; // tsa
extern u16 CONST_DATA Img_PrepItemUseScreen[];
extern u16 CONST_DATA Tsa_PrepItemUseScreen[];
extern u8 gTsa_PrepWorldMapSellScreen[]; // tsa?
extern u8 Tsa_PrepItemSupplyBgB[];
extern u16 Pal_SioTeamList[]; // pal
// extern ??? Pal_SioPressStartGlow
extern u16 Pal_PrepItemListSpinningArrowCycle[];
extern u8 Img_SpinningArrow[]; // arrow gfx
extern u8 gImg_UiSpinningArrow_Horizontal[];
extern u8 Tsa_UnitListScreenBg[]; // tsa
extern u8 Img_UnitListScreenBg[];
extern u8 Img_UnitListBanners[];
extern u8 Img_UnitListBanner_Animation[];
extern u16 Pal_PrepWindowColors[];
extern u16 CONST_DATA gPal_PrepScreenTextSprites[];
extern u8 Img_PrepTextShadow[];
extern u8 CONST_DATA gImg_PrepMenuStartButtonSprites[];
extern u16 CONST_DATA Pal_MapBattleInfoNum[]; // 'R is info' palette
extern u8 Img_PrepPopupWindow[];
extern u16 Pal_PrepWindowA[];
extern u16 Pal_PrepWindowB[];
extern u16 Pal_PrepWindowC[];
extern u16 Pal_PrepWindowD[];
extern u8 Img_PrepWindow[];
extern u8 Tsa_SupportScreenWindow[];
extern u8 gTsa_SupportSubScreen[];
extern u8 gGfx_SupportMenu[];
extern u16 gPal_SupportMenu[];

/* sally-cursor */

enum
{
    PREP_MAPMENU_NONE = 0,
    PREP_MAPMENU_VIEW_MAP = 1,
    PREP_MAPMENU_FORMATION = 2,

    PREP_MAPMENU_OPTIONS = 8,
    PREP_MAPMENU_SAVE = 9,
    PREP_MAPMENU_DEBUG = 10,
};

enum
{
    PL_SALLYCURSOR_OPEN_MAP_MENU = 0x00,
    PL_SALLYCURSOR_UNIT_SELECTED = 0x01,
    PL_SALLYCURSOR_START_ATMENU = 0x02,
    PL_SALLYCURSOR_UNIT_SWAP = 0x03,
    PL_SALLYCURSOR_CANCEL_SWAP = 0x04,
    PL_SALLYCURSOR_POST_STATSCREEN_IDLE = 0x05,
    PL_SALLYCURSOR_POST_STATSCREEN_MOVE = 0x06,
    PL_SALLYCURSOR_MAP_IDLE = 0x09,
    PL_SALLYCURSOR_0B = 0x0B,
    PL_SALLYCURSOR_0C = 0x0C, // NOTE: Does not exist in the actual proc

    PL_SALLYCURSOR_ENTER_MAP = 0x32,
    PL_SALLYCURSOR_RETURN_TO_ATMENU = 0x33,
    PL_SALLYCURSOR_POST_SUPPLY_CHANGE = 0x34,
    PL_SALLYCURSOR_SUPPLY_DEPLOY = 0x35,
    PL_SALLYCURSOR_SUPPLY_REMOVE = 0x36,
    PL_SALLYCURSOR_END_PREP = 0x37,
    PL_SALLYCURSOR_CHAPTER_STATUS = 0x38,
    PL_SALLYCURSOR_OPTIONS = 0x39,
    PL_SALLYCURSOR_POST_DEBUG_MENU = 0x3A,
    PL_SALLYCURSOR_SAVE = 0x3B,
    PL_SALLYCURSOR_SHOP = 0x3C,
    PL_SALLYCURSOR_MAP_MENU = 0x3D,
    PL_SALLYCURSOR_REENTER_MAP = 0x3E,
};

int GetPlayerLeaderPid(void);
void Prep_ShowDeployableTiles(void);
void EndPrepScreenMenu_(void);
void PrepMapMenu_OnViewMap(struct ProcPrepSallyCursor*);
void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor*);
bool PrepMapMenu_OnStartPress(ProcPtr);
bool PrepMapMenu_OnBPress(ProcPtr);
void SALLYCURSOR_DeploySupplyUnit(void);
void PrepMapMenu_OnOptions(struct ProcPrepSallyCursor*);
void SALLYCURSOR_RemoveSupplyUnit(void);
void PrepMapMenu_OnSave(struct ProcPrepSallyCursor*);
void PrepMapMenu_OnDebug_Unused(struct ProcPrepSallyCursor*);
void PrepScreenProc_SetCameraOnSupply(ProcPtr);
void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor*);
void PrepScreenProc_DimMapImmediate(void);
void PrepScreenProc_StartBrightenMap(ProcPtr);
void PrepScreenProc_StartDimMap(ProcPtr);
void PrepHelpPrompt_Init(struct ProcPrepSallyCursor *);
void PrepHelpPrompt_Loop(void);
void PrepScreenProc_ApplyBrownBoxPalette(void);
void StartPrepHelpPrompt(ProcPtr);
void PrepMapMenu_OnEnd(void);
void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor*);
bool CanCharacterBePrepMoved(int);
void PrepCameraPan_Init(struct ProcPrepSallyCursor*);
void PrepCameraPan_TurnDown(struct ProcPrepSallyCursor*);
void PrepCameraPan_TurnLeft(struct ProcPrepSallyCursor*);
void PrepCameraPan_TurnUp(struct ProcPrepSallyCursor*);
void PrepCameraPan_Loop(struct ProcPrepSallyCursor*);
void InitPrepScreenUnitsAndCamera(void);
void InitPrepScreenCursorPosition(void);
void PrepScreenProc_SetupMapIdle(struct ProcPrepSallyCursor*);
void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor* proc);
int PrepMapMenu_ReturnToAtMenu(void);
void PrepScreen_StartUnitSwap(struct ProcPrepSallyCursor*);
void PrepScreen_UnitSwapIdle(struct ProcPrepSallyCursor*);
void PrepScreenProc_RecenterOnActiveUnit(ProcPtr);
void PrepScreen_StartUnitSwapAnim(ProcPtr);
void InitMapChangeGraphicsIfFog(void);
void DisplayMapChangeIfFog(void);
void PrepScreenProc_StartConfigMenu(ProcPtr);
void PrepScreenProc_StartShopScreen(ProcPtr);
void PrepScreenProc_MapMovementLoop(ProcPtr);
void PrepScreenProc_Cleanup(ProcPtr);
void PrepScreenProc_RefreshAfterStatScreen(ProcPtr);
void StartPrepSaveScreen(ProcPtr);
void PrepScreenProc_RestoreBgmAfterSave(void);
void PrepScreenProc_UpdateBgm(void);
void PrepScreenProc_LockGame(void);
void PrepScreenProc_HideEverythingAndUnlockGame(void);
void ShrinkPlayerUnits(void);
void EndPrepScreen(void);
bool IsPrepMapActive(void);

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
void StartPrepMenuDesc(int msg, ProcPtr parent);
void AtMenu_EndScreenElements(struct ProcAtMenu * proc);
void LoadPrepBannerGfx(int tile, int pal);
void AtMenu_Reinitialize(struct ProcAtMenu * proc);
void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu * proc);
void AtMenu_UpdateDescLoop(struct ProcAtMenu * proc);
void AtMenu_DrawSubmenuOptions(struct ProcAtMenu *proc);
void CleanupPrepMenuScreen(ProcPtr proc);
void AtMenu_InitSubmenuCursor(struct ProcAtMenu * proc);
void AtMenu_CtrlLoop(struct ProcAtMenu * proc);
void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu * proc);
void AtMenu_ResetScreenEffect(struct ProcAtMenu * proc);
void AtMenu_ResetBmUiEffect(struct ProcAtMenu * proc);
void AtMenu_StartSubmenu(struct ProcAtMenu * proc);
void AtMenu_OnSubmenuEnd(struct ProcAtMenu * proc);
void AtMenu_EnableDisplay();
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
void FadeOutPrepBgm();
void NewPrepScreenTraineePromotionManager();
int PrepScreenTraineePromotionManagerExists(ProcPtr proc);
int PrepAtMenuExists(ProcPtr proc);
void PutPrepInformationSprite(int xOam1, int yOam0, u16 oam2);
void PutPrepChapterSprite_Default(int xOam1, int yOam0, int prepChapterNum, u16 oam2);
void PutPrepChapterSprite_Tower(int xOam1, int yOam0, int prepChapterNum, u16 oam2);
void PutPrepChapterSprite_Ruins(int xOam1, int yOam0, int prepChapterNum, u16 oam2);
void PutPrepChapterSprite_Skirmish(int xOam1, int yOam0, u16 oam2);

enum
{
    PREP_KIND_FINAL_MAP = 0,
    PREP_KIND_STANDARD = 1,
    PREP_KIND_TOWER = 2,
    PREP_KIND_RUINS = 3,
    PREP_KIND_SKIRMISH = 4,
};

struct PrepSpriteDrawProc
{
     PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u8 unk2A;
    /* 2B */ u8 unk2B;
    /* 29 */ STRUCT_PAD(0x2C, 0x2F);
    /* 2F */ u8 prepChapterNum;
    /* 30 */ u8 kind;
    /* 31 */ u8 unk31;
    /* 32 */ u8 unk32;
    /* 33 */ u8 buttonStartSolid;
    /* 34 */ u8 buttonBSolid;
    /* 35 */ u8 unk35;
    /* 36 */ u16 timer;
    /* 38 */ ProcPtr apProc;
};

void DrawPrepScreenSprites(struct PrepSpriteDrawProc *proc);
void PrepSpriteDraw_Init(struct PrepSpriteDrawProc *proc);
void PrepSpriteDraw_Loop(struct PrepSpriteDrawProc *proc);
void PrepSpriteDraw_OnEnd(struct PrepSpriteDrawProc *proc);

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
void PrepSpriteDraw_BlinkButtonStart();
void PrepSpriteDraw_BlinkButtonB();
ProcPtr StartPrepScreenSpriteDraw(ProcPtr parent);
void EndPrepScreenSpriteDraw(void);
// ??? PrepDebugDrawWindowPosition(???);

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
void UnlockMenuScrollBar(void);
void EndMenuScrollBar(void);
ProcPtr StartMenuScrollBar(ProcPtr);
void PutMenuScrollBarAt(int, int);
void UpdateMenuScrollBarConfig(u8, u16, u16, u8);
void InitMenuScrollBarImg(int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void PrepSallycir_PutColoredText(struct Text * th, u16 * tm, int color, int x, const char * str);
void PrepSallycir_ClampCursorScroll(u8 * a, u16 * b);
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
void SallyCir_RectInit(struct SallyCirProc * proc);
void SallyCir_RectLoop(struct SallyCirProc * proc);
int PrepUtils_CondFalse_0(void);
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
s8 CanUnitJoinLinkArena(struct Unit *unit);
s8 CanUnitBeDeployedLinkArena(struct Unit *unit);
s8 CheckValidLinkArenaItemSwap(struct Unit*, int, struct Unit*, int);
s8 CheckValidLinkArenaItemSupply(struct Unit*, int, int);
s8 CheckValidLinkArenaItemRemoval(struct Unit*, int);
void ApplyPrepWindowColorPalette(void);
int GetPrepPageForItem(int);
void SortPrepScreenItemsByPage(int page);
void SomethingPrepListRelated(struct Unit*, int, int);
void RebuildConvoyFromPrepList(void);
void DebugFillConvoyWithItems(void);
int CountSetBits(u16 a);
int GetNthSetBitMask(u16 a, int b);
int GetFirstSetBitIndex(u16 a);

struct PrepItemScreenProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29 : 1;
    /* 2A */ u8 hoverUnitIdx;
    /* 2B */ u8 selectedUnitIdx;
    /* 2C */ s8 hasConvoyAccess;
    /* 2D */ u8 helpboxActiveIdx; // popup prompt R-text index, when R is pressed
    /* 2E */ u8 popupPromptIdx;
    /* 2F */ u8 unk_2f; // unreferenced
    /* 30 */ u8 unk_30; // unreferenced
    /* 31 */ u8 scrollAmount;
    /* 32 */ s8 unitSelected; // opens the popup prompt for Trade/List/Use/etc.
    /* 34 */ u16 scrollOffset;
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
void PutPrepItemScreenPromptText(u16 * tm);
void PutWmItemScreenPromptText(u16 * tm);
void PrepItem_DrawPromptBox(void);
void PrepItem_DrawPromptBoxGMap(void);
void PrepItem_DrawItemListBox(void);
void PrepItem_DrawCommandMenuBox(void);
void PrepItem_EndPopupBoxWorkers(void);
void PutImg_PrepItemUseUnk(int, int);
void PutImg_PrepPopupWindow(int, int);
void PrepItem_DrawUnitGridScreen(struct PrepItemScreenProc * proc);
s8 PrepItemScreen_DpadKeyHandler(struct PrepItemScreenProc *);
void PrepItem_UpdateGridScroll(struct PrepItemScreenProc *);
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc *);
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc *);
void PrepItem_GridSelectLoop(struct PrepItemScreenProc *);
void PrepItem_DrawCommandMenuText(struct PrepItemScreenProc* proc, u16 * tm, struct Unit * unit);
void PrepItemScreen_DrawSelectedUnitDetails(struct PrepItemScreenProc *);
void PrepItem_DrawSelectedUnitScreen(struct PrepItemScreenProc *);
void PrepItem_InitCommandMenu(struct PrepItemScreenProc *);
void PrepItem_RefreshSelectedUnitItems(struct PrepItemScreenProc *);
void PrepItem_CommandMenuLoop(struct PrepItemScreenProc *);
void PrepItem_TradeRedrawItems(struct PrepItemScreenProc *);
void PrepItem_InitTradeScreen(struct PrepItemScreenProc *);
void PrepItem_EndPopupBoxesAndSync(void);
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc *);
void StartPrepItemTradeScreen(struct PrepItemScreenProc *);
void StartPrepItemUse(struct PrepItemScreenProc *);
void StartPrepItemSupply(struct PrepItemScreenProc *);
void StartPrepSell(struct PrepItemScreenProc *);
void StartPrepItemListScreen(struct PrepItemScreenProc *);
void StartPrepArmory(struct PrepItemScreenProc *);
void PrepItem_ClearGMapMenuOnCancel(struct PrepItemScreenProc * proc);
void UpdatePrepItemScreenFace(int, struct Unit*, u16, u16, u16);
void EndPrepItemScreenFace(int);
ProcPtr StartPrepItemScreen(ProcPtr);
void PrepItemScreen_DrawUnitItems(struct Text*, u16*, struct Unit*, u16);
void PrepItem_SnapGridScroll(struct PrepItemScreenProc *);
void PrepItem_DrawUnitNameRow(struct PrepItemScreenProc *, u8, s8);
bool IsCoordHiddenByMinimug(u32, int);
void PutClassSpriteForSecretShop(struct Unit * unit, u16 x, u16 y);
void PrepItem_PutUnitGridSprites(struct PrepItemScreenProc *);
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2);
void PrepItemScreen_DrawVisibleUnitNames(struct PrepItemScreenProc *, u8);
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
void DrawPrepScreenItemIcons(u16 * tm, struct Unit* unit);
void PrepItemTrade_Init(struct PrepMenuTradeProc * proc);
void PrepItemTrade_Loop_MainKeyHandler(struct PrepMenuTradeProc * proc);
void PrepItemTrade_OnEnd(void);
void StartPrepItemTradeScreenProc(struct Unit* unitA, struct Unit* unitB, ProcPtr parent);
void StartPrepItemTradeScreenProcAtSlot(struct Unit* unitA, struct Unit* unitB, int rightItemIdx, ProcPtr parent);

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
void PrepItemUse_FadeOutBgm(void);
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

void PrepItemSupply_PutPromptBoxSprites(void);
void PrepItemSupply_StartPromptText(int idx, ProcPtr proc);
void StoreConvoyWeaponIconGraphics(int, int);
void PrepItemSupply_DrawItemList(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);
void PrepItemSupply_DrawItemListIcons(u16 *, int);
void PrepItemSupply_DrawItemListRow(struct Text *, u16 *, int, struct Unit *);
void PrepItemSupply_DrawItemListRow(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);
void PrepItemSupply_OnHBlank(void);
void PrepItemSupply_Init(struct PrepItemSupplyProc * proc);
void PrepItemSupply_InitGiveTakeText(void);
void PrepItemSupply_DrawGiveTakeText(struct PrepItemSupplyProc * proc);
void PrepItemSupply_DrawConvoyHeader(void);
void PutGiveTakeBoxSprites(void);
void PutGiveSprites(void);
void PutTakeSprites(void);
void Supply_PutHighlightedCategorySprites(struct PrepItemSupplyProc * proc);
void PrepItemSupply_DrawConvoyWeaponIconTiles(u16 * tm, u32 chr, int pal);
void PrepItemSupply_ResetBackgrounds(struct PrepItemSupplyProc * proc);
void PrepItemSupply_InitGfx(struct PrepItemSupplyProc * proc);
void PrepItemSupply_EnterGiveTakeMenu(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_GiveTakeKeyHandler(struct PrepItemSupplyProc * proc);
void PrepItemSupply_RedrawAfterPageSwitch(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchPageLeft(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchPageRight(struct PrepItemSupplyProc * proc);
void PrepItemSupply_ClampScroll(struct PrepItemSupplyProc * proc);
void PrepItemSupply_AdjustCursorAndScroll(struct PrepItemSupplyProc * proc);
void PrepItemSupply_ScrollVertical(struct PrepItemSupplyProc * proc, int amount);
void PrepItemSupply_RedrawConvoyHeaderWorker(void);
void PrepItemSupply_TakeItemFromSupply(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_ItemListKeyHandler(struct PrepItemSupplyProc * proc);
s8 PrepItemSupply_HandleUnitInvCursorInput(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchToUnitInventory(struct PrepItemSupplyProc * proc);
void PrepItemSupply_GiveItemToSupply(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_UnitInvKeyHandler(struct PrepItemSupplyProc * proc);
void PrepItemSupply_OnEnd(struct PrepItemSupplyProc * proc);
void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent);
void PrepItemSupply_ShowActiveUnitOnEnter(void);
void PrepItemSupply_StartActiveUnitMuOnExit(void);
void StartBmSupply(struct Unit *, ProcPtr);
void MaybeStartSelectConvoyItemProc(struct Unit *, ProcPtr);
void PrepItemList_Init(struct PrepItemListProc * proc);
void PrepItemList_DrawOwnerHeaderText(void);
void PrepItemList_DrawCurrentOwnerText(struct PrepItemListProc *);
void List_PutHighlightedCategorySprites(struct PrepItemListProc *);
void PrepItemList_InitGfx(struct PrepItemListProc * proc);
void PrepItemList_OnEnd(struct PrepItemListProc * proc);
void PrepItemList_RedrawPageContents(struct PrepItemListProc * proc);
void PrepItemList_SwitchPageLeft(struct PrepItemListProc * proc);
void PrepItemList_SwitchPageRight(struct PrepItemListProc * proc);
void PrepItemList_ClampCursorAndScroll(struct PrepItemListProc *);
void PrepItemList_ScrollVertical(struct PrepItemListProc * proc, int amount);
void PrepItemList_TakeItemToUnit(struct PrepItemListProc * proc);
void PrepItemList_SnapCursorIntoView(struct PrepItemListProc *);
void PrepItemList_Loop_MainKeyHandler(struct PrepItemListProc * proc);
s8 PrepItemList_MoveUnitInvCursor(struct PrepItemListProc * proc);
void PrepItemList_SwitchToUnitInventory(struct PrepItemListProc * proc);
void PrepItemList_SwapItemWithUnitSlot(struct PrepItemListProc * proc);
void PrepItemList_Loop_UnitInvKeyHandler(struct PrepItemListProc * proc);
void PrepItemList_StartTradeScreen(struct PrepItemListProc * proc);
void StartPrepItemListScreenProc(struct Unit * unit, ProcPtr parent);
