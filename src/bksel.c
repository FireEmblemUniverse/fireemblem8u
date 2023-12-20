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
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

int GetBattleForecastPanelSide(void)
{
    int x;

    x = (gBattleTarget.unit.xPos * 16) - gBmSt.camera.x;

    if (x < 0x70)
        return 1;

    if (x > 0x70)
        return -1;

    return 0;
}

void InitBattleForecastIconPaletteBuffer(void)
{
    int i;
    int j;

    LoadIconPalette(0, 3);

    for (i = 1; i < 16; ++i) {
        int color = gPaletteBuffer[PAL_COLOR_OFFSET(3, i)];

        int red = RED_VALUE(color);

        int green = GREEN_VALUE(color);

        int blue = BLUE_VALUE(color);

        for (j = 0; j < 8; ++j) {

            gBkselPals[j][i] = ((blue << 10) + (green << 5)) + red;

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
}

void InitBattleForecastLabels(void)
{
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

        InitText(gaBattleForecastTextStructs + i, 4);

        textIndex = sBattleForecastLabelStringIndexes[i];

        Text_InsertDrawString(
            gaBattleForecastTextStructs + i,
            GetStringTextCenteredPos(0x20, GetStringFromIndex(textIndex)),
            3,
            GetStringFromIndex(textIndex)
        );
    }
}

void PutBattleForecastUnitName(u16 * dest, struct Text * text, struct Unit * unit)
{
    char* str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    int position = GetStringTextCenteredPos(48, str);

    ClearText(text);
    PutDrawText(text, dest, 0, position, 0, str);
}

void PutBattleForecastItemName(u16* dest, struct Text * text, int itemIdx)
{
    char* str = GetItemName(itemIdx);
    int position = GetStringTextCenteredPos(56, str);

    ClearText(text);
    PutDrawText(text, dest, 0, position, 0, str);
}

void BattleForecastHitCountUpdate(struct BattleUnit * battleUnit, u8 * hitsCounter, int * usesCounter)
{

    if (*usesCounter > 0) {
        *hitsCounter = *hitsCounter + 1;
        *usesCounter = *usesCounter - 1;

        if (battleUnit->weaponAttributes & IA_BRAVE) {
            *hitsCounter = *hitsCounter + 1;
            *usesCounter = *usesCounter - 1;
        }
    }
}

void InitBattleForecastBattleStats(struct BattleForecastProc * proc)
{
    struct BattleUnit * buFirst;
    struct BattleUnit * buSecond;

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
}

void DrawBattleForecastContentsStandard(struct BattleForecastProc * proc)
{
    int damage;
    int critRate;

    CallARM_FillTileRect(gUiTmScratchB, gTSA_BattleForecastStandard, 0x1000);

    TileMap_FillRect(gUiTmScratchA, 10, 15, 0);

    PutBattleForecastUnitName(gUiTmScratchA + 0x23, &proc->unitNameTextA, &gBattleActor.unit);

    PutBattleForecastUnitName(gUiTmScratchA + 0x161, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gUiTmScratchA + 0x1A1, &proc->itemNameText, gBattleTarget.weaponBefore);

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
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, gBattleTarget.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA2, 2, damage);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x40, 2, gBattleTarget.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveCritRate);

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
        PutNumberTwoChr(gUiTmScratchA + 0xA8 - 0x40, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0xA8 - 0x40, 2, gBattleActor.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA8, 2, damage);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x40, 2, gBattleActor.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x80, 2, critRate);

    PutTwoSpecialChar(gUiTmScratchA + 0xA8 - 0x44, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    PutText(gaBattleForecastTextStructs, gUiTmScratchA  + 0xA8 - 5);
    PutText(gaBattleForecastTextStructs + 1, gUiTmScratchA  + 0xA8 + 0x3B);
    PutText(gaBattleForecastTextStructs + 2, gUiTmScratchA  + 0xA8 + 0x7B);

    DrawIcon(gUiTmScratchA + 0xA8 + 0xBF, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gUiTmScratchA + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);
}

