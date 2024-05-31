#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"

#include "constants/items.h"

static u16 ItemBackupEvtBattle;
extern struct Unknown03000600 gUnknown_03000600[0x40];

//! FE8U = 0x08011CCC
void ChangeUnitAi(struct Unit * unit, u8 ai1, u8 ai2, u8 unused)
{
    if (unit->state & (US_HIDDEN | US_DEAD))
    {
        return;
    }

    if (ai1 != AI_A_INVALID)
    {
        unit->ai1 = ai1;
        unit->ai_a_pc = 0;
    }

    if (ai2 != AI_B_INVALID)
    {
        unit->ai2 = ai2;
        unit->ai_b_pc = 0;

        if (ai2 == AI_B_0C)
        {
            unit->aiFlags |= AI_UNIT_FLAG_3;
        }
    }

    return;
}

//! FE8U = 0x08011D10
void ChangeAiForCharacter(u8 pid, u8 ai1, u8 ai2, u8 unused)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number == pid)
        {
            ChangeUnitAi(unit, ai1, ai2, unused);
        }
    }

    return;
}

//! FE8U = 0x08011D60
void ChangeAiForPositions(struct Vec2 * posArray, u8 length, u8 ai1, u8 ai2, u8 unused)
{
    int i;
    s16 j;

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        for (j = 0; j < length; j++)
        {
            if (unit->xPos != posArray[j].x)
            {
                continue;
            }

            if (unit->yPos != posArray[j].y)
            {
                continue;
            }

            ChangeUnitAi(unit, ai1, ai2, unused);
        }
    }

    return;
}

