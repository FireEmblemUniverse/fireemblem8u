#include "global.h"

#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "sallycursor.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"

#include "uichapterstatus.h"

#include "constants/characters.h"

struct ChapterStatusProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 restoreStateOnExit;
    /* 2A */ u8 focusUnitOnExit;
    /* 2B */ u8 timesCompleted;
    /* 2C */ u8 numObjectiveTextLines;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unitIndex;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 numAllyUnits;
    /* 31 */ u8 numEnemyUnits;

    /* 34 */ struct Unit* units[2];

    /* 3C */ u16 unk_3c;
    /* 3E */ u8 helpTextActive;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 unk_40;

    /* 41 */ u8 _pad[0x64-0x41];

    /* 64 */ u16 unk_64;
};

extern struct TextHandle gChapterStatusText[2];

struct Struct2004BBC {
    struct TextHandle th;
    struct Font font;
};

extern struct Struct2004BBC gUnknown_02004BBC;

u16 sSprite_08A01AA4[] = {
    1,
    0x0000, 0x4000, 0x4740
};

u16 sSprite_08A01AAC[] = {
    2,
    0x4000, 0x4000, 0x4754,
    0x4000, 0x0020, 0x4758
};

u16 sSprite_08A01ABA[] = {
    2,
    0x4000, 0x4000, 0x475A,
    0x4000, 0x0020, 0x475E
};

u16 sSprite_08A01AC8[] = {
    2,
    0x4000, 0x8000, 0x4743,
    0x4000, 0x8020, 0x4747
};

u16 sSprite_08A01AD6[] = {
    1,
    0x4000, 0x8000, 0x474B
};

u16 sSprite_08A01ADE[] = {
    1,
    0x4000, 0x8000, 0x474F
};

u16 sSprite_08A01AE6[] = {
    8,
    0x4000, 0x0000, 0x0018,
    0x4000, 0x0010, 0x0019,
    0x4000, 0x0020, 0x0019,
    0x4000, 0x1030, 0x0018,
    0x4008, 0x2000, 0x0018,
    0x4008, 0x2010, 0x0019,
    0x4008, 0x2020, 0x0019,
    0x4008, 0x3030, 0x0018
};

u16 sSprite_08A01B18[] = {
    3,
    0x4000, 0xC000, 0x0000,
    0x4000, 0xC040, 0x0008,
    0x4000, 0xC080, 0x0010
};

u16 sSprite_08A01B2C[] = {
    2,
    0x4000, 0xC000, 0x0090,
    0x8000, 0x8040, 0x0098
};

struct TextBatch gTextBatch_ChapterStatus[] = {
    { gChapterStatusText + 0, 12 },
    { gChapterStatusText + 1, 12 },

    { }, // end
};

void ChapterStatus_Init(struct ChapterStatusProc* proc);
void ChapterStatus_DrawText(struct ChapterStatusProc* proc);
void sub_808E3D4(void);
void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc* proc);
void ChapterStatus_OnEnd(struct ChapterStatusProc* proc);
void ChapterStatus_MaybeFocusLeaderUnit(struct ChapterStatusProc* proc);

struct ProcCmd CONST_DATA gProcScr_ChapterStatusScreen[] = {
    PROC_CALL(AddSkipThread2),

    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(ChapterStatus_Init),
    PROC_CALL(ChapterStatus_DrawText),
    PROC_CALL(sub_808E3D4),

PROC_LABEL(0),
    PROC_REPEAT(ChapterStatus_LoopKeyHandler),

PROC_LABEL(1),
    PROC_CALL(sub_8013F58),
    PROC_SLEEP(0),
    PROC_CALL(EndBG3Slider),

