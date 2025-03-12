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

struct SioUnknown_0203DD90
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

extern struct SioUnknown_0203DD90 gUnk_Sio_0203DD90;

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
void sub_8042EA8(void);

struct Proc_Sio_085A93A0 {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x58);

    /* 38 */ u32 timer;
};

void sub_8042EB4(struct Proc_Sio_085A93A0 * proc);
void sub_8042EF0(struct Proc_Sio_085A93A0 * proc);
void sub_8042F44(void);
void sub_8042F58(ProcPtr proc);
void sub_8042F84(void);
void sub_8042F98(ProcPtr proc);

struct ProcSioHold {
    PROC_HEADER;

    int x;
    int y, y_min, y_max;
};

void SioHold_Loop(struct ProcSioHold * proc);
ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min);
void EndSioHold(void);
void sub_804303C(ProcPtr proc, int num);
void ClearSioBG(void);
void sub_804309C(void);
void sub_8043100(int, int);
void sub_8043164(void);
void sub_80431B4(struct Unit * unit);
void SioPlaySoundEffect(int);
void sub_8043244(void);
bool IsKeyInputSequenceComplete(const u16 * list);
bool sub_80432F4(void);

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

int sub_80437C0(u8, struct SioTeamListProc *);;
bool CanBuildNewLinkArenaTeam(void);;
bool sub_8043394(void);;
void StartLinkArenaTeamList(ProcPtr parent);
void SioTeamList_Init(struct SioTeamListProc * proc);
bool CanBuildNewLinkArenaTeam(void);
bool sub_8043394(void);
int sub_80433C0(int activeOption, u8 mode);
void DrawLinkArenaTeamName(int idx);
void sub_804352C(struct SioTeamListProc * proc);
void sub_8043548(struct SioTeamListProc * proc, u8 mode);
void SioTeamList_EraseTeam(struct SioTeamListProc * proc);
void SioTeamList_SwapTeams(struct SioTeamListProc * proc);
int sub_80437C0(u8 mode, struct SioTeamListProc * proc);
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc);
void SioTeamList_SetupGfx(struct SioTeamListProc * proc);
void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total);
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc);
void SioTeamList_StartUnitList(struct SioTeamListProc * proc);
void SioTeamList_WaitForUnitListScreen(ProcPtr proc);
int sub_8043D5C(void);
void SioTeamList_8043D8C(struct SioTeamListProc * proc);
void sub_8044280(struct SioProc85AAA78 * proc, s8 b);
void SioTeamList_804429C(struct SioTeamListProc * proc);
void SioTeamList_8044324(struct SioTeamListProc * proc);
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc);
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc);
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc);

