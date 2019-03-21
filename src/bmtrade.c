#include "global.h"

#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"

#include "bmitem.h"
#include "bmunit.h"

#include "m4a.h"
#include "soundwrapper.h"

#include "proc.h"

enum { ITEMS_PER_COLUMN = UNIT_ITEM_COUNT };
enum { UNIT_NAME_PANEL_TILE_WIDTH = 6 };
enum { ITEM_NAME_TILE_WIDTH = 7 };

struct TradeMenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];

    /* 34 */ s8 hasItem[2][ITEMS_PER_COLUMN + 1];
    /* 40 */ s8 unk40;
    /* 41 */ u8 unk41;
    /* 42 */ u8 unk42;
    /* 43 */ u8 unk43;
    /* 44 */ u8 unk44;
    /* 45 */ s8 unk45;
    /* 46 */ u8 unk46;
    /* 47 */ u8 unk47;
};

s8 sub_802DF08(struct TradeMenuProc* proc);

extern struct TextHandle gUnknown_0200278C[2][ITEMS_PER_COLUMN];

extern const struct Vec2 gUnknown_0859BADC[];
extern const struct ProcCmd gUnknown_0859BBD4[];

void sub_802D2E0(struct TradeMenuProc* proc)
{
    char* str;
    int xStart;

    // TODO: constants
    sub_80ADB7C(6, 0x4800, 0x08, 0x800, 0x400, (struct Proc*) (proc));

    sub_80ADBFC(0, -40, -1, 1);
    sub_80ADBFC(1, 184, -1, 0);

    SetSpecialColorEffectsParameters(1, 12, 6, 0);

    // TODO: name functions
    sub_8001ED0(FALSE, FALSE, FALSE, FALSE, FALSE);
    sub_8001F0C(TRUE,  TRUE,  TRUE,  TRUE,  TRUE);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_NAME_PANEL_TILE_WIDTH) - GetStringTextWidth(str)) / 2;

    // TODO: tile location macro
    DrawTextInline(NULL, gBG0TilemapBuffer + 0x00, 0, xStart, UNIT_NAME_PANEL_TILE_WIDTH, str);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_NAME_PANEL_TILE_WIDTH) - GetStringTextWidth(str)) / 2;

    // TODO: tile location macro
    DrawTextInline(NULL, gBG0TilemapBuffer + 0x18, 0, xStart, UNIT_NAME_PANEL_TILE_WIDTH, str);

    // TODO: bg mask definitions
    BG_EnableSyncByMask(1);
}

struct UnkTradeMenuChildProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad[0x41 - 0x29];

    /* 41 */ u8 unk41;
    /* 42 */ u8 unk42;
};

void sub_802D3B8(struct UnkTradeMenuChildProc* proc)
{
    proc->unk41 = 0xFF;
}

void sub_802D3C0(struct UnkTradeMenuChildProc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    if (proc->unk41 == tradeMenu->unk41 && proc->unk42 == tradeMenu->unk42)
        return;

    if (proc->unk41 != 0xFF)
    {
        sub_804E90C(
            gUnknown_0859BADC[proc->unk42 + proc->unk41*5].x,
            gUnknown_0859BADC[proc->unk42 + proc->unk41*5].y,
            12);
    }

    sub_804E8A8(
        gUnknown_0859BADC[tradeMenu->unk42 + tradeMenu->unk41*5].x,
        gUnknown_0859BADC[tradeMenu->unk42 + tradeMenu->unk41*5].y,
        12);

    proc->unk41 = tradeMenu->unk41;
    proc->unk42 = tradeMenu->unk42;
}

int sub_802D438(struct TradeMenuProc* proc, int col, int row)
{
    while (proc->hasItem[col][row] == 0 && row >= 0)
        row--;

    return row;
}

void sub_802D474(struct TradeMenuProc* proc)
{
    int iCol, iRow;

    for (iCol = 0; iCol < 2; ++iCol)
    {
        for (iRow = 0; iRow < ITEMS_PER_COLUMN; ++iRow)
        {
            Text_Allocate(&gUnknown_0200278C[iCol][iRow], ITEM_NAME_TILE_WIDTH);
        }
    }
}

