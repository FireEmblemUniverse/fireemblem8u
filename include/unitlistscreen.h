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
    UNITLIST_MODE_WORLDMAP = 5,
};

enum
{
    UNITLIST_SORTKEY_0  = 0,
    UNITLIST_SORTKEY_1  = 1,
    UNITLIST_SORTKEY_2  = 2,
    UNITLIST_SORTKEY_3  = 3,
    UNITLIST_SORTKEY_4  = 4,
    UNITLIST_SORTKEY_5  = 5,
    UNITLIST_SORTKEY_6  = 6,
    UNITLIST_SORTKEY_7  = 7,
    UNITLIST_SORTKEY_8  = 8,
    UNITLIST_SORTKEY_9  = 9,
    UNITLIST_SORTKEY_10 = 10,
    UNITLIST_SORTKEY_11 = 11,
    UNITLIST_SORTKEY_12 = 12,
    UNITLIST_SORTKEY_13 = 13,
    UNITLIST_SORTKEY_14 = 14,
    UNITLIST_SORTKEY_15 = 15,
    UNITLIST_SORTKEY_16 = 16,
    UNITLIST_SORTKEY_17 = 17,
    UNITLIST_SORTKEY_18 = 18,
    UNITLIST_SORTKEY_19 = 19,
    UNITLIST_SORTKEY_20 = 20,
    UNITLIST_SORTKEY_21 = 21,
    UNITLIST_SORTKEY_22 = 22,
    UNITLIST_SORTKEY_23 = 23,
    UNITLIST_SORTKEY_24 = 24,
    UNITLIST_SORTKEY_25 = 25,
    UNITLIST_SORTKEY_26 = 26,
    UNITLIST_SORTKEY_27 = 27,
    UNITLIST_SORTKEY_28 = 28,
    UNITLIST_SORTKEY_29 = 29,
    UNITLIST_SORTKEY_30 = 30,
    UNITLIST_SORTKEY_31 = 31,
    UNITLIST_SORTKEY_32 = 32,
};

struct UnitListScreenProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 helpActive;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 page;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 pageTarget;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 mode;
    /* 3A */ u8 allyCount;
    /* 3B */ u8 deployedCount;
    /* 3C */ u16 unk_3c;
    /* 3E */ u16 unk_3e;
    /* 44 */ ProcPtr pSpriteProc;
    /* 48 */ ProcPtr pMuralProc;
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

extern struct UnitListScreenField gUnitListScreenFields[][9];

struct SortedUnitEnt
{
    /* 00 */ struct Unit * unit;
    /* 04 */ s16 battleAttack;
    /* 06 */ s16 battleHitRate;
    /* 08 */ s16 battleAvoidRate;
    /* 0A */ u8 supportCount;
};

extern struct SortedUnitEnt gSortedUnitsBuf[];
extern struct SortedUnitEnt * gSortedUnits[];

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
void UnitList_StartStatScreen(struct UnitListScreenProc * proc);
void UnitList_ResetFromStatScreen(struct UnitListScreenProc * proc);
void UnitList_ResetDispFromStatScreen(void);
void UnitListScreenSprites_Init(struct UnitListScreenSpritesProc * proc);
void UnitListScreenSprites_Main(struct UnitListScreenSpritesProc * proc);
void UnitListScreenSprites_Dummy(void);
void sub_8090B48(struct Unit * unit, struct UnitListScreenProc * proc);
void sub_8090C58(struct UnitListScreenProc * proc);
void sub_8090D00(struct UnitListScreenProc * proc);
void sub_8090D80(struct UnitListScreenProc * proc);
void UnitList_Init(struct UnitListScreenProc * proc);
void UnitList_DeployUnit(struct Unit * unit, struct UnitListScreenProc * proc);
void UnitList_UndeployUnit(struct Unit * unit, struct UnitListScreenProc * proc);
void UnitList_TogglePrepDeployState(struct UnitListScreenProc * proc);
void UnitList_ToggleSoloAnimState(struct Unit * unit, int step);
void sub_809144C(struct UnitListScreenProc * proc);
void sub_80917D8(struct UnitListScreenProc * proc);
void UnitList_SetBlendEffects(void);
void sub_8091AEC(struct UnitListScreenProc * proc);
void UnitList_OnEnd(struct UnitListScreenProc * proc);
void UnitList_StartPageChange(struct UnitListScreenProc * proc);
void sub_8091D54(struct UnitListScreenProc * proc);
void sub_8091F10(struct UnitListScreenProc * proc);
void StartUnitListScreenField(void);
void StartUnitListScreenPrepMenu(ProcPtr parent);
void StartUnitListScreenForSoloAnim(ProcPtr parent);
void StartUnitListScreenUnk(ProcPtr parent);
void StartUnitListScreenWorldMap(ProcPtr parent);
void UnitList_DrawColumnNames(u16 * tm, u8 page);
void sub_8092298(u8 maxPages, u8 page, s8 flag);
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName);
int SortUnitList_GetUnitSoloAnimation(struct Unit * unit);
bool SortUnitList(u8 key, u8 order);

#endif // GUARD_UNITLISTSCREEN_H
