#ifndef GUARD_TYPES_H
#define GUARD_TYPES_H

#include "gba/types.h"

#ifndef __STDBOOL_H__
typedef s8 bool;
enum { false, true };
#define false	false
#define true	true
#define __bool_true_false_are_defined	1
#endif /* bool */

// Forward declarations for common types
struct Proc;
struct Unit;

// Forward declarations for types that may need to be declared elsewhere later?
struct BattleUnit; // currently in bmunit.h
struct UnitDefinition; // currently in bmunit.h
struct Trap;
struct BattleHit;
struct PopupInstruction;
struct MAInfoFrameProc;
struct MAExpBarProc;
struct ProcAtMenu;
struct PrepUnitList;
struct TextHandle;
struct Anim;

// Type definitions for types without any other home :/

enum glb_pos
{
    POS_L,
    POS_R
};

struct BgCoords
{
    u16 x;
    u16 y;
};

struct Struct03003080
{
    /*0x00*/ struct DispCnt dispcnt;
    /*0x04*/ struct DispStat dispstat;
    /*0x08*/ u8 filler8[4];
    /*0x0C*/ struct BgCnt bg0cnt;
    /*0x10*/ struct BgCnt bg1cnt;
    /*0x14*/ struct BgCnt bg2cnt;
    /*0x18*/ struct BgCnt bg3cnt;
    /*0x1C*/ struct BgCoords bgoffset[4];
    /*0x2C*/ u8 win0_right, win0_left;
    /*0x2C*/ u8 win1_right, win1_left;
    /*0x30*/ u8 win0_bottom, win0_top;
    /*0x30*/ u8 win1_bottom, win1_top;
    /*0x34*/ struct WinCnt wincnt;
    /*0x38*/ u16 mosaic;
             u8 filler3A[2];
    /*0x3C*/ struct BlendCnt bldcnt;
    /*0x40*/ u8 filler40[4];
    /*0x44*/ u8 blendCoeffA;
    /*0x45*/ u8 blendCoeffB;
    /*0x46*/ u8 blendY;
    /*0x48*/ u16 bg2pa;
    /*0x4A*/ u16 bg2pb;
    /*0x4C*/ u16 bg2pc;
    /*0x4E*/ u16 bg2pd;
    /*0x50*/ u32 bg2x;
    /*0x54*/ u32 bg2y;
    /*0x58*/ u16 bg3pa;
    /*0x5A*/ u16 bg3pb;
    /*0x5C*/ u16 bg3pc;
    /*0x5E*/ u16 bg3pd;
    /*0x60*/ u32 bg3x;
    /*0x64*/ u32 bg3y;
    /*0x68*/ s8 colorAddition;
};

struct Struct0858791C
{
    u8 filler0[4];
    u16 unk2;
};

struct TileDataTransfer
{
    const void *src;
    void *dest;
    u16 size;
    u16 mode;
};

struct OamDataTransfer
{
    void *src;
    void *dest;
    u16 unk8;
    u16 count;
};

struct Struct02024CD4
{
    int count;
    int size;
};

struct KeyStatusBuffer
{
    /* 00 */ u8 repeatDelay;     // initial delay before generating auto-repeat presses
    /* 01 */ u8 repeatInterval;  // time between auto-repeat presses
    /* 02 */ u8 repeatTimer;     // (decreased by one each frame, reset to repeatDelay when Presses change and repeatInterval when reaches 0)
    /* 04 */ u16 heldKeys;       // keys that are currently held down
    /* 06 */ u16 repeatedKeys;   // auto-repeated keys
    /* 08 */ u16 newKeys;        // keys that went down this frame
    /* 0A */ u16 prevKeys;       // keys that were held down last frame
    /* 0C */ u16 LastPressState;
    /* 0E */ bool16 ABLRPressed; // 1 for Release (A B L R Only), 0 Otherwise
    /* 10 */ u16 newKeys2;
    /* 12 */ u16 TimeSinceStartSelect; // Time since last Non-Start Non-Select Button was pressed
};

