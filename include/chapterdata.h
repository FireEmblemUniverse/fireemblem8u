#ifndef GUARD_CHAPTERDATA_H
#define GUARD_CHAPTERDATA_H

#include "ev_triggercheck.h"

struct ChapterMap {
    u8  obj1Id;
    u8  obj2Id;
    u8  paletteId;
    u8  tileConfigId;
    u8  mainLayerId;
    u8  objAnimId;
    u8  paletteAnimId;
    u8  changeLayerId;
};

enum {
    MAP_BGM_BLUE            =  0,
    MAP_BGM_RED             =  1,
    MAP_BGM_GREEN           =  2,
    MAP_BGM_BLUE_HECTOR     =  3,
    MAP_BGM_RED_HECTOR      =  4,
    MAP_BGM_GREEN_HECTOR    =  5,
    MAP_BGM_BLUE_GREEN_ALT  =  6,
    MAP_BGM_RED_ALT         =  7,
    MAP_BGM_PROLOGUE_LYN    =  8,
    MAP_BGM_PROLOGUE        =  9,
    MAP_BGM_PROLOGUE_HECTOR = 10,
};

struct ROMChapterData {
    /* 00 */ const char* internalName;

    /* 04 */ struct ChapterMap map;

    /* 0C */ u8  initialFogLevel;
    /* 0D */ bool8  hasPrepScreen; // left over from FE7

    /* 0E */ u8 chapTitleId;
    /* 0F */ u8 chapTitleIdInHectorStory; // left over from FE7

    /* 10 */ u8 initialPosX;
    /* 11 */ u8 initialPosY;
    /* 12 */ u8 initialWeather;
    /* 13 */ u8 battleTileSet;

    // This may need a type change.
    /* 14 */ u16 easyModeLevelMalus      : 4;
    /* 14 */ u16 difficultModeLevelBonus : 4;
    /* 14 */ u16 normalModeLevelMalus    : 4;

    /* 16 */ u16 mapBgmIds[11];

    /* 2C */ u8 mapCrackedWallHeath;

    /* 2D */ u8 turnsForTacticsRankAInEliwoodStory[2]; // left over from FE7
    /* 2F */ u8 turnsForTacticsRankAInHectorStory[2]; // left over from FE7
    /* 31 */ u8 turnsForTacticsRankBInEliwoodStory[2]; // left over from FE7
    /* 33 */ u8 turnsForTacticsRankBInHectorStory[2]; // left over from FE7
    /* 35 */ u8 turnsForTacticsRankCInEliwoodStory[2]; // left over from FE7
    /* 37 */ u8 turnsForTacticsRankCInHectorStory[2]; // left over from FE7
    /* 39 */ u8 turnsForTacticsRankDInEliwoodStory[2]; // left over from FE7
    /* 3B */ u8 turnsForTacticsRankDInHectorStory[2]; // left over from FE7

    /* 3D */ u8 unk3D; // padding?

    /* 3E */ u16 gainedExpForExpRankAInEliwoodStory[2]; // left over from FE7
    /* 42 */ u16 gainedExpForExpRankAInHectorStory[2]; // left over from FE7
    /* 46 */ u16 gainedExpForExpRankBInEliwoodStory[2]; // left over from FE7
    /* 4A */ u16 gainedExpForExpRankBInHectorStory[2]; // left over from FE7
    /* 4E */ u16 gainedExpForExpRankCInEliwoodStory[2]; // left over from FE7
    /* 52 */ u16 gainedExpForExpRankCInHectorStory[2]; // left over from FE7
    /* 56 */ u16 gainedExpForExpRankDInEliwoodStory[2]; // left over from FE7
    /* 5A */ u16 gainedExpForExpRankDInHectorStory[2]; // left over from FE7

    /* 5E */ u16 unk5E; // padding?

    /* 60 */ u32 goldForFundsRankInEliwoodStory[2]; // left over from FE7
    /* 68 */ u32 goldForFundsRankInHectorStory[2]; // left over from FE7

    /* 70 */ u16 chapTitleTextId;
    /* 72 */ u16 chapTitleTextIdInHectorStory; // left over from FE7

