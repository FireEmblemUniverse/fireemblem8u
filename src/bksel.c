#include "global.h"

#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"

#include "bksel.h"

extern u16 gBmFrameTmap0[];

extern u16 gUnknown_0200300C[8][16];
extern struct TextHandle gaBattleForecastTextStructs[6];

extern u16 gTSA_BattleForecastStandard[];
extern u16 gTSA_BattleForecastExtended[];

extern u16 gBattleForecast_x2x4Gfx[];
extern u16 gBattleForecast_x2x4Pal[];

extern struct HelpBoxInfo gHelpInfo_MbpHp;
extern struct HelpBoxInfo gHelpInfo_CbpHp;

struct BattleForecastProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ s8 x;
    /* 31 */ s8 y;
    /* 32 */ u8 frameKind;
    /* 33 */ s8 ready;
    /* 34 */ s8 needContentUpdate;
    /* 35 */ s8 side; // -1 is left, +1 is right
    /* 36 */ s8 unk_36;
    /* 38 */ struct TextHandle unitNameTextA;
    /* 40 */ struct TextHandle unitNameTextB;
    /* 48 */ struct TextHandle itemNameText;
    /* 50 */ s8 hitCountA;
    /* 51 */ s8 hitCountB;
    /* 52 */ s8 isEffectiveA;
    /* 53 */ s8 isEffectiveB;
};

struct UnknownBkSelProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C-0x29];

    /* 4C */ u16 unk_4C;
};


// ev_triggercheck.s
s8 sub_8084560(void);
void sub_808457C(void);


int GetBattleForecastPanelSide() {
    int x;

    x = (gBattleTarget.unit.xPos * 16) - gUnknown_0202BCB0.camera.x;

    if (x < 0x70) {
        return 1;
    }

    if (x > 0x70) {
        return -1;
    }

    return 0;
}

void InitBattleForecastIconPaletteBuffer() {
    int i;
    int j;

    LoadIconPalette(0, 3);

    for (i = 1; i < 16; ++i) {
        int color = gPaletteBuffer[3 * 0x10 + i];

        int red = RED_VALUE(color);

        int green = GREEN_VALUE(color);

        int blue = BLUE_VALUE(color);

        for (j = 0; j < 8; ++j) {

            gUnknown_0200300C[j][i] = ((blue << 10) + (green << 5)) + red;

            red += 3;
            if (red > 31) {
                red = 31;
            }

            green += 3;
            if (green > 31) {
                green = 31;
            }

            blue += 3;
            if (blue > 31) {
                blue = 31;
            }
        }
    }

    return;
}

void InitBattleForecastLabels() {

    static const int sBattleForecastLabelStringIndexes[] = {
        0x503, // Mt
        0x4F4, // Hit[.]
        0x501, // Crit
        0x4F3, // Atk[.]
        0x4EF, // Def[.]
        0x504, // AS
    };

    int i;

    for (i = 0; i < 6; ++i) {
        int textIndex;

        Text_Init(gaBattleForecastTextStructs + i, 4);

        textIndex = sBattleForecastLabelStringIndexes[i];

        Text_InsertString(
            gaBattleForecastTextStructs + i,
            GetStringTextCenteredPos(0x20, GetStringFromIndex(textIndex)),
            3,
            GetStringFromIndex(textIndex)
        );
    }

    return;
}

void PutBattleForecastUnitName(u16* dest, struct TextHandle* text, struct Unit* unit) {
    char* str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    int position = GetStringTextCenteredPos(48, str);

    Text_Clear(text);
    DrawTextInline(text, dest, 0, position, 0, str);

    return;
}

void PutBattleForecastItemName(u16* dest, struct TextHandle* text, int itemIdx) {
    char* str = GetItemName(itemIdx);
    int position = GetStringTextCenteredPos(56, str);

    Text_Clear(text);
    DrawTextInline(text, dest, 0, position, 0, str);

    return;
}

void BattleForecastHitCountUpdate(struct BattleUnit* battleUnit, u8* hitsCounter, int* usesCounter) {

    if (*usesCounter > 0) {
        *hitsCounter = *hitsCounter + 1;
        *usesCounter = *usesCounter - 1;

        if (battleUnit->weaponAttributes & IA_BRAVE) {
            *hitsCounter = *hitsCounter + 1;
            *usesCounter = *usesCounter - 1;
        }
    }

    return;
}