typedef void (*InterruptHandler)(void);

struct Vec2 { short x, y; };
struct Vec2u { u16 x, y; };

struct BmSt // Game State Struct
{
    /* 00 */ s8  mainLoopEndedFlag;

    /* 01 */ s8  gameLogicSemaphore;
    /* 02 */ s8  gameGfxSemaphore;

    /* 03 */ u8  _unk04;

    /* 04 */ u8  gameStateBits;

    /* 05 */ u8  _unk05;

    /* 06 */ u16 prevVCount;

    /* 08 */ u32 _unk08;

    /* 0C */ struct Vec2 camera;
    /* 10 */ struct Vec2 cameraPrevious;
    /* 14 */ struct Vec2 playerCursor;
    /* 18 */ struct Vec2 cursorPrevious;
    /* 1C */ struct Vec2 cursorTarget;
    /* 20 */ struct Vec2 playerCursorDisplay;
    /* 24 */ struct Vec2u mapRenderOrigin;
    /* 28 */ struct Vec2 cameraMax;

    /* 2C */ u16 itemUnk2C;
    /* 2E */ u16 itemUnk2E;

    /* 30 */ u16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;
    /* 36 */ s8 unk36;
    /* 37 */ s8 unk37;
    /* 38 */ u8 altBlendACa;
    /* 39 */ u8 altBlendACb;
    /* 3A */ u8 altBlendBCa;
    /* 3B */ u8 altBlendBCb;
    /* 3C */ u8 just_resumed;
    /* 3D */ u8 unk3D;
    /* 3E */ u8 unk3E;
    /* 3F */ s8 unk3F;
};

enum BmSt_gameStateBits {
    BM_FLAG_0 = (1 << 0),
    BM_FLAG_1 = (1 << 1),
    BM_FLAG_2 = (1 << 2),
    BM_FLAG_3 = (1 << 3),
    BM_FLAG_4 = (1 << 4),
    BM_FLAG_5 = (1 << 5),
    BM_FLAG_LINKARENA = (1 << 6),
};

struct PlaySt_30 {
    int total_gold;

    u32 unk_4_00 : 0x14;
    u32 unk_4_14 : 0x0C;

    u32 unk_8_1:8;
    u32 unk_8_2:20; // Used by bmdifficulty (Valni/Lagdou)
    u32 unk_8_3:4;

    u32 unk_C_00 : 6;
    u32 combatRank : 3;
    u32 expRank : 3;
    u32 unk_3D_04 : 3;
    u32 fundsRank : 3;
    u32 tacticsRank : 3;
    u32 survivalRank : 3;
    u32 unk_F_00 : 8;
};

struct PlaySt { // Chapter Data Struct
    /* 00 */ u32 time_saved;
    /* 04 */ u32 time_chapter_started;

    /* 08 */ u32 partyGoldAmount;
    /* 0C */ u8  gameSaveSlot;

    /* 0D */ u8  chapterVisionRange; // 0 means no fog
    /* 0E */ s8  chapterIndex;

    /* 0F */ u8  faction; // 0x00 = Player phase, 0x40 = NPC phase, 0x80 = Enemy phase (0xC0 = link arena 4th team?)

    /* 10 */ u16 chapterTurnNumber;

    /* 12 */ u8  xCursor, yCursor; // map cursor position

    /* 14 */ u8  chapterStateBits; // +0x04 = postgame, +0x10 = in prep screen, +0x40 = difficult mode, +0x80 = link arena?
    /* 15 */ u8  chapterWeatherId;
    /* 16 */ u16 chapterTotalSupportGain;

    /* 18 */ u8 playthroughIdentifier;
    /* 19 */ u8 unk19;
    /* 1A */ u8 lastUnitSortType;

