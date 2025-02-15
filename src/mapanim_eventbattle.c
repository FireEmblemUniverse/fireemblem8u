#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bm.h"
#include "mapanim.h"

void MapEventBattle_SetUpHitData(ProcPtr proc)
{
    if (gManimSt.pCurrentRound->info & BATTLE_HIT_INFO_END) {
        Proc_Goto(proc, 1); // TODO: label definitions
        return;
    }

    MapAnim_AdvanceBattleRound();
    Proc_Break(proc);
}

void MapEventBattle_OnEnd(void)
{
    ResetMuAnims();
    ResetTextFont();
    EndMapAnimInfoWindow();
    InitBmBgLayers();
    LoadLegacyUiFrameGraphics();
    LoadObjUIGfx();
}

/* section.data */
CONST_DATA struct ProcCmd ProcScr_MapAnimEventBattle[] = {
    PROC_CALL(LockGame),
    PROC_CALL(MapAnim_PrepareBattleTalk),
    PROC_SLEEP(0x1),
    PROC_SLEEP(0x5),
    PROC_CALL(MapAnim_InitInfoBox),
    PROC_SLEEP(0xF),
PROC_LABEL(0x0),
    PROC_REPEAT(MapEventBattle_SetUpHitData),
    PROC_CALL(MapAnim_DisplayRoundAnim),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_ShowPoisonEffectIfAny),
    PROC_SLEEP(0x1),
    PROC_SLEEP(0x5),
    PROC_GOTO(0x0),
PROC_LABEL(0x1),
    PROC_CALL(MapAnim_DisplayDeathFade),
    PROC_WHILE_EXISTS(ProcScr_MuDeathFade),
    PROC_CALL(EndMapAnimInfoWindow),
    PROC_SLEEP(0x1),
    PROC_CALL(UnlockGame),
    PROC_CALL(MapEventBattle_OnEnd),
    PROC_END
};
