#include "global.h"

#include "spline.h"

//! FE8U = 0x0800AB58
void sub_800AB58(struct UnkSplineStruct3 * arg_0, int * arg_1)
{
    int r4;
    int r5;
    int r7;
    int r8;

    int pa;
    int pb;
    int pc;
    int pd;

    int var_1;
    int var_2;
    int var_3;
    int var_4;
    int var_5;
    int var_6;
    int var_7;
    int var_8;
    int var_9;

    int sp_00;
    int sp_04;
    int sp_08;
    int sp_0c;

    pa = arg_0->unk_00;
    pb = arg_0->unk_04;
    pc = arg_0->unk_08;
    pd = arg_0->unk_0c;

    r4 = DivArm(
        DivArm(0x1000, pa * pa) + DivArm(0x1000, pb * pb) + DivArm(0x1000, pc * pc) + DivArm(0x1000, pd * pd),
        0x2000000);

    r8 = DivArm(0x1000, pa * r4);
    r5 = DivArm(0x1000, pb * r4);
    r7 = DivArm(0x1000, pc * r4);

    var_1 = DivArm(0x1000, pd * r8);
    var_2 = DivArm(0x1000, pd * r5);
    var_3 = DivArm(0x1000, pd * r7);

    var_5 = DivArm(0x1000, pa * r8);
    var_7 = DivArm(0x1000, pa * r5);
    var_8 = DivArm(0x1000, pa * r7);

    var_6 = DivArm(0x1000, pb * r5);
    var_9 = DivArm(0x1000, pb * r7);
    var_4 = DivArm(0x1000, pc * r7);

    arg_1[0] = 0x1000 - (var_6 + var_4);
    arg_1[1] = var_7 + var_3;
    arg_1[2] = var_8 - var_2;

    arg_1[4] = var_7 - var_3;
    arg_1[5] = 0x1000 - (var_4 + var_5);
    arg_1[6] = var_9 + var_1;

    arg_1[8] = var_8 + var_2;
    arg_1[9] = var_9 - var_1;
    arg_1[10] = 0x1000 - (var_5 + var_6);

    arg_1[14] = 0;
    arg_1[13] = 0;
    arg_1[12] = 0;

    arg_1[11] = 0;
    arg_1[7] = 0;
    arg_1[3] = 0;

    arg_1[15] = 0x1000;

    return;
}

//! FE8U = 0x0800ACEC
void sub_800ACEC(struct UnkSplineStruct3 * arg_0, int * arg_1)
{
    int r4;
    int r5;
    int r7;
    int r8;

    int p_a;
    int p_b;
    int p_c;
    int p_d;

    int var_1;
    int var_2;
    int var_3;
    int var_4;
    int var_5;
    int var_6;
    int var_7;
    int var_8;
    int var_9;

    int sp_00;
    int sp_04;
    int sp_08;
    int sp_0c;

    p_a = arg_0->unk_00;
    p_b = arg_0->unk_04;
    p_c = arg_0->unk_08;
    p_d = arg_0->unk_0c;

    r4 = DivArm(
        DivArm(0x1000, p_a * p_a) + DivArm(0x1000, p_b * p_b) + DivArm(0x1000, p_c * p_c) + DivArm(0x1000, p_d * p_d),
        0x2000000);

    r8 = DivArm(0x1000, p_a * r4);
    r5 = DivArm(0x1000, p_b * r4);
    r7 = DivArm(0x1000, p_c * r4);

    var_1 = DivArm(0x1000, p_d * r8);
    var_2 = DivArm(0x1000, p_d * r5);
    var_3 = DivArm(0x1000, p_d * r7);

    var_5 = DivArm(0x1000, p_a * r8);
    var_7 = DivArm(0x1000, p_a * r5);
    var_8 = DivArm(0x1000, p_a * r7);

    var_6 = DivArm(0x1000, p_b * r5);
    var_9 = DivArm(0x1000, p_b * r7);
    var_4 = DivArm(0x1000, p_c * r7);

    arg_1[0] = 0x1000 - (var_6 + var_4);
    arg_1[1] = var_7 + var_3;
    arg_1[2] = var_8 - var_2;
    arg_1[3] = var_7 - var_3;
    arg_1[4] = 0x1000 - (var_4 + var_5);
    arg_1[5] = var_9 + var_1;
    arg_1[6] = var_8 + var_2;
    arg_1[7] = var_9 - var_1;
    arg_1[8] = 0x1000 - (var_5 + var_6);

    arg_1[11] = 0x1000;
    arg_1[10] = 0x1000;
    arg_1[9] = 0x1000;

    return;
}

struct UnkSplineSub800AE7C
{
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ u16 unk_08;
    /* 0C */ s16 * unk_0c;
    /* 10 */ int * unk_10;
    /* 14 */ int * unk_14;
    /* 18 */ int * unk_18;
    /* 1C */ u16 unk_1c;
    /* 20 */ s16 * unk_20;
    /* 24 */ int * unk_24;
    /* 28 */ int * unk_28;
    /* 2C */ int * unk_2c;
    /* 30 */ u16 unk_30;
    /* 34 */ s16 * unk_34;
    /* 38 */ int * unk_38;
    /* 3C */ int * unk_3c;
    /* 40 */ int * unk_40;
};

struct Struct02003BE8_B
{
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 * unk_04;
    /* 08 */ void * unk_08;
    /* 0C */ int * unk_0c;
    /* 10 */ int * unk_10;
};

//! FE8U = 0x0800AE7C
int sub_800AE7C(struct UnkSplineSub800AE7C * arg_0, int arg_1, int * arg_2, int * arg_3, int * arg_4)
{
    int ret;
    struct Struct02003BE8_B local;

    int flags = arg_0->unk_00;

    if ((flags & 4) != 0)
    {
        local.unk_02 = arg_0->unk_08;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_0c;
        local.unk_08 = arg_0->unk_10;
        local.unk_0c = arg_0->unk_14;
        local.unk_10 = arg_0->unk_18;

        ret = sub_800A950(&local, arg_1, arg_2);

        if (ret < 0)
        {
            arg_2[2] = 0;
            arg_2[1] = 0;
            arg_2[0] = 0;
        }
    }

    if ((flags & 8) != 0)
    {
        local.unk_02 = arg_0->unk_1c;
        local.unk_00 = 4;
        local.unk_04 = arg_0->unk_20;
        local.unk_08 = arg_0->unk_24;
        local.unk_0c = arg_0->unk_28;
        local.unk_10 = arg_0->unk_2c;

        ret = sub_800A950(&local, arg_1, arg_3);

        if (ret < 0)
        {
            arg_3[2] = 0;
            arg_3[1] = 0;
            arg_3[0] = 0;
            arg_3[3] = 1;
        }
    }

    if ((flags & 0x10) != 0)
    {
        local.unk_02 = arg_0->unk_30;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_34;
        local.unk_08 = arg_0->unk_38;
        local.unk_0c = arg_0->unk_3c;
        local.unk_10 = arg_0->unk_40;

        ret = sub_800A950(&local, arg_1, arg_4);

        if (ret < 0)
        {
            arg_4[2] = 0;
            arg_4[1] = 0;
            arg_4[0] = 0;
        }
    }

    return ret;
}
