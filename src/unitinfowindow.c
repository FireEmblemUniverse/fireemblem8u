#include "global.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmitem.h"

#include "unitinfowindow.h"

#include "constants/classes.h"

enum { LINES_MAX = 5 };

struct UnitInfoWindowProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* unit;

    /* 30 */ struct TextHandle name;
    /* 38 */ struct TextHandle lines[LINES_MAX];

    /* 60 */ u8 x;
    /* 61 */ u8 y;
    /* 62 */ u8 xUnitSprite;
    /* 63 */ u8 xNameText;
};

extern u8 gUnknown_08A173EC[];

void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc* proc);

struct ProcCmd CONST_DATA gProcScr_UnitInfoWindow[] = {
    PROC_REPEAT(UnitInfoWindow_OnLoop),
    PROC_END,
};

struct UnitInfoWindowProc* EWRAM_DATA sRescueUnitInfoWindows[2] = {};

//! FE8U = 0x0803471C
void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc* proc) {
    const u16 factionPalLut[] = {
        0xC,
        0xE,
        0xD,
    };

    int x = proc->x * 8 + proc->xUnitSprite;
    int y = (proc->y + 1) * 8;

    if (proc->unit->state & US_RESCUED) {
        if ((GetGameClock() % 32) < 20) {
            PutSprite(
                2,
                x + 9,
                y + 7,
                gObject_8x8,
                (factionPalLut[proc->unit->rescueOtherUnit >> 6] & 0xf) * 0x1000 + 3
            );
        }
    } else {
        sub_8027E4C(2, x, y, 0, proc->unit);
    }

    return;
}

//! FE8U = 0x080347A8
struct UnitInfoWindowProc* NewUnitInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = Proc_Start(gProcScr_UnitInfoWindow, parent);

    Text_Allocate(&proc->name, 6);

    ResetIconGraphics();
    LoadIconPalettes(4);

    return proc;
}

//! FE8U = 0x080347D4
void UnitInfoWindow_PositionUnitName(struct UnitInfoWindowProc* proc) {
    if (GetStringTextWidth(GetStringFromIndex(proc->unit->pCharacterData->nameTextId)) < 40) {
        proc->xUnitSprite = 4;
        proc->xNameText = 24;
    } else {
        proc->xUnitSprite = 0;
        proc->xNameText = 16;
    }

    if (proc->unit->pClassData->number == CLASS_DEMON_KING) {
        proc->xNameText += 6;
    } else if (proc->unit->pClassData->number == CLASS_MANAKETE_2) {
        proc->xUnitSprite -= 3;
        proc->xNameText += 3;
    }

    proc->xUnitSprite += 8;
    proc->xNameText -= 16;

    return;
}

const u16 gUnknown_080D7F92[] = {
    0x1003,
    0x1003,
    0x1004,
    0x1005,
    0x100E,
    0x100E,
    0x1050,
    0x1051,
    0x100E,
    0x1050,
    0x1052,
    0x1053,
    0x0000,
};

#if NONMATCHING

/* https://decomp.me/scratch/rXjv1 */

//! FE8U = 0x0803483C
struct UnitInfoWindowProc* UnitInfoWindow_DrawBase(struct UnitInfoWindowProc* proc, struct Unit* unit, int x, int y, int width, int lines) {

    if (proc == 0) {
        proc = Proc_Find(gProcScr_UnitInfoWindow);
        ClearBg0Bg1();
    }

    proc->unit = unit;
    proc->x = x;
    proc->y = y;

