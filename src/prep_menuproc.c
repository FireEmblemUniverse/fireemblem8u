#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "bmcontainer.h"
#include "ap.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmusemind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
s8 CheckSomethingSomewhere();

s8 HasConvoyAccess_()
{
    return HasConvoyAccess();
}

void TraineePromo_ResetScreenEffect()
{
    sub_808F270();
    ResetDialogueScreen();
    APProc_DeleteAll();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;
    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
}

void DoPromoteAnimForChar100(struct Proc08A184B4 *proc)
{
    struct Unit *unit;

    unit = GetUnitFromCharId(0x100);

    if (!unit) {
        Proc_End(proc);
        return;
    }

    proc->game_lock = GetThread2SkipStack();
    SetWinEnable(0, 0, 0);
    
    sub_802F598(unit, -1, 0);
    gBattleStats.config = BATTLE_CONFIG_BIT4 | BATTLE_CONFIG_PROMOTION;
    gBattleActor.weaponBefore = 0;
    gBattleTarget.weaponBefore = 0;
    BeginBattleAnimations();
}

void IsGameLockLevelReserved(struct Proc08A184B4 *proc)
{
    if (proc->game_lock == GetThread2SkipStack())
        Proc_Break(proc);
}

void NullExpForChar100AndResetScreen()
{
    struct Unit *unit = GetUnitFromCharId(0x100);
    if (unit)
        unit->exp = -1;

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    SetDispEnable(0, 0, 0, 0, 0);
    sub_80029E8(0x34, 0x100, 0x100, 0x20, NULL);
}

void sub_80965F0(struct Proc08A184B4 *proc)
{
    sub_808F270();
    ResetDialogueScreen();
    APProc_DeleteAll();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    EndAllProcChildren(proc);
    Proc_StartBlocking(gUnknown_08A184B4, proc);
}

void sub_8096668()
{
    sub_80029E8(0, 0x100, 0, 0x20, NULL);
}

void NewPrepScreenTraineePromotionManager()
{
    Proc_Start(ProcScr_PrepTraineePromo, PROC_TREE_3);
}

int PrepScreenTraineePromotionManagerExists(ProcPtr proc)
{
    return Proc_Find(ProcScr_PrepTraineePromo) ? 1 : 0;
}

int PrepAtMenuExists(ProcPtr proc)
{
    return Proc_Find(ProcScr_AtMenu) ? 1 : 0;
}

void PutObj8A1856E(int xOam1, int yOam0, u16 oam2)
{
    PutSpriteExt(4, xOam1, yOam0, obj_8A1856E, oam2);
}

void PutObj8A18582_WithConfigs(int xOam1, int yOam0, int a3, u16 oam2)
{
    int val;
    if (1 & a3) {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 0x40, yOam0, objs_8A18614[0xA], oam2);
    }
    PutSpriteExt(4, xOam1, yOam0, obj_8A18582, oam2);

    val = a3 >> 1;
    if (val < 10)
        PutSpriteExt(4, xOam1 + 0x30, yOam0, objs_8A18614[0xB], oam2);
    else
        PutSpriteExt(4, xOam1 + 0x30, yOam0, objs_8A18614[val / 10], oam2);

    PutSpriteExt(4, xOam1 + 0x38, yOam0, objs_8A18614[val % 10], oam2);
}

void PutObj8A18590_WithConfigs(int xOam1, int yOam0, int a3, u16 oam2)
{
    int val;
    if (1 & a3) {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 0x40, yOam0, objs_8A18614[0xA], oam2);
    }
    PutSpriteExt(4, xOam1, yOam0, obj_8A18590, oam2);

    val = a3 >> 1;
    if (val < 10)
        PutSpriteExt(4, xOam1 + 0x30, yOam0, objs_8A18614[0xB], oam2);
    else
        PutSpriteExt(4, xOam1 + 0x30, yOam0, objs_8A18614[val / 10], oam2);

    PutSpriteExt(4, xOam1 + 0x38, yOam0, objs_8A18614[val % 10], oam2);
}

