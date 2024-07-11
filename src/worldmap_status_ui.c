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
#include "helpbox.h"
#include "worldmap.h"

void WorldmapStatus_GetCharDescription(struct HelpBoxProc * proc);
void WorldmapStatus_GetClassDescription(struct HelpBoxProc * proc);

// clang-format off

struct HelpBoxInfo CONST_DATA gHelpInfo_WorldmapStatus[] =
{
    {
        .adjUp = NULL,
        .adjDown = &gHelpInfo_WorldmapStatus[1],
        .adjLeft = &gHelpInfo_WorldmapStatus[6],
        .adjRight = NULL,
        .xDisplay = 168,
        .yDisplay = 80,
        .mid = 0x0000,
        .redirect = NULL,
        .populate = WorldmapStatus_GetCharDescription,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[0],
        .adjDown = &gHelpInfo_WorldmapStatus[2],
        .adjLeft = &gHelpInfo_WorldmapStatus[7],
        .adjRight = NULL,
        .xDisplay = 136,
        .yDisplay = 104,
        .mid = 0x06E8, // TODO: msgid "The unit's class. Each class[NL]possesses unique traits."
        .redirect = NULL,
        .populate = WorldmapStatus_GetClassDescription,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[1],
        .adjDown = &gHelpInfo_WorldmapStatus[4],
        .adjLeft = &gHelpInfo_WorldmapStatus[8],
        .adjRight = &gHelpInfo_WorldmapStatus[3],
        .xDisplay = 136,
        .yDisplay = 120,
        .mid = 0x0542, // TODO: msgid "Unit level. The unit becomes[NL]stronger as it gains levels."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[1],
        .adjDown = &gHelpInfo_WorldmapStatus[4],
        .adjLeft = &gHelpInfo_WorldmapStatus[2],
        .adjRight = NULL,
        .xDisplay = 168,
        .yDisplay = 120,
        .mid = 0x0543, // TODO: msgid "Experience points gained. Gain[NL]100 points to earn a new level.[.]"
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[2],
        .adjDown = NULL,
        .adjLeft = &gHelpInfo_WorldmapStatus[8],
        .adjRight = NULL,
        .xDisplay = 136,
        .yDisplay = 136,
        .mid = 0x0544, // TODO: msgid "Unit hit points. The unit loses[.][NL]consciousness if this reaches 0."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = NULL,
        .adjDown = &gHelpInfo_WorldmapStatus[6],
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[0],
        .xDisplay = 32,
        .yDisplay = 48,
        .mid = 0x0676, // TODO: msgid "The party's next destination.[.]"
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[5],
        .adjDown = &gHelpInfo_WorldmapStatus[7],
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[0],
        .xDisplay = 16,
        .yDisplay = 72,
        .mid = 0x0677, // TODO: msgid "The current number of units."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[6],
        .adjDown = &gHelpInfo_WorldmapStatus[8],
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[1],
        .xDisplay = 16,
        .yDisplay = 88,
        .mid = 0x06F3, // TODO: msgid "Money on hand."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[7],
        .adjDown = NULL,
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[4],
        .xDisplay = 24,
        .yDisplay = 120,
        .mid = 0x06F0, // TODO: msgid "Total time played."
        .redirect = NULL,
        .populate = NULL,
    },
};

// clang-format on

//! FE8U = 0x080C09EC
void StartWorldmapStatusHelpBox(ProcPtr proc)
{
    LoadHelpBoxGfx((void *)0x06013000, 9);
    StartMovingHelpBox(gHelpInfo_WorldmapStatus, proc);
    return;
}

struct WorldmapStatusProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ struct Text text[2];
};

extern struct ProcCmd gProcScr_WorldmapStatusUi[];

//! FE8U = 0x080C0A10
void WorldmapStatus_GetCharDescription(struct HelpBoxProc * proc)
{
    struct WorldmapStatusProc * statusProc = Proc_Find(gProcScr_WorldmapStatusUi);

    if (statusProc->unit->pCharacterData->descTextId)
    {
        proc->mid = statusProc->unit->pCharacterData->descTextId;
    }
    else
    {
        proc->mid = 0x06BE; // TODO: msgid "There are no messages for[.][NL]this menu item.[.]"
    }

    return;
}

//! FE8U = 0x080C0A44
void WorldmapStatus_GetClassDescription(struct HelpBoxProc * proc)
{
    struct WorldmapStatusProc * statusProc = Proc_Find(gProcScr_WorldmapStatusUi);
    proc->mid = statusProc->unit->pClassData->descTextId;
    return;
}

