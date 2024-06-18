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

static u8 CONST_DATA gUnknown_0859B120[] = {
    0xD0, 0xD0, 0xCC, 0xC0, 0xA0, 0x80,
    0x60, 0x40, 0x24, 0x20, 0x30, 0x48,
    0x60, 0x78, 0x88, 0x88, 0x78, 0x00,
};

static u8 CONST_DATA gUnknown_0859B132[] = {
    0xA0, 0x80, 0x60, 0x40, 0x28, 0x20,
    0x24, 0x2C, 0x48, 0x68, 0x88, 0x98,
    0x9C, 0x90, 0x78, 0x60, 0x50, 0x00,
};

static u16 CONST_DATA gUnknown_0859B144[] = {
    0x0004, 0x4000, 0xC000, 0x0400,
    0x4000, 0xC040, 0x0408, 0x4000,
    0xD070, 0x0408, 0x4000, 0xD0B0,
    0x0400, 0x0000,
};

struct ProcCmd CONST_DATA sProcScr_ChapterIntro_0859B160[] = {
    PROC_SLEEP(0x1E),
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

    PROC_SLEEP(0x3C),

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

    PROC_CALL_ARG(ChapterIntro_SetTimerMaybe, 0xA0),

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

    PROC_SLEEP(0x1E),

    PROC_GOTO(0x63),

PROC_LABEL(1),
    PROC_CALL(ChapterIntro_BeginFadeOut),
    PROC_REPEAT(ChapterIntro_LoopFadeOut),

    PROC_SLEEP(0x3C),

    PROC_CALL(ChapterIntro_8020B20),

    PROC_CALL(BMapDispResume),

    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFastFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFastFadeToMap),

PROC_LABEL(0x63),
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
    BG_SetPosition(2, offset, offset);

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

    BG_SetPosition(1, proc->unk_4C / 2, 0);
    REG_BG3HOFS = proc->unk_4C / 2;

    return;
}

int ChapterIntro_8020010(ProcPtr proc, void* unk_2, int unk_3) {
    int ref1;
    int ref2;
    int i;

    u16* buffer = gBG1TilemapBuffer;

    if (unk_2 == 0) {
        unk_2 = (void*)BG_VRAM;
    }

    ApplyPalettes(Pal_CommGameBgScreenInShop, unk_3, 2);
    Decompress(Img_CommGameBgScreen, unk_2);

    ref1 = TILEREF(0, unk_3 & 0xF);
    ref2 = TILEREF(0, (unk_3 + 1) & 0xF);

    for (i = 0; i <= 0xDF; i++) {
        *buffer = i + ref1;
        buffer++;
    }

    for (; i <= 0x19F; i++) {
        *buffer = i + ref2;
        buffer++;
    }

    for (; i <= 0x27F; i++) {
        *buffer = i + ref1;
        buffer++;
    }

    Proc_Start(sProcScr_ChapterIntro_0859B108, proc);

    // return; // BUG?
}

void ChapterIntro_SetBG_802009C() {
    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundTileDataOffset(2, 0x8000);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg2cnt.screenSize = 0;

    return;
}