    DrawUiFrame2(x, y + 2, width, 2 + lines * 2, 3);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y), gUnknown_08A173EC, 0x1000);

    if (width > 10) {
        int ix;
        u16* ptr;

        for (ix = x + 8, ptr = gUnknown_080D7F92; ix < x + width - 1; ix++) {

            if (ix >= x + width - 3) {
                ptr++;
            }

            gBG1TilemapBuffer[TILEMAP_INDEX(ix, y+0)] = *ptr;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix, y+1)] = *(ptr+4);
            gBG1TilemapBuffer[TILEMAP_INDEX(ix, y+2)] = *(ptr+8);
        }

        gBG1TilemapBuffer[TILEMAP_INDEX(x+7, y+0)] = gUnknown_080D7F92[0];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+7, y+1)] = gUnknown_080D7F92[4];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+7, y+2)] = gUnknown_080D7F92[8];

        gBG1TilemapBuffer[TILEMAP_INDEX(x+width-1, y+0)] = gUnknown_080D7F92[3];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+width-1, y+1)] = gUnknown_080D7F92[7];
        gBG1TilemapBuffer[TILEMAP_INDEX(x+width-1, y+2)] = gUnknown_080D7F92[11];
    }

    Text_Clear(&proc->name);

    UnitInfoWindow_PositionUnitName(proc);

    Text_SetXCursor(&proc->name, proc->xNameText);
    Text_AppendString(&proc->name, GetStringFromIndex(unit->pCharacterData->nameTextId));

    Text_Draw(&proc->name, gBG0TilemapBuffer + TILEMAP_INDEX(x+3, y+1));

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return proc;
}

#else // if !NONMATCHING