void PutObj8A1859E_WithConfigs(int xOam1, int yOam0, int a3, u16 oam2)
{
    int val;
    if (1 & a3) {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 0x3C, yOam0, objs_8A18614[0xA], oam2);
    }
    PutSpriteExt(4, xOam1 + 4, yOam0, obj_8A1859E, oam2);

    val = a3 >> 1;
    if (val < 10)
        PutSpriteExt(4, xOam1 + 0x2C, yOam0, objs_8A18614[0xB], oam2);
    else
        PutSpriteExt(4, xOam1 + 0x2C, yOam0, objs_8A18614[val / 10], oam2);

    PutSpriteExt(4, xOam1 + 0x34, yOam0, objs_8A18614[val % 10], oam2);
}

void PutObj8A185AC(int xOam1, int yOam0, u16 oam2)
{
    PutSpriteExt(4, xOam1, yOam0, obj_8A185AC, oam2);
}


void sub_8096958(struct ProcPrepSpecialChar *proc)
{
    int i;

    int xOam1 = 0xA0;
    int yOam0 = 8;

    if (0 == CheckSomethingSomewhere()) {
        switch (proc->unk30) {
        case 1:
            PutObj8A18582_WithConfigs(xOam1, yOam0, proc->unk2F, 0x6380);
            break;
    
        case 2:
            PutObj8A18590_WithConfigs(xOam1, yOam0, proc->unk2F, 0x6380);
            break;
    
        case 3:
            PutObj8A1859E_WithConfigs(xOam1, yOam0, proc->unk2F, 0x6380);
            break;
    
        case 4:
            PutObj8A185AC(xOam1, yOam0, 0x6380);
            break;
    
        case 0:
        default:
            break;
        }
    
        for (i = 0; i < 3; i++)
            PutSpriteExt(4, 0x80 + i * 0x20, 0x18, gObject_32x16, 0xB6C0 + 4 * i);
    
        if (proc->blink_Start || (1 & (proc->unk36 >> 2)))
                PutSpriteExt(4, 0x14, 0x8C, gUnknown_08A18E4E, 0x300);
    
        if (proc->blink_B || (1 & (proc->unk36 >> 2)))
            PutSpriteExt(4, 0x64, 0x8C, gUnknown_08A18E76, 0x300);
    
        PutObj8A1856E(0x74, 0x28, 0x9380);

    } else {
        if (0 != Prep_HasUnitDeployed())
            PutSpriteExt(4, 0x14, 0x8C, gUnknown_08A18E62, 0x300);

        PutObj8A1856E(0x74, 0x20, 0x9380);
    }
}

void ProcPrepSpChar_OnInit(struct ProcPrepSpecialChar *proc)
{
    u32 chIndex;

    proc->unk2A = 0;
    proc->unk36 = 0;

    ForceSyncUnitSpriteSheet();

    if (CheckSomethingSomewhere()) {
        proc->apProc = APProc_Create(gUnknown_08A1B194, 0x3C, 0x10, 0x9E40, 1, 0xD);
    } else {
        proc->apProc = APProc_Create(gUnknown_08A1B194, 0x3C, 0x10, 0x9E40, 0, 0xD);

        chIndex = gRAMChapterData.chapterIndex;
        if ((chIndex - 0x24) < 10)
            proc->unk30 = 2;
        else if ((chIndex - 0x2E) < 10)
            proc->unk30 = 3;
        else if (sub_80C0960(chIndex))
            proc->unk30 = 4;
        else if (chIndex - 0x15 <= 1 || chIndex == 0x22 || chIndex == 0x23)
            proc->unk30 = 0;
        else
            proc->unk30 = 1;

        proc->unk2F = GetROMChapterStruct(chIndex)->prepScreenNumber;
    }

    proc->unk2B = 0;
    proc->blink_Start = 1;
    proc->blink_B = 1;
}

void ProcPrepSpChar_Idle(struct ProcPrepSpecialChar *proc)
{
    sub_8096958(proc);
    proc->unk36++;
}

void ProcPrepSpChar_OnEnd(struct ProcPrepSpecialChar *proc)
{
    APProc_Delete(proc->apProc);
}

