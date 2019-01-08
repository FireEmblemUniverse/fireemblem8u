#ifndef GUARD_TYPES_H
#define GUARD_TYPES_H

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
    /*0x2C*/ u16 win0h;
    /*0x2C*/ u16 win1h;
    /*0x30*/ u16 win0v;
    /*0x30*/ u16 win1v;
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
    void *src;
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
    int unk0;
    int unk4;
};

struct KeyStatusBuffer
{
    u8 repeatDelay;     // initial delay before generating auto-repeat presses
    u8 repeatInterval;  // time between auto-repeat presses
    u8 repeatTimer;     // (decreased by one each frame, reset to repeatDelay when Presses change and repeatInterval when reaches 0)
    u16 heldKeys;       // keys that are currently held down
    u16 repeatedKeys;   // auto-repeated keys
    u16 newKeys;        // keys that went down this frame
    u16 prevKeys;       // keys that were held down last frame
    u16 LastPressState;
    bool16 ABLRPressed; // 1 for Release (A B L R Only), 0 Otherwise
    u16 newKeys2;
    u16 TimeSinceStartSelect; // Time since last Non-Start Non-Select Button was pressed
};

typedef void (*InterruptHandler)(void);

struct Struct0202BCB0 // Game State Struct
{
    /* 00 */ u8  mainLoopEndedFlag;

    /* 01 */ s8  gameLogicSemaphore;
    /* 02 */ s8  gameGfxSemaphore;

    /* 03 */ u8  _unk04;

    /* 04 */ u8  gameStateBits;

    /* 05 */ u8  _unk05;

    /* 06 */ u16 prevVCount;

    /* 08 */ u32 _unk08;

    /* 0C */ short xCameraReal;
    /* 0E */ short yCameraReal;

    /* 10 */ u32 _unk10;

    /* 14 */ short xPlayerCursor;
    /* 16 */ short yPlayerCursor;

    /* 18 */ u32 _unk18;

    /* 1C */ short xUnk1C;
    /* 1E */ short yUnk1C;

    /* 20 */ short xPlayerCursorDisplay;
    /* 22 */ short yPlayerCursorDisplay;

    /* 24 */ short xUnk24;
    /* 26 */ short yUnk24;

    /* 28 */ short xUnk28;
    /* 2A */ short yUnk28;

    /* 2C */ u16 itemUnk2C;
    /* 2E */ u16 itemUnk2E;

    /* 30 */ u8 _pad30[0x3C - 0x30];

    /* 3C */ u8 unk3C;
    /* 3D */ u8 unk3D;
    /* 3E */ u8 unk3E;
    /* 3F */ u8 unk3F;
};

struct Struct0202BCF0 { // Chapter Data Struct
    /* 00 */ u32 unk0; // a time value
    /* 04 */ u32 unk4; // a time value

    /* 08 */ u32 partyGoldAmount;
    /* 0C */ u8  gameSaveSlot;

    /* 0D */ u8  chapterVisionRange; // 0 means no fog
    /* 0E */ s8  chapterIndex;

    /* 0F */ u8  chapterPhaseIndex; // 0x00 = Player phase, 0x40 = NPC phase, 0x80 = Enemy phase (0xC0 = link arena 4th team?)

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
    /* 1C */ u8  unk1C[4];

    /* 20 */ char playerName[0x40 - 0x20]; // unused outside of link arena (was tactician name in FE7); Size unknown

    // option bits
    u32 unk40_1:1; // 1
    u32 unk40_2:1; // 1
    u32 unk40_3:2; // 2
    u32 unk40_5:1; // 1
    u32 unk40_6:2; // 2, text speed
    u32 unk40_8:1; // 1
    u32 unk41_1:1; // 1
    u32 unk41_2:1; // 1
    u32 unk41_3:2; // 2
    u32 unk41_5:1; // 1
    u32 unk41_6:1; // unk
    u32 unk41_7:1; // 1
    u32 unk41_8:1; // 1
    u32 unk42_1:1; // unk
    u32 unk42_2:2; // 2
    u32 unk42_4:2; // 2
    u32 unk42_6:1; // 1
    u32 unk42_7:1; // unk
    u32 unk42_8:2; // 2 (!)
    u32 unk43_2:2; // 2
    u32 unk43_4:5; // unk

    u8  unk44[0x48 - 0x44];

