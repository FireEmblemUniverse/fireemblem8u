#include "global.h"

const char *sub_800A048(s8 *a, s8 b)
{
    switch (*a)
    {
    case 'A':
    case 'E':
    case 'I':
    case 'O':
    case 'U':
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
        return gUnknown_08591AA4[1][b];
    default:
        return gUnknown_08591AA4[0][b];
    }
}

void sub_800A160(char *a, const char *b, s8 c)
{
    const char *r6;
    u8 r5;
    s16 i;

    if (b == NULL)
        r6 = sub_800A048(a, c);
    else
        r6 = b;
    r5 = strlen(r6);
    for (i = strlen(a); i >= 0; i--)
        a[i + r5] = a[i];
    for (i = 0; i < r5; i++)
        a[i] = r6[i];
}