void ChapterIntro_Init(struct ChapterIntroFXProc* proc) {
    SetupBackgrounds(0);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    SetBackgroundTileDataOffset(2, 0x8000);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = 0;
    gLCDControlBuffer.win0_bottom = 0;

    SetBlendConfig(0, 0, 0, 0);

    MaybeResetSomePal();

    sub_80017B4(0, 2, 0x40, -1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 1;

    Decompress(gUnknown_08B17B64, BG_CHAR_ADDR(2));
    ApplyPalettes(gUnknown_08B18ED4, 0, 3);

    sub_800154C(gBG2TilemapBuffer, gUnknown_08B18D68, 0, 5);

    Decompress(gUnknown_08B19874, OBJ_VRAM1);
    ApplyPalette(gUnknown_08B19DEC, 0x12);

    ChapterIntro_8020010(proc, 0, 0xE);

    BG_EnableSyncByMask(6);

    proc->unk_52 = 0;

    return;
}

void ChapterIntro_Init_PlaySound316(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0;
    proc->unk_4E = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 3;

    PlaySoundEffect(0x316);

    return;
}

void ChapterIntro_DrawingLights(struct ChapterIntroFXProc* proc) {
    proc->unk_2C = Interpolate(0, gUnknown_0859B120[proc->unk_4C], gUnknown_0859B120[proc->unk_4C + 1], proc->unk_4E, proc->unk_68);

    proc->unk_30 = Interpolate(0, gUnknown_0859B132[proc->unk_4C], gUnknown_0859B132[proc->unk_4C + 1], proc->unk_4E, proc->unk_68);

    if (proc->unk_64 < 0x65) {
        int uVar8 = Interpolate(4, 0x140, 0x40, proc->unk_64, 100);

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
        (proc->unk_2C - 0x10) & 0x1FF,
        ((proc->unk_30 - 0x10) & 0x1FF) | 0x100,
        gObject_32x32,
        0x2210
    );
    CallARM_PushToSecondaryOAM(
        (0xE0 - proc->unk_2C) & 0x1FF,
        ((0x90 - proc->unk_30) & 0x1FF) | 0x100,
        gObject_32x32,
        0x2214
    );

    proc->unk_4E++;

    if (proc->unk_4E >= proc->unk_68) {
        proc->unk_4E = 0;

        proc->unk_4C++;

        proc->unk_68 = Interpolate(0, 3, 8, proc->unk_66, 0x12);

        proc->unk_66++;

        if (gUnknown_0859B120[proc->unk_4C + 1] == 0) {
            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_80204AC(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    proc->unk_4C = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}

void sub_80204E4(struct ChapterIntroFXProc* proc, int unk2, int unk3, int unk4) {
    int a = Interpolate(5, DISPLAY_WIDTH / 2, unk3, proc->unk_4C, 0x46);

    int b = Interpolate(5, DISPLAY_HEIGHT / 2, unk4, proc->unk_4C, 0x46);

    CallARM_PushToSecondaryOAM(
        ((a - 8) & 0x1FF) | unk2 << 9,
        ((b - 8) & 0x1FF) | 0x100,
        gObject_16x16,
        0x2218
    );

    CallARM_PushToSecondaryOAM(
        ((0xE8 - a) & 0x1FF) | unk2 << 9,
        ((0x98 - b) & 0x1FF) | 0x100,
        gObject_16x16,
        0x2218
    );

    return;
}

void ChapterIntro_UnknownFX8020578(struct ChapterIntroFXProc* proc) {
    int var;

    if (proc->unk_64 < 0x47) {
        var = Interpolate(4, 0x140, 0x10, proc->unk_64, 0x46);

        SetObjAffine(
            1,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_64++;
    }

    sub_80204E4(proc, 1, 0xD7, 0x11);

    if (proc->unk_66 < 0x47) {
        var = Interpolate(4, 0x140, 0x10, proc->unk_66, 0x46);

        SetObjAffine(
            2,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_66++;
    }

    sub_80204E4(proc, 2, 0xC0, 0x20);

    if (proc->unk_68 < 0x47) {
        var = Interpolate(4, 0x140, 0x10, proc->unk_68, 0x46);

        SetObjAffine(
            3,
            Div(+COS(0) * 16, var),
            Div(-SIN(0) * 16, var),
            Div(+SIN(0) * 16, var),
            Div(+COS(0) * 16, var)
        );

        proc->unk_68++;
    }

    sub_80204E4(proc, 3, 0xA9, 0x2F);

    proc->unk_4C++;

    if (proc->unk_4C > 0x45) {
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_DrawChapterTitleMaybe() {
    int var;

    BG_Fill(gBG0TilemapBuffer, 0x1280);
    sub_80895B4(8, 5);

    var = GetChapterTitleWM(&gPlaySt);
    _PutChapterTitleGfx(0x280, var);
    sub_80896FC(gBG0TilemapBuffer + 0x123, 5, var);

    BG_EnableSyncByMask(1);

    return;
}

void ChapterIntro_80207C8() {
    CallARM_PushToSecondaryOAM(0, 0x40, gUnknown_0859B144, 0x2200);
    CallARM_PushToSecondaryOAM(0, 0x40, gUnknown_0859B144, 0x2200);

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
        SetBlendConfig(1, 0x10, proc->unk_4E, 0);
        proc->unk_4E++;
    } else {
        SetBlendConfig(1, ((u16)proc->unk_4E << 0x10) >> 0x11 & 0xFF, 0x10, 0);
        proc->unk_4E--;
    }

    if (proc->unk_4C <= 0xFF) {
        BgAffinRotScaling(2, 0, 0, 0, 0x180, 0x180);
        BgAffinScaling(2, (u16)proc->unk_4C + 0xF0, (u16)proc->unk_4C + 0xF0);
        BgAffinAnchoring(2, 0x70, 0x58, 0x4C, 0x4C);
        FlushLCDControl();

        if (proc->unk_66 != 0) {
            proc->unk_4C += 4;
        }
    }

    if (proc->unk_66 == 0) {
        if (proc->unk_4E <= 0xF) {
            return;
        }

        proc->unk_4E = 0x20;
        SetBlendConfig(1, 0x10, 0x10, 0);
        proc->unk_66++;

        return;
    }

    if (0 < proc->unk_4E) {
        return;
    }

    SetBlendConfig(1, 0, 0x10, 0);
    Proc_EndEach(sProcScr_ChapterIntro_LightBurst);
    Proc_Break(proc);

    return;
}

void ChapterIntro_InitBLDCNT() {
    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    return;
}

void ChapterIntro_8020944(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    proc->unk_4C = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    Decompress(gUnknown_08B18F34, BG_CHAR_ADDR(2));
    ApplyPalette(gUnknown_08B19854, 4);

    Decompress(gUnknown_08B196D8, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x4000);

    BG_EnableSyncByMask(4);

    return;
}

void ChapterIntro_80209D8(struct ChapterIntroFXProc* proc) {
    SetBlendConfig(1, proc->unk_4C, 0x10, 0);

    if ((proc->unk_50 == 3) || ((GetGameClock() & 3) == 0)) {
        if (proc->unk_52 != 0) {
            proc->unk_4C += 4;
        } else {
            proc->unk_4C++;
        }

        if (proc->unk_4C > 5) {
            SetBlendConfig(1, 6, 0x10, 0);
            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_8020A40(struct ChapterIntroFXProc* proc) {
    proc->unk_4C = 0x1E;

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -1);
    MaybeSmoothChangeSomePal(PAL_BG(0xE), 0xE, 2, -1);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 0x12, 1, -1);

    return;
}

void ChapterIntro_8020A8C(struct ChapterIntroFXProc* proc) {
    int clock = GetGameClock() & 3;

    if ((clock) == 0) {
        CALLARM_ColorFadeTick();
        EnablePaletteSync();

        proc->unk_4C--;

        if (proc->unk_4C < 0) {
            gLCDControlBuffer.dispcnt.bg0_on = 1;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 1;

            SetBackgroundTileDataOffset(2, 0);
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
            EnablePaletteSync();
            Proc_Break(proc);
        }
    }

    return;
}

void ChapterIntro_8020AF8() {
    SetupBackgrounds(0);
    sub_80156D4();
    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
    InitSystemTextFont();

    return;
}

void ChapterIntro_8020B20() {
    gBmSt.camera.y = 0xA0 * 4;

    return;
}

void ChapterIntro_InitMapDisplay() {
    int var;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetBlendConfig(1, 0x10, 0, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    SetBlendBackdropB(1);

    CpuFastFill(0, (void *)BG_VRAM, 32);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(7);

    DisableMapPaletteAnimations();

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);

    SetupMapSpritesPalettes();
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
    MaybeSmoothChangeSomePal(PAL_OBJ(0xA), 0x1A, 6, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 0x10, 2, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 0x17, 1, 1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->unk_4C = 0x1E;

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == 5) {
        WfxFlamesInitGradientPublic();
    }

    return;
}

void ChapterIntro_LoopFadeToMap(struct ChapterIntroFXProc* proc) {
    if ((GetGameClock() & 1) == 0) {
        CALLARM_ColorFadeTick();
        if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == 5) {
            WfxFlamesInitGradientPublic();
        }

        if ((GetBattleMapKind() == 2) || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack) {
            if ((GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE]) != 0xFFFF) {
                StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], 0);
            }

            proc->unk_4C = 0;

            gLCDControlBuffer.dispcnt.bg0_on = 1;
            gLCDControlBuffer.dispcnt.bg1_on = 1;
            gLCDControlBuffer.dispcnt.bg2_on = 1;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;
        } else {
            int tmp;
            EnablePaletteSync();

            tmp = proc->unk_4C + 7;
            if (tmp < 0) {
                tmp = proc->unk_4C + 0xE;
            }

            SetBlendConfig(
                1,
                ((tmp >> 3) + 0xC) & 0xFF,
                (4 - (tmp >> 3)) & 0xFF,
                0
            );
        }

        proc->unk_4C--;

        if ((proc->unk_4C == 0x18) &&
            ((GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE]) != 0xFFFF)) {
            StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], 0);
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

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    return;
}

void ChapterIntro_LoopCloseTextMaybe(struct ChapterIntroFXProc* proc) {
    int var;

    var = Interpolate(5, 0, DISPLAY_WIDTH / 2, proc->unk_4C, 0x28);

    gLCDControlBuffer.win0_left = (DISPLAY_WIDTH / 2) - var;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = var + (DISPLAY_WIDTH / 2);
    gLCDControlBuffer.win0_bottom = DISPLAY_HEIGHT;

    proc->unk_4C++;

    if (proc->unk_4C > 0x28) {
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_BeginFadeOut(struct ChapterIntroFXProc* proc) {
    Sound_FadeOutBGM(4);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(0), 0, 3, -2);
    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -2);
    MaybeSmoothChangeSomePal(PAL_BG(0xE), 0xE, 2, -2);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 0x12, 1, -2);

    proc->unk_4C = 0xF;

    Sound_FadeOutSE(1);

    return;
}

void ChapterIntro_LoopFadeOut(struct ChapterIntroFXProc* proc) {
    CALLARM_ColorFadeTick();
    EnablePaletteSync();

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        gLCDControlBuffer.dispcnt.bg0_on = 0;
        gLCDControlBuffer.dispcnt.bg1_on = 0;
        gLCDControlBuffer.dispcnt.bg2_on = 0;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;

        SetBackgroundTileDataOffset(2, 0);
        Proc_Break(proc);
    }

    return;
}

void ChapterIntro_BeginFastFadeToMap(struct ChapterIntroFXProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    CpuFastFill(0, (void *)BG_VRAM, 32);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(7);

    Proc_EndEach(sProcScr_ChapterIntro_Bg3Scroll);
    Proc_EndEach(sProcScr_ChapterIntro_0859B108);
    Proc_EndEach(sProcScr_ChapterIntro_0859B160);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(0xA), 0x1A, 6, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 0x10, 2, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 0x17, 1, 2);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->unk_4C = 0xE;

    if ((GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE]) != 0xFFFF) {
        StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], 0);
    }

    return;
}

void ChapterIntro_LoopFastFadeToMap(struct ChapterIntroFXProc* proc) {
    CALLARM_ColorFadeTick();

    if ((GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather) == 5) {
        WfxFlamesInitGradientPublic();
    }

    if ((GetBattleMapKind() == 2) || (GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)) {
        proc->unk_4C = 0;

        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;
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
    s16 tmp;

    if (proc->unk_52 != 0) {
        Proc_Break(proc);
        return;
    }

    tmp = proc->unk_4C;
    proc->unk_4C--;

    if (tmp < 0) {
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

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(1);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    if ((GetBattleMapKind() == 2) ||
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
