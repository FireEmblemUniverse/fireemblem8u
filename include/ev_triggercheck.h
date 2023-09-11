#ifndef GUARD_EV_TRIGGERCHECK_H
#define GUARD_EV_TRIGGERCHECK_H

enum
{
    TILE_COMMAND_NONE,

    TILE_COMMAND_VISIT    = 0x10,
    TILE_COMMAND_SEIZE    = 0x11,

    TILE_COMMAND_DOOR     = 0x12,
    TILE_COMMAND_BRIDGE   = 0x13,
    TILE_COMMAND_CHEST    = 0x14,
    TILE_COMMAND_15       = 0x15,
    TILE_COMMAND_ARMORY   = 0x16,
    TILE_COMMAND_VENDOR   = 0x17,
    TILE_COMMAND_SECRET   = 0x18,
    TILE_COMMAND_SHOP_UNK = 0x19,

    TILE_COMMAND_20       = 0x20,
};

enum {
    TUTORIAL_EVT_TYPE_PHASECHANGE = 0,
    TUTORIAL_EVT_TYPE_POSTACTION = 1,
    TUTORIAL_EVT_TYPE_ONSELECT = 2,
    TUTORIAL_EVT_TYPE_DESTSELECTED = 3,
    TUTORIAL_EVT_TYPE_AFTERMOVE = 4,
    TUTORIAL_EVT_TYPE_FORECAST = 5,
    TUTORIAL_EVT_TYPE_PLAYERPHASE = 6,
};

typedef uintptr_t EventListScr;

struct EventInfo {
    /* 00 */ EventListScr* listScript;
    /* 04 */ u32 script;
    /* 08 */ u32 flag;
    /* 0C */ u32 commandId;
    /* 10 */ u32 givenMoney;
    /* 14 */ u32 givenItem;
    /* 18 */ s8 xPos;
    /* 19 */ s8 yPos;
    /* 1A */ u8 pidA;
    /* 1B */ u8 pidB;
};

struct EventListCmdInfo {
    /* 00 */ int (*func)(struct EventInfo* buf);
    /* 04 */ int length;
};

struct SupportTalkEnt {
    /* 00 */ u16 unitA;
    /* 02 */ u16 unitB;

    /* 04 */ u16 msgSupports[3];

    /* 0A */ u16 _pad1;
    /* 0C */ u16 unk_0c_0 : 5;
    /* 0C */ u16 unk_0c_5 : 5;
    /* 0D */ u16 unk_0d_3 : 5;
} BITPACKED;

struct BattleTalkEnt {
    /* 00 */ u8 pid;
    /* 01 */ u8 chapter;
    /* 04 */ u32 msg;
    /* 08 */ u32 flag;
};

struct BattleTalkExtEnt {
    /* 00 */ u16 pidA;
    /* 02 */ u16 pidB;
    /* 04 */ u16 chapter;
    /* 06 */ u16 flag;
    /* 08 */ u16 msg;
    /* 0C */ u32 unk_0c;
};

struct DefeatTalkEnt {
    /* 00 */ u16 pid;
    /* 02 */ u8 route;
    /* 03 */ u8 chapter;
    /* 04 */ u16 flag;
    /* 06 */ u16 msg;
    /* 08 */ u32 event;
};

struct ForceDeploymentEnt {
    /* 00 */ u16 pid;
    /* 01 */ u8 route;
    /* 02 */ u8 chapter;
};

