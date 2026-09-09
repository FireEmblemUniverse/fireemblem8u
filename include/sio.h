#pragma once

#include "global.h"
#include "sio_core.h"

#include "proc.h"
#include "mu.h"
#include "bmsave.h"
#include "uimenu.h"

struct Proc085AAAC4 {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x40);
    /* 40 */ int unk40;
};

struct ProcTactician {
    PROC_HEADER;

    /* 2C */ struct Proc085AAAC4 * child1;
    /* 30 */ u8 line_idx;
    /* 31 */ u8 text_idx;
    /* 32 */ u8 unk32;
    /* 33 */ u8 unk33;
    /* 34 */ s16 conf_idx;
    /* 36 */ s16 conf_idx_bak;
    /* 38 */ u8 cur_len;                /* used tactician name string length */
    /* 39 */ u8 unk39;
    /* 3A */ u8 unk3A;
    /* 3A */ u8 unk3B;
    /* 3C */ u8 max_len;                /* pre-configured max string length */
    /* 3D */ char str[0x4C - 0x3D];
    /* 4C */ u16 unk4C[0x10];
};

struct TacticianTextConf {
    /* 00 */ u8 * str[0xC];
    /* 30 */ u16 x, y;
    /* 34 */ u8 kind;
    /* 35 */ u8 _pad_;
    /* 36 */ s16 adj_idx[4];
    /* 3E */ u8 action;
};

extern const struct TacticianTextConf gTacticianTextConf[];
const struct TacticianTextConf * GetTacticianTextConf(s16);

enum sio_save_config_bitfile {
    SIO_SAVE_CONF_B3 = 1 << 3,
};

struct SioSaveConf {
    u8 _unk0_ : 1;
    u8 _unk1_ : 1;
    u8 _unk2_ : 1;
    u8 _unk3_ : 1;
    u8 _unk4_ : 4;
    u8 _unk8_;
} __attribute__((packed));
extern struct SioSaveConf gSioSaveConfig;

struct SioUnknown_0203DD90_Unk2C
{
    /* 00 */ u8 unitId;
    /* 04 */ int newScore;
};

struct LinkArenaBattleState
{
    u8 unk_00; // ?
    u8 unk_01; // current phase
    u8 unk_02; // current cursor unit idx
    u8 unk_03; // current cursor unit idx (again?)
    u8 unk_04; // current selected unit idx (attacker)
    u8 unk_05; // current selected combat target unit id
    u8 unk_06; // weapon index maybe?
    u8 unk_07; // ?
    u8 unk_08; // ?
    u8 unk_09; // ?
    /* 0A */ u8 unk_0A[4]; // num units alive per team?
    /* 0E */ u8 unk_0E; // ?
    /* 0F */ u8 unk_0F[4]; // player ids?
    /* 14 */ int currentScore[4]; // scores
    /* 24 */ u16 unk_24[4]; // leader face IDs
    /* 2C */ struct SioUnknown_0203DD90_Unk2C unk_2c[4];
};

extern struct LinkArenaBattleState gUnk_Sio_16;

struct SioProc85A971C_Unk44
{
    /* 00 */ u8 playerId;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ u32 points;
};

u32 SioStrCpy(u8 const * src, u8 * dst);
void SioDrawNumber(struct Text * text, int x, int color, int number);
void SioInit(void);
void SioPollingMsgAndAck(ProcPtr proc);
void SetBmStLinkArenaFlag(void);
void UnsetBmStLinkArenaFlag(void);
bool CheckInLinkArena(void);    // <!> This function is defined as different types by files, maybe a bug.
void LinkArena_ResetUnk04(void);

struct ProcSioLoadingBlendPulse {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x58);

    /* 38 */ u32 timer;
};

void Sio_LoadingBlendPulse_Init(struct ProcSioLoadingBlendPulse * proc);
void Sio_LoadingBlendPulse_Loop(struct ProcSioLoadingBlendPulse * proc);
void Sio_ScrollBgsParallax_Loop(void);
void Sio_SyncBarrier_Loop(ProcPtr proc);
void Sio_Msg89Barrier_Init(void);
void Sio_Msg89Barrier_Loop(ProcPtr proc);

struct ProcSioHold {
    PROC_HEADER;

    int x;
    int y, y_min, y_max;
};

void SioHold_Loop(struct ProcSioHold * proc);
ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min);
void EndSioHold(void);
void MoveSioHold(ProcPtr proc, int num);
void ClearSioBG(void);
void ClearSioBGFull(void);
void PutSioText(int, int);
void InitSioTexts(void);
void GiveUnitDefaultWeapons(struct Unit * unit);
void SioPlaySoundEffect(int);
void SetSioSaveConfigFlag3(void);
bool IsKeyInputSequenceComplete(const u16 * list);
bool CheckSioKeyInputSequence2(void);

/* sio_teamlist.c */

struct SioProc85AAA78
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ s16 unk_30[5];
    /* 3A */ u8 unk_3a[5];
    /* 40 */ int unk_40;
    /* 44 */ s8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
};

struct SioTeamListProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85AAA78 * unk_2c;
    /* 30 */ ProcPtr pSioHoldProc;
    /* 34 */ int numActiveOptions;
    /* 38 */ int unk_38;
    /* 3C */ int optionIdx;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u8 unk_48;
    /* 49 */ STRUCT_PAD(0x49, 0x4A);
    /* 4A */ u16 yBg1;
    /* 4C */ s8 unk_4c;
    /* 4D */ u8 validOptions[5];
    /* 52 */ u8 selectedOption;
    /* 53 */ u8 selectedTeam;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ STRUCT_PAD(0x56, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ s8 unk_5c;
};

