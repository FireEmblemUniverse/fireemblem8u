#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"

void sub_805AA68(void *);
void sub_805AE14(void *);
void sub_805AE40(void *, s16, s16, s16, s16);

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
    
    if (proc->is_promotion == false) {
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

void EkrLvup_DrawUnitName(struct ProcEkrLevelup *proc)
{
    Text_Clear(&gTextEkrlvupValue[EKRLVUP_STAT_PNAME]);
    Text_AppendString(&gTextEkrlvupValue[EKRLVUP_STAT_PNAME], GetStringFromIndex(gpEkrLvupUnit->pClassData->nameTextId));
    Text_Draw(&gTextEkrlvupValue[EKRLVUP_STAT_PNAME], TILEMAP_LOCATED(gBG2TilemapBuffer, 2, 7));
}

void EkrLvup_DrawPreLevelValue(struct ProcEkrLevelup *proc)
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

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
        proc->is_promotion = false;
    else
        proc->is_promotion = true;

    proc->timer = 0;
    proc->finished = false;
}

void EkrLvup_OnPrepare(struct ProcEkrLevelup *proc)
{
    int timer;

    if (proc->is_promotion) {
        Proc_Break(proc);
        return;
    }

    timer = ++proc->timer;

    if (timer == 1) {
        NewEfxSpellCast();
        NewEfxLvupOBJ2(proc->ais_main, 0x78, 0x58);
        return;
    }

    if (timer == 25) {
        NewEfxLvupBG2(proc->ais_main);
        NewEfxLvupBGCOL(proc->ais_main);
        return;
    }

    if (timer == 59) {
        NewEfxlvupbg(proc->ais_main);
        return;
    }

    if (timer == 73) {
        EfxSpellCastSet29();
        return;
    }

    if (timer == 83) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
}

void EkrLvup_InitScreen(struct ProcEkrLevelup *proc)
{
    struct Struct20200E0 *buf = &gUnknown_020200E0;

    CpuFastFill(0, gBG1TilemapBuffer, 0x800);
    CpuFastFill(0, gBG2TilemapBuffer, 0x800);

    RegisterDataMove(gBG1TilemapBuffer, BG_SCREEN_ADDR(0xD), 0x800);
    RegisterDataMove(gBG1TilemapBuffer, BG_SCREEN_ADDR(0xE), 0x800);
    RegisterDataMove(gBG2TilemapBuffer, BG_SCREEN_ADDR(0xA), 0x800);
    RegisterDataMove(gBG2TilemapBuffer, BG_SCREEN_ADDR(0xB), 0x800);

    buf->unk00 = gBanimTerrainIndexMaybe[EKR_POS_L];
    buf->unk02 = 3;
    buf->unk04 = 0x100;
    buf->unk06 = gBanimTerrainIndexMaybe[EKR_POS_R];
    buf->unk08 = 4;
    buf->unk0A = 0x140;
    buf->unk0C = gEkrDistanceType;
    buf->unk0E = -1;
    buf->unk1C = OBJ_VRAM0;
    buf->unk20 = gUnknown_020145C8;
    buf->unk10 = gEkrSnowWeather;

    if (gEkrDistanceType == 2) {
        if (gEkrPos2Maybe == 0)
            buf->unk06 = -1;
        else
            buf->unk00 = -1;
    }

    if (GetBattleAnimArenaFlag() == false && GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING) {

        sub_805AA68(buf);

#if NONMATCHING
        ((struct Struct20200E0_14 *)buf->unk14)->unk4C &= ~OAM2_LAYER(0x3);
        ((struct Struct20200E0_14 *)buf->unk14)->unk4C |=  OAM2_LAYER(0x3);
        ((struct Struct20200E0_14 *)buf->unk18)->unk4C &= ~OAM2_LAYER(0x3);
        ((struct Struct20200E0_14 *)buf->unk18)->unk4C |=  OAM2_LAYER(0x3);
#else
    {
        register struct Struct20200E0_14 *_buf asm("r3");
        register u32 oam2 asm("r0");

        _buf = buf->unk14;
        oam2 = _buf->unk4C;
        oam2 &= 0xF3FF;
        oam2 |= 0x0C00;
        _buf->unk4C = oam2;

        _buf = buf->unk18;
        oam2 = _buf->unk4C;
        oam2 &= 0xF3FF;
        oam2 |= 0x0C00;
        _buf->unk4C = oam2;
    }
#endif
    }

    proc->ais_main->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_main->oam2Base |=  OAM2_LAYER(0x3);
    proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_core->oam2Base |=  OAM2_LAYER(0x3);

    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_DRACO_ZOMBIE) {
        proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
        proc->ais_core->oam2Base |=  OAM2_LAYER(0x2);

        gLCDControlBuffer.bg0cnt.priority = 2;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 0;
        gLCDControlBuffer.bg3cnt.priority = 2;
    }

    gEkrLvupScrollPos1 = 0x90;
    gEkrLvupScrollPos2 = 0x90;

    BG_SetPosition(2, 0, 8);
    BG_SetPosition(1, 0, 8);

    SetBackgroundMapDataOffset(0, 0x6000);
    SetBackgroundMapDataOffset(1, 0x6800);
    SetBackgroundMapDataOffset(2, 0x5000);

    SetBackgroundScreenSize(1, 1);
    SetBackgroundScreenSize(2, 1);

    gpProcEfxPartsofScroll = NewEfxPartsofScroll();
    gpProcEfxleveluphb = NewEfxleveluphb();
    sub_8074598();
    EkrGauge_Setup44(2);
    DisableEfxStatusUnits(proc->ais_main);
    DisableEfxStatusUnits(proc->ais_core);

    EfxWeaponIconSet50();
    EfxHPBarColorChangeSet29();

    SetWinEnable(0, 0, 0);
    SetDefaultColorEffects();
    Proc_Break(proc);
}

