#ifndef GUARD_UNITLISTSCREEN_H
#define GUARD_UNITLISTSCREEN_H

enum
{
    UNITLIST_PAGE_SOLOANIM = 0,
    UNITLIST_PAGE_1 = 1,
    UNITLIST_PAGE_2 = 2,
    UNITLIST_PAGE_3 = 3,
    UNITLIST_PAGE_4 = 4,
    UNITLIST_PAGE_WEXP = 5,
    UNITLIST_PAGE_SUPPORT = 6,
};

enum
{
    UNITLIST_MODE_FIELD = 0,
    UNITLIST_MODE_PREPMENU = 1,
    // UNITLIST_MODE_2 = 2,
    UNITLIST_MODE_SOLOANIM = 3,
    UNITLIST_MODE_4 = 4,
};

struct UnitListScreenProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u16 unk_3c;
    /* 3E */ u16 unk_3e;
    /* 44 */ ProcPtr unk_40;
    /* 48 */ ProcPtr unk_44;
};

struct UnitListScreenSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct UnitListScreenProc * unk_2c;
    /* 30 */ u8 unk_30;
    /* 34 */ ProcPtr unk_34;
    /* 38 */ u16 unk_38;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
    /* 3E */ s16 unk_3e;
    /* 40 */ s16 unk_40;
    /* 42 */ s16 unk_42;
    /* 44 */ s16 unk_44;
    /* 46 */ s16 unk_46;
    /* 48 */ s16 unk_48;
};

struct UnitListScreenField
{
    /* 00 */ u8 sortKey;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ int labelString;
    /* 08 */ u8 xColumn;
    /* 09 */ STRUCT_PAD(0x09, 0x0C);
    /* 0C */ u32 helpTextId;
};

extern struct UnitListScreenField gUnknown_08A17C48[][9];

struct SortedUnitEnt
{
    /* 00 */ struct Unit * unit;
    /* 04 */ s16 battleAttack;
    /* 06 */ s16 battleHitRate;
    /* 08 */ s16 battleAvoidRate;
    /* 0A */ u8 supportCount;
};

extern struct SortedUnitEnt gUnknown_0200D3E0[]; // gSortedUnitsBuf
extern struct SortedUnitEnt * gUnknown_0200D6E0[]; // gSortedUnits

struct Unknown_02013460
{
    /* 00 */ u16 unk_00[8]; // 0x10
    /* 10 */ u16 unk_10; // this is part of unk_00
};

extern struct Unknown_02013460 gUnknown_02013460;

void sub_809014C(void);
void sub_80901BC(u8 x, u8 y, u8 width);
void sub_8090238(u8 key);
void sub_8090324(int unk);
void sub_8090358(u16 arg_0);
void sub_8090418(struct UnitListScreenProc * proc, s8 unk);
void sub_8090514(s8 flag);
void sub_8090620(struct UnitListScreenProc * proc);
void sub_80906AC(struct UnitListScreenProc * proc);
void sub_80906D8(void);
void sub_80906F8(struct UnitListScreenSpritesProc * proc);
void sub_8090784(struct UnitListScreenSpritesProc * proc);
void nullsub_63(void);
void sub_8090B48(struct Unit * unit, struct UnitListScreenProc * proc);
void sub_8090C58(struct UnitListScreenProc * proc);
void sub_8090D00(struct UnitListScreenProc * proc);
void sub_8090D80(struct UnitListScreenProc * proc);
void sub_8091180(struct UnitListScreenProc * proc);
void sub_80911E4(struct Unit * unit, struct UnitListScreenProc * proc);
void sub_8091288(struct Unit * unit, struct UnitListScreenProc * proc);
void sub_809132C(struct UnitListScreenProc * proc);
void sub_80913D8(struct Unit * unit, int step);
void sub_809144C(struct UnitListScreenProc * proc);
void sub_80917D8(struct UnitListScreenProc * proc);
void sub_8091AB4(void);
void sub_8091AEC(struct UnitListScreenProc * proc);
void sub_8091C00(struct UnitListScreenProc * proc);
void sub_8091CC0(struct UnitListScreenProc * proc);
void sub_8091D54(struct UnitListScreenProc * proc);
void sub_8091F10(struct UnitListScreenProc * proc);
void sub_80920C4(void);
void sub_80920DC(ProcPtr parent);
void sub_8092134(ProcPtr parent);
void sub_8092164(ProcPtr parent);
void sub_8092194(ProcPtr parent);
void sub_80921CC(u16 * tm, u8 page);
void sub_8092298(u8 maxPages, u8 page, s8 flag);
void sub_80922F0(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName);
int sub_8092BE4(struct Unit * unit);
bool sub_8092BF0(u8 arg_0, u8 arg_1);

#endif // GUARD_UNITLISTSCREEN_H
