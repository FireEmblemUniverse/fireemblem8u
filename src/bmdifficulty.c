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

#include "bmdifficulty.h"

/*
* Difficulty mode stuff and also tower/ruins stuff
* May have been separate files
*/

struct Struct020038C8 {
    struct TextHandle text[4][8];
    u8 idk[0x40];
};

extern struct Struct020038C8 gUnknown_020038C8[2];
extern struct TextHandle gUnknown_02003B48[8];

extern struct Struct030017A0 gDungeonState;

extern int gUnknown_020038C4;

struct Struct080D7FD0 {
    s8 x;
    s8 y;
    u16 _pad;
    u8 numDigits;
};

struct Outer080D7FD0 {
    struct Struct080D7FD0 current[4];
    s8 x;
    s8 y;
    struct Struct080D7FD0 record[4];
    s8 x2;
    s8 y2;
};


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


// popup.s
void sub_8011728(ProcPtr, int);

// code.s
int sub_80A49A4(void);
void sub_80AB760(u16*);
void sub_80AB77C(void);

// spline.s
void sub_800A950(struct Struct02003BE8*, int, int*);

int GetCurrentPromotedLevelBonus() {
    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT) {
        return 19;
    }

    return 9;
}

s8 CanUnitSeize(struct Unit* unit) {
    int leaderId;

    switch (gRAMChapterData.chapterModeIndex) {
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

    if (gRAMChapterData.chapterIndex == 5) {
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
                gUnknown_020038C8[r5].text[r4][r2].unk0 |= 0xFFFF;
            }
        }
    }

    for (r5 = 0; r5 < 2; r5++) {
        for (r4 = 0; r4 < 8; r4++) {
            gUnknown_020038C8[r5].text[4][r4].unk0 |= 0xFFFF;
        }
    }

    for (r5 = 0; r5 < 8; r5++) {
        gUnknown_02003B48[r5].unk0 |= 0xFFFF;
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

void UnlockPostgameAllyByEnemyCount() {
    struct Dungeon* dungeon = &gDungeonState.current;
    UpdateDungeonStats(dungeon);

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        if ((gDungeonState.type == 0) && (dungeon->postgameEnemiesDefeated >= 200)) {
            SetEventId(0x6B); // Riev
        }

        if ((gDungeonState.type == 1) && (dungeon->postgameEnemiesDefeated >= 200)) {
            SetEventId(0x6C); // Hayden
        }
    }

    return;
}

void UnlockPostgameAllyByClearCount() {

    UnlockPostgameAllyByEnemyCount();
    UpdateDungeonRecordStats();

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        struct Dungeon* dungeon = &gDungeonState.dungeon[gDungeonState.type];

        if ((gDungeonState.type == 0) && (dungeon->postgameClearCount >= 3)) {
            SetEventId(0x6F); // Selena
        }

        if ((gDungeonState.type == 1) && (dungeon->postgameClearCount >= 3)) {
            SetEventId(0x70); // Lyon
        }
    }

    return;
}

void sub_8037D58() {
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
        { 0x67, (void*)0x88D1DC4, }, // Caellach
        { 0x68, (void*)0x88D1DEC, }, // Glen
        { 0x69, (void*)0x88D1E14, }, // Orson
        { 0x6A, (void*)0x88D1E3C, }, // Valter
        { 0x6B, (void*)0x88D1E64, }, // Riev
        { 0x6C, (void*)0x88D1E8C, }, // Hayden
        { 0x6D, (void*)0x88D1EB4, }, // Fado
        { 0x6E, (void*)0x88D1EDC, }, // Ismaire
        { 0x6F, (void*)0x88D1F04, }, // Selena
        { 0x70, (void*)0x88D1F2C, }, // Lyon
        { },
    };

    if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME)) {
        return 0;
    }

    for (i = 0; unitDefLut[i].eid != 0; i++) {
        if (((s8)CheckEventId(unitDefLut[i].eid) == 1) && (TryAddPostgameUnit(proc, unitDefLut[i].uDef) == 1) ) {
            return 1;
        }
    }

    return 0;
}

s8 TryAddPostgameUnit(ProcPtr proc, const struct UnitDefinition* uDef) {
    if (GetUnitFromCharIdAndFaction(uDef->charIndex, 0) == 0) {
        LoadUnit(uDef);
        sub_8011728(proc, uDef->charIndex);
        return 1;
    }

    return 0;
}

// SaveDungeonState?
void sub_8037E08(struct Dungeon* savedDungeon) {

    *savedDungeon = gDungeonState.current;
    gDungeonState.current.unk_0B_4 = gDungeonState.type;

    return;
}

