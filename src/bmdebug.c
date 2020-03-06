//
// Created by laqieer on 2020/3/3.
//

#include "bmdebug.h"

// if current seconds is even, return 2; else return 3
int Return2or3BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    ComputeDisplayTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) == 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// if current seconds is even, return 3; else return 2
int Return3or2BySecondParity(void)
{
    int retVal;
    unsigned short hours;
    unsigned short minutes;
    unsigned short seconds;

    ComputeDisplayTime(GetGameClock(),&hours,&minutes,&seconds);
    if ((seconds & 1) != 0) {
        retVal = 2;
    }
    else {
        retVal = 3;
    }
    return retVal;
}

// return 8
int Get8(void)
{
    return 8;
}

// return 23
int Get23(void)
{
    return 23;
}

// do nothing, return directly
void DummyFunction(void)
{

}

void Loop6C_WaitForSelectPress(struct Proc *proc)
{
    if (gKeyStatusPtr->newKeys & SELECT_BUTTON) {
        Proc_ClearNativeCallback(proc);
    }
}

void SetNewKeyStatusWith16(void)
{
    NewKeyStatusSetter(16);
}


// do nothing, return directly
void DummyFunction2(void)
{

}

#ifdef NONMATCHING

void DebugPrintWithProc(struct DebugPrintProc *proc)
{
    int x;
    int y;
    int width;
    const char *text;
    struct TextHandle textHandler;
    int tiles;

    x = proc->x;
    y = proc->y;
    width = proc->width;
    text = proc->text;
    Text_Init(&textHandler, width);
    Text_AppendString(&textHandler, text);
    DrawUiFrame2(x, y, width + 2, 4, 0);
    tiles = (y + 1) * 32 + 1 + x;
    Text_Draw(&textHandler, &gBG0TilemapBuffer[tiles]);
    BG_EnableSyncByMask(3);
}

#else // NONMATCHING

__attribute__((naked))
void DebugPrintWithProc(struct DebugPrintProc *proc)
{
    asm(
        ".syntax unified\n
        push {r4, r5, r6, lr}\n
        mov r6, r8\n
        push {r6}\n
        sub sp, #0xc\n
        ldr r1, [r0, #0x2c]\n
        mov r8, r1\n
        ldr r4, [r0, #0x30]\n
        adds r1, r0, #0\n
        adds r1, #0x52\n
        ldrh r5, [r1]\n
        ldr r6, [r0, #0x54]\n
        add r0, sp, #4\n
        adds r1, r5, #0\n
        bl Text_Init\n
        add r0, sp, #4\n
        adds r1, r6, #0\n
        bl Text_AppendString\n
        adds r5, #2\n
        movs r0, #0\n
        str r0, [sp]\n
        mov r0, r8\n
        adds r1, r4, #0\n
        adds r2, r5, #0\n
        movs r3, #4\n
        bl DrawUiFrame2\n
        adds r4, #1\n
        lsls r4, r4, #5\n
        adds r4, #1\n
        add r4, r8\n
        lsls r4, r4, #1\n
        ldr r0, _0801BAE8  @ gBG0TilemapBuffer\n
        adds r4, r4, r0\n
        add r0, sp, #4\n
        adds r1, r4, #0\n
        bl Text_Draw\n
        movs r0, #3\n
        bl BG_EnableSyncByMask\n
        add sp, #0xc\n
        pop {r3}\n
        mov r8, r3\n
        pop {r4, r5, r6}\n
        pop {r0}\n
        bx r0\n
        .align 2, 0\n
    _0801BAE8: .word gBG0TilemapBuffer"
    );
}

#endif
