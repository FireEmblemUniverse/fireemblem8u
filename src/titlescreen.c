#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"

struct TitleScreenProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 unk_29;
    /* 2A */ u16 unk_2a;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;

    /* 34 */ u8 _pad[0x4C-0x34];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e; // unused/pad?
    /* 50 */ s16 unk_50; // unused/pad?
    /* 52 */ u16 unk_52;
};

extern struct BgAffineDstData gUnknown_030030C8;

u16 CONST_DATA gUnknown_08AA6774[] = {
    5,
    0x4000, 0xC000, 0x0000,
    0x4000, 0xC040, 0x0008,
    0x4000, 0xC080, 0x0010,
    0x0000, 0x80C0, 0x0018,
    0x8000, 0x40E0, 0x001C,
};

u16 CONST_DATA gUnknown_08AA6794[] = {

    4,
    0x4000, 0xC000, 0x0000,
    0x4000, 0xC040, 0x0008,
    0x4000, 0xC080, 0x0010,
    0x8000, 0x80C0, 0x0018,
};

u16 CONST_DATA gUnknown_08AA67AE[] = {
    8,
    0x4000, 0x4000, 0x0000,
    0x4000, 0x4020, 0x0004,
    0x4000, 0x4040, 0x0008,
    0x4000, 0x4060, 0x000C,
    0x4000, 0x4080, 0x0010,
    0x4000, 0x40A0, 0x0014,
    0x4000, 0x40C0, 0x0018,
    0x0000, 0x00E0, 0x001C,
};

u16 CONST_DATA gUnknown_08AA67E0[] = {
    4,
    0x4000, 0x8000, 0x0000,
    0x0000, 0x4020, 0x0004,
    0x4000, 0x8030, 0x0040,
    0x0000, 0x4050, 0x0044,
};

extern u16 gUnknown_08AADBE8[]; // pal

extern u8 gUnknown_08AA7760[]; // gfx

extern u8 gUnknown_08AA9708[]; // gfx
extern u8 gUnknown_08AAAE90[]; // tsa?

extern u16 gUnknown_08AAB3F4[]; // pal

extern u8 gUnknown_08AAB414[]; // gfx
extern u8 gUnknown_08AAC2A4[]; // tsa?

extern u16 gUnknown_08AAC58C[]; // pal

extern u8 gUnknown_08AAC5AC[]; // gfx

extern u8 gUnknown_08AACEDC[]; // gfx
extern u16 gUnknown_08AADB68[]; // pal

extern u8 gUnknown_08AAFD14[]; // gfx
extern u8 gUnknown_08AAFF10[]; // tsa
extern u16 gUnknown_08AB0114[]; // pal

extern u8 gUnknown_08AADC08[]; // gfx
extern u8 gUnknown_08AAE61C[]; // tsa
extern u16 gUnknown_08AAE8CC[]; // pal

extern u8 gUnknown_08AAE8EC[]; // gfx
extern u8 gUnknown_08AAF928[]; // tsa
extern u16 gUnknown_08AAFCF4[]; // pal

extern u8 gUnknown_08AB1C24[]; // gfx
extern u16 gUnknown_08AB210C[]; // pal
extern u8 gUnknown_08AB216C[]; // gfx
extern u16 gUnknown_08AB21B8[]; // pal

extern u8 gUnknown_08AB0B44[]; // gfx
extern u8 gUnknown_08AB1890[]; // tsa?

extern u16 gUnknown_08AB1C04[]; // pal

extern u8 gUnknown_08AB0134[]; // gfx
extern u8 gUnknown_08AB0A20[]; // tsa
extern u16 gUnknown_08AB0B24[]; // pal


//! FE8U = 0x080C5430
void sub_80C5430(struct TitleScreenProc* proc) {
    proc->unk_4c = 0;
    proc->unk_52 = 0;

    return;
}

