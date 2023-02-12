#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "uiutils.h"
#include "event.h"

extern struct ProcCmd gUnknown_08A394DC[];
extern struct ProcCmd gUnknown_08A3963C[];

extern u8 gUnknown_089A8F94[]; // arena building front image
extern u8 gUnknown_089ABB70[]; // arena building front tsa
extern u16 gUnknown_089AC024[]; // arena building front pal

void sub_80B5C04(int, ProcPtr);
void sub_80B5C48(ProcPtr);

//! FE8U = 0x080B5730
s8 sub_80B5730(void) {
    if (!(gMPlayTable[gSongTable[0x38].ms].info->status & 0x8000FFFF)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080B576C
void sub_80B576C(void) {
    ArenaBegin(gActiveUnit);
    Proc_Start(gUnknown_08A394DC, PROC_TREE_3);
    return;
}

//! FE8U = 0x080B578C
void sub_80B578C(void) {
    Proc_Start(gUnknown_08A3963C, PROC_TREE_3);
    return;
}

//! FE8U = 0x080B57A0
void sub_80B57A0(ProcPtr param_1) {
    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Hide);

    sub_80B52CC();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    sub_800680C(0x200, 2, 0);
    ResetFaces();
    sub_8007938(0x67, 0x20, 8, 3, 1);

    CopyDataWithPossibleUncomp(gUnknown_089AD934, gGenericBuffer);

    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    TileMap_FillRect(gBG1TilemapBuffer + 0x100, 0x1e, 0xc, 0);

    BG_EnableSyncByMask(2);

    StartUiGoldBox(param_1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win0_left = 0x58;
    gLCDControlBuffer.win0_top = 0x48;
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = 0x98;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 8;
    gLCDControlBuffer.win1_right = 0xf0;
    gLCDControlBuffer.win1_bottom = 0x38;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetSpecialColorEffectsParameters(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    CopyDataWithPossibleUncomp(gUnknown_089A8F94, (void*)(GetBackgroundTileDataOffset(3) + 0x6000000));
    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_089ABB70, 0xc000);
    CopyToPaletteBuffer(gUnknown_089AC024, 0x180, 0x80);

    BG_EnableSyncByMask(8);

    return;
}

//! FE8U = 0x080B5970
void sub_80B5970(void) {
    UpdateUnitFromBattle(gArenaState.playerUnit, &gBattleActor);
    MU_Create(gActiveUnit);
    MU_SetDefaultFacing_Auto();
    return;
}

//! FE8U = 0x080B5998
void sub_80B5998(ProcPtr param_1) {
    if (UNIT_ARENA_LEVEL(gArenaState.playerUnit) < 5) {
        sub_80B5C04(0x8d0, param_1);
        // TODO: msgid "Welcome to the arena![.][A]"
    } else {
        sub_80B5C04(0x8D1, param_1);
        // TODO: msgid "Welcome to the arena.[.][A][NL]Oh! It's you again.[.][A][NL2][NL]I've lost a lot of gold[.][NL]thanks to you...[A][NL2][NL]If you want to continue,[A][NL]we're going to have to[NL]do things differently.[A][NL2][NL]I'm going to prepare some[.][NL]more challenging foes.[A]"
    }

    return;
}

//! FE8U = 0x080B59CC
void sub_80B59CC(ProcPtr param_1) {
    sub_8008A18(ArenaGetMatchupGoldValue());
    sub_80B5C04(0x8D2, param_1);
    // TODO: msgid "Would you like to wager[.][NL][G] gold?[Yes]"
    return;
}

//! FE8U = 0x080B59EC
void sub_80B59EC(ProcPtr param_1) {

    if (GetDialoguePromptResult() != 1) {
        sub_80B5C04(0x8D4, param_1);
        // TODO: msgid "What's that? Bah![.][NL]Get outta here![.][A]"
        Proc_Goto(param_1, 2);
    } else {
        if (ArenaGetMatchupGoldValue() > (int)GetPartyGoldAmount()) {
            sub_80B5C04(0x8DA, param_1);
            // TODO: msgid "You don't have the money![.][NL]Try again later.[A]"
            Proc_Goto(param_1, 2);
        }
    }

    return;
}

extern u16 gUnknown_02022E5E[];

//! FE8U = 0x080B5A38
void sub_80B5A38(ProcPtr param_1) {
    SetPartyGoldAmount(GetPartyGoldAmount() - ArenaGetMatchupGoldValue());
    PlaySoundEffect(0xb9);
    DisplayGoldBoxText(gUnknown_02022E5E);
    sub_80B5C48(param_1);

    return;
}

//! FE8U = 0x080B5A7C
void sub_80B5A7C(ProcPtr param_1) {
    sub_80B5C04(0x8D5, param_1);
    // TODO: msgid "Fight 'til you drop, or press[.][NL]the B Button to yield.[A]"
    return;
}

//! FE8U = 0x080B5A90
void sub_80B5A90(ProcPtr param_1) {
    sub_80B5C04(0x8D3, param_1);
    // TODO: msgid "Good luck. Don't get[NL]yourself killed.[A]"
    return;
}

//! FE8U = 0x080B5AA4
void sub_80B5AA4(void) {
    Sound_FadeOutBGM(-1);
    return;
}

//! FE8U = 0x080B5AB4
void sub_80B5AB4(ProcPtr param_1) {

    Proc_SetMark(param_1, PROC_MARK_7);

    ResetDialogueScreen();

    Proc_EndEach(gProcScr_GoldBox);

    gActionData.unitActionType = UNIT_ACTION_ARENA;

    gActiveUnit->state |= US_HAS_MOVED;

    sub_80A44C8(gActiveUnit);
    MU_EndAll();

    gActionData.trapType = 0;

    BattleGenerateArena(gActiveUnit);

    BeginBattleAnimations();

    return;
}

//! FE8U = 0x080B5B00
void sub_80B5B00(ProcPtr proc) {
    sub_8014944(proc);
    return;
}

//! FE8U = 0x080B5B0C
void sub_80B5B0C(ProcPtr proc) {
    sub_80B57A0(proc);
    return;
}

//! FE8U = 0x080B5B18
void sub_80B5B18(ProcPtr param_1) {
    u32 iVar1 = GetPartyGoldAmount();

    switch (ArenaGetResult()) {
        case 1:
            sub_8008A18(ArenaGetMatchupGoldValue() * 2);
            sub_80B5C04(0x8D6, param_1);
            // TODO: msgid "So you won, eh? Here's[NL]your prize. [G] gold.[A]"

            SetPartyGoldAmount(iVar1 = iVar1 + (ArenaGetMatchupGoldValue() * 2));

            break;

        case 2:
            sub_80B5C04(0x8D7, param_1);
            // TODO: msgid "Ahh, you lost? I'd hoped[NL]for better from you.[A]"

            break;

        case 3:
            sub_80B5C04(0x8D9, param_1);
            // TODO: msgid "Looks like no one wins.[.][NL]Here's your money back.[.][A]"
            SetPartyGoldAmount(iVar1 = iVar1 + ArenaGetMatchupGoldValue());

            break;

        case 4:
            // _080B5B88
            sub_80B5C04(0x8D8, param_1);
            // TODO: msgid "What? You yield? Well,[NL]your gold is mine, then![A]"
            break;
    }

    return;
}

//! FE8U = 0x080B5B9C
void sub_80B5B9C(ProcPtr param_1) {

    switch (ArenaGetResult()) {
        case 1:
        case 3:
            DisplayGoldBoxText(gUnknown_02022E5E);
            PlaySoundEffect(0xb9);
            NewBlockingTimer(param_1, 0x3c);

            break;

        case 2:
            return;
    }

    return;
}

//! FE8U = 0x080B5BE4
void sub_80B5BE4(void) {
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Show);
    return;
}

//! FE8U = 0x080B5C04
void sub_80B5C04(int param_1, ProcPtr param_2) {

    sub_8006978();
    sub_8008250();

    sub_800698C(8, 2, GetStringFromIndex(param_1), param_2);
    sub_8006B10(0);

    sub_8006AA8(1);
    sub_8006AA8(2);
    sub_8006AA8(4);

    sub_8007838(1);

    return;
}

extern u16 gUnknown_02022F38[];

//! FE8U = 0x080B5C48
void sub_80B5C48(ProcPtr proc) {

    DrawUiFrame2(7, 9, 0x10, 6, 0);
    SetFont(0);
    Font_LoadForUI();

    MADrawTextMaybe(gUnknown_02022F38, 0, GetStringFromIndex(gMid_Lv));
    sub_8004B88(gUnknown_02022F38 + 4, 2, gArenaState.opponentUnit->level);
    MADrawTextMaybe(gUnknown_02022F38 + 0x40, 0, GetStringFromIndex(gArenaState.opponentUnit->pCharacterData->nameTextId));
    MADrawTextMaybe(gUnknown_02022F38 + 7, 0, GetStringFromIndex(gArenaState.opponentUnit->pClassData->nameTextId));
    MADrawTextMaybe(gUnknown_02022F38 + 0x47, 0, GetItemName(gArenaState.opponentWeapon));

    return;
}

//! FE8U = 0x080B5CE0
void sub_80B5CE0(ProcPtr param_1) {
    switch (ArenaGetResult()) {
        case 1:
            if (!gRAMChapterData.cfgDisableBgm) {
                Sound_PlaySong8002448(0x3a, 0);
            }

            break;

        default:
            if (!gRAMChapterData.cfgDisableBgm) {
                Sound_PlaySong8002448(0x38, 0);
            }

            Proc_End(param_1);

            break;
    }

    return;
}

//! FE8U = 0x080B5D2C
void sub_80B5D2C(void) {
    Sound_PlaySong80024E4(0x38, 0, 0);
    return;
}

//! FE8U = 0x080B5D3C
void sub_80B5D3C(void) {
    CallSuspendPromptEvent();
    return;
}

//! FE8U = 0x080B5D48
s8 sub_80B5D48(void) {

    if (GetDialoguePromptResult() != 1) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080B5D5C
void sub_80B5D5C(void) {
    gActionData.suspendPointType = SUSPEND_POINT_PLAYERIDLE;
    SaveSuspendedGame(SAVE_BLOCK_SUSPEND);
    return;
}