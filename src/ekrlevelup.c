#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "ekrlevelup.h"

/**
 * section.ewramdata
 */

EWRAM_DATA struct Unit *gpEkrLvupUnit = NULL;
EWRAM_DATA struct BattleUnit *gpEkrLvupBattleUnit = NULL;
EWRAM_DATA u16 gEkrLvupPreLevel = 0;
EWRAM_DATA u16 gEkrLvupPostLevel = 0;
EWRAM_DATA u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX] = {0};
EWRAM_DATA u16 gEkrLvupPostStatus[EKRLVUP_STAT_MAX] = {0};
EWRAM_DATA u16 gEkrLvupScrollPos1 = 0;
EWRAM_DATA u16 gEkrLvupScrollPos2 = 0;

/**
 * section.data
 */

const u16 sEfxLvupPartsPos[] = {
    TILEMAP_INDEX(2, 11),
    TILEMAP_INDEX(2, 13),
    TILEMAP_INDEX(2, 15),
    TILEMAP_INDEX(2, 17),

    TILEMAP_INDEX(10, 11),
    TILEMAP_INDEX(10, 13),
    TILEMAP_INDEX(10, 15),
    TILEMAP_INDEX(10, 17),
};

CONST_DATA struct FaceVramEntry gUnknown_087592CC[4] = {
    [0] = {
        .tileOffset = 0,
        .paletteId  = 15,
    },

    [1] = {0},
    [2] = {0},
    [3] = {0},
};

CONST_DATA unsigned *EkrLvupMsgsStr[] = {
    &gMid_Hp,
    &gMid_Str,
    &gMid_Skl,
    &gMid_Spd,
    &gMid_Lck,
    &gMid_Def,
    &gMid_Res,
    &gMid_Con
};

CONST_DATA unsigned *EkrLvupMsgsMag[] = {
    &gMid_Hp,
    &gMid_Mag,
    &gMid_Skl,
    &gMid_Spd,
    &gMid_Lck,
    &gMid_Def,
    &gMid_Res,
    &gMid_Con
};

CONST_DATA struct ProcCmd ProcScr_EkrLevelup[] = {
    PROC_NAME("ekrLevelup"),
    PROC_REPEAT(EkrLvup_OnPrepare),
    PROC_REPEAT(EkrLvup_InitScreen),
    PROC_SLEEP(1),

    PROC_REPEAT(EkrLvup_InitLevelUpBox),
    PROC_REPEAT(EkrLvup_SetBgs),
    PROC_REPEAT(EkrLvup_InitPalette),
    PROC_REPEAT(EkrLvup_PutWindowOnScreen),
    PROC_REPEAT(EkrLvup_PrepareApGfx),
    PROC_SLEEP(20),

    PROC_REPEAT(EkrLvup_Promo_WindowScroll0),
    PROC_REPEAT(EkrLvup_Promo_DrawPromoNewClassName),
    PROC_REPEAT(EkrLvup_Promo_WindowScroll1),
    PROC_REPEAT(EkrLvup_DrawNewLevel),
    PROC_REPEAT(EkrLvup_InitCounterForMainAnim),
    PROC_REPEAT(EkrLvup_MainAnime),
    PROC_REPEAT(EkrLvup_SetHBlank),
    PROC_REPEAT(EkrLvup_DoNothing),
    PROC_REPEAT(EkrLvup_PutWindowOffScreen),
    PROC_REPEAT(EkrLvup_ResetScreen),
    PROC_REPEAT(EkrLvup_OnEnd),
    PROC_END
};

const char aEfxPartsofScroll[] = "efxPartsofScroll";
const char aEfxPartsofScroll2[] = "efxPartsofScroll2";
const char aEfxleveluphb[] = "efxLevelupHB";
const char aEfxlvupbg[] = "efxLvupBG";
const u16 gUnknown_080E162A[] = {
    0, 1,
    1, 1,
    2, 1,
    3, 1,
    4, 1,
    5, 1,
    6, 1,
    7, 1,
    8, 1,
    9, 1,
    10, 1,
    -1
};
const char aEfxlvupbg2[] = "efxLvupBG2";

/**
 * section.text
 */

bool CheckEkrLvupDone(void)
{
    if (gpProcEkrLevelup->finished == true)
        return true;
    else
        return false;
}