int DrawLinkArenaTeamListMenu(u8, struct SioTeamListProc *);;
bool CanBuildNewLinkArenaTeam(void);;
bool AnyLinkArenaTeamExists(void);;
void StartLinkArenaTeamList(ProcPtr parent);
void SioTeamList_Init(struct SioTeamListProc * proc);
bool CanBuildNewLinkArenaTeam(void);
bool AnyLinkArenaTeamExists(void);
int LoadLinkArenaTeamList(int activeOption, u8 mode);
void DrawLinkArenaTeamName(int idx);
void DrawAllLinkArenaTeamNames(struct SioTeamListProc * proc);
void UpdateLinkArenaTeamNamePalettes(struct SioTeamListProc * proc, u8 mode);
void SioTeamList_EraseTeam(struct SioTeamListProc * proc);
void SioTeamList_SwapTeams(struct SioTeamListProc * proc);
int DrawLinkArenaTeamListMenu(u8 mode, struct SioTeamListProc * proc);
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc);
void SioTeamList_SetupGfx(struct SioTeamListProc * proc);
void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total);
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc);
void SioTeamList_StartUnitList(struct SioTeamListProc * proc);
void SioTeamList_WaitForUnitListScreen(ProcPtr proc);
int AreAllLinkArenaTeamsSelected(void);
void SioTeamList_0(struct SioTeamListProc * proc);
void SioTeamList_SetTeamSpriteXOffsets(struct SioProc85AAA78 * proc, s8 b);
void SioTeamList_1(struct SioTeamListProc * proc);
void SioTeamList_2(struct SioTeamListProc * proc);
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc);
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc);
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc);

void Tactician_MapNameToConfIndices(struct ProcTactician * proc, u8 * str_buf);
void Tactician_DrawCharGrid(struct ProcTactician * proc);
void TacticianDrawCharacters(struct ProcTactician * proc);
int StrLen(u8 * buf);
void Tactician_InitScreen(struct ProcTactician * proc);
void SioUpdateTeam(char * str, int team);
void Tactician_MoveHand(struct ProcTactician * proc, int idx, const struct TacticianTextConf * conf);
void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf);
bool Tactician_TryChangeLastCharVariant(struct ProcTactician * proc, const struct TacticianTextConf * conf, u32 c, int d);
void Tactician_LoopCore(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void Tactician_Loop(struct ProcTactician * proc);
void Tactician_PageFadeHBlankHandler(void);
void Tactician_PageFade_Init(struct ProcTactician * proc);
void Tactician_PageFadeOut_Loop(struct ProcTactician * proc);
void Tactician_SwapPage(struct ProcTactician * proc);
void Tactician_PageFadeIn_Loop(struct ProcTactician * proc);
void NameSelect_DrawName(struct ProcTactician * proc);
void NameSelect_ConfirmLoop(struct ProcTactician * proc);
void Tactician_OnEnd(void);

struct SioPostBattleProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr unk_2c[4];
    /* 3C */ STRUCT_PAD(0x3c, 0x40);
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 playerId;
    /* 43 */ u8 unk_43;
    /* 44 */ struct SioProc85A971C_Unk44 unk_44[4];
    /* 64 */ int unk_64;
};

struct SioPostBattleSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioPostBattleProc * unk_2c;
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ int delayMaybe;
    /* 3C */ int timer;
    /* 40 */ u16 fid;
    /* 42 */ u8 oam2;
    /* 43 */ u8 ranking;
};

struct SioPostBattleMusicProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int isPlayerWinner;
};

void SioPostBattleSprites_Init(struct SioPostBattleSpritesProc * proc);
void SioPostBattleSprites_Loop_DrawSlideIn(struct SioPostBattleSpritesProc * proc);
void SioPostBattleSprites_Loop_DrawStatic(struct SioPostBattleSpritesProc * proc);
ProcPtr StartDrawLinkArenaRankSprites(struct SioPostBattleProc * parent, int delayMaybe, u16 fid, u8 oam2, u8 ranking);
void SioPostBattle_DrawRankingRowBar(struct SioPostBattleProc * proc);
void SioPostBattle_DrawRankingText(struct SioPostBattleProc * proc);
ProcPtr SioPostBattle_StartMusicProc(struct SioPostBattleProc * parent);
void SioPostBattle_Init(struct SioPostBattleProc * proc);
void SioPostBattle_Loop_Main(struct SioPostBattleProc * proc);
void SioPostBattle_AwaitAPress(ProcPtr proc);
void SioPostBattleMusic_PlayFanfare(struct SioPostBattleMusicProc * proc);
void SioPostBattleMusic_PlayStandardBgm(void);

struct SioBatProc_Unk2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

struct SioBatProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioBatProc_Unk2C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ STRUCT_PAD(0x3C, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 unk_64;
};

int InsertMultiArenaRanking(u8 ranking, u32 playerCount, u32 mode, u32 points);
void SioBat_RegisterHighScore(struct SioBatProc * proc);
void SioBat_LoadAllTeamUnits(void);
void New6C_SIOMAIN2(void);
void SioMain2_WaitEndAndRoute(ProcPtr proc);
void SioBat_StartTalkText(const char * str, int x, int y, ProcPtr parent);
void EndSioProcs(void);
void SioBat_ReleaseIrq(void);
void LinkArena_UpdatePlayerStatusText(void);
void SioBat_InitSetupScreen(struct SioBatProc * proc);
void StartSioProcs(ProcPtr proc);
void SioBat_SetupLoop(struct SioBatProc * proc);
void SioBat_WaitSetupAck(struct SioBatProc * proc);
void SioBat_DecideFirstMover(struct SioBatProc * proc);
void SioBat_ReceiveFirstMover(struct SioBatProc * proc);
void SioBat_FirstMoverRoulette(struct SioBatProc * proc);
void SioBat_PlayFirstMoverSound(void);
void SioBat_PrepareTeamUnit(struct Unit * unit);
void SioBat_InitTeamTransfer(struct SioBatProc * proc);
void SioBat_TeamTransferLoop(struct SioBatProc * proc);
void SioBat_WaitTeamTransferDone(struct SioBatProc * proc);
void DrawLinkArenaLoadingScreen(struct SioBatProc * proc);
void DrawLinkArenaRuleScreen(ProcPtr proc);
void EnableSioLinkTimeoutCheck(void);
void DisableSioLinkTimeoutCheck(void);

struct SioTermProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c[3];
    /* 38 */ int unk_38[3];
    /* 44 */ STRUCT_PAD(0x44, 0x48);
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
};

