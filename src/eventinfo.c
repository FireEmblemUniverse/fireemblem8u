#include "global.h"

#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "event.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"

#define EVT_CMD_LO(cmd) (((cmd) & 0x0000FFFF))
#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)
#define EVT_CMD_B1(cmd) (((cmd) & 0x000000FF))
#define EVT_CMD_B2(cmd) (((cmd) & 0x0000FF00) >> 8)
#define EVT_CMD_B3(cmd) (((cmd) & 0x00FF0000) >> 16)
#define EVT_CMD_B4(cmd) (((cmd) & 0xFF000000) >> 24)

int EvCheck00_Always(struct EventInfo* info);
int EvCheck01_AFEV(struct EventInfo* info);
int EvCheck02_TURN(struct EventInfo* info);
int EvCheck03_CHAR(struct EventInfo* info);
int EvCheck04_CHARASM(struct EventInfo* info);
int EvCheck05_LOCA(struct EventInfo* info);
int EvCheck06_VILL(struct EventInfo* info);
int EvCheck07_CHES(struct EventInfo* info);
int EvCheck08_DOOR(struct EventInfo* info);
int EvCheck09_(struct EventInfo* info);
int EvCheck0A_SHOP(struct EventInfo* info);
int EvCheck0B_AREA(struct EventInfo* info);
int EvCheck0C_Never(struct EventInfo* info);
int EvCheck0D_Never(struct EventInfo* info);
int EvCheck0E_(struct EventInfo* info);
int EvCheck0F_(struct EventInfo* info);
int EvCheck10_(struct EventInfo* info);

struct EventListCmdInfo CONST_DATA gEventListCmdInfoTable[] = {
    [EVT_LIST_CMD_END] =        { EvCheck00_Always,        1, },
    [EVT_LIST_CMD_FLAG] =       { EvCheck01_AFEV,          3, },
    [EVT_LIST_CMD_TURN] =       { EvCheck02_TURN,          3, },
    [EVT_LIST_CMD_CHAR] =       { EvCheck03_CHAR,          4, },
    [EVT_LIST_CMD_CHARASM] =    { EvCheck04_CHARASM,       4, },
    [EVT_LIST_CMD_LOCA] =       { EvCheck05_LOCA,          3, },
    [EVT_LIST_CMD_VILL] =       { EvCheck06_VILL,          3, },
    [EVT_LIST_CMD_CHES] =       { EvCheck07_CHES,          3, },
    [EVT_LIST_CMD_DOOR] =       { EvCheck08_DOOR,          3, },
    [EVT_LIST_CMD_DRAWBRIDGE] = { EvCheck09_,              3, },
    [EVT_LIST_CMD_SHOP] =       { EvCheck0A_SHOP,          3, },
    [EVT_LIST_CMD_AREA] =       { EvCheck0B_AREA,          3, },
    [EVT_LIST_CMD_NEVER_C] =    { EvCheck0C_Never,         3, },
    [EVT_LIST_CMD_NEVER_D] =    { EvCheck0D_Never,         3, },
    [EVT_LIST_CMD_E] =          { EvCheck0E_,              3, },
    [EVT_LIST_CMD_F] =          { EvCheck0F_,              4, },
    [EVT_LIST_CMD_10] =         { EvCheck10_,              4, },
};

void StartEventFromInfo(struct EventInfo * info, u8 execType)
{
    if (info->script == 0)
        return;

    SetFlag(info->flag);

    if ((int)info->script != EVENT_NOSCRIPT)
    {
        RegisterEventActivation(info->script, info->flag);
        CallEvent((u16 *)info->script, execType);

        if (CheckFlag(EVFLAG_WIN) != false)
        {
            RefreshAllies();
            SetFlag(EVFLAG_HIDE_BLINKING_ICON);
        }
    }
}

struct EventInfo * SearchAvailableEvent(struct EventInfo * info)
{
    int * len;
    struct EventListCmdInfo * cmdInfo;

    info->script = 0;
    info->flag = 0;

    cmdInfo = gEventListCmdInfoTable;
    len = &cmdInfo[0].length;

    for (;;)
    {
        int cmdId = EVT_CMD_LO(info->listScript[0]);
        int r6 = cmdId;

        if (!CheckFlag(EVT_CMD_HI(info->listScript[0])))
        {
            if (cmdInfo[cmdId].func(info) != 1)
            {
            label:
                info->listScript += len[r6 << 1];
                continue;
            }

            if (info->script)
                return info;

            break;
        }
        goto label;
    }
    return NULL;
}

struct EventInfo * SearchNextAvailableEvent(struct EventInfo * info)
{
    if (info != NULL)
    {
        int cmdId = EVT_CMD_LO(info->listScript[0]);
        info->listScript += gEventListCmdInfoTable[cmdId].length;

        return SearchAvailableEvent(info);
    }
    return NULL;
}

bool EventInfoCheckTalk(struct EventInfo * info, u8 pidA, u8 pidB)
{
    if ((info->pidA == pidA) && (info->pidB == pidB)) {
        info->script = info->listScript[1];
        info->flag = EVT_CMD_HI(info->listScript[0]);

        return true;
    }
    return false;
}

bool CheckActiveUnitArea(int x1, int y1, int x2, int y2)
{
    if ((gActiveUnit->xPos >= x1) && (gActiveUnit->xPos <= x2) && (gActiveUnit->yPos >= y1) && (gActiveUnit->yPos <= y2))
        return true;

    return false;
}

bool CheckAnyBlueUnitArea(int x1, int y1, int x2, int y2)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if ((unit->xPos >= x1) && (unit->xPos <= x2) && (unit->yPos >= y1) && (unit->yPos <= y2)) {
            return true;
        }
    }
    return false;
}

bool CheckAnyBlueUnitArea1(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    if (CheckAnyBlueUnitArea(0, 15, 25, 23))
        return 0;

    return 1;
}

