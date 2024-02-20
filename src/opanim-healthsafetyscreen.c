#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"

void TryTickHSScreenExit(struct ProcOpAnimHS * proc)
{
    /* If not software-reset, HS screen cannot skip */
    if (proc->status == 2 || IsSoftwareReset())
    {
        if (gKeyStatusPtr->newKeys & 0xA)
            Proc_Goto(proc, 0);
    }
}

void GameIntroPrepareNintendofx(struct ProcOpAnimHS * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(NULL);
    SetPrimaryHBlankHandler(NULL);
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(Img_GameIntroNintendo, (void *)VRAM);
    Decompress(Tsa_GameIntroNintendo, gGenericBuffer);
    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0);

    Decompress(Img_IntelligentSystems, (void *)VRAM + 0x2000);
    Decompress(Tsa_IntelligentSystems, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1100);

    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    SetDispEnable(1, 0, 0, 0, 0);

    proc->palette_timer = 0;
}

void OpAnimHS_BrightenPalette(u16 * src, int palid, int line, int cur, int max)
{
    int i, len = line * 0x10;
    u16 * pal = PAL_BG(palid);

    if (cur < max)
    {
        for (i = 0; i < len; i++)
        {
            int color_base = src[i];

            int color_r = RED_VALUE(color_base) * cur / max;
            int color_g = GREEN_VALUE(color_base) * cur / max;
            int color_b = BLUE_VALUE(color_base) * cur / max;

            *pal++ = RGB(color_r, color_g, color_b);
        }
    }
    else
    {
        CpuFastCopy(src, pal, (len * 2));
    }
    EnablePaletteSync();
}

void sub_80CBF9C(struct ProcOpAnimHS * proc)
{
    CpuFastCopy(gPaletteBuffer, gPaletteOpAnimHsBackup, 0x400);
    proc->unk38 = 4;
}

void sub_80CBFC0(struct ProcOpAnimHS * proc)
{
    int i;

    if (--proc->unk38 > 0)
    {
        for (i = 0; i < 0x200; i++)
        {
            int color_r, color_g, color_b;
            const u16 * src = gPaletteOpAnimHsBackup;

            color_r = RED_VALUE(src[i]) * proc->unk38 / 4;
            color_g = GREEN_VALUE(src[i]) * proc->unk38 / 4;
            color_b = BLUE_VALUE(src[i]) * proc->unk38 / 4;

            gPaletteBuffer[i] = RGB(color_r, color_g, color_b);
        }
    }
    else
    {
        CpuFastFill16(0, gPaletteBuffer, 0x400);
        Proc_Break(proc);
    }
    EnablePaletteSync();
}

void GameEarlyStartDelay(struct ProcOpAnimHS * proc)
{
    if (--proc->delay_timer <= 0)
    {
        proc->palette_timer = 0;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void GameIntroNintendoFadeIN(struct ProcOpAnimHS * proc)
{
    if (proc->palette_timer == 0)
    {
        SetDispEnable(1, 0, 0, 0, 0);
    }
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(Pal_GameIntroNintendo, 0, 1, proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void GameIntroNintendoFadeOUT(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(Pal_GameIntroNintendo, 0, 1, 0x1E - proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x28;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void GameIntroIntelligentSystemsFadeIN(struct ProcOpAnimHS * proc)
{
    if (proc->palette_timer == 0)
    {
        SetDispEnable(0, 1, 0, 0, 0);
    }
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(Pal_IntelligentSystems, 1, 3, proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void GameIntroIntelligentSystemsFadeOUT(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(Pal_IntelligentSystems, 1, 3, 0x28 - proc->palette_timer, 0x28);

    if (proc->palette_timer > 0x27)
    {
        proc->delay_timer = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void SetOpAnimHsStatus0(struct ProcOpAnimHS * proc)
{
    proc->status = 0;
}

void SetOpAnimHsStatus1(struct ProcOpAnimHS * proc)
{
    proc->status = 1;
}

void SetOpAnimHsStatus2(struct ProcOpAnimHS * proc)
{
    proc->status = 2;
}

void PrepareHealthAndSafetyScreen(struct ProcOpAnimHS * proc)
{
    if (IsSoftwareReset() == true)
    {
        Proc_Goto(proc, 0x3E7);
        return;
    }

    Sound_FadeOutBGM(1);
    SetupBackgrounds(NULL);
    SetPrimaryHBlankHandler(NULL);
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(Img_OpAnimHleathSafetyScreen, (void *)VRAM);
    Decompress(Tsa_OpAnimHleathSafetyScreenBG1, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0);
    Decompress(Tsa_OpAnimHleathSafetyScreenBG0, gGenericBuffer);
    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0);

    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    SetDispEnable(0, 1, 0, 0, 0);
    proc->palette_timer = 0;
    SetKeyStatus_IgnoreMask(0x3FF);
}

void GameIntroHealthSafetyFadeIN(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(Pal_OpAnimHleathSafetyScreen, 0, 1, proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x5A;
        Proc_Break(proc);
    }
}

void GameIntroHealthSafetyWaitButton(struct ProcOpAnimHS * proc)
{
    s16 val;

    if (proc->palette_timer == 0)
    {
        SetDispEnable(1, 1, 0, 0, 0);
        SetBlendTargetA(1, 0, 0, 0, 0);
        SetKeyStatus_IgnoreMask(0);
    }

    ++proc->palette_timer;
    val = 0x10 - ((proc->palette_timer - ((proc->palette_timer / 64) * 64)) >> 0x1);

    if (val >= 0)
        SetBlendConfig(2, 0, 0, val);
    else
        SetBlendConfig(2, 0, 0, -val);

    if (proc->palette_timer > 0xE0F || gKeyStatusPtr->newKeys & 0x3FF)
    {
        proc->palette_timer = 0;
        SetDispEnable(0, 1, 0, 0, 0);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendTargetB(0, 0, 0, 0, 0);
        SetBlendConfig(0, 0, 0, 0);
        Proc_Break(proc);
    }
}

void GameIntroHealthSafetyFadeOUT(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(Pal_OpAnimHleathSafetyScreen, 0, 1, 0x1E - proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x28;
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_GameEarlyStartUI[] = {
    PROC_YIELD,
    PROC_CALL(SetOpAnimHsStatus0),
    PROC_CALL(PrepareHealthAndSafetyScreen),

    /* "Warning-Health and Safety" */
    PROC_REPEAT(GameIntroHealthSafetyFadeIN),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_REPEAT(GameIntroHealthSafetyWaitButton),
    PROC_REPEAT(GameIntroHealthSafetyFadeOUT),
    PROC_REPEAT(GameEarlyStartDelay),

PROC_LABEL(0x3E7),

    /* "Nintendo" */
    PROC_CALL(GameIntroPrepareNintendofx),
    PROC_CALL(SetOpAnimHsStatus1),
    PROC_REPEAT(GameIntroNintendoFadeIN),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_REPEAT(GameIntroNintendoFadeOUT),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_CALL(EnableKeyComboResetEN),

    /* Intelligent Systems */
    PROC_CALL(SetOpAnimHsStatus2),
    PROC_REPEAT(GameIntroIntelligentSystemsFadeIN),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_REPEAT(GameIntroIntelligentSystemsFadeOUT),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_GOTO(0x1),

PROC_LABEL(0x0),
    PROC_CALL(EnableKeyComboResetEN),
    PROC_CALL(sub_80CBF9C),
    PROC_REPEAT(sub_80CBFC0),

PROC_LABEL(0x1),
    PROC_END
};
