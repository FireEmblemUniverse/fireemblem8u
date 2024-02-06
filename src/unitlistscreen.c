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

enum
{
    UNITLIST_PAGE_SOLOANIM = 0,
    UNITLIST_PAGE_1 = 1,
    UNITLIST_PAGE_2 = 2,
    UNITLIST_PAGE_3 = 3,
    UNITLIST_PAGE_4 = 4,
    UNITLIST_PAGE_WEXP = 5,
    UNITLIST_PAGE_SUPPORT = 6,
};

enum
{
    UNITLIST_MODE_FIELD = 0,
    UNITLIST_MODE_PREPMENU = 1,
    // UNITLIST_MODE_2 = 2,
    UNITLIST_MODE_SOLOANIM = 3,
    UNITLIST_MODE_4 = 4,
};

struct UnitListScreenProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u16 unk_3c;
    /* 3E */ u16 unk_3e;
    /* 44 */ ProcPtr unk_40;
    /* 48 */ ProcPtr unk_44;
};

struct UnitListScreenSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct UnitListScreenProc * unk_2c;
    /* 30 */ u8 unk_30;
    /* 34 */ ProcPtr unk_34;
    /* 38 */ u16 unk_38;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
    /* 3E */ s16 unk_3e;
    /* 40 */ s16 unk_40;
    /* 42 */ s16 unk_42;
    /* 44 */ s16 unk_44;
    /* 46 */ s16 unk_46;
    /* 48 */ s16 unk_48;
};

struct UnitListScreenField
{
    /* 00 */ u8 sortKey;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ int labelString;
    /* 08 */ u8 xColumn;
    /* 09 */ STRUCT_PAD(0x09, 0x0C);
    /* 0C */ u32 helpTextId;
};

extern struct UnitListScreenField gUnknown_08A17C48[][9];

struct SortedUnitEnt
{
    /* 00 */ struct Unit * unit;
    /* 04 */ s16 battleAttack;
    /* 06 */ s16 battleHitRate;
    /* 08 */ s16 battleAvoidRate;
    /* 0A */ u8 supportCount;
};

extern struct SortedUnitEnt gUnknown_0200D3E0[]; // gSortedUnitsBuf
extern struct SortedUnitEnt * gUnknown_0200D6E0[]; // gSortedUnits

struct Unknown_02013460
{
    /* 00 */ u16 unk_00[8]; // 0x10
    /* 10 */ u16 unk_10; // this is part of unk_00
};

extern struct Unknown_02013460 gUnknown_02013460;

extern int gUnknown_08205B84[];
extern u16 gUnknown_08A17B64[];
extern u16 gUnknown_08A17B6C[];
extern u16 * gUnknown_08A17C20[];

extern u8 gUnknown_08A1CD68[]; // img
extern u8 gUnknown_08A1CDC4[]; // img
extern u8 gUnknown_08A1D288[]; // img

extern u16 gUnknown_08A1A084[];
extern u16 Pal_SysBrownBox[];

extern u8 gUnknown_08A1C8B4[]; // tsa

extern struct Text gUnknown_0200E060[];
extern struct Text gUnknown_0200E098[][3];
extern struct Text gUnknown_0200E140;
extern struct Text gUnknown_0200E148;
extern struct Text gUnknown_0200E150;
extern struct Unit gUnknown_0200E158[];
extern u8 gUnknown_0200F158;
extern u32 gUnknown_0200F15C[];

void sub_8090D80(struct UnitListScreenProc *);
void sub_8092298(u8, u8, s8);
void sub_80922F0(struct UnitListScreenProc *, u8, u16 *, u8, s8);
bool sub_8092BF0(u8, u8);
void sub_8097FDC(void);

bool CheckInLinkArena(void);

struct Text gUnknown_0200E150;
extern u32 gUnknown_0200F15C[]; // equipped item icons

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

extern u16 * gUnknown_08A17B58[];

//! FE8U = 0x080901BC
void sub_80901BC(u8 x, u8 y, u8 width)
{
    int i;

    PutSpriteExt(0xd, x, y, gUnknown_08A17B58[0], OAM2_PAL(5));

    for (i = 0; i < width - 1; i++)
    {
        PutSpriteExt(0xd, x + i * 16 + 8, y, gUnknown_08A17B58[1], OAM2_PAL(5));
    }

    PutSpriteExt(0xd, x + i * 16 + 8, y, gUnknown_08A17B58[2], OAM2_PAL(5));

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
            if (gUnknown_08A17C48[i][j].sortKey == key)
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
                    Text_DrawString(&gUnknown_0200E150, GetStringFromIndex(gUnknown_08A17C48[i][j].labelString));
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
void sub_8090324(int unk)
{
    int i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] == unk)
        {
            return;
        }
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] == 0xFF)
        {
            gUnknown_0200F15C[i] = unk;
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
        if (GetUnitEquippedWeapon(gUnknown_0200D6E0[offset + i]->unit) != 0)
        {
            displayIcons[i] = GetItemIconId(GetUnitEquippedWeapon(gUnknown_0200D6E0[offset + i]->unit));
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
            if (gUnknown_0200D6E0[i]->unit->pCharacterData->number == unitId)
                goto _080904FC;

            continue;
        }
        else
        {
            if (gUnknown_0200D6E0[i]->unit->index == unitId)
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

        SetWin0Box(0, 0x3A, 0xF0, 0x98);
        SetWin1Box(0, 0, 0xF0, 0x20);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWin1Layers(0, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 0);
    }
    else
    {
        SetWinEnable(1, 0, 0);

        SetWin0Box(0, 0x3A, 0xF0, 0x98);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 1);
    }

    return;
}

//! FE8U = 0x08090620
void sub_8090620(struct UnitListScreenProc * proc)
{
    MU_EndAll();
    Proc_End(proc->unk_40);
    Proc_End(proc->unk_44);
    EndGreenText();

    SetWinEnable(0, 0, 0);

    if (proc->unk_39 == 1)
    {
        SetStatScreenConfig(0x11);
    }
    else
    {
        SetStatScreenConfig(0x1f);
    }

    StartStatScreen(gUnknown_0200D6E0[proc->unk_30]->unit, proc);
    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;
    proc->unk_29 = 4;

    return;
}

