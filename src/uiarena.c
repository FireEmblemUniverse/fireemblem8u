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
#include "bm.h"
#include "bmio.h"
#include "bmmind.h"
#include "bmsave.h"
#include "bmlib.h"
#include "scene.h"
#include "mapanim.h"

extern struct ProcCmd gProcScr_ArenaUiMain[];
extern struct ProcCmd gProcScr_ArenaUiResults[];
extern struct ProcCmd gProcScr_ArenaUiResultBgm[];

void StartArenaDialogue(int, ProcPtr);
void DrawArenaOpponentDetailsText(ProcPtr);

//! FE8U = 0x080B5730
s8 sub_80B5730(void) {
    if (!(gMPlayTable[gSongTable[0x38].ms].info->status & 0x8000FFFF)) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080B576C
void StartArenaScreen(void) {
    ArenaBegin(gActiveUnit);
    Proc_Start(gProcScr_ArenaUiMain, PROC_TREE_3);
    return;
}

//! FE8U = 0x080B578C
void StartArenaResultsScreen(void) {
    Proc_Start(gProcScr_ArenaUiResults, PROC_TREE_3);
    return;
}

//! FE8U = 0x080B57A0
void ArenaUi_Init(ProcPtr proc) {
    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Hide);

    sub_80B52CC();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    InitTalk(0x200, 2, 0);
    ResetFaces();
    StartTalkFace(0x67, 0x20, 8, 3, 1);

    Decompress(gUnknown_089AD934, gGenericBuffer);

    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    TileMap_FillRect(gBG1TilemapBuffer + 0x100, 0x1e, 0xc, 0);

    BG_EnableSyncByMask(2);

    StartUiGoldBox(proc);

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

    gLCDControlBuffer.win0_left = 88;
    gLCDControlBuffer.win0_top = 72;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 152;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 8;
    gLCDControlBuffer.win1_right = 240;
    gLCDControlBuffer.win1_bottom = 56;

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Decompress(gGfx_ArenaBuildingFront, (void*)(GetBackgroundTileDataOffset(3) + 0x6000000));
    CallARM_FillTileRect(gBG3TilemapBuffer, gTsa_ArenaBuildingFront, 0xc000);
    ApplyPalettes(gPal_ArenaBuildingFront, 0xC, 4);

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
void ArenaUi_WelcomeDialogue(ProcPtr proc) {
    if (UNIT_ARENA_LEVEL(gArenaState.playerUnit) < 5) {
        StartArenaDialogue(0x8d0, proc);
        // TODO: msgid "Welcome to the arena![.][A]"
    } else {
        StartArenaDialogue(0x8D1, proc);
        // TODO: msgid "Welcome to the arena.[.][A][NL]Oh! It's you again.[.][A][NL2][NL]I've lost a lot of gold[.][NL]thanks to you...[A][NL2][NL]If you want to continue,[A][NL]we're going to have to[NL]do things differently.[A][NL2][NL]I'm going to prepare some[.][NL]more challenging foes.[A]"
    }

    return;
}

//! FE8U = 0x080B59CC
void ArenaUi_WagerGoldDialogue(ProcPtr proc) {
    SetTalkNumber(ArenaGetMatchupGoldValue());
    StartArenaDialogue(0x8D2, proc);
    // TODO: msgid "Would you like to wager[.][NL][G] gold?[Yes]"
    return;
}

//! FE8U = 0x080B59EC
void ArenaUi_CheckConfirmation(ProcPtr proc) {

    if (GetTalkChoiceResult() != 1) {
        StartArenaDialogue(0x8D4, proc);
        // TODO: msgid "What's that? Bah![.][NL]Get outta here![.][A]"
        Proc_Goto(proc, 2);
    } else {
        if (ArenaGetMatchupGoldValue() > (int)GetPartyGoldAmount()) {
            StartArenaDialogue(0x8DA, proc);
            // TODO: msgid "You don't have the money![.][NL]Try again later.[A]"
            Proc_Goto(proc, 2);
        }
    }

    return;
}

//! FE8U = 0x080B5A38
void ArenaUi_ConfirmWager(ProcPtr proc) {
    SetPartyGoldAmount(GetPartyGoldAmount() - ArenaGetMatchupGoldValue());
    PlaySoundEffect(0xb9);
    DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1B, 0x6));
    DrawArenaOpponentDetailsText(proc);

    return;
}