// LoadDungeonState?
void sub_8037E30(struct Dungeon* savedDungeon) {

    gDungeonState.current = *savedDungeon;
    gDungeonState.type = gDungeonState.current.unk_0B_4;

    return;
}

// SaveDungeonRecords?
void sub_8037E4C(struct Dungeon* savedDungeon) {

    memcpy(savedDungeon, gDungeonState.dungeon, 2 * sizeof(struct Dungeon));

    return;
}

// LoadDungeonRecords?
void sub_8037E64(struct Dungeon* savedDungeon) {

    memcpy(gDungeonState.dungeon, savedDungeon, 2 * sizeof(struct Dungeon));

    return;
}

int UpdateDungeonMapTime(struct Dungeon* dungeon) {
    int time1;
    int time2;

    time1 = dungeon->mapTime;
    time2 = Div((GetGameClock() - gRAMChapterData.unk4), 60);
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

    val += (sub_80A49A4() - gRAMChapterData.unk_38_2);

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
    val += gRAMChapterData.chapterTurnNumber;

    if (val > 500) {
        val = 500;
    }

    dungeon->turnCount = val;

    dungeon->mapTime = UpdateDungeonMapTime(dungeon);

    val = dungeon->enemiesDefeated;
    val += gRAMChapterData.unk48;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->enemiesDefeated = val;

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        val = dungeon->postgameEnemiesDefeated;
        val += gRAMChapterData.unk48;

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

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
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

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
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
    PROC_CALL(AddSkipThread2),
    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
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
    PROC_CALL(sub_8013DA4),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(SubSkipThread2),

    PROC_END,
};

void StartDungeonRecordProcFromMenu(ProcPtr proc) {
    Proc_StartBlocking(sProcScr_DisplayDungeonRecord_FromMenu, proc);
    return;
}

extern struct ProcCmd CONST_DATA sProcScr_DungeonRecord_UpdateNewRecordValues[];

struct ProcCmd CONST_DATA sProcScr_DisplayDungeonRecord_AfterDungeonClear[] = {
    PROC_CALL(PushGlobalTimer),
    PROC_CALL(AddSkipThread2),
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(MU_EndAll),
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
    PROC_CALL(SubSkipThread2),
    PROC_CALL(PopGlobalTimer),

    PROC_END,
};

// StartDungeonRecordProcAfterDungeonClear?
void sub_80381F4(ProcPtr proc) {
    Proc_StartBlocking(sProcScr_DisplayDungeonRecord_AfterDungeonClear, proc);
    return;
}

void PushGlobalTimer() {
    int clock = GetGameClock();
    gUnknown_020038C4 = clock;
    return;
}

void PopGlobalTimer() {
    SetGameClock(gUnknown_020038C4);
    return;
}

void sub_8038230() {
    Sound_PlaySong80024D4(0x40, 0);
    return;
}

extern u16 gUnknown_08A20050[]; // bg config
extern u16 gUnknown_08A21658[]; // record background img
extern u16 gUnknown_08A25DCC[]; // record background pal
extern u16 gUnknown_08A25ECC[]; // record background tsa
extern u16 gUnknown_08A26380[]; // fog overlay img
extern u16 gUnknown_08A268D8[]; // fog overlay pal
extern u16 gUnknown_08A268F8[]; // fog overlay tsa
extern u16 gUnknown_089A234C[]; // "combat record" img
extern u16 gUnknown_089A27B4[]; // "combat record" tsa
extern u16 gUnknown_089A28E0[]; // "combat record" pal

extern u16 gUnknown_0200310C[];

void SetupDungeonRecordUi(ProcPtr proc) {
    int i;

    SetupBackgrounds(gUnknown_08A20050);

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

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 0);

    sub_8001F48(0);
    sub_8001F64(0);

    // Load and display background

    SetSpecialColorEffectsParameters(1, 6, 16, 0);

    CopyDataWithPossibleUncomp(gUnknown_08A21658, (void *)BG_VRAM + GetBackgroundTileDataOffset(3));

    CopyToPaletteBuffer(gUnknown_08A25DCC, 0x100, 0x100);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A25ECC, 0x8000);

    // Load and display fog overlay

    CopyDataWithPossibleUncomp(gUnknown_08A26380, (void *)(BG_VRAM + 0x4C00) + GetBackgroundTileDataOffset(2));

    CopyDataWithPossibleUncomp(gUnknown_08A268F8, gUnknown_02020188);

    CopyToPaletteBuffer(gUnknown_08A268D8, 0xE0, 0x20);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_02020188, 0x7260);

    // Load and display "Combat Record" graphic

    CopyDataWithPossibleUncomp(gUnknown_089A234C, (void *)(BG_VRAM + 0x4000) + GetBackgroundTileDataOffset(1));

    CopyDataWithPossibleUncomp(gUnknown_089A27B4, gBG1TilemapBuffer);

    CopyToPaletteBuffer(gUnknown_089A28E0, 0x40, 0x40);

    for (i = 0; i < 0x280; i++) {
        gBG1TilemapBuffer[i] = gBG1TilemapBuffer[i] + 0x2200;
    }

    DungeonRecordUi_InitText();

    DrawDungeonRecordUiText(proc);

    BG_EnableSyncByMask(0xF);

    sub_80AB760(gUnknown_0200310C);

    CpuFastSet(gPaletteBuffer, gPaletteBuffer + 0x150, 8);

    return;
}