    u16 unk48;

    unsigned unk4A_1 : 1;
    unsigned unk4A_2 : 3;
    unsigned unk4A_5 : 4;
    u8 unk4B;
};

/**
 * Use with Struct0202BCF0 field chapterStateBits
 */
enum {
    CHAPTER_FLAG_0          = (1 << 0),
    CHAPTER_FLAG_1          = (1 << 1),
    CHAPTER_FLAG_POSTGAME   = (1 << 2),
    CHAPTER_FLAG_3          = (1 << 3),
    CHAPTER_FLAG_PREPSCREEN = (1 << 4),
    CHAPTER_FLAG_5          = (1 << 5),
    CHAPTER_FLAG_DIFFICULT  = (1 << 6),
    CHAPTER_FLAG_7          = (1 << 7)
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
    /* 06 */ u16 unk6;

    /* 08 */ u16 unk08[2];

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

    /* 17+ TODO (sizeof(struct ActionData) == 0x38) */
};

enum {
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
    // 0x1B?
    // 0x1C?
    UNIT_ACTION_TRADED = 0x1D,
    // 0x1E?
    // 0x1F?
    // 0x20?
    UNIT_ACTION_RIDE_BALLISTA = 0x21,
    UNIT_ACTION_EXIT_BALLISTA = 0x22
};

enum {
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

enum {
    GAME_ACTION_3 = 3
};

enum {
    WEATHER_NONE = 0,
    WEATHER_SNOW = 1,
    WEATHER_SNOWSTORM = 2,
    WEATHER_3 = 3,
    WEATHER_RAIN = 4,
    WEATHER_FLAMES = 5,
    WEATHER_SANDSTORM = 6,
    WEATHER_CLOUDS = 7
};

struct UnknownStructCTC
{
    struct UnknownStructCTC *unk0;
    s16 unk4;
    s16 unk6;
    u16 unk8;
    u8 fillerA[2];
    const void *unkC;
};

struct ItemStatBonuses {
    s8 hpBonus;
    s8 powBonus;
    s8 sklBonus;
    s8 spdBonus;
    s8 defBonus;
    s8 resBonus;
    s8 lckBonus;
    s8 conBonus;
    s8 movBonus;
};

struct ItemData {
    u16 nameTextId; //0
    u16 descTextId; //2
    u16 useDescTextId; //4

    u8  number; //6
    u8  weaponType; //7

    u32 attributes; //8

    const struct ItemStatBonuses* pStatBonuses; //c
    const u8* pEffectiveness; //10

    u8  maxUses; //14

    u8  might; //15
    u8  hit; //16
    u8  weight; //17
    u8  crit; //18

    u8 encodedRange; //19

    u16 costPerUse; //1a
    u8  weaponRank; //1c
    u8  iconId; //1d
    u8  useEffectId; //1e
    u8  weaponEffectId; //1f
    u8  weaponExp; //20

    u8  _u21[3]; //21
};

struct SMSHandle {
    /* 00 */ struct SMSHandle* pNext;

    /* 04 */ short xDisplay;
    /* 06 */ short yDisplay;

    /* 08 */ u16 oam2Base;

    /* 0A */ u8 _u0A;
    /* 0B */ s8 config;
};

struct CharacterData {
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u8 number;
    /* 05 */ u8 defaultClass;
    /* 06 */ u16 portraitId;
    /* 08 */ u8 miniPortrait;
    /* 09 */ u8 affinity;
    /* 0A */ u8 _u0A;

    /* 0B */ s8 baseLevel;
    /* 0C */ s8 baseHP;
    /* 0D */ s8 basePow;
    /* 0E */ s8 baseSkl;
    /* 0F */ s8 baseSpd;
    /* 10 */ s8 baseDef;
    /* 11 */ s8 baseRes;
    /* 12 */ s8 baseLck;
    /* 13 */ s8 baseCon;

    /* 14 */ u8 baseRanks[8];

    /* 1C */ s8 growthHP;
    /* 1D */ s8 growthPow;
    /* 1E */ s8 growthSkl;
    /* 1F */ s8 growthSpd;
    /* 20 */ s8 growthDef;
    /* 21 */ s8 growthRes;
    /* 22 */ s8 growthLck;

