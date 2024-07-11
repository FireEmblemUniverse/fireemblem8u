#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"

#include "unitlistscreen.h"

bool CheckInLinkArena(void);

extern u16 Sprite_08A17B64[];
extern u16 Sprite_08A17B6C[];
extern u16 * gSpriteArray_08A17C20[];

extern u8 Img_08A1CD68[];
extern u8 Img_UnitListBanners[];
extern u8 Img_UnitListBanner_Animation[];

extern u16 Pal_SpinningArrow[];

extern u8 gUnknown_08A1C8B4[]; // tsa

extern u16 gUnknown_0200D7E0[][0x20];
extern u16 gUnknown_0200DFE0[][0x20];

extern struct Text gUnknown_0200E060[];
extern struct Text gUnknown_0200E098[][3];
extern struct Text gUnknown_0200E140;
extern struct Text gUnknown_0200E148;
extern struct Text gUnknown_0200E150;
extern struct Unit gUnknown_0200E158[];
extern u8 gUnknown_0200F158;
extern u32 gUnknown_0200F15C[]; // equipped item icons

// clang-format off

struct ProcCmd CONST_DATA ProcScr_UnitListScreen_Field[] =
{
    PROC_NAME("bmenu"),
    PROC_MARK(PROC_MARK_8),

    PROC_CALL(LockGame),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(BMapDispSuspend),

    PROC_CALL(UnitList_Init),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

PROC_LABEL(1),
    PROC_CALL(UnitList_SetBlendEffects),
    PROC_REPEAT(sub_8091AEC),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnitList_OnEnd),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(EndAllMus),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnlockGame),

    PROC_GOTO(4),

PROC_LABEL(2),
    PROC_CALL(UnitList_StartPageChange),
    PROC_REPEAT(sub_8091D54),
    PROC_REPEAT(sub_8091F10),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_CALL(UnitList_StartStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetFromStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetDispFromStatScreen),

    PROC_GOTO(1),

PROC_LABEL(4),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_UnitListScreen_PrepMenu[] =
{
    PROC_NAME("bmenu"),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_Init),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

PROC_LABEL(1),
    PROC_CALL(UnitList_SetBlendEffects),
    PROC_REPEAT(sub_8091AEC),

    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnitList_OnEnd),

    PROC_GOTO(4),

PROC_LABEL(2),
    PROC_CALL(UnitList_StartPageChange),
    PROC_REPEAT(sub_8091D54),
    PROC_REPEAT(sub_8091F10),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_CALL(UnitList_StartStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetFromStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetDispFromStatScreen),

    PROC_GOTO(1),

PROC_LABEL(4),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_UnitListScreen_SoloAnim[] =
{
    PROC_YIELD,

    PROC_CALL(UnitList_Init),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

PROC_LABEL(1),
    PROC_CALL(UnitList_SetBlendEffects),
    PROC_REPEAT(sub_8091AEC),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnitList_OnEnd),

    PROC_GOTO(4),

PROC_LABEL(3),
    PROC_CALL(UnitList_StartStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetFromStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetDispFromStatScreen),

    PROC_GOTO(1),

PROC_LABEL(4),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_UnitListScreen_WorldMap[] =
{
    PROC_NAME("bmenu"),

    PROC_CALL(LockGame),

    PROC_CALL(UnitList_Init),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

PROC_LABEL(1),
    PROC_CALL(UnitList_SetBlendEffects),
    PROC_REPEAT(sub_8091AEC),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnitList_OnEnd),

    PROC_CALL(UnlockGame),

    PROC_GOTO(4),

PROC_LABEL(2),
    PROC_CALL(UnitList_StartPageChange),
    PROC_REPEAT(sub_8091D54),
    PROC_REPEAT(sub_8091F10),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_CALL(UnitList_StartStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetFromStatScreen),
    PROC_SLEEP(1),

    PROC_CALL(UnitList_ResetDispFromStatScreen),

    PROC_GOTO(1),

PROC_LABEL(4),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_bmview[] =
{
    PROC_NAME("bmview"),

    PROC_CALL(UnitListScreenSprites_Init),
    PROC_REPEAT(UnitListScreenSprites_Main),

    PROC_CALL(UnitListScreenSprites_Dummy),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0809014C
void sub_809014C(void)
{
    int i;

    InitUnitStack(gUnknown_0200E158);

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!IsUnitInCurrentRoster(unit))
        {
            continue;
        }

        PushUnit(unit);
    }

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (IsUnitInCurrentRoster(unit))
        {
            continue;
        }

        PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();

    return;
}

extern u16 * gSpriteArray_08A17B58[];

//! FE8U = 0x080901BC
void sub_80901BC(u8 x, u8 y, u8 width)
{
    int i;

    PutSpriteExt(0xd, x, y, gSpriteArray_08A17B58[0], OAM2_PAL(5));

    for (i = 0; i < width - 1; i++)
    {
        PutSpriteExt(0xd, x + i * 16 + 8, y, gSpriteArray_08A17B58[1], OAM2_PAL(5));
    }

    PutSpriteExt(0xd, x + i * 16 + 8, y, gSpriteArray_08A17B58[2], OAM2_PAL(5));

    return;
}

//! FE8U = 0x08090238
void sub_8090238(u8 key)
{
    int i;
    int j;

    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1), 4, 1, 0);

    ClearText(&gUnknown_0200E150);

    for (i = 0; i < 10; i++)
    {
        for (j = 0; j < 9; j++)
        {
            if (gUnitListScreenFields[i][j].sortKey == key)
            {
                Text_SetCursor(&gUnknown_0200E150, 0);
                Text_SetColor(&gUnknown_0200E150, 0);

                Text_DrawString(&gUnknown_0200E150, GetStringFromIndex(0x000004FD));

                if ((i == 5) && (j != 0))
                {
                    PutText(&gUnknown_0200E150, TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1));
                    DrawIcon(TILEMAP_LOCATED(gBG2TilemapBuffer, 25, 1), j + 111, OAM2_PAL(5));
                }
                else
                {
                    Text_Skip(&gUnknown_0200E150, 4);
                    Text_DrawString(&gUnknown_0200E150, GetStringFromIndex(gUnitListScreenFields[i][j].labelString));
                    PutText(&gUnknown_0200E150, TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1));
                }

                break;
            }
        }
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x08090324
void sub_8090324(int itemIconId)
{
    int i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] == itemIconId)
        {
            return;
        }
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] == UINT8_MAX)
        {
            gUnknown_0200F15C[i] = itemIconId;
            return;
        }
    }

    return;
}

//! FE8U = 0x08090358
void sub_8090358(u16 arg_0)
{
    int displayIcons[10];
    int i;
    int j;

    int offset = arg_0 / 16;

    for (i = 0; i < 8; i++)
    {
        displayIcons[i] = UINT8_MAX;
    }

    if (offset > 0)
        offset = offset - 1;

    for (i = 0; i < 8 && i + offset < gUnknown_0200F158; i++)
    {
        if (GetUnitEquippedWeapon(gSortedUnits[offset + i]->unit) != 0)
        {
            displayIcons[i] = GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[offset + i]->unit));
        }
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] != UINT8_MAX)
        {
            s8 iconInUse = 0;

            for (j = 0; j < 8; j++)
            {
                if (displayIcons[j] == gUnknown_0200F15C[i])
                    iconInUse = 1;
            }

            if (!iconInUse)
            {
                ClearIconGfx(gUnknown_0200F15C[i]);
                gUnknown_0200F15C[i] = UINT8_MAX;
            }
        }
    }

    return;
}

//! FE8U = 0x08090418
void sub_8090418(struct UnitListScreenProc * proc, s8 unk)
{
    int i;

    int unitId;

    if (unk != 0)
    {
        unitId = PrepGetLatestCharId();
    }
    else
    {
        unitId = GetLastStatScreenUid();
    }

    for (i = 0; i < gUnknown_0200F158; i++)
    {
        if (unk != 0)
        {
            if (gSortedUnits[i]->unit->pCharacterData->number == unitId)
                goto _080904FC;

            continue;
        }
        else
        {
            if (gSortedUnits[i]->unit->index == unitId)
                goto _080904FC;

            continue;
        }

    _080904FC:
        proc->unk_30 = i;

        if (i == 0)
        {
            proc->unk_2c = 0;
            proc->unk_3e = 0;
            return;
        }

        if (i == gUnknown_0200F158 - 1)
        {
            if (gUnknown_0200F158 < 7)
            {
                proc->unk_2c = i;
                proc->unk_3e = 0;
                return;
            }
            else
            {
                proc->unk_2c = 5;
                proc->unk_3e = (gUnknown_0200F158 - 6) * 16;
                return;
            }
        }

        if (i > proc->unk_3e / 16 && i < proc->unk_3e / 16 + 5)
        {
            proc->unk_2c = i - proc->unk_3e / 16;
            return;
        }

        if (proc->unk_3e > (i - 1) * 16)
        {
            proc->unk_2c = 1;
            proc->unk_3e = (i - 1) * 16;
            return;
        }

        if (proc->unk_3e < (i - 4) * 16)
        {
            proc->unk_2c = 4;
            proc->unk_3e = (i - 4) * 16;
            return;
        }

        return;
    }
}

//! FE8U = 0x08090514
void sub_8090514(s8 flag)
{
    if (flag != 0)
    {
        SetWinEnable(1, 1, 0);

        SetWin0Box(0, 58, 240, 152);
        SetWin1Box(0, 0, 240, 32);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWin1Layers(0, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 0);
    }
    else
    {
        SetWinEnable(1, 0, 0);

        SetWin0Box(0, 58, 240, 152);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 1);
    }

    return;
}

