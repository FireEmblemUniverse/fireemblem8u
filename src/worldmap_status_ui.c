#include "global.h"

#include "fontgrp.h"
#include "statscreen.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "hardware.h"
#include "face.h"
#include "mu.h"
#include "icon.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"

#include "worldmap.h"

void sub_80C0A10(struct HelpBoxProc * proc);
void sub_80C0A44(struct HelpBoxProc * proc);

// clang-format off

struct HelpBoxInfo CONST_DATA gUnknown_08A3E78C[] =
{
    {
        .adjUp = NULL,
        .adjDown = &gUnknown_08A3E78C[1],
        .adjLeft = &gUnknown_08A3E78C[6],
        .adjRight = NULL,
        .xDisplay = 168,
        .yDisplay = 80,
        .mid = 0x0000,
        .redirect = NULL,
        .populate = sub_80C0A10,
    },
    {
        .adjUp = &gUnknown_08A3E78C[0],
        .adjDown = &gUnknown_08A3E78C[2],
        .adjLeft = &gUnknown_08A3E78C[7],
        .adjRight = NULL,
        .xDisplay = 136,
        .yDisplay = 104,
        .mid = 0x06E8,
        .redirect = NULL,
        .populate = sub_80C0A44,
    },
    {
        .adjUp = &gUnknown_08A3E78C[1],
        .adjDown = &gUnknown_08A3E78C[4],
        .adjLeft = &gUnknown_08A3E78C[8],
        .adjRight = &gUnknown_08A3E78C[3],
        .xDisplay = 136,
        .yDisplay = 120,
        .mid = 0x0542,
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gUnknown_08A3E78C[1],
        .adjDown = &gUnknown_08A3E78C[4],
        .adjLeft = &gUnknown_08A3E78C[2],
        .adjRight = NULL,
        .xDisplay = 168,
        .yDisplay = 120,
        .mid = 0x0543,
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gUnknown_08A3E78C[2],
        .adjDown = NULL,
        .adjLeft = &gUnknown_08A3E78C[8],
        .adjRight = NULL,
        .xDisplay = 136,
        .yDisplay = 136,
        .mid = 0x0544,
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = NULL,
        .adjDown = &gUnknown_08A3E78C[6],
        .adjLeft = NULL,
        .adjRight = &gUnknown_08A3E78C[0],
        .xDisplay = 32,
        .yDisplay = 48,
        .mid = 0x0676,
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gUnknown_08A3E78C[5],
        .adjDown = &gUnknown_08A3E78C[7],
        .adjLeft = NULL,
        .adjRight = &gUnknown_08A3E78C[0],
        .xDisplay = 16,
        .yDisplay = 72,
        .mid = 0x0677,
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gUnknown_08A3E78C[6],
        .adjDown = &gUnknown_08A3E78C[8],
        .adjLeft = NULL,
        .adjRight = &gUnknown_08A3E78C[1],
        .xDisplay = 16,
        .yDisplay = 88,
        .mid = 0x06F3,
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gUnknown_08A3E78C[7],
        .adjDown = NULL,
        .adjLeft = NULL,
        .adjRight = &gUnknown_08A3E78C[4],
        .xDisplay = 24,
        .yDisplay = 120,
        .mid = 0x06F0,
        .redirect = NULL,
        .populate = NULL,
    },
};

// clang-format on

//! FE8U = 0x080C09EC
void sub_80C09EC(ProcPtr proc)
{
    LoadHelpBoxGfx((void *)0x06013000, 9);
    StartMovingHelpBox(gUnknown_08A3E78C, proc);
    return;
}

struct ProcA3E8B8
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unk_2c;
    /* 30 */ struct MUProc * unk_30;
    /* 34 */ struct Text unk_34;
    /* 3C */ struct Text unk_3c;
};

extern struct ProcCmd gUnknown_08A3E8B8[];

//! FE8U = 0x080C0A10
void sub_80C0A10(struct HelpBoxProc * proc)
{
    struct ProcA3E8B8 * statusProc = Proc_Find(gUnknown_08A3E8B8);

    if (statusProc->unk_2c->pCharacterData->descTextId != 0)
    {
        proc->mid = statusProc->unk_2c->pCharacterData->descTextId;
    }
    else
    {
        proc->mid = 0x06BE;
    }

    return;
}

//! FE8U = 0x080C0A44
void sub_80C0A44(struct HelpBoxProc * proc)
{
    struct ProcA3E8B8 * statusProc = Proc_Find(gUnknown_08A3E8B8);
    proc->mid = statusProc->unk_2c->pClassData->descTextId;
    return;
}