bool CheckAnyBlueUnitArea2(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    if (CheckAnyBlueUnitArea(0, 24, 16, 27))
        return 1;

    if (CheckAnyBlueUnitArea(0, 21, 2, 23))
        return 1;

    if (CheckAnyBlueUnitArea(3, 20, 5, 22))
        return 1;

    return 0;
}

bool CheckAnyBlueUnitArea3(void)
{
    return CheckAnyBlueUnitArea(12, 21, 31, 24);
}

bool CheckAnyBlueUnitArea4(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(17, 21, 31, 35);
}

bool CheckAnyBlueUnitArea5(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(0, 15, 8, 18);
}

bool CheckAnyBlueUnitArea6(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(0, 24, 12, 27);
}

bool CheckAnyBlueUnitArea7(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(21, 0, 30, 6);
}

bool CheckAnyRedUnitArea(int x1, int y1, int x2, int y2)
{
    int i;
    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if ((unit->xPos >= x1) && (unit->xPos <= x2) && (unit->yPos >= y1) && (unit->yPos <= y2))
            return true;
    }
    return false;
}

bool IsThereClosedChestAt(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == TILE_COMMAND_CHEST)
        return true;

    return false;
}

void StartAvailableChestTileEvent(s8 x, s8 y)
{
    if (IsThereClosedChestAt(x, y))
        StartAvailableTileEvent(x, y);
}

bool IsThereClosedDoorAt(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == TILE_COMMAND_DOOR)
        return true;

    return false;
}

void StartAvailableDoorTileEvent(s8 x, s8 y)
{
    if (IsThereClosedDoorAt(x, y))
        StartAvailableTileEvent(x, y);

    return;
}

bool IsThereTileCommand15(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == TILE_COMMAND_15)
        return true;

    return false;
}

bool ShouldCallEndEvent(void)
{
    if (GetBattleMapKind() == 2)
        return 0;

    return CheckWin();
}

//! FE8U = 0x0808326C
void MaybeCallEndEvent_(void) {
    if (GetBattleMapKind() != 2) {
        MaybeCallEndEvent();
    }

    return;
}

//! FE8U = 0x08083280
void CallEndEvent(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetBattleMapKind() != 2) {
        CallEvent(evGroup->endingSceneEvents, 1);
    } else {
        CallEvent((u16 *)EventScr_SkirmishCommonEnd, 1);
    }

    RefreshAllies();
    SetFlag(0x84);

    return;
}

//! FE8U = 0x080832C4
s8 sub_80832C4(void) {
    return 0;
}

//! FE8U = 0x080832C8
s8 sub_80832C8(void) {
    return 0;
}

//! FE8U = 0x080832CC
s8 sub_80832CC(void) {
    return 0;
}

//! FE8U = 0x080832D0
s8 sub_80832D0(void) {
    return 0;
}

//! FE8U = 0x080832D4
s8 sub_80832D4(void) {
    return 0;
}

//! FE8U = 0x080832D8
s8 CheckWin(void) {
    return CheckFlag(3);
}

//! FE8U = 0x080832E8
void MaybeCallEndEvent(void) {
    if (!CheckFlag(3)) {
        return;
    }

    if (!ShouldCallEndEvent()) {
        return;
    }

    CallEndEvent();

    return;
}

//! FE8U = 0x08083308
const struct TrapData * GetTrapPointer(void)
{
    return GetChapterEventDataPointer(gPlaySt.chapterIndex)->traps;
}

//! FE8U = 0x08083320
const struct TrapData * GetHardModeTrapPointer(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
        return evGroup->extraTrapsInHard;

    return NULL;
}

//! FE8U = 0x08083348
const void * GetChapterAllyUnitDataPointer(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetBattleMapKind() != 2) {
        if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD) {
            return evGroup->playerUnitsInHard;
        }

        return evGroup->playerUnitsInNormal;
    } else {
        switch (gGMData.unk_c9[gGMData.unk_cc]) {
            case 0:
                return evGroup->playerUnitsChoice1InEncounter;

            case 1:
                return evGroup->playerUnitsChoice2InEncounter;

            case 2:
                return evGroup->playerUnitsChoice3InEncounter;
        }
    }
}

//! FE8U = 0x080833B0
const struct UnitDefinition * GetChapterEnemyUnitDefinitions(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    const void * ret = NULL;

    switch (gGMData.unk_c9[gGMData.unk_cc]) {
        case 0:
            ret = evGroup->enemyUnitsChoice1InEncounter;
            break;

        case 1:
            ret = evGroup->enemyUnitsChoice2InEncounter;
            break;

        case 2:
            ret = evGroup->enemyUnitsChoice3InEncounter;
            break;
    }

    return ret;
}

//! FE8U = 0x08083400
void GetChapterSkirmishLeaderClasses(u8 chapterId, u8 * list)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(chapterId);

    list[0] = ((struct UnitDefinition *)(evGroup->enemyUnitsChoice1InEncounter))->classIndex;
    list[1] = ((struct UnitDefinition *)(evGroup->enemyUnitsChoice2InEncounter))->classIndex;
    list[2] = ((struct UnitDefinition *)(evGroup->enemyUnitsChoice3InEncounter))->classIndex;
}

//! FE8U = 0x08083424
bool sub_8083424(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (evGroup->playerUnitsChoice1InEncounter == 0)
        return false;

    if (evGroup->playerUnitsChoice2InEncounter == 0)
        return false;

    if (evGroup->playerUnitsChoice3InEncounter == 0)
        return false;

    if (evGroup->enemyUnitsChoice1InEncounter == 0)
        return false;

    if (evGroup->enemyUnitsChoice2InEncounter == 0)
        return false;

    if (evGroup->enemyUnitsChoice3InEncounter == 0)
        return false;

    return true;
}