void sub_8044560(struct ProcTactician * proc, u8 * str_buf);
void sub_8044614(struct ProcTactician * proc);
void TacticianDrawCharacters(struct ProcTactician * proc);
int StrLen(u8 * buf);
void Tactician_InitScreen(struct ProcTactician * proc);
void SioUpdateTeam(char * str, int team);
void Tactician_MoveHand(struct ProcTactician * proc, int idx, const struct TacticianTextConf * conf);
void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf);
bool sub_8044B78(struct ProcTactician * proc, const struct TacticianTextConf * conf, u32 c, int d);
void Tactician_LoopCore(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void Tactician_Loop(struct ProcTactician * proc);
void sub_8044F84(void);
void sub_8044FE4(struct ProcTactician * proc);
void sub_8044FFC(struct ProcTactician * proc);
void sub_804503C(struct ProcTactician * proc);
void sub_8045068(struct ProcTactician * proc);
void NameSelect_DrawName(struct ProcTactician * proc);
void sub_8045108(struct ProcTactician * proc);
void sub_80451F0(void);

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
void sub_80454E4(struct SioPostBattleProc * proc);
void sub_804556C(struct SioPostBattleProc * proc);
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

int sub_8045930(u8 ranking, u32 playerCount, u32 mode, u32 points);
void sub_8045A64(struct SioBatProc * proc);
void sub_8045AF4(void);
void New6C_SIOMAIN2(void);
void sub_8045C28(ProcPtr proc);
void sub_8045C68(const char * str, int x, int y, ProcPtr parent);
void sub_8045CBC(void);
void sub_8045CE0(void);
void sub_8045CEC(void);
void sub_8045DC0(struct SioBatProc * proc);
void sub_8045F00(ProcPtr proc);
void sub_8045F48(struct SioBatProc * proc);
void sub_804619C(struct SioBatProc * proc);
void sub_8046234(struct SioBatProc * proc);
void sub_80462D4(struct SioBatProc * proc);
void sub_80463A8(struct SioBatProc * proc);
void sub_804645C(void);
void sub_8046478(struct Unit * unit);
void sub_80464B0(struct SioBatProc * proc);
void sub_8046580(struct SioBatProc * proc);
void sub_8046704(struct SioBatProc * proc);
void sub_80467AC(struct SioBatProc * proc);
void sub_8046838(ProcPtr proc);
void sub_80469AC(void);
void sub_80469B8(void);

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

void sub_80469C4(struct SioTermProc * proc);
void sub_8046C64(int * cur, u8 bottom, u8 top, int * buf, u8 total);
void sub_8046CF0(struct SioTermProc * proc);
void sub_8046D6C(struct SioTermProc * proc);
void sub_8046DB4(ProcPtr proc);
void sub_8046DD0(ProcPtr proc);
void sub_8046DEC(ProcPtr proc);
void sub_8046E0C(ProcPtr proc);
void sub_8046E4C(void);

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
u8 sub_8047308(int var);
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
void sub_80476CC(int idx, int state);
void SioRuleSettings_Init(struct ProcSioRuleSettings * proc);
void SioRuleSettings_Loop_Main(struct ProcSioRuleSettings * proc);

struct SioProc85AA9C0
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 xBase;
    /* 2C */ s16 yBase;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u16 unk_36;
    /* 38 */ u16 unk_38;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 unk_3c;
    /* 3E */ u8 unk_3e;
};

struct SioMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85AA9C0 * unk_2c[5];
    /* 40 */ u8 unk_40[4];
    /* 44 */ s8 unk_44;
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
    /* 58 */ s8 unk_58;
    /* 59 */ s8 unk_59;
};

int sub_8047A54(struct SioMenuProc * proc, int lineNum);
bool CheckSomethingSaveRelated(void);
void SioMenu_Init(void);
void SioMenu_LoadGraphics(struct SioMenuProc * proc);
void SioMenu_8047C60(struct SioMenuProc * proc);
void sub_8047CF0(struct SioMenuProc * proc);
void SioMenu_RestartGraphicsMaybe(struct SioMenuProc * proc);
void SioMenu_HandleDPadInput(struct SioMenuProc * proc, u8 b);
void SioMenu_Loop_HandleKeyInput(struct SioMenuProc * proc);
void SioMenu_80480B4(struct SioMenuProc * proc);
void SioMenu_End(struct SioMenuProc * proc);
void StartLinkArenaMainMenu(ProcPtr parent);

void sub_8048260(ProcPtr parent);
void StartTacticianNameSelect(ProcPtr parent);
bool XMapTransfer_80482E0(ProcPtr proc);
void XMapTransfer_80483F8(ProcPtr proc);
void XMapTransfer_8048418(ProcPtr proc);
bool XMapTransfer_8048460(ProcPtr proc);
void PutXMapProgressPercent(struct Text * th, const char * str, int number);
void DrawXMapSendProgress(struct SioBigSendProc * proc);
void DrawXMapReceiveProgress(struct SioBigReceiveProc * proc);
void StartXMapTransfer(struct SioBigSendProc * proc);
bool XMapTransfer_AwaitCompletion(void);
void sub_80486D4(void);
bool sub_80486E8(void);
void XMapTransfer_8048730(void);
void sub_804879C(void);
void sub_80487C0(struct Proc * proc);
void sub_804881C(void);
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

