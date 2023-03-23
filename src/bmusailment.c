#include "global.h"

#include "constants/classes.h"
#include "constants/items.h"

#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiselecttarget.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "mu.h"
#include "bmmind.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "trapfx.h"
#include "bmudisp.h"
#include "bm.h"

#include "bmusailment.h"

extern u16 gUnknown_08A032AC[];
extern u16 gUnknown_08A03334[]; // palette
extern u16 gUnknown_08A03354[];

// code_mapanim.s
void BeginMapAnimForPoisonDmg(void);
void BeginMapAnimForEggDmg(void);
void BeginMapAnimForCritAtk(void);


struct UnknownBMUSAilmentProc {
    PROC_HEADER;

    /* 29 */ u8 _pad1[0x2C-0x29];
    /* 2C */ int unk_2C;
    /* 30 */ int _pad2;
    /* 34 */ int unk_34;
    /* 38 */ u8 _pad3[0x4C-0x38];

    /* 4C */ s16 unk_4C;
    /* 4E */ u8 _pad4[0x58-0x4E];

    /* 58 */ int unk_58;
};

void ApplyHazardHealing(ProcPtr proc, struct Unit* unit, int hp, int status) {

    if (status >= 0) {
        SetUnitStatus(unit, status);
    }

    AddUnitHp(unit, hp);

    if (GetUnitCurrentHp(unit) <= 0) {
        UnitKill(unit);
    }

    DropRescueOnDeath(proc, unit);

    return;
}

void RenderMapForFogFadeIfUnitDied(struct Unit* unit) {

    if ((GetUnitCurrentHp(unit) == 0) && (gPlaySt.chapterVisionRange != 0)) {
        RenderBmMapOnBg2();
    }

    return;
}

void BeginUnitHealAnim(struct Unit* unit, int hp) {

    BattleInitItemEffect(unit, -1);

    gBattleActor.weapon = ITEM_VULNERARY;
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    AddUnitHp(&gBattleActor.unit, hp);

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    BattleHitTerminate();
    BeginBattleAnimations();

    return;
}

void BeginUnitPoisonDamageAnim(struct Unit* unit, int damage) {

    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0) {
        gBattleActor.unit.curHP = 0;
    }

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0) {
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForPoisonDmg();

    RenderMapForFogFadeIfUnitDied(unit);

    return;
}

void BeginGorgonEggHatchDamageAnim(struct Unit* unit, int damage) {

    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0) {
        gBattleActor.unit.curHP = 0;
    }

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0) {

        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForEggDmg();

    return;
}

void BeginUnitCritDamageAnim(struct Unit* unit, int damage) {

    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0) {
        gBattleActor.unit.curHP = 0;
    }

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0) {

        gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_CRIT;
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForCritAtk();

    RenderMapForFogFadeIfUnitDied(unit);

    return;
}

void KillAllRedUnits_Init(struct UnknownBMUSAilmentProc* proc) {
    int i;

    InitTargets(0, 0);

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & US_UNAVAILABLE) {
            continue;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, 0);
    }

    proc->unk_4C = 0;

    return;
}

void KillAllRedUnits_Loop(struct UnknownBMUSAilmentProc* proc) {
    struct Unit* unit;
    int x;
    int y;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_Goto(proc, 99);
        return;
    }

    unit = GetUnit(GetTarget(proc->unk_4C)->uid);

    HideUnitSprite(unit);
    UnitKill(unit);

    x = unit->xPos * 16 - gBmSt.camera.x;
    y = unit->yPos * 16 - gBmSt.camera.y;

    if ((x < 0) || (x > DISPLAY_WIDTH) || (y < 0) || (y > DISPLAY_HEIGHT)) {
        proc->unk_4C++;
        Proc_Goto(proc, 0);
    } else {
        MU_StartDeathFade(MU_Create(unit));
        proc->unk_4C++;
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_Unused_KillAllRedUnits[] = {
    PROC_CALL(KillAllRedUnits_Init),

PROC_LABEL(0),
    PROC_REPEAT(KillAllRedUnits_Loop),
    PROC_SLEEP(32),

    PROC_CALL(MU_EndAll),

    PROC_GOTO(0),

PROC_LABEL(99),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_END,
};

void StatusHealEffect_OverlayBg_Init() {
    int i;
    u16* src;
    u16* dst;

    ClearBg0Bg1();

    CopyDataWithPossibleUncomp(gUnknown_08A032AC, (u8*)BG_VRAM + 0x5000);
    CopyToPaletteBuffer(gUnknown_08A03334, 0x60, 0x20);

    CallARM_FillTileRect(gBG0TilemapBuffer, gUnknown_08A03354, 0x3280);

    src = gBG0TilemapBuffer;
    dst = gBG0TilemapBuffer + 0x80;
    for (i = 0; i < 7; dst += 0x80, i++) {
        TileMap_CopyRect(src, dst, 2, 4);
    }

    BG_EnableSyncByMask(1);

    return;
}

void StatusHealEffect_OverlayBg_Loop() {
    BG_SetPosition(0, gBmSt.camera.x - (gActiveUnit->xPos * 16), GetGameClock());

    return;
}

struct ProcCmd CONST_DATA sProcScr_StatusHealEffect_OverlayBg[] = {
    PROC_CALL(StatusHealEffect_OverlayBg_Init),
    PROC_REPEAT(StatusHealEffect_OverlayBg_Loop),

    PROC_END,
};

void StatusHealEffect_BlendedSprite_Init(struct UnknownBMUSAilmentProc* proc) {

    HideUnitSprite(gActiveUnit);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 1;

    gLCDControlBuffer.wincnt.wout_enableBlend = 0;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.wobj_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wobj_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wobj_enableObj = 1;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 1);

    proc->unk_4C = 64;

    return;
}