//! FE8U = 0x080906AC
void sub_80906AC(struct UnitListScreenProc * proc)
{
    sub_8090D80(proc);
    SetDispEnable(0, 0, 0, 0, 0);

    return;
}

//! FE8U = 0x080906D8
void sub_80906D8(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x080906F8
void sub_80906F8(struct UnitListScreenSpritesProc * proc)
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
void sub_8090784(struct UnitListScreenSpritesProc * proc)
{
    int i;
    int r7;
    int r8;

    int hack[4];
    memcpy(hack, gUnknown_08205B84, 16);

    PutSpriteExt(
        0xb, (proc->unk_2c->unk_34 == 0) ? 0xe2 : 0x000020E2, hack[(proc->unk_3b / 8) % 4] + 7, gUnknown_08A17B64,
        0x9000);

    PutSpriteExt(0xd, 0x10, 8, gUnknown_08A17C20[proc->unk_2c->unk_2f], 0x9000);

    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnknown_0200F158, 6);

    if (proc->unk_2c->unk_29 >= 3)
    {
        DisplayUiHand(
            gUnknown_08A17C48[proc->unk_2c->unk_2f][proc->unk_2c->unk_2d].xColumn, proc->unk_2c->unk_2c * 16 + 40);
    }
    else
    {
        PutSpriteExt(0xd, 4, proc->unk_2c->unk_2c * 16 + 0x40, gUnknown_08A17B6C, 0x9000);
    }

    if ((proc->unk_38 != proc->unk_2c->unk_3e) || ((proc->unk_2c->unk_3e % 0x10) != 0))
    {
        gPaletteBuffer[0x19E] = gUnknown_02013460.unk_10;
        EnablePaletteSync();

        proc->unk_3c = 0x20;
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
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gUnknown_0200D6E0[i + r7]->unit);
    }

    if ((proc->unk_3a != 0) && ((i + r7) < gUnknown_0200F158))
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gUnknown_0200D6E0[i + r7]->unit);
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

        if (proc->unk_40 > 0xe1)
        {
            proc->unk_40--;
        }
    }

    if ((proc->unk_2c->unk_2f > 1) && (proc->unk_2c->unk_39 != 3))
    {
        PutSprite(0, proc->unk_3e, 0x28, gObject_8x8, (((u16)proc->unk_42 >> 5) % 6) + 0x00001414);
        PutSprite(0, proc->unk_3e, 0x30, gObject_8x8, (((u16)proc->unk_42 >> 5) % 6) + 0x0000141A);
    }

    if ((proc->unk_2c->unk_2f < proc->unk_2c->unk_2e) && (proc->unk_2c->unk_39 != 3))
    {
        PutSprite(0, proc->unk_40, 0x28, gObject_8x8_HFlipped, (((u16)proc->unk_44 >> 5) % 6) + 0x00001414);
        PutSprite(0, proc->unk_40, 0x30, gObject_8x8_HFlipped, (((u16)proc->unk_44 >> 5) % 6) + 0x0000141A);
    }

    proc->unk_3b++;
    proc->unk_3c++;

    return;
}

//! FE8U = 0x08090B44
void nullsub_63(void)
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
        proc->unk_3b++;
    }

    gUnknown_0200D3E0[gUnknown_0200F158].unit = unit;

    BattleGenerateUiStats(unit, -1);

    gUnknown_0200D3E0[gUnknown_0200F158].battleAttack = ((gBattleActor.battleAttack + 1) & 0xff) - 1;
    gUnknown_0200D3E0[gUnknown_0200F158].battleHitRate = ((gBattleActor.battleHitRate + 1) & 0xff) - 1;
    gUnknown_0200D3E0[gUnknown_0200F158].battleAvoidRate = ((gBattleActor.battleAvoidRate + 1) & 0xff) - 1;

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

    gUnknown_0200D3E0[gUnknown_0200F158].supportCount = supportCountNow;
    gUnknown_0200D6E0[gUnknown_0200F158] = &gUnknown_0200D3E0[gUnknown_0200F158];

    gUnknown_0200F158++;

    UseUnitSprite(GetUnitSMSId(unit));

    return;
}

//! FE8U = 0x08090C58
void sub_8090C58(struct UnitListScreenProc * proc)
{
    gUnknown_0200F158 = 0;

    if (proc->unk_39 == 1)
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

    if (proc->unk_39 == 1)
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

extern struct ProcCmd ProcScr_bmview[];

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
    SetupMapSpritesPalettes();

    CpuFastFill(0, gPaletteBuffer + 0x1B0, 0x20);

    LoadObjUIGfx();

    StartGreenText(proc);

    proc->unk_3b = 0;
    proc->unk_2e = 6;

    sub_8090D00(proc);

    if ((proc->unk_39 != 1) || (proc->unk_2a == 1))
    {
        val = gPlaySt.lastUnitSortType;

        if (val != 0)
        {
            proc->unk_33 = (val >> 7) & 1;
            proc->unk_34 = proc->unk_33;
            proc->unk_32 = val & 0x7f;
        }

        if ((proc->unk_29 != 4) && (proc->unk_2f != 0))
        {
            val = gPlaySt.unk19 / 16;

            if (val != 0)
            {
                if (val > 6)
                {
                    proc->unk_2f = 6;
                }
                else
                {
                    proc->unk_2f = val;
                }

                proc->unk_36 = proc->unk_2f;
            }
        }

        sub_8092BF0(proc->unk_32, proc->unk_34);
    }

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadUiFrameGraphics();

    Decompress(gUnknown_08A1CD68, (void *)0x06014800);
    Decompress(proc->unk_2f != 0 ? gUnknown_08A1CDC4 : gUnknown_08A1D288, (void *)0x06015800);

    CopyToPaletteBuffer(Pal_SysBrownBox, 0x320, 0x40);

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
    else if (proc->unk_39 == 1)
    {
        sub_8090418(proc, 1);
    }

    proc->unk_3c = 0;
    proc->unk_2b = 0;

    ClearText(&gUnknown_0200E140);
    Text_SetCursor(&gUnknown_0200E140, 4);
    Text_SetColor(&gUnknown_0200E140, 0);
    Text_DrawString(&gUnknown_0200E140, GetStringFromIndex(0x000004E5));
    PutText(&gUnknown_0200E140, gBG2TilemapBuffer + 0xa3);

    for (i = 0; i < 20; i++)
    {
        gUnknown_0200F15C[i] = UINT8_MAX;
    }

    for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
    {
        sub_80922F0(proc, i, gBG0TilemapBuffer, proc->unk_2f, 1);
    }

    sub_8092298(proc->unk_2e, proc->unk_2f, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0x10, 0x3a, 0xe0, 0x98);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    BG_SetPosition(BG_3, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_0, 0, (proc->unk_3e - 0x38) & 0xff);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    Decompress(gImg_UiSpinningArrow_Horizontal, gBG1TilemapBuffer + 0x280);
    CopyToPaletteBuffer(gUnknown_08A1A084, 0x1e0, 0x20);

    proc->unk_40 = Proc_Start(ProcScr_bmview, proc);
    proc->unk_44 = (ProcPtr)StartMuralBackground(0, 0, 10);
    LoadHelpBoxGfx(0, -1);

    return;
}

