#include "global.h"

#include "constants/items.h"

#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"

#include "bmitem.h"
#include "bmunit.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"

enum { ITEMS_PER_COLUMN = UNIT_ITEM_COUNT };
enum { UNIT_NAME_PANEL_TILE_WIDTH = 6 };
enum { ITEM_NAME_TILE_WIDTH = 7 };

enum
{
    TRADEMENU_UNIT_UNDEFINED = 0xFF,

    TRADEMENU_UNIT_LEFT  = 0,
    TRADEMENU_UNIT_RIGHT = 1,
};

struct TradeMenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];

    /* 34 */ s8 hasItem[2][ITEMS_PER_COLUMN + 1];

    /* 40 */ s8 hasTraded;

    /* 41 */ u8 hoverColumn;
    /* 42 */ u8 hoverLine;

    /* 43 */ u8 selectedColumn;
    /* 44 */ u8 selectedLine;

    /* 45 */ s8 unk45;

    /* 46 */ u8 unk46;
    /* 47 */ u8 unk47;

    /* 48 */ u8 tradeTutorialState;

    /* 49 */ u8 pad[0x4C - 0x49];
    /* 4C */ short timer;
};

s8 sub_802DF08(struct TradeMenuProc* proc);

void sub_802E168(struct TradeMenuProc* proc);
void sub_802E1A8(struct TradeMenuProc* proc);
void sub_802E188(struct TradeMenuProc* proc);
void sub_802E0C0(void);

extern struct TextHandle gUnknown_0200278C[2][ITEMS_PER_COLUMN];

EWRAM_DATA static struct TradeMenuProc* sTradeMenuProc = NULL;

extern const struct Vec2 gUnknown_0859BADC[2][ITEMS_PER_COLUMN];

extern const struct ProcCmd gUnknown_0859BBD4[];
extern const struct ProcCmd gUnknown_0859BB1C[];
extern const struct ProcCmd gUnknown_0859BBF4[];
extern const struct ProcCmd gUnknown_0859BC0C[];
extern const struct ProcCmd gUnknown_0859BC24[];
extern const struct ProcCmd gUnknown_0859BC3C[];

extern const u16 gUnknown_0859BC64[];
extern const u16 gUnknown_0859BCA8[];
extern const u16 gUnknown_0859BCF4[];
extern const u16 gUnknown_0859BD40[];

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

void sub_802D3B8(struct TradeMenuProc* proc)
{
    proc->hoverColumn = TRADEMENU_UNIT_UNDEFINED;
}

void sub_802D3C0(struct TradeMenuProc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverLine == tradeMenu->hoverLine)
        return;

    if (proc->hoverColumn != TRADEMENU_UNIT_UNDEFINED)
    {
        sub_804E90C(
            gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].x,
            gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].y,
            12);
    }

    sub_804E8A8(
        gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverLine = tradeMenu->hoverLine;
}

int sub_802D438(struct TradeMenuProc* proc, int col, int row)
{
    while (proc->hasItem[col][row] == 0 && row >= 0)
        row--;

    return row;
}

void sub_802D474(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < ITEMS_PER_COLUMN; ++row)
        {
            Text_Allocate(&gUnknown_0200278C[col][row], ITEM_NAME_TILE_WIDTH);
        }
    }
}

void sub_802D4A8(struct TradeMenuProc* proc)
{
    u8 xLookup[] = {  1, 15 };
    u8 yLookup[] = {  8,  8 };

    int col, row;

    CpuFastFill(0, gBG0TilemapBuffer + 0x120, 0x2C0);

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < ITEMS_PER_COLUMN; ++row)
        {
            int item = proc->units[col]->items[row];

            Text_Clear(&gUnknown_0200278C[col][row]);

            if (item)
            {
                DrawItemMenuLine(&gUnknown_0200278C[col][row], item, IsItemDisplayUsable(proc->units[col], item),
                    ((yLookup[col] + row * 2 + 1)) * 0x20 + (1 + xLookup[col]) + gBG0TilemapBuffer);
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

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && proc->hoverColumn == TRADEMENU_UNIT_RIGHT)
    {
        newSelectedRow = sub_802D438(proc, TRADEMENU_UNIT_LEFT, proc->hoverLine);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_LEFT;
        proc->hoverLine = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && proc->hoverColumn == TRADEMENU_UNIT_LEFT)
    {
        newSelectedRow = sub_802D438(proc, TRADEMENU_UNIT_RIGHT, proc->hoverLine);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
        proc->hoverLine = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP))
    {
        if (proc->hoverLine == 0)
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverLine = sub_802D438(proc, proc->hoverColumn, ITEMS_PER_COLUMN - 1) + 1;
        }

        proc->hoverLine--;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->hoverColumn][proc->hoverLine + 1])
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverLine = -1;
        }

        proc->hoverLine++;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

