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
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"

#include "constants/items.h"

struct Proc85924D8
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ u32 unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u16 unk_48;
    /* 4A */ STRUCT_PAD(0x4A, 0x4C);
    /* 4C */ s16 unk_4c;
};

struct Unknown03000600
{
    u8 pid;
    s8 x;
    s8 y;
};

extern u16 gUnknown_030005FC;
extern struct Unknown03000600 gUnknown_03000600[];

extern u16 gUnknown_08A4D0CC[];
extern u8 gUnknown_08A4CF2C[];

// forward declarations
void sub_801247C(struct Unit *);

extern struct ProcCmd gUnknown_085924D8[];

//! FE8U = 0x08011784
void sub_8011784(struct Proc85924D8 * proc)
{
    int i;

    int oam2A = (((proc->unk_38 + 0x400) & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL((proc->unk_3c + 1));
    int oam2B = ((proc->unk_38 & 0x0001FFFF) / CHR_SIZE) | OAM2_PAL(proc->unk_3c);

    PutSpriteExt(4, proc->unk_30, proc->unk_34 + proc->unk_48, gObject_16x8, oam2B);
    PutSpriteExt(4, proc->unk_30 + (proc->unk_44 - 2) * 8, proc->unk_34 + proc->unk_48, gObject_16x8, oam2B + 4);
    PutSpriteExt(4, proc->unk_30, proc->unk_34 + 0x18 + proc->unk_48, gObject_16x8, oam2B + 0xd);
    PutSpriteExt(
        4, proc->unk_30 + (proc->unk_44 - 2) * 8, proc->unk_34 + 0x18 + proc->unk_48, gObject_16x8, oam2B + 0x11);

    PutSpriteExt(4, proc->unk_30, proc->unk_34 + 8 + proc->unk_48, gObject_8x8, oam2B + 6);
    PutSpriteExt(4, proc->unk_30, proc->unk_34 + 16 + proc->unk_48, gObject_8x8, oam2B + 11);
    PutSpriteExt(4, proc->unk_30 + (proc->unk_44 - 1) * 8, proc->unk_34 + 8 + proc->unk_48, gObject_8x8, oam2B + 10);
    PutSpriteExt(4, proc->unk_30 + (proc->unk_44 - 1) * 8, proc->unk_34 + 16 + proc->unk_48, gObject_8x8, oam2B + 12);

    for (i = 2; i < proc->unk_44 - 2; i += 2)
    {
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + proc->unk_48, gObject_16x8, oam2B + 2);
    }

    for (; i < proc->unk_44 - 1; i++)
    {
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + proc->unk_48, gObject_8x8, oam2B + 2);
    }

    for (i = 2; i < proc->unk_44 - 2; i += 2)
    {
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + 0x18 + proc->unk_48, gObject_16x8, oam2B + 15);
    }

    for (i = 1; i < proc->unk_44 - 2; i += 2)
    {
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + 8 + proc->unk_48, gObject_16x8, oam2B + 8);
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + 16 + proc->unk_48, gObject_16x8, oam2B + 8);
    }

    for (; i < proc->unk_44 - 1; i++)
    {
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + 8 + proc->unk_48, gObject_8x8, oam2B + 8);
        PutSpriteExt(4, proc->unk_30 + i * 8, proc->unk_34 + 16 + proc->unk_48, gObject_8x8, oam2B + 8);
    }

    for (i = 0; i < 3; i++)
    {
        PutSpriteExt(0, proc->unk_30 + 8 + (i * 32), proc->unk_34 + 8 + proc->unk_48, gObject_32x16, oam2A + i * 4);
    }

    return;
}

//! FE8U = 0x08011A18
void nullsub_44(void)
{
    return;
}

//! FE8U = 0x08011A1C
void sub_8011A1C(struct Proc85924D8 * proc, s8 flag)
{
    if (!proc)
    {
        return;
    }

    if (flag != 0)
    {
        proc->unk_48 = 0x400;
    }
    else
    {
        proc->unk_48 = 0;
    }

    return;
}

