#include "global.h"

#include "constants/characters.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"

EWRAM_OVERLAY(0) u16 gUnknown_0200310C[0x3D0] = {};
EWRAM_OVERLAY(0) struct Font gUnknown_020038AC = {};
EWRAM_OVERLAY(0) int gUnknown_020038C4 = 0;
EWRAM_OVERLAY(0) struct Struct020038C8 gUnknown_020038C8[2] = {};
EWRAM_OVERLAY(0) struct Text gUnknown_02003B48[8] = {};
EWRAM_OVERLAY(0) u16 gUnknown_02003B88[0x10] = {};

const struct Outer080D7FD0 gUnknown_080D7FD0 = {
    {
        { 0x10, 0x09, 0, 5, },
        { 0x10, 0x0B, 0, 5, },
        { 0x10, 0x0D, 0, 3, },
        { 0x10, 0x0F, 0, 3, },
    },
    0x10,
    0x11,
    {
        { 0x1A, 0x09, 0, 5, },
        { 0x1A, 0x0B, 0, 5, },
        { 0x1A, 0x0D, 0, 3, },
        { 0x1A, 0x0F, 0, 3, },
    },
    0x1A,
    0x11,
};

int GetCurrentPromotedLevelBonus() {
    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD) {
        return 19;
    }

    return 9;
}

s8 CanUnitSeize(struct Unit* unit) {
    int leaderId;

    switch (gPlaySt.chapterModeIndex) {
        case 2: // Eirika
            leaderId = CHARACTER_EIRIKA;
            break;
        case 1: // tutorial (chapter 0-8)
            leaderId = CHARACTER_EIRIKA;
            break;
        case 3: // Ephraim
            leaderId = CHARACTER_EPHRAIM;
            break;
    }

    if (gPlaySt.chapterIndex == 5) {
        leaderId = CHARACTER_EPHRAIM;
    }

    return unit->pCharacterData->number == leaderId;
}

void DungeonRecordUi_InitText() {
    int r2;
    int r4;
    int r5;

    for (r5 = 0; r5 < 2; r5++) {
        for (r4 = 0; r4 < 4; r4++) {
            for (r2 = 0; r2 < 8; r2++) {
                gUnknown_020038C8[r5].text[r4][r2].chr_position |= 0xFFFF;
            }
        }
    }

    for (r5 = 0; r5 < 2; r5++) {
        for (r4 = 0; r4 < 8; r4++) {
            gUnknown_020038C8[r5].text[4][r4].chr_position |= 0xFFFF;
        }
    }

    for (r5 = 0; r5 < 8; r5++) {
        gUnknown_02003B48[r5].chr_position |= 0xFFFF;
    }

    return;
}

void InitDungeon(u8 type) {

    gDungeonState.type = type;

    gDungeonState.current.expEarned = 0;
    gDungeonState.current.unitsUsed = 0;
    gDungeonState.current.turnCount = 0;
    gDungeonState.current.enemiesDefeated = 0;
    gDungeonState.current.clearCount = 0;
    gDungeonState.current.postgameEnemiesDefeated = 0;
    gDungeonState.current.postgameClearCount = 0;
    gDungeonState.current.mapTime = 0;

    return;
}

/**
 * If you destroy 200 enemies in a tower or ruins,
 * turn on the flag to join Riev and Hayden
 */
void UnlockPostgameAllyByEnemyCount(void)
{
    struct Dungeon* dungeon = &gDungeonState.current;
    UpdateDungeonStats(dungeon);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        if ((gDungeonState.type == 0) && (dungeon->postgameEnemiesDefeated >= 200)) {
            SetFlag(EVFLAG_EXTRA_UNIT(4)); // Riev
        }

        if ((gDungeonState.type == 1) && (dungeon->postgameEnemiesDefeated >= 200)) {
            SetFlag(EVFLAG_EXTRA_UNIT(5)); // Hayden
        }
    }

    return;
}

void UnlockPostgameAllyByClearCount(void)
{
    UnlockPostgameAllyByEnemyCount();
    UpdateDungeonRecordStats();

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        struct Dungeon* dungeon = &gDungeonState.dungeon[gDungeonState.type];

        if ((gDungeonState.type == 0) && (dungeon->postgameClearCount >= 3)) {
            SetFlag(EVFLAG_EXTRA_UNIT(8)); // Selena
        }

        if ((gDungeonState.type == 1) && (dungeon->postgameClearCount >= 3)) {
            SetFlag(EVFLAG_EXTRA_UNIT(9)); // Lyon
        }
    }

    return;
}

void StartRetreatProcessing(void)
{
    UnlockPostgameAllyByEnemyCount();
    UpdateDungeonEnemiesDefeated();
    return;
}

struct PostgameUnitLutEntry {
    u16 eid;
    struct UnitDefinition* uDef;
};

