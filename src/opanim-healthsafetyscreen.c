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
    if (proc->status == 2 || ShouldSkipHSScreen())
    {
        if (gKeyStatusPtr->newKeys & 0xA)
            Proc_Goto(proc, 0);
    }
}

void sub_80CBE0C(struct ProcOpAnimHS * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(NULL);
    SetPrimaryHBlankHandler(NULL);
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(Img_08B10630, (void *)VRAM);
    Decompress(Tsa_08B104D8, gGenericBuffer);
    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0);

    Decompress(Img_08B10CA4, (void *)VRAM + 0x2000);
    Decompress(Tsa_08B10ADC, gGenericBuffer);
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

#if !NOMATCHING

NAKEDFUNC
void sub_80CBFC0(struct ProcOpAnimHS * proc)
{
    asm("\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #4\n\
        adds r7, r0, #0\n\
        ldr r0, [r7, #0x38]\n\
        subs r0, #1\n\
        str r0, [r7, #0x38]\n\
        cmp r0, #0\n\
        ble _080CC044\n\
        movs r6, #0\n\
        ldr r0, _080CC038  @ gPaletteBuffer\n\
        mov r9, r0\n\
        movs r3, #0x1f\n\
        mov r8, r3\n\
        ldr r4, _080CC03C  @ __ewram_start\n\
        mov ip, r4\n\
    _080CBFE4:\n\
        lsls r2, r6, #1\n\
        mov r0, ip\n\
        ldrh r3, [r0]\n\
        movs r0, #0x1f\n\
        ands r0, r3\n\
        ldr r1, [r7, #0x38]\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080CBFF8\n\
        adds r0, #3\n\
    _080CBFF8:\n\
        asrs r5, r0, #2\n\
        lsls r3, r3, #0x10\n\
        lsrs r0, r3, #0x15\n\
        mov r4, r8\n\
        ands r0, r4\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080CC00A\n\
        adds r0, #3\n\
    _080CC00A:\n\
        asrs r4, r0, #2\n\
        lsrs r0, r3, #0x1a\n\
        mov r3, r8\n\
        ands r0, r3\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080CC01A\n\
        adds r0, #3\n\
    _080CC01A:\n\
        asrs r1, r0, #2\n\
        add r2, r9\n\
        lsls r0, r4, #5\n\
        orrs r0, r5\n\
        lsls r1, r1, #0xa\n\
        orrs r0, r1\n\
        strh r0, [r2]\n\
        movs r4, #2\n\
        add ip, r4\n\
        adds r6, #1\n\
        ldr r0, _080CC040  @ 0x000001FF\n\
        cmp r6, r0\n\
        ble _080CBFE4\n\
        b _080CC058\n\
        .align 2, 0\n\
    _080CC038: .4byte gPaletteBuffer\n\
    _080CC03C: .4byte __ewram_start\n\
    _080CC040: .4byte 0x000001FF\n\
    _080CC044:\n\
        movs r0, #0\n\
        str r0, [sp]\n\
        ldr r1, _080CC06C  @ gPaletteBuffer\n\
        ldr r2, _080CC070  @ 0x01000100\n\
        mov r0, sp\n\
        bl CpuFastSet\n\
        adds r0, r7, #0\n\
        bl Proc_Break\n\
    _080CC058:\n\
        bl EnablePaletteSync\n\
        add sp, #4\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080CC06C: .4byte gPaletteBuffer\n\
    _080CC070: .4byte 0x01000100\n\
        .syntax divided\n\
    ");
}

#else

void sub_80CBFC0(struct ProcOpAnimHS * proc)
{
    int i, mask;
    u16 * pal, * src;

    if (--proc->unk38 > 0)
    {
        i = 0;
        pal = gPaletteBuffer;


        for (; i < 0x200; i++)
        {
            int color_r, color_g, color_b;
            u16 color_base = gPaletteOpAnimHsBackup[i];

            color_r = RED_VALUE(color_base) * proc->unk38;
            if (color_r < 0)
                color_r = color_r + 3;
            color_r = color_r >> 2;

            color_g = GREEN_VALUE(color_base) * proc->unk38;
            if (color_g < 0)
                color_g = color_g + 3;
            color_g = color_g >> 2;

            color_b = BLUE_VALUE(color_base) * proc->unk38;
            if (color_b < 0)
                color_b = color_b + 3;
            color_b = color_b >> 2;

            *pal++ = RGB(color_r, color_g, color_b);
        }
    }
    else
    {
        CpuFastFill16(0, gPaletteBuffer, 0x400);
        Proc_Break(proc);
    }
    EnablePaletteSync();
}

#endif

void GameEarlyStartDelay(struct ProcOpAnimHS * proc)
{
    if (--proc->delay_timer <= 0)
    {
        proc->palette_timer = 0;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void sub_80CC098(struct ProcOpAnimHS * proc)
{
    if (proc->palette_timer == 0)
    {
        SetDispEnable(1, 0, 0, 0, 0);
    }
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(gUnknown_08B10ABC, 0, 1, proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void sub_80CC0FC(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(gUnknown_08B10ABC, 0, 1, 0x1E - proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x28;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void sub_80CC13C(struct ProcOpAnimHS * proc)
{
    if (proc->palette_timer == 0)
    {
        SetDispEnable(0, 1, 0, 0, 0);
    }
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(gUnknown_08B11864, 1, 3, proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}

void sub_80CC1A0(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(gUnknown_08B11864, 1, 3, 0x28 - proc->palette_timer, 0x28);

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
    if (ShouldSkipHSScreen() == true)
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

void sub_80CC2F4(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(gUnknown_08B125F4, 0, 1, proc->palette_timer, 0x1E);

    if (proc->palette_timer > 0x1D)
    {
        proc->delay_timer = 0x5A;
        Proc_Break(proc);
    }
}

void sub_80CC32C(struct ProcOpAnimHS * proc)
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
        SetSpecialColorEffectsParameters(2, 0, 0, val);
    else
        SetSpecialColorEffectsParameters(2, 0, 0, -val);

    if (proc->palette_timer > 0xE0F || gKeyStatusPtr->newKeys & 0x3FF)
    {
        proc->palette_timer = 0;
        SetDispEnable(0, 1, 0, 0, 0);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendTargetB(0, 0, 0, 0, 0);
        SetSpecialColorEffectsParameters(0, 0, 0, 0);
        Proc_Break(proc);
    }
}

void sub_80CC430(struct ProcOpAnimHS * proc)
{
    proc->palette_timer++;
    OpAnimHS_BrightenPalette(gUnknown_08B125F4, 0, 1, 0x1E - proc->palette_timer, 0x1E);

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
    PROC_REPEAT(sub_80CC2F4),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_REPEAT(sub_80CC32C),
    PROC_REPEAT(sub_80CC430),
    PROC_REPEAT(GameEarlyStartDelay),

PROC_LABEL(0x3E7),
    PROC_CALL(sub_80CBE0C),
    PROC_CALL(SetOpAnimHsStatus1),
    PROC_REPEAT(sub_80CC098),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_REPEAT(sub_80CC0FC),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_CALL(EnableKeyComboResetEN),
    PROC_CALL(SetOpAnimHsStatus2),
    PROC_REPEAT(sub_80CC13C),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_REPEAT(sub_80CC1A0),
    PROC_REPEAT(GameEarlyStartDelay),
    PROC_GOTO(0x1),

PROC_LABEL(0x0),
    PROC_CALL(EnableKeyComboResetEN),
    PROC_CALL(sub_80CBF9C),
    PROC_REPEAT(sub_80CBFC0),

PROC_LABEL(0x1),
    PROC_END
};
