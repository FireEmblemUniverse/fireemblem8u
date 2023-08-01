#include "global.h"

#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"

#include "worldmap.h"

struct GMapUnitFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u16 unk_2c;
    /* 2E */ u16 unk_2e;
    /* 30 */ u8 unk_30[7];
    /* 37 */ u8 unk_37;
};

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

void GetWMDisplayPosition(s16 *, s16 *);

extern u8 gUnknown_0200AF00[];

//! FE8U = 0x080BAC1C
const void * MMS_GetGfx(u16 idx)
{
    return gMMSDataTable[idx - 1].pGraphics;
}

//! FE8U = 0x080BAC30
const void * MMS_GetROMTCS2(u16 idx)
{
    return gMMSDataTable[idx - 1].pAnimation;
}

//! FE8U = 0x080BAC44
u8 * GetMapUnitMMSGfxBuffer(int idx)
{
    return gUnknown_0200AF00 + idx * 0x2200;
}

//! FE8U = 0x080BAC58
void GmapUnit_Destruct(struct GMapUnitProc * proc)
{
    AP_Delete(proc->unk_40);
    return;
}

//! FE8U = 0x080BAC64
void GmapUnit_Init(struct GMapUnitProc * proc)
{
    proc->unk_2a = 0;
    proc->unk_37 = 4;
    proc->unk_3e = 0;
    proc->unk_3c = 0;
    return;
}

const u8 gUnknown_08205F7C[] = {
    0x00, 0x04, 0x08, 0x0C, 0x10, 0x14, 0x18,
};

//! FE8U = 0x080BAC78
void GmapUnit_Loop(struct GMapUnitProc * proc)
{
    s16 x;
    s16 y;
    s16 xOam1;
    s16 yOam0;

    if (!(proc->unk_2a & 1))
    {
        return;
    }

    if (gGMData.state.bits.state_3)
    {
        GetWMDisplayPosition(&x, &y);
    }
    else
    {
        x = ((struct GmScreenProc *)(proc->proc_parent))->unk_34;
        y = ((struct GmScreenProc *)(proc->proc_parent))->unk_36;
    }

    xOam1 = proc->unk_3c - x;
    yOam0 = proc->unk_3e - y;

    if (((u16)(yOam0 + 0x20) < 0xe0) && ((u16)(xOam1 + 0x10) < 0x110))
    {
        xOam1 = xOam1 & 0x1ff;
        yOam0 = yOam0 & 0xff;

        if (proc->unk_37 == 4)
        {
            int oam2;
            sub_80270DC(gUnknown_08205F7C[proc->unk_34], (void *)(0x06010000 + proc->unk_30 * 0x20));

            oam2 = proc->unk_30 + OAM2_PAL(proc->unk_36) + gUnknown_08205F7C[proc->unk_34] + proc->unk_2e;
            SMS_DisplayOne(proc->unk_38, proc->unk_2c, xOam1, yOam0, oam2, proc->unk_2a & 2);
        }
        else
        {
            if ((proc->unk_2a & 2) != 0)
            {
                yOam0 |= 0x400;
            }

            if ((proc->unk_2a & 4) != 0)
            {
                proc->unk_40->gfxNeedsUpdate = 1;
                proc->unk_2a &= ~4;
            }

            AP_Update(proc->unk_40, xOam1, yOam0);
        }
    }

    return;
}

