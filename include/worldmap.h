#ifndef GUARD_WORLDMAP_H
#define GUARD_WORLDMAP_H

#include "proc.h"
#include "hardware.h"
#include "spline.h"
#include "ap.h"
#include "constants/worldmap.h"

enum worldmap_unit_alignace {
    WM_FACTION_BLUE  = 0,
    WM_FACTION_RED   = 1,
    WM_FACTION_GREEN = 2,
};

struct Unknown08206498
{
    /* 00 */ u16 unk_00;
    /* 02 */ STRUCT_PAD(0x02, 0x04);
    /* 04 */ u16 * pSpriteData;
    /* 08 */ s8 x;
    /* 09 */ s8 y;
    /* 0A */ STRUCT_PAD(0x0A, 0x0C);
};

struct GmRouteProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ u32 chr;
    /* 30 */ u8 pal;
    /* 31 */ u8 flags;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 bgA;
    /* 35 */ u8 bgB;
    /* 36 */ s8 x1;
    /* 37 */ s8 y1;
    /* 38 */ s8 x2;
    /* 39 */ s8 y2;
    /* 3A */ u8 bgPriority;
    /* 3C */ s16 unk_3c;
    /* 3E */ s16 unk_3e;
    /* 40 */ struct OpenPaths * pOpenPaths;
};

enum gm_route_flags {
    GM_ROUTE_FLAG_0 = 1 << 0,
    GM_ROUTE_FLAG_1 = 1 << 1,
    GM_ROUTE_FLAG_2 = 1 << 2,
    GM_ROUTE_FLAG_3 = 1 << 3,
    GM_ROUTE_FLAG_4 = 1 << 4,
    GM_ROUTE_FLAG_5 = 1 << 5,
    GM_ROUTE_FLAG_6 = 1 << 6,
    GM_ROUTE_FLAG_7 = 1 << 7,
};

struct GMapScreenVSyncCopyRequest
{
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
    /* 04 */ s8 unk_04;
    /* 05 */ s8 unk_05;
};

struct GMapScreenVSyncProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ u8 * unk_2c;
    /* 30 */ u16 * unk_30;
    /* 34 */ u8 * unk_34;
    /* 38 */ s16 unk_38;
    /* 3C */ struct GMapScreenVSyncCopyRequest * unk_3c;
    /* 40 */ u16 unk_40;
    /* 44 */ void * unk_44;
};

struct GmScreenProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 flags_0 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ s8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ s8 unk_2d;
    /* 2E */ s8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ s16 x;
    /* 36 */ s16 y;
    /* 38 */ u16 unk_38;
    /* 3A */ u16 unk_3a;
    /* 3C */ u8 * unk_3c;
    /* 40 */ u16 * unk_40;
    /* 44 */ u8 * unk_44;
    /* 48 */ struct GMapScreenVSyncProc * unk_48;
    /* 4C */ struct GmRouteProc * gmroute;
};

struct GmNodeIconDisplayProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ u32 chr;
    /* 30 */ u8 pal;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 skip : 1;
    /* 32 */ u8 merge_next_node : 1;
    /* 33 */ u8 nodeId;
    /* 34 */ u32 unk_34[1];
    /* 38 */ struct APHandle * ap;
    /* 3C */ struct GmScreenProc * pScreenProc;
};

enum
{
    GMAPUNIT_FLAG_DISPLAY   = (1 << 0),
    GMAPUNIT_FLAG_BLEND     = (1 << 1),
    GMAPUNIT_FLAG_UPDATEGFX = (1 << 2),
};

struct GMapUnitProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 flags;
    /* 2C */ u16 unk_2c; // AP obj priority node
    /* 2E */ u16 unk_2e;
    /* 30 */ int unk_30; // base tile index for SMS gfx?
    /* 34 */ s8 index; // within container proc
    /* 35 */ u8 faction;
    /* 36 */ u8 pal;
    /* 37 */ s8 animId;
    /* 38 */ u16 unk_38; // class initially
    /* 3A */ u16 unk_3a; // class initially
    /* 3C */ u16 x;
    /* 3E */ u16 y;
    /* 40 */ struct APHandle * ap;
};

struct GMapUnitContainerProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int layer;
    /* 30 */ u8 unk_30;
    /* 34 */ struct GMapUnitProc * pMapUnitProcs[7];
};

struct GmapCursorProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ u32 chr;
    /* 30 */ u8 pal;
    /* 31 */ u8 unk_31; // set to 0 on init and unreferenced
    /* 32 */ s8 unk_32;
    /* 33 */ s8 frameIdx;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ STRUCT_PAD(0x36, 0x37);
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u16 unk_48;

    /* 4C */ struct GmScreenProc * pScreenProc;
};

struct GMapMuPrimProc_Unk_34
{
    s8 a;
    s8 b;
    STRUCT_PAD(0x2, 0x4);
};

struct GMapMuPrimProc
{
    PROC_HEADER;
    u8 flags_0 : 1;
    u8 flags_1 : 1;
    u8 flags_2 : 1;
    u8 flags_3 : 1;
    u8 flags_4 : 1;
    u8 flags_5 : 1;
    s8 unk_2a;
    s8 unk_2b;
    u8 unk_2c;
    s8 unk_2d; // node ID?
    s8 unk_2e; // node ID?
    s8 unk_2f;
    u8 unk_30;
    s8 unk_31; // anim ID?
    s8 unk_32; // anim ID?
    struct GMapMuPrimProc_Unk_34 unk_34[3];
    s16 unk_40;
    s16 unk_42;
    u16 unk_44;
    u16 unk_46;
    s16 unk_48;
    s16 unk_4a;
    s16 unk_4c;
    s16 unk_4e;
    int unk_50;
    int unk_54;
};

struct GMapMuProc
{
    PROC_HEADER;
    struct GMapMuPrimProc * unk_2c[7];
};

// used as input to "GmMu_StartMoveBetweenNodes" in "worldmap_mapmu.c"
struct UnknownSub80BDEB4
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0a;
    /* 0C */ int unk_0c;
};

// used as input to "GmMu_StartMoveToPosition" in "worldmap_mapmu.c"
struct UnknownSub80BDFA4
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0a;
    /* 0C */ u16 unk_0c;
    /* 0E */ u16 unk_0e;
    /* 10 */ int unk_10;
};

struct GmapEffectProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 flags_0 : 1;
    /* 29 */ s8 flags_1 : 1;
    /* 2A */ s8 unk_2a;
    /* 2B */ s8 unk_2b_0 : 1;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 34 */ struct BlendCnt blendControl;
    /* 3C */ u8 blendCoeffA;
    /* 3D */ u8 blendCoeffB;
    /* 3E */ u8 blendY;
};

struct WorldMapMainProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 flags_0 : 1;
    /* 29 */ u8 flags_1 : 1;
    /* 29 */ u8 flags_2 : 1;
    /* 29 */ u8 flags_3 : 1;
    /* 29 */ u8 flags_4 : 1;
    /* 29 */ u8 flags_5 : 1;
    /* 29 */ u8 flags_6 : 1;
    /* 29 */ u8 flags_7 : 1;

    /* 2A */ s8 delay_timer;
    /* 2C */ int timer;
    /* 30 */ int scrolling;
    /* 34 */ STRUCT_PAD(0x34, 0x3a);

    /* 3A */ u16 unk_3a;
    /* 3C */ u16 unk_3c; // pad?
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ s8 unk_40;
    /* 41 */ s8 unk_41;
    /* 44 */ struct GmScreenProc * gm_screen; // GmapScreen
    /* 48 */ struct GmNodeIconDisplayProc * gm_icon; // GmNodeIconDisplay
    /* 4C */ struct GMapUnitContainerProc * gm_unitc; // Gmap Unit Container
    /* 50 */ struct GmapCursorProc * gm_cursor; // Gmap Cursor
    /* 54 */ ProcPtr gm_mu; // Gmap MU
};

#define GM_MAIN   ((struct WorldMapMainProc *)Proc_Find(ProcScr_WorldMapMain))

