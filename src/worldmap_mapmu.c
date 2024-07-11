#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 gUnknown_08A3E38E[];
extern u16 gUnknown_08A3E3BA[];
extern u16 gUnknown_08A3E360[];
extern u16 gUnknown_08A3E31C[];
extern u16 gUnknown_08A3E412[];
extern u16 gUnknown_08A3E2F8[];

extern struct Struct02003BE8 gUnknown_0201B3A4[];

extern u16 gUnknown_0201B104[];
extern struct Struct0859E7D4 gUnknown_0201B1E4[];

int CONST_DATA gUnknown_08A3E22C[] =
{
    0, 0, 0, 0,
};

int CONST_DATA gUnknown_08A3E23C[] =
{
    0x08001000,
    0x00001000,
    0x00000000,
};

//! FE8U = 0x080BD2A8
void GmMuPrim_OnEnd_Null(void)
{
    return;
}

//! FE8U = 0x080BD2AC
int GetCharacterClassId(int pid)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number != pid)
        {
            continue;
        }

        return unit->pClassData->number;
    }

    return gCharacterData[pid - 1].defaultClass;
}

//! FE8U = 0x080BD2EC
void MapMUPrim_MakeUnitForChar(struct GMapMuPrimProc * proc, int pid, int nodeId)
{
    if (proc->unk_2b >= 0)
    {
        MapUnitC_DeleteGmapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);
        proc->unk_2b = -1;
    }

    proc->unk_2b = NewMapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, GetCharacterClassId(pid), 0);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, nodeId[gWMNodeData].x,
        nodeId[gWMNodeData].y + 6);
    MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 4);
    MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);
    return;
}

//! FE8U = 0x080BD374
void MapMUPrim_MakeUnitForClass(struct GMapMuPrimProc * proc, int jid, int nodeId)
{
    if (proc->unk_2b >= 0)
    {
        MapUnitC_DeleteGmapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);
        proc->unk_2b = -1;
    }

    proc->unk_2b = NewMapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, jid, 0);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, nodeId[gWMNodeData].x,
        nodeId[gWMNodeData].y + 6);
    MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 4);
    MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);

    return;
}

//! FE8U = 0x080BD3E8
void MapMUPrim_RemoveLinkedMapUnit(struct GMapMuPrimProc * proc)
{
    if (proc->unk_2b >= 0)
    {
        MapUnitC_DeleteGmapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);
        proc->unk_2b = -1;
    }

    return;
}

//! FE8U = 0x080BD410
void GmMuPrim_OnInit(struct GMapMuPrimProc * proc)
{
    proc->unk_2b = -1;
    return;
}

//! FE8U = 0x080BD418
void GmMuPrim_Loop_Null(void)
{
    return;
}

//! FE8U = 0x080BD41C
int sub_80BD41C(int a, int b)
{
    return Sqrt((a * a + b * b) * 16) / 5;
}

//! FE8U = 0x080BD444
void GmMuPrim_80BD444(struct GMapMuPrimProc * proc)
{
    struct Struct02003BE8 * unkSplineStruct;

    if (proc->unk_50 < 0)
    {
        proc->unk_50 = sub_80BD41C(
            proc->unk_2e[gWMNodeData].x - proc->unk_2d[gWMNodeData].x,
            proc->unk_2e[gWMNodeData].y - proc->unk_2d[gWMNodeData].y);
    }

    if (proc->unk_2d[gWMNodeData].shipTravelFlag & 1
        && proc->unk_2e[gWMNodeData].shipTravelFlag & 1)
        sub_80BB0E0(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 0x50);


    unkSplineStruct = &gUnknown_0201B3A4[proc->unk_2a];

    unkSplineStruct->unk_00 = 0;
    unkSplineStruct->unk_00 = 2;
    unkSplineStruct->unk_04 = gUnknown_0201B104 + proc->unk_2a * 0x10;
    unkSplineStruct->unk_08 = gUnknown_0201B1E4 + proc->unk_2a * 8;
    unkSplineStruct->unk_0C = gUnknown_08A3E22C;
    unkSplineStruct->unk_10 = gUnknown_08A3E23C;
    unkSplineStruct->unk_02 = sub_80BCE34(proc->unk_2d, proc->unk_2e, proc->unk_50, unkSplineStruct->unk_04, unkSplineStruct->unk_08, 4);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_2d[gWMNodeData].x,
        proc->unk_2d[gWMNodeData].y + 6);

    if (proc->unk_31 >= 0)
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_31);

    proc->unk_54 = 0;
    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &proc->unk_44, &proc->unk_46);
    proc->unk_40 = 0;

    return;
}