//! FE8U = 0x08091180
void sub_8091180(struct UnitListScreenProc * proc)
{
    proc->unk_29 = 0;
    proc->unk_31 = 1;
    proc->unk_2c = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;

    if (proc->unk_39 == 3)
    {
        proc->unk_2f = 0;
    }
    else
    {
        proc->unk_2f = 1;
    }

    proc->unk_36 = proc->unk_2f;

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
void sub_80911E4(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (proc->unk_3a > proc->unk_3b)
    {
        unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);

        RegisterSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
        {
            sub_80922F0(proc, i, gBG0TilemapBuffer, proc->unk_2f, 1);
        }

        proc->unk_3b++;
        PlaySoundEffect(0x6a);
    }
    else
    {
        PlaySoundEffect(0x6c);
    }

    return;
}

//! FE8U = 0x08091288
void sub_8091288(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (!IsCharacterForceDeployed(unit->pCharacterData->number))
    {
        unit->state |= (US_UNSELECTABLE | US_NOT_DEPLOYED);

        RemoveSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
        {
            sub_80922F0(proc, i, gBG0TilemapBuffer, proc->unk_2f, 1);
        }

        proc->unk_3b--;
        PlaySoundEffect(0x6b);
    }
    else
    {
        PlaySoundEffect(0x6c);
    }

    return;
}

//! FE8U = 0x0809132C
void sub_809132C(struct UnitListScreenProc * proc)
{
    int index = proc->unk_30;
    struct Unit * unit = gUnknown_0200D6E0[index]->unit;

    if ((unit->state & US_BIT25) != 0)
    {
        StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 0x38, 0xC52, proc);
        return;
    }

    if ((unit->state & US_NOT_DEPLOYED) != 0)
    {
        if (CheckInLinkArena() && !CanUnitBeDeployedLinkArena(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 0x38, 0x88A, proc);
            return;
        }

        if (CheckInLinkArena() && !sub_8097E38(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 0x38, 0x889, proc);
            return;
        }

        sub_80911E4(unit, proc);
        return;
    }

    sub_8091288(unit, proc);

    return;
}