#define GM_SCREEN (GM_MAIN->gm_screen)
#define GM_ICON   (GM_MAIN->gm_icon)
#define GM_UNITC  (GM_MAIN->gm_unitc)
#define GM_CURSOR (GM_MAIN->gm_cursor)
#define GM_MU     (GM_MAIN->gm_mu)

struct GMapMovementPathData
{
    /* 00 */ int elapsedTime;
    /* 04 */ s16 x;
    /* 06 */ s16 y;
};

struct GMapPathData
{
    /* 00 */ u8 * gfxData;
    /* 04 */ s8 node[2];
    /* 08 */ const struct GMapMovementPathData * movementPath;
};

extern const struct GMapPathData gWMPathData[];

enum
{
    GMAP_NODE_PLACEMENT_PROGRESSION  = 0,
    GMAP_NODE_PLACEMENT_FRELIA       = 1,
    GMAP_NODE_PLACEMENT_MONSTERSPAWN = 2,
    GMAP_NODE_PLACEMENT_DUNGEON      = 3,
};

enum
{
    GMAP_ENCOUNTERS_NONE      = 1,
    GMAP_ENCOUNTERS_MONSTERS  = 2,
    GMAP_ENCOUNTERS_DUNGEON   = 3,
};

struct GMapNodeData
{
    /* 00 */ u8 placementFlag;
    /* 01 */ s8 encounters;
    /* 02 */ u8 iconPreClear;
    /* 03 */ u8 iconPostClear;
    /* 04 */ u8 chapteridx_eirika;  // chapter ID start
    /* 05 */ u8 chapteridx_ephram;  // chapter ID end
    /* 06 */ s16 unk_06; // event condition flag
    /* 08 */ s8 unk_08[4]; // next destination id
    /* 0C */ u16 * armory;
    /* 10 */ u16 * vendor;
    /* 14 */ u16 * secretShop;
    /* 18 */ s16 x;
    /* 1A */ s16 y;
    /* 1C */ u16 nameTextId;
    /* 1E */ u8 shipTravelFlag;
    /* 1F */ STRUCT_PAD(0x1F, 0x20);
};

extern const struct GMapNodeData gWMNodeData[];

struct NodeIcon
{
    /* 00 */ u16 sheetTileId;
    /* 02 */ STRUCT_PAD(0x2, 0x4);
    /* 04 */ u16 * pSpriteData;
    /* 08 */ s8 xCenter;
    /* 09 */ s8 yCenter;
    /* 0A */ s8 width;
    /* 0B */ s8 height;
    /* 0C */ s8 xFlagOrigin;
    /* 0D */ s8 yFlagOrigin;
    /* 0E */ STRUCT_PAD(0xe, 0xf);
};

extern const struct NodeIcon gWMNodeIconData[];

struct WMSongTableEnt
{
    /* 00 */ u16 eirika;
    /* 02 */ u16 ephraim;
};

extern struct WMSongTableEnt gWMSongTable[];

extern u8 const gWMMonsterSpawnsSize;
extern u8 const gWMMonsterSpawnLocations[];

extern struct ProcCmd ProcScr_WorldMapMain[];

struct ProcGmapSogu {
    PROC_HEADER;

    /* 2C */ int x, y;

    STRUCT_PAD(0x34, 0x50);

    /* 50 */ struct APHandle * ap;

    STRUCT_PAD(0x54, 0x64);

    /* 64 */ s16 timer;
};

enum gm_unit_state_bitfile {
    GM_UNIT_STATE_B0 = 1 << 0,
    GM_UNIT_STATE_B1 = 1 << 1,
    GM_UNIT_STATE_B2 = 1 << 2,
    GM_UNIT_STATE_B3 = 1 << 3,
    GM_UNIT_STATE_B4 = 1 << 4,
    GM_UNIT_STATE_B5 = 1 << 5,
    GM_UNIT_STATE_B6 = 1 << 6,
    GM_UNIT_STATE_B7 = 1 << 7,
};

struct GMUnit {
    /* 00 */ u8 state;
    /* 01 */ u8 location;
    /* 02 */ s16 id; // character or class ID
};

struct GMNode {
    /* 00 */ u8 state;
};

/* GMNode::state */
enum gm_node_states {
    GM_NODE_STATE_VALID = (1 << 0),
    GM_NODE_STATE_CLEARED = (1 << 1),
};

union GMStateBits {
    u8 raw;
    struct {
        u8 state_0   : 1;
        u8 monster_merged : 1;
        u8 state_2   : 1;
        u8 state_3   : 1;
        u8 state_4_5 : 2;
        u8 skip_wm   : 1;
        u8 no_fade   : 1;
    } __attribute__((packed)) bits;
} __attribute__((packed));

enum gm_state_bits {
    GM_STATE_0 = 1 << 0,
    GM_STATE_MONSGEN = 1 << 1,
    GM_STATE_2 = 1 << 2,
    GM_STATE_3 = 1 << 3,
    GM_STATE_4 = 1 << 4,
    GM_STATE_5 = 1 << 5,
    GM_STATE_SKIPPED = 1 << 6,
    GM_STATE_NOFADE = 1 << 7,
};

struct OpenPaths {
    s8 openPaths[0x20];
    s8 openPathsLength;
};

struct GMapData
{
    /* 00 */ union GMStateBits state;
    /* 01 */ u8 sprite_disp;
    /* 02 */ short xCamera, yCamera;
    /* 08 */ int ix, iy;
    /* 10 */ struct GMUnit units[8];
    /* 30 */ struct GMNode nodes[0x1C];
    /* A0 */ int unk_a0; // pad?
    /* A4 */ struct OpenPaths openPaths;
    /* C8 */ u8 current_node; // entry node id?
    /* C9 */ u8 unk_c9[3]; // List of active world map skirmishes
    /* CC */ u8 unk_cc; // used to determine which skirmish enemy block to load
    /* CD */ u8 unk_cd;
    /* CE */ u16 unk_ce;
};

enum
{
    // For use with GMapData:state

    GMAP_STATE_BIT0 = (1 << 0),
    GMAP_STATE_MONSTER_MERGED = (1 << 1),
    GMAP_STATE_BIT2 = (1 << 2),
    GMAP_STATE_BIT3 = (1 << 3),
    GMAP_STATE_BIT4 = (1 << 4),
    GMAP_STATE_BIT5 = (1 << 5),
    GMAP_STATE_BIT6 = (1 << 6),
    GMAP_STATE_BIT7 = (1 << 7),
};

enum world_map_monster_location_idx {
    WM_MON_LOC_0 = 0,
    WM_MON_LOC_1,
    WM_MON_LOC_2,
    WM_MON_LOC_3,
    WM_MON_LOC_4,
    WM_MON_LOC_5,
    WM_MON_LOC_6,
    WM_MON_LOC_7,
    WM_MON_LOC_8,

    WM_MON_LOC_MAX
};

#define WM_MONS_UID_ENTRY 4 /* monsters use gGMData.units[3]/[4]/[5] */
#define WM_MONS_AMT 3
#define WM_MONS_UID_END (WM_MONS_UID_ENTRY + WM_MONS_AMT)

struct GmapTimeMonsConf {
    u8 node;
    u8 jid;
    u8 unk2;
    u8 unk3;
};

struct ProcGmapTimeMons {
    PROC_HEADER;

    /* 29 */ bool trigger;
    /* 2C */ struct GmapTimeMonsConf confs[WM_MONS_AMT];
    /* 38 */ u8 monster_amt;
    /* 3C */ ProcPtr ap_procs[WM_MONS_AMT];
};

extern const u8 WmMonsterGenerateRatesIdx_EirikaMode[11];
extern const u8 WmMonsterGenerateRatesIdx_EphraimMode[11];
extern const u8 WmMonsterGenerateRates_EirikaMode[WM_MON_LOC_MAX * 10];
extern const u8 WmMonsterGenerateRates_XmapEirika[WM_MON_LOC_MAX];
extern const u8 WmMonsterGenerateRates_EphraimMode[WM_MON_LOC_MAX * 10];
extern const u8 WmMonsterGenerateRates_XmapEphraim[WM_MON_LOC_MAX];

