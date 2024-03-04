#include "global.h"
#include "bmunit.h"
#include "ap.h"
#include "mu.h"
#include "bm.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "bmmap.h"
#include "bmio.h"
#include "bmudisp.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/classes.h"
#include "constants/terrains.h"

const struct ProcCmd * GetItemAnim6CCode(void)
{
    if (gManimSt.specialProcScr)
        return gManimSt.specialProcScr;

    return ProcScr_MapAnimDefaultItemEffect;
}

void MapAnim_AnimateSubjectIdle(ProcPtr proc)
{
    MU_StartActionAnim(gManimSt.actor[gManimSt.subjectActorId].mu);
}

void MapAnim_SubjectResetAnim(ProcPtr proc)
{
    MU_StartDelayedFaceTarget(gManimSt.actor[gManimSt.subjectActorId].mu);
}

void sub_80812C0(void)
{
    if (gManimSt.actor[gManimSt.subjectActorId].unit->pClassData->number == CLASS_DANCER)
        CallDelayed(sub_8081348, 0x9);
    else
        CallDelayed(sub_8081384, 0xC);

    gManimSt.actor[gManimSt.subjectActorId].mu->pAPHandle->frameTimer = 0;
    gManimSt.actor[gManimSt.subjectActorId].mu->pAPHandle->frameInterval = 0x100;
    AP_SwitchAnimation(gManimSt.actor[gManimSt.subjectActorId].mu->pAPHandle, 0x5);
}

void sub_8081348(void)
{
    PlaySeSpacial(0x2D5,
        gManimSt.actor[gManimSt.subjectActorId].unit->xPos * 0x10 - gBmSt.camera.x);
}

void sub_8081384(void)
{
    PlaySeSpacial(0x2D6,
        gManimSt.actor[gManimSt.subjectActorId].unit->xPos * 0x10 - gBmSt.camera.x);
}

void sub_80813C0(void)
{
    gManimSt.actor[gManimSt.subjectActorId].mu->pAPHandle->frameTimer = 0;
    gManimSt.actor[gManimSt.subjectActorId].mu->pAPHandle->frameInterval = 0;
}

void MapAnim_BeginSubjectFastAnim(void)
{
    MU_StartFastMoveAnim(gManimSt.actor[gManimSt.subjectActorId].mu);
}

void MapAnimMoveUnitTowardsTargetExt(struct MUProc * mu1, struct MUProc * mu2)
{
    int x1, x2, y1, y2, distance;

    x1 = mu1->xSubPosition;
    x2 = mu2->xSubPosition;

    distance = x2 - x1;
    if (distance <= 0)
    {
        int tmp = x1;
        if (distance < 0)
            tmp = tmp - 0x10;

        x1 = tmp;
    }
    else
        x1 = x1 + 0x10;

    mu1->xSubPosition = x1;

    y1 = mu1->ySubPosition;
    y2 = mu2->ySubPosition;

    distance = y2 - y1;
    if (distance <= 0)
    {
        int tmp = y1;
        if (distance < 0)
            tmp = tmp - 0x10;

        y1 = tmp;
    }
    else
        y1 = y1 + 0x10;

    mu1->ySubPosition = y1;
}

void MapAnimMoveUnitAwayFromTargetExt(struct MUProc * mu1, struct MUProc * mu2)
{
    int x1, x2, y1, y2, distance;

    x1 = mu1->xSubPosition;
    x2 = mu2->xSubPosition;

    distance = x1 - x2;
    if (distance <= 0)
    {
        int tmp = x1;
        if (distance < 0)
            tmp = tmp - 0x10;

        x1 = tmp;
    }
    else
        x1 = x1 + 0x10;

    mu1->xSubPosition = x1;

    y1 = mu1->ySubPosition;
    y2 = mu2->ySubPosition;

    distance = y1 - y2;
    if (distance <= 0)
    {
        int tmp = y1;
        if (distance < 0)
            tmp = tmp - 0x10;

        y1 = tmp;
    }
    else
        y1 = y1 + 0x10;

    mu1->ySubPosition = y1;
}