//! FE8U = 0x08090620
void UnitList_StartStatScreen(struct UnitListScreenProc * proc)
{
    EndAllMus();
    Proc_End(proc->pSpriteProc);
    Proc_End(proc->pMuralProc);
    EndGreenText();

    SetWinEnable(0, 0, 0);

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        SetStatScreenConfig(STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONUNK16);
    }
    else
    {
        SetStatScreenConfig(
            STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
            STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
    }

    StartStatScreen(gSortedUnits[proc->unk_30]->unit, proc);
    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;
    proc->unk_29 = 4;

    return;
}

//! FE8U = 0x080906AC
void UnitList_ResetFromStatScreen(struct UnitListScreenProc * proc)
{
    sub_8090D80(proc);
    SetDispEnable(0, 0, 0, 0, 0);

    return;
}

//! FE8U = 0x080906D8
void UnitList_ResetDispFromStatScreen(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x080906F8
void UnitListScreenSprites_Init(struct UnitListScreenSpritesProc * proc)
{
    proc->unk_2c = proc->proc_parent;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_38 = proc->unk_2c->unk_3e;
    proc->unk_3a = 0;

    proc->unk_34 = StartMenuScrollBar(proc);
    PutMenuScrollBarAt(224, 64);
    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnknown_0200F158, 6);
    InitMenuScrollBarImg(0x7200, 1);

    ForceSyncUnitSpriteSheet();

    proc->unk_3e = 7;
    proc->unk_40 = 225;
    proc->unk_44 = 0;
    proc->unk_42 = 0;
    proc->unk_48 = 4;
    proc->unk_46 = 4;

    Decompress(gImg_UiSpinningArrow_Horizontal, (void *)0x06010280);

    return;
}

//! FE8U = 0x08090784
void UnitListScreenSprites_Main(struct UnitListScreenSpritesProc * proc)
{
    int i;
    int r7;
    int r8;

    int gUnknown_08205B84[4] =
    {
        0, 1, 2, 1,
    };

    PutSpriteExt(
        0xb, (proc->unk_2c->unk_34 == 0) ? 226 : 226 + OAM1_VFLIP, gUnknown_08205B84[(proc->unk_3b / 8) % 4] + 7, Sprite_08A17B64,
        OAM2_PAL(9));

    PutSpriteExt(0xd, 0x10, 8, gSpriteArray_08A17C20[proc->unk_2c->page], OAM2_PAL(9));

    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnknown_0200F158, 6);

    if (proc->unk_2c->unk_29 >= 3)
    {
        DisplayUiHand(
            gUnitListScreenFields[proc->unk_2c->page][proc->unk_2c->unk_2d].xColumn, proc->unk_2c->unk_2c * 16 + 40);
    }
    else
    {
        PutSpriteExt(0xd, 4, proc->unk_2c->unk_2c * 16 + 0x40, Sprite_08A17B6C, OAM2_PAL(9));
    }

    if ((proc->unk_38 != proc->unk_2c->unk_3e) || ((proc->unk_2c->unk_3e % 0x10) != 0))
    {
        gPaletteBuffer[0x19E] = gUnknown_02013460.unk_10;
        EnablePaletteSync();

        proc->unk_3c = 32;
        proc->unk_38 = proc->unk_2c->unk_3e;

        if (proc->unk_3a == 0)
        {
            sub_8090514(1);
            proc->unk_3a = 1;
        }
    }
    else
    {
        gPaletteBuffer[0x19E] = gUnknown_02013460.unk_00[(proc->unk_3c / 4) & 0xf];
        EnablePaletteSync();

        if (proc->unk_3a == 1)
        {
            sub_8090514(0);
            proc->unk_3a = 0;
        }
    }

    ForceSyncUnitSpriteSheet();

    r7 = (proc->unk_38 / 0x10);
    r8 = -((proc->unk_38) % 0x10);

    for (i = 0; i < 6 && i + r7 < gUnknown_0200F158; i++)
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gSortedUnits[i + r7]->unit);
    }

    if ((proc->unk_3a != 0) && ((i + r7) < gUnknown_0200F158))
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gSortedUnits[i + r7]->unit);
    }

    if ((gKeyStatusPtr->newKeys & 0x20) != 0)
    {
        proc->unk_46 = 0x1f;
        proc->unk_3e = 1;
    }

    if ((gKeyStatusPtr->newKeys & 0x10) != 0)
    {
        proc->unk_48 = 0x1f;
        proc->unk_40 = 0xe7;
    }

    proc->unk_42 += proc->unk_46;
    proc->unk_44 += proc->unk_48;

    if (proc->unk_46 > 4)
    {
        proc->unk_46--;
    }

    if (proc->unk_48 > 4)
    {
        proc->unk_48--;
    }

    if ((GetGameClock() & 3) == 0)
    {
        if (proc->unk_3e < 7)
        {
            proc->unk_3e++;
        }

        if (proc->unk_40 > 225)
        {
            proc->unk_40--;
        }
    }

    if ((proc->unk_2c->page > 1) && (proc->unk_2c->mode != UNITLIST_MODE_SOLOANIM))
    {
        PutSprite(0, proc->unk_3e, 40, gObject_8x8, (((u16)proc->unk_42 >> 5) % 6) + OAM2_CHR(0x14) + OAM2_LAYER(1) + OAM2_PAL(1));
        PutSprite(0, proc->unk_3e, 48, gObject_8x8, (((u16)proc->unk_42 >> 5) % 6) + OAM2_CHR(0x1A) + OAM2_LAYER(1) + OAM2_PAL(1));
    }

    if ((proc->unk_2c->page < proc->unk_2c->unk_2e) && (proc->unk_2c->mode != UNITLIST_MODE_SOLOANIM))
    {
        PutSprite(0, proc->unk_40, 40, gObject_8x8_HFlipped, (((u16)proc->unk_44 >> 5) % 6) + OAM2_CHR(0x14) + OAM2_LAYER(1) + OAM2_PAL(1));
        PutSprite(0, proc->unk_40, 48, gObject_8x8_HFlipped, (((u16)proc->unk_44 >> 5) % 6) + OAM2_CHR(0x1A) + OAM2_LAYER(1) + OAM2_PAL(1));
    }

    proc->unk_3b++;
    proc->unk_3c++;

    return;
}

//! FE8U = 0x08090B44
void UnitListScreenSprites_Dummy(void)
{
    return;
}

//! FE8U = 0x08090B48
void sub_8090B48(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int supporterCount;
    int i;
    int supportCountNow;

    if ((unit->state & US_NOT_DEPLOYED) == 0)
    {
        proc->deployedCount++;
    }

    gSortedUnitsBuf[gUnknown_0200F158].unit = unit;

    BattleGenerateUiStats(unit, -1);

    gSortedUnitsBuf[gUnknown_0200F158].battleAttack = ((gBattleActor.battleAttack + 1) & 0xff) - 1;
    gSortedUnitsBuf[gUnknown_0200F158].battleHitRate = ((gBattleActor.battleHitRate + 1) & 0xff) - 1;
    gSortedUnitsBuf[gUnknown_0200F158].battleAvoidRate = ((gBattleActor.battleAvoidRate + 1) & 0xff) - 1;

    supporterCount = GetUnitSupporterCount(unit);
    supportCountNow = 0;

    for (i = 0; i < supporterCount; i++)
    {
        if (CanUnitSupportNow(unit, i))
        {
            supportCountNow++;
        }
    }

    if (supportCountNow > 3)
    {
        if (proc->unk_2e < ((supportCountNow - 1) / 3) + 6)
        {
            proc->unk_2e = ((supportCountNow - 1) / 3) + 6;
        }
    }

    gSortedUnitsBuf[gUnknown_0200F158].supportCount = supportCountNow;
    gSortedUnits[gUnknown_0200F158] = &gSortedUnitsBuf[gUnknown_0200F158];

    gUnknown_0200F158++;

    UseUnitSprite(GetUnitSMSId(unit));

    return;
}

//! FE8U = 0x08090C58
void sub_8090C58(struct UnitListScreenProc * proc)
{
    gUnknown_0200F158 = 0;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        int i;

        for (i = (gPlaySt.faction) + 1; i < (gPlaySt.faction) + 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (!IsUnitInCurrentRoster(unit))
            {
                continue;
            }

            sub_8090B48(unit, proc);
        }
    }
    else
    {
        int i;

        for (i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; i++)
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

            sub_8090B48(unit, proc);
        }
    }

    return;
}

//! FE8U = 0x08090D00
void sub_8090D00(struct UnitListScreenProc * proc)
{
    gUnknown_0200F158 = 0;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        int i;

        for (i = FACTION_BLUE + 1; i < FACTION_BLUE + 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (!IsUnitInCurrentRoster(unit))
            {
                continue;
            }

            sub_8090B48(unit, proc);
        }
    }
    else
    {
        int i;

        for (i = FACTION_BLUE + 1; i < FACTION_BLUE + 0x40; i++)
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

            sub_8090B48(unit, proc);
        }
    }

    return;
}