void PrepSpecialChar_BlinkButtonStart()
{
    struct ProcPrepSpecialChar *proc;
    proc = Proc_Find(ProcScr_PrepSpecialCharEff);

    if (proc)
        proc->blink_Start = 0;
}

void PrepSpecialChar_BlinkButtonB()
{
    struct ProcPrepSpecialChar *proc;
    proc = Proc_Find(ProcScr_PrepSpecialCharEff);

    if (proc)
        proc->blink_B = 0;
}

ProcPtr StartPrepSpecialCharEffect(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_PrepSpecialCharEff));
    Proc_Start(ProcScr_PrepSpecialCharEff, parent);
}

void EndPrepSpecialCharEffect()
{
    Proc_End(Proc_Find(ProcScr_PrepSpecialCharEff));
}

void sub_8096C34(int a1, int a2)
{
    int val1, val2, val4, r5, r6, _r8;
    int r7;
    int r8;
    int val3;

    val1 = a1 - 56;
    if (val1 < 0) {
        r7 = 0;
        r6 = a1;
    } else {
        val2 = a1 + 56;
        if (val2 > 240) {
            r7 = 0xF;
            r6 = a1 - 120;
        } else {
            r7 = val1 >> 3;
            r6 = a1 - ((val1 >> 3) << 3);
        }
    }

    val3 = a2 - 40;
    if ( a2 + 48 > 160 ) {
        r5 = 8;
        _r8 = a2 - 0x40;
    } else {
        val4 = val3;
        if (val4 < 0)
            val4 = a2 - 0x21;

        r5 = val4 >> 3;
        _r8 = a2 - 8 * (val4 >> 3);
    }
    r8 = _r8;

    DrawDecNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x4, 0x0), 2, r7);
    DrawDecNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x4, 0x2), 2, r5);
    DrawDecNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x4, 0x4), 2, r6);
    DrawDecNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x4, 0x6), 2, r8);
    BG_EnableSyncByMask(1);
}

void PrepMenu_OnInit(struct ProcPrepMenu *proc)
{
    int i;
    for (i = 0; i < 8; i++)
        proc->cmds[i] = 0;

    proc->cur_index = 0;
    proc->max_index = 0;

    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x600, 1);

    proc->on_PressB = 0;
    proc->on_PressStart = 0;
    proc->on_End = 0;
    proc->do_help = 0;
}

void PrepMenu_CtrlLoop(struct ProcPrepMenu *proc)
{
    struct ProcPrepMenuItem* cmd;
    int index = proc->cur_index;
    int xPos = (proc->xPos + 1) * 8 + 4;
    int yPos = (proc->yPos + 1) * 8 + proc->cur_index * 16;

    ShowPrepScreenHandCursor(xPos, yPos, 0x6, 0x400);

    cmd = proc->cmds[proc->cur_index];

    if (proc->do_help) {
        if ((R_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys) {
            CloseHelpBox();
            proc->do_help = 0;
            return;
        }
    } else {
        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            if (cmd->msg_rtext) {
                StartHelpBox(xPos, yPos, cmd->msg_rtext);
                proc->do_help = 1;
            }
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            if ((1 & cmd->color) || (NULL == cmd->effect)) {
                PlaySoundEffect(0x6C);
                return;
            } else {
                Proc_Goto(proc, 0x0);
                cmd->effect(proc->proc_parent);
                PlaySoundEffect(0x6A);
                return;
            }
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            if (proc->on_PressB) {
                if (proc->on_PressB(proc->proc_parent)) {
                    Proc_Goto(proc, 0x0);
                    PlaySoundEffect(0x6B);
                    return;
                } else {
                    PlaySoundEffect(0x6C);
                    return;
                }
            }
            return;
        }

        if (START_BUTTON & gKeyStatusPtr->newKeys) {
            if (proc->on_PressStart) {
                if (proc->on_PressStart(proc->proc_parent)) {
                    PlaySoundEffect(0x6A);
                    Proc_Goto(proc, 0x0);
                    return;
                } else {
                    PlaySoundEffect(0x6C);
                    return;
                }
            }
            return;
        }
    }

    if (DPAD_UP & gKeyStatusPtr->repeatedKeys) {
        if (proc->cur_index)
            proc->cur_index = proc->cur_index - 1;
        else if (DPAD_UP & gKeyStatusPtr->newKeys)
            proc->cur_index = proc->max_index - 1;
    }

    if (DPAD_DOWN & gKeyStatusPtr->repeatedKeys) {
        if (proc->cur_index < (proc->max_index - 1))
            proc->cur_index = proc->cur_index + 1;
        else if (DPAD_DOWN & gKeyStatusPtr->newKeys)
            proc->cur_index = 0;
    }

    if (index != proc->cur_index) {
        PlaySoundEffect(0x66);

        if (proc->do_help) {
            StartHelpBox((proc->xPos + 1) * 8 + 4,
                         (proc->yPos + 1) * 8 + proc->cur_index * 16,
                         (cmd = proc->cmds[proc->cur_index])->msg_rtext);
        }
    }
}