void LinkArenaTeamBuild_Init(struct SioTermProc * proc);
void MoveMenuCursorSkippingInvalid(int * cur, u8 bottom, u8 top, int * buf, u8 total);
void LinkArenaTeamBuild_Loop(struct SioTermProc * proc);
void LinkArenaTeamBuild_LoadSelectedSave(struct SioTermProc * proc);
void LinkArenaTeamBuild_GotoExitIfNoCursor(ProcPtr proc);
void LinkArenaTeamBuild_GotoIfNoSelection(ProcPtr proc);
void LinkArenaTeamBuild_WaitAtMenu(ProcPtr proc);
void LinkArenaTeamBuild_OnTacticianDone(ProcPtr proc);
void LinkArenaTeamBuild_ResetBg1Position(void);

struct SioResultProcUnk2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ int unk_30;
};

struct SioResultProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioResultProcUnk2C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u16 unk_36;
    /* 38 */ s8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
};

void DrawLinkArenaRankIcon(u16 * tm, u32 base);
void DrawLinkArenaModeIcon(u16 * tm, u32 base);
void DrawLinkArenaRankingRow(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount);
void DrawLinkArenaRankings(void);
void SioResult_Init(struct SioResultProc * proc);
void SioResult_Loop_Main(struct SioResultProc * proc);
u8 SioResult_GetNewHSScrollTarget(int var);
void SioResult_NewHS_Init(struct SioResultProc * proc);
void SioResult_NewHS_LoopScroll(struct SioResultProc * proc);
void SioResult_NewHS_AwaitAPress(ProcPtr proc);
void StartSioResultNewHighScore(int value, ProcPtr parent);

/* sio_rulesettings.c */

struct ProcSioRuleSettings
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr unk_2c;
    /* 30 */ int unk_30;
};

struct LinkArenaRuleInfo
{
    /* 00 */ int labelTextId;
    /* 04 */ int xPos[2];
    /* 0C */ int optionTextId[2];
};

extern const struct LinkArenaRuleInfo gLinkArenaRuleData[];

void StartSioResultNewHighScore(int value, ProcPtr parent);
void LoadLinkArenaRuleSettings(u8 * buf);
void SaveLinkArenaRuleSettings(u8 * buf);
void SioRuleSettings_DrawRuleOptions(int idx, int state);
void SioRuleSettings_Init(struct ProcSioRuleSettings * proc);
void SioRuleSettings_Loop_Main(struct ProcSioRuleSettings * proc);

struct SioMenuItemProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 xBase;
    /* 2C */ s16 yBase;
    /* 2E */ u8 state; // 0 = disabled, 1 = enabled, 2 = selected
    /* 2F */ u8 index;
    /* 30 */ u8 glowFrame;
    /* 32 */ s16 xLeftArrow;
    /* 34 */ s16 xRightArrow;
    /* 36 */ u16 leftArrowAnmCnt;
    /* 38 */ u16 rightArrowAnmCnt;
    /* 3A */ s16 leftArrowSpeed;
    /* 3C */ s16 rightArrowSpeed;
    /* 3E */ u8 unk_3e;
};

struct SioMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioMenuItemProc * menuItems[5];
    /* 40 */ u8 menuItemState[5];
    STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
    /* 58 */ s8 unk_58;
    /* 59 */ s8 unk_59;
};

int SioMenu_GetItemHelpText(struct SioMenuProc * proc, int lineNum);
bool CheckSomethingSaveRelated(void);
void SioMenu_Init(void);
void SioMenu_LoadGraphics(struct SioMenuProc * proc);
void SioMenu_0(struct SioMenuProc * proc);
void SioMenu_AnimateItemsSpreadFromSelection(struct SioMenuProc * proc);
void SioMenu_RestartGraphicsMaybe(struct SioMenuProc * proc);
void SioMenu_HandleDPadInput(struct SioMenuProc * proc, u8 b);
void SioMenu_Loop_HandleKeyInput(struct SioMenuProc * proc);
void SioMenu_1(struct SioMenuProc * proc);
void SioMenu_End(struct SioMenuProc * proc);
void StartLinkArenaMainMenu(ProcPtr parent);

void StartTacticianNameEntry(ProcPtr parent);
void StartTacticianNameSelect(ProcPtr parent);
bool XMapTransfer_0(ProcPtr proc);
void XMapTransfer_1(ProcPtr proc);
void XMapTransfer_2(ProcPtr proc);
bool XMapTransfer_3(ProcPtr proc);
void PutXMapProgressPercent(struct Text * th, const char * str, int number);
void DrawXMapSendProgress(struct SioBigSendProc * proc);
void DrawXMapReceiveProgress(struct SioBigReceiveProc * proc);
void StartXMapTransfer(struct SioBigSendProc * proc);
bool XMapTransfer_AwaitCompletion(void);
void Sio_InitAckMask(void);
bool Sio_SyncWaitAllAck(void);
void XMapTransfer_4(void);
void Sio_EnableAllWOutLayers(void);
void EndSioMenuForXMapTransfer(struct Proc * proc);
void EndSioSessionAndLoadSuspend(void);
void EraseSaveData(void);
void CallEraseSaveEvent(void);

struct LAPointsBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text text[4];
};

struct PointsNumberMoverProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x;
    /* 2C */ s16 y;
    /* 2E */ s16 xTarget;
    /* 30 */ s16 yTarget;
    /* 32 */ u8 playerId;
    /* 33 */ u8 unitId;
    /* 34 */ int difference;
    /* 38 */ u32 newScore;
    /* 3C */ u32 timer;
    /* 40 */ s8 unk_40;
    /* 41 */ STRUCT_PAD(0x41, 0x44);
    /* 44 */ int unk_44; // used for showing the "rolling" number while accumulating points
    /* 48 */ struct Text text;
};

struct PointsSpriteTextProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x54);
    /* 54 */ const char * str;
};

