#include "global.h"

#include "spline.h"

//! FE8U = 0x0800A42C
int sub_800A42C(int val, int start, int end)
{
#if NONMATCHING
    int num1 = start + end;
#else
    register int num1 asm("r6") = start + end;
#endif

    if (num1 == 0)
        return val;

    if (num1 > 0x1000)
    {
        start = DivArm(num1, start * 0x1000);
        end = DivArm(num1, end * 0x1000);
    }

    num1 = DivArm(0x2000 - start - end, 0x1000000);

    if (val < start)
    {
        if (start == 0)
            start = 1;

        return DivArm(0x1000, DivArm(0x1000, DivArm(start, num1 * 0x1000) * val) * val);
    }

    if (val < (0x1000 - end))
    {
        return DivArm(0x1000, num1 * (DivArm(0x1000, val * 0x2000) - start));
    }

    val = 0x1000 - val;
    if (end == 0)
        end = 1;

    return 0x1000 - DivArm(0x1000, DivArm(0x1000, DivArm(end, num1 * 0x1000) * val) * val);
}

//! FE8U = 0x0800A4E8
void sub_800A4E8(struct UnkSplineStruct1 * src, struct UnkSplineStruct2 * dest)
{
    dest->unk_00 = src->unk_00;

    dest->unk_04 = src->unk_02;
    dest->unk_0c = src->unk_04;
    dest->unk_18 = src->unk_08;

    src++;

    dest->unk_02 = src->unk_02;
    dest->unk_08 = src->unk_04;
    dest->unk_14 = src->unk_08;

    src++;

    dest->unk_06 = src->unk_02;
    dest->unk_10 = src->unk_04;
    dest->unk_1c = src->unk_08;

    return;
}

//! FE8U = 0x0800A518
void sub_800A518(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2)
{
    int i;
    int sp_08;
    int sp_0c;
    int sp_10;

    int sp_14 = arg_0->unk_00;
    s16 * r1 = arg_0->unk_14;
    int r5 = arg_0->unk_02;
    int r3 = arg_0->unk_04;
    int r2 = arg_0->unk_06;

    int * sp_18 = arg_0->unk_08;
    int * sp_1c = arg_0->unk_0c;
    int * r9 = arg_0->unk_10;

    int r4 = 0x1000 - r1[0];
    int r8 = r1[1];
    int r7 = r1[2];

    if ((r2 == r5) || (r2 == r3))
    {
        sp_10 = 0;
    }
    else
    {
        sp_10 = DivArm(0x1000, DivArm(r2 - r3, (r5 - r3) * 0x1000) << 0xd);
    }

    r5 = (r7 > 0) ? r7 : -r7;

    sp_10 = (sp_10 + r5) - DivArm(0x1000, r5 * sp_10);
    sp_08 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r4 * (0x1000 - r7)) * (r8 + 0x1000)) << 0xb);
    sp_0c = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r4 * (r7 + 0x1000)) * (0x1000 - r8)) << 0xb);

    for (i = 0; i < sp_14; i++)
    {
        int a = sp_18[i] - sp_1c[i];
        int b = r9[i] - sp_18[i];

        *arg_1 = DivArm(0x1000, sp_10 * (DivArm(0x1000, sp_08 * a) + DivArm(0x1000, sp_0c * b)));

        if (arg_2 == 2)
        {
            *arg_1 = DivArm(0x1000, (sp_08 + sp_0c) * a);
        }
        arg_1++;
    }

    return;
}