__attribute__((naked))
struct UnitInfoWindowProc* UnitInfoWindow_DrawBase(struct UnitInfoWindowProc* proc, struct Unit* unit, int x, int y, int width, int lines) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x20\n\
        mov r8, r0\n\
        str r1, [sp, #4]\n\
        adds r7, r2, #0\n\
        mov r9, r3\n\
        ldr r6, [sp, #0x40]\n\
        cmp r0, #0\n\
        bne _08034862\n\
        ldr r0, _080349C0  @ gProcScr_UnitInfoWindow\n\
        bl Proc_Find\n\
        mov r8, r0\n\
        bl ClearBg0Bg1\n\
    _08034862:\n\
        ldr r0, [sp, #4]\n\
        mov r1, r8\n\
        str r0, [r1, #0x2c]\n\
        mov r0, r8\n\
        adds r0, #0x60\n\
        strb r7, [r0]\n\
        adds r0, #1\n\
        mov r2, r9\n\
        strb r2, [r0]\n\
        mov r5, r9\n\
        adds r5, #2\n\
        ldr r3, [sp, #0x44]\n\
        lsls r3, r3, #1\n\
        adds r3, #2\n\
        movs r0, #3\n\
        str r0, [sp]\n\
        adds r0, r7, #0\n\
        adds r1, r5, #0\n\
        adds r2, r6, #0\n\
        bl DrawUiFrame2\n\
        mov r3, r9\n\
        lsls r4, r3, #5\n\
        adds r0, r4, r7\n\
        lsls r0, r0, #1\n\
        ldr r1, _080349C4  @ gBG1TilemapBuffer\n\
        mov sl, r1\n\
        add r0, sl\n\
        ldr r1, _080349C8  @ gUnknown_08A173EC\n\
        movs r2, #0x80\n\
        lsls r2, r2, #5\n\
        bl CallARM_FillTileRect\n\
        str r5, [sp, #0x14]\n\
        str r4, [sp, #24]\n\
        mov r2, r9\n\
        adds r2, #1\n\
        str r2, [sp, #0x10]\n\
        mov r3, r8\n\
        adds r3, #0x30\n\
        str r3, [sp, #0xc]\n\
        mov r4, r8\n\
        adds r4, #0x63\n\
        str r4, [sp, #0x1c]\n\
        cmp r6, #0xa\n\
        ble _0803496C\n\
        adds r2, r7, #0\n\
        adds r2, #8\n\
        adds r0, r7, r6\n\
        subs r1, r0, #1\n\
        mov r6, sl\n\
        mov sl, r0\n\
        cmp r2, r1\n\
        bge _08034914\n\
        str r1, [sp, #8]\n\
        lsls r1, r2, #1\n\
        lsls r0, r5, #6\n\
        adds r0, r0, r6\n\
        adds r5, r1, r0\n\
        ldr r3, [sp, #0x10]\n\
        lsls r0, r3, #6\n\
        adds r0, r0, r6\n\
        adds r4, r1, r0\n\
        ldr r3, _080349CC  @ gUnknown_080D7F92\n\
        movs r0, #3\n\
        negs r0, r0\n\
        add r0, sl\n\
        mov ip, r0\n\
        mov r0, r9\n\
        lsls r0, r0, #6\n\
        mov r9, r0\n\
        add r9, r6\n\
        add r1, r9\n\
    _080348F4:\n\
        cmp r2, ip\n\
        blt _080348FA\n\
        adds r3, #2\n\
    _080348FA:\n\
        ldrh r0, [r3]\n\
        strh r0, [r1]\n\
        ldrh r0, [r3, #8]\n\
        strh r0, [r4]\n\
        ldrh r0, [r3, #0x10]\n\
        strh r0, [r5]\n\
        adds r5, #2\n\
        adds r4, #2\n\
        adds r1, #2\n\
        adds r2, #1\n\
        ldr r0, [sp, #8]\n\
        cmp r2, r0\n\
        blt _080348F4\n\
    _08034914:\n\
        ldr r0, [sp, #24]\n\
        adds r0, #7\n\
        adds r0, r0, r7\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r6\n\
        ldr r2, _080349CC  @ gUnknown_080D7F92\n\
        ldrh r1, [r2]\n\
        strh r1, [r0]\n\
        ldr r4, [sp, #0x10]\n\
        lsls r3, r4, #5\n\
        adds r0, r3, #7\n\
        adds r0, r0, r7\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r6\n\
        ldrh r1, [r2, #8]\n\
        strh r1, [r0]\n\
        ldr r0, [sp, #0x14]\n\
        lsls r2, r0, #5\n\
        adds r0, r2, #7\n\
        adds r0, r0, r7\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r6\n\
        ldr r4, _080349CC  @ gUnknown_080D7F92\n\
        ldrh r1, [r4, #0x10]\n\
        strh r1, [r0]\n\
        ldr r0, [sp, #24]\n\
        subs r0, #1\n\
        add r0, sl\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r6\n\
        ldrh r1, [r4, #6]\n\
        strh r1, [r0]\n\
        subs r3, #1\n\
        add r3, sl\n\
        lsls r3, r3, #1\n\
        adds r3, r3, r6\n\
        ldrh r0, [r4, #0xe]\n\
        strh r0, [r3]\n\
        subs r2, #1\n\
        add r2, sl\n\
        lsls r2, r2, #1\n\
        adds r2, r2, r6\n\
        ldrh r0, [r4, #0x16]\n\
        strh r0, [r2]\n\
    _0803496C:\n\
        ldr r0, [sp, #0xc]\n\
        bl Text_Clear\n\
        mov r0, r8\n\
        bl UnitInfoWindow_PositionUnitName\n\
        ldr r0, [sp, #0x1c]\n\
        ldrb r1, [r0]\n\
        ldr r0, [sp, #0xc]\n\
        bl Text_SetXCursor\n\
        ldr r1, [sp, #4]\n\
        ldr r0, [r1]\n\
        ldrh r0, [r0]\n\
        bl GetStringFromIndex\n\
        adds r1, r0, #0\n\
        ldr r0, [sp, #0xc]\n\
        bl Text_AppendString\n\
        ldr r2, [sp, #0x10]\n\
        lsls r1, r2, #5\n\
        adds r1, #3\n\
        adds r1, r1, r7\n\
        lsls r1, r1, #1\n\
        ldr r0, _080349D0  @ gBG0TilemapBuffer\n\
        adds r1, r1, r0\n\
        ldr r0, [sp, #0xc]\n\
        bl Text_Draw\n\
        movs r0, #3\n\
        bl BG_EnableSyncByMask\n\
        mov r0, r8\n\
        add sp, #0x20\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080349C0: .4byte gProcScr_UnitInfoWindow\n\
    _080349C4: .4byte gBG1TilemapBuffer\n\
    _080349C8: .4byte gUnknown_08A173EC\n\
    _080349CC: .4byte gUnknown_080D7F92\n\
    _080349D0: .4byte gBG0TilemapBuffer\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x080349D4
int GetUnitInfoWindowX(struct Unit* unit, int width) {

    if (unit->xPos * 16 - gGameState.camera.x < DISPLAY_WIDTH / 2) {
        return 30 - width;
    }

    return 0;
}

//! FE8U = 0x080349FC
void DrawUnitHpText(struct TextHandle* text, struct Unit* unit) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4E9)); // TODO: msgid "HP"
    Text_InsertString(text, 40, 3, GetStringFromIndex(0x539)); // TODO: msgid "/[.]"

    Text_InsertNumberOr2Dashes(text, 32, 2, GetUnitCurrentHp(unit));
    Text_InsertNumberOr2Dashes(text, 56, 2, GetUnitMaxHp(unit));

    return;
}

//! FE8U = 0x08034A5C
void DrawUnitConText(struct TextHandle* text, struct Unit* unit) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4F7)); // TODO: msgid "Con[.]"
    Text_InsertNumberOr2Dashes(text, 56, 2, UNIT_CON(unit));

    return;
}

//! FE8U = 0x08034AA4
void DrawUnitAidText(struct TextHandle* text, struct Unit* unit) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4f8)); // TODO: msgid "Aid[.]"
    Text_InsertNumberOr2Dashes(text, 56, 2, GetUnitAid(unit));

    return;
}

//! FE8U = 0x08034ADC
void PutUnitAidIconForTextAt(struct Unit* unit, int x, int y) {
    DrawIcon(
        gBG0TilemapBuffer + TILEMAP_INDEX(x + 4, y),
        GetUnitAidIconId(UNIT_CATTRIBUTES(unit)),
        0x5000
    );
    return;
}

//! FE8U = 0x08034B10
void DrawUnitStatusText(struct TextHandle* text, struct Unit* unit) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4FA)); // TODO: msgid "Cond"
    Text_InsertString(text, 24, 2, GetUnitStatusName(unit));

    return;
}

//! FE8U = 0x08034B48
void DrawUnitResChangeText(struct TextHandle* text, struct Unit* unit, int bonus) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4f0)); // TODO: msgid "Res[.]"
    Text_InsertString(text, 40, 3, GetStringFromIndex(0x53A));

    Text_InsertNumberOr2Dashes(text, 56, 2, GetUnitResistance(unit) + bonus);
    Text_InsertNumberOr2Dashes(text, 32, 2, GetUnitResistance(unit));

    return;
}

//! FE8U = 0x08034BAC
void DrawUnitResUnkText(struct TextHandle* text, struct Unit* unit, int unused) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4f0)); // TODO: msgid "Res[.]"
    Text_InsertNumberOr2Dashes(text, 56, 2, GetUnitResistance(unit));

    return;
}

//! FE8U = 0x08034BE4
void DrawAccuracyText(struct TextHandle* text, int accuracy) {
    Text_Clear(text);

    Text_InsertString(text, 0, 3, GetStringFromIndex(0x4F4)); // TODO: msgid "Hit[.]"
    Text_InsertNumberOr2Dashes(text, 56, 2, accuracy);

    return;
}

//! FE8U = 0x08034C18
void StartUnitInventoryInfoWindow(ProcPtr parent) {
    int i;

    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);

    for (i = 0; i < LINES_MAX; i++) {
        Text_Allocate(proc->lines + i, 7);
    }

    return;
}

//! FE8U = 0x08034C3C
void RefreshUnitInventoryInfoWindow(struct Unit* unit) {
    int i;
    int xPos;
    int itemCount;

    struct UnitInfoWindowProc* proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0xd);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0xd, itemCount != 0 ? itemCount : 1);

    if (itemCount == 0) {
        int offset;

        Text_Clear(proc->lines + 0);
        Text_InsertString(proc->lines + 0, 0, 1, GetStringFromIndex(0x5a8)); // TODO: msgid "Nothing[.]"

        offset = TILEMAP_INDEX(xPos+3, 0+3);
        Text_Draw(proc->lines + 0, gBG0TilemapBuffer + offset);

        return;
    }

    for (i = 0; i < itemCount; i++) {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];

        Text_Clear(proc->lines + i);
        Text_AppendString(proc->lines + i, GetItemName(item));

        Text_Draw(proc->lines + i, gBG0TilemapBuffer + TILEMAP_INDEX(xPos+3, yPos));
        DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(xPos+11, yPos), 2, GetItemUses(item));
        DrawIcon(gBG0TilemapBuffer + TILEMAP_INDEX(xPos+1, yPos), GetItemIconId(item), 0x4000);
    }

    return;
}

//! FE8U = 0x08034D48
void RefreshUnitStealInventoryInfoWindow(struct Unit* unit) {
    int i;
    int itemCount;
    int xPos;
    struct UnitInfoWindowProc* proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0xd);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0xd, itemCount);

    for (i = 0; i < itemCount; i++) {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];
        s8 stealable = IsItemStealable(item);

        Text_Clear(proc->lines + i);

        Text_SetColorId(proc->lines + i, stealable ? 0 : 1);
        Text_AppendString(proc->lines + i, GetItemName(item));

        Text_Draw(proc->lines + i, gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 3, yPos));

        DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 11, yPos), stealable ? 2 : 1, GetItemUses(item));
        DrawIcon(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 1, yPos), GetItemIconId(item), 0x4000);
    }

    return;
}

//! FE8U = 0x08034E5C
void RefreshHammerneUnitInfoWindow(struct Unit* unit) {
    int i;
    int color;
    int xPos;
    int itemCount;
    struct UnitInfoWindowProc* proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0x10);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0x10, itemCount);

    for (i = 0; i < itemCount; i++) {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];

        color = IsItemHammernable(item) ? 0 : 1;

        Text_Clear(proc->lines + i);

        Text_SetColorId(proc->lines + i, color);
        Text_AppendString(proc->lines + i, GetItemName(item));

        Text_Draw(proc->lines + i, gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 3, yPos));
        sub_8004B0C(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 12, yPos), color, 0x16);

        color = IsItemHammernable(item) ? 2 : 1;

        DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 11, yPos), color, GetItemUses(item));
        DrawDecNumber(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 14, yPos), color, GetItemMaxUses(item));

        DrawIcon(gBG0TilemapBuffer + TILEMAP_INDEX(xPos + 1, yPos), GetItemIconId(item), 0x4000);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x08034F9C
void StartUnitHpInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);
    Text_Allocate(proc->lines + 0, 8);

    return;
}

//! FE8U = 0x08034FB0
void RefreshUnitHpInfoWindow(struct Unit* unit) {

    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 1);

    DrawUnitHpText(proc->lines + 0, unit);
    Text_Draw(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    return;
}

//! FE8U = 0x08034FFC
void StartUnitHpStatusInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);

    Text_Allocate(proc->lines + 0, 8);
    Text_Allocate(proc->lines + 1, 8);

    return;
}

//! FE8U = 0x0803501C
void RefreshUnitHpStatusInfoWindow(struct Unit* unit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 2);

    DrawUnitHpText(proc->lines + 0, unit);
    Text_Draw(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    DrawUnitStatusText(proc->lines + 1, unit);
    Text_Draw(proc->lines + 1, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 5));

    return;
}

//! FE8U = 0x08035090
void StartUnitResChangeInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);

    Text_Allocate(proc->lines + 0, 8);

    return;
}

//! FE8U = 0x080350A4
void RefreshUnitResChangeInfoWindow(struct Unit* unit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, y, 10, 1);

    DrawUnitResChangeText(proc->lines + 0, unit, 7 - unit->barrierDuration);
    Text_Draw(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    return;
}

//! FE8U = 0x080350FC
void StartUnitStaffOffenseInfoWindow(ProcPtr parent) {
    struct UnitInfoWindowProc* proc = NewUnitInfoWindow(parent);

    Text_Allocate(proc->lines + 0, 8);
    Text_Allocate(proc->lines + 1, 8);

    return;
}