void StatusHealEffect_BlendedSprite_Loop(struct UnknownBMUSAilmentProc* proc) {

    PutBlendWindowUnitSprite(
        4,
        gActiveUnit->xPos * 16 - gBmSt.camera.x,
        gActiveUnit->yPos * 16 - gBmSt.camera.y,
        0x2800,
        gActiveUnit
    );

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void StatusHealEffect_BlendedSprite_Finish() {
    ShowUnitSprite(gActiveUnit);
    return;
}

struct ProcCmd CONST_DATA sProcScr_StatusHealEffect_BlendedSprite[] = {
    PROC_CALL(StatusHealEffect_BlendedSprite_Init),
    PROC_REPEAT(StatusHealEffect_BlendedSprite_Loop),
    PROC_CALL(StatusHealEffect_BlendedSprite_Finish),

    PROC_END,
};

void StatusHealEffect_BlendSpriteAnim_InitIn(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 0;
    proc->unk_34 = 1;

    return;
}

void StatusHealEffect_BlendSpriteAnim_InitOut(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 16;
    proc->unk_34 = -1;

    return;
}

void StatusHealEffect_BlendSpriteAnim_Loop(struct UnknownBMUSAilmentProc* proc) {

    proc->unk_2C += proc->unk_34;

    SetSpecialColorEffectsParameters(1, proc->unk_2C & 0xFF, 0x10, 0);

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA sProcScr_StatusHealEffect_BlendAnim[] = {
    PROC_CALL(StatusHealEffect_BlendSpriteAnim_InitIn),
    PROC_REPEAT(StatusHealEffect_BlendSpriteAnim_Loop),

    PROC_SLEEP(32),

    PROC_CALL(StatusHealEffect_BlendSpriteAnim_InitOut),
    PROC_REPEAT(StatusHealEffect_BlendSpriteAnim_Loop),

    PROC_END,
};

void StatusHealEffect_PalSpriteAnim_Init(struct UnknownBMUSAilmentProc* proc) {
    u16* pal = NULL;

    switch (UNIT_FACTION(gActiveUnit)) {
        case FACTION_BLUE:
            pal = &PAL_OBJ_COLOR(12, 0);
            break;

        case FACTION_RED:
            pal = &PAL_OBJ_COLOR(13, 0);
            break;

        case FACTION_GREEN:
            pal = &PAL_OBJ_COLOR(14, 0);
            break;
    }

    CopyToPaletteBuffer(pal, 0x240, 0x20);

    proc->unk_4C = 0;

    return;
}

void StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(struct UnknownBMUSAilmentProc* proc, int intensity) {
    if (intensity > 31) {
        intensity = 31;
    }

    if (intensity < 0) {
        intensity = 0;
    }

    PAL_OBJ_COLOR(2, 15) = (intensity << 10) + (intensity << 5) + intensity;

    EnablePaletteSync();

    return;
}

void StatusHealEffect_PalSpriteAnim_LoopIn(struct UnknownBMUSAilmentProc* proc) {

    StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(proc, proc->unk_4C);
    
    proc->unk_4C++;

    if (proc->unk_4C == 32) {
        Proc_Break(proc);
    }

    return;
}

void StatusHealEffect_PalSpriteAnim_LoopOut(struct UnknownBMUSAilmentProc* proc) {

    StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(proc, proc->unk_4C);

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA sProcScr_StatusHealEffect_PalAnim[] = {
    PROC_CALL(StatusHealEffect_PalSpriteAnim_Init),
    PROC_REPEAT(StatusHealEffect_PalSpriteAnim_LoopIn),
    PROC_REPEAT(StatusHealEffect_PalSpriteAnim_LoopOut),

    PROC_END,
};

void StatusHealEffect_Finish() {

    ClearBg0Bg1();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetDefaultColorEffects();

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    return;
}

struct ProcCmd CONST_DATA sProcScr_StatusHealEffect[] = {
    PROC_START_CHILD(sProcScr_StatusHealEffect_OverlayBg),
    PROC_START_CHILD(sProcScr_StatusHealEffect_BlendedSprite),
    PROC_START_CHILD(sProcScr_StatusHealEffect_BlendAnim),
    PROC_START_CHILD(sProcScr_StatusHealEffect_PalAnim),

    PROC_SLEEP(66),

    PROC_CALL(StatusHealEffect_Finish),

    PROC_END,
};

void StartStatusHealEffect(struct Unit* unit, ProcPtr proc) {
    gActiveUnit = unit;

    if (proc) {
        Proc_StartBlocking(sProcScr_StatusHealEffect, proc);
        PlaySoundEffect(0xAA);
        return;
    }

    Proc_StartBlocking(sProcScr_StatusHealEffect, PROC_TREE_3);
    return;
}

void TerrainHealDisplay_Init(struct UnknownBMUSAilmentProc* proc) {

    MakeTerrainHealTargetList(gPlaySt.faction);

    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
    }

    return;
}

void MassEffectDisplay_Check(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    gActionData.subjectIndex = target->uid;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_End(proc);
        return;
    }

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0)) {
        Proc_Goto(proc, 1);
    } else {
        if (GetUnitCurrentHp(unit) == 0) {
            Proc_Goto(proc, 1);
        }
    }

    return;
}