    /* 1B */ u8  chapterModeIndex; // 1 for tutorial (ch0-8), 2 for Eirika route, 3 for Ephraim route

    // character identifiers indexed by weapon type.
    // has to do with allowing unusable weapons to be used
    /* 1C */ u8  unk1C[2];
    /* 1E */ u8 unk1E;
    /* 1F */ u8 unk1F;

    /* 20 */ char playerName[0x2B - 0x20]; // unused outside of link arena (was tactician name in FE7); Size unknown

    /* 2B */ u8 unk_2B_00 : 0x01;
             u8 unk_2B_01 : 0x07;

    u32 unk_2C_1:1;
    u32 unk_2C_01 : 0x03;
    u32 unk_2C_04 : 0x09;
    u32 unk_2C_0D : 0x0A;
    u32 unk_2C_2:5;
    u32 unk_2C_3:4;

    struct PlaySt_30 unk_30;

    // option bits
    u32 cfgUnitColor:1; // 1
    u32 cfgDisableTerrainDisplay:1; // 1
    u32 cfgUnitDisplayType:2; // 2
    u32 cfgAutoCursor:1; // 1
    u32 cfgTextSpeed:2;
    u32 cfgGameSpeed:1; // 1
    u32 cfgDisableBgm:1; // 1
    u32 cfgDisableSoundEffects:1; // 1
    u32 cfgWindowColor:2;
    u32 unk41_5:1; // 1
    u32 unk41_6:1; // unk
    u32 cfgDisableAutoEndTurns:1; // 1
    u32 cfgNoSubtitleHelp:1; // 1
    u32 cfgDisableGoalDisplay:1; // unk
    u32 cfgAnimationType:2; // 2
    u32 cfgBattleForecastType:2; // 2
    u32 cfgController:1; // 1
    u32 cfgRankDisplay:1; // unk
    u32 debugControlRed:2; // 2 (!)
    u32 debugControlGreen:2; // 2
    u32 unk43_4:5; // unk

    u8  unk44[0x48 - 0x44];

    u16 unk48;

    u8 unk4A_1 : 1;
    u8 unk4A_2 : 3;
    u8 unk4A_5 : 4;
    u8 unk4B;
};

/**
 * Use with PlaySt field chapterStateBits
 */

enum PlaySt_chapterStateBits {
    PLAY_FLAG_STATSCREENPAGE0 = (1 << 0),
    PLAY_FLAG_STATSCREENPAGE1 = (1 << 1),
    PLAY_FLAG_POSTGAME        = (1 << 2),
    PLAY_FLAG_TUTORIAL        = (1 << 3),
    PLAY_FLAG_PREPSCREEN      = (1 << 4),
    PLAY_FLAG_COMPLETE        = (1 << 5),
    PLAY_FLAG_HARD            = (1 << 6),
    PLAY_FLAG_7               = (1 << 7),

    PLAY_FLAG_STATSCREENPAGE_SHIFT = 0,
    PLAY_FLAG_STATSCREENPAGE_MASK = PLAY_FLAG_STATSCREENPAGE0 | PLAY_FLAG_STATSCREENPAGE1,
};

/**
 * Use with PlaySt field chapterModeIndex
 */

enum PlaySt_chapterModeIndex {
    CHAPTER_MODE_COMMON = 1,
    CHAPTER_MODE_EIRIKA = 2,
    CHAPTER_MODE_EPHRAIM = 3,
};

struct TextBuffer0202A6AC
{
    u8 buffer0202A6AC[0x555];
    u8 buffer0202AC01[0x555];
    u8 buffer0202B156[0x356];
    u8 buffer0202B4AC[0x100];
    u8 buffer0202B5AC[1];  // unknown length
};

struct ActionData
{
    // unknown stuff (sometimes RNs are pushed here) (maybe an union?)
    /* 00 */ u16 _u00[3];
    /* 06 */ u16 item;

