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

struct Unknown_3001DA8
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
    /* 3C */ struct Unknown_3001DA8 * unk_3c;
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

// used as input to "sub_80BDEB4" in "worldmap_mapmu.c"
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

// used as input to "sub_80BDFA4" in "worldmap_mapmu.c"
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
// ??? nullsub_72(???);
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
// ??? sub_80B826C(???);
// ??? GetWMFaceBg(???);
// ??? GetWMFaceVramOffset(???);
// ??? sub_80B82C8(???);
// ??? HandleWMFaceFade(???);
// ??? WMFaceCtrl_LoopExt(???);
// ??? WMFaceCtrl_Loop(???);
// ??? nullsub_57(???);
ProcPtr StartWMFaceCtrl(ProcPtr parent);
void EndWMFaceCtrl(void);
int GetWMFaceBlendAmt(void);
void WmDrawFace(int faceSlot, int faceId, u16 config);
void WmClearFace(int faceSlot, u16 config);
void HideWmFace(void);
void WorldMap_Destruct(struct WorldMapMainProc * proc);
void sub_80B8A7C(struct WorldMapMainProc * proc);
void sub_80B8B3C(struct WorldMapMainProc * proc);
void sub_80B8E60(struct WorldMapMainProc * proc);
void sub_80B8BA4(struct WorldMapMainProc * proc);
void SetupGraphicSystemsForWorldMap(void);
void SetupGmapNodeGfx(void);
void sub_80B8E60(struct WorldMapMainProc * proc);
void DeployEveryUnit(struct WorldMapMainProc * unused);
void nullsub_22(void);
void sub_80B8FD4(void);
// ??? sub_80B8FEC(???);
// ??? sub_80B9028(???);
// ??? sub_80B90CC(???);
// ??? sub_80B9114(???);
void WorldMap_Init(struct WorldMapMainProc * proc);
void WmMain_MoveCamera(ProcPtr);
s8 sub_80B92D0(struct WorldMapMainProc *, int);
void WmMain_MoveCursor(struct WorldMapMainProc *);
// ??? sub_80B955C(???);
int sub_80B95B0(void);
// ??? sub_80B961C(???);
void sub_80B96DC(ProcPtr proc);
// ??? WorldMap_LoopExt(???);
void sub_80B97F8(void);
void WorldMap_Loop(ProcPtr proc);
void sub_80B9810(ProcPtr);
void sub_80B9820(ProcPtr proc);
void sub_80B982C(struct WorldMapMainProc * proc);
s8 WorldMap_CallGuide(ProcPtr proc);
void sub_80B989C(void);
void sub_80B98A8(struct WorldMapMainProc * proc);
bool WorldMap_StartConfigScreen(ProcPtr proc);
void WorldMap_ResumeFromConfigScreen(void);
void sub_80B9924(struct WorldMapMainProc * proc);
s8 StartWorldmapStatusScreen(ProcPtr proc);
void sub_80B9994(void);
void sub_80B99A0(struct WorldMapMainProc * proc);
// ??? sub_80B99F0(???);
void WorldMap_HideEverything(void);
void sub_80B9A34(struct WorldMapMainProc * proc);
void sub_80B9A58(struct WorldMapMainProc * proc);
void Worldmap_WaitForSkirmishAnim(ProcPtr proc);
void sub_80B9AB0(void);
void sub_80B9AEC(struct WorldMapMainProc * proc);
void WorldMap_CallIntroEvent(struct WorldMapMainProc * proc);
void WorldMap_PostBeginningEvent(struct WorldMapMainProc * proc);
void WorldMap_WaitForChapterIntroEvents(ProcPtr proc);
void WorldMap_SetMonsterMergedState(void);
void WorldMap_GenerateRandomMonsters(ProcPtr proc);
void _WmMergeMonsters(void);
void WorldMap_WaitMonsterMerging(ProcPtr proc);
void Worlmap_StartGmapSogu(struct WorldMapMainProc * proc);
void Worlmap_WaitGmapSogu(ProcPtr proc);
// ??? sub_80B9E64(???);
void ResetWorldMapScreen(void);
void NULL_080B9F08(void);
void WorldMap_StartArmory(ProcPtr proc);
void WorldMap_StartVendor(ProcPtr proc);
void WorldMap_StartSecretShop(ProcPtr proc);
void sub_80B9F44(ProcPtr proc);
void WorldMap_UpdateBgm(ProcPtr unused);
void UpdateWorldMapBgm(void);
void sub_80B9FD4(ProcPtr);
void sub_80BA008(int);
void EndWM(ProcPtr);
s8 WM_Exists(void); // gmap something
// ??? sub_80BA06C(???);
void WmMergeFace(int timerMaybe, u8 b, int faceSlot, int fid, int e, int f, int config);
// ??? sub_80BA100(???);
// ??? sub_80BA198(???);
// ??? sub_80BA1F4(???);
// ??? sub_80BA288(???);
// ??? NewWorldMap(???);
void WorldMap_CallBeginningEvent(struct WorldMapMainProc * proc);
void CallChapterWMIntroEvents(ProcPtr);
void sub_80BA424(void); // gmap something
// ??? sub_80BA458(???);
// ??? sub_80BA490(???);
// ??? sub_80BA4D0(???);
// ??? GMScreenVSync_Init(???);
// ??? GMScreenVSync_Loop(???);
// ??? sub_80BA6DC(???);
// ??? NewMapScreenVSync(???);
// ??? MapScreen_OnDelete(???);
// ??? MapScreen_Init(???);
// ??? sub_80BA818(???);
// ??? sub_80BA8A0(???);
// ??? sub_80BAB00(???);
// ??? sub_80BAB0C(???);
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
void sub_80BAF58(struct GMapUnitContainerProc * container, int index, int x, int y);
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
s8 sub_80BB0E0(struct GMapUnitContainerProc * container, int index, int classId);
u16 sub_80BB188(struct GMapUnitContainerProc * container, int index);
int sub_80BB194(struct GMapUnitContainerProc * container, int index);
void GmapUnitContainer_Destruct(struct GMapUnitContainerProc * proc);
void GmapUnitContainer_Init(struct GMapUnitContainerProc * proc);
ProcPtr NewGmapUnitContainer(ProcPtr, int, int);
void GmapUnitFade_Destruct(struct GMapUnitFadeProc * proc);
void GmapUnitFade_Init(struct GMapUnitFadeProc * proc);
u16 sub_80BB26C(int arg0, int arg1, int arg2, int arg3, int arg4);
void GmapUnitFade_Loop(struct GMapUnitFadeProc * proc);
ProcPtr StartGmapUnitFade(int index, int palA, int palB, int arg3, ProcPtr parent);
void EndGmapUnitFade(void);
ProcPtr GetGmapUnitFade(void);
void sub_80BB49C(int index);
void sub_80BB4C0(int index, int arg1, ProcPtr parent);
void sub_80BB538(int index, int arg1, ProcPtr parent);
int WMLoc_GetChapterId(int node);
int WMLoc_GetNextLocId(int idx);
int GetNodeAtPosition(void * unused, int arg1, int arg2, int arg3, int arg4);
void SkipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc);
void UnskipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc);
// ??? GmapScreen2_Destruct(???);
// ??? GmapScreen2_Init(???);
// ??? sub_80BB744(???);
// ??? GmapScreen2_Loop(???);
ProcPtr StartGmNodeIconDisplay(ProcPtr, int, int, int, ProcPtr);
const char* GetWorldMapNodeName(u32);
int sub_80BBA4C(int nodeId);
// ??? nullsub_59(???);
// ??? GmapCursor_Init(???);
// ??? GmapCursor_Loop(???);
ProcPtr NewGmapCursor(ProcPtr, int, int, ProcPtr);
// ??? sub_80BBBF4(???);
// ??? sub_80BBC54(???);
// ??? sub_80BBCC8(???);
// ??? sub_80BBDA4(???);
// ??? nullsub_38(???);
// ??? sub_80BBEB8(???);
// ??? sub_80BBF1C(???);
// ??? sub_80BBF60(???);
// ??? MapRoute_StartTransition(???);
// ??? sub_80BC0F4(???);
// ??? MapRoute_EnableBGSyncs(???);
// ??? MapRoute_TransitionLoop(???);
// ??? MapRoute_TransitionEnd(???);
void MapRoute_BeginRouteTransition(struct GmRouteProc * proc, int unk);
void MapRoute_80BC2DC(struct GmRouteProc * proc);
ProcPtr StartGMapRoute(ProcPtr parent, struct OpenPaths * pPaths, int c, int d);
// ??? sub_80BC3D4(???);
// ??? sub_80BC404(???);
// ??? sub_80BC428(???);
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
// ??? sub_80BC72C(???);
// ??? sub_80BC754(???);
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