void InitBattleForecastBattleStats(struct BattleForecastProc* proc) {
    struct BattleUnit* buFirst;
    struct BattleUnit* buSecond;

    int usesA = GetItemUses(gBattleActor.weaponBefore);
    int usesB = GetItemUses(gBattleTarget.weaponBefore);

    s8 followUp = BattleGetFollowUpOrder(&buFirst, &buSecond);

    proc->hitCountA = 0;
    proc->isEffectiveA = 0;

    if ((gBattleActor.weapon != 0) || (gBattleActor.weaponBroke)) {
        BattleForecastHitCountUpdate(&gBattleActor, &proc->hitCountA, &usesA);

        if ((followUp != 0) && (buFirst == &gBattleActor)) {
            BattleForecastHitCountUpdate(buFirst, &proc->hitCountA, &usesA);
        }

        if (IsUnitEffectiveAgainst(&gBattleActor.unit, &gBattleTarget.unit) != 0) {
            proc->isEffectiveA = 1;
        }

        if (IsItemEffectiveAgainst(gBattleActor.weaponBefore, &gBattleTarget.unit) != 0) {
            proc->isEffectiveA = 1;
        }

        if ((gBattleActor.wTriangleHitBonus > 0) && (gBattleActor.weaponAttributes & IA_REVERTTRIANGLE) != 0) {
            proc->isEffectiveA = 1;
        }
    }

    proc->hitCountB = 0;
    proc->isEffectiveB = 0;

    if ((gBattleTarget.weapon != 0) || (gBattleTarget.weaponBroke)) {
        BattleForecastHitCountUpdate(&gBattleTarget, &proc->hitCountB, &usesB);
        if ((followUp != 0) && (buFirst == &gBattleTarget)) {
            BattleForecastHitCountUpdate(buFirst, &proc->hitCountB, &usesB);
        }

        if (IsUnitEffectiveAgainst(&gBattleTarget.unit, &gBattleActor.unit) != 0) {
            proc->isEffectiveB = 1;
        }

        if (IsItemEffectiveAgainst(gBattleTarget.weaponBefore, &gBattleActor.unit) != 0) {
            proc->isEffectiveB = 1;
        }

        if ((gBattleTarget.wTriangleHitBonus > 0) && (gBattleTarget.weaponAttributes & IA_REVERTTRIANGLE) != 0) {
            proc->isEffectiveB = 1;
        }
    }

    return;
}

void DrawBattleForecastContentsStandard(struct BattleForecastProc* proc) {
    int damage;
    int critRate;

    CallARM_FillTileRect(gUnknown_0200422C, gTSA_BattleForecastStandard, 0x1000);

    TileMap_FillRect(gBmFrameTmap0, 10, 15, 0);

    PutBattleForecastUnitName(gBmFrameTmap0 + 0x23, &proc->unitNameTextA, &gBattleActor.unit);

    PutBattleForecastUnitName(gBmFrameTmap0 + 0x161, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gBmFrameTmap0 + 0x1A1, &proc->itemNameText, gBattleTarget.weaponBefore);

    if ((gBattleTarget.weapon == 0) && (gBattleTarget.weaponBroke == 0)) {
        damage = -1;

        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    } else {
        damage = gBattleTarget.battleAttack - gBattleActor.battleDefense;

        if (damage < 0) {
            damage = 0;
        }
    }

    if (gBattleTarget.hpInitial > 99) {
        sub_8004BB4(gBmFrameTmap0 + 0x62, 2, 0xFF);
    } else {
        sub_8004BB4(gBmFrameTmap0 + 0x62, 2, gBattleTarget.hpInitial);
    }

    sub_8004BB4(gBmFrameTmap0 + 0xA2, 2, damage);
    sub_8004BB4(gBmFrameTmap0 + 0xA2 + 0x40, 2, gBattleTarget.battleEffectiveHitRate);
    sub_8004BB4(gBmFrameTmap0 + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveCritRate);

    damage = gBattleActor.battleAttack - gBattleTarget.battleDefense;

    if (GetItemIndex(gBattleActor.weapon) == ITEM_MONSTER_STONE) {
        damage = 0xFF;
    }

    if (damage < 0) {
        damage = 0;
    }

    critRate = gBattleActor.battleEffectiveCritRate;

    if (GetItemIndex(gBattleActor.weapon) == ITEM_MONSTER_STONE) {
        critRate = 0xFF;
    }

    if (critRate < 0) {
        critRate = 0;
    }

    if (gBattleActor.hpInitial > 99) {
        sub_8004BB4(gBmFrameTmap0 + 0xA8 - 0x40, 2, 0xFF);
    } else {
        sub_8004BB4(gBmFrameTmap0 + 0xA8 - 0x40, 2, gBattleActor.hpInitial);
    }

    sub_8004BB4(gBmFrameTmap0 + 0xA8, 2, damage);
    sub_8004BB4(gBmFrameTmap0 + 0xA8 + 0x40, 2, gBattleActor.battleEffectiveHitRate);
    sub_8004BB4(gBmFrameTmap0 + 0xA8 + 0x80, 2, critRate);

    sub_8004D5C(gBmFrameTmap0 + 0xA8 - 0x44, 3, 0x22, 0x23);

    Text_Draw(gaBattleForecastTextStructs, gBmFrameTmap0  + 0xA8 - 5);
    Text_Draw(gaBattleForecastTextStructs + 1, gBmFrameTmap0  + 0xA8 + 0x3B);
    Text_Draw(gaBattleForecastTextStructs + 2, gBmFrameTmap0  + 0xA8 + 0x7B);

    DrawIcon(gBmFrameTmap0 + 0xA8 + 0xBF, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gBmFrameTmap0 + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);

    return;
}

