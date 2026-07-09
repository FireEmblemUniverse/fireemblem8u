#ifndef GUARD_SPLINE_H
#define GUARD_SPLINE_H

struct Struct02003BE8
{
    /* 00 */ s16 unk_00;
    /* 02 */ s16 unk_02;
    /* 04 */ s16 * unk_04;
    /* 08 */ u32 * unk_08;
    /* 0C */ s16 * unk_0C;
    /* 10 */ u32 ** unk_10;
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

int Spline_Ease(int a, int b, int c);
// ??? Spline_PrepareSegmentControls(???);
// ??? Spline_ComputeRightTangents(???);
// ??? Spline_ComputeLeftTangents(???);
// ??? Spline_BuildCubicCoeffs(???);
// ??? Spline_FindSegment(???);
int Spline_Eval(struct Struct02003BE8 *, int, int *);
// ??? Spline_QuaternionToMatrix4x4(???);
// ??? Spline_QuaternionToMatrix3x3(???);
// ??? Spline_EvalTransformChannels(???);
// ??? Spline_EvalIndirect(???);
// ??? Spline_EvalTwoChannels(???);
// ??? Spline_SetupSegment3(???);
// ??? Spline_SetupSegment4(???);
// ??? Spline_SetupSegment3B(???);
// ??? Spline_SetupChannels(???);
int _DivArm1(int, int, int);
int _DivArm2(int, int, int);

#endif // GUARD_SPLINE_H