//! FE8U = 0x08011DF4
void EvtBattleGenerateRealInternal(struct Unit * unitA, struct Unit * unitB)
{
    InitBattleUnit(&gBattleActor, unitA);
    InitBattleUnit(&gBattleTarget, unitB);

    gBattleStats.range =
        RECT_DISTANCE(gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
    {
        SetBattleUnitWeaponBallista(&gBattleActor);
    }
    else
    {
        SetBattleUnitWeapon(&gBattleActor, -1);
    }

    SetBattleUnitWeapon(&gBattleTarget, -1);

    BattleInitTargetCanCounter();

    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    DisableAllLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    BattleGenerate(unitA, unitB);

    EnableAllLightRunes();

    BattleUnitTargetCheckCanCounter(&gBattleTarget);
    BattleUnitTargetSetEquippedWeapon(&gBattleTarget);

    return;
}

//! FE8U = 0x08011EC8
void EvtBattleGenerateReal(struct Unit * unitA, struct Unit * unitB)
{
    gBattleStats.config = BATTLE_CONFIG_REAL;
    EvtBattleGenerateRealInternal(unitA, unitB);
}

//! FE8U = 0x08011EDC
void EvtBattleGenerateBallistaReal(struct Unit * unitA, struct Unit * unitB)
{
    gBattleStats.config = (BATTLE_CONFIG_REAL | BATTLE_CONFIG_BALLISTA);
    EvtBattleGenerateRealInternal(unitA, unitB);
}

//! FE8U = 0x08011EF0
void StartScriptBattleAnim(s8 useMapAnims)
{
    s8 banimEnabled;

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    gPaletteBuffer[0] = 0;
    EnablePaletteSync();

    RenderBmMap();

    banimEnabled = sub_8055BC4();
    if (useMapAnims)
    {
        banimEnabled = 0;
    }

    if (banimEnabled)
    {
        SetBanimLinkArenaFlag(0);
        BeginAnimsOnBattleAnimations();
    }
    else
    {
        MU_EndAll();
        RenderBmMap();
        BeginBattleMapAnims();
        gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;
    }
}

//! FE8U = 0x08011F5C
void StartEventBattle(struct Unit * unitA, struct Unit * unitB, u8 isBallista, s8 scripted_hit, u16 item, struct BattleHit * hits, s8 useMapAnims)
{
    int sp04;
    int tmp;

    SetBattleScriptted();

    sp04 = 0;
    if (hits == NULL)
    {
        sp04 = 1;
    }

    gActionData.scriptedBattleHits = (sp04 == 0) ? hits : NULL;

    if ((GetItemType(unitA->items[0]) == ITYPE_STAFF) || (item != 0))
    {
        BattleInitItemEffect(unitA, 0);
        BattleInitItemEffectTarget(unitB);
    }
    else if (!isBallista)
    {
        EvtBattleGenerateReal(unitA, unitB);
    }
    else
    {
        EvtBattleGenerateBallistaReal(unitA, unitB);
    }

    gBattleActor.weaponBefore = gBattleActor.weapon = GetUnitEquippedWeapon(unitA);
    tmp = 0x0000FFFF;
    gBattleTarget.weaponBefore = gBattleTarget.weapon = GetUnitEquippedWeapon(unitB);

    ItemBackupEvtBattle = tmp;

    if (item != 0)
    {
        switch (GetItemType(item))
        {
            case ITYPE_SWORD:
            case ITYPE_LANCE:
            case ITYPE_AXE:
            case ITYPE_BOW:
            case ITYPE_ANIMA:
            case ITYPE_LIGHT:
            case ITYPE_DARK:
            case ITYPE_11:
                ItemBackupEvtBattle = unitA->items[0];
                unitA->items[0] = MakeNewItem(item);

                if (!isBallista)
                {
                    EvtBattleGenerateReal(unitA, unitB);
                }
                else
                {
                    EvtBattleGenerateBallistaReal(unitA, unitB);
                }

                gBattleActor.weapon = MakeNewItem(item);
                gBattleActor.weaponBefore = MakeNewItem(item);

                item = 0;
                break;

            case ITYPE_STAFF:
            case ITYPE_ITEM:
            case ITYPE_DRAGN:
            case ITYPE_12:
            case 0xFF:
                gBattleActor.weaponBefore = gBattleActor.weapon = item + 0x100;

                switch (item)
                {
                    case ITEM_FILLAS_MIGHT:
                    case ITEM_NINISS_GRACE:
                    case ITEM_THORS_IRE:
                    case ITEM_SETS_LITANY:
                        gBattleStats.config = BATTLE_CONFIG_DANCERING;
                        break;
                }

                break;
        }
    }

    gBattleActor.expGain = 0;
    gBattleTarget.expGain = 0;

    if ((item != 0) && (sp04 == 0))
    {
        ClearBattleHits();

        while (1)
        {
            *gBattleHitIterator = *hits;
            if (hits->info & BATTLE_HIT_INFO_END)
            {
                break;
            }

            BattleHitAdvance();
            hits++;
        }

        BattleHitTerminate();
    }

    if (scripted_hit == 0)
    {
        /* Here we can also calc battle real */
        unitA->curHP = gBattleActor.unit.curHP;
        unitB->curHP = gBattleTarget.unit.curHP;

        SetBattleUnscriptted();

        gActionData.scriptedBattleHits = NULL;

        if (ItemBackupEvtBattle != 0x0000FFFF)
        {
            GetUnit(gBattleActor.unit.index)->items[0] = ItemBackupEvtBattle;
        }
    }
    else
    {
        UnitBeginAction(unitA);
        HideUnitSprite(gActiveUnit);
        MU_Create(gActiveUnit);
        MU_SetDefaultFacing_Auto();

        if ((GetItemType(unitA->items[0]) == ITYPE_STAFF) || (item != 0))
        {
            gActionData.unitActionType = UNIT_ACTION_STAFF;
        }
        else
        {
            gActionData.unitActionType = UNIT_ACTION_COMBAT;
        }

        StartScriptBattleAnim(useMapAnims);

        gAiDecision.xMove = unitA->xPos;
        gAiDecision.yMove = unitA->yPos;
    }
}

//! FE8U = 0x080121D4
void EventBattleReloadBmStatus(void)
{
    struct Unit * unitA;
    struct Unit * unitB;

    unitA = GetUnit(gBattleActor.unit.index);
    unitB = GetUnit(gBattleTarget.unit.index);

    unitA->curHP = gBattleActor.unit.curHP;
    unitB->curHP = gBattleTarget.unit.curHP;

    gActionData.scriptedBattleHits = NULL;
    AiRefreshMap();

    if (ItemBackupEvtBattle != 0x0000FFFF)
    {
        unitA->items[0] = ItemBackupEvtBattle;
    }

    unitA->state &= ~(US_UNSELECTABLE);
    unitB->state &= ~(US_UNSELECTABLE);

    if (gBattleStats.config & BATTLE_CONFIG_MAPANIMS)
    {
        if (unitA->curHP == 0)
        {
            unitA->state |= (US_HIDDEN | US_DEAD);
        }

        if (unitB->curHP == 0)
        {
            unitB->state |= (US_HIDDEN | US_DEAD);
        }
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();

    return;
}

//! FE8U = 0x08012270
void EventPromoteUnitExt(struct Unit * unit, u8 jid, u8 item)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    SetWinEnable(0, 0, 0);

    ExecUnitPromotion(unit, jid, -1, 0);

    gBattleActor.weaponBefore = gBattleTarget.weaponBefore = item;

    gBattleStats.config = (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_PROMOTION_PREP);
    BeginBattleAnimations();

    return;
}

//! FE8U = 0x08012324
void sub_8012324(void)
{
    EndCgText();

    ResetDialogueScreen();
    SetupBackgrounds(NULL);

    sub_80141B0();

    InitSystemTextFont();
    sub_80156D4();

    return;
}

//! FE8U = 0x08012344
int GetChapterAllyUnitCount(void)
{
    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    int count = 0;

    for (; uDef->charIndex != 0; uDef++)
    {
        count++;
    }

    return count;
}

//! FE8U = 0x08012360
void InitPlayerUnitPositionsForPrepScreen(void)
{
    int i;
    s8 x, y;

    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (uDef->charIndex == 0)
        {
            unit->xPos = -1;
            continue;
        }

        if (unit->state & (US_UNAVAILABLE | US_BIT25))
        {
            continue;
        }

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
        {
            unit->xPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX;
            unit->yPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY;
            continue;
        }

        GenUnitDefinitionFinalPosition(uDef, &x, &y, 0);

        unit->xPos = x;
        unit->yPos = y;

        uDef++;
    }

    return;
}

