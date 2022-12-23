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
#include "mapanim.h"

void sub_807C230(void)
{
    Proc_Start(gUnknown_089A3814, PROC_TREE_3);
}

void sub_807C244(int num, int arg1, int arg2)
{
    const struct CharacterData* charData = GetCharacterData(gUnknown_089A3810->infos[num].data[0]);
    const struct ClassData* classData = GetClassData(gUnknown_089A3810->infos[num].data[3]);

    int charId = gUnknown_089A3810->infos[num].data[0];
    int classId = gUnknown_089A3810->infos[num].data[3];
    int unk = gUnknown_089A3810->infos[num].data[4];

    switch (arg1) {
    case 0:
        Text_Clear(&gUnknown_089A3810->infos[num].text[0]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->infos[num].text[0],
            16, arg2, charId);

        DrawTextInline(
            &gUnknown_089A3810->infos[num].text[0],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 0),
            arg2, 24, 0, GetStringFromIndex(charData->nameTextId));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 1:
        Text_Clear(&gUnknown_089A3810->infos[num].text[1]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->infos[num].text[1],
            8, arg2, gUnknown_089A3810->infos[num].data[1]);

        Text_Draw(
            &gUnknown_089A3810->infos[num].text[1],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 7, 2));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 2:
        Text_Clear(&gUnknown_089A3810->infos[num].text[2]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->infos[num].text[2],
            8, arg2, gUnknown_089A3810->infos[num].data[2]);

        Text_Draw(
            &gUnknown_089A3810->infos[num].text[2],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 10, 2));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 3:
        Text_Clear(&gUnknown_089A3810->infos[num].text[3]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->infos[num].text[3],
            16, arg2, classId);

        DrawTextInline(
            &gUnknown_089A3810->infos[num].text[3],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 4),
            arg2, 24, 0, GetStringFromIndex(classData->nameTextId));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 4:
        Text_Clear(&gUnknown_089A3810->infos[num].text[4]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->infos[num].text[4],
            16, arg2, unk);

        DrawTextInline(
            &gUnknown_089A3810->infos[num].text[4],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 + 6, 6),
            arg2, 24, 0, GetItemName(gUnknown_089A3810->infos[num].data[4]));

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    case 5 ... 9:
        Text_Clear(&gUnknown_089A3810->infos[num].text[arg1]);

        Text_InsertNumberOr2Dashes(
            &gUnknown_089A3810->infos[num].text[arg1],
            8, arg2, gUnknown_089A3810->infos[num].data[arg1]);

        DrawTextInline(
            &gUnknown_089A3810->infos[num].text[arg1],
            TILEMAP_LOCATED(gBG0TilemapBuffer, num*12 - 57, arg1*2),
            arg2, 16, 0,
            gUnknown_089A3770[gUnknown_089A3810->infos[num].data[arg1]]);

        BG_EnableSyncByMask(BG0_SYNC_BIT);

        break;

    } // switch (arg1)
}

void sub_807C4F0(struct MADebugProc* proc)
{
    Proc_EndEach(gUnknown_0859AA5C);

    proc->unk64 = 0;
    proc->unk66 = 0;

    gUnknown_089A3810->infos[0].data[3] = 1;
    gUnknown_089A3810->infos[0].data[0] = 1;
    gUnknown_089A3810->infos[0].data[4] = 1;
    gUnknown_089A3810->infos[0].data[1] = 4;
    gUnknown_089A3810->infos[0].data[2] = 8;

    gUnknown_089A3810->infos[1].data[3] = 1;
    gUnknown_089A3810->infos[1].data[0] = 2;
    gUnknown_089A3810->infos[1].data[4] = 2;
    gUnknown_089A3810->infos[1].data[1] = 5;
    gUnknown_089A3810->infos[1].data[2] = 8;

    gUnknown_089A3810->infos[0].data[5] = 1;
    gUnknown_089A3810->infos[0].data[6] = 5;
    gUnknown_089A3810->infos[0].data[7] = 0;
    gUnknown_089A3810->infos[0].data[8] = 0;
    gUnknown_089A3810->infos[0].data[9] = 0;

    gUnknown_089A3810->infos[1].data[5] = 1;
    gUnknown_089A3810->infos[1].data[6] = 0;
    gUnknown_089A3810->infos[1].data[7] = 0;
    gUnknown_089A3810->infos[1].data[8] = 0;
    gUnknown_089A3810->infos[1].data[9] = 0;
}

