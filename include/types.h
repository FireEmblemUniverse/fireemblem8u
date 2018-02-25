#ifndef GUARD_TYPES_H
#define GUARD_TYPES_H

struct BgCoords
{
    u16 x;
    u16 y;
};

struct Struct03003080
{
    struct DispCnt dispcnt;
    struct DispStat dispstat;
    u8 filler8[4];
    struct BgCnt bgcnt[4];
    //u16 unk1C[8];
    struct BgCoords bgoffset[4];
    u8 filler2C[0x10];
    u8 unk3C_0:5;
    u8 unk3C_5:1;
    u8 unk3C_6:2;
    u8 unk3D_0:5;
    u8 unk3D_5:1;
    u8 filler3E[0x44-0x3E];
    u8 unk44;
    u8 unk45;
    u8 unk46;
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

#endif  // GUARD_TYPES_H
