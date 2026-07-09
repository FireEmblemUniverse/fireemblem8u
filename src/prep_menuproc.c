#include "global.h"

#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"

#include "constants/chapters.h"
#include "constants/songs.h"

s8 CheckInLinkArena(void);

s8 HasConvoyAccess_(void)
{
    return HasConvoyAccess();
}

void TraineePromo_ResetScreenEffect()
{
    EndCgText();
    ResetDialogueScreen();
    APProc_DeleteAll();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;
    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
}

void DoPromoteAnimForChar100(struct Proc08A184B4 * proc)
{
    struct Unit * unit;

    unit = GetUnitFromCharId(0x100);

    if (!unit)
    {
        Proc_End(proc);
        return;
    }

    proc->game_lock = GetGameLock();
    SetWinEnable(0, 0, 0);

    ExecUnitDefaultPromotion(unit, -1, 0);
    gBattleStats.config = BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_PROMOTION_PREP;
    gBattleActor.weaponBefore = 0;
    gBattleTarget.weaponBefore = 0;
    BeginBattleAnimations();
}

void IsGameLockLevelReserved(struct Proc08A184B4 * proc)
{
    if (proc->game_lock == GetGameLock())
        Proc_Break(proc);
}

void NullExpForChar100AndResetScreen()
{
    struct Unit * unit = GetUnitFromCharId(0x100);
    if (unit)
        unit->exp = -1;

    SetBlendDarken(16);
    SetDispEnable(0, 0, 0, 0, 0);
    ChangeBgm(SONG_COMBAT_PREPARATION, 0x100, 0x100, 0x20, NULL);
}

void PrepPromoteDebugMaybe(struct Proc08A184B4 * proc)
{
    EndCgText();
    ResetDialogueScreen();
    APProc_DeleteAll();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    EndAllProcChildren(proc);
    Proc_StartBlocking(ProcScr_PrepPromoteDebug, proc);
}

void FadeOutPrepBgm()
{
    ChangeBgm(SONG_NONE, 0x100, 0, 0x20, NULL);
}

void NewPrepScreenTraineePromotionManager()
{
    Proc_Start(ProcScr_PrepTraineePromo, PROC_TREE_3);
}

int PrepScreenTraineePromotionManagerExists(ProcPtr proc)
{
    return Proc_Find(ProcScr_PrepTraineePromo) ? true : false;
}

int PrepAtMenuExists(ProcPtr proc)
{
    return Proc_Find(ProcScr_AtMenu) ? true : false;
}

void PutPrepInformationSprite(int xOam1, int yOam0, u16 oam2)
{
    PutSpriteExt(4, xOam1, yOam0, Sprite_PrepInformation, oam2);
}

void PutPrepChapterSprite_Default(int xOam1, int yOam0, int prepChapterNum, u16 oam2)
{
    int chapterNum;

    // If this is a Gaiden chapter (odd prepChapterNum), display "X"
    if (prepChapterNum & 1)
    {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 64, yOam0, SpriteArray_PrepChapterNumbers[10], oam2);
    }

    PutSpriteExt(4, xOam1, yOam0, Sprite_PrepChapter, oam2);

    // Remove Gaiden bit and extract actual chapter number
    chapterNum = prepChapterNum >> 1;

    if (chapterNum < 10)
        PutSpriteExt(4, xOam1 + 48, yOam0, SpriteArray_PrepChapterNumbers[11], oam2);
    else
        PutSpriteExt(4, xOam1 + 48, yOam0, SpriteArray_PrepChapterNumbers[chapterNum / 10], oam2);

    PutSpriteExt(4, xOam1 + 56, yOam0, SpriteArray_PrepChapterNumbers[chapterNum % 10], oam2);
}

