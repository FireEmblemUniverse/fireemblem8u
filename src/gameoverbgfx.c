#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "gbaio.h"
#include "mu.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "constants/video-global.h"
#include "uiutils.h"

/**
 * Background effect for the game over screen
 * port from fe6@StanHash
 */


/* struct definitions */

struct ProcGameOverScroll {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x34 - 0x29];

    /* 34 */ int bg2_xdiff;
    /* 38 */ int bg2_ydiff;
    /* 3C */ int bg3_xdiff;
    /* 40 */ int bg3_ydiff;

    /* 44 */ u8 _pad_44[0x64 - 0x44];

    /* 64 */ s16 bg2_xpos;
    /* 66 */ s16 bg2_ypos;
    /* 68 */ s16 bg3_xpos;
    /* 6A */ s16 bg3_ypos;

};

struct ProcGameOverScreen {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 counter1;
    /* 4E */ s16 counter2;
};

/* function declarations */

void GameOverScreen_RandomScroll_Init(struct ProcGameOverScroll *proc);
void GameOverScreen_RandomScroll_Loop(struct ProcGameOverScroll *proc);
void GameOverScreen_End(struct ProcGameOverScreen *proc);
void GameOverScreen_Init(struct ProcGameOverScreen *proc);
void GameOverScreen_LoopFadeIn(struct ProcGameOverScreen *proc);
void GameOverScreen_BeginIdle(struct ProcGameOverScreen *proc);
void GameOverScreen_LoopIdle(struct ProcGameOverScreen *proc);
void GameOverScreen_BeginFadeOut(struct ProcGameOverScreen *proc);
void GameOverScreen_LoopFadeOut(struct ProcGameOverScreen *proc);



/* section.data */

extern u16 CONST_DATA Img_GameOverText[];
extern u16 CONST_DATA Img_GameOverText[];
extern u16 CONST_DATA Img_GameOverText[];
extern u16 CONST_DATA Img_GameOverText[];
extern u16 CONST_DATA Img_GameOverText[];

