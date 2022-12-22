#ifndef GUARD_MAPANIM_H
#define GUARD_MAPANIM_H

enum
{
    MA_FACING_OPPONENT,
    MA_FACING_DEFAULT,
    MA_FACING_UNK,
    MA_FACING_STANDING,
};

struct MAExpBarProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8    pad29[0x64 - 0x29];
    /* 64 */ short expFrom;
    /* 66 */ short expTo;
    /* 68 */ short actorId;
    /* 6A */ short unk6A;
};

struct SumProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x3C - 0x29];

    /* 3C */ int x;
    /* 40 */ int y;

    /* 44 */ u8 pad44[0x64 - 0x44];

    /* 64 */ short unk64;
    /* 66 */ short monsters;
};

struct SumThing
{
    s8 x, y;
    s8 boolAvailable;
    u32 unk04, unk08;
};

extern struct MapAnimState gMapBattle;

void sub_807A708(ProcPtr proc);
void DisplayWpnBrokePopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *);
void DisplayWRankUpPopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *);

#endif  // GUARD_MAPANIM_H