//! FE8U = 0x0803511C
void RefreshUnitStaffOffenseInfoWindow(struct Unit* unit, int hit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc* proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 2);

    DrawUnitResUnkText(proc->lines + 0, unit, 7 - unit->barrierDuration);
    Text_Draw(proc->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    DrawAccuracyText(proc->lines + 1, hit);
    Text_Draw(proc->lines + 1, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 5));

    return;
}

//! FE8U = 0x0803519C
void StartUnitRescueInfoWindowsCore(ProcPtr parent) {

    sRescueUnitInfoWindows[0] = NewUnitInfoWindow(parent);
    Text_Allocate(sRescueUnitInfoWindows[0]->lines + 0, 8);

    sRescueUnitInfoWindows[1] = NewUnitInfoWindow(parent);
    Text_Allocate(sRescueUnitInfoWindows[1]->lines + 0, 8);

    return;
}

//! FE8U = 0x080351CC
void RefreshUnitTakeRescueInfoWindows(ProcPtr parent) {
    ResetIconGraphics_();
    LoadIconPalettes(4);

    StartUnitRescueInfoWindowsCore(parent);

    StartSpriteRefresher(parent, 2, 0, 0, gObject_16x16_VFlipped, 6);

    return;
}

//! FE8U = 0x08035204
void RefreshUnitRescueInfoWindows(struct Unit* unit) {

    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    ClearBg0Bg1();

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], gActiveUnit, x, y, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[0]->lines + 0, gActiveUnit);
    Text_Draw(sRescueUnitInfoWindows[0]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    PutUnitAidIconForTextAt(gActiveUnit, x + 1, y + 3);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], unit, x, y + 6, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[1]->lines + 0, unit);
    Text_Draw(sRescueUnitInfoWindows[1]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 6 + 3));

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}

