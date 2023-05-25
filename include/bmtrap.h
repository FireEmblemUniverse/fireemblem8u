#ifndef GUARD_BMTRAP_H
#define GUARD_BMTRAP_H


struct TrapData {
    /* 00 */ u8 type;
    /* 01 */ u8 xPos;
    /* 02 */ u8 yPos;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
} __attribute__((packed));

// ??? sub_80374F4(???);
// ??? sub_8037510(???);
// ??? sub_8037528(???);
// ??? sub_8037540(???);
// ??? sub_80375A0(???);
// ??? GetPickTrapType(???);
// ??? ExecTrap(???);
s8 HandlePostActionTraps(ProcPtr);
s8 sub_80377CC(ProcPtr);
s8 sub_80377F0(ProcPtr, struct Unit*);
s8 sub_8037830(ProcPtr, struct Unit*);
// ??? LoadTrapData(???);
void LoadChapterTraps(void);
void AddGorgonEggTrap(s8 x, s8 y, u8 turnsToHatch, u8 level, u8 unk_05);

#endif // GUARD_BMTRAP_H
