#ifndef GUARD_WORLDMAP_H
#define GUARD_WORLDMAP_H

#include "proc.h"
#include "hardware.h"
#include "spline.h"

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
    /* 29 */ u8 unk_29_0 : 1;
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
    /* 4C */ struct GmRouteProc * unk_4c;
};

struct GmNodeIconDisplayProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ u32 chr;
    /* 30 */ u8 pal;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32_0 : 1;
    /* 32 */ u8 unk_32_1 : 1;
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
    /* 2C */ int unk_2c;
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
    u8 unk_29_0 : 1;
    u8 unk_29_1 : 1;
    u8 unk_29_2 : 1;
    u8 unk_29_3 : 1;
    u8 unk_29_4 : 1;
    u8 unk_29_5 : 1;
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
    /* 29 */ s8 unk_29_0 : 1;
    /* 29 */ s8 unk_29_1 : 1;
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

    /* 29 */ u8 unk_29_0 : 1;
    /* 29 */ u8 unk_29_1 : 1;
    /* 29 */ u8 unk_29_2 : 1;
    /* 29 */ u8 unk_29_3 : 1;
    /* 29 */ u8 unk_29_4 : 1;
    /* 29 */ u8 unk_29_5 : 1;
    /* 29 */ u8 unk_29_6 : 1;
    /* 29 */ u8 unk_29_7 : 1;

    /* 2A */ s8 unk_2a;
    /* 2C */ int timer;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x3a);

    /* 3A */ u16 unk_3a;
    /* 3C */ u16 unk_3c; // pad?
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ s8 unk_40;
    /* 41 */ s8 unk_41;
    /* 44 */ struct GmScreenProc * gm_screen; // GmapScreen
    /* 48 */ struct GmNodeIconDisplayProc * unk_48; // GmNodeIconDisplay
    /* 4C */ struct GMapUnitContainerProc * unk_4c; // Gmap Unit Container
    /* 50 */ struct GmapCursorProc * unk_50; // Gmap Cursor
    /* 54 */ ProcPtr unk_54; // Gmap MU
};

#define GM_SCREEN (((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->gm_screen)
#define GM_MU     (((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_54)

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

extern struct ProcCmd gProcScr_WorldMapMain[];

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
        u8 state_6   : 1;
        u8 state_7   : 1;
    } __attribute__((packed)) bits;
} __attribute__((packed));

struct OpenPaths {
    s8 openPaths[0x20];
    s8 openPathsLength;
};

