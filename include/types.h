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
             s8 unk68;
};

struct Struct0858791C
{
    u8 filler0[4];
    u16 unk2;
};

struct Struct02024CDC
{
    void *unk0;
    void *unk4;
    u16 unk8;
    u16 unkA;
};

struct Struct02024CD4
{
    int unk0;
    int unk4;
};

struct Struct02024E5C
{
    u8 filler0[4];
    u16 unk4;
    s8 unk6;
};

struct KeyStatus
{
    u8 unk00;
    u8 unk01;
    u8 unk02;
    u16 unk04;
    u16 unk06;
    u16 unk08;
    u16 unk0A;
    u16 unk0C;
    u16 unk0E;
    u16 unk10;
    u16 unk12;
};

typedef void (*InterruptHandler)(void);

#endif  // GUARD_TYPES_H