void SioPointsSprite_Loop(void);
void Sio_SortPlayersByScore(struct SioProc85A971C_Unk44 * buf);
void DrawLinkArenaPointsBox(struct Text * th, int x, int y, int var, int number);
void LAPointsBox_LoadBoxes(struct LAPointsBoxProc * proc);
void LAPointsBox_Dummy(void);
void StartLinkArenaPointsBox(void);
void EndLinkArenaPointsBox(void);
void PointsNumberMover_Init(struct PointsNumberMoverProc * proc);
void PointsNumberMover_LoopNumberEmerge(struct PointsNumberMoverProc * proc);
void PointsNumberMover_LoopMoveToPointsBox(struct PointsNumberMoverProc * proc);
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number);
void PointsNumberMover_InitScoreChange(struct PointsNumberMoverProc * proc);
void PointsNumberMover_TickScore(struct PointsNumberMoverProc * proc);
void PointsNumberMover_AwaitEnd(struct PointsNumberMoverProc * proc);
void PointsSpriteText_Init(struct PointsSpriteTextProc * proc);
void PointsSpriteText_LoopIn(struct PointsSpriteTextProc * proc);
void PointsSpriteText_LoopOut(struct PointsSpriteTextProc * proc);
s8 StartLinkArenaPointsNumberMovers(int x, int y, const char * str, u8 flag, ProcPtr parent);
void StartLinkArenaShowPointsAnimated(ProcPtr proc);
void StartLinkArenaShowPoints(ProcPtr proc);

struct SioBattleMapProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ STRUCT_PAD(0x3C, 0x54);
    /* 54 */ struct MuProc * unk_54;
    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
};

struct SioProc85AA1AC
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk_64;
};

void LinkArenaBattleMap_BackupUnitItems(struct Unit * unit);
void LinkArenaBattleMap_RestoreUnitItems(struct Unit * unit);
void LinkArenaBattleMap_RefreshMapAndSprites(void);
void LinkArenaBattleMap_AdvancePhase(int faction);
void LinkArenaBattleMap_ClearCmdBuffer(void);
u16 LinkArenaBattleMap_SendCommand(u8 a, u8 b, u8 c, u8 d);
int LinkArenaBattleMap_FindUnitSlot(u8 target);
void LinkArenaBattleMap_StartUnitMoveOut(u8 a, int b, u8 * c, int * xOut, int * yOut);
void LinkArenaBattleMap_ClearUnitSlots(void);
void LinkArenaBattleMap_InitUnitSlots(void);
void LinkArenaBattleMap_RebuildUnitMap(void);
void LinkArenaBattleMap_RefreshUnitSlots(void);
void LinkArenaBattleMap_InitChapter(void);
void LinkArenaBattleMap_InitMap(void);
void LinkArenaBattleMap_CountTeamUnits(void);
void LoadLinkArenaFogPlaceholder(void);
void LinkArenaBattleMap_InitDisplay(void);
void LinkArenaBattleMap_InitConfig(void);
void LinkArenaBattleMap_Init(void);
void LinkArenaBattleMap_StartSelectedUnitMu(void);
void LinkArenaBattleMap_WaitLButton(ProcPtr proc);
void LABattleMap_StartFactionTurn(ProcPtr parent);
void LABattleMap_BeginTurn(ProcPtr proc);
int LinkArena_GetPlayerRanking(void);
void LABattleMap_End(void);
void LABattleMap_MoveSelectCursor(u16 keys, s8 flag);
void LABattleMap_UpdateCursorMu(void);
bool UnitHasUsableWeapon(struct Unit * unit);
void LABattleMap_CheckNoDamageStall_Loop(ProcPtr proc);
void LABattleMap_WaitSioSendDrain_Loop(ProcPtr proc);
void LABattleMap_SelectAttacker_Loop(struct SioBattleMapProc * proc);
void LABattleMap_StartPointsBox(ProcPtr unused);
void LABattleMap_SelectTarget_Loop(struct SioBattleMapProc * proc);
void LABattleMap_ForecastMenu_Init(struct SioProc85AA1AC * proc);
void LABattleMap_ForecastMenu_Loop(struct SioProc85AA1AC * proc);
void LABattleMap_DetermineAttackRange(struct SioProc85AA1AC * proc);
void LABattleMap_GenerateForecast(struct SioProc85AA1AC * proc);
void LABattleMap_ForecastConfirm_Loop(ProcPtr proc);
void LABattleMap_StartForecast(ProcPtr parent);
void LABattleMap_ConfirmTarget(struct SioBattleMapProc * proc);
void LABattleMap_StartCombatantWarpFx(struct SioBattleMapProc * proc);
void LABattleMap_PrepareCombatantSprites(void);
void LABattleMap_StartCombat(ProcPtr proc);
void LABattleMap_ApplyCombatResults(ProcPtr proc);
void LABattleMap_WarpCombatantsToRoster(ProcPtr proc);
void LABattleMap_EliminateTeamsWithoutAttackers(void);
void LABattleMap_RecordEliminationAndAdvance(ProcPtr proc);
void LABattleMap_RefreshAfterCombat(void);
void LABattleMap_PollSurrenderInput(void);
bool LABattleMap_IsAttackOrSurrenderMsg(void * data);

struct SioProc85AA4CC
{
    PROC_HEADER;
    int unk_2c;
    int unk_30;
    int unk_34;
    int unk_38;
};