void PrepMenu_ShowFrozenHand(struct ProcPrepMenu *proc)
{
    DisplayFrozenUiHand((proc->xPos + 1) * 8 + 4,
                        (proc->yPos + 1) * 8 + proc->cur_index * 16);
}

void PrepMenu_ShowActiveHand(struct ProcPrepMenu *proc)
{
    ShowPrepScreenHandCursor((proc->xPos + 1) * 8 + 4,
                             (proc->yPos + 1) * 8 + proc->cur_index * 16,
                             6, 0x400);
}

void PrepMenu_OnEnd(struct ProcPrepMenu *proc)
{
    if (proc->on_End)
        proc->on_End(proc->proc_parent);
}

void StartPrepScreenMenu(ProcPtr proc)
{
    Proc_End(Proc_Find(ProcScr_PrepMenu));
    Proc_Start(ProcScr_PrepMenu, proc);
}

void SetPrepScreenMenuOnBPress(const void* func)
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        proc->on_PressB = func;
}

void SetPrepScreenMenuOnStartPress(const void* func)
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        proc->on_PressStart = func;
}

void SetPrepScreenMenuOnEnd(const void* func)
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        proc->on_End = func;
}

void SetPrepScreenMenuItem(int index, const void* func, int color, int msg, int msg_rtext)
{
    int i, max_index;
    struct ProcPrepMenuItem* cmd;
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        for (i = 0; i < 8; i++) {
            if (!proc->cmds[i])
                continue;

            if (proc->cmds[i]->index == index) {
                proc->cmds[i]->effect = func;
                proc->cmds[i]->color = color;
                proc->cmds[i]->msg = msg;
                proc->cmds[i]->msg_rtext = msg_rtext;
                return;
            }
        }

        i = proc->max_index;
        proc->cmds[i] = Proc_Start(ProcScr_PrepScreenMenuDummyItem, proc);
        proc->cmds[i]->index = index;
    	proc->cmds[i]->effect = func;
    	proc->cmds[i]->color = color;
    	proc->cmds[i]->msg = msg;
    	proc->cmds[i]->msg_rtext = msg_rtext;
        Text_Init(&proc->cmds[i]->text, 7);
        proc->max_index++;
    }
}

void SetPrepScreenMenuSelectedItem(int index)
{
    int i, cur = 0;
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        for (i = 0; i < 8; i++) {
            if (!proc->cmds[i])
                continue;

            if (proc->cmds[i]->index == index) {
                proc->cur_index = cur;
                return;
            }
            cur++;
        }
    }
}

int GetActivePrepMenuItemIndex()
{
    int i, cur = 0;
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        for (i = 0; i < 8; i++) {
            if (!proc->cmds[i])
                    continue;
    
            if (proc->cur_index == cur) {
                return proc->cmds[i]->index;
            }
            cur++;
        }
    }
    return 0;
}

void DrawPrepScreenMenuFrameAt(int x, int y)
{
    int i;
    struct ProcPrepMenu *proc;
    struct ProcPrepMenuItem *cmd;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        proc->xPos = x;
        proc->yPos = y;

        DrawUiFrame2(x, y, 0xA, proc->max_index * 2 + 2, 0);

        if (proc->max_index > 1) {
            for (i = 0; i < proc->max_index; i++) {
                cmd = proc->cmds[i];
                Text_Clear(&cmd->text);
    
                DrawTextInline(
    				&cmd->text,
    				TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y + 2 * i + 1),
    				1 & cmd->color,
    				0, 0,
    				GetStringFromIndex(cmd->msg) );
            }
        }

        BG_EnableSyncByMask(0x3);
    }
}

