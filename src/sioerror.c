#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"

#include "sioerror.h"

//! FE8U = 0x0808DAE4
void OnVBlank_SioError(void) {
    INTR_CHECK = 1;

    FlushLCDControl();
    FlushBackgrounds();
    FlushTiles();
    m4aSoundVSync();
    m4aSoundMain();

    return;
}

//! FE8U = 0x0808DB08
void OnMain_SioErrorWait(void) {
    UpdateKeyStatus(gKeyStatusPtr);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON)) {
        SoftReset(0xff);
    }

    VBlankIntrWait();

    return;
}

struct HelpBoxScrollProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char* unk_2c;
    /* 30 */ struct Font* unk_30;

    /* 34 */ struct Text* unk_34[9]; // unknown size; 3?

    /* 58 */ int unk_58;
    /* 5C */ s16 unk_5c;
    /* 5E */ s16 unk_5e;
    /* 60 */ u16 unk_60;
    ///* 62 */ s16 unk_62; TODO - Harmonize with definition in "helpbox.c"
    ///* 64 */ s16 unk_64; TODO - Harmonize with definition in "helpbox.c"
};

void HelpBoxDrawOneLineExt(struct HelpBoxScrollProc* proc);

//! FE8U = 0x0808DB34
void PutSioErrorMessage(void) {
    int i;
    struct Text th[3];
    struct HelpBoxScrollProc localProcSt;

    struct HelpBoxScrollProc* proc = &localProcSt;

    ResetText();
    InitTalkTextFont();

    for (i = 0; i < 3; i++) {
        InitText(&th[i], 22);
        Text_SetColor(&th[i], 0);
    }

    proc->unk_30 = NULL;

    proc->unk_34[0] = &th[0];
    proc->unk_34[1] = &th[1];
    proc->unk_34[2] = &th[2];

    proc->unk_5c = 0;

    proc->unk_2c = GetStringFromIndex(0x88E);
    /*
    * TODO: msgid:
    *    "Linking error.
    *    Turn the power off, check[.]
    *    the connections, and retry.[.]"
    */

    HelpBoxDrawOneLineExt(proc);

    PutText(&th[0], gBG0TilemapBuffer + TILEMAP_INDEX(4,  6));
    PutText(&th[1], gBG0TilemapBuffer + TILEMAP_INDEX(4,  9));
    PutText(&th[2], gBG0TilemapBuffer + TILEMAP_INDEX(4, 11));

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x0808DBC8
void OnMain_SioError(void) {
    SetupBackgrounds(NULL);

    m4aSoundInit();
    Proc_Init();

    BG_SetPosition(0, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetDefaultColorEffects();
    SetPrimaryHBlankHandler(NULL);

    gLCDControlBuffer.mosaic = 0;

    FlushLCDControl();

    {
        u32 s = gLCDControlBuffer.mosaic & 0x10000; // any 16-bit variable for producing zero
        CpuFastFill(s, (void*)0x06000000, 0x20);
        CpuFastFill(s, (void*)0x06008000, 0x20);
    }

    PutSioErrorMessage();

    PlaySoundEffect(0x7b);

    SetMainUpdateRoutine(OnMain_SioErrorWait);

    return;
}

//! FE8U = 0x0808DC74
void StartSioErrorScreen(void) {
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = 1;
    REG_DISPCNT = DISPCNT_MODE_0;

    SetInterrupt_LCDVBlank(OnVBlank_SioError);
    SetMainUpdateRoutine(OnMain_SioError);

    return;
}