    PROC_CALL(ChapterStatus_OnEnd),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(sub_8013DA4),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_CALL(ChapterStatus_MaybeFocusLeaderUnit),
    PROC_SLEEP(0),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_08A01C04[] = {
    PROC_SLEEP(0),

    PROC_CALL(ChapterStatus_Init),
    PROC_CALL(ChapterStatus_DrawText),

    PROC_SLEEP(0),
    PROC_CALL(sub_808E3D4),
    PROC_CALL(sub_8013FD8),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_REPEAT(ChapterStatus_LoopKeyHandler),

PROC_LABEL(1),
    PROC_CALL(sub_8013F58),
    PROC_SLEEP(0),

    PROC_CALL(EndBG3Slider),

    PROC_CALL(ChapterStatus_OnEnd),

    PROC_END,
};

u16 sSprite_08A01C7C[] = {
    6,
    0x4000, 0x8000, 0x0000,
    0x4000, 0x8020, 0x0004,
    0x4000, 0x8040, 0x0008,
    0x4000, 0x8060, 0x000C,
    0x4000, 0x8080, 0x0010,
    0x4000, 0x80A0, 0x0014
};

void sub_808E7B4(struct ChapterStatusProc* proc);
void sub_808E818(struct ChapterStatusProc* proc);

struct ProcCmd CONST_DATA gProcScr_08A01CA4[] = {
    PROC_SLEEP(0),

    PROC_CALL(sub_808E7B4),
    PROC_REPEAT(sub_808E818),

    PROC_END,
};


struct Unit* GetEnemyBossUnit() {
    int i;

    struct Unit* unit = NULL;

    switch (gRAMChapterData.chapterIndex) {
        case 0x0D:
            unit = GetUnitFromCharId(CHARACTER_AIAS);
            break;

        case 0x0F:
            unit = GetUnitFromCharId(CHARACTER_VALTER);
            break;

        case 0x1C:
            unit = GetUnitFromCharId(CHARACTER_CAELLACH);
            break;

        case 0x14:
        case 0x21:
            unit = GetUnitFromCharId(CHARACTER_MORVA);
            break;
    }

    if (unit) {
        return unit;
    }

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS)) {
            continue;
        }

        return unit;
    }

    return NULL;
}

int CountEnemyBossUnits() {
    int count;
    int i;

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS)) {
            continue;
        }

        count++;
    }

    return count;
}

int CountUnitsByFaction(int faction) {
    int count;
    int i;

    count = 0;

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & US_UNAVAILABLE) {
            continue;
        }

        count++;
    }

    return count;
}

void sub_808DE38(struct ChapterStatusProc* proc) {
    u16* palPtr;
    u16 base;
    int mod;

    base = gUnknown_08A2E8F0[0x2F];
    palPtr = gUnknown_02022BA4;

    mod = RED_VALUE(proc->unk_40 >> 1);

    proc->unk_40++;

    if (mod > 16) {
        mod = 16 - (mod & 0xF);
    }

    if (proc->unitIndex != proc->unk_2f) {
        proc->unk_2f = proc->unitIndex;
        proc->unk_40 = 0;
    }

    *palPtr = ((((base & 0x1F) * (16 - mod)) >> 4) & 0x1F) +
        ((((base & (0x1F << 5)) * (16 - mod)) >> 4) & (0x1F << 5)) +
        ((((base & (0x1F << 10)) * (16 - mod)) >> 4) & (0x1F << 10));

    EnablePaletteSync();

    return;
}

char* SplitObjectiveTextOnNewline(char* str) {
    if (str == 0) {
        return NULL;
    }

    if (*str == 0) {
        return NULL;
    }

    while (1) {
        char c = *str;
        u32 width;

        if (c != 0) {
            if (c == 1) {
                return str + 1;
            }
        } else {
            return NULL;
        }

        str = GetCharTextWidth(str, &width);
    }
}

void sub_808DEF0(s8 flag) {

    if (flag) {
        CpuFastFill16(0, gUnknown_02022C48, 0x20);
        EnablePaletteSync();
    } else {
        SetupMapSpritesPalettes();
    }

    return;
}

