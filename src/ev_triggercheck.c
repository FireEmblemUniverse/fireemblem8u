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

#include "ev_triggercheck.h"

#include "constants/items.h"

#define EVT_CMD_LO(cmd) (((cmd) & 0x0000FFFF))
#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)
#define EVT_CMD_B1(cmd) (((cmd) & 0x000000FF))
#define EVT_CMD_B2(cmd) (((cmd) & 0x0000FF00) >> 8)
#define EVT_CMD_B3(cmd) (((cmd) & 0x00FF0000) >> 16)
#define EVT_CMD_B4(cmd) (((cmd) & 0xFF000000) >> 24)

extern struct EventListCmdInfo gUnknown_089E84F4[];

extern u16 gUnknown_089FFD64[];

extern u8 gUnknown_03005270[];
extern u8 gUnknown_089E857C[];
extern u8 gUnknown_03005250[];

struct ActiveEventRegistry {
    /* 00 */ u32 unk_00[10];
    /* 28 */ s16 unk_28[10];
    /* 3C */ s16 unk_3c;
};

extern struct ActiveEventRegistry gUnknown_03001C80;

//! FE8U = 0x08082E80
void CallEventsFromBuffer(struct EventInfo* info, u8 execType) {
    if (info->script == 0) {
        return;
    }

    SetEventId((int)info->flag);

    if ((int)info->script == 1) {
        return;
    }

    sub_80845B8(info->script, info->flag);
    CallEvent((u16*)info->script, execType);

    if (CheckEventId(3) != 0) {
        sub_8019108();
        SetEventId(0x84);
    }

    return;
}

//! FE8U = 0x08082EC4
struct EventInfo* CheckForEvents(struct EventInfo* info) {
    int* len;
    struct EventListCmdInfo* cmdInfo;

    info->script = 0;
    info->flag = 0;

    cmdInfo = gUnknown_089E84F4;
    len = &cmdInfo[0].length;

    for (;;) {
        int cmdId = EVT_CMD_LO(info->listScript[0]);
        int r6 = cmdId;

        if (!CheckEventId(EVT_CMD_HI(info->listScript[0]))) {

            if (cmdInfo[cmdId].func(info) != 1) {
            label:
                info->listScript += len[r6 << 1];
                continue;
            }

            if (info->script) {
                return info;
            }

            break;
        }

        goto label;
    }

    return NULL;
}

struct EventInfo* CheckForNextEvents(struct EventInfo* info) {
    if (info != NULL) {
        int cmdId = EVT_CMD_LO(info->listScript[0]);
        info->listScript += gUnknown_089E84F4[cmdId].length;

        return CheckForEvents(info);
    }

    return NULL;
}

//! FE8U = 0x08082F58
s8 sub_8082F58(struct EventInfo* info, u8 pidA, u8 pidB) {

    if ((info->pidA == pidA) && (info->pidB == pidB)) {
        info->script = info->listScript[1];
        info->flag = EVT_CMD_HI(info->listScript[0]);

        return 1;
    }

    return 0;
}