void SetPrepScreenMenuPosition(int x, int y)
{
    int i;
    struct ProcPrepMenu *proc;
    struct ProcPrepMenuItem *cmd;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        proc->xPos = x;
        proc->yPos = y;

        if (proc->max_index > 1) {
            for (i = 0; i < proc->max_index; i++) {
                cmd = proc->cmds[i];
                Text_Clear(&cmd->text);
    
                DrawTextInline(
    				&cmd->text,
    				TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y + 2 * i + 1),
    				1 & cmd->color,
    				0, 0,
    				GetStringFromIndex(cmd->msg) );
            }
        }

        BG_EnableSyncByMask(0x1);
    }
}

int GetPrepMenuItemAmt()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        return proc->max_index;
    else
        return 0;
}

void EndPrepScreenMenu()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        ResetPrepMenuScreen();
        Proc_Goto(proc, 0xA);
    }
}

void ResetPrepMenuScreen()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc) {
        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, proc->xPos, proc->yPos),
                         0x9, proc->max_index * 2 + 2, 0);

        TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, proc->xPos, proc->yPos),
                         0x9, proc->max_index * 2 + 2, 0);

        BG_EnableSyncByMask(0x3);
    }
}

int PrepScreenMenuExists()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        return 1;
    else
        return 0;
}

void ShowPrepScreenMenuFrozenHand()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        Proc_Goto(proc, 0x2);
}

void ShowPrepScreenMenuActiveHand()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        Proc_Goto(proc, 0x0);
}

void EnablePrepScreenMenu()
{
    struct ProcPrepMenu *proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc)
        Proc_Goto(proc, 0x1);
}