//! FE8U = 0x080C5440
void sub_80C5440(struct TitleScreenProc* proc) {

    PutSpriteExt(0, 4, 0x30, gUnknown_08AA6774, 0x2000);
    PutSpriteExt(0, 0xdc, 0x29, gObject_16x16, 0x201E);
    PutSpriteExt(2, 4, 0x435, gUnknown_08AA6774, 0x2080);
    PutSpriteExt(1, 0x10, 0x55, gUnknown_08AA6794, 0x31A0);
    PutSpriteExt(1, 0x48, 0x7c, gUnknown_08AA67E0, 0x1ba);
    PutSpriteExt(1, 4, 0x94, gUnknown_08AA67AE, 0x1180);

    if (DivRem(proc->unk_4c, 3) == 0) {
        proc->unk_52 = (proc->unk_52 + 1) & 0x1f;
    }

    if ((proc->unk_52 & 0x10) != 0) {
        CopyToPaletteBuffer(gUnknown_08AADBE8 + (proc->unk_52 & 0xf), 0x210, 2);
    } else {
        CopyToPaletteBuffer(gUnknown_08AADBE8 + ((0x1f - proc->unk_52) & 0xf), 0x210, 2);
    }

    proc->unk_4c++;

    return;
}

//! FE8U = 0x080C5548
void sub_80C5548(int arg) {
    struct BgAffineSrcData src;

    src.texX = 0x7800;
    src.texY = 0x5000;
    src.scrX = 0x78;
    src.scrY = 0x50;


    src.sx = arg;
    src.sy = arg;

    src.alpha = 0;

    BgAffineSet(&src, &gUnknown_030030C8, 1);

    return;
}

struct ProcCmd CONST_DATA gUnknown_08AA67FC[] = {
    PROC_CALL(sub_80C5430),
    PROC_REPEAT(sub_80C5440),

    PROC_END,
};

//! FE8U = 0x080C5580
void sub_80C5580(struct Proc* proc) {
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON)) {
        Proc_Goto(proc->proc_parent, 3);
    }

    return;
}

struct ProcCmd CONST_DATA gUnknown_08AA6814[] = {
    PROC_SLEEP(0),
    PROC_REPEAT(sub_80C5580),

    PROC_END,
};

//! FE8U = 0x080C55A4
void sub_80C55A4(ProcPtr proc) {
    Proc_Start(gUnknown_08AA6814, proc);

    return;
}

//! FE8U = 0x080C55B8
void sub_80C55B8(void) {
    Proc_End(Proc_Find(gUnknown_08AA6814));

    return;
}

//! FE8U = 0x080C55CC
void sub_80C55CC(struct TitleScreenProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetBackgroundTileDataOffset(0, 0);
    SetBackgroundTileDataOffset(1, 0);
    SetBackgroundTileDataOffset(2, 0x8000);
    SetBackgroundTileDataOffset(3, 0xc000);

    SetBackgroundMapDataOffset(0, 0x6800);
    SetBackgroundMapDataOffset(1, 0x7000);
    SetBackgroundMapDataOffset(2, 0xb000);
    SetBackgroundMapDataOffset(3, 0x7800);

    SetBackgroundScreenSize(0, 0);
    SetBackgroundScreenSize(1, 0);
    SetBackgroundScreenSize(2, 0);
    SetBackgroundScreenSize(3, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    sub_8001F48(0);
    sub_8001F64(0);

    SetDefaultColorEffects();

    BG_EnableSyncByMask(0xf);

    proc->unk_2a = 0;
    proc->unk_2c = 0;

    return;
}

//! FE8U = 0x080C56F4
void sub_80C56F4(struct TitleScreenProc* proc) {
    int i;

    switch (proc->unk_2a) {
        case 0:
            CopyDataWithPossibleUncomp(gUnknown_08AA7760, (void*)0x6000000);

            break;

        case 1:
            CopyDataWithPossibleUncomp(gUnknown_08AA9708, (void*)0x06003000);
            CopyDataWithPossibleUncomp(gUnknown_08AAAE90, gBG1TilemapBuffer);
            CopyToPaletteBuffer(gUnknown_08AAB3F4, 0x1c0, 0x20);

            for (i = 0; i < 0x280; i++) {
                gBG1TilemapBuffer[i] += 0xE000;
            }

            if (proc->unk_29 != 0) {
                gPaletteBuffer[0] = 0x7FFF;
            } else {
                gPaletteBuffer[0] = 0;
            }

            break;

        case 2:
            CopyDataWithPossibleUncomp(gUnknown_08AAB414, (void*)0x06005000);
            CopyDataWithPossibleUncomp(gUnknown_08AAC2A4, gBG0TilemapBuffer);
            CopyToPaletteBuffer(gUnknown_08AAC58C, 0x1e0, 0x20);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0xF280;
            }

            BG_EnableSyncByMask(1);

            break;

        case 3:
            CopyDataWithPossibleUncomp(gUnknown_08AAC5AC, (void*)0x06010000);

            break;

        case 4:
            CopyDataWithPossibleUncomp(gUnknown_08AACEDC, (void*)0x06013000);
            CopyToPaletteBuffer(gUnknown_08AADB68, 0x200, 0x80);

            proc->unk_2a = 0;

            Proc_Break(proc);

            return;
    }

    proc->unk_2a++;

    return;
}