void sub_8048864(void);
void sub_8048884(struct SioProc85A971C_Unk44 * buf);
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
s8 sub_80490EC(int x, int y, const char * str, u8 flag, ProcPtr parent);
void sub_8049238(ProcPtr proc);
void sub_804926C(ProcPtr proc);

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

void sub_8049298(struct Unit * unit);
void sub_80492B8(struct Unit * unit);
void sub_80492D8(void);
void sub_80492E8(int faction);
void sub_804933C(void);
u16 sub_8049350(u8 a, u8 b, u8 c, u8 d);
int sub_80493A8(u8 target);
void sub_80493D0(u8 a, int b, u8 * c, int * xOut, int * yOut);
void sub_80494D4(void);
void sub_80494F0(void);
void sub_8049594(void);
void sub_80495F4(void);
void sub_80496A4(void);
void sub_804970C(void);
void sub_8049744(void);
void sub_8049788(void);
void sub_80497A0(void);
void sub_80497CC(void);
void sub_8049828(void);
void sub_80498F4(void);
void sub_8049940(ProcPtr proc);
void sub_8049964(ProcPtr parent);
void sub_80499D0(ProcPtr proc);
int sub_8049A60(void);
void sub_8049B04(void);
void sub_8049B24(u16 keys, s8 flag);
void sub_8049C18(void);
bool sub_8049C94(struct Unit * unit);
void sub_8049CD4(ProcPtr proc);
void sub_8049D0C(ProcPtr proc);
void sub_8049D24(struct SioBattleMapProc * proc);
void sub_8049F38(ProcPtr unused);
void sub_8049F44(struct SioBattleMapProc * proc);
void sub_804A108(struct SioProc85AA1AC * proc);
void sub_804A158(struct SioProc85AA1AC * proc);
void sub_804A1D0(struct SioProc85AA1AC * proc);
void sub_804A298(struct SioProc85AA1AC * proc);
void sub_804A3A8(ProcPtr proc);
void sub_804A430(ProcPtr parent);
void sub_804A44C(struct SioBattleMapProc * proc);
void sub_804A51C(struct SioBattleMapProc * proc);
void sub_804A5A4(void);
void sub_804A614(ProcPtr proc);
void sub_804A6A4(ProcPtr proc);
void sub_804A7C0(ProcPtr proc);
void sub_804A914(void);
void sub_804A9A4(ProcPtr proc);
void sub_804AA88(void);
void sub_804AAA4(void);
bool sub_804AADC(void * data);

struct SioProc85AA4CC
{
    PROC_HEADER;
    int unk_2c;
    int unk_30;
    int unk_34;
    int unk_38;
};

void sub_804AAFC(struct SioProc85AA4CC * proc);
bool sub_804ABB4(void * data);
void sub_804ABCC(struct SioProc85AA4CC * proc);
void sub_804AC68(struct Unit * unit, int idx, int * xOut, int * yOut);
bool sub_804ACAC(void * data);
void sub_804ACC4(struct SioProc85AA4CC * proc);
int sub_804ADA0(struct Unit * unit);
int sub_804AE08(int playerId);
bool sub_804AE7C(struct SioBattleMapProc * proc, int b);
void sub_804AEC4(ProcPtr proc);
int ITEMRANGEDONE_sub_804AF2C(int unused, struct Unit * unit);
void sub_804AF5C(struct SioBattleMapProc * proc);
void sub_804B190(ProcPtr proc);
void sub_804B1C0(struct SioProc85AA4CC * proc);
void sub_804B250(ProcPtr proc);
void sub_804B278(void);
void sub_804B38C(void);
void sub_804B3A0(void);
void sub_804B3B0(ProcPtr proc);
void sub_804B3D0(ProcPtr proc);
void sub_804B408(ProcPtr proc);
void sub_804B43C(struct SioBattleMapProc * proc);
void sub_804B480(struct SioBattleMapProc * proc);
void sub_804B518(ProcPtr proc);
void sub_804B554(struct SioBattleMapProc * proc);
void sub_804B5E0(ProcPtr proc);
void sub_804B604(struct SioBattleMapProc * proc);
void sub_804B624(struct SioBattleMapProc * proc);
void sub_804B6AC(struct SioBattleMapProc * proc);
void sub_804B6B8(void);
void sub_804B6CC(void);
void sub_804B6F4(void);
void sub_804B708(void);
void sub_804B71C(struct SioBattleMapProc * proc);
void sub_804B76C(struct SioBattleMapProc * proc);
void sub_804B7E4(ProcPtr proc);
void sub_804B800(void);
void sub_804B850(struct SioBattleMapProc * proc);
void sub_804B8D0(void);
void Set_0203DDDC(void);
void Clear_0203DDDC(void);