//! FE8U = 0x0800A680
void sub_800A680(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2)
{
    int i;
    int sp_04;
    int sp_08;
    int sp_0c;

    int sp_10 = arg_0->unk_00;
    s16 * r1 = arg_0->unk_14;
    int r4 = arg_0->unk_02;
    int r3 = arg_0->unk_04;
    int r2 = arg_0->unk_06;

    int * sp_14 = arg_0->unk_08;
    int * sp_18 = arg_0->unk_0c;
    int * r9 = arg_0->unk_10;

    int r7 = 0x1000 - r1[0];
    int r8 = r1[1];
    int r6 = r1[2];

    if ((r2 == r4) || (r2 == r3))
    {
        sp_0c = 0;
    }
    else
    {
        sp_0c = DivArm(0x1000, DivArm(r2 - r3, (r2 - r4) * 0x1000) << 0xd);
    }

    r4 = (r6 > 0) ? r6 : -r6;

    sp_0c = (sp_0c + r4) - DivArm(0x1000, r4 * sp_0c);
    sp_04 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r7 * (r6 + 0x1000)) * (r8 + 0x1000)) << 0xb);
    sp_08 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r7 * (0x1000 - r6)) * (0x1000 - r8)) << 0xb);

    for (i = 0; i < sp_10; i++)
    {
        int a = sp_14[i] - sp_18[i];
        int b = r9[i] - sp_14[i];

        *arg_1 = DivArm(0x1000, sp_0c * (DivArm(0x1000, sp_04 * a) + DivArm(0x1000, sp_08 * b)));

        if (arg_2 == 1)
        {
            *arg_1 = DivArm(0x1000, (sp_04 + sp_08) * b);
        }

        arg_1++;
    }

    return;
}

//! FE8U = 0x0800A7D8
void sub_800A7D8(struct UnkSplineStruct1 * arg_0, struct UnkSplineStruct3 * arg_1, int arg_2)
{
    int * r8;
    int * r9;
    int sp_44;
    int * sp_48;
    int * sp_4c;
    int i;
    int * sl;
    int * r9_;
    struct UnkSplineStruct2 unk;
    int arrayA[4];
    int arrayB[4];

    sp_44 = arg_0->unk_00;

    r8 = arg_0[1].unk_04;
    r9 = arg_0[2].unk_04;

    sub_800A4E8(arg_0 + 0, &unk);
    sub_800A680(&unk, arrayB, arg_2);

    sub_800A4E8(arg_0 + 1, &unk);
    sub_800A518(&unk, arrayA, arg_2);

    sl = r8;
    r9_ = r9;
    sp_48 = arrayB;
    sp_4c = arrayA;

    for (i = 0; i < sp_44; i++)
    {
        arg_1->unk_00 = (DivArm(0x1000, *sl << 0xd) - DivArm(0x1000, *r9_ << 0xd)) + *sp_48 + *sp_4c;
        arg_1->unk_04 =
            ((DivArm(0x1000, *sl * -0x3000) + DivArm(0x1000, *r9_ * 0x3000)) - DivArm(0x1000, *sp_48 << 0xd)) - *sp_4c;
        arg_1->unk_08 = *sp_48;
        arg_1->unk_0c = *sl;

        sp_48++;
        sp_4c++;
        sl++;
        r9_++;
        arg_1++;
    }

    return;
}

//! FE8U = 0x0800A8D8
int sub_800A8D8(s16 * arg_0, s16 arg_1, int * arg_2, int * arg_3)
{
    int r2;
    int r3;

    int r4 = arg_0[0] * 0x1000;

    if (*arg_2 < r4)
    {
        *arg_3 = 0;
        *arg_2 = r4;
        return -2;
    }

    r2 = arg_0[arg_1 - 1] * 0x1000;

    if (*arg_2 > r2)
    {
        *arg_3 = arg_1 - 1;
        *arg_2 = r2;
        return -2;
    }

    r3 = 0;

    while (1)
    {
        if (arg_0[r3] * 0x1000 <= *arg_2 && arg_0[r3 + 1] * 0x1000 >= *arg_2)
        {
            break;
        }

        r3++;
    }

    *arg_3 = r3;

    return 0;
}

u32 CONST_DATA gUnknown_08591AB4[3] = { 0, 0, 0 };