void PutPrepChapterSprite_Tower(int xOam1, int yOam0, int prepChapterNum, u16 oam2)
{
    int chapterNum;

    // If this is a Gaiden chapter (odd prepChapterNum), display "X"
    if (prepChapterNum & 1)
    {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 64, yOam0, SpriteArray_PrepChapterNumbers[10], oam2);
    }

    PutSpriteExt(4, xOam1, yOam0, Sprite_PrepTower, oam2);

    // Remove Gaiden bit and extract actual chapter number
    chapterNum = prepChapterNum >> 1;

    if (chapterNum < 10)
        PutSpriteExt(4, xOam1 + 48, yOam0, SpriteArray_PrepChapterNumbers[11], oam2);
    else
        PutSpriteExt(4, xOam1 + 48, yOam0, SpriteArray_PrepChapterNumbers[chapterNum / 10], oam2);

    PutSpriteExt(4, xOam1 + 56, yOam0, SpriteArray_PrepChapterNumbers[chapterNum % 10], oam2);
}

void PutPrepChapterSprite_Ruins(int xOam1, int yOam0, int prepChapterNum, u16 oam2)
{
    int chapterNum;

    // If this is a Gaiden chapter (odd prepChapterNum), display "X"
    if (prepChapterNum & 1)
    {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 60, yOam0, SpriteArray_PrepChapterNumbers[10], oam2);
    }

    PutSpriteExt(4, xOam1 + 4, yOam0, Sprite_PrepRuins, oam2);

    // Remove Gaiden bit and extract actual chapter number
    chapterNum = prepChapterNum >> 1;

    if (chapterNum < 10)
        PutSpriteExt(4, xOam1 + 44, yOam0, SpriteArray_PrepChapterNumbers[11], oam2);
    else
        PutSpriteExt(4, xOam1 + 44, yOam0, SpriteArray_PrepChapterNumbers[chapterNum / 10], oam2);

    PutSpriteExt(4, xOam1 + 52, yOam0, SpriteArray_PrepChapterNumbers[chapterNum % 10], oam2);
}

void PutPrepChapterSprite_Skirmish(int xOam1, int yOam0, u16 oam2)
{
    PutSpriteExt(4, xOam1, yOam0, Sprite_PrepExMap, oam2);
}