//! FE8U = 0x080C0A64
int WorldmapStatus_CountAllies(void)
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
void PutWorldmapStatusDetails(struct WorldmapStatusProc * proc)
{
    const char * charName;
    const char * nodeName;
    int x;

    charName = GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(64, charName);
    BattleGenerateUiStats(proc->unit, GetUnitEquippedWeaponSlot(proc->unit));
    PutDrawText(&proc->text[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 10), TEXT_COLOR_SYSTEM_WHITE, x, 0, charName);

    PutDrawText(
        NULL, TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 13), TEXT_COLOR_SYSTEM_WHITE, 0, 7,
        GetStringFromIndex(proc->unit->pClassData->nameTextId));

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 21, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_35);

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 21, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_SLASH);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 15), TEXT_COLOR_SYSTEM_BLUE, proc->unit->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 23, 15), TEXT_COLOR_SYSTEM_BLUE, proc->unit->exp);

    if (GetUnitCurrentHp(proc->unit) >= 100)
    {
        PutTwoSpecialChar(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumberOrBlank(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 17), TEXT_COLOR_SYSTEM_BLUE, GetUnitCurrentHp(proc->unit));
    }

    if (GetUnitMaxHp(proc->unit) >= 100)
    {
        PutTwoSpecialChar(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 22, 17), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 23, 17), TEXT_COLOR_SYSTEM_BLUE, GetUnitMaxHp(proc->unit));
    }

    nodeName = GetWorldMapNodeName(GetNextUnclearedNode(&gGMData));
    x = GetStringTextCenteredPos(72, nodeName);
    Text_Skip(&proc->text[1], 5);

    PutDrawText(&proc->text[1], TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 6), TEXT_COLOR_SYSTEM_WHITE, x, 0, nodeName);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 9), TEXT_COLOR_SYSTEM_BLUE, WorldmapStatus_CountAllies());

    return;
}

//! FE8U = 0x080C0C28
void WorldmapStatus_InitText(struct WorldmapStatusProc * proc)
{
    InitText(&proc->text[0], 8);
    InitText(&proc->text[1], 9);
    return;
}

//! FE8U = 0x080C0C44
void WorldmapStatus_InitDetails(struct WorldmapStatusProc * proc)
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

    proc->unit = unit;

    fid = GetUnitPortraitId(unit);
    if (proc->unit->state & US_BIT23)
    {
        fid = fid + 1;
    }

    ResetText();
    ResetIconGraphics_();

    WorldmapStatus_InitText(proc);

    PutFace80x72(proc, TILEMAP_LOCATED(gBG2TilemapBuffer, 18, 1), fid, 0x200, 0xd);

    if (GetPortraitData(fid)->img)
    {
        ApplyPalette(gUnknown_08A01EE4, 2);
    }
    else
    {
        ApplyPalette(gUnknown_08A01F04, 2);
    }

    EndAllMus();
    proc->muProc = StartUiMu(proc->unit, 216, 135);

    PutWorldmapStatusDetails(proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

// clang-format off

u16 CONST_DATA gBgConfig_WorldmapStatus[] =
{
    0x0000, 0x6000, 0x0000,
    0x0000, 0x6800, 0x0000,
    0x0000, 0x7000, 0x0000,
    0x8000, 0x7800, 0x0000,
};

// clang-format on

//! FE8U = 0x080C0CF4
void WorldmapStatus_InitGfx(void)
{
    SetupBackgrounds(gBgConfig_WorldmapStatus);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ReadGameSaveCoreGfx();
    ApplyUnitSpritePalettes();
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
void WorldmapStatus_Init(void)
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
void WorldmapStatus_OnEnd(void)
{
    EndMuralBackground();
    return;
}

//! FE8U = 0x080C0E58
void WorldmapStatus_80C0E58(void)
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
void WorldmapStatus_PutTimeAndGold(void)
{
    PutTime(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 15), TEXT_COLOR_SYSTEM_BLUE, GetGameClock(), FALSE);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 11), TEXT_COLOR_SYSTEM_BLUE, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 11), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_WmStatus_PutTimeAndGold[] =
{
    PROC_MARK(PROC_MARK_8),
    PROC_REPEAT(WorldmapStatus_PutTimeAndGold),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C0F00
void WorldmapStatus_Loop_KeyHandler(ProcPtr proc)
{
    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        StartWorldmapStatusHelpBox(proc);
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
void WorldmapStatus_80C0FA4(void)
{
    SetInterrupt_LCDVCountMatch(NULL);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_WorldmapStatusUi[] =
{
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(WorldmapStatus_OnEnd),

    PROC_CALL(WorldmapStatus_Init),

    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),
    PROC_SLEEP(1),

    PROC_CALL(WorldmapStatus_InitGfx),
    PROC_CALL(StartGreenText),

    PROC_CALL(WorldmapStatus_InitDetails),
    PROC_CALL(WorldmapStatus_80C0E58),

    PROC_START_CHILD(gProcScr_WmStatus_PutTimeAndGold),

    PROC_REPEAT(WorldmapStatus_Loop_KeyHandler),

    PROC_CALL(WorldmapStatus_80C0FA4),

    PROC_CALL(EndAllMus),

    PROC_CALL(BMapDispResume),
    PROC_CALL(UnlockGame),

    PROC_END,
};

// clang-format on