void EkrLvup_InitLevelUpBox(struct ProcEkrLevelup *proc)
{
    int portrait;
    struct BattleUnit *bu1 = gpEkrBattleUnitLeft;
    struct BattleUnit *bu2 = gpEkrBattleUnitRight;
    struct Anim *anim = proc->ais_main;

    LZ77UnCompWram(Img_LevelUpBoxFrame, gEkrImgBuffer);
    LZ77UnCompWram(Tsa_LevelUpBoxFrame, gEkrTsaBuffer);
    sub_8070E94(gEkrTsaBuffer, TILEMAP_LOCATED(gBG1TilemapBuffer, 0, 0x6), 0x20, 0x14, 1, 0x100);
    RegisterDataMove(gEkrImgBuffer, (void *)BG_VRAM + 0x2000, 0x8C0);
    CpuFastCopy(Pal_LevelUpBoxFrame, PAL_BG(1), 0x20);

    LZ77UnCompWram(gUnknown_085BB0C8, gUnknown_0201A790);
    RegisterDataMove(gUnknown_0201A790, OBJ_VRAM0 + 0x1400, 0xC00);
    CpuFastCopy(gUnknown_085BB2DC, PAL_OBJ(1), 0x20);

    EnablePaletteSync();

    proc->timer = EKR_LVUP_UI_BASE;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        portrait = bu1->unit.pCharacterData->portraitId;
    else
        portrait = bu2->unit.pCharacterData->portraitId;

    SetupFaceGfxData(&gUnknown_087592CC[0]);
    StartFace(0, portrait, 0xBC, EKR_LVUP_UI_BASE, 0x1042);
    gFaces[0]->yPos = 0xA0;

    CpuFastFill16(0, gBG2TilemapBuffer, 0x800);
    EkrLvup_InitStatusText(proc);
    Proc_Break(proc);
}

void EkrLvup_SetBgs(struct ProcEkrLevelup *proc)
{
    SetPrimaryHBlankHandler(EkrLvupHBlank);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    EnablePaletteSync();

    Proc_Break(proc);
}

void EkrLvup_InitPalette(struct ProcEkrLevelup *proc)
{
    if (++proc->timer > EKR_LVUP_UI_BASE) {

        proc->timer = 0;

        proc->unk_44 = 0;
        proc->unk_48 = 0;
        proc->unk_4C = -2;
        proc->unk_50 = -4;

        CpuFastCopy(PAL_BG(0), gEkrBgPalBackupMaybe, 0x400);

        Proc_Break(proc);
    }
}

