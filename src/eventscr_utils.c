#include "global.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmtrick.h"
#include "event.h"
#include "hardware.h"
#include "prepscreen.h"
#include "ekrbattle.h"
#include "bmmap.h"
#include "bksel.h"
#include "chapterdata.h"

//! FE8U = 0x0800B910
void CopyBgImage(u8 bg1, u8 bg2, u8 c)
{
    CpuFastCopy(
        (void *)(0x6000000 + GetBackgroundTileDataOffset(bg1)),
        (void *)(0x6000000 + GetBackgroundTileDataOffset(bg2)), c * 0x800);
}

//! FE8U = 0x0800B954
void CopyBgTiles(u8 src, u8 dst, u8 nbgs)
{
    u16 * bgs[4] = {
        gBG0TilemapBuffer,
        gBG1TilemapBuffer,
        gBG2TilemapBuffer,
        gBG3TilemapBuffer,
    };

    CpuFastCopy(bgs[src], bgs[dst], nbgs * 0x800);
    BG_EnableSyncByMask(1 << dst);
}

//! FE8U = 0x0800B994
void CopyBgPalette(u8 src, u8 dst, u8 npals)
{
    CpuFastCopy(src * 0x10 + gPaletteBuffer, dst * 0x10 + gPaletteBuffer, npals * 0x20);
    EnablePaletteSync();
}

//! FE8U = 0x0800B9B8
void BgChangeChr(u8 bg, u8 chr_chg)
{
    u16 i;

    u16 * buf = BG_GetMapBuffer(bg);

    for (i = 0; i < 0x400; i++)
    {
        int tmp = *buf;
        u8 a = (tmp >> 0xc);
        a += chr_chg;

        *buf &= 0xfff;
        *buf |= ((a) << 0xc);
        buf++;
    }

    BG_EnableSyncByMask(1 << bg);
}

//! FE8U = 0x0800BA04
void sub_800BA04(u8 a, u8 b)
{
    u16 * palPtr = gPaletteBuffer + a * 0x10;

    u16 * ptr = (void *)gLoadUnitBuffer;
    *ptr++ = a;
    *ptr++ = b;

    CpuFastCopy(palPtr, (u16 *)gLoadUnitBuffer + 2, b * 0x20);
}

//! FE8U = 0x0800BA34
void sub_800BA34(void)
{
    u16 * ptr = (void *)gLoadUnitBuffer;

    int b = *ptr++;
    int c = *ptr++;

    CpuFastCopy(ptr, gPaletteBuffer + b * 0x10, c * 0x20);
    EnablePaletteSync();
    return;
}

//! FE8U = 0x0800BA5C
void SetSomeRealCamPos(int x, int y, s8 unk)
{
    int xOut;
    int yOut;

    if (unk == 1)
    {
        StoreAdjustedCameraPositions(x, y, &xOut, &yOut);
        gBmSt.camera.x = xOut * 16;
        gBmSt.camera.y = yOut * 16;
    }
    else
    {
        gBmSt.camera.x = GetCameraAdjustedX(x * 16);
        gBmSt.camera.y = GetCameraAdjustedY(y * 16);
    }

    return;
}

//! FE8U = 0x0800BAA8
void EventSetFogVisionExt(s16 visionRange, s8 flag, ProcPtr parent)
{
    if (visionRange < 0)
        visionRange = GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel;

    if (flag == 1)
        RenderBmMapOnBg2();

    gPlaySt.chapterVisionRange = visionRange;

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    if (flag == 1)
        MakeNew6CBMXFADE2(1, parent);
}

//! FE8U = 0x0800BAF8
void TriggerMapChanges(u16 id, s8 flag, ProcPtr parent)
{
    if (IsMapChangeEnabled(id))
        return;

    if (flag == 1)
        RenderBmMapOnBg2();

    ApplyMapChangesById(id);
    EnableMapChange(id);

    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();

    if (flag == 1)
        MakeNew6CBMXFADE2(1, parent);
}

//! FE8U = 0x0800BB48
void UntriggerMapChange(u16 id, s8 flag, ProcPtr parent)
{
    if (IsMapChangeEnabled(id) != 1)
        return;

    if (flag == 1)
        RenderBmMapOnBg2();

    RevertMapChange(id);
    DisableMapChange(id);

    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();

    if (flag == 1)
        MakeNew6CBMXFADE2(1, parent);
}

//! FE8U = 0x0800BB98
void ResetBkselPalette(void)
{
    s8 found = Proc_Find(gProcScr_BKSEL) != NULL;

    if (found)
        InitBattleForecastFramePalettes();
}

//! FE8U = 0x0800BBB4
s8 GetAllyUnitCount(u16 pid)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number != pid)
        {
            continue;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x0800BBE4
u16 GetNpcUnitCount(void)
{
    int i;

    u16 count = 0;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        count++;
    }

    return count;
}

//! FE8U = 0x0800BC1C
void HideAllUnits(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        unit->state |= US_HIDDEN;
    }
}

//! FE8U = 0x0800BC50
struct Unit * GetUnitStructFromEventParameter(s16 pid)
{
    if (pid < -3)
        return NULL;

    switch (pid) {
    case CHAR_EVT_SLOT2:
        pid = (u16)gEventSlots[2];
        break;

    case CHAR_EVT_POSITION_AT_SLOTB:
        if (gBmMapUnit[((u16 *)(gEventSlots + 0xB))[1]][((u16 *)(gEventSlots + 0xB))[0]] != 0)
        {
            return GetUnit(gBmMapUnit[((u16 *)(gEventSlots + 0xB))[1]][((u16 *)(gEventSlots + 0xB))[0]]);
        }
        else
        {
            #ifndef NONMATCHING
            asm(""); // :/
            #endif
            return NULL;
        }

    case CHAR_EVT_ACTIVE_UNIT:
        return gActiveUnit;

    case CHAR_EVT_PLAYER_LEADER:
        pid = GetPlayerLeaderUnitId();
        break;
    }

    return GetUnitFromCharId(pid);
}

extern u16 unit_icon_pal_npc[];
extern u16 gPal_MapSpriteSepia[];
extern u16 unit_icon_pal_enemy[];
extern u16 gPal_MapSprite[];

//! FE8U = 0x0800BCDC
void ChangeUnitSpritePalette(u16 packed_pal)
{
    if (IsBattleDeamonActive())
        return;


    SetupMapSpritesPalettes();

    switch (packed_pal & 0xf) {
    case 2:
        ApplyPalette(unit_icon_pal_enemy, 0x1C);
        break;

    case 3:
        ApplyPalette(unit_icon_pal_npc, 0x1C);
        break;

    case 4:
        ApplyPalette(gPal_MapSpriteSepia, 0x1C);
        break;
    }

    switch ((packed_pal >> 4) & 0xf) {
    case 1:
        ApplyPalette(gPal_MapSprite, 0x1D);
        break;

    case 3:
        ApplyPalette(unit_icon_pal_npc, 0x1D);
        break;

    case 4:
        ApplyPalette(gPal_MapSpriteSepia, 0x1D);
        break;
    }

    switch ((packed_pal >> 8) & 0xf) {
    case 1:
        ApplyPalette(gPal_MapSprite, 0x1E);
        break;

    case 2:
        ApplyPalette(unit_icon_pal_enemy, 0x1E);
        break;

    case 4:
        ApplyPalette(gPal_MapSpriteSepia, 0x1E);
        break;
    }
}