// ??? StartEventFromInfo(???);
struct EventInfo* SearchAvailableEvent(struct EventInfo* info);
// ??? SearchNextAvailableEvent(???);
// ??? EventInfoCheckTalk(???);
// ??? CheckActiveUnitArea(???);
// ??? CheckAnyBlueUnitArea(???);
// ??? sub_8083018(???);
// ??? sub_8083044(???);
// ??? sub_8083094(???);
// ??? sub_80830AC(???);
// ??? sub_80830D4(???);
// ??? sub_80830FC(???);
// ??? sub_8083124(???);
// ??? CheckAnyRedUnitArea(???);
s8 IsThereClosedChestAt(s8 x, s8 y);
void StartAvailableChestTileEvent(s8, s8);
s8 IsThereClosedDoorAt(s8 x, s8 y);
void StartAvailableDoorTileEvent(s8, s8);
// ??? sub_8083234(???);
s8 ShouldCallEndEvent(void);
void MaybeCallEndEvent_(void);
// ??? CallEndEvent(???);
s8 sub_80832C4(void);
s8 sub_80832C8(void);
s8 sub_80832CC(void);
s8 sub_80832D0(void);
s8 sub_80832D4(void);
s8 CheckWin(void);
void MaybeCallEndEvent(void);
struct TrapData* GetTrapPointer(void);
struct TrapData* GetHardModeTrapPointer(void);
void* GetChapterAllyUnitDataPointer(void);
const struct UnitDefinition * GetChapterEnemyUnitDefinitions(void);
// ??? GetChapterSkirmishLeaderClasses(???);
// ??? sub_8083424(???);
// ??? GetAvailableBattleTalk(???);
bool ShouldCallBattleQuote(u8 charA, u8 charB);
void CallBattleQuoteEventsIfAny(u8 charA, u8 charB);
// ??? SetPidDefeatedFlag(???);
bool ShouldDisplayDefeatTalkForPid(u8 pid);
void DisplayDefeatTalkForPid(u8 pid);
// ??? sub_8083654(???);
void StartSupportTalk(u8, u8, int);
void StartSupportViewerTalk(u8, u8, int);
// u16 GetSupportTalkSong_(u8, u8, u8, int);
// ??? sub_80837B0(???);
// ??? sub_80837D8(???);
s8 sub_80837F8(void);
// ??? EvCheck00_Always(???);
// ??? EvCheck01_AFEV(???);
// ??? EvCheck02_TURN(???);
// ??? EvCheck03_CHAR(???);
// ??? EvCheck04_CHARASM(???);
// ??? EvCheck05_LOCA(???);
// ??? EvCheck06_VILL(???);
// ??? EvCheck07_CHES(???);
// ??? EvCheck08_DOOR(???);
// ??? EvCheck09_(???);
// ??? EvCheck0A_SHOP(???);
// ??? EvCheck0B_AREA(???);
// ??? EvCheck0C_Never(???);
// ??? EvCheck0D_Never(???);
// ??? EvCheck0E_(???);
// ??? EvCheck0F_(???);
// ??? EvCheck10_(???);
// ??? SetChapterFlag(???);
// ??? ClearChapterFlag(???);
void ResetChapterFlags(void);
// ??? CheckChapterFlag(???);
// ??? SetPermanentFlag(???);
// ??? ClearPermanentFlag(???);
void ResetPermanentFlags(void);
s8 CheckPermanentFlagFrom(int, void*);
s8 CheckPermanentFlag(int);
void SetFlag(int);
void ClearFlag(int);
s8 CheckFlag(int);
u8 *GetPermanentFlagBits();
int GetPermanentFlagBitsSize();
u8 *GetChapterFlagBits();
int GetChapterFlagBitsSize();;
void sub_8083DD8(int a, u8 b);
// ??? CheckTutorialEvent(???);
// ??? RunTutorialEvent(???);
s8 RunPhaseSwitchEvents(void);
s8 CheckForCharacterEvents(u8 pidA, u8 pidB);
void StartCharacterEvent(u8, u8);
// ??? sub_8083FFC(???);
int GetAvailableTileEventCommand(s8, s8);
void StartAvailableTileEvent(s8, s8);
s8 CheckForWaitEvents(void);
void RunWaitEvents(void);
s8 TryCallSelectEvents(void);
s8 StartDestSelectedEvent(void);
s8 StartAfterUnitMovedEvent(void);
s8 CheckBattleForecastTutorialEvent(void);
void StartBattleForecastTutorialEvent(void);
void StartPlayerPhaseStartTutorialEvent(void);
void ClearActiveEventRegistry(void);
void RegisterEventActivation(u32, u16);
u16 GetEventTriggerId(const void * script);
// ??? SetFlag82(???);
// ??? CheckFlag82(???);
struct BattleTalkExtEnt* GetBattleQuoteEntry(u16, u16);
struct DefeatTalkEnt* GetDefeatTalkEntry(u16);
struct SupportTalkEnt* GetSupportTalkEntry(u16, u16);
int GetSupportTalkSong(u16, u16, u8);
struct SupportTalkEnt* GetSupportTalkList();
s8 IsCharacterForceDeployed_(u16 pid);
// ??? IsSethLArachelMyrrhInnes(???);

extern struct BattleTalkExtEnt gBattleTalkList[];
extern struct DefeatTalkEnt gDefeatTalkList[];
extern struct SupportTalkEnt gSupportTalkList[];
extern struct ForceDeploymentEnt gForceDeploymentList[];
extern u8 gPidList_SethLArachelMyrrhInnes[];

#endif // GUARD_EV_TRIGGERCHECK_H
