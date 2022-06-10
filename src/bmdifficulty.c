#include "global.h"

#include "constants/characters.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"

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
    /* 00 */ struct Dungeon dungeon[2];
    /* 24 */ u8 type; // tower = 0, ruins = 1
};

struct Struct080D8018 {
    u16 eid;
    struct UnitDefinition* uDef;
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

// popup.s
void sub_8011728(ProcPtr, int);

// code.s
int sub_80A49A4(void);

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

        if (UNIT_IS_VALID(unit) && !(unit->state & 0x0001000C)) {
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