void DrawBattleForecastContentsExtended(struct BattleForecastProc* proc) {

    CallARM_FillTileRect(gUnknown_0200422C, gTSA_BattleForecastExtended, 0x1000);

    TileMap_FillRect(gBmFrameTmap0, 10, 19, 0);

    PutBattleForecastUnitName(gBmFrameTmap0 + 0x23, &proc->unitNameTextA, &gBattleActor.unit);
    PutBattleForecastUnitName(gBmFrameTmap0 + 0x1E1, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gBmFrameTmap0 + 0x221, &proc->itemNameText, gBattleTarget.weaponBefore);

    if ((gBattleTarget.weapon == 0) && (!gBattleTarget.weaponBroke)) {
        gBattleTarget.battleAttack = 0xFF;
        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    }

    if (gBattleTarget.hpInitial > 99) {
        sub_8004BB4(gBmFrameTmap0 + 0x62, 2, 0xFF);
    } else {
        sub_8004BB4(gBmFrameTmap0 + 0x62, 2, gBattleTarget.hpInitial);
    }

    sub_8004BB4(gBmFrameTmap0 + 0xA2, 2, gBattleTarget.battleAttack);
    sub_8004BB4(gBmFrameTmap0 + 0xA2 + 0x40, 2, gBattleTarget.battleDefense);
    sub_8004BB4(gBmFrameTmap0 + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveHitRate);
    sub_8004BB4(gBmFrameTmap0 + 0xA2 + 0xC0, 2, gBattleTarget.battleEffectiveCritRate);
    sub_8004BB4(gBmFrameTmap0 + 0xA2 + 0x100, 2, gBattleTarget.battleSpeed);

    if (gBattleActor.hpInitial > 99) {
        sub_8004BB4(gBmFrameTmap0 + 0xA2 - 0x3A, 2, 0xFF);
    } else {
        sub_8004BB4(gBmFrameTmap0 + 0xA2 - 0x3A, 2, gBattleActor.hpInitial);
    }

    sub_8004BB4(gBmFrameTmap0 + 0xA8, 2, gBattleActor.battleAttack);
    sub_8004BB4(gBmFrameTmap0 + 0xA8 + 0x40, 2, gBattleActor.battleDefense);
    sub_8004BB4(gBmFrameTmap0 + 0xA8 + 0x80, 2, gBattleActor.battleEffectiveHitRate);
    sub_8004BB4(gBmFrameTmap0 + 0xA8 + 0xC0, 2, gBattleActor.battleEffectiveCritRate);
    sub_8004BB4(gBmFrameTmap0 + 0xA8 + 0x100, 2, gBattleActor.battleSpeed);

    sub_8004D5C(gBmFrameTmap0 + 0xA8 - 0x44, 3, 0x22, 0x23);

    Text_Draw(gaBattleForecastTextStructs + 3, gBmFrameTmap0 + 0xA8 - 5);
    Text_Draw(gaBattleForecastTextStructs + 4, gBmFrameTmap0 + 0xA8 + 0x3B);
    Text_Draw(gaBattleForecastTextStructs + 1, gBmFrameTmap0 + 0xA8 + 0x7B);
    Text_Draw(gaBattleForecastTextStructs + 2, gBmFrameTmap0 + 0xA8 + 0xBB);
    Text_Draw(gaBattleForecastTextStructs + 5, gBmFrameTmap0 + 0xA8 + 0xFB);

    DrawIcon(gBmFrameTmap0 + 0xA8 + 0x13F, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gBmFrameTmap0 + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);

    return;
}