void DrawPrepScreenSprites(struct PrepSpriteDrawProc * proc)
{
    int i;

    int xOam1 = 160;
    int yOam0 = 8;

    if (!CheckInLinkArena())
    {
        switch (proc->kind)
        {
        case PREP_KIND_STANDARD:
            PutPrepChapterSprite_Default(xOam1, yOam0, proc->prepChapterNum, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_TOWER:
            PutPrepChapterSprite_Tower(xOam1, yOam0, proc->prepChapterNum, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_RUINS:
            PutPrepChapterSprite_Ruins(xOam1, yOam0, proc->prepChapterNum, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_SKIRMISH:
            PutPrepChapterSprite_Skirmish(xOam1, yOam0, OAM2_CHR(0x380) + OAM2_PAL(6));
            break;

        case PREP_KIND_FINAL_MAP:
        default:
            break;
        }

        for (i = 0; i < 3; i++)
            PutSpriteExt(4, 128 + i * 32, 24, gObject_32x16, OAM2_CHR(0x2C0) + OAM2_LAYER(1) + OAM2_PAL(11) + 4 * i);

        if (proc->buttonStartSolid || (1 & (proc->timer >> 2)))
            PutSpriteExt(4, 20, 140, Sprite_PrepStartButton, OAM2_CHR(0x300));

        if (proc->buttonBSolid || (1 & (proc->timer >> 2)))
            PutSpriteExt(4, 100, 140, Sprite_PrepBButton, OAM2_CHR(0x300));

        PutPrepInformationSprite(116, 40, OAM2_CHR(0x380) + OAM2_PAL(9));
    }
    else
    {
        if (Prep_HasUnitDeployed())
            PutSpriteExt(4, 20, 140, obj_PrepUnitselect_1, OAM2_CHR(0x300));

        PutPrepInformationSprite(116, 32, OAM2_CHR(0x380) + OAM2_PAL(9));
    }
}

void PrepSpriteDraw_Init(struct PrepSpriteDrawProc * proc)
{
    u32 chIndex;

    proc->unk2A = 0;
    proc->timer = 0;

    ForceSyncUnitSpriteSheet();

    if (CheckInLinkArena())
    {
        proc->apProc =
            APProc_Create(AP_DrawPreparationsBanner, 60, 16, OAM2_CHR(0x240) + OAM2_LAYER(3) + OAM2_PAL(9), 1, 13);
    }
    else
    {
        proc->apProc =
            APProc_Create(AP_DrawPreparationsBanner, 60, 16, OAM2_CHR(0x240) + OAM2_LAYER(3) + OAM2_PAL(9), 0, 13);

        chIndex = gPlaySt.chapterIndex;
        if ((chIndex - CHAPTER_T_01) < 10)
            proc->kind = PREP_KIND_TOWER;
        else if ((chIndex - CHAPTER_R_01) < 10)
            proc->kind = PREP_KIND_RUINS;
        else if (IsChapterMonsterSpawnActive(chIndex))
            proc->kind = PREP_KIND_SKIRMISH;
        else if (chIndex == CHAPTER_E_21 || chIndex == CHAPTER_E_21X || chIndex == CHAPTER_I_21 || chIndex == CHAPTER_I_21X)
            proc->kind = PREP_KIND_FINAL_MAP;
        else
            proc->kind = PREP_KIND_STANDARD;

        proc->prepChapterNum = GetROMChapterStruct(chIndex)->prepScreenNumber;
    }

    proc->unk2B = 0;
    proc->buttonStartSolid = true;
    proc->buttonBSolid = true;
}

void PrepSpriteDraw_Loop(struct PrepSpriteDrawProc * proc)
{
    DrawPrepScreenSprites(proc);
    proc->timer++;
}

void PrepSpriteDraw_OnEnd(struct PrepSpriteDrawProc * proc)
{
    APProc_Delete(proc->apProc);
}

void PrepSpriteDraw_BlinkButtonStart(void)
{
    struct PrepSpriteDrawProc * proc = Proc_Find(ProcScr_PrepScreenSpriteDraw);

    if (proc != NULL)
        proc->buttonStartSolid = false;
}

void PrepSpriteDraw_BlinkButtonB(void)
{
    struct PrepSpriteDrawProc * proc = Proc_Find(ProcScr_PrepScreenSpriteDraw);

    if (proc != NULL)
        proc->buttonBSolid = false;
}

ProcPtr StartPrepScreenSpriteDraw(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_PrepScreenSpriteDraw));
    return Proc_Start(ProcScr_PrepScreenSpriteDraw, parent);
}

void EndPrepScreenSpriteDraw(void)
{
    Proc_End(Proc_Find(ProcScr_PrepScreenSpriteDraw));
}

void PrepDebugDrawWindowPosition(int a1, int a2)
{
    int val1, val2, val4, r5, r6, _r8;
    int r7;
    int r8;
    int val3;

    val1 = a1 - 56;
    if (val1 < 0)
    {
        r7 = 0;
        r6 = a1;
    }
    else
    {
        val2 = a1 + 56;
        if (val2 > 240)
        {
            r7 = 0xF;
            r6 = a1 - 120;
        }
        else
        {
            r7 = val1 >> 3;
            r6 = a1 - ((val1 >> 3) << 3);
        }
    }

    val3 = a2 - 40;
    if (a2 + 48 > 160)
    {
        r5 = 8;
        _r8 = a2 - 0x40;
    }
    else
    {
        val4 = val3;
        if (val4 < 0)
            val4 = a2 - 0x21;

        r5 = val4 >> 3;
        _r8 = a2 - 8 * (val4 >> 3);
    }
    r8 = _r8;

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 0), TEXT_COLOR_SYSTEM_BLUE, r7);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 2), TEXT_COLOR_SYSTEM_BLUE, r5);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 4), TEXT_COLOR_SYSTEM_BLUE, r6);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 6), TEXT_COLOR_SYSTEM_BLUE, r8);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PrepMenu_OnInit(struct ProcPrepMenu * proc)
{
    int i;
    for (i = 0; i < 8; i++)
        proc->cmds[i] = 0;

    proc->cur_index = 0;
    proc->max_index = 0;

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    proc->on_PressB = NULL;
    proc->on_PressStart = NULL;
    proc->on_End = NULL;
    proc->do_help = false;
}