void EndEkrLevelUp(void)
{
    Proc_End(gpProcEkrLevelup);
}

void EkrLvup_InitStatusText(struct ProcEkrLevelup *proc)
{
    int i;
    struct BattleUnit *bunit, *bunit2;
    struct Unit *unit;
    struct TextHandle *th;

    if (proc->ais_main == NULL) {
        bunit2 = gpEkrBattleUnitLeft;
        gpEkrLvupUnit = unit = &bunit2->unit;
        if (&gpEkrBattleUnitRight == &gpEkrBattleUnitRight)
            gpEkrLvupBattleUnit = bunit = gpEkrBattleUnitRight;
    } else {
        bunit2 = gpEkrBattleUnitRight;
        gpEkrLvupUnit = unit = &bunit2->unit;
        if (&gpEkrBattleUnitLeft == &gpEkrBattleUnitLeft)
            gpEkrLvupBattleUnit = bunit = gpEkrBattleUnitLeft;
    }
    
    if (!proc->is_promotion) {
        unit = GetUnit(unit->index);

        gEkrLvupPreLevel = bunit2->levelPrevious;
        gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->maxHP;
        gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
        gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
        gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
        gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
        gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->pClassData->baseCon + unit->pCharacterData->baseCon;
        gEkrLvupPostLevel = bunit2->levelPrevious + 1;

        gEkrLvupPostStatus[EKRLVUP_STAT_HP] = unit->maxHP + bunit2->changeHP;
        gEkrLvupPostStatus[EKRLVUP_STAT_POW] = unit->pow + bunit2->changePow;
        gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = unit->skl + bunit2->changeSkl;
        gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = unit->lck + bunit2->changeLck;
        gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = unit->spd + bunit2->changeSpd;
        gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = unit->def + bunit2->changeDef;
        gEkrLvupPostStatus[EKRLVUP_STAT_RES] = unit->res + bunit2->changeRes;
        gEkrLvupPostStatus[EKRLVUP_STAT_CON] = unit->pClassData->baseCon + unit->pCharacterData->baseCon + bunit2->changeCon;
    } else {
        gEkrLvupPreLevel = unit->level;
        gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->maxHP;
        gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
        gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
        gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
        gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
        gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->pClassData->baseCon + unit->pCharacterData->baseCon;
        gEkrLvupPostLevel = 1;

        gEkrLvupPostStatus[EKRLVUP_STAT_HP] = bunit->unit.maxHP;
        gEkrLvupPostStatus[EKRLVUP_STAT_POW] = bunit->unit.pow;
        gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = bunit->unit.skl;
        gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = bunit->unit.lck;
        gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = bunit->unit.spd;
        gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = bunit->unit.def;
        gEkrLvupPostStatus[EKRLVUP_STAT_RES] = bunit->unit.res;
        gEkrLvupPostStatus[EKRLVUP_STAT_CON] = bunit->unit.pClassData->baseCon + bunit->unit.pCharacterData->baseCon;
    }

    Font_InitForUI(&gSomeFontStruct, BG_CHR_ADDR(0x146), 0x146, 0);

    for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
        const char *str;
        if (!UnitHasMagicRank(unit))
            str = GetStringFromIndex(*EkrLvupMsgsStr[i]);
        else
            str = GetStringFromIndex(*EkrLvupMsgsMag[i]);

        Text_Init(&gTextEkrlvupMsg[i], 3);
        Text_SetXCursor(&gTextEkrlvupMsg[i], 0);
        Text_SetColorId(&gTextEkrlvupMsg[i], TEXT_COLOR_GOLD);
        Text_AppendString(&gTextEkrlvupMsg[i], str);
        Text_Draw(&gTextEkrlvupMsg[i], gBG2TilemapBuffer + sEfxLvupPartsPos[i]);
    }

    for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
        Text_Init(&gTextEkrlvupValue[i], 2);
        Text_SetXCursor(&gTextEkrlvupValue[i], 8);
        Text_SetColorId(&gTextEkrlvupValue[i], TEXT_COLOR_BLUE);
        Text_AppendDecNumber(&gTextEkrlvupValue[i], gEkrLvupBaseStatus[i]);
        Text_Draw(&gTextEkrlvupValue[i], gBG2TilemapBuffer + 3 + sEfxLvupPartsPos[i]);
    }

    /* class */
    th = &gTextEkrlvupValue[EKRLVUP_STAT_CLASS];
    Text_Init(th, 8);
    Text_AppendString(th,
        GetStringFromIndex(gpEkrLvupUnit->pClassData->nameTextId));
    Text_Draw(th, TILEMAP_LOCATED(gBG2TilemapBuffer, 3, 7));

    /* level msg */
    th = &gTextEkrlvupValue[EKRLVUP_STAT_LV_MSG];
    Text_Init(th, 3);
    Text_SetColorId(th, TEXT_COLOR_GOLD);
    Text_AppendString(th, GetStringFromIndex(gMid_Lv));
    Text_Draw(th, TILEMAP_LOCATED(gBG2TilemapBuffer, 10, 7));

    /* level value */
    th = &gTextEkrlvupValue[EKRLVUP_STAT_LV_VAL];
    Text_Init(th, 2);
    Text_SetXCursor(th, 8);
    Text_SetColorId(th, TEXT_COLOR_BLUE);
    Text_AppendDecNumber(th, gEkrLvupPreLevel);
    Text_Draw(th, TILEMAP_LOCATED(gBG2TilemapBuffer, 13, 7));
}