struct SioProc85AA7B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x64);
    /* 64 */ s16 unk_64;
};

void Set_0203DDDC(void);
void Clear_0203DDDC(void);
void sub_804B938(void);
void sub_804B964(void);
void sub_804B9A4(void);
void sub_804B9BC(void);
void sub_804B9E4(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k);
void sub_804BB54(struct SioProc85AA7B4 * proc);
void sub_804BBA0(struct SioProc85AA7B4 * proc);
void sub_804BC3C(void);
void sub_804BC84(u16 a, ProcPtr parent);
void sub_804BD2C(ProcPtr parent);
void sub_804BD3C(struct SioProc85AA7B4 * proc);
void sub_804BDD8(void);
void sub_804BDFC(u16 a, ProcPtr parent);
void sub_804BE88(ProcPtr parent);
void sub_804BE98(ProcPtr proc);
void sub_804BEB8(ProcPtr proc);

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

void sub_804BED8(struct MuProc * muProc, int kind);
void sub_804BF30(struct SioProc85AA83C * proc);
void StartLinkArenaMUDeathFade(struct MuProc * muProc);
void sub_804BFAC(struct MuProc * muProc, int palIdx);
void sub_804BFF8(struct MuProc * muProc);
void SioWarp_Init(struct SioWarpProc * proc);
void SioWarp_Loop(struct SioWarpProc * proc);
void SioWarp_End(void);
void SioWarpFx_StartSioWarp(struct SioWarpProc * parent);
void SioWarpFx_804C178(struct SioWarpProc * proc);
void SioWarpFx_HideMoveUnit(struct SioWarpProc * proc);
void SioWarpFx_SetMUPosition(struct SioWarpProc * proc);
void SioWarpFx_ShowMoveUnit(struct SioWarpProc * proc);
void SioWarpFx_804C1D8(struct SioWarpProc * proc);
void SioWarpFx_AwaitSioWarp(ProcPtr proc);
ProcPtr StartSioWarpFx(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent);
ProcPtr sub_804C260(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent);
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
void sub_804C3A0(int unusedA, int unusedB);
void sub_804C3A4(int unused);
void nullsub_13(void);
void sub_804C3AC(u8 * src, u8 * dst, int c, int d);
void LATitleBanner_Init(struct LinkArenaTitleBannerProc * proc);
void LATitleBanner_Loop(void);
void StartLinkArenaTitleBanner(ProcPtr parent, int size, int chr);
void sub_804C4F8(void);
void sub_804C508(void);
void sub_804C558(void);
void sub_804C590(void);
void sub_804C5A4(u8 idx);
void sub_804C5F8(struct SioProc85AA9C0 * proc);
ProcPtr sub_804C758(ProcPtr parent, u8 xBase, u8 yBase, u8 d, u8 e);
void sub_804C7C8(struct SioProc85AA9C0 * proc, int b, int c, int d, int e);
void sub_804C7DC(struct SioProc85AA9C0 * proc, s16 x, s16 y);
void sub_804C7E4(void);
void sub_804C83C(void);
void sub_804C894(struct SioProc85AAA78 * proc);
ProcPtr sub_804CAEC(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf);

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
void sub_804D3F0(struct Unit * unit, int itemSlot);
void sub_804D40C(struct Unit * unit);
void sub_804D428(void);

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
void sub_804D6D4(void);
void sub_804D724(void);
void sub_804D778(void);