void MapAnim_MoveSubjectsTowardsTarget(void)
{
    struct MUProc * mu, * mu2;

    mu  = gManimSt.actor[gManimSt.subjectActorId].mu;
    mu2 = gManimSt.actor[gManimSt.targetActorId].mu;
    MapAnimMoveUnitTowardsTargetExt(mu, mu2);

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_TATTACK)
    {
        mu  = gManimSt.actor[2].mu;
        MapAnimMoveUnitTowardsTargetExt(mu, mu2);

        mu  = gManimSt.actor[3].mu;
        MapAnimMoveUnitTowardsTargetExt(mu, mu2);
    }
}

void MapAnim_MoveSubjectsAwayFromTarget(void)
{
    struct MUProc * mu, * mu2;

    mu  = gManimSt.actor[gManimSt.subjectActorId].mu;
    mu2 = gManimSt.actor[gManimSt.targetActorId].mu;
    MapAnimMoveUnitAwayFromTargetExt(mu, mu2);

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_TATTACK)
    {
        mu  = gManimSt.actor[2].mu;
        MapAnimMoveUnitAwayFromTargetExt(mu, mu2);

        mu  = gManimSt.actor[3].mu;
        MapAnimMoveUnitAwayFromTargetExt(mu, mu2);
    }
}

void MapAnim_MoveCameraOnSubject(ProcPtr proc)
{
    struct Unit * unit = gManimSt.actor[gManimSt.subjectActorId].unit;
    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
}

void MapAnim_MoveCameraOnTarget(ProcPtr proc)
{
    struct Unit * unit = gManimSt.actor[gManimSt.targetActorId].unit;
    EnsureCameraOntoPosition(proc, unit->xPos, unit->yPos);
}

void SpellWarpMoveCamera(ProcPtr proc)
{
    gManimSt.xtarget = gBattleTarget.changeHP;
    gManimSt.ytarget = gBattleTarget.changePow;
    EnsureCameraOntoPosition(proc, gManimSt.xtarget, gManimSt.ytarget);
}

void MapAnim_BeginRoundSpecificAnims(ProcPtr proc)
{
    int map_actor = gManimSt.subjectActorId;
    bool vall_broken;
    int map_target;
    int sfx;

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_DEVIL)
        map_target = gManimSt.subjectActorId;
    else
        map_target = gManimSt.targetActorId;

    if (false == GetSpellAssocReturnBool(gManimSt.actor[map_actor].bu->weaponBefore))
    {
        if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_MISS)
            MapAnim_BeginMISSAnim(gManimSt.actor[map_target].unit);

        return;
    }

    gManimSt.hp_changing = 1;

    if (gManimSt.actor[0].unit->statusIndex == UNIT_STATUS_RECOVER)
        RegisterMapHpChangeAnim(map_actor, -gManimSt.hitDamage);
    else
        RegisterMapHpChangeAnim(map_target, gManimSt.hitDamage);

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_HPSTEAL)
        RegisterMapHpChangeAnim(map_actor, -gManimSt.hitDamage);

    if (gManimSt.hitDamage < 0)
        return;

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_MISS)
    {
        PlaySeSpacial(0xC8,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x);

        MapAnim_BeginMISSAnim(gManimSt.actor[map_target].unit);
        return;
    }

    if (gManimSt.hitDamage == 0)
    {
        if (0 == (gManimSt.hitAttributes & BATTLE_HIT_ATTR_PETRIFY))
        {
            PlaySeSpacial(0x2CE,
                gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x);

            MapAnim_BeginNODAMAGEAnim(gManimSt.actor[map_target].unit);
        }
        return;
    }

    vall_broken = false;
    if (gManimSt.actor[map_target].bu->terrainId == TERRAIN_WALL_1B || gManimSt.actor[map_target].bu->terrainId == TERRAIN_SNAG)
        vall_broken = true;

    if (vall_broken)
    {
        if (gManimSt.hitInfo & 0x2)
        {
            sfx = 0xAF;
            MapAnim_BeginWallBreakAnim(gManimSt.actor[map_target].unit, 1);
        }
        else
        {
            sfx = 0xB0;
            MapAnim_BeginWallBreakAnim(gManimSt.actor[map_target].unit, 0);
        }
    }
    else
    {
        if (gManimSt.actor[0].unit->statusIndex == UNIT_STATUS_RECOVER)
            sfx = 0x3C9;
        else
        {
            int hitinfo = gManimSt.hitInfo & 0x2;
            sfx = 0xD2;
            if (hitinfo)
                sfx = 0xD5;
        }
    }

    if (gManimSt.hitAttributes & 0x1)
    {
        PlaySeSpacial(
            sfx,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x
        );

        MU_StartCritFlash(
            gManimSt.actor[map_target].mu,
            GetSpellAssocFlashColor(gManimSt.actor[map_actor].bu->weaponBefore)
        );

        NewBG0Shaker();
        PlaySeSpacial(
            0xD8,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x
        );

        MU_StartFastMoveAnim(gManimSt.actor[map_actor].mu);
    }
    else
    {
        PlaySeSpacial(
            sfx,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x
        );

        MU_StartHitFlash(
            gManimSt.actor[map_target].mu,
            GetSpellAssocFlashColor(gManimSt.actor[map_actor].bu->weaponBefore)
        );
    }
}