struct DungeonUiTextLutEntry {
    /* 00 */ u16 msgId;
    /* 02 */ s8 x;
    /* 03 */ s8 y;
};

void DrawDungeonRecordUiLabels(struct TextHandle* th) {
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

        Text_Init(th, strlen(str));
        Text_SetParameters(th, 0, 0);
        Text_AppendString(th, str);
        Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(iter->x, iter->y)]);

        iter++;
    }

    return;
}

struct TextHandle* DrawNumberText(struct TextHandle* th, u16 number, u8 places, s8 x, s8 y, u8 colorId) {
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
            Text_Init(th, 1);
            Text_SetParameters(th, 0, colorId);
            Text_AppendDecNumber(th, digits[i]);
            Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(x - i, y)]);
        }

        th++;
    }

    return th;
}

struct TextHandle* DrawNumberText_WithReset(struct TextHandle* th, u16 number, u8 numTiles, s8 x, s8 y, u8 colorId) {
    int i;
    u8 shouldDraw;
    u8 digits[8];

    for (i = 0; i < numTiles; i++) {
        digits[i] = DivRem(number, 10);
        number = Div(number, 10);
    }

    shouldDraw = 0;

    for (i = numTiles - 1; i >= 0; i--) {
        if (th->unk0 != 0xFFFF) {
            Text_Clear(th);
        }

        if (digits[i] != 0) {
            shouldDraw = 1;
        }

        if (shouldDraw || (i == 0)) {
            if (th->unk0 == 0xFFFF) {
                Text_Init(th, 1);
            }

            Text_SetParameters(th, 0, colorId);
            Text_AppendDecNumber(th, digits[i]);
            Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(x - i, y)]);
        }

        th++;
    }

    return th;
}

void sub_8038668(struct TextHandle* th, u8 count) {
    int i;

    for (i = count - 1; i >= 0; i--) {

        if (th->unk0 != 0xFFFF) {
            Text_Clear(th);
        }

        th++;
    }

    return;
}

struct TextHandle* DrawTimeText(struct TextHandle* th, int time, s8 xBase, s8 yBase, u8 colorId) {
    s8 xOffset;
    const char* str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    ComputeDisplayTime(time * 60, &hours, &minutes, &seconds);

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

    Text_Init(th, 1);
    Text_SetParameters(th, 2, colorId);
    Text_AppendChar(th, str);
    Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);

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

    Text_Init(th, 1);
    Text_SetParameters(th, 2, colorId);
    Text_AppendChar(th, str);
    Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);

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

struct TextHandle* DrawTimeText_WithReset(struct TextHandle* th, int time, s8 xBase, s8 yBase, u8 colorId, s8 drawPunctuation) {
    s8 xOffset;
    const char* str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    ComputeDisplayTime(time * 60, &hours, &minutes, &seconds);

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

    if (th->unk0 != 0xFFFF) {
        Text_Clear(th);
    } else {
        Text_Init(th, 1);
    }

    if (drawPunctuation) {
        Text_SetParameters(th, 2, colorId);
        Text_AppendChar(th, str);
        Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);
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

    if (th->unk0 != 0xFFFF) {
        Text_Clear(th);
    } else {
        Text_Init(th, 1);
    }

