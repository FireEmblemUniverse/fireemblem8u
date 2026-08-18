#include "global.h"

#include <stdio.h>
#include <string.h>

#include "anime.h"
#include "bmlib.h"
#include "bmunit.h"
#include "classdisplayfont.h"
#include "ctc.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "fontgrp.h"
#include "gamecontrol.h"
#include "hardware.h"
#include "m4a.h"
#include "opinfo.h"
#include "scene.h"
#include "soundwrapper.h"
#include "sysutil.h"

#include "constants/classes.h"
#include "constants/msg.h"

EWRAM_OVERLAY(gamestart) struct AnimBuffer gOpInfoData = { 0 };

// TODO: Move elsewhere
void sub_805AA68(void *);
void sub_805AE14(void *);
void sub_805AE40(void *, s16, s16, s16, s16);

// TODO: Forward declarations

void sub_80B40E4(ProcPtr, int);
struct ClassReelEnt * GetClassReelEntry(int, int);
ProcPtr StartClassNameIntro(ProcPtr, struct ClassReelEnt *);
ProcPtr StartClassAnimDisplay(ProcPtr, struct ClassReelEnt *);
signed char * sub_80B369C(u8, signed char *);
ProcPtr StartClassNameIntroLetter(ProcPtr, u8);
ProcPtr StartClassNameIntroIcon(ProcPtr, u8);

extern struct ProcCmd CONST_DATA gProcScr_opinfo[];

extern ProcPtr * gUnknown_03001D50;

static inline int DarknessCoeff(int darkness, u8 lsr)
{
    return 0x10 - (darkness >> (lsr));
}

//! FE8U = 0x080B2818
void ClassReel_Init(struct OpInfoProc * proc)
{
    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(NULL);

    NewEfxAnimeDrvProc();
    ResetClassReelSpell();

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    SetDispEnable(FALSE, FALSE, FALSE, FALSE, FALSE);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    proc->index = 0;
    proc->mode = 2;
    proc->unk_32 = 0;

    return;
}

//! FE8U = 0x080B28A0
void ClassReel_ButtonPress_GoToTitle(struct OpInfoProc * proc)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_BmFadeOUT));
    EndAllProcChildren(proc);

    Sound_FadeOutBGM(1);

    SetDispEnable(FALSE, FALSE, FALSE, FALSE, FALSE);

    SetNextGameActionId(GAME_ACTION_EVENT_RETURN);

    Proc_Goto(proc, 5);

    return;
}