void DrawBattleForecastContentsExtended(struct BattleForecastProc * proc)
{
    CallARM_FillTileRect(gUiTmScratchB, gTSA_BattleForecastExtended, 0x1000);

    TileMap_FillRect(gUiTmScratchA, 10, 19, 0);

    PutBattleForecastUnitName(gUiTmScratchA + 0x23, &proc->unitNameTextA, &gBattleActor.unit);
    PutBattleForecastUnitName(gUiTmScratchA + 0x1E1, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gUiTmScratchA + 0x221, &proc->itemNameText, gBattleTarget.weaponBefore);

    if ((gBattleTarget.weapon == 0) && (!gBattleTarget.weaponBroke)) {
        gBattleTarget.battleAttack = 0xFF;
        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    }

    if (gBattleTarget.hpInitial > 99) {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, gBattleTarget.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA2, 2, gBattleTarget.battleAttack);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x40, 2, gBattleTarget.battleDefense);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0xC0, 2, gBattleTarget.battleEffectiveCritRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x100, 2, gBattleTarget.battleSpeed);

    if (gBattleActor.hpInitial > 99) {
        PutNumberTwoChr(gUiTmScratchA + 0xA2 - 0x3A, 2, 0xFF);
    } else {
        PutNumberTwoChr(gUiTmScratchA + 0xA2 - 0x3A, 2, gBattleActor.hpInitial);
    }

    PutNumberTwoChr(gUiTmScratchA + 0xA8, 2, gBattleActor.battleAttack);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x40, 2, gBattleActor.battleDefense);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x80, 2, gBattleActor.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0xC0, 2, gBattleActor.battleEffectiveCritRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x100, 2, gBattleActor.battleSpeed);

    PutTwoSpecialChar(gUiTmScratchA + 0xA8 - 0x44, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    PutText(gaBattleForecastTextStructs + 3, gUiTmScratchA + 0xA8 - 5);
    PutText(gaBattleForecastTextStructs + 4, gUiTmScratchA + 0xA8 + 0x3B);
    PutText(gaBattleForecastTextStructs + 1, gUiTmScratchA + 0xA8 + 0x7B);
    PutText(gaBattleForecastTextStructs + 2, gUiTmScratchA + 0xA8 + 0xBB);
    PutText(gaBattleForecastTextStructs + 5, gUiTmScratchA + 0xA8 + 0xFB);

    DrawIcon(gUiTmScratchA + 0xA8 + 0x13F, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);

    DrawIcon(gUiTmScratchA + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);
}

void DrawBattleForecastContents(struct BattleForecastProc * proc)
{
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
}

const u16 * GetFactionBattleForecastFramePalette(int faction)
{

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

void InitBattleForecastFramePalettes(void)
{

    ApplyPalette(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleActor.unit)), 1);

    if (gBattleTarget.unit.index != 0) {
        ApplyPalette(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleTarget.unit)), 2);
    } else {
        ApplyPalette(GetFactionBattleForecastFramePalette(FACTION_PURPLE), 2);
    }
}

void BattleForecast_Init(struct BattleForecastProc * proc)
{
    Decompress(gBattleForecast_x2x4Gfx, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void*)0x06015D00, 4, 2);
    ApplyPalette(gBattleForecast_x2x4Pal, 0x12);

    ResetTextFont();

    ResetIconGraphics_();

    InitBattleForecastIconPaletteBuffer();

    InitBattleForecastLabels();

    InitTextDb(&proc->unitNameTextA, 6);
    InitTextDb(&proc->unitNameTextB, 6);
    InitTextDb(&proc->itemNameText, 7);

    BG_SetPosition(1, 0, -1);

    proc->ready = 1;
}

void BattleForecast_OnEnd(void)
{
    UnpackUiFrameBuffered(-1);
}

void PutBattleForecastTilemaps(struct BattleForecastProc * proc)
{
    int height = proc->frameKind == 1 ? 16 : 20;

    if (proc->side < 0) {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer, 10, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer, 10, height);
    } else {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + 20, 10, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + 20, 10, height);
    }

    BG_EnableSyncByMask(3);
}

void PutBattleForecastWeaponTriangleArrows(struct BattleForecastProc * proc)
{
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
        UpdateStatArrowSprites((proc->x + 8) * 8 + 3, (proc->y + 11) * 8, wtArrowB == 2 ? 1 : 0);
    }

    if (wtArrowA != 0) {
        UpdateStatArrowSprites((proc->x + 2) * 8 + 3, (proc->y + 1) * 8, wtArrowA == 2 ? 1 : 0);
    }
}

void PutBattleForecastMultipliers(struct BattleForecastProc * proc)
{
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
}

