#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "bmdifficulty.h" // for the spline struct; todo move

#include "worldmap.h"

#include "constants/classes.h"

extern u16 gUnknown_08A3E38E[];
extern u16 gUnknown_08A3E3BA[];
extern u16 gUnknown_08A3E360[];
extern u16 gUnknown_08A3E31C[];
extern u16 gUnknown_08A3E412[];
extern u16 gUnknown_08A3E2F8[];

struct UnknownSub80B8BA4
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0a;
    /* 0C */ int unk_0c;
};

extern u8 gUnknown_08A3E2F0[];

extern struct Struct02003BE8 gUnknown_0201B3A4[];

extern int gUnknown_08A3E22C[];
extern int gUnknown_08A3E23C[];

extern u16 gUnknown_0201B104[];
extern struct Struct0859E7D4 gUnknown_0201B1E4[];

//! FE8U = 0x080BD2AC
int GetCharacterClassId(int pid)
{
    int i;

    for (i = 1; i < 0xc0; i++)
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
void sub_80BD410(struct GMapMuPrimProc * proc)
{
    proc->unk_2b = -1;
    return;
}

//! FE8U = 0x080BD418
void nullsub_70(void)
{
    return;
}

//! FE8U = 0x080BD41C
int sub_80BD41C(int a, int b)
{
    return Sqrt((a * a + b * b) * 16) / 5;
}

#if NONMATCHING

//! FE8U = 0x080BD444
void sub_80BD444(struct GMapMuPrimProc * proc)
{
    u16 t;
    u16 uVar1;
    int uVar2;
    struct Struct02003BE8 * puVar7;

    if (proc->unk_50 < 0)
    {
        proc->unk_50 = sub_80BD41C(
            proc->unk_2e[gWMNodeData].x - proc->unk_2d[gWMNodeData].x,
            proc->unk_2e[gWMNodeData].y - proc->unk_2d[gWMNodeData].y);
    }

    if (((proc->unk_2d[gWMNodeData].shipTravelFlag & 1) != 0) && ((proc->unk_2e[gWMNodeData].shipTravelFlag & 1) != 0))
    {
        sub_80BB0E0(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, 0x50);
    }

    puVar7 = &gUnknown_0201B3A4[proc->unk_2a];
    puVar7->unk_00 = 2;
    puVar7->unk_04 = gUnknown_0201B104 + proc->unk_2a * 0x10;
    puVar7->unk_08 = gUnknown_0201B1E4 + proc->unk_2a * 8;
    puVar7->unk_0C = gUnknown_08A3E22C;
    puVar7->unk_10 = gUnknown_08A3E23C;

    puVar7->unk_02 = sub_80BCE34(proc->unk_2b, proc->unk_2e, proc->unk_50, puVar7->unk_04, puVar7->unk_08, 4);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_2d[gWMNodeData].x,
        proc->unk_2d[gWMNodeData].y + 6);

    if (proc->unk_31 >= 0)
    {
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_31);
    }

    proc->unk_54 = 0;
    MapUnitC_GetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &proc->unk_44, &proc->unk_46);
    proc->unk_40 = 0;

    return;
}

#else