//! FE8U = 0x080BADD4
int GetPaletteIdForAllegience(int faction)
{
    switch (faction)
    {
        case FACTION_ID_BLUE:
        default:
            return 0xc;

        case FACTION_ID_GREEN:
            return 0xd;

        case FACTION_ID_RED:
            return 0xe;
    }
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3DECC[] =
{
    PROC_NAME("GmapUnit"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmapUnit_Destruct),

    PROC_CALL(GmapUnit_Init),
    PROC_REPEAT(GmapUnit_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BADF0
int NewMapUnit(struct GMapUnitContainerProc * container, u16 classId, int faction)
{
    struct GMapUnitProc * mapUnitProc;
    struct APHandle * ap;
    int i;

    for (i = 0; i < 7; i++)
    {
        if (container->unk_34[i] == NULL)
        {
            break;
        }
    }

    if (i == 7)
    {
        return -1;
    }

    mapUnitProc = Proc_Start(gUnknown_08A3DECC, container->proc_parent);
    if (mapUnitProc == NULL)
    {
        return -2;
    }

    mapUnitProc->unk_2e = 0x800;
    mapUnitProc->unk_35 = faction;
    mapUnitProc->unk_36 = GetPaletteIdForAllegience(mapUnitProc->unk_35);
    mapUnitProc->unk_34 = i;
    mapUnitProc->unk_38 = classId;
    mapUnitProc->unk_3a = classId;

    SMS_SomethingGmapUnit(GetClassSMSId(classId), mapUnitProc->unk_34, gUnknown_08205F7C[mapUnitProc->unk_34]);
    mapUnitProc->unk_2c = 8;

    ap = AP_Create(MMS_GetROMTCS2(classId), 8);

    if (ap == NULL)
    {
        Proc_End(gUnknown_08A3DECC);
        return -3;
    }

    AP_SwitchAnimation(ap, mapUnitProc->unk_37);

    Decompress(MMS_GetGfx(classId), GetMapUnitMMSGfxBuffer(i));
    ap->pGraphics = GetMapUnitMMSGfxBuffer(i);

    mapUnitProc->unk_30 = container->unk_2c;
    ap->tileBase = (i * 4) + container->unk_2c + (mapUnitProc->unk_36 & 0xf) * 0x1000 + mapUnitProc->unk_2e;

    mapUnitProc->unk_40 = ap;

    container->unk_34[i] = mapUnitProc;

    return i;
}

//! FE8U = 0x080BAF0C
void MapUnitC_DeleteGmapUnit(struct GMapUnitContainerProc * container, int index)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    if (mapUnitProc != NULL)
    {
        AP_Delete(mapUnitProc->unk_40);
        mapUnitProc->unk_40 = NULL;
        Proc_End(mapUnitProc);
        container->unk_34[index] = NULL;
    }

    return;
}

//! FE8U = 0x080BAF34
void MapUnitC_SetPosition(struct GMapUnitContainerProc * container, int index, int x, int y)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    mapUnitProc->unk_3c = x;
    mapUnitProc->unk_3e = y;

    return;
}

//! FE8U = 0x080BAF44
void sub_80BAF44(struct GMapUnitContainerProc * container, int index, u16 * x, u16 * y)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    *x = mapUnitProc->unk_3c;
    *y = mapUnitProc->unk_3e;

    return;
}

//! FE8U = 0x080BAF58
void sub_80BAF58(struct GMapUnitContainerProc * container, int index, int x, int y)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    mapUnitProc->unk_3c += x;
    mapUnitProc->unk_3e += y;

    return;
}

//! FE8U = 0x080BAF70
int sub_80BAF70(struct GMapUnitContainerProc * container, int index)
{
    return container->unk_34[index]->unk_37;
}

//! FE8U = 0x080BAF84
void MapUnitC_SetTCSAnim(struct GMapUnitContainerProc * container, int index, int animId)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    mapUnitProc->unk_37 = animId;
    AP_SwitchAnimation(mapUnitProc->unk_40, mapUnitProc->unk_37);

    return;
}

//! FE8U = 0x080BAFA4
void sub_80BAFA4(struct GMapUnitContainerProc * container, int index, s8 flag)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    if (flag)
    {
        mapUnitProc->unk_2a |= 1;
    }
    else
    {
        mapUnitProc->unk_2a &= ~1;
    }

    return;
}

//! FE8U = 0x080BAFCC
s8 sub_80BAFCC(struct GMapUnitContainerProc * container, int index)
{
    return container->unk_34[index]->unk_2a & 2;
}

//! FE8U = 0x080BAFE0
void sub_80BAFE0(struct GMapUnitContainerProc * container, int index, s8 flag)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    if (flag)
    {
        mapUnitProc->unk_2a |= 2;
    }
    else
    {
        mapUnitProc->unk_2a &= ~2;
    }

    return;
}

//! FE8U = 0x080BB008
int sub_80BB008(struct GMapUnitContainerProc * container, int index)
{
    return container->unk_34[index]->unk_40->objLayer;
}

//! FE8U = 0x080BB018
void MapUnitC_SetTCSOAMIndex(struct GMapUnitContainerProc * container, int index, int layer)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];
    mapUnitProc->unk_40->objLayer = layer;
    mapUnitProc->unk_2c = layer;
    return;
}

//! FE8U = 0x080BB028
int sub_80BB028(struct GMapUnitContainerProc * container, int index)
{
    return container->unk_34[index]->unk_35;
}

//! FE8U = 0x080BB038
void MapUnitC_SetAllegienceColorIndex(struct GMapUnitContainerProc * container, int index, int colorIndex)
{
    int pal;

    struct GMapUnitProc * mapUnitProc = container->unk_34[index];

    if (colorIndex >= 0)
    {
        mapUnitProc->unk_35 = colorIndex;
    }

    pal = GetPaletteIdForAllegience(mapUnitProc->unk_35);
    mapUnitProc->unk_36 = pal;
    mapUnitProc->unk_40->tileBase = container->unk_2c + (index * 4) + (pal & 0xf) * 0x1000 + mapUnitProc->unk_2e;

    return;
}

