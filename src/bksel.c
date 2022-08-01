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

extern u16 gUnknown_0200300C[8][16];
extern struct TextHandle gUnknown_02002FDC[6];
extern int gUnknown_080D7FB0[6];

extern u16 gUnknown_0200422C[];
extern u16 gUnknown_085A09A8[];
extern u16 gBmFrameTmap0[];

extern u16 gUnknown_085A0AEC[];

extern u16 gUnknown_085A0C80[];
extern u16 gUnknown_085A0D2C[];

extern u16 gUnknown_0200422C[];

extern struct HelpBoxInfo gHelpInfo_MbpHp;
extern struct HelpBoxInfo gHelpInfo_CbpHp;

struct BattlePreviewProc {
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


int sub_80364D8() {
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

void sub_803650C() {
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

void BattleForecase_SetupLabelText() {
    int i;

    for (i = 0; i < 6; ++i) {
        int textIndex;

        Text_Init(gUnknown_02002FDC + i, 4);

        textIndex = gUnknown_080D7FB0[i];

        Text_InsertString(
            gUnknown_02002FDC + i,
            GetStringTextCenteredPos(0x20, GetStringFromIndex(textIndex)),
            3,
            GetStringFromIndex(textIndex)
        );
    }

    return;
}

void sub_80365E4(u16* dest, struct TextHandle* text, struct Unit* unit) {
    char* str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    int position = GetStringTextCenteredPos(0x30, str);

    Text_Clear(text);
    DrawTextInline(text, dest, 0, position, 0, str);

    return;
}

void sub_8036628(u16* dest, struct TextHandle* text, int itemIdx) {
    char* str = GetItemName(itemIdx);
    int position = GetStringTextCenteredPos(0x38, str);

    Text_Clear(text);
    DrawTextInline(text, dest, 0, position, 0, str);

    return;
}

void AddWeaponStatsAfterRound(struct BattleUnit* battleUnit, u8* hitsCounter, int* usesCounter) {

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

void BKSEL_SetupHitAndSuchStats(struct BattlePreviewProc* proc) {
    struct BattleUnit* buFirst;
    struct BattleUnit* buSecond;

    int usesA = GetItemUses(gBattleActor.weaponBefore);
    int usesB = GetItemUses(gBattleTarget.weaponBefore);

    s8 followUp = BattleGetFollowUpOrder(&buFirst, &buSecond);

    proc->hitCountA = 0;
    proc->isEffectiveA = 0;

    if ((gBattleActor.weapon != 0) || (gBattleActor.weaponBroke)) {
        AddWeaponStatsAfterRound(&gBattleActor, &proc->hitCountA, &usesA);

        if ((followUp != 0) && (buFirst == &gBattleActor)) {
            AddWeaponStatsAfterRound(buFirst, &proc->hitCountA, &usesA);
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
        AddWeaponStatsAfterRound(&gBattleTarget, &proc->hitCountB, &usesB);
        if ((followUp != 0) && (buFirst == &gBattleTarget)) {
            AddWeaponStatsAfterRound(buFirst, &proc->hitCountB, &usesB);
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

void sub_8036818(struct BattlePreviewProc* proc) {
    int damage;
    int critRate;

    CallARM_FillTileRect(gUnknown_0200422C, gUnknown_085A09A8, 0x1000);

    TileMap_FillRect(gBmFrameTmap0, 10, 15, 0);

    sub_80365E4(gBmFrameTmap0 + 0x23, &proc->unitNameTextA, &gBattleActor.unit);

    sub_80365E4(gBmFrameTmap0 + 0x161, &proc->unitNameTextA, &gBattleTarget.unit);

    sub_8036628(gBmFrameTmap0 + 0x1A1, &proc->itemNameText, gBattleTarget.weaponBefore);

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

    Text_Draw(gUnknown_02002FDC, gBmFrameTmap0  + 0xA8 - 5);
    Text_Draw(gUnknown_02002FDC + 1, gBmFrameTmap0  + 0xA8 + 0x3B);
    Text_Draw(gUnknown_02002FDC + 2, gBmFrameTmap0  + 0xA8 + 0x7B);

    DrawIcon(gBmFrameTmap0 + 0xA8 + 0xBF, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gBmFrameTmap0 + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);

    return;
}

void sub_8036A70(struct BattlePreviewProc* proc) {

    CallARM_FillTileRect(gUnknown_0200422C, gUnknown_085A0AEC, 0x1000);

    TileMap_FillRect(gBmFrameTmap0, 10, 19, 0);

    sub_80365E4(gBmFrameTmap0 + 0x23, &proc->unitNameTextA, &gBattleActor.unit);
    sub_80365E4(gBmFrameTmap0 + 0x1E1, &proc->unitNameTextA, &gBattleTarget.unit);

    sub_8036628(gBmFrameTmap0 + 0x221, &proc->itemNameText, gBattleTarget.weaponBefore);

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

    Text_Draw(gUnknown_02002FDC + 3, gBmFrameTmap0 + 0xA8 - 5);
    Text_Draw(gUnknown_02002FDC + 4, gBmFrameTmap0 + 0xA8 + 0x3B);
    Text_Draw(gUnknown_02002FDC + 1, gBmFrameTmap0 + 0xA8 + 0x7B);
    Text_Draw(gUnknown_02002FDC + 2, gBmFrameTmap0 + 0xA8 + 0xBB);
    Text_Draw(gUnknown_02002FDC + 5, gBmFrameTmap0 + 0xA8 + 0xFB);

    DrawIcon(gBmFrameTmap0 + 0xA8 + 0x13F, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gBmFrameTmap0 + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);

    return;
}

void sub_8036CD0(struct BattlePreviewProc* proc) {

    proc->unk_2C = 0;
    proc->needContentUpdate = 0;

    switch (proc->frameKind) {
        case 1:
            BKSEL_SetupHitAndSuchStats(proc);
            sub_8036818(proc);
            break;

        case 2:
            BKSEL_SetupHitAndSuchStats(proc);
            sub_8036A70(proc);
            break;
    }

    return;
}

const u16* sub_8036D0C(int faction) {

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

void sub_8036D4C() {

    CopyToPaletteBuffer(sub_8036D0C(UNIT_FACTION(&gBattleActor.unit)), 0x20, 0x20);

    if (gBattleTarget.unit.index != 0) {
        CopyToPaletteBuffer(sub_8036D0C(UNIT_FACTION(&gBattleTarget.unit)), 0x40, 0x20);
    } else {
        CopyToPaletteBuffer(sub_8036D0C(FACTION_PURPLE), 0x40, 0x20);
    }

    return;
}

void BKSEL_InitGfx(struct BattlePreviewProc* proc) {

    CopyDataWithPossibleUncomp(gUnknown_085A0C80, gUnknown_02020188);
    CopyTileGfxForObj(gUnknown_02020188, (void*)0x06015D00, 4, 2);
    CopyToPaletteBuffer(gUnknown_085A0D2C, 0x240, 0x20);

    sub_8003D20();

    ResetIconGraphics_();

    sub_803650C();

    BattleForecase_SetupLabelText();

    Text_Allocate(&proc->unitNameTextA, 6);
    Text_Allocate(&proc->unitNameTextB, 6);
    Text_Allocate(&proc->itemNameText, 7);

    BG_SetPosition(1, 0, -1);

    proc->ready = 1;

    return;
}

void BKSEL_Destructor(void) {
    UnpackUiFrameBuffered(-1);
    return;
}

void sub_8036E2C(struct BattlePreviewProc* proc) {

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

void sub_8036EA8(struct BattlePreviewProc* proc) {
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

void sub_8036F4C(struct BattlePreviewProc* proc) {

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

extern u8 gUnknown_0859E4F8[];

void sub_8036FE8(struct BattlePreviewProc* proc) {
    int palAnim;

    if (proc->isEffectiveA != 0) {
        palAnim = gUnknown_0859E4F8[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    CopyToPaletteBuffer(gUnknown_0200300C[palAnim], 0x60, 0x20);

    if (proc->isEffectiveB != 0) {
        palAnim = gUnknown_0859E4F8[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    CopyToPaletteBuffer(gUnknown_0200300C[palAnim], 0x80, 0x20);

    return;
}

void sub_803705C(struct BattlePreviewProc* proc) {

    proc->unk_2C++;

    if (proc->needContentUpdate) {

        int side = sub_80364D8();

        if ((side != 0) && (side != proc->side)) {
            Proc_Break(proc);
            return;
        }

        sub_8036CD0(proc);
        sub_8036E2C(proc);
        sub_8036D4C();
    }

    if (proc->frameKind == 1) {
        sub_8036EA8(proc);
        sub_8036F4C(proc);
        sub_8036FE8(proc);
    }

    return;
}

void sub_80370C8(struct BattlePreviewProc* proc) {
    sub_8036CD0(proc);

    proc->side = sub_80364D8();
    proc->unk_36 = 0;

    if (proc->side < 0) {
        proc->x = 0;
    } else {
        proc->x = 20;
    }

    proc->y = 0;

    sub_8036D4C();

    return;
}

extern s8 gUnknown_0859E518[];

void sub_803710C(struct BattlePreviewProc* proc) {
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = gUnknown_0859E518[proc->unk_36];

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

extern s8 gUnknown_0859E51C[];

void sub_80371F0(struct BattlePreviewProc* proc) {
    int offset;
    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = gUnknown_0859E51C[proc->unk_36];

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
        SetKeyStatus_IgnoreMask(GetKeyStatus_IgnoreMask() & -2);
        sub_808457C();
    }

    return;
}

extern struct ProcCmd gProcScr_BKSEL[];

void NewBattleForecast() {

    struct BattlePreviewProc* proc;

    if (gRAMChapterData.unk42_4 == 2) {
        sub_8003D20();
        return;
    }

    proc = Proc_Start(gProcScr_BKSEL, PROC_TREE_3);
    proc->ready = 0;

    if (sub_8084560() == 1) {
        SetKeyStatus_IgnoreMask(GetKeyStatus_IgnoreMask() | 1);
    }

    switch (gRAMChapterData.unk42_4) {
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

void sub_803738C() {
    struct BattlePreviewProc* proc = Proc_Find(gProcScr_BKSEL);

    if (proc == 0) {
        return;
    }

    if (proc->ready != 0) {
        proc->needContentUpdate = 1;
    }

    return;
}

void sub_80373B4() {
    struct BattlePreviewProc* proc = Proc_Find(gProcScr_BKSEL);

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

int sub_80373F0(ProcPtr parent) {
    int x;

    struct BattlePreviewProc* proc = Proc_Find(gProcScr_BKSEL);
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

u16 CONST_DATA gUnknown_0859E5A0[] = {
    0x56B, 0x56D, 0x56F, 0x56C, 0x56E, 0x570,
};

u16 sub_803746C(int wt, s8 isEffective) {

    int idx = isEffective != 0 ? 3 : 0;

    if (wt < 0) {
        idx += 2;
    }

    if (wt > 0) {
        idx += 1;
    }

    return gUnknown_0859E5A0[idx];
}

void sub_8037494(struct UnknownBkSelProc* proc) {
    struct BattlePreviewProc* proc2 = Proc_Find(gProcScr_BKSEL);
    proc->unk_4C = sub_803746C(gBattleActor.wTriangleHitBonus, proc2->isEffectiveA);

    return;
}

void sub_80374C4(struct UnknownBkSelProc* proc) {
    struct BattlePreviewProc* proc2 = Proc_Find(gProcScr_BKSEL);
    proc->unk_4C = sub_803746C(gBattleTarget.wTriangleHitBonus, proc2->isEffectiveB);

    return;
}