//! FE8U = 0x08090D80
void sub_8090D80(struct UnitListScreenProc * proc)
{
    int i;
    u8 val;

    SetDispEnable(1, 1, 1, 1, 1);

    SetInterrupt_LCDVCountMatch(NULL);
    SetupBackgrounds(NULL);
    ResetText();
    ResetTextFont();
    ResetIconGraphics();
    ApplyUnitSpritePalettes();

    CpuFastFill(0, gPaletteBuffer + 0x1B0, PLTT_SIZE_4BPP);

    LoadObjUIGfx();

    StartGreenText(proc);

    proc->deployedCount = 0;
    proc->unk_2e = 6;

    sub_8090D00(proc);

    if ((proc->mode != UNITLIST_MODE_PREPMENU) || (proc->unk_2a == 1))
    {
        val = gPlaySt.lastUnitSortType;

        if (val != 0)
        {
            proc->unk_33 = (val >> 7) & 1;
            proc->unk_34 = proc->unk_33;
            proc->unk_32 = val & 0x7f;
        }

        if ((proc->unk_29 != 4) && (proc->page != 0))
        {
            val = gPlaySt.unk19 / 16;

            if (val != 0)
            {
                if (val > 6)
                {
                    proc->page = 6;
                }
                else
                {
                    proc->page = val;
                }

                proc->pageTarget = proc->page;
            }
        }

        SortUnitList(proc->unk_32, proc->unk_34);
    }

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadUiFrameGraphics();

    Decompress(Img_08A1CD68, (void *)0x06014800);
    Decompress(proc->page != 0 ? Img_UnitListBanners : Img_UnitListBanner_Animation, (void *)0x06015800);

    ApplyPalettes(Pal_SysBrownBox, 0x19, 2);

    sub_8097FDC();

    CallARM_FillTileRect(gBG1TilemapBuffer, gUnknown_08A1C8B4, 0x1000);

    for (i = 0; i < 7; i++)
    {
        InitText(&gUnknown_0200E060[i], 5);
        InitTextDb(&gUnknown_0200E098[i][0], 8);
        InitText(&gUnknown_0200E098[i][1], 7);
        InitText(&gUnknown_0200E098[i][2], 5);
    }

    InitText(&gUnknown_0200E140, 4);
    InitText(&gUnknown_0200E148, 20);
    InitText(&gUnknown_0200E150, 8);

    sub_8090238(proc->unk_32);

    if (proc->unk_29 == 4)
    {
        sub_8090418(proc, 0);
        proc->unk_29 = 0;
    }
    else if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        sub_8090418(proc, 1);
    }

    proc->unk_3c = 0;
    proc->helpActive = 0;

    ClearText(&gUnknown_0200E140);
    Text_SetCursor(&gUnknown_0200E140, 4);
    Text_SetColor(&gUnknown_0200E140, 0);
    Text_DrawString(&gUnknown_0200E140, GetStringFromIndex(0x4E5));
    PutText(&gUnknown_0200E140, TILEMAP_LOCATED(gBG2TilemapBuffer, 3, 5));

    for (i = 0; i < 20; i++)
    {
        gUnknown_0200F15C[i] = UINT8_MAX;
    }

    for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
    {
        UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
    }

    sub_8092298(proc->unk_2e, proc->page, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(16, 58, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    BG_SetPosition(BG_3, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_0, 0, (proc->unk_3e - 56) & 0xff);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    Decompress(gImg_UiSpinningArrow_Horizontal, gBG1TilemapBuffer + 0x280);
    ApplyPalette(Pal_SpinningArrow, 0xf);

    proc->pSpriteProc = Proc_Start(ProcScr_bmview, proc);
    proc->pMuralProc = StartMuralBackground(0, 0, 10);
    LoadHelpBoxGfx(0, -1);

    return;
}

//! FE8U = 0x08091180
void UnitList_Init(struct UnitListScreenProc * proc)
{
    proc->unk_29 = 0;
    proc->unk_31 = 1;
    proc->unk_2c = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;

    if (proc->mode == UNITLIST_MODE_SOLOANIM)
    {
        proc->page = 0;
    }
    else
    {
        proc->page = 1;
    }

    proc->pageTarget = proc->page;

    proc->unk_3e = 0;
    proc->unk_32 = 1;
    proc->unk_2a = 0;
    proc->unk_33 = 1;
    proc->unk_34 = 0;
    proc->unk_35 = 0;

    sub_8090D80(proc);

    return;
}

//! FE8U = 0x080911E4
void UnitList_DeployUnit(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (proc->allyCount > proc->deployedCount)
    {
        unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);

        RegisterSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
        {
            UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
        }

        proc->deployedCount++;
        PlaySoundEffect(0x6a);
    }
    else
    {
        PlaySoundEffect(0x6c);
    }

    return;
}

//! FE8U = 0x08091288
void UnitList_UndeployUnit(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (!IsCharacterForceDeployed(unit->pCharacterData->number))
    {
        unit->state |= (US_UNSELECTABLE | US_NOT_DEPLOYED);

        RemoveSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
        {
            UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
        }

        proc->deployedCount--;
        PlaySoundEffect(0x6b);
    }
    else
    {
        PlaySoundEffect(0x6c);
    }

    return;
}

//! FE8U = 0x0809132C
void UnitList_TogglePrepDeployState(struct UnitListScreenProc * proc)
{
    int index = proc->unk_30;
    struct Unit * unit = gSortedUnits[index]->unit;

    if ((unit->state & US_BIT25) != 0)
    {
        StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0xC52, proc);
        return;
    }

    if ((unit->state & US_NOT_DEPLOYED) != 0)
    {
        if (CheckInLinkArena() && !CanUnitBeDeployedLinkArena(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x88A, proc);
            return;
        }

        if (CheckInLinkArena() && !sub_8097E38(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x889, proc);
            return;
        }

        UnitList_DeployUnit(unit, proc);
        return;
    }

    UnitList_UndeployUnit(unit, proc);

    return;
}

//! FE8U = 0x080913D8
void UnitList_ToggleSoloAnimState(struct Unit * unit, int step)
{
    int animState;

    if ((UNIT_CATTRIBUTES(unit) & CA_SUPPLY) != 0)
    {
        PlaySoundEffect(0x6c);
        return;
    }

    animState = (unit->state & US_SOLOANIM) >> 14;
    animState = (animState + step + 3) % 3;
    animState = animState << 14;

    unit->state = (unit->state & ~US_SOLOANIM) | animState;

    PlaySoundEffect(0x6a);

    return;
}

//! FE8U = 0x0809144C
void sub_809144C(struct UnitListScreenProc * proc)
{
    if ((gKeyStatusPtr->heldKeys & L_BUTTON) != 0)
    {
        proc->unk_31 = 2;
    }
    else
    {
        proc->unk_31 = 1;
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        Proc_Goto(proc, 3);
        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (proc->mode)
        {
            case UNITLIST_MODE_PREPMENU:
                UnitList_TogglePrepDeployState(proc);

                break;

            case UNITLIST_MODE_SOLOANIM:
                UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, 1);
                UnitList_PutRow(proc, proc->unk_30, gBG0TilemapBuffer, proc->page, 0);

                break;

            case UNITLIST_MODE_FIELD:
                SetLastStatScreenUid(gSortedUnits[proc->unk_30]->unit->index);
                PlaySoundEffect(0x6A);
                Proc_Break(proc);

                break;

            default:
                break;
        }

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        if (proc->mode == UNITLIST_MODE_SOLOANIM)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_LEFT) == 0)
                return;

            UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, -1);
            UnitList_PutRow(proc, proc->unk_30, gBG0TilemapBuffer, proc->page, 0);

            return;
        }

        if (proc->page < 2)
            return;

        proc->pageTarget--;
        Proc_Goto(proc, 2);
        proc->unk_2d = 0;
        PlaySoundEffect(0x6F);

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        if (proc->mode == UNITLIST_MODE_SOLOANIM)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) == 0)
                return;

            UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, +1);
            UnitList_PutRow(proc, proc->unk_30, gBG0TilemapBuffer, proc->page, 0);

            return;
        }

        if (proc->page < proc->unk_2e)
        {
            proc->pageTarget++;
            proc->unk_2d = 0;
            PlaySoundEffect(0x6F);
            Proc_Goto(proc, 2);
        }

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0 ||
        ((gKeyStatusPtr->heldKeys & L_BUTTON) != 0 && (gKeyStatusPtr->newKeys2 & DPAD_UP) != 0))
    {
        if (proc->unk_30 == 0)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_UP) == 0)
                return;

            PlaySoundEffect(0x66);
            proc->unk_29 = 3;
            return;
        }

        proc->unk_30--;
        PlaySoundEffect(0x66);

        if (proc->unk_2c < 2)
        {
            if (proc->unk_3e / 16 != 0)
            {
                if (proc->unk_2c == 0)
                {
                    proc->unk_30++;
                    proc->unk_2c = 1;
                }

                UnitList_PutRow(proc, proc->unk_3e / 16 - 1, gBG0TilemapBuffer, proc->page, 1);
                proc->unk_29 = 2;
                proc->unk_3e = -(proc->unk_31 * 4) + proc->unk_3e;
                BG_SetPosition(0, 0, (proc->unk_3e - 0x38) & 0xFF);

                if (proc->unk_2c == 0)
                {
                    proc->unk_2c++;
                }

                return;
            }
        }

        proc->unk_2c--;

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0 ||
        ((gKeyStatusPtr->heldKeys & L_BUTTON) != 0 && (gKeyStatusPtr->newKeys2 & DPAD_DOWN) != 0))
    {
        if (proc->unk_30 < gUnknown_0200F158 - 1)
        {
            proc->unk_30++;
            PlaySoundEffect(0x66);

            if (proc->unk_2c == 4 && proc->unk_30 != gUnknown_0200F158 - 1)
            {
                UnitList_PutRow(proc, 6 + proc->unk_3e / 16, gBG0TilemapBuffer, proc->page, 1);
                proc->unk_29 = 1;
                proc->unk_3e = proc->unk_3e + proc->unk_31 * 4;
                BG_SetPosition(0, 0, (proc->unk_3e - 0x38) & 0xFF);
                return;
            }

            proc->unk_2c++;
        }
    }

    return;
}