//! FE8U = 0x080B5A7C
void ArenaUi_InstructionsDialogue(ProcPtr proc) {
    StartArenaDialogue(0x8D5, proc);
    // TODO: msgid "Fight 'til you drop, or press[.][NL]the B Button to yield.[A]"
    return;
}

//! FE8U = 0x080B5A90
void ArenaUi_GoodLuckDialogue(ProcPtr proc) {
    StartArenaDialogue(0x8D3, proc);
    // TODO: msgid "Good luck. Don't get[NL]yourself killed.[A]"
    return;
}

//! FE8U = 0x080B5AA4
void ArenaUi_FadeOutBgm(void) {
    Sound_FadeOutBGM(-1);
    return;
}

//! FE8U = 0x080B5AB4
void ArenaUi_StartArenaBattle(ProcPtr proc) {

    Proc_SetMark(proc, PROC_MARK_7);

    ResetDialogueScreen();

    Proc_EndEach(gProcScr_GoldBox);

    gActionData.unitActionType = UNIT_ACTION_ARENA;
    gActiveUnit->state |= US_HAS_MOVED;

    PidStatsAddBattleAmt(gActiveUnit);
    MU_EndAll();

    gActionData.trapType = 0;

    BattleGenerateArena(gActiveUnit);

    BeginBattleAnimations();

    return;
}

//! FE8U = 0x080B5B00
void sub_80B5B00(ProcPtr proc) {
    StartPartialGameLock(proc);
    return;
}

//! FE8U = 0x080B5B0C
void sub_80B5B0C(ProcPtr proc) {
    ArenaUi_Init(proc);
    return;
}

//! FE8U = 0x080B5B18
void ArenaUi_ResultsDialogue(ProcPtr proc) {
    u32 partyGold = GetPartyGoldAmount();

    switch (ArenaGetResult()) {
        case 1:
            SetTalkNumber(ArenaGetMatchupGoldValue() * 2);
            StartArenaDialogue(0x8D6, proc);
            // TODO: msgid "So you won, eh? Here's[NL]your prize. [G] gold.[A]"

            SetPartyGoldAmount(partyGold = partyGold + (ArenaGetMatchupGoldValue() * 2));

            break;

        case 2:
            StartArenaDialogue(0x8D7, proc);
            // TODO: msgid "Ahh, you lost? I'd hoped[NL]for better from you.[A]"

            break;

        case 3:
            StartArenaDialogue(0x8D9, proc);
            // TODO: msgid "Looks like no one wins.[.][NL]Here's your money back.[.][A]"
            SetPartyGoldAmount(partyGold = partyGold + ArenaGetMatchupGoldValue());

            break;

        case 4:
            // _080B5B88
            StartArenaDialogue(0x8D8, proc);
            // TODO: msgid "What? You yield? Well,[NL]your gold is mine, then![A]"
            break;
    }

    return;
}

//! FE8U = 0x080B5B9C
void ArenaUi_ShowGoldBoxOnVictoryOrDraw(ProcPtr proc) {

    switch (ArenaGetResult()) {
        case 1:
        case 3:
            DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1B, 0x6));
            PlaySoundEffect(0xb9);
            StartTemporaryLock(proc, 60);

            break;

        case 2:
            return;
    }

    return;
}

//! FE8U = 0x080B5BE4
void ArenaUi_OnEnd(void) {
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(gProcScr_MoveUnit, (ProcFunc) MU_Show);
    return;
}

//! FE8U = 0x080B5C04
void StartArenaDialogue(int msgId, ProcPtr proc) {

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, GetStringFromIndex(msgId), proc);
    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(1);

    return;
}

