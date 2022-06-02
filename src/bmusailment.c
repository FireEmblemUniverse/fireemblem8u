#include "global.h"

#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"

extern u16 gUnknown_08A032AC[];
extern u16 gUnknown_08A03334[]; // palette
extern u16 gUnknown_08A03354[];

extern u16 gUnknown_02022C28[];
extern u16 gUnknown_02022C48[];
extern u16 gUnknown_02022C68[];

extern struct ProcCmd gUnknown_0859E2D0[];


struct UnknownBMUSAilmentProc {
    PROC_HEADER;
    
    /* 29 */ u8 _pad1[0x2C-0x29];
    /* 2C */ int unk_2C;
    /* 30 */ int _pad2;
    /* 34 */ int unk_34;
    /* 38 */ u8 _pad3[0x4C-0x38];
    
    /* 4C */ s16 unk_4C;
};

void sub_8035AA4() {
    int i;
    u16* src;
    u16* dst;

    ClearBg0Bg1();

    CopyDataWithPossibleUncomp(gUnknown_08A032AC, (u8*)BG_VRAM + 0x5000);
    CopyToPaletteBuffer(gUnknown_08A03334, 0x60, 0x20);

    CallARM_FillTileRect(gBG0TilemapBuffer, gUnknown_08A03354, 0x3280);

    src = gBG0TilemapBuffer;
    dst = gBG0TilemapBuffer + 0x80;
    for (i = 0; i < 7; dst += 0x80, i++) {
        TileMap_CopyRect(src, dst, 2, 4);
    }

    BG_EnableSyncByMask(1);

    return;
}

void sub_8035B0C() {
    BG_SetPosition(0, gUnknown_0202BCB0.camera.x - (gActiveUnit->xPos * 16), GetGameClock());

    return;
}

void sub_8035B44(struct UnknownBMUSAilmentProc* proc) {

    HideUnitSMS(gActiveUnit);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 1;

    gLCDControlBuffer.wincnt.wout_enableBlend = 0;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.wobj_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wobj_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wobj_enableObj = 1;

    sub_8001ED0(1, 0, 0, 0, 0);
    sub_8001F0C(0, 0, 0, 0, 1);

    proc->unk_4C = 0x40;

    return;
}

void sub_8035BEC(struct UnknownBMUSAilmentProc* proc) {

    sub_8028014(
        4,
        gActiveUnit->xPos * 16 - gUnknown_0202BCB0.camera.x,
        gActiveUnit->yPos * 16 - gUnknown_0202BCB0.camera.y,
        0x2800,
        gActiveUnit
    );

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035C44() {
    ShowUnitSMS(gActiveUnit);
    return;
}

void sub_8035C58(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 0;
    proc->unk_34 = 1;

    return;
}

void sub_8035C6C(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 16;
    proc->unk_34 = -1;

    return;
}

void sub_8035C80(struct UnknownBMUSAilmentProc* proc) {

    proc->unk_2C += proc->unk_34;

    SetSpecialColorEffectsParameters(1, proc->unk_2C & 0xFF, 0x10, 0);

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035CB8(struct UnknownBMUSAilmentProc* proc) {
    u16* pal = NULL;

    switch (UNIT_FACTION(gActiveUnit)) {
        case FACTION_BLUE:
            pal = gUnknown_02022C28;
            break;

        case FACTION_RED:
            pal = gUnknown_02022C48;
            break;

        case FACTION_GREEN:
            pal = gUnknown_02022C68;
            break;
    }

    CopyToPaletteBuffer(pal, 0x240, 0x20);

    proc->unk_4C = 0;

    return;
}

void sub_8035D14(struct UnknownBMUSAilmentProc* proc, int unk) {
    if (unk > 31) {
        unk = 31;
    }

    if (unk < 0) {
        unk = 0;
    }

    gPaletteBuffer[0x12F] = (unk << 10) + (unk << 5) + unk;

    EnablePaletteSync();

    return;
}

void sub_8035D44(struct UnknownBMUSAilmentProc* proc) {

    sub_8035D14(proc, proc->unk_4C);
    
    proc->unk_4C++;

    if (proc->unk_4C == 32) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035D70(struct UnknownBMUSAilmentProc* proc) {

    sub_8035D14(proc, proc->unk_4C);

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035D9C() {

    ClearBg0Bg1();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetDefaultColorEffects();

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    return;
}

void sub_8035DDC(struct Unit* unit, ProcPtr proc) {
    gActiveUnit = unit;

    if (proc) {
        Proc_StartBlocking(gUnknown_0859E2D0, proc);
        PlaySoundEffect(0xAA);
        return;
    }

    Proc_StartBlocking(gUnknown_0859E2D0, (ProcPtr) 3);
    return;
}