    /* 23 */ u8 _u23;
    /* 24 */ u8 _u24;
    /* 25 */ u8 _u25;
    /* 26 */ u8 _u26;
    /* 27 */ u8 _u27;

    /* 28 */ u32 attributes;

    /* 2C */ void* pSupportData;
    /* 30 */ void* _pU30;
};

struct ClassData {
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u8 number;
    /* 05 */ u8 promotion;
    /* 06 */ u8 SMSId;
    /* 07 */ u8 slowWalking;
    /* 08 */ u16 defaultPortraitId;
    /* 0A */ u8 _u0A;

    /* 0B */ s8 baseHP;
    /* 0C */ s8 basePow;
    /* 0D */ s8 baseSkl;
    /* 0E */ s8 baseSpd;
    /* 0F */ s8 baseDef;
    /* 10 */ s8 baseRes;
    /* 11 */ s8 baseCon;
    /* 12 */ s8 baseMov;

    /* 13 */ s8 maxHP;
    /* 14 */ s8 maxPow;
    /* 15 */ s8 maxSkl;
    /* 16 */ s8 maxSpd;
    /* 17 */ s8 maxDef;
    /* 18 */ s8 maxRes;
    /* 19 */ s8 maxCon;

    /* 1A */ u8 classRelativePower;

    /* 1B */ s8 growthHP;
    /* 1C */ s8 growthPow;
    /* 1D */ s8 growthSkl;
    /* 1E */ s8 growthSpd;
    /* 1F */ s8 growthDef;
    /* 20 */ s8 growthRes;
    /* 21 */ s8 growthLck;

    /* 22 */ u8 promotionHP;
    /* 23 */ u8 promotionPow;
    /* 24 */ u8 promotionSkl;
    /* 25 */ u8 promotionSpd;
    /* 26 */ u8 promotionDef;
    /* 27 */ u8 promotionRes;

    /* 28 */ u32 attributes;

    /* 2C */ u8 baseRanks[8];

    /* 34 */ const void* pBattleAnimDef;
    /* 38 */ const u8* pMovCostTable[3]; // standard, rain, snow
    /* 44 */ const u8* pTerrainBonusTables[3]; // def, avo, res

    /* 50 */ const void* _pU50;
};

enum {
    US_NONE         = 0,

    US_HIDDEN       = (1 << 0),
    US_UNSELECTABLE = (1 << 1),
    US_DEAD         = (1 << 2),
    US_NOT_DEPLOYED = (1 << 3),
    US_RESCUING     = (1 << 4),
    US_RESCUED      = (1 << 5),
    US_HAS_MOVED    = (1 << 6), // Bad name?
    US_CANTOING     = US_HAS_MOVED, // Alias
    US_UNDER_A_ROOF = (1 << 7),
    US_BIT8 = (1 << 8),
    // = (1 << 9),
    US_HAS_MOVED_AI = (1 << 10),
    US_IN_BALLISTA  = (1 << 11),
    US_DROP_ITEM    = (1 << 12),
    US_GROWTH_BOOST = (1 << 13),
    US_SOLOANIM_1   = (1 << 14),
    US_SOLOANIM_2   = (1 << 15),
    US_BIT16        = (1 << 16),
    // = (1 << 17),
    // = (1 << 18),
    // = (1 << 19),
    US_BIT20        = (1 << 20),
    US_BIT21        = (1 << 21),
    US_BIT22        = (1 << 22),
    // = (1 << 23),
    // = (1 << 24),
    US_BIT25 = (1 << 25),
    US_BIT26 = (1 << 26),
    // = (1 << 27),
    // = (1 << 28),
    // = (1 << 29),
    // = (1 << 30),
    // = (1 << 31),

    // Helpers
    US_UNAVAILABLE = (US_DEAD | US_NOT_DEPLOYED | US_BIT16),
};

enum {
    UNIT_STATUS_NONE = 0,

    UNIT_STATUS_POISON = 1,
    UNIT_STATUS_SLEEP = 2,
    UNIT_STATUS_SILENCED = 3,
    UNIT_STATUS_BERSERK = 4,

    UNIT_STATUS_10 = 10,
};

enum {
    CA_NONE = 0,