void LABattleMap_ReceiveAttackDeclaration(struct SioProc85AA4CC * proc);
bool LABattleMap_IsSelectOrCancelMsg(void * data);
void LABattleMap_ReceiveTargetSelection(struct SioProc85AA4CC * proc);
void LABattleMap_StartMuAndSavePosition(struct Unit * unit, int idx, int * xOut, int * yOut);
bool LABattleMap_IsForecastMsg(void * data);
void LABattleMap_ReceiveForecastResponse(struct SioProc85AA4CC * proc);
int GetUnitBestWeaponPower(struct Unit * unit);
int LABattleMap_GetTeamCombatScore(int playerId);
bool LABattleMap_PollSurrenderHeld(struct SioBattleMapProc * proc, int b);
void LABattleMap_AiPickWeakestTeam(ProcPtr proc);
int ITEMRANGEDONE_Stub_0(int unused, struct Unit * unit);
void LABattleMap_AiPickBestAttack(struct SioBattleMapProc * proc);
void LABattleMap_Ai_StartTargetCursor(ProcPtr proc);
void LABattleMap_Ai_PrepareCombatants(struct SioProc85AA4CC * proc);
void LABattleMap_Ai_WaitCombatantMu(ProcPtr proc);
void LinkArenaFogSprite_Loop(void);
void StartLinkArenaFogPlaceholders(void);
void EndLinkArenaFogPlaceholders(void);
void LABattleMap_StartStatScreen(ProcPtr proc);
void LABattleMap_HandleSurrenderPrompt(ProcPtr proc);
void LABattleMap_HandleNoDamagePrompt(ProcPtr proc);
void LABattleMap_Ai_HandleSurrender(struct SioBattleMapProc * proc);
void LABattleMap_RecordSurrenderRanking(struct SioBattleMapProc * proc);
void LABattleMap_SetQuitEndState(ProcPtr proc);
void LABattleMap_Remote_RecordSurrenderRanking(struct SioBattleMapProc * proc);
void LABattleMap_Remote_SetQuitEndState(ProcPtr proc);
void LAUnitDeaths_Init(struct SioBattleMapProc * proc);
void LAUnitDeaths_FindNextAndStart(struct SioBattleMapProc * proc);
void LAUnitDeaths_EndMu(struct SioBattleMapProc * proc);
void LAUnitDeaths_OnEnd(void);
void LinkArena_StoreTalkChoice(void);
void LABattleMap_StartSurrenderPrompt(void);
void LABattleMap_StartNoDamagePrompt(void);
void LABattleMap_StartBonusPointsHelp(struct SioBattleMapProc * proc);
void LABattleMap_AwardBonusPoints(struct SioBattleMapProc * proc);
void LABattleMap_SkipIfSingleConsoleMode(ProcPtr proc);
void LABattle_BeginAnims(void);
void LABattle_StartDeathFades(struct SioBattleMapProc * proc);
void LABattle_MarkDeadCombatants(void);
void SetLinkArenaUiBlendWindow(void);
void ClearLinkArenaUiBlendWindow(void);

struct SioProc85AA7B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x64);
    /* 64 */ s16 unk_64;
};

void SetLinkArenaUiBlendWindow(void);
void ClearLinkArenaUiBlendWindow(void);
void Sio_DisableWindowAndBlend(void);
void Sio_BoxTransitionHBlankHandler(void);
void Sio_SwapBoxTransitionBuffers(void);
void Sio_EndBoxTransitionHBlank(void);
void Sio_RasterRotatedBoxToWinBuf(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k);
void Sio_BoxTransition_Init(struct SioProc85AA7B4 * proc);
void Sio_BoxTransitionOpen_Loop(struct SioProc85AA7B4 * proc);
void Sio_BoxTransitionOpen_End(void);
void Sio_StartBoxTransitionOpen(u16 a, ProcPtr parent);
void Sio_StartBoxTransitionOpenDefault(ProcPtr parent);
void Sio_BoxTransitionClose_Loop(struct SioProc85AA7B4 * proc);
void Sio_BoxTransitionClose_End(void);
void Sio_StartBoxTransitionClose(u16 a, ProcPtr parent);
void Sio_StartBoxTransitionCloseDefault(ProcPtr parent);
void Sio_WaitBoxTransitionOpen(ProcPtr proc);
void Sio_WaitBoxTransitionClose(ProcPtr proc);

struct SioProc85AA83C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct MuProc * muProc;
};

struct SioWarpProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ int x;
    /* 38 */ int y;
    /* 3C */ int facing;
    /* 40 */ u8 unk_40;
    /* 41 */ s8 playStepSe;
};

struct SioProc85AA954
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int x;
    /* 30 */ int y;
};

void StartSioMuFadeFromColor(struct MuProc * muProc, int kind);
void SioMuFade_RestorePal(struct SioProc85AA83C * proc);
void StartLinkArenaMUDeathFade(struct MuProc * muProc);
void StartSioMuFadeToColor(struct MuProc * muProc, int palIdx);
void StartSioMuFadeRestore(struct MuProc * muProc);
void SioWarp_Init(struct SioWarpProc * proc);
void SioWarp_Loop(struct SioWarpProc * proc);
void SioWarp_End(void);
void SioWarpFx_StartSioWarp(struct SioWarpProc * parent);
void SioWarpFx_0(struct SioWarpProc * proc);
void SioWarpFx_HideMoveUnit(struct SioWarpProc * proc);
void SioWarpFx_SetMUPosition(struct SioWarpProc * proc);
void SioWarpFx_ShowMoveUnit(struct SioWarpProc * proc);
void SioWarpFx_1(struct SioWarpProc * proc);
void SioWarpFx_AwaitSioWarp(ProcPtr proc);
ProcPtr StartSioWarpFx(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent);
ProcPtr StartSioWarpFxPartial(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent);
void PutLinkArenaButtonSpriteAt(int x, int y);
void LAButtonSprites_Loop(struct SioProc85AA954 * proc);
void StartLinkArenaButtonSpriteDraw(int x, int y, ProcPtr parent);
void EndLinkArenaButtonSpriteDraw(void);

struct LinkArenaTitleBannerProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ u32 chr;
};

void InitSioBG(void);
void Nop_SioUiutils_1(int unusedA, int unusedB);
void Nop_SioUiutils_2(int unused);
void Nop_SioUiutils_0(void);
void CopyLinkArenaTileRows(u8 * src, u8 * dst, int c, int d);
void LATitleBanner_Init(struct LinkArenaTitleBannerProc * proc);
void LATitleBanner_Loop(void);
void StartLinkArenaTitleBanner(ProcPtr parent, int size, int chr);
void EndLinkArenaTitleBanner(void);
void SetLinkArenaUiBlendAndWindowOff(void);
void SetLinkArenaUiBlend(void);
void ResetLinkArenaUiBlend(void);
void UpdateSioMenuSelectedGlow(u8 idx);
void SioMenuItem_Loop(struct SioMenuItemProc * proc);
ProcPtr StartSioMenuItem(ProcPtr parent, u8 xBase, u8 yBase, u8 index, u8 state);
void SioMenuItem_SetArrowConfig(struct SioMenuItemProc * proc, int xLeft, int xRight, int leftSpeed, int rightSpeed);
void SioMenuItem_SetPosition(struct SioMenuItemProc * proc, s16 x, s16 y);
void UpdateLinkArenaSideMenuGlow(void);
void UpdateLinkArenaNameBannerGlow(void);
void SioTeamMenuSpriteDraw_Loop(struct SioProc85AAA78 * proc);
ProcPtr StartSioTeamMenuSpriteDraw(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf);

