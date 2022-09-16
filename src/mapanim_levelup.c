#include "global.h"

#include "proc.h"
#include "types.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "face.h"
#include "mapanim.h"
#include "m4a.h"
#include "soundwrapper.h"

enum stat_up_id{
    /* MapAnimLevelUpProc + 0x30 */
    STAT_UP_LV  = 0,
    STAT_UP_HP,
    STAT_UP_POW,
    STAT_UP_SKL,
    STAT_UP_SPD,
    STAT_UP_LCK,
    STAT_UP_DEF,
    STAT_UP_RES,
    STAT_UP_CON,
    STAT_UP_MAX_INDEX
};

struct Proc_089A3F5C {
    PROC_HEADER;

    /* 2A */ u8 _pad_2A[0x54 - 0x29];
    /* 54 */ int unk54;
    /* 58 */ u8 _pad_58[0x64 - 0x58];
    /* 64 */ s16 unk64;
};

struct MapAnimLevelUpProc {
    PROC_HEADER;

    /* 2A */ u8 _pad_2A[0x2E - 0x2A];
    /* 2E */ s16 unit_index;
    /* 30 */ u8 stat_cur;
    /* 31 */ u8 time_delay;
    /* 32 */ s16 y_cur;
    /* 34 */ u16 pad_34;
    /* 36 */ u16 unk_36;
};

struct TextSet_LevelUpAnimOff{
	/* 00 */ u8 x;
	/* 01 */ u8 y;
	/* 04 */ u16* msg[2];
};


extern struct ProcCmd CONST_DATA sProcScr_MapAnimLevelUp[];
extern u16 CONST_DATA gUnknown_089AC5CC[]; // palette
extern struct TextSet_LevelUpAnimOff LevelUpTextSet_AnimeOff[];
void sub_807EDF8(int, int, int, struct MapAnimLevelUpProc*);
void MapAnimLevelUp_DrawTexts(int unit_index, u8 x, u8 y);
void MapAnimLevelUp_DrawStatNum(int unit_index, u8 x, u8 y, enum stat_up_id, bool8 id_up);
int GetSomeStatUp(int unit_index, int stat_index);
void sub_807EE84(int x, int y, int stat_index, int value);


void StartMapAnimLevelUp(int unit_index, ProcPtr parent)
{
    struct MapAnimLevelUpProc *proc =
        Proc_StartBlocking(sProcScr_MapAnimLevelUp, parent);
    
    proc->unit_index = unit_index;
}

void MapAnimLevelUp_InitLcd(struct MapAnimLevelUpProc* proc)
{
    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = 0xF0;
    gLCDControlBuffer.win0_bottom = 0x30;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;
}

void MapAnimLevelUp_ResetLcd()
{
    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;
}

void MapAnimLevelUp_InitDisplay(struct MapAnimLevelUpProc* proc)
{
    int i;
    Font_ResetAllocation();
    BG_Fill(gBG0TilemapBuffer,0);

    MapAnimLevelUp_DrawTexts(proc->unit_index, 1, 1);

    for (i = 0; i < STAT_UP_MAX_INDEX; ++i)
        MapAnimLevelUp_DrawStatNum(proc->unit_index, 1, 1, i, FALSE);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    proc->stat_cur = 0;
    proc->time_delay = 0;
    proc->y_cur = 0xFF70;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDefaultColorEffects();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;
	
    BG_SetPosition(0, 0, proc->y_cur);
    BG_SetPosition(1, 0, proc->y_cur);

    NewFace(
        0, gCurrentMapAnimState.actors[proc->unit_index].\
            pUnit->pCharacterData->portraitId,
        0xB8, 0x20 - proc->y_cur, 0x1042);
    
    gFaceProcs[0]->yPosition = 0x20 - proc->y_cur;
    sub_807EDF8(0x200, 3, 1, proc);
}

void sub_807F2B4(struct Proc_089A3F5C *proc)
{
    proc->unk54 = 0;
}

void sub_807F2BC(struct Proc_089A3F5C *proc)
{
    u16 *tmp_ptr0, *tmp_ptr1;

    tmp_ptr0 = gUnknown_089AC5CC;
    proc->unk54++;

    if (0 != (3 & proc->unk54))
        return;

    tmp_ptr1 = &tmp_ptr0[(proc->unk54 >> 2) & 0xF];

    CopyToPaletteBuffer(tmp_ptr1,
        (proc->unk64 + 0x10) * 0x20 + 0x12, 0xE);

    CopyToPaletteBuffer(tmp_ptr1 + 0x20,
        (proc->unk64 + 0x11) * 0x20 + 0x12,0xE);
}

void MapAnimLevelUp_PullUpWindow(struct MapAnimLevelUpProc* proc)
{
    proc->y_cur += 8;
    BG_SetPosition(0, 0, proc->y_cur);
    BG_SetPosition(1, 0, proc->y_cur);

    gFaceProcs[0]->yPosition = 0x20 - proc->y_cur;

    /* note y_cur is s16, here (y_cur < -0x30) ==> (u16 var < 0xFFD0) */
    if (proc->y_cur < -0x30)
        return;

    Proc_Break((ProcPtr)proc);
}

void MapAnimLevelUp_PullOffWindow(struct MapAnimLevelUpProc* proc)
{
    proc->y_cur -= 8;
    BG_SetPosition(0, 0, proc->y_cur);
    BG_SetPosition(1, 0, proc->y_cur);

    gFaceProcs[0]->yPosition = 0x20 - proc->y_cur;

    /* note y_cur is s16, here (y_cur > -0x30) ==> (u16 var > 0xFF70) */
    if (proc->y_cur > -0x90)
        return;

    Proc_Break((ProcPtr)proc);
}

void MapAnimLevelUp_DisplayStatUp(struct MapAnimLevelUpProc* proc)
{
    int stat_index, timer;

    if (0 != proc->time_delay) {
        proc->time_delay--;
        return;
    }

#if NONMATCHING
    for (stat_index = proc->stat_cur; ; stat_index++) {
        if (stat_index >= STAT_UP_MAX_INDEX) {
            Proc_Break(proc);
            return;
        }
        if (0 != GetSomeStatUp(proc->unit_index, stat_index))
            break;
    }
#else
    /* loop start */
loop_start:
    stat_index = proc->stat_cur;
    goto loop_body;

loop_tail:
    stat_index++;

loop_body:
    if (stat_index >= STAT_UP_MAX_INDEX) {
        Proc_Break(proc);
        return;
    }
    if (0 == GetSomeStatUp(proc->unit_index, stat_index))
        goto loop_tail;
    /* loop end */
#endif /* #if NONMATCHING */

exec_stat_up_anime:
    MapAnimLevelUp_DrawStatNum(proc->unit_index, 1, 1, stat_index, 1);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    sub_807EE84(
        LevelUpTextSet_AnimeOff[stat_index].x * 8 + 0x3E,
        LevelUpTextSet_AnimeOff[stat_index].y * 8 + 0x17 - proc->y_cur,
        stat_index, GetSomeStatUp(proc->unit_index, stat_index));

    if (0 == stat_index) {
        PlaySoundEffect(0x2CD);
    } else {
        PlaySoundEffect(0x076);
    }

    proc->stat_cur = stat_index + 1;
    proc->time_delay = 0x14;
}

void MapAnimLevelUp_PlayMusic(struct MapAnimLevelUpProc* proc)
{
    ISuspectThisToBeMusicRelated_8002730(
        0x100, 0x80, 0x10, proc);
}
