#ifndef GUARD_TYPES_H
#define GUARD_TYPES_H

struct Struct03003080
{
    u8 unk0_0:3;
    u8 unk0_3:4;
    u8 unk0_7:1;
    u8 unk1_0:1;
    u8 unk1_1:1;
    u8 unk1_2:1;
    u8 unk1_3:1;
    u8 unk1_4:1;
    u8 unk1_5:1;
    u8 unk1_6:1;
    u8 unk1_7:1;
    u8 filler2[2];
    u8 unk4_0:4;
    u8 unk4_4:1;
    u8 filler5[7];
    u16 unkC[8];
    u16 unk1C[8];
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