//! FE8U = 0x080C0A64
int sub_80C0A64(void)
{
    int i;

    int count = 0;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & (US_DEAD | US_BIT16))
        {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x080C0A9C
void sub_80C0A9C(struct ProcA3E8B8 * proc)
{
    const char * charName;
    const char * nodeName;
    int x;

    charName = GetStringFromIndex(proc->unk_2c->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(64, charName);
    BattleGenerateUiStats(proc->unk_2c, GetUnitEquippedWeaponSlot(proc->unk_2c));
    PutDrawText(&proc->unk_34, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 10), TEXT_COLOR_SYSTEM_WHITE, x, 0, charName);

    PutDrawText(
        NULL, TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 13), TEXT_COLOR_SYSTEM_WHITE, 0, 7,
        GetStringFromIndex(proc->unk_2c->pClassData->nameTextId));

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 21, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_35);

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 21, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_SLASH);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 15), TEXT_COLOR_SYSTEM_BLUE, proc->unk_2c->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 23, 15), TEXT_COLOR_SYSTEM_BLUE, proc->unk_2c->exp);

    if (GetUnitCurrentHp(proc->unk_2c) >= 100)
    {
        PutTwoSpecialChar(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumberOrBlank(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 17), TEXT_COLOR_SYSTEM_BLUE, GetUnitCurrentHp(proc->unk_2c));
    }

    if (GetUnitMaxHp(proc->unk_2c) >= 100)
    {
        PutTwoSpecialChar(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 22, 17), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumberOrBlank(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 23, 17), TEXT_COLOR_SYSTEM_BLUE, GetUnitMaxHp(proc->unk_2c));
    }

    nodeName = GetWorldMapNodeName(sub_80BD014(&gGMData));
    x = GetStringTextCenteredPos(72, nodeName);
    Text_Skip(&proc->unk_3c, 5);

    PutDrawText(&proc->unk_3c, TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 6), TEXT_COLOR_SYSTEM_WHITE, x, 0, nodeName);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 9), TEXT_COLOR_SYSTEM_BLUE, sub_80C0A64());

    return;
}

//! FE8U = 0x080C0C28
void sub_80C0C28(struct ProcA3E8B8 * proc)
{
    InitText(&proc->unk_34, 8);
    InitText(&proc->unk_3c, 9);
    return;
}

//! FE8U = 0x080C0C44
void sub_80C0C44(struct ProcA3E8B8 * proc)
{
    int pid;
    int fid;
    struct Unit * unit;

    if (!(gGMData.units[0].state & 2))
    {
        pid = gGMData.units[0].id;
    }
    else
    {
        pid = 0;
    }

    unit = GetUnitFromCharId(pid);

    proc->unk_2c = unit;

    fid = GetUnitPortraitId(unit);
    if (proc->unk_2c->state & US_BIT23)
    {
        fid = fid + 1;
    }

    ResetText();
    ResetIconGraphics_();

    sub_80C0C28(proc);

    PutFace80x72(proc, TILEMAP_LOCATED(gBG2TilemapBuffer, 18, 1), fid, 0x200, 0xd);

    if (GetPortraitData(fid)->img)
    {
        ApplyPalette(gUnknown_08A01EE4, 2);
    }
    else
    {
        ApplyPalette(gUnknown_08A01F04, 2);
    }

    MU_EndAll();
    proc->unk_30 = MU_CreateForUI(proc->unk_2c, 216, 135);

    sub_80C0A9C(proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

u16 CONST_DATA gUnknown_08A3E888[] =
{
    0x0000, 0x6000, 0x0000,
    0x0000, 0x6800, 0x0000,
    0x0000, 0x7000, 0x0000,
    0x8000, 0x7800, 0x0000,
};

//! FE8U = 0x080C0CF4
void sub_80C0CF4(void)
{
    SetupBackgrounds(gUnknown_08A3E888);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ReadGameSaveCoreGfx();
    SetupMapSpritesPalettes();
    StartMuralBackground(NULL, (void *)0x0600B000, -1);

    Decompress(gUnknown_08A986C0, (void *)0x06003000);
    ApplyPalettes(gUnknown_08A98DCC, 6, 3);

    EnablePaletteSync();

    Decompress(gUnknown_08A98BF8, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 14), gUnknown_08A98CFC, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 3), gUnknown_08A98D58, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), gUnknown_08A98D88, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 11), gUnknown_08A98DA0, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 25, 16), gUnknown_08A98DB8, 0x6180);

    return;
}

//! FE8U = 0x080C0DF0
void sub_80C0DF0(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetBlendDarken(16);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendBackdropA(1);

    PAL_BG_COLOR(0, 0) = 0;
    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C0E4C
void sub_80C0E4C(void)
{
    EndMuralBackground();
    return;
}

//! FE8U = 0x080C0E58
void sub_80C0E58(void)
{
    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendAlpha(13, 3);

    return;
}

//! FE8U = 0x080C0EBC
void sub_80C0EBC(void)
{
    PutTime(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 15), TEXT_COLOR_SYSTEM_BLUE, GetGameClock(), FALSE);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 11), TEXT_COLOR_SYSTEM_BLUE, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 11), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3E8A0[] =
{
    PROC_MARK(PROC_MARK_8),
    PROC_REPEAT(sub_80C0EBC),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C0F00
void sub_80C0F00(ProcPtr proc)
{
    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        sub_80C09EC(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        SetBlendDarken(16);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendBackdropA(1);

        PAL_BG_COLOR(0, 0) = 0;
        EnablePaletteSync();

        Proc_Break(proc);

        PlaySoundEffect(0x6b);
    }

    return;
}

//! FE8U = 0x080C0FA4
void sub_80C0FA4(void)
{
    SetInterrupt_LCDVCountMatch(NULL);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3E8B8[] =
{
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(sub_80C0E4C),

    PROC_CALL(sub_80C0DF0),

    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),
    PROC_SLEEP(1),

    PROC_CALL(sub_80C0CF4),
    PROC_CALL(StartGreenText),

    PROC_CALL(sub_80C0C44),
    PROC_CALL(sub_80C0E58),

    PROC_START_CHILD(gUnknown_08A3E8A0),

    PROC_REPEAT(sub_80C0F00),
    PROC_CALL(sub_80C0FA4),

    PROC_CALL(MU_EndAll),

    PROC_CALL(BMapDispResume),
    PROC_CALL(UnlockGame),

    PROC_END,
};

// clang-format on