void EkrLvup_DrawUpdatedStatus(struct ProcEkrLevelup *proc, int index)
{
    Text_Clear(&gTextEkrlvupValue[index]);
    Text_SetXCursor(&gTextEkrlvupValue[index], 8);
    Text_SetColorId(&gTextEkrlvupValue[index], TEXT_COLOR_BLUE);
    Text_AppendDecNumber(&gTextEkrlvupValue[index], gEkrLvupBaseStatus[index]);
    Text_Draw(&gTextEkrlvupValue[index], gBG2TilemapBuffer + 3 + sEfxLvupPartsPos[index]);
}

void EkrLvup_DrawUnitName(void)
{
    Text_Clear(&gTextEkrlvupValue[EKRLVUP_STAT_PNAME]);
    Text_AppendString(&gTextEkrlvupValue[EKRLVUP_STAT_PNAME], GetStringFromIndex(gpEkrLvupUnit->pClassData->nameTextId));
    Text_Draw(&gTextEkrlvupValue[EKRLVUP_STAT_PNAME], TILEMAP_LOCATED(gBG2TilemapBuffer, 2, 7));
}

void EkrLvup_DrawPreLevelValue(void)
{
    Text_Clear(&gTextEkrlvupValue[EKRLVUP_STAT_LVPRE_VAL]);
    Text_SetXCursor(&gTextEkrlvupValue[EKRLVUP_STAT_LVPRE_VAL], 8);
    Text_SetColorId(&gTextEkrlvupValue[EKRLVUP_STAT_LVPRE_VAL], TEXT_COLOR_BLUE);
    Text_AppendDecNumber(&gTextEkrlvupValue[EKRLVUP_STAT_LVPRE_VAL], gEkrLvupPreLevel);
    Text_Draw(&gTextEkrlvupValue[EKRLVUP_STAT_LVPRE_VAL], TILEMAP_LOCATED(gBG2TilemapBuffer, 13, 7));
}

void NewEkrLevelup(struct Anim *ais)
{
    struct ProcEkrLevelup *proc;
    gpProcEkrLevelup = proc = Proc_Start(ProcScr_EkrLevelup, PROC_TREE_3);

    proc->ais_main = ais;
    proc->ais_core = GetCoreAIStruct(ais);

    if (gUnknown_0203E120 != 4)
        proc->is_promotion = false;
    else
        proc->is_promotion = true;
    
    proc->count = 0;
    proc->finished = false;
}

void EkrLvup_OnPrepare(struct ProcEkrLevelup *proc)
{
    int count;

    if (proc->is_promotion) {
        Proc_Break(proc);
        return;
    }

    count = ++proc->count;

    if (count == 1) {
        NewEfxSpellCast();
        sub_80749F4(proc->ais_main, 0x78, 0x58);
        return;
    }

    if (count == 25) {
        sub_8074964(proc->ais_main);
        sub_8074A60(proc->ais_main);
        return;
    }

    if (count == 59) {
        sub_80748C4(proc->ais_main);
        return;
    }

    if (count == 73) {
        sub_8055000();
        return;
    }

    if (count == 83) {
        proc->count = 0;
        Proc_Break(proc);
        return;
    }
}