end:
    return changedSelection;
}

void sub_802D72C(struct TradeMenuProc* proc)
{
    u16* pItemA = &proc->units[proc->hoverColumn]->items[proc->hoverLine];
    u16* pItemB = &proc->units[proc->selectedColumn]->items[proc->selectedLine];

    u16 swp = *pItemA;
    *pItemA = *pItemB;
    *pItemB = swp;

    proc->hasTraded = TRUE;

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
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].x,
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].y);
    }
    else
    {
        sub_802D5E8(proc);

        sub_804E79C(
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].x,
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].y);

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

    proc->selectedColumn = proc->hoverColumn;
    proc->selectedLine = proc->hoverLine;

    proc->hoverColumn = proc->hoverColumn ^ 1;

    lastRow = sub_802D438(proc, proc->hoverColumn, (ITEMS_PER_COLUMN - 1));

    if (lastRow != (ITEMS_PER_COLUMN - 1))
    {
        proc->hoverLine = lastRow + 1;
        proc->hasItem[proc->hoverColumn][proc->hoverLine] = TRUE;

        proc->unk45 = TRUE;

        proc->unk46 = proc->hoverColumn;
        proc->unk47 = proc->hoverLine;
    }
}

void sub_802D980(struct TradeMenuProc* proc)
{
    if (sub_802DF08(proc))
    {
        sub_804E79C(
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].x,
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].y);

        sub_804E848(
            8 * gUnknown_0859BADC[proc->selectedColumn][proc->selectedLine].x,
            8 * gUnknown_0859BADC[proc->selectedColumn][proc->selectedLine].y);
    }
    else
    {
        sub_802D5E8(proc);

        sub_804E79C(
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].x,
            8 * gUnknown_0859BADC[proc->hoverColumn][proc->hoverLine].y);

        sub_804E848(
            8 * gUnknown_0859BADC[proc->selectedColumn][proc->selectedLine].x,
            8 * gUnknown_0859BADC[proc->selectedColumn][proc->selectedLine].y);

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
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverLine = proc->selectedLine;

    sub_802D58C(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverLine = sub_802D438(proc, proc->hoverColumn, proc->hoverLine);
}

s8 sub_802DAFC(struct TradeMenuProc* proc)
{
    if (gUnknown_0202BCB0.unk3F < 0)
        return TRUE;

    proc->hoverColumn = gUnknown_0202BCB0.unk3F / ITEMS_PER_COLUMN;
    proc->hoverLine = gUnknown_0202BCB0.unk3F % ITEMS_PER_COLUMN;

    sub_802D58C(proc);
    Proc_GotoLabel((struct Proc*) (proc), 1);

    return FALSE;
}

void sub_802DB48(void)
{
    DeleteFaceByIndex(0);
    DeleteFaceByIndex(1);
}

void sub_802DB5C(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverLine];

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
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y,
        item);

    gKeyStatusPtr->newKeys = gKeyStatusPtr->newKeys &~ (B_BUTTON | R_BUTTON);
}

void sub_802DC04(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    s8 changedSelection = sub_802D5E8(tradeMenu);
    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverLine];

    if (changedSelection)
    {
        sub_8088E60(
            8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
            8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y,
            item);
    }

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_ClearNativeCallback(proc);
    }

    sub_804E79C(
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);

    if (tradeMenu->unk45)
    {
        sub_804E848(
            8 * gUnknown_0859BADC[tradeMenu->selectedColumn][tradeMenu->selectedLine].x,
            8 * gUnknown_0859BADC[tradeMenu->selectedColumn][tradeMenu->selectedLine].y);
    }
}

void sub_802DCD8(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    if (tradeMenu->unk45)
    {
        tradeMenu->hasItem[tradeMenu->unk46][tradeMenu->unk47] = TRUE;
    }

    sub_8089018();

    sub_804E79C(
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);

    if (tradeMenu->unk45)
    {
        sub_804E848(
            8 * gUnknown_0859BADC[tradeMenu->selectedColumn][tradeMenu->selectedLine].x,
            8 * gUnknown_0859BADC[tradeMenu->selectedColumn][tradeMenu->selectedLine].y);
    }
}

struct Proc* sub_802DD6C(struct Unit* lUnit, struct Unit* rUnit, int unused)
{
    int itemCount;