//! FE8U = 0x0800A950
int sub_800A950(struct Struct02003BE8 * params, int mode, int * results)
{
    int i;
    struct UnkSplineStruct1 * sp_00[4];
    struct UnkSplineStruct1 sp_10[4];
    struct UnkSplineStruct3 sp_a0[4];
    struct UnkSplineStruct3 * r4;
    u32 * r4_;
    int r5;
    s16 * r8;
    s16 * r9;
    u32 ** sl;
    u32 sp_80;
    int sp_84;
    u32 sp_8c;
    u32 * sp_90;
    int sp_94;
    int sp_98;

    sp_8c = params->unk_00;
    r9 = params->unk_04;
    sp_90 = params->unk_08;
    r8 = params->unk_0C;
    sl = params->unk_10;

    sp_80 = mode;

    if (sp_80 == 0)
    {
        sp_94 = 0;
    }
    else
    {
        sp_94 = params->unk_02 - 1;
    }

    for (i = 0; i < 4; i++)
    {
        sp_00[i] = &sp_10[i];
    }

    if (params->unk_02 == 0)
    {
        return -1;
    }

    sub_800A8D8(r9, params->unk_02, &sp_80, &sp_84);

    if (sp_84 == 0)
    {
        sp_98 = 1;
    }
    else if (sp_84 == params->unk_02 - 1)
    {
        sp_98 = 2;
    }
    else
    {
        sp_98 = 0;
    }

    if (params->unk_10 == NULL)
    {
        r4_ = gUnknown_08591AB4;
    }
    else
    {
        r4_ = (u32 *)params->unk_10;
    }

    for (i = 0; i < 4; i++)
    {
        sp_10[i].unk_00 = params->unk_00;

        if (sp_84 + i - 1 < 1)
        {
            sp_10[i].unk_02 = r9[0];
            sp_10[i].unk_04 = sp_90;
            sp_10[i].unk_08 = (s16 *)r4_;
        }
        else if (sp_84 + i - 1 >= sp_94)
        {
            sp_10[i].unk_02 = r9[sp_94];
            sp_10[i].unk_04 = &sp_90[sp_94 * sp_8c];

            if (r8 != NULL)
            {
                sp_10[i].unk_08 = (s16 *)&r4_[r8[sp_94] * 3];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)r4_;
            }
        }
        else
        {
            sp_10[i].unk_02 = r9[sp_84 + i - 1];
            sp_10[i].unk_04 = &sp_90[(sp_84 + i - 1) * sp_8c];

            if (r8 != NULL)
            {
                sp_10[i].unk_08 = (s16 *)&r4_[r8[(sp_84 + i - 1)] * 3];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)r4_;
            }
        }
    }

    sub_800A7D8(*sp_00, sp_a0, sp_98);

    if (params->unk_02 > sp_84 + 1)
    {
        r5 = DivArm(r9[sp_84 + 1] - r9[sp_84], sp_80 - r9[sp_84] * 0x1000);
    }
    else
    {
        r5 = sp_80 - r9[sp_84] * 0x1000;
    }

    r4 = sp_a0;
    for (i = 0; i < sp_8c; i++)
    {
        results[i] =
            DivArm(0x1000, r5 * (DivArm(0x1000, r5 * (DivArm(0x1000, r5 * r4->unk_00) + r4->unk_04)) + r4->unk_08)) +
            r4->unk_0c;
        r4++;
    }

    return sp_84;
}

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

        ret = sub_800A950((void *)&local, arg_1, arg_2);

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

        ret = sub_800A950((void *)&local, arg_1, arg_3);

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

        ret = sub_800A950((void *)&local, arg_1, arg_4);

        if (ret < 0)
        {
            arg_4[2] = 0;
            arg_4[1] = 0;
            arg_4[0] = 0;
        }
    }

    return ret;
}

