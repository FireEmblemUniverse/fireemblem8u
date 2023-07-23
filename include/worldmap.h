#ifndef GUARD_WORLDMAP_H
#define GUARD_WORLDMAP_H

struct UnkGmRouteParentProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);

    /* 34 */ u16 unk_34;
    /* 36 */ u16 unk_36;
};

struct GmRouteProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ u32 chr;
    /* 30 */ u8 pal;
    /* 31 */ u8 flags;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 bgA;
    /* 35 */ u8 bgB;
    /* 36 */ s8 x1;
    /* 37 */ s8 y1;
    /* 38 */ s8 x2;
    /* 39 */ s8 y2;
    /* 3A */ u8 bgPriority;
    /* 3C */ s16 unk_3c;
    /* 3E */ s16 unk_3e;
    /* 40 */ struct OpenPaths * pOpenPaths;
};

struct GmScreenProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ STRUCT_PAD(0x2a, 0x4c);

    /* 4C */ struct GmRouteProc * unk_4c;
};

struct GmNodeIconDisplayProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x32);

    /* 32 */ u8 unk_32_0 : 1;
    /* 32 */ u8 unk_32_1 : 1;

    /* 33 */ u8 unk_33;
};

struct WorldMapMainProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29_0 : 1;
    /* 29 */ u8 unk_29_1 : 1;
    /* 29 */ u8 unk_29_2 : 1;
    /* 29 */ u8 unk_29_3 : 1;
    /* 29 */ u8 unk_29_4 : 1;
    /* 29 */ u8 unk_29_5 : 1;
    /* 29 */ u8 unk_29_6 : 1;
    /* 29 */ u8 unk_29_7 : 1;

    /* 2A */ u8 unk_2a;
    /* 2C */ int unk_2c;
    /* 30 */ STRUCT_PAD(0x30, 0x3a);

    /* 3A */ u16 unk_3a;
    /* 3C */ u16 unk_3c; // pad?
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ s8 unk_40;
    /* 41 */ s8 unk_41;
    /* 44 */ struct GmScreenProc * unk_44; // GmapScreen
    /* 48 */ struct GmNodeIconDisplayProc * unk_48; // GmNodeIconDisplay
    /* 4C */ ProcPtr unk_4c; // Gmap Unit
    /* 50 */ ProcPtr unk_50; // Gmap Cursor
    /* 54 */ ProcPtr unk_54; // Gmap MU
};

struct GMapMovementPathData
{
    /* 00 */ int elapsedTime;
    /* 04 */ s16 x;
    /* 06 */ s16 y;
};

struct GMapPathData
{
    /* 00 */ u8 * gfxData;
    /* 04 */ u8 start;
    /* 05 */ u8 end;
    /* 08 */ const struct GMapMovementPathData * movementPath;
};

extern const struct GMapPathData gWMPathData[];

struct GMapNodeData
{
    /* 00 */ u8 placementFlag;
    /* 01 */ s8 unk_01; // skirmish type
    /* 02 */ u8 unk_02; // pre-clear icon
    /* 03 */ u8 unk_03; // post-clear icon
    /* 04 */ u8 unk_04; // chapter ID start
    /* 05 */ u8 unk_05; // chapter ID end
    /* 06 */ u16 unk_06; // event condition flag
    /* 08 */ u8 unk_08; // Eirika 1
    /* 09 */ u8 unk_09; // Ephraim 1
    /* 0A */ u8 unk_0a; // Eirika 2
    /* 0B */ u8 unk_0b; // Ephraim 2
    /* 0C */ u16 * armory;
    /* 10 */ u16 * vendor;
    /* 14 */ u16 * secretShop;
    /* 18 */ u16 x;
    /* 1A */ u16 y;
    /* 1C */ u16 nameTextId;
    /* 1E */ u8 travelFlag;
    /* 1F */ STRUCT_PAD(0x1F, 0x20);
};

extern struct GMapNodeData gUnknown_082060B0[];

extern struct ProcCmd gProcScr_WorldMapMain[];

#endif // GUARD_WORLDMAP_H