    struct TradeMenuProc* proc = (struct TradeMenuProc*) Proc_Create(gUnknown_0859BB1C, ROOT_PROC_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = TRADEMENU_UNIT_LEFT;
    proc->hoverLine = 0;

    proc->tradeTutorialState = 0;

    sTradeMenuProc = proc;

    if (sub_80837F8())
    {
        SetKeyStatus_IgnoreMask(A_BUTTON | START_BUTTON | DPAD_DOWN | DPAD_UP);
        proc->tradeTutorialState = 1;
    }

    if (GetUnitItemCount(lUnit) == 0)
    {
        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
    }
}

void sub_802DDD0(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    sub_804E848(
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);
}

void sub_802DE08(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    sub_804E848(
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * gUnknown_0859BADC[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);

    sub_804E848(
        8 * gUnknown_0859BADC[tradeMenu->selectedColumn][tradeMenu->selectedLine].x,
        8 * gUnknown_0859BADC[tradeMenu->selectedColumn][tradeMenu->selectedLine].y);
}

void sub_802DE6C(void)
{
    Proc_Create(gUnknown_0859BBF4, ROOT_PROC_3);
}

void sub_802DE80(void)
{
    Proc_Create(gUnknown_0859BC0C, ROOT_PROC_3);
}

void sub_802DE94(void)
{
    Proc_DeleteAllWithScript(gUnknown_0859BBF4);
}

void sub_802DEA4(void)
{
    Proc_DeleteAllWithScript(gUnknown_0859BC0C);
}

void sub_802DEB4(struct TradeMenuProc* proc)
{
    proc->timer = 20;
}

void sub_802DEBC(struct TradeMenuProc* proc)
{
    proc->timer--;

    if (proc->timer < 0)
        Proc_ClearNativeCallback((struct Proc*) (proc));
}

void sub_802DEDC(struct Proc* ee)
{
    if (sTradeMenuProc->tradeTutorialState != 3 && sTradeMenuProc->tradeTutorialState != 5 && sTradeMenuProc->tradeTutorialState != 8)
    {
        Proc_CreateBlockingChild(gUnknown_0859BC24, ee);
    }
}

s8 sub_802DF08(struct TradeMenuProc* proc)
{
    if (proc->tradeTutorialState != 4 && (gKeyStatusPtr->newKeys == 0))
        return FALSE;

    switch (sTradeMenuProc->tradeTutorialState)
    {

    case 2:
        if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
        {
            SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
            sub_802E168(proc);

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        Proc_GotoLabel((struct Proc*) (proc), 0x65);

        return TRUE;

    case 3:
        if (!(gKeyStatusPtr->newKeys & (B_BUTTON | DPAD_LEFT | R_BUTTON)))
        {
            if (!(gKeyStatusPtr->newKeys & A_BUTTON))
                return FALSE;

            if (!(gKeyStatusPtr->newKeys & (DPAD_UP | DPAD_DOWN)))
            {
                if (GetItemIndex(proc->units[proc->hoverColumn]->items[proc->hoverLine]) == ITEM_VULNERARY)
                {
                    SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
                    sub_802E0C0();

                    return FALSE;
                }
            }
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        sub_802E168(proc);

        return TRUE;

    case 5:
        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            sub_802E1A8(proc);

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        sub_802E188(proc);

        return TRUE;

    case 4:
        sub_802E188(proc);

        return TRUE;

    case 8:
        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            SetKeyStatus_IgnoreMask(0);
            UnsetEventId(0x87); // TODO: EID/FLAG DEFINTIONS

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        sub_802E1A8(proc);

        return TRUE;

    default:
        return FALSE;

    } // switch (sTradeMenuProc->tradeTutorialState)
}

void sub_802E0A0(void)
{
    sTradeMenuProc->tradeTutorialState = 2;
}

void sub_802E0B0(void)
{
    sTradeMenuProc->tradeTutorialState = 3;
}

void sub_802E0C0(void)
{
    sTradeMenuProc->tradeTutorialState = 4;
}

void sub_802E0D0(void)
{
    sTradeMenuProc->tradeTutorialState = 5;
}

void sub_802E0E0(void)
{
    sTradeMenuProc->tradeTutorialState = 6;
}

void sub_802E0F0(void)
{
    sTradeMenuProc->tradeTutorialState = 7;
}

void sub_802E100(void)
{
    sTradeMenuProc->tradeTutorialState = 8;
}

s8 sub_802E110(void)
{
    if (!gKeyStatusPtr->heldKeys)
        return FALSE;

    return TRUE;
}

void sub_802E12C(struct TradeMenuProc* proc)
{
    Proc_CreateBlockingChild(gUnknown_0859BC3C, (struct Proc*) (proc));
}

void sub_802E140(struct TradeMenuProc* proc)
{
    if (proc->tradeTutorialState)
    {
        CallEvent(gUnknown_0859BC64, EV_EXEC_QUIET);

        sub_802E12C(proc);
        sub_802DE6C();
    }
}

void sub_802E168(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BCA8, EV_EXEC_QUIET);

    sub_802E12C(proc);
    sub_802DE6C();
}

void sub_802E188(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BCF4, EV_EXEC_QUIET);

    sub_802E12C(proc);
    sub_802DE80();
}

void sub_802E1A8(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BD40, EV_EXEC_QUIET);

    sub_802E12C(proc);
    sub_802DE6C();
}