void UpdateBattleForecastEffectivenessPalettes(struct BattleForecastProc * proc)
{
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

    ApplyPalette(gBkselPals[palAnim], 3);

    if (proc->isEffectiveB != 0) {
        palAnim = palAnimLut[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    ApplyPalette(gBkselPals[palAnim], 4);
}

void BattleForecast_LoopDisplay(struct BattleForecastProc * proc)
{
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
}

void BattleForecast_OnNewBattle(struct BattleForecastProc * proc)
{
    DrawBattleForecastContents(proc);

    proc->side = GetBattleForecastPanelSide();
    proc->slide_offset = 0;

    if (proc->side < 0) {
        proc->x = 0;
    } else {
        proc->x = 20;
    }

    proc->y = 0;

    InitBattleForecastFramePalettes();
}

void BattleForecast_LoopSlideIn(struct BattleForecastProc * proc)
{
    static s8 offsetLut[] = { 6, 8, 9, 10 };
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = offsetLut[proc->slide_offset];

    if (proc->side < 0) {
        TileMap_CopyRect(gUiTmScratchA + (10 - offset), gBG0TilemapBuffer, offset, height);
        TileMap_CopyRect(gUiTmScratchB + (10 - offset), gBG1TilemapBuffer, offset, height);
    } else {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + (30 - offset), offset, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + (30 - offset), offset, height);
    }

    proc->slide_offset++;

    if ((u8)proc->slide_offset == 4) {
        proc->slide_offset = 0;
        Proc_Break(proc);
    }
}

void BattleForecast_LoopSlideOut(struct BattleForecastProc * proc)
{
    static s8 offsetLut[] = { 9, 8, 6, 0 };
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(3);

    offset = offsetLut[proc->slide_offset];

    if (proc->side < 0) {
        TileMap_CopyRect(gUiTmScratchA + (10 - offset), gBG0TilemapBuffer, offset, height);
        TileMap_CopyRect(gUiTmScratchB + (10 - offset), gBG1TilemapBuffer, offset, height);
    } else {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + (30 - offset), offset, height);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + (30 - offset), offset, height);
    }

    proc->slide_offset++;

    if ((u8)proc->slide_offset == 4) {
        proc->slide_offset = 0;
        Proc_Break(proc);
    }
}

bool MapEventEngineExists_(void)
{
    return EventEngineExists();
}

void TriggerBattleForcastToturialEvent(void)
{
    if (CheckBattleForecastTutorialEvent() == 1) {
        SetKeyStatus_IgnoreMask(GetKeyStatus_IgnoreMask() & ~(A_BUTTON));
        StartBattleForecastTutorialEvent();
    }
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

    PROC_CALL(TriggerBattleForcastToturialEvent),

    PROC_REPEAT(BattleForecast_LoopDisplay),
    PROC_REPEAT(BattleForecast_LoopSlideOut),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_REPEAT(BattleForecast_LoopSlideOut),

    PROC_END,
};

void NewBattleForecast() {

    struct BattleForecastProc* proc;

    if (gPlaySt.config.battleForecastType == 2) {
        ResetTextFont();
        return;
    }

    proc = Proc_Start(gProcScr_BKSEL, PROC_TREE_3);
    proc->ready = 0;

    if (CheckBattleForecastTutorialEvent() == 1) {
        SetKeyStatus_IgnoreMask(GetKeyStatus_IgnoreMask() | A_BUTTON);
    }

    switch (gPlaySt.config.battleForecastType) {
        case 0:
            proc->frameKind = 1;
            break;

        case 1:
            proc->frameKind = 2;
            break;
    }

    BmMapFill(gBmMapMovement, -1);
}

void UpdateBattleForecastContents(void)
{
    struct BattleForecastProc * proc = Proc_Find(gProcScr_BKSEL);

    if (proc == 0)
        return;

    if (proc->ready != 0)
        proc->needContentUpdate = 1;
}

void CloseBattleForecast()
{
    struct BattleForecastProc * proc = Proc_Find(gProcScr_BKSEL);

    if (proc == 0)
        return;

    if (proc->ready == 0) {
        ClearBg0Bg1();
        Proc_End(proc);
        return;
    }
    Proc_Goto(proc, 1);
}

u8 StartBattleForecastHelpBox(ProcPtr parent, struct SelectTarget * target)
{
    int x;

    struct BattleForecastProc* proc = Proc_Find(gProcScr_BKSEL);
    if (proc == 0)
        return 0;

    if (proc->needContentUpdate != 0)
        return 0;

    if (proc->side < 0)
        x = 0;
    else
        x = 20;

    LoadHelpBoxGfx(0, -1);

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


u16 GetBkselHelpBoxMsg(int wt, s8 isEffective)
{
    static u16 lut[] = {
        0x56B, 0x56D, 0x56F, 0x56C, 0x56E, 0x570,
    };

    int idx = isEffective != 0 ? 3 : 0;

    if (wt < 0)
        idx += 2;

    if (wt > 0)
        idx += 1;

    return lut[idx];
}

void HbPopulate_BkselWTriEffA(struct HelpBoxProc * proc)
{
    struct BattleForecastProc * proc2 = Proc_Find(gProcScr_BKSEL);
    proc->mid = GetBkselHelpBoxMsg(gBattleActor.wTriangleHitBonus, proc2->isEffectiveA);
}

void HbPopulate_BkselWTriEffB(struct HelpBoxProc * proc)
{
    struct BattleForecastProc * proc2 = Proc_Find(gProcScr_BKSEL);
    proc->mid = GetBkselHelpBoxMsg(gBattleTarget.wTriangleHitBonus, proc2->isEffectiveB);
}
