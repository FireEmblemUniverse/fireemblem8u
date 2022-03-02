#include "global.h"
#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"

extern struct Vec2 gUnknown_0203DDE8;

struct Unknown_0203DDEC {
    s8 x;
    s8 y;
    u8 uId;
    u8 tId;
    struct Unknown_0203DDEC* next;
    struct Unknown_0203DDEC* prev;
};

extern struct Unknown_0203DDEC gUnknown_0203DDEC[];

extern int gUnknown_0203E0EC;

struct TargetSelectionProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x30 - 0x29];
    /* 30 */ struct Unknown_0203DDEC* currentTarget;
    /* 34 */ u8 unk_34;
};

void TargetSelection_HandleMoveInput(ProcPtr);
int TargetSelection_HandleSelectInput(ProcPtr);
void EndTargetSelection(ProcPtr);

void InitTargets(int xRoot, int yRoot) {
    gUnknown_0203DDE8.x = xRoot;
    gUnknown_0203DDE8.y = yRoot;
    gUnknown_0203E0EC = 0;
    return;
}

void AddTarget(int x, int y, int unitId, int tId) {
    gUnknown_0203DDEC[gUnknown_0203E0EC].x = x;
    gUnknown_0203DDEC[gUnknown_0203E0EC].y = y;
    gUnknown_0203DDEC[gUnknown_0203E0EC].uId = unitId;
    gUnknown_0203DDEC[gUnknown_0203E0EC].tId = tId;

    gUnknown_0203E0EC++;
    return;
}

#if NONMATCHING

// Register allocation is wrong :(
void LinkTargets() {
    struct Unknown_0203DDEC *iter;
    int r1;
    int r2 = 0;

    if (r2 < gUnknown_0203E0EC) {
        do {
            iter = &gUnknown_0203DDEC[r2];
            iter->prev = iter - 1;
            iter->next = iter + 1;
            ++r2;
        } while (r2 < gUnknown_0203E0EC);
    }

    r1 = gUnknown_0203E0EC - 1;

    iter = &gUnknown_0203DDEC[r1];
    gUnknown_0203DDEC[0].prev = iter;
    iter->next = &gUnknown_0203DDEC[0];

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void LinkTargets() {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        movs r2, #0\n\
        ldr r0, _0804F950  @ gUnknown_0203E0EC\n\
        ldr r1, [r0]\n\
        adds r6, r0, #0\n\
        ldr r4, _0804F954  @ gUnknown_0203DDEC\n\
        cmp r2, r1\n\
        bge _0804F93A\n\
        adds r5, r6, #0\n\
        adds r3, r4, #0\n\
        adds r3, #0xc\n\
        adds r1, r4, #0\n\
        subs r1, #0xc\n\
    _0804F92A:\n\
        str r1, [r1, #0x14]\n\
        str r3, [r1, #0x10]\n\
        adds r3, #0xc\n\
        adds r1, #0xc\n\
        adds r2, #1\n\
        ldr r0, [r5]\n\
        cmp r2, r0\n\
        blt _0804F92A\n\
    _0804F93A:\n\
        ldr r1, [r6]\n\
        subs r1, #1\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r4\n\
        str r0, [r4, #8]\n\
        str r4, [r0, #4]\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0804F950: .4byte gUnknown_0203E0EC\n\
    _0804F954: .4byte gUnknown_0203DDEC\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void TargetSelection_GetRealCursorPosition(ProcPtr proc, int* xPos, int* yPos) {
    *xPos = (((struct TargetSelectionProc*)(proc))->currentTarget)->x * 16;
    *yPos = (((struct TargetSelectionProc*)(proc))->currentTarget)->y * 16;

    return;
}

void TargetSelection_Loop(ProcPtr proc) {
    int x, y;
    int r5;

    if ((0x40 & ((struct TargetSelectionProc*)(proc))->unk_34) != 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        DisplayCursor(x, y, 4);
        return;
    }

    TargetSelection_HandleMoveInput(proc);

    r5 = TargetSelection_HandleSelectInput(proc);

    if ((2 & r5) != 0) {
        EndTargetSelection(proc);
    }

    if ((4 & r5) != 0) {
        PlaySoundEffect(0x6A);
    }

    if ((8 & r5) != 0) {
        PlaySoundEffect(0x6B);
    }

    if ((0x10 & r5) != 0) {
        ClearBg0Bg1();
    }

    if ((0x20 & r5) != 0) {
        DeleteFaceByIndex(0);
    }

    if ((1 & r5) == 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        if (EnsureCameraOntoPosition(proc, x >> 4, y >> 4) != 1) {
            DisplayCursor(x, y, 2);
        }
    }

    return;
}