//! FE8U = 0x080913D8
void sub_80913D8(struct Unit * unit, int step)
{
    int animState;

    if ((UNIT_CATTRIBUTES(unit) & CA_SUPPLY) != 0)
    {
        PlaySoundEffect(0x6c);
        return;
    }

    animState = (unit->state & US_SOLOANIM) >> 14;
    animState = ((animState + step + 3)) % 3;
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
        switch (proc->unk_39)
        {
            case 1:
                sub_809132C(proc);
                break;

            case 3:
                sub_80913D8(gUnknown_0200D6E0[proc->unk_30]->unit, 1);
                sub_80922F0(proc, proc->unk_30, gBG0TilemapBuffer, proc->unk_2f, 0);
                break;

            case 0:
                SetLastStatScreenUid(gUnknown_0200D6E0[proc->unk_30]->unit->index);
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
        if (proc->unk_39 == 3)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_LEFT) == 0)
                return;

            sub_80913D8(gUnknown_0200D6E0[proc->unk_30]->unit, -1);
            sub_80922F0(proc, proc->unk_30, gBG0TilemapBuffer, proc->unk_2f, 0);

            return;
        }

        if (proc->unk_2f < 2)
            return;

        proc->unk_36--;
        Proc_Goto(proc, 2);
        proc->unk_2d = 0;
        PlaySoundEffect(0x6F);

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        if (proc->unk_39 == 3)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) == 0)
                return;

            sub_80913D8(gUnknown_0200D6E0[proc->unk_30]->unit, +1);
            sub_80922F0(proc, proc->unk_30, gBG0TilemapBuffer, proc->unk_2f, 0);

            return;
        }

        if (proc->unk_2f < proc->unk_2e)
        {
            proc->unk_36++;
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

                sub_80922F0(proc, proc->unk_3e / 16 - 1, gBG0TilemapBuffer, proc->unk_2f, 1);
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
                sub_80922F0(proc, 6 + proc->unk_3e / 16, gBG0TilemapBuffer, proc->unk_2f, 1);
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

    if (proc->unk_2b != 0 && (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) != 0)
    {
        CloseHelpBox();
        proc->unk_2b = 0;
        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0 && proc->unk_2b == 0)
    {
        unk_32 = proc->unk_32;

        proc->unk_2a = 1;
        PlaySoundEffect(0x6A);
        proc->unk_32 = gUnknown_08A17C48[proc->unk_2f][proc->unk_2d].sortKey;
        proc->unk_33 = (proc->unk_33 + 1) & 1;

        if (sub_8092BF0(proc->unk_32, proc->unk_33))
        {
            for (i = 0; i < 6 && i < gUnknown_0200F158; i++)
            {
                sub_80922F0(proc, i, gBG0TilemapBuffer, proc->unk_2f, 1);
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

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && proc->unk_2b == 0)
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
            if (proc->unk_2f < 2)
                return;

            if (proc->unk_39 == 3)
                return;

            PlaySoundEffect(0x6F);
            proc->unk_36--;

            for (i = 8; i > 0 && gUnknown_08A17C48[proc->unk_36][i].xColumn == 0; i--)
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

        if (proc->unk_2d == 8 || gUnknown_08A17C48[proc->unk_2f][proc->unk_2d + 1].xColumn == 0)
        {
            if (proc->unk_2f < proc->unk_2e)
            {
                if (proc->unk_39 == 3)
                    return;

                proc->unk_2d = 0;
                PlaySoundEffect(0x6F);

                proc->unk_36++;
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

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0 && proc->unk_2b == 0)
    {
        proc->unk_2b = 1;

        StartHelpBox(
            gUnknown_08A17C48[proc->unk_2f][proc->unk_2d].xColumn, 0x28,
            gUnknown_08A17C48[proc->unk_2f][proc->unk_2d].helpTextId);
    }

    return;
}

//! FE8U = 0x08091AB4
void sub_8091AB4(void)
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

    if (((gKeyStatusPtr->newKeys & 2) != 0) && (proc->unk_2b == 0))
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
            BG_SetPosition(0, 0, (proc->unk_3e - 0x38) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                sub_8090358(proc->unk_3e);
            }

            break;

        case 2:
            proc->unk_3e += -(4 * proc->unk_31);
            BG_SetPosition(0, 0, (proc->unk_3e - 0x38) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                sub_8090358(proc->unk_3e);
            }

            break;
    }

    if ((proc->unk_2b != 0) && (prev != proc->unk_2d))
    {
        StartHelpBox(
            gUnknown_08A17C48[proc->unk_36][proc->unk_2d].xColumn, 0x28,
            gUnknown_08A17C48[proc->unk_36][proc->unk_2d].helpTextId);
    }

    return;
}

//! FE8U = 0x08091C00
void sub_8091C00(struct UnitListScreenProc * proc)
{
    int page;

    if (proc->unk_39 == 1)
    {
        PrepSetLatestCharId(gUnknown_0200D6E0[proc->unk_30]->unit->pCharacterData->number);
        sub_809014C();
    }

    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;

    page = proc->unk_2f;
    if (page != 0)
    {
        page = (proc->unk_2f << 4);
        gPlaySt.unk19 &= 0xf;
        gPlaySt.unk19 |= page;
    }

    Proc_End(proc->unk_40);

    if (proc->unk_44 != NULL)
    {
        Proc_End(proc->unk_44);
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

extern u16 gUnknown_0200D7E0[];
extern u16 gUnknown_0200DFE0[];

void sub_80921CC(u16 *, u8);

//! FE8U = 0x08091CC0
void sub_8091CC0(struct UnitListScreenProc * proc)
{
    int i;

    TileMap_FillRect(gUnknown_0200D7E0, 31, 31, 0);

    for (i = proc->unk_3e / 16; i < proc->unk_3e / 16 + 6 && i < gUnknown_0200F158; i++)
    {
        sub_80922F0(proc, i, gUnknown_0200D7E0, proc->unk_2f, 0);
    }

    TileMap_FillRect(gUnknown_0200DFE0, 31, 1, 0);

    sub_80921CC(gUnknown_0200DFE0, proc->unk_2f);

    proc->unk_3c = 0;
    proc->unk_37 = proc->unk_2f;
    proc->unk_38 = 0;

    return;
}

extern u8 gUnknown_08A17B30[];

#if NONMATCHING

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
        if (proc->unk_36 > proc->unk_2f)
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
            gBG0TilemapBuffer[off + i] = *(gUnknown_0200D7E0 + r1 + (r4 & 0x1F) * 0x20);
        }

        for (r4 = 0; r4 < 2; r4++)
        {
            int off = 0xA8 + r4 * 0x20;
            gBG2TilemapBuffer[off + i] = *(gUnknown_0200DFE0 + r1 + r4 * 0x20);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 < 20)
    {
        return;
    }

    proc->unk_2f = proc->unk_36;

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
        sub_80922F0(proc, r4, gUnknown_0200D7E0, proc->unk_2f, 0);
    }

    sub_80921CC(gUnknown_0200DFE0, proc->unk_2f);
    sub_8092298(proc->unk_2e, proc->unk_2f, 0);

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    Proc_Break(proc);

    return;
}

#else