void PrepMenu_CtrlLoop(struct ProcPrepMenu * proc)
{
    struct ProcPrepMenuItem * cmd;
    int index = proc->cur_index;
    int xPos = (proc->xPos + 1) * 8 + 4;
    int yPos = (proc->yPos + 1) * 8 + proc->cur_index * 16;

    ShowSysHandCursor(xPos, yPos, 6, 0x400);

    cmd = proc->cmds[proc->cur_index];

    if (proc->do_help)
    {
        if ((R_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys)
        {
            CloseHelpBox();
            proc->do_help = false;
            return;
        }
    }
    else
    {
        if (R_BUTTON & gKeyStatusPtr->newKeys)
        {
            if (cmd->msg_rtext)
            {
                StartHelpBox(xPos, yPos, cmd->msg_rtext);
                proc->do_help = true;
            }
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys)
        {
            if ((1 & cmd->color) || (NULL == cmd->effect))
            {
                PlaySoundEffect(SONG_6C);
                return;
            }
            else
            {
                Proc_Goto(proc, 0);
                cmd->effect(proc->proc_parent);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys)
        {
            if (proc->on_PressB != NULL)
            {
                if (proc->on_PressB(proc->proc_parent))
                {
                    Proc_Goto(proc, 0);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
                }
                else
                {
                    PlaySoundEffect(SONG_6C);
                }
            }
            return;
        }

        if (START_BUTTON & gKeyStatusPtr->newKeys)
        {
            if (proc->on_PressStart != NULL)
            {
                if (proc->on_PressStart(proc->proc_parent))
                {
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                    Proc_Goto(proc, 0);
                }
                else
                {
                    PlaySoundEffect(SONG_6C);
                }
            }
            return;
        }
    }

    if (DPAD_UP & gKeyStatusPtr->repeatedKeys)
    {
        if (proc->cur_index)
            proc->cur_index = proc->cur_index - 1;
        else if (DPAD_UP & gKeyStatusPtr->newKeys)
            proc->cur_index = proc->max_index - 1;
    }

    if (DPAD_DOWN & gKeyStatusPtr->repeatedKeys)
    {
        if (proc->cur_index < (proc->max_index - 1))
            proc->cur_index = proc->cur_index + 1;
        else if (DPAD_DOWN & gKeyStatusPtr->newKeys)
            proc->cur_index = 0;
    }

    if (index != proc->cur_index)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if (proc->do_help)
        {
            StartHelpBox(
                (proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16,
                (cmd = proc->cmds[proc->cur_index])->msg_rtext);
        }
    }
}

void PrepMenu_ShowFrozenHand(struct ProcPrepMenu * proc)
{
    DisplayFrozenUiHand((proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16);
}

void PrepMenu_ShowActiveHand(struct ProcPrepMenu * proc)
{
    ShowSysHandCursor((proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16, 6, 0x400);
}

void PrepMenu_OnEnd(struct ProcPrepMenu * proc)
{
    if (proc->on_End)
        proc->on_End(proc->proc_parent);
}

void StartPrepScreenMenu(ProcPtr proc)
{
    Proc_End(Proc_Find(ProcScr_PrepMenu));
    Proc_Start(ProcScr_PrepMenu, proc);
}

void SetPrepScreenMenuOnBPress(const void * func)
{
    struct ProcPrepMenu * proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_PressB = func;
}

void SetPrepScreenMenuOnStartPress(const void * func)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_PressStart = func;
}

void SetPrepScreenMenuOnEnd(const void * func)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        proc->on_End = func;
}

void SetPrepScreenMenuItem(int index, const void * func, int color, int msg, int msg_rtext)
{
    int i;
    struct ProcPrepMenu * proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (!proc->cmds[i])
                continue;

            if (proc->cmds[i]->index == index)
            {
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
        InitText(&proc->cmds[i]->text, 7);
        proc->max_index++;
    }
}

void SetPrepScreenMenuSelectedItem(int index)
{
    int i, cur = 0;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (proc->cmds[i] == NULL)
                continue;

            if (proc->cmds[i]->index == index)
            {
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

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (!proc->cmds[i])
                continue;

            if (proc->cur_index == cur)
            {
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
    struct ProcPrepMenuItem * cmd;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        proc->xPos = x;
        proc->yPos = y;

        DrawUiFrame2(x, y, 10, proc->max_index * 2 + 2, 0);

        if (proc->max_index > 1)
        {
            for (i = 0; i < proc->max_index; i++)
            {
                cmd = proc->cmds[i];
                ClearText(&cmd->text);

                PutDrawText(
                    &cmd->text, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y + 2 * i + 1), 1 & cmd->color, 0, 0,
                    GetStringFromIndex(cmd->msg));
            }
        }

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    }
}

void SetPrepScreenMenuPosition(int x, int y)
{
    int i;
    struct ProcPrepMenuItem * cmd;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        proc->xPos = x;
        proc->yPos = y;

        if (proc->max_index > 1)
        {
            for (i = 0; i < proc->max_index; i++)
            {
                cmd = proc->cmds[i];
                ClearText(&cmd->text);

                PutDrawText(
                    &cmd->text, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y + 2 * i + 1), 1 & cmd->color, 0, 0,
                    GetStringFromIndex(cmd->msg));
            }
        }

        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }
}