//! FE8U = 0x0800AF64
int sub_800AF64(struct Struct02003BE8 * params, int mode, int * results)
{
    int i;
    struct UnkSplineStruct1 * sp_00[4];
    struct UnkSplineStruct1 sp_10[4];
    struct UnkSplineStruct3 sp_a0[4];
    struct UnkSplineStruct3 * r4;
    int r5;
    s16 * r8;
    s16 * r9;
    u32 ** sl;
    u32 sp_80;
    int sp_84;
    u32 sp_8c;
    u32 * sp_90;
    int sp_94;
    int sp_98;

    sp_8c = params->unk_00;
    r9 = params->unk_04;
    sp_90 = params->unk_08;
    r8 = params->unk_0C;
    sl = params->unk_10;

    sp_80 = mode;

    if (sp_80 == 0)
    {
        sp_94 = 0;
    }
    else
    {
        sp_94 = params->unk_02 - 1;
    }

    for (i = 0; i < 4; i++)
    {
        sp_00[i] = &sp_10[i];
    }

    if (params->unk_02 == 0)
    {
        return -1;
    }

    sub_800A8D8(r9, params->unk_02, &sp_80, &sp_84);

    if (sp_84 == 0)
    {
        sp_98 = 1;
    }
    else if (sp_84 == params->unk_02 - 1)
    {
        sp_98 = 2;
    }
    else
    {
        sp_98 = 0;
    }

    for (i = 0; i < 4; i++)
    {
        sp_10[i].unk_00 = params->unk_00;

        if (sp_84 + i - 1 < 1)
        {
            sp_10[i].unk_02 = r9[0];
            sp_10[i].unk_04 = (void *)sp_90[0];

            if (sl[0] != NULL)
            {
                sp_10[i].unk_08 = (s16 *)sl[0];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)gUnknown_08591AB4;
            }
        }
        else if (sp_84 + i - 1 >= sp_94)
        {
            sp_10[i].unk_02 = r9[sp_94];
            sp_10[i].unk_04 = (void *)sp_90[sp_94];

            if (r8 != NULL && sl[r8[sp_94]] != NULL)
            {
                sp_10[i].unk_08 = (s16 *)sl[r8[sp_94]];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)gUnknown_08591AB4;
            }
        }
        else
        {
            sp_10[i].unk_02 = r9[sp_84 + i - 1];
            sp_10[i].unk_04 = (void *)sp_90[sp_84 + i - 1];

            if (r8 != NULL && sl[r8[sp_84 + i - 1]] != NULL)
            {
                sp_10[i].unk_08 = (s16 *)sl[r8[sp_84 + i - 1]];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)gUnknown_08591AB4;
            }
        }
    }

    sub_800A7D8(*sp_00, sp_a0, sp_98);

    if (params->unk_02 > sp_84 + 1)
    {
        r5 = DivArm(r9[sp_84 + 1] - r9[sp_84], sp_80 - r9[sp_84] * 0x1000);
    }
    else
    {
        r5 = sp_80 - r9[sp_84] * 0x1000;
    }

    r4 = sp_a0;
    for (i = 0; i < sp_8c; i++)
    {
        results[i] =
            DivArm(0x1000, r5 * (DivArm(0x1000, r5 * (DivArm(0x1000, r5 * r4->unk_00) + r4->unk_04)) + r4->unk_08)) +
            r4->unk_0c;
        r4++;
    }

    return sp_84;
}

struct InputStructA
{
    /* 00 */ s16 unk_00;
    /* 04 */ s16 * unk_04;
    /* 08 */ void * unk_08;
    /* 0C */ s16 * unk_0c;
    /* 10 */ void * unk_10;
};

struct InputStructB
{
    /* 00 */ int unk_00;
    /* 04 */ s16 * unk_04;
    /* 08 */ void ** unk_08;
    /* 0C */ int unk_0c;
    /* 10 */ void ** unk_10;
};

struct astruct_13
{
    /* 00 */ int unk_00;
    /* 04 */ struct InputStructB * unk_04;
    /* 08 */ struct InputStructB * unk_08;
    /* 0C */ int unk_0c;
    /* 10 */ int * unk_10;
    /* 14 */ int * unk_14;
};

struct astruct_12
{
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ struct InputStructA unk_08;
    /* 1C */ struct InputStructA unk_1c;
};

int sub_800A8D8(s16 *, s16, int *, int *);