void DrawBattleForecastContents(struct BattleForecastProc* proc) {

    proc->unk_2C = 0;
    proc->needContentUpdate = 0;

    switch (proc->frameKind) {
        case 1:
            InitBattleForecastBattleStats(proc);
            DrawBattleForecastContentsStandard(proc);
            break;

        case 2:
            InitBattleForecastBattleStats(proc);
            DrawBattleForecastContentsExtended(proc);
            break;
    }

    return;
}

const u16* GetFactionBattleForecastFramePalette(int faction) {

    switch (faction) {
        case FACTION_BLUE:
            return gUiFramePaletteA;

        case FACTION_RED:
            return gUiFramePaletteB;

        case FACTION_GREEN:
            return gUiFramePaletteC;

        case FACTION_PURPLE:
            return gUiFramePaletteD;
    }
}

void InitBattleForecastFramePalettes() {

    CopyToPaletteBuffer(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleActor.unit)), 0x20, 0x20);

    if (gBattleTarget.unit.index != 0) {
        CopyToPaletteBuffer(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleTarget.unit)), 0x40, 0x20);
    } else {
        CopyToPaletteBuffer(GetFactionBattleForecastFramePalette(FACTION_PURPLE), 0x40, 0x20);
    }

    return;
}

void BattleForecast_Init(struct BattleForecastProc* proc) {

    CopyDataWithPossibleUncomp(gBattleForecast_x2x4Gfx, gUnknown_02020188);
    CopyTileGfxForObj(gUnknown_02020188, (void*)0x06015D00, 4, 2);
    CopyToPaletteBuffer(gBattleForecast_x2x4Pal, 0x240, 0x20);

    sub_8003D20();

    ResetIconGraphics_();

    InitBattleForecastIconPaletteBuffer();

    InitBattleForecastLabels();

    Text_Allocate(&proc->unitNameTextA, 6);
    Text_Allocate(&proc->unitNameTextB, 6);
    Text_Allocate(&proc->itemNameText, 7);

    BG_SetPosition(1, 0, -1);

    proc->ready = 1;

    return;
}

void BattleForecast_OnEnd() {
    UnpackUiFrameBuffered(-1);
    return;
}

void PutBattleForecastTilemaps(struct BattleForecastProc* proc) {

    int height = proc->frameKind == 1 ? 16 : 20;

    if (proc->side < 0) {
        TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer, 10, height);
        TileMap_CopyRect(gUnknown_0200422C, gBG1TilemapBuffer, 10, height);
    } else {
        TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + 20, 10, height);
        TileMap_CopyRect(gUnknown_0200422C, gBG1TilemapBuffer + 20, 10, height);
    }

    BG_EnableSyncByMask(3);

    return;
}

void PutBattleForecastWeaponTriangleArrows(struct BattleForecastProc* proc) {
    int wtArrowA = 0;
    int wtArrowB = 0;

    if (gBattleActor.wTriangleHitBonus > 0) {
        wtArrowA = 1;
    }

    if (gBattleActor.wTriangleHitBonus < 0) {
        wtArrowA = 2;
    }

    if (gBattleTarget.wTriangleHitBonus > 0) {
        wtArrowB = 1;
    }

    if (gBattleTarget.wTriangleHitBonus < 0) {
        wtArrowB = 2;
    }

    if (wtArrowB != 0) {
        sub_8015BD4((proc->x + 8) * 8 + 3, (proc->y + 11) * 8, wtArrowB == 2 ? 1 : 0);
    }

    if (wtArrowA != 0) {
        sub_8015BD4((proc->x + 2) * 8 + 3, (proc->y + 1) * 8, wtArrowA == 2 ? 1 : 0);
    }

    return;
}