    /* 74 */ u8 mapEventDataId;
    /* 75 */ u8 gmapEventId;

    /* 76 */ u16 divinationTextIdBeginning; // left over from FE7
    /* 78 */ u16 divinationTextIdInEliwoodStory; // left over from FE7
    /* 7A */ u16 divinationTextIdInHectorStory; // left over from FE7
    /* 7C */ u16 divinationTextIdEnding; // left over from FE7
    /* 7E */ u8 divinationPortrait; // left over from FE7
    /* 7F */ u8 divinationFee; // left over from FE7

    /* 80 */ u8 prepScreenNumber;
    /* 81 */ u8 prepScreenNumberInHectorStory; // left over from FE7
    /* 82 */ u8 merchantPosX;
    /* 83 */ u8 merchantPosXInHectorStory; // left over from FE7
    /* 84 */ u8 merchantPosY;
    /* 85 */ u8 merchantPosYInHectorStory; // left over from FE7

    /* 86 */ s8 victorySongEnemyThreshold;
    /* 87 */ bool8 fadeToBlack;

    /* 88 */ u16 statusObjectiveTextId;
    /* 8A */ u16 goalWindowTextId;
    /* 8C */ u8 goalWindowDataType;
    /* 8D */ u8 goalWindowEndTurnNumber;
    /* 8E */ u8 protectCharacterIndex;

    /* 8F */ u8 destPosX;
    /* 90 */ u8 destPosY;

    /* 91 */ u8 unk91; // ?
    /* 92 */ u8 unk92; // ?
    /* 93 */ u8 unk93; // ?
};

struct ChapterEventGroup
{
    /* 00 */ void *turnBasedEvents;
    /* 04 */ void *characterBasedEvents; // must be 32-Aligned?
    /* 08 */ void *locationBasedEvents;
    /* 0C */ void *miscBasedEvents;

    // select unit -> select destination -> move unit to destination
    /* 10 */ void *specialEventsWhenUnitSelected;
    /* 14 */ void *specialEventsWhenDestSelected;
    /* 18 */ void *specialEventsAfterUnitMoved;

    /* 1C */ void *tutorialEvents;

    /* 20 */ void *traps;
    /* 24 */ void *extraTrapsInHard;

    /* 28 */ void *playerUnitsInNormal;
    /* 2C */ void *playerUnitsInHard;

    /* 30 */ void *playerUnitsChoice1InEncounter;
    /* 34 */ void *playerUnitsChoice2InEncounter;
    /* 38 */ void *playerUnitsChoice3InEncounter;

    /* 3C */ void *enemyUnitsChoice1InEncounter;
    /* 40 */ void *enemyUnitsChoice2InEncounter;
    /* 44 */ void *enemyUnitsChoice3InEncounter;

    /* 48 */ void *beginningSceneEvents;
    /* 4C */ void *endingSceneEvents;
};

struct MapObjAnimFrm
{
    /* 00 */ u16 duration;
    /* 04 */ u16 size;
    /* 08 */ u8 *gfx;
};

struct MapPaletteAnimFrm
{
    /* 00 */ u16 *pal;
    /* 04 */ u8 duration;
    /* 05 */ u8 colorNum;
    /* 06 */ u8 colorPos;
    /* 07 */ u8 padding;
};

struct MapChangeInfo
{
    /* 00 */ u8 id;
    /* 01 */ u8 x;
    /* 02 */ u8 y;
    /* 03 */ u8 w;
    /* 04 */ u8 h;
    /* 05 */ u8 paddings[3];
    /* 08 */ u16 *tiles;
};

extern struct ROMChapterData CONST_DATA gChapterDataTable[];
extern const void* gChapterDataAssetTable[];

const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex);
const void* GetChapterMapPointer(unsigned chIndex);
const void* GetChapterMapChangesPointer(unsigned chIndex);
const struct ChapterEventGroup* GetChapterEventDataPointer(unsigned chIndex);
const char* GetChapterTitle(unsigned chIndex);
u8 IsDifficultMode(void);

#endif // GUARD_CHAPTERDATA_H