//! FE8U = 0x080352BC
void RefreshUnitTakeInfoWindows(struct Unit* unit) {
    struct Unit* rescue;

    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    ClearBg0Bg1();

    rescue = GetUnit(unit->rescueOtherUnit);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], gActiveUnit, x, y, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[0]->lines + 0, gActiveUnit);
    Text_Draw(sRescueUnitInfoWindows[0]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    PutUnitAidIconForTextAt(gActiveUnit, x + 1, y + 3);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], rescue, x, y + 6, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[1]->lines + 0, rescue);
    Text_Draw(sRescueUnitInfoWindows[1]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 6 + 3));

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}

//! FE8U = 0x08035380
void StartUnitGiveInfoWindows(ProcPtr parent) {
    ResetIconGraphics_();
    LoadIconPalettes(4);

    StartUnitRescueInfoWindowsCore(parent);

    StartSpriteRefresher(parent, 2, 0, 0, gObject_16x16, 6);

    return;
}

//! FE8U = 0x080353B8
void RefreshUnitGiveInfoWindows(struct Unit* unit) {
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct Unit* rescue = GetUnit(gActiveUnit->rescueOtherUnit);

    ClearBg0Bg1();

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], rescue, x, y, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[0]->lines + 0, rescue);
    Text_Draw(sRescueUnitInfoWindows[0]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3));

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], unit, x, y + 6, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[1]->lines + 0, unit);
    Text_Draw(sRescueUnitInfoWindows[1]->lines + 0, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 6 + 3));

    PutUnitAidIconForTextAt(unit, x + 1, y + 6 + 3);

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}