//! FE8U = 0x08083468
struct BattleTalkEnt* GetAvailableBattleTalk(u8 pid, struct BattleTalkEnt* it) {
    for (; it->pid != 0; it++) {
        if (CheckFlag(it->flag)) {
            continue;
        }

        if (pid == it->pid) {
            if (it->chapter == 0x4F) {
                return it;
            }

            if (gPlaySt.chapterIndex == it->chapter) {
                return it;
            }
        }
    }

    return NULL;
}

//! FE8U = 0x080834B0
s8 ShouldCallBattleQuote(u8 pidA, u8 pidB) {
    if (GetBattleMapKind() == 2) {
        return 0;
    }

    if (gActionData.unitActionType != UNIT_ACTION_COMBAT) {
        return 0;
    }

    if (GetBattleQuoteEntry(pidA, pidB)) {
        return 1;
    }

    if (GetBattleQuoteEntry(pidA, 0)) {
        return 1;
    }

    if (GetBattleQuoteEntry(0, pidB)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083504
void CallBattleQuoteEventsIfAny(u8 pidA, u8 pidB) {
    struct BattleTalkExtEnt* ent;

    if (GetBattleMapKind() == 2) {
        return;
    }

    if (gActionData.unitActionType != UNIT_ACTION_COMBAT) {
        return;
    }

    if ((ent = GetBattleQuoteEntry(pidA, pidB), ent != NULL) ||
        (ent = GetBattleQuoteEntry(pidA, 0), ent != NULL) ||
        (ent = GetBattleQuoteEntry(0, pidB)), ent != NULL) {

        if (ent->msg) {
            CallBattleQuoteEventInBattle(ent->msg);
        } else {
            if (ent->event != 0) {
                EventEngine_CreateBattle((u16 *)ent->event);
            }
        }

        SetFlag(ent->flag);
    }

    return;
}

//! FE8U = 0x08083570
void SetPidDefeatedFlag(u8 pid, int flag) {
    const struct ROMChapterData* chapterData;

    if ((GetBattleMapKind() == 0) || (chapterData = GetROMChapterStruct(gPlaySt.chapterIndex), pid != chapterData->protectCharacterIndex) || flag != 0x65) {
        SetFlag(flag);
        return;
    }

    return;
}

//! FE8U = 0x080835A8
s8 ShouldDisplayDefeatTalkForPid(u8 pid) {
    struct DefeatTalkEnt* ent = GetDefeatTalkEntry(pid);

    if (ent) {
        if (ent->msg == 0 && ent->event == 0) {
            SetPidDefeatedFlag(pid, ent->flag);
        } else {
            return 1;
        }

    }

    return 0;
}

//! FE8U = 0x080835DC
void DisplayDefeatTalkForPid(u8 pid) {
    struct DefeatTalkEnt* ent = GetDefeatTalkEntry(pid);

    if (ent) {
        if ((ent->route == 1) && (ent->flag == 0x65)) {
            StartBgm(0x3e, NULL);
            gPlaySt.config.disableBgm = 1;
        } else {
            if (UNIT_FACTION(GetUnitFromCharId(pid)) == FACTION_BLUE) {
                StartBgm(0x3f, NULL);
            }
        }
        if (ent->msg != 0) {
            CallBattleQuoteEventInBattle(ent->msg);
        } else {
            if (ent->event) {
                EventEngine_CreateBattle((u16 *)ent->event);
            }
        }

        SetPidDefeatedFlag(pid, ent->flag);
    }

    return;
}

//! FE8U = 0x08083654
void sub_8083654(u16 pid) {
    struct Unit* unit;
    int i;
    int x;
    int y;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->pCharacterData->number != pid) {
            continue;
        }

        if (unit->state & US_DEAD) {
            continue;
        }

        PidStatsRecordDefeatInfo(pid, 0, DEFEAT_CAUSE_7);
        UnitKill(unit);
        SetUnitHp(unit, 0);

        if (gBattleActor.unit.index == unit->index) {
            gBattleActor.unit = *unit;
        }

        if (gBattleTarget.unit.index == unit->index) {
            gBattleTarget.unit = *unit;
        }

        if (unit->state & US_RESCUED) {
            UnitDrop(GetUnit(unit->rescue), 0, 0);
        }

        if (!(unit->state & US_RESCUING)) {
            return;
        }

        UnitGetDeathDropLocation(unit, &x, &y);
        UnitDrop(unit, x, y);

        return;
    }

    return;
}

//! FE8U = 0x0808371C
void StartSupportTalk(u8 pidA, u8 pidB, int rank) {
    struct SupportTalkEnt* ent = GetSupportTalkEntry(pidA, pidB);

    if (ent) {
        CallMapSupportEvent(
            GetSupportTalkSong(pidA, pidB, rank),
            ent->msgSupports[rank - 1]
        );

        UpdateBestGlobalSupportValue(pidA, pidB, rank);
    }

    return;
}

//! FE8U = 0x08083764
void StartSupportViewerTalk(u8 pidA, u8 pidB, int rank) {
    struct SupportTalkEnt* ent = GetSupportTalkEntry(pidA, pidB);

    if (ent) {
        CallSupportViewerEvent(ent->msgSupports[rank - 1]);
    }

    return;
}

//! FE8U = 0x08083790
u16 GetSupportTalkSong_(u8 unused, u8 pidA, u8 pidB, int rank) {
    return GetSupportTalkSong(pidA, pidB, rank);
}

//! FE8U = 0x080837B0
void sub_80837B0(void) {
    SetFlag(EVFLAG_GAMEOVER);
    StartBgm(0x3e, NULL);
    gPlaySt.config.disableBgm = 1;
    CallGameOverEvent();

    return;
}