struct astruct_16
{
    int unk_00;
    struct Struct02003BE8 * unk_04;
    struct Struct02003BE8 * unk_08;
    int unk_0c;
    int * unk_10;
    int * unk_14;
};

//! FE8U = 0x0800B16C
int sub_800B16C(struct astruct_16 * arg_0)
{
    int ret;

    if (arg_0->unk_04 != 0)
    {
        ret = sub_800AF64(arg_0->unk_04, arg_0->unk_00, arg_0->unk_10);
    }

    if (arg_0->unk_08 != 0)
    {
        ret = sub_800AF64(arg_0->unk_08, arg_0->unk_00, arg_0->unk_14);
    }

    return ret;
}

//! FE8U = 0x0800B198
int sub_800B198(struct InputStructA * arg_0, struct InputStructB * arg_1, int * arg_2, int arg_3, s16 arg_4)
{
    s16 * r8;
    struct Struct02003BE8_B local;
    int r9;
    int sp_18;

    sub_800A8D8(r8 = arg_0->unk_04, r9 = arg_0->unk_00, &arg_3, &sp_18);

    arg_1->unk_04[1] = arg_4;

    if ((sp_18 < r9 - 1) && (r8[sp_18 + 1] == (s16)DivArm(0x1000, arg_3)))
    {
        arg_1->unk_08[1] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];

        if (sp_18 < r9 - 2)
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 2]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 6;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 2] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }
    }
    else
    {
        local.unk_02 = arg_0->unk_00;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_04;
        local.unk_08 = (void *)arg_0->unk_08;
        local.unk_0c = (void *)arg_0->unk_0c;
        local.unk_10 = (void *)arg_0->unk_10;

        if (sub_800A950((void *)&local, arg_3, arg_2) < 0)
        {
            arg_2[2] = 0;
            arg_2[1] = 0;
            arg_2[0] = 0;
        }

        arg_1->unk_08[1] = arg_2;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];

        if (sp_18 >= r9 - 1)
        {
            arg_1->unk_04[2] = arg_4 + 1;
            arg_1->unk_08[2] = arg_2;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x0800B388
int sub_800B388(struct InputStructA * arg_0, struct InputStructB * arg_1, int * arg_2, int arg_3, s16 arg_4)
{
    s16 * r8;
    struct Struct02003BE8_B local;
    int r9;
    int sp_18;

    sub_800A8D8(r8 = arg_0->unk_04, r9 = arg_0->unk_00, &arg_3, &sp_18);

    arg_1->unk_04[1] = arg_4;

    if ((sp_18 < r9 - 1) && (r8[sp_18 + 1] == (s16)DivArm(0x1000, arg_3)))
    {
        arg_1->unk_08[1] = &((int *)(arg_0->unk_08))[sp_18 * 4] + 4;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];

        if (sp_18 < r9 - 2)
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 2]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 4] + 8;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 2] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 4] + 4;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }
    }
    else
    {
        local.unk_02 = arg_0->unk_00;
        local.unk_00 = 4;
        local.unk_04 = arg_0->unk_04;
        local.unk_08 = (void *)arg_0->unk_08;
        local.unk_0c = (void *)arg_0->unk_0c;
        local.unk_10 = (void *)arg_0->unk_10;

        if (sub_800A950((void *)&local, arg_3, arg_2) < 0)
        {
            arg_2[2] = 0;
            arg_2[1] = 0;
            arg_2[0] = 0;
            arg_2[3] = 1;
        }

        arg_1->unk_08[1] = arg_2;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];

        if (sp_18 >= r9 - 1)
        {
            arg_1->unk_04[2] = arg_4 + 1;
            arg_1->unk_08[2] = arg_2;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 4] + 4;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x0800B574
