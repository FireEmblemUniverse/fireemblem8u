#include "global.h"

#include "spline.h"

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