//! FE8U = 0x080BB078
void sub_80BB078(struct GMapUnitContainerProc * container, int index, int pal)
{
    struct GMapUnitProc * mapUnitProc = container->unk_34[index];
    mapUnitProc->unk_36 = pal;
    mapUnitProc->unk_40->tileBase = container->unk_2c + (index * 4) + (pal & 0xf) * 0x1000 + mapUnitProc->unk_2e;
    return;
}

//! FE8U = 0x080BB0A4
void MapUnitC_MarkSomething(struct GMapUnitContainerProc * container, int index)
{
    struct GMapUnitProc * mapUnitProc;
    int i;

    if (index >= 0)
    {
        mapUnitProc = container->unk_34[index];
        mapUnitProc->unk_2a |= 4;
        return;
    }

    for (i = 0; i < 7; i++)
    {
        mapUnitProc = container->unk_34[i];
        if (mapUnitProc)
        {
            mapUnitProc->unk_2a |= 4;
        }
    }

    return;
}

//! FE8U = 0x080BB0E0
s8 sub_80BB0E0(struct GMapUnitContainerProc * container, int index, int classId)
{
    struct APHandle * ap;
    struct GMapUnitProc * mapUnitProc;
    int r2;

    mapUnitProc = container->unk_34[index];
    if (mapUnitProc->unk_40 != NULL)
    {
        AP_Delete(mapUnitProc->unk_40);
    }

    r2 = classId;
    if (r2 == 0)
    {
        r2 = mapUnitProc->unk_38;
    }

    if (r2 != mapUnitProc->unk_3a)
    {
        mapUnitProc->unk_3a = r2;
        ap = AP_Create(MMS_GetROMTCS2(r2), 8);
        if (ap == NULL)
        {
            return 0;
        }

        AP_SwitchAnimation(ap, mapUnitProc->unk_37);
        Decompress(MMS_GetGfx(r2), GetMapUnitMMSGfxBuffer(index));

        ap->pGraphics = GetMapUnitMMSGfxBuffer(index);
        mapUnitProc->unk_30 = container->unk_2c;
        ap->tileBase = container->unk_2c + (index * 4) + (mapUnitProc->unk_36 & 0xf) * 0x1000 + mapUnitProc->unk_2e;
        mapUnitProc->unk_40 = ap;
    }

    return 1;
}

//! FE8U = 0x080BB188
u16 sub_80BB188(struct GMapUnitContainerProc * container, int index)
{
    return container->unk_34[index]->unk_38;
}

//! FE8U = 0x080BB194
u16 sub_80BB194(struct GMapUnitContainerProc * container, int index)
{
    return container->unk_34[index]->unk_3a;
}

//! FE8U = 0x080BB1A0
void GmapUnitContainer_Destruct(struct GMapUnitContainerProc * proc)
{
    int i;

    struct GMapUnitProc ** r4 = proc->unk_34;
    struct GMapUnitProc ** r6 = proc->unk_34;

    for (i = 0; i < 7; r4++, i++)
    {
        if (r6 == NULL)
        {
            continue;
        }

        Proc_End(*r4);
        *r4 = NULL;
    }

    return;
}

