#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"

#include "worldmap.h"

struct UnkParentProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x48);
    /* 48 */ int unk_48;
};

struct GMapPIProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text unk_2c;
    /* 34 */ struct Text unk_34;
    /* 3C */ STRUCT_PAD(0x3C, 0x4C);
    /* 4C */ s8 unk_4c;
    /* 4D */ s8 unk_4d;
    /* 4E */ s8 unk_4e;
    /* 4F */ s8 unk_4f;
    /* 50 */ s8 unk_50;
    /* 51 */ STRUCT_PAD(0x51, 0x54);
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ u8 unk_56;
    /* 57 */ u8 unk_57;
    /* 58 */ int unk_58;
    /* 5C */ u16 unk_5c;
    /* 5E */ u8 unk_5e;
    /* 5F */ u8 unk_5f;
    /* 60 */ u8 unk_60;
};

struct Unknown8A3E448
{
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
};

extern u8 gUnknown_08A98EAC[]; // tsa
extern u8 gUnknown_08A98F30[]; // tsa

struct Unknown8A3E448 CONST_DATA gUnknown_08A3E448[] =
{
    {
        -1,
        +1,
        +1,
        -1,
    },
    {
        -1,
        -1,
        -1,
        -1,
    },
    {
        -1,
        -1,
        +1,
        -1,
    },
    {
        -1,
        -1,
        +1,
        -1,
    },
};

// clang-format off

s8 CONST_DATA gUnknown_08A3E458[] =
{
    1, 3, 4,
};

s8 CONST_DATA gUnknown_08A3E45B[] =
{
    3, 1, 0,
};

s8 CONST_DATA gUnknown_08A3E45E[] =
{
    3, 7, 9,
};

s8 CONST_DATA gUnknown_08A3E461[] =
{
    6, 2, 0,
};

// clang-format on

extern u16 gUnknown_0201B430[];
extern u16 gUnknown_0201B458[];
extern u16 gUnknown_0201B718[];
extern u16 gUnknown_0201B71C[];
extern u16 gUnknown_0201B758[];
extern u16 gUnknown_0201B7DA[];
extern u16 gUnknown_0201B864[];
extern u16 gUnknown_0201B958[];
extern u16 gUnknown_0201BBD8[];

// forward declarations
void sub_80BEF20(struct GMapPIProc *, int);

extern u8 gUnknown_08A9901C[]; // gfx
extern u16 gUnknown_08A99120[]; // pal

extern u8 gUnknown_08A97A80[]; // gfx
extern u16 gUnknown_08A97A60[]; // pal