void MassEffectDisplay_Watch(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    EnsureCameraOntoPosition(proc, target->x, target->y);

    return;
}

void TerrainHealDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 0) {
        StartStatusHealEffect(unit, proc);
    } else {
        HideUnitSprite(unit);
        BeginUnitHealAnim(unit, target->extra);
    }

    return;
}

void FinishDamageDisplay() {
    MU_EndAll();

    if (gBattleActor.unit.curHP != 0) {
        ShowUnitSprite(GetUnit(gActionData.subjectIndex));
    }

    return;
}

void TerrainHealDisplay_Next(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 0) {
        ApplyHazardHealing(proc, unit, 0, 0);
    } else {
        ApplyHazardHealing(proc, unit, target->extra, -1);
    }

    proc->unk_4C++;

    return;
}

struct ProcCmd CONST_DATA gProcScr_TerrainHealDisplay[] = {
    PROC_CALL(TerrainHealDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(TerrainHealDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(TerrainHealDisplay_Next),

    PROC_GOTO(0),

    PROC_END,
};

void PoisonDamageDisplay_Init(struct UnknownBMUSAilmentProc* proc) {
    MakePoisonDamageTargetList(gPlaySt.faction);
    sub_8026414(4);

    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
    }

    return;
}

void PoisonDamageDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    HideUnitSprite(unit);

    BeginUnitPoisonDamageAnim(unit, target->extra);

    return;
}

void PoisonDamageDisplay_Next(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    ApplyHazardHealing(proc, unit, -(target->extra), -1);

    proc->unk_4C++;

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) == 0) {
        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }
    }

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) < 1) {
        RefreshUnitSprites();
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_PoisonDamageDisplay[] = {
    PROC_CALL(PoisonDamageDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(PoisonDamageDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(PoisonDamageDisplay_Next),
    PROC_SLEEP(0),

    PROC_GOTO(0),

    PROC_END,
};

void SetClassToHatchingGorgonEgg(struct Unit* unit) {

    if (unit->pClassData->number != CLASS_GORGONEGG2) {
        unit->pClassData = GetClassData(CLASS_GORGONEGG2);

        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        MU_EndAll();
    }

    return;
}

void GorgonEggHatchDisplay_Init(struct UnknownBMUSAilmentProc* proc) {

    MakeGorgonEggHatchTargetList(gPlaySt.faction);

    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
    }

    return;
}

void GorgonEggHatchDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    HideUnitSprite(unit);

    SetClassToHatchingGorgonEgg(unit);
    BeginGorgonEggHatchDamageAnim(unit, target->extra);

    return;
}

void GorgonEggHatchDisplay_Next(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    ApplyHazardHealing(proc, unit, target->extra, -1);

    proc->unk_4C++;

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) == 0) {
        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }
    }

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) < 1) {
        RefreshUnitSprites();
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_GorgonEggHatchDisplay[] = {
    PROC_CALL(GorgonEggHatchDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(GorgonEggHatchDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(GorgonEggHatchDisplay_Next),
    PROC_SLEEP(0),

    PROC_GOTO(0),

    PROC_END,
};

void StatusDecayDisplay_Init(struct UnknownBMUSAilmentProc* proc) {
    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
        proc->unk_58 = 0;
    }

    return;
}

void StatusDecayDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    int status = GetUnit(gActionData.subjectIndex)->statusIndex;

    proc->unk_58 = status;

    SetUnitStatus(GetUnit(gActionData.subjectIndex), UNIT_STATUS_NONE);

    switch (status) {
        case UNIT_STATUS_POISON:
        case UNIT_STATUS_SLEEP:
        case UNIT_STATUS_SILENCED:
        case UNIT_STATUS_BERSERK:
        case UNIT_STATUS_RECOVER:
        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            StartStatusHealEffect(GetUnit(target->uid), proc);
            break;
    }

    return;
}

void StatusDecayDisplay_Next(struct UnknownBMUSAilmentProc* proc) {

    if ((proc->unk_58 == UNIT_STATUS_PETRIFY) || (proc->unk_58 == UNIT_STATUS_13)) {
        SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);
        GetUnit(gActionData.subjectIndex)->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        MU_EndAll();
    }

    SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);

    proc->unk_4C++;

    return;
}

