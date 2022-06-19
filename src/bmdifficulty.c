#include "global.h"

#include "constants/characters.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"

/*
* Difficulty mode stuff and also tower/ruins stuff
* May have been separate files
*/

struct Struct020038C8 {
    struct TextHandle text[4][8];
    u8 idk[0x40];
};

struct Dungeon {
    /* 00 */ u32 unk_00:16;

    /* 02 */ u32 unk_02:8;

    /* 03 */ u32 turnCount:9;
    /* 04 */ u32 mapTime:18;

    /* 06 */ u32 unk_06:16;

    /* 08 */ u32 unk_08:7;
    /* 09 */ u32 enemiesDefeated:10;
    /* 0A */ u32 clearCount:4;
    /* 0B */ u32 unk_0B_0:4; // ??
    /* 0B */ u32 unk_0B_4:4; // ??
};

struct Struct030017A0 {
    /* 00 */ struct Dungeon current;
    /* 0C */ struct Dungeon dungeon[2];
    /* 24 */ u8 type; // tower = 0, ruins = 1
};

struct Struct080D8018 {
    u16 eid;
    struct UnitDefinition* uDef;
};

struct BMDifficultyProc {
    PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
};

struct Struct0859E7D4 {
    int x;
    int y;
};

struct Struct02003BE8 {
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ int* unk_04;
    /* 08 */ struct Struct0859E7D4* unk_08;
    /* 0C */ int* unk_0C;
    /* 10 */ int* unk_10;
};

extern struct Struct020038C8 gUnknown_020038C8[2];
extern struct TextHandle gUnknown_02003B48[8];

extern struct Struct030017A0 gUnknown_030017A0; // gDungeonState?

extern struct ProcCmd gUnknown_0859E64C[];
extern struct ProcCmd gUnknown_0859E6EC[];
extern int gUnknown_020038C4;


// bmdifficulty.s
s8 sub_8037DDC(ProcPtr, const struct UnitDefinition*);
void sub_8037EB0(struct Dungeon*);
void sub_8037FCC(void);
void sub_8038134(void);
void sub_8038BA4(ProcPtr);

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
        case 2: // eirika
            leaderId = CHARACTER_EIRIKA;
            break;
        case 1: // tutorial
            leaderId = CHARACTER_EIRIKA;
            break;
        case 3: // ephraim
            leaderId = CHARACTER_EPHRAIM;
            break;
    }

    if (gRAMChapterData.chapterIndex == 5) {
        leaderId = CHARACTER_EPHRAIM;
    }

    return unit->pCharacterData->number == leaderId;
}

void sub_8037BAC() {
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

// InitDungeon
void sub_8037C40(u8 type) {

    gUnknown_030017A0.type = type;

    gUnknown_030017A0.current.unk_00 = 0;
    gUnknown_030017A0.current.unk_02 = 0;
    gUnknown_030017A0.current.turnCount = 0;
    gUnknown_030017A0.current.unk_06 = 0;
    gUnknown_030017A0.current.unk_08 = 0;
    gUnknown_030017A0.current.enemiesDefeated = 0;
    gUnknown_030017A0.current.clearCount = 0;
    gUnknown_030017A0.current.mapTime = 0;

    return;
}

// UnlockAllyByEnemyDefeatedCount
void sub_8037CA0() {
    struct Dungeon* dungeon = &gUnknown_030017A0.current;
    sub_8037EB0(dungeon);

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        if ((gUnknown_030017A0.type == 0) && (dungeon->enemiesDefeated >= 200)) {
            SetEventId(0x6B); // Riev
        }

        if ((gUnknown_030017A0.type == 1) && (dungeon->enemiesDefeated >= 200)) {
            SetEventId(0x6C); // Hayden
        }
    }

    return;
}

// UnlockAllyByDungeonClearCount
void sub_8037CF8() {

    sub_8037CA0();
    sub_8037FCC();

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        struct Dungeon* dungeon = &gUnknown_030017A0.dungeon[gUnknown_030017A0.type];

        if ((gUnknown_030017A0.type == 0) && (dungeon->clearCount >= 3)) {
            SetEventId(0x6F); // Selena
        }

        if ((gUnknown_030017A0.type == 1) && (dungeon->clearCount >= 3)) {
            SetEventId(0x70); // Lyon
        }
    }

    return;
}

void sub_8037D58() {
    sub_8037CA0();
    sub_8038134();

    return;
}

// PrepScreenProc_AddPostgameUnits
s8 sub_8037D68(ProcPtr proc) {
    u8 i;

    // FIXME
    extern const struct Struct080D8018 gUnknown_080D8018[];
    struct Struct080D8018 hack[11];
    memcpy(hack, gUnknown_080D8018, 0x58);

    if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME)) {
        return 0;
    }

    for (i = 0; hack[i].eid != 0; i++) {
        if (((s8)CheckEventId(hack[i].eid) == 1) && (sub_8037DDC(proc, hack[i].uDef) == 1) ) {
            return 1;
        }
    }

    return 0;
}

// PrepScreenProc_TryAddUnit
s8 sub_8037DDC(ProcPtr param_1, const struct UnitDefinition* uDef) {
    if (GetUnitFromCharIdAndFaction(uDef->charIndex, 0) == 0) {
        LoadUnit(uDef);
        sub_8011728(param_1, uDef->charIndex);
        return 1;
    }

    return 0;
}