void RegisterMapHpChangeAnim(int mapst_id, int damage)
{
    int hp_cur = gManimSt.actor[mapst_id].hp_cur;

    if (hp_cur <= damage)
        gManimSt.actor[mapst_id].hp_cur = 0;
    else
        gManimSt.actor[mapst_id].hp_cur = hp_cur - damage;

    if (gManimSt.actor[mapst_id].hp_cur > gManimSt.actor[mapst_id].hp_max)
        gManimSt.actor[mapst_id].hp_cur = gManimSt.actor[mapst_id].hp_max;
}

void MapAnim_WaitForHPToEndChangingMaybe(ProcPtr proc)
{
    if (gManimSt.hp_changing == false)
        Proc_Break(proc);
}

void MapAnim_PoisonEffectOnTarget(ProcPtr proc)
{
    NewMapPoisonEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void sub_8081950(ProcPtr proc)
{
    NewMapAnimPoisonAnim2(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnim_StartGorgonHatchConditional(ProcPtr proc)
{
    if (gManimSt.actor[0].hp_cur >= gManimSt.actor[0].hp_max)
        MapAnim_StartGorgonHatchAnim(gManimSt.actor[gManimSt.targetActorId].unit);
    else
        Proc_EndEach(ProcScr_EggDmgMapEffect2);
}

void MapAnimCallSpellAssocSilence(ProcPtr proc)
{
    MapAnimCallSpellAssocSilencefx(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocBarrier(ProcPtr proc)
{
    MapAnimCallSpellAssocBarrierfx(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocLatona(ProcPtr proc)
{
    MapAnimCallSpellAssocLatonafx(gManimSt.actor[gManimSt.subjectActorId].unit);
}

void MapAnimCallSpellAssocNightMare(ProcPtr proc)
{
    MapAnimCallSpellAssocNightMarefx(gManimSt.actor[gManimSt.subjectActorId].unit);
}

void MapAnimCallSpellAssocAntitoxin(ProcPtr proc)
{
    MapAnimCallSpellAssocAntitoxinPureWaterfx(gManimSt.actor[gManimSt.subjectActorId].unit,
        Img_MapAnimAntitoxinPureWater, Pal_MapAnimAntitoxin);
}

void MapAnimCallSpellAssocPureWater(ProcPtr proc)
{
    MapAnimCallSpellAssocAntitoxinPureWaterfx(gManimSt.actor[gManimSt.subjectActorId].unit,
        Img_MapAnimAntitoxinPureWater, Pal_MapAnimPureWater);
}

void MapAnimCallSpellAssocElixir(ProcPtr proc)
{
    NewMapAnimEffectAnimator(gManimSt.actor[gManimSt.targetActorId].unit,
        gUnknown_089AFCBC, Pal_089AFF78, 0x8B);
}

void MapAnimCallSpellAssocHeal(ProcPtr proc)
{
    NewMapAnimEffectAnimator(gManimSt.actor[gManimSt.targetActorId].unit,
        gUnknown_089AF950, Pal_089AFF78, 0x89);
}

void MapAnimCallSpellAssocMend(ProcPtr proc)
{
    NewMapAnimEffectAnimator(gManimSt.actor[gManimSt.targetActorId].unit,
        gUnknown_089AFAC4, Pal_089AFF78, 0x8A);
}

void MapAnimCallSpellAssocRecover(ProcPtr proc)
{
    NewMapAnimEffectAnimator(gManimSt.actor[gManimSt.targetActorId].unit,
        gUnknown_089AFCBC, Pal_089AFF78, 0x8B);
}

void MapAnimCallSpellAssocVulenrary(ProcPtr proc)
{
    NewMapAnimEffectAnimator(gManimSt.actor[gManimSt.targetActorId].unit,
        gUnknown_089AF950, Pal_089AFF78, 0x89);
}

void SpellWarpStartFlashy(ProcPtr proc)
{
    struct Unit * unit;

    PlaySoundEffect(0xB4);
    gManimSt.xtarget = gBattleTarget.changeHP;
    gManimSt.ytarget = gBattleTarget.changePow;

    unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartWarpFlashy(unit, unit->xPos, unit->yPos);
}

void SpellWarpStartFlashyAtNewPos(ProcPtr proc)
{
    struct Unit * unit;
    unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartWarpFlashy(
        gManimSt.actor[gManimSt.targetActorId].unit,
        gManimSt.xtarget,
        gManimSt.ytarget
    );
}

void MapAnimCallSpellAssocTorch(ProcPtr proc)
{
    MapAnimTorchEffect(gManimSt.actor[gManimSt.subjectActorId].unit);
}

void MapAnimCallSpellAssocUnlock(ProcPtr proc)
{
    MapAnimUnlockEffect(gManimSt.xtarget, gManimSt.ytarget);
}

void MapAnimCallSpellAssocBerserk(ProcPtr proc)
{
    MapAnimBerserkEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocRestore(ProcPtr proc)
{
    MapAnimRestoreEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocSleep(ProcPtr proc)
{
    MapAnimSleepEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocMonsterStone(ProcPtr proc)
{
    MapAnimMonsterStoneEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocRepair(ProcPtr proc)
{
    MapAnimRepairEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void SpellWarpStartFlashFade(ProcPtr proc)
{
    MU_StartFlashFade(gManimSt.actor[gManimSt.targetActorId].mu, 0);
}

void sub_8081CF8(ProcPtr proc)
{
    MU_8079858(gManimSt.actor[gManimSt.targetActorId].mu);
}

void SpellWarpMuHide(ProcPtr proc)
{
    MU_Hide(gManimSt.actor[gManimSt.targetActorId].mu);
}

void SpellWarpStartExplosion(ProcPtr proc)
{
    struct Unit * unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartStarExplosionEffect(
        unit->xPos * 0x10 - gBmSt.camera.x + 0x8,
        unit->yPos * 0x10 - gBmSt.camera.y + 0x8
    );
}

void SpellWarpStartImplosion(ProcPtr proc)
{
    struct Unit * unit;

    PlaySoundEffect(0xB5);
    
    unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartStarImplosionEffect(
        unit->xPos * 0x10 - gBmSt.camera.x + 0x8,
        unit->yPos * 0x10 - gBmSt.camera.y + 0x8
    );
}

void SpellWarpMuShow(ProcPtr proc)
{
    MU_Show(gManimSt.actor[gManimSt.targetActorId].mu);
}

void SpellWarpSetNewPosition(ProcPtr proc)
{
    struct Unit * unit = gManimSt.actor[gManimSt.targetActorId].unit;
    struct MUProc * mu = gManimSt.actor[gManimSt.targetActorId].mu;

    MU_SetDisplayPosition(
        mu,
        gManimSt.xtarget * 0x10,
        gManimSt.ytarget * 0x10);

    unit->xPos = gManimSt.xtarget;
    unit->yPos = gManimSt.ytarget;
}

void MapAnimStartSpellAssocFade(ProcPtr proc)
{
    MapAnimStartSpellAssocFadeExt(proc);
}

void MapAnimSpellAssocResetPal(ProcPtr proc)
{
    MapAnimSpellAssocResetPalExt(proc);
}

void sub_8081E60(ProcPtr proc)
{
    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    MU_EndAll();
}

CONST_DATA struct ProcCmd ProcScr_MapAnimDefaultItemEffect[] = {
    PROC_CALL(MapAnim_BeginSubjectFastAnim),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x8),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x14),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocNightMare[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_SLEEP(0x1A),
    PROC_CALL(MapAnimCallSpellAssocNightMare),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0xDC),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocLatona[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocLatona),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0xC8),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocAntitoxin[] = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocAntitoxin),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x46),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocPureWater[] = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocPureWater),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x46),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocElixir[] = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocElixir),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocVulenrary[] = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocVulenrary),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocHeal[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocHeal),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocMend[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocMend),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocRecover[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocRecover),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocPhysic[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocHeal),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocTorch[] = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocTorch),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x64),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocUnlock[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(SpellWarpMoveCamera),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocUnlock),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x8C),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocBerserk[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocBerserk),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x32),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocSleep[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocSleep),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x8c),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocMonsterStone[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocMonsterStone),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x3c),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocSilence[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocSilence),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x40),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocRestore[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocRestore),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x50),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocRepair[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocRepair),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x50),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocUnused[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_PoisonEffectOnTarget),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x5E),
    PROC_SLEEP(0xA),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PoisonDmgMapEffect[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_PoisonEffectOnTarget),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x32),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0x2C),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EggDmgMapEffect1[] =
{
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(2),

    PROC_CALL(SpellWarpStartFlashFade),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(5),

    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(5),

    PROC_CALL(sub_8081E60),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_EggDmgMapEffect2[] =
{
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(2),

    PROC_CALL(MapAnim_StartGorgonHatchConditional),
    PROC_SLEEP(2),

    PROC_SLEEP(50),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_CritAtkMapEffect[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0x14),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocBarrier[] = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocBarrier),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x3C),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_SpellAssocWarp[] = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(SpellWarpStartFlashy),
    PROC_SLEEP(0xA),
    PROC_CALL(SpellWarpStartFlashFade),
    PROC_SLEEP(0x14),
    PROC_CALL(SpellWarpStartExplosion),
    PROC_SLEEP(0x2),
    PROC_CALL(SpellWarpMuHide),
    PROC_SLEEP(0x8),
    PROC_CALL(SpellWarpSetNewPosition),
    PROC_SLEEP(0x1E),
    PROC_CALL(SpellWarpMoveCamera),
    PROC_SLEEP(0x2),
    PROC_CALL(SpellWarpStartImplosion),
    PROC_SLEEP(0x28),
    PROC_CALL(SpellWarpStartFlashyAtNewPos),
    PROC_SLEEP(0xA),
    PROC_CALL(SpellWarpMuShow),
    PROC_CALL(sub_8081CF8),
    PROC_SLEEP(0x10),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_MoveCameraOnSubject),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END
};