//! FE8U = 0x080917D8
void sub_80917D8(struct UnitListScreenProc * proc)
{
    int i;
    u8 unk_32;

    if (proc->helpActive != 0 && (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) != 0)
    {
        CloseHelpBox();
        proc->helpActive = 0;
        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0 && proc->helpActive == 0)
    {
        unk_32 = proc->unk_32;

        proc->unk_2a = 1;
        PlaySoundEffect(0x6A);
        proc->unk_32 = gUnitListScreenFields[proc->page][proc->unk_2d].sortKey;
        proc->unk_33 = (proc->unk_33 + 1) & 1;

        if (SortUnitList(proc->unk_32, proc->unk_33))
        {
            for (i = 0; i < 6 && i < gUnknown_0200F158; i++)
            {
                UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
            }

            sub_8090358(proc->unk_3e);
            BG_EnableSyncByMask(1);
        }

        proc->unk_34 = proc->unk_33;
        proc->unk_35 = proc->unk_2d;

        if (proc->unk_32 != unk_32)
            sub_8090238(proc->unk_32);

        return;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && proc->helpActive == 0)
    {
        PlaySoundEffect(0x66);
        proc->unk_33 = 1;
        proc->unk_29 = 0;
        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        proc->unk_33 = 1;

        if (proc->unk_2d == 0)
        {
            if (proc->page < 2)
                return;

            if (proc->mode == UNITLIST_MODE_SOLOANIM)
                return;

            PlaySoundEffect(0x6F);
            proc->pageTarget--;

            for (i = 8; i > 0 && gUnitListScreenFields[proc->pageTarget][i].xColumn == 0; i--)
            {
            }

            proc->unk_2d = i;
            Proc_Goto(proc, 2);
            return;
        }

        proc->unk_2d--;
        PlaySoundEffect(0x67);
        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        proc->unk_33 = 1;

        if (proc->unk_2d == 8 || gUnitListScreenFields[proc->page][proc->unk_2d + 1].xColumn == 0)
        {
            if (proc->page < proc->unk_2e)
            {
                if (proc->mode == UNITLIST_MODE_SOLOANIM)
                    return;

                proc->unk_2d = 0;
                PlaySoundEffect(0x6F);

                proc->pageTarget++;
                Proc_Goto(proc, 2);
            }
            return;
        }
        else
        {
            proc->unk_2d++;
            PlaySoundEffect(0x67);
        }

        return;
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0 && proc->helpActive == 0)
    {
        proc->helpActive = 1;

        StartHelpBox(
            gUnitListScreenFields[proc->page][proc->unk_2d].xColumn, 0x28,
            gUnitListScreenFields[proc->page][proc->unk_2d].helpTextId);
    }

    return;
}

//! FE8U = 0x08091AB4
void UnitList_SetBlendEffects(void)
{
    SetBlendAlpha(14, 3);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}

//! FE8U = 0x08091AEC
void sub_8091AEC(struct UnitListScreenProc * proc)
{
    int prev = proc->unk_2d;

    if (((gKeyStatusPtr->newKeys & B_BUTTON) != 0) && (proc->helpActive == 0))
    {
        PlaySoundEffect(0x6b);
        SetLastStatScreenUid(0);
        Proc_Break(proc);
        return;
    }

    switch (proc->unk_29)
    {
        case 0:
            sub_809144C(proc);
            break;

        case 3:
            sub_80917D8(proc);
            break;

        case 1:
            proc->unk_3e += 4 * proc->unk_31;
            BG_SetPosition(0, 0, (proc->unk_3e - 56) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                sub_8090358(proc->unk_3e);
            }

            break;

        case 2:
            proc->unk_3e += -(4 * proc->unk_31);
            BG_SetPosition(0, 0, (proc->unk_3e - 56) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                sub_8090358(proc->unk_3e);
            }

            break;
    }

    if ((proc->helpActive != 0) && (prev != proc->unk_2d))
    {
        StartHelpBox(
            gUnitListScreenFields[proc->pageTarget][proc->unk_2d].xColumn, 40,
            gUnitListScreenFields[proc->pageTarget][proc->unk_2d].helpTextId);
    }

    return;
}

//! FE8U = 0x08091C00
void UnitList_OnEnd(struct UnitListScreenProc * proc)
{
    int page;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        PrepSetLatestCharId(gSortedUnits[proc->unk_30]->unit->pCharacterData->number);
        sub_809014C();
    }

    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;

    page = proc->page;
    if (page != 0)
    {
        page = (proc->page << 4);
        gPlaySt.unk19 &= 0xf;
        gPlaySt.unk19 |= page;
    }

    Proc_End(proc->pSpriteProc);

    if (proc->pMuralProc != NULL)
    {
        Proc_End(proc->pMuralProc);
    }

    EndGreenText();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetWinEnable(0, 0, 0);

    ResetTextFont();
    ResetIconGraphics();

    return;
}

//! FE8U = 0x08091CC0
void UnitList_StartPageChange(struct UnitListScreenProc * proc)
{
    int i;

    TileMap_FillRect(gUnknown_0200D7E0[0], 31, 31, 0);

    for (i = proc->unk_3e / 16; i < proc->unk_3e / 16 + 6 && i < gUnknown_0200F158; i++)
    {
        UnitList_PutRow(proc, i, gUnknown_0200D7E0[0], proc->page, 0);
    }

    TileMap_FillRect(gUnknown_0200DFE0[0], 31, 1, 0);

    UnitList_DrawColumnNames(gUnknown_0200DFE0[0], proc->page);

    proc->unk_3c = 0;
    proc->unk_37 = proc->page;
    proc->unk_38 = 0;

    return;
}

extern u8 gUnknown_08A17B30[];