struct ProcCmd CONST_DATA gProcScr_StatusDecayDisplay[] = {
    PROC_CALL(StatusDecayDisplay_Init),

PROC_LABEL(0),
    PROC_CALL(MassEffectDisplay_Check),
    PROC_CALL(MassEffectDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(StatusDecayDisplay_Display),
    PROC_SLEEP(0),

PROC_LABEL(1),
    PROC_CALL(StatusDecayDisplay_Next),

    PROC_GOTO(0),

    PROC_END,
};

void TrapDamageDisplay_Init(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 0;
    return;
}

void TrapDamageDisplay_Check(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    gActionData.subjectIndex = target->uid;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_End(proc);
        return;
    }

    if (target->uid == 0) {
        return;
    }

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0)) {
        Proc_Goto(proc, 1);
    } else {
        if (GetUnitCurrentHp(unit) == 0) {
            Proc_Goto(proc, 1);
        }
    }

    return;
}

void TrapDamageDisplay_Watch(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);

    if (target->uid != 0 || target->extra != 6) {
        EnsureCameraOntoPosition(proc, target->x, target->y);
    }

    return;
}

void TrapDamageDisplay_Display(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);

    if (target->uid == 0) {
        switch (target->extra) {
            case TRAP_FIRETILE:
                StartFireTrapAnim(proc, target->x, target->y);
                break;

            case 0x64:
                StartGasTrapAnim(proc, target->x, target->y, 3);
                break;

            case 0x65:
                StartGasTrapAnim(proc, target->x, target->y, 2);
                break;

            case 0x66:
                StartGasTrapAnim(proc, target->x, target->y, 0);
                break;

            case 0x67:
                StartGasTrapAnim(proc, target->x, target->y, 1);
                break;

            case TRAP_LIGHTARROW:
                StartArrowTrapAnim(proc, target->x);
                break;

            case TRAP_MAPCHANGE2:
                StartShowMapChangeAnim(proc, target->x, target->y);
                break;
        }

        proc->unk_4C++;

        Proc_Goto(proc, 0);
    } else {
        gActionData.subjectIndex = target->uid;
        gActionData.trapType = target->extra;

        HideUnitSprite(GetUnit(gActionData.subjectIndex));

        if (gActionData.trapType < 6) {
            BeginUnitPoisonDamageAnim(GetUnit(gActionData.subjectIndex), target->extra);
        } else {
            BeginUnitCritDamageAnim(GetUnit(gActionData.subjectIndex), target->extra);
        }
    }

    return;
}

void TrapDamageDisplay_Next(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 6) {
        ApplyHazardHealing(proc, unit, -(target->extra), UNIT_STATUS_POISON);
    } else {
        ApplyHazardHealing(proc, unit, -(target->extra), -1);
    }

    if (GetUnitCurrentHp(unit) <= 0) {
        RefreshUnitSprites();
    }

    proc->unk_4C++;

    return;
}

struct ProcCmd CONST_DATA gProcScr_TrapDamageDisplay[] = {
    PROC_CALL(TrapDamageDisplay_Init),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(TrapDamageDisplay_Check),

    PROC_CALL(TrapDamageDisplay_Watch),
    PROC_SLEEP(0),

    PROC_CALL(TrapDamageDisplay_Display),
    PROC_SLEEP(0),

    PROC_CALL(FinishDamageDisplay),

PROC_LABEL(1),
    PROC_CALL(TrapDamageDisplay_Next),

    PROC_GOTO(0),

    PROC_END,
};