void EkrLvup_PutWindowOnScreen(struct ProcEkrLevelup *proc)
{
    int a, b, c, d, pos, pal;

    a = proc->unk_44;
    b = proc->unk_48;
    c = proc->unk_4C;
    d = proc->unk_50;

    LIMIT_AREA_(a, 0, 8);
    LIMIT_AREA_(b, 0, 8);
    LIMIT_AREA_(c, 0, 8);
    LIMIT_AREA_(d, 0, 8);

    proc->unk_44++;
    proc->unk_48++;
    proc->unk_4C++;
    proc->unk_50++;

    pos = Interpolate(INTERPOLATE_LINEAR, -EKR_LVUP_UI_BASE, 0, a, 8);
    pal = Interpolate(INTERPOLATE_LINEAR, 0, 8, b, 8);

    gEkrLvupScrollPos1 = Interpolate(INTERPOLATE_LINEAR, 0x90, 0, c, 8);
    gEkrLvupScrollPos2 = Interpolate(INTERPOLATE_LINEAR, 0x90, 0, d, 8);

    gFaces[0]->yPos = EKR_LVUP_UI_BASE - pos;

    CpuFastCopy(gEkrBgPalBackupMaybe, PAL_BG(0), 0x400);
    EkrMaybePalFadeWithVal(PAL_BG(0), 2, 4, pal);
    EkrMaybePalFadeWithVal(PAL_BG(0), 0x13, 0xC, pal);
    EnablePaletteSync();

    if (++proc->timer > 0x14) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_PrepareApGfx(struct ProcEkrLevelup *proc)
{
    int i;

    NewEkrLvupApfx(0xA0, 1);

    for (i = 0; i < 8; i++)
        gUnknown_020200B8[i] = 0;
    
    Proc_Break(proc);
}

void EkrLvup_Promo_WindowScroll0(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        Proc_Break(proc);
        return;
    }

    SetPrimaryHBlankHandler(EfxPartsofScroll2HBlank);

    Proc_End(gpProcEfxPartsofScroll);
    gpProcEfxPartsofScroll = NewEfxPartsofScroll2();

    EfxPlaySE(0x2CD, 0x100);
    M4aPlayWithPostionCtrl(0x2CD, 0x38, 0);
    
    proc->timer = 0;
    proc->index = 8;
    Proc_Break(proc);
}

void EkrLvup_Promo_DrawPromoNewClassName(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        Proc_Break(proc);
        return;
    }

    gEkrLvupScrollPos1 = Interpolate(1, 0, 0x1000, proc->timer, proc->index);

    if (++proc->timer > proc->index) {
        gpEkrLvupUnit = &gpEkrLvupBattleUnit->unit;
        EkrLvup_DrawUnitName(proc);

        gEkrLvupPreLevel = gEkrLvupPostLevel;
        EkrLvup_DrawPreLevelValue(proc);

        proc->timer = 0;
        proc->index = 8;

        Proc_Break(proc);
    }
}

void EkrLvup_Promo_WindowScroll1(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        Proc_Break(proc);
        return;
    }

    gEkrLvupScrollPos1 = Interpolate(4, 0x1000, 0, proc->timer, proc->index);
    if (++proc->timer > proc->index)
        Proc_Break(proc);
}

