#ifndef GUARD_TYPES_H
#define GUARD_TYPES_H

struct BgCoords
{
    u16 x;
    u16 y;
};

struct Struct03003080
{
    /*0x00*/ struct DispCnt dispcnt;
    /*0x04*/ struct DispStat dispstat;
    /*0x08*/ u8 filler8[4];
    /*0x0C*/ struct BgCnt bg0cnt;
    /*0x10*/ struct BgCnt bg1cnt;
    /*0x14*/ struct BgCnt bg2cnt;
    /*0x18*/ struct BgCnt bg3cnt;
    /*0x1C*/ struct BgCoords bgoffset[4];
    /*0x2C*/ u16 win0h;
    /*0x2C*/ u16 win1h;
    /*0x30*/ u16 win0v;
    /*0x30*/ u16 win1v;
    /*0x34*/ struct WinCnt wincnt;
    /*0x38*/ u16 mosaic;
             u8 filler3A[2];
    /*0x3C*/ struct BlendCnt bldcnt;
    /*0x40*/ u8 filler40[4];
    /*0x44*/ u8 blendCoeffA;
    /*0x45*/ u8 blendCoeffB;
    /*0x46*/ u8 blendY;
    /*0x48*/ u16 bg2pa;
    /*0x4A*/ u16 bg2pb;
    /*0x4C*/ u16 bg2pc;
    /*0x4E*/ u16 bg2pd;
    /*0x50*/ u32 bg2x;
    /*0x54*/ u32 bg2y;
    /*0x58*/ u16 bg3pa;
    /*0x5A*/ u16 bg3pb;
    /*0x5C*/ u16 bg3pc;
    /*0x5E*/ u16 bg3pd;
    /*0x60*/ u32 bg3x;
    /*0x64*/ u32 bg3y;
    /*0x68*/ s8 colorAddition;
};

struct Struct0858791C
{
    u8 filler0[4];
    u16 unk2;
};

struct TileDataTransfer
{
    const void *src;
    void *dest;
    u16 size;
    u16 mode;
};

struct OamDataTransfer
{
    void *src;
    void *dest;
    u16 unk8;
    u16 count;
};

struct Struct02024CD4
{
    int unk0;
    int unk4;
};

struct KeyStatusBuffer
{
    u8 repeatDelay;     // initial delay before generating auto-repeat presses
    u8 repeatInterval;  // time between auto-repeat presses
    u8 repeatTimer;     // (decreased by one each frame, reset to repeatDelay when Presses change and repeatInterval when reaches 0)
    u16 heldKeys;       // keys that are currently held down
    u16 repeatedKeys;   // auto-repeated keys
    u16 newKeys;        // keys that went down this frame
    u16 prevKeys;       // keys that were held down last frame
    u16 LastPressState;
    bool16 ABLRPressed; // 1 for Release (A B L R Only), 0 Otherwise
    u16 newKeys2;
    u16 TimeSinceStartSelect; // Time since last Non-Start Non-Select Button was pressed
};

typedef void (*InterruptHandler)(void);

struct Struct0202BCF0 // Chapter Data Struct
{
    /* 00 */ u32 unk0; // a time value
    /* 04 */ u32 unk4; // a time value

    /* 08 */ u32 partyGoldAmount;
    /* 0C */ u8  gameSaveSlot;
    
    /* 0D */ u8  chapterVisionRange; // 0 means no fog
    /* 0E */ s8  chapterIndex;
    
    /* 0F */ u8  chapterPhaseIndex; // 0x00 = Player phase, 0x40 = NPC phase, 0x80 = Enemy phase (0xC0 = link arena 4th team?)

    /* 10 */ u16 chapterTurnNumber;

    /* 12 */ u8  xCursor, yCursor; // map cursor position

    /* 14 */ u8  chapterStateBits; // +0x04 = postgame, +0x10 = in prep screen, +0x40 = difficult mode, +0x80 = link arena?
    /* 15 */ u8  chapterWeatherId;
    /* 16 */ u16 chapterTotalSupportGain;

    /* 18 */ u8  _pad18[0x1B - 0x18]; // unknown yet

    /* 1B */ u8  chapterModeIndex; // 1 for tutorial (ch0-8), 2 for Eirika route, 3 for Ephraim route

    /* 1C */ u8  unk1C[4];

    /* 20 */ char playerName[0x40 - 0x20]; // unused outside of link arena (was tactician name in FE7); Size unknown

    // option byte 1 (of 3)
    u32 unk40_1:5;
    u32 unk40_6:2; // text speed
    u32 unk40_8:1;

    u32 unk41_1:1;
    u32 unk41_2:1;
    u32 unk41_3:6;

    u32 unk42_1:1;
    u32 unk42_2:1;
    u32 unk42_3:1;
    u32 unk42_4:1;
    u32 unk42_5:1;
    u32 unk42_6:1;
    u32 unk42_7:1;
    u32 unk42_8:1;

    u32 unk43_1:8;

    u8  unk44[0x48 - 0x44];

    u16 unk48;

    u16 unk4A_1 : 1;
    u16 unk4A_2 : 3;
};

struct TextBuffer0202A6AC
{
    u8 buffer0202A6AC[0x555];
    u8 buffer0202AC01[0x555];
    u8 buffer0202B156[0x356];
    u8 buffer0202B4AC[0x100];
    u8 buffer0202B5AC[1];  // unknown length
};

struct UnknownItemStruct
{
    u8 filler0[6];
    u16 unk6;
};

struct ROMCharStruct
{
    u16 unk0;
};

struct UnknownStructCTC
{
    struct UnknownStructCTC *unk0;
    s16 unk4;
    s16 unk6;
    u16 unk8;
    u8 fillerA[2];
    const void *unkC;
};

#endif  // GUARD_TYPES_H