//! FE8U = 0x08082F84
s8 sub_8082F84(int x1, int y1, int x2, int y2) {
    if ((((gActiveUnit->xPos >= x1) && (gActiveUnit->xPos <= x2)) && (gActiveUnit->yPos >= y1)) && (gActiveUnit->yPos <= y2)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08082FB8
s8 sub_8082FB8(int x1, int y1, int x2, int y2) {
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_BIT16)) {
            continue;
        }

        if ((unit->xPos >= x1) && (unit->xPos <= x2) && (unit->yPos >= y1) && (unit->yPos <= y2)) {
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x08083018
s8 sub_8083018(void) {

    if (gPlaySt.faction != FACTION_RED) {
        return 0;
    }

    if (sub_8082FB8(0, 15, 25, 23)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08083044
s8 sub_8083044(void) {

    if (gPlaySt.faction != FACTION_RED) {
        return 0;
    }

    if (sub_8082FB8(0, 24, 16, 27)) {
        return 1;
    }

    if (sub_8082FB8(0, 21, 2, 23)) {
        return 1;
    }

    if (sub_8082FB8(3, 20, 5, 22)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083094
s8 sub_8083094(void) {
    return sub_8082FB8(12, 21, 31, 24);
}

//! FE8U = 0x080830AC
s8 sub_80830AC(void) {
    if (gPlaySt.faction != FACTION_RED) {
        return 0;
    }

    return sub_8082FB8(17, 21, 31, 35);
}

//! FE8U = 0x080830D4
s8 sub_80830D4(void) {
    if (gPlaySt.faction != FACTION_RED) {
        return 0;
    }

    return sub_8082FB8(0, 15, 8, 18);
}

//! FE8U = 0x080830FC
s8 sub_80830FC(void) {
    if (gPlaySt.faction != FACTION_RED) {
        return 0;
    }

    return sub_8082FB8(0, 24, 12, 27);
}

//! FE8U = 0x08083124
s8 sub_8083124(void) {
    if (gPlaySt.faction != FACTION_RED) {
        return 0;
    }

    return sub_8082FB8(21, 0, 30, 6);
}

//! FE8U = 0x0808314C
s8 sub_808314C(int x1, int y1, int x2, int y2) {
    int i;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_BIT16)) {
            continue;
        }

        if ((unit->xPos >= x1) && (unit->xPos <= x2) && (unit->yPos >= y1) && (unit->yPos <= y2)) {
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080831AC
s8 IsThereClosedChestAt(s8 x, s8 y) {
    if (GetAvailableLocaCommandAt(x, y) == TILE_COMMAND_CHEST) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080831C8
void sub_80831C8(s8 x, s8 y) {
    if (IsThereClosedChestAt(x, y)) {
        sub_80840C4(x, y);
    }

    return;
}

s8 IsThereClosedDoorAt(s8 x, s8 y) {
    if (GetAvailableLocaCommandAt(x, y) == TILE_COMMAND_DOOR) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0808320C
void sub_808320C(s8 x, s8 y) {
    if (IsThereClosedDoorAt(x, y)) {
        sub_80840C4(x, y);
    }

    return;
}

//! FE8U = 0x08083234
s8 sub_8083234(s8 x, s8 y) {
    if (GetAvailableLocaCommandAt(x, y) == 0x15) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083250
s8 sub_8083250(void) {
    if (GetChapterThing() == 2) {
        return 0;
    }

    return CheckEventId3();
}

//! FE8U = 0x0808326C
void sub_808326C(void) {
    if (GetChapterThing() != 2) {
        sub_80832E8();
    }

    return;
}

//! FE8U = 0x08083280
void sub_8083280(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetChapterThing() != 2) {
        CallEvent(evGroup->endingSceneEvents, 1);
    } else {
        CallEvent(gUnknown_089FFD64, 1);
    }

    sub_8019108();
    SetEventId(0x84);

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
s8 CheckEventId3(void) {
    return CheckEventId(3);
}

//! FE8U = 0x080832E8
void sub_80832E8(void) {
    if (!CheckEventId(3)) {
        return;
    }

    if (!sub_8083250()) {
        return;
    }

    sub_8083280();

    return;
}

//! FE8U = 0x08083308
void* GetCurrentChapterBallistaePtr(void) {
    return GetChapterEventDataPointer(gPlaySt.chapterIndex)->traps;
}

//! FE8U = 0x08083320
void* GetCurrentChapterBallistae2Ptr(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD) {
        return evGroup->extraTrapsInHard;
    }

    return NULL;
}

//! FE8U = 0x08083348
void* GetChapterAllyUnitDataPointer(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetChapterThing() != 2) {
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
void* sub_80833B0(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    void* ret = NULL;

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
void sub_8083400(u8 chapterId, u8* list) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(chapterId);

    list[0] = ((u8*)(evGroup->enemyUnitsChoice1InEncounter))[1];
    list[1] = ((u8*)(evGroup->enemyUnitsChoice2InEncounter))[1];
    list[2] = ((u8*)(evGroup->enemyUnitsChoice3InEncounter))[1];

    return;
}

//! FE8U = 0x08083424
s8 sub_8083424(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (evGroup->playerUnitsChoice1InEncounter == 0) {
        return 0;
    }

    if (evGroup->playerUnitsChoice2InEncounter == 0) {
        return 0;
    }

    if (evGroup->playerUnitsChoice3InEncounter == 0) {
        return 0;
    }

    if (evGroup->enemyUnitsChoice1InEncounter == 0) {
        return 0;
    }

    if (evGroup->enemyUnitsChoice2InEncounter == 0) {
        return 0;
    }

    if (evGroup->enemyUnitsChoice3InEncounter == 0) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x08083468
struct BattleTalkEnt* sub_8083468(u8 pid, struct BattleTalkEnt* it) {
    for (; it->pid != 0; it++) {
        if (CheckEventId(it->flag)) {
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
    if (GetChapterThing() == 2) {
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

    if (GetChapterThing() == 2) {
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
            if (ent->unk_0c != 0) {
                EventEngine_CreateBattle((u16 *)ent->unk_0c);
            }
        }

        SetEventId(ent->flag);
    }

    return;
}

//! FE8U = 0x08083570
void sub_8083570(u8 pid, int flag) {
    const struct ROMChapterData* chapterData;

    if ((GetChapterThing() == 0) || (chapterData = GetROMChapterStruct(gPlaySt.chapterIndex), pid != chapterData->protectCharacterIndex) || flag != 0x65) {
        SetEventId(flag);
        return;
    }

    return;
}

//! FE8U = 0x080835A8
s8 EkrCheckSomeDeathMaybe(u8 pid) {
    struct DefeatTalkEnt* ent = sub_80846E4(pid);

    if (ent) {
        if (ent->msg == 0 && ent->event == 0) {
            sub_8083570(pid, ent->flag);
        } else {
            return 1;
        }

    }

    return 0;
}

//! FE8U = 0x080835DC
void sub_80835DC(u8 pid) {
    struct DefeatTalkEnt* ent = sub_80846E4(pid);

    if (ent) {
        if ((ent->route == 1) && (ent->flag == 0x65)) {
            StartBgm(0x3e, NULL);
            gPlaySt.cfgDisableBgm = 1;
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

        sub_8083570(pid, ent->flag);
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
void sub_808371C(u8 pidA, u8 pidB, int rank) {
    struct SupportTalkEnt* ent = sub_8084748(pidA, pidB);

    if (ent) {
        CallMapSupportEvent(
            sub_808478C(pidA, pidB, rank),
            ent->msgSupports[rank - 1]
        );

        UpdateBestGlobalSupportValue(pidA, pidB, rank);
    }

    return;
}

//! FE8U = 0x08083764
void sub_8083764(u8 pidA, u8 pidB, int rank) {
    struct SupportTalkEnt* ent = sub_8084748(pidA, pidB);

    if (ent) {
        CallSupportViewerEvent(ent->msgSupports[rank - 1]);
    }

    return;
}

//! FE8U = 0x08083790
u16 sub_8083790(u8 unused, u8 pidA, u8 pidB, int rank) {
    return sub_808478C(pidA, pidB, rank);
}

//! FE8U = 0x080837B0
void sub_80837B0(void) {
    SetEventId(0x65);
    StartBgm(0x3e, NULL);
    gPlaySt.cfgDisableBgm = 1;
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
s8 sub_80837F8(void) {
    int ret = 0;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD) && (gPlaySt.cfgController != 1)) {
        ret = CheckEventId(0x87) != 0;
    }

    return ret;
}

//! FE8U = 0x08083830
s8 sub_8083830(void) {
    return 1;
}

//! FE8U = 0x08083834
int CheckAFEV(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    if ((listScript[2] == 0) || (listScript[2] == 100) || (CheckEventId(listScript[2]) == 1)) {
        info->script = listScript[1];
        info->flag = EVT_CMD_HI(listScript[0]);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083864
int CheckTURN(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    int turn = ((u8*)listScript)[8];
    int maxTurn = ((u8*)listScript)[9];
    int faction = ((u16*)listScript)[10 / sizeof(u16)];

    if (maxTurn == 0) {
        maxTurn = turn;
    } else if (maxTurn == 0xff) {
        maxTurn = INT32_MAX;
    }


    if ((turn <= gPlaySt.chapterTurnNumber) && (gPlaySt.chapterTurnNumber <= maxTurn) && (gPlaySt.faction == faction)) {
        info->script = listScript[1];
        info->flag = EVT_CMD_HI(listScript[0]);

        return 1;
    }

    return 0;
}

//! FE8U = 0x080838AC
int CheckCHAR(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    int pidA = ((u8*)listScript)[8];
    int pidB = ((u8*)listScript)[9];
    int unk = ((u16*)listScript)[12 / sizeof(u16)];

    switch (unk) {
        case 1:
            return 0;
        case 2:
            return 0;
        case 3:
            if ((CheckEventId(((u16*)listScript)[14 / sizeof(u16)]) == 0)) {
                return 0;
            }
            break;
    }

    if (((info->pidA == pidA) || (pidA == 0)) && info->pidB == pidB) {
        info->script = listScript[1];
        info->flag = EVT_CMD_HI(listScript[0]);
        return 1;
    }

    return 0;
}

//! FE8U = 0x080838FC
int CheckCHARASM(struct EventInfo* info) {
#if NONMATCHING
    EventListScr* listScript = info->listScript;
#else // if !NONMATCHING
    register EventListScr* listScript asm("r5") = info->listScript;
#endif // NONMATCHING

    int pidA = ((u8*)listScript)[8];
    int pidB = ((u8*)listScript)[9];
    s8 (*func)(struct EventInfo* info) = (void*)((u32*)listScript)[12 / sizeof(u32)];

    if ((func(info) != 0) && (info->pidA == pidA || (pidA == 0)) && (info->pidB == pidB)) {
        info->script = listScript[1];
        info->flag = EVT_CMD_HI(listScript[0]);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083938
int CheckLOCA(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    int x = ((u8*)listScript)[8];
    int y = ((u8*)listScript)[9];
    int cmdId = ((u16*)listScript)[10 / sizeof(u16)];

    info->givenMoney = 0;

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript[1];
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(listScript[0]);
        info->commandId = ((u16*)listScript)[10 / sizeof(u16)];

        if (cmdId == TILE_COMMAND_CHEST) {
            info->givenItem = 0;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x08083978
int CheckVILL(struct EventInfo* info) {
    CheckLOCA(info);
    info->givenMoney = 3;

    // return 1; // BUG?
}

//! FE8U = 0x0808398C
int CheckCHES(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    u8 x = ((u8*)listScript)[8];
    u8 y = ((u8*)listScript)[9];

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = 1;
        info->flag = EVT_CMD_HI(listScript[0]);
        info->commandId = ((u16*)listScript)[10 / sizeof(u16)];
        info->givenItem = ((u16*)listScript)[4 / sizeof(u16)];
        info->givenMoney = ((u16*)listScript)[6 / sizeof(u16)];

        return 1;
    }

    return 0;
}

//! FE8U = 0x08083A10
int CheckDOOR(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    int x = EVT_CMD_B1(listScript[2]);
    int y = EVT_CMD_B2(listScript[2]);
    int tileCommand = EVT_CMD_B3(listScript[2]);
    int unk = EVT_CMD_B4(listScript[2]);

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript[1];
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(info->listScript[0]);

        info->commandId = tileCommand;
        info->givenMoney = unk;

        return 1;
    }

    return 0;
}

//! FE8U = 0x08083A10
int sub_8083A10(struct EventInfo* info) {
    EventListScr* listScript = info->listScript;

    int x = EVT_CMD_B1(listScript[2]);
    int y = EVT_CMD_B2(listScript[2]);
    int tileCommand = EVT_CMD_B3(listScript[2]);
    int unk = EVT_CMD_B4(listScript[2]);

    if ((x == info->xPos) && (y == info->yPos)) {
        info->script = listScript[1];
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(info->listScript[0]);

        info->commandId = tileCommand;
        info->givenMoney = unk;

        return 1;
    }

    return 0;
}

//! FE8U = 0x08083A58
int CheckSHOP(struct EventInfo* info) {
#if NONMATCHING
    EventListScr* listScript = info->listScript;
#else // if !NONMATCHING
    register EventListScr* listScript asm("r5") = info->listScript;
#endif // NONMATCHING

    int x = ((u8*)listScript)[8];
    int y = ((u8*)listScript)[9];

    int tileCommand = ((u16*)listScript)[10 / sizeof(u16)];

    if ((x == info->xPos) && (y == info->yPos)) {
        if ((tileCommand != TILE_COMMAND_SECRET || (GetUnitItemSlot(gActiveUnit, ITEM_MEMBERCARD) != -1))) {
            info->script = listScript[1];
            info->flag = EVT_CMD_HI(listScript[0]);
            info->commandId = tileCommand;
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x08083AA4
int CheckAREA(struct EventInfo* info) {
    s8 x = gActiveUnit->xPos;
    s8 y = gActiveUnit->yPos;

    s8 x1 = EVT_CMD_B1(info->listScript[2]);
    s8 y1 = EVT_CMD_B2(info->listScript[2]);
    s8 x2 = EVT_CMD_B3(info->listScript[2]);
    s8 y2 = EVT_CMD_B4(info->listScript[2]);

    if ((x1 <= x && x <= x2) || (x2 <= x && x <= x1)) {
        if ((y1 <= y && y <= y2) || (y2 <= y && y <= y1)) {
            info->script = info->listScript[1];
            info->flag = EVT_CMD_HI(info->listScript[0]);

            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x08083B24
int sub_8083B24(void) {
    return 0;
}

//! FE8U = 0x08083B28
int sub_8083B28(void) {
    return 0;
}

//! FE8U = 0x08083B2C
int sub_8083B2C(struct EventInfo* info) {
    s8 (*func)(struct EventInfo* info) = (void *)((u32*)(info->listScript))[8 / sizeof(u32)];

    if (func(info) != 0) {
        info->script = info->listScript[1];
        info->flag = EVT_CMD_HI(info->listScript[0]);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083B58
int sub_8083B58(struct EventInfo* info) {
    int unk = EVT_CMD_LO(info->listScript[3]);
    int unk2 = EVT_CMD_HI(info->listScript[0]);

    if ((CheckEventId(unk2) == 0) && (CheckEventId(unk) != 0)) {
        info->script = info->listScript[2];
        info->flag = EVT_CMD_HI(info->listScript[0]);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083B98
int sub_8083B98(struct EventInfo* info) {
    int unk = EVT_CMD_LO(info->listScript[3]);
    int unk2 = EVT_CMD_HI(info->listScript[0]);

    if ((CheckEventId(unk2) == 0) && (CheckEventId(unk) != 0)) {
        info->script = info->listScript[2];
        info->flag = EVT_CMD_HI(info->listScript[0]);
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083BD8
void SetLocalEventId(int flag) {
    if (flag == 0) {
        return;
    }

    flag = flag - 1;

    gUnknown_03005270[flag / 8] |= gUnknown_089E857C[flag % 8];

    return;
}

//! FE8U = 0x08083C0C
void UnsetLocalEventId(int flag) {
    u8 mask;

    if (flag == 0) {
        return;
    }

    flag = flag - 1;

    mask = ~gUnknown_089E857C[flag % 8];
    gUnknown_03005270[flag / 8] = mask & gUnknown_03005270[flag / 8];

    return;
}

//! FE8U = 0x08083C48
void ClearLocalEvents(void) {
    int i;

    for (i = 0; i < (32 + 8) / 8; i++) {
        gUnknown_03005270[i] = 0;
    }

    return;
}

//! FE8U = 0x08083C60
s8 CheckLocalEventId(int flag) {
    if (flag == 0) {
        return 0;
    }

    flag = flag - 1;

    if ((gUnknown_03005270[flag / 8] & gUnknown_089E857C[flag % 8]) != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083CA0
void SetGlobalEventId(int flag) {
    if (flag < 100) {
        return;
    }

    if (flag == 100) {
        return;
    }

    flag = flag - 100 - 1;

    gUnknown_03005250[flag / 8] |=  gUnknown_089E857C[flag % 8];

    return;
}

void UnsetGlobalEventId(int flag) {
    u8 mask;

    if (flag < 100) {
        return;
    }

    if (flag == 100) {
        return;
    }

    flag = flag - 100 - 1;

    mask = ~gUnknown_089E857C[flag % 8];
    gUnknown_03005250[flag / 8] = mask & gUnknown_03005250[flag / 8];

    return;
}

//! FE8U = 0x08083D18
void ResetPermanentFlags(void) {
    int i;

    for (i = 0; i < 25; i++) {
        gUnknown_03005250[i] = 0;
    }

    return;
}

//! FE8U = 0x08083D34
s8 sub_8083D34(int flag, void* list) {

    if (flag < 100 || flag == 100) {
        return 0;
    }

    flag = flag - 100 - 1;

    if (( ((u8*)list)[flag / 8] & gUnknown_089E857C[flag % 8]) != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083D6C
s8 CheckGlobalEventId(int flag) {
    return sub_8083D34(flag, gUnknown_03005250);
}

//! FE8U = 0x08083D80
void SetEventId(int flag) {

    if (flag < 100) {
        SetLocalEventId(flag);
    } else {
        SetGlobalEventId(flag);
    }
    return;
}

//! FE8U = 0x08083D94
void UnsetEventId(int flag) {
    if (flag < 100) {
        UnsetLocalEventId(flag);
    } else {
        UnsetGlobalEventId(flag);
    }
    return;
}

//! FE8U = 0x08083DA8
s8 CheckEventId(int flag) {
    if (flag < 100) {
        return CheckLocalEventId(flag);
    } else {
        return CheckGlobalEventId(flag);
    }
}

//! FE8U = 0x08083DC0
u8* GetPermanentFlagBits(void) {
    return gUnknown_03005250;
}

//! FE8U = 0x08083DC8
int GetPermanentFlagBitsSize(void) {
    return 0x19;
}

//! FE8U = 0x08083DCC
u8* GetChapterFlagBits(void) {
    return gUnknown_03005270;
}

//! FE8U = 0x08083DD4
int GetChapterFlagBitsSize(void) {
    return 5;
}

//! FE8U = 0x08083DD8
void sub_8083DD8(int a, u8 b) {
    u16 i = 0;
    u32* tutorialEvents = GetChapterEventDataPointer(gPlaySt.chapterIndex)->tutorialEvents;

    for (; tutorialEvents[i] != 0; i++) {
        if (tutorialEvents[i] == a) {
            gPlaySt.unk4B = i + 1;
            gPlaySt.unk4A_5 = b;
            return;
        }
    }

    return;
}

//! FE8U = 0x08083E34
s8 sub_8083E34(u8 a) {
    if ((gPlaySt.unk4B != 0) && (gPlaySt.unk4A_5 == a)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083E64
s8 TryCallSelectEvents_u1C(u8 a) {
    if ((gPlaySt.unk4B != 0) && (gPlaySt.unk4A_5 == a)) {
        int unk = gPlaySt.unk4B;
        CallEvent(((u16**)(GetChapterEventDataPointer(gPlaySt.chapterIndex)->tutorialEvents))[unk - 1], 1);
        gPlaySt.unk4B = 0;
        gPlaySt.unk4A_5 = 0;
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083EB8
s8 sub_8083EB8(void) {
    u8 ret;
    int type;
    u16 chapter;

    struct EventInfo* pInfo;
    struct EventInfo info;

    if (GetChapterThing() == 2) {
        return 0;
    }

    chapter = gPlaySt.chapterIndex;

    if (chapter != 0) {
        if (GetChapterThing() != 2) {
            type = GetROMChapterStruct(chapter)->goalWindowDataType;
        } else {
            type = 1;
        }

        if (((type == 1) || (type == 3)) && (AreAnyEnemyUnitDead() == 0)) {

            if (GetChapterThing() == 0) {
                SetEventId(3);
            }
            sub_8083280();
            return 1;
        }
    }

    ret = TryCallSelectEvents_u1C(0);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->turnBasedEvents;
    pInfo = CheckForEvents(&info);

    if (pInfo) {
        sub_80845A4();

        while (pInfo) {
            CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
            pInfo = CheckForNextEvents(&info);
        }

        return 1;
    }

    return ret;
}

//! FE8U = 0x08083F68
s8 sub_8083F68(u8 pidA, u8 pidB) {
    struct EventInfo info;

    if (GetChapterThing() == 2) {
        return 0;
    }

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (CheckForEvents(&info)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08083FB0
void sub_8083FB0(u8 pidA, u8 pidB) {
    struct EventInfo info;

    if (GetChapterThing() == 2) {
        return;
    }

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (CheckForEvents(&info)) {
        sub_80845A4();
        CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
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
int GetAvailableLocaCommandAt(s8 x, s8 y) {
    struct EventInfo info;

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (CheckForEvents(&info) && (GetChapterThing() != 2)) {
        return info.commandId;
    }

    return 0;
}

//! FE8U = 0x080840C4
void sub_80840C4(s8 x, s8 y) {
    struct EventInfo info;

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (CheckForEvents(&info) == NULL) {
        return;
    }

    switch (info.commandId) {
        case TILE_COMMAND_10:
            gBmMapUnit[y][x] = gActiveUnit->pCharacterData->number;

            // fallthrough

        case TILE_COMMAND_11:
            if (GetChapterThing() == 2) {
                return;
            }

            sub_80845A4();
            CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);

            if (info.givenMoney == 3) {
                CallTileChangeEvent(GetMapChangeIdAt(info.xPos, info.yPos));
            }

            return;

        case TILE_COMMAND_20:
            if (GetChapterThing() == 2) {
                return;
            }

            CallTileChangeEvent(GetMapChangeIdAt(info.xPos,info.yPos));

            return;

        case TILE_COMMAND_DOOR:
        case TILE_COMMAND_BRIDGE:
            if (GetChapterThing() == 2) {
                return;
            }

            if (info.script == 1) {
                CallTileChangeEvent(GetMapChangeIdAt(info.xPos, info.yPos));
                SetEventId(info.flag);
            } else {
                sub_80845A4();
                CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
            }

            return;

        case TILE_COMMAND_CHEST:
            if (GetChapterThing() == 2) {
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

            SetEventId(info.flag);

            return;

        case TILE_COMMAND_ARMORY:
            if (GetChapterThing() == 2) {
                return;
            }

            StartArmoryScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

        case TILE_COMMAND_VENDOR:
            if (GetChapterThing() == 2) {
                return;
            }
            StartVendorScreenOrphaned(gActiveUnit, (u16*)info.script);

            return;

        case TILE_COMMAND_SECRET:
            if (GetChapterThing() == 2) {
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
        SetEventId(6);

        if (GetChapterThing() == 2) {
            return 1;
        }
    } else {
        UnsetEventId(6);
    }


    if (!CheckEventId(0x65) && (CountAvailableBlueUnits() != 0)) {
        if (GetChapterThing() == 2) {
            return 0;
        }

        ret = sub_8083E34(1);

        info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->miscBasedEvents;
        info.xPos = gActiveUnit->xPos;
        info.yPos = gActiveUnit->yPos;

        if (CheckForEvents(&info) == 0) {
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
        SetEventId(6);
        if (GetChapterThing() == 2) {
            sub_8083280();
            return;
        }
    } else {
        UnsetEventId(6);
    }

    if ((CheckEventId(0x65) != 0) || (CountAvailableBlueUnits() == 0)) {
        sub_80837B0();
        return;
    }

    if (GetChapterThing() == 2) {
        return;
    }

    TryCallSelectEvents_u1C(1);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->miscBasedEvents;
    info.xPos = gActiveUnit->xPos;
    info.yPos = gActiveUnit->yPos;

    if (!CheckForEvents(&info)) {
        return;
    }

    sub_80845A4();

    do {
        CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
        pInfo = CheckForNextEvents(&info);
    } while (pInfo);

    return;
}

//! FE8U = 0x0808445C
s8 TryCallSelectEvents(void) {
    s8 ret;
    struct EventInfo info;

    if (GetChapterThing() == 2) {
        return 0;
    }

    ret = TryCallSelectEvents_u1C(2);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsWhenUnitSelected;

    sub_80845A4();

    while (CheckForEvents(&info)) {
        CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
        ret = 1;
    }

    return ret;
}

//! FE8U = 0x080844B0
s8 sub_80844B0(void) {
    s8 ret;
    struct EventInfo info;

    if (GetChapterThing() == 2) {
        return 0;
    }

    ret = TryCallSelectEvents_u1C(3);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsWhenDestSelected;

    if (CheckForEvents(&info)) {
        sub_80845A4();
        CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
        return 1;
    }

    return ret;
}

//! FE8U = 0x08084508
s8 sub_8084508(void) {
    s8 ret;
    struct EventInfo info;

    if (GetChapterThing() == 2) {
        return 0;
    }

    ret = TryCallSelectEvents_u1C(4);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsAfterUnitMoved;

    if (CheckForEvents(&info)) {
        sub_80845A4();
        CallEventsFromBuffer(&info, EV_EXEC_CUTSCENE);
        return 1;
    }

    return ret;
}

//! FE8U = 0x08084560
s8 sub_8084560(void) {
    if (GetChapterThing() == 2) {
        return 0;
    }

    return sub_8083E34(5);
}

//! FE8U = 0x0808457C
void sub_808457C(void) {
    if (GetChapterThing() == 2) {
        return;
    }

    TryCallSelectEvents_u1C(5);
    return;
}

//! FE8U = 0x08084590
void sub_8084590(void) {
    if (GetChapterThing() == 2) {
        return;
    }

    TryCallSelectEvents_u1C(6);
    return;
}

//! FE8U = 0x080845A4
void sub_80845A4(void) {
    memset(&gUnknown_03001C80, 0, 0x40);
    return;
}

//! FE8U = 0x080845B8
void sub_80845B8(u32 script, u16 flag) {
    gUnknown_03001C80.unk_00[gUnknown_03001C80.unk_3c] = script;
    gUnknown_03001C80.unk_28[gUnknown_03001C80.unk_3c] = flag;

    gUnknown_03001C80.unk_3c++;
    return;
}

//! FE8U = 0x080845E4
u16 sub_80845E4(int script) {
    s16 i;

    for (i = 0; i < gUnknown_03001C80.unk_3c; i++) {
        if (gUnknown_03001C80.unk_00[i] == script) {
            return gUnknown_03001C80.unk_28[i];
        }
    }

    return 0;
}

//! FE8U = 0x08084628
void sub_8084628(void) {
    SetEventId(0x82);
    return;
}

//! FE8U = 0x08084634
s8 sub_8084634(void) {
    if (CheckEventId(0x82)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0808464C
struct BattleTalkExtEnt* GetBattleQuoteEntry(u16 pidA, u16 pidB) {
    struct BattleTalkExtEnt* it;

    for (it = gUnknown_089EC6BC; it->pidA != 0xFFFF; it++) {

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
struct DefeatTalkEnt* sub_80846E4(u16 pid) {
    struct DefeatTalkEnt* it;

    for (it = gUnknown_089ECD4C; it->pid != 0xFFFF; it++) {
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
struct SupportTalkEnt* sub_8084748(u16 pidA, u16 pidB) {
    struct SupportTalkEnt* it;

    for (it = gSupportTalkList; it->unitA != 0xFFFF; it++) {

        if ((pidA == it->unitA) && (pidB == it->unitB)) {
            return it;
        }

        if ((pidB == it->unitA) && (pidA == it->unitB)) {
            return it;
        }
    }

    return NULL;
}

//! FE8U = 0x0808478C
int sub_808478C(u16 pidA, u16 pidB, u8 rank) {
    int unk;

    struct SupportTalkEnt* ent = sub_8084748(pidA, pidB);

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
s8 IsCharacterForceDeployed_(u16 pid) {
    struct ForceDeploymentEnt* it;

    for (it = gUnknown_089ED64C; it->pid != 0xFFFF; it++) {
        if (it->route != 0xFF && it->route != gPlaySt.chapterModeIndex) {
            continue;
        }

        if (it->chapter != 0xFF && it->chapter != gPlaySt.chapterIndex) {
            continue;
        }

        if (pid != it->pid) {
            continue;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x08084858
s8 IsSethLArachelMyrrhInnes(u16 pid) {
    u8* it;

    for (it = gUnknown_089ED674; *it != 0; it++) {
        if (*it == pid) {
            return 1;
        }
    }

    return 0;
}