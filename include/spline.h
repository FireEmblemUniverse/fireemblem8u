#ifndef GUARD_SPLINE_H
#define GUARD_SPLINE_H

struct Struct02003BE8
{
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 * unk_04;
    /* 08 */ int * unk_08;
    /* 0C */ int * unk_0C;
    /* 10 */ int * unk_10;
};

struct UnkSplineStruct1
{
    /* 00 */ s16 unk_00;
    /* 02 */ s16 unk_02;
    /* 04 */ u32 * unk_04;
    /* 08 */ s16 * unk_08;
};

struct UnkSplineStruct2
{
    /* 00 */ s16 unk_00;
    /* 02 */ s16 unk_02;
    /* 04 */ s16 unk_04;
    /* 06 */ s16 unk_06;
    /* 08 */ u32 * unk_08;
    /* 0C */ u32 * unk_0c;
    /* 10 */ u32 * unk_10;
    /* 14 */ s16 * unk_14;
    /* 18 */ s16 * unk_18;
    /* 1C */ s16 * unk_1c;
    /* 20 */ s16 * unk_20;
};

struct UnkSplineStruct3
{
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0c;
};

int sub_800A42C(int a, int b, int c);
// ??? sub_800A4E8(???);
// ??? sub_800A518(???);
// ??? sub_800A680(???);
// ??? sub_800A7D8(???);
// ??? sub_800A8D8(???);
int sub_800A950(void *, int, int *);
// ??? sub_800AB58(???);
// ??? sub_800ACEC(???);
// ??? sub_800AE7C(???);
// ??? sub_800AF64(???);
// ??? sub_800B16C(???);
// ??? sub_800B198(???);
// ??? sub_800B388(???);
// ??? sub_800B574(???);
// ??? sub_800B764(???);
int _DivArm1(int, int, int);
int _DivArm2(int, int, int);

#endif // GUARD_SPLINE_H