struct LATeamSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ int yMin;
    /* 38 */ int yMax;
    /* 3C */ int numTeams;
};

void LATeamSpriteDraw_Loop(struct LATeamSpriteDrawProc * proc);
void PutLinkArenaTeamSprites(int x, int y, int yMax, int yMin, int count, ProcPtr parent);
void ScrollMultiArenaTeamSprites(int amount);
void UpdateNameEntrySpriteGlow(void);

struct NameEntrySpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xCurrent;
    /* 30 */ int yCurrent;
    /* 34 */ int xNew;
    /* 38 */ int yNew;
    /* 3C */ int cursorKind;
    /* 40 */ int xPointer;
    /* 44 */ int unk_44; // maybe mode (Katakana/Hiragana)?
};

void NameEntrySpriteDraw_Loop(struct NameEntrySpriteDrawProc * proc);
ProcPtr StartNameEntrySpriteDraw(ProcPtr parent, int x, int y);
void UpdateNameEntrySpriteDraw(void * proc, int xNew, int yNew, int xPointer, int cursorKind, int f);

struct RuleSettingSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 yPrevious;
    /* 2C */ s16 yNew;
    /* 2E */ s16 xOption;
    /* 30 */ s16 yOption;
};

void RuleSettingSprites_Interactive_Loop(struct RuleSettingSpriteDrawProc * proc);
void RuleSettingSprites_Static_Loop(struct RuleSettingSpriteDrawProc * proc);
ProcPtr StartRuleSettingSpriteDrawInteractive(ProcPtr parent);
void StartRuleSettingSpriteDrawStatic(void);
void UpdateRuleSettingSprites(ProcPtr proc, s16 b, s16 xOption, s16 yOption);
void UpdateSioMenuBurstGlow(int idx);

struct SioMenuBurstFxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 glowPalIdx;
};

void SioMenuBurstFx_Loop(struct SioMenuBurstFxProc * proc);
ProcPtr StartSioMenuBurstFx(ProcPtr parent, int x, int y);

struct LAMenuScrollBarProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ s16 unk_3e;
    /* 40 */ s16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u8 oam2Arrows[2];
};

void LinkArenaMenuScroll_Init(struct LAMenuScrollBarProc * proc);
void LinkArenaMenuScroll_Loop(struct LAMenuScrollBarProc * proc);
void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent);
void UpdateLinkArenaMenuScrollBar(u8 a, s16 b);
void LAPhaseIntro_Init(void);
void LAPhaseIntro_End(void);
void LAPhaseIntro_StartBgm(void);
void SetUnitItemUsesToMax(struct Unit * unit, int itemSlot);
void SetUnitAllItemsUsesToMax(struct Unit * unit);
void UpdateLinkArenaVersusBannerGlow(void);

struct LAVersusSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int yBase;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u16 unk_3c[4];
};

void LAVersusSpriteDraw_Loop(struct LAVersusSpriteDrawProc * proc);
ProcPtr StartLinkArenaVersusSpriteDraw(int x, int y, ProcPtr parent);
void EndLinkArenaVersusSpriteDraw(void);
ProcPtr GetLinkArenaVersusSpriteDraw(void);
void UpdateLinkArenaActiveBannerBgGlow(void);
void UpdateLinkArenaActiveBannerObjGlow(void);
void SetLinkArenaResultBlend(void);

struct SioProc85AABD8
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
};

void LinkArenaResultBanner_Loop(struct SioProc85AABD8 * proc);
ProcPtr StartLinkArenaResultBanner(int x, int y, ProcPtr parent);
void LoadLinkArenaChoiceBoxGfx(void);
void PutLinkArenaChoiceBannerSprite(int x, int y);