//! FE8U = 0x080837D8
s8 sub_80837D8(void) {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080837F8
s8 CheckTradeTutorial(void) {
    int ret = 0;

    if (TUTORIAL_MODE()) {
        ret = CheckFlag(0x87) != 0;
    }

    return ret;
}

//! FE8U = 0x08083830
int EvCheck00_Always(struct EventInfo* info) {
    return 1;
}

struct EvCheck01 {
    u32 unk0;
    u32 script;
    u32 unk8;
};

//! FE8U = 0x08083834
int EvCheck01_AFEV(struct EventInfo* info) {
    struct EvCheck01* listScript = (void *)info->listScript;

    if ((listScript->unk8 == 0) || (listScript->unk8 == 100) || (CheckFlag(listScript->unk8) == 1)) {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);
        return 1;
    }

    return 0;
}

struct EvCheck02 {
    u32 unk0;
    u32 script;
    u8 turn;
    u8 maxTurn;
    u16 faction;
};

//! FE8U = 0x08083864
int EvCheck02_TURN(struct EventInfo* info) {
    struct EvCheck02* listScript = (void *)info->listScript;

    int turn = listScript->turn;
    int maxTurn = listScript->maxTurn;
    int faction = listScript->faction;

    if (maxTurn == 0) {
        maxTurn = turn;
    } else if (maxTurn == 0xff) {
        maxTurn = INT32_MAX;
    }


    if ((turn <= gPlaySt.chapterTurnNumber) && (gPlaySt.chapterTurnNumber <= maxTurn) && (gPlaySt.faction == faction)) {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);

        return 1;
    }

    return 0;
}

struct EvCheck03 {
    u32 unk0;
    u32 script;
    u8 pidA;
    u8 pidB;
    u16 fillerA;
    u16 unkC;
    u16 unkE;
};

//! FE8U = 0x080838AC
int EvCheck03_CHAR(struct EventInfo* info) {
    struct EvCheck03 * listScript = (void *)info->listScript;

    int pidA = listScript->pidA;
    int pidB = listScript->pidB;
    int unk = listScript->unkC;

    switch (unk) {
    case 1:
        return false;
    case 2:
        return false;
    case 3:
        if ((CheckFlag(listScript->unkE) == 0))
            return false;

        break;
    }

    if (((info->pidA == pidA) || (pidA == 0)) && info->pidB == pidB)
    {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);
        return true;
    }
    return false;
}

struct EvCheck04 {
    u32 unk0;
    u32 script;
    u8 pidA;
    u8 pidB;
    s8 (*func)(void *);
};

//! FE8U = 0x080838FC
int EvCheck04_CHARASM(struct EventInfo* info) {
    struct EvCheck04 *listScript = (void *)info->listScript;

    int pidA = listScript->pidA;
    int pidB = listScript->pidB;

    if ((listScript->func(info) != 0) && (info->pidA == pidA || (pidA == 0)) && (info->pidB == pidB)) {
        info->script = listScript->script;
        info->flag = listScript->unk0 >> 16; // EVT_CMD_HI causes regswap
        return 1;
    }

    return 0;
}

struct EvCheck05 {
    u32 unk0;
    u32 script;
    u8 x;
    u8 y;
    u16 cmdId;
};

//! FE8U = 0x08083938
int EvCheck05_LOCA(struct EventInfo* info) {
    struct EvCheck05* listScript = (void *)info->listScript;

    int x = listScript->x;
    int y = listScript->y;
    int cmdId = listScript->cmdId;

    info->givenMoney = 0;

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript->script;
        info->flag = EVT_CMD_HI(listScript->unk0);
        info->commandId = listScript->cmdId;

        if (cmdId == TILE_COMMAND_CHEST) {
            info->givenItem = 0;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x08083978
int EvCheck06_VILL(struct EventInfo* info) {
    EvCheck05_LOCA(info);
    info->givenMoney = 3;

    // return 1; // BUG?
}

struct EvCheck07 {
    u32 unk0;
    u16 givenItem;
    u16 givenMoney;
    u8 x;
    u8 y;
    u16 cmdId;
};

//! FE8U = 0x0808398C
int EvCheck07_CHES(struct EventInfo* info) {
    struct EvCheck07* listScript = (void *)info->listScript;

    u8 x = listScript->x;
    u8 y = listScript->y;

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = 1;
        info->flag = EVT_CMD_HI(listScript->unk0);
        info->commandId = listScript->cmdId;
        info->givenItem = listScript->givenItem;
        info->givenMoney = listScript->givenMoney;

        return 1;
    }

    return 0;
}

struct EvCheck08 {
    u32 unk0;
    u32 script;
    u32 unk8;
};

//! FE8U = 0x080839C8
int EvCheck08_DOOR(struct EventInfo* info) {
    struct EvCheck08* listScript = (void *)info->listScript;

    int x = EVT_CMD_B1(listScript->unk8);
    int y = EVT_CMD_B2(listScript->unk8);
    int tileCommand = EVT_CMD_B3(listScript->unk8);
    int givenMoney = EVT_CMD_B4(listScript->unk8);

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript->script;
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(((struct EvCheck08 *)info->listScript)->unk0);

        info->commandId = tileCommand;
        info->givenMoney = givenMoney;

        return 1;
    }

    return 0;
}

//! FE8U = 0x08083A10
int EvCheck09_(struct EventInfo* info) {
    struct EvCheck08* listScript = (void *)info->listScript;

    int x = EVT_CMD_B1(listScript->unk8);
    int y = EVT_CMD_B2(listScript->unk8);
    int tileCommand = EVT_CMD_B3(listScript->unk8);
    int givenMoney = EVT_CMD_B4(listScript->unk8);

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript->script;
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(((struct EvCheck08 *)info->listScript)->unk0);

        info->commandId = tileCommand;
        info->givenMoney = givenMoney;

        return 1;
    }

    return 0;
}

struct EvCheck0A {
    u32 unk0;
    u32 script;
    u8 x;
    u8 y;
    u16 tileCommand;
};