//! FE8U = 0x080C5848
void sub_80C5848(struct TitleScreenProc* proc) {
    if (proc->unk_29 != 0) {
        Proc_Goto(proc, 0);
    } else {
        Proc_Start(gUnknown_08AA67FC, proc);
    }

    return;
}

//! FE8U = 0x080C5870
void sub_80C5870(void) {
    BG_EnableSyncByMask(0xf);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetSpecialColorEffectsParameters(1, 8, 8, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    return;
}

//! FE8U = 0x080C58CC
void sub_80C58CC(struct TitleScreenProc* proc) {
    int i;

    switch (proc->unk_2a) {
        case 0:
            SetBackgroundTileDataOffset(0, 0xc000);
            SetBackgroundMapDataOffset(0, 0x7800);

            CopyDataWithPossibleUncomp(gUnknown_08AAFD14, (void*)0x06008000);
            CopyDataWithPossibleUncomp(gUnknown_08AAFF10, (void*)0x0600B000);
            CopyToPaletteBuffer(gUnknown_08AB0114, 0, 0x20);
            gPaletteBuffer[0] = 0x7FFF;

            goto _080C5A14;

        case 1:
            CopyDataWithPossibleUncomp(gUnknown_08AADC08, (void*)0x0600C000);
            CopyDataWithPossibleUncomp(gUnknown_08AAE61C, gBG0TilemapBuffer);
            CopyToPaletteBuffer(gUnknown_08AAE8CC, 0x20, 0x20);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0x1000;
            }

            BG_EnableSyncByMask(1);

            goto _080C5A14;

        case 2:
            CopyDataWithPossibleUncomp(gUnknown_08AAE8EC, (void*)0x0600D000);
            CopyDataWithPossibleUncomp(gUnknown_08AAF928, gBG0TilemapBuffer);
            CopyToPaletteBuffer(gUnknown_08AAFCF4, 0x40, 0x20);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0x2080;
            }

            goto _080C5A14;

        case 3:
            CopyDataWithPossibleUncomp(gUnknown_08AB1C24, (void*)0x06014400);
            CopyToPaletteBuffer(gUnknown_08AB210C, 0x280, 0x60);
            CopyDataWithPossibleUncomp(gUnknown_08AB216C, (void*)0x06015400);
            CopyToPaletteBuffer(gUnknown_08AB21B8, 0x2e0, 0x20);

            goto _080C5A14;

        default:
_080C5A14:
            proc->unk_2a++;

            return;

        case 4:
            proc->unk_2a = 0;
            Proc_Break(proc);

            return;
    }
}

//! FE8U = 0x080C5A44
void sub_80C5A44(struct TitleScreenProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 1;

    SetBackgroundScreenSize(2, 2);

    sub_80C6BF0(8, 0);

    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetSpecialColorEffectsParameters(2, 8, 8, 16);

    SetBlendTargetA(1, 1, 1, 1, 1);

    gPaletteBuffer[0] = 0;
    EnablePaletteSync();

    proc->unk_2a = 0;

    return;
}