int GetPrepMenuItemAmt(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        return proc->max_index;
    else
        return 0;
}

void EndPrepScreenMenu(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        ResetPrepMenuScreen();
        Proc_Goto(proc, 10);
    }
}

void ResetPrepMenuScreen(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, proc->xPos, proc->yPos), 9, proc->max_index * 2 + 2, 0);

        TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, proc->xPos, proc->yPos), 9, proc->max_index * 2 + 2, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    }
}

int PrepScreenMenuExists(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        return true;
    else
        return false;
}

void ShowPrepScreenMenuFrozenHand(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        Proc_Goto(proc, 2);
}

void ShowPrepScreenMenuActiveHand(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        Proc_Goto(proc, 0);
}

void EnablePrepScreenMenu(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
        Proc_Goto(proc, 1);
}

/* section.data */

// clang-format off

CONST_DATA struct ProcCmd ProcScr_PrepPromoteDebug[] =
{
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(DoPromoteAnimForChar100),
    PROC_REPEAT(IsGameLockLevelReserved),
    PROC_SLEEP(8),
    PROC_CALL(NullExpForChar100AndResetScreen),
    PROC_SLEEP(30),
    PROC_WHILE(MusicProc4Exists),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepTraineePromo[] =
{
    PROC_CALL(AtMenu_LockGame),
    PROC_CALL(StartTraineePromoScreen),
    PROC_YIELD,

PROC_LABEL(200),
    PROC_CALL(TraineePromo_ResetScreenEffect),
    PROC_CALL(AtMenu_UnlockGame),
    PROC_END
};

CONST_DATA u16 gPrepMenuproc_0[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x380) + OAM2_LAYER(1) + OAM2_PAL(7),
};

CONST_DATA u16 gPrepMenuproc_1[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x3C0) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(+32), OAM2_CHR(0x3C4) + OAM2_LAYER(1) + OAM2_PAL(7),
};

