#include "global.h"

#include "spline.h"

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

struct Struct02003BE8_B
{
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 * unk_04;
    /* 08 */ void * unk_08;
    /* 0C */ int * unk_0c;
    /* 10 */ int * unk_10;
};

int sub_800A8D8(s16 *, s16, int *, int *);

struct Params
{
    s16 count;
    s16 index;
    s16 * data;
    int * coefficients;
    u32 * intermediateResults;
    u32 * unk_10;
};

int sub_800AF64(struct Params *, int, int *);

struct astruct_16
{
    int unk_00;
    struct Params * unk_04;
    struct Params * unk_08;
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