/* section.data */
CONST_DATA struct ProcCmd gUnknown_08A184B4[] = {
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(DoPromoteAnimForChar100),
    PROC_REPEAT(IsGameLockLevelReserved),
    PROC_SLEEP(0x8),
    PROC_CALL(NullExpForChar100AndResetScreen),
    PROC_SLEEP(0x1E),
    PROC_WHILE(MusicProc4Exists),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepTraineePromo[] = {
    PROC_CALL(AtMenu_LockGame),
    PROC_CALL(StartBranchedPromoScreen),
    PROC_YIELD,

PROC_LABEL(0xC8),
    PROC_CALL(TraineePromo_ResetScreenEffect),
    PROC_CALL(AtMenu_UnlockGame),
    PROC_END
};

/* UNK */
CONST_DATA u16 gUnknown_08A1852C[] = {
    0x0001, 0x4000, 0x8000, 0x7780,
    0x0002, 0x4000, 0x8000, 0x77C0,
    0x4000, 0x8020,

    0x77C4, 0x0002, 0x4000, 0x6000,
    0x6798, 0x4000, 0xA020, 0x679C,
    0x0002, 0x4000,

    0x5020, 0x6798, 0x4000, 0x9000,
    0x679C, 0x0001, 0x4000, 0x8000,
    0x6798, 0x0001,

    0x4000, 0x8000, 0x679C
};

CONST_DATA u16 obj_8A1856E[] = {
    0x0003, 0x4000, 0x8000, 0x0412,
    0x4000, 0x8020, 0x0416, 0x0000,
    0x4040, 0x041A,
};

CONST_DATA u16 obj_8A18582[] = {
    0x0002, 0x4000, 0x8000, 0x0400,
    0x0000, 0x4020, 0x0404
};

CONST_DATA u16 obj_8A18590[] = {
    0x0002, 0x4000, 0x8000, 0x0440,
    0x0000, 0x4020, 0x0444
};

CONST_DATA u16 obj_8A1859E[] = {
    0x0002, 0x4000, 0x8000, 0x0446,
    0x8000, 0x0020, 0x044A
};

CONST_DATA u16 obj_8A185AC[] = {
    0x0002, 0x4000, 0x8000, 0x044B,
    0x4000, 0x8020, 0x044F
};

static CONST_DATA u16 objs_8A18614_1[] = {0x0001, 0x8000, 0x0000, 0x0406};
static CONST_DATA u16 objs_8A18614_2[] = {0x0001, 0x8000, 0x0000, 0x0407};
static CONST_DATA u16 objs_8A18614_3[] = {0x0001, 0x8000, 0x0000, 0x0408};
static CONST_DATA u16 objs_8A18614_4[] = {0x0001, 0x8000, 0x0000, 0x0409};
static CONST_DATA u16 objs_8A18614_5[] = {0x0001, 0x8000, 0x0000, 0x040A};
static CONST_DATA u16 objs_8A18614_6[] = {0x0001, 0x8000, 0x0000, 0x040B};
static CONST_DATA u16 objs_8A18614_7[] = {0x0001, 0x8000, 0x0000, 0x040C};
static CONST_DATA u16 objs_8A18614_8[] = {0x0001, 0x8000, 0x0000, 0x040D};
static CONST_DATA u16 objs_8A18614_9[] = {0x0001, 0x8000, 0x0000, 0x040E};
static CONST_DATA u16 objs_8A18614_A[] = {0x0001, 0x8000, 0x0000, 0x040F};
static CONST_DATA u16 objs_8A18614_B[] = {0x0001, 0x8000, 0x0000, 0x0410};

CONST_DATA u16 *objs_8A18614[] = {
    objs_8A18614_1,
    objs_8A18614_2,
    objs_8A18614_3,
    objs_8A18614_4,
    objs_8A18614_5,
    objs_8A18614_6,
    objs_8A18614_7,
    objs_8A18614_8,
    objs_8A18614_9,
    objs_8A18614_A,
    objs_8A18614_B,
    objs_8A18614_1
};

static CONST_DATA u16 obj_8A18644[] = {
    0x0001, 0x0400, 0x8000, 0x0C80
};

static CONST_DATA u16 objs_8A1864C_1[] = {0x0003, 0x4400, 0x8020, 0x0C94, 0x4400, 0x8048, 0x0C98, 0x0400, 0x4068, 0x0C9C};
static CONST_DATA u16 objs_8A1864C_2[] = {0x0004, 0x4400, 0x8008, 0x0C94, 0x4400, 0x8030, 0x0CC4, 0x4400, 0x8050, 0x0CC8, 0x0400, 0x4070, 0x0CCC};
static CONST_DATA u16 objs_8A1864C_3[] = {0x0004, 0x4400, 0x8000, 0x0C84, 0x4400, 0x8020, 0x0C88, 0x4400, 0x8040, 0x0C8C, 0x4400, 0x8060, 0x0C90};
static CONST_DATA u16 objs_8A1864C_4[] = {0x0002, 0x4400, 0x8030, 0x0C94, 0x4400, 0x8058, 0x0CCE, 0x0000};

CONST_DATA u16 *objs_8A1864C[] = {
    objs_8A1864C_1,
    objs_8A1864C_2,
    objs_8A1864C_3,
    objs_8A1864C_4
};

CONST_DATA struct ProcCmd ProcScr_PrepSpecialCharEff[] = {
    PROC_YIELD,
    PROC_CALL(ProcPrepSpChar_OnInit),
    PROC_SET_END_CB(ProcPrepSpChar_OnEnd),
    PROC_REPEAT(ProcPrepSpChar_Idle),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepScreenMenuDummyItem[] = {
    PROC_BLOCK,
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepMenu[] = {
    PROC_CALL(PrepMenu_OnInit),
    PROC_SET_END_CB(PrepMenu_OnEnd),
    PROC_YIELD,

PROC_LABEL(0x0),
    PROC_REPEAT(PrepMenu_ShowActiveHand),


PROC_LABEL(0x1),
    PROC_REPEAT(PrepMenu_CtrlLoop),

PROC_LABEL(0x2),
    PROC_REPEAT(PrepMenu_ShowFrozenHand),

PROC_LABEL(0xA),
    PROC_END
};