extern struct GMapNodeLink gUnknown_0201AFF0[];

struct Unknown0201B100
{
    u8 a;
    u8 b[0x20];
};

extern struct Unknown0201B100 gUnknown_0201B100[];

struct Unknown0201B0D8
{
    /* 00 */ s8 unk_00[0x10];
    /* 10 */ s8 unk_10[0x10];
    /* 20 */ int unk_20;
    /* 24 */ int unk_24;
};

extern struct Unknown0201B0D8 gUnknown_0201B0D8;

// ??? GmPathsInit(???);
bool AddGmPath(struct GMapData*, struct OpenPaths*, int);
bool RemoveGmPath(struct GMapData * pGMapData, struct OpenPaths * pPaths, int idx);
// ??? RefreshGmNodeLinksExt(???);
void RefreshGmNodeLinks(struct GMapData *);
int sub_80BCA1C(int);
// ??? sub_80BCA54(???);
// ??? sub_80BCA90(???);
// ??? sub_80BCAB8(???);
// ??? sub_80BCBAC(???);
s8 sub_80BCCFC(s8, s8, s8);
// ??? sub_80BCDE4(???);
int sub_80BCE34(int, int, s16, u16 *, int *, int);
void ResetGmStoryNode(void);
int GetPlayChapterId(u32);
int GetNextUnclearedNode(struct GMapData *);
u32 GetNextUnclearedChapter(void);
u32 GetBattleMapKind(void);
int sub_80BD20C(int);
int GetChapterIndexOnWmNode(struct GMapData *);
void sub_80BD260(struct GMapData *, void *);
void sub_80BD270(struct GMapData *, void *);
// ??? sub_80BD284(???);
int sub_80BD28C(int);
int sub_80BD29C(void);
// ??? GmMuPrim_OnEnd_Null(???);
// ??? GetCharacterClassId(???);
// ??? MapMUPrim_MakeUnitForChar(???);
// ??? MapMUPrim_MakeUnitForClass(???);
void MapMUPrim_RemoveLinkedMapUnit(struct GMapMuPrimProc *);
// ??? GmMuPrim_OnInit(???);
// ??? GmMuPrim_Loop_Null(???);
// ??? sub_80BD41C(???);
// ??? GmMuPrim_80BD444(???);
// ??? sub_80BD5B8(???);
// ??? sub_80BD660(???);
// ??? sub_80BD6A8(???);
// ??? sub_80BD740(???);
// ??? GmMuPrim_80BD830(???);
// ??? GmMuPrim_80BD9D8(???);
// ??? GmMuPrim_80BDA78(???);
// ??? GmMu_OnEnd_Null(???);
// ??? GmMu_OnInit(???);
ProcPtr StartGmMu(ProcPtr);
// ??? GmMu_SetUnit(???);
void GmMu_RemoveUnit(struct GMapMuProc *, int);
// ??? sub_80BDD94(???);
void GmShowMuUnit(struct GMapMuProc *, int);
void GmHideMuUnit(struct GMapMuProc *, int);
void sub_80BDEB4(struct GMapMuProc *, struct UnknownSub80BDEB4 *);
void sub_80BDFA4(struct GMapMuProc *, struct UnknownSub80BDFA4 *);
void GmMu_PauseMovement(struct GMapMuProc *, int);
void GmMu_ResumeMovement(struct GMapMuProc *, int);
void sub_80BE080(struct GMapMuProc *, int, s8);
void sub_80BE0A4(struct GMapMuProc *, int, s16*, s16*);
// ??? sub_80BE0C8(???);
void GmMu_SetSpriteLayer(struct GMapMuProc *, int, int);
void GmMu_80BE108(struct GMapMuProc *, int, s8);
s8 sub_80BE12C(struct GMapMuProc *, int);
// ??? sub_80BE194(???);
void sub_80BE330(struct GMapMuProc * muProc, int index);
void GmMu_SetPosition(struct GMapMuProc *, int, s16, s16);
void GmMu_GetPosition(struct GMapMuProc *, int, s16 *, s16 *);
void GmMu_SetNode(struct GMapMuProc *, int, int);
// ??? sub_80BE3E8(???);
void GmMu_StartFadeIn(struct GMapMuProc *, int, int);
void GmMu_StartFadeOut(struct GMapMuProc *, int, int);
s8 GmUnitFadeExists(void);
void sub_80BE45C(struct GMapMuPrimProc *);
void MapMU_SetUnitClass(ProcPtr, int, int, int, int);
void MapMU_SetUnitChar(ProcPtr, int, int, int, int);
// ??? sub_80BE56C(???);
int sub_80BE594(int, int);
void sub_80BE5B4(int, int);
// ??? sub_80BE5F8(???);
// ??? sub_80BE638(???);
// ??? sub_80BE65C(???);
// ??? sub_80BE82C(???);
// ??? PutGMapPINodeName(???);
// ??? PutGMapPICharName(???);
// ??? PutGMapPIFace(???);
// ??? PutGMapPIClassName(???);
// ??? sub_80BE9D8(???);
// ??? sub_80BEA78(???);
// ??? sub_80BEB2C(???);
// ??? sub_80BEBD4(???);
// ??? GMapPI_ShowLoop(???);
// ??? sub_80BECB8(???);
// ??? sub_80BEDCC(???);
// ??? GMapPI_HideLoop(???);
// ??? GMapPI_GetGMapUnitIndexAndFaction(???);
// ??? InitGMapPIInterfaceKind(???);
// ??? sub_80BEF20(???);
// ??? sub_80BEF6C(???);
// ??? GMapPI_Init(???);
// ??? StartWorldMapPlayerInterface(???);
ProcPtr sub_80BF13C(ProcPtr);
void sub_80BF15C(void);

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
// ??? GmapBaseEntry_80BF8CC(???);
// ??? GmapBaseEntry_80BF988(???);
// ??? GmapBaseEntry_80BFA1C(???);
ProcPtr StartGmBaseEntry(int, int, ProcPtr);
void EndGmBaseEntry(void);
s8 GmBaseEntryExists(void);
// ??? sub_80BFB4C(???);
// ??? sub_80BFB90(???);
// ??? sub_80BFBCC(???);
// ??? sub_80BFC44(???);
// ??? sub_80BFCC8(???);
// ??? sub_80BFD00(???);
// ??? sub_80BFD10(???);
void sub_80BFD28(void);
// ??? GmMuEntry_OnEnd_Null(???);
// ??? GmMuEntry_Init(???);
// ??? sub_80BFDA0(???);
// ??? GmMuEntry_80BFEF8(???);
// ??? GmMuEntry_80BFFD0(???);
// ??? GmMuEntry_80C0080(???);
// ??? GmMuEntry_80C0144(???);
ProcPtr StartGmapMuEntry(ProcPtr);
void EndGmMuEntry(void);
// ??? GmMuEntryExists(???);
s8 GetGmMuEntryFlag(void);
s8 GmMuEntryStartShow(int, int);
s8 GmMuEntryStartHide(int, int);
// ??? GmapLineFade_OnEnd(???);
// ??? GmapLineFade_80C0358(???);
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
int sub_80C0834(int, int, int, int, int);
// void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);
int sub_80C089C(int, int, int, int);
int sub_80C0960(int chIndex);
void sub_80C09B8(void);
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
// ??? WorldmapStatus_80C0E58(???);
// ??? WorldmapStatus_PutTimeAndGold(???);
// ??? WorldmapStatus_Loop_KeyHandler(???);
// ??? WorldmapStatus_80C0FA4(???);
// ??? GmapEffectPal_OnEnd(???);
// ??? GmapEffectPal_Init(???);
// ??? GmapEffectPal_Loop(???);
// ??? GmapEffect_80C119C(???);
// ??? GmapEffect_OnEnd(???);
// ??? GmapEffect_Init(???);
// ??? GmapEffect_Loop(???);
struct GmapEffectProc * StartGmapEffect(ProcPtr, int);
void sub_80C13CC(ProcPtr proc);
void EndGmapEffect(void);