int sub_800B574(struct InputStructA * arg_0, struct InputStructB * arg_1, int * arg_2, int arg_3, s16 arg_4)
{
    s16 * r8;
    struct Struct02003BE8_B local;
    int r9;
    int sp_18;

    sub_800A8D8(r8 = arg_0->unk_04, r9 = arg_0->unk_00, &arg_3, &sp_18);

    arg_1->unk_04[1] = arg_4;

    if ((sp_18 < r9 - 1) && (r8[sp_18 + 1] == (s16)DivArm(0x1000, arg_3)))
    {
        arg_1->unk_08[1] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];

        if (sp_18 < r9 - 2)
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 2]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 6;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 2] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }
    }
    else
    {
        local.unk_02 = arg_0->unk_00;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_04;
        local.unk_08 = (void *)arg_0->unk_08;
        local.unk_0c = (void *)arg_0->unk_0c;
        local.unk_10 = (void *)arg_0->unk_10;

        if (sub_800A950((void *)&local, arg_3, arg_2) < 0)
        {
            arg_2[2] = 0;
            arg_2[1] = 0;
            arg_2[0] = 0;
        }

        arg_1->unk_08[1] = arg_2;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];

        if (sp_18 >= r9 - 1)
        {
            arg_1->unk_04[2] = arg_4 + 1;
            arg_1->unk_08[2] = arg_2;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x0800B764
int sub_800B764(struct astruct_12 * arg_0, struct astruct_13 * arg_1, s16 arg_2)
{
    int ret;
    int flags = arg_0->unk_00;

    struct InputStructB * ip = arg_1->unk_04;
    struct InputStructB * r8 = arg_1->unk_08;

    if ((flags & 4) != 0)
    {
        ip->unk_04[0] = 0;
        ret = sub_800B198(&arg_0->unk_08, ip, arg_1->unk_10, arg_1->unk_00, arg_2);
    }

    if ((flags & 8) != 0)
    {
        r8->unk_04[0] = 0;
        ret = sub_800B388(&arg_0->unk_1c, r8, arg_1->unk_14, arg_1->unk_00, arg_2);
    }

    return ret;
}

//! FE8U = 0x0800B7E0
int _DivArm1(int arg_0, int arg_1, int arg_2)
{
    int r1;
    int r4;
    int r5;
    int i;

    if (arg_2 == 0)
    {
        return DivArm(arg_1, arg_0 << 12);
    }

    r4 = arg_0 * 0x1000;

    if (0x1000 - DivArm(arg_1, r4) < 0)
    {
        r1 = DivArm(arg_1, r4) - 0x1000;
    }
    else
    {
        r1 = 0x1000 - DivArm(arg_1, r4);
    }

    r5 = r1;

    for (i = 0; i < arg_2; i++)
    {
        r1 = DivArm(0x1000, r1 * r5);
    }

    return 0x1000 - r1;
}

//! FE8U = 0x0800B84C
int _DivArm2(int arg_0, int arg_1, int arg_2)
{
    int r1;
#if NONMATCHING
    int r5;
#else
    register int r5 asm("r5");
#endif
    int r6;
    int i;

    if (arg_2 == 0)
    {
        return DivArm(arg_1, arg_0 << 12);
    }

    r6 = arg_1 / 2;

    if (arg_0 < r6)
    {
        if (DivArm(r6, arg_0 * 0x1000) < 0)
        {
            r1 = -DivArm(r6, arg_0 * 0x1000);
        }
        else
        {
            r1 = DivArm(r6, arg_0 * 0x1000);
        }
    }
    else
    {
        if (0x1000 - DivArm(r6, (arg_0 - r6) * 0x1000) < 0)
        {
            r1 = DivArm(r6, (arg_0 - r6) * 0x1000) - 0x1000;
        }
        else
        {
            r1 = 0x1000 - DivArm(r6, (arg_0 - r6) * 0x1000);
        }
    }

    r5 = r1;

    for (i = 0; i < arg_2; i++)
    {
        r1 = DivArm(0x1000, r1 * r5);
    }

    if (arg_0 < r6)
    {
        r1 = r1 / 2;
    }
    else
    {
        r1 = (0x1000 - r1) / 2 + 0x800;
    }

    return r1;
}