s8 PrepScreenProc_AddPostgameUnits(ProcPtr proc) {

    u8 i;

    struct PostgameUnitLutEntry unitDefLut[] = {
        { EVFLAG_EXTRA_UNIT(0), UnitDef_088D1DC4, }, // Caellach
        { EVFLAG_EXTRA_UNIT(1), UnitDef_088D1DEC, }, // Glen
        { EVFLAG_EXTRA_UNIT(2), UnitDef_088D1E14, }, // Orson
        { EVFLAG_EXTRA_UNIT(3), UnitDef_088D1E3C, }, // Valter
        { EVFLAG_EXTRA_UNIT(4), UnitDef_088D1E64, }, // Riev
        { EVFLAG_EXTRA_UNIT(5), UnitDef_088D1E8C, }, // Hayden
        { EVFLAG_EXTRA_UNIT(6), UnitDef_088D1EB4, }, // Fado
        { EVFLAG_EXTRA_UNIT(7), UnitDef_088D1EDC, }, // Ismaire
        { EVFLAG_EXTRA_UNIT(8), UnitDef_088D1F04, }, // Selena
        { EVFLAG_EXTRA_UNIT(9), UnitDef_088D1F2C, }, // Lyon
        { },
    };

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)) {
        return 0;
    }

    for (i = 0; unitDefLut[i].eid != 0; i++) {
        if ((CheckFlag(unitDefLut[i].eid) == 1) && (TryAddPostgameUnit(proc, unitDefLut[i].uDef) == 1) ) {
            return 1;
        }
    }

    return 0;
}

s8 TryAddPostgameUnit(ProcPtr proc, const struct UnitDefinition* uDef) {
    if (GetUnitFromCharIdAndFaction(uDef->charIndex, 0) == 0) {
        LoadUnit(uDef);
        NewPopup_NewAlly(proc, uDef->charIndex);
        return 1;
    }

    return 0;
}

void SaveDungeonState(struct Dungeon* savedDungeon) {

    *savedDungeon = gDungeonState.current;
    gDungeonState.current.unk_0B_4 = gDungeonState.type;

    return;
}

void LoadDungeonState(struct Dungeon* savedDungeon) {

    gDungeonState.current = *savedDungeon;
    gDungeonState.type = gDungeonState.current.unk_0B_4;

    return;
}

void SaveDungeonRecords(struct Dungeon* savedDungeon) {

    memcpy(savedDungeon, gDungeonState.dungeon, 2 * sizeof(struct Dungeon));

    return;
}

void LoadDungeonRecords(struct Dungeon* savedDungeon) {

    memcpy(gDungeonState.dungeon, savedDungeon, 2 * sizeof(struct Dungeon));

    return;
}

int UpdateDungeonMapTime(struct Dungeon* dungeon) {
    int time1;
    int time2;

    time1 = dungeon->mapTime;
    time2 = Div((GetGameClock() - gPlaySt.time_chapter_started), 60);
    time1 = time1 + time2;

    if (time1 > 216000) {
        time1 = 216000;
    }

    return time1;
}

void UpdateDungeonStats(struct Dungeon* dungeon) {
    int val;
    int i;

    val = dungeon->expEarned;

    val += (PidStatsGetTotalExpGain() - gPlaySt.unk_30.unk_8_2);

    if (val > 50000) {
        val = 50000;
    }

    dungeon->expEarned = val;

    val = dungeon->unitsUsed;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit) && !(unit->state & US_UNAVAILABLE)) {
            val++;
        }
    }

    dungeon->unitsUsed = val;

    val = dungeon->turnCount; 
    val += gPlaySt.chapterTurnNumber;

    if (val > 500) {
        val = 500;
    }

    dungeon->turnCount = val;

    dungeon->mapTime = UpdateDungeonMapTime(dungeon);

    val = dungeon->enemiesDefeated;
    val += gPlaySt.unk48;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->enemiesDefeated = val;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        val = dungeon->postgameEnemiesDefeated;
        val += gPlaySt.unk48;

        if (val > 1000) {
            val = 1000;
        }

        dungeon->postgameEnemiesDefeated = val;
    }

    return;
}

void UpdateDungeonRecordStats() {
    struct Dungeon* current;
    struct Dungeon* record;
    int val;

    current = &gDungeonState.current;
    record = &gDungeonState.dungeon[gDungeonState.type];

    if (record->clearCount > 0) {
        if (record->expEarned < current->expEarned) {
            record->expEarned = current->expEarned;
        }

        if (current->unitsUsed < record->unitsUsed) {
            record->unitsUsed = current->unitsUsed;
        }

        if (current->turnCount < record->turnCount) {
            record->turnCount = current->turnCount;
        }

        if (current->mapTime < record->mapTime) {
            record->mapTime = current->mapTime;
        }
    } else {
        record->expEarned = current->expEarned;
        record->unitsUsed = current->unitsUsed;

        record->turnCount = current->turnCount;
        record->mapTime = current->mapTime;
    }

    val = record->enemiesDefeated + current->enemiesDefeated;

    if (val > 50000) {
        val = 50000;
    }

    record->enemiesDefeated = val;

    if (record->clearCount < 100) {
        record->clearCount++;
    }

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        if (record->postgameClearCount < 10) {
            record->postgameClearCount++;
        }
    }

    return;
}