// SaveDungeonState?
void sub_8037E08(struct Dungeon* savedDungeon) {

    *savedDungeon = gUnknown_030017A0.current;
    gUnknown_030017A0.current.unk_0B_4 = gUnknown_030017A0.type;

    return;
}

// LoadDungeonState?
void sub_8037E30(struct Dungeon* savedDungeon) {

    gUnknown_030017A0.current = *savedDungeon;
    gUnknown_030017A0.type = gUnknown_030017A0.current.unk_0B_4;

    return;
}

#if NONMATCHING

// SaveDungeonRecords?
void sub_8037E4C(struct Dungeon* savedDungeon) {

    struct Dungeon* dungeon = &gUnknown_030017A0.dungeon[0];

    savedDungeon[0] = dungeon[0];
    savedDungeon[1] = dungeon[1];

    return;
}

#else // !NONMATCHING

__attribute__((naked))
void sub_8037E4C(struct Dungeon* savedDungeon) {
    
    asm("\n\
        .syntax unified\n\
        push {r4, lr}\n\
        ldr r1, _08037E60  @ gUnknown_030017AC\n\
        ldm r1!, {r2, r3, r4}\n\
        stm r0!, {r2, r3, r4}\n\
        ldm r1!, {r2, r3, r4}\n\
        stm r0!, {r2, r3, r4}\n\
        pop {r4}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08037E60: .4byte gUnknown_030017AC\n\
        .syntax divided\n\
    ");
}

#endif

#if NONMATCHING

// LoadDungeonRecords?
void sub_8037E64(struct Dungeon* savedDungeon) {
    
    struct Dungeon* dungeon = &gUnknown_030017A0.dungeon[0];
    
    dungeon[0] = savedDungeon[0];
    dungeon[1] = savedDungeon[1];
    
    return;
}

#else // !NONMATCHING

__attribute__((naked))
void sub_8037E64(struct Dungeon* savedDungeon) {
    
    asm("\n\
        .syntax unified\n\
        push {r4, lr}\n\
        ldr r1, _08037E78  @ gUnknown_030017AC\n\
        ldm r0!, {r2, r3, r4}\n\
        stm r1!, {r2, r3, r4}\n\
        ldm r0!, {r2, r3, r4}\n\
        stm r1!, {r2, r3, r4}\n\
        pop {r4}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08037E78: .4byte gUnknown_030017AC\n\
        .syntax divided\n\
    ");
}

#endif

int sub_8037E7C(struct Dungeon* dungeon) {
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

void sub_8037EB0(struct Dungeon* dungeon) {
    int val;
    int i;

    val = dungeon->unk_00;

    val += (sub_80A49A4() - gRAMChapterData.unk_38_2);

    if (val > 50000) {
        val = 50000;
    }

    dungeon->unk_00 = val;

    val = dungeon->unk_02;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit) && !(unit->state & US_UNAVAILABLE)) {
            val++;
        }
    }

    dungeon->unk_02 = val;

    val = dungeon->turnCount; 
    val += gRAMChapterData.chapterTurnNumber;

    if (val > 500) {
        val = 500;
    }

    dungeon->turnCount = val;

    dungeon->mapTime = sub_8037E7C(dungeon);

    val = dungeon->unk_06;
    val += gRAMChapterData.unk48;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->unk_06 = val;

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        val = dungeon->enemiesDefeated;
        val += gRAMChapterData.unk48;

        if (val > 1000) {
            val = 1000;
        }

        dungeon->enemiesDefeated = val;
    }

    return;
}

void sub_8037FCC() {
    struct Dungeon* current;
    struct Dungeon* dungeon;
    int val;

    current = &gUnknown_030017A0.current;
    dungeon = &gUnknown_030017A0.dungeon[gUnknown_030017A0.type];

    if (dungeon->unk_08 > 0) {
        if (dungeon->unk_00 < current->unk_00) {
            dungeon->unk_00 = current->unk_00;
        }

        if (current->unk_02 < dungeon->unk_02) {
            dungeon->unk_02 = current->unk_02;
        }

        if (current->turnCount < dungeon->turnCount) {
            dungeon->turnCount = current->turnCount;
        }

        if (current->mapTime < dungeon->mapTime) {
            dungeon->mapTime = current->mapTime;
        }
    } else {
        dungeon->unk_00 = current->unk_00;
        dungeon->unk_02 = current->unk_02;

        dungeon->turnCount = current->turnCount;
        dungeon->mapTime = current->mapTime;
    }

    val = dungeon->unk_06 + current->unk_06;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->unk_06 = val;

    if (dungeon->unk_08 < 100) {
        dungeon->unk_08++;
    }

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        if (dungeon->clearCount < 10) {
            dungeon->clearCount++;
        }
    }

    return;
}

void sub_8038134() {
    struct Dungeon* current;
    struct Dungeon* dungeon;
    int val;

    current = &gUnknown_030017A0.current;
    dungeon = &gUnknown_030017A0.dungeon[gUnknown_030017A0.type];

    val = dungeon->unk_06 + current->unk_06;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->unk_06 = val;

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME) {
        val = dungeon->enemiesDefeated + current->enemiesDefeated;

        if (val > 1000) {
            val = 1000;
        }

        dungeon->enemiesDefeated = val;
    }

    return;
}

void sub_80381E0(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_0859E64C, proc);
    return;
}