    CA_MOUNTEDAID = (1 << 0),
    CA_CANTO = (1 << 1),
    CA_STEAL = (1 << 2),
    CA_LOCKPICK = (1 << 3),
    CA_DANCE = (1 << 4),
    CA_PLAY = (1 << 5),
    CA_CRITBONUS = (1 << 6),
    CA_BALLISTAE = (1 << 7),
    CA_PROMOTED = (1 << 8),
    CA_SUPPLY = (1 << 9),
    CA_MOUNTED = (1 << 10),
    CA_WYVERN = (1 << 11),
    CA_PEGASUS = (1 << 12),
    CA_LORD = (1 << 13),
    CA_FEMALE = (1 << 14),
    CA_BOSS = (1 << 15),
    CA_LOCK_1 = (1 << 16),
    CA_LOCK_2 = (1 << 17),
    CA_LOCK_3 = (1 << 18), // Dragons or Monster depending of game
    CA_MAXLEVEL10 = (1 << 19),
    CA_UNSELECTABLE = (1 << 20),
    CA_TRIANGLEATTACK_PEGASI = (1 << 21),
    CA_TRIANGLEATTACK_ARMORS = (1 << 22),
    CA_BIT_23 = 0x00800000,
    // = 0x01000000,
    CA_LETHALITY = 0x02000000,
    CA_MAGICSEAL = 0x04000000,
    CA_SUMMON = 0x08000000,
    CA_LOCK_4 = 0x10000000,
    CA_LOCK_5 = 0x20000000,
    CA_LOCK_6 = 0x40000000,
    CA_LOCK_7 = 0x80000000,

    // Helpers
    CA_REFRESHER = CA_DANCE | CA_PLAY,
};

struct Unit {
    /* 00 */ const struct CharacterData* pCharacterData;
    /* 04 */ const struct ClassData* pClassData;

    /* 08 */ s8 level;
    /* 09 */ u8 exp;
    /* 0A */ u8 _u0A;

    /* 0B */ s8 index;

    /* 0C */ u32 state;

    /* 10 */ s8 xPos;
    /* 11 */ s8 yPos;

    /* 12 */ s8 maxHP;
    /* 13 */ s8 curHP;
    /* 14 */ s8 pow;
    /* 15 */ s8 skl;
    /* 16 */ s8 spd;
    /* 17 */ s8 def;
    /* 18 */ s8 res;
    /* 19 */ s8 lck;

    /* 1A */ s8 conBonus;
    /* 1B */ u8 rescueOtherUnit;
    /* 1C */ u8 ballistaIndex;
    /* 1D */ s8 movBonus;

    /* 1E */ u16 items[5];
    /* 28 */ u8 ranks[8];

    /* 30 */ u8 statusIndex : 4;
    /* 30 */ u8 statusDuration : 4;

    /* 31 */ u8 torchDuration : 4;
    /* 31 */ u8 barrierDuration : 4;

    /* 32 */ u8 supports[6];
    /* 38 */ u8 unitLeader;
    /* 39 */ u8 supportBits;
    /* 3A */ u8 _u3A;
    /* 3B */ u8 _u3B;

    /* 3C */ struct SMSHandle* pMapSpriteHandle;

    /* 40 */ u16 ai3And4;
    /* 42 */ u8 ai1;
    /* 43 */ u8 ai1data;
    /* 44 */ u8 ai2;
    /* 45 */ u8 ai2data;
    /* 46 */ u8 _u46;
    /* 47 */ u8 _u47;
};

enum {
    // Ballista extdata definitions
    TRAP_EXTDATA_BLST_ITEMID   = 0, // ballista item id
    TRAP_EXTDATA_BLST_RIDDEN   = 2, // "is ridden" boolean
    TRAP_EXTDATA_BLST_ITEMUSES = 3, // ballista item uses

    // Obstacle (Snags and Walls) extdata definitions
    TRAP_EXTDATA_OBSTACLE_HP = 0, // hp left

    // Map Change extdata definitions
    TRAP_EXTDATA_MAPCHANGE_ID = 0, // map change id

    // Trap (Fire/Gas/Arrow) extdata definitions
    TRAP_EXTDATA_TRAP_TURNFIRST = 1, // start turn countdown
    TRAP_EXTDATA_TRAP_TURNNEXT  = 2, // repeat turn countdown
    TRAP_EXTDATA_TRAP_COUNTER   = 3, // turn counter
    TRAP_EXTDATA_TRAP_DAMAGE    = 4, // trap damage (needs confirmation)

