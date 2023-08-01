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
    /* 2A */ STRUCT_PAD(0x2a, 0x34);
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ STRUCT_PAD(0x38, 0x4c);
    /* 4C */ struct GmRouteProc * unk_4c;
};

struct GmNodeIconDisplayProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ u32 unk_2c;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32_0 : 1;
    /* 32 */ u8 unk_32_1 : 1;
    /* 33 */ u8 unk_33;
    /* 34 */ u32* unk_34;
    /* 38 */ struct APHandle * unk_38;
    /* 3C */ struct GmScreenProc * unk_3c;
};

struct GMapUnitProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a; // flags; &1 = do display?, &2 = ?, &4 = ?
    /* 2C */ u16 unk_2c; // AP obj priority node
    /* 2E */ u16 unk_2e;
    /* 30 */ int unk_30; // base tile index for SMS gfx?
    /* 34 */ s8 unk_34; // index within container
    /* 35 */ u8 unk_35; // Allegience color index
    /* 36 */ u8 unk_36; // Palette index
    /* 37 */ s8 unk_37; // current AP anim id (4 initially)
    /* 38 */ u16 unk_38; // class initially
    /* 3A */ u16 unk_3a; // class initially
    /* 3C */ u16 unk_3c; // x
    /* 3E */ u16 unk_3e; // y
    /* 40 */ struct APHandle * unk_40; // ap
};

struct GMapUnitContainerProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ u8 unk_30;
    /* 34 */ struct GMapUnitProc * unk_34[7];
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
    /* 4C */ struct GMapUnitContainerProc * unk_4c; // Gmap Unit Container
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
    /* 01 */ s8 unk_01;  // skirmish type
    /* 02 */ u8 unk_02;  // pre-clear icon
    /* 03 */ u8 unk_03;  // post-clear icon
    /* 04 */ u8 unk_04;  // chapter ID start
    /* 05 */ u8 unk_05;  // chapter ID end
    /* 06 */ s16 unk_06; // event condition flag
    /* 08 */ s8 unk_08[4]; // next destination id
    /* 0C */ u16 * armory;
    /* 10 */ u16 * vendor;
    /* 14 */ u16 * secretShop;
    /* 18 */ s16 x;
    /* 1A */ s16 y;
    /* 1C */ u16 nameTextId;
    /* 1E */ u8 shipTravelFlag;
    /* 1F */ STRUCT_PAD(0x1F, 0x20);
};

extern const struct GMapNodeData gUnknown_082060B0[];

struct NodeIcon
{
    /* 00 */ u16 unk_00; // image sheet number
    /* 02 */ STRUCT_PAD(0x2, 0x4);
    /* 04 */ void * unk_04; // oam table entry
    /* 08 */ s8 unk_08;     // center x
    /* 09 */ s8 unk_09;     // center y
    /* 0A */ s8 unk_0a;     // width
    /* 0B */ s8 unk_0b;     // height
    /* 0C */ s8 unk_0c;     // tcs params??
    /* 0D */ s8 unk_0d;     // ?
    /* 0E */ STRUCT_PAD(0xe, 0xf);
};

extern const struct NodeIcon gUnknown_08205FA0[];

extern struct ProcCmd gProcScr_WorldMapMain[];

#endif // GUARD_WORLDMAP_H