void UpdateDungeonEnemiesDefeated() {
    struct Dungeon* current;
    struct Dungeon* dungeon;
    int val;

    current = &gDungeonState.current;
    dungeon = &gDungeonState.dungeon[gDungeonState.type];

    val = dungeon->enemiesDefeated + current->enemiesDefeated;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->enemiesDefeated = val;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        val = dungeon->postgameEnemiesDefeated + current->postgameEnemiesDefeated;

        if (val > 1000) {
            val = 1000;
        }

        dungeon->postgameEnemiesDefeated = val;
    }

    return;
}

struct ProcCmd CONST_DATA sProcScr_DisplayDungeonRecord_FromMenu[] = {
    PROC_CALL(PushGlobalTimer),
    PROC_CALL(LockGame),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_SLEEP(0),
    PROC_CALL(SetupDungeonRecordUi),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(DungeonRecordUi_KeyListenerUpdatesTime),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(EndDungeonRecordUi),
    PROC_SLEEP(0),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),

    PROC_END,
};

void StartDungeonRecordProcFromMenu(ProcPtr proc) {
    Proc_StartBlocking(sProcScr_DisplayDungeonRecord_FromMenu, proc);
    return;
}

struct ProcCmd CONST_DATA sProcScr_DisplayDungeonRecord_AfterDungeonClear[] = {
    PROC_CALL(PushGlobalTimer),
    PROC_CALL(LockGame),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndAllMus),
    PROC_SLEEP(0),
    PROC_CALL(sub_8038230),
    PROC_CALL(SetupDungeonRecordUi),

    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    PROC_SLEEP(30),
    PROC_START_CHILD_BLOCKING(sProcScr_DungeonRecord_UpdateNewRecordValues),
    PROC_REPEAT(DungeonRecordUi_KeyListener),

    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(EndDungeonRecordUi),
    PROC_SLEEP(0),

    PROC_CALL(BMapDispResume),
    PROC_CALL(UnlockGame),
    PROC_CALL(PopGlobalTimer),

    PROC_END,
};

// StartDungeonRecordProcAfterDungeonClear?
void RecordDisplayAfterTowerCleared(ProcPtr proc)
{
    Proc_StartBlocking(sProcScr_DisplayDungeonRecord_AfterDungeonClear, proc);
    return;
}

void PushGlobalTimer() {
    int clock = GetGameClock();
    gUnknown_020038C4 = clock;
    return;
}

void PopGlobalTimer() {
    SetGameTime(gUnknown_020038C4);
    return;
}

void sub_8038230() {
    StartBgm(0x40, 0);
    return;
}

void SetupDungeonRecordUi(ProcPtr proc) {
    int i;

    SetupBackgrounds(gBgConfig_SaveMenu);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    LoadLegacyUiFrameGraphics();

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    // Load and display background

    SetBlendConfig(1, 6, 16, 0);

    Decompress(Img_SaveMenuBG, (void *)BG_VRAM + GetBackgroundTileDataOffset(3));

    ApplyPalettes(Pal_SaveMenuBG, 8, 8);

    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, 0x8000);

    // Load and display fog overlay

    Decompress(Img_MainMenuBgFog, (void *)(BG_VRAM + 0x4C00) + GetBackgroundTileDataOffset(2));

    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);

    ApplyPalette(Pal_MainMenuBgFog, 7);

    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x7260);

    // Load and display "Combat Record" graphic

    Decompress(gUnknown_089A234C, (void *)(BG_VRAM + 0x4000) + GetBackgroundTileDataOffset(1));

    Decompress(gUnknown_089A27B4, gBG1TilemapBuffer);

    ApplyPalettes(gUnknown_089A28E0, 2, 2);

    for (i = 0; i < 0x280; i++) {
        gBG1TilemapBuffer[i] = gBG1TilemapBuffer[i] + 0x2200;
    }

    DungeonRecordUi_InitText();

    DrawDungeonRecordUiText(proc);

    BG_EnableSyncByMask(0xF);

    sub_80AB760(gUnknown_0200310C);

    CpuFastSet(PAL_BG(BGPAL_BMDIFFICULTY_UNK_0), PAL_OBJ(OBPAL_BMDIFFICULTY_UNK_5), 8);

    return;
}

struct DungeonUiTextLutEntry {
    /* 00 */ u16 msgId;
    /* 02 */ s8 x;
    /* 03 */ s8 y;
};