struct GMapData
{
    /* 00 */ union GMStateBits state;
    /* 01 */ u8 unk01;
    /* 02 */ short xCamera;
    /* 04 */ short yCamera;
    /* 08 */ s32 unk08;
    /* 0C */ s32 unk0C;
    /* 10 */ struct GMUnit units[8];
    /* 30 */ struct GMNode nodes[0x1C];
    /* A0 */ int unk_a0; // pad?
    /* A4 */ struct OpenPaths openPaths;
    /* C8 */ u8 unk_c8; // entry node id?
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

// ??? WorldMapFaceHolder_Init(???);
// ??? WMFaceCtrl_Init(???);
// ??? sub_80B826C(???);
// ??? GetWMFaceBg(???);
// ??? GetWMFaceVramOffset(???);
// ??? sub_80B82C8(???);
// ??? HandleWMFaceFade(???);
// ??? sub_80B843C(???);
// ??? WMFaceCtrl_Loop(???);
// ??? nullsub_57(???);
ProcPtr StartWMFaceCtrl(ProcPtr parent);
void EndWMFaceCtrl(void);
// ??? GetWMFaceBlendAmt(???);
void WmDrawFace(int faceSlot, int faceId, u16 config);
void WmClearFace(int faceSlot, u16 config);
void sub_80B895C(void);
void WorldMap_Destruct(struct WorldMapMainProc *proc);
void sub_80B8A7C(struct WorldMapMainProc *proc);
void sub_80B8B3C(struct WorldMapMainProc *proc);
// ??? sub_80B8B60(???);
void sub_80B8BA4(struct WorldMapMainProc *proc);
// ??? SetupGraphicSystemsForWorldMap(???);
// ??? sub_80B8E14(???);
// ??? sub_80B8E60(???);
// ??? DeployEveryUnit(???);
void nullsub_22(void);
void sub_80B8FD4(void);
// ??? sub_80B8FEC(???);
// ??? sub_80B9028(???);
// ??? sub_80B90CC(???);
// ??? sub_80B9114(???);
void sub_80B9154(struct WorldMapMainProc *proc);
void sub_80B9218(ProcPtr);
s8 sub_80B92D0(struct WorldMapMainProc *, int);
void sub_80B93E0(struct WorldMapMainProc *);
// ??? sub_80B955C(???);
int sub_80B95B0(void);
// ??? sub_80B961C(???);
void sub_80B96DC(ProcPtr proc);
// ??? sub_80B96F8(???);
void sub_80B97F8(void);
void sub_80B9804(ProcPtr proc);
void sub_80B9810(ProcPtr);
void sub_80B9820(ProcPtr proc);
void sub_80B982C(struct WorldMapMainProc *proc);
s8 sub_80B987C(ProcPtr proc);
void sub_80B989C(void);
void sub_80B98A8(struct WorldMapMainProc *proc);
s8 sub_80B98F8(ProcPtr proc);
void sub_80B9918(void);
void sub_80B9924(struct WorldMapMainProc *proc);
s8 StartWorldmapStatusScreen(ProcPtr proc);
void sub_80B9994(void);
void sub_80B99A0(struct WorldMapMainProc *proc);
// ??? sub_80B99F0(???);
void WorldMap_HideEverything(void);
void sub_80B9A34(struct WorldMapMainProc *proc);
void sub_80B9A58(struct WorldMapMainProc *proc);
void Worldmap_WaitForSkirmishAnim(ProcPtr proc);
void sub_80B9AB0(void);
void sub_80B9AEC(struct WorldMapMainProc *proc);
void WorldMap_InitChapterTransition(struct WorldMapMainProc *proc);
void sub_80B9BA4(struct WorldMapMainProc *proc);
void WorldMap_WaitForChapterIntroEvents(ProcPtr proc);
void WorldMap_SetMonsterMergedState(void);
void WorldMap_GenerateRandomMonsters(ProcPtr proc);
void _WmMergeMonsters(void);
void WorldMap_WaitMonsterMerging(ProcPtr proc);
void Worlmap_StartGmapSogu(struct WorldMapMainProc * proc);
void Worlmap_WaitGmapSogu(ProcPtr proc);
// ??? sub_80B9E64(???);
void ResetWorldMapScreen(void);
void DoNothing(void);
void sub_80B9F14(ProcPtr proc);
void sub_80B9F24(ProcPtr proc);
void sub_80B9F34(ProcPtr proc);
void sub_80B9F44(ProcPtr proc);
void sub_80B9F54(ProcPtr unused);
void sub_80B9FC0(void);
void sub_80B9FD4(ProcPtr);
void sub_80BA008(int);
void EndWM(ProcPtr);
s8 sub_80BA054(void); // gmap something
// ??? sub_80BA06C(???);
void WmMergeFace(int timerMaybe, u8 b, int faceSlot, int fid, int e, int f, int config);
// ??? sub_80BA100(???);
// ??? sub_80BA198(???);
// ??? sub_80BA1F4(???);
// ??? sub_80BA288(???);
// ??? NewWorldMap(???);
void WorldMap_SetupChapterStuff(struct WorldMapMainProc *proc);
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
// ??? MMS_GetGfx(???);
// ??? MMS_GetROMTCS2(???);
// ??? GetMapUnitMMSGfxBuffer(???);
// ??? GmapUnit_Destruct(???);
// ??? GmapUnit_Init(???);
// ??? GmapUnit_Loop(???);
// ??? GetPaletteIdForAllegience(???);
int NewMapUnit(struct GMapUnitContainerProc * container, u16 classId, int faction);
void MapUnitC_DeleteGmapUnit(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetPosition(struct GMapUnitContainerProc * container, int index, int x, int y);
void MapUnitC_GetPosition(struct GMapUnitContainerProc * container, int index, u16 * x, u16 * y);
// ??? sub_80BAF58(???);
int MapUnitC_GetAnimId(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetAnimId(struct GMapUnitContainerProc * container, int index, int animId);
void MapUnitC_SetDisplayEnabled(struct GMapUnitContainerProc * container, int index, s8 flag);
// ??? MapUnitC_IsBlendEnabled(???);
void MapUnitC_SetBlendEnabled(struct GMapUnitContainerProc * container, int index, s8 flag);
int MapUnitC_GetLayer(struct GMapUnitContainerProc * container, int index);
void MapUnitC_SetLayer(struct GMapUnitContainerProc * container, int index, int layer);
// ??? MapUnitC_GetFaction(???);
void MapUnitC_SetFaction(struct GMapUnitContainerProc * container, int index, int faction);
// ??? MapUnitC_SetPalette(???);
void MapUnitC_SetGfxNeedsUpdate(struct GMapUnitContainerProc * container, int index);
s8 sub_80BB0E0(struct GMapUnitContainerProc * container, int index, int classId);
// ??? sub_80BB188(???);
int sub_80BB194(struct GMapUnitContainerProc * container, int index);
// ??? GmapUnitContainer_Destruct(???);
// ??? GmapUnitContainer_Init(???);
ProcPtr NewGmapUnitContainer(ProcPtr, int, int);
// ??? GmapUnitFade_Destruct(???);
// ??? GmapUnitFade_Init(???);
// ??? sub_80BB26C(???);
// ??? GmapUnitFade_Loop(???);
// ??? StartGmapUnitFade(???);
void EndGmapUnitFade(void);
ProcPtr GetGmapUnitFade(void);
// ??? sub_80BB49C(???);
void sub_80BB4C0(int index, int arg1, ProcPtr parent);
void sub_80BB538(int index, int arg1, ProcPtr parent);
int WMLoc_GetChapterId(int node);
int WMLoc_GetNextLocId(int idx);
int GetNodeAtPosition(void * unused, int arg1, int arg2, int arg3, int arg4);
// ??? sub_80BB6FC(???);
// ??? sub_80BB708(???);
// ??? GmapScreen2_Destruct(???);
// ??? GmapScreen2_Init(???);
// ??? sub_80BB744(???);
// ??? GmapScreen2_Loop(???);
ProcPtr sub_80BB9A4(ProcPtr, int, int, int, ProcPtr);
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
int sub_80BCE34(int, int, s16, u16 *, struct Struct0859E7D4 *, int);
void ResetGmStoryNode(void);
int sub_80BCFDC(u32);
int GetNextUnclearedNode(struct GMapData *);
u32 GetNextUnclearedChapter(void);
u32 GetBattleMapKind(void);
int sub_80BD20C(int);
int sub_80BD224(struct GMapData *);
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
void GmMu_ShowUnit(struct GMapMuProc *, int);
void GmMu_HideUnit(struct GMapMuProc *, int);
void sub_80BDEB4(struct GMapMuProc *, struct UnknownSub80BDEB4 *);
// ??? sub_80BDFA4(???);
void GmMu_PauseMovement(struct GMapMuProc *, int);
void GmMu_ResumeMovement(struct GMapMuProc *, int);
void sub_80BE080(struct GMapMuProc *, int, s8);
void sub_80BE0A4(struct GMapMuProc *, int, s16*, s16*);
// ??? sub_80BE0C8(???);
void GmMu_SetSpriteLayer(struct GMapMuProc *, int, int);
void GmMu_80BE108(struct GMapMuProc *, int, s8);
s8 sub_80BE12C(struct GMapMuProc *, int);
// ??? sub_80BE194(???);
// ??? sub_80BE330(???);
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
// ??? GmMoveCursor_OnEnd(???);
// ??? GmMoveCursor_OnInit(???);
// ??? GmMoveCursor_OnLoop(???);
ProcPtr StartGmMoveCursor(struct Vec2 * posA, struct Vec2 * posB, int c, int d, ProcPtr parent);
s8 GmMoveCursorExists(void);
// ??? GmScrollManage_OnEnd(???);
// ??? GmScrollManage_OnInit(???);
// ??? GmScrollManage_OnLoop(???);
// ??? StartGmScrollManage(???);
// s8 FindGmScrollManage(void);
void StartGmScroll(s16 xStart, s16 yStart, s16 xEnd, s16 yEnd, s16 speed, s16 delay);
// ??? sub_80BF490(???);
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
// ??? sub_80C13CC(???);
void EndGmapEffect(void);

// ??? sub_80C1BF8(???);
void sub_80C1D00(void);
void sub_80C1D70(void);
u16 * sub_80C1DA0(int, int);
void sub_80C1DC8(void);
void sub_80C1DD8(int, int);
void sub_80C1DE8(int);
// ??? sub_80C1DFC(???);
// ??? sub_80C1E14(???);
// ??? GmapRmUpdate1_Loop(???);
// ??? sub_80C1E40(???);
// ??? sub_80C1E54(???);
// ??? sub_80C1E70(???);
// ??? sub_80C1E8C(???);
void sub_80C1F18(s16, s16, s16, s16, s16, s16, s8); // StartGmapRMUpdate2
void sub_80C1F5C(void);
// ??? sub_80C1F6C(???);
// ??? sub_80C1FDC(???);
// ??? sub_80C1FE0(???);
// ??? sub_80C205C(???);
// ??? sub_80C2078(???);
// ??? sub_80C2094(???);
// ??? sub_80C20B0(???);
// ??? sub_80C210C(???);
// ??? sub_80C214C(???);
// ??? sub_80C224C(???);
// ??? sub_80C2290(???);
// ??? sub_80C22FC(???);
// ??? sub_80C2320(???);
// ??? sub_80C2398(???);
void Make6C_Gmap_RM(s16 x, s16 y, int mask, ProcPtr parent);
void sub_80C2460(void);
int sub_80C2470(void);
// ??? sub_80C2488(???);
void GetWMDisplayPosition(s16 *, s16 *);
void sub_80C24D8(void);
void sub_80C24F8(void);
// ??? sub_80C2598(???);
// ??? sub_80C25B8(???);
// ??? sub_80C25F8(???);
// ??? sub_80C2658(???);
// ??? sub_80C26BC(???);
// ??? sub_80C26E0(???);
// ??? sub_80C26F0(???);
// ??? sub_80C2708(???);
// ??? sub_80C2728(???);
// ??? sub_80C2750(???);
// ??? sub_80C27A8(???);
// ??? sub_80C2804(???);
// ??? sub_80C28C4(???);
// ??? sub_80C28DC(???);
// ??? sub_80C2964(???);
// ??? sub_80C298C(???);
// ??? sub_80C29F8(???);
// ??? sub_80C2A1C(???);
// ??? sub_80C2A40(???);
// ??? DrawWmNationHighLightMapGfx(???);
void WmShowNationHighlightedMap(int, int); // FEBuilder: "Display place name of world map"
void sub_80C2B7C(int);
int sub_80C2BC4(int);
void sub_80C2C10(int);
// ??? GmapRmBaPalAnim_End(???);
// ??? GmapRmBaPalAnim_Init(???);
// ??? sub_80C2C80(???);
// ??? GmapRmBaPalAnim_Loop1(???);
// ??? GmapRmBaPalAnim_Loop2(???);
// ??? sub_80C2E04(???);
// ??? sub_80C2E28(???);
// ??? sub_80C2E38(???);
// ??? sub_80C2E50(???);
// ??? sub_80C2E70(???);
// ??? sub_80C2EA4(???);
// ??? sub_80C2EF0(???);
// ??? sub_80C2F7C(???);
// ??? sub_80C2F9C(???);
void sub_80C2FC0(s16, s16, s16, s16, int, s8); // StartGmapRMBorder
void sub_80C304C(int);
int sub_80C3094(int);
void sub_80C30E0(int);
// ??? sub_80C3124(???);
// ??? sub_80C31A8(???);
// ??? sub_80C31C4(???);
// ??? sub_80C31E0(???);
// ??? sub_80C31FC(???);
// ??? sub_80C3220(???);
// ??? sub_80C3244(???);
// ??? sub_80C3264(???);
// ??? sub_80C3280(???);
// ??? sub_80C32E4(???);
// ??? sub_80C3350(???);
void sub_80C3378(void *, int, int); // StartGmapAutoMu_1
void sub_80C33D4(void *, int, int); // StartGmapAutoMu_2
void sub_80C343C(int); // EndGmAutoMuFor
s8 sub_80C3484(int); // GmAutoMuActiveFor
// ??? sub_80C34D0(???);
// ??? sub_80C3590(???);
// ??? sub_80C35C4(???);
// ??? sub_80C35EC(???);
void StartWmText(int);
void RemoveWmText(void);
void sub_80C368C(ProcPtr);
void sub_80C36A0(int);
// ??? sub_80C36E8(???);
// ??? sub_80C3770(???);
// ??? sub_80C380C(???);
// ??? sub_80C38BC(???);
// ??? sub_80C3A28(???);
// ??? sub_80C3A64(???);
// ??? sub_80C3A8C(???);
// ??? sub_80C3AB8(???);
// ??? sub_80C3B40(???);
// ??? sub_80C3BE4(???);
// ??? sub_80C3D24(???);
// ??? sub_80C3D5C(???);
// ??? sub_80C3D9C(???);
// ??? sub_80C3DAC(???);
void sub_80C3E80(void);
void sub_80C3E94(void);
// ??? nullsub_71(???);
// ??? sub_80C3EC8(???);
// ??? sub_80C3EDC(???);
// ??? sub_80C3F04(???);
// ??? sub_80C3F24(???);
// ??? sub_80C3F88(???);
// ??? sub_80C3FB4(???);
// ??? sub_80C3FE0(???);
void sub_80C400C(int, ProcPtr);
// ??? sub_80C4038(???);
// ??? sub_80C4048(???);
// ??? sub_80C4058(???);
int sub_80C4070(void);
int sub_80C4088();
void sub_80C409C(int);

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
// extern ??? gUnknown_0201BE30
// extern ??? gUnknown_0201BE32
// extern ??? gUnknown_0201C5B4
// extern ??? gUnknown_0201C5C0
// extern ??? gUnknown_0201C5CC
// extern ??? gUnknown_0201C5CF
// extern ??? gUnknown_0201C5D0
// extern ??? gUnknown_0201C5D1
// extern ??? gUnknown_0201C5D4

// extern ??? gProcScr_WorldMapFaceHolder
// extern ??? gProcScr_WorldMapFaceCtrl
// extern ??? gUnknown_08A3D728
// extern ??? gProcScr_WorldMapMain
// extern ??? gProcScr_08A3DD08
// extern ??? gProcScr_08A3DD20
// extern ??? gProcScr_08A3DD38
// extern ??? gWMSongTable
// extern ??? gProcScr_GMapScreenVSync
// extern ??? gProcScr_GMapScreen
// extern ??? gProcScr_GmapUnit
// extern ??? gProcScr_GmapUnitContainer
// extern ??? gProcScr_GmapUnitFade
extern struct ProcCmd gProcScr_GmNodeIconDisplay[];
// extern ??? gProcScr_GmapCursor
// extern ??? gProcScr_GMapRoute
// extern ??? gMenu_WMGeneralMenu
// extern ??? gMenuRect_WMGeneralMenuRect
// extern ??? gMenu_WMNodeMenu
// extern ??? gMenuRect_WMNodeMenuRectA
// extern ??? gMenuRect_WMNodeMenuRectB
// extern ??? gUnknown_08A3E22C
// extern ??? gUnknown_08A3E23C
// extern ??? gProcScr_GMapMuPrim
// extern ??? gProcScr_GMapMu
// extern ??? gGMapMuSpriteLayerLut
// extern ??? gUnknown_08A3E2F8
// extern ??? gUnknown_08A3E31C
// extern ??? gUnknown_08A3E360
// extern ??? gUnknown_08A3E38E
// extern ??? gUnknown_08A3E3BA
// extern ??? gUnknown_08A3E412
// extern ??? gUnknown_08A3E448
// extern ??? gUnknown_08A3E4D4
// extern ??? gProcScr_GmMoveCursor
// extern ??? gProcScr_GmScrollManage
// extern ??? gProcScr_GmapPalFade
// extern ??? gProcScr_GmapBaseEntry
// extern ??? gProcScr_GmapMuEntry1
// extern ??? gProcScr_GmapMuEntry2
// extern ??? gProcScr_GmapLineFade
// extern ??? gProcScr_GmapTmConfront
// extern ??? gHelpInfo_WorldmapStatus
// extern ??? gBgConfig_WorldmapStatus
extern struct ProcCmd gProcScr_WorldmapStatusUi[];
// extern ??? gUnknown_08A3E9A0
// extern ??? gProcScr_GmapEffectPal
// extern ??? gProcScr_GmapEffect
extern struct ProcCmd ProcScr_GmapSogu[];
extern struct ProcCmd ProcScr_GmapTimeMons[];
// extern ??? ProcScr_GmapRmUpdate1
// extern ??? ProcScr_GmapRmUpdate2
// extern ??? ProcScr_GmapRM
// extern ??? ProcScr_GmapRmBaPalAnim
// extern ??? ProcScr_GmapRmBorder
// extern ??? ProcScr_GmapRmBaPalAnim2
// extern ??? gUnknown_08A3ED10
// extern ??? gUnknown_08A3ED18
// extern ??? gUnknown_08A3ED60
// extern ??? gUnknown_08A3EE28
// extern ??? gUnknown_08A3EE44
// extern ??? gUnknown_08A3EE6C
// extern ??? gUnknown_08A3EE70
// extern ??? gUnknown_08A3EE74
// extern ??? gUnknown_08A3EED4
// extern ??? gUnknown_08A3EEEC

#endif // GUARD_WORLDMAP_H