void ChapterStatus_Init(struct ChapterStatusProc* proc) {
    int i;

    SetupBackgrounds(0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 2;

    Font_InitForUIDefault();
    LoadUiFrameGraphics();

    proc->unk_3c = 0;
    proc->helpTextActive = 0;
    proc->focusUnitOnExit = 0;

    BG_SetPosition(0, -2, -4);
    BG_SetPosition(1, 0, -2);
    BG_SetPosition(2, 0, -36);
    BG_SetPosition(3, 0, 0);

    ClearBg0Bg1();

    CopyToPaletteBuffer(gUiFramePaletteA, 0x40, 0x60);
    CopyDataWithPossibleUncomp(gUnknown_08A2E5EC, (void*)(BG_VRAM + 0x5800));
    CopyDataWithPossibleUncomp(gUnknown_08A2E4C4, gUnknown_02020188);
    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_02020188, 0x1000);

    CopyDataWithPossibleUncomp(gUnknown_08A2D32C, OBJ_VRAM0 + 0x3000);
    CopyToPaletteBuffer(gUnknown_08A2E1B8, 0x300, 0x40);

    CopyDataWithPossibleUncomp(gUnknown_08A2E1F8, OBJ_VRAM0 + 0x3300);

    SetDefaultColorEffects();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->unk_2d = 0;
    proc->unitIndex = 0;
    proc->unk_40 = 0;

    proc->units[0] = GetUnitFromCharId(GetPlayerLeaderUnitId());

    proc->numAllyUnits = CountUnitsByFaction(FACTION_BLUE);

    proc->timesCompleted = sub_80A4BB0();

    if (proc->units[0]->state & US_UNSELECTABLE) {
        proc->units[0]->state &= ~US_UNSELECTABLE;
        proc->restoreStateOnExit = 1;
    } else {
        proc->restoreStateOnExit = 0;
    }

    if (CountEnemyBossUnits() != 0) {
        proc->units[1] = GetEnemyBossUnit();
    } else {
        proc->units[1] = NULL;
    }

    proc->numEnemyUnits = CountUnitsByFaction(FACTION_RED);

    SetupMapSpritesPalettes();

    for (i = 0; i < 2; i++) {
        if (proc->units[i] == 0) {
            continue;
        }

        SMS_RegisterUsage(GetUnitSMSId(proc->units[i]));
    }

    SMS_FlushIndirect();

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 72;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    sub_8086BB8(proc, 0, 14);

    CopyToPaletteBuffer(gUnknown_08B1754C, 0x1C0, 0x40);

    StartHelpPromptSprite(200, 18, 2, (struct Proc*)proc);

    Proc_Start(gProcScr_08A01CA4, proc);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

void DrawChapterStatusTextForUnit(struct Unit* unit) {
    struct Struct2004BBC* ptr = &gUnknown_02004BBC;

    TileMap_FillRect(gBG0TilemapBuffer + 0x139, 3, 3, 0);

    SetFont(&ptr->font);
    SetFontGlyphSet(0);

    Text_80046B4(&ptr->th, 0);

    if (unit) {
        if (unit->state & (US_UNDER_A_ROOF | US_BIT9)) {
            Text_SetColorId(&ptr->th, 2);

            Text_SetXCursor(&ptr->th, 130);
            Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

            Text_SetXCursor(&ptr->th, 162);
            Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

            Text_SetXCursor(&ptr->th, 186);
            Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

            sub_808DEF0(1);
        } else {
            char* str;

            Text_SetColorId(&ptr->th, 0);

            str = GetStringFromIndex(unit->pCharacterData->nameTextId);
            Text_SetXCursor(&ptr->th, GetStringTextCenteredPos(0x30, str));
            Text_AppendString(&ptr->th, str);

            Text_SetColorId(&ptr->th, 2);

            Text_SetXCursor(&ptr->th, 138);
            Text_AppendNumberOr2Dashes(&ptr->th, unit->level);

            if (GetUnitCurrentHp(unit) >= 100) {
                Text_SetXCursor(&ptr->th, 162);
                Text_AppendString(&ptr->th, GetStringFromIndex(0x535));
            } else {
                Text_SetXCursor(&ptr->th, 170);
                Text_AppendNumberOr2Dashes(&ptr->th, GetUnitCurrentHp(unit));
            }

            if (GetUnitMaxHp(unit) >= 100) {
                Text_SetXCursor(&ptr->th, 186);
                Text_AppendString(&ptr->th, GetStringFromIndex(0x535));
            } else {
                Text_SetXCursor(&ptr->th, 194);
                Text_AppendNumberOr2Dashes(&ptr->th, GetUnitMaxHp(unit));
            }

            sub_8005988(GetUnitMiniPortraitId(unit), gBG0TilemapBuffer + 0x139, 0x280, 4, 0);

            sub_808DEF0(0);
        }
    } else {
        Text_SetColorId(&ptr->th, 2);

        Text_SetXCursor(&ptr->th, 130);
        Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

        Text_SetXCursor(&ptr->th, 162);
        Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

        Text_SetXCursor(&ptr->th, 186);
        Text_AppendString(&ptr->th, GetStringFromIndex(0x535));
    }

    Text_SetColorId(&ptr->th, 0);

    Text_SetXCursor(&ptr->th, 179);
    Text_AppendString(&ptr->th, GetStringFromIndex(0x539));

    SetFont(0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    sub_8001ED0(0, 0, 1, 0, 0);

    sub_8001F0C(0, 0, 0, 1, 0);

    SetSpecialColorEffectsParameters(1, 13, 3, 0);

    sub_8001F48(0);

    sub_8001F64(0);

    return;
}

void sub_808E3D4() {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

void ChapterStatus_SetupFont(ProcPtr proc) {
    CopyToPaletteBuffer(gUnknown_0859EF00, 0x340, 0x20);

    InitSomeOtherGraphicsRelatedStruct(&gUnknown_02004BBC.font, OBJ_VRAM0 + 0x7800, 0x1A);

    SetFont(&gUnknown_02004BBC.font);
    SetFontGlyphSet(0);

    Text_Init3(&gUnknown_02004BBC.th);

    SetFont(0);

    return;
}

void DrawChapterStatusStatValues() {
    TileMap_FillRect(gBG0TilemapBuffer + 0x1C0, 15, 6, 0);

    sub_8004B88(gBG0TilemapBuffer + 0x1C0 + 0xC, 2, gRAMChapterData.chapterTurnNumber);

    sub_8004B88(gBG0TilemapBuffer + 0x1C0 + 0x4B, 2, GetPartyGoldAmount());

    sub_8004B0C(gBG0TilemapBuffer + 0x1C0 + 0x4C, 3, 30);

    sub_8004D5C(gBG0TilemapBuffer + 0x1C0 - 0x8F, 3, 36, 37);

    sub_8004D5C(gBG0TilemapBuffer + 0x1C0 - 0x4F, 3, 34, 35);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

void ChapterStatus_DrawText(struct ChapterStatusProc* proc) {
    char* str;

    InitTextBatch(gTextBatch_ChapterStatus);

    ChapterStatus_SetupFont(proc);

    DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);

    sub_8004B88(gBG1TilemapBuffer + 0xA4, 2, proc->numAllyUnits);

    if (gRAMChapterData.chapterVisionRange != 0) {
        sub_8004B0C(gBG1TilemapBuffer + 0xA4 + 7, 2, 20);
        sub_8004B0C(gBG1TilemapBuffer + 0xA4 + 8, 2, 20);
    } else {
        sub_8004B88(gBG1TilemapBuffer + 0xA4 + 7, 2, proc->numEnemyUnits);
    }

    proc->numObjectiveTextLines = 1;

    str = GetStringFromIndex(
        GetChapterThing() != 2 ?
            GetROMChapterStruct(gRAMChapterData.chapterIndex)->statusObjectiveTextId
            : 0x1C0 // TODO: Defeat all monsters[.]
    );

    Text_InsertString(gChapterStatusText, GetStringTextCenteredPos(0x60, str), 0, str);

    str = SplitObjectiveTextOnNewline(str);

    if (str != 0) {
        Text_InsertString(gChapterStatusText + 1, GetStringTextCenteredPos(0x60, str), 0, str);
        proc->numObjectiveTextLines = 2;
    }

    if (proc->numObjectiveTextLines == 2) {
        Text_Draw(gChapterStatusText + 0, gBG0TilemapBuffer + 0x141);
        Text_Draw(gChapterStatusText + 1, gBG0TilemapBuffer + 0x181);
    } else {
        Text_Draw(gChapterStatusText + 0, gBG0TilemapBuffer + 0x161);
    }

    if (proc->timesCompleted != 0) {
        if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME)) {
            DrawDecNumber(gBG0TilemapBuffer + 0x1A, 0, proc->timesCompleted + 1);
        }
    }

    DrawChapterStatusStatValues();

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc* proc) {
    int previous = proc->unitIndex;

    proc->helpTextActive = 0;

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->helpTextActive = 1;
        sub_808DCAC(proc);

        return;

    } else if (gKeyStatusPtr->newKeys & A_BUTTON) {

        if ((proc->units[proc->unitIndex]) && !(proc->units[proc->unitIndex]->state & (US_UNDER_A_ROOF | US_BIT9))) {
            SetLastStatScreenUid(proc->units[proc->unitIndex]->index);
            proc->focusUnitOnExit = 1;
        }

        PlaySoundEffect(0x6A);
        Proc_Goto(proc, 1);

        return;

    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x6B);

        return;

    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && (proc->unitIndex != 0)) {
        proc->unitIndex--;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && (proc->unitIndex == 0)) {
        proc->unitIndex++;
    }

    if (proc->unitIndex != previous) {
        PlaySoundEffect(0x66);
        DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);
    }

    return;
}

