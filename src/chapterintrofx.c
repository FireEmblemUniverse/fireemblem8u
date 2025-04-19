#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_Bg3Scroll[] = {
    PROC_REPEAT(ChapterIntro_Bg3Scroll_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_KeyListen[] = {
    PROC_CALL(ChapterIntro_KeyListen_Init),
    PROC_REPEAT(ChapterIntro_KeyListen_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_0859B108[] = {
    PROC_CALL(ChapterIntro_801FFD0),
    PROC_REPEAT(ChapterIntro_801FFD8_Loop),

    PROC_END,
};

u8 CONST_DATA gUnknown_0859B120[] = {
    208, 208,
    204, 192,
    160, 128,
    96, 64,
    36, 32,
    48, 72,
    96, 120,
    136, 136,
    120, 0,
};

u8 CONST_DATA gUnknown_0859B132[] = {
    160, 128,
    96, 64,
    40, 32,
    36, 44,
    72, 104,
    136, 152,
    156, 144,
    120, 96,
    80, 0,
};

u16 CONST_DATA gUnknown_0859B144[] = {
    4,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(112) + OAM1_HFLIP, OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(176) + OAM1_HFLIP, OAM2_LAYER(1),
};

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_0859B160[] = {
    PROC_SLEEP(30),
    PROC_START_CHILD(sProcScr_ChapterIntro_0859B198),
    PROC_REPEAT(ChapterIntro_80207C8),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_LightBurst[] = {
    PROC_CALL(ChapterIntro_LightBurst_Init),
    PROC_REPEAT(ChapterIntro_LightBurst_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_0859B198[] = {
    PROC_CALL(ChapterIntro_BeginCloseTextMaybe),
    PROC_REPEAT(ChapterIntro_LoopCloseTextMaybe),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_ChapterIntro[] = {
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(ChapterIntro_Init),

    PROC_SLEEP(60),

    PROC_START_CHILD(sProcScr_ChapterIntro_KeyListen),

    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 1),

    PROC_CALL(ChapterIntro_Init_PlaySound316),
    PROC_REPEAT(ChapterIntro_DrawingLights),
    PROC_CALL(ChapterIntro_InitBLDCNT),

    PROC_START_CHILD(sProcScr_ChapterIntro_LightBurst),

    PROC_CALL(ChapterIntro_DrawChapterTitleMaybe),

    PROC_SLEEP(1),

    PROC_CALL(ChapterIntro_80204AC),
    PROC_REPEAT(ChapterIntro_UnknownFX8020578),
    PROC_CALL(ChapterIntro_SetBG_802009C),

    PROC_START_CHILD(sProcScr_ChapterIntro_Bg3Scroll),
    PROC_START_CHILD(sProcScr_ChapterIntro_0859B160),

    PROC_CALL(ChapterIntro_8020944),
    PROC_REPEAT(ChapterIntro_80209D8),

    PROC_CALL_ARG(ChapterIntro_SetTimerMaybe, 160),

    PROC_REPEAT(ChapterIntro_TickTimerMaybe),
    PROC_CALL(ChapterIntro_8020A40),
    PROC_REPEAT(ChapterIntro_8020A8C),

    PROC_END_EACH(sProcScr_ChapterIntro_Bg3Scroll),
    PROC_END_EACH(sProcScr_ChapterIntro_0859B108),
    PROC_END_EACH(sProcScr_ChapterIntro_0859B160),

    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 0),

    PROC_CALL(ChapterIntro_8020B20),

    PROC_CALL(BMapDispResume),

    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFadeToMap),

    PROC_SLEEP(30),

    PROC_GOTO(99),

PROC_LABEL(1),
    PROC_CALL(ChapterIntro_BeginFadeOut),
    PROC_REPEAT(ChapterIntro_LoopFadeOut),

    PROC_SLEEP(60),

    PROC_CALL(ChapterIntro_8020B20),

    PROC_CALL(BMapDispResume),

    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFastFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFastFadeToMap),

PROC_LABEL(99),
    PROC_CALL(ChapterIntro_80210C8),

    PROC_END,
};



struct ProcCmd CONST_DATA sProcScr_0859B318[] = {
    PROC_CALL(ChapterIntro_8020AF8),
    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFadeToMap),
    PROC_REPEAT(ChapterIntro_8021188),

    PROC_END,
};


void ChapterIntro_Bg3Scroll_Loop() {
    int offset = (GetGameClock() / 2) & 0xFF;
    BG_SetPosition(BG_2, offset, offset);

    return;
}

void ChapterIntro_KeyListen_Init(struct ChapterIntroFXProc* proc) {
    struct ChapterIntroFXProc* parent = (struct ChapterIntroFXProc*) proc->proc_parent;

    parent->unk_50 = 0;
    proc->unk_50 = 0;

    return;
}

void ChapterIntro_KeyListen_Loop(struct ChapterIntroFXProc* proc) {
    struct ChapterIntroFXProc* parent;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON)) {
        if (((struct ChapterIntroFXProc*) proc->proc_parent)->unk_52 != 0) {
            proc->unk_50 = 1;
        } else {
            ((struct ChapterIntroFXProc*) proc->proc_parent)->unk_52 = 1;
        }
    }

    if (proc->unk_50 != 0) {
        parent = (struct ChapterIntroFXProc*) proc->proc_parent;
        if (parent->unk_50 != 0) {
            Proc_Goto(parent, parent->unk_50);
            Proc_End(proc);
        }
    }

    return;
}

