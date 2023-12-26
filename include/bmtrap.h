#ifndef GUARD_BMTRAP_H
#define GUARD_BMTRAP_H

#include "global.h"

struct TrapData {
    /* 00 */ u8 type;
    /* 01 */ u8 xPos;
    /* 02 */ u8 yPos;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
} __attribute__((packed));

struct UnknownBMTrapProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad_29[0x50-0x29];

    /* 50 */ s16 unk_50;
    /* 52 */ s8 unk_52;
    /* 53 */ s8 unk_53;
    /* 54 */ struct Unit* unit;
};

void sub_80374F4(struct UnknownBMTrapProc * proc);
void sub_8037510(struct UnknownBMTrapProc * proc);
void sub_8037528(struct UnknownBMTrapProc * proc);
void sub_8037540(struct UnknownBMTrapProc * proc);
void sub_80375A0(struct UnknownBMTrapProc * proc);
int GetPickTrapType(struct Unit * unit);
int ExecTrap(ProcPtr proc, struct Unit * unit, int param_3);
bool HandlePostActionTraps(ProcPtr);
bool sub_80377CC(ProcPtr proc);
bool sub_80377F0(ProcPtr proc, struct Unit * unit);
bool sub_8037830(ProcPtr proc, struct Unit * unit);
void LoadTrapData(const struct TrapData * data);
void LoadChapterTraps(void);
void AddGorgonEggTrap(s8 x, s8 y, u8 turnsToHatch, u8 level, u8 unk_05);

extern struct TrapData TrapData_Event_Prologue[];
extern struct TrapData TrapData_Event_PrologueHard[];
extern struct TrapData TrapData_Event_Ch1[];
extern struct TrapData TrapData_Event_Ch1Hard[];

#endif // GUARD_BMTRAP_H