    /* 08 */ u16 unk08;
    /* 0A */ u16 unk0A;

    /* 0C */ u8 subjectIndex;
    /* 0D */ u8 targetIndex;

    /* 0E */ u8 xMove;
    /* 0F */ u8 yMove;

    /* 10 */ u8 moveCount;

    /* 11 */ u8 unitActionType;

    // maybe from this onwards it's an union?

    /* 12 */ u8 itemSlotIndex;

    /* 13 */ u8 xOther;
    /* 14 */ u8 yOther;

    /* 15 */ u8 trapType;

    /* 16 */ u8 suspendPointType;

    /* 18 */ struct BattleHit* scriptedBattleHits;

    /* 1C */ u8 _pad_1C[0x38 - 0x1C];
};

enum
{
    FACING_LEFT  = 0,
    FACING_RIGHT = 1,
    FACING_DOWN  = 2,
    FACING_UP    = 3,
};

enum
{
    // 0x00?
    UNIT_ACTION_WAIT = 0x01,
    UNIT_ACTION_COMBAT = 0x02,
    UNIT_ACTION_STAFF = 0x03,
    UNIT_ACTION_DANCE = 0x04,
    // 0x05?
    UNIT_ACTION_STEAL = 0x06,
    UNIT_ACTION_SUMMON = 0x07,
    UNIT_ACTION_SUMMON_DK = 0x08,
    UNIT_ACTION_RESCUE = 0x09,
    UNIT_ACTION_DROP = 0x0A,
    UNIT_ACTION_TAKE = 0x0B,
    UNIT_ACTION_GIVE = 0x0C,
    // 0x0D?
    UNIT_ACTION_TALK = 0x0E,
    UNIT_ACTION_SUPPORT = 0x0F,
    UNIT_ACTION_VISIT = 0x10,
    UNIT_ACTION_SEIZE = 0x11,
    UNIT_ACTION_DOOR = 0x12,
    // 0x13?
    UNIT_ACTION_CHEST = 0x14,
    UNIT_ACTION_PICK = 0x15,
    // 0x16?
    UNIT_ACTION_SHOPPED = 0x17,
    // 0x18?
    UNIT_ACTION_ARENA = 0x19,
    UNIT_ACTION_USE_ITEM = 0x1A,
    UNIT_ACTION_TRADED = 0x1B,
    UNIT_ACTION_TRADED_SUPPLY = 0x1C,
    UNIT_ACTION_TRADED_1D = 0x1D,
    UNIT_ACTION_TRAPPED = 0x1E,
    // 0x1F?
    // 0x20?
    UNIT_ACTION_RIDE_BALLISTA = 0x21,
    UNIT_ACTION_EXIT_BALLISTA = 0x22
};

enum
{
    SUSPEND_POINT_PLAYERIDLE = 0,
    SUSPEND_POINT_DURINGACTION = 1,
    SUSPEND_POINT_CPPHASE = 2,
    SUSPEND_POINT_BSKPHASE = 3,
    SUSPEND_POINT_DURINGARENA = 4,
    SUSPEND_POINT_5 = 5,
    SUSPEND_POINT_6 = 6,
    SUSPEND_POINT_7 = 7,
    SUSPEND_POINT_8 = 8,
    SUSPEND_POINT_PHASECHANGE = 9
};

enum
{
    GAME_ACTION_0 = 0,
    GAME_ACTION_1 = 1,
    GAME_ACTION_2 = 2,
    GAME_ACTION_3 = 3,
    GAME_ACTION_4 = 4,
    GAME_ACTION_5 = 5,
    GAME_ACTION_6 = 6,
    GAME_ACTION_7 = 7,
    GAME_ACTION_8 = 8,
    GAME_ACTION_9 = 9,
    GAME_ACTION_A = 0xA,
    GAME_ACTION_B = 0xB,
    GAME_ACTION_C = 0xC,
};