void PutScreenFogEffect() {
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);

    for (iy = 0; iy < 8; ++iy) {
        for (ix = 0; ix < 16; ++ix) {

            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x10)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x10)] = tileRefA;

            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00+ix, iy+0x18)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10+ix, iy+0x18)] = tileRefB;

            tileRefA++;
            tileRefB++;
        }

        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

void PutScreenFogEffectOverlayed() {
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);
    
    for (iy = 0; iy < 8; ++iy) {
        for (ix = 0; ix < 16; ++ix) {
            
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-ix, iy+0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-ix, iy+0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-ix, iy+0x10)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-ix, iy+0x10)] = tileRefA + 0x400;
            
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-ix, iy+0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-ix, iy+0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F-ix, iy+0x18)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F-ix, iy+0x18)] = tileRefB + 0x400;
            
            tileRefA++;
            tileRefB++;
        }
        
        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

void ChapterIntro_801FFD0(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;

    return;
}

void ChapterIntro_801FFD8_Loop(struct ChapterIntroFXProc* proc) {
    proc->unk_4C++;

    BG_SetPosition(BG_1, proc->unk_4C / 2, 0);
    REG_BG3HOFS = proc->unk_4C / 2;

    return;
}

int ChapterIntro_8020010(ProcPtr proc, void* unk_2, int unk_3) {
    int ref1;
    int ref2;
    int i;

    u16* buffer = gBG1TilemapBuffer;

    if (unk_2 == 0) {
        unk_2 = BG_CHR_ADDR(0x0);
    }

    ApplyPalettes(Pal_CommGameBgScreenInShop, unk_3, 2);
    Decompress(Img_CommGameBgScreen, unk_2);

    ref1 = TILEREF(0, unk_3 & 15);
    ref2 = TILEREF(0, (unk_3 + 1) & 15);

    for (i = 0; i < 224; i++) {
        *buffer = i + ref1;
        buffer++;
    }

    for (; i < 416; i++) {
        *buffer = i + ref2;
        buffer++;
    }

    for (; i < 640; i++) {
        *buffer = i + ref1;
        buffer++;
    }

    Proc_Start(sProcScr_ChapterIntro_0859B108, proc);

    // return; // BUG?
}

void ChapterIntro_SetBG_802009C() {
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    SetBackgroundTileDataOffset(BG_2, 0x8000);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg2cnt.screenSize = 0;

    return;
}