NAKEDFUNC
void sub_80BD444(struct GMapMuPrimProc * param_1)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #8\n\
        adds r6, r0, #0\n\
        ldr r0, [r6, #0x50]\n\
        cmp r0, #0\n\
        bge _080BD48E\n\
        adds r0, r6, #0\n\
        adds r0, #0x2e\n\
        movs r3, #0\n\
        ldrsb r3, [r0, r3]\n\
        lsls r3, r3, #5\n\
        ldr r1, _080BD5A0  @ gWMNodeData\n\
        adds r3, r3, r1\n\
        movs r2, #0x18\n\
        ldrsh r0, [r3, r2]\n\
        adds r2, r6, #0\n\
        adds r2, #0x2d\n\
        ldrb r2, [r2]\n\
        lsls r2, r2, #0x18\n\
        asrs r2, r2, #0x18\n\
        lsls r2, r2, #5\n\
        adds r2, r2, r1\n\
        movs r4, #0x18\n\
        ldrsh r1, [r2, r4]\n\
        subs r0, r0, r1\n\
        movs r5, #0x1a\n\
        ldrsh r1, [r3, r5]\n\
        movs r3, #0x1a\n\
        ldrsh r2, [r2, r3]\n\
        subs r1, r1, r2\n\
        bl sub_80BD41C\n\
        str r0, [r6, #0x50]\n\
    _080BD48E:\n\
        adds r2, r6, #0\n\
        adds r2, #0x2d\n\
        movs r0, #0\n\
        ldrsb r0, [r2, r0]\n\
        lsls r0, r0, #5\n\
        ldr r3, _080BD5A0  @ gWMNodeData\n\
        adds r0, r0, r3\n\
        ldrb r1, [r0, #0x1e]\n\
        movs r4, #1\n\
        adds r0, r4, #0\n\
        ands r0, r1\n\
        movs r5, #0x2e\n\
        adds r5, r5, r6\n\
        mov r8, r5\n\
        mov r9, r2\n\
        adds r7, r6, #0\n\
        adds r7, #0x2b\n\
        cmp r0, #0\n\
        beq _080BD4D4\n\
        movs r0, #0\n\
        ldrsb r0, [r5, r0]\n\
        lsls r0, r0, #5\n\
        adds r0, r0, r3\n\
        ldrb r1, [r0, #0x1e]\n\
        adds r0, r4, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080BD4D4\n\
        ldr r0, [r6, #0x14]\n\
        ldr r0, [r0, #0x4c]\n\
        movs r1, #0\n\
        ldrsb r1, [r7, r1]\n\
        movs r2, #0x50\n\
        bl sub_80BB0E0\n\
    _080BD4D4:\n\
        adds r1, r6, #0\n\
        adds r1, #0x2a\n\
        movs r0, #0\n\
        ldrsb r0, [r1, r0]\n\
        lsls r5, r0, #2\n\
        adds r5, r5, r0\n\
        lsls r5, r5, #2\n\
        ldr r0, _080BD5A4  @ gUnknown_0201B3A4\n\
        adds r5, r5, r0\n\
        movs r0, #0\n\
        mov sl, r0\n\
        movs r0, #2\n\
        strh r0, [r5]\n\
        movs r3, #0\n\
        ldrsb r3, [r1, r3]\n\
        lsls r3, r3, #5\n\
        ldr r0, _080BD5A8  @ gUnknown_0201B104\n\
        adds r3, r3, r0\n\
        str r3, [r5, #4]\n\
        movs r4, #0\n\
        ldrsb r4, [r1, r4]\n\
        lsls r4, r4, #6\n\
        ldr r0, _080BD5AC  @ gUnknown_0201B1E4\n\
        adds r4, r4, r0\n\
        str r4, [r5, #8]\n\
        ldr r0, _080BD5B0  @ gUnknown_08A3E22C\n\
        str r0, [r5, #0xc]\n\
        ldr r0, _080BD5B4  @ gUnknown_08A3E23C\n\
        str r0, [r5, #0x10]\n\
        mov r1, r9\n\
        movs r0, #0\n\
        ldrsb r0, [r1, r0]\n\
        mov r2, r8\n\
        movs r1, #0\n\
        ldrsb r1, [r2, r1]\n\
        ldr r2, [r6, #0x50]\n\
        lsls r2, r2, #0x10\n\
        asrs r2, r2, #0x10\n\
        str r4, [sp]\n\
        movs r4, #4\n\
        str r4, [sp, #4]\n\
        bl sub_80BCE34\n\
        strh r0, [r5, #2]\n\
        ldr r0, [r6, #0x14]\n\
        ldr r0, [r0, #0x4c]\n\
        adds r4, r7, #0\n\
        movs r1, #0\n\
        ldrsb r1, [r4, r1]\n\
        mov r5, r9\n\
        movs r3, #0\n\
        ldrsb r3, [r5, r3]\n\
        lsls r3, r3, #5\n\
        ldr r2, _080BD5A0  @ gWMNodeData\n\
        adds r3, r3, r2\n\
        movs r5, #0x18\n\
        ldrsh r2, [r3, r5]\n\
        movs r5, #0x1a\n\
        ldrsh r3, [r3, r5]\n\
        adds r3, #6\n\
        bl MapUnitC_SetPosition\n\
        adds r2, r6, #0\n\
        adds r2, #0x31\n\
        movs r0, #0\n\
        ldrsb r0, [r2, r0]\n\
        cmp r0, #0\n\
        blt _080BD56E\n\
        ldr r0, [r6, #0x14]\n\
        ldr r0, [r0, #0x4c]\n\
        movs r1, #0\n\
        ldrsb r1, [r4, r1]\n\
        ldrb r2, [r2]\n\
        lsls r2, r2, #0x18\n\
        asrs r2, r2, #0x18\n\
        bl MapUnitC_SetAnimId\n\
    _080BD56E:\n\
        mov r0, sl\n\
        str r0, [r6, #0x54]\n\
        ldr r0, [r6, #0x14]\n\
        ldr r0, [r0, #0x4c]\n\
        movs r1, #0\n\
        ldrsb r1, [r7, r1]\n\
        adds r2, r6, #0\n\
        adds r2, #0x44\n\
        adds r3, r6, #0\n\
        adds r3, #0x46\n\
        bl MapUnitC_GetPosition\n\
        adds r0, r6, #0\n\
        adds r0, #0x40\n\
        mov r1, sl\n\
        strh r1, [r0]\n\
        add sp, #8\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080BD5A0: .4byte gWMNodeData\n\
    _080BD5A4: .4byte gUnknown_0201B3A4\n\
    _080BD5A8: .4byte gUnknown_0201B104\n\
    _080BD5AC: .4byte gUnknown_0201B1E4\n\
    _080BD5B0: .4byte gUnknown_08A3E22C\n\
    _080BD5B4: .4byte gUnknown_08A3E23C\n\
        .syntax divided\n\
    ");
}

#endif

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

#if NONMATCHING

//! FE8U = 0x080BD660
int sub_80BD660(u16 param_1)
{
    if ((param_1 > 0) && (param_1 < 0x1000))
    {
        return 3;
    }

    if ((param_1 > 0x1000) && (param_1 < 0x2000))
    {
        return (param_1 - 0x4000);
    }

    return 2;
}

#else

NAKEDFUNC
int sub_80BD660(u16 param_1)
{
    asm("\n\
        .syntax unified\n\
        push {r4, lr}\n\
        lsls r0, r0, #0x10\n\
        lsrs r1, r0, #0x10\n\
        adds r3, r1, #0\n\
        movs r2, #0x9a\n\
        lsls r2, r2, #7\n\
        adds r0, r1, r2\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        ldr r2, _080BD67C  @ 0x000019FF\n\
        cmp r0, r2\n\
        bhi _080BD680\n\
        movs r0, #3\n\
        b _080BD69C\n\
        .align 2, 0\n\
    _080BD67C: .4byte 0x000019FF\n\
    _080BD680:\n\
        ldr r4, _080BD690  @ 0xFFFFCD00\n\
        adds r0, r1, r4\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        cmp r0, r2\n\
        bhi _080BD694\n\
        movs r0, #2\n\
        b _080BD69C\n\
        .align 2, 0\n\
    _080BD690: .4byte 0xFFFFCD00\n\
    _080BD694:\n\
        ldr r1, _080BD6A4  @ 0xFFFFC000\n\
        adds r0, r3, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x1f\n\
    _080BD69C:\n\
        pop {r4}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080BD6A4: .4byte 0xFFFFC000\n\
        .syntax divided\n\
    ");
}

#endif

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

    if (proc->unk_29_5)
    {
        sub_80BE45C(proc);
        if ((proc->unk_29_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
        {
            sub_80BE45C(proc);
        }
    }

    animId = sub_80BD6A8(proc);

    if (((animId >= 0) &&
         (MapUnitC_GetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b) != animId)) &&
        (proc->unk_29_4))
    {
        MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, animId);
        MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b);
    }

    if (proc->unk_29_3)
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

extern struct Struct02003BE8 gUnknown_0201B3A4[];

void sub_800A950(struct Struct02003BE8 *, int, int *);

//! FE8U = 0x080BD830
void sub_80BD830(struct GMapMuPrimProc * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;
    int coord[2];

    if (proc->unk_29_1)
    {
        return;
    }

    if (proc->unk_42 > 0)
    {
        proc->unk_42--;
        return;
    }

    if ((proc->unk_29_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
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

        if ((proc->unk_29_4) && (proc->unk_32 >= 0))
        {
            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_32);
        }

        gGMData.units[proc->unk_2a].location = proc->unk_2e;

        if (proc->unk_29_3)
        {
            MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);
            GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);
            gGMData.xCamera = x2;
            gGMData.yCamera = y2;
        }

        Proc_Break(proc);

        proc->unk_29_0 = 0;
    }

    return;
}

//! FE8U = 0x080BD9D8
void sub_80BD9D8(struct GMapMuPrimProc * proc)
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
void sub_80BDA78(struct GMapMuPrimProc * proc)
{
    int coeff;
    s16 x;
    s16 y;
    s16 x2;
    s16 y2;

    if (proc->unk_29_1)
    {
        return;
    }

    if (proc->unk_42 > 0)
    {
        proc->unk_42--;
        return;
    }

    if ((proc->unk_29_2) && (gKeyStatusPtr->heldKeys & A_BUTTON))
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

        if ((proc->unk_29_4) && (proc->unk_32 >= 0))
        {
            MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, proc->unk_32);
        }

        if (proc->unk_29_3)
        {
            MapUnitC_GetPosition(((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x, &y);
            GetWMCenteredCameraPosition(x, y - 14, &x2, &y2);
            gGMData.xCamera = x2;
            gGMData.yCamera = y2;
        }

        Proc_Break(proc);
        proc->unk_29_0 = 0;
    }

    return;
}

//! FE8U = 0x080BDC00
void nullsub_49(void)
{
    return;
}

extern struct ProcCmd gUnknown_08A3E248[];

//! FE8U = 0x080BDC04
void MapMU_FillPrim(struct GMapMuProc * proc)
{
    int i;

    for (i = 0; i < 7; i++)
    {
        proc->unk_2c[i] = Proc_Start(gUnknown_08A3E248, proc->proc_parent);
    }

    return;
}

extern struct ProcCmd gUnknown_08A3E2C0[];

//! FE8U = 0x080BDC28
ProcPtr NewMapMU(ProcPtr parent)
{
    return Proc_Start(gUnknown_08A3E2C0, parent);
}

//! FE8U = 0x080BDC3C
void MapMU_SetUnit(struct GMapMuProc * muProc, int index, u8 useClass, int id, int faction, int nodeId)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    if (muPrimProc->unk_2a > -1)
    {
        MapMU_RemoveUnit(muProc, index);
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
    muPrimProc->unk_29_0 = 0;
    muPrimProc->unk_29_2 = 0;
    muPrimProc->unk_29_3 = 0;

    MapMU_SetUnitTCSOAMIndex(muProc, index, gUnknown_08A3E2F0[index]);

    return;
}

//! FE8U = 0x080BDD2C
void MapMU_RemoveUnit(struct GMapMuProc * muProc, int index)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    if (muPrimProc->unk_2b >= 0)
    {
        muPrimProc->unk_2a = 0xff;
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
void sub_80BDDC4(struct GMapMuProc * muProc, int index)
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
void sub_80BDE3C(struct GMapMuProc * muProc, int index)
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
void sub_80BDEB4(struct GMapMuProc * muProc, struct UnknownSub80B8BA4 * param_2)
{
    int unkA;
    int unkB;

    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[param_2->unk_00];

    muPrimProc->unk_2d = param_2->unk_06;
    muPrimProc->unk_2e = param_2->unk_08;

    unkA = param_2->unk_0c;

    if (unkA < 0)
    {
        int tmp = sub_80BD41C(
            ABS(muPrimProc->unk_2e[gWMNodeData].x - muPrimProc->unk_2d[gWMNodeData].x),
            ABS(muPrimProc->unk_2e[gWMNodeData].y - muPrimProc->unk_2d[gWMNodeData].y));

        unkB = param_2->unk_0c;

        if (unkB < 0)
        {
            unkB = -unkB;
        }

        unkA = tmp * unkB;
    }

    muPrimProc->unk_50 = unkA;

    muPrimProc->unk_29_2 = param_2->unk_01;
    muPrimProc->unk_42 = param_2->unk_0a;

    muPrimProc->unk_29_0 = 1;
    muPrimProc->unk_29_1 = 0;
    muPrimProc->unk_2c = 1;
    muPrimProc->unk_29_4 = 1;
    muPrimProc->unk_29_5 = param_2->unk_02;
    muPrimProc->unk_30 = 0;
    muPrimProc->unk_31 = param_2->unk_03;
    muPrimProc->unk_32 = param_2->unk_04;

    Proc_Goto(muPrimProc, 1);

    return;
}

struct UnknownSub80BDFA4
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0a;
    /* 0C */ u16 unk_0c;
    /* 0E */ u16 unk_0e;
    /* 10 */ int unk_10;
};

//! FE8U = 0x080BDFA4
void sub_80BDFA4(struct GMapMuProc * muProc, struct UnknownSub80BDFA4 * param_2)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[param_2->unk_00];

    muPrimProc->unk_48 = param_2->unk_06;
    muPrimProc->unk_4a = param_2->unk_08;
    muPrimProc->unk_4c = param_2->unk_0a;
    muPrimProc->unk_4e = param_2->unk_0c;
    muPrimProc->unk_50 = param_2->unk_10;

    muPrimProc->unk_29_2 = param_2->unk_02;

    muPrimProc->unk_2f = param_2->unk_01;
    muPrimProc->unk_42 = param_2->unk_0e;

    muPrimProc->unk_29_0 = 1;
    muPrimProc->unk_29_1 = 0;
    muPrimProc->unk_2c = 2;

    muPrimProc->unk_29_4 = 1;
    muPrimProc->unk_29_5 = param_2->unk_03;

    muPrimProc->unk_30 = 0;
    muPrimProc->unk_31 = param_2->unk_04;
    muPrimProc->unk_32 = param_2->unk_05;

    Proc_Goto(muPrimProc, 2);

    return;
}

//! FE8U = 0x080BE054
void sub_80BE054(struct GMapMuProc * muProc, int index)
{
    muProc->unk_2c[index]->unk_29_1 = 1;
    return;
}

//! FE8U = 0x080BE068
void sub_80BE068(struct GMapMuProc * muProc, int index)
{
    muProc->unk_2c[index]->unk_29_1 = 0;
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
void MapMU_SetUnitTCSOAMIndex(struct GMapMuProc * muProc, int index, int layer)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_SetLayer(((struct WorldMapMainProc *)(muProc->proc_parent))->unk_4c, muPrimProc->unk_2b, layer);
    return;
}

//! FE8U = 0x080BE108
void MapMU_80BE108(struct GMapMuProc * muProc, int index, s8 param_3)
{
    muProc->unk_2c[index]->unk_29_3 = param_3;
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
            if ((muProc->unk_2c[i]->unk_2b >= 0) && (muProc->unk_2c[i]->unk_29_0))
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
            return muPrimProc->unk_29_0;
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

    if (proc->unk_29_0)
    {
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
                if (proc->unk_29_3)
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
                if (proc->unk_29_3)
                {
                    MapUnitC_GetPosition(
                        ((struct WorldMapMainProc *)(proc->proc_parent))->unk_4c, proc->unk_2b, &x1, &y1);
                    GetWMCenteredCameraPosition(x1, y1 - 0xe, &x2, &y2);
                    gGMData.xCamera = x2;
                    gGMData.yCamera = y2;
                }
                break;
        }

        proc->unk_29_0 = 0;
        Proc_Goto(proc, 0);
    }

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
void sub_80BE35C(struct GMapMuProc * muProc, int index, s16 xBase, s16 yBase)
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
void sub_80BE3A0(struct GMapMuProc * muProc, int index, s16 * x, s16 * y)
{
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];
    MapUnitC_GetPosition(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->unk_4c, muPrimProc->unk_2b, x, y);
    *y -= 6;
    return;
}

//! FE8U = 0x080BE3C8
void sub_80BE3C8(struct GMapMuProc * muProc, int index, int nodeId)
{
    sub_80BE35C(muProc, index, nodeId[gWMNodeData].x, nodeId[gWMNodeData].y);
    return;
}

//! FE8U = 0x080BE3E8
void sub_80BE3E8(struct GMapMuProc * muProc, int index, s8 param_3)
{
    muProc->unk_2c[index]->unk_29_2 = param_3;
    return;
}

//! FE8U = 0x080BE40C
void sub_80BE40C(struct GMapMuProc * muProc, int index, int param_3)
{
    sub_80BB4C0(muProc->unk_2c[index]->unk_2b, param_3, NULL);
    return;
}

//! FE8U = 0x080BE42C
void sub_80BE42C(struct GMapMuProc * muProc, int index, int param_3)
{
    sub_80BB538(muProc->unk_2c[index]->unk_2b, param_3, NULL);
    return;
}

//! FE8U = 0x080BE44C
s8 sub_80BE44C(void)
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
        MU_StartStepSfx(sfxLut[divRem + 2], sfxLut[1], (s16)hPos);
    }

    return;
}

//! FE8U = 0x080BE534
void MapMU_SetUnitClass(ProcPtr muProc, int index, int jid, int faction, int nodeId)
{
    MapMU_SetUnit(muProc, index, 1, jid, faction, nodeId);
    return;
}

//! FE8U = 0x080BE550
void MapMU_SetUnitChar(ProcPtr muProc, int index, int pid, int faction, int nodeId)
{
    MapMU_SetUnit(muProc, index, 0, pid, faction, nodeId);
    return;
}