//! FE8U = 0x080BE65C
void sub_80BE65C(int index, int height, int kind)
{
    int width;
    int height2;

    int a = gUnknown_08A3E448[index].unk_02;
    int b = gUnknown_08A3E448[index].unk_03;

    switch (kind)
    {
        case 0:
            width = 13;
            height2 = 4;
            break;

        case 1:
            width = 13;
            height2 = 9;
            break;
    }

    if ((a < 0) && (b < 0))
    {
        int diff;
        TileMap_FillRect(gBG1TilemapBuffer, width, height2, 0);
        TileMap_FillRect(gBG0TilemapBuffer, width, height2, 0);

        diff = height - 10;
        TileMap_CopyRect(gUnknown_0201B958 + (height2 - diff) * 0x20, gBG1TilemapBuffer, width, height);
        TileMap_CopyRect(gUnknown_0201B458 + (height2 - diff) * 0x20, gBG0TilemapBuffer, width, height);
    }

    if ((a > 0) && (b < 0))
    {
        int diff;
        TileMap_FillRect(gBG1TilemapBuffer + (0x1e - width), width, height2, 0);
        TileMap_FillRect(gBG0TilemapBuffer + (0x1e - width), width, height2, 0);

        diff = height - 10;
        TileMap_CopyRect(
            gUnknown_0201B958 + (height2 - diff) * 0x20, gBG1TilemapBuffer + (0x1e - width), width, height);
        TileMap_CopyRect(
            gUnknown_0201B458 + (height2 - diff) * 0x20, gBG0TilemapBuffer + (0x1e - width), width, height);
    }

    if ((a < 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x200, 13, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x200, 13, 4, 0);

        TileMap_CopyRect(gUnknown_0201BBD8, gBG1TilemapBuffer + 0x200 + (0x16 - height) * 0x20 - 0x200, 13, height);
        TileMap_CopyRect(gUnknown_0201B758, gBG0TilemapBuffer + 0x200 + (0x16 - height) * 0x20 - 0x200, 13, height);
    }

    if ((a > 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x211, 13, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x211, 13, 4, 0);

        TileMap_CopyRect(gUnknown_0201BBD8, gBG1TilemapBuffer + 0x211 + (0x16 - height) * 0x20 - 0x200, 13, height);
        TileMap_CopyRect(gUnknown_0201B758, gBG0TilemapBuffer + 0x211 + (0x16 - height) * 0x20 - 0x200, 13, height);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080BE82C
void sub_80BE82C(int index)
{
    int a = gUnknown_08A3E448[index].unk_02;
    int b = gUnknown_08A3E448[index].unk_03;

    if ((a < 0) && (b < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer, 13, 9, 0);
        TileMap_FillRect(gBG0TilemapBuffer, 13, 9, 0);
    }

    if ((a > 0) && (b < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x011, 13, 9, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x011, 13, 9, 0);
    }

    if ((a < 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x200, 13, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x200, 13, 4, 0);
    }

    if ((a > 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x211, 13, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x211, 13, 4, 0);
    }
    return;
}

//! FE8U = 0x080BE8E8
void sub_80BE8E8(struct GMapPIProc * proc, int nodeId)
{
    const char * str;

    ClearText(&proc->unk_2c);
    str = GetWorldMapNodeName(nodeId);
    Text_InsertDrawString(&proc->unk_2c, GetStringTextCenteredPos(0x40, str), 0, str);
    return;
}

//! FE8U = 0x080BE918
void sub_80BE918(struct GMapPIProc * proc, int pid)
{
    const char * str;

    ClearText(&proc->unk_34);
    str = GetStringFromIndex(gCharacterData[pid - 1].nameTextId);
    Text_InsertDrawString(&proc->unk_34, GetStringTextCenteredPos(0x44, str), 5, str);
    return;
}

//! FE8U = 0x080BE958
void sub_80BE958(struct GMapPIProc * proc)
{
    int fid;

    if (proc->unk_5f != 0)
    {
        fid = GetUnitMiniPortraitId(GetUnitFromCharId(proc->unk_5f));
    }
    else
    {
        if (proc->unk_60 != 0)
        {
            fid = 0x7F04;
        }
    }

    PutFaceChibi(fid, gUnknown_0201B7DA, 0x220, 4, 0);

    return;
}

//! FE8U = 0x080BE9A0
void sub_80BE9A0(struct GMapPIProc * proc, int jid)
{
    const char * str;

    ClearText(&proc->unk_34);
    str = GetStringFromIndex(GetClassData(jid)->nameTextId);
    Text_InsertDrawString(&proc->unk_34, GetStringTextCenteredPos(0x44, str), 5, str);
    return;
}

#if NONMATCHING

//! FE8U = 0x080BE9D8
void sub_80BE9D8(struct GMapPIProc * param_1, int param_2)
{
    if ((gGMData.nodes[param_2].state & 2) == 0)
    {
        if (param_2[gWMNodeData].armory[0] != 0)
        {
            u16 * ptr = gUnknown_0201B430;
            *(ptr + 0x15D) = 0x3231;
        }
        else
        {
            u16 * ptr = gUnknown_0201B430;
            *(ptr + 0x15D) = 0;
        }

        if (param_2[gWMNodeData].vendor[0] != 0)
        {
            u16 * ptr = gUnknown_0201B430;
            *(ptr + 0x15E) = 0x3232;
        }
        else
        {
            u16 * ptr = gUnknown_0201B430;
            *(ptr + 0x15E) = 0;
        }
    }
    else
    {
        u16 * ptr = gUnknown_0201B430;
        *(ptr + 0x15D) = 0;
        *(ptr + 0x15E) = 0;
    }

    return;
}

#else

NAKEDFUNC
void sub_80BE9D8(struct GMapPIProc * param_1, int param_2)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        adds r2, r1, #0\n\
        ldr r1, _080BEA0C  @ gGMData\n\
        lsls r0, r2, #2\n\
        adds r0, r0, r1\n\
        adds r0, #0x30\n\
        ldrb r1, [r0]\n\
        movs r0, #2\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        bne _080BEA56\n\
        lsls r1, r2, #5\n\
        ldr r2, _080BEA10  @ gWMNodeData\n\
        adds r0, r1, r2\n\
        ldr r0, [r0, #0xc]\n\
        ldrh r3, [r0]\n\
        adds r4, r1, #0\n\
        adds r5, r2, #0\n\
        cmp r3, #0\n\
        beq _080BEA20\n\
        ldr r2, _080BEA14  @ gUnknown_0201B430\n\
        ldr r0, _080BEA18  @ 0x000002BA\n\
        adds r1, r2, r0\n\
        ldr r0, _080BEA1C  @ 0x00003231\n\
        strh r0, [r1]\n\
        b _080BEA2A\n\
        .align 2, 0\n\
    _080BEA0C: .4byte gGMData\n\
    _080BEA10: .4byte gWMNodeData\n\
    _080BEA14: .4byte gUnknown_0201B430\n\
    _080BEA18: .4byte 0x000002BA\n\
    _080BEA1C: .4byte 0x00003231\n\
    _080BEA20:\n\
        ldr r1, _080BEA40  @ gUnknown_0201B430\n\
        ldr r2, _080BEA44  @ 0x000002BA\n\
        adds r0, r1, r2\n\
        strh r3, [r0]\n\
        adds r2, r1, #0\n\
    _080BEA2A:\n\
        adds r0, r4, r5\n\
        ldr r0, [r0, #0x10]\n\
        ldrh r1, [r0]\n\
        cmp r1, #0\n\
        beq _080BEA4C\n\
        movs r3, #0xaf\n\
        lsls r3, r3, #2\n\
        adds r1, r2, r3\n\
        ldr r0, _080BEA48  @ 0x00003232\n\
        strh r0, [r1]\n\
        b _080BEA68\n\
        .align 2, 0\n\
    _080BEA40: .4byte gUnknown_0201B430\n\
    _080BEA44: .4byte 0x000002BA\n\
    _080BEA48: .4byte 0x00003232\n\
    _080BEA4C:\n\
        movs r3, #0xaf\n\
        lsls r3, r3, #2\n\
        adds r0, r2, r3\n\
        strh r1, [r0]\n\
        b _080BEA68\n\
    _080BEA56:\n\
        ldr r0, _080BEA70  @ gUnknown_0201B430\n\
        ldr r2, _080BEA74  @ 0x000002BA\n\
        adds r1, r0, r2\n\
        movs r2, #0\n\
        strh r2, [r1]\n\
        movs r3, #0xaf\n\
        lsls r3, r3, #2\n\
        adds r0, r0, r3\n\
        strh r2, [r0]\n\
    _080BEA68:\n\
        pop {r4, r5}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080BEA70: .4byte gUnknown_0201B430\n\
    _080BEA74: .4byte 0x000002BA\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080BEA78
void sub_80BEA78(struct GMapPIProc * proc)
{
    int level;

    if (proc->unk_5f != 0)
    {
        level = GetUnitFromCharId(proc->unk_5f)->level;
    }
    else if (proc->unk_60 != 0)
    {
        level = 0;
    }

    *(gUnknown_0201B864 + TILEMAP_INDEX(0, 0)) = 0x5233;
    *(gUnknown_0201B864 + TILEMAP_INDEX(0, 1)) = 0x5253;
    *(gUnknown_0201B864 + TILEMAP_INDEX(1, 0)) = 0x5234;
    *(gUnknown_0201B864 + TILEMAP_INDEX(1, 1)) = 0x5254;

    if (level == 0)
    {
        *(gUnknown_0201B864 + TILEMAP_INDEX(2, 0)) = 0x5234 + 0xb;
        *(gUnknown_0201B864 + TILEMAP_INDEX(2, 1)) = 0x5234 + 0x2b;
        *(gUnknown_0201B864 + TILEMAP_INDEX(3, 0)) = 0x5234 + 0xb;
        *(gUnknown_0201B864 + TILEMAP_INDEX(3, 1)) = 0x5234 + 0x2b;
    }
    else
    {
        int ones;
        if (level > 9)
        {
            int tens = level / 10;
            *(gUnknown_0201B864 + TILEMAP_INDEX(2, 0)) = tens + 0x5235;
            *(gUnknown_0201B864 + TILEMAP_INDEX(2, 1)) = tens + 0x5255;
        }

        ones = level % 10;
        *(gUnknown_0201B864 + TILEMAP_INDEX(3, 0)) = ones + 0x5235;
        *(gUnknown_0201B864 + TILEMAP_INDEX(3, 1)) = ones + 0x5255;
    }

    return;
}

//! FE8U = 0x080BEB2C
void sub_80BEB2C(struct GMapPIProc * proc)
{
    switch (proc->unk_5e)
    {
        case 0:
            TileMap_FillRect(gUnknown_0201BBD8, 13, 4, 0);
            TileMap_FillRect(gUnknown_0201B718, 13, 2, 0);

            CallARM_FillTileRect(gUnknown_0201BBD8, gUnknown_08A98EAC, 0x8000);

            break;

        case 1:
            TileMap_FillRect(gUnknown_0201BBD8, 13, 9, 0);
            TileMap_FillRect(gUnknown_0201B718, 13, 7, 0);

            CallARM_FillTileRect(gUnknown_0201BBD8, gUnknown_08A98F30, 0x8000);

            PutText(&proc->unk_34, gUnknown_0201B718 + 0x64);

            sub_80BEA78(proc);
            sub_80BE958(proc);

            break;
    }

    PutText(&proc->unk_2c, gUnknown_0201B71C);

    return;
}

//! FE8U = 0x080BEBD4
void sub_80BEBD4(struct GMapPIProc * proc)
{
    proc->unk_58 = 0;
    proc->unk_55 = 1;

    proc->unk_50 = sub_80C089C(0, 0, 0, 0);
    proc->unk_57 = sub_80BE594(gUnknown_08A3E448[proc->unk_50].unk_02, gUnknown_08A3E448[proc->unk_50].unk_03);

    sub_80BEB2C(proc);

    *&proc->unk_4e = gGMData.unk08 >> 8;
    *&proc->unk_4f = gGMData.unk0C >> 8;

    proc->unk_4c = proc->unk_4e;
    proc->unk_4d = proc->unk_4f;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080BEC58
void sub_80BEC58(struct GMapPIProc * proc)
{
    int height;
    int unk;

    switch (proc->unk_5e)
    {
        case 0:
            height = gUnknown_08A3E458[proc->unk_58];
            unk = 3;
            break;

        case 1:
            height = gUnknown_08A3E45E[proc->unk_58];
            unk = 3;
            break;
    }

    sub_80BE65C(proc->unk_50, height, proc->unk_5e);

    proc->unk_58++;

    if (proc->unk_58 == unk)
    {
        proc->unk_58 = 0;
        proc->unk_55 = 0;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BECB8
void sub_80BECB8(struct GMapPIProc * proc)
{
    int nodeId;
    int height;
    int index;

    proc->unk_4c = proc->unk_4e;
    proc->unk_4d = proc->unk_4f;

    proc->unk_4e = gGMData.unk08 >> 8;
    proc->unk_4f = gGMData.unk0C >> 8;

    if (proc->unk_4e == proc->unk_4c && proc->unk_4f == proc->unk_4d)
    {
        return;
    }

    height = gGMData.unk0C >> 8;

    nodeId = sub_80BB628(
        ((struct UnkParentProc *)(proc->proc_parent))->unk_48, gGMData.unk08 >> 8, gGMData.unk0C >> 8, 0, 0);

    if (nodeId < 0)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->unk_5c != nodeId)
    {
        sub_80BE82C(proc->unk_50);
        sub_80BEF20(proc, nodeId);

        proc->unk_50 = sub_80C089C(0, 0, 0, 0);

        switch (proc->unk_5e)
        {
            case 0:
                height = gUnknown_08A3E458[2];
                break;

            case 1:
                height = gUnknown_08A3E45E[2];
                break;
        }

        sub_80BE65C(proc->unk_50, height, proc->unk_5e);

        proc->unk_5c = nodeId;
    }

    index = sub_80C089C(0, 0, 0, 0);

    if (index != proc->unk_50)
    {
        if ((gUnknown_08A3E448[index].unk_02 != gUnknown_08A3E448[proc->unk_50].unk_02) ||
            (gUnknown_08A3E448[index].unk_03 != gUnknown_08A3E448[proc->unk_50].unk_03))
        {
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x080BEDCC
void sub_80BEDCC(struct GMapPIProc * proc)
{
    proc->unk_56 = 1;
    return;
}

//! FE8U = 0x080BEDD4
void sub_80BEDD4(struct GMapPIProc * proc)
{
    int height;
    int unk;

    proc->unk_55 = 1;

    switch (proc->unk_5e)
    {
        case 0:
            height = gUnknown_08A3E45B[proc->unk_58];
            unk = 3;
            break;

        case 1:
            height = gUnknown_08A3E461[proc->unk_58];
            unk = 3;
            break;
    }

    sub_80BE65C(proc->unk_50, height, proc->unk_5e);

    proc->unk_58++;

    if (proc->unk_58 == unk)
    {
        proc->unk_58 = 0;
        proc->unk_55 = 0;
        proc->unk_56 = 0;
        proc->unk_57 = -1;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BEE48
int sub_80BEE48(int nodeId, int * faction)
{
    int i;

    for (i = 0; i < 7; i++)
    {
        if (gGMData.units[i].id == 0)
        {
            continue;
        }

        if (gGMData.units[i].location != nodeId)
        {
            continue;
        }

        switch (sub_80BD20C(i))
        {
            case 0:
            default:
                *faction = FACTION_BLUE;
                break;

            case 1:
                *faction = FACTION_RED;
                break;

            case 2:
                *faction = FACTION_GREEN;
                break;
        }

        return i;
    }

    *faction = -1;
    return -1;
}

//! FE8U = 0x080BEE9C
void sub_80BEE9C(struct GMapPIProc * proc, int nodeId)
{
    int faction;

    int index = sub_80BEE48(nodeId, &faction);

    if (index >= 0)
    {
        if (gGMData.units[index].state & 2)
        {
            proc->unk_5f = 0;
            proc->unk_60 = (gGMData.units[index].state & 2) ? gGMData.units[index].id : 0;
        }
        else
        {
            proc->unk_5f = gGMData.units[index].id;
            proc->unk_60 = 0;
        }

        proc->unk_5e = 1;
    }
    else
    {
        proc->unk_5f = 0;
        proc->unk_60 = 0;
        proc->unk_5e = 0;
    }

    sub_80BE5B4(faction, 8);

    return;
}

//! FE8U = 0x080BEF20
void sub_80BEF20(struct GMapPIProc * proc, int nodeId)
{
    sub_80BEE9C(proc, nodeId);

    sub_80BEB2C(proc);

    sub_80BE8E8(proc, nodeId);

    if (proc->unk_5f != 0)
    {
        sub_80BE918(proc, proc->unk_5f);
    }
    else if (proc->unk_60 != 0)
    {
        sub_80BE9A0(proc, proc->unk_60);
    }

    sub_80BE9D8(proc, nodeId);

    return;
}

//! FE8U = 0x080BEF6C
void sub_80BEF6C(struct GMapPIProc * proc)
{
    int nodeId;
    s16 x;
    s16 y;

    *&x = gGMData.unk08 >> 8;
    *&y = gGMData.unk0C >> 8;

    nodeId = sub_80BB628(((struct UnkParentProc *)(proc->proc_parent))->unk_48, x, y, 0, 0);

    if (nodeId > -1)
    {
        sub_80BEF20(proc, nodeId);
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x080BEFB8
void sub_80BEFB8(struct GMapPIProc * proc)
{
    int nodeId;
    s16 x;
    s16 y;

    proc->unk_58 = 0;
    proc->unk_56 = 0;
    proc->unk_50 = 0;
    proc->unk_57 = -1;
    proc->unk_5c = -1;

    InitText(&proc->unk_2c, 8);
    InitText(&proc->unk_34, 8);

    ClearText(&proc->unk_2c);
    ClearText(&proc->unk_34);

    *&x = gGMData.unk08 >> 8;
    *&y = gGMData.unk0C >> 8;

    nodeId = sub_80BB628(((struct UnkParentProc *)(proc->proc_parent))->unk_48, x, y, 0, 0);

    if (nodeId > -1)
    {
        proc->unk_5c = nodeId;
        sub_80BEF20(proc, nodeId);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3E464[] =
{
    PROC_NAME("PI"),
    PROC_MARK(PROC_MARK_8),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(sub_80BEFB8),

PROC_LABEL(0),
    PROC_REPEAT(sub_80BEF6C),
    PROC_REPEAT(sub_80BEBD4),
    PROC_REPEAT(sub_80BEC58),
    PROC_REPEAT(sub_80BECB8),

    PROC_CALL(sub_80BEDCC),
    PROC_REPEAT(sub_80BEDD4),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BF048
void sub_80BF048(struct Proc * parent)
{
    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(14, 3);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetBlendBackdropA(0);

    Decompress(gUnknown_08A9901C, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void *)0x06004660, 13, 2);
    ApplyPalette(gUnknown_08A99120, 5);

    Decompress(gUnknown_08A97A80, (void *)0x06004620);
    ApplyPalette(gUnknown_08A97A60, 3);

    ResetTextFont();
    Proc_Start(gUnknown_08A3E464, parent->proc_parent);

    return;
}