//! FE8U = 0x08083A58
int EvCheck0A_SHOP(struct EventInfo* info) {
    struct EvCheck0A* listScript = (void *)info->listScript;

    int x = listScript->x;
    int y = listScript->y;

    int tileCommand = listScript->tileCommand;

    if ((x == info->xPos) && (y == info->yPos)) {
        if ((tileCommand != TILE_COMMAND_SECRET || (GetUnitItemSlot(gActiveUnit, ITEM_MEMBERCARD) != -1))) {
            info->script = listScript->script;
            info->flag = listScript->unk0 >> 16;
            info->commandId = tileCommand;
            return 1;
        }
    }

    return 0;
}

struct EvCheck0B {
    u32 unk0;
    u32 script;
    u32 unk8;
};

//! FE8U = 0x08083AA4
int EvCheck0B_AREA(struct EventInfo* info) {
    s8 x = gActiveUnit->xPos;
    s8 y = gActiveUnit->yPos;

    s8 x1 = EVT_CMD_B1(((struct EvCheck0B *)info->listScript)->unk8);
    s8 y1 = EVT_CMD_B2(((struct EvCheck0B *)info->listScript)->unk8);
    s8 x2 = EVT_CMD_B3(((struct EvCheck0B *)info->listScript)->unk8);
    s8 y2 = EVT_CMD_B4(((struct EvCheck0B *)info->listScript)->unk8);

    if ((x1 <= x && x <= x2) || (x2 <= x && x <= x1)) {
        if ((y1 <= y && y <= y2) || (y2 <= y && y <= y1)) {
            info->script = ((struct EvCheck0B *)info->listScript)->script;
            info->flag = EVT_CMD_HI(((struct EvCheck0B *)info->listScript)->unk0);

            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x08083B24
int EvCheck0C_Never(struct EventInfo* info) {
    return 0;
}

//! FE8U = 0x08083B28
int EvCheck0D_Never(struct EventInfo* info) {
    return 0;
}

struct EvCheck0E {
    u32 unk0;
    u32 script;
    s8 (*func)(struct EventInfo*);
};

//! FE8U = 0x08083B2C
int EvCheck0E_(struct EventInfo* info) {
    if (((struct EvCheck0E *)info->listScript)->func(info) != 0) {
        info->script = ((struct EvCheck0E *)info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0E *)info->listScript)->unk0);
        return 1;
    }

    return 0;
}

struct EvCheck0F {
    u32 unk0;
    u32 unk4;
    u32 script;
    u32 unkC;
};

//! FE8U = 0x08083B58
int EvCheck0F_(struct EventInfo* info) {
    int unk = EVT_CMD_LO(((struct EvCheck0F *)info->listScript)->unkC);
    int unk2 = EVT_CMD_HI(((struct EvCheck0F *)info->listScript)->unk0);

    if ((CheckFlag(unk2) == 0) && (CheckFlag(unk) != 0)) {
        info->script = ((struct EvCheck0F *)info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0F *)info->listScript)->unk0);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083B98
int EvCheck10_(struct EventInfo* info) {
    int unk = EVT_CMD_LO(((struct EvCheck0F *)info->listScript)->unkC);
    int unk2 = EVT_CMD_HI(((struct EvCheck0F *)info->listScript)->unk0);

    if ((CheckFlag(unk2) == 0) && (CheckFlag(unk) != 0)) {
        info->script = ((struct EvCheck0F *)info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0F *)info->listScript)->unk0);
        return 1;
    }

    return 0;
}

u8 CONST_DATA gFlagBitMaskLut[100 / 8 + 1] = {
    [0] = 1 << 0,
    [1] = 1 << 1,
    [2] = 1 << 2,
    [3] = 1 << 3,
    [4] = 1 << 4,
    [5] = 1 << 5,
    [6] = 1 << 6,
    [7] = 1 << 7,
};

//! FE8U = 0x08083BD8
void SetChapterFlag(int flag) {
    if (flag == 0) {
        return;
    }

    flag = flag - 1;

    gChapterFlagBits[flag / 8] |= gFlagBitMaskLut[flag % 8];

    return;
}

//! FE8U = 0x08083C0C
void ClearChapterFlag(int flag) {
    u8 mask;

    if (flag == 0) {
        return;
    }

    flag = flag - 1;

    mask = ~gFlagBitMaskLut[flag % 8];
    gChapterFlagBits[flag / 8] = mask & gChapterFlagBits[flag / 8];

    return;
}

//! FE8U = 0x08083C48
void ResetChapterFlags(void) {
    int i;

    for (i = 0; i < (32 + 8) / 8; i++) {
        gChapterFlagBits[i] = 0;
    }

    return;
}

