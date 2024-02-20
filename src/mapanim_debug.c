#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "uiutils.h"
#include "player_interface.h"
#include "bm.h"
#include "bmlib.h"
#include "bmdebug.h"
#include "mapanim.h"

/* section.bss */
static struct MADebugInfo MADebugInfoData;


/* section.text */

void StartMADebug6C(void)
{
    Proc_Start(ProcScr_MADebug, PROC_TREE_3);
}

void MADebug_FormatPrint(int num, int index, int color)
{
    const struct CharacterData* charData = GetCharacterData(pMADebugInfoData->infos[num].data[0]);
    const struct ClassData* classData = GetClassData(pMADebugInfoData->infos[num].data[3]);

    int charId = pMADebugInfoData->infos[num].data[0];
    int classId = pMADebugInfoData->infos[num].data[3];
    int unk = pMADebugInfoData->infos[num].data[4];

    switch (index) {
    case 0:
        ClearText(&pMADebugInfoData->infos[num].text[0]);

        Text_InsertDrawNumberOrBlank(
            &pMADebugInfoData->infos[num].text[0],
            16, color, charId);

        PutDrawText(
            &pMADebugInfoData->infos[num].text[0],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 0),
            color, 24, 0, GetStringFromIndex(charData->nameTextId));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 1:
        ClearText(&pMADebugInfoData->infos[num].text[1]);

        Text_InsertDrawNumberOrBlank(
            &pMADebugInfoData->infos[num].text[1],
            8, color, pMADebugInfoData->infos[num].data[1]);

        PutText(
            &pMADebugInfoData->infos[num].text[1],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 7, 2));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 2:
        ClearText(&pMADebugInfoData->infos[num].text[2]);

        Text_InsertDrawNumberOrBlank(
            &pMADebugInfoData->infos[num].text[2],
            8, color, pMADebugInfoData->infos[num].data[2]);

        PutText(
            &pMADebugInfoData->infos[num].text[2],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 10, 2));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 3:
        ClearText(&pMADebugInfoData->infos[num].text[3]);

        Text_InsertDrawNumberOrBlank(
            &pMADebugInfoData->infos[num].text[3],
            16, color, classId);

        PutDrawText(
            &pMADebugInfoData->infos[num].text[3],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 4),
            color, 24, 0, GetStringFromIndex(classData->nameTextId));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 4:
        ClearText(&pMADebugInfoData->infos[num].text[4]);

        Text_InsertDrawNumberOrBlank(
            &pMADebugInfoData->infos[num].text[4],
            16, color, unk);

        PutDrawText(
            &pMADebugInfoData->infos[num].text[4],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 6),
            color, 24, 0, GetItemName(pMADebugInfoData->infos[num].data[4]));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 5 ... 9:
        ClearText(&pMADebugInfoData->infos[num].text[index]);

        Text_InsertDrawNumberOrBlank(
            &pMADebugInfoData->infos[num].text[index],
            8, color, pMADebugInfoData->infos[num].data[index]);

        PutDrawText(
            &pMADebugInfoData->infos[num].text[index],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 - 57, index*2),
            color, 16, 0,
            MADebugStrings1[pMADebugInfoData->infos[num].data[index]]);

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    } // switch (index)
}

void InitDebugMapAnim(struct MADebugProc* proc)
{
    Proc_EndEach(ProcScr_DebugMonitor);

    proc->unk64 = 0;
    proc->unk66 = 0;

    pMADebugInfoData->infos[0].data[3] = 1;
    pMADebugInfoData->infos[0].data[0] = 1;
    pMADebugInfoData->infos[0].data[4] = 1;
    pMADebugInfoData->infos[0].data[1] = 4;
    pMADebugInfoData->infos[0].data[2] = 8;

    pMADebugInfoData->infos[1].data[3] = 1;
    pMADebugInfoData->infos[1].data[0] = 2;
    pMADebugInfoData->infos[1].data[4] = 2;
    pMADebugInfoData->infos[1].data[1] = 5;
    pMADebugInfoData->infos[1].data[2] = 8;

    pMADebugInfoData->infos[0].data[5] = 1;
    pMADebugInfoData->infos[0].data[6] = 5;
    pMADebugInfoData->infos[0].data[7] = 0;
    pMADebugInfoData->infos[0].data[8] = 0;
    pMADebugInfoData->infos[0].data[9] = 0;

    pMADebugInfoData->infos[1].data[5] = 1;
    pMADebugInfoData->infos[1].data[6] = 0;
    pMADebugInfoData->infos[1].data[7] = 0;
    pMADebugInfoData->infos[1].data[8] = 0;
    pMADebugInfoData->infos[1].data[9] = 0;
}