CONST_DATA u16 gPrepMenuproc_2[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_VFLIP, OAM2_CHR(0x398) + OAM2_LAYER(1) + OAM2_PAL(6),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(+32) + OAM1_VFLIP, OAM2_CHR(0x39C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

CONST_DATA u16 gPrepMenuproc_3[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(+32) + OAM1_HFLIP, OAM2_CHR(0x398) + OAM2_LAYER(1) + OAM2_PAL(6),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(0x39C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

CONST_DATA u16 gPrepMenuproc_4[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x398) + OAM2_LAYER(1) + OAM2_PAL(6),
};

CONST_DATA u16 gPrepMenuproc_5[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x39C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

CONST_DATA u16 Sprite_PrepInformation[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x12) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(+32), OAM2_CHR(0x16) + OAM2_LAYER(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(+64), OAM2_CHR(0x1A) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapter[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_LAYER(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(+32), OAM2_CHR(0x4) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepTower[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x40) + OAM2_LAYER(1),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(+32), OAM2_CHR(0x44) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepRuins[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x46) + OAM2_LAYER(1),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(+32), OAM2_CHR(0x4A) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepExMap[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x4B) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(+32), OAM2_CHR(0x4F) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_0[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x6) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_1[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x7) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_2[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x8) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_3[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x9) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_4[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xA) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_5[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xB) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_6[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xC) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_7[] = {
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xD) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_8[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xE) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_9[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xF) + OAM2_LAYER(1),
};

CONST_DATA u16 Sprite_PrepChapterNum_X[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x10) + OAM2_LAYER(1),
};

CONST_DATA u16 * SpriteArray_PrepChapterNumbers[] =
{
    Sprite_PrepChapterNum_0,
    Sprite_PrepChapterNum_1,
    Sprite_PrepChapterNum_2,
    Sprite_PrepChapterNum_3,
    Sprite_PrepChapterNum_4,
    Sprite_PrepChapterNum_5,
    Sprite_PrepChapterNum_6,
    Sprite_PrepChapterNum_7,
    Sprite_PrepChapterNum_8,
    Sprite_PrepChapterNum_9,
    Sprite_PrepChapterNum_X,
    Sprite_PrepChapterNum_0
};

CONST_DATA u16 Sprite_Unused_0[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_BLEND, OAM1_SIZE_32x32, OAM2_CHR(0x80) + OAM2_LAYER(3),
};

CONST_DATA u16 objs_PrepMenuproc_1[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+32), OAM2_CHR(0x94) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+72), OAM2_CHR(0x98) + OAM2_LAYER(3),
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_X(+104), OAM2_CHR(0x9C) + OAM2_LAYER(3),
};

CONST_DATA u16 objs_PrepMenuproc_2[] =
{
    4,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+8), OAM2_CHR(0x94) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+48), OAM2_CHR(0xC4) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+80), OAM2_CHR(0xC8) + OAM2_LAYER(3),
    OAM0_SHAPE_16x16 + OAM0_BLEND, OAM1_SIZE_16x16 + OAM1_X(+112), OAM2_CHR(0xCC) + OAM2_LAYER(3),
};

CONST_DATA u16 objs_PrepMenuproc_3[] =
{
    4,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16, OAM2_CHR(0x84) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+32), OAM2_CHR(0x88) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+64), OAM2_CHR(0x8C) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+96), OAM2_CHR(0x90) + OAM2_LAYER(3),
};

CONST_DATA u16 objs_PrepMenuproc_4[] =
{
    2,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+48), OAM2_CHR(0x94) + OAM2_LAYER(3),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(+88), OAM2_CHR(0xCE) + OAM2_LAYER(3),
};

CONST_DATA u16 * objs_0[] =
{
    objs_PrepMenuproc_1,
    objs_PrepMenuproc_2,
    objs_PrepMenuproc_3,
    objs_PrepMenuproc_4
};

CONST_DATA struct ProcCmd ProcScr_PrepScreenSpriteDraw[] =
{
    PROC_YIELD,
    PROC_CALL(PrepSpriteDraw_Init),
    PROC_SET_END_CB(PrepSpriteDraw_OnEnd),
    PROC_REPEAT(PrepSpriteDraw_Loop),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepScreenMenuDummyItem[] =
{
    PROC_BLOCK,
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PrepMenu[] =
{
    PROC_CALL(PrepMenu_OnInit),
    PROC_SET_END_CB(PrepMenu_OnEnd),
    PROC_YIELD,

PROC_LABEL(0),
    PROC_REPEAT(PrepMenu_ShowActiveHand),


PROC_LABEL(1),
    PROC_REPEAT(PrepMenu_CtrlLoop),

PROC_LABEL(2),
    PROC_REPEAT(PrepMenu_ShowFrozenHand),

PROC_LABEL(10),
    PROC_END
};

// clang-format on