//! FE8U = 0x08091D54
void sub_8091D54(struct UnitListScreenProc * proc)
{
    int i;
    int r4;
    u8 r1;

    proc->unk_38 += gUnknown_08A17B30[proc->unk_3c];

    if (proc->unk_38 > 20)
    {
        proc->unk_38 = 20;
    }

    proc->unk_3c++;

    for (i = 0; i < 20; i++)
    {
        if (proc->pageTarget > proc->page)
        {
            if (i + proc->unk_38 > 20)
            {
                r1 = 0;
            }
            else
            {
                r1 = i + proc->unk_38 + 8;
            }
        }
        else
        {
            if (i < proc->unk_38)
            {
                r1 = 0;
            }
            else
            {
                r1 = i - proc->unk_38 + 8;
            }
        }

        for (r4 = proc->unk_3e / 8; r4 < 12 + proc->unk_3e / 8; r4++)
        {
            int off = 8 + (r4 & 0x1F) * 0x20;
            gBG0TilemapBuffer[off + i] = gUnknown_0200D7E0[r4 & 0x1F][r1];
        }

        for (r4 = 0; r4 < 2; r4++)
        {
            int off = 0xA8 + r4 * 0x20;
            gBG2TilemapBuffer[off + i] = gUnknown_0200DFE0[r4][r1];
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 < 20)
    {
        return;
    }

    proc->page = proc->pageTarget;

    TileMap_FillRect(gBG2TilemapBuffer + 0x150 / 2, 0x16, 1, 0);
    TileMap_FillRect(gBG0TilemapBuffer + 0x10 / 2, 0x16, 0x1F, 0);

    for (r4 = 0; r4 < 20; r4++)
    {
        gUnknown_0200F15C[r4] = UINT8_MAX;
    }

    ResetIconGraphics();
    sub_8090238(proc->unk_32);

    for (r4 = proc->unk_3e / 16; r4 < proc->unk_3e / 16 + 6 && r4 < gUnknown_0200F158; r4++)
    {
        UnitList_PutRow(proc, r4, gUnknown_0200D7E0[0], proc->page, 0);
    }

    UnitList_DrawColumnNames(gUnknown_0200DFE0[0], proc->page);
    sub_8092298(proc->unk_2e, proc->page, 0);

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    Proc_Break(proc);

    return;
}

extern u8 gUnknown_08A17B36[];

#if NONMATCHING

/* https://decomp.me/scratch/3RUUz */

#define TILEMAP_INDEX_(aX, aY) ((aX) + (aY) * 0x20)

//! FE8U = 0x08091F10
void sub_8091F10(struct UnitListScreenProc * proc)
{
    int r4, r5;

    proc->unk_38 += gUnknown_08A17B36[proc->unk_3c];

    if (proc->unk_38 > 20)
    {
        proc->unk_38 = 20;
    }

    proc->unk_3c++;

    if (proc->pageTarget > proc->unk_37)
    {
        for (r5 = 0; r5 < proc->unk_38; r5++)
        {
            for (r4 = proc->unk_3e / 8; r4 < proc->unk_3e / 8 + 12; r4++)
            {
                gBG0TilemapBuffer[(r4 & 0x1f) * 0x20 + (({r5 + 0x1c;}) - proc->unk_38)] = gUnknown_0200D7E0[r4 & 0x1f][r5 + 8];
            }

            for (r4 = 0; r4 < 2; r4++)
            {
                gBG2TilemapBuffer[(r4 + 5) * 0x20 + (({r5 + 0x1c;}) - proc->unk_38)] = gUnknown_0200DFE0[r4][r5 + 8];
            }
        }
    }
    else
    {
        for (r5 = 0; r5 < proc->unk_38; r5++)
        {
            for (r4 = proc->unk_3e / 8; r4 < proc->unk_3e / 8 + 12; r4++)
            {
                // gBG0TilemapBuffer[(r4 & 0x1f) * 0x20 + 8 + r5] = gUnknown_0200D7E0[r4 & 0x1f][({r5 + 0x1c;}) - proc->unk_38];
                gBG0TilemapBuffer[(r4 & 0x1f) * 0x20 + ({r5 + 8;})] = gUnknown_0200D7E0[r4 & 0x1f][({r5 + 0x1c;}) - proc->unk_38];
            }

            for (r4 = 0; r4 < 2; r4++)
            {
                gBG2TilemapBuffer[(r4 + 5) * 0x20 + (r5 + 8)] = gUnknown_0200DFE0[r4][({r5 + 0x1c;}) - proc->unk_38];
            }
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 >= 20)
    {
        Proc_Break(proc);
    }

    return;
}

#else

NAKEDFUNC
void sub_8091F10(struct UnitListScreenProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        mov r8, r0\n\
        mov r2, r8\n\
        adds r2, #0x38\n\
        ldr r1, _08091FEC  @ gUnknown_08A17B36\n\
        mov r3, r8\n\
        ldrh r0, [r3, #0x3c]\n\
        adds r0, r0, r1\n\
        ldrb r0, [r0]\n\
        ldrb r1, [r2]\n\
        adds r0, r0, r1\n\
        strb r0, [r2]\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        cmp r0, #0x14\n\
        bls _08091F3E\n\
        movs r0, #0x14\n\
        strb r0, [r2]\n\
    _08091F3E:\n\
        mov r3, r8\n\
        ldrh r0, [r3, #0x3c]\n\
        adds r0, #1\n\
        strh r0, [r3, #0x3c]\n\
        mov r0, r8\n\
        adds r0, #0x36\n\
        mov r1, r8\n\
        adds r1, #0x37\n\
        ldrb r0, [r0]\n\
        ldrb r1, [r1]\n\
        cmp r0, r1\n\
        bls _08092000\n\
        movs r5, #0\n\
        str r2, [sp]\n\
        ldrb r0, [r2]\n\
        cmp r5, r0\n\
        blt _08091F62\n\
        b _0809208E\n\
    _08091F62:\n\
        adds r7, r2, #0\n\
    _08091F64:\n\
        mov r1, r8\n\
        ldrh r0, [r1, #0x3e]\n\
        lsrs r4, r0, #3\n\
        adds r0, r4, #0\n\
        adds r0, #0xc\n\
        adds r6, r5, #0\n\
        adds r6, #0x1c\n\
        movs r3, #8\n\
        adds r3, r3, r5\n\
        mov ip, r3\n\
        adds r5, #1\n\
        mov sl, r5\n\
        cmp r4, r0\n\
        bge _08091FB6\n\
        adds r5, r6, #0\n\
        lsls r2, r3, #1\n\
        movs r0, #0x1f\n\
        mov r9, r0\n\
    _08091F88:\n\
        adds r3, r4, #0\n\
        mov r1, r9\n\
        ands r3, r1\n\
        lsls r1, r3, #5\n\
        ldrb r0, [r7]\n\
        subs r0, r5, r0\n\
        adds r1, r1, r0\n\
        lsls r1, r1, #1\n\
        ldr r0, _08091FF0  @ gBG0TilemapBuffer\n\
        adds r1, r1, r0\n\
        lsls r0, r3, #6\n\
        adds r0, r2, r0\n\
        ldr r3, _08091FF4  @ gUnknown_0200D7E0\n\
        adds r0, r0, r3\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r4, #1\n\
        mov r1, r8\n\
        ldrh r0, [r1, #0x3e]\n\
        lsrs r0, r0, #3\n\
        adds r0, #0xc\n\
        cmp r4, r0\n\
        blt _08091F88\n\
    _08091FB6:\n\
        ldr r3, _08091FF8  @ gBG2TilemapBuffer\n\
        mov r9, r3\n\
        adds r5, r6, #0\n\
        mov r1, ip\n\
        lsls r0, r1, #1\n\
        ldr r3, _08091FFC  @ gUnknown_0200DFE0\n\
        adds r2, r0, r3\n\
        movs r3, #0xa0\n\
        movs r4, #1\n\
    _08091FC8:\n\
        ldrb r0, [r7]\n\
        subs r0, r5, r0\n\
        adds r0, r3, r0\n\
        lsls r0, r0, #1\n\
        add r0, r9\n\
        ldrh r1, [r2]\n\
        strh r1, [r0]\n\
        adds r2, #0x40\n\
        adds r3, #0x20\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bge _08091FC8\n\
        mov r5, sl\n\
        ldrb r0, [r7]\n\
        cmp r5, r0\n\
        blt _08091F64\n\
        b _0809208E\n\
        .align 2, 0\n\
    _08091FEC: .4byte gUnknown_08A17B36\n\
    _08091FF0: .4byte gBG0TilemapBuffer\n\
    _08091FF4: .4byte gUnknown_0200D7E0\n\
    _08091FF8: .4byte gBG2TilemapBuffer\n\
    _08091FFC: .4byte gUnknown_0200DFE0\n\
    _08092000:\n\
        movs r5, #0\n\
        str r2, [sp]\n\
        ldrb r1, [r2]\n\
        cmp r5, r1\n\
        bge _0809208E\n\
        adds r7, r2, #0\n\
    _0809200C:\n\
        mov r3, r8\n\
        ldrh r0, [r3, #0x3e]\n\
        lsrs r4, r0, #3\n\
        adds r0, r4, #0\n\
        adds r0, #0xc\n\
        adds r6, r5, #0\n\
        adds r6, #0x1c\n\
        adds r1, r5, #1\n\
        mov sl, r1\n\
        cmp r4, r0\n\
        bge _0809205C\n\
        mov ip, r6\n\
        movs r3, #0x1f\n\
        mov r9, r3\n\
    _08092028:\n\
        adds r3, r4, #0\n\
        mov r0, r9\n\
        ands r3, r0\n\
        lsls r2, r3, #5\n\
        adds r2, #8\n\
        adds r2, r2, r5\n\
        lsls r2, r2, #1\n\
        ldr r1, _080920B4  @ gBG0TilemapBuffer\n\
        adds r2, r2, r1\n\
        ldrb r0, [r7]\n\
        mov r1, ip\n\
        subs r0, r1, r0\n\
        lsls r0, r0, #1\n\
        lsls r1, r3, #6\n\
        adds r0, r0, r1\n\
        ldr r3, _080920B8  @ gUnknown_0200D7E0\n\
        adds r0, r0, r3\n\
        ldrh r0, [r0]\n\
        strh r0, [r2]\n\
        adds r4, #1\n\
        mov r1, r8\n\
        ldrh r0, [r1, #0x3e]\n\
        lsrs r0, r0, #3\n\
        adds r0, #0xc\n\
        cmp r4, r0\n\
        blt _08092028\n\
    _0809205C:\n\
        movs r4, #0\n\
        ldr r3, _080920BC  @ gUnknown_0200DFE0\n\
        mov ip, r3\n\
        adds r3, r6, #0\n\
        adds r0, r5, #0\n\
        adds r0, #0xa8\n\
        lsls r0, r0, #1\n\
        ldr r1, _080920C0  @ gBG2TilemapBuffer\n\
        adds r2, r0, r1\n\
    _0809206E:\n\
        ldrb r0, [r7]\n\
        subs r0, r3, r0\n\
        lsls r0, r0, #1\n\
        lsls r1, r4, #6\n\
        adds r0, r0, r1\n\
        add r0, ip\n\
        ldrh r0, [r0]\n\
        strh r0, [r2]\n\
        adds r2, #0x40\n\
        adds r4, #1\n\
        cmp r4, #1\n\
        ble _0809206E\n\
        mov r5, sl\n\
        ldrb r3, [r7]\n\
        cmp r5, r3\n\
        blt _0809200C\n\
    _0809208E:\n\
        movs r0, #5\n\
        bl BG_EnableSyncByMask\n\
        ldr r1, [sp]\n\
        ldrb r0, [r1]\n\
        cmp r0, #0x13\n\
        bls _080920A2\n\
        mov r0, r8\n\
        bl Proc_Break\n\
    _080920A2:\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080920B4: .4byte gBG0TilemapBuffer\n\
    _080920B8: .4byte gUnknown_0200D7E0\n\
    _080920BC: .4byte gUnknown_0200DFE0\n\
    _080920C0: .4byte gBG2TilemapBuffer\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080920C4
void StartUnitListScreenField(void)
{
    struct UnitListScreenProc * proc = Proc_Start(ProcScr_UnitListScreen_Field, PROC_TREE_3);

    proc->mode = UNITLIST_MODE_FIELD;

    return;
}

//! FE8U = 0x080920DC
void StartUnitListScreenPrepMenu(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_UnitListScreen_PrepMenu, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_PrepMenu, parent);
    }

    proc->mode = UNITLIST_MODE_PREPMENU;

    if (CheckInLinkArena() == true)
    {
        proc->allyCount = 5;
    }
    else
    {
        proc->allyCount = GetChapterAllyUnitCount();
    }

    proc->deployedCount = 0;

    return;
}

//! FE8U = 0x08092134
void StartUnitListScreenForSoloAnim(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_UnitListScreen_SoloAnim, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_SoloAnim, parent);
    }

    proc->mode = UNITLIST_MODE_SOLOANIM;

    return;
}

//! FE8U = 0x08092164
void StartUnitListScreenUnk(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_UnitListScreen_PrepMenu, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_PrepMenu, parent);
    }

    proc->mode = UNITLIST_MODE_4;

    return;
}

//! FE8U = 0x08092194
void StartUnitListScreenWorldMap(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_UnitListScreen_WorldMap, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_WorldMap, parent);
    }

    ResetUnitSprites();

    proc->mode = UNITLIST_MODE_WORLDMAP;

    return;
}

//! FE8U = 0x080921CC
void UnitList_DrawColumnNames(u16 * tm, u8 page)
{
    int i;

    TileMap_FillRect(tm + 9, 19, 1, 0);
    ClearText(&gUnknown_0200E148);

    if (page == UNITLIST_PAGE_WEXP)
    {
        for (i = 0; i < 8; i++)
        {
            DrawIcon(tm + 9 + 2 * i, i + 112, OAM2_PAL(5));
        }
    }
    else
    {
        for (i = 1; i < 9 && gUnitListScreenFields[page][i].xColumn != 0; i++)
        {
            Text_SetCursor(&gUnknown_0200E148, gUnitListScreenFields[page][i].xColumn - 64);
            Text_SetColor(&gUnknown_0200E148, TEXT_COLOR_SYSTEM_WHITE);
            Text_DrawString(&gUnknown_0200E148, GetStringFromIndex(gUnitListScreenFields[page][i].labelString));
        }

        PutText(&gUnknown_0200E148, tm + 8);
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x08092298
void sub_8092298(u8 maxPages, u8 page, s8 drawColumnNames)
{
    if (page != UNITLIST_PAGE_SOLOANIM)
    {
        PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 26, 3), TEXT_COLOR_SYSTEM_BLUE, page);
        PutSpecialChar(TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 3), TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_SLASH);
        PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 28, 3), TEXT_COLOR_SYSTEM_BLUE, maxPages);
    }

    if (drawColumnNames)
    {
        UnitList_DrawColumnNames(TILEMAP_LOCATED(gBG2TilemapBuffer, 0, 5), page);
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080922F0
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName)
{
    u8 inactive;
    u8 i;
    u8 num;
    int icon;

    int row = unitNum % 7;
    int y = (unitNum * 2) & 0x1F;

    if ((gSortedUnits[unitNum]->unit->state & US_NOT_DEPLOYED) != 0)
        inactive = 1;
    else
        inactive = 0;

    if (putName != 0)
    {
        ClearText(&gUnknown_0200E060[row]);
        Text_SetCursor(&gUnknown_0200E060[row], 0);

        if (!CheckInLinkArena() && proc->mode == UNITLIST_MODE_PREPMENU &&
            IsCharacterForceDeployed(gSortedUnits[unitNum]->unit->pCharacterData->number))
        {
            Text_SetColor(&gUnknown_0200E060[row], TEXT_COLOR_SYSTEM_GREEN);
        }
        else
        {
            Text_SetColor(&gUnknown_0200E060[row], inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);
        }

        Text_DrawString(
            &gUnknown_0200E060[row], GetStringFromIndex(gSortedUnits[unitNum]->unit->pCharacterData->nameTextId));
        PutText(&gUnknown_0200E060[row], tm + y * 0x20 + 3);
    }

    ClearText(&gUnknown_0200E098[row][0]);
    ClearText(&gUnknown_0200E098[row][1]);

    TileMap_FillRect(tm + y * 0x20 + 8, 0x18, 1, 0);

    switch (page)
    {
        case UNITLIST_PAGE_SOLOANIM:
            PutDrawText(
                &gUnknown_0200E098[row][0], tm + y * 0x20 + 8, 0, 0, 0,
                GetStringFromIndex(gSortedUnits[unitNum]->unit->pClassData->nameTextId));
            Text_SetColor(&gUnknown_0200E098[row][1], inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);

            if (GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit) == 0)
            {
                PutDrawText(
                    &gUnknown_0200E098[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x00000537));
            }
            else
            {
                PutDrawText(
                    &gUnknown_0200E098[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0,
                    GetItemName(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)));
                DrawIcon(
                    tm + y * 0x20 + 15, GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)),
                    TILEREF(0, 4));
                sub_8090324(GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)));
            }

            ClearText(&gUnknown_0200E098[row][2]);

            switch (gSortedUnits[unitNum]->unit->state & US_SOLOANIM)
            {
                case US_SOLOANIM_1:
                    PutDrawText(&gUnknown_0200E098[row][2], tm + y * 0x20 + 24, 4, 8, 0, GetStringFromIndex(0xBF));
                    break;

                case US_SOLOANIM_2:
                    PutDrawText(&gUnknown_0200E098[row][2], tm + y * 0x20 + 24, 4, 8, 0, GetStringFromIndex(0xc0));
                    break;

                case 0:
                    PutDrawText(&gUnknown_0200E098[row][2], tm + y * 0x20 + 24, 1, 4, 0, GetStringFromIndex(0xBE));
                    break;
            }

            break;

        case UNITLIST_PAGE_1:
            // class
            PutDrawText(
                &gUnknown_0200E098[row][0], tm + y * 0x20 + 8,
                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 4, 0,
                GetStringFromIndex(gSortedUnits[unitNum]->unit->pClassData->nameTextId));

            // level
            PutNumberOrBlank(
                tm + y * 0x20 + 17, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->unit->level);

            // exp
            PutNumberOrBlank(
                tm + y * 0x20 + 20, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->unit->exp);

            // hp
            PutNumberOrBlank(
                tm + y * 0x20 + 23, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitCurrentHp(gSortedUnits[unitNum]->unit));
            PutSpecialChar(tm + y * 0x20 + 24, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0x16);
            PutNumberOrBlank(
                tm + y * 0x20 + 26, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitMaxHp(gSortedUnits[unitNum]->unit));

            break;

        case UNITLIST_PAGE_2:
            PutNumberOrBlank(
                tm + y * 0x20 + 9,
                UNIT_POW_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->pow ? 4 : 2,
                GetUnitPower(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 12,
                UNIT_SKL_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->skl ? 4 : 2,
                GetUnitSkill(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 15,
                UNIT_SPD_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->spd ? 4 : 2,
                GetUnitSpeed(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 18,
                UNIT_LCK_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->lck ? 4 : 2,
                GetUnitLuck(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 21,
                UNIT_DEF_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->def ? 4 : 2,
                GetUnitDefense(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 24,
                UNIT_RES_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->res ? 4 : 2,
                GetUnitResistance(gSortedUnits[unitNum]->unit));

            icon = GetUnitAffinityIcon(gSortedUnits[unitNum]->unit);

            if (icon == -1)
            {
                PutSpecialChar(tm + y * 0x20 + 26, 2, TEXT_SPECIAL_DASH);
            }
            else
            {
                DrawIcon(tm + y * 0x20 + 26, icon, TILEREF(0, 4 + 1));
            }

            break;

        case UNITLIST_PAGE_3:
            if (GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit) == 0)
            {
                PutDrawText(
                    &gUnknown_0200E098[row][0], tm + y * 0x20 + 10,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x537));
            }
            else
            {
                char const * name = GetItemName(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit));

                PutDrawText(
                    &gUnknown_0200E098[row][0], tm + y * 0x20 + 10,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, name);

                DrawIcon(
                    tm + y * 0x20 + 8, GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)),
                    TILEREF(0, 4));
                sub_8090324(GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)));
            }

            PutNumberOrBlank(
                tm + y * 0x20 + 18, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->battleAttack);

            PutNumberOrBlank(
                tm + y * 0x20 + 22, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->battleHitRate);

            PutNumberOrBlank(
                tm + y * 0x20 + 26, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->battleAvoidRate);

            break;

        case UNITLIST_PAGE_4:
            if ((gSortedUnits[unitNum]->unit->state & US_RESCUING) != 0)
            {
                PutDrawText(
                    &gUnknown_0200E098[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 2, 0,
                    GetUnitRescueName(gSortedUnits[unitNum]->unit));
            }
            else
            {
                PutDrawText(
                    &gUnknown_0200E098[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 2, 0, GetStringFromIndex(0x536));
            }

            PutNumberOrBlank(
                tm + y * 0x20 + 10, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                UNIT_MOV(gSortedUnits[unitNum]->unit));

            PutNumberOrBlank(
                tm + y * 0x20 + 13, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                UNIT_CON(gSortedUnits[unitNum]->unit));

            PutNumberOrBlank(
                tm + y * 0x20 + 16, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitAid(gSortedUnits[unitNum]->unit));

            PutDrawText(
                &gUnknown_0200E098[row][0], tm + y * 0x20 + 23,
                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 2, 0,
                GetUnitStatusName(gSortedUnits[unitNum]->unit));

            break;

        case UNITLIST_PAGE_WEXP:
        {
            for (i = 0; i < 8; i++)
            {
                const int wpnLevelRankChars[] =
                {
                    [WPN_LEVEL_0] = TEXT_SPECIAL_DASH,
                    [WPN_LEVEL_E] = TEXT_SPECIAL_E,
                    [WPN_LEVEL_D] = TEXT_SPECIAL_D,
                    [WPN_LEVEL_C] = TEXT_SPECIAL_C,
                    [WPN_LEVEL_B] = TEXT_SPECIAL_B,
                    [WPN_LEVEL_A] = TEXT_SPECIAL_A,
                    [WPN_LEVEL_S] = TEXT_SPECIAL_S,
                };

                num = GetWeaponLevelFromExp(gSortedUnits[unitNum]->unit->ranks[i]);

                PutSpecialChar(tm + y * 0x20 + 10 + 2 * i, num == WPN_LEVEL_S ? TEXT_COLOR_SYSTEM_GREEN : 2, wpnLevelRankChars[num]);
            }

            break;
        }

        default:
        {
            u8 supportStart;
            u8 supportPassed;
            int supportCount;

            supportStart = (page - UNITLIST_PAGE_SUPPORT) * 3;
            supportPassed = 0;
            num = 0;
            supportCount = GetUnitSupporterCount(gSortedUnits[unitNum]->unit);

            ClearText(&gUnknown_0200E098[row][2]);

            for (i = 0; i < supportCount; i++)
            {
                if (CanUnitSupportNow(gSortedUnits[unitNum]->unit, i))
                {
                    if (supportPassed >= supportStart)
                    {
                        struct Unit * other;
                        if (GetUnitSupporterUnit(gSortedUnits[unitNum]->unit, i) == NULL)
                        {
                            continue;
                        }

                        other = GetUnitSupporterUnit(gSortedUnits[unitNum]->unit, i);

                        // ?? Why cast to u16?
                        if (((u16)(other->state & US_NOT_DEPLOYED)) == 0)
                        {
                            char const * name = GetStringFromIndex(
                                (GetCharacterData(GetUnitSupporterCharacter(gSortedUnits[unitNum]->unit, i)))
                                    ->nameTextId);

                            PutDrawText(
                                &gUnknown_0200E098[row][num], tm + y * 0x20 + 9 + num * 6,
                                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, name);
                        }
                        else
                        {
                            char const * name = GetStringFromIndex(
                                (GetCharacterData(GetUnitSupporterCharacter(gSortedUnits[unitNum]->unit, i)))
                                    ->nameTextId);

                            PutDrawText(
                                &gUnknown_0200E098[row][num], tm + y * 0x20 + 9 + num * 6, TEXT_COLOR_SYSTEM_GRAY, 0, 0,
                                name);
                        }

                        num++;

                        if (num == 3)
                            break;
                    }
                    else
                    {
                        supportPassed++;
                    }
                }
            }

            for (; num < 3; num++)
            {
                PutDrawText(
                    &gUnknown_0200E098[row][num], tm + y * 0x20 + 9 + num * 6,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x536));
            }

            break;
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08092BE4
int SortUnitList_GetUnitSoloAnimation(struct Unit * unit)
{
    return (unit->state & US_SOLOANIM);
}

//! FE8U = 0x08092BF0
bool SortUnitList(u8 key, u8 order)
{
    u8 cache[0x40];
    u8 r2 = order & 1;

    #define PREPARE_VARS \
        bool changed = FALSE; \
        u8 i, j, tmp_cache; \
        void * tmp_addr;

    #define BUILD_CACHE(key) \
    { \
        for (i = 0; i < gUnknown_0200F158; i++) \
        { \
            cache[i] = key(i); \
        } \
    }

    #define RETURN_IF_CHANGED if (changed) return TRUE;

    #define SWAP(i, j) \
    { \
        tmp_addr = gSortedUnits[(i)]; \
        gSortedUnits[(i)] = gSortedUnits[(j)]; \
        gSortedUnits[(j)] = tmp_addr; \
    }

    #define SWAP_CACHE(i, j) \
    { \
        tmp_cache = cache[(i)]; \
        cache[(i)] = cache[(j)]; \
        cache[(j)] = tmp_cache; \
        SWAP(i, j) \
    }

    #define SORT_CORE_KEY(key, arrow, swap) \
    { \
        /* this is a bubble sort, I think */ \
        for (i = 0; i < gUnknown_0200F158 - 1; i++) \
        { \
            for (j = 0; j < gUnknown_0200F158 - 1 - i; j++) \
            { \
                if (key(j + 1) arrow key(j)) \
                { \
                    /* swap */ \
                    swap(j, j + 1) \
                    changed = TRUE; \
                } \
            } \
        } \
    }

    #define SORT_CORE(cond, swap) \
    { \
        /* this is a bubble sort, I think */ \
        for (i = 0; i < gUnknown_0200F158 - 1; i++) \
        { \
            for (j = 0; j < gUnknown_0200F158 - 1 - i; j++) \
            { \
                if (cond) \
                { \
                    /* swap */ \
                    swap(j, j + 1) \
                    changed = TRUE; \
                } \
            } \
        } \
    }

    #define SORT_REAL(cond_asc, cond_dsc) \
        if (r2 == 0) \
        { \
            PREPARE_VARS \
            SORT_CORE(cond_asc, SWAP) \
            RETURN_IF_CHANGED \
        } \
        else \
        { \
            PREPARE_VARS \
            SORT_CORE(cond_dsc, SWAP) \
            RETURN_IF_CHANGED \
        }

    #define SORT(cond) SORT_REAL(cond, !(cond))

    #define SORT_BY_KEY(key) \
        if (r2 == 0) \
        { \
            PREPARE_VARS \
            SORT_CORE_KEY(key, >, SWAP) \
            RETURN_IF_CHANGED \
        } \
        else \
        { \
            PREPARE_VARS \
            SORT_CORE_KEY(key, <, SWAP) \
            RETURN_IF_CHANGED \
        }

    #define SORT_MAIN(sort_a, sort_b) \
        if (r2 == 0) \
        { \
            PREPARE_VARS \
            sort_a \
            RETURN_IF_CHANGED \
        } \
        else \
        { \
            PREPARE_VARS \
            sort_b \
            RETURN_IF_CHANGED \
        } \
        break;

    #define COND_FIELD(field) ((gSortedUnits[j + 1]->field) < (gSortedUnits[j]->field))
    #define COND_UNIT_FIELD(field) COND_FIELD(unit->field)

    #define SORT_BY_FUNC(func) \
        SORT_REAL(func(gSortedUnits[j + 1]->unit) > func(gSortedUnits[j]->unit), \
            func(gSortedUnits[j + 1]->unit) < func(gSortedUnits[j]->unit))

    #define SORT_BY_UNIT_FIELD(field) \
        SORT_REAL((gSortedUnits[j + 1]->unit->field) > (gSortedUnits[j]->unit->field), \
            (gSortedUnits[j + 1]->unit->field) < (gSortedUnits[j]->unit->field))

    switch (key)
    {
        case UNITLIST_SORTKEY_1:
            #define KEY_A(i) (gSortedUnits[(i)]->unit->pCharacterData->sort_order)
            #define KEY_B(i) (gSortedUnits[(i)]->unit->state & US_UNSELECTABLE)

            SORT_MAIN(
                SORT_CORE_KEY(KEY_A, <, SWAP) SORT_CORE_KEY(KEY_B, <, SWAP),
                SORT_CORE_KEY(KEY_A, >, SWAP) SORT_CORE_KEY(KEY_B, >, SWAP))

            #undef KEY_B
            #undef KEY_A

        case UNITLIST_SORTKEY_3:
            #define KEY(i) (gSortedUnits[(i)]->unit->level)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_2:
            #define KEY(i) (gSortedUnits[(i)]->unit->pClassData->sort_order)
            SORT_MAIN(SORT_CORE_KEY(KEY, <, SWAP), SORT_CORE_KEY(KEY, >, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_4:
            SORT_BY_UNIT_FIELD(exp)
            break;

        case UNITLIST_SORTKEY_5:
            SORT_BY_FUNC(GetUnitCurrentHp)
            break;

        case UNITLIST_SORTKEY_6:
            SORT_BY_FUNC(GetUnitMaxHp)
            break;

        case UNITLIST_SORTKEY_7:
            SORT_BY_FUNC(GetUnitPower)
            break;

        case UNITLIST_SORTKEY_8:
            SORT_BY_FUNC(GetUnitSkill)
            break;

        case UNITLIST_SORTKEY_9:
            SORT_BY_FUNC(GetUnitSpeed)
            break;

        case UNITLIST_SORTKEY_10:
            SORT_BY_FUNC(GetUnitLuck)
            break;

        case UNITLIST_SORTKEY_11:
            SORT_BY_FUNC(GetUnitDefense)
            break;

        case UNITLIST_SORTKEY_12:
            SORT_BY_FUNC(GetUnitResistance)
            break;

        case UNITLIST_SORTKEY_19:
            SORT_BY_FUNC(UNIT_CON)
            break;

        case UNITLIST_SORTKEY_20:
            SORT_BY_FUNC(GetUnitAid)
            break;

        case UNITLIST_SORTKEY_13:
            #define KEY(i) (GetUnitAffinityIcon(gSortedUnits[(i)]->unit))
            SORT_MAIN(SORT_CORE_KEY(KEY, <, SWAP), SORT_CORE_KEY(KEY, >, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_14:
            SORT_MAIN(
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    cache[i] = GetItemIndex(GetUnitEquippedWeapon(gSortedUnits[i]->unit));
                }

                for (i = 0; i < gUnknown_0200F158 - 1; i++)
                {
                    for (j = 0; j < gUnknown_0200F158 - 1 - i; j++)
                    {
                        if (cache[j + 1] > cache[j])
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                        else if (cache[j + 1] == cache[j] && GetUnitEquippedWeapon(gSortedUnits[j + 1]->unit) > GetUnitEquippedWeapon(gSortedUnits[j]->unit))
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                    }
                }
            },
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    cache[i] = GetItemIndex(GetUnitEquippedWeapon(gSortedUnits[i]->unit));
                }

                for (i = 0; i < gUnknown_0200F158 - 1; i++)
                {
                    for (j = 0; j < gUnknown_0200F158 - 1 - i; j++)
                    {
                        if (cache[j + 1] < cache[j])
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                        else if (cache[j + 1] == cache[j] && GetUnitEquippedWeapon(gSortedUnits[j + 1]->unit) < GetUnitEquippedWeapon(gSortedUnits[j]->unit))
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                    }
                }
            })

        case UNITLIST_SORTKEY_15:
            #define KEY(i) (gSortedUnits[(i)]->battleAttack)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_16:
            #define KEY(i) (gSortedUnits[(i)]->battleHitRate)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_17:
            #define KEY(i) (gSortedUnits[(i)]->battleAvoidRate)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_18:
            SORT_BY_FUNC(UNIT_MOV)
            break;

        case UNITLIST_SORTKEY_21:
            SORT_BY_UNIT_FIELD(statusIndex)
            break;

        case UNITLIST_SORTKEY_22:
            SORT_MAIN(
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    if ((gSortedUnits[i]->unit->state & US_RESCUING) != 0)
                        cache[i] = 1;
                    else
                        cache[i] = 0;
                }

                SORT_CORE(cache[j + 1] > cache[j], SWAP_CACHE)
            },
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    if ((gSortedUnits[i]->unit->state & US_RESCUING) != 0)
                        cache[i] = 1;
                    else
                        cache[i] = 0;
                }

                SORT_CORE(cache[j + 1] < cache[j], SWAP_CACHE)
            })

        case UNITLIST_SORTKEY_23:
            SORT_BY_UNIT_FIELD(ranks[0])
            break;

        case UNITLIST_SORTKEY_24:
            SORT_BY_UNIT_FIELD(ranks[1])
            break;

        case UNITLIST_SORTKEY_25:
            SORT_BY_UNIT_FIELD(ranks[2])
            break;

        case UNITLIST_SORTKEY_26:
            SORT_BY_UNIT_FIELD(ranks[3])
            break;

        case UNITLIST_SORTKEY_27:
            SORT_BY_UNIT_FIELD(ranks[4])
            break;

        case UNITLIST_SORTKEY_28:
            SORT_BY_UNIT_FIELD(ranks[5])
            break;

        case UNITLIST_SORTKEY_29:
            SORT_BY_UNIT_FIELD(ranks[6])
            break;

        case UNITLIST_SORTKEY_30:
            SORT_BY_UNIT_FIELD(ranks[7])
            break;

        case UNITLIST_SORTKEY_31:
            #define KEY(i) (gSortedUnits[(i)]->supportCount)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_32:
            SORT_BY_FUNC(SortUnitList_GetUnitSoloAnimation)
            break;
    }

    return FALSE;
}