//! FE8U = 0x08011A48
void sub_8011A48(struct Proc85924D8 * proc)
{
    proc->unk_4c = 0;

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    sub_8011A1C(Proc_Find(gUnknown_085924D8), 1);

    return;
}

//! FE8U = 0x08011AA0
void sub_8011AA0(struct Proc85924D8 * proc)
{
    int blendVal;

    proc->unk_4c++;
    blendVal = proc->unk_4c;

    SetBlendAlpha(blendVal, 0x10 - blendVal);

    if (blendVal == 0x10)
    {
        Proc_Break(proc);
        SetBlendNone();

        sub_8011A1C(Proc_Find(gUnknown_085924D8), 0);
    }

    return;
}

//! FE8U = 0x08011AF4
void sub_8011AF4(struct Proc85924D8 * proc)
{
    proc->unk_4c = 0;

    SetBlendAlpha(0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    sub_8011A1C(Proc_Find(gUnknown_085924D8), 1);

    return;
}

//! FE8U = 0x08011B4C
void sub_8011B4C(struct Proc85924D8 * proc)
{
    int blendVal;

    proc->unk_4c++;
    blendVal = proc->unk_4c;

    SetBlendAlpha(0x10 - blendVal, blendVal);

    if (blendVal == 0x10)
    {
        Proc_End(Proc_Find(gUnknown_085924D8));
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08011B90
void sub_8011B90(void)
{
    SetBlendNone();
    return;
}

//! FE8U = 0x08011BA4
void sub_8011BA4(int x, int y, int textId, int chr, int pal, ProcPtr parent)
{
    struct Font font;
    struct Text text;

    int r6 = 0;
    int r4;

    struct Proc85924D8 * proc = Proc_Start(gUnknown_085924D8, parent);
    const char * str = GetStringFromIndex(textId);

    proc->unk_30 = x;
    proc->unk_34 = y;
    proc->unk_38 = chr;
    proc->unk_3c = pal;
    proc->unk_40 = textId;
    proc->unk_48 = 0;

    ApplyPalette(gUnknown_08A4D0CC, (proc->unk_3c + 0x10));
    ApplyPalette(Pal_Text, (proc->unk_3c + 0x11));
    Decompress(gUnknown_08A4CF2C, (void *)(0x06010000 + proc->unk_38));

    r6 = GetStringTextLen(str);

    r4 = r6 / 8;
    r6 = r4 + 5;

    proc->unk_44 = r6;

    InitSpriteTextFont(&font, (void *)(proc->unk_38 + 0x06010400), proc->unk_3c + 0x12);
    SetTextFont(&font);
    InitSpriteText(&text);
    SpriteText_DrawBackgroundExt(&text, 0);
    SetTextFontGlyphs(0);

    Text_InsertDrawString(&text, GetStringTextCenteredPos((r4 + 3) * 8, str), 0, str);

    SetTextFont(NULL);

    return;
}

extern struct ProcCmd gUnknown_08592530[];

//! FE8U = 0x08011C94
void sub_8011C94(int textId, s16 x, s16 y, ProcPtr parent)
{
    sub_8011BA4(x, y, textId, 0x5000, 9, parent);
    Proc_StartBlocking(gUnknown_08592530, parent);
    return;
}

//! FE8U = 0x08011CCC
void sub_8011CCC(struct Unit * unit, u8 ai1, u8 ai2, u8 unused)
{
    if (unit->state & (US_HIDDEN | US_DEAD))
    {
        return;
    }

    if (ai1 != 0x15)
    {
        unit->ai1 = ai1;
        unit->ai1data = 0;
    }

    if (ai2 != 0x13)
    {
        unit->ai2 = ai2;
        unit->ai2data = 0;

        if (ai2 == 0xc)
        {
            unit->aiFlags |= AI_UNIT_FLAG_3;
        }
    }

    return;
}

//! FE8U = 0x08011D10
void sub_8011D10(u8 pid, u8 ai1, u8 ai2, u8 unused)
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
            sub_8011CCC(unit, ai1, ai2, unused);
        }
    }

    return;
}