void sub_802D4A8(struct TradeMenuProc* proc)
{
    u8 xLookup[] = {  1, 15 };
    u8 yLookup[] = {  8,  8 };

    int iCol, iRow;

    CpuFastFill(0, gBG0TilemapBuffer + 0x120, 0x2C0);

    for (iCol = 0; iCol < 2; ++iCol)
    {
        for (iRow = 0; iRow < ITEMS_PER_COLUMN; ++iRow)
        {
            int item = proc->units[iCol]->items[iRow];

            Text_Clear(&gUnknown_0200278C[iCol][iRow]);

            if (item)
            {
                DrawItemMenuLine(&gUnknown_0200278C[iCol][iRow], item, IsItemDisplayUsable(proc->units[iCol], item),
                    ((yLookup[iCol] + iRow * 2 + 1)) * 0x20 + (1 + xLookup[iCol]) + gBG0TilemapBuffer);
            }
        }
    }

    BG_EnableSyncByMask(1);
}

void sub_802D58C(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < ITEMS_PER_COLUMN; ++row)
        {
            u16 item = proc->units[col]->items[row];
            proc->hasItem[col][row] = (item ? TRUE : FALSE);
        }
    }

    proc->hasItem[0][ITEMS_PER_COLUMN] = 0;
    proc->hasItem[1][ITEMS_PER_COLUMN] = 0;
}

s8 sub_802D5E8(struct TradeMenuProc* proc)
{
    s8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && proc->unk41 == 1)
    {
        newSelectedRow = sub_802D438(proc, 0, proc->unk42);

        if (newSelectedRow < 0)
            goto end;

        proc->unk41 = 0;
        proc->unk42 = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && proc->unk41 == 0)
    {
        newSelectedRow = sub_802D438(proc, 1, proc->unk42);

        if (newSelectedRow < 0)
            goto end;

        proc->unk41 = 1;
        proc->unk42 = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP))
    {
        if (proc->unk42 == 0)
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->unk42 = sub_802D438(proc, proc->unk41, ITEMS_PER_COLUMN - 1) + 1;
        }

        proc->unk42--;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->unk41][proc->unk42 + 1])
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->unk42 = -1;
        }

        proc->unk42++;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

end:
    return changedSelection;
}

void sub_802D72C(struct TradeMenuProc* proc)
{
    u16* pItemA = &proc->units[proc->unk41]->items[proc->unk42];
    u16* pItemB = &proc->units[proc->unk43]->items[proc->unk44];

    u16 swp = *pItemA;
    *pItemA = *pItemB;
    *pItemB = swp;

    proc->unk40 = TRUE;

    gActionData.unitActionType = UNIT_ACTION_TRADED;

    UnitRemoveInvalidItems(proc->units[0]);
    UnitRemoveInvalidItems(proc->units[1]);

    sub_802D4A8(proc);
}

void sub_802D794(struct TradeMenuProc* proc)
{
    MakeUIWindowTileMap_BG0BG1(1,  8, 14, 12, 0);
    MakeUIWindowTileMap_BG0BG1(15, 8, 14, 12, 0);

    sub_8003D20();

    ResetIconGraphics();
    LoadIconPalettes(4); // TODO: palette id constant

    sub_802D474(proc);
    sub_802D4A8(proc);

    NewFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    NewFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    sub_8006458(0, 5);
    sub_8006458(1, 5);

    BG_EnableSyncByMask(1 | 2); // TODO: bg bits
}

void sub_802D820(struct TradeMenuProc* proc)
{
    sub_802D58C(proc);
    proc->unk45 = FALSE;
}

void sub_802D834(struct TradeMenuProc* proc)
{
    if (sub_802DF08(proc))
    {
        sub_804E79C(
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].x,
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].y);
    }
    else
    {
        sub_802D5E8(proc);

        sub_804E79C(
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].x,
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            Proc_GotoLabel((struct Proc*) (proc), 1);
            PlaySoundEffect(0x6A); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            Proc_GotoLabel((struct Proc*) (proc), 2);
            PlaySoundEffect(0x6B); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_CreateBlockingChild(gUnknown_0859BBD4, (struct Proc*) (proc));
        }
    }
}

void sub_802D918(struct TradeMenuProc* proc)
{
    int lastRow;

    proc->unk43 = proc->unk41;
    proc->unk44 = proc->unk42;

    proc->unk41 = proc->unk41 ^ 1;

    lastRow = sub_802D438(proc, proc->unk41, (ITEMS_PER_COLUMN - 1));

    if (lastRow != (ITEMS_PER_COLUMN - 1))
    {
        proc->unk42 = lastRow + 1;
        proc->hasItem[proc->unk41][proc->unk42] = TRUE;

        proc->unk45 = TRUE;

        proc->unk46 = proc->unk41;
        proc->unk47 = proc->unk42;
    }
}

