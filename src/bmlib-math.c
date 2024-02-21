#include "global.h"
#include "hardware.h"
#include "bmlib.h"

void VecMulMat(int const * vec, int const * mat, int * ovec)
{
    ovec[0] = ((vec[0] * mat[0]) + (vec[1] * mat[3]) + (vec[2] * mat[6])) >> 12;
    ovec[1] = ((vec[0] * mat[1]) + (vec[1] * mat[4]) + (vec[2] * mat[7])) >> 12;
    ovec[2] = ((vec[0] * mat[2]) + (vec[1] * mat[5]) + (vec[2] * mat[8])) >> 12;
}

void MatMulMat(int const * lmat, int const * rmat, int * omat)
{
    int tmpmat[12];
    int * mat;

    if (lmat == omat || rmat == omat)
        mat = tmpmat;
    else
        mat = omat;

    mat[0] = ((lmat[0] * rmat[0]) + (lmat[1] * rmat[3]) + (lmat[2] * rmat[6])) >> 12;
    mat[1] = ((lmat[0] * rmat[1]) + (lmat[1] * rmat[4]) + (lmat[2] * rmat[7])) >> 12;
    mat[2] = ((lmat[0] * rmat[2]) + (lmat[1] * rmat[5]) + (lmat[2] * rmat[8])) >> 12;

    mat[3] = ((lmat[3] * rmat[0]) + (lmat[4] * rmat[3]) + (lmat[5] * rmat[6])) >> 12;
    mat[4] = ((lmat[3] * rmat[1]) + (lmat[4] * rmat[4]) + (lmat[5] * rmat[7])) >> 12;
    mat[5] = ((lmat[3] * rmat[2]) + (lmat[4] * rmat[5]) + (lmat[5] * rmat[8])) >> 12;

    mat[6] = ((lmat[6] * rmat[0]) + (lmat[7] * rmat[3]) + (lmat[8] * rmat[6])) >> 12;
    mat[7] = ((lmat[6] * rmat[1]) + (lmat[7] * rmat[4]) + (lmat[8] * rmat[7])) >> 12;
    mat[8] = ((lmat[6] * rmat[2]) + (lmat[7] * rmat[5]) + (lmat[8] * rmat[8])) >> 12;

    mat[9]  = (((lmat[0] * rmat[9]) + (lmat[3] * rmat[10]) + (lmat[6] * rmat[11])) >> 12) + lmat[9];
    mat[10] = (((lmat[1] * rmat[9]) + (lmat[4] * rmat[10]) + (lmat[7] * rmat[11])) >> 12) + lmat[10];
    mat[11] = (((lmat[2] * rmat[9]) + (lmat[5] * rmat[10]) + (lmat[8] * rmat[11])) >> 12) + lmat[11];

    if (mat == tmpmat)
        MatCopy(tmpmat, omat);
}

void MatIdent(int * mat)
{
    mat[0] = 1 << 12;
    mat[1] = 0;
    mat[2] = 0;

    mat[3] = 0;
    mat[4] = 1 << 12;
    mat[5] = 0;

    mat[6] = 0;
    mat[7] = 0;
    mat[8] = 1 << 12;

    mat[9]  = 0;
    mat[10] = 0;
    mat[11] = 0;
}

void MatCopy(int const * src, int * dst)
{
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];

    dst[3] = src[3];
    dst[4] = src[4];
    dst[5] = src[5];

    dst[6] = src[6];
    dst[7] = src[7];
    dst[8] = src[8];

    dst[9]  = src[9];
    dst[10] = src[10];
    dst[11] = src[11];
}

void MatRotA(int * mat, short angle)
{
    short cos = COS(angle);
    short sin = SIN(angle);

    mat[0] = 1 << 12;
    mat[1] = 0;
    mat[2] = 0;

    mat[3] = 0;
    mat[4] = +cos;
    mat[5] = -sin;

    mat[6] = 0;
    mat[7] = +sin;
    mat[8] = +cos;
}

void MatRotB(int * mat, short angle)
{
    short cos = COS(angle);
    short sin = SIN(angle);

    mat[0] = +cos;
    mat[1] = 0;
    mat[2] = -sin;

    mat[3] = 0;
    mat[4] = 1 << 12;
    mat[5] = 0;

    mat[6] = +sin;
    mat[7] = 0;
    mat[8] = +cos;
}

void MatRotC(int * mat, short angle)
{
    short cos = COS(angle);
    short sin = SIN(angle);

    mat[0] = +cos;
    mat[1] = -sin;
    mat[2] = 0;

    mat[3] = +sin;
    mat[4] = +cos;
    mat[5] = 0;

    mat[6] = 0;
    mat[7] = 0;
    mat[8] = 1 << 12;
}

void sub_801523C(void)
{
    return;
}

int VecDotVec(int const * lvec, int const * rvec)
{
    return ((lvec[0] * rvec[0]) + (lvec[1] * rvec[1]) + (lvec[2] * rvec[2])) >> 12;
}

void VecCrossVec(int const * lvec, int const * rvec, int * ovec)
{
    ovec[0] = (lvec[1] * rvec[2] - lvec[2] * rvec[1]) >> 12;
    ovec[1] = (lvec[2] * rvec[0] - lvec[0] * rvec[2]) >> 12;
    ovec[2] = (lvec[0] * rvec[1] - lvec[1] * rvec[0]) >> 12;
}

int sub_801529C(int arg_0, int arg_1, int arg_2, int arg_3)
{
    return arg_3 * arg_0 - arg_2 * arg_1;
}