enum
{
    WEATHER_FINE = 0,
    WEATHER_SNOW = 1,
    WEATHER_SNOWSTORM = 2,
    WEATHER_NIGHT = 3,
    WEATHER_RAIN = 4,
    WEATHER_FLAMES = 5,
    WEATHER_SANDSTORM = 6,
    WEATHER_CLOUDS = 7
};

enum
{
    GOAL_TYPE_SEIZE = 0,
    GOAL_TYPE_DEFEAT_ALL = 1,
    GOAL_TYPE_DEFENSE = 2,
    GOAL_TYPE_DEFEAT_BOSS = 3,
    GOAL_TYPE_SPECIAL = 4,
};

struct SMSHandle
{
    /* 00 */ struct SMSHandle* pNext;

    /* 04 */ short xDisplay;
    /* 06 */ short yDisplay;

    /* 08 */ u16 oam2Base;

    /* 0A */ u8 _u0A;
    /* 0B */ s8 config;
};

struct MMSData
{
    const void* pGraphics;
    const void* pAnimation;
};

struct GMUnit {
    /* 00 */ u8 state;
    /* 01 */ u8 location;
    /* 02 */ s16 id; // character or class ID
};

struct GMNode {
    /* 00 */ u8 state;
};

union GMStateBits {
    u8 raw;
    struct {
        u8 state_0   : 1;
        u8 state_1   : 1;
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
    /* 08 */ u32 unk08;
    /* 0C */ u32 unk0C;
    /* 10 */ struct GMUnit unk10[8];
    /* 30 */ struct GMNode unk30[0x1C];
    /* A0 */ int unk_a0; // pad?
    /* A4 */ struct OpenPaths routeData;
    /* C8 */ u8 unk_c8; // entry node id?
    /* C9 */ u8 unk_c9[3]; // List of active world map skirmishes
    /* CC */ u8 unk_cc; // used to determine which skirmish enemy block to load
};


enum
{
    // For use with GMapData:state

    GMAP_STATE_BIT0 = (1 << 0),
    GMAP_STATE_BIT1 = (1 << 1),
    GMAP_STATE_BIT2 = (1 << 2),
    GMAP_STATE_BIT3 = (1 << 3),
    GMAP_STATE_BIT4 = (1 << 4),
    GMAP_STATE_BIT5 = (1 << 5),
    GMAP_STATE_BIT6 = (1 << 6),
    GMAP_STATE_BIT7 = (1 << 7),
};

struct MapChange
{
    /* 00 */ s8 id;
    /* 01 */ u8 xOrigin;
    /* 02 */ u8 yOrigin;
    /* 03 */ u8 xSize;
    /* 04 */ u8 ySize;
    /* 08 */ const void* data;
};

enum { UNIT_SUPPORT_MAX_COUNT = 7 };

enum
{
    FACE_BLINK_NORMAL = 1,
    FACE_BLINK_CLOSED = 6,
};

struct FaceData
{
    /* 00 */ const u8*  img;
    /* 04 */ const u8*  imgChibi;
    /* 08 */ const u16* pal;
    /* 0C */ const u8*  imgMouth;
    /* 10 */ const u8*  imgCard;
    /* 14 */ u8 xMouth, yMouth;
    /* 16 */ u8 xEyes,  yEyes;
    /* 18 */ u8 blinkKind;
};

struct FaceVramEntry
{
    /* 00 */ u32 tileOffset;
    /* 04 */ u16 paletteId;
};

struct Struct202B6B0 {
    u8 _pad00_[0x2A - 0x00];
    u16 unk2A;
    u8 _pad2C[0x5A - 0x2C];
    u16 unk5A;
    u8 _pad5C[0x8A - 0x5C];
    u16 unk8A;
};

struct Struct203E87C {
    u8 unk00[5];
};

struct EfxFrameConfig {
    s16 value;
    s16 duration;
};

#endif // GUARD_TYPES_H