struct ProcCmd CONST_DATA ProcScr_GameOverScreen_RandomScroll[] = {
    PROC_CALL(GameOverScreen_RandomScroll_Init),
    PROC_REPEAT(GameOverScreen_RandomScroll_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_GameOverScreen[] = {
    PROC_SET_END_CB(GameOverScreen_End),
    PROC_CALL(GameOverScreen_Init),
    PROC_CALL(MU_EndAll),
    PROC_START_CHILD(ProcScr_GameOverScreen_RandomScroll),
    PROC_REPEAT(GameOverScreen_LoopFadeIn),
    PROC_CALL(GameOverScreen_BeginIdle),
    PROC_REPEAT(GameOverScreen_LoopIdle),
PROC_LABEL(0x63),
    PROC_CALL(GameOverScreen_BeginFadeOut),
    PROC_REPEAT(GameOverScreen_LoopFadeOut),
    PROC_END,
};



/* section.text */

void GameOverScreen_RandomScroll_Init(struct ProcGameOverScroll *proc)
{
    proc->bg2_xdiff = +46;
    proc->bg2_ydiff = -90;
    proc->bg3_xdiff = -16;
    proc->bg3_ydiff = -53;

    proc->bg2_xpos = 1234;
    proc->bg2_ypos = 5678;
    proc->bg3_xpos = 6346;
    proc->bg3_ypos = 8536;
}

void GameOverScreen_RandomScroll_Loop(struct ProcGameOverScroll *proc)
{
    proc->bg2_xpos += proc->bg2_xdiff;
    proc->bg2_ypos += proc->bg2_ydiff;
    proc->bg3_xpos += proc->bg3_xdiff;
    proc->bg3_ypos += proc->bg3_ydiff;

    BG_SetPosition(BG_2, -proc->bg2_xpos >> 8, -proc->bg2_ypos >> 8);
    BG_SetPosition(BG_3, -proc->bg3_xpos >> 8, -proc->bg3_ypos >> 8);
}

void GameOverScreenHBlank(void)
{
    u16 val = REG_VCOUNT + 1;

    if (val > DISPLAY_HEIGHT)
        val = 0;

    if (val > DISPLAY_HEIGHT/2)
        val = DISPLAY_HEIGHT - val;

    val = val / 3;

    if (val > 0x10)
        val = 0x10;

    REG_BLDCA = val;
    REG_BLDCB = val;
}

void GameOverScreen_Init(struct ProcGameOverScreen *proc)
{
    int i;

    BMapDispSuspend();

    Sound_PlaySong80024D4(0x3E, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBackgroundTileDataOffset(2, 0);
    SetBackgroundTileDataOffset(3, 0);

    CopyDataWithPossibleUncomp(Img_GameOverText, BG_CHR_ADDR(BGCHR_GAMEOVER_TEXT));
    ApplyPalette(Pal_GameOverText1, BGPAL_GAMEOVER_4);
    CopyDataWithPossibleUncomp(Img_ChapterIntroFog, BG_CHR_ADDR(BGCHR_BMFX_IMG));
    ApplyPalette(Pal_GameOverText2, BGPAL_GAMEOVER_TEXT);

    BG_SetPosition(0, 0, 0);
    ClearBg0Bg1();

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 9),
        Tsa_GameOverFx,
        TILEREF(BGCHR_GAMEOVER_TEXT, BGPAL_GAMEOVER_TEXT));

    PutScreenFogEffectOverlayed();
    PutScreenFogEffect();

    BG_EnableSyncByMask(BG2_SYNC_BIT + BG3_SYNC_BIT);

    SetPrimaryHBlankHandler(GameOverScreenHBlank);

    SetSpecialColorEffectsParameters(1, 14, 14, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    MaybeResetSomePal();
    MaybeSmoothChangeSomePal(&PAL_BG_COLOR(BGPAL_GAMEOVER_TEXT, 0), BGPAL_GAMEOVER_TEXT, 1, +1);
    MaybeSmoothChangeSomePal(&PAL_BG_COLOR(BGPAL_GAMEOVER_4, 0), BGPAL_GAMEOVER_4, 1, +1);

    proc->counter1 = 21;

    for (i = 0; i < 10; ++i)
        CALLARM_MaybeScreenFadeIn();

    EnablePaletteSync();
}

void GameOverScreen_LoopFadeIn(struct ProcGameOverScreen *proc)
{
    if ((GetGameClock() % 8) == 0)
    {
        CALLARM_MaybeScreenFadeIn();
        EnablePaletteSync();

        proc->counter1--;

        if (proc->counter1 < 0)
            Proc_Break(proc);
    }
}

void GameOverScreen_BeginIdle(struct ProcGameOverScreen *proc)
{
    proc->counter2 = 1500;
}

void GameOverScreen_LoopIdle(struct ProcGameOverScreen *proc)
{
    proc->counter2--;

    if (proc->counter2 < 0)
        Proc_Goto(proc, 0x63);

    if ((A_BUTTON | B_BUTTON | START_BUTTON) & gKeyStatusPtr->newKeys)
        Proc_Goto(proc, 0x63);
}

void GameOverScreen_BeginFadeOut(struct ProcGameOverScreen *proc)
{
    MaybeResetSomePal();
    MaybeSmoothChangeSomePal(&PAL_BG_COLOR(BGPAL_GAMEOVER_TEXT, 0), BGPAL_GAMEOVER_TEXT, 1, -1);
    MaybeSmoothChangeSomePal(&PAL_BG_COLOR(BGPAL_GAMEOVER_4, 0), BGPAL_GAMEOVER_4, 1, -1);
    Sound_FadeOutBGM(4);
}

void GameOverScreen_LoopFadeOut(struct ProcGameOverScreen *proc)
{
    CALLARM_MaybeScreenFadeIn();
    EnablePaletteSync();

    proc->counter1++;

    if (proc->counter1 == 0x20)
        Proc_Break(proc);
}

void GameOverScreen_End(struct ProcGameOverScreen *proc)
{
    SetPrimaryHBlankHandler(NULL);
    SetSecondaryHBlankHandler(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

    gPaletteBuffer[0] = 0;
    EnablePaletteSync();
}

void StartGameOverScreen(ProcPtr parent)
{
    if (parent)
        Proc_StartBlocking(ProcScr_GameOverScreen, parent);
    else
        Proc_Start(ProcScr_GameOverScreen, PROC_TREE_3);
}
