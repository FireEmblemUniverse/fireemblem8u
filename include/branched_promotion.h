#include "global.h"

struct PromoProc
{
    PROC_HEADER;
    ProcPtr u2c;
    u8 u30;
    u8 u31;
    s8 u32;
    u8 u33;
    u8 u34;
    s8 u35;
    struct Unit *u38;
    s32 u3c;
    u32 u40;
    u32 _u44;
    u32 _u48;
    u8 u4c;
    struct MenuProc* u50;
};

/* Seems like there are a couple of proc structures going on here */
struct PromoProc2
{
    PROC_HEADER;
    u8 u29;
    struct Unit *unit;
    ProcPtr u30;
    ProcPtr u34;
    u8 u38;
    u8 u39;
    s8 _u3a;
    s8 u3b;
};

struct PromoProc3
{
    PROC_HEADER;
    s8 _u29;
    s8 _u2a;
    s8 _u2b;
    u16 u2c[3];
    u16 u32[3];
    s16 u38[3];
    u16 _u3e;
    u8 u40;
    u8 u41;
    u16 u42;
    u16 u44;
    u8 u46;
    u8 u47;
    u16 u48;
    u8 u4a[3];
    u8 _u4d[3];
    u32 u50;
    ProcPtr u54;
    /* ... more maybe */
};

struct PromoProc4
{
    PROC_HEADER;
    s8 _u29;
    u16 u2a;
    u16 _u2c;
    u8 u2e;
    u8 _u2f;
    ProcPtr u30;
};

void MakePromotionScreen(ProcPtr proc, u32 a, u32 b);

extern struct ProcCmd gUnknown_08B12614[];