void PutBattleForecastMultipliers(struct BattleForecastProc* proc) {

    int angle = (proc->unk_2C * 4) & 0xFF;

    int x = SIN(angle ) * 4 >> 12;
    int y = COS(angle) * 2 >> 12;

    x += proc->x * 8 - 3;
    y += proc->y * 8;

    if (proc->hitCountA > 1) {
        PutSprite(4, x + 72, y + 40, gObject_16x16, proc->hitCountA + 0x22E6);
    }

    if (proc->hitCountB > 1) {
        PutSprite(4, x + 24, y + 40, gObject_16x16, proc->hitCountB + 0x22E6);
    }

    return;
}

void UpdateBattleForecastEffectivenessPalettes(struct BattleForecastProc* proc) {

    static u8 palAnimLut[] = {
        0, 1, 1, 2, 3, 4, 5, 5,
        4, 4, 4, 3, 3, 3, 2, 2,
        2, 2, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
    };

    int palAnim;

    if (proc->isEffectiveA != 0) {
        palAnim = palAnimLut[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    CopyToPaletteBuffer(gUnknown_0200300C[palAnim], 0x60, 0x20);

    if (proc->isEffectiveB != 0) {
        palAnim = palAnimLut[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    CopyToPaletteBuffer(gUnknown_0200300C[palAnim], 0x80, 0x20);

    return;
}

void BattleForecast_LoopDisplay(struct BattleForecastProc* proc) {

    proc->unk_2C++;

    if (proc->needContentUpdate) {

        int side = GetBattleForecastPanelSide();

        if ((side != 0) && (side != proc->side)) {
            Proc_Break(proc);
            return;
        }

        DrawBattleForecastContents(proc);
        PutBattleForecastTilemaps(proc);
        InitBattleForecastFramePalettes();
    }

    if (proc->frameKind == 1) {
        PutBattleForecastWeaponTriangleArrows(proc);
        PutBattleForecastMultipliers(proc);
        UpdateBattleForecastEffectivenessPalettes(proc);
    }

    return;
}

void BattleForecast_OnNewBattle(struct BattleForecastProc* proc) {
    DrawBattleForecastContents(proc);

    proc->side = GetBattleForecastPanelSide();
    proc->unk_36 = 0;

    if (proc->side < 0) {
        proc->x = 0;
    } else {
        proc->x = 20;
    }

    proc->y = 0;

    InitBattleForecastFramePalettes();

    return;
}

void BattleForecast_LoopSlideIn(struct BattleForecastProc* proc) {
    static s8 offsetLut[] = { 6, 8, 9, 10 };
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = offsetLut[proc->unk_36];

    if (proc->side < 0) {
        TileMap_CopyRect(gBmFrameTmap0 + (10 - offset), gBG0TilemapBuffer, offset, height);
        TileMap_CopyRect(gUnknown_0200422C + (10 - offset), gBG1TilemapBuffer, offset, height);
    } else {
        TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + (30 - offset), offset, height);
        TileMap_CopyRect(gUnknown_0200422C, gBG1TilemapBuffer + (30 - offset), offset, height);
    }

    proc->unk_36++;

    if ((u8)proc->unk_36 == 4) {
        proc->unk_36 = 0;
        Proc_Break(proc);
    }

    return;
}

void BattleForecast_LoopSlideOut(struct BattleForecastProc* proc) {
    static s8 offsetLut[] = { 9, 8, 6, 0 };
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = offsetLut[proc->unk_36];

    if (proc->side < 0) {
        TileMap_CopyRect(gBmFrameTmap0 + (10 - offset), gBG0TilemapBuffer, offset, height);
        TileMap_CopyRect(gUnknown_0200422C + (10 - offset), gBG1TilemapBuffer, offset, height);
    } else {
        TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + (30 - offset), offset, height);
        TileMap_CopyRect(gUnknown_0200422C, gBG1TilemapBuffer + (30 - offset), offset, height);
    }

    proc->unk_36++;

    if ((u8)proc->unk_36 == 4) {
        proc->unk_36 = 0;
        Proc_Break(proc);
    }

    return;
}

s8 MapEventEngineExists_() {
    return EventEngineExists();
}

void sub_80372E4() {

    if (sub_8084560() == 1) {
        SetKeyStatus_IgnoreMask(GetKeyStatus_IgnoreMask() & ~(A_BUTTON));
        sub_808457C();
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_BKSEL[] = {
    PROC_NAME("BKSEL"),

    PROC_SET_END_CB(BattleForecast_OnEnd),

    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0),

    PROC_CALL(BattleForecast_Init),

PROC_LABEL(0),
    PROC_WHILE(MapEventEngineExists_),
    PROC_CALL(BattleForecast_OnNewBattle),

    PROC_REPEAT(BattleForecast_LoopSlideIn),

    PROC_CALL(sub_80372E4),

    PROC_REPEAT(BattleForecast_LoopDisplay),
    PROC_REPEAT(BattleForecast_LoopSlideOut),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_REPEAT(BattleForecast_LoopSlideOut),

    PROC_END,
};

void NewBattleForecast() {

    struct BattleForecastProc* proc;

    if (gRAMChapterData.cfgBattleForecastType == 2) {
        sub_8003D20();
        return;
    }

    proc = Proc_Start(gProcScr_BKSEL, PROC_TREE_3);
    proc->ready = 0;

    if (sub_8084560() == 1) {
        SetKeyStatus_IgnoreMask(GetKeyStatus_IgnoreMask() | A_BUTTON);
    }

    switch (gRAMChapterData.cfgBattleForecastType) {
        case 0:
            proc->frameKind = 1;
            break;

        case 1:
            proc->frameKind = 2;
            break;
    }

    BmMapFill(gBmMapMovement, -1);

    return;
}

void UpdateBattleForecastContents() {
    struct BattleForecastProc* proc = Proc_Find(gProcScr_BKSEL);

    if (proc == 0) {
        return;
    }

    if (proc->ready != 0) {
        proc->needContentUpdate = 1;
    }

    return;
}

void CloseBattleForecast() {
    struct BattleForecastProc* proc = Proc_Find(gProcScr_BKSEL);

    if (proc == 0) {
        return;
    }

    if (proc->ready == 0) {
        ClearBg0Bg1();
        Proc_End(proc);
        return;
    }

    Proc_Goto(proc, 1);

    return;
}

int StartBattleForecastHelpBox(ProcPtr parent) {
    int x;

    struct BattleForecastProc* proc = Proc_Find(gProcScr_BKSEL);
    if (proc == 0) {
        return 0;
    }

    if (proc->needContentUpdate != 0) {
        return 0;
    }

    if (proc->side < 0) {
        x = 0;
    } else {
        x = 20;
    }

    LoadDialogueBoxGfx(0, -1);

    switch (proc->frameKind) {
        case 1:
            StartMovingHelpBoxExt(&gHelpInfo_MbpHp, parent, x, 0);
            break;

        case 2:
            StartMovingHelpBoxExt(&gHelpInfo_CbpHp, parent, x, 0);
            break;
    }

    return 0;
}


u16 sub_803746C(int wt, s8 isEffective) {

    static u16 lut[] = {
        0x56B, 0x56D, 0x56F, 0x56C, 0x56E, 0x570,
    };

    int idx = isEffective != 0 ? 3 : 0;

    if (wt < 0) {
        idx += 2;
    }

    if (wt > 0) {
        idx += 1;
    }

    return lut[idx];
}

void sub_8037494(struct UnknownBkSelProc* proc) {
    struct BattleForecastProc* proc2 = Proc_Find(gProcScr_BKSEL);
    proc->unk_4C = sub_803746C(gBattleActor.wTriangleHitBonus, proc2->isEffectiveA);

    return;
}

void sub_80374C4(struct UnknownBkSelProc* proc) {
    struct BattleForecastProc* proc2 = Proc_Find(gProcScr_BKSEL);
    proc->unk_4C = sub_803746C(gBattleTarget.wTriangleHitBonus, proc2->isEffectiveB);

    return;
}
