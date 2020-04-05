#include "global.h"
#include "ap.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "rng.h"
#include "mu.h"
#include "soundwrapper.h"

EWRAM_DATA static struct KeyStatusBuffer sKeyStatusBuffer = {0};

struct KeyStatusBuffer *gKeyStatusPtr = &sKeyStatusBuffer;

// uninitialized memory in the original build due to changing this call to no longer use __FILE__.
const u16 gUninitializedMemory[] = {0x4641, 0x464A, 0x4653, 0x465C};

const char gBuildDateTime[] = "2005/02/04(FRI) 16:55:40";
const char gYearProjectCreated[] = "_2003";

void StoreIRQToIRAM();

void AgbMain()
{
    int waitCnt;

    // clear RAM
    DmaFill32(3, 0, (void *)IWRAM_START, 0x7F80); // reset the area for the IWRAM ARM section.
    CpuFastFill(0, (void *)EWRAM_START, 0x40000);    

    waitCnt = (REG_WAITCNT != 0);
    sub_8001C5C(waitCnt);
    if (waitCnt == TRUE)
        RegisterRamReset(~2);
    REG_WAITCNT = 0x45B4;
    StoreIRQToIRAM();
    SetInterrupt_LCDVBlank(NULL);
    REG_DISPSTAT = 8;
    REG_IME = 1;
    ResetKeyStatus(gKeyStatusPtr);
    UpdateKeyStatus(gKeyStatusPtr);
    StoreRoutinesToIRAM();
    sub_80A2C3C();
    Proc_Init();
    AP_ClearAll();
    MU_Init();
    SetLCGRNValue(0x42D690E9);
    InitRN(AdvanceGetLCGRNValue());
    sub_8000D0C();
    sub_80A7374();
    sub_80A40A8();

    // initialize sound
    m4aSoundInit();
    Sound_SetDefaultMaxNumChannels();

    SetInterrupt_LCDVBlank(GeneralVBlankHandler);
    sub_80BC81C();
    SetSomeByte(1);
    Font_InitForUIDefault();
    NewGameControl();

    // perform the game loop.
    while (1)
    {
        ExecMainUpdate();
        SoftResetIfKeyComboPressed();
    };
}