void ChapterStatus_OnEnd(struct ChapterStatusProc* proc) {
    Proc_EndEach(gProcScr_08A01CA4);

    EndHelpPromptSprite();

    if (proc->restoreStateOnExit != 0) {
        proc->units[0]->state |= US_UNSELECTABLE;
    }

    return;
}

void ChapterStatus_MaybeFocusLeaderUnit(struct ChapterStatusProc* proc) {

    if (proc->focusUnitOnExit != 0) {
        Proc_StartBlocking(gProcScr_ADJUSTSFROMXI, proc);
    }

    return;
}

void NewChapterStatusScreen(ProcPtr proc) {
    struct ChapterStatusProc* child;

    if (proc != 0) {
        child = Proc_StartBlocking(gProcScr_ChapterStatusScreen, proc);
        child->unk_3f = 0;
    } else {
        child = Proc_Start(gProcScr_ChapterStatusScreen, PROC_TREE_3);
        child->unk_3f = 0;
    }

    return;
}

void sub_808E79C(ProcPtr proc) {
    struct ChapterStatusProc* child;

    child = Proc_StartBlocking(gProcScr_08A01C04, proc);
    child->unk_3f = 1;

    return;
}

void sub_808E7B4(struct ChapterStatusProc* proc) {
    LoadObjUIGfx();

    CopyToPaletteBuffer(gUnknown_08A2E4A4, 0x280, 0x20);
    CopyToPaletteBuffer(gUnknown_08A2E8F0, 0x2E0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A2E214, OBJ_VRAM0 + 0x6800);

    proc->unk_64 = 0;

    sub_80895B4(0x80, 0x13);

    sub_8089624(0xB80, sub_808979C(&gRAMChapterData));

    return;
}

