#ifndef GUARD_MAPANIM_H
#define GUARD_MAPANIM_H

#include "fontgrp.h"

enum {
    MA_FACING_OPPONENT,
    MA_FACING_DEFAULT,
    MA_FACING_UNK,
    MA_FACING_STANDING,
};

struct MAExpBarProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8    pad29[0x64 - 0x29];
    /* 64 */ short expFrom;
    /* 66 */ short expTo;
    /* 68 */ short actorId;
    /* 6A */ short timer;
};

enum summonDK_proc_lables {
    PROC_LABEL_SUMDK_LOAD_START,
    PROC_LABEL_SUMDK_LOAD_TERMINAL,
    PROC_LABEL_SUMDK_LOAD_POS_DOWN,
    PROC_LABEL_SUMDK_LOAD_POS_RIGHT,
    PROC_LABEL_SUMDK_LOAD_POS_LEFT,
    PROC_LABEL_SUMDK_LOAD_POS_UP,
    PROC_LABEL_SUMDK_LOAD_POS_END,
};

struct SumProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x3C - 0x29];

    /* 3C */ int x;
    /* 40 */ int y;

    /* 44 */ u8 pad44[0x64 - 0x44];

    /* 64 */ short counter;
    /* 66 */ short monsters;
};

struct SumThing {
    s8 x, y;
    s8 boolAvailable;
    u32 unk04, unk08;
};

struct MAInfoFrameProc {
    PROC_HEADER;

    /* 2A */ short unk2A;
    /* 2C */ u16 unk2C;
    /* 2E */ u8 x;
    /* 2F */ u8 y;
    /* 30 */ struct Proc* maMain;
};

struct MADebugProc {
    PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

struct MADebugInfoEntry {
    /* 00 */ short data[10];
    /* 14 */ struct TextHandle text[10];
};

struct MADebugInfo {
    /* 00 */ u8 pad00[8];
    /* 08 */ struct MADebugInfoEntry infos[2];
};

struct Unk089A3798 {
    /* 00 */ u8 a; s8 b, c, d, e; u8 f, g;
};

extern struct MapAnimState gCurrentMapAnimState;
extern CONST_DATA struct MADebugInfo* gUnknown_089A3810;
extern CONST_DATA struct Unk089A3798 gUnknown_089A3798[];

void MapAnimProc_DisplayItemStealingPopup(ProcPtr proc);
void DisplayWpnBrokePopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *);
void DisplayWRankUpPopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *);

#endif  // GUARD_MAPANIM_H