void DrawDungeonRecordUiLabels(struct Text* th) {
    char* str;
    struct DungeonUiTextLutEntry* iter;

    struct DungeonUiTextLutEntry uiTextLut[9] = {
        { 0x205, 13,  5 }, // Current[.]
        { 0x206, 23,  5 }, // Record
        { 0x207,  3,  7 }, // # Cleared
        { 0x208,  3,  9 }, // Monsters
        { 0x209,  3, 11 }, // Exp[.]
        { 0x20A,  3, 13 }, // Units Used
        { 0x20B,  3, 15 }, // Turns[.]
        { 0x20C,  3, 17 }, // Time
        { },
    };

    iter = &uiTextLut[0];
    while (iter->msgId != 0) {
        str = GetStringFromIndex(iter->msgId);

        InitText(th, strlen(str));
        Text_SetParams(th, 0, 0);
        Text_DrawString(th, str);
        PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(iter->x, iter->y)]);

        iter++;
    }

    return;
}

struct Text* DrawNumberText(struct Text* th, u16 number, u8 places, s8 x, s8 y, u8 colorId) {
    int i;
    u8 shouldDraw;
    u8 digits[8];

    for (i = 0; i < places; i++) {
        digits[i] = DivRem(number, 10);
        number = Div(number, 10);
    }

    shouldDraw = 0;

    for (i = places - 1; i >= 0; i--) {
        if (digits[i] != 0) {
            shouldDraw = 1;
        }

        if (shouldDraw || (i == 0)) {
            InitText(th, 1);
            Text_SetParams(th, 0, colorId);
            Text_DrawNumber(th, digits[i]);
            PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(x - i, y)]);
        }

        th++;
    }

    return th;
}

struct Text* DrawNumberText_WithReset(struct Text* th, u16 number, u8 numTiles, s8 x, s8 y, u8 colorId) {
    int i;
    u8 shouldDraw;
    u8 digits[8];

    for (i = 0; i < numTiles; i++) {
        digits[i] = DivRem(number, 10);
        number = Div(number, 10);
    }

    shouldDraw = 0;

    for (i = numTiles - 1; i >= 0; i--) {
        if (th->chr_position != 0xFFFF) {
            ClearText(th);
        }

        if (digits[i] != 0) {
            shouldDraw = 1;
        }

        if (shouldDraw || (i == 0)) {
            if (th->chr_position == 0xFFFF) {
                InitText(th, 1);
            }

            Text_SetParams(th, 0, colorId);
            Text_DrawNumber(th, digits[i]);
            PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(x - i, y)]);
        }

        th++;
    }

    return th;
}

void sub_8038668(struct Text* th, u8 count) {
    int i;

    for (i = count - 1; i >= 0; i--) {

        if (th->chr_position != 0xFFFF) {
            ClearText(th);
        }

        th++;
    }

    return;
}

struct Text* DrawTimeText(struct Text* th, int time, s8 xBase, s8 yBase, u8 colorId) {
    s8 xOffset;
    const char* str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(time * 60, &hours, &minutes, &seconds);

    xOffset = xBase + 0xF9;