struct SioProc85AABD8
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
};

void sub_804D7B0(struct SioProc85AABD8 * proc);
ProcPtr sub_804D7DC(int x, int y, ProcPtr parent);
void sub_804D80C(void);
void PutLinkArenaChoiceBannerSprite(int x, int y);

u8 sub_804D858(const struct MenuItemDef * def, int number);
u8 sub_804D8A4(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 sub_804D8C8(struct MenuProc * menu, struct MenuItemProc * menuItem);
int sub_804D8DC(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 sub_804D940(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 sub_804D950(struct MenuProc * menu);
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

extern u8 gUnk_Sio_02000000[];
extern struct Text gUnk_Sio_02000C78[];
extern s16 gUnk_Sio_02000F00[];
extern s16 * gUnk_Sio_02001180;
extern s16 * gUnk_Sio_02001184;
extern s16 * gUnk_Sio_02001188;

extern struct Font Font_Sio_02000C60;
// extern ??? gLinkArenaSt
// extern ??? gUnknown_0203DA30
extern struct Text gUnk_Sio_0203DA78;
extern struct Text gUnk_Sio_0203DA88[];
extern struct Text Texts_0203DAB0;
extern u8 gUnk_Sio_0203DAC0[];
extern char gUnk_Sio_0203DAC5[][15];

extern struct Text Texts_0203DB14[10];
extern struct Text gUnk_Sio_0203DB1C[];
extern struct Font Font_0203DB64;
// extern ??? gLinkArenaTeamList
extern struct MultiArenaRankingEnt gSioResultRankings[];
// extern ??? gUnk_Sio_0203DC48
extern struct Text gSioTexts[];
extern struct Text Text_0203DB14;
extern s8 gUnk_Sio_0203DD24;
extern int gUnk_Sio_0203DD28;
extern u16 gKeyInputSequenceBuffer[];
extern int gKeyInputSequenceTimer;
// extern ??? gUnk_Sio_0203DD50
extern int gUnk_Sio_0203DD8C;
// extern ??? gUnk_Sio_0203DD90
// extern ??? gUnk_Sio_0203DD94
// extern ??? gUnk_Sio_0203DD95
// extern ??? gUnk_Sio_0203DD9A
// extern ??? gUnk_Sio_0203DDB4
extern s8 gUnk_Sio_0203DDDC;

extern const s16 SioTacticianIndexMap[];
extern const int gLinkArenaStatusMsg[];
extern u8 const gUnknown_080D9D5E[];
extern s8 const gUnknown_080D9D61[];
extern u16 const Sprite_080D9D6E[];
extern u16 const Sprite_080D9D76[];
extern u16 const Sprite_080D9D7E[];
extern u16 const Sprite_080D9D86[];
extern u16 const Sprite_080D9D8E[];
extern u16 const Sprite_080D9DA2[];
extern u16 const Sprite_080D9DC2[];
extern u16 const Sprite_080D9DD6[];
extern u16 const Sprite_080D9DE4[];
extern u16 const Sprite_080D9DF2[];
extern u16 const Sprite_080D9E06[];
extern u16 const Sprite_080D9E0E[];
extern s16 const gUnknown_080D9E1C[5][4];
extern const u8 gUnknown_080D9E44[3];
// extern ??? gLinkArenaRuleData

// extern ??? gUnknown_080D9EC8
// extern ??? gUnknown_080D9EF0

// extern ??? gUnknown_080D9F18
// extern ??? gUnknown_080D9F20
extern const u8 gUnknown_080D9F28[][4];
extern const u8 gUnknown_080D9F38[][4];
extern const struct Vec2 gUnknown_080D9F48[];
// extern ??? gUnknown_080D9F98
// extern ??? gUnknown_080D9FA0
// extern ??? gUnknown_080D9FA8
// extern ??? gUnknown_080D9FB0
// extern ??? gUnknown_080D9FB5
// extern ??? gUnknown_080D9FB7
// extern ??? Sprite_LinkArenaBButton
// extern ??? SioDefaultBgConfig
// extern ??? gUnknown_080DA09C
// extern ??? gUnknown_080DA0DA
// extern ??? Sprite_LinkArena_PressStart
// extern ??? gUnknown_080DA102
// extern ??? Sprite_NameEntry_PositionIndicator
// extern ??? Sprite_SioMenuBurst_TopLeft
// extern ??? Sprite_SioMenuBurst_TopRight
// extern ??? Sprite_SioMenuBurst_BottomLeft
// extern ??? Sprite_SioMenuBurst_BottomRight
// extern ??? gUnknown_080DA1CA
// extern ??? gUnknown_080DA20C
// extern ??? gUnknown_080DA21C
// extern ??? gUnknown_080DA22C
// extern ??? Sprite_080DA25C
// extern ??? Sprite_080DA26A
// extern ??? Sprite_080DA27E
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
extern CONST_DATA struct ProcCmd gUnknown_085A93A0[];
extern CONST_DATA struct ProcCmd ProcScr_HOLD[];
extern CONST_DATA u16 gSioList_085A93E0[];
extern CONST_DATA u16 gSioList_085A93F0[];
// extern ??? gSioTeamListConfigLut
extern CONST_DATA struct ProcCmd ProcScr_SioTeamList[];
extern CONST_DATA struct ProcCmd ProcScr_TacticianNameSelection[];
// extern ??? SpriteArray_085A96D4
// extern ??? SpriteArray_085A96E4
// extern ??? ProcScr_LinkArenaPostBattle_DrawSprites
// extern ??? ProcScr_SioPostBattle_PlayMusic
extern CONST_DATA struct FaceVramEntry gUnknown_085A9864[];
extern CONST_DATA struct MultiArenaSaveTeam * gUnknown_085A9884;
// extern ??? ProcScr_SIORESULT_NewHighScore
// extern ??? FaceConfig_085A9E48
// extern ??? FaceConfig_085A9E68
// extern ??? ProcScr_SIOMENU
// extern ??? EventScr_EraseSaveInfo
// extern ??? gUnknown_085AA158
// extern ??? gUnknown_085AA15C
// extern ??? gUnknown_085AA1AC
// extern ??? gUnknown_085AA1FC
// extern ??? gUnknown_085AA21C
// extern ??? gUnknown_085AA22C
extern struct ProcCmd CONST_DATA gUnknown_085AA24C[];
extern struct ProcCmd CONST_DATA gUnknown_085AA26C[];
// extern ??? gUnknown_085AA2B4
// extern ??? gUnknown_085AA2D8
extern struct ProcCmd CONST_DATA gUnknown_085AA2FC[];
extern CONST_DATA struct ProcCmd gUnknown_085AA4CC[];
extern CONST_DATA struct ProcCmd gUnknown_085AA5BC[];
// extern ??? ProcScr_SIOMAIN
// extern ??? gUnknown_085AA75C
extern struct ProcCmd CONST_DATA ProcScr_085AA7B4[];
extern struct ProcCmd CONST_DATA ProcScr_085AA7EC[];
extern u16 * CONST_DATA PalArray_SolidColors[];
extern struct ProcCmd CONST_DATA ProcScr_085AA83C[];
extern u8 CONST_DATA gUnknown_085AA854[];
extern struct ProcCmd CONST_DATA ProcScr_SIOWARP[];
extern struct ProcCmd CONST_DATA ProcScr_SIOWARPFX[];
extern struct ProcCmd CONST_DATA ProcScr_SioWarpFxPartial[];
extern struct ProcCmd CONST_DATA ProcScr_LAButtonSpriteDraw[];
extern u16 CONST_DATA Sprite_LinkArena_MenuTitle[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaTitleBanner[];
extern const u16 * CONST_DATA SpriteArray_SioMenuItems[];
extern const u16 * CONST_DATA SpriteArray_SioMenuTeamCount[];
extern struct ProcCmd CONST_DATA ProcScr_085AA9C0[];
extern u16 CONST_DATA Sprite_LinkArena_TeamName[];
extern u16 CONST_DATA Sprite_085AA9E6[];
extern u16 CONST_DATA Sprite_085AA9FA[];
extern u16 CONST_DATA gUnknown_085AAA0E[];
extern u16 * CONST_DATA gUnknown_085AAA48[];
extern u16 Sprite_LinkArena_NameBanner[]; // sprite
extern u16 CONST_DATA gUnknown_085AAA5E[];
extern struct ProcCmd CONST_DATA ProcScr_085AAA78[];
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
extern struct ProcCmd CONST_DATA ProcScr_085AABD8[];
extern struct MenuDef gUnknown_085AADA0;
extern u8 gUnknown_085AAE0C[];
extern u8 Img_LinkArenaMenu[];
extern u8 Img_TacticianSelObj[];
extern u8 gUnknown_085AC604[]; // img
extern u8 Img_LinkArenaRankIcons[]; // img
extern u8 Img_LinkArenaActiveBannerFx[]; // img
extern u8 gUnknown_085ACEFC[]; // img
extern u8 Img_LinkArenaPlacementRanks[]; // img
extern u8 gUnknown_085AD80C[];
extern u8 gUnknown_085AD9CC[]; // img
extern u8 Img_LinkArenaPlayerBanners[]; // img
extern u16 Pal_LinkArenaMenu[];
extern u16 Pal_TacticianSelObj[];
extern u16 Pal_LinkArenaRankIcons[]; // pal
extern u16 gUnknown_085ADDA8[]; // pal
extern u16 Pal_LinkArenaPlacementRanks[]; // pal
extern u16 gUnknown_085ADDE8[];
extern u16 Pal_LinkArenaActiveBannerFx[]; // pal
extern u16 gUnknown_085ADE28[];
extern u16 gUnknown_085ADE48[];
extern u16 Pal_085ADE68[];
extern u8 gUnknown_085ADE88[]; // tsa?
extern u8 gUnknown_085ADF40[]; // tsa
extern u16 Tsa_085AE190[];
extern u8 Tsa_SioResultRankings[]; // tsa
extern u8 gUnknown_085AE778[]; // tsa
extern u8 gUnknown_085AE7EC[];
extern u8 gUnknown_085AEDD4[];
extern u8 gUnknown_085AEE90[];
extern u8 gUnknown_085AEF54[];
extern u8 gUnknown_085AF02C[];
extern u16 gUnknown_085AF0F0[];
extern u16 gUnknown_085AF110[];
extern u16 gUnknown_085AF130[];
extern u16 gUnknown_085AF150[];
extern u8 Img_LinkArenaPostBattleBg[]; // img
extern u16 Pal_LinkArenaPostBattleBg[]; // pal
extern u8 Tsa_LinkArenaPostBattleBg[]; // tsa
extern u8 gUnknown_085B0DE8[];
extern CONST_DATA u8 gUnknown_085B0F2C[];

extern int gCurrentKeyInSeqIndex;
extern int gTargetKeyInSeqIndex;
extern u8 gUnknown_03001810;
extern u8 gUnknown_03001818[];
extern struct Vec2 gUnknown_0300182C;
extern int gUnknown_03001830;
extern u8 gUnknown_03001834[];
extern struct MuProc * gUnknown_03001838[];
extern u16 gUnknown_03001840[];
extern u8 gUnknown_03001850[];
extern int gUnknown_03001860;
extern u16 gUnknown_03001864[MULTIBOOT_NCHILD];
extern char gUnknown_03004E86[];
extern struct SioMessage gUnknown_03004E80;