//! FE8U = 0x08083C60
s8 CheckChapterFlag(int flag) {
    if (flag == 0) {
        return 0;
    }

    flag = flag - 1;

    if ((gChapterFlagBits[flag / 8] & gFlagBitMaskLut[flag % 8]) != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083CA0
void SetPermanentFlag(int flag) {
    if (flag < 100) {
        return;
    }

    if (flag == 100) {
        return;
    }

    flag = flag - 100 - 1;

    gPermanentFlagBits[flag / 8] |=  gFlagBitMaskLut[flag % 8];

    return;
}

void ClearPermanentFlag(int flag) {
    u8 mask;

    if (flag < 100) {
        return;
    }

    if (flag == 100) {
        return;
    }

    flag = flag - 100 - 1;

    mask = ~gFlagBitMaskLut[flag % 8];
    gPermanentFlagBits[flag / 8] = mask & gPermanentFlagBits[flag / 8];

    return;
}

//! FE8U = 0x08083D18
void ResetPermanentFlags(void) {
    int i;

    for (i = 0; i < 25; i++) {
        gPermanentFlagBits[i] = 0;
    }

    return;
}

//! FE8U = 0x08083D34
s8 CheckPermanentFlagFrom(int flag, void* list) {

    if (flag < 100 || flag == 100) {
        return 0;
    }

    flag = flag - 100 - 1;

    if (( ((u8*)list)[flag / 8] & gFlagBitMaskLut[flag % 8]) != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083D6C
s8 CheckPermanentFlag(int flag) {
    return CheckPermanentFlagFrom(flag, gPermanentFlagBits);
}

//! FE8U = 0x08083D80
void SetFlag(int flag) {

    if (flag < 100) {
        SetChapterFlag(flag);
    } else {
        SetPermanentFlag(flag);
    }
    return;
}

//! FE8U = 0x08083D94
void ClearFlag(int flag) {
    if (flag < 100) {
        ClearChapterFlag(flag);
    } else {
        ClearPermanentFlag(flag);
    }
    return;
}

//! FE8U = 0x08083DA8
s8 CheckFlag(int flag) {
    if (flag < 100) {
        return CheckChapterFlag(flag);
    } else {
        return CheckPermanentFlag(flag);
    }
}

//! FE8U = 0x08083DC0
u8* GetPermanentFlagBits(void) {
    return gPermanentFlagBits;
}

//! FE8U = 0x08083DC8
int GetPermanentFlagBitsSize(void) {
    return 0x19;
}

//! FE8U = 0x08083DCC
u8* GetChapterFlagBits(void) {
    return gChapterFlagBits;
}

//! FE8U = 0x08083DD4
int GetChapterFlagBitsSize(void) {
    return 5;
}

//! FE8U = 0x08083DD8
void EnqueueTutEvent(uintptr_t ptr, u8 event_enqueue_type)
{
    u16 i = 0;
    const u32 * tutorialEvents = GetChapterEventDataPointer(gPlaySt.chapterIndex)->tutorialEvents;

    for (; tutorialEvents[i] != 0; i++)
    {
        if (tutorialEvents[i] == ptr)
        {
            gPlaySt.tutorial_counter = i + 1;
            gPlaySt.tutorial_exec_type = event_enqueue_type;
            break;
        }
    }
}

bool CheckTutorialEvent(u8 type)
{
    if ((gPlaySt.tutorial_counter != 0) && (gPlaySt.tutorial_exec_type == type))
        return true;

    return false;
}

bool RunTutorialEvent(u8 type)
{
    int counter;
    if ((gPlaySt.tutorial_counter != 0) && (gPlaySt.tutorial_exec_type == type)) {
        counter = gPlaySt.tutorial_counter;
        CallEvent(((u16**)(GetChapterEventDataPointer(gPlaySt.chapterIndex)->tutorialEvents))[counter - 1], 1);
        gPlaySt.tutorial_counter = 0;
        gPlaySt.tutorial_exec_type = 0;
        return true;
    }
    return false;
}

//! FE8U = 0x08083EB8
s8 RunPhaseSwitchEvents(void) {
    u8 ret;
    int type;
    u16 chapter;

    struct EventInfo* pInfo;
    struct EventInfo info;

    if (GetBattleMapKind() == 2) {
        return 0;
    }

    chapter = gPlaySt.chapterIndex;

    if (chapter != 0) {
        if (GetBattleMapKind() != 2) {
            type = GetROMChapterStruct(chapter)->goalWindowDataType;
        } else {
            type = GOAL_TYPE_DEFEAT_ALL;
        }

        if (((type == GOAL_TYPE_DEFEAT_ALL) || (type == GOAL_TYPE_DEFEAT_BOSS)) && (AreAnyEnemyUnitDead() == 0))
        {
            if (GetBattleMapKind() == 0)
                SetFlag(EVFLAG_WIN);

            CallEndEvent();
            return 1;
        }
    }

    ret = RunTutorialEvent(TUTORIAL_EVT_TYPE_PHASECHANGE);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->turnBasedEvents;
    pInfo = SearchAvailableEvent(&info);

    if (pInfo) {
        ClearActiveEventRegistry();

        while (pInfo) {
            StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
            pInfo = SearchNextAvailableEvent(&info);
        }

        return 1;
    }

    return ret;
}

//! FE8U = 0x08083F68
s8 CheckForCharacterEvents(u8 pidA, u8 pidB) {
    struct EventInfo info;

    if (GetBattleMapKind() == 2) {
        return 0;
    }

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (SearchAvailableEvent(&info)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083FB0
void StartCharacterEvent(u8 pidA, u8 pidB) {
    struct EventInfo info;

    if (GetBattleMapKind() == 2) {
        return;
    }

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (SearchAvailableEvent(&info)) {
        ClearActiveEventRegistry();
        StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
    }

    return;
}

//! FE8U = 0x08083FFC
u16 sub_8083FFC(u16 itemId) {
    if (itemId == ITEM_MEMBERCARD) {
        if (GetConvoyItemSlot(ITEM_MEMBERCARD) != -1) {
            return ITEM_WHITEGEM;
        } else {
            int i;

            for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
                u8 j;
                struct Unit* unit = GetUnit(i);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->state & US_DEAD) {
                    continue;
                }

                for (j = 0; j < UNIT_ITEM_COUNT; j++) {
                    if (GetItemIndex(unit->items[j]) == 0) {
                        break;
                    }

                    if (GetItemIndex(unit->items[j]) == ITEM_MEMBERCARD) {
                        return ITEM_WHITEGEM;
                    }
                }
            }
        }
    }

    return itemId;
}

//! FE8U = 0x08084078
int GetAvailableTileEventCommand(s8 x, s8 y) {
    struct EventInfo info;

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (SearchAvailableEvent(&info) && (GetBattleMapKind() != 2)) {
        return info.commandId;
    }

    return 0;
}

//! FE8U = 0x080840C4
void StartAvailableTileEvent(s8 x, s8 y) {
    struct EventInfo info;

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (SearchAvailableEvent(&info) == NULL) {
        return;
    }

    switch (info.commandId) {
        case TILE_COMMAND_VISIT:
            gBmMapUnit[y][x] = gActiveUnit->pCharacterData->number;

            // fallthrough

        case TILE_COMMAND_SEIZE:
            if (GetBattleMapKind() == 2) {
                return;
            }

            ClearActiveEventRegistry();
            StartEventFromInfo(&info, EV_EXEC_CUTSCENE);

            if (info.givenMoney == 3) {
                CallTileChangeEvent(GetMapChangeIdAt(info.xPos, info.yPos));
            }

            return;

        case TILE_COMMAND_20:
            if (GetBattleMapKind() == 2) {
                return;
            }

            CallTileChangeEvent(GetMapChangeIdAt(info.xPos,info.yPos));

            return;

        case TILE_COMMAND_DOOR:
        case TILE_COMMAND_BRIDGE:
            if (GetBattleMapKind() == 2) {
                return;
            }

            if (info.script == 1) {
                CallTileChangeEvent(GetMapChangeIdAt(info.xPos, info.yPos));
                SetFlag(info.flag);
            } else {
                ClearActiveEventRegistry();
                StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
            }

            return;

        case TILE_COMMAND_CHEST:
            if (GetBattleMapKind() == 2) {
                return;
            }

            if (info.givenItem == 0) {
                u8 b;
                u8 rand = NextRN_100();
                u8* ptr = (u8*)(info.script);
                u8 r0;

                r0 = ptr[0];
                if (r0 != 0) {

                    b = ptr[1];
                    if (rand >= b) {
                        for (; rand >= b; b += ptr[1]) {
                            ptr+=2;
                            if (ptr[0] == 0) {
                                goto _08084274;
                            }
                        }
                        r0 = ptr[0];
                    }

                    info.givenItem = r0;
                }
            _08084274:
                info.givenItem = sub_8083FFC(info.givenItem);
                CallChestOpeningEvent(GetMapChangeIdAt(info.xPos, info.yPos), info.givenItem);
            } else {
                if (info.givenItem != 0x77) {
                    info.givenItem = sub_8083FFC(info.givenItem);
                    CallChestOpeningEvent(GetMapChangeIdAt(info.xPos, info.yPos), info.givenItem);
                } else {
                    CallChestOpeningEvent(GetMapChangeIdAt(info.xPos, info.yPos), info.givenMoney);
                }
            }

            SetFlag(info.flag);

            return;

        case TILE_COMMAND_ARMORY:
            if (GetBattleMapKind() == 2) {
                return;
            }

            StartArmoryScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

        case TILE_COMMAND_VENDOR:
            if (GetBattleMapKind() == 2) {
                return;
            }
            StartVendorScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

        case TILE_COMMAND_SECRET:
            if (GetBattleMapKind() == 2) {
                return;
            }

            StartSecretShopScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

#if !NONMATCHING
        case TILE_COMMAND_SHOP_UNK:
            asm("nop");
            return;

        case TILE_COMMAND_NONE:
            asm("nop");
            return;
#endif
    }

    return;
}

//! FE8U = 0x08084330
s8 CheckForWaitEvents(void) {
    s8 ret;
    struct EventInfo info;

    if (AreAnyEnemyUnitDead() == 0) {
        SetFlag(EVFLAG_DEFEAT_ALL);

        if (GetBattleMapKind() == 2) {
            return 1;
        }
    } else {
        ClearFlag(EVFLAG_DEFEAT_ALL);
    }

    if (!CheckFlag(EVFLAG_GAMEOVER) && (CountAvailableBlueUnits() != 0)) {
        if (GetBattleMapKind() == 2) {
            return 0;
        }

        ret = CheckTutorialEvent(TUTORIAL_EVT_TYPE_POSTACTION);

        info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->miscBasedEvents;
        info.xPos = gActiveUnit->xPos;
        info.yPos = gActiveUnit->yPos;

        if (SearchAvailableEvent(&info) == 0) {
            return ret;
        }
    }

    return 1;
}

//! FE8U = 0x080843C0
void RunWaitEvents(void) {
    struct EventInfo* pInfo;
    struct EventInfo info;

    if (AreAnyEnemyUnitDead() == 0) {
        SetFlag(EVFLAG_DEFEAT_ALL);
        if (GetBattleMapKind() == 2) {
            CallEndEvent();
            return;
        }
    } else {
        ClearFlag(6);
    }

    if (CheckFlag(0x65) || (CountAvailableBlueUnits() == 0)) {
        sub_80837B0();
        return;
    }

    if (GetBattleMapKind() == 2) {
        return;
    }

    RunTutorialEvent(TUTORIAL_EVT_TYPE_POSTACTION);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->miscBasedEvents;
    info.xPos = gActiveUnit->xPos;
    info.yPos = gActiveUnit->yPos;

    if (!SearchAvailableEvent(&info)) {
        return;
    }

    ClearActiveEventRegistry();

    do {
        StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
        pInfo = SearchNextAvailableEvent(&info);
    } while (pInfo);

    return;
}

//! FE8U = 0x0808445C
s8 TryCallSelectEvents(void) {
    s8 ret;
    struct EventInfo info;

    if (GetBattleMapKind() == 2) {
        return 0;
    }

    ret = RunTutorialEvent(TUTORIAL_EVT_TYPE_ONSELECT);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsWhenUnitSelected;

    ClearActiveEventRegistry();

    while (SearchAvailableEvent(&info)) {
        StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
        ret = 1;
    }

    return ret;
}

//! FE8U = 0x080844B0
s8 StartDestSelectedEvent(void) {
    s8 ret;
    struct EventInfo info;

    if (GetBattleMapKind() == 2) {
        return 0;
    }

    ret = RunTutorialEvent(TUTORIAL_EVT_TYPE_DESTSELECTED);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsWhenDestSelected;

    if (SearchAvailableEvent(&info)) {
        ClearActiveEventRegistry();
        StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
        return 1;
    }

    return ret;
}

//! FE8U = 0x08084508
s8 StartAfterUnitMovedEvent(void) {
    s8 ret;
    struct EventInfo info;

    if (GetBattleMapKind() == 2) {
        return 0;
    }

    ret = RunTutorialEvent(TUTORIAL_EVT_TYPE_AFTERMOVE);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsAfterUnitMoved;

    if (SearchAvailableEvent(&info)) {
        ClearActiveEventRegistry();
        StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
        return 1;
    }

    return ret;
}

//! FE8U = 0x08084560
s8 CheckBattleForecastTutorialEvent(void) {
    if (GetBattleMapKind() == 2) {
        return 0;
    }

    return CheckTutorialEvent(TUTORIAL_EVT_TYPE_FORECAST);
}

//! FE8U = 0x0808457C
void StartBattleForecastTutorialEvent(void) {
    if (GetBattleMapKind() == 2) {
        return;
    }

    RunTutorialEvent(TUTORIAL_EVT_TYPE_FORECAST);
    return;
}

//! FE8U = 0x08084590
void StartPlayerPhaseStartTutorialEvent(void) {
    if (GetBattleMapKind() == 2) {
        return;
    }

    RunTutorialEvent(TUTORIAL_EVT_TYPE_PLAYERPHASE);
    return;
}

//! FE8U = 0x080845A4
void ClearActiveEventRegistry(void) {
    memset(&gActiveEventRegistry, 0, sizeof(gActiveEventRegistry));
    return;
}

//! FE8U = 0x080845B8
void RegisterEventActivation(u32 script, u16 flag)
{
    gActiveEventRegistry.scripts[gActiveEventRegistry.idx] = script;
    gActiveEventRegistry.flags[gActiveEventRegistry.idx] = flag;
    gActiveEventRegistry.idx++;
}

//! FE8U = 0x080845E4
u16 GetEventTriggerId(const void * script)
{
    s16 i;
    for (i = 0; i < gActiveEventRegistry.idx; i++)
        if (gActiveEventRegistry.scripts[i] == (u32)script)
            return gActiveEventRegistry.flags[i];

    return 0;
}

//! FE8U = 0x08084628
void SetFlag82(void)
{
    SetFlag(0x82);
}

//! FE8U = 0x08084634
bool CheckFlag82(void)
{
    if (CheckFlag(0x82))
        return true;

    return false;
}

//! FE8U = 0x0808464C
struct BattleTalkExtEnt* GetBattleQuoteEntry(u16 pidA, u16 pidB) {
    struct BattleTalkExtEnt* it;

    for (it = gBattleTalkList; it->pidA != 0xFFFF; it++) {

        if (it->chapter != 0xff && it->chapter != gPlaySt.chapterIndex) {
            if (it->chapter != 0xfe || BattleIsTriangleAttack() != 1) {
                continue;
            }
        }

        if (GetEventTriggerState(it->flag)) {
            continue;
        }

        if (it->pidA != 0) {

            if (it->pidB == 0) {
                if (pidA == it->pidA) {
                    return it;
                }
                continue;
            }

        } else {
            if (it->pidB == 0) {
                continue;
            }

            if (pidB == it->pidB) {
                return it;
            }

            continue;
        }

        if ((pidA == it->pidA) && (pidB == it->pidB)) {
            return it;
        }

        if ((pidB == it->pidA) && (pidA == it->pidB)) {
            return it;
        }


    }

    return NULL;
}

//! FE8U = 0x080846E4
struct DefeatTalkEnt* GetDefeatTalkEntry(u16 pid) {
    struct DefeatTalkEnt* it;

    for (it = gDefeatTalkList; it->pid != 0xFFFF; it++) {
        if ((it->route != 0xff) && (it->route != gPlaySt.chapterModeIndex)) {
            continue;
        }

        if ((it->chapter != 0xff) && (it->chapter != gPlaySt.chapterIndex)) {
            continue;
        }

        if (GetEventTriggerState(it->flag) != 0) {
            continue;
        }

        if (pid != it->pid) {
            continue;
        }

        return it;
    }

    return NULL;
}

//! FE8U = 0x08084748
struct SupportTalkEnt * GetSupportTalkEntry(u16 pidA, u16 pidB)
{
    struct SupportTalkEnt * it;

    for (it = gSupportTalkList; it->unitA != 0xFFFF; it++)
    {
        if ((pidA == it->unitA) && (pidB == it->unitB))
            return it;

        if ((pidB == it->unitA) && (pidA == it->unitB))
            return it;
    }
    return NULL;
}

//! FE8U = 0x0808478C
u16 GetSupportTalkSong(u16 pidA, u16 pidB, u8 rank) {
    int unk;

    struct SupportTalkEnt* ent = GetSupportTalkEntry(pidA, pidB);

    if (ent == NULL) {
        return 0;
    }

    switch (rank) {
        case 1:
            unk = ent->unk_0c_0;
            break;

        case 2:
            unk = ent->unk_0c_5;
            break;

        case 3:
            unk = ent->unk_0d_3;
            break;

        default:
            return 0;
    }

    switch (unk) {
        case 1:
            return 0x27;

        case 2:
            return 0x4c;

        case 3:
            return 0x6a;

        case 4:
            return 0x6a;
    }

    return 0;
}

//! FE8U = 0x080847F8
struct SupportTalkEnt* GetSupportTalkList(void) {
    return gSupportTalkList;
}

//! FE8U = 0x08084800
bool IsCharacterForceDeployed_(u16 pid)
{
    struct ForceDeploymentEnt * it;

    for (it = gForceDeploymentList; it->pid != (u16)-1; it++)
    {
        if (it->route != 0xFF && it->route != gPlaySt.chapterModeIndex)
            continue;

        if (it->chapter != 0xFF && it->chapter != gPlaySt.chapterIndex)
            continue;

        if (pid != it->pid)
            continue;

        return true;
    }
    return false;
}

//! FE8U = 0x08084858
int IsSethLArachelMyrrhInnes(u16 pid)
{
    u8 * it;

    for (it = gPidList_SethLArachelMyrrhInnes; *it != CHARACTER_NONE; it++)
        if (*it == pid)
            return true;

    return false;
}