u8 SioWeaponSelectMenu_Usability(const struct MenuItemDef * def, int number);
u8 SioWeaponSelectMenu_OnSelect(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 SioAttackTypeMenu_OnSelect(struct MenuProc * menu, struct MenuItemProc * menuItem);
int SioWeaponSelectMenu_Draw(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 SioMenu_OnBPress(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 SioMenu_OnRPress(struct MenuProc * menu);
int MultiBootSend(struct MultiBootParam * mp, u16 data);;
int MultiBootCheckComplete(struct MultiBootParam * mp);;
int MultiBootHandShake(struct MultiBootParam * mp);;
void MultiBootStartProbe(struct MultiBootParam * mp);;
void MultiBootWaitSendDone(void);;
void MultiBootInit(struct MultiBootParam * mp);
int MultiBootMain(struct MultiBootParam * mp);
int MultiBootSend(struct MultiBootParam * mp, u16 data);
void MultiBootStartProbe(struct MultiBootParam * mp);
void MultiBootStartMaster(struct MultiBootParam * mp, const u8 * srcp, int length, u8 palette_color, s8 palette_speed);
int MultiBootCheckComplete(struct MultiBootParam * mp);
int MultiBootHandShake(struct MultiBootParam * mp);
void MultiBootWaitCycles(u32 cycles);
void MultiBootWaitSendDone(void);

extern u8 gUnk_Sio_0[];
extern struct Text gUnk_Sio_1[];
extern s16 gUnk_Sio_2[];
extern s16 * gUnk_Sio_3;
extern s16 * gUnk_Sio_4;
extern s16 * gUnk_Sio_5;

extern struct Font Font_Sio_0;
// extern ??? gLinkArenaSt
// extern ??? gUnknown_0203DA30
extern struct Text gUnk_Sio_6;
extern struct Text gUnk_Sio_7[];
extern struct Text Texts_0;
extern u8 gUnk_Sio_8[];
extern char gUnk_Sio_9[][15];

extern struct Text Texts_1[10];
extern struct Text gUnk_Sio_10[];
extern struct Font Font_0;
// extern ??? gLinkArenaTeamList
extern struct MultiArenaRankingEnt gSioResultRankings[];
// extern ??? gUnk_Sio_11
extern struct Text gSioTexts[];
extern struct Text Text_0;
extern s8 gUnk_Sio_12;
extern int gUnk_Sio_13;
extern u16 gKeyInputSequenceBuffer[];
extern int gKeyInputSequenceTimer;
// extern ??? gUnk_Sio_14
extern int gUnk_Sio_15;
// extern ??? gUnk_Sio_16
// extern ??? gUnk_Sio_17
// extern ??? gUnk_Sio_18
// extern ??? gUnk_Sio_19
// extern ??? gUnk_Sio_21
extern s8 gUnk_Sio_22;

extern const s16 SioTacticianIndexMap[];
extern const int gLinkArenaStatusMsg[];
extern u8 const gSioMain2_0[];
extern s8 const gSioMain2_1[];
extern u16 const Sprite_SioMain2_0[];
extern u16 const Sprite_SioMain2_1[];
extern u16 const Sprite_SioMain2_2[];
extern u16 const Sprite_SioMain2_3[];
extern u16 const Sprite_SioMain2_4[];
extern u16 const Sprite_SioMain2_5[];
extern u16 const Sprite_SioMain2_6[];
extern u16 const Sprite_SioMain2_7[];
extern u16 const Sprite_SioMain2_8[];
extern u16 const Sprite_SioMain2_9[];
extern u16 const Sprite_SioMain2_10[];
extern u16 const Sprite_SioMain2_11[];
extern s16 const gSioPostbattle_0[5][4];
extern const u8 gSioPostbattle_1[3];
// extern ??? gLinkArenaRuleData

// extern ??? linkMenuMsgLut
// extern ??? gSioMenu_0

// extern ??? gUnknown_080D9F18
// extern ??? gUnknown_080D9F20
extern const u8 gSioPoints_0[][4];
extern const u8 gSioPoints_1[][4];
extern const struct Vec2 gSioPoints_2[];
// extern ??? gSioPoints_3
// extern ??? sLinkArenaUnitMoveOutMoveScriptLut
// extern ??? sLinkArenaUnitMoveOutPositionOffsets
// extern ??? gSioBattlemap_0
// extern ??? sLinkArenaAttackerMoveUpScript
// extern ??? sLinkArenaCombatantMoveRightScript
// extern ??? Sprite_LinkArenaBButton
// extern ??? SioDefaultBgConfig
// extern ??? gSioUiutils_0
// extern ??? sioMenuItemGlowLut
// extern ??? Sprite_LinkArena_PressStart
// extern ??? sLinkArenaSideMenuGlowPalIndexLut
// extern ??? Sprite_NameEntry_PositionIndicator
// extern ??? Sprite_SioMenuBurst_TopLeft
// extern ??? Sprite_SioMenuBurst_TopRight
// extern ??? Sprite_SioMenuBurst_BottomLeft
// extern ??? Sprite_SioMenuBurst_BottomRight
// extern ??? gSioUiutils_1
// extern ??? sLinkArenaPhaseIntroFactionImgLut
// extern ??? sLinkArenaPhaseIntroFactionPalLut
// extern ??? sLinkArenaPhaseIntroPhaseChangePalLut
// extern ??? Sprite_SioUiutils_0
// extern ??? Sprite_SioUiutils_1
// extern ??? Sprite_SioUiutils_2
// extern ??? Sprite_LinkArena_ChoiceBanner

extern struct ProcCmd ProcScr_DebugMonitor[];
extern struct ProcCmd ProcScr_SIOTERM[];
extern struct ProcCmd ProcScr_SIOPRA[];
extern struct ProcCmd ProcScr_SIOBAT[];
extern struct ProcCmd ProcScr_SIORESULT[];
extern struct ProcCmd ProcScr_SIO_RuleSettings[];

extern CONST_DATA struct ProcCmd ProcScr_SIOCON[];
extern CONST_DATA struct ProcCmd ProcScr_SIOVSYNC[];
extern CONST_DATA struct ProcCmd ProcScr_SIOMAIN[];
extern CONST_DATA u8 * gpSioUnkBuffer;
extern CONST_DATA struct ProcCmd gSioMain_0[];
extern CONST_DATA struct ProcCmd ProcScr_HOLD[];
extern CONST_DATA u16 gSioList_SioMain2_1[];
extern CONST_DATA u16 gSioList_SioMain2_2[];
// extern ??? gSioTeamListConfigLut
extern CONST_DATA struct ProcCmd ProcScr_SioTeamList[];
extern CONST_DATA struct ProcCmd ProcScr_TacticianNameSelection[];
// extern ??? SpriteArray_SioPostbattle_0
// extern ??? SpriteArray_SioPostbattle_1
// extern ??? ProcScr_LinkArenaPostBattle_DrawSprites
// extern ??? ProcScr_SioPostBattle_PlayMusic
extern CONST_DATA struct FaceVramEntry gSioPostbattle_2[];
extern CONST_DATA struct MultiArenaSaveTeam * gSioPostbattle_3;
// extern ??? ProcScr_SIORESULT_NewHighScore
// extern ??? FaceConfig_SioMenu_0
// extern ??? FaceConfig_SioMenu_1
// extern ??? ProcScr_SIOMENU
// extern ??? EventScr_EraseSaveInfo
// extern ??? gSioBattlemap_1
// extern ??? gSioBattlemap_2
// extern ??? gSioBattlemap_3
// extern ??? gSioBattlemap_4
// extern ??? gSioBattlemap_5
// extern ??? gLut_LinkArenaFogPlaceholder_YOffset
extern struct ProcCmd CONST_DATA ProcScr_DrawLinkArenaFogPlaceholders[];
extern struct ProcCmd CONST_DATA ProcScr_LASurrender_HandleUnitDeaths[];
// extern ??? EventScr_LinkArenaSurrenderPrompt
// extern ??? EventScr_LinkArenaNoDamagePrompt
extern struct ProcCmd CONST_DATA gSioBattlemap_6[];
extern CONST_DATA struct ProcCmd gSioBattlemap_7[];
extern CONST_DATA struct ProcCmd gSioBattlemap_8[];
// extern ??? ProcScr_SIOMAIN
// extern ??? gSioBat_0
extern struct ProcCmd CONST_DATA ProcScr_Sio804B920_0[];
extern struct ProcCmd CONST_DATA ProcScr_Sio804B920_1[];
extern u16 * CONST_DATA PalArray_SolidColors[];
extern struct ProcCmd CONST_DATA ProcScr_SioMu_0[];
extern u8 CONST_DATA gSioMu_0[];
extern struct ProcCmd CONST_DATA ProcScr_SIOWARP[];
extern struct ProcCmd CONST_DATA ProcScr_SIOWARPFX[];
extern struct ProcCmd CONST_DATA ProcScr_SioWarpFxPartial[];
extern struct ProcCmd CONST_DATA ProcScr_LAButtonSpriteDraw[];
extern u16 CONST_DATA Sprite_LinkArena_MenuTitle[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaTitleBanner[];
extern const u16 * CONST_DATA SpriteArray_SioMenuItems[];
extern const u16 * CONST_DATA SpriteArray_SioMenuTeamCount[];
extern struct ProcCmd CONST_DATA ProcScr_SioMenuItem[];
extern u16 CONST_DATA Sprite_LinkArena_TeamName[];
extern u16 CONST_DATA Sprite_SioUiutils_3[];
extern u16 CONST_DATA Sprite_SioUiutils_4[];
extern u16 CONST_DATA gSioUiutils_2[];
extern u16 * CONST_DATA gSioUiutils_3[];
extern u16 Sprite_LinkArena_NameBanner[]; // sprite
extern u16 CONST_DATA gSioUiutils_4[];
extern struct ProcCmd CONST_DATA ProcScr_SioUiutils_0[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaTeamSpriteDraw[];
extern const u16 * CONST_DATA SpriteArray_NameEntryCursor[];
extern const u16 * CONST_DATA SpriteArray_NameEntryIcons[];
extern struct ProcCmd CONST_DATA ProcScr_NameEntrySpriteDraw[];
extern const u16 * CONST_DATA SpriteArray_RuleSettingIcons[];
extern struct ProcCmd CONST_DATA ProcScr_RuleSettingSpriteDraw_Interactive[];
extern struct ProcCmd CONST_DATA ProcScr_RuleSettingSpriteDraw_Static[];
extern struct ProcCmd CONST_DATA ProcScr_SioMenuBurstFx[];
extern u16 CONST_DATA Sprite_LAMenuScrollBar_UpArrow[];
extern u16 CONST_DATA Sprite_LAMenuScrollBar_DownArrow[];
extern u16 CONST_DATA Sprite_LinkArenaMenuScrollBar[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaMenuScrollBar[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaPhaseIntro[];
extern const u16 * CONST_DATA SpriteArray_LAVersusPlayerNumbers[];
extern struct ProcCmd CONST_DATA ProcScr_LAVersusSpriteDraw[];
extern struct ProcCmd CONST_DATA ProcScr_SioUiutils_1[];
extern struct MenuDef gSioMenudef_1;
extern u8 Img_LinkArenaMenuTitle[];
extern u8 Img_LinkArenaMenu[];
extern u8 Img_TacticianSelObj[];
extern u8 Img_LinkArenaMenuBanner[]; // img
extern u8 Img_LinkArenaRankIcons[]; // img
extern u8 Img_LinkArenaActiveBannerFx[]; // img
extern u8 Img_SioResultBanner[]; // img
extern u8 Img_LinkArenaPlacementRanks[]; // img
extern u8 Img_SioPointsBox[];
extern u8 Img_LinkArena_FogUnitPlaceholder[]; // img
extern u8 Img_LinkArenaPlayerBanners[]; // img
extern u16 Pal_LinkArenaMenu[];
extern u16 Pal_TacticianSelObj[];
extern u16 Pal_LinkArenaRankIcons[]; // pal
extern u16 Pal_SioPointsBox[]; // pal
extern u16 Pal_LinkArenaPlacementRanks[]; // pal
extern u16 Pal_SioSideMenuGlow[];
extern u16 Pal_LinkArenaActiveBannerFx[]; // pal
extern u16 Pal_SioNameEntryGlow[];
extern u16 Pal_SioNameBannerGlow[];
extern u16 Pal_TacticianNameInputBg[];
extern u8 gTsa_LinkArenaPostBattleRankingRowHighlight[]; // tsa?
extern u8 Tsa_SioTeamList[]; // tsa
extern u16 Tsa_TacticianNameInputBg[];
extern u8 Tsa_SioResultRankings[]; // tsa
extern u8 Tsa_SioRuleSettings[]; // tsa
extern u8 Img_LinkArenaPhaseIntroBg[];
extern u8 Img_LinkArenaPhaseIntroPlayer[];
extern u8 Img_LinkArenaPhaseIntroOther[];
extern u8 Img_LinkArenaPhaseIntroEnemy[];
extern u8 Img_LinkArenaPhaseIntro4[];
extern u16 Pal_LinkArenaPhaseIntroPlayer[];
extern u16 Pal_LinkArenaPhaseIntroEnemy[];
extern u16 Pal_LinkArenaPhaseIntroOther[];
extern u16 Pal_LinkArenaPhaseIntro4[];
extern u8 Img_LinkArenaPostBattleBg[]; // img
extern u16 Pal_LinkArenaPostBattleBg[]; // pal
extern u8 Tsa_LinkArenaPostBattleBg[]; // tsa
extern u8 Img_LinkArenaTitleBanner[];
extern CONST_DATA u8 Tsa_LinkArenaTitleBanner[];

extern int gCurrentKeyInSeqIndex;
extern int gTargetKeyInSeqIndex;
extern u8 gUnk_41;
extern u8 gUnk_42[];
extern struct Vec2 gUnk_43;
extern int gUnk_44;
extern u8 gUnk_45[];
extern struct MuProc * gUnk_46[];
extern u16 gUnk_47[];
extern u8 gUnk_48[];
extern int gUnk_49;
extern u16 gUnk_50[MULTIBOOT_NCHILD];
extern char gUnk_74[];
extern struct SioMessage gUnk_73;