void sub_807C568(struct MADebugProc* proc)
{
    int i, j;

    MU_EndAll();
    Font_InitForUIDefault();

    SetSpecialColorEffectsParameters(2, 8, 8, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    // TODO: SetWinEnable macro?
    gLCDControlBuffer.dispcnt.win0_on   = FALSE;
    gLCDControlBuffer.dispcnt.win1_on   = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    DrawUiFrame2(0, 0, 29, 19, 1); // TODO: UI_STYLE...

    for (i = 0; gUnknown_089A37E8[i]; ++i)
        sub_801443C(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 1, i*2), 0, gUnknown_089A37E8[i]);

    for (i = 0; i < 10; ++i) {
        for (j = 0; j < 2; ++j) {
            Text_Allocate(&gUnknown_089A3810->infos[j].text[i], gUnknown_089A3798[i].a);

            if (j == proc->unk64 && i == proc->unk66)
                sub_807C244(j, i, TEXT_COLOR_NORMAL);
            else
                sub_807C244(j, i, TEXT_COLOR_GRAY);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void sub_807C680(struct MADebugProc* proc)
{
    int inc;

    int oldActor = proc->unk64;
    int oldField = proc->unk66;

    if (gKeyStatusPtr->newKeys & START_BUTTON) {
        if (!sub_807C8FC())
            return;

        Proc_Break(proc);
    }

    inc = (gKeyStatusPtr->heldKeys & R_BUTTON) ? 10 : 1;
    if (gKeyStatusPtr->repeatedKeys & A_BUTTON) {
        gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] += inc;

        if (gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] >= gUnknown_089A3798[proc->unk66].g)
        {
            if (inc == 1)
                gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].f;
            else
                gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].g - 1;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & B_BUTTON) {
        gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] -= inc;

        if (gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] < gUnknown_089A3798[proc->unk66].f) {
            if (inc == 1)
                gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].g - 1;
            else
                gUnknown_089A3810->infos[proc->unk64].data[proc->unk66] = gUnknown_089A3798[proc->unk66].f;
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
        sub_807C244(oldActor, oldField, TEXT_COLOR_GRAY);

    if (gKeyStatusPtr->repeatedKeys & (DPAD_ANY | A_BUTTON | B_BUTTON))
        sub_807C244(proc->unk64, proc->unk66, TEXT_COLOR_NORMAL);
}

void sub_807C8A0(struct BattleUnit* bu, int dActor)
{
    bu->hpInitial  = 30;
    bu->unit.maxHP = 60;

    bu->unit.pCharacterData = GetCharacterData(gUnknown_089A3810->infos[dActor].data[0]);
    bu->unit.pClassData     = GetClassData(gUnknown_089A3810->infos[dActor].data[3]);

    bu->unit.xPos = gUnknown_089A3810->infos[dActor].data[1];
    bu->unit.yPos = gUnknown_089A3810->infos[dActor].data[2];

    bu->weaponBefore = gUnknown_089A3810->infos[dActor].data[4];
    bu->expGain = 0;
}

s8 sub_807C8FC(void)
{
    // There's some gross variable reuse going on here
    int hitnum, actnum, unk, i;

    struct BattleHit* hit = gBattleHitArray;

    sub_807C8A0(&gBattleActor, 0);
    sub_807C8A0(&gBattleTarget, 1);

    ClearBattleHits();

    unk = 0;

    for (hitnum = 0; hitnum < 5; ++hitnum) {
        for (actnum = 0; actnum < 2; ++actnum) {
            if (gUnknown_089A3810->infos[actnum].data[5 + hitnum] != 0) {
                unk = 1;
                break;
            }
        }

        if (unk)
            break;
    }

    if (hitnum == 5 && actnum == 2)
        return FALSE;

    for (i = hitnum*2+actnum; i < 10; ++i) {
        hitnum = i / 2;
        actnum = i & 1;

        hit->info = actnum<<3;

        unk = gUnknown_089A3810->infos[actnum].data[5 + hitnum];

        switch (unk) {
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

        } // switch (unk)

        switch (unk) {
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
        } // switch (unk)

        if (unk != 0)
            ++hit;
    }

    hit->info |= BATTLE_HIT_INFO_END;
    return TRUE;
}

void sub_807CAA8(void)
{
    BG_Fill(gBG0TilemapBuffer, TILEREF(0, 0));
    BG_Fill(gBG1TilemapBuffer, TILEREF(0, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    BeginBattleMapAnims();
}


/* section.rodata */
/* I think this maybe some encoded string ? */
const char *gUnknown_08205718[] = {
    "\x81\x5B\x81\x5B\x81\x5B",
    "\x8D\x55\x8C\x82",
    "\x8D\x55\x8C\x82\x83\x66",
    "\x8D\x55\x8C\x82\x83\x8A",
    "\x8D\x55\x8C\x82\x93\xC5",
    "\x95\x4B\x8E\x45",
    "\x95\x4B\x8E\x45\x83\x66",
    "\x95\x4B\x8E\x45\x83\x8A",
    "\x95\x4B\x8E\x45\x93\xC5",
    "\x8B\xF3\x82\xD4\x82\xE8"
};

const char *gUnknown_08205768[] = {
    "\x82\x6F\x82\x68\x82\x63",
    "\x82\x77\x82\x78",
    "\x95\xBA\x8E\xED",
    "\x95\x90\x8A\xED",
    "\x82\x50",
    "\x82\x51",
    "\x82\x52",
    "\x82\x53",
    "\x82\x54",
};

/* section.data */
#if 0
char* CONST_DATA gUnknown_089A3770[] = {
    gUnknown_08205718[0],
    gUnknown_08205718[1],
    gUnknown_08205718[2],
    gUnknown_08205718[3],
    gUnknown_08205718[4],
    gUnknown_08205718[5],
    gUnknown_08205718[6],
    gUnknown_08205718[7],
    gUnknown_08205718[8],
    gUnknown_08205718[9],
};
#endif