//! FE8U = 0x080C5AF0
void sub_80C5AF0(struct TitleScreenProc* proc) {
    int res;
    int time;

    if (proc->unk_2a < 0x2d) {
        res = Interpolate(0, 0x40, 0x100, proc->unk_2a, 0x2d);
    } else {
        res = Interpolate(0, 0x100, 0x1c0, proc->unk_2a - 0x2d, 0x2d);
    }

    sub_80C6BF0(
        res,
        Interpolate(0, 0, 0x40, proc->unk_2a, 0x5a)
    );

    if (res > 0xFF) {
        PutSpriteExt(0, 0x68, 0x40, gObject_32x32, 0x4220);
    }

    if (proc->unk_2a < 0x17) {
        gLCDControlBuffer.blendY = Interpolate(0, 0x10, 0, proc->unk_2a, 0x16);
    }

    time = proc->unk_2a - 0x44;

    if (time > -1) {
        if (time == 0) {
            gLCDControlBuffer.bldcnt.effect = 3;
            SetBlendTargetA(1, 1, 1, 1, 0);
        }

        gLCDControlBuffer.blendY = Interpolate(0, 0, 0x10, time, 0x16);
    }

    if (proc->unk_2a == 0x5a) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    } else {
        proc->unk_2a++;
    }

    return;
}

//! FE8U = 0x080C5BD4
void sub_80C5BD4(void) {
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(6);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(0, 1, 0, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    CpuFastFill(0, &gPaletteBuffer[0xe * 0x10], 0x20);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C5C64
void sub_80C5C64(struct TitleScreenProc* proc) {

    CopyToPaletteBuffer(gUnknown_08AAB3F4, 0x1c0, 0x20);

    sub_80C69B0(
        &gPaletteBuffer[0xe * 0x10],
        0,
        Interpolate(0, 0x10, 0, proc->unk_2a, 0x30)
    );

    if (proc->unk_2a == 0x14) {
        Sound_PlaySong80024E4(2, 0, 0);
    }

    if (proc->unk_2a < 0x14) {
        PutSpriteExt(0, 0x68, 0x40, gObject_32x32, 0x4220);
    } else if (proc->unk_2a < 0x18) {
        if ((proc->unk_2a & 1) != 0) {
            PutSpriteExt(0, 0x68, 0x40, gObject_32x32, 0x6228);
            PutSpriteExt(1, 0x68, 0x40, gObject_32x32, 0x5224);
        } else {
            PutSpriteExt(0, 0x68, 0x40, gObject_32x32, 0x5224);
            PutSpriteExt(1, 0x68, 0x40, gObject_32x32, 0x6228);
        }
    } else {
        int tmpA = proc->unk_2a - 0x18;

        if (tmpA < 9) {
            int tmpB = Interpolate(1, 0, 0x80, tmpA, 8);

            if ((proc->unk_2a & 1) != 0) {
                PutSpriteExt(0, (0x68 - tmpB) & 0x01FF, 0x40, gObject_32x32, 0x6228);
                PutSpriteExt(1, (tmpB + 0x68) & 0x01FF, 0x40, gObject_32x32, 0x5224);
            } else {
                PutSpriteExt(0, (tmpB + 0x68) & 0x01FF, 0x40, gObject_32x32, 0x5224);
                PutSpriteExt(1, (0x68 - tmpB) & 0x01FF, 0x40, gObject_32x32, 0x6228);
            }
        }
    }

    if (proc->unk_2a == 0x30) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    } else {
        proc->unk_2a++;
    }

    return;
}

//! FE8U = 0x080C5DF0
void sub_80C5DF0(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    PlaySoundEffect(0x317);

    return;
}

//! FE8U = 0x080C5E60
void sub_80C5E60(struct TitleScreenProc* proc) {

    gLCDControlBuffer.blendCoeffA = Interpolate(0, 0, 0xd, proc->unk_2a, 0xc);

    if (proc->unk_2a == 0xc) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    } else {
        proc->unk_2a++;
    }
    return;
}

//! FE8U = 0x080C5EA0
void sub_80C5EA0(struct TitleScreenProc* proc) {
    int res = Interpolate(0, 0, 0x10, proc->unk_2a, 0xc);

    if (proc->unk_2a == 0) {
        BG_EnableSyncByMask(1);
    }

    CopyToPaletteBuffer(gUnknown_08AAFCF4, 0x40, 0x20);

    sub_80C69B0(&gPaletteBuffer[2 * 0x10], 0x7FFF, res);

    CopyToPaletteBuffer(gUnknown_08AAB3F4, 0x1c0, 0x20);
    sub_80C69B0(&gPaletteBuffer[0xe * 0x10], 0x7FFF, res);

    if (proc->unk_2a == 0xc) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    } else {
        proc->unk_2a++;
    }

    return;
}