NAKEDFUNC
void sub_8091D54(struct UnitListScreenProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x10\n\
        adds r5, r0, #0\n\
        adds r2, r5, #0\n\
        adds r2, #0x38\n\
        ldr r1, _08091DB4  @ gUnknown_08A17B30\n\
        ldrh r0, [r5, #0x3c]\n\
        adds r0, r0, r1\n\
        ldrb r0, [r0]\n\
        ldrb r1, [r2]\n\
        adds r0, r0, r1\n\
        strb r0, [r2]\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        cmp r0, #0x14\n\
        bls _08091D80\n\
        movs r0, #0x14\n\
        strb r0, [r2]\n\
    _08091D80:\n\
        ldrh r0, [r5, #0x3c]\n\
        adds r0, #1\n\
        strh r0, [r5, #0x3c]\n\
        movs r3, #0\n\
        str r2, [sp, #0xc]\n\
        adds r2, r5, #0\n\
        adds r2, #0x36\n\
        str r2, [sp, #8]\n\
        movs r0, #0x2f\n\
        adds r0, r0, r5\n\
        mov sl, r0\n\
        ldr r1, [sp, #0xc]\n\
        str r1, [sp, #4]\n\
    _08091D9A:\n\
        ldr r2, [sp, #8]\n\
        ldrb r0, [r2]\n\
        mov r1, sl\n\
        ldrb r1, [r1]\n\
        cmp r0, r1\n\
        bls _08091DB8\n\
        ldr r2, [sp, #4]\n\
        ldrb r0, [r2]\n\
        adds r0, r3, r0\n\
        cmp r0, #0x14\n\
        bgt _08091DC0\n\
        b _08091DC6\n\
        .align 2, 0\n\
    _08091DB4: .4byte gUnknown_08A17B30\n\
    _08091DB8:\n\
        ldr r1, [sp, #4]\n\
        ldrb r0, [r1]\n\
        cmp r3, r0\n\
        bge _08091DC4\n\
    _08091DC0:\n\
        movs r1, #0\n\
        b _08091DCC\n\
    _08091DC4:\n\
        subs r0, r3, r0\n\
    _08091DC6:\n\
        adds r0, #8\n\
        lsls r0, r0, #0x18\n\
        lsrs r1, r0, #0x18\n\
    _08091DCC:\n\
        ldrh r0, [r5, #0x3e]\n\
        lsrs r4, r0, #3\n\
        adds r0, r4, #0\n\
        adds r0, #0xc\n\
        lsls r6, r1, #1\n\
        adds r2, r3, #1\n\
        mov r9, r2\n\
        cmp r4, r0\n\
        bge _08091E10\n\
        movs r0, #0x1f\n\
        mov r8, r0\n\
        ldr r1, _08091E8C  @ gBG0TilemapBuffer\n\
        mov ip, r1\n\
        ldr r7, _08091E90  @ gUnknown_0200D7E0\n\
        adds r2, r6, #0\n\
    _08091DEA:\n\
        adds r0, r4, #0\n\
        mov r1, r8\n\
        ands r0, r1\n\
        lsls r1, r0, #5\n\
        adds r1, #8\n\
        adds r1, r1, r3\n\
        lsls r1, r1, #1\n\
        add r1, ip\n\
        lsls r0, r0, #6\n\
        adds r0, r2, r0\n\
        adds r0, r0, r7\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r4, #1\n\
        ldrh r0, [r5, #0x3e]\n\
        lsrs r0, r0, #3\n\
        adds r0, #0xc\n\
        cmp r4, r0\n\
        blt _08091DEA\n\
    _08091E10:\n\
        ldr r0, _08091E94  @ gBG2TilemapBuffer\n\
        ldr r1, _08091E98  @ gUnknown_0200DFE0\n\
        adds r2, r6, r1\n\
        adds r1, r3, #0\n\
        adds r1, #0xa8\n\
        movs r4, #1\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r0\n\
    _08091E20:\n\
        ldrh r0, [r2]\n\
        strh r0, [r1]\n\
        adds r2, #0x40\n\
        adds r1, #0x40\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bge _08091E20\n\
        mov r3, r9\n\
        cmp r3, #0x13\n\
        ble _08091D9A\n\
        movs r0, #5\n\
        bl BG_EnableSyncByMask\n\
        ldr r2, [sp, #0xc]\n\
        ldrb r0, [r2]\n\
        cmp r0, #0x13\n\
        bls _08091EF4\n\
        ldr r1, [sp, #8]\n\
        ldrb r0, [r1]\n\
        mov r2, sl\n\
        strb r0, [r2]\n\
        ldr r0, _08091E9C  @ gBG2TilemapBuffer+0x150\n\
        movs r1, #0x16\n\
        movs r2, #1\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r0, _08091EA0  @ gBG0TilemapBuffer+0x010\n\
        movs r1, #0x16\n\
        movs r2, #0x1f\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        adds r4, r5, #0\n\
        adds r4, #0x32\n\
        adds r6, r5, #0\n\
        adds r6, #0x2e\n\
        ldr r1, _08091EA4  @ gUnknown_0200F15C\n\
        movs r2, #0xff\n\
        adds r0, r1, #0\n\
        adds r0, #0x4c\n\
    _08091E72:\n\
        str r2, [r0]\n\
        subs r0, #4\n\
        cmp r0, r1\n\
        bge _08091E72\n\
        bl ResetIconGraphics\n\
        ldrb r0, [r4]\n\
        bl sub_8090238\n\
        ldrh r0, [r5, #0x3e]\n\
        lsrs r4, r0, #4\n\
        adds r0, r4, #6\n\
        b _08091EC4\n\
        .align 2, 0\n\
    _08091E8C: .4byte gBG0TilemapBuffer\n\
    _08091E90: .4byte gUnknown_0200D7E0\n\
    _08091E94: .4byte gBG2TilemapBuffer\n\
    _08091E98: .4byte gUnknown_0200DFE0\n\
    _08091E9C: .4byte gBG2TilemapBuffer+0x150\n\
    _08091EA0: .4byte gBG0TilemapBuffer+0x010\n\
    _08091EA4: .4byte gUnknown_0200F15C\n\
    _08091EA8:\n\
        lsls r1, r4, #0x18\n\
        lsrs r1, r1, #0x18\n\
        mov r0, sl\n\
        ldrb r3, [r0]\n\
        movs r0, #0\n\
        str r0, [sp]\n\
        adds r0, r5, #0\n\
        ldr r2, _08091F04  @ gUnknown_0200D7E0\n\
        bl sub_80922F0\n\
        adds r4, #1\n\
        ldrh r0, [r5, #0x3e]\n\
        lsrs r0, r0, #4\n\
        adds r0, #6\n\
    _08091EC4:\n\
        cmp r4, r0\n\
        bge _08091ED0\n\
        ldr r0, _08091F08  @ gUnknown_0200F158\n\
        ldrb r0, [r0]\n\
        cmp r4, r0\n\
        blt _08091EA8\n\
    _08091ED0:\n\
        ldr r0, _08091F0C  @ gUnknown_0200DFE0\n\
        mov r2, sl\n\
        ldrb r1, [r2]\n\
        bl sub_80921CC\n\
        ldrb r0, [r6]\n\
        mov r2, sl\n\
        ldrb r1, [r2]\n\
        movs r2, #0\n\
        bl sub_8092298\n\
        movs r0, #0\n\
        ldr r1, [sp, #0xc]\n\
        strb r0, [r1]\n\
        strh r0, [r5, #0x3c]\n\
        adds r0, r5, #0\n\
        bl Proc_Break\n\
    _08091EF4:\n\
        add sp, #0x10\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08091F04: .4byte gUnknown_0200D7E0\n\
    _08091F08: .4byte gUnknown_0200F158\n\
    _08091F0C: .4byte gUnknown_0200DFE0\n\
        .syntax divided\n\
    ");
}

#endif

#if NONMATCHING

#define TILEMAP_INDEX_(aX, aY) ((aX) + (aY) * 0x20)

//! FE8U = 0x08091F10
void sub_8091F10(struct UnitListScreenProc * proc)
{
    int r5;
    int r4;
    u8 r1;
    int y;
    int off;

    proc->unk_38 += gUnknown_08A17B30[proc->unk_3c];

    if (proc->unk_38 > 20)
    {
        proc->unk_38 = 20;
    }

    do
    {
        proc->unk_3c++;

        if (proc->unk_36 > proc->unk_37)
        {
            int r6 = 0x1c;
            int r3 = 8;
            for (r5 = 0; r5 < proc->unk_38; r5++)
            {
                for (r4 = proc->unk_3e / 8; r4 < proc->unk_3e / 8 + 12; r4++)
                {
                    y = r4 & 0x1f;
                    off = TILEMAP_INDEX_(r5 + r3, y);
                    gBG0TilemapBuffer[TILEMAP_INDEX_((r5 + r6) - proc->unk_38, y)] = gUnknown_0200D7E0[off];
                }

                for (r4 = 0; r4 < 2; r4++)
                {
                    gBG2TilemapBuffer[TILEMAP_INDEX_((r5 + r6) - proc->unk_38, r4 + 5)] =
                        gUnknown_0200DFE0[TILEMAP_INDEX_(r5 + r3, r4)];
                }
            }
        }
        else
        {
            int r6 = 0x1c;
            int r3 = 8;
            for (r5 = 0; r5 < proc->unk_38; r5++)
            {

                for (r4 = proc->unk_3e / 8; r4 < 12 + proc->unk_3e / 8; r4++)
                {
                    y = r4 & 0x1f;
                    gBG0TilemapBuffer[TILEMAP_INDEX_(r5 + r3, y)] =
                        gUnknown_0200D7E0[TILEMAP_INDEX_((r5 + r6) - proc->unk_38, y)];
                    r6 = 0x1c;
                }

                for (r4 = 0; r4 < 2; r4++)
                {
                    gBG2TilemapBuffer[TILEMAP_INDEX_(r5 + r3, r4 + 5)] =
                        gUnknown_0200DFE0[TILEMAP_INDEX_(((r5 + r6) - proc->unk_38), r4)];
                }
            }
        }
    } while (0);

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

extern struct ProcCmd ProcScr_bmenu[];

//! FE8U = 0x080920C4
void sub_80920C4(void)
{
    struct UnitListScreenProc * proc = Proc_Start(ProcScr_bmenu, PROC_TREE_3);

    proc->unk_39 = 0;

    return;
}

extern struct ProcCmd ProcScr_bmenu2[];

//! FE8U = 0x080920DC
void sub_80920DC(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_bmenu2, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_bmenu2, parent);
    }

    proc->unk_39 = 1;

    if (CheckInLinkArena() == 1)
    {
        proc->unk_3a = 5;
    }
    else
    {
        proc->unk_3a = GetChapterAllyUnitCount();
    }

    proc->unk_3b = 0;

    return;
}

extern struct ProcCmd gUnknown_08A17990[];

//! FE8U = 0x08092134
void sub_8092134(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(gUnknown_08A17990, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(gUnknown_08A17990, parent);
    }

    proc->unk_39 = 3;

    return;
}

//! FE8U = 0x08092164
void sub_8092164(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_bmenu2, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_bmenu2, parent);
    }

    proc->unk_39 = 4;

    return;
}

extern struct ProcCmd ProcScr_bmenu3[];

//! FE8U = 0x08092194
void sub_8092194(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_bmenu3, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_bmenu3, parent);
    }

    ResetUnitSprites();

    proc->unk_39 = 5;

    return;
}

//! FE8U = 0x080921CC
void sub_80921CC(u16 * tm, u8 page)
{
    int i;

    TileMap_FillRect(tm + 9, 19, 1, 0);
    ClearText(&gUnknown_0200E148);

    if (page == 5)
    {
        for (i = 0; i < 8; i++)
        {
            DrawIcon(tm + 9 + 2 * i, i + 112, OAM2_PAL(5));
        }
    }
    else
    {
        for (i = 1; i < 9 && gUnknown_08A17C48[page][i].xColumn != 0; i++)
        {
            Text_SetCursor(&gUnknown_0200E148, gUnknown_08A17C48[page][i].xColumn - 0x40);
            Text_SetColor(&gUnknown_0200E148, 0);
            Text_DrawString(&gUnknown_0200E148, GetStringFromIndex(gUnknown_08A17C48[page][i].labelString));
        }

        PutText(&gUnknown_0200E148, tm + 8);
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x08092298
void sub_8092298(u8 maxPages, u8 page, s8 flag)
{
    if (page != 0)
    {
        PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 26, 3), TEXT_COLOR_SYSTEM_BLUE, page);
        PutSpecialChar(TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 3), TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_SLASH);
        PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 28, 3), TEXT_COLOR_SYSTEM_BLUE, maxPages);
    }

    if (flag)
    {
        sub_80921CC(TILEMAP_LOCATED(gBG2TilemapBuffer, 0, 5), page);
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

extern int gUnknown_08205B94[];

//! FE8U = 0x080922F0
void sub_80922F0(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName)
{
    u8 inactive;
    u8 i;
    u8 num;
    int icon;

    int row = unitNum % 7;
    int y = (unitNum * 2) & 0x1F;

    if ((gUnknown_0200D6E0[unitNum]->unit->state & US_NOT_DEPLOYED) != 0)
        inactive = 1;
    else
        inactive = 0;

    if (putName != 0)
    {
        ClearText(&gUnknown_0200E060[row]);
        Text_SetCursor(&gUnknown_0200E060[row], 0);

        if (!CheckInLinkArena() && proc->unk_39 == UNITLIST_MODE_PREPMENU &&
            IsCharacterForceDeployed(gUnknown_0200D6E0[unitNum]->unit->pCharacterData->number))
        {
            Text_SetColor(&gUnknown_0200E060[row], TEXT_COLOR_SYSTEM_GREEN);
        }
        else
        {
            Text_SetColor(&gUnknown_0200E060[row], inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);
        }

        Text_DrawString(
            &gUnknown_0200E060[row], GetStringFromIndex(gUnknown_0200D6E0[unitNum]->unit->pCharacterData->nameTextId));
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
                GetStringFromIndex(gUnknown_0200D6E0[unitNum]->unit->pClassData->nameTextId));
            Text_SetColor(&gUnknown_0200E098[row][1], inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);

            if (GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit) == 0)
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
                    GetItemName(GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit)));
                DrawIcon(
                    tm + y * 0x20 + 15, GetItemIconId(GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit)),
                    TILEREF(0, 4));
                sub_8090324(GetItemIconId(GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit)));
            }

            ClearText(&gUnknown_0200E098[row][2]);

            switch (gUnknown_0200D6E0[unitNum]->unit->state & US_SOLOANIM)
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
                GetStringFromIndex(gUnknown_0200D6E0[unitNum]->unit->pClassData->nameTextId));

            // level
            PutNumberOrBlank(
                tm + y * 0x20 + 17, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gUnknown_0200D6E0[unitNum]->unit->level);

            // exp
            PutNumberOrBlank(
                tm + y * 0x20 + 20, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gUnknown_0200D6E0[unitNum]->unit->exp);

            // hp
            PutNumberOrBlank(
                tm + y * 0x20 + 23, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitCurrentHp(gUnknown_0200D6E0[unitNum]->unit));
            PutSpecialChar(tm + y * 0x20 + 24, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0x16);
            PutNumberOrBlank(
                tm + y * 0x20 + 26, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitMaxHp(gUnknown_0200D6E0[unitNum]->unit));

            break;

        case UNITLIST_PAGE_2:
            PutNumberOrBlank(
                tm + y * 0x20 + 9,
                UNIT_POW_MAX(gUnknown_0200D6E0[unitNum]->unit) == gUnknown_0200D6E0[unitNum]->unit->pow ? 4 : 2,
                GetUnitPower(gUnknown_0200D6E0[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 12,
                UNIT_SKL_MAX(gUnknown_0200D6E0[unitNum]->unit) == gUnknown_0200D6E0[unitNum]->unit->skl ? 4 : 2,
                GetUnitSkill(gUnknown_0200D6E0[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 15,
                UNIT_SPD_MAX(gUnknown_0200D6E0[unitNum]->unit) == gUnknown_0200D6E0[unitNum]->unit->spd ? 4 : 2,
                GetUnitSpeed(gUnknown_0200D6E0[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 18,
                UNIT_LCK_MAX(gUnknown_0200D6E0[unitNum]->unit) == gUnknown_0200D6E0[unitNum]->unit->lck ? 4 : 2,
                GetUnitLuck(gUnknown_0200D6E0[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 21,
                UNIT_DEF_MAX(gUnknown_0200D6E0[unitNum]->unit) == gUnknown_0200D6E0[unitNum]->unit->def ? 4 : 2,
                GetUnitDefense(gUnknown_0200D6E0[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 24,
                UNIT_RES_MAX(gUnknown_0200D6E0[unitNum]->unit) == gUnknown_0200D6E0[unitNum]->unit->res ? 4 : 2,
                GetUnitResistance(gUnknown_0200D6E0[unitNum]->unit));

            icon = GetUnitAffinityIcon(gUnknown_0200D6E0[unitNum]->unit);

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
            if (GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit) == 0)
            {
                PutDrawText(
                    &gUnknown_0200E098[row][0], tm + y * 0x20 + 10,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x537));
            }
            else
            {
                char const * name = GetItemName(GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit));

                PutDrawText(
                    &gUnknown_0200E098[row][0], tm + y * 0x20 + 10,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, name);

                DrawIcon(
                    tm + y * 0x20 + 8, GetItemIconId(GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit)),
                    TILEREF(0, 4));
                sub_8090324(GetItemIconId(GetUnitEquippedWeapon(gUnknown_0200D6E0[unitNum]->unit)));
            }

            PutNumberOrBlank(
                tm + y * 0x20 + 18, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gUnknown_0200D6E0[unitNum]->battleAttack);

            PutNumberOrBlank(
                tm + y * 0x20 + 22, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gUnknown_0200D6E0[unitNum]->battleHitRate);

            PutNumberOrBlank(
                tm + y * 0x20 + 26, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gUnknown_0200D6E0[unitNum]->battleAvoidRate);

            break;

        case UNITLIST_PAGE_4:
            if ((gUnknown_0200D6E0[unitNum]->unit->state & US_RESCUING) != 0)
            {
                PutDrawText(
                    &gUnknown_0200E098[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 2, 0,
                    GetUnitRescueName(gUnknown_0200D6E0[unitNum]->unit));
            }
            else
            {
                PutDrawText(
                    &gUnknown_0200E098[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 2, 0, GetStringFromIndex(0x536));
            }

            PutNumberOrBlank(
                tm + y * 0x20 + 10, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                UNIT_MOV(gUnknown_0200D6E0[unitNum]->unit));

            PutNumberOrBlank(
                tm + y * 0x20 + 13, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                UNIT_CON(gUnknown_0200D6E0[unitNum]->unit));

            PutNumberOrBlank(
                tm + y * 0x20 + 16, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitAid(gUnknown_0200D6E0[unitNum]->unit));

            PutDrawText(
                &gUnknown_0200E098[row][0], tm + y * 0x20 + 23,
                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 2, 0,
                GetUnitStatusName(gUnknown_0200D6E0[unitNum]->unit));

            break;

        case UNITLIST_PAGE_WEXP:
        {
            for (i = 0; i < 8; i++)
            {
                int hack[7];
                memcpy(hack, gUnknown_08205B94, 7 * 4);

                num = GetWeaponLevelFromExp(gUnknown_0200D6E0[unitNum]->unit->ranks[i]);

                PutSpecialChar(tm + y * 0x20 + 10 + 2 * i, num == WPN_LEVEL_S ? TEXT_COLOR_SYSTEM_GREEN : 2, hack[num]);
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
            supportCount = GetUnitSupporterCount(gUnknown_0200D6E0[unitNum]->unit);

            ClearText(&gUnknown_0200E098[row][2]);

            for (i = 0; i < supportCount; i++)
            {
                if (CanUnitSupportNow(gUnknown_0200D6E0[unitNum]->unit, i))
                {
                    if (supportPassed >= supportStart)
                    {
                        struct Unit * other;
                        if (GetUnitSupporterUnit(gUnknown_0200D6E0[unitNum]->unit, i) == NULL)
                        {
                            continue;
                        }

                        other = GetUnitSupporterUnit(gUnknown_0200D6E0[unitNum]->unit, i);

                        // ?? Why cast to u16?
                        if (((u16)(other->state & US_NOT_DEPLOYED)) == 0)
                        {
                            char const * name = GetStringFromIndex(
                                (GetCharacterData(GetUnitSupporterCharacter(gUnknown_0200D6E0[unitNum]->unit, i)))
                                    ->nameTextId);

                            PutDrawText(
                                &gUnknown_0200E098[row][num], tm + y * 0x20 + 9 + num * 6,
                                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, name);
                        }
                        else
                        {
                            char const * name = GetStringFromIndex(
                                (GetCharacterData(GetUnitSupporterCharacter(gUnknown_0200D6E0[unitNum]->unit, i)))
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
int sub_8092BE4(struct Unit * unit)
{
    return (unit->state & US_SOLOANIM);
}

bool sub_8092BF0(u8 arg_0, u8 arg_1)
{
    u8 cache[0x40];
    u8 r2 = arg_1 & 1;

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
        tmp_addr = gUnknown_0200D6E0[(i)]; \
        gUnknown_0200D6E0[(i)] = gUnknown_0200D6E0[(j)]; \
        gUnknown_0200D6E0[(j)] = tmp_addr; \
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

    #define COND_FIELD(field) ((gUnknown_0200D6E0[j + 1]->field) < (gUnknown_0200D6E0[j]->field))
    #define COND_UNIT_FIELD(field) COND_FIELD(unit->field)

    #define SORT_BY_FUNC(func) \
        SORT_REAL(func(gUnknown_0200D6E0[j + 1]->unit) > func(gUnknown_0200D6E0[j]->unit), \
            func(gUnknown_0200D6E0[j + 1]->unit) < func(gUnknown_0200D6E0[j]->unit))

    #define SORT_BY_UNIT_FIELD(field) \
        SORT_REAL((gUnknown_0200D6E0[j + 1]->unit->field) > (gUnknown_0200D6E0[j]->unit->field), \
            (gUnknown_0200D6E0[j + 1]->unit->field) < (gUnknown_0200D6E0[j]->unit->field))

    switch (arg_0)
    {
        case 1:
            #define KEY_A(i) (gUnknown_0200D6E0[(i)]->unit->pCharacterData->sort_order)
            #define KEY_B(i) (gUnknown_0200D6E0[(i)]->unit->state & US_UNSELECTABLE)

            SORT_MAIN(
                SORT_CORE_KEY(KEY_A, <, SWAP) SORT_CORE_KEY(KEY_B, <, SWAP),
                SORT_CORE_KEY(KEY_A, >, SWAP) SORT_CORE_KEY(KEY_B, >, SWAP))

            #undef KEY_B
            #undef KEY_A

        case 3:
            #define KEY(i) (gUnknown_0200D6E0[(i)]->unit->level)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case 2:
            #define KEY(i) (gUnknown_0200D6E0[(i)]->unit->pClassData->sort_order)
            SORT_MAIN(SORT_CORE_KEY(KEY, <, SWAP), SORT_CORE_KEY(KEY, >, SWAP))
            #undef KEY

        case 4:
            SORT_BY_UNIT_FIELD(exp)
            break;

        case 5:
            SORT_BY_FUNC(GetUnitCurrentHp)
            break;

        case 6:
            SORT_BY_FUNC(GetUnitMaxHp)
            break;

        case 7:
            SORT_BY_FUNC(GetUnitPower)
            break;

        case 8:
            SORT_BY_FUNC(GetUnitSkill)
            break;

        case 9:
            SORT_BY_FUNC(GetUnitSpeed)
            break;

        case 10:
            SORT_BY_FUNC(GetUnitLuck)
            break;

        case 11:
            SORT_BY_FUNC(GetUnitDefense)
            break;

        case 12:
            SORT_BY_FUNC(GetUnitResistance)
            break;

        case 19:
            SORT_BY_FUNC(UNIT_CON)
            break;

        case 20:
            SORT_BY_FUNC(GetUnitAid)
            break;

        case 13:
            #define KEY(i) (GetUnitAffinityIcon(gUnknown_0200D6E0[(i)]->unit))
            SORT_MAIN(SORT_CORE_KEY(KEY, <, SWAP), SORT_CORE_KEY(KEY, >, SWAP))
            #undef KEY

        case 14:
            SORT_MAIN(
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    cache[i] = GetItemIndex(GetUnitEquippedWeapon(gUnknown_0200D6E0[i]->unit));
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
                        else if (cache[j + 1] == cache[j] && GetUnitEquippedWeapon(gUnknown_0200D6E0[j + 1]->unit) > GetUnitEquippedWeapon(gUnknown_0200D6E0[j]->unit))
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
                    cache[i] = GetItemIndex(GetUnitEquippedWeapon(gUnknown_0200D6E0[i]->unit));
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
                        else if (cache[j + 1] == cache[j] && GetUnitEquippedWeapon(gUnknown_0200D6E0[j + 1]->unit) < GetUnitEquippedWeapon(gUnknown_0200D6E0[j]->unit))
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                    }
                }
            })

        case 15:
            #define KEY(i) (gUnknown_0200D6E0[(i)]->battleAttack)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case 16:
            #define KEY(i) (gUnknown_0200D6E0[(i)]->battleHitRate)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case 17:
            #define KEY(i) (gUnknown_0200D6E0[(i)]->battleAvoidRate)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case 18:
            SORT_BY_FUNC(UNIT_MOV)
            break;

        case 21:
            SORT_BY_UNIT_FIELD(statusIndex)
            break;

        case 22:
            SORT_MAIN(
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    if ((gUnknown_0200D6E0[i]->unit->state & US_RESCUING) != 0)
                        cache[i] = 1;
                    else
                        cache[i] = 0;
                }

                SORT_CORE(cache[j + 1] > cache[j], SWAP_CACHE)
            },
            {
                for (i = 0; i < gUnknown_0200F158; i++)
                {
                    if ((gUnknown_0200D6E0[i]->unit->state & US_RESCUING) != 0)
                        cache[i] = 1;
                    else
                        cache[i] = 0;
                }

                SORT_CORE(cache[j + 1] < cache[j], SWAP_CACHE)
            })

        case 23:
            SORT_BY_UNIT_FIELD(ranks[0])
            break;

        case 24:
            SORT_BY_UNIT_FIELD(ranks[1])
            break;

        case 25:
            SORT_BY_UNIT_FIELD(ranks[2])
            break;

        case 26:
            SORT_BY_UNIT_FIELD(ranks[3])
            break;

        case 27:
            SORT_BY_UNIT_FIELD(ranks[4])
            break;

        case 28:
            SORT_BY_UNIT_FIELD(ranks[5])
            break;

        case 29:
            SORT_BY_UNIT_FIELD(ranks[6])
            break;

        case 30:
            SORT_BY_UNIT_FIELD(ranks[7])
            break;

        case 31:
            #define KEY(i) (gUnknown_0200D6E0[(i)]->supportCount)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case 32:
            SORT_BY_FUNC(sub_8092BE4)
            break;
    }

    return FALSE;
}