//! FE8U = 0x0801240C
void sub_801240C(void)
{
    int i = 1;
    int r5 = -1;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & US_DEAD)
        {
            continue;
        }

        if (unit->state & (US_NOT_DEPLOYED | US_BIT16))
        {
            unit->xPos = -1;
            unit->state |= US_HIDDEN;
            continue;
        }

        unit->state &= ~(US_HIDDEN);

        if (!(gBmSt.gameStateBits & BM_FLAG_LINKARENA) && unit->xPos == r5)
        {
            sub_801247C(unit);
        }
    }

    return;
}

//! FE8U = 0x0801247C
void sub_801247C(struct Unit * unit)
{
    int i;
    s8 x;
    s8 y;

    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
    {
        unit->xPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX;
        unit->yPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY;
        return;
    }

    while (uDef->charIndex != 0)
    {
        s8 found = 0;

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (unit->state & US_UNAVAILABLE)
            {
                continue;
            }

            GenUnitDefinitionFinalPosition(uDef, &x, &y, 0);

            if (unit->xPos != x || unit->yPos != y)
            {
                continue;
            }

            found = 1;

            break;
        }

        if (!found)
        {
            GenUnitDefinitionFinalPosition(uDef, &x, &y, 0);
            unit->xPos = x;
            unit->yPos = y;
            return;
        }

        uDef++;
    }

    return;
}

//! FE8U = 0x08012578
int sub_8012578(int index)
{
    for (; index < FACTION_GREEN; index++)
    {
        struct Unit * unit = GetUnit(index);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number == GetPlayerLeaderUnitId())
        {
            continue;
        }

        if (unit->state & US_UNAVAILABLE)
        {
            continue;
        }

        return index;
    }

    return 0;
}

//! FE8U = 0x080125C0
void sub_80125C0(struct UnitDefinition * uDef)
{
    int pid = GetPlayerLeaderUnitId();
    struct Unit * unit = GetUnitFromCharId(pid);

    if (unit)
    {
        if (!(unit->state & US_NOT_DEPLOYED))
        {
            uDef->charIndex = unit->pCharacterData->number;
            uDef->classIndex = unit->pClassData->number;
            uDef->autolevel = 0;

            uDef++;
        }
    }

    pid = 0;

    while (uDef->charIndex != 0)
    {
        pid = sub_8012578(pid);

        if (pid == 0)
        {
            break;
        }

        unit = GetUnit(pid);

        pid++;

        uDef->charIndex = unit->pCharacterData->number;
        uDef->classIndex = unit->pClassData->number;
        uDef->autolevel = 0;

        uDef++;
    }

    uDef->charIndex = 0;

    return;
}

//! FE8U = 0x0801263C
void StoreUnitWordStructs(void)
{
    int i;
    struct Unknown03000600 * it = gUnknown_03000600;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        it->pid = unit->pCharacterData->number;
        it->x = unit->xPos;
        it->y = unit->yPos;

        it++;
    }

    it->pid = 0;

    return;
}

//! FE8U = 0x08012678
void LoadUnitWordStructs(void)
{
    struct Unknown03000600 * it;

    for (it = gUnknown_03000600; it->pid != 0; it++)
    {
        struct Unit * unit = GetUnitFromCharId(it->pid);
        unit->xPos = it->x;
        unit->yPos = it->y;

        if (it->x < 0)
        {
            unit->state |= US_NOT_DEPLOYED;
        }
        else
        {
            unit->state &= ~(US_NOT_DEPLOYED);
        }
    }
    return;
}