// ??? GetWmMonsterGenAmount(???);
// ??? GenerateRandomonsterMergeNode(???);
// ??? GenerateRandomonsterMergeConf(???);
// ??? Nop_WorldmapTimemons_0(???);
// ??? GmapTimeMons_Init(???);
// ??? GmapTimeMons_ExecMonsterMergeMu(???);
// ??? GmapTimeMons_WaitSpriteDone(???);
ProcPtr NewGmapTimeMons(ProcPtr parent, int * monster_amt);
void WmRemoveRandomMonsters(void);
void WmMergeMonsters(void);
void WmShowMonsters(void);
bool GmapTimeMonsExists(void);

bool GmapSugoAdvance(s16 x, s16 y, s16 * outx, s16 * outy);
// ??? GmapSogu_End(???);
// ??? GmapSogu_Init(???);
// ??? GmapSogu_Loop1(???);
// ??? GmapSogu_Loop2(???);
void NewGmapSogu(int, int);
bool GmapSoguExists(void);

struct WMFaceWrapper {
    /* 00 */ s16 x, y;
    /* 04 */ struct FaceProc * faceProc;
    /* 08 */ u16 faceId;
    /* 0A */ s8 unk_0a; // possibly "fade direction" (+1 for fade in, -1 for fade out?)
};

struct WMFaceHolderProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct WMFaceWrapper faceWrapper[2];
};

struct WMFaceCtrlProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 timer; // some index into an array, functionality appears to be unused
    /* 2C */ struct WMFaceHolderProc * faceHolderProc;
    /* 30 */ s8 increment;
    /* 31 */ u8 blendAmt;
    /* 32 */ u8 unk_32; // unreferenced
    /* 33 */ u8 unk_33; // initialized to 0 and unused
    /* 34 */ u8 unk_34; // initialized to 0 and unused
};

void WorldMapFaceHolder_Init(struct WMFaceHolderProc * proc);
// ??? WMFaceCtrl_Init(???);
// ??? GetWMFaceTileXAndScroll(???);
// ??? GetWMFaceBg(???);
// ??? GetWMFaceVramOffset(???);
// ??? PutWMFaceOnBg(???);
// ??? HandleWMFaceFade(???);
// ??? WMFaceCtrl_LoopExt(???);
// ??? WMFaceCtrl_Loop(???);
// ??? Nop_WorldmapFace_0(???);
ProcPtr StartWMFaceCtrl(ProcPtr parent);
void EndWMFaceCtrl(void);
int GetWMFaceBlendAmt(void);
void WmDrawFace(int faceSlot, int faceId, u16 config);
void WmClearFace(int faceSlot, u16 config);
void HideWmFace(void);
void WorldMap_Destruct(struct WorldMapMainProc * proc);
void WorldMap_StartMuWalkScroll(struct WorldMapMainProc * proc);
void WorldMap_WaitMuWalkScroll(struct WorldMapMainProc * proc);
void WorldMap_SetupBgGfx(struct WorldMapMainProc * proc);
void WorldMap_MuWalkLoop(struct WorldMapMainProc * proc);
void SetupGraphicSystemsForWorldMap(void);
void SetupGmapNodeGfx(void);
void WorldMap_SetupBgGfx(struct WorldMapMainProc * proc);
void DeployEveryUnit(struct WorldMapMainProc * unused);
void Nop_WorldmapMain_0(void);
void WorldMap_SetInitialState(void);
// ??? WorldMap_SetNextNodeIcon(???);
// ??? WorldMap_ShowMapUnits(???);
// ??? WorldMap_ResetMapUnits(???);
// ??? WorldMap_SetMergedNodeIcon(???);
void WorldMap_Init(struct WorldMapMainProc * proc);
void WmMain_MoveCamera(ProcPtr);
s8 WorldMap_HandleNodeConfirm(struct WorldMapMainProc *, int);
void WmMain_MoveCursor(struct WorldMapMainProc *);
// ??? WorldMap_FindNextSelectableNode(???);
int WorldMap_FindNearestNode(void);
// ??? WorldMap_JumpCursorToNode(???);
void WorldMap_WaitCursorJump(ProcPtr proc);
// ??? WorldMap_LoopExt(???);
void WorldMap_EnableUnitSprites(void);
void WorldMap_Loop(ProcPtr proc);
void WorldMap_TeardownForSubscreen(ProcPtr);
void WorldMap_StartUnitList(ProcPtr proc);
void WorldMap_RestoreDisplay(struct WorldMapMainProc * proc);
s8 WorldMap_CallGuide(ProcPtr proc);
void WorldMap_ResumeFromGuide(void);
void WorldMap_RestoreDisplayAfterGuide(struct WorldMapMainProc * proc);
bool WorldMap_StartConfigScreen(ProcPtr proc);
void WorldMap_ResumeFromConfigScreen(void);
void WorldMap_RestoreDisplayAfterConfig(struct WorldMapMainProc * proc);
s8 StartWorldmapStatusScreen(ProcPtr proc);
void WorldMap_ResumeFromStatusScreen(void);
void WorldMap_RestoreDisplayAfterStatus(struct WorldMapMainProc * proc);
// ??? WorldMap_ShowEverything(???);
void WorldMap_HideEverything(void);
void WorldMap_FadeInOnTimerFlag(struct WorldMapMainProc * proc);
void WorldMap_StartSkirmishAnim(struct WorldMapMainProc * proc);
void Worldmap_WaitForSkirmishAnim(ProcPtr proc);
void WorldMap_EndSkirmishDisplay(void);
void WorldMap_RemoveMergedSkirmishUnits(struct WorldMapMainProc * proc);
void WorldMap_CallIntroEvent(struct WorldMapMainProc * proc);
void WorldMap_PostBeginningEvent(struct WorldMapMainProc * proc);
void WorldMap_WaitForChapterIntroEvents(ProcPtr proc);
void WorldMap_SetMonsterMergedState(void);
void WorldMap_GenerateRandomMonsters(ProcPtr proc);
void _WmMergeMonsters(void);
void WorldMap_WaitMonsterMerging(ProcPtr proc);
void Worlmap_StartGmapSogu(struct WorldMapMainProc * proc);
void Worlmap_WaitGmapSogu(ProcPtr proc);
// ??? WorldMap_HideFaceAndCenterCamera(???);
void ResetWorldMapScreen(void);
void NULL_WorldmapMain_0(void);
void WorldMap_StartArmory(ProcPtr proc);
void WorldMap_StartVendor(ProcPtr proc);
void WorldMap_StartSecretShop(ProcPtr proc);
void WorldMap_StartManageItems(ProcPtr proc);
void WorldMap_UpdateBgm(ProcPtr unused);
void UpdateWorldMapBgm(void);
void WorldMap_PrepareSaveMenu(ProcPtr);
void WorldMap_RestartWithTimer(int);
void EndWM(ProcPtr);
s8 WM_Exists(void); // gmap something
// ??? WorldMap_MergeFace_Loop(???);
void WmMergeFace(int timerMaybe, u8 b, int faceSlot, int fid, int e, int f, int config);
// ??? WorldMap_FadeMapSpritePalOut_Loop(???);
// ??? WorldMap_StartFadeMapSpritePalOut(???);
// ??? WorldMap_FadeMapSpritePalIn_Loop(???);
// ??? WorldMap_StartFadeMapSpritePalIn(???);
// ??? NewWorldMap(???);
void WorldMap_CallBeginningEvent(struct WorldMapMainProc * proc);
void CallChapterWMIntroEvents(ProcPtr);
void GMapScreen_OnWorldmapEventUpdate(void); // gmap something
// ??? GMapScreen_FillBg3TileIndices(???);
// ??? GMapScreen_LoadTileGfx(???);
// ??? GMapScreen_ApplyTilePalettes(???);
// ??? GMScreenVSync_Init(???);
// ??? GMScreenVSync_Loop(???);
// ??? GMapScreenVSync_AddCopyRequest(???);
// ??? NewMapScreenVSync(???);
// ??? MapScreen_OnDelete(???);
// ??? MapScreen_Init(???);
// ??? GMapScreenVSync_RequestFullCopy(???);
// ??? GMapScreen_UpdateScroll(???);
// ??? GMapScreen_ResetState(???);
// ??? GMapScreen_Loop(???);
ProcPtr NewMapScreen(ProcPtr);