// clang-format off

u8 CONST_DATA gUnknown_08A17B30[] =
{
    5, 4, 4, 3, 3, 2,
};

u8 CONST_DATA gUnknown_08A17B36[] =
{
    5, 4, 3, 2, 2, 2, 1, 1, 1, 0,
};

u16 CONST_DATA Sprite_08A17B40[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x25C),
};

u16 CONST_DATA Sprite_08A17B48[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x25D),
};

u16 CONST_DATA Sprite_08A17B50[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x25F),
};

u16 * CONST_DATA gSpriteArray_08A17B58[] =
{
    Sprite_08A17B40,
    Sprite_08A17B48,
    Sprite_08A17B50,
};

u16 CONST_DATA Sprite_08A17B64[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x2DF),
};

u16 CONST_DATA Sprite_08A17B6C[] =
{
    7,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x24B) + OAM2_LAYER(2),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x24C) + OAM2_LAYER(2),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(64), OAM2_CHR(0x24C) + OAM2_LAYER(2),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(96), OAM2_CHR(0x24C) + OAM2_LAYER(2),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(128), OAM2_CHR(0x24C) + OAM2_LAYER(2),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(160), OAM2_CHR(0x24C) + OAM2_LAYER(2),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(192) + OAM1_HFLIP, OAM2_CHR(0x24B) + OAM2_LAYER(2),
};