void sub_802D980(struct TradeMenuProc* proc)
{
    if (sub_802DF08(proc))
    {
        sub_804E79C(
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].x,
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].y);

        sub_804E848(
            8 * gUnknown_0859BADC[proc->unk44 + proc->unk43*5].x,
            8 * gUnknown_0859BADC[proc->unk44 + proc->unk43*5].y);
    }
    else
    {
        sub_802D5E8(proc);

        sub_804E79C(
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].x,
            8 * gUnknown_0859BADC[proc->unk42 + proc->unk41*5].y);

        sub_804E848(
            8 * gUnknown_0859BADC[proc->unk44 + proc->unk43*5].x,
            8 * gUnknown_0859BADC[proc->unk44 + proc->unk43*5].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            sub_802D72C(proc);

            PlaySoundEffect(0x6A); // TODO: SONG ID DEFINITIONS
            Proc_ClearNativeCallback((struct Proc*) (proc));
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            PlaySoundEffect(0x6B); // TODO: SONG ID DEFINITIONS
            Proc_ClearNativeCallback((struct Proc*) (proc));
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_CreateBlockingChild(gUnknown_0859BBD4, (struct Proc*) (proc));
        }
    }
}

void sub_802DAAC(struct TradeMenuProc* proc)
{
    proc->unk41 = proc->unk43;
    proc->unk42 = proc->unk44;

    sub_802D58C(proc);

    if (!proc->hasItem[proc->unk41][0])
        proc->unk41 = proc->unk41 ^ 1;

    proc->unk42 = sub_802D438(proc, proc->unk41, proc->unk42);
}

s8 sub_802DAFC(struct TradeMenuProc* proc)
{
    if (gUnknown_0202BCB0.unk3F < 0)
        return TRUE;

    proc->unk41 = gUnknown_0202BCB0.unk3F / ITEMS_PER_COLUMN;
    proc->unk42 = gUnknown_0202BCB0.unk3F % ITEMS_PER_COLUMN;

    sub_802D58C(proc);
    Proc_GotoLabel((struct Proc*) (proc), 1);

    return FALSE;
}

void sub_802DB48(void)
{
    DeleteFaceByIndex(0);
    DeleteFaceByIndex(1);
}

void LoadDialogueBoxGfx(void* dest, int pal);
void sub_8088E60(int x, int y, int item);

void sub_802DB5C(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    int item = tradeMenu->units[tradeMenu->unk41]->items[tradeMenu->unk42];

    if (!item)
    {
        Proc_Delete(proc);
        return;
    }

    if (tradeMenu->unk45)
    {
        tradeMenu->hasItem[tradeMenu->unk46][tradeMenu->unk47] = FALSE;
    }

    LoadDialogueBoxGfx(NULL, -1);

    sub_8088E60(
        8 * gUnknown_0859BADC[tradeMenu->unk42 + tradeMenu->unk41*5].x,
        8 * gUnknown_0859BADC[tradeMenu->unk42 + tradeMenu->unk41*5].y,
        item);

    gKeyStatusPtr->newKeys = gKeyStatusPtr->newKeys &~ (B_BUTTON | R_BUTTON);
}

void sub_802DC04(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    s8 changedSelection = sub_802D5E8(tradeMenu);
    int item = tradeMenu->units[tradeMenu->unk41]->items[tradeMenu->unk42];

    if (changedSelection)
    {
        sub_8088E60(
            8 * gUnknown_0859BADC[tradeMenu->unk41*5 + tradeMenu->unk42].x,
            8 * gUnknown_0859BADC[tradeMenu->unk41*5 + tradeMenu->unk42].y,
            item);
    }

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_ClearNativeCallback(proc);
    }

    sub_804E79C(
        8 * gUnknown_0859BADC[tradeMenu->unk42 + tradeMenu->unk41*5].x,
        8 * gUnknown_0859BADC[tradeMenu->unk42 + tradeMenu->unk41*5].y);

    if (tradeMenu->unk45)
    {
        sub_804E848(
            8 * gUnknown_0859BADC[tradeMenu->unk44 + tradeMenu->unk43*5].x,
            8 * gUnknown_0859BADC[tradeMenu->unk44 + tradeMenu->unk43*5].y);
    }
}