//! FE8U = 0x080BD5B8
s8 sub_80BD5B8(struct GMapMuPrimProc * proc)
{
    int i;
    u16 x1;
    u16 y1;
    u16 x2;
    u16 y2;

    MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);

    x2 = x1 - proc->unk_44;
    y2 = y1 - proc->unk_46;

    if ((x2 != 0) || (y2 != 0))
    {

        if (proc->unk_40 >= 3)
        {
            for (i = 0; i < 2; i++)
            {
                proc->unk_34[i].a = proc->unk_34[i + 1].a;
                proc->unk_34[i].b = proc->unk_34[i + 1].b;
            }

            proc->unk_34[2].a = x2;
            proc->unk_34[2].b = y2;
        }
        else
        {
            proc->unk_34[proc->unk_40].a = x2;
            proc->unk_34[proc->unk_40].b = y2;
            proc->unk_40++;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x080BD660
int sub_80BD660(u16 a)
{
    if ((u16)(a + 0x4d00) < 0x1a00)
    {
        return 3;
    }

    if (a < 0x3300 || a >= 0x4d00)
    {
        return (u16)(a - 0x4000) >> 0xf;
    }

    return 2;
}

//! FE8U = 0x080BD6A8
int sub_80BD6A8(struct GMapMuPrimProc * proc)
{
    u32 unk;
    int i;

    s16 b = 0;
    s16 a = 0;

    for (i = 0; i < proc->unk_40; i++)
    {
        a += proc->unk_34[i].a;
        b += proc->unk_34[i].b;

        unk = sub_80C0834(0, 0, a, b, 8);

        if (unk > 35)
        {
            return sub_80BD660(ArcTan2(a, b));
        }
    }

    return -1;
}

//! FE8U = 0x080BD740
void sub_80BD740(struct GMapMuPrimProc * proc)
{
    int animId;
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    if (!sub_80BD5B8(proc))
    {
        return;
    }

    if (proc->flags_5)
    {
        sub_80BE45C(proc);
        if ((proc->flags_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
        {
            sub_80BE45C(proc);
        }
    }

    animId = sub_80BD6A8(proc);

    if (((animId >= 0) &&
         (MapUnitC_GetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b) != animId)) &&
        (proc->flags_4))
    {
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, animId);
        MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);
    }

    if (proc->flags_3)
    {
        MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);
        GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
        gGMData.xCamera = x2;
        gGMData.yCamera = y2;
    }

    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &proc->unk_44, &proc->unk_46);

    return;
}