//! FE8U = 0x080B5C48
void DrawArenaOpponentDetailsText(ProcPtr proc) {

    DrawUiFrame2(7, 9, 0x10, 6, 0);
    SetTextFont(0);
    InitSystemTextFont();

    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 10), 0, GetStringFromIndex(gMid_Lv));
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 10), 2, gArenaState.opponentUnit->level);
    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 12), 0, GetStringFromIndex(gArenaState.opponentUnit->pCharacterData->nameTextId));
    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 10), 0, GetStringFromIndex(gArenaState.opponentUnit->pClassData->nameTextId));
    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12), 0, GetItemName(gArenaState.opponentWeapon));

    return;
}

//! FE8U = 0x080B5CE0
void Arena_PlayResultSong(ProcPtr proc) {
    switch (ArenaGetResult()) {
        case 1:
            if (!gPlaySt.config.disableBgm) {
                StartBgmCore(0x3a, 0);
            }

            break;

        default:
            if (!gPlaySt.config.disableBgm) {
                StartBgmCore(0x38, 0);
            }

            Proc_End(proc);

            break;
    }

    return;
}

//! FE8U = 0x080B5D2C
void Arena_PlayArenaSong(void) {
    StartBgmExt(0x38, 0, 0);
    return;
}

//! FE8U = 0x080B5D3C
void sub_80B5D3C(void) {
    CallSuspendPromptEvent();
    return;
}

//! FE8U = 0x080B5D48
s8 sub_80B5D48(void) {

    if (GetTalkChoiceResult() != 1) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080B5D5C
void WriteSuspandPlaterIdle(void) {
    gActionData.suspendPointType = SUSPEND_POINT_PLAYERIDLE;
    WriteSuspendSave(SAVE_ID_SUSPEND);
    return;
}

struct ProcCmd CONST_DATA gProcScr_ArenaUiMain[] = {
    PROC_CALL(LockGame),

    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, 65535),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(BMapDispSuspend),

    PROC_CALL_ARG(_StartBgm, 56),

    PROC_CALL(ArenaUi_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_WelcomeDialogue),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_WagerGoldDialogue),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_CheckConfirmation),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_ConfirmWager),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_InstructionsDialogue),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_GoodLuckDialogue),
    PROC_SLEEP(1),

PROC_LABEL(0),
    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(sub_8013F40),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_StartArenaBattle),
    PROC_SLEEP(1),

    PROC_CALL(UnlockGame),
    PROC_CALL(BMapDispResume),

    PROC_JUMP(gProcScr_ArenaUiResults),

PROC_LABEL(2),
    PROC_SLEEP(1),

    PROC_CALL(sub_8013F40),
    PROC_SLEEP(1),

    PROC_CALL(ArenaUi_OnEnd),

    PROC_CALL(ResetDialogueScreen),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_ArenaUiResults[] = {
PROC_LABEL(1),
    PROC_CALL(sub_80B5B00),

    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),
    PROC_SLEEP(0),

    PROC_START_CHILD(gProcScr_ArenaUiResultBgm),

    PROC_CALL(ArenaUi_Init),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),

    PROC_CALL(ArenaUi_ResultsDialogue),
    PROC_SLEEP(0),

    PROC_CALL(ArenaUi_ShowGoldBoxOnVictoryOrDraw),
    PROC_SLEEP(0),

PROC_LABEL(2),
    PROC_SLEEP(1),

    PROC_END_EACH(gProcScr_ArenaUiResultBgm),
    PROC_SLEEP(0),

    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(sub_8013F40),
    PROC_SLEEP(0),

    PROC_CALL(sub_80B5970),

    PROC_CALL(ArenaUi_OnEnd),

    PROC_CALL(ResetDialogueScreen),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(UnlockGame),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_ArenaUiResultBgm[] = {
    PROC_CALL(Arena_PlayResultSong),
    PROC_SLEEP(210),

    PROC_CALL(Arena_PlayArenaSong),

    PROC_END,
};
