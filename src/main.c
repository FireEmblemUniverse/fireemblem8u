#include "global.h"

extern int sub_8001C5C();
extern void SetInterrupt_LCDVBlank(void *func);
extern void ResetKeyStatus(void *keyPtr); // TODO: Uses a struct defining the key info. Define this struct.
extern void UpdateKeyStatus(void *keyPtr); // same as above
extern void StoreRoutinesToIRAM();
extern void sub_80A2C3C();
extern void Initialize6CEngine();
extern void TCS_ClearAll();
extern void ResetMoveunitStructs();
extern void SetOtherRNState(int seed);
extern void GetOtherRN();
extern void sub_8000BC8();
extern void sub_8000D0C();
extern void sub_80A7374();
extern void sub_80A40A8();
extern void sub_80D0178();
extern void sub_80028D0();
extern void GeneralVBlankHandler(void);
extern void sub_80BC81C(void);
extern void SetSomeByte(int);
extern void Font_InitForUIDefault(void);
extern void NewGameControl(void);
extern void ExecMainUpdate();
extern void sub_8001C78();
extern void PrintDebugStringToBG(u16 *bg, u8 *asciiStr);

extern void **gUnknown_0858791C; // contains a pointer to key area (TODO: Define Key Info Struct)
extern u8 gBuildDateTime[]; // "2005/02/04(FRI) 16:55:40...."
extern u8 gYearProjectCreated[]; // "_2003..."
extern void DummyIRQRoutine(void);
extern void GlobalIRQHandler(void);

#define IRQ_COUNT 14
extern void *gIRQHandlers[IRQ_COUNT];
extern u32 IntrMain_Buffer[0x200];

void StoreIRQToIRAM();

void AgbMain()
{
    int waitCnt;
    DmaFill32(3, 0, (void *)IWRAM_START, 0x7F80); // reset the area for the IWRAM ARM section.
    CpuFastFill(0, (void *)EWRAM_START, 0x01040000);    
    waitCnt = (REG_WAITCNT != 0);
    sub_8001C5C(waitCnt);
    if(waitCnt == TRUE)
        RegisterRamReset(~2);
    REG_WAITCNT = 0x45B4;
    StoreIRQToIRAM();
    SetInterrupt_LCDVBlank(0);
    REG_DISPSTAT = 8;
    REG_IME = 1;
    ResetKeyStatus(gUnknown_0858791C);
    UpdateKeyStatus(gUnknown_0858791C);
    StoreRoutinesToIRAM();
    sub_80A2C3C();
    Initialize6CEngine();
    TCS_ClearAll();
    ResetMoveunitStructs();
    SetOtherRNState(0x42D690E9);
    GetOtherRN();
    sub_8000BC8();
    sub_8000D0C();
    sub_80A7374();
    sub_80A40A8();
    sub_80D0178();
    sub_80028D0();
    SetInterrupt_LCDVBlank(GeneralVBlankHandler); // TODO: pass as func via type def
    sub_80BC81C();
    SetSomeByte(1);
    Font_InitForUIDefault();
    NewGameControl();

    // perform the game loop.
    while(1) {
        ExecMainUpdate();
        sub_8001C78();
    };
}

void PrintDebugBuildDateAndTime(u16 *bg)
{
    PrintDebugStringToBG(bg, gBuildDateTime);
    PrintDebugStringToBG(bg - 0x20, gYearProjectCreated); // subtract to print to the line above.
}

void StoreIRQToIRAM(void)
{
    int i;
    for(i = 0; i < IRQ_COUNT; i++)
        gIRQHandlers[i] = DummyIRQRoutine;

    CpuFastCopy(GlobalIRQHandler, IntrMain_Buffer, sizeof IntrMain_Buffer);
    INTR_VECTOR = IntrMain_Buffer;
}

void DummyIRQRoutine(void)
{}

void SetIRQHandler(int index, void *irq)
{
    gIRQHandlers[index] = irq;
}