//! FE8U = 0x080B2904
void sub_80B2904(struct OpInfoProc * proc)
{
    switch (proc->mode)
    {
        case 2:
            proc->classReelEnt = GetClassReelEntry(proc->classSet, proc->index);

            if (proc->classReelEnt == 0)
            {
                SetNextGameActionId(GAME_ACTION_CLASS_REEL);
                Proc_Goto(proc, 4);
            }
            else
            {
                proc->index++;
                proc->mode = 1;
                StartClassNameIntro(proc, proc->classReelEnt);
            }
            break;

        case 3:
            StartClassAnimDisplay(proc, proc->classReelEnt);
            proc->mode = 1;

            break;

        case 1:
            if (gKeyStatusPtr->heldKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
            {
                ClassReel_ButtonPress_GoToTitle(proc);
            }

            break;
    }

    return;
}

//! FE8U = 0x080B2988
s8 sub_80B2988(void)
{
    struct OpInfoProc * proc = Proc_Find(gProcScr_opinfo);

    if (proc && !GetClassReelEntry(proc->classSet, proc->index))
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080B29B8
void SetClassReelMode(int mode)
{
    struct OpInfoProc * proc = Proc_Find(gProcScr_opinfo);

    if (proc != 0)
    {
        proc->mode = mode;
    }

    return;
}

//! FE8U = 0x080B29D4
void ClassReel_FadeOutBGM(void)
{
    Sound_FadeOutBGM(3);

    return;
}

//! FE8U = 0x080B29E0
void ClassReel_OnEnd(ProcPtr proc)
{
    EndAllProcChildren(proc);

    EndEfxAnimeDrvProc();
    sub_8009A84(0);
    EndActiveClassReelBgColorProc();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_opinfo[] =
{
    PROC_NAME("opinfo"),
    PROC_SLEEP(0),

    PROC_CALL(ClassReel_Init),
    PROC_REPEAT(sub_80B2904),

PROC_LABEL(4),
    PROC_CALL(ClassReel_FadeOutBGM),

    PROC_SLEEP(60),

    // fallthrough

PROC_LABEL(5),
    PROC_CALL(ClassReel_OnEnd),

    PROC_SLEEP(30),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080099E4
void StartClassReel(u8 classSet, ProcPtr parent)
{
    struct OpInfoProc * proc = Proc_StartBlocking(gProcScr_opinfo, parent);
    proc->classSet = classSet;

    return;
}

// clang-format off

u16 CONST_DATA sSprite_08A2EF48[] =
{
    1,
    OAM0_SHAPE_16x32 + OAM0_AFFINE_ENABLE + OAM0_DOUBLESIZE, OAM1_SIZE_16x32, OAM2_LAYER(1),
};

// clang-format on

//! FE8U = 0x080B2A14
void sub_80B2A14(u8 charId, int x, int y, u16 xScale, u16 yScale, u8 offset)
{
    int i;
    int k;

    for (i = 1; i < 0x10; i++)
    {
        if (i + offset >= 0x10)
        {
            int j = 0xF;
            gPaletteBuffer[0x110 + charId * 0x10 + i] = gPaletteBuffer[0x100 + j];
        }
        else
        {
            gPaletteBuffer[0x110 + charId * 0x10 + i] = gPaletteBuffer[0x100 + i + offset];
        }

        k = charId + 1;
    }

    EnablePaletteSync();

    if (yScale <= 8)
    {
        return;
    }

    if (xScale < 8)
    {
        xScale = 8;
    }

    SetObjAffineAuto(charId, 0, xScale, yScale);

    if (offset != 0)
    {
        PutSpriteExt(
            4, (x & 0x1FF) + (charId << 9), y & 0x1FF, sSprite_08A2EF48, charId * 2 + OAM2_PAL(k) + OAM2_LAYER(2));
    }
    else
    {
        PutSpriteExt(
            4, (x & 0x1FF) + (charId << 9), y & 0x1FF, sSprite_08A2EF48, charId * 2 + OAM2_PAL(k) + OAM2_LAYER(1));
    }

    return;
}

extern u8 * CONST_DATA gUnknown_08A2F2C0[];

//! FE8U = 0x080B2B8C
void ClassIntro_Init(struct OpInfoEnterProc * proc)
{
    int i;
    u16 ptr;
    signed char * str;

    // clang-format off
    u16 bgConfig[12] =
    {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x8000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };
    // clang-format on

    SetupBackgrounds(bgConfig);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(FALSE, TRUE, TRUE, FALSE, TRUE);

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    SetWinEnable(FALSE, FALSE, FALSE);

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 1);

    proc->timer = 0;
    proc->letterProcsPtr = &gUnknown_03001D50;

    for (i = 0; i < 20; i++)
    {
        *(proc->letterProcsPtr + i) = 0;
    }

    proc->iconProc = 0;

    BG_Fill(gBG0TilemapBuffer, 0);

    ApplyPalette(gUnknown_08A37300, 0x10);

    str = sub_80B369C(proc->classReelEnt->classId, NULL);

    ptr = 0;

    proc->classNameLength = strlen(str);

    while (*str != '\0')
    {
        Decompress((gUnknown_08A2F2C0[*str] != NULL) ? gUnknown_08A2F2C0[*str] : gUnknown_08A2F2C0['X'], gGenericBuffer);
        Copy2dChr(gGenericBuffer, OBJ_CHR_ADDR(0x0) + ptr, 2, 4);

        str++;
        ptr += 0x40;
    }

    ApplyPalette(gUnknown_08A30780, 0x1E);
    ApplyPalette(gUnknown_08A30780, 0x1F);

    Decompress(gUnknown_08A301B0, OBJ_CHR_ADDR(0x300));

    proc->unk_2c = ((240 - (((proc->classNameLength << 1) + proc->classNameLength) << 2)) >> 1) - 8;

    *proc->letterProcsPtr = StartClassNameIntroLetter(proc, 0);

    Decompress(gUnknown_08A360E8, BG_CHR_ADDR(0x0));

    Decompress(gUnknown_08A36284, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 7), gGenericBuffer, TILEREF(0x0, 4));

    Decompress(gUnknown_08A35A3C, BG_CHR_ADDR(0x40));

    Decompress(gUnknown_08A35FD0, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, TILEREF(0x40, 5));
    ApplyPalette(gUnknown_08A360C8, 5);

    Decompress(Img_ChapterIntro_LensFlare, BG_CHR_ADDR(0x400));

    sub_800154C(gBG2TilemapBuffer, Tsa_08B18D68, 0, 5);

    ApplyPalettes(Pal_ChapterIntro_LensFlare, 0, 3);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

// unused??
//! FE8U = 0x080B2DF0
void sub_80B2DF0(struct OpInfoEnterProc * proc)
{
    SetBlendBrighten(DarknessCoeff(proc->timer, 1));
    SetBlendBackdropA(1);

    proc->timer++;

    if (proc->timer == 32)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd CONST_DATA gProcScr_ClassIntro_FlareFX[];

//! FE8U = 0x080B2E30
void ClassIntro_LoopIn(struct OpInfoEnterProc * proc)
{
    int unkA;
    int unkB;

    if (proc->timer == 60)
    {
        proc->iconProc = StartClassNameIntroIcon(proc, proc->classReelEnt->classId);
        Proc_Start(gProcScr_ClassIntro_FlareFX, proc);
    }

    if (proc->timer >= 96)
    {
        Proc_Break(proc);
        proc->timer = 0;

        return;
    }

    if (proc->timer > 15)
    {
        unkA = (proc->timer - 0x10);

        if ((unkA & 1) == 0)
        {
            unkB = (unkA / 2);
            unkA = unkB + 1;

            if (unkA < proc->classNameLength)
            {
                proc->letterProcsPtr[unkB + 1] = StartClassNameIntroLetter(proc, unkA);
            }
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080B2EA8
void ClassIntro_LoopOut(struct OpInfoEnterProc * proc)
{
    if (proc->timer == 20)
    {
        Proc_Goto(proc->iconProc, 4);
    }

    if (proc->timer >= 80)
    {
        Proc_Break(proc);
        proc->timer = 0;

        return;
    }

    if ((proc->timer % 3) == 0)
    {

        if ((proc->timer / 3) < proc->classNameLength)
        {
            Proc_Break(proc->letterProcsPtr[proc->timer / 3]);
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080B2F08
void ClassIntro_DisableAllExceptBg1(ProcPtr proc)
{
    SetDispEnable(FALSE, TRUE, FALSE, FALSE, FALSE);
    return;
}

//! FE8U = 0x080B2F2C
void ClassIntro_OnEnd(ProcPtr proc)
{
    EndAllProcChildren(proc);
    SetClassReelMode(3);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_opinfoenter[] =
{
    PROC_NAME("opinfoenter"),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_SLEEP(1),

    PROC_CALL(ClassIntro_Init),
    PROC_REPEAT(ClassIntro_LoopIn),

    PROC_SLEEP(60),

    PROC_REPEAT(ClassIntro_LoopOut),
    PROC_CALL(ClassIntro_DisableAllExceptBg1),

    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

PROC_LABEL(4),
    PROC_CALL(ClassIntro_OnEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B2F3C
ProcPtr StartClassNameIntro(ProcPtr parent, struct ClassReelEnt * entry)
{
    struct OpInfoEnterProc * proc = Proc_Start(gProcScr_opinfoenter, parent);

    proc->parentProc = parent;
    proc->classReelEnt = entry;

    return proc;
}

//! FE8U = 0x080B2F58
void ClassIntroLetter_Init(struct OpInfoViewProc * proc)
{
    proc->timer = 0;
    proc->unk_2e = ((struct OpInfoEnterProc *)(proc->proc_parent))->unk_2c + (proc->charIndex * 12);
    return;
}

//! FE8U = 0x080B2F74
void ClassIntroLetter_LoopFadeIn(struct OpInfoViewProc * proc)
{
    int timer = proc->timer, a;
#ifndef NONMATCHING
    register int timer2 asm("r1") = timer;
#else
    int timer2 = timer;
#endif

    if (timer2)
    {
        ++timer2;
        --timer2;
    }
    timer2 >>= 4;
    a = (0x10 - timer2) * 2;

    sub_80B2A14(proc->charIndex, proc->unk_2e - a, 0x18, timer, 0x100, 0x10 - ({ proc->timer + 0; }) / 16);

    if ((proc->timer += 0x10) == 0x100)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B2FD0
void ClassIntroLetter_LoopDisplay(struct OpInfoViewProc * proc)
{
    sub_80B2A14(proc->charIndex, proc->unk_2e, 0x18, 0x100, 0x100, 0);
    proc->timer = 0;
    return;
}

//! FE8U = 0x080B2FF8
void ClassIntroLetter_LoopFadeOut(struct OpInfoViewProc * proc)
{
    u32 a4 = 0x100 + proc->timer;
    u32 a5 = 0x100 - proc->timer;

    sub_80B2A14(proc->charIndex, proc->unk_2e, 0x18, a4, a5, ({ proc->timer + 0; }) / 16);

    if (proc->timer == 0x100)
    {
        ((struct OpInfoEnterProc *)(proc->proc_parent))->letterProcsPtr[proc->charIndex] = NULL;

        Proc_Break(proc);
    }

    proc->timer += 8;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_opinfoview[] =
{
    PROC_NAME("opinfoview"),
    PROC_SLEEP(1),

    PROC_CALL(ClassIntroLetter_Init),

    PROC_REPEAT(ClassIntroLetter_LoopFadeIn),
    PROC_REPEAT(ClassIntroLetter_LoopDisplay),
    PROC_REPEAT(ClassIntroLetter_LoopFadeOut),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B305C
ProcPtr StartClassNameIntroLetter(ProcPtr parent, u8 index)
{
    struct OpInfoViewProc * proc = Proc_Start(gProcScr_opinfoview, parent);
    proc->charIndex = index;
    return proc;
}

// unused?
//! FE8U = 0x080B307C
void sub_80B307C(void)
{
    EnablePaletteSync();
    return;
}

//! FE8U = 0x080B3088
void ClassIntroIcon_Init(struct OpInfoIconProc * proc)
{
    int i;

    proc->timer = 0;

    for (i = 0; i < 0x10; i++)
    {
        gPaletteBuffer[0x1F0 + i] = 0;
        gPaletteBuffer[0x40 + i] = 0;
    }

    proc->unk_2e = 0;
    proc->numIcons = 0;

    for (i = 0; i < 8; i++)
    {
        const struct ClassData * class = GetClassData(proc->classId);

        if (class->baseRanks[i] == 0)
        {
            continue;
        }

        proc->unk_2e |= 1 << i;
        proc->numIcons++;
    }

    EnablePaletteSync();

    return;
}

extern u16 * CONST_DATA sSpriteLut_08A2F1D0[];

//! FE8U = 0x080B30FC
void sub_80B30FC(u8 a, u8 b, u8 c)
{
    int i;
    int tmp;
    int tmp2;
    u16 ** object;

    for (i = 0; i < 0x10; i++)
    {
        u16 color;

        if ((a + i) < 0x10)
        {
            color = a + i;
        }
        else
        {
            color = 0xF;
        }

        gPaletteBuffer[((0xF + 0x10) * 0x10) + i] = gPaletteBuffer[((0xE + 0x10) * 0x10) + color];
        gPaletteBuffer[(4 * 0x10) + i] = gPaletteBuffer[((0xE + 0x10) * 0x10) + color];
    }

    EnablePaletteSync();

    tmp = ((8 - (b)) << 4);

    for (i = 0, object = sSpriteLut_08A2F1D0, tmp2 = tmp - 8; i < 8; object++, i++)
    {
        if (((c >> i) & 1) != 0)
        {
            PutSpriteExt(4, (tmp2) & 0x1FF, 0x50, *object, 0xF000);
            tmp2 += 0x20;
        }
    }

    return;
}

//! FE8U = 0x080B31B0
void ClassIntroIcon_LoopFadeIn(struct OpInfoIconProc * proc)
{
    u8 unk;

    proc->timer++;

    if (proc->timer >= 33)
    {
        unk = 0;
        Proc_Break(proc);
    }
    else
    {
        unk = 0x10 - (proc->timer >> 1);
    }

    sub_80B30FC(unk, proc->numIcons, proc->unk_2e);

    return;
}

//! FE8U = 0x080B31EC
void ClassIntroIcon_LoopDisplay(struct OpInfoIconProc * proc)
{
    sub_80B30FC(0, proc->numIcons, proc->unk_2e);
    proc->timer = 0;
    return;
}

//! FE8U = 0x080B3208
void ClassIntroIcon_LoopFadeOut(struct OpInfoIconProc * proc)
{
    proc->timer++;

    if ((proc->timer >> 1) >= 17)
    {
        SetDispEnable(FALSE, TRUE, FALSE, FALSE, TRUE);
        Proc_Break(proc);
    }
    else
    {
        sub_80B30FC((proc->timer >> 1), proc->numIcons, proc->unk_2e);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_opinfoicon[] =
{
    PROC_NAME("opinfoicon"),
    PROC_SLEEP(1),

    PROC_CALL(ClassIntroIcon_Init),

    PROC_REPEAT(ClassIntroIcon_LoopFadeIn),
    PROC_REPEAT(ClassIntroIcon_LoopDisplay),

PROC_LABEL(4),
    PROC_REPEAT(ClassIntroIcon_LoopFadeOut),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B325C
ProcPtr StartClassNameIntroIcon(ProcPtr parent, u8 classId)
{
    struct OpInfoIconProc * proc = Proc_Start(gProcScr_opinfoicon, parent);
    proc->classId = classId;
    return proc;
}

//! FE8U = 0x080B327C
void ClassIntroFlare_Init(struct OpInfoFlareProc * proc)
{
    proc->unk_4c = 0;
    proc->unk_4e = 0;

    SetDispEnable(TRUE, TRUE, TRUE, FALSE, TRUE);

    return;
}

//! FE8U = 0x080B32AC
void ClassIntroFlare_Loop(struct OpInfoFlareProc * proc)
{
    int unkA;
    int unkB;
    int unkC;
    int unkD;

    if (proc->unk_4c < 30)
    {
        unkA = Interpolate(INTERPOLATE_RCUBIC, 4, 0x32, proc->unk_4c, 0x1E);
        unkB = Interpolate(INTERPOLATE_RSQUARE, 0, 0x10, proc->unk_4c, 0x1E);
    }
    else
    {
        unkA = Interpolate(INTERPOLATE_LINEAR, 0x32, 100, proc->unk_4c - 0x1E, 0x1E);
        unkB = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->unk_4c - 0x1E, 0x1E);
    }

    if (49 < unkA)
    {
        unkA = 100 - unkA;
    }

    unkC = Interpolate(INTERPOLATE_LINEAR, 0, 0xD6, proc->unk_4c, 0x3C);
    unkD = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x80, proc->unk_4c, 0x3C);

    BgAffinRotScaling(BG_2, (s16)proc->unk_4e, 0, 0, (s16)(unkA * 5 + 0x80), (s16)(unkA * 5 + 0x80));
    BgAffinScaling(BG_2, 0x100, 0x100);
    BgAffinAnchoring(BG_2, unkC, unkD, 0x50, 0x48);

    proc->unk_4e -= 0x40;

    SetBlendAlpha(unkB, 0x10);

    proc->unk_4c++;

    if (59 < proc->unk_4c)
    {
        Proc_Break(proc);
        SetDispEnable(TRUE, TRUE, FALSE, FALSE, TRUE);
    }

    return;
}

extern struct ProcCmd CONST_DATA gProcScr_ClassIntro_BurstFX[];

// clang-format off

struct ProcCmd CONST_DATA gProcScr_ClassIntro_FlareFX[] =
{
    PROC_SLEEP(1),

    PROC_CALL(ClassIntroFlare_Init),

    PROC_START_CHILD(gProcScr_ClassIntro_BurstFX),

    PROC_REPEAT(ClassIntroFlare_Loop),
    PROC_SLEEP(30),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B33E4
void ClassIntroBurst_Init(struct OpInfoBurstProc * proc)
{
    proc->unk_4c = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}

extern u16 CONST_DATA sSprite_08A2F1F0[];

//! FE8U = 0x080B33FC
void PutClassIntroBurstSprites(struct OpInfoBurstProc * proc, int b, int c, int d)
{
    int x = Interpolate(INTERPOLATE_RCUBIC, 0x78, c, proc->unk_4c, 0x46);
    int y = Interpolate(INTERPOLATE_RCUBIC, 0x50, d, proc->unk_4c, 0x46);

    PutSpriteExt(4, ((x - 8) & 0x1FF) | (b << 9), ((y - 8) & 0x1FF) | 0x100, sSprite_08A2F1F0, 0xF000);

    PutSpriteExt(4, ((0xE8 - x) & 0x1FF) | (b << 9), ((0x98 - y) & 0x1FF) | 0x100, sSprite_08A2F1F0, 0xF000);

    return;
}

//! FE8U = 0x080B3498
void ClassIntroBurst_Loop(struct OpInfoBurstProc * proc)
{
    int scale;

    if (proc->unk_64 < 71)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 0x120, 0x10, proc->unk_64, 70);

        SetObjAffine(
            21, Div(+COS(0) << 4, scale), Div(-SIN(0) << 4, scale), Div(+SIN(0) << 4, scale), Div(+COS(0) << 4, scale));

        proc->unk_64++;
    }

    PutClassIntroBurstSprites(proc, 21, 215, 17);

    if (proc->unk_66 < 71)
    {
        scale = Interpolate(INTERPOLATE_LINEAR, 0x120, 0x10, proc->unk_66, 70);

        SetObjAffine(
            22, Div(+COS(0) << 4, scale), Div(-SIN(0) << 4, scale), Div(+SIN(0) << 4, scale), Div(+COS(0) << 4, scale));

        proc->unk_66++;
    }

    PutClassIntroBurstSprites(proc, 22, 192, 32);

    if (proc->unk_68 < 71)
    {
        scale = Interpolate(INTERPOLATE_SQUARE, 0x120, 0x10, proc->unk_68, 70);
        SetObjAffineAuto(23, 0, scale, scale);
        proc->unk_68++;
    }

    PutClassIntroBurstSprites(proc, 23, 169, 47);

    proc->unk_4c++;

    if (proc->unk_68 > 70)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_ClassIntro_BurstFX[] =
{
    PROC_SLEEP(30),

    PROC_CALL(ClassIntroBurst_Init),
    PROC_REPEAT(ClassIntroBurst_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B369C
signed char * sub_80B369C(u8 classId, signed char * buffer)
{
    char * str;

    const struct ClassData * class = GetClassData(classId);

    if (buffer == NULL)
    {
        buffer = GetStringFromIndex(class->nameTextId);
    }
    else
    {
        GetStringFromIndexInBuffer(class->nameTextId, buffer);
    }

    str = strstr(buffer, "Kn.");
    if (str != NULL)
    {
        sprintf(str, "Knight");
    }

    return buffer;
}

//! FE8U = 0x080B36E0
void sub_80B36E0(void)
{
    u16 vcount = (REG_VCOUNT + 1);

    if (vcount < 110)
    {
        REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 2;
        REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 2;
    }
    else
    {
        REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 1;
        REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 1;
    }

    return;
}

//! FE8U = 0x080B3740
void sub_80B3740(void)
{
    SetBlendAlpha(0x10, 0x10);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetWinEnable(TRUE, FALSE, FALSE);
    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(TRUE, TRUE, TRUE, TRUE, TRUE);
    SetWOutLayers(TRUE, FALSE, TRUE, TRUE, TRUE);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    return;
}

ProcPtr StartClassStatsDisplay(ProcPtr);

extern u8 gUnknown_02002038[];
extern u8 gUnknown_02007838[];
extern u8 gUnknown_020078D8[];

extern u8 gUnknown_0200A300[];
extern u8 gUnknown_0200C300[];
extern u8 gUnknown_0200CB00[];

extern struct Text gUnk_OpInfo_0201FB28[6];

extern u8 gUnk_OpInfo_0201DB28[];

const int gUnknown_08205EDC[2][6] =
{
    {
        MSG_4E9, // "HP"
        MSG_4FE, // "Str"
        MSG_4EC, // "Skill"
        MSG_4ED, // "Spd"
        MSG_4EF, // "Def"
        MSG_4F0, // "Res"
    },
    {
        MSG_4E9, // "HP"
        MSG_4FF, // "Mag"
        MSG_4EC, // "Skill"
        MSG_4ED, // "Spd"
        MSG_4EF, // "Def"
        MSG_4F0, // "Res"
    },
};

//! FE8U = 0x080B37FC
void ClassInfoDisplay_Init(struct OpInfoClassDisplayProc * proc)
{
    union
    {
        int hack_4d[2][6][1][1];
        int hack_2d[2][6];
    } hack;
    int i;
    int hasMagicRank;
    int r5;
    u16 * buffer;

    hasMagicRank = 0;

    memcpy(hack.hack_2d, gUnknown_08205EDC, sizeof(hack.hack_2d));

    proc->script = proc->classReelEnt->script;

    for (i = 4; i <= 7; i++)
    {
        if ((GetClassData(proc->classReelEnt->classId)->baseRanks[i]) != 0)
        {
            hasMagicRank = 1;
            break;
        }
    }

    SetupBackgrounds(0);

    proc->unk_2a = 0;
    proc->unk_2c = 0;

    proc->unk_46 = 0xFA;

    BG_Fill(buffer = gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    SetDispEnable(FALSE, FALSE, FALSE, FALSE, FALSE);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetDefaultColorEffects();
    ResetTextFont();
    ResetText();

    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    Decompress(gUnknown_08A30E2C, (void *)(GetBackgroundTileDataOffset(BG_3) + VRAM));
    ApplyPalettes(gUnknown_08A3593C, 7, 8);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A35488, TILEREF(0x0, 7));

    Decompress(gUnknown_08A30800, (void *)(GetBackgroundTileDataOffset(BG_2) + VRAM));
    ApplyPalette(gUiFramePaletteA, 6);

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_08A30978, TILEREF(0x0, 6));

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    BG_Fill(buffer, 0);

    proc->unk_40[0] = GetClassData(proc->classReelEnt->classId)->baseHP;
    proc->unk_40[1] = GetClassData(proc->classReelEnt->classId)->basePow;
    proc->unk_40[2] = GetClassData(proc->classReelEnt->classId)->baseSkl;
    proc->unk_40[3] = GetClassData(proc->classReelEnt->classId)->baseSpd;
    proc->unk_40[4] = GetClassData(proc->classReelEnt->classId)->baseDef;
    proc->unk_40[5] = GetClassData(proc->classReelEnt->classId)->baseRes;

    for (i = 0; i <= 5; i++)
    {
        InitText(&gUnk_OpInfo_0201FB28[i], 3);

        ClearText(&gUnk_OpInfo_0201FB28[i]);

        Text_SetColor(&gUnk_OpInfo_0201FB28[i], TEXT_COLOR_SYSTEM_GOLD);
        Text_SetCursor(&gUnk_OpInfo_0201FB28[i], 0);

        if (hasMagicRank != 0)
        {
            Text_DrawString(&gUnk_OpInfo_0201FB28[i], GetStringFromIndex(hack.hack_2d[1][i]));
        }
        else
        {
            Text_DrawString(&gUnk_OpInfo_0201FB28[i], GetStringFromIndex(hack.hack_4d[0][i][1][-1]));
        }

        PutText(&gUnk_OpInfo_0201FB28[i], buffer + 0x21 + (i * 0x40));

        PutNumber(buffer + 0x25 + (i * 0x40), TEXT_COLOR_SYSTEM_WHITE, proc->unk_40[i]);
    }

    r5 = 0;

    proc->unk_3c = StartClassStatsDisplay(proc);

    InitTalk(0x100, 2, 0);

    SetInitTalkTextFont();
    ClearTalkText();
    EndTalk();

    StartTalkMsg(2, 15, proc->classReelEnt->descTextId);

    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);
    SetTalkFlag(TALK_FLAG_NOFAST);
    SetTalkFlag(TALK_FLAG_SILENT);

    SetTalkPrintDelay(4);

    gOpInfoData.charPalId = proc->classReelEnt->paletteId;
    gOpInfoData.xPos = 260;
    gOpInfoData.yPos = 88;
    gOpInfoData.animId = proc->classReelEnt->banimId;
    gOpInfoData.roundType = 6;
    gOpInfoData.genericPalId = proc->classReelEnt->unk_06;
    gOpInfoData.state2 = 1;
    gOpInfoData.oam2Tile = 0x180;
    gOpInfoData.oam2Pal = 2;
    gOpInfoData.pImgSheetBuf = &gEkrBg0QuakeVec;
    gOpInfoData.unk_24 = gUnknown_02002038;
    gOpInfoData.unk_20 = gUnknown_02007838;
    gOpInfoData.unk_28 = gUnknown_020078D8;

    gOpInfoData.unk_30 = &gUnknown_0200A2D8;

    gUnknown_0200A2D8.magicFuncIdx = proc->classReelEnt->magicFx;
    gUnknown_0200A2D8.xOffsetBg = proc->classReelEnt->unk_09;
    gUnknown_0200A2D8.yOffsetBg = proc->classReelEnt->unk_0A;
    gUnknown_0200A2D8.xOffsetObj = proc->classReelEnt->unk_0B;
    gUnknown_0200A2D8.yOffsetObj = proc->classReelEnt->unk_0C;
    gUnknown_0200A2D8.objChr = 0x280;
    gUnknown_0200A2D8.objPalId = 0xF;
    gUnknown_0200A2D8.bgChr = 0x200;
    gUnknown_0200A2D8.bgPalId = 0xF;
    gUnknown_0200A2D8.bg = 1;
    gUnknown_0200A2D8.bgTmBuf = gBG1TilemapBuffer;
    gUnknown_0200A2D8.bgImgBuf = gUnknown_0200A300;
    gUnknown_0200A2D8.bgTsaBuf = gUnknown_0200C300;
    gUnknown_0200A2D8.objImgBuf = gUnknown_0200CB00;
    gUnknown_0200A2D8.resetCallback = sub_80B3740;

    NewEkrUnitMainMini(&gOpInfoData);

    gUnk_Opinfo_0201DB00.terrain_l = proc->classReelEnt->unk_0D;
    gUnk_Opinfo_0201DB00.pal_l = 10;
    gUnk_Opinfo_0201DB00.chr_l = 0x380;
    gUnk_Opinfo_0201DB00.terrain_r = proc->classReelEnt->unk_0E;
    gUnk_Opinfo_0201DB00.pal_r = 11;
    gUnk_Opinfo_0201DB00.chr_r = 0x3C0;
    gUnk_Opinfo_0201DB00.distance = r5;
    gUnk_Opinfo_0201DB00.unk0E = -1;

    gUnk_Opinfo_0201DB00.unk1C = OBJ_CHR_ADDR(0x0);
    gUnk_Opinfo_0201DB00.unk20 = &gUnk_OpInfo_0201DB28;

    sub_805AA68(&gUnk_Opinfo_0201DB00);
    sub_805AE40(&gUnk_Opinfo_0201DB00, 0xD0, 0x68, 0x130, 0x68);

    SetPrimaryHBlankHandler(sub_80B36E0);

    return;
}

//! FE8U = 0x080B3C14
void sub_80B3C14(struct OpInfoClassDisplayProc * proc)
{
    if (proc->unk_2c == 400)
    {
        if (sub_80B2988() != 0)
        {
            Sound_FadeOutBGM(60);
            Proc_Goto(proc, 7);
        }
        else
        {
            Proc_Goto(proc, 4);
        }
    }

    proc->unk_2c++;

    return;
}

//! FE8U = 0x080B3C50
void ClassInfoDisplay_LoopWindowIn(struct OpInfoClassDisplayProc * proc)
{
    int unk;

    u8 * ptr = &proc->unk_46;

    unk = ~((80 - proc->unk_2a) / 14);

    proc->unk_46 = unk + *ptr;

    if (proc->unk_46 < 180)
    {
        proc->unk_46 = 180;
    }

    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 80 - proc->unk_2a, 240, proc->unk_2a + 80);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    if (proc->unk_2a == 80)
    {
        proc->unk_46 = 180;
        proc->unk_2a = 0;

        Proc_Break(proc);

        StartParallelWorker(sub_80B3C14, proc);
    }
    else
    {
        proc->unk_2a += 4;
    }

    sub_805A940(&gOpInfoData, proc->unk_46, 88);
    sub_805AE40(&gUnk_Opinfo_0201DB00, proc->unk_46 - 48, 104, proc->unk_46 + 48, 104);

    sub_80B40E4(proc->unk_3c, 100);

    return;
}

//! FE8U = 0x080B3D84
void ClassInfoDisplay_ExecScript(struct OpInfoClassDisplayProc * proc)
{
    switch (proc->script->opCode)
    {
        case CLASS_REEL_OP_END:
            Proc_Goto(proc, 10);

            break;

        case CLASS_REEL_OP_HIT_CLOSE:
            gOpInfoData.roundType = ANIM_ROUND_HIT_CLOSE;
            sub_805A7B4(&gOpInfoData);

            break;

        case CLASS_REEL_OP_CRIT_CLOSE:
            gOpInfoData.roundType = ANIM_ROUND_CRIT_CLOSE;
            sub_805A7B4(&gOpInfoData);

            break;

        case CLASS_REEL_OP_RETURN_TO_STANDING:
        case CLASS_REEL_OP_RETURN_TO_STANDING_ALT:
            sub_805A990(&gOpInfoData);

            break;

        case CLASS_REEL_OP_HIT_FAR:
            gOpInfoData.roundType = ANIM_ROUND_NONCRIT_FAR;
            sub_805A7B4(&gOpInfoData);

            break;

        case CLASS_REEL_OP_DODGE:
            gOpInfoData.roundType = ANIM_ROUND_TAKING_MISS_CLOSE;
            sub_805A7B4(&gOpInfoData);

            break;

        case CLASS_REEL_OP_WAIT_FRAMES:
        case CLASS_REEL_OP_ROUND_END:
            break;
    }

    proc->unk_2a = 0;

    return;
}

//! FE8U = 0x080B3E18
void ClassInfoDisplay_LoopScript(struct OpInfoClassDisplayProc * proc)
{
    switch (proc->script->opCode)
    {
        case CLASS_REEL_OP_HIT_CLOSE:
        case CLASS_REEL_OP_CRIT_CLOSE:
        case CLASS_REEL_OP_RETURN_TO_STANDING:
        case CLASS_REEL_OP_HIT_FAR:
        case CLASS_REEL_OP_DODGE:
        case CLASS_REEL_OP_RETURN_TO_STANDING_ALT:
            proc->script++;
            Proc_Break(proc);

            break;

        case CLASS_REEL_OP_WAIT_FRAMES:
            proc->unk_2a++;

            if (proc->unk_2a < proc->script->extra)
            {
                return;
            }

            proc->script++;
            Proc_Break(proc);

            break;

        case CLASS_REEL_OP_ROUND_END:
            if (sub_805A96C(&gOpInfoData) != 0)
            {
                proc->script++;
                Proc_Break(proc);
            }
    }

    return;
}

//! FE8U = 0x080B3E9C
void ClassInfoDisplay_OnEnd(struct OpInfoClassDisplayProc * proc)
{
    SetPrimaryHBlankHandler(NULL);

    EndTalk();
    EndActiveClassReelBgColorProc();
    sub_805AE14(&gUnk_Opinfo_0201DB00);
    EndActiveClassReelSpell();
    sub_805AA28(&gOpInfoData);

    if (proc->unk_3c != 0)
    {
        Proc_End(proc->unk_3c);
    }

    SetClassReelMode(2);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_ClassInfoDisplay[] =
{
    PROC_YIELD,

    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(ClassInfoDisplay_Init),
    PROC_SET_END_CB(ClassInfoDisplay_OnEnd),

    PROC_SLEEP(2),

    PROC_REPEAT(ClassInfoDisplay_LoopWindowIn),

PROC_LABEL(9),
    PROC_CALL(ClassInfoDisplay_ExecScript),
    PROC_REPEAT(ClassInfoDisplay_LoopScript),

    PROC_GOTO(9),

PROC_LABEL(10),
    PROC_BLOCK,

PROC_LABEL(4),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_GOTO(8),

PROC_LABEL(7),
    PROC_CALL_ARG(NewFadeOut, 2),
    PROC_WHILE(FadeOutExists),

PROC_LABEL(8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080B3EDC
ProcPtr StartClassAnimDisplay(ProcPtr parent, struct ClassReelEnt * entry)
{
    struct OpInfoClassDisplayProc * proc = Proc_Start(gProcScr_ClassInfoDisplay, parent);

    proc->unk_30 = parent;
    proc->classReelEnt = entry;
    proc->unk_3c = 0;

    return proc;
}

//! FE8U = 0x080B3EFC
void ClassStatsDisplay_Init(struct OpInfoGaugeDrawProc * proc)
{
    struct ClassDisplayFont * res;
    int i;

    signed char buffer[32];

    proc->unk_30 = proc->proc_parent;
    proc->unk_2a = 0;
    proc->unk_34 = 0;
    proc->unk_35 = 100;

    sub_80B369C(proc->unk_30->classReelEnt->classId, buffer);

    for (i = 0; buffer[i] != 0;)
    {
        res = GetClassDisplayFontInfo(buffer[i]);

        if (res != 0)
        {
            proc->unk_34 += res->width - res->xBase;
        }
        else
        {
            proc->unk_34 += 4;
        }

        i++;

        if ((int)(buffer + i) > (int)(buffer + 13))
        {
            break;
        }
    }

    Decompress(gUnknown_08A36338, OBJ_CHR_ADDR(0x0));

    ApplyPalettes(gUnknown_08A372C0, 0x14, 2);

    return;
}

extern u16 * CONST_DATA sSpriteLut_GaugePips[];

//! FE8U = 0x080B3F90
void ClassStatsDisplay_Loop(struct OpInfoGaugeDrawProc * proc)
{
    signed char buffer[32];

    u8 value;
    int i;
    int x;

    for (i = 0; i < 6; i++)
    {
        value = proc->unk_30->unk_40[i];

        if (value >= 30)
        {
            value = 30;
        }

        for (x = 0; (x < (value >> 2)); x++)
        {
            PutSpriteExt(13, (x * 8) + 48, (i * 16) + 16, sSpriteLut_GaugePips[3], 0x4000);
        }

        if ((value & 3) != 0)
        {
            PutSpriteExt(13, (x * 8) + 48, (i * 16) + 16, sSpriteLut_GaugePips[(value & 3) - 1], 0x4000);
        }
    }

    x = ((120 - proc->unk_34) / 2) + proc->unk_35;

    sub_80B369C(proc->unk_30->classReelEnt->classId, buffer);

    for (i = 0; (buffer[i] != 0);)
    {
        struct ClassDisplayFont * res = GetClassDisplayFontInfo(buffer[i]);

        if (res != 0)
        {

            if (res->a != 0)
            {
                PutSpriteExt(4, x - res->xBase - 2, 5 - res->yBase, res->a, 0x4000);

                x += (res->width - res->xBase);
            }
        }
        else
        {
            x += 4;
        }

        i++;

        if (i > 13)
        {
            break;
        }
    }

    if (proc->unk_2a < 255)
    {
        proc->unk_2a++;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_opinfogaugedraw[] =
{
    PROC_NAME("opinfogaugedraw"),

    PROC_SLEEP(3),

    PROC_CALL(ClassStatsDisplay_Init),
    PROC_REPEAT(ClassStatsDisplay_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B40D0
ProcPtr StartClassStatsDisplay(ProcPtr proc)
{
    return Proc_Start(gProcScr_opinfogaugedraw, proc);
}

//! FE8U = 0x080B40E4
void sub_80B40E4(ProcPtr proc, int unk)
{
    ((struct OpInfoGaugeDrawProc *)(proc))->unk_35 = unk;
    return;
}
// clang-format off


u16 CONST_DATA sSprite_08A2F160[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13F) + OAM2_LAYER(2),
};

u16 CONST_DATA sSprite_08A2F168[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13E) + OAM2_LAYER(2),
};

u16 CONST_DATA sSprite_08A2F170[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13D) + OAM2_LAYER(2),
};

u16 CONST_DATA sSprite_08A2F178[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13C) + OAM2_LAYER(2),
};

u16* CONST_DATA sSpriteLut_GaugePips[] = {
    sSprite_08A2F160,
    sSprite_08A2F168,
    sSprite_08A2F170,
    sSprite_08A2F178,
};

u16 CONST_DATA sSprite_08A2F190[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x300) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F198[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x304) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F1A0[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x308) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F1A8[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x30C) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F1B0[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x310) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F1B8[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x314) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F1C0[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x318) + OAM2_LAYER(1),
};

u16 CONST_DATA sSprite_08A2F1C8[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x31C) + OAM2_LAYER(1),
};

u16* CONST_DATA sSpriteLut_08A2F1D0[] =
{
    sSprite_08A2F190,
    sSprite_08A2F198,
    sSprite_08A2F1A0,
    sSprite_08A2F1A8,
    sSprite_08A2F1B0,
    sSprite_08A2F1B8,
    sSprite_08A2F1C0,
    sSprite_08A2F1C8,
};

u16 CONST_DATA sSprite_08A2F1F0[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x380) + OAM2_LAYER(1),
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_CloseDoubleHit[] =
{
    CR_WAIT(30),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_WAIT(80),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Sniper[] =
{
    CR_WAIT(40),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_WAIT(100),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_CloseSingleHit[] =
{
    CR_WAIT(40),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(90),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Ranger[] =
{
    CR_WAIT(60),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(70),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Assassin[] =
{
    CR_WAIT(60),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_AnimaDoubleCast[] =
{
    CR_WAIT(40),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_WAIT(72),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Pupil[] =
{
    CR_WAIT(40),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_MagicSingleCast[] =
{
    CR_WAIT(80),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(90),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_StaffSingleCast[] =
{
    CR_WAIT(80),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(90),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Dancer[] =
{
    CR_WAIT(80),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(100),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Manakete[] =
{
    CR_WAIT(120),
    CR_ANIM_ROUND_HIT_CLOSE,
    CR_WAIT_ROUND_END,
    CR_WAIT(40),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_DarkMagicSingleCast[] =
{
    CR_WAIT(40),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(170),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Mogall[] = {
    CR_WAIT(60),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(96),
    CR_RETURN_TO_STANDING,
    CR_END,
};

struct ClassReelAnimScr CONST_DATA ClassReelScr_Gorgon[] =
{
    CR_WAIT(40),
    CR_ANIM_ROUND_NONCRIT_FAR,
    CR_WAIT_ROUND_END,
    CR_WAIT(200),
    CR_RETURN_TO_STANDING,
    CR_END,
    CR_END,
};

u8 * CONST_DATA gUnknown_08A2F2C0[] =
{
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A39148,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A38C68,
    (u8*) 0x08A38CA0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A37320,
    (u8*) 0x08A373A0,
    (u8*) 0x08A37430,
    (u8*) 0x08A374A4,
    (u8*) 0x08A37524,
    (u8*) 0x08A375B0,
    (u8*) 0x08A37634,
    (u8*) 0x08A376C4,
    (u8*) 0x08A3773C,
    (u8*) 0x08A377AC,
    (u8*) 0x08A3782C,
    (u8*) 0x08A378BC,
    (u8*) 0x08A3792C,
    (u8*) 0x08A379CC,
    (u8*) 0x08A37A68,
    (u8*) 0x08A37AE8,
    (u8*) 0x08A37B5C,
    (u8*) 0x08A37BEC,
    (u8*) 0x08A37C70,
    (u8*) 0x08A37CF4,
    (u8*) 0x08A37D74,
    (u8*) 0x08A37E08,
    (u8*) 0x08A37E80,
    (u8*) 0x08A37F1C,
    (u8*) 0x08A37FAC,
    (u8*) 0x08A3802C,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A380B0,
    (u8*) 0x08A38128,
    (u8*) 0x08A381A8,
    (u8*) 0x08A3820C,
    (u8*) 0x08A38288,
    (u8*) 0x08A382F4,
    (u8*) 0x08A38368,
    (u8*) 0x08A383F0,
    (u8*) 0x08A38468,
    (u8*) 0x08A384D0,
    (u8*) 0x08A38548,
    (u8*) 0x08A385CC,
    (u8*) 0x08A38644,
    (u8*) 0x08A386C8,
    (u8*) 0x08A3872C,
    (u8*) 0x08A38794,
    (u8*) 0x08A38814,
    (u8*) 0x08A38890,
    (u8*) 0x08A388F4,
    (u8*) 0x08A38964,
    (u8*) 0x08A389CC,
    (u8*) 0x08A38A40,
    (u8*) 0x08A38AA8,
    (u8*) 0x08A38B20,
    (u8*) 0x08A38B90,
    (u8*) 0x08A38C04,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A38CD0,
    NULL,
    NULL,
    (u8*) 0x08A38D58,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A38DE0,
    (u8*) 0x08A38E60,
    NULL,
    NULL,
    (u8*) 0x08A38EE8,
    (u8*) 0x08A38F54,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A38FCC,
    NULL,
    NULL,
    (u8*) 0x08A39048,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    (u8*) 0x08A390C4,
    NULL,
    NULL,
    NULL,
};

struct ClassReelEnt CONST_DATA gClassReelData[65] =
{
    [0x00] = { MSG_6F6, 0xFF, CLASS_EIRIKA_LORD, 0, 0x02, 0, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_CloseDoubleHit },
    [0x01] = { MSG_6FA, 0x3B, CLASS_PALADIN, 0, 0x3A, 0, 0, 0, 0, 0, 0x0B, 0x12, 0, ClassReelScr_CloseSingleHit },
    [0x02] = { MSG_6FB, 0x02, CLASS_ARMOR_KNIGHT, 0, 0x3F, 0, 0, 0, 0, 0, 0x02, 0x02, 0, ClassReelScr_CloseSingleHit },
    [0x03] = { MSG_6F9, 0xFF, CLASS_CAVALIER, 0, 0x33, 0, 0, 0, 0, 0, 0x11, 0, 0, ClassReelScr_CloseDoubleHit },
    [0x04] = { MSG_71C, 0x3F, CLASS_PEGASUS_KNIGHT, 0, 0x65, 0, 0, 0, 0, 0, 0x19, 0x19, 0, ClassReelScr_CloseDoubleHit },
    [0x05] = { MSG_71A, 0x44, CLASS_PRIEST, 0, 0x7E, 0x03, 0, 0, 0, 0, 0x0B, 0x12, 0, ClassReelScr_StaffSingleCast },
    [0x06] = { MSG_70E, 0xFF, CLASS_JOURNEYMAN, 0, 0x91, 0, 0, 0, 0, 0, 0x11, 0, 0, ClassReelScr_CloseDoubleHit },
    [0x07] = { MSG_711, 0x1D, CLASS_FIGHTER, 0, 0x18, 0, 0, 0, 0, 0, 0, 0, 0, ClassReelScr_CloseDoubleHit },
    [0x08] = { MSG_6FD, 0x5D, CLASS_THIEF, 0, 0x88, 0, 0, 0, 0, 0, 0x1C, 0x1C, 0, ClassReelScr_CloseDoubleHit },
    [0x09] = { MSG_703, 0, CLASS_ARCHER, 0, 0x27, 0, 0, 0, 0, 0, 0x13, 0x13, 0, ClassReelScr_CloseDoubleHit },
    [0x0A] = { MSG_709, 0x2E, CLASS_MAGE_F, 0, 0x6B, 0x01, 0, 0, 0, 0, 0x19, 0x19, 0, ClassReelScr_AnimaDoubleCast },
    [0x0B] = { MSG_719, 0x36, CLASS_MONK, 0, 0x7C, 0x04, 0, 0, 0, 0, 0, 0, 0, ClassReelScr_MagicSingleCast },
    [0x0C] = { MSG_725, 0xFF, CLASS_REVENANT, 0x01, 0x9F, 0, 0, 0, 0, 0, 0, 0, 0, ClassReelScr_CloseSingleHit },
    [0x0D] = { MSG_726, 0xFF, CLASS_ENTOUMBED, 0x01, 0xA0, 0, 0, 0, 0, 0, 0x13, 0x13, 0, ClassReelScr_CloseSingleHit },
    [0x0E] = { MSG_727, 0xFF, CLASS_BONEWALKER, 0x01, 0xA1, 0, 0, 0, 0, 0, 0x0E, 0x0F, 0, ClassReelScr_CloseSingleHit },
    [0x0F] = { MSG_730, 0xFF, CLASS_MOGALL, 0x01, 0xB9, 0x07, 0, 0, 0, 0, 0x19, 0x19, 0, ClassReelScr_Mogall },
    [0x10] = { MSG_729, 0xFF, CLASS_BAEL, 0x01, 0xAB, 0, 0, 0, 0, 0, 0x04, 0x04, 0, ClassReelScr_CloseSingleHit },
    [0x11] = { MSG_700, 0x37, CLASS_MYRMIDON, 0, 0x10, 0, 0, 0, 0, 0, 0x0B, 0x18, 0, ClassReelScr_CloseDoubleHit },
    [0x12] = { MSG_71E, 0x42, CLASS_CLERIC, 0, 0x7F, 0x03, 0, 0, 0, 0, 0x0B, 0x12, 0, ClassReelScr_StaffSingleCast },
    [0x13] = { MSG_6F5, 0xFF, CLASS_EPHRAIM_LORD, 0, 0, 0, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_CloseDoubleHit },
    [0x14] = { MSG_723, 0xFF, CLASS_PIRATE, 0x01, 0x99, 0, 0, 0, 0, 0, 0x0C, 0x0C, 0, ClassReelScr_CloseDoubleHit },
    [0x15] = { MSG_713, 0xFF, CLASS_BRIGAND, 0x01, 0x1F, 0, 0, 0, 0, 0, 0x16, 0x16, 0, ClassReelScr_CloseDoubleHit },
    [0x16] = { MSG_716, 0xFF, CLASS_SHAMAN, 0x01, 0x74, 0x05, 0, 0, 0, 0, 0x15, 0x15, 0, ClassReelScr_DarkMagicSingleCast },
    [0x17] = { MSG_704, 0x51, CLASS_SNIPER, 0, 0x29, 0, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_Sniper },
    [0x18] = { MSG_6FE, 0x30, CLASS_MERCENARY, 0, 0x0A, 0, 0, 0, 0, 0, 0x01, 0x01, 0, ClassReelScr_CloseDoubleHit },
    [0x19] = { MSG_721, 0x14, CLASS_DANCER, 0, 0x90, 0, 0, 0, 0, 0, 0x0E, 0x0E, 0, ClassReelScr_Dancer },
    [0x1A] = { MSG_70F, 0xFF, CLASS_PUPIL, 0, 0x94, 0x01, 0, 0, 0, 0, 0x19, 0x19, 0, ClassReelScr_Pupil },
    [0x1B] = { MSG_700, 0xFF, CLASS_MYRMIDON_F, 0, 0x12, 0, 0, 0, 0, 0, 0x0B, 0x12, 0, ClassReelScr_CloseDoubleHit },
    [0x1C] = { MSG_71B, 0xFF, CLASS_RECRUIT, 0, 0x95, 0, 0, 0, 0, 0, 0, 0, 0, ClassReelScr_CloseDoubleHit },
    [0x1D] = { MSG_733, 0xFF, CLASS_GARGOYLE, 0x01, 0xBC, 0, 0, 0, 0, 0, 0x16, 0x16, 0, ClassReelScr_CloseSingleHit },
    [0x1E] = { MSG_72F, 0xFF, CLASS_MAELDUIN, 0x01, 0xB5, 0, 0, 0, 0, 0, 0x01, 0x01, 0, ClassReelScr_CloseDoubleHit },
    [0x1F] = { MSG_72B, 0xFF, CLASS_CYCLOPS, 0x01, 0xAD, 0, 0, 0, 0, 0, 0x04, 0x04, 0, ClassReelScr_CloseDoubleHit },
    [0x20] = { MSG_72C, 0xFF, CLASS_MAUTHEDOOG, 0x01, 0xB0, 0, 0, 0, 0, 0, 0x13, 0x13, 0, ClassReelScr_CloseDoubleHit },
    [0x21] = { MSG_728, 0xFF, CLASS_WIGHT, 0x01, 0xA6, 0, 0, 0, 0, 0, 0x0E, 0x0F, 0, ClassReelScr_CloseSingleHit },
    [0x22] = { MSG_71F, 0x61, CLASS_TROUBADOUR, 0, 0x85, 0x03, 0, 0, 0, 0, 0, 0x11, 0, ClassReelScr_StaffSingleCast },
    [0x23] = { MSG_714, 0x12, CLASS_BERSERKER, 0, 0x22, 0, 0, 0, 0, 0, 0x10, 0x10, 0, ClassReelScr_CloseDoubleHit },
    [0x24] = { MSG_710, 0x45, CLASS_ROGUE, 0, 0x8E, 0, 0, 0, 0, 0, 0x1C, 0x1C, 0, ClassReelScr_CloseSingleHit },
    [0x25] = { MSG_70A, 0x4B, CLASS_SAGE, 0, 0x6C, 0x01, 0, 0, 0, 0, 0x19, 0x19, 0, ClassReelScr_AnimaDoubleCast },
    [0x26] = { MSG_715, 0x2C, CLASS_GREAT_KNIGHT, 0, 0x4F, 0, 0, 0, 0, 0, 0x0B, 0x12, 0, ClassReelScr_CloseSingleHit },
    [0x27] = { MSG_6F8, 0xFF, CLASS_EIRIKA_MASTER_LORD, 0, 0x07, 0, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_CloseSingleHit },
    [0x28] = { MSG_705, 0xFF, CLASS_RANGER, 0x01, 0x2E, 0, 0, 0, 0, 0, 0x13, 0x13, 0, ClassReelScr_Ranger },
    [0x29] = { MSG_712, 0xFF, CLASS_WARRIOR, 0x01, 0x1B, 0, 0, 0, 0, 0, 0x13, 0x13, 0, ClassReelScr_CloseDoubleHit },
    [0x2A] = { MSG_702, 0xFF, CLASS_ASSASSIN, 0x01, 0x8A, 0, 0, 0, 0, 0, 0x1D, 0x1D, 0, ClassReelScr_Assassin },
    [0x2B] = { MSG_70B, 0x35, CLASS_MAGE_KNIGHT_F, 0, 0x70, 0x02, 0, 0, 0, 0, 0x11, 0, 0, ClassReelScr_MagicSingleCast },
    [0x2C] = { MSG_6F7, 0xFF, CLASS_EPHRAIM_MASTER_LORD, 0, 0x04, 0, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_CloseSingleHit },
    [0x2D] = { MSG_720, 0xFF, CLASS_VALKYRIE, 0, 0x86, 0x04, 0, 0, 0, 0, 0x11, 0, 0, ClassReelScr_MagicSingleCast },
    [0x2E] = { MSG_717, 0xFF, CLASS_DRUID, 0x01, 0x76, 0x05, 0, 0, 0, 0, 0x15, 0x15, 0, ClassReelScr_DarkMagicSingleCast },
    [0x2F] = { MSG_6FC, 0xFF, CLASS_GENERAL, 0x01, 0x44, 0, 0, 0, 0, 0, 0x02, 0x02, 0, ClassReelScr_CloseSingleHit },
    [0x30] = { MSG_701, 0xFF, CLASS_SWORDMASTER, 0, 0x14, 0, 0, 0, 0, 0, 0x09, 0x09, 0, ClassReelScr_CloseSingleHit },
    [0x31] = { MSG_708, 0x68, CLASS_WYVERN_KNIGHT, 0, 0x61, 0, 0, 0, 0, 0, 0x16, 0x16, 0, ClassReelScr_CloseSingleHit },
    [0x32] = { MSG_70C, 0x0D, CLASS_BISHOP, 0, 0x81, 0x04, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_MagicSingleCast },
    [0x33] = { MSG_707, 0x17, CLASS_WYVERN_LORD, 0, 0x5C, 0, 0, 0, 0, 0, 0x16, 0x16, 0, ClassReelScr_CloseSingleHit },
    [0x34] = { MSG_6FF, 0x6B, CLASS_HERO, 0, 0x0D, 0, 0, 0, 0, 0, 0x17, 0x17, 0, ClassReelScr_CloseDoubleHit },
    [0x35] = { MSG_71D, 0x1C, CLASS_FALCON_KNIGHT, 0, 0x67, 0, 0, 0, 0, 0, 0x0D, 0x0D, 0, ClassReelScr_CloseSingleHit },
    [0x36] = { MSG_72A, 0xFF, CLASS_ELDER_BAEL, 0x01, 0xAC, 0, 0, 0, 0, 0, 0x04, 0x04, 0, ClassReelScr_CloseSingleHit },
    [0x37] = { MSG_72E, 0xFF, CLASS_TARVOS, 0x01, 0xB2, 0, 0, 0, 0, 0, 0x01, 0x01, 0, ClassReelScr_CloseDoubleHit },
    [0x38] = { MSG_734, 0xFF, CLASS_DEATHGOYLE, 0x01, 0xBE, 0, 0, 0, 0, 0, 0x16, 0x16, 0, ClassReelScr_CloseSingleHit },
    [0x39] = { MSG_72D, 0xFF, CLASS_GWYLLGI, 0x01, 0xB1, 0, 0, 0, 0, 0, 0x13, 0x13, 0, ClassReelScr_CloseDoubleHit },
    [0x3A] = { MSG_732, 0xFF, CLASS_GORGON, 0x01, 0xBB, 0x08, 0, 0, 0, 0, 0x01, 0x01, 0, ClassReelScr_Gorgon },
    [0x3B] = { MSG_724, 0xFF, CLASS_NECROMANCER, 0x01, 0x9C, 0x02, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_MagicSingleCast },
    [0x3C] = { MSG_718, 0x4F, CLASS_SUMMONER, 0x01, 0x7A, 0x05, 0, 0, 0, 0, 0x15, 0x15, 0, ClassReelScr_DarkMagicSingleCast },
    [0x3D] = { MSG_70D, 0xFF, CLASS_MANAKETE_MYRRH, 0, 0xC4, 0x06, 0, 0, 0, 0, 0x10, 0x10, 0, ClassReelScr_Manakete },
    [0x3E] = { MSG_731, 0xFF, CLASS_ARCH_MOGALL, 0x01, 0xBA, 0x07, 0, 0, 0, 0, 0x06, 0x06, 0, ClassReelScr_Mogall },
    [0x3F] = { MSG_706, 0x15, CLASS_WYVERN_RIDER, 0, 0x57, 0, 0, 0, 0, 0, 0x04, 0x04, 0, ClassReelScr_CloseDoubleHit },
    [0x40] = { MSG_722, 0xFF, CLASS_SOLDIER, 0x01, 0x97, 0, 0, 0, 0, 0, 0x14, 0x14, 0, ClassReelScr_CloseDoubleHit }
};

u8 CONST_DATA sClassReelClassSetLut[] =
{
    [0x0] = 0x35,
    [0x1] = 0x2F,
    [0x2] = 0x29,
    [0x3] = 0x23,
    [0x4] = 0x1D,
    [0x5] = 0x18,
    [0x6] = 0x12,
    [0x7] = 0x0C,
    [0x8] = 0x06,
    [0x9] = 0,
    [0xA] = 0,
    [0xB] = 0
};

struct ClassReelEnt * CONST_DATA gClassReelOrderedLut[] =
{
    // Class Set 9
    [0x00] = &gClassReelData[0x27],
    [0x01] = &gClassReelData[0x3B],
    [0x02] = &gClassReelData[0x1C],
    [0x03] = &gClassReelData[0x3C],
    [0x04] = &gClassReelData[0x3D],
    [0x05] = &gClassReelData[0x2C],

    // Class Set 8
    [0x06] = &gClassReelData[0x36],
    [0x07] = &gClassReelData[0x37],
    [0x08] = &gClassReelData[0x38],
    [0x09] = &gClassReelData[0x39],
    [0x0A] = &gClassReelData[0x3A],
    [0x0B] = &gClassReelData[0x3E],

    // Class Set 7
    [0x0C] = &gClassReelData[0x31],
    [0x0D] = &gClassReelData[0x32],
    [0x0E] = &gClassReelData[0x33],
    [0x0F] = &gClassReelData[0x34],
    [0x10] = &gClassReelData[0x35],
    [0x11] = &gClassReelData[0x2D],

    // Class Set 6
    [0x12] = &gClassReelData[0x28],
    [0x13] = &gClassReelData[0x2A],
    [0x14] = &gClassReelData[0x2B],
    [0x15] = &gClassReelData[0x2F],
    [0x16] = &gClassReelData[0x30],
    [0x17] = &gClassReelData[0x2E],

    // Class Set 5
    [0x18] = &gClassReelData[0x1E],
    [0x19] = &gClassReelData[0x1F],
    [0x1A] = &gClassReelData[0x20],
    [0x1B] = &gClassReelData[0x21],
    [0x1C] = &gClassReelData[0x0D],

    // Class Set 4
    [0x1D] = &gClassReelData[0x17],
    [0x1E] = &gClassReelData[0x18],
    [0x1F] = &gClassReelData[0x19],
    [0x20] = &gClassReelData[0x1A],
    [0x21] = &gClassReelData[0x40],
    [0x22] = &gClassReelData[0x26],

    // Class Set 3
    [0x23] = &gClassReelData[0x22],
    [0x24] = &gClassReelData[0x23],
    [0x25] = &gClassReelData[0x24],
    [0x26] = &gClassReelData[0x25],
    [0x27] = &gClassReelData[0x29],
    [0x28] = &gClassReelData[0x3F],

    // Class Set 2
    [0x29] = &gClassReelData[0x11],
    [0x2A] = &gClassReelData[0x12],
    [0x2B] = &gClassReelData[0x13],
    [0x2C] = &gClassReelData[0x14],
    [0x2D] = &gClassReelData[0x15],
    [0x2E] = &gClassReelData[0x16],

    // Class Set 1
    [0x2F] = &gClassReelData[0x06],
    [0x30] = &gClassReelData[0x07],
    [0x31] = &gClassReelData[0x08],
    [0x32] = &gClassReelData[0x09],
    [0x33] = &gClassReelData[0x0A],
    [0x34] = &gClassReelData[0x0B],

    // Class Set 0
    [0x35] = &gClassReelData[0x00],
    [0x36] = &gClassReelData[0x01],
    [0x37] = &gClassReelData[0x02],
    [0x38] = &gClassReelData[0x03],
    [0x39] = &gClassReelData[0x04],
    [0x3A] = &gClassReelData[0x05],
    [0x3B] = &gClassReelData[0x0C],
    [0x3C] = &gClassReelData[0x0E],
    [0x3D] = &gClassReelData[0x0F],
    [0x3E] = &gClassReelData[0x10],
    [0x3F] = &gClassReelData[0x1D],

    NULL,
};

// clang-format on

//! FE8U = 0x080B40EC
struct ClassReelEnt * GetClassReelEntry(int classSet, int index)
{
    return gClassReelOrderedLut[sClassReelClassSetLut[classSet] + index];
}