struct GMapUnitFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u16 unk_2c;
    /* 2E */ u16 unk_2e;
    /* 30 */ u8 unk_30[7];
    /* 37 */ u8 unk_37;
};
const void * MMS_GetGfx(u16 idx);
const void * MMS_GetROMTCS2(u16 idx);
u8 * GetMapUnitMMSGfxBuffer(int idx);
void GmapUnit_Destruct(struct GMapUnitProc * proc);
void GmapUnit_Init(struct GMapUnitProc * proc);
void GmapUnit_Loop(struct GMapUnitProc * proc);
int GetPaletteIdForAllegience(int faction);
int NewMapUnit(struct GMapUnitContainerProc * container, u16 classId, int faction);
void MapUnitC_DeleteGmapUnit(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetPosition(struct GMapUnitContainerProc * container, int index, int x, int y);
void MapUnitC_GetPosition(struct GMapUnitContainerProc * container, int index, u16 * x, u16 * y);
void MapUnitC_AddToPosition(struct GMapUnitContainerProc * container, int index, int x, int y);
int MapUnitC_GetAnimId(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetAnimId(struct GMapUnitContainerProc * container, int index, int animId);
void MapUnitC_SetDisplayEnabled(struct GMapUnitContainerProc * container, int index, s8 flag);
s8 MapUnitC_IsBlendEnabled(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetBlendEnabled(struct GMapUnitContainerProc * container, int index, s8 flag);
int MapUnitC_GetLayer(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetLayer(struct GMapUnitContainerProc * container, int index, int layer);
int MapUnitC_GetFaction(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetFaction(struct GMapUnitContainerProc * container, int index, int faction);
void MapUnitC_SetPalette(struct GMapUnitContainerProc * container, int index, int pal);
void MapUnitC_SetGfxNeedsUpdate(struct GMapUnitContainerProc * container, int index);
s8 MapUnitC_SetDisplayedClass(struct GMapUnitContainerProc * container, int index, int classId);
u16 MapUnitC_GetInitialClass(struct GMapUnitContainerProc * container, int index);
int MapUnitC_GetDisplayedClass(struct GMapUnitContainerProc * container, int index);
void GmapUnitContainer_Destruct(struct GMapUnitContainerProc * proc);
void GmapUnitContainer_Init(struct GMapUnitContainerProc * proc);
ProcPtr NewGmapUnitContainer(ProcPtr, int, int);
void GmapUnitFade_Destruct(struct GMapUnitFadeProc * proc);
void GmapUnitFade_Init(struct GMapUnitFadeProc * proc);
u16 GmapUnitFade_InterpolateColor(int arg0, int arg1, int arg2, int arg3, int arg4);
void GmapUnitFade_Loop(struct GMapUnitFadeProc * proc);
ProcPtr StartGmapUnitFade(int index, int palA, int palB, int arg3, ProcPtr parent);
void EndGmapUnitFade(void);
ProcPtr GetGmapUnitFade(void);
void GmapUnitFade_AddUnit(int index);
void StartGmapUnitFadeIn(int index, int arg1, ProcPtr parent);
void StartGmapUnitFadeOut(int index, int arg1, ProcPtr parent);
int WMLoc_GetChapterId(int node);
int WMLoc_GetNextLocId(int idx);
int GetNodeAtPosition(void * unused, int arg1, int arg2, int arg3, int arg4);
void SkipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc);
void UnskipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc);
// ??? GmapScreen2_Destruct(???);
// ??? GmapScreen2_Init(???);
// ??? GmapScreen2_GetNodeScreenPos(???);
// ??? GmapScreen2_Loop(???);
ProcPtr StartGmNodeIconDisplay(ProcPtr, int, int, int, ProcPtr);
const char* GetWorldMapNodeName(u32);
int GetWorldMapNodeIdByOrder(int nodeId);
// ??? Nop_WorldmapCursor_0(???);
// ??? GmapCursor_Init(???);
// ??? GmapCursor_Loop(???);
ProcPtr NewGmapCursor(ProcPtr, int, int, ProcPtr);
// ??? MapRoute_RenderPathGfx(???);
// ??? MapRoute_RenderOpenPaths(???);
// ??? MapRoute_BlitFullWindow(???);
// ??? MapRoute_BlitScrollEdge(???);
// ??? Nop_WorldmapPath_0(???);
// ??? MapRoute_Init(???);
// ??? MapRoute_OffsetTileIndices(???);
// ??? MapRoute_Loop(???);
// ??? MapRoute_StartTransition(???);
// ??? MapRoute_PrepareTransition(???);
// ??? MapRoute_EnableBGSyncs(???);
// ??? MapRoute_TransitionLoop(???);
// ??? MapRoute_TransitionEnd(???);
void MapRoute_BeginRouteTransition(struct GmRouteProc * proc, int unk);
void MapRoute_0(struct GmRouteProc * proc);
ProcPtr StartGMapRoute(ProcPtr parent, struct OpenPaths * pPaths, int c, int d);
// ??? GetGmPathWaypointCount(???);
// ??? MapRoute_ClearBg(???);
// ??? WorldMap_ResetTextCursors(???);
struct MenuProc *StartWMGeneralMenu(ProcPtr parent);
// ??? WMGeneralMenu_OnInit(???);
// ??? WMGeneralMenu_OnEnd(???);
// ??? WMGeneralMenu_OnCancel(???);
// ??? WMMenu_OnUnitSelected(???);
// ??? WMMenu_OnStatusSelected(???);
// ??? WMMenu_OnGuideDraw(???);
// ??? WMMenu_OnGuideSelected(???);
// ??? WMMenu_OnOptionsSelected(???);
// ??? WMMenu_OnSaveSelected(???);
struct MenuProc *StartWMNodeMenu(struct WorldMapMainProc *parent);
// ??? WMNodeMenu_OnInit(???);
// ??? WMNodeMenu_OnEnd(???);
// ??? WMNodeMenu_OnCancel(???);
// ??? WMMenu_IsArmoryAvailable(???);
// ??? WMMenu_IsVendorAvailable(???);
// ??? WMMenu_IsSecretShopAvailable(???);
// ??? WMMenu_IsNodeUnclearedAvailable(???);
// ??? WMMenu_IsNodeClearedAvailable(???);
// ??? WMMenu_OnArmorySelected(???);
// ??? WMMenu_OnVendorSelected(???);
// ??? WMMenu_OnSecretShopSelected(???);
// ??? WMMenu_OnManageItemsSelected(???);
void GmDataInit(void);

// this is a buffer at 0x201AFF0, indexed by node ID
struct GMapNodeLink
{
    s8 numConnections; // number of connections from this node
    s8 connections[7]; // node IDs of each connected node
};

extern struct GMapNodeLink gUnk_10[];

struct Unknown0201B100
{
    u8 a;
    u8 b[0x20];
};

extern struct Unknown0201B100 gUnk_12[];

struct Unknown0201B0D8
{
    /* 00 */ s8 unk_00[0x10];
    /* 10 */ s8 unk_10[0x10];
    /* 20 */ int unk_20;
    /* 24 */ int unk_24;
};

extern struct Unknown0201B0D8 gUnk_11;

// ??? GmPathsInit(???);
bool AddGmPath(struct GMapData*, struct OpenPaths*, int);
bool RemoveGmPath(struct GMapData * pGMapData, struct OpenPaths * pPaths, int idx);
// ??? RefreshGmNodeLinksExt(???);
void RefreshGmNodeLinks(struct GMapData *);
int GetGmSkirmishUnitAtNode(int);
// ??? GmBuildSkirmishNodeList(???);
// ??? GmIsNodeInList(???);
// ??? GmFindPathRecursive(???);
// ??? GmFindPathThroughBlockedRecursive(???);
s8 GmFindPath(s8, s8, s8);
// ??? GetGmPathBetweenNodes(???);
int BuildGmPathSplineData(int, int, s16, u16 *, int *, int);
void ResetGmStoryNode(void);
int GetPlayChapterId(u32);
int GetNextUnclearedNode(struct GMapData *);
u32 GetNextUnclearedChapter(void);
u32 GetBattleMapKind(void);
int GetGmUnitFaction(int);
int GetChapterIndexOnWmNode(struct GMapData *);
void GetGmRNState(struct GMapData *, void *);
void SetGmRNState(struct GMapData *, void *);
// ??? GetGmPathSearchResult(???);
int GetGmPathNode(int);
int GetGmPathLength(void);
// ??? GmMuPrim_OnEnd_Null(???);
// ??? GetCharacterClassId(???);
// ??? MapMUPrim_MakeUnitForChar(???);
// ??? MapMUPrim_MakeUnitForClass(???);
void MapMUPrim_RemoveLinkedMapUnit(struct GMapMuPrimProc *);
// ??? GmMuPrim_OnInit(???);
// ??? GmMuPrim_Loop_Null(???);
// ??? GmMuPrim_CalcMoveDuration(???);
// ??? GmMuPrim_0(???);
// ??? GmMuPrim_TrackMovementDelta(???);
// ??? GmMuPrim_GetFacingFromAngle(???);
// ??? GmMuPrim_GetMovementFacing(???);
// ??? GmMuPrim_UpdateMovement(???);
// ??? GmMuPrim_1(???);
// ??? GmMuPrim_2(???);
// ??? GmMuPrim_3(???);
// ??? GmMu_OnEnd_Null(???);
// ??? GmMu_OnInit(???);
ProcPtr StartGmMu(ProcPtr);
// ??? GmMu_SetUnit(???);
void GmMu_RemoveUnit(struct GMapMuProc *, int);
// ??? GmMu_RemoveLinkedUnits(???);
void GmShowMuUnit(struct GMapMuProc *, int);
void GmHideMuUnit(struct GMapMuProc *, int);
void GmMu_StartMoveBetweenNodes(struct GMapMuProc *, struct UnknownSub80BDEB4 *);
void GmMu_StartMoveToPosition(struct GMapMuProc *, struct UnknownSub80BDFA4 *);
void GmMu_PauseMovement(struct GMapMuProc *, int);
void GmMu_ResumeMovement(struct GMapMuProc *, int);
void GmMu_SetBlendEnabled(struct GMapMuProc *, int, s8);
void GmMu_GetRawPosition(struct GMapMuProc *, int, s16*, s16*);
// ??? GmMu_GetSpriteLayer(???);
void GmMu_SetSpriteLayer(struct GMapMuProc *, int, int);
void GmMu_0(struct GMapMuProc *, int, s8);
s8 GmMu_IsMoving(struct GMapMuProc *, int);
// ??? GmMuPrim_FinishMovement(???);
void GmMu_FinishMovement(struct GMapMuProc * muProc, int index);
void GmMu_SetPosition(struct GMapMuProc *, int, s16, s16);
void GmMu_GetPosition(struct GMapMuProc *, int, s16 *, s16 *);
void GmMu_SetNode(struct GMapMuProc *, int, int);
// ??? GmMu_SetFastForwardEnabled(???);
void GmMu_StartFadeIn(struct GMapMuProc *, int, int);
void GmMu_StartFadeOut(struct GMapMuProc *, int, int);
s8 GmUnitFadeExists(void);
void GmMuPrim_PlayStepSfx(struct GMapMuPrimProc *);
void MapMU_SetUnitClass(ProcPtr, int, int, int, int);
void MapMU_SetUnitChar(ProcPtr, int, int, int, int);
// ??? InitGMapPI(???);
int GetGMapPIQuadrantFromOffsets(int, int);
void ApplyGMapPIMinimapUnitPalette(int, int);
// ??? PutGMapPILevelDigits(???);
// ??? UpdateGMapPILevelDigits(???);
// ??? DrawGMapPIPanelAtHeight(???);
// ??? ClearGMapPIPanel(???);
// ??? PutGMapPINodeName(???);
// ??? PutGMapPICharName(???);
// ??? PutGMapPIFace(???);
// ??? PutGMapPIClassName(???);
// ??? PutGMapPIShopIcons(???);
// ??? PutGMapPILevelNumber(???);
// ??? DrawGMapPIPanelContents(???);
// ??? GMapPI_ShowInit(???);
// ??? GMapPI_ShowLoop(???);
// ??? GMapPI_TrackCursorLoop(???);
// ??? GMapPI_RequestHide(???);
// ??? GMapPI_HideLoop(???);
// ??? GMapPI_GetGMapUnitIndexAndFaction(???);
// ??? InitGMapPIInterfaceKind(???);
// ??? RedrawGMapPIForNode(???);
// ??? GMapPI_WaitForNodeLoop(???);
// ??? GMapPI_Init(???);
// ??? StartWorldMapPlayerInterface(???);
ProcPtr StartGMapPlayerInterface(ProcPtr);
void EndGMapPlayerInterface(void);

struct GMapMoveCursorProc {
    PROC_HEADER;

    /* 2A */ s16 duration;
    /* 2C */ s16 timer;
    /* 30 */ int xsrc, ysrc;
    /* 38 */ int xdst, ydst;
    /* 40 */ u8 move_type;

    STRUCT_PAD(0x41, 0x44);

    /* 44 */ int xmove, ymove;
};

struct GmScrollInfo {
    /* 00 */ int * flags;
    /* 04 */ int lock;
    /* 08 */ s16 move_type;
    /* 0A */ s16 xsrc, ysrc;
    /* 0E */ s16 xdst, ydst;
    /* 14 */ int duration;
    /* 18 */ s16 delay;
};

void GmMoveCursor_OnEnd(struct GMapMoveCursorProc * proc);
void GmMoveCursor_OnInit(struct GMapMoveCursorProc * proc);
void GmMoveCursor_OnLoop(struct GMapMoveCursorProc * proc);
ProcPtr StartGmMoveCursor(struct Vec2 * posA, struct Vec2 * posB, int c, int d, ProcPtr parent);
s8 GmMoveCursorExists(void);

struct GMapScrollManageProc {
    PROC_HEADER;

    /* 2C */ int * wm_flag;
    /* 30 */ int lock;
    /* 34 */ s16 move_type;
    /* 36 */ s16 xsrc, ysrc;
    /* 3A */ s16 xdst, ydst;
    /* 40 */ int duration;
    /* 44 */ int timer;
    /* 48 */ s16 delay;
};
void GmScrollManage_OnEnd(struct GMapScrollManageProc * proc);
void GmScrollManage_OnInit(struct GMapScrollManageProc * proc);
void GmScrollManage_OnLoop(struct GMapScrollManageProc * proc);
ProcPtr StartGmScrollManage(struct GmScrollInfo * input, ProcPtr parent);
// ProcPtr GmScrollManageExist(void);
void StartGmScroll(s16 xStart, s16 yStart, s16 xEnd, s16 yEnd, s16 speed, s16 delay);
bool CheckGmScrolling(void);
void EndGmScroll(void);

void SetGmClassUnit(int, int, int, int);
void SetGmCharUnit(int, int, int, int);
void RemoveGmUnit(int);
void ShowGmUnit(int);
void HideGmUnit(int);
void AddAndDrawGmPath(int, int);
// ??? GmPalFade_OnEnd_Null(???);
// ??? GmPalFade_Init(???);
// ??? GmPalFade_Loop(???);
// ??? StartGmPalFade(???);
s8 IsGmPalFadeActive(void);
void EndGmPalFade(void);
ProcPtr StartGmPalFade_(ProcPtr, int);
// ??? RememberBlendState(???);
// ??? RestoreBlendState(???);
// ??? GmapBaseEntry_OnEnd(???);
// ??? GmapBaseEntry_Init(???);
// ??? GmapBaseEntry_0(???);
// ??? GmapBaseEntry_1(???);
// ??? GmapBaseEntry_2(???);
ProcPtr StartGmBaseEntry(int, int, ProcPtr);
void EndGmBaseEntry(void);
s8 GmBaseEntryExists(void);
// ??? GmapMuEntry_OnEnd(???);
// ??? GmapMuEntry_Init(???);
// ??? GmapMuEntry_0(???);
// ??? GmapMuEntry_1(???);
// ??? StartGmapMuEntry1(???);
// ??? EndGmapMuEntry1(???);
// ??? GmapMuEntry1Exists(???);
void LoadWorldmapMinimap(void);
// ??? GmMuEntry_OnEnd_Null(???);
// ??? GmMuEntry_Init(???);
// ??? GmMuEntry_SetupHblankGradient(???);
// ??? GmMuEntry_0(???);
// ??? GmMuEntry_1(???);
// ??? GmMuEntry_2(???);
// ??? GmMuEntry_3(???);
ProcPtr StartGmapMuEntry(ProcPtr);
void EndGmMuEntry(void);
// ??? GmMuEntryExists(???);
s8 GetGmMuEntryFlag(void);
s8 GmMuEntryStartShow(int, int);
s8 GmMuEntryStartHide(int, int);
// ??? GmapLineFade_OnEnd(???);
// ??? GmapLineFade_0(???);
// ??? GmapLineFade_Init(???);
// ??? GmapLineFade_Loop(???);
ProcPtr StartGmapLineFade(int, ProcPtr);
// ??? EndGmapLineFade(???);
s8 IsGmapLineFadeActive(void);
// ??? GmTmConfront_OnEnd(???);
// ??? GmTmConfront_LoadPositions(???);
// ??? GmTmConfront_InitUnitPositionA(???);
// ??? GmTmConfront_InitUnitPositionB(???);
// ??? GmTmConfront_InitUnitPositionC(???);
// ??? GmTmConfront_Loop_MoveUnitPositions(???);
// ??? GmTmConfront_StartAnim(???);
// ??? GmTmConfront_WaitForAnim(???);
ProcPtr StartWorldmapSkirmishAnim(int, int, ProcPtr);
// ??? EndWorldmapSkirmishAnim(???);
s8 IsWorldmapSkirmishAnimActive(void);
int GetWMPointDistance(int, int, int, int, int);
// void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);
int GetWMCursorScreenQuadrant(int, int, int, int);
int IsChapterMonsterSpawnActive(int chIndex);
void ClearWMPlayerInterfaceTilemapBuffers(void);
// ??? StartWorldmapStatusHelpBox(???);
// ??? WorldmapStatus_GetCharDescription(???);
// ??? WorldmapStatus_GetClassDescription(???);
// ??? WorldmapStatus_CountAllies(???);
// ??? PutWorldmapStatusDetails(???);
// ??? WorldmapStatus_InitText(???);
// ??? WorldmapStatus_InitDetails(???);
// ??? WorldmapStatus_InitGfx(???);
// ??? WorldmapStatus_Init(???);
// ??? WorldmapStatus_OnEnd(???);
// ??? WorldmapStatus_0(???);
// ??? WorldmapStatus_PutTimeAndGold(???);
// ??? WorldmapStatus_Loop_KeyHandler(???);
// ??? WorldmapStatus_1(???);
// ??? GmapEffectPal_OnEnd(???);
// ??? GmapEffectPal_Init(???);
// ??? GmapEffectPal_Loop(???);
// ??? GmapEffect_0(???);
// ??? GmapEffect_OnEnd(???);
// ??? GmapEffect_Init(???);
// ??? GmapEffect_Loop(???);
struct GmapEffectProc * StartGmapEffect(ProcPtr, int);
void EndGmapEffectProc(ProcPtr proc);
void EndGmapEffect(void);

// ??? WorldMapHblank(???);
void SetWorldMapHblank(void);
void ClearWmHblank(void);
u16 * GetWorldMapHblankBuffer(int, int);
void FlipWorldMapHblankBuffer(void);
void SetWorldMapHblankDest(int idx, uintptr_t reg);
void ClearWorldMapHblankChannelFlags(int);
// ??? SetWorldMapHblankChannelFlag0(???);
// ??? SetWorldMapHblankChannelFlag1(???);

/* GmapRM */
struct ProcGmapRmUpdate {
    PROC_HEADER;

    /* 2A */ s16 x0, y0;
    /* 2E */ s16 x1, y1;
    /* 32 */ s16 delay, timer, speed;
};

void GmapRmUpdateDirect_Loop(struct Proc * proc);
void GmapRmUpdateExt_End(struct ProcGmapRmUpdate * proc);
void GmapRmUpdateExt_Delay(struct ProcGmapRmUpdate * proc);
void GmapRmUpdateExt_InitPosition(struct ProcGmapRmUpdate * proc);
void GmapRmUpdateExt_ScrollPosition(struct ProcGmapRmUpdate * proc);
ProcPtr StartGmapRmUpdateExt(int x0, int x1, int y0, int y1, int speed, int delay, ProcPtr parent);
void EndGmapRmUpdateExt(void);

struct ProcGmapRm {
    PROC_HEADER;

    /* 29 */ u8 flag;
    /* 2A */ u16 timer;

    STRUCT_PAD(0x2C, 0x2E);

    /* 2E */ s16 x, y;

    STRUCT_PAD(0x32, 0x54);

    /* 54 */ ProcPtr gm_mu; // Gmap MU
};

enum gmap_rm_flags {
    GMAPRM_FLAG_0 = 1 << 0,
    GMAPRM_FLAG_1 = 1 << 1,
    GMAPRM_FLAG_UNBLOCK = 1 << 2,
    GMAPRM_FLAG_3 = 1 << 3,
    GMAPRM_FLAG_4 = 1 << 4,
    GMAPRM_FLAG_5 = 1 << 5,
    GMAPRM_FLAG_6 = 1 << 6,
    GMAPRM_FLAG_7 = 1 << 7,
};

enum gmap_rm_proc_label_idx {
    GMAPRM_LABEL_0 = 0,
    GMAPRM_LABEL_1 = 1,
};

void GmapRm_OnEnd(struct ProcGmapRm * proc);
void GmapRm_InitNop(void);
void GmapRm_StartUpdateDirect(struct ProcGmapRm * proc);
void GmapRm_Goto0IfFlag0(struct ProcGmapRm * proc);
void GmapRm_Goto1IfFlag1(struct ProcGmapRm * proc);
void GmapRm_Blocking(struct ProcGmapRm * proc);
void GmapRm_InitBlend(struct ProcGmapRm * proc);
void GmapRm_BlendIn(struct ProcGmapRm * proc);
void GmapRm_0(struct ProcGmapRm * proc);
void GmapRm_BlendOut(struct ProcGmapRm * proc);
void GmapRm_RemoveUnits(struct ProcGmapRm * proc);
void GmapRm_DisplayLeaderUnit(struct ProcGmapRm * proc);
void GmapRm_1(struct ProcGmapRm * proc);
void GmapRm_2(struct ProcGmapRm * proc);
ProcPtr StartGmapRm(int x, int y, u32 mask, ProcPtr parent);
void EndGmapRM(void);
int GmapRMExists(void);
void GmapRm_SetPosition(s16 x, s16 y);
bool GmapRm_GetPosition(s16 * px, s16 * py);
void GmapRm_SetUnblocked(void);
void GmapRm_EndAll(void);

struct ProcGmapRmBaPalAnim {
    PROC_HEADER;

    /* 29 */ u8 flag;
    /* 2A */ s16 timer;
};

void GmapRmBaPalAnim1_End(struct ProcGmapRmBaPalAnim * proc);
void GmapRmBaPalAnim1_Init(struct ProcGmapRmBaPalAnim * proc);
void GmapRmBaPalAnim1_Loop1(struct ProcGmapRmBaPalAnim * proc);
void GmapRmBaPalAnim1_Loop2(struct ProcGmapRmBaPalAnim * proc);
ProcPtr StartGmapRmBaPalAnim1(ProcPtr parent);
void EndGmapRmBaPalAnim1(void);
bool CheckGmapRmBaPalAnim1Exists(void);
bool CheckGmapRmBaPalAnim1State(void);

struct ProcGmapRmBorder1 {
    PROC_HEADER;

    /* 29 */ bool flag;
    /* 2A */ u8 index;
    /* 2B */ s8 unk_2b;
    /* 2C */ struct APHandle * sprite1;
    /* 30 */ s16 timer;
    /* 34 */ struct APHandle * sprite2;
};

struct ProcWmPlaceDot
{
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 flag;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ s8 unk_2d;
    /* 2E */ s16 x;
    /* 30 */ s16 y;
    /* 34 */ struct GmapEffectProc * effectProc;
};

struct GmMapRmBorderSet {
    void * img;
    void * sprite;
    s16 x, y;
};
extern const struct GmMapRmBorderSet GfxSet_WmNationMap[WM_NATION_MAX];

void GmapRmBorder1_End(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_0(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_PutSprite2(struct ProcGmapRmBorder1 * proc, int x, int y, bool transparency);
void GmapRmBorder1_NationMergeIn(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_1(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_NationMergeOut(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_2(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_PutSpriteAll(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_3(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_4(struct ProcGmapRmBorder1 * proc);
// ??? StartGmapRmBorder1(???);
// ??? DrawWmNationHighLightMapGfx(???);
ProcPtr WmShowNationHighlightedMap(int, ProcPtr); // FEBuilder: "Display place name of world map"
void EndGmapRmBorder1(int);
int GmapRmBorder1Exists(int);
void RequestGmapRmBorder1Remove(int);
// ??? WmDotPalAnim_OnEnd(???);
// ??? WmDotPalAnim_Init(???);
// ??? BlendWmDotPalette(???);
// ??? WmDotPalAnim_Loop1(???);
// ??? WmDotPalAnim_Loop2(???);
// ??? StartWmDotPalAnim(???);
// ??? EndAllWmDotPalAnim(???);
// ??? IsWmDotPalAnimActive(???);
// ??? GetWmDotPalAnimFlag(???);
// ??? WmPlaceDot_OnEnd(???);
// ??? WmPlaceDot_Init(???);
// ??? PutWmDotSprite(???);
// ??? WmPlaceDot_Loop1(???);
// ??? WmPlaceDot_Loop2(???);
ProcPtr StartWmPlaceDot(int, int, int, int, int, ProcPtr);
void EndWmPlaceDotByIndex(int);
// bool IsWmPlaceDotActiveAtIndex(int);
void SetWmPlaceDotFlagForIndex(int);

/* worldmap_automu.h */

struct Sub80C3378
{
    /* 00 */ u8 wm_uid;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 srcNode;
    /* 08 */ u16 dstNode;
    /* 0A */ u16 delay;
    /* 0C */ int speed;
};

struct Sub80C33D4
{
    /* 00 */ u8 wm_uid;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 x1;
    /* 08 */ u16 y1;
    /* 0A */ u16 x2;
    /* 0C */ u16 y2;
    /* 0E */ u16 delay;
    /* 10 */ int speed;
};

// ??? GmapAutoMu_OnEnd(???);
// ??? GmapAutoMu_WaitInitialDelay(???);
// ??? GmapAutoMu_0(???);
// ??? GmapAutoMu_1(???);
// ??? GmapAutoMu_2(???);
// ??? GmapAutoMu_StartFadeIn(???);
// ??? GmapAutoMu_StartFadeOut(???);
// ??? GmapAutoMu_WaitForFadeEnd(???);
// ??? GmapAutoMu_3(???);
// ??? GmapAutoMu_4(???);
// ??? GmapAutoMu_5(???);
ProcPtr StartGmapAutoMu_Type0(struct Sub80C3378 *, int, ProcPtr);
ProcPtr StartGmapAutoMu_Type1(struct Sub80C33D4 *, int, ProcPtr);
void EndGmAutoMuFor(int);
bool IsGmAutoMuActiveFor(int);

/* worldmap_text.h */

// ??? GenerateGradientPalette(???);
// ??? ClearWmTextVram(???);
// ??? WmText_Init(???);
// ??? WmText_Loop_DrawText(???);
void ShowWmText(u8);
void HideWmText(void);
ProcPtr StartWmTextHandler(ProcPtr);
void StartWmTextMsg(int);

/* worldmap_radar.h */

struct GMapRadarProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ s8 unk_2f;
    /* 30 */ s8 unk_30;
    /* 34 */ int unk_34;
};

// ??? WmMinimap_PutCursorIcon(???);
// ??? WmMinimap_PutStoryNodeIcon(???);
// ??? WmMinimap_PutLordIcon(???);
// ??? WmMinimap_PutSkirmishIcons(???);
// ??? WmMinimap_BlinkPalette(???);
// ??? PutWmMinimapSprites(???);
// ??? GMapRadar_0(???);
// ??? GMapRadar_1(???);
// ??? GMapRadar_2(???);
// ??? PutWmMinimapGfx(???);
// ??? GMapRadar_SlideIn(???);
// ??? GMapRadar_SlideOut(???);
// ??? GMapRadar_Init(???);
// ??? StartWorldMapMinimapCore(???);
ProcPtr StartWorldmapMinimap(ProcPtr);
void EndWorldmapMinimap(void);

/* worldmap_basemenu.h */

struct GMapBaseMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 kind;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ int pid;
    /* 30 */ s8 wasBgmPlaying;
    STRUCT_PAD(0x31, 0x34);
    /* 34 */ int bgmSongId;
};

// ??? GMapBaseMenu_OnEnd_Null(???);
// ??? GMapBaseMenu_Init(???);
// ??? GMapBaseMenu_StartItemScreen(???);
// ??? GMapBaseMenu_RestoreBgm(???);
// ??? GMapBaseMenu_ShopFromItemScreen(???);
// ??? GMapBaseMenu_StartArmory(???);
// ??? GMapBaseMenu_StartVendor(???);
// ??? GMapBaseMenu_StartSecretShop(???);
ProcPtr StartGMapBaseMenu(int, ProcPtr);
// ??? EndGMapBaseMenu(???);
struct GMapBaseMenuProc * FindGMapBaseMenu(void);
// ??? IsGMapBaseMenuActive(???);
int GetGMapBaseMenuKind(void);
int GetGMapBaseMenuPid();
void SetGMapBaseMenuPid(int);

// extern ??? gFont_0
// extern ??? gUnk_10
// extern ??? gUnk_11
// extern ??? gUnk_12
// extern ??? gUnk_13
// extern ??? gUnk_14
// extern ??? gUnk_15
// extern ??? gUnk_16
// extern ??? gUnk_17
// extern ??? gUnk_18
// extern ??? gUnk_19
// extern ??? gUnk_20
// extern ??? gUnk_21
// extern ??? gUnk_22
// extern ??? gUnk_23
// extern ??? gUnk_24
// extern ??? gUnk_25
extern u8 gWmHblankStatus;
extern u16 gUnk_26[480 * 2];
extern u16 * gUnk_27[];
extern u16 * gUnk_28[];
extern u8 gUnk_29[3];
extern u8 gUnk_30;
extern u8 gUnk_31;
extern u8 gUnk_32;
// extern ??? gUnk_33

extern struct ProcCmd CONST_DATA ProcScr_WorldMapFaceHolder[];
// extern ??? ProcScr_WorldMapFaceCtrl
// extern ??? gWorldmapMain_0
// extern ??? ProcScr_WorldMapMain
// extern ??? ProcScr_WorldmapMain_0
// extern ??? ProcScr_WorldmapMain_1
// extern ??? ProcScr_WorldmapMain_2
// extern ??? gWMSongTable
// extern ??? ProcScr_GMapScreenVSync
// extern ??? ProcScr_GMapScreen
// extern ??? ProcScr_GmapUnit
// extern ??? ProcScr_GmapUnitContainer
// extern ??? ProcScr_GmapUnitFade
extern struct ProcCmd ProcScr_GmNodeIconDisplay[];
// extern ??? ProcScr_GmapCursor
// extern ??? ProcScr_GMapRoute
// extern ??? gMenu_WMGeneralMenu
// extern ??? gMenuRect_WMGeneralMenuRect
// extern ??? gMenu_WMNodeMenu
// extern ??? gMenuRect_WMNodeMenuRectA
// extern ??? gMenuRect_WMNodeMenuRectB
// extern ??? gWorldmapMapmu_0
// extern ??? gWorldmapMapmu_1
// extern ??? ProcScr_GMapMuPrim
// extern ??? ProcScr_GMapMu
// extern ??? gGMapMuSpriteLayerLut
// extern ??? gWorldmapMapmu_2
// extern ??? gWorldmapMapmu_3
// extern ??? gWorldmapMapmu_4
// extern ??? gWorldmapMapmu_5
// extern ??? gWorldmapMapmu_6
// extern ??? gWorldmapMapmu_7
// extern ??? gWorldmapPlayerInterface_0
// extern ??? gWorldmapPlayerInterface_1
// extern ??? ProcScr_GmMoveCursor
// extern ??? ProcScr_GmScrollManage
// extern ??? ProcScr_GmapPalFade
// extern ??? ProcScr_GmapBaseEntry
// extern ??? ProcScr_GmapMuEntry1
// extern ??? ProcScr_GmapMuEntry2
// extern ??? ProcScr_GmapLineFade
// extern ??? ProcScr_GmapTmConfront
// extern ??? gHelpInfo_WorldmapStatus
// extern ??? gBgConfig_WorldmapStatus
extern struct ProcCmd ProcScr_WorldmapStatusUi[];
// extern ??? gWorldmapEffect_0
extern struct ProcCmd ProcScr_GmapEffectPal[];
extern struct ProcCmd ProcScr_GmapEffect[];
extern struct ProcCmd ProcScr_GmapSogu[];
extern struct ProcCmd ProcScr_GmapTimeMons[];
extern struct ProcCmd ProcScr_GmapRmUpdateDirect[];
extern struct ProcCmd ProcScr_GmapRmUpdateExt[];
extern struct ProcCmd ProcScr_GmapRM[];
extern struct ProcCmd ProcScr_GmapRmBaPalAnim1[];
extern struct ProcCmd ProcScr_GmapRmBorder1[];
extern struct ProcCmd ProcScr_WmDotPalAnim[];
// extern ??? Sprite_WmPlaceDot
// extern ??? ProcScr_WmPlaceDot
// extern ??? ProcScr_GmapAutoMu
// extern ??? Sprite_WmText
// extern ??? ProcScr_WorldMapTextHandler
// extern ??? gWorldmapRadar_1
// extern ??? gWorldmapRadar_2
// extern ??? ProcScr_GmapRader
// extern ??? ProcScr_WorldmapMinimapWrapper
// extern ??? ProcScr_GmapBaseMenu

extern u16 ItemList_WM_BorderMulan_Armory[];
extern u16 ItemList_WM_CastleFrelia_Armory[];
extern u16 ItemList_WM_Ide_Armory[];
extern u16 ItemList_WM_BorgoRidge_Armory[];
extern u16 ItemList_WM_ZahaWoods_Armory[];
extern u16 ItemList_WM_Serafew_Armory[];
extern u16 ItemList_WM_AdlasPlains_Armory[];
extern u16 ItemList_WM_Renvall_07_Armory[];
extern u16 ItemList_WM_Renvall_08_Armory[];
extern u16 ItemList_WM_PortKiris_Armory[];
extern u16 ItemList_WM_TerasPlateau_Armory[];
extern u16 ItemList_WM_CaerPelyn_Armory[];
extern u16 ItemList_WM_HamillCanyon_Armory[];
extern u16 ItemList_WM_JehannaHall_0D_Armory[];
extern u16 ItemList_WM_FortRigwald_Armory[];
extern u16 ItemList_WM_Bethroen_Armory[];
extern u16 ItemList_WM_Taizel_Armory[];
extern u16 ItemList_WM_ZaalbulMarsh_Armory[];
extern u16 ItemList_WM_GradoKeep_Armory[];
extern u16 ItemList_WM_JehannaHall_13_Armory[];
extern u16 ItemList_WM_RenaisCastle_Armory[];
extern u16 ItemList_WM_NarubeRiver_Armory[];
extern u16 ItemList_WM_NelerasPeak_Armory[];
extern u16 ItemList_WM_RaustenCourt_Armory[];
extern u16 ItemList_WM_DarklingWoods_Armory[];
extern u16 ItemList_WM_BlackTemple_Armory[];
extern u16 ItemList_WM_TowerOfValni_Armory[];
extern u16 ItemList_WM_LagdouRuins_Armory[];
extern u16 ItemList_WM_MelkaenCoast_Armory[];
extern u16 ItemList_WM_BorderMulan_Vendor[];
extern u16 ItemList_WM_CastleFrelia_Vendor[];
extern u16 ItemList_WM_Ide_Vendor[];
extern u16 ItemList_WM_BorgoRidge_Vendor[];
extern u16 ItemList_WM_ZahaWoods_Vendor[];
extern u16 ItemList_WM_Serafew_Vendor[];
extern u16 ItemList_WM_AdlasPlains_Vendor[];
extern u16 ItemList_WM_Renvall_07_Vendor[];
extern u16 ItemList_WM_Renvall_08_Vendor[];
extern u16 ItemList_WM_PortKiris_Vendor[];
extern u16 ItemList_WM_TerazPlateau_Vendor[];
extern u16 ItemList_WM_CaerPelyn_Vendor[];
extern u16 ItemList_WM_HamillCanyon_Vendor[];
extern u16 ItemList_WM_JehannaHall_0D_Vendor[];
extern u16 ItemList_WM_FortRigwald_Vendor[];
extern u16 ItemList_WM_Bethroen_Vendor[];
extern u16 ItemList_WM_Taizel_Vendor[];
extern u16 ItemList_WM_ZaalbulMarsh_Vendor[];
extern u16 ItemList_WM_GradoKeep_Vendor[];
extern u16 ItemList_WM_JehannaHall_13_Vendor[];
extern u16 ItemList_WM_RenaisCastle_Vendor[];
extern u16 ItemList_WM_NarubeRiver_Vendor[];
extern u16 ItemList_WM_NelerasPeak_Vendor[];
extern u16 ItemList_WM_RaustenCourt_Vendor[];
extern u16 ItemList_WM_DarklingWoods_Vendor[];
extern u16 ItemList_WM_BlackTemple_Vendor[];
extern u16 ItemList_WM_TowerOfValni_Vendor[];
extern u16 ItemList_WM_LagdouRuins_Vendor[];
extern u16 ItemList_WM_MelkaenCoast_Vendor[];
extern u16 ItemList_WM_BorderMulan_SecretShop[];
extern u16 ItemList_WM_CastleFrelia_SecretShop[];
extern u16 ItemList_WM_Ide_SecretShop[];
extern u16 ItemList_WM_BorgoRidge_SecretShop[];
extern u16 ItemList_WM_ZahaWoods_SecretShop[];
extern u16 ItemList_WM_Serafew_SecretShop[];
extern u16 ItemList_WM_AdlasPlains_SecretShop[];
extern u16 ItemList_WM_Renvall_07_SecretShop[];
extern u16 ItemList_WM_Renvall_08_SecretShop[];
extern u16 ItemList_WM_PortKiris_SecretShop[];
extern u16 ItemList_WM_TerazPlateau_SecretShop[];
extern u16 ItemList_WM_CaerPelyn_SecretShop[];
extern u16 ItemList_WM_HamillCanyon_SecretShop[];
extern u16 ItemList_WM_JehannaHall_0D_SecretShop[];
extern u16 ItemList_WM_FortRigwald_SecretShop[];
extern u16 ItemList_WM_Bethroen_SecretShop[];
extern u16 ItemList_WM_Taizel_SecretShop[];
extern u16 ItemList_WM_ZaalbulMarsh_SecretShop[];
extern u16 ItemList_WM_GradoKeep_SecretShop[];
extern u16 ItemList_WM_JehannaHall_13_SecretShop[];
extern u16 ItemList_WM_RenaisCastle_SecretShop[];
extern u16 ItemList_WM_NarubeRiver_SecretShop[];
extern u16 ItemList_WM_NelerasPeak_SecretShop[];
extern u16 ItemList_WM_RaustenCourt_SecretShop[];
extern u16 ItemList_WM_DarklingWoods_SecretShop[];
extern u16 ItemList_WM_BlackTemple_SecretShop[];
extern u16 ItemList_WM_TowerOfValni_SecretShop[];
extern u16 ItemList_WM_LagdouRuins_SecretShop[];
extern u16 ItemList_WM_MelkaenCoast_SecretShop[];

#endif // GUARD_WORLDMAP_H