//! FE8U = 0x080C5F2C
void sub_80C5F2C(void) {
    int i;

    CopyDataWithPossibleUncomp(gUnknown_08AB0B44, (void*)0x06008000);
    CopyDataWithPossibleUncomp(gUnknown_08AB1890, gBG2TilemapBuffer);

    CopyToPaletteBuffer(gUnknown_08AB1C04, 0x60, 0x20);

    for (i = 0; i < 0x280; i++) {
        gBG2TilemapBuffer[i] += 0x3000;
    }

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080C5F84
void sub_80C5F84(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.bldcnt.effect = 0;

    return;
}

//! FE8U = 0x080C5FB4
void sub_80C5FB4(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bldcnt.effect = 1;

    return;
}

//! FE8U = 0x080C5FE8
void sub_80C5FE8(void) {

    gLCDControlBuffer.dispcnt.mode = 1;

    SetBackgroundScreenSize(2, 1);

    sub_80C5548(0x40);

    CopyDataWithPossibleUncomp(gUnknown_08AB0134, (void*)0x06008000);
    CopyDataWithPossibleUncomp(gUnknown_08AB0A20, gBG2TilemapBuffer);

    CopyToPaletteBuffer(gUnknown_08AB0B24, 0, 0x20);

    BG_EnableSyncByMask(4);

    CpuFastFill(0x7FFF7FFF, &gPaletteBuffer[0xe * 0x10], 0x40);

    SetBackgroundTileDataOffset(0, 0);
    SetBackgroundMapDataOffset(0, 0x6800);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

//! FE8U = 0x080C6090
void sub_80C6090(struct TitleScreenProc* proc) {

    sub_80C5548(Interpolate(1, 0x20, 0x100, proc->unk_2a, 0x10));

    if (proc->unk_2a == 0x10) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    } else {
        proc->unk_2a++;
    }

    return;
}

#if NONMATCHING

//! FE8U = 0x080C60CC
void sub_80C60CC(void) {
    int i;

    u8* buf = gGenericBuffer;

    for (i = 0; i <= 3; i++) {
        CpuFastFill(0, buf + (i * 0x400), 0x200);
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80C60CC(void) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        sub sp, #4\n\
        ldr r5, _080C60F8  @ gGenericBuffer\n\
        movs r6, #0\n\
        movs r4, #3\n\
    _080C60D6:\n\
        str r6, [sp]\n\
        mov r0, sp\n\
        adds r1, r5, #0\n\
        ldr r2, _080C60FC  @ 0x01000080\n\
        bl CpuFastSet\n\
        movs r0, #0x80\n\
        lsls r0, r0, #3\n\
        adds r5, r5, r0\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bge _080C60D6\n\
        add sp, #4\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080C60F8: .4byte gGenericBuffer\n\
    _080C60FC: .4byte 0x01000080\n\
        .syntax divided\n\
    ");

}

#endif

//! FE8U = 0x080C6100
void nullsub_23(int a, int b) {
    return;
}

//! FE8U = 0x080C6104
void sub_80C6104(struct TitleScreenProc* proc) {

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    proc->unk_30 = 0;

    sub_80C60CC();

    return;
}

s8 CONST_DATA gUnknown_08AA682C[] = {
    0x68, 0xC4,
    0x6B, 0xCA,
    0x6E, 0xCF,
    0x70, 0xD5,
    0x72, 0xDB,
    0x74, 0xE1,
    0x75, 0xE7,
    0x77, 0xED,
    0x77, 0xF3,
    0x78, 0xFA,
    0x78, 0x00,
    0x78, 0x06,
    0x77, 0x0D,
    0x77, 0x13,
    0x75, 0x19,
    0x74, 0x1F,
    0x72, 0x25,
    0x70, 0x2B,
    0x6E, 0x31,
    0x6B, 0x36,
    0x68, 0x3C,
    0x00, 0x00,
};

struct Unknown08AA6858 {
    /* 00 */ s16 a;
    /* 02 */ s16 b;
    /* 04 */ u8 c;
    /* 05 */ u8 d;
};

struct Unknown08AA6858 CONST_DATA gUnknown_08AA6858[] = {
    { 0x0060, 0x0100, 0x00, 0x00, },
    { 0x00A0, 0x0140, 0x01, 0x01, },
    { 0x0070, 0x0180, 0x02, 0x02, },
    { 0x0080, 0x0120, 0x03, 0x03, },
    { 0x0050, 0x0110, 0x04, 0x00, },
    { 0x0090, 0x0170, 0x05, 0x01, },
    { 0x00C0, 0x0140, 0x06, 0x02, },
    { 0x0060, 0x0130, 0x07, 0x03, },
    { 0x00B0, 0x0100, 0x08, 0x00, },
    { 0x0080, 0x0170, 0x09, 0x01, },
    { 0x0070, 0x0120, 0x0A, 0x02, },
    { 0x0080, 0x0110, 0x0B, 0x03, },
    { 0x0060, 0x0120, 0x0C, 0x00, },
    { 0x00A0, 0x0160, 0x0D, 0x01, },
    { 0x0090, 0x0120, 0x0E, 0x02, },
    { 0x0060, 0x0150, 0x0F, 0x03, },
    { 0x0070, 0x0170, 0x10, 0x00, },
    { 0x00A0, 0x0110, 0x11, 0x01, },
    { 0x00A0, 0x0180, 0x12, 0x02, },
    { 0x0080, 0x0130, 0x13, 0x03, },
    { 0x0070, 0x0120, 0x14, 0x00, },
    { 0x0060, 0x0160, 0x05, 0x01, },
    { 0x0080, 0x0110, 0x06, 0x02, },
    { 0x00A0, 0x0100, 0x07, 0x03, },
    { 0x00C0, 0x0180, 0x08, 0x00, },
    { 0x00B0, 0x0160, 0x09, 0x01, },
    { 0x0080, 0x0130, 0x0A, 0x02, },
    { 0x0060, 0x0150, 0x0B, 0x03, },
    { 0x0080, 0x0120, 0x0C, 0x00, },
    { 0x0070, 0x0140, 0x0D, 0x01, },
    { 0x0090, 0x0180, 0x0E, 0x02, },
    { 0xFFA0, 0xFF00, 0x00, 0x00, },
    { 0xFF60, 0xFEC0, 0x01, 0x01, },
    { 0xFF90, 0xFE80, 0x02, 0x02, },
    { 0xFF80, 0xFEE0, 0x03, 0x03, },
    { 0xFFB0, 0xFEF0, 0x04, 0x00, },
    { 0xFF70, 0xFE90, 0x05, 0x01, },
    { 0xFF40, 0xFEC0, 0x06, 0x02, },
    { 0xFFA0, 0xFED0, 0x07, 0x03, },
    { 0xFF50, 0xFF00, 0x08, 0x00, },
    { 0xFF80, 0xFE90, 0x09, 0x01, },
    { 0xFF90, 0xFEE0, 0x0A, 0x02, },
    { 0xFF80, 0xFEF0, 0x0B, 0x03, },
    { 0xFFA0, 0xFEE0, 0x0C, 0x00, },
    { 0xFF60, 0xFEA0, 0x0D, 0x01, },
    { 0xFF70, 0xFEE0, 0x0E, 0x02, },
    { 0xFFA0, 0xFEB0, 0x0F, 0x03, },
    { 0xFF90, 0xFE90, 0x10, 0x00, },
    { 0xFF60, 0xFEF0, 0x11, 0x01, },
    { 0xFF60, 0xFE80, 0x12, 0x02, },
    { 0xFF80, 0xFED0, 0x13, 0x03, },
    { 0xFF90, 0xFEE0, 0x14, 0x00, },
    { 0xFFA0, 0xFEA0, 0x05, 0x01, },
    { 0xFF80, 0xFEF0, 0x06, 0x02, },
    { 0xFF60, 0xFF00, 0x07, 0x03, },
    { 0xFF40, 0xFE80, 0x08, 0x00, },
    { 0xFF50, 0xFEA0, 0x09, 0x01, },
    { 0xFF80, 0xFED0, 0x0A, 0x02, },
    { 0xFFA0, 0xFEB0, 0x0B, 0x03, },
    { 0xFF80, 0xFEE0, 0x0C, 0x00, },
    { 0xFF90, 0xFEC0, 0x0D, 0x01, },
    { 0xFF70, 0xFE80, 0x0E, 0x02, },
    { 0x0000, 0x0000, 0x00, 0x00, },
};

//! FE8U = 0x080C6144
void sub_80C6144(int arg) {

    struct Unknown08AA6858* it = gUnknown_08AA6858;

    while (it->a != 0) {
        int m;
        int n;
        int xOam1;
        int yOam0;

        m = gUnknown_08AA682C[it->c * 2 + 0];
        xOam1 = Interpolate(0, (m * it->a) >> 8, (it->b * m) >> 8, arg, 0x18) + 0x74;

        n = gUnknown_08AA682C[it->c * 2 + 1];
        yOam0 = Interpolate(0, (n * it->a) >> 8, (it->b * n) >> 8, arg, 0x18) + 0x38;

        PutSpriteExt(
            4,
            (xOam1) & 0x01FF,
            ((yOam0) & 0xff) | 0x400,
            gObject_8x8,
            (it->d + 0x2a0) | 0x7400
        );

        it++;
    }

    return;
}

//! FE8U = 0x080C6204
void sub_80C6204(struct TitleScreenProc* proc) {

    int res;

    gLCDControlBuffer.blendCoeffA = Interpolate(0, 0x10, 0, proc->unk_2a, 0x18);

    res = Interpolate(0, 0x10, 0, proc->unk_2a, 0x18);

    CopyToPaletteBuffer(gUnknown_08AAB3F4, 0x1c0, 0x20);

    sub_80C69B0(&gPaletteBuffer[0xe * 0x10], 0x7FFF, res);
    CopyToPaletteBuffer(gUnknown_08AAC58C, 0x1e0, 0x20);

    sub_80C69B0(&gPaletteBuffer[0xf * 0x10], 0x7FFF, res);

    res = Interpolate(0, 0, 0x3f, proc->unk_2a, 0x18);
    nullsub_23(res, proc->unk_30);
    proc->unk_30 = res;

    PutSpriteExt(1, 0x10, 0x55, gUnknown_08AA6794, 0x31A0);

    sub_80C6144(proc->unk_2a);

    if (proc->unk_2a == 0x18) {
        proc->unk_2a = 0;
        Proc_Break(proc);
    } else {
        proc->unk_2a++;
    }

    return;
}

//! FE8U = 0x080C62DC
void sub_80C62DC(struct TitleScreenProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundScreenSize(2, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    Proc_Start(gUnknown_08AA67FC, proc);

    SetSpecialColorEffectsParameters(1, 8, 8, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    return;
}

#if NONMATCHING

//! FE8U = 0x080C6354
void sub_80C6354(struct TitleScreenProc* proc) {
    register int r3 asm("r3");

    proc->unk_2c++;

    proc->unk_2a++;
    r3 = 0xFFFF; // TODO: For some reason, this must get loaded into r3, then moved to r1
    proc->unk_2a &= r3;
    proc->unk_2a = ((proc->unk_2a) & 0x3f);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON)) {
        PlaySoundEffect(0x6D);

        SetNextGameActionId(GAME_ACTION_0);

        Proc_Break(proc);
    } else {
        if (proc->unk_2c == 0x32F) {
            SetNextGameActionId(GAME_ACTION_1);
            Proc_Break(proc);
        }
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80C6354(struct TitleScreenProc* proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, lr}\n\
        adds r4, r0, #0\n\
        ldr r0, [r4, #0x2c]\n\
        adds r2, r0, #1\n\
        str r2, [r4, #0x2c]\n\
        ldrh r0, [r4, #0x2a]\n\
        adds r0, #1\n\
        ldr r3, _080C639C  @ 0xFFFF\n\
        adds r1, r3, #0\n\
        ands r0, r1\n\
        movs r1, #0x3f\n\
        ands r0, r1\n\
        strh r0, [r4, #0x2a]\n\
        ldr r0, _080C63A0  @ gKeyStatusPtr\n\
        ldr r0, [r0]\n\
        ldrh r1, [r0, #8]\n\
        movs r0, #9\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080C63A8\n\
        ldr r0, _080C63A4  @ gRAMChapterData\n\
        adds r0, #0x41\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x1e\n\
        cmp r0, #0\n\
        blt _080C638E\n\
        movs r0, #0x6d\n\
        bl m4aSongNumStart\n\
    _080C638E:\n\
        movs r0, #0\n\
        bl SetNextGameActionId\n\
        adds r0, r4, #0\n\
        bl Proc_Break\n\
        b _080C63BA\n\
        .align 2, 0\n\
    _080C639C: .4byte 0xFFFF\n\
    _080C63A0: .4byte gKeyStatusPtr\n\
    _080C63A4: .4byte gRAMChapterData\n\
    _080C63A8:\n\
        ldr r0, _080C63C0  @ 0x032F\n\
        cmp r2, r0\n\
        bne _080C63BA\n\
        movs r0, #1\n\
        bl SetNextGameActionId\n\
        adds r0, r4, #0\n\
        bl Proc_Break\n\
    _080C63BA:\n\
        pop {r4}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080C63C0: .4byte 0x032F\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080C63C4
void sub_80C63C4(ProcPtr proc) {
    EndAllProcChildren(proc);

    return;
}

//! FE8U = 0x080C63D0
void sub_80C63D0(struct TitleScreenProc* proc) {

    EndAllProcChildren(proc);

    sub_80C55B8();

    gPaletteBuffer[0] = 0;

    EnablePaletteSync();

    proc->unk_29 = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    Sound_PlaySong80024E4(0x43, 0, 0);

    return;
}

struct ProcCmd CONST_DATA gUnknown_08AA6A50[] = {
PROC_LABEL(4),
    PROC_SLEEP(0),

    PROC_CALL(sub_80C55CC),

    PROC_REPEAT(sub_80C56F4),

    PROC_CALL(sub_80C5848),
    PROC_CALL(sub_80C5870),

    PROC_CALL(sub_8013FC4),

    PROC_SLEEP(0),

    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(sub_80C55A4),
    PROC_REPEAT(sub_80C58CC),
    PROC_CALL(sub_80C5A44),
    PROC_REPEAT(sub_80C5AF0),
    PROC_CALL(sub_80C5BD4),
    PROC_REPEAT(sub_80C5C64),
    PROC_CALL(sub_80C5DF0),
    PROC_REPEAT(sub_80C5E60),
    PROC_REPEAT(sub_80C5EA0),
    PROC_SLEEP(0),

    PROC_CALL(sub_80C5F2C),
    PROC_SLEEP(8),

    PROC_CALL(sub_80C5F84),
    PROC_SLEEP(2),

    PROC_CALL(sub_80C5FB4),
    PROC_SLEEP(8),

    PROC_CALL(sub_80C55B8),
    PROC_CALL(sub_80C5FE8),
    PROC_REPEAT(sub_80C6090),
    PROC_CALL(sub_80C6104),
    PROC_REPEAT(sub_80C6204),
    PROC_CALL(sub_80C62DC),

    // fallthrough

PROC_LABEL(1),
    PROC_REPEAT(sub_80C6354),

    // fallthrough

PROC_LABEL(2),
    PROC_CALL(sub_8013F40),

    PROC_SLEEP(0),

    PROC_CALL(sub_80C63C4),

    PROC_GOTO(5),

PROC_LABEL(3),
    PROC_CALL(sub_80C63D0),

    PROC_GOTO(4),

PROC_LABEL(5),

    PROC_END,

};

//! FE8U = 0x080C6424
void sub_80C6424(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gUnknown_08AA6A50, parent);
    proc->unk_29 = 0;

    Sound_PlaySong80024E4(0x43, 0, 0);

    return;
}

//! FE8U = 0x080C6444
void sub_80C6444(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gUnknown_08AA6A50, parent);
    proc->unk_29 = 0;

    return;
}

//! FE8U = 0x080C645C
void sub_80C645C(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gUnknown_08AA6A50, parent);
    proc->unk_29 = 1;

    return;
}