//! FE8U = 0x080BD830
void GmMuPrim_80BD830(struct GMapMuPrimProc * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;
    int coord[2];

    if (proc->flags_1)
    {
        return;
    }

    if (proc->unk_42 > 0)
    {
        proc->unk_42--;
        return;
    }

    if ((proc->flags_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
    {
        proc->unk_54 += 2;
    }

    proc->unk_54++;

    if (proc->unk_54 < proc->unk_50)
    {
        sub_800A950(&gUnknown_0201B3A4[proc->unk_2a], proc->unk_54 * 0x1000, coord);
        MapUnitC_SetPosition(
            ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, coord[0] >> 4, (coord[1] >> 4) + 6);
        sub_80BD740(proc);
    }
    else
    {
        if ((proc->unk_2d[gWMNodeData].shipTravelFlag & 1) && (proc->unk_2e[gWMNodeData].shipTravelFlag & 1))
        {
            sub_80BB0E0(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 0);
        }

        MapUnitC_SetPosition(
            ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_2e[gWMNodeData].x,
            proc->unk_2e[gWMNodeData].y + 6);

        if ((proc->flags_4) && (proc->unk_32 >= 0))
        {
            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_32);
        }

        gGMData.units[proc->unk_2a].location = proc->unk_2e;

        if (proc->flags_3)
        {
            MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);
            GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
            gGMData.xCamera = x2;
            gGMData.yCamera = y2;
        }

        Proc_Break(proc);

        proc->flags_0 = 0;
    }

    return;
}

//! FE8U = 0x080BD9D8
void GmMuPrim_80BD9D8(struct GMapMuPrimProc * proc)
{

    if (proc->unk_50 < 0)
    {
        proc->unk_50 = sub_80BD41C(
            proc->unk_4c[gWMNodeData].x - proc->unk_48[gWMNodeData].x,
            proc->unk_4e[gWMNodeData].y - proc->unk_4a[gWMNodeData].y);
    }

    proc->unk_54 = 0;

    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &proc->unk_44, &proc->unk_46);

    if (proc->unk_31 >= 0)
    {
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_31);
    }

    proc->unk_40 = 0;

    return;
}

//! FE8U = 0x080BDA78
void GmMuPrim_80BDA78(struct GMapMuPrimProc * proc)
{
    int coeff;
    s16 x;
    s16 y;
    s16 x2;
    s16 y2;

    if (proc->flags_1)
    {
        return;
    }

    if (proc->unk_42 > 0)
    {
        proc->unk_42--;
        return;
    }

    if ((proc->flags_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
    {
        proc->unk_54 += 2;
    }

    proc->unk_54++;

    if (proc->unk_54 < proc->unk_50)
    {
        coeff = sub_800B84C(proc->unk_54, proc->unk_50, proc->unk_2f);
        x = proc->unk_48 + DivArm(0x1000, (proc->unk_4c - proc->unk_48) * coeff);
        y = proc->unk_4a + DivArm(0x1000, (proc->unk_4e - proc->unk_4a) * coeff);
        MapUnitC_SetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, x, y + 6);
        sub_80BD740(proc);
    }
    else
    {
        MapUnitC_SetPosition(
            ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_4c, proc->unk_4e + 6);

        if ((proc->flags_4) && (proc->unk_32 >= 0))
        {
            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_32);
        }

        if (proc->flags_3)
        {
            MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x, &y);
            GetWMCenteredCameraPosition(x, y - 14, &x2, &y2);
            gGMData.xCamera = x2;
            gGMData.yCamera = y2;
        }

        Proc_Break(proc);
        proc->flags_0 = 0;
    }

    return;
}