void sub_808E818(struct ChapterStatusProc* proc) {
    int i;

    struct ChapterStatusProc* parent = proc->proc_parent;

    PutSprite(4, 4, 3, sSprite_08A01B18, 0x8580);
    PutSprite(4, 150, 124, sSprite_08A01B2C, 0x9580);

    if (parent->unk_3f == 0) {
        PutSprite(4, 4, 11, sSprite_08A01C7C, 0x3780);
    }

    PutSprite(4, parent->unitIndex * 56, 44, sSprite_08A01AE6, 0x7580);

    PutSprite(4, 8, 37, sSprite_08A01AAC, 0);
    PutSprite(4, 64, 37, sSprite_08A01ABA, 0);
    PutSprite(4, 18, 115, sSprite_08A01AD6, 0);
    PutSprite(4, 18, 131, sSprite_08A01ADE, 0);
    PutSprite(4, 28, 67, sSprite_08A01AC8, 0);

    for (i = 0; i < 2; i++) {
        PutSprite(4, 160 + (i * 32), 60, gObject_32x16, 0xA3C0 + (i * 4));
    }

    PutSprite(4, 180, 75, gObject_32x16, 0xA3D0);

    for (i = 0; i < 2; i++) {
        PutSprite(4, 156 + (i * 32), 91, gObject_32x16, 0xA3D4 + (i * 4));
    }

    sub_8004C68(gBG0TilemapBuffer + 0x213, 2, GetGameClock(), 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    if (parent->units[parent->unitIndex]) {
        sub_8027B60(4, 136, 61, parent->units[parent->unitIndex]);
    }

    SMS_FlushDirect();

    if (parent->timesCompleted != 0) {
        if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME)) {
            PutSprite(4, 219, 3, sSprite_08A01AA4, gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME);
        }
    }

    sub_808DE38(parent);

    return;
}