//! FE8U = 0x080BB1C8
void GmapUnitContainer_Init(struct GMapUnitContainerProc * proc)
{
    CpuFill32(0, proc->unk_34, 0x1c);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3DEFC[] =
{
    PROC_NAME("GmapUnit"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmapUnitContainer_Destruct),

    PROC_CALL(GmapUnitContainer_Init),
    PROC_BLOCK,

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BB1E8
ProcPtr NewGmapUnitContainer(ProcPtr parent, int layer, int chr)
{
    struct GMapUnitContainerProc * proc = Proc_Start(gUnknown_08A3DEFC, parent);
    proc->unk_2c = layer;
    proc->unk_30 = chr;

    return proc;
}

//! FE8U = 0x080BB20C
void GmapUnitFade_Destruct(struct GMapUnitFadeProc * proc)
{
    int i;

    for (i = 0; i < proc->unk_37; i++)
    {
        if (proc->unk_2a < 0)
        {
            sub_80BAFA4(((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_4c, proc->unk_30[i], 0);
        }

        MapUnitC_SetAllegienceColorIndex(
            ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_4c, proc->unk_30[i], -1);
    }

    return;
}

//! FE8U = 0x080BB264
void GmapUnitFade_Init(struct GMapUnitFadeProc * proc)
{
    proc->unk_2e = 0;
    return;
}

//! FE8U = 0x080BB26C
u16 sub_80BB26C(int arg0, int arg1, int arg2, int arg3, int arg4)
{
    int red;
    int green;
    int blue;

    u16 col1;
    int r1;
    int g1;
    int b1;

    u16 col2;
    int r2;
    int g2;
    int b2;

    int num;

    int tmp = 0x10 * 0x10;

    if (arg0 >= 0)
    {
        col1 = gPaletteBuffer[(arg0 * 0x10) + (arg1 + tmp)];
        r1 = col1 & 0x1f;
        g1 = (col1 & 0x3e0) >> 5;
        b1 = (col1 & 0x7c00) >> 10;
    }
    else
    {
        b1 = 0;
        g1 = 0;
        r1 = 0;
    }

    if (arg2 >= 0)
    {
        col2 = gPaletteBuffer[(arg2 * 0x10) + (arg3 + tmp)];
        r2 = col2 & 0x1f;
        g2 = (col2 & 0x3e0) >> 5;
        b2 = (col2 & 0x7c00) >> 10;
    }
    else
    {
        b2 = 0;
        g2 = 0;
        r2 = 0;
    }

    num = 0x1000;

    red = r1 + DivArm(num, (r2 - r1) * arg4);
    green = g1 + DivArm(num, (g2 - g1) * arg4);
    blue = b1 + DivArm(num, (b2 - b1) * arg4);

    return ((blue << 10) + (green << 5)) + red;
}

//! FE8U = 0x080BB348
void GmapUnitFade_Loop(struct GMapUnitFadeProc * proc)
{
    u16 * palIt;

    proc->unk_2e++;

    palIt = gPaletteBuffer + OBPAL_OFFSET(0xA);

    if (proc->unk_2e < proc->unk_2c)
    {
        int i;
        int var = sub_800B7E0(proc->unk_2e, proc->unk_2c, 0);

        for (i = 0; i < 0x10; i++)
        {
            *palIt++ = sub_80BB26C(proc->unk_29, i, proc->unk_2a, i, var);
        }
    }
    else
    {
        if (proc->unk_2a >= 0)
        {
            CpuCopy16(gPaletteBuffer + proc->unk_2a * 0x10 + 0x100, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
        }
        else
        {
            CpuFill16(0, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
        }

        Proc_Break(proc);
    }

    EnablePaletteSync();

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3DF2C[] =
{
    PROC_NAME("Gmap Unit Fade"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmapUnitFade_Destruct),
    PROC_SLEEP(0),

    PROC_CALL(GmapUnitFade_Init),
    PROC_REPEAT(GmapUnitFade_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BB3E8
ProcPtr sub_80BB3E8(int index, int palA, int palB, int arg3, ProcPtr parent)
{
    struct GMapUnitFadeProc * proc;

    if (parent)
    {
        proc = Proc_StartBlocking(gUnknown_08A3DF2C, parent);
    }
    else
    {
        proc = Proc_Start(gUnknown_08A3DF2C, PROC_TREE_3);
    }

    proc->unk_29 = palA;
    proc->unk_2a = palB;
    proc->unk_2c = arg3;

    if (palA >= 0)
    {
        CpuCopy16(gPaletteBuffer + palA * 0x10 + 0x100, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
    }
    else
    {
        CpuFill16(0, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
    }

    EnablePaletteSync();

    proc->unk_30[0] = index;
    proc->unk_37 = 1;

    // return proc; // BUG
}

//! FE8U = 0x080BB47C
void sub_80BB47C(void)
{
    Proc_EndEach(gUnknown_08A3DF2C);
    return;
}

//! FE8U = 0x080BB48C
ProcPtr sub_80BB48C(void)
{
    return Proc_Find(gUnknown_08A3DF2C);
}

//! FE8U = 0x080BB49C
void sub_80BB49C(int index)
{
    struct GMapUnitFadeProc * proc = sub_80BB48C();

    if (proc)
    {
        proc->unk_30[proc->unk_37] = index;
        proc->unk_37++;
    }

    return;
}

//! FE8U = 0x080BB4C0
void sub_80BB4C0(int index, int arg1, ProcPtr parent)
{
    struct GMapUnitContainerProc * containerProc =
        ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_4c;
    struct GMapUnitProc * mapUnitProc = containerProc->unk_34[index];

    if (sub_80BB48C() == 0)
    {
        sub_80BB3E8(index, -1, GetPaletteIdForAllegience(mapUnitProc->unk_35), arg1, parent);
    }
    else
    {
        sub_80BB49C(index);
    }

    sub_80BB078(containerProc, index, 10);
    sub_80BAFA4(((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_4c, index, 1);

    return;
}

//! FE8U = 0x080BB538
void sub_80BB538(int index, int arg1, ProcPtr parent)
{
    struct GMapUnitContainerProc * containerProc =
        ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_4c;
    struct GMapUnitProc * mapUnitProc = containerProc->unk_34[index];

    if (sub_80BB48C() == 0)
    {
        sub_80BB3E8(index, GetPaletteIdForAllegience(mapUnitProc->unk_35), -1, arg1, parent);
    }
    else
    {
        sub_80BB49C(index);
    }

    sub_80BB078(containerProc, index, 10);
    sub_80BAFA4(((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_4c, index, 1);

    return;
}