    // Torchlight extdata definitions
    TRAP_EXTDATA_LIGHT_TURNSLEFT = 0, // turns left before wearing out

    // Light Rune extdata definitions
    TRAP_EXTDATA_RUNE_REPLACINGTERRAIN = 0, // terrain id of the replaced tile
    TRAP_EXTDATA_RUNE_TURNSLEFT        = 3, // turns left beofre wearing out
};

struct Trap {
    /* 00 */ u8 xPos;
    /* 01 */ u8 yPos;

    /* 02 */ u8 type;

    /* 03 */ u8 data[5]; // extdata (see above enum for per trap type entry allocations)
};

struct BattleUnit {
	/* 00 */ struct Unit unit;

	/* 48 */ u16 weaponAfter;
	/* 4A */ u16 weaponBefore;
	/* 4C */ u32 weaponAttributes;
	/* 50 */ u8 weaponType;
	/* 51 */ u8 weaponSlotIndex;

	/* 52 */ u8 canCounter;

	/* 53 */ s8 WTHitModifier;
	/* 54 */ s8 WTAtkModifier;

	/* 55 */ u8 terrainIndex;
	/* 56 */ u8 terrainDefense;
	/* 57 */ u8 terrainAvoid;
	/* 58 */ u8 terrainResistance;
	/* 59 */ u8 _u59;

	/* 5A */ u16 battleAttack;
	/* 5C */ u16 battleDefense;
	/* 5E */ u16 battleAttackSpeed;
	/* 60 */ u16 battleHit;
	/* 62 */ u16 battleAvoid;
	/* 64 */ u16 battleEffectiveHit;
	/* 66 */ u16 battleCrit;
	/* 68 */ u16 battleDodge;
	/* 6A */ u16 battleEffectiveCrit;
	/* 6C */ u16 battleSilencerRate;

	/* 6E */ u8 expGain;
	/* 6F */ u8 statusOut;
	/* 70 */ u8 levelPrevious;
	/* 71 */ u8 expPrevious;

	/* 72 */ u8 currentHP;

	/* 73 */ s8 changeHP;
	/* 74 */ s8 changePow;
	/* 75 */ s8 changeSkl;
	/* 76 */ s8 changeSpd;
	/* 77 */ s8 changeDef;
	/* 78 */ s8 changeRes;
	/* 79 */ s8 changeLck;
	/* 7A */ s8 changeCon;

	/* 7B */ s8 wexpMultiplier;
	/* 7C */ u8 nonZeroDamage;
	/* 7D */ u8 weaponBroke;

	/* 7E */ u8 _u7E;
	/* 7F */ u8 _u7F;
};

struct MapAnimActorState {
	/* 00 */ struct Unit* pUnit;
	/* 04 */ struct BattleUnit* pBattleUnit;
	/* 08 */ struct MUProc* pMUProc;
	/* 0C */ u8 u0C;
	/* 0D */ u8 u0D;
	/* 0E */ u16 u0E;
	/* 10 */ u8 u10;
	/* 11 */ u8 u11;
	/* 12 */ u8 u12;
	/* 13 */ u8 u13;
};

struct MapAnimState {
	/* 00 */ struct MapAnimActorState actors[4];

	/* 50 */ u32* pCurrentRound;
	/* 54 */ const struct ProcCmd* pItemMapAnimProcScript;
	/* 58 */ u8 subjectActorId;
	/* 59 */ u8 targetActorId;
	/* 5A */ u16 roundBits;
	/* 5C */ u16 u5C;
	/* 5E */ u8 actorCount_maybe;
	/* 5F */ u8 u5F;
	/* 60 */ u8 u60;
	/* 61 */ u8 u61;
};

struct MMSData {
    const void* pGraphics;
    const void* pAnimation;
};

// TODO: move to bmcontainer.h
enum { CONVOY_ITEM_COUNT = 100 };

// TODO: move to bmunit.h
enum { UNIT_ITEM_COUNT = 5 };

// TODO: move elsewhere/possibly generate from class table
enum {
	CLASS_GORGONEGG2 = 0x34,

    CLASS_PHANTOM    = 0x51,

	CLASS_MOGALL     = 0x5F,
	CLASS_ARCHMOGALL = 0x60,
	CLASS_GORGON     = 0x61,
	CLASS_GORGONEGG  = 0x62,
};

#endif // GUARD_TYPES_H