u16 CONST_DATA Sprite_08A17B98[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x2C0),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x2C4),
};

u16 CONST_DATA Sprite_08A17BA6[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x2CA),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x2CE),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x2D2),
};

u16 CONST_DATA Sprite_08A17BBA[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(12), OAM2_CHR(0x2D4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(44), OAM2_CHR(0x2D8),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(76), OAM2_CHR(0x2DC),
};

u16 CONST_DATA Sprite_08A17BCE[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x300),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x304),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x308),
};

u16 CONST_DATA Sprite_08A17BE2[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x30A),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(40), OAM2_CHR(0x30E),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(72), OAM2_CHR(0x312),
};

u16 CONST_DATA Sprite_08A17BF6[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x314),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x318),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x31C),
};

u16 CONST_DATA Sprite_08A17C0A[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(12), OAM2_CHR(0x2C0),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(44), OAM2_CHR(0x2C4),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(76), OAM2_CHR(0x2C8),
};

u16 * CONST_DATA gSpriteArray_08A17C20[] =
{
    Sprite_08A17C0A,
    Sprite_08A17B98,
    Sprite_08A17BA6,
    Sprite_08A17BBA,
    Sprite_08A17BCE,
    Sprite_08A17BE2,
    Sprite_08A17BF6,
    Sprite_08A17BF6,
    Sprite_08A17BF6,
    Sprite_08A17BF6,
};


