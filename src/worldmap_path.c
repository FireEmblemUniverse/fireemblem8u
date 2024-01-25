#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"

#include "constants/worldmap.h"

#include "worldmap.h"

const struct GMapMovementPathData gUnknown_082064BC[] =
{
    { 1351, 128, 88, },
    { 2703, 112, 72, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082064D4[] =
{
    { 2990, 120, 104, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082064E4[] =
{
    { 2048, 184, 184, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082064F4[] =
{
    { 2048, 184, 216, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206504[] =
{
    { 819, 168, 88, },
    { 3276, 200, 56, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_0820651C[] =
{
    { 1474, 288, 104, },
    { 3563, 312, 128, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206534[] =
{
    { 1064, 72, 88, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206544[] =
{
    { 1638, 72, 192, },
    { 2580, 56, 208, },
    { 3276, 56, 224, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206564[] =
{
    { 1720, 104, 232, },
    { 2949, 120, 248, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_0820657C[] =
{
    { 573, 160, 248, },
    { 2293, 176, 264, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206594[] =
{
    { 983, 288, 264, },
    { 2416, 312, 240, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082065AC[] =
{
    { 1187, 240, 216, },
    { 2867, 264, 240, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082065C4[] =
{
    { 1884, 256, 200, },
    { 3809, 216, 160, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082065DC[] =
{
    { 901, 152, 112, },
    { 3153, 192, 152, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_082065F4[] =
{
    { 2457, 360, 200, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206604[] =
{
    { 303, 392, 80, },
    { 733, 384, 72, },
    { 2260, 344, 72, },
    { 2871, 344, 88, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_0820662C[] =
{
    { 901, 408, 104, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_0820663C[] =
{
    { 2048, 392, 40, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_0820664C[] =
{
    { 942, 248, 56, },
    { 1638, 264, 40, },
    { -1, },
};

const struct GMapMovementPathData gUnknown_08206664[] =
{
    { 1351, 344, 88, },
    { -1, },
};

extern u8 gUnknown_08A97FC4[];
extern u8 gUnknown_08A97FF8[];
extern u8 gUnknown_08A98030[];
extern u8 gUnknown_08A98054[];
extern u8 gUnknown_08A9806C[];
extern u8 gUnknown_08A98090[];
extern u8 gUnknown_08A980B4[];
extern u8 gUnknown_08A980DC[];
extern u8 gUnknown_08A98104[];
extern u8 gUnknown_08A98144[];
extern u8 gUnknown_08A98168[];
extern u8 gUnknown_08A9819C[];
extern u8 gUnknown_08A981BC[];
extern u8 gUnknown_08A981F4[];
extern u8 gUnknown_08A98228[];
extern u8 gUnknown_08A9827C[];
extern u8 gUnknown_08A982D4[];
extern u8 gUnknown_08A98314[];
extern u8 gUnknown_08A98344[];
extern u8 gUnknown_08A9836C[];
extern u8 gUnknown_08A983BC[];
extern u8 gUnknown_08A983F0[];
extern u8 gUnknown_08A98448[];
extern u8 gUnknown_08A9847C[];
extern u8 gUnknown_08A984D4[];
extern u8 gUnknown_08A9850C[];
extern u8 gUnknown_08A98540[];
extern u8 gUnknown_08A98568[];
extern u8 gUnknown_08A985A4[];
extern u8 gUnknown_08A985FC[];
extern u8 gUnknown_08A9863C[];
extern u8 gUnknown_08A98694[];

const struct GMapPathData gWMPathData[] =
{
    {
        .gfxData = gUnknown_08A97FC4,
        .node = {
            [0] = NODE_BORDER_MULAN,
            [1] = NODE_CASTLE_FRELIA,
        },
        .movementPath = gUnknown_082064BC,
    },
    {
        .gfxData = gUnknown_08A97FF8,
        .node = {
            [0] = NODE_CASTLE_FRELIA,
            [1] = NODE_IDE,
        },
        .movementPath = gUnknown_082064D4,
    },
    {
        .gfxData = gUnknown_08A98030,
        .node = {
            [0] = NODE_IDE,
            [1] = NODE_BORGO_RIDGE,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A98054,
        .node = {
            [0] = NODE_BORGO_RIDGE,
            [1] = NODE_ZAHA_WOODS,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A9806C,
        .node = {
            [0] = NODE_ZAHA_WOODS,
            [1] = NODE_SERAFEW,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A98090,
        .node = {
            [0] = NODE_SERAFEW,
            [1] = NODE_ADLAS_PLAINS,
        },
        .movementPath = gUnknown_082064E4,
    },
    {
        .gfxData = gUnknown_08A980B4,
        .node = {
            [0] = NODE_ADLAS_PLAINS,
            [1] = NODE_RENVALL_07,
        },
        .movementPath = gUnknown_082064F4,
    },
    {
        .gfxData = gUnknown_08A980DC,
        .node = {
            [0] = NODE_ADLAS_PLAINS,
            [1] = NODE_RENVALL_08,
        },
        .movementPath = gUnknown_082064F4,
    },
    {
        .gfxData = gUnknown_08A98104,
        .node = {
            [0] = NODE_BORDER_MULAN,
            [1] = NODE_PORT_KIRIS,
        },
        .movementPath = gUnknown_08206504,
    },
    {
        .gfxData = gUnknown_08A98144,
        .node = {
            [0] = NODE_BORDER_MULAN,
            [1] = NODE_TOWER_OF_VALNI,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A98168,
        .node = {
            [0] = NODE_PORT_KIRIS,
            [1] = NODE_TERAZ_PLATEAU,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A9819C,
        .node = {
            [0] = NODE_TERAZ_PLATEAU,
            [1] = NODE_CAER_PELYN,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A981BC,
        .node = {
            [0] = NODE_CAER_PELYN,
            [1] = NODE_HAMILL_CANYON,
        },
        .movementPath = gUnknown_0820651C,
    },
    {
        .gfxData = gUnknown_08A981F4,
        .node = {
            [0] = NODE_HAMILL_CANYON,
            [1] = NODE_JEHANNA_HALL_0D,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A98228,
        .node = {
            [0] = NODE_CASTLE_FRELIA,
            [1] = NODE_FORT_RIGWALD,
        },
        .movementPath = gUnknown_08206534,
    },
    {
        .gfxData = gUnknown_08A9827C,
        .node = {
            [0] = NODE_FORT_RIGWALD,
            [1] = NODE_BETHROEN,
        },
        .movementPath = gUnknown_08206544,
    },
    {
        .gfxData = gUnknown_08A982D4,
        .node = {
            [0] = NODE_BETHROEN,
            [1] = NODE_TAIZEL,
        },
        .movementPath = gUnknown_08206564,
    },
    {
        .gfxData = gUnknown_08A98314,
        .node = {
            [0] = NODE_TAIZEL,
            [1] = NODE_ZAALBUL_MARSH,
        },
        .movementPath = gUnknown_0820657C,
    },
    {
        .gfxData = gUnknown_08A98344,
        .node = {
            [0] = NODE_ZAALBUL_MARSH,
            [1] = NODE_GRADO_KEEP,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A9836C,
        .node = {
            [0] = NODE_GRADO_KEEP,
            [1] = NODE_JEHANNA_HALL_13,
        },
        .movementPath = gUnknown_08206594,
    },
    {
        .gfxData = gUnknown_08A983BC,
        .node = {
            [0] = NODE_RENVALL_08,
            [1] = NODE_GRADO_KEEP,
        },
        .movementPath = gUnknown_082065AC,
    },
    {
        .gfxData = gUnknown_08A983F0,
        .node = {
            [0] = NODE_JEHANNA_HALL_13,
            [1] = NODE_RENAIS_CASTLE,
        },
        .movementPath = gUnknown_082065C4,
    },
    {
        .gfxData = gUnknown_08A98448,
        .node = {
            [0] = NODE_HAMILL_CANYON,
            [1] = NODE_JEHANNA_HALL_13,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A9847C,
        .node = {
            [0] = NODE_BORDER_MULAN,
            [1] = NODE_RENAIS_CASTLE,
        },
        .movementPath = gUnknown_082065DC,
    },
    {
        .gfxData = gUnknown_08A984D4,
        .node = {
            [0] = NODE_JEHANNA_HALL_13,
            [1] = NODE_NARUBE_RIVER,
        },
        .movementPath = gUnknown_082065F4,
    },
    {
        .gfxData = gUnknown_08A9850C,
        .node = {
            [0] = NODE_NARUBE_RIVER,
            [1] = NODE_NELERAS_PEAK,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A98540,
        .node = {
            [0] = NODE_NELERAS_PEAK,
            [1] = NODE_RAUSTEN_COURT,
        },
        .movementPath = NULL,
    },
    {
        .gfxData = gUnknown_08A98568,
        .node = {
            [0] = NODE_RAUSTEN_COURT,
            [1] = NODE_BLACK_TEMPLE,
        },
        .movementPath = gUnknown_08206604,
    },
    {
        .gfxData = gUnknown_08A985A4,
        .node = {
            [0] = NODE_RAUSTEN_COURT,
            [1] = NODE_LAGDOU_RUINS,
        },
        .movementPath = gUnknown_0820662C,
    },
    {
        .gfxData = gUnknown_08A985FC,
        .node = {
            [0] = NODE_RAUSTEN_COURT,
            [1] = NODE_MELKAEN_COAST,
        },
        .movementPath = gUnknown_0820663C,
    },
    {
        .gfxData = gUnknown_08A9863C,
        .node = {
            [0] = NODE_PORT_KIRIS,
            [1] = NODE_MELKAEN_COAST,
        },
        .movementPath = gUnknown_0820664C,
    },
    {
        .gfxData = gUnknown_08A98694,
        .node = {
            [0] = NODE_DARKLING_WOODS,
            [1] = NODE_BLACK_TEMPLE,
        },
        .movementPath = gUnknown_08206664,
    },
};

extern u16 gUnknown_02019D00[];

//! FE8U = 0x080BBBF4
void sub_80BBBF4(u8 * data, u16 * buf, int size, u16 oam2)
{
    while (*(data + 0) != 0xff)
    {
        int i;
        int j;

        u16 * dst = buf + (*(data + 1) * size + *(data + 0));
        int numTiles = *(data + 2);
        int check = *(data + 3);

        u8 * src = data + 4;

        for (i = 0; i < check; i++)
        {
            for (j = 0; j < numTiles; j++)
            {
                *dst = *(u16 *)src + oam2;

                src += 2;
                dst++;
            }
        }

        data = src;
    }

    return;
}

//! FE8U = 0x080BBC54
void sub_80BBC54(struct GmRouteProc * proc)
{
    int i;

    u16 oam2Base = (proc->chr / CHR_SIZE) | (proc->pal << 0xc);

    CpuFill16(0, gUnknown_02019D00, 0x12C0);

    for (i = 0; i < proc->pOpenPaths->openPathsLength; i++)
    {
        sub_80BBBF4(
            proc->pOpenPaths->openPaths[i][gWMPathData].gfxData,
            gUnknown_02019D00,
            60,
            oam2Base
        );
    }

    return;
}

//! FE8U = 0x080BBCC8
void sub_80BBCC8(int a, int b, int bg)
{
    u16 * buf;
    u16 * bgBuf;
    u16 terminator;
    u16 unkB;
    u16 unkA;
    u16 i;
    u16 * tm;

    if (b < 19)
    {
        terminator = b + 21;
    }
    else
    {
        terminator = 40;
    }

    unkA = (a & 0x1f);
    unkB = (0x20 - unkA);

    bgBuf = BG_GetMapBuffer(bg);

    buf = gUnknown_02019D00 + (b * 60 + a);

    if (unkB >= 0x1f)
    {
        for (i = b; i < terminator; i++)
        {
            tm = bgBuf + TILEMAP_INDEX(unkA, i % 0x20);
            CpuCopy16(buf, tm, 0x3E);
            buf = buf + 60;
        }
    }
    else
    {
        for (i = b; i < terminator; i++)
        {
            tm = bgBuf + TILEMAP_INDEX(0, i & 0x1f);
            CpuCopy16(buf, tm + unkA, unkB * 2);
            CpuCopy16(buf + unkB, tm, (0x1f - unkB) * 2);
            buf = buf + 60;
        }
    }

    return;
}

//! FE8U = 0x080BBDA4
void sub_80BBDA4(int a1, int r8, int r4, int r9, int sp20)
{
    u16 i;
    u16 r1, r2;
    u32 r3;
    u16 *tm;
    u16 *puVar6;
    u16 r6;
    u32 r7;
    u16 *bgBuf;

    bgBuf = BG_GetMapBuffer(sp20);
    if (a1 != r4)
    {
        if (a1 > r4)
        {
            r1 = a1 + 0x1e;
            r2 = r8;
        }
        else
        {
            r1 =  a1;
            r2 = r8;
        }
        r7 = r1 & 0x1f;
    
        puVar6 = gUnknown_02019D00 + (r2 * 0x3c + r1);
        for (i = 0; i < 0x15; i++)
        {
            tm = bgBuf + TILEMAP_INDEX(r7, (r2 + i) & 0x1f);
            *tm = *puVar6;
            puVar6 += 0x3c;
        }
    }

    if (r8 != r9)
    {
        if (r8 > r9)
        {
            r1 = a1;
            r2 = r8 + 0x14;
        }
        else
        {
            r1 = a1;
            r2 = r8;
        }
        r7 = r1 & 0x1f;
        r3 = r2 & 0x1f;

        puVar6 = gUnknown_02019D00 + (r2 * 0x3c + r1);
        r6 = 0x20 - r7;
        if (r6 > 0x1e)
        {
            tm = bgBuf + TILEMAP_INDEX(r7, r3);
            CpuCopy16(puVar6, tm, 0x3e);
        }
        else
        {
            tm = bgBuf + TILEMAP_INDEX(0, r3);
            CpuCopy16(puVar6, tm + r7, r6 * 2);
            CpuCopy16(puVar6 + r6, tm, (0x1f - r6) * 2);
        }
    }

    return;
}

//! FE8U = 0x080BBEB4
void nullsub_38(void)
{
    return;
}

//! FE8U = 0x080BBEB8
void sub_80BBEB8(struct GmRouteProc * proc)
{
    proc->flags = 4;
    proc->unk_32 = 0;
    proc->unk_33 = -1;
    proc->bgA = 2;
    proc->bgB = 1;
    proc->bgPriority = BG_GetPriority(BG_1);

    *&proc->x1 = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&proc->y1 = ((struct GmScreenProc *)(proc->proc_parent))->y;

    proc->y2 = -2;
    proc->x2 = -2;

    sub_80BBC54(proc);
    proc->flags |= 3;

    return;
}

//! FE8U = 0x080BBF1C
void sub_80BBF1C(u16 * a, u16 b, int c)
{
    int i;

    for (i = 0; i < c; i++)
    {
        *a = ((b + (*a & ~0xc00)) & ~0xc00) | (*a & 0xc00);
        a++;
    }

    return;
}

//! FE8U = 0x080BBF60
void sub_80BBF60(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    if (!(proc->flags & 4))
    {
        return;
    }

    proc->x2 = proc->x1;
    proc->y2 = proc->y1;

    *&x = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&y = ((struct GmScreenProc *)(proc->proc_parent))->y;

    proc->x1 = x / 8;
    proc->y1 = y / 8;

    if (proc->x1 != proc->x2 || proc->y1 != proc->y2)
    {
        if ((ABS(proc->x1 - proc->x2) >= 2) || (ABS(proc->y1 - proc->y2) >= 2))
        {
            sub_80BBCC8(proc->x1, proc->y1, proc->bgA);
            BG_EnableSync(proc->bgA);
        }
        else
        {
            sub_80BBDA4(proc->x1, proc->y1, proc->x2, proc->y2, proc->bgA);
            BG_EnableSync(proc->bgA);
        }
    }

    if (proc->flags & 2)
    {
        sub_80BBC54(proc);
        proc->flags &= ~2;
    }

    if (proc->flags & 1)
    {
        sub_80BBCC8(proc->x1, proc->y1, proc->bgA);
        BG_EnableSync(proc->bgA);
        proc->flags &= ~1;
    }

    BG_SetPosition(proc->bgA, x & 0x1FF, y & 0xff);

    return;
}

//! FE8U = 0x080BC0BC
int MapRoute_StartTransition(struct GmRouteProc * proc)
{
    BG_Fill(BG_GetMapBuffer(proc->bgB), 0);
    BG_EnableSync(proc->bgB);
    PlaySoundEffect(0x310);
    return 0;
}

//! FE8U = 0x080BC0F4
int sub_80BC0F4(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    SetBlendAlpha(0, 0x10);

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= (1 << proc->bgB);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) |= BLDCNT_TGT2_BG3;

    sub_80BBC54(proc);
    sub_80BBCC8(proc->x1, proc->y1, proc->bgB);

    *&x = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&y = ((struct GmScreenProc *)(proc->proc_parent))->y;

    BG_SetPosition(proc->bgB, x & 0x1FF, y & 0xff);

    return 0;
}

//! FE8U = 0x080BC184
int MapRoute_EnableBGSyncs(struct GmRouteProc * proc)
{
    BG_SetPriority(proc->bgB, BG_GetPriority(BG_3));
    BG_EnableSyncByMask((1 << proc->bgB) | (1 << proc->bgA));
    return 0;
}

//! FE8U = 0x080BC1B8
void MapRoute_TransitionLoop(struct GmRouteProc * proc)
{
    proc->unk_3e++;

    if (proc->unk_3e < proc->unk_3c)
    {
        int coeff = (proc->unk_3e * 0x10) / proc->unk_3c;
        SetBlendAlpha(coeff, 0x10 - coeff);
    }
    else
    {
        CpuFastCopy(BG_GetMapBuffer(proc->bgB), BG_GetMapBuffer(proc->bgA), 0x800);
        BG_EnableSync(proc->bgA);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BC228
int MapRoute_TransitionEnd(struct GmRouteProc * proc)
{
    BG_SetPosition(proc->bgB, 0, 0);
    BG_Fill(BG_GetMapBuffer(proc->bgB), 0);
    BG_SetPriority(proc->bgB, proc->bgPriority);
    BG_EnableSyncByMask((1 << proc->bgA) | (1 << proc->bgB));

    SetDefaultColorEffects();

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);

    proc->unk_32 &= ~1;

    return 0;
}

//! FE8U = 0x080BC29C
void MapRoute_BeginRouteTransition(struct GmRouteProc * proc, int unk)
{
    if (unk < 2)
    {
        proc->flags |= 3;
        proc->unk_32 &= ~1;
    }
    else
    {
        proc->unk_3c = unk;
        proc->unk_3e = 0;
        proc->unk_32 |= 1;

        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080BC2DC
void MapRoute_80BC2DC(struct GmRouteProc * proc)
{
    s16 x;
    s16 y;

    if (!(proc->unk_32 & 1))
    {
        return;
    }

    *&x = ((struct GmScreenProc *)(proc->proc_parent))->x;
    *&y = ((struct GmScreenProc *)(proc->proc_parent))->y;

    sub_80BBC54(proc);

    sub_80BBCC8(x / 8, y / 8, proc->bgA);
    BG_SetPosition(proc->bgB, 0, 0);
    BG_Fill(BG_GetMapBuffer(proc->bgB), 0);
    BG_SetPriority(proc->bgB, proc->bgPriority);
    BG_EnableSyncByMask((1 << proc->bgA) | (1 << proc->bgB));

    SetDefaultColorEffects();

    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETA(1, 1, 1, 1, 1) | BLDCNT_TGT1_BD);
    *((u16 *) &gLCDControlBuffer.bldcnt) &= ~(BLDCNT_TARGETB(1, 1, 1, 1, 1) | BLDCNT_TGT2_BD);

    proc->unk_32 &= ~1;

    Proc_Goto(proc, 0);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GMapRoute[] =
{
    PROC_NAME("GmapRoute"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(nullsub_38),
    PROC_SLEEP(0),

    PROC_CALL(sub_80BBEB8),

PROC_LABEL(0),
    PROC_REPEAT(sub_80BBF60),

    PROC_GOTO(2),

PROC_LABEL(1),
    PROC_CALL_2(MapRoute_StartTransition),
    PROC_CALL_2(sub_80BC0F4),
    PROC_CALL_2(MapRoute_EnableBGSyncs),

    PROC_REPEAT(MapRoute_TransitionLoop),

    PROC_CALL_2(MapRoute_TransitionEnd),

    PROC_GOTO(0),

PROC_LABEL(2),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BC3A4
ProcPtr StartGMapRoute(ProcPtr parent, struct OpenPaths * pPaths, int c, int d)
{
    struct GmRouteProc * proc = Proc_Start(gProcScr_GMapRoute, parent);
    proc->chr = c;
    proc->pal = d;
    proc->pOpenPaths = pPaths;
    return proc;
}

//! FE8U = 0x080BC3D4
int sub_80BC3D4(int idx)
{
    int count;

    const struct GMapMovementPathData * pMovementPath = idx[gWMPathData].movementPath;

    if (pMovementPath == NULL)
    {
        return 0;
    }

    count = 0;

    while (pMovementPath->elapsedTime >= 0)
    {
        pMovementPath++;
        count++;
    }

    return count;
}

//! FE8U = 0x080BC404
void sub_80BC404(struct GmRouteProc * proc)
{
    BG_Fill(BG_GetMapBuffer(proc->bgA), 0);
    BG_EnableSyncByMask((1 << proc->bgA));
    return;
}

// TODO: Possibly debug-related procs for the world map?
// Seems to be unrelated to anything around it

struct UnknownWorldMapStructB
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct Text unk_34;
};

struct UnknownWorldMapStructA
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct UnknownWorldMapStructB * unk_34[2];
    /* 3C */ STRUCT_PAD(0x3c, 0x60);
    /* 60 */ u8 unk_60;
};

//! FE8U = 0x080BC428
void sub_80BC428(struct UnknownWorldMapStructA * a)
{
    int i = 0;

    if (i < a->unk_60)
    {
        struct UnknownWorldMapStructB ** unk_34 = a->unk_34;

        for (; i < a->unk_60; i++)
        {
            Text_SetCursor(&(*unk_34++)->unk_34, 0);
        }
    }

    return;
}

extern struct Font gFont_0201AFC0;
extern struct MenuDef gMenu_WMGeneralMenu;
extern struct MenuRect gMenuRect_WMGeneralMenuRect;

//! FE8U = 0x080BC454
struct MenuProc * StartWMGeneralMenu(ProcPtr parent)
{
    gGMData.unk01 = 0;
    InitTextFont(&gFont_0201AFC0, (void *)0x06001000, 0x80, 0);
    return StartMenuAt(&gMenu_WMGeneralMenu, gMenuRect_WMGeneralMenuRect, parent);
}

//! FE8U = 0x080BC490
int WMGeneralMenu_OnInit(struct MenuProc * menu)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return 0;
}

//! FE8U = 0x080BC4A0
int WMGeneralMenu_OnEnd(struct MenuProc * menu)
{
    ClearBg0Bg1();
    return 0;
}

//! FE8U = 0x080BC4AC
u8 WMGeneralMenu_OnCancel(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 3);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC4C4
u8 WMMenu_OnUnitSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 9);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC4DC
u8 WMMenu_OnStatusSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 12);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC4F4
int WMMenu_OnGuideDraw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (!(menuProc->state & MENU_STATE_NOTSHOWN))
    {
        if (!BmGuideTextShowGreenOrNormal())
        {
            Text_SetColor(&menuItemProc->text, TEXT_COLOR_SYSTEM_GREEN);
        }

        if (menuItemProc->availability == MENU_DISABLED)
        {
            Text_SetColor(&menuItemProc->text, TEXT_COLOR_SYSTEM_GRAY);
        }

        Text_DrawString(&menuItemProc->text, GetStringFromIndex(menuItemProc->def->nameMsgId));

        PutText(
            &menuItemProc->text,
            BG_GetMapBuffer(menuProc->frontBg) + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile)
        );
    }

    // return 0; // BUG?
}

//! FE8U = 0x080BC56C
u8 WMMenu_OnGuideSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 10);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC584
u8 WMMenu_OnOptionsSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 11);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC59C
u8 WMMenu_OnSaveSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 13);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

struct MenuItemDef CONST_DATA MenuItemDef_WMGeneralMenu[] =
{
    {
        .name = "　部隊",
        .nameMsgId = 0x0645, // TODO: msgid "Unit"
        .helpMsgId = 0x06DF,
        .overrideId = 0,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = WMMenu_OnUnitSelected,
    },

    {
        .name = "　状況",
        .nameMsgId = 0x0646, // TODO: msgid "Status"
        .helpMsgId = 0x06E0,
        .overrideId = 1,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = WMMenu_OnStatusSelected,
    },

    {
        .name = "　辞書",
        .nameMsgId = 0x0647, // TODO: msgid "Guide"
        .helpMsgId = 0x06E5,
        .overrideId = 2,
        .isAvailable = MapMenu_IsGuideCommandAvailable,
        .onDraw = WMMenu_OnGuideDraw,
        .onSelected = WMMenu_OnGuideSelected,
    },

    {
        .name = "　設定",
        .nameMsgId = 0x0648, // TODO: msgid "Options"
        .helpMsgId = 0x06E1,
        .overrideId = 3,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = WMMenu_OnOptionsSelected,
    },

    {
        .name = "　記録",
        .nameMsgId = 0x0649, // TODO: msgid "Save"
        .helpMsgId = 0x0679,
        .overrideId = 4,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = WMMenu_OnSaveSelected,
    },

    { 0 },
};

struct MenuDef CONST_DATA gMenu_WMGeneralMenu =
{
    .rect = { 1, 1, 6, 0 },
    .menuItems = MenuItemDef_WMGeneralMenu,
    .onInit = (void(*)(struct MenuProc *)) WMGeneralMenu_OnInit,
    .onEnd = (void(*)(struct MenuProc *)) WMGeneralMenu_OnEnd,
    .onBPress = WMGeneralMenu_OnCancel,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = MenuStdHelpBox,
};

struct MenuRect CONST_DATA gMenuRect_WMGeneralMenuRect =
{
    .x = 1, .y = 1, .w = 7, .h = 0,
};

extern struct MenuDef gMenu_WMNodeMenu;
extern struct MenuRect gMenuRect_WMNodeMenuRectA;
extern struct MenuRect gMenuRect_WMNodeMenuRectB;

struct MenuProc * StartWMNodeMenu(struct WorldMapMainProc * parent)
{
    struct MenuProc * menuProc;

    gGMData.unk01 = 0;

    InitTextFont(&gFont_0201AFC0, (void *)0x06001000, 0x80, 0);

    if ((gGMData.unk08 >> 8) - gGMData.xCamera < 152)
    {
        menuProc = StartMenuAt(&gMenu_WMNodeMenu, gMenuRect_WMNodeMenuRectA, parent);
    }
    else
    {
        menuProc = StartMenuAt(&gMenu_WMNodeMenu, gMenuRect_WMNodeMenuRectB, parent);
    }

    if (gGMData.unk_cd < menuProc->itemCount)
    {
        menuProc->itemCurrent = gGMData.unk_cd;
    }
    else
    {
        menuProc->itemCurrent = menuProc->itemCount - 1;
    }

    return menuProc;
}

//! FE8U = 0x080BC634
int WMNodeMenu_OnInit(struct MenuProc * menu)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return 0;
}

//! FE8U = 0x080BC644
int WMNodeMenu_OnEnd(struct MenuProc * menu)
{
    ClearBg0Bg1();
    return 0;
}

//! FE8U = 0x080BC650
u8 WMNodeMenu_OnCancel(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    gGMData.unk_cd = 0;
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 3);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC674
u8 WMMenu_IsArmoryAvailable(const struct MenuItemDef * def, int number)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_NOTSHOWN;
    }

    if ((gGMData.units[0].location[gWMNodeData].armory[0]) == 0)
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x080BC6AC
u8 WMMenu_IsVendorAvailable(const struct MenuItemDef * def, int number)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_NOTSHOWN;
    }

    if ((gGMData.units[0].location[gWMNodeData].vendor[0]) == 0)
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x080BC6E4
u8 WMMenu_IsSecretShopAvailable(const struct MenuItemDef * def, int number)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_NOTSHOWN;
    }

    if ((gGMData.units[0].location[gWMNodeData].secretShop[0]) == 0)
    {
        return MENU_NOTSHOWN;
    }

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
    {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

//! FE8U = 0x080BC72C
u8 sub_80BC72C(const struct MenuItemDef * def, int number)
{
    if (!(gGMData.nodes[gGMData.units[0].location].state & 2))
    {
        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

//! FE8U = 0x080BC754
u8 sub_80BC754(const struct MenuItemDef * def, int number)
{
    if (gGMData.nodes[gGMData.units[0].location].state & 2)
    {
        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}

//! FE8U = 0x080BC77C
u8 WMMenu_OnArmorySelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    gGMData.unk_cd = menuProc->itemCurrent;
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 19);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC7A4
u8 WMMenu_OnVendorSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    gGMData.unk_cd = menuProc->itemCurrent;
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 20);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC7CC
u8 WMMenu_OnSecretShopSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    gGMData.unk_cd = menuProc->itemCurrent;
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 21);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

//! FE8U = 0x080BC7F4
u8 WMMenu_OnManageItemsSelected(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    gGMData.unk_cd = menuProc->itemCurrent;
    Proc_Goto(Proc_Find(gProcScr_WorldMapMain), 22);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

struct MenuItemDef CONST_DATA MenuItemDef_WMNodeMenu[] =
{
    {
        .name = "　武器屋に入る",
        .nameMsgId = 0x066E, // TODO: msgid " Enter Armory[.]"
        .helpMsgId = 0x06CF,
        .overrideId = 0,
        .isAvailable = WMMenu_IsArmoryAvailable,
        .onSelected = WMMenu_OnArmorySelected,
    },

    {
        .name = "　道具屋に入る",
        .nameMsgId = 0x066F, // TODO: msgid " Enter Shop[.]"
        .helpMsgId = 0x06D0,
        .overrideId = 1,
        .isAvailable = WMMenu_IsVendorAvailable,
        .onSelected = WMMenu_OnVendorSelected,
    },

    {
        .name = "　秘密店に入る",
        .nameMsgId = 0x0670, // TODO: msgid " Enter ? Shop[.]"
        .helpMsgId = 0x06D1,
        .overrideId = 2,
        .isAvailable = WMMenu_IsSecretShopAvailable,
        .onSelected = WMMenu_OnSecretShopSelected,
    },

    {
        .name = "　アイテム整理",
        .nameMsgId = 0x0671, // TODO: msgid " Manage Items[.]"
        .helpMsgId = 0x0678,
        .overrideId = 3,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = WMMenu_OnManageItemsSelected,
    },

    { 0 }, // end
};

struct MenuDef CONST_DATA gMenu_WMNodeMenu =
{
    .rect = { 20, 10, 8, 0 },
    .menuItems = MenuItemDef_WMNodeMenu,
    .onInit = (void(*)(struct MenuProc *)) WMNodeMenu_OnInit,
    .onEnd = (void(*)(struct MenuProc *)) WMNodeMenu_OnEnd,
    .onBPress = WMNodeMenu_OnCancel,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = MenuStdHelpBox,
};

struct MenuRect CONST_DATA gMenuRect_WMNodeMenuRectA =
{
    .x = 19, .y = 1, .w = 10, .h = 0,
};

struct MenuRect CONST_DATA gMenuRect_WMNodeMenuRectB =
{
    .x = 1, .y = 1, .w = 10, .h = 0,
};

void GmPathsInit(struct OpenPaths *);

//! FE8U = 0x080BC81C
void GmDataInit(void)
{
    int i;

    CpuFill32(0, &gGMData, 0xd4);
    GmPathsInit(&gGMData.openPaths);

    for (i = 0; i < 7; i++)
    {
        gGMData.units[i].id = 0;
        gGMData.units[i].state &= ~2;
    }

    gGMData.units[0].id = 1;
    gGMData.units[0].state &= ~2;
    gGMData.units[0].location = 0;

    gGMData.nodes[0].state |= 2;

    gGMData.state.bits.state_2 = 1;
    gGMData.state.bits.state_4_5 = 3;

    gGMData.unk_cd = 0;

    StoreRNState(&gGMData.unk_ce);

    return;
}

//! FE8U = 0x080BC898
void GmPathsInit(struct OpenPaths * pPaths)
{
    u32 i;

    for (i = 0; i < sizeof(pPaths->openPaths); i++)
    {
        pPaths->openPaths[i] = 0xff;
    }

    pPaths->openPathsLength = 0;

    return;
}

//! FE8U = 0x080BC8BC
bool AddGmPath(struct GMapData * pGMapData, struct OpenPaths * pPaths, int idx)
{
    if (pPaths->openPathsLength < sizeof(pPaths->openPaths))
    {
        pPaths->openPaths[pPaths->openPathsLength] = idx;
        pPaths->openPathsLength += 1;
        sub_80BCA0C(pGMapData);
        return false;
    }
    else
    {
        return true;
    }
}

//! FE8U = 0x080BC8EC
bool RemoveGmPath(struct GMapData * pGMapData, struct OpenPaths * pPaths, int idx)
{
    int i;

    if (pPaths->openPathsLength <= 0)
    {
        return true;
    }

    if (idx < 0)
    {
        pPaths->openPathsLength--;
        pPaths->openPaths[pPaths->openPathsLength] = 0xff;
        sub_80BCA0C(pGMapData);
        return false;
    }

    for (i = 0; i < pPaths->openPathsLength; i++)
    {
        int j;

        if (pPaths->openPaths[i] != idx)
        {
            continue;
        }

        for (j = i; j < pPaths->openPathsLength - 1; j++)
        {
            pPaths->openPaths[j] = pPaths->openPaths[j + 1];
        }

        pPaths->openPathsLength--;
        sub_80BCA0C(pGMapData);
        return false;
    }

    return true;
}