void MADebug_InitScreen(struct MADebugProc* proc)
{
    int i, j;

    MU_EndAll();
    ResetText();

    SetBlendConfig(2, 8, 8, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    // TODO: SetWinEnable macro?
    gLCDControlBuffer.dispcnt.win0_on   = FALSE;
    gLCDControlBuffer.dispcnt.win1_on   = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    DrawUiFrame2(0, 0, 29, 19, 1); // TODO: UI_STYLE...

    for (i = 0; MADebugStrings2[i]; ++i)
        PutString(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 1, i*2), 0, MADebugStrings2[i]);

    for (i = 0; i < 10; ++i) {
        for (j = 0; j < 2; ++j) {
            InitTextDb(&pMADebugInfoData->infos[j].text[i], gUnknown_089A3798[i].a);

            if (j == proc->unk64 && i == proc->unk66)
                MADebug_FormatPrint(j, i, TEXT_COLOR_SYSTEM_WHITE);
            else
                MADebug_FormatPrint(j, i, TEXT_COLOR_SYSTEM_GRAY);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void MADebug_MainLoop(struct MADebugProc* proc)
{
    int inc;

    int oldActor = proc->unk64;
    int oldField = proc->unk66;

    if (gKeyStatusPtr->newKeys & START_BUTTON) {
        if (!SetupMADebugBattle())
            return;

        Proc_Break(proc);
    }

    inc = (gKeyStatusPtr->heldKeys & R_BUTTON) ? 10 : 1;
    if (gKeyStatusPtr->repeatedKeys & A_BUTTON) {
        pMADebugInfoData->infos[proc->unk64].data[proc->unk66] += inc;

        if (pMADebugInfoData->infos[proc->unk64].data[proc->unk66] >= gUnknown_089A3798[proc->unk66].g)
        {
            if (inc == 1)
                pMADebugInfoData->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].f;
            else
                pMADebugInfoData->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].g - 1;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & B_BUTTON) {
        pMADebugInfoData->infos[proc->unk64].data[proc->unk66] -= inc;

        if (pMADebugInfoData->infos[proc->unk64].data[proc->unk66] < gUnknown_089A3798[proc->unk66].f) {
            if (inc == 1)
                pMADebugInfoData->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].g - 1;
            else
                pMADebugInfoData->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].f;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        if (proc->unk66 != 2)
            proc->unk64 = 1 - proc->unk64;

        proc->unk66 = gUnknown_089A3798[proc->unk66].d;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        if (proc->unk66 != 1)
            proc->unk64 = 1 - proc->unk64;

        proc->unk66 = gUnknown_089A3798[proc->unk66].e;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
        proc->unk66 = gUnknown_089A3798[proc->unk66].b;

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
        proc->unk66 = gUnknown_089A3798[proc->unk66].c;

    if (gKeyStatusPtr->repeatedKeys & DPAD_ANY)
        MADebug_FormatPrint(oldActor, oldField, TEXT_COLOR_SYSTEM_GRAY);

    if (gKeyStatusPtr->repeatedKeys & (DPAD_ANY | A_BUTTON | B_BUTTON))
        MADebug_FormatPrint(proc->unk64, proc->unk66, TEXT_COLOR_SYSTEM_WHITE);
}

void SetupMADebugBattleUnit(struct BattleUnit* bu, int dActor)
{
    bu->hpInitial  = 30;
    bu->unit.maxHP = 60;

    bu->unit.pCharacterData = GetCharacterData(pMADebugInfoData->infos[dActor].data[0]);
    bu->unit.pClassData     = GetClassData(pMADebugInfoData->infos[dActor].data[3]);

    bu->unit.xPos = pMADebugInfoData->infos[dActor].data[1];
    bu->unit.yPos = pMADebugInfoData->infos[dActor].data[2];

    bu->weaponBefore = pMADebugInfoData->infos[dActor].data[4];
    bu->expGain = 0;
}

s8 SetupMADebugBattle(void)
{
    // There's some gross variable reuse going on here
    int hitnum, actnum, hit_count, i;

    struct BattleHit* hit = gBattleHitArray;

    SetupMADebugBattleUnit(&gBattleActor, 0);
    SetupMADebugBattleUnit(&gBattleTarget, 1);
    ClearBattleHits();

    hit_count = 0;

    for (hitnum = 0; hitnum < 5; ++hitnum) {
        for (actnum = 0; actnum < 2; ++actnum) {
            if (pMADebugInfoData->infos[actnum].data[5 + hitnum] != 0) {
                hit_count = 1;
                break;
            }
        }

        if (hit_count)
            break;
    }

    if (hitnum == 5 && actnum == 2)
        return FALSE;

    for (i = hitnum*2+actnum; i < 10; ++i) {
        hitnum = i / 2;
        actnum = i & 1;

        hit->info = actnum << 3;
        hit_count = pMADebugInfoData->infos[actnum].data[5 + hitnum];

        switch (hit_count) {
        case 5 ... 8:
            hit->attributes |= BATTLE_HIT_ATTR_CRIT;
            hit->hpChange = 20;
            break;

        case 1 ... 4:
            hit->hpChange = 10;
            break;

        case 9:
            hit->attributes |= BATTLE_HIT_ATTR_MISS;
            break;
        } // switch (hit_count)

        switch (hit_count) {
        case 2:
        case 6:
            hit->attributes |= BATTLE_HIT_ATTR_DEVIL;
            break;

        case 3:
        case 7:
            hit->attributes |= BATTLE_HIT_ATTR_HPSTEAL;
            break;

        case 4:
        case 8:
            hit->attributes |= BATTLE_HIT_ATTR_POISON;
            break;
        } // switch (hit_count)

        if (hit_count != 0)
            ++hit;
    }

    hit->info |= BATTLE_HIT_INFO_END;
    return TRUE;
}

void MADebug_DoBattleAnim(void)
{
    BG_Fill(gBG0TilemapBuffer, TILEREF(0, 0));
    BG_Fill(gBG1TilemapBuffer, TILEREF(0, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    BeginBattleMapAnims();
}


/* section.data */
/* I think this maybe some encoded string ? */
CONST_DATA char *MADebugStrings1[] = {
    "ーーー",
    "攻撃",
    "攻撃デ",
    "攻撃リ",
    "攻撃毒",
    "必殺",
    "必殺デ",
    "必殺リ",
    "必殺毒",
    "空ぶり"
};

CONST_DATA struct Unk089A3798 gUnknown_089A3798[] = {
    {9,  9, 1, 0, 0, 1, 1},
    {2,  0, 3, 2, 2, 0, 0x20},
    {2,  0, 3, 1, 1, 0, 0x20},
    {11, 1, 4, 3, 3, 1, 0x80},
    {10, 3, 5, 4, 4, 1, 0xCE},
    {9,  4, 6, 5, 5, 0, 10},
    {5,  5, 7, 6, 6, 0, 10},
    {5,  6, 8, 7, 7, 0, 10},
    {5,  7, 9, 8, 8, 0, 10},
    {5,  8, 0, 9, 9, 0, 10},
};

CONST_DATA char* MADebugStrings2[] = {
    "ＰＩＤ",
    "ＸＹ",
    "兵種",
    "武器",
    "１",
    "２",
    "３",
    "４",
    "５",
    NULL
};

CONST_DATA struct MADebugInfo * pMADebugInfoData = &MADebugInfoData;

CONST_DATA struct ProcCmd ProcScr_MADebug[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(LockGame),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_SLEEP(0x1),
    PROC_CALL(InitDebugMapAnim),
PROC_LABEL(0x0),
    PROC_CALL(MADebug_InitScreen),
    PROC_REPEAT(MADebug_MainLoop),
    PROC_CALL(MADebug_DoBattleAnim),
    PROC_WHILE_EXISTS(ProcScr_MapAnimBattle),
    PROC_GOTO(0x0),
    PROC_END
};