struct UnitListScreenField CONST_DATA gUnitListScreenFields[][9] =
{
    [UNITLIST_PAGE_SOLOANIM] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_2,
            .labelString = 0x000004E6,
            .xColumn = 64,
            .helpTextId = 0x000006E8,
        },
        {
            .sortKey = UNITLIST_SORTKEY_14,
            .labelString = 0x000004F2,
            .xColumn = 136,
            .helpTextId = 0x000006EB,
        },
        {
            .sortKey = UNITLIST_SORTKEY_32,
            .labelString = 0x000004FC,
            .xColumn = 192,
            .helpTextId = 0x000006F4,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_1] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_2,
            .labelString = 0x000004E6,
            .xColumn = 68,
            .helpTextId = 0x000006E8,
        },
        {
            .sortKey = UNITLIST_SORTKEY_3,
            .labelString = 0x000004E7,
            .xColumn = 129,
            .helpTextId = 0x00000542,
        },
        {
            .sortKey = UNITLIST_SORTKEY_4,
            .labelString = 0x000004E8,
            .xColumn = 152,
            .helpTextId = 0x00000543,
        },
        {
            .sortKey = UNITLIST_SORTKEY_5,
            .labelString = 0x000004E9,
            .xColumn = 176,
            .helpTextId = 0x00000544,
        },
        {
            .sortKey = UNITLIST_SORTKEY_6,
            .labelString = 0x000004EA,
            .xColumn = 196,
            .helpTextId = 0x000006E9,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_2] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_7,
            .labelString = 0x000004EB,
            .xColumn = 64,
            .helpTextId = 0x000006EA,
        },
        {
            .sortKey = UNITLIST_SORTKEY_8,
            .labelString = 0x000004EC,
            .xColumn = 91,
            .helpTextId = 0x00000548,
        },
        {
            .sortKey = UNITLIST_SORTKEY_9,
            .labelString = 0x000004ED,
            .xColumn = 113,
            .helpTextId = 0x00000549,
        },
        {
            .sortKey = UNITLIST_SORTKEY_10,
            .labelString = 0x000004EE,
            .xColumn = 136,
            .helpTextId = 0x0000054A,
        },
        {
            .sortKey = UNITLIST_SORTKEY_11,
            .labelString = 0x000004EF,
            .xColumn = 161,
            .helpTextId = 0x0000054B,
        },
        {
            .sortKey = UNITLIST_SORTKEY_12,
            .labelString = 0x000004F0,
            .xColumn = 184,
            .helpTextId = 0x0000054C,
        },
        {
            .sortKey = UNITLIST_SORTKEY_13,
            .labelString = 0x000004F1,
            .xColumn = 203,
            .helpTextId = 0x00000551,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_3] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_14,
            .labelString = 0x000004F2,
            .xColumn = 80,
            .helpTextId = 0x000006EB,
        },
        {
            .sortKey = UNITLIST_SORTKEY_15,
            .labelString = 0x000004F3,
            .xColumn = 135,
            .helpTextId = 0x0000055C,
        },
        {
            .sortKey = UNITLIST_SORTKEY_16,
            .labelString = 0x000004F4,
            .xColumn = 166,
            .helpTextId = 0x0000055D,
        },
        {
            .sortKey = UNITLIST_SORTKEY_17,
            .labelString = 0x000004F5,
            .xColumn = 200,
            .helpTextId = 0x00000560,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_4] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_18,
            .labelString = 0x000004F6,
            .xColumn = 68,
            .helpTextId = 0x0000054D,
        },
        {
            .sortKey = UNITLIST_SORTKEY_19,
            .labelString = 0x000004F7,
            .xColumn = 96,
            .helpTextId = 0x0000054E,
        },
        {
            .sortKey = UNITLIST_SORTKEY_20,
            .labelString = 0x000004F8,
            .xColumn = 123,
            .helpTextId = 0x0000054F,
        },
        {
            .sortKey = UNITLIST_SORTKEY_22,
            .labelString = 0x000004F9,
            .xColumn = 140,
            .helpTextId = 0x00000550,
        },
        {
            .sortKey = UNITLIST_SORTKEY_21,
            .labelString = 0x000004FA,
            .xColumn = 188,
            .helpTextId = 0x000006EC,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_WEXP] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_23,
            .labelString = 0,
            .xColumn = 76,
            .helpTextId = 0x00000561,
        },
        {
            .sortKey = UNITLIST_SORTKEY_24,
            .labelString = 0,
            .xColumn = 92,
            .helpTextId = 0x00000562,
        },
        {
            .sortKey = UNITLIST_SORTKEY_25,
            .labelString = 0,
            .xColumn = 108,
            .helpTextId = 0x00000563,
        },
        {
            .sortKey = UNITLIST_SORTKEY_26,
            .labelString = 0,
            .xColumn = 124,
            .helpTextId = 0x00000564,
        },
        {
            .sortKey = UNITLIST_SORTKEY_27,
            .labelString = 0,
            .xColumn = 140,
            .helpTextId = 0x00000568,
        },
        {
            .sortKey = UNITLIST_SORTKEY_28,
            .labelString = 0,
            .xColumn = 156,
            .helpTextId = 0x00000565,
        },
        {
            .sortKey = UNITLIST_SORTKEY_29,
            .labelString = 0,
            .xColumn = 172,
            .helpTextId = 0x00000566,
        },
        {
            .sortKey = UNITLIST_SORTKEY_30,
            .labelString = 0,
            .xColumn = 188,
            .helpTextId = 0x00000567,
        },
    },
    [UNITLIST_PAGE_SUPPORT] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_31,
            .labelString = 0x000004FB,
            .xColumn = 74,
            .helpTextId = 0x0000056A,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_SUPPORT + 1] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_31,
            .labelString = 0x000004FB,
            .xColumn = 74,
            .helpTextId = 0x0000056A,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_SUPPORT + 2] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_31,
            .labelString = 0x000004FB,
            .xColumn = 74,
            .helpTextId = 0x0000056A,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
    [UNITLIST_PAGE_SUPPORT + 3] =
    {
        {
            .sortKey = UNITLIST_SORTKEY_1,
            .labelString = 0x000004E5,
            .xColumn = 20,
            .helpTextId = 0x000006E7,
        },
        {
            .sortKey = UNITLIST_SORTKEY_31,
            .labelString = 0x000004FB,
            .xColumn = 74,
            .helpTextId = 0x0000056A,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
        {
            .sortKey = 0,
            .labelString = 0,
            .xColumn = 0,
            .helpTextId = 0,
        },
    },
};

// clang-format on