void sub_80381F4(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_0859E6EC, proc);
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


void sub_8038240(ProcPtr proc) {
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

    SetSpecialColorEffectsParameters(1, 6, 16, 0);

    CopyDataWithPossibleUncomp(gUnknown_08A21658, (void *)BG_VRAM + GetBackgroundTileDataOffset(3));

    CopyToPaletteBuffer(gUnknown_08A25DCC, 0x100, 0x100);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A25ECC, 0x8000);

    CopyDataWithPossibleUncomp(gUnknown_08A26380, (void *)(BG_VRAM + 0x4C00) + GetBackgroundTileDataOffset(2));

    CopyDataWithPossibleUncomp(gUnknown_08A268F8, gUnknown_02020188);

    CopyToPaletteBuffer(gUnknown_08A268D8, 0xE0, 0x20);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_02020188, 0x7260);

    CopyDataWithPossibleUncomp(gUnknown_089A234C, (void *)(BG_VRAM + 0x4000) + GetBackgroundTileDataOffset(1));

    CopyDataWithPossibleUncomp(gUnknown_089A27B4, gBG1TilemapBuffer);

    CopyToPaletteBuffer(gUnknown_089A28E0, 0x40, 0x40);

    for (i = 0; i < 0x280; i++) {
        gBG1TilemapBuffer[i] = gBG1TilemapBuffer[i] + 0x2200;
    }

    sub_8037BAC();

    sub_8038BA4(proc);

    BG_EnableSyncByMask(0xF);

    sub_80AB760(gUnknown_0200310C);

    CpuFastSet(gPaletteBuffer, gPaletteBuffer + 0x150, 8);

    return;
}

struct Struct080D8070 {
    /* 00 */ u16 msgId;
    /* 02 */ s8 x;
    /* 03 */ s8 y;
};