void EkrLvup_DrawNewLevel(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        proc->timer = 0;
        BanimDrawStatupAp(0xA0, 1, 0x84, 0x3C, 0, 0);
        gEkrLvupPreLevel = gEkrLvupPostLevel;
        EkrLvup_DrawPreLevelValue(proc);
        EfxPlaySE(0x2CD, 0x100);
        M4aPlayWithPostionCtrl(0x2CD, 0x38, 0);
        Proc_Break(proc);
    } else {
        Proc_End(gpProcEfxPartsofScroll);
        gpProcEfxPartsofScroll = NewEfxPartsofScroll();
        proc->timer = 0;
        proc->index = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_InitCounterForMainAnim(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion != false) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer < 0x1E) {
        proc->timer = 0;
        proc->index = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_MainAnime(struct ProcEkrLevelup *proc)
{
    int base, diff;
    s16 stat_index;

    if (++proc->timer == 0x14) {
        proc->timer = 0;

        for (; proc->index != EKRLVUP_STAT_MAX; proc->index++) {
            base = gEkrLvupBaseStatus[proc->index];
            diff = gEkrLvupPostStatus[proc->index] - base;

            if (diff != 0) {
                gEkrLvupBaseStatus[proc->index] = gEkrLvupPostStatus[proc->index];
                EkrLvup_DrawUpdatedStatus(proc, proc->index);
                EfxPlaySE(0x76, 0x100);
                M4aPlayWithPostionCtrl(0x76, 0x38, 0);

                BanimDrawStatupAp(0xA0, 1,
                    0x35 + (sEfxLvupPartsPos[proc->index] & 0x1F) * 8,
                    6 + (sEfxLvupPartsPos[proc->index] & 0x7E0) / 4,
                    proc->index + 1,
                    diff);

                if (proc->index == EKRLVUP_STAT_HP) {
                    gEkrPairMaxHP[1] = gEkrLvupBaseStatus[proc->index];
                    gUnknown_0203E1B4[1] = -1;
                }
                proc->timer = 0;
                break;
            }
        }
    }

    if (proc->index == EKRLVUP_STAT_MAX) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_SetHBlank(struct ProcEkrLevelup *proc)
{
    if (++proc->timer > 0x6D) {
        proc->timer = 0;
        EkrLvupApfxEndEach();
        SetPrimaryHBlankHandler(EkrLvupHBlank);
        Proc_Break(proc);
    }
}

void EkrLvup_DoNothing(struct ProcEkrLevelup *proc)
{
    Proc_Break(proc);
}

void EkrLvup_PutWindowOffScreen(struct ProcEkrLevelup *proc)
{
    int i, pos, pal;

    gEkrLvupScrollPos1 = Interpolate(INTERPOLATE_LINEAR, 0, 0x90, proc->timer, 8);
    gEkrLvupScrollPos2 = Interpolate(INTERPOLATE_LINEAR, 0, 0x90, proc->timer, 8);

    pos = Interpolate(INTERPOLATE_LINEAR, 0, -EKR_LVUP_UI_BASE, proc->timer, 8);
    pal = Interpolate(INTERPOLATE_LINEAR, 8, 0, proc->timer, 8);

    gFaces[0]->yPos = EKR_LVUP_UI_BASE - pos;

    CpuFastCopy(gEkrBgPalBackupMaybe, PAL_BG(0), 0x400);
    EkrMaybePalFadeWithVal(PAL_BG(0), 2, 4, pal);
    EkrMaybePalFadeWithVal(PAL_BG(0), 0x13, 0xC, pal);
    EnablePaletteSync();

    /* Maybe some debug routine? */
    for (i = 0; i < 8; i++);

    if (++proc->timer > 8) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_ResetScreen(struct ProcEkrLevelup *proc)
{
    struct Struct20200E0 *buf, _buf;
    buf = &gUnknown_020200E0;

    if (GetBattleAnimArenaFlag() == false && GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING)
        sub_805AE14(buf);

    SetBackgroundMapDataOffset(0, 0x6000);
    SetBackgroundMapDataOffset(1, 0x6800);
    SetBackgroundMapDataOffset(2, 0x7000);

    SetBackgroundScreenSize(1, 0);
    SetBackgroundScreenSize(2, 0);

    buf = &_buf;
    buf->unk00 = gBanimTerrainIndexMaybe[0];
    buf->unk02 = 4;
    buf->unk04 = 0x280;
    buf->unk06 = gBanimTerrainIndexMaybe[1];
    buf->unk08 = 5;
    buf->unk0A = 0x280;
    buf->unk0C = gEkrDistanceType;
    buf->unk0E = 0x2;
    buf->unk1C = NULL;
    buf->unk20 = gUnknown_020145C8;
    buf->unk10 = gEkrSnowWeather;

    if (GetBattleAnimArenaFlag() == false && GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING) {
        BG_SetPosition(2, 0, 0);
        sub_805AA68(&_buf);
    }

    proc->ais_main->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_main->oam2Base |=  OAM2_LAYER(0x2);
    proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_core->oam2Base |=  OAM2_LAYER(0x2);

    CpuFastFill(0, gBG1TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    EkrGauge_Setup44(0);

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_DRACO_ZOMBIE) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
    } else {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }

    EndFaceById(0);
    Proc_Break(proc);
}

void EkrLvup_OnEnd(struct ProcEkrLevelup *proc)
{
    Proc_End(gpProcEfxPartsofScroll);
    Proc_End(gpProcEfxleveluphb);

    EnableEfxStatusUnits(proc->ais_main);
    EnableEfxStatusUnits(proc->ais_core);
    EfxWeaponIconClear50();
    EfxHPBarColorChangeClear29();
    proc->finished = true;
}