    if (hours < 10) {
        th = DrawNumberText(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = DrawNumberText(th, hours / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = DrawNumberText(th, hours % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase + 0xFB;

    str = GetStringFromIndex(0x20D); // :[.]

    InitText(th, 1);
    Text_SetParams(th, 2, colorId);
    Text_DrawCharacter(th, str);
    PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);

    th++;

    xOffset = xBase + 0xFC;

    if (minutes < 10) {
        th = DrawNumberText(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = DrawNumberText(th, minutes / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = DrawNumberText(th, minutes % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase + 0xFE;

    str = GetStringFromIndex(0x20D); // :[.]

    InitText(th, 1);
    Text_SetParams(th, 2, colorId);
    Text_DrawCharacter(th, str);
    PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);

    th++;

    xOffset = xBase + 0xFF;

    if (seconds < 10) {
        th = DrawNumberText(th, 0, 1, xOffset, yBase, colorId);
    }
    else {
        th = DrawNumberText(th, seconds / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = DrawNumberText(th, seconds % 10, 1, xOffset, yBase, colorId);

    return th;
}

struct Text* DrawTimeText_WithReset(struct Text* th, int time, s8 xBase, s8 yBase, u8 colorId, s8 drawPunctuation) {
    s8 xOffset;
    const char* str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(time * 60, &hours, &minutes, &seconds);

    xOffset = xBase + 0xF9;

    if (hours < 10) {
        th = DrawNumberText_WithReset(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = DrawNumberText_WithReset(th, hours / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = DrawNumberText_WithReset(th, hours % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase + 0xFB;

    str = GetStringFromIndex(0x20D); // :[.]

    if (th->chr_position != 0xFFFF) {
        ClearText(th);
    } else {
        InitText(th, 1);
    }

    if (drawPunctuation) {
        Text_SetParams(th, 2, colorId);
        Text_DrawCharacter(th, str);
        PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);
    }

    th++;

    xOffset = xBase + 0xFC;

    if (minutes < 10) {
        th = DrawNumberText_WithReset(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = DrawNumberText_WithReset(th, minutes / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = DrawNumberText_WithReset(th, minutes % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase + 0xFE;

    str = GetStringFromIndex(0x20D); // :[.]

    if (th->chr_position != 0xFFFF) {
        ClearText(th);
    } else {
        InitText(th, 1);
    }

    if (drawPunctuation) {
        Text_SetParams(th, 2, colorId);
        Text_DrawCharacter(th, str);
        PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);
    }

    th++;

    xOffset = xBase + 0xFF;

    if (seconds < 10) {
        th = DrawNumberText_WithReset(th, 0, 1, xOffset, yBase, colorId);
    }
    else {
        th = DrawNumberText_WithReset(th, seconds / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = DrawNumberText_WithReset(th, seconds % 10, 1, xOffset, yBase, colorId);

    return th;
}

void DrawDungeonRecordUiText(ProcPtr proc) {
    int time;
    struct Dungeon currentDungeon;
    struct Dungeon recordDungeon;
    struct Text text;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    CpuCopy32(&gDungeonState.dungeon[gDungeonState.type], &recordDungeon, sizeof(struct Dungeon));

    time = GetGameClock();
    SetGameTime(gUnknown_020038C4);

    UpdateDungeonStats(&currentDungeon);

    SetGameTime(time);

    ResetTextFont();

    InitTextFont(&gUnknown_020038AC, (void *)(VRAM + 0x20) + GetBackgroundTileDataOffset(0), 1, 0);
    SetTextFont(&gUnknown_020038AC);
    InitSystemTextFont();

    StartGreenText(proc);

    DrawDungeonRecordUiLabels(&text);

    DrawNumberText(
        &gUnknown_02003B48[5],
        recordDungeon.clearCount,
        3,
        0x1A,
        7,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[0].text[0][8 - gUnknown_080D7FD0.current[0].numDigits],
        currentDungeon.enemiesDefeated,
        gUnknown_080D7FD0.current[0].numDigits, // 5
        gUnknown_080D7FD0.current[0].x,
        gUnknown_080D7FD0.current[0].y,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[1].text[0][8 - gUnknown_080D7FD0.record[0].numDigits],
        recordDungeon.enemiesDefeated,
        gUnknown_080D7FD0.record[0].numDigits, // 5
        gUnknown_080D7FD0.record[0].x,
        gUnknown_080D7FD0.record[0].y,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[0].text[1][8 - gUnknown_080D7FD0.current[1].numDigits],
        currentDungeon.expEarned,
        gUnknown_080D7FD0.current[1].numDigits, // 5
        gUnknown_080D7FD0.current[1].x,
        gUnknown_080D7FD0.current[1].y,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[1].text[1][8 - gUnknown_080D7FD0.record[1].numDigits],
        recordDungeon.expEarned,
        gUnknown_080D7FD0.record[1].numDigits, // 5
        gUnknown_080D7FD0.record[1].x,
        gUnknown_080D7FD0.record[1].y,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[0].text[2][8 - gUnknown_080D7FD0.current[2].numDigits],
        currentDungeon.unitsUsed,
        gUnknown_080D7FD0.current[2].numDigits, // 3
        gUnknown_080D7FD0.current[2].x,
        gUnknown_080D7FD0.record[2].y, // BUG?
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[1].text[2][8 - gUnknown_080D7FD0.record[2].numDigits],
        recordDungeon.unitsUsed,
        gUnknown_080D7FD0.record[2].numDigits, // 3
        gUnknown_080D7FD0.record[2].x,
        gUnknown_080D7FD0.record[2].y,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[0].text[3][8 - gUnknown_080D7FD0.current[3].numDigits],
        currentDungeon.turnCount,
        gUnknown_080D7FD0.current[3].numDigits, // 3
        gUnknown_080D7FD0.current[3].x,
        gUnknown_080D7FD0.current[3].y,
        2
    );

    DrawNumberText(
        &gUnknown_020038C8[1].text[3][8 - gUnknown_080D7FD0.record[3].numDigits],
        recordDungeon.turnCount,
        gUnknown_080D7FD0.record[3].numDigits, // 3
        gUnknown_080D7FD0.record[3].x,
        gUnknown_080D7FD0.record[3].y,
        2
    );

    DrawTimeText(
        &gUnknown_020038C8[0].text[4][0],
        currentDungeon.mapTime,
        gUnknown_080D7FD0.x,
        gUnknown_080D7FD0.y,
        2
    );

    DrawTimeText(
        &gUnknown_020038C8[1].text[4][0],
        recordDungeon.mapTime,
        gUnknown_080D7FD0.x2,
        gUnknown_080D7FD0.y2,
        2
    );

    return;
}

void DungeonRecordUi_UpdateRunningTime() {
    struct Dungeon currentDungeon;
    int unkTime1;
    u32 unkTime2;
    s8 drawPunctuation;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    unkTime1 = UpdateDungeonMapTime(&currentDungeon);

    unkTime2 = ((GetGameClock() - gPlaySt.time_chapter_started) % 60);

    drawPunctuation = 1;
    if (unkTime2 > 29) {
        drawPunctuation = 0;
    }

    DrawTimeText_WithReset(
        &gUnknown_020038C8[0].text[4][0],
        unkTime1,
        gUnknown_080D7FD0.x,
        gUnknown_080D7FD0.y,
        2,
        drawPunctuation
    );

    BG_EnableSyncByMask(1);

    return;
}

void DungeonRecordUi_KeyListenerUpdatesTime(ProcPtr proc) {
    DungeonRecordUi_UpdateRunningTime();

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

void DungeonRecordUi_KeyListener(ProcPtr proc) {
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

void EndDungeonRecordUi() {
    sub_80AB77C();

    EndGreenText();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(0xF);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    ResetText();

    CpuFastFill(0, gPaletteBuffer, 0x400);

    EnablePaletteSync();

    return;
}

void sub_8038F78(struct Text* th) {
    int i;
    int bgOffset;

    bgOffset = GetBackgroundTileDataOffset(0);

    i = 0;

    while (i < 8) {
        if (th->chr_position == 0xFFFF) {
            CpuFastFill(0, (void *)((BG_VRAM + 0x12000) + (0x20 * i)), 32);
            CpuFastFill(0, (void *)((BG_VRAM + 0x12400) + (0x20 * i)), 32);
        } else {
            int base = (BG_VRAM + (th->chr_position * 0x40));
            int src = bgOffset + base;

            src += 0x20;
            CpuFastCopy((void *)(src), (void *)((BG_VRAM + 0x12000) + (0x20 * i)), 32);

            src += 0x20;
            CpuFastCopy((void *)(src), (void *)((BG_VRAM + 0x12400) + (0x20 * i)), 32);
        }

        th++;
        i++;
    }

    return;
}

struct SpriteCfg CONST_DATA obj_859E79C = {
  .count = 2,
  .oam = {
    {
      .y = 0,
      .affineMode = ST_OAM_AFFINE_OFF,
      .objMode = ST_OAM_OBJ_NORMAL,
      .mosaic = 0,
      .bpp = ST_OAM_4BPP,
      .shape = ST_OAM_H_RECTANGLE,
      .x = 0,
      .matrixNum = 0,
      .size = ST_OAM_H_32x16,
      .tileNum = 0x100,
      .priority = 0,
      .paletteNum = 0,
    },
    {
      .y = 0,
      .affineMode = ST_OAM_AFFINE_OFF,
      .objMode = ST_OAM_OBJ_NORMAL,
      .mosaic = 0,
      .bpp = ST_OAM_4BPP,
      .shape = ST_OAM_H_RECTANGLE,
      .x = 32,
      .matrixNum = 0,
      .size = ST_OAM_H_32x16,
      .tileNum = 0x104,
      .priority = 0,
      .paletteNum = 0,
    },
  }
};

const u16 CONST_DATA gUnknown_0859E79AC[] = {
    0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000,
    0x1000, 0x0800, 0x1000, 0x0000,
    0x0000, 0x0000,
};

u16 CONST_DATA gUnknown_0859E7C8[] = {
    0x0000, 0x0214, 0x0400,
    0x0C00, 0x0DEB, 0x1000,
};

int CONST_DATA gUnknown_0859E7D4[] = {
    -56,   0,
    -70,  14,
    -74,   6,
     38, -14,
     42,  -6,
     24,   0,
};

void sub_803901C(struct BMDifficultyProc * proc)
{
    int r7;
    int r8;
    u16 * iter1;
    int * iter2;

    sub_8038F78(&gUnknown_020038C8[0].text[proc->labelIndex][0]);

    gUnknown_02003BE8.unk_00 = 2;
    gUnknown_02003BE8.unk_04 = gUnknown_02003B88;
    gUnknown_02003BE8.unk_08 = gUnknown_02003BA8;
    gUnknown_02003BE8.unk_0C = NULL;
    gUnknown_02003BE8.unk_10 = NULL;

    iter1 = gUnknown_0859E7C8;
    iter2 = gUnknown_0859E7D4;

    gUnknown_02003BE8.unk_02 = r8 = 6;

    for (r7 = 0; r7 < r8; r7++)
    {
        gUnknown_02003B88[r7] = DivArm(4096, iter1[r7] * 45);

        gUnknown_02003BA8[r7 * 2 + 0] = iter2[r7 * 2 + 0] << 4;
        gUnknown_02003BA8[r7 * 2 + 1] = iter2[r7 * 2 + 1] << 4;
    }

    proc->unk_34 = 0;

    PlaySoundEffect(0x80); // Point Up SE

    return;
}



void sub_80390D4(struct BMDifficultyProc* proc) {
    int pos[2];

    proc->unk_34++;

    if (proc->unk_34 < 45) {

        sub_800A950(&gUnknown_02003BE8, proc->unk_34 * 4096, pos);

        PutSpriteExt(
            4,
            (pos[0] >> 4) + ((u8)gUnknown_080D7FD0.current[proc->labelIndex].x * 8),
            ((pos[1] >> 4) + ((u8)gUnknown_080D7FD0.current[proc->labelIndex].y * 8)) & 0x000001FF,
            &obj_859E79C,
            0x5000
        );
    } else {
        if (proc->labelIndex == 4) {
            DrawTimeText_WithReset(
                &gUnknown_020038C8[1].text[4][0],
                proc->unk_30,
                gUnknown_080D7FD0.record[4].x,
                gUnknown_080D7FD0.record[4].y,
                4,
                1
            );
        } else {
            DrawNumberText_WithReset(
                &gUnknown_020038C8[1].text[proc->labelIndex][8 - gUnknown_080D7FD0.record[proc->labelIndex].numDigits],
                proc->unk_30,
                gUnknown_080D7FD0.record[proc->labelIndex].numDigits,
                gUnknown_080D7FD0.record[proc->labelIndex].x,
                gUnknown_080D7FD0.record[proc->labelIndex].y,
                4
            );
        }

        PlaySoundEffect(0x76); // Parameter Up SE
        BG_EnableSyncByMask(1);

        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA sProcScr_DungeonRecord_UpdateValue[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_803901C),

PROC_LABEL(0),
    PROC_REPEAT(sub_80390D4),

    PROC_END,
};

struct BMDifficultyProc* DungeonRecordUi_SpawnUpdateValueProc(int label, int value, ProcPtr parent) {
    struct BMDifficultyProc* proc;

    if (parent != 0) {
        proc = Proc_StartBlocking(sProcScr_DungeonRecord_UpdateValue, parent);
    } else {
        proc = Proc_Start(sProcScr_DungeonRecord_UpdateValue, PROC_TREE_3);
    }

    proc->labelIndex = label;
    proc->unk_30 = value;

    return proc;
}

u32 GetCurrentDungeonValueByUiLabel(u32 label) {
    int clock;
    struct Dungeon currentDungeon;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    clock = GetGameClock();
    SetGameTime(gUnknown_020038C4);

    UpdateDungeonStats(&currentDungeon);

    SetGameTime(clock);

    switch (label) {
        case DUNGEONRECORD_LABEL_MONSTERS:
            return currentDungeon.enemiesDefeated;
        case DUNGEONRECORD_LABEL_EXP:
            return currentDungeon.expEarned;
        case DUNGEONRECORD_LABEL_UNITS:
            return currentDungeon.unitsUsed;
        case DUNGEONRECORD_LABEL_TURNS:
            return currentDungeon.turnCount;
        case DUNGEONRECORD_LABEL_TIME:
            return currentDungeon.mapTime;
    }

    return DUNGEONRECORD_LABEL_MONSTERS;
}

u32 GetRecordDungeonValueByUiLabel(u32 label) {

    switch (label) {
        case DUNGEONRECORD_LABEL_MONSTERS:
            return gDungeonState.dungeon[gDungeonState.type].enemiesDefeated;
        case DUNGEONRECORD_LABEL_EXP:
            return gDungeonState.dungeon[gDungeonState.type].expEarned;
        case DUNGEONRECORD_LABEL_UNITS:
            return gDungeonState.dungeon[gDungeonState.type].unitsUsed;
        case DUNGEONRECORD_LABEL_TURNS:
            return gDungeonState.dungeon[gDungeonState.type].turnCount;
        case DUNGEONRECORD_LABEL_TIME:
            return gDungeonState.dungeon[gDungeonState.type].mapTime;
    }

    return DUNGEONRECORD_LABEL_MONSTERS;
}

s8 DungeonRecordUi_IsNewRecordForLabel(u32 label) {
    int clock;
    struct Dungeon currentDungeon;
    struct Dungeon* record;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    clock = GetGameClock();
    SetGameTime(gUnknown_020038C4);

    UpdateDungeonStats(&currentDungeon);

    SetGameTime(clock);

    record = &gDungeonState.dungeon[gDungeonState.type];

    switch (label) {
        case DUNGEONRECORD_LABEL_MONSTERS:
            return 1;
        case DUNGEONRECORD_LABEL_EXP:
            if (currentDungeon.expEarned > record->expEarned) {
                return 1;
            }

            break;
        case DUNGEONRECORD_LABEL_UNITS:
            if (record->clearCount <= 0) {
                return 1;
            }

            if (currentDungeon.unitsUsed < record->unitsUsed) {
                return 1;
            }

            break;
        case DUNGEONRECORD_LABEL_TURNS:
            if (record->clearCount <= 0) {
                return 1;
            }

            if (currentDungeon.turnCount < record->turnCount) {
                return 1;
            }

            break;
        case DUNGEONRECORD_LABEL_TIME:
            if (record->clearCount <= 0) {
                return 1;
            }

            if (currentDungeon.mapTime < record->mapTime) {
                return 1;
            }

            break;
    }

    return 0;
}

u16 CONST_DATA gUnknown_0859E82C[] = {
    0x00, 0x07, 0x0F,
    0x16, 0x1E, 0x00,
};

int CONST_DATA gUnknown_0859E838[] =
{
    0x980, 0x380,
    0x8D0, 0x430,
    0x960, 0x320,
    0xA30, 0x2D0,
    0x980, 0x380,
};

void sub_803943C(struct BMDifficultyProc* proc) {
    sub_8038F78(gUnknown_02003B48);

    gUnknown_02003BE8.unk_00 = 2;
    gUnknown_02003BE8.unk_02 = 5;
    gUnknown_02003BE8.unk_04 = gUnknown_0859E82C;
    gUnknown_02003BE8.unk_08 = gUnknown_0859E838;
    gUnknown_02003BE8.unk_0C = NULL;
    gUnknown_02003BE8.unk_10 = NULL;

    proc->unk_38 = 0;

    PlaySoundEffect(0x80);

    return;
}

void sub_803948C(ProcPtr proc) {
    sub_8038668(gUnknown_02003B48, 8);

    Proc_Break(proc);

    return;
}

void sub_80394A8(struct BMDifficultyProc* proc) {
    int val;
    int pos[2];
    struct Dungeon record;

    proc->unk_38++;

    if (proc->unk_38 < 30) {
        sub_800A950(&gUnknown_02003BE8, proc->unk_38 * 0x1000, pos);

        PutSpriteExt(
            4,
            pos[0] >> 4,
            ((u32)(pos[1]) << 0x13) >> 0x17,
            &obj_859E79C,
            0x5000
        );
    } else {

        record = gDungeonState.dungeon[gDungeonState.type];

        val = record.clearCount;

        if (val < 100) {
            val++;
        }

        DrawNumberText_WithReset(
            &gUnknown_02003B48[5],
            val,
            3,
            0x1A,
            7,
            2
        );

        BG_EnableSyncByMask(1);

        PlaySoundEffect(0x76);

        Proc_Break(proc);
    }

    return;
}

void sub_8039554(struct BMDifficultyProc* proc) {

    proc->unk_30 = GetRecordDungeonValueByUiLabel(0);
    proc->unk_34 = GetCurrentDungeonValueByUiLabel(0) + proc->unk_30;
    proc->unk_3c = 2;

    PlaySoundEffect(0x74);

    return;
}

void DungeonRecordUi_UpdateEnemiesDefeatedCount(struct BMDifficultyProc* proc) {

    proc->unk_30++;

    if ((proc->unk_34 - proc->unk_30) > 100) {
        proc->unk_30++;
    }

    DrawNumberText_WithReset(
        &gUnknown_020038C8[1].text[0][8 - gUnknown_080D7FD0.record[0].numDigits],
        proc->unk_30,
        gUnknown_080D7FD0.record[0].numDigits,
        gUnknown_080D7FD0.record[0].x,
        gUnknown_080D7FD0.record[0].y,
        2
    );

    DrawNumberText_WithReset(
        &gUnknown_020038C8[0].text[0][8 - gUnknown_080D7FD0.current[0].numDigits],
        (proc->unk_34 - proc->unk_30),
        gUnknown_080D7FD0.current[0].numDigits,
        gUnknown_080D7FD0.current[0].x,
        gUnknown_080D7FD0.current[0].y,
        2
    );

    BG_EnableSyncByMask(1);

    if (proc->unk_3c > 0) {
        proc->unk_3c--;
    }

    if (proc->unk_30 >= proc->unk_34) {
        Proc_Break(proc);
    }

    return;
}

void sub_803963C(struct BMDifficultyProc* proc) {
    if (proc->unk_3c < 1) {
        m4aSongNumStop(0x74);
        Proc_Break(proc);
    } else {
        proc->unk_3c--;
    }

    return;
}

void sub_8039660(struct BMDifficultyProc* proc) {
    proc->labelIndex = DUNGEONRECORD_LABEL_EXP;
    return;
}

void sub_8039668(struct BMDifficultyProc* proc) {

    if (DungeonRecordUi_IsNewRecordForLabel(proc->labelIndex) != 0) {
        DungeonRecordUi_SpawnUpdateValueProc(
            proc->labelIndex,
            GetCurrentDungeonValueByUiLabel(proc->labelIndex),
            proc
        );
    }

    return;
}

void DungeonRecordUi_GotoNextLabel(struct BMDifficultyProc* proc) {

    proc->labelIndex++;

    if (proc->labelIndex < 5) {
        Proc_Goto(proc, 1);
    }

    return;
}

struct ProcCmd CONST_DATA sProcScr_DungeonRecord_UpdateNewRecordValues[] = {
    PROC_CALL(sub_803943C),
    PROC_SLEEP(1),

    PROC_REPEAT(sub_803948C),
    PROC_REPEAT(sub_80394A8),
    PROC_SLEEP(30),

    PROC_CALL(sub_8039554),
    PROC_REPEAT(DungeonRecordUi_UpdateEnemiesDefeatedCount),
    PROC_REPEAT(sub_803963C),
    PROC_SLEEP(40),

PROC_LABEL(0),
    PROC_CALL(sub_8039660),

PROC_LABEL(1),
    PROC_CALL(sub_8039668),
    PROC_SLEEP(25),
    PROC_CALL(DungeonRecordUi_GotoNextLabel),

    PROC_END,
};