//! FE8U = 0x08011D60
void sub_8011D60(struct Vec2 * posArray, u8 length, u8 ai1, u8 ai2, u8 unused)
{
    s16 j;
    int i;

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

            sub_8011CCC(unit, ai1, ai2, unused);
        }
    }

    return;
}

//! FE8U = 0x08011DF4
void sub_8011DF4(struct Unit * unitA, struct Unit * unitB)
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
void sub_8011EC8(struct Unit * unitA, struct Unit * unitB)
{
    gBattleStats.config = BATTLE_CONFIG_REAL;
    sub_8011DF4(unitA, unitB);

    return;
}

//! FE8U = 0x08011EDC
void sub_8011EDC(struct Unit * unitA, struct Unit * unitB)
{
    gBattleStats.config = (BATTLE_CONFIG_REAL | BATTLE_CONFIG_BALLISTA);
    sub_8011DF4(unitA, unitB);

    return;
}

//! FE8U = 0x08011EF0
void sub_8011EF0(s8 useMapAnims)
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

    return;
}

//! FE8U = 0x08011F5C
void sub_8011F5C(struct Unit * unitA, struct Unit * unitB, u8 isBallista, s8 unkFlag, u16 item, struct BattleHit * hits, s8 useMapAnims)
{
    int sp04;
    int tmp;

    sub_8058B64();

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
        sub_8011EC8(unitA, unitB);
    }
    else
    {
        sub_8011EDC(unitA, unitB);
    }

    gBattleActor.weaponBefore = gBattleActor.weapon = GetUnitEquippedWeapon(unitA);
    tmp = 0x0000FFFF;
    gBattleTarget.weaponBefore = gBattleTarget.weapon = GetUnitEquippedWeapon(unitB);

    gUnknown_030005FC = tmp;

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
                gUnknown_030005FC = unitA->items[0];
                unitA->items[0] = MakeNewItem(item);

                if (isBallista == 0)
                {
                    sub_8011EC8(unitA, unitB);
                }
                else
                {
                    sub_8011EDC(unitA, unitB);
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

    if (unkFlag == 0)
    {
        unitA->curHP = gBattleActor.unit.curHP;
        unitB->curHP = gBattleTarget.unit.curHP;

        sub_8058B70();

        gActionData.scriptedBattleHits = NULL;

        if (gUnknown_030005FC != 0x0000FFFF)
        {
            GetUnit(gBattleActor.unit.index)->items[0] = gUnknown_030005FC;
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

        sub_8011EF0(useMapAnims);

        gAiDecision.xMove = unitA->xPos;
        gAiDecision.yMove = unitA->yPos;
    }

    return;
}

//! FE8U = 0x080121D4
void sub_80121D4(void)
{
    struct Unit * unitA;
    struct Unit * unitB;

    unitA = GetUnit(gBattleActor.unit.index);
    unitB = GetUnit(gBattleTarget.unit.index);

    unitA->curHP = gBattleActor.unit.curHP;
    unitB->curHP = gBattleTarget.unit.curHP;

    gActionData.scriptedBattleHits = NULL;
    AiRefreshMap();

    if (gUnknown_030005FC != 0x0000FFFF)
    {
        unitA->items[0] = gUnknown_030005FC;
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
void sub_8012270(struct Unit * unit, u8 jid, u8 item)
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
    sub_808F270();

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
    struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

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
    s8 x;
    s8 y;

    struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

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

        GetPreferredPositionForUNIT(uDef, &x, &y, 0);

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

    struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

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

            GetPreferredPositionForUNIT(uDef, &x, &y, 0);

            if (unit->xPos != x || unit->yPos != y)
            {
                continue;
            }

            found = 1;

            break;
        }

        if (!found)
        {
            GetPreferredPositionForUNIT(uDef, &x, &y, 0);
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