void ChapterIntro_Init(struct ChapterIntroFXProc* proc) {
    SetupBackgrounds(NULL);

    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_1;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 0, 0, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    SetBackgroundTileDataOffset(BG_2, 0x8000);

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWin0Box(0, 0, 0, 0);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    MaybeResetSomePal();

    sub_80017B4(0, 2, 64, -1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 1;

    Decompress(Img_08B17B64, BG_CHR_ADDR(0x400));
    ApplyPalettes(Pal_08B18ED4, 0, 3);

    sub_800154C(gBG2TilemapBuffer, Tsa_08B18D68, 0, 5);

    Decompress(Img_08B19874, OBJ_VRAM1);
    ApplyPalette(Pal_08B19DEC, 18);

    ChapterIntro_8020010(proc, 0, 14);

    BG_EnableSyncByMask(BG1_SYNC_BIT | BG2_SYNC_BIT);

    proc->unk_52 = 0;

    return;
}

void ChapterIntro_Init_PlaySound316(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;
    proc->unk_4E = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 3;

    PlaySoundEffect(SONG_316);

    return;
}

void ChapterIntro_DrawingLights(struct ChapterIntroFXProc* proc) {
    proc->unk_2C = Interpolate(INTERPOLATE_LINEAR, gUnknown_0859B120[proc->unk_4C], gUnknown_0859B120[proc->unk_4C + 1], proc->unk_4E, proc->unk_68);
    proc->unk_30 = Interpolate(INTERPOLATE_LINEAR, gUnknown_0859B132[proc->unk_4C], gUnknown_0859B132[proc->unk_4C + 1], proc->unk_4E, proc->unk_68);

    if (proc->unk_64 <= 100) {
        int uVar8 = Interpolate(INTERPOLATE_RSQUARE, 320, 64, proc->unk_64, 100);

        SetObjAffine(
            0,
            Div(+COS(0) * 16, uVar8),
            Div(-SIN(0) * 16, uVar8),
            Div(+SIN(0) * 16, uVar8),
            Div(+COS(0) * 16, uVar8)
        );

        proc->unk_64++;
    }

    CallARM_PushToSecondaryOAM(
        OAM1_X(proc->unk_2C - 16),
        ((proc->unk_30 - 16) & 0x1FF) | OAM0_AFFINE_ENABLE,
        gObject_32x32,
        OAM2_CHR(0x210) + OAM2_PAL(2)
    );
    CallARM_PushToSecondaryOAM(
        OAM1_X(224 - proc->unk_2C),
        ((144 - proc->unk_30) & 0x1FF) | OAM0_AFFINE_ENABLE,
        gObject_32x32,
        OAM2_CHR(0x214) + OAM2_PAL(2)
    );

    proc->unk_4E++;

    if (proc->unk_4E >= proc->unk_68) {
        proc->unk_4E = 0;

        proc->unk_4C++;

        proc->unk_68 = Interpolate(INTERPOLATE_LINEAR, 3, 8, proc->unk_66, 18);

        proc->unk_66++;

        if (gUnknown_0859B120[proc->unk_4C + 1] == 0) {
            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_80204AC(struct ChapterIntroFXProc* proc) {
    SetDispEnable(1, 1, 1, 0, 1);

    proc->unk_4C = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}

void sub_80204E4(struct ChapterIntroFXProc* proc, int unk2, int unk3, int unk4) {
    int a = Interpolate(INTERPOLATE_RCUBIC, DISPLAY_WIDTH / 2, unk3, proc->unk_4C, 70);
    int b = Interpolate(INTERPOLATE_RCUBIC, DISPLAY_HEIGHT / 2, unk4, proc->unk_4C, 70);

    CallARM_PushToSecondaryOAM(
        OAM1_X(a - 8) | OAM1_AFFINE_ID(unk2),
        ((b - 8) & 0x1FF) | OAM0_AFFINE_ENABLE,
        gObject_16x16,
        OAM2_CHR(0x218) + OAM2_PAL(2)
    );

    CallARM_PushToSecondaryOAM(
        OAM1_X(232 - a) | OAM1_AFFINE_ID(unk2),
        ((152 - b) & 0x1FF) | OAM0_AFFINE_ENABLE,
        gObject_16x16,
        OAM2_CHR(0x218) + OAM2_PAL(2)
    );

    return;
}

void ChapterIntro_UnknownFX8020578(struct ChapterIntroFXProc* proc) {
    int var;

    if (proc->unk_64 <= 70) {
        var = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_64, 70);

        SetObjAffine(
            1,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_64++;
    }

    sub_80204E4(proc, 1, 215, 17);

    if (proc->unk_66 <= 70) {
        var = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_66, 70);

        SetObjAffine(
            2,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_66++;
    }

    sub_80204E4(proc, 2, 192, 32);

    if (proc->unk_68 <= 70) {
        var = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_68, 70);

        SetObjAffine(
            3,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_68++;
    }

    sub_80204E4(proc, 3, 169, 47);

    proc->unk_4C++;

    if (proc->unk_4C >= 70) {
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_DrawChapterTitleMaybe() {
    int var;

    BG_Fill(gBG0TilemapBuffer, TILEREF(0x280, 1));
    sub_80895B4(8, 5);

    var = GetChapterTitleWM(&gPlaySt);
    _PutChapterTitleGfx(0x280, var);
    sub_80896FC(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 9), 5, var);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

void ChapterIntro_80207C8() {
    CallARM_PushToSecondaryOAM(0, 64, gUnknown_0859B144, OAM2_CHR(0x200) + OAM2_PAL(2));
    CallARM_PushToSecondaryOAM(0, 64, gUnknown_0859B144, OAM2_CHR(0x200) + OAM2_PAL(2));

    return;
}

void ChapterIntro_LightBurst_Init(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;
    proc->unk_4E = 0;
    proc->unk_66 = 0;

    return;
}

void ChapterIntro_LightBurst_Loop(struct ChapterIntroFXProc* proc) {
    if (proc->unk_66 == 0) {
        SetBlendAlpha(16, proc->unk_4E);
        proc->unk_4E++;
    } else {
        SetBlendAlpha(proc->unk_4E >> 1, 16);
        proc->unk_4E--;
    }

    if (proc->unk_4C <= 0xFF) {
        BgAffinRotScaling(BG_2, 0, 0, 0, 0x180, 0x180);
        BgAffinScaling(BG_2, (u16)proc->unk_4C + 0xF0, (u16)proc->unk_4C + 0xF0);
        BgAffinAnchoring(BG_2, 0x70, 0x58, 0x4C, 0x4C);
        FlushLCDControl();

        if (proc->unk_66 != 0) {
            proc->unk_4C += 4;
        }
    }

    if (proc->unk_66 == 0) {
        if (proc->unk_4E < 16) {
            return;
        }

        proc->unk_4E = 32;
        SetBlendAlpha(16, 16);
        proc->unk_66++;

        return;
    }

    if (proc->unk_4E > 0) {
        return;
    }

    SetBlendAlpha(0, 16);
    Proc_EndEach(sProcScr_ChapterIntro_LightBurst);
    Proc_Break(proc);

    return;
}

void ChapterIntro_InitBLDCNT() {
    SetDispEnable(0, 1, 1, 0, 1);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    return;
}

void ChapterIntro_8020944(struct ChapterIntroFXProc* proc) {
    SetDispEnable(1, 1, 1, 0, 1);

    proc->unk_4C = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    Decompress(Img_08B18F34, BG_CHR_ADDR(0x400));
    ApplyPalette(Pal_08B19854, 4);

    Decompress(Img_08B196D8, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(0x0, 4));

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

void ChapterIntro_80209D8(struct ChapterIntroFXProc* proc) {
    SetBlendAlpha(proc->unk_4C, 16);

    if ((proc->unk_50 == 3) || ((GetGameClock() & 3) == 0)) {
        if (proc->unk_52 != 0) {
            proc->unk_4C += 4;
        } else {
            proc->unk_4C++;
        }

        if (proc->unk_4C > 5) {
            SetBlendAlpha(6, 16);
            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_8020A40(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 30;

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -1);
    MaybeSmoothChangeSomePal(PAL_BG(14), 14, 2, -1);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 18, 1, -1);

    return;
}

void ChapterIntro_8020A8C(struct ChapterIntroFXProc* proc) {
    if ((GetGameClock() & 3) == 0) {
        CALLARM_ColorFadeTick();
        EnablePaletteSync();

        proc->unk_4C--;

        if (proc->unk_4C < 0) {
            SetDispEnable(1, 0, 0, 0, 1);
            SetBackgroundTileDataOffset(BG_2, 0);

            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
            EnablePaletteSync();

            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_8020AF8() {
    SetupBackgrounds(NULL);
    sub_80156D4();
    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
    InitSystemTextFont();

    return;
}

void ChapterIntro_8020B20() {
    gBmSt.camera.y = DISPLAY_HEIGHT * 4;

    return;
}

void ChapterIntro_InitMapDisplay() {
    int var;

    SetDispEnable(1, 1, 1, 1, 1);

    SetBlendAlpha(16, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    SetBlendBackdropB(1);

    CpuFastFill(0, BG_CHR_ADDR(0x0), CHR_SIZE);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    DisableMapPaletteAnimations();

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);

    ApplyUnitSpritePalettes();
    LoadObjUIGfx();

    var = GetROMChapterStruct(gPlaySt.chapterIndex)->initialPosX;
    var = GetCameraCenteredX(var * 16);
    var = (var + 0xF) & 0x1F0;
    gBmSt.camera.x = var;

    var = GetROMChapterStruct(gPlaySt.chapterIndex)->initialPosY;
    var = GetCameraCenteredY(var * 16);
    var = (var + 0xF) & 0x3F0;
    gBmSt.camera.y = var;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}

void ChapterIntro_BeginFadeToMap(struct ChapterIntroFXProc* proc) {
    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(10), 26, 6, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 16, 2, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 23, 1, 1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->unk_4C = 30;

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES) {
        WfxFlamesInitGradientPublic();
    }

    return;
}

void ChapterIntro_LoopFadeToMap(struct ChapterIntroFXProc* proc) {
    if ((GetGameClock() & 1) == 0) {
        CALLARM_ColorFadeTick();
        if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES) {
            WfxFlamesInitGradientPublic();
        }

        if ((GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack) {
            if ((GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE]) != 0xFFFF) {
                StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
            }

            proc->unk_4C = 0;

            SetDispEnable(1, 1, 1, 0, 0);
        } else {
            int bldAmt;
            EnablePaletteSync();

            bldAmt = (proc->unk_4C + 7) / 8;
            SetBlendAlpha(bldAmt + 12, 4 - bldAmt);
        }

        proc->unk_4C--;

        if ((proc->unk_4C == 24) &&
            ((GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE]) != 0xFFFF)) {
            StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
        }

        if (proc->unk_4C < 0) {
            ResetMapPaletteAnimations();
            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_BeginCloseTextMaybe(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;
    SetWOutLayers(1, 1, 1, 1, 0);
    return;
}

void ChapterIntro_LoopCloseTextMaybe(struct ChapterIntroFXProc* proc) {
    int var = Interpolate(INTERPOLATE_RCUBIC, 0, DISPLAY_WIDTH / 2, proc->unk_4C, 40);

    SetWin0Box((DISPLAY_WIDTH / 2) - var, 0, var + (DISPLAY_WIDTH / 2), DISPLAY_HEIGHT)

    proc->unk_4C++;

    if (proc->unk_4C > 40) {
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_BeginFadeOut(struct ChapterIntroFXProc* proc) {
    Sound_FadeOutBGM(4);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(0), 0, 3, -2);
    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -2);
    MaybeSmoothChangeSomePal(PAL_BG(14), 14, 2, -2);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 18, 1, -2);

    proc->unk_4C = 15;

    Sound_FadeOutSE(1);

    return;
}

void ChapterIntro_LoopFadeOut(struct ChapterIntroFXProc* proc) {
    CALLARM_ColorFadeTick();
    EnablePaletteSync();

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        SetDispEnable(0, 0, 0, 0, 0);
        SetBackgroundTileDataOffset(BG_2, 0);
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_BeginFastFadeToMap(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    CpuFastFill(0, BG_CHR_ADDR(0x0), CHR_SIZE);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    Proc_EndEach(sProcScr_ChapterIntro_Bg3Scroll);
    Proc_EndEach(sProcScr_ChapterIntro_0859B108);
    Proc_EndEach(sProcScr_ChapterIntro_0859B160);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(10), 26, 6, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 16, 2, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 23, 1, 2);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->unk_4C = 14;

    if ((GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE]) != 0xFFFF) {
        StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
    }

    return;
}

void ChapterIntro_LoopFastFadeToMap(struct ChapterIntroFXProc* proc) {
    CALLARM_ColorFadeTick();

    if ((GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather) == WEATHER_FLAMES) {
        WfxFlamesInitGradientPublic();
    }

    if ((GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) || (GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)) {
        proc->unk_4C = 0;
        SetDispEnable(1, 1, 1, 0, 0);
    } else {
        EnablePaletteSync();
    }

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_SetSkipTarget(s16 arg, struct ChapterIntroFXProc* proc) {
    proc->unk_50 = arg;

    return;
}


void ChapterIntro_SetTimerMaybe(s16 arg, struct ChapterIntroFXProc* proc) {
    proc->unk_4C = arg;

    return;
}

void ChapterIntro_TickTimerMaybe(struct ChapterIntroFXProc* proc) {
    if (proc->unk_52 != 0) {
        Proc_Break(proc);
        return;
    }

    if (proc->unk_4C-- < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_80210C0(struct ChapterIntroFXProc* proc) {
    proc->unk_52 = 2;

    return;
}

void ChapterIntro_80210C8() {
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetWinEnable(0, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    if ((GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) ||
    (GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)) {
        RefreshBMapGraphics();
        sub_80141B0();
    }

    return;
}

void ChapterIntro_8021188(struct ChapterIntroFXProc* proc) {
    if ((GetGameClock() & 1) == 0) {
        CALLARM_ColorFadeTick();

        if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == 5) {
            WfxFlamesInitGradientPublic();
        }

        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}