void sub_8038448(struct TextHandle* th) {
    char* str;
    struct Struct080D8070* iter;

    // FIXME
    extern const struct Struct080D8070 gUnknown_080D8070[];
    struct Struct080D8070 hack[9];
    memcpy(hack, gUnknown_080D8070, sizeof(hack));

    iter = &hack[0];
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

struct TextHandle* sub_80384BC(struct TextHandle* th, u16 number, u8 places, s8 x, s8 y, u8 colorId) {
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

struct TextHandle* sub_8038588(struct TextHandle* th, u16 number, u8 numTiles, s8 x, s8 y, u8 colorId) {
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

struct TextHandle* sub_8038698(struct TextHandle* th, int time, s8 xBase, s8 yBase, u8 colorId) {
    s8 xOffset;
    const char* str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    ComputeDisplayTime(time * 60, &hours, &minutes, &seconds);

    xOffset = xBase + 0xF9;

    if (hours < 10) {
        th = sub_80384BC(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = sub_80384BC(th, hours / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = sub_80384BC(th, hours % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase + 0xFB;

    str = GetStringFromIndex(0x20D); // :[.]

    Text_Init(th, 1);
    Text_SetParameters(th, 2, colorId);
    Text_AppendChar(th, str);
    Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);

    th++;

    xOffset = xBase + 0xFC;

    if (minutes < 10) {
        th = sub_80384BC(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = sub_80384BC(th, minutes / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = sub_80384BC(th, minutes % 10, 1, xOffset, yBase, colorId);

    xOffset = xBase + 0xFE;

    str = GetStringFromIndex(0x20D); // :[.]

    Text_Init(th, 1);
    Text_SetParameters(th, 2, colorId);
    Text_AppendChar(th, str);
    Text_Draw(th, &gBG0TilemapBuffer[TILEMAP_INDEX(xOffset, yBase)]);

    th++;

    xOffset = xBase + 0xFF;

    if (seconds < 10) {
        th = sub_80384BC(th, 0, 1, xOffset, yBase, colorId);
    }
    else {
        th = sub_80384BC(th, seconds / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = sub_80384BC(th, seconds % 10, 1, xOffset, yBase, colorId);

    return th;
}

struct TextHandle* sub_8038900(struct TextHandle* th, int time, s8 xBase, s8 yBase, u8 colorId, s8 drawPunctuation) {
    s8 xOffset;
    const char* str;
    u16 hours;
    u16 minutes;
    u16 seconds;

    ComputeDisplayTime(time * 60, &hours, &minutes, &seconds);

    xOffset = xBase + 0xF9;

    if (hours < 10) {
        th = sub_8038588(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = sub_8038588(th, hours / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = sub_8038588(th, hours % 10, 1, xOffset, yBase, colorId);

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
        th = sub_8038588(th, 0, 1, xOffset, yBase, colorId);
    } else {
        th = sub_8038588(th, minutes / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = sub_8038588(th, minutes % 10, 1, xOffset, yBase, colorId);

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
        th = sub_8038588(th, 0, 1, xOffset, yBase, colorId);
    }
    else {
        th = sub_8038588(th, seconds / 10, 1, xOffset, yBase, colorId);
    }

    xOffset++;

    th = sub_8038588(th, seconds % 10, 1, xOffset, yBase, colorId);

    return th;
}

extern struct Font gUnknown_020038AC;

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
};

extern struct Outer080D7FD0 gUnknown_080D7FD0;
extern struct TextHandle gUnknown_02003B70;

#if NONMATCHING

void sub_8038BA4(ProcPtr proc) {
    int time;
    struct Dungeon currentDungeon;
    struct Dungeon recordDungeon;
    struct TextHandle text;
    s8 huh;

    CpuCopy32(&gUnknown_030017A0.current, &currentDungeon, sizeof(struct Dungeon));

    CpuCopy32(&gUnknown_030017A0.dungeon[gUnknown_030017A0.type], &recordDungeon, sizeof(struct Dungeon));

    time = GetGameClock();
    SetGameClock(gUnknown_020038C4);

    sub_8037EB0(&currentDungeon);

    SetGameClock(time);

    sub_8003D20();

    Font_InitForUI(&gUnknown_020038AC, (void *)(VRAM + 0x20) + GetBackgroundTileDataOffset(0), 1, 0);
    SetFont(&gUnknown_020038AC);
    Font_LoadForUI();

    NewGreenTextColorManager(proc);

    sub_8038448(&text);

    sub_80384BC(
        &gUnknown_02003B70,
        recordDungeon.unk_08,
        3,
        0x1A,
        7,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[0].text[0][8 - gUnknown_080D7FD0.current[0].numDigits],
        currentDungeon.unk_06,
        gUnknown_080D7FD0.current[0].numDigits, // 5
        gUnknown_080D7FD0.current[0].x,
        gUnknown_080D7FD0.current[0].y,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[1].text[0][8 - gUnknown_080D7FD0.record[0].numDigits],
        recordDungeon.unk_06,
        gUnknown_080D7FD0.record[0].numDigits, // 5
        gUnknown_080D7FD0.record[0].x,
        gUnknown_080D7FD0.record[0].y,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[0].text[1][8 - gUnknown_080D7FD0.current[1].numDigits],
        currentDungeon.unk_00,
        gUnknown_080D7FD0.current[1].numDigits, // 5
        gUnknown_080D7FD0.current[1].x,
        gUnknown_080D7FD0.current[1].y,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[1].text[1][8 - gUnknown_080D7FD0.record[1].numDigits],
        recordDungeon.unk_00,
        gUnknown_080D7FD0.record[1].numDigits, // 5
        gUnknown_080D7FD0.record[1].x,
        gUnknown_080D7FD0.record[1].y,
        2
    );

    // TODO: Closest I could get was to buffer this in a temporary variable; for some reason both the current/record use the same Y value
    huh = gUnknown_080D7FD0.record[2].y;

    sub_80384BC(
        &gUnknown_020038C8[0].text[2][8 - gUnknown_080D7FD0.current[2].numDigits],
        currentDungeon.unk_02,
        gUnknown_080D7FD0.current[2].numDigits, // 3
        gUnknown_080D7FD0.current[2].x,
        huh,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[1].text[2][8 - gUnknown_080D7FD0.record[2].numDigits],
        recordDungeon.unk_02,
        gUnknown_080D7FD0.record[2].numDigits, // 3
        gUnknown_080D7FD0.record[2].x,
        huh,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[0].text[3][8 - gUnknown_080D7FD0.current[3].numDigits],
        currentDungeon.turnCount,
        gUnknown_080D7FD0.current[3].numDigits, // 3
        gUnknown_080D7FD0.current[3].x,
        gUnknown_080D7FD0.current[3].y,
        2
    );

    sub_80384BC(
        &gUnknown_020038C8[1].text[3][8 - gUnknown_080D7FD0.record[3].numDigits],
        recordDungeon.turnCount,
        gUnknown_080D7FD0.record[3].numDigits, // 3
        gUnknown_080D7FD0.record[3].x,
        gUnknown_080D7FD0.record[3].y,
        2
    );

    sub_8038698(
        &gUnknown_020038C8[0].text[4][0],
        currentDungeon.mapTime,
        gUnknown_080D7FD0.current[4].x,
        gUnknown_080D7FD0.current[4].y,
        2
    );

    sub_8038698(
        &gUnknown_020038C8[1].text[4][0],
        recordDungeon.mapTime,
        gUnknown_080D7FD0.record[4].x,
        gUnknown_080D7FD0.record[4].y,
        2
    );

    return;
}

#else // !NONMATCHING

__attribute__((naked))
void sub_8038BA4(ProcPtr proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x28\n\
        adds r6, r0, #0\n\
        ldr r4, _08038E18  @ gUnknown_030017A0\n\
        ldr r5, _08038E1C  @ 0x04000003\n\
        adds r0, r4, #0\n\
        add r1, sp, #8\n\
        adds r2, r5, #0\n\
        bl CpuSet\n\
        adds r0, r4, #0\n\
        adds r0, #0x24\n\
        ldrb r1, [r0]\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #2\n\
        adds r4, #0xc\n\
        adds r0, r0, r4\n\
        add r1, sp, #0x14\n\
        mov r9, r1\n\
        adds r2, r5, #0\n\
        bl CpuSet\n\
        bl GetGameClock\n\
        adds r4, r0, #0\n\
        ldr r0, _08038E20  @ gUnknown_020038C4\n\
        ldr r0, [r0]\n\
        bl SetGameClock\n\
        add r0, sp, #8\n\
        bl sub_8037EB0\n\
        adds r0, r4, #0\n\
        bl SetGameClock\n\
        bl sub_8003D20\n\
        ldr r4, _08038E24  @ gUnknown_020038AC\n\
        movs r0, #0\n\
        bl GetBackgroundTileDataOffset\n\
        adds r1, r0, #0\n\
        ldr r2, _08038E28  @ 0x06000020\n\
        adds r1, r1, r2\n\
        adds r0, r4, #0\n\
        movs r2, #1\n\
        movs r3, #0\n\
        bl Font_InitForUI\n\
        adds r0, r4, #0\n\
        bl SetFont\n\
        bl Font_LoadForUI\n\
        adds r0, r6, #0\n\
        bl NewGreenTextColorManager\n\
        add r0, sp, #0x20\n\
        bl sub_8038448\n\
        ldr r0, _08038E2C  @ gUnknown_02003B70\n\
        mov r3, r9\n\
        ldrh r1, [r3, #8]\n\
        lsls r1, r1, #0x16\n\
        lsrs r1, r1, #0x19\n\
        movs r6, #7\n\
        str r6, [sp]\n\
        movs r4, #2\n\
        mov r8, r4\n\
        str r4, [sp, #4]\n\
        movs r2, #3\n\
        movs r3, #0x1a\n\
        bl sub_80384BC\n\
        ldr r7, _08038E30  @ gUnknown_080D7FD0\n\
        ldrb r2, [r7, #4]\n\
        movs r5, #8\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        ldr r1, _08038E34  @ gUnknown_020038C8\n\
        mov sl, r1\n\
        add r0, sl\n\
        add r1, sp, #8\n\
        ldrh r3, [r1, #6]\n\
        lsrs r3, r3, #3\n\
        ldrb r1, [r1, #8]\n\
        ands r1, r6\n\
        lsls r1, r1, #0xd\n\
        orrs r1, r3\n\
        movs r3, #0\n\
        ldrsb r3, [r7, r3]\n\
        movs r4, #1\n\
        ldrsb r4, [r7, r4]\n\
        str r4, [sp]\n\
        mov r4, r8\n\
        str r4, [sp, #4]\n\
        bl sub_80384BC\n\
        adds r0, r7, #0\n\
        adds r0, #0x28\n\
        ldrb r2, [r0]\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        movs r1, #0xa0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        adds r0, r0, r1\n\
        mov r1, r9\n\
        ldrh r3, [r1, #6]\n\
        lsrs r3, r3, #3\n\
        ldrb r1, [r1, #8]\n\
        ands r1, r6\n\
        lsls r1, r1, #0xd\n\
        orrs r1, r3\n\
        adds r3, r7, #0\n\
        adds r3, #0x24\n\
        ldrb r3, [r3]\n\
        lsls r3, r3, #0x18\n\
        asrs r3, r3, #0x18\n\
        adds r4, r7, #0\n\
        adds r4, #0x25\n\
        ldrb r4, [r4]\n\
        lsls r4, r4, #0x18\n\
        asrs r4, r4, #0x18\n\
        str r4, [sp]\n\
        mov r4, r8\n\
        str r4, [sp, #4]\n\
        bl sub_80384BC\n\
        ldrb r2, [r7, #0xc]\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        mov r1, sl\n\
        adds r1, #0x40\n\
        adds r0, r0, r1\n\
        add r1, sp, #8\n\
        ldrh r1, [r1]\n\
        movs r3, #8\n\
        ldrsb r3, [r7, r3]\n\
        movs r4, #9\n\
        ldrsb r4, [r7, r4]\n\
        str r4, [sp]\n\
        mov r6, r8\n\
        str r6, [sp, #4]\n\
        bl sub_80384BC\n\
        adds r0, r7, #0\n\
        adds r0, #0x30\n\
        ldrb r2, [r0]\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        movs r1, #0xc0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        adds r0, r0, r1\n\
        mov r3, r9\n\
        ldrh r1, [r3]\n\
        adds r3, r7, #0\n\
        adds r3, #0x2c\n\
        ldrb r3, [r3]\n\
        lsls r3, r3, #0x18\n\
        asrs r3, r3, #0x18\n\
        adds r4, r7, #0\n\
        adds r4, #0x2d\n\
        ldrb r4, [r4]\n\
        lsls r4, r4, #0x18\n\
        asrs r4, r4, #0x18\n\
        str r4, [sp]\n\
        str r6, [sp, #4]\n\
        bl sub_80384BC\n\
        ldrb r2, [r7, #0x14]\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        mov r1, sl\n\
        adds r1, #0x80\n\
        adds r0, r0, r1\n\
        add r1, sp, #8\n\
        ldrb r1, [r1, #2]\n\
        movs r3, #0x10\n\
        ldrsb r3, [r7, r3]\n\
        adds r4, r7, #0\n\
        adds r4, #0x35\n\
        ldrb r4, [r4]\n\
        lsls r4, r4, #0x18\n\
        asrs r4, r4, #0x18\n\
        str r4, [sp]\n\
        str r6, [sp, #4]\n\
        bl sub_80384BC\n\
        adds r0, r7, #0\n\
        adds r0, #0x38\n\
        ldrb r2, [r0]\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        movs r1, #0xe0\n\
        lsls r1, r1, #1\n\
        add r1, sl\n\
        adds r0, r0, r1\n\
        mov r6, r9\n\
        ldrb r1, [r6, #2]\n\
        adds r3, r7, #0\n\
        adds r3, #0x34\n\
        ldrb r3, [r3]\n\
        lsls r3, r3, #0x18\n\
        asrs r3, r3, #0x18\n\
        str r4, [sp]\n\
        mov r4, r8\n\
        str r4, [sp, #4]\n\
        bl sub_80384BC\n\
        ldrb r2, [r7, #0x1c]\n\
        subs r0, r5, r2\n\
        lsls r0, r0, #3\n\
        mov r1, sl\n\
        adds r1, #0xc0\n\
        adds r0, r0, r1\n\
        add r1, sp, #8\n\
        ldrb r3, [r1, #3]\n\
        ldrb r1, [r1, #4]\n\
        movs r6, #1\n\
        ands r1, r6\n\
        lsls r1, r1, #8\n\
        orrs r1, r3\n\
        movs r3, #0x18\n\
        ldrsb r3, [r7, r3]\n\
        movs r4, #0x19\n\
        ldrsb r4, [r7, r4]\n\
        str r4, [sp]\n\
        mov r4, r8\n\
        str r4, [sp, #4]\n\
        bl sub_80384BC\n\
        adds r0, r7, #0\n\
        adds r0, #0x40\n\
        ldrb r2, [r0]\n\
        subs r5, r5, r2\n\
        lsls r5, r5, #3\n\
        movs r0, #0x80\n\
        lsls r0, r0, #2\n\
        add r0, sl\n\
        adds r5, r5, r0\n\
        mov r1, r9\n\
        ldrb r0, [r1, #3]\n\
        ldrb r1, [r1, #4]\n\
        ands r1, r6\n\
        lsls r1, r1, #8\n\
        orrs r1, r0\n\
        adds r0, r7, #0\n\
        adds r0, #0x3c\n\
        movs r3, #0\n\
        ldrsb r3, [r0, r3]\n\
        adds r0, #1\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        str r0, [sp]\n\
        str r4, [sp, #4]\n\
        adds r0, r5, #0\n\
        bl sub_80384BC\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        add r0, sl\n\
        ldr r1, [sp, #0xc]\n\
        lsls r1, r1, #0xd\n\
        lsrs r1, r1, #0xe\n\
        adds r2, r7, #0\n\
        adds r2, #0x20\n\
        ldrb r2, [r2]\n\
        lsls r2, r2, #0x18\n\
        asrs r2, r2, #0x18\n\
        adds r3, r7, #0\n\
        adds r3, #0x21\n\
        ldrb r3, [r3]\n\
        lsls r3, r3, #0x18\n\
        asrs r3, r3, #0x18\n\
        str r4, [sp]\n\
        bl sub_8038698\n\
        movs r0, #0x90\n\
        lsls r0, r0, #2\n\
        add r0, sl\n\
        mov r2, r9\n\
        ldr r1, [r2, #4]\n\
        lsls r1, r1, #0xd\n\
        lsrs r1, r1, #0xe\n\
        adds r2, r7, #0\n\
        adds r2, #0x44\n\
        ldrb r2, [r2]\n\
        lsls r2, r2, #0x18\n\
        asrs r2, r2, #0x18\n\
        adds r3, r7, #0\n\
        adds r3, #0x45\n\
        ldrb r3, [r3]\n\
        lsls r3, r3, #0x18\n\
        asrs r3, r3, #0x18\n\
        str r4, [sp]\n\
        bl sub_8038698\n\
        add sp, #0x28\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08038E18: .4byte gUnknown_030017A0\n\
    _08038E1C: .4byte 0x04000003\n\
    _08038E20: .4byte gUnknown_020038C4\n\
    _08038E24: .4byte gUnknown_020038AC\n\
    _08038E28: .4byte 0x06000020\n\
    _08038E2C: .4byte gUnknown_02003B70\n\
    _08038E30: .4byte gUnknown_080D7FD0\n\
    _08038E34: .4byte gUnknown_020038C8\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_8038E38() {
    struct Dungeon currentDungeon;
    int unkTime1;
    u32 unkTime2;
    s8 drawPunctuation;

    CpuCopy32(&gUnknown_030017A0.current, &currentDungeon, sizeof(struct Dungeon));

    unkTime1 = sub_8037E7C(&currentDungeon);

    unkTime2 = ((GetGameClock() - gRAMChapterData.unk4) % 60);

    drawPunctuation = 1;
    if (unkTime2 > 29) {
        drawPunctuation = 0;
    }

    sub_8038900(
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

void sub_8038EA8(ProcPtr proc) {
    sub_8038E38();

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

void sub_8038ED0(ProcPtr proc) {
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

void sub_8038EF0() {
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

    CpuFastFill16(0, gPaletteBuffer, 0x01000400);

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

            CpuFastCopy((void *)((bgOffset + base) + 0x20), (void *)((BG_VRAM + 0x12000) + (0x20 * i)), 32);

            #if NONMATCHING

            #else // !NONMATCHING

            asm("add r4, r4, #0x20");

            #endif

            CpuFastCopy((void *)((bgOffset + base) + 0x20), (void *)((BG_VRAM + 0x12400) + (0x20 * i)), 32);
        }

        th++;
        i++;
    }

    return;
}

extern struct Struct02003BE8 gUnknown_02003BE8;
extern int gUnknown_02003B88[];
extern struct Struct0859E7D4 gUnknown_02003BA8[];

extern u16 gUnknown_0859E7C8[];
extern struct Struct0859E7D4 gUnknown_0859E7D4[];

#if NONMATCHING

void sub_803901C(struct BMDifficultyProc* proc) {
    int r7;
    int r8;

    sub_8038F78(&gUnknown_020038C8[0].text[proc->unk_2c][0]);

    gUnknown_02003BE8.unk_00 = 2;
    gUnknown_02003BE8.unk_04 = gUnknown_02003B88;
    gUnknown_02003BE8.unk_08 = gUnknown_02003BA8;
    gUnknown_02003BE8.unk_0C = NULL;
    gUnknown_02003BE8.unk_10 = NULL;

    gUnknown_02003BE8.unk_02 = r8 = 6;

    for (r7 = 0; r7 < r8; r7++) {
        gUnknown_02003B88[r7] = DivArm(4096, gUnknown_0859E7C8[r7] * 45);

        gUnknown_02003BA8[r7].x = gUnknown_0859E7D4[r7].x << 4;
        gUnknown_02003BA8[r7].y = gUnknown_0859E7D4[r7].y << 4;
    }

    proc->unk_34 = 0;

    PlaySoundEffect(0x80);

    return;
}

#else // !NONMATCHING

__attribute__((naked))
void sub_803901C(struct BMDifficultyProc* proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #4\n\
        mov r9, r0\n\
        ldr r0, [r0, #0x2c]\n\
        lsls r0, r0, #6\n\
        ldr r1, _080390B8  @ gUnknown_020038C8\n\
        adds r0, r0, r1\n\
        bl sub_8038F78\n\
        ldr r1, _080390BC  @ gUnknown_02003BE8\n\
        movs r2, #0\n\
        movs r0, #2\n\
        strh r0, [r1]\n\
        ldr r0, _080390C0  @ gUnknown_02003B88\n\
        str r0, [r1, #4]\n\
        ldr r3, _080390C4  @ gUnknown_02003BA8\n\
        str r3, [r1, #8]\n\
        str r2, [r1, #0xc]\n\
        str r2, [r1, #0x10]\n\
        ldr r2, _080390C8  @ gUnknown_0859E7C8\n\
        ldr r0, _080390CC  @ gUnknown_0859E7D4\n\
        movs r4, #6\n\
        mov r8, r4\n\
        mov r4, r8\n\
        strh r4, [r1, #2]\n\
        movs r7, #0\n\
        adds r6, r0, #0\n\
        adds r5, r3, #0\n\
    _0803905A:\n\
        lsls r4, r7, #1\n\
        ldrh r1, [r2]\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r1, r0, #4\n\
        subs r1, r1, r0\n\
        movs r0, #0x80\n\
        lsls r0, r0, #5\n\
        str r2, [sp]\n\
        bl DivArm\n\
        ldr r1, _080390C0  @ gUnknown_02003B88\n\
        adds r4, r4, r1\n\
        strh r0, [r4]\n\
        ldr r0, [r6]\n\
        lsls r0, r0, #4\n\
        str r0, [r5]\n\
        ldr r0, [r6, #4]\n\
        lsls r0, r0, #4\n\
        str r0, [r5, #4]\n\
        adds r6, #8\n\
        adds r5, #8\n\
        ldr r2, [sp]\n\
        adds r2, #2\n\
        adds r7, #1\n\
        cmp r7, r8\n\
        blt _0803905A\n\
        movs r0, #0\n\
        mov r1, r9\n\
        str r0, [r1, #0x34]\n\
        ldr r0, _080390D0  @ gRAMChapterData\n\
        adds r0, #0x41\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x1e\n\
        cmp r0, #0\n\
        blt _080390A8\n\
        movs r0, #0x80\n\
        bl m4aSongNumStart\n\
    _080390A8:\n\
        add sp, #4\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080390B8: .4byte gUnknown_020038C8\n\
    _080390BC: .4byte gUnknown_02003BE8\n\
    _080390C0: .4byte gUnknown_02003B88\n\
    _080390C4: .4byte gUnknown_02003BA8\n\
    _080390C8: .4byte gUnknown_0859E7C8\n\
    _080390CC: .4byte gUnknown_0859E7D4\n\
    _080390D0: .4byte gRAMChapterData\n\
        .syntax divided\n\
    ");
}

#endif

extern struct TextHandle gUnknown_02003B08;

extern const u16 gUnknown_0859E79C[]; // obj data?

void sub_80390D4(struct BMDifficultyProc* proc) {
    int pos[2];

    proc->unk_34++;

    if (proc->unk_34 < 45) {

        sub_800A950(&gUnknown_02003BE8, proc->unk_34 * 4096, pos);

        PutSpriteExt(
            4,
            (pos[0] >> 4) + ((u8)gUnknown_080D7FD0.current[proc->unk_2c].x * 8),
            ((pos[1] >> 4) + ((u8)gUnknown_080D7FD0.current[proc->unk_2c].y * 8)) & 0x000001FF,
            gUnknown_0859E79C,
            0x5000
        );
    } else {
        if (proc->unk_2c == 4) {
            sub_8038900(
                &gUnknown_02003B08,
                proc->unk_30,
                gUnknown_080D7FD0.record[4].x,
                gUnknown_080D7FD0.record[4].y,
                4,
                1
            );
        } else {
            sub_8038588(
                &gUnknown_020038C8[1].text[proc->unk_2c][8 - gUnknown_080D7FD0.record[proc->unk_2c].numDigits],
                proc->unk_30,
                gUnknown_080D7FD0.record[proc->unk_2c].numDigits,
                gUnknown_080D7FD0.record[proc->unk_2c].x,
                gUnknown_080D7FD0.record[proc->unk_2c].y,
                4
            );
        }

        PlaySoundEffect(0x76);
        BG_EnableSyncByMask(1);

        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_0859E804[];

struct BMDifficultyProc* sub_80391D0(int slot, int value, ProcPtr parent) {
    struct BMDifficultyProc* proc;

    if (parent != 0) {
        proc = Proc_StartBlocking(gUnknown_0859E804, parent);
    } else {
        proc = Proc_Start(gUnknown_0859E804, PROC_TREE_3);
    }

    proc->unk_2c = slot;
    proc->unk_30 = value;

    return proc;
}

u32 sub_8039200(u32 slot) {
    int clock;
    struct Dungeon currentDungeon;

    CpuCopy32(&gUnknown_030017A0.current, &currentDungeon, sizeof(struct Dungeon));

    clock = GetGameClock();
    SetGameClock(gUnknown_020038C4);

    sub_8037EB0(&currentDungeon);

    SetGameClock(clock);

    switch (slot) {
        case 0:
            return currentDungeon.unk_06;
        case 1:
            return currentDungeon.unk_00;
        case 2:
            return currentDungeon.unk_02;
        case 3:
            return currentDungeon.turnCount;
        case 4:
            return currentDungeon.mapTime;
    }

    return 0;
}

u32 sub_803929C(u32 slot) {

    switch (slot) {
        case 0:
            return gUnknown_030017A0.dungeon[gUnknown_030017A0.type].unk_06;
        case 1:
            return gUnknown_030017A0.dungeon[gUnknown_030017A0.type].unk_00;
        case 2:
            return gUnknown_030017A0.dungeon[gUnknown_030017A0.type].unk_02;
        case 3:
            return gUnknown_030017A0.dungeon[gUnknown_030017A0.type].turnCount;
        case 4:
            return gUnknown_030017A0.dungeon[gUnknown_030017A0.type].mapTime;
    }

    return 0;
}

s8 sub_8039360(u32 slot) {
    int clock;
    struct Dungeon currentDungeon;
    struct Dungeon* record;

    CpuCopy32(&gUnknown_030017A0.current, &currentDungeon, sizeof(struct Dungeon));

    clock = GetGameClock();
    SetGameClock(gUnknown_020038C4);

    sub_8037EB0(&currentDungeon);

    SetGameClock(clock);

    record = &gUnknown_030017A0.dungeon[gUnknown_030017A0.type];

    switch (slot) {
        case 0:
            return 1;
        case 1:
            if (currentDungeon.unk_00 > record->unk_00) {
                return 1;
            }

            break;
        case 2:
            if (record->unk_08 <= 0) {
                return 1;
            }

            if (currentDungeon.unk_02 < record->unk_02) {
                return 1;
            }

            break;
        case 3:
            if (record->unk_08 <= 0) {
                return 1;
            }

            if (currentDungeon.turnCount < record->turnCount) {
                return 1;
            }

            break;
        case 4:
            if (record->unk_08 <= 0) {
                return 1;
            }

            if (currentDungeon.mapTime < record->mapTime) {
                return 1;
            }

            break;
    }

    return 0;
}

extern int gUnknown_0859E82C[];
extern struct Struct0859E7D4 gUnknown_0859E838[];

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

    if (proc->unk_38 < 0x1E) {
        sub_800A950(&gUnknown_02003BE8, proc->unk_38 * 0x1000, pos);

        PutSpriteExt(
            4,
            pos[0] >> 4,
            ((u32)(pos[1]) << 0x13) >> 0x17,
            gUnknown_0859E79C,
            0x5000
        );
    } else {

        record = gUnknown_030017A0.dungeon[gUnknown_030017A0.type];

        val = record.unk_08;

        if (val < 100) {
            val++;
        }

        sub_8038588(
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
    int iVar2;

    proc->unk_30 = sub_803929C(0);
    iVar2 = sub_8039200(0);

    proc->unk_34 = iVar2 + proc->unk_30;
    proc->unk_3c = 2;

    PlaySoundEffect(0x74);

    return;
}

void sub_803958C(struct BMDifficultyProc* proc) {

    proc->unk_30++;

    if ((proc->unk_34 - proc->unk_30) > 100) {
        proc->unk_30++;
    }

    sub_8038588(
        &gUnknown_020038C8[1].text[0][8 - gUnknown_080D7FD0.record[0].numDigits],
        proc->unk_30,
        gUnknown_080D7FD0.record[0].numDigits,
        gUnknown_080D7FD0.record[0].x,
        gUnknown_080D7FD0.record[0].y,
        2
    );

    sub_8038588(
        &gUnknown_020038C8[0].text[0][8 - gUnknown_080D7FD0.current[0].numDigits],
        (proc->unk_34 - proc->unk_30) & 0xFFFF,
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
    proc->unk_2c = 1;
    return;
}

void sub_8039668(struct BMDifficultyProc* proc) {

    if (sub_8039360(proc->unk_2c) != 0) {
        sub_80391D0(proc->unk_2c, sub_8039200(proc->unk_2c), proc);
    }

    return;
}

void sub_8039690(struct BMDifficultyProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 5) {
        Proc_Goto(proc, 1);
    }

    return;
}