// ??? WorldMapHblank(???);
void SetWorldMapHblank(void);
void ClearWmHblank(void);
u16 * sub_80C1DA0(int, int);
void sub_80C1DC8(void);
void sub_80C1DD8(int idx, uintptr_t reg);
void sub_80C1DE8(int);
// ??? sub_80C1DFC(???);
// ??? sub_80C1E14(???);

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
void GmapRm_80C214C(struct ProcGmapRm * proc);
void GmapRm_BlendOut(struct ProcGmapRm * proc);
void GmapRm_RemoveUnits(struct ProcGmapRm * proc);
void GmapRm_DisplayLeaderUnit(struct ProcGmapRm * proc);
void GmapRm_80C2320(struct ProcGmapRm * proc);
void GmapRm_80C2398(struct ProcGmapRm * proc);
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
void GmapRmBorder1_80C2750(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_PutSprite2(struct ProcGmapRmBorder1 * proc, int x, int y, bool transparency);
void GmapRmBorder1_NationMergeIn(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_80C28C4(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_NationMergeOut(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_80C2964(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_PutSpriteAll(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_80C29F8(struct ProcGmapRmBorder1 * proc);
void GmapRmBorder1_80C2A1C(struct ProcGmapRmBorder1 * proc);
// ??? StartGmapRmBorder1(???);
// ??? DrawWmNationHighLightMapGfx(???);
ProcPtr WmShowNationHighlightedMap(int, ProcPtr); // FEBuilder: "Display place name of world map"
void EndGmapRmBorder1(int);
int sub_80C2BC4(int);
void sub_80C2C10(int);
// ??? WmDotPalAnim_OnEnd(???);
// ??? WmDotPalAnim_Init(???);
// ??? sub_80C2C80(???);
// ??? WmDotPalAnim_Loop1(???);
// ??? WmDotPalAnim_Loop2(???);
// ??? StartWmDotPalAnim(???);
// ??? EndAllWmDotPalAnim(???);
// ??? IsWmDotPalAnimActive(???);
// ??? sub_80C2E50(???);
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
// ??? GmapAutoMu_80C31C4(???);
// ??? GmapAutoMu_80C31E0(???);
// ??? GmapAutoMu_80C31FC(???);
// ??? GmapAutoMu_StartFadeIn(???);
// ??? GmapAutoMu_StartFadeOut(???);
// ??? GmapAutoMu_WaitForFadeEnd(???);
// ??? GmapAutoMu_80C3280(???);
// ??? GmapAutoMu_80C32E4(???);
// ??? GmapAutoMu_80C3350(???);
ProcPtr StartGmapAutoMu_Type0(struct Sub80C3378 *, int, ProcPtr);
ProcPtr StartGmapAutoMu_Type1(struct Sub80C33D4 *, int, ProcPtr);
void EndGmAutoMuFor(int);
bool IsGmAutoMuActiveFor(int);

/* worldmap_text.h */

// ??? sub_80C34D0(???);
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
// ??? GMapRadar_80C3A8C(???);
// ??? GMapRadar_80C3AB8(???);
// ??? GMapRadar_80C3B40(???);
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

// extern ??? gFont_0201AFC0
// extern ??? gUnknown_0201AFF0
// extern ??? gUnknown_0201B0D8
// extern ??? gUnknown_0201B100
// extern ??? gUnknown_0201B104
// extern ??? gUnknown_0201B1E4
// extern ??? gUnknown_0201B3A4
// extern ??? gUnknown_0201B430
// extern ??? gUnknown_0201B458
// extern ??? gUnknown_0201B718
// extern ??? gUnknown_0201B71C
// extern ??? gUnknown_0201B758
// extern ??? gUnknown_0201B7DA
// extern ??? gUnknown_0201B864
// extern ??? gUnknown_0201B930
// extern ??? gUnknown_0201B958
// extern ??? gUnknown_0201BBD8
extern u8 gWmHblankStatus;
extern u16 gUnknown_0201BE32[480 * 2];
extern u16 * gUnknown_0201C5B4[];
extern u16 * gUnknown_0201C5C0[];
extern u8 gUnknown_0201C5CC[3];
extern u8 gUnknown_0201C5CF;
extern u8 gUnknown_0201C5D0;
extern u8 gUnknown_0201C5D1;
// extern ??? gUnknown_0201C5D4

extern struct ProcCmd CONST_DATA ProcScr_WorldMapFaceHolder[];
// extern ??? ProcScr_WorldMapFaceCtrl
// extern ??? gUnknown_08A3D728
// extern ??? ProcScr_WorldMapMain
// extern ??? ProcScr_08A3DD08
// extern ??? ProcScr_08A3DD20
// extern ??? ProcScr_08A3DD38
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
// extern ??? gUnknown_08A3E22C
// extern ??? gUnknown_08A3E23C
// extern ??? ProcScr_GMapMuPrim
// extern ??? ProcScr_GMapMu
// extern ??? gGMapMuSpriteLayerLut
// extern ??? gUnknown_08A3E2F8
// extern ??? gUnknown_08A3E31C
// extern ??? gUnknown_08A3E360
// extern ??? gUnknown_08A3E38E
// extern ??? gUnknown_08A3E3BA
// extern ??? gUnknown_08A3E412
// extern ??? gUnknown_08A3E448
// extern ??? gUnknown_08A3E4D4
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
// extern ??? gUnknown_08A3E9A0
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
// extern ??? gUnknown_08A3EE6C
// extern ??? gUnknown_08A3EE70
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