//! FE8U = 0x080BDC00
void GmMu_OnEnd_Null(void)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GMapMuPrim[] =
{
    PROC_NAME("Gmap MU prim"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmMuPrim_OnEnd_Null),
    PROC_CALL(GmMuPrim_OnInit),

PROC_LABEL(0),
    PROC_REPEAT(GmMuPrim_Loop_Null),

PROC_LABEL(1),
    PROC_CALL(GmMuPrim_80BD444),
    PROC_REPEAT(GmMuPrim_80BD830),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(GmMuPrim_80BD9D8),
    PROC_REPEAT(GmMuPrim_80BDA78),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BDC04
void GmMu_OnInit(struct GMapMuProc * proc)
{
    int i;

    for (i = 0; i < 7; i++)
    {
        proc->unk_2c[i] = Proc_Start(gProcScr_GMapMuPrim, proc->proc_parent);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GMapMu[] =
{
    PROC_NAME("Gmap MU"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmMu_OnEnd_Null),
    PROC_CALL(GmMu_OnInit),

    PROC_BLOCK,

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BDC28
ProcPtr StartGmMu(ProcPtr parent)
{
    return Proc_Start(gProcScr_GMapMu, parent);
}

// clang-format off

u8 CONST_DATA gGMapMuSpriteLayerLut[] =
{
    8, 9, 9, 9, 9, 9, 9,
};

// clang-format on

//! FE8U = 0x080BDC3C
void GmMu_SetUnit(struct GMapMuProc * muProc, int index, u8 useClass, int id, int faction, int nodeId)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    if (muPrimProc->unk_2a > -1)
    {
        GmMu_RemoveUnit(muProc, index);
    }

    muPrimProc->unk_2a = index;

    if (useClass != 0)
    {
        MapMUPrim_MakeUnitForClass(muPrimProc, id, nodeId);
        gGMData.units[index].id = id;
        gGMData.units[index].state |= 2;
    }
    else
    {
        MapMUPrim_MakeUnitForChar(muPrimProc, id, nodeId);
        gGMData.units[index].id = id;
        gGMData.units[index].state &= ~2;
    }

    gGMData.units[index].location = nodeId;

    if (faction < 0)
    {
        faction = sub_80BD20C(index);
    }

    MapUnitC_SetFaction(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->unk_4c, muPrimProc->unk_2b, faction);

    muPrimProc->unk_40 = 0;
    muPrimProc->unk_2c = 0;
    muPrimProc->flags_0 = 0;
    muPrimProc->flags_2 = 0;
    muPrimProc->flags_3 = 0;

    GmMu_SetSpriteLayer(muProc, index, gGMapMuSpriteLayerLut[index]);

    return;
}

//! FE8U = 0x080BDD2C
void GmMu_RemoveUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    if (muPrimProc->unk_2b >= 0)
    {
        muPrimProc->unk_2a = -1;
        MapMUPrim_RemoveLinkedMapUnit(muPrimProc);

        if (gGMData.units[index].state & 2)
        {
            gGMData.units[index].id = 0;
            gGMData.units[index].state |= 2;
        }
        else
        {
            gGMData.units[index].id = 0;
            gGMData.units[index].state &= ~2;
        }

        gGMData.units[index].state &= ~1;
    }

    return;
}

//! FE8U = 0x080BDD94
void sub_80BDD94(struct GMapMuProc * muProc, int index)
{
    int i;
    struct GMapMuPrimProc ** pMuPrimProc;

    if (index >= 0)
    {
        MapMUPrim_RemoveLinkedMapUnit(muProc->unk_2c[index]);
    }
    else
    {
        pMuPrimProc = muProc->unk_2c;
        for (i = 0; i < 7; i++)
        {
            MapMUPrim_RemoveLinkedMapUnit(pMuPrimProc[i]);
        }
    }

    return;
}

//! FE8U = 0x080BDDC4
void GmShowMuUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc;
    int i;

    if (index >= 0)
    {
        muPrimProc = muProc->unk_2c[index];
        MapUnitC_SetDisplayEnabled(((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, 1);
        gGMData.units[index].state |= 1;
    }
    else
    {
        for (i = 0; i < 7; i++)
        {
            muPrimProc = muProc->unk_2c[i];
            if (muPrimProc->unk_2b >= 0)
            {
                MapUnitC_SetDisplayEnabled(
                    ((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, 1);
                gGMData.units[i].state |= 1;
            }
        }
    }

    return;
}

//! FE8U = 0x080BDE3C
void GmHideMuUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc;
    int i;

    if (index >= 0)
    {
        muPrimProc = muProc->unk_2c[index];
        MapUnitC_SetDisplayEnabled(((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, 0);
        gGMData.units[index].state &= ~1;
    }
    else
    {
        for (i = 0; i < 7; i++)
        {
            muPrimProc = muProc->unk_2c[i];
            if (muPrimProc->unk_2b >= 0)
            {
                MapUnitC_SetDisplayEnabled(
                    ((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, 0);
                gGMData.units[i].state &= ~1;
            }
        }
    }

    return;
}

//! FE8U = 0x080BDEB4
void sub_80BDEB4(struct GMapMuProc * muProc, struct UnknownSub80BDEB4 * input)
{
    int unkA;
    int unkB;

    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[input->unk_00];

    muPrimProc->unk_2d = input->unk_06;
    muPrimProc->unk_2e = input->unk_08;

    unkA = input->unk_0c;

    if (unkA < 0)
    {
        int tmp = sub_80BD41C(
            ABS(muPrimProc->unk_2e[gWMNodeData].x - muPrimProc->unk_2d[gWMNodeData].x),
            ABS(muPrimProc->unk_2e[gWMNodeData].y - muPrimProc->unk_2d[gWMNodeData].y));

        unkB = input->unk_0c;

        if (unkB < 0)
        {
            unkB = -unkB;
        }

        unkA = tmp * unkB;
    }

    muPrimProc->unk_50 = unkA;

    muPrimProc->flags_2 = input->unk_01;
    muPrimProc->unk_42 = input->unk_0a;

    muPrimProc->flags_0 = 1;
    muPrimProc->flags_1 = 0;
    muPrimProc->unk_2c = 1;
    muPrimProc->flags_4 = 1;
    muPrimProc->flags_5 = input->unk_02;
    muPrimProc->unk_30 = 0;
    muPrimProc->unk_31 = input->unk_03;
    muPrimProc->unk_32 = input->unk_04;

    Proc_Goto(muPrimProc, 1);

    return;
}

//! FE8U = 0x080BDFA4
void sub_80BDFA4(struct GMapMuProc * muProc, struct UnknownSub80BDFA4 * input)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[input->unk_00];

    muPrimProc->unk_48 = input->unk_06;
    muPrimProc->unk_4a = input->unk_08;
    muPrimProc->unk_4c = input->unk_0a;
    muPrimProc->unk_4e = input->unk_0c;
    muPrimProc->unk_50 = input->unk_10;

    muPrimProc->flags_2 = input->unk_02;

    muPrimProc->unk_2f = input->unk_01;
    muPrimProc->unk_42 = input->unk_0e;

    muPrimProc->flags_0 = 1;
    muPrimProc->flags_1 = 0;
    muPrimProc->unk_2c = 2;

    muPrimProc->flags_4 = 1;
    muPrimProc->flags_5 = input->unk_03;

    muPrimProc->unk_30 = 0;
    muPrimProc->unk_31 = input->unk_04;
    muPrimProc->unk_32 = input->unk_05;

    Proc_Goto(muPrimProc, 2);

    return;
}

//! FE8U = 0x080BE054
void GmMu_PauseMovement(struct GMapMuProc * muProc, int index)
{
    muProc->unk_2c[index]->flags_1 = 1;
    return;
}

//! FE8U = 0x080BE068
void GmMu_ResumeMovement(struct GMapMuProc * muProc, int index)
{
    muProc->unk_2c[index]->flags_1 = 0;
    return;
}

//! FE8U = 0x080BE080
void sub_80BE080(struct GMapMuProc * muProc, int index, s8 blendEnabled)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_SetBlendEnabled(
        ((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, blendEnabled);
    return;
}

//! FE8U = 0x080BE0A4
void sub_80BE0A4(struct GMapMuProc * muProc, int index, s16 * x, s16 * y)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_GetPosition(((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, x, y);
    return;
}

//! FE8U = 0x080BE0C8
int sub_80BE0C8(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    return MapUnitC_GetLayer(((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b);
}

//! FE8U = 0x080BE0E8
void GmMu_SetSpriteLayer(struct GMapMuProc * muProc, int index, int layer)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_SetLayer(((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, layer);
    return;
}

//! FE8U = 0x080BE108
void GmMu_80BE108(struct GMapMuProc * muProc, int index, s8 flag)
{
    muProc->unk_2c[index]->flags_3 = flag;
    return;
}

//! FE8U = 0x080BE12C
s8 sub_80BE12C(struct GMapMuProc * muProc, int index)
{
    if (index < 0)
    {
        int i;

        for (i = 0; i < 7; i++)
        {
            if ((muProc->unk_2c[i]->unk_2b >= 0) && (muProc->unk_2c[i]->flags_0))
            {
                return 1;
            }
        }
    }
    else
    {
        struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
        if (muPrimProc->unk_2b >= 0)
        {
            return muPrimProc->flags_0;
        }
    }

    return 0;
}

//! FE8U = 0x080BE194
s8 sub_80BE194(struct GMapMuPrimProc * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    if (!proc->flags_0)
    {
        return 0;
    }

    switch (proc->unk_2c)
    {
        case 0x01:
            if ((proc->unk_2d[gWMNodeData].shipTravelFlag & 1) && (proc->unk_2e[gWMNodeData].shipTravelFlag & 1))
            {
                sub_80BB0E0(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 0);
            }

            MapUnitC_SetPosition(
                ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_2e[gWMNodeData].x,
                proc->unk_2e[gWMNodeData].y + 6);

            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 4);

            gGMData.units[proc->unk_2a].location = proc->unk_2e;

            if (proc->flags_3)
            {
                MapUnitC_GetPosition(
                    ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);
                GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
                gGMData.xCamera = x2;
                gGMData.yCamera = y2;
            }

            break;

        case 0x02:
            MapUnitC_SetPosition(
                ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_4c,
                proc->unk_4e + 6);

            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 4);

            if (proc->flags_3)
            {
                MapUnitC_GetPosition(
                    ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);
                GetWMCenteredCameraPosition(x1, y1 - 0xe, &x2, &y2);
                gGMData.xCamera = x2;
                gGMData.yCamera = y2;
            }

            break;
    }

    proc->flags_0 = 0;
    Proc_Goto(proc, 0);

    return 0;
}

//! FE8U = 0x080BE330
void sub_80BE330(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc;
    int i;

    if (index < 0)
    {
        for (i = 0; i < 7; i++)
        {
            muPrimProc = muProc->unk_2c[i];
            sub_80BE194(muPrimProc);
        }
    }
    else
    {
        muPrimProc = muProc->unk_2c[index];
        sub_80BE194(muPrimProc);
    }

    return;
}

//! FE8U = 0x080BE35C
void GmMu_SetPosition(struct GMapMuProc * muProc, int index, s16 xBase, s16 yBase)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    s16 x = xBase;
    s16 y = yBase + 6;

    MapUnitC_SetPosition(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->unk_4c, muPrimProc->unk_2b, x, y);

    muPrimProc->unk_44 = x;
    muPrimProc->unk_46 = y;

    muPrimProc->unk_40 = 0;

    return;
}

//! FE8U = 0x080BE3A0
void GmMu_GetPosition(struct GMapMuProc * muProc, int index, s16 * x, s16 * y)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_GetPosition(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->unk_4c, muPrimProc->unk_2b, x, y);
    *y -= 6;
    return;
}

//! FE8U = 0x080BE3C8
void GmMu_SetNode(struct GMapMuProc * muProc, int index, int nodeId)
{
    GmMu_SetPosition(muProc, index, nodeId[gWMNodeData].x, nodeId[gWMNodeData].y);
    return;
}

//! FE8U = 0x080BE3E8
void sub_80BE3E8(struct GMapMuProc * muProc, int index, s8 flag)
{
    muProc->unk_2c[index]->flags_2 = flag;
    return;
}

//! FE8U = 0x080BE40C
void GmMu_StartFadeIn(struct GMapMuProc * muProc, int index, int arg)
{
    sub_80BB4C0(muProc->unk_2c[index]->unk_2b, arg, NULL);
    return;
}

//! FE8U = 0x080BE42C
void GmMu_StartFadeOut(struct GMapMuProc * muProc, int index, int arg)
{
    sub_80BB538(muProc->unk_2c[index]->unk_2b, arg, NULL);
    return;
}

//! FE8U = 0x080BE44C
s8 GmUnitFadeExists(void)
{
    return (GetGmapUnitFade() != 0) ? 1 : 0;
}

//! FE8U = 0x080BE45C
void sub_80BE45C(struct GMapMuPrimProc * proc)
{
    int divRem;
    u16 * sfxLut;
    int hPos;
    int tmp;

    int jid = sub_80BB194(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);

    if (GetClassData(jid)->attributes & 1)
    {
        switch (jid)
        {
            case CLASS_PEGASUS_KNIGHT:
            case CLASS_FALCON_KNIGHT:
                sfxLut = gUnknown_08A3E3BA;
                break;

            case CLASS_WYVERN_RIDER:
            case CLASS_WYVERN_RIDER_F:
            case CLASS_WYVERN_LORD:
            case CLASS_WYVERN_LORD_F:
            case CLASS_WYVERN_KNIGHT:
            case CLASS_WYVERN_KNIGHT_F:
                sfxLut = gUnknown_08A3E38E;
                break;

            default:
                sfxLut = gUnknown_08A3E360;
                break;
        }
    }
    else
    {
        switch (jid)
        {
            case CLASS_ARMOR_KNIGHT:
            case CLASS_ARMOR_KNIGHT_F:
            case CLASS_GENERAL:
            case CLASS_GENERAL_F:
            case CLASS_MANAKETE_2:
            case CLASS_MANAKETE_MYRRH:
            case CLASS_DRACO_ZOMBIE:
            case CLASS_BLST_REGULAR_USED:
            case CLASS_BLST_LONG_USED:
            case CLASS_BLST_KILLER_USED:
                sfxLut = gUnknown_08A3E31C;
                break;

            case CLASS_FLEET:
                sfxLut = gUnknown_08A3E412;
                break;

            default:
                sfxLut = gUnknown_08A3E2F8;
                break;
        }
    }

    divRem = DivRem((tmp = (proc->unk_30++)), sfxLut[0]);

    hPos = (hPos & 0xFFFF0000);
    hPos |= 0x78;
    hPos &= 0xFFFF;
    hPos |= 0x500000;

    if (sfxLut[divRem + 2] != 0)
    {
        StartPlayMuStepSe(sfxLut[divRem + 2], sfxLut[1], (s16)hPos);
    }

    return;
}

//! FE8U = 0x080BE534
void MapMU_SetUnitClass(ProcPtr muProc, int index, int jid, int faction, int nodeId)
{
    GmMu_SetUnit(muProc, index, 1, jid, faction, nodeId);
    return;
}

//! FE8U = 0x080BE550
void MapMU_SetUnitChar(ProcPtr muProc, int index, int pid, int faction, int nodeId)
{
    GmMu_SetUnit(muProc, index, 0, pid, faction, nodeId);
    return;
}

// clang-format off

u16 CONST_DATA gUnknown_08A3E2F8[] =
{
    0x0010, 0x0002,
    0x0096, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0097, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};

u16 CONST_DATA gUnknown_08A3E31C[] =
{
    0x0020, 0x0002,
    0x00A4, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x00A5, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};

u16 CONST_DATA gUnknown_08A3E360[] =
{
    0x0015, 0x0003,
    0x009A, 0x0000, 0x0000, 0x009B, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x009C, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000,
};

u16 CONST_DATA gUnknown_08A3E38E[] =
{
    0x0014, 0x0001,
    0x00A0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};

u16 CONST_DATA gUnknown_08A3E3BA[] =
{
    0x0014, 0x0001,
    0x00A6, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    // Should this be split?
    0x0014, 0x0001,
    0x02E0, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};

u16 CONST_DATA gUnknown_08A3E412[] =
{
    0x0018, 0x0001,
    0x030F, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x030E, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000,
};

// clang-format on