    if (drawPunctuation) {
        Text_SetParameters(th, 2, colorId);
        Text_AppendChar(th, str);
        Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);
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

extern struct Font gUnknown_020038AC;
extern struct TextHandle gUnknown_02003B70;

void DrawDungeonRecordUiText(ProcPtr proc) {
    int time;
    struct Dungeon currentDungeon;
    struct Dungeon recordDungeon;
    struct TextHandle text;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    CpuCopy32(&gDungeonState.dungeon[gDungeonState.type], &recordDungeon, sizeof(struct Dungeon));

    time = GetGameClock();
    SetGameClock(gUnknown_020038C4);

    UpdateDungeonStats(&currentDungeon);

    SetGameClock(time);

    sub_8003D20();

    Font_InitForUI(&gUnknown_020038AC, (void *)(VRAM + 0x20) + GetBackgroundTileDataOffset(0), 1, 0);
    SetFont(&gUnknown_020038AC);
    Font_LoadForUI();

    NewGreenTextColorManager(proc);

    DrawDungeonRecordUiLabels(&text);

    DrawNumberText(
        &gUnknown_02003B70,
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

    unkTime2 = ((GetGameClock() - gRAMChapterData.unk4) % 60);

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

    EndGreenTextColorManager();

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

    Font_InitForUIDefault();

    CpuFastFill(0, gPaletteBuffer, 0x400);

    EnablePaletteSync();

    return;
}

void sub_8038F78(struct TextHandle* th) {
    int i;
    int bgOffset;

    bgOffset = GetBackgroundTileDataOffset(0);

    i = 0;

    while (i < 8) {
        if (th->unk0 == 0xFFFF) {
            CpuFastFill(0, (void *)((BG_VRAM + 0x12000) + (0x20 * i)), 32);
            CpuFastFill(0, (void *)((BG_VRAM + 0x12400) + (0x20 * i)), 32);
        } else {
            int base = (BG_VRAM + (th->unk0 * 0x40));
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

extern struct Struct02003BE8 gUnknown_02003BE8;
extern u16 gUnknown_02003B88[];
extern struct Struct0859E7D4 gUnknown_02003BA8[];

// obj data?
const u16 CONST_DATA gUnknown_0859E79C[] = {
    0x0002, 0x4000, 0x8000, 0x0100,
    0x4000, 0x8020, 0x0104, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000,
    0x1000, 0x0800, 0x1000, 0x0000,
    0x0000, 0x0000,
};

u16 CONST_DATA gUnknown_0859E7C8[] = {
    0x0000, 0x0214, 0x0400,
    0x0C00, 0x0DEB, 0x1000,
};

struct Struct0859E7D4 CONST_DATA gUnknown_0859E7D4[] = {
    { -56,   0, },
    { -70,  14, },
    { -74,   6, },
    {  38, -14, },
    {  42,  -6, },
    {  24,   0, },
};

void sub_803901C(struct BMDifficultyProc* proc) {
    int r7;
    int r8;
    u16* iter1;
    struct Struct0859E7D4* iter2;

    sub_8038F78(&gUnknown_020038C8[0].text[proc->labelIndex][0]);

    gUnknown_02003BE8.unk_00 = 2;
    gUnknown_02003BE8.unk_04 = gUnknown_02003B88;
    gUnknown_02003BE8.unk_08 = gUnknown_02003BA8;
    gUnknown_02003BE8.unk_0C = NULL;
    gUnknown_02003BE8.unk_10 = NULL;

    iter1 = gUnknown_0859E7C8;
    iter2 = gUnknown_0859E7D4;

    gUnknown_02003BE8.unk_02 = r8 = 6;

    for (r7 = 0; r7 < r8; r7++) {
        gUnknown_02003B88[r7] = DivArm(4096, iter1[r7] * 45);

        gUnknown_02003BA8[r7].x = iter2[r7].x << 4;
        gUnknown_02003BA8[r7].y = iter2[r7].y << 4;
    }

    proc->unk_34 = 0;

    PlaySoundEffect(0x80); // Point Up SE

    return;
}

extern struct TextHandle gUnknown_02003B08;

void sub_80390D4(struct BMDifficultyProc* proc) {
    int pos[2];

    proc->unk_34++;

    if (proc->unk_34 < 45) {

        sub_800A950(&gUnknown_02003BE8, proc->unk_34 * 4096, pos);

        PutSpriteExt(
            4,
            (pos[0] >> 4) + ((u8)gUnknown_080D7FD0.current[proc->labelIndex].x * 8),
            ((pos[1] >> 4) + ((u8)gUnknown_080D7FD0.current[proc->labelIndex].y * 8)) & 0x000001FF,
            gUnknown_0859E79C,
            0x5000
        );
    } else {
        if (proc->labelIndex == 4) {
            DrawTimeText_WithReset(
                &gUnknown_02003B08,
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
    SetGameClock(gUnknown_020038C4);

    UpdateDungeonStats(&currentDungeon);

    SetGameClock(clock);

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
    SetGameClock(gUnknown_020038C4);

    UpdateDungeonStats(&currentDungeon);

    SetGameClock(clock);

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

struct Struct0859E7D4 CONST_DATA gUnknown_0859E838[] = {
    { 0x980, 0x380, },
    { 0x8D0, 0x430, },
    { 0x960, 0x320, },
    { 0xA30, 0x2D0, },
    { 0x980, 0x380, },
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
            gUnknown_0859E79C,
            0x5000
        );
    } else {

        record = gDungeonState.dungeon[gDungeonState.type];

        val = record.clearCount;

        if (val < 100) {
            val++;
        }

        DrawNumberText_WithReset(
            &gUnknown_02003B70,
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
