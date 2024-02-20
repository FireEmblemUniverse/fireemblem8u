#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"

#include "worldmap.h"

struct UnkParentProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x48);
    /* 48 */ void * unk_48;
};

struct GMapPIProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text text[2];
    /* 3C */ STRUCT_PAD(0x3C, 0x40);
    /* 40 */ u16 * unk_40;
    /* 44 */ u16 unk_44;
    /* 46 */ STRUCT_PAD(0x46, 0x4C);
    /* 4C */ s8 xPrev;
    /* 4D */ s8 yPrev;
    /* 4E */ s8 xNew;
    /* 4F */ s8 yNew;
    /* 50 */ s8 unk_50;
    /* 51 */ STRUCT_PAD(0x51, 0x54);
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ u8 unk_56;
    /* 57 */ u8 unk_57;
    /* 58 */ int showHideCnt;
    /* 5C */ u16 nodeId;
    /* 5E */ u8 interfaceKind;
    /* 5F */ u8 pid;
    /* 60 */ u8 jid;
};

struct Unknown8A3E448
{
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
};

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

s8 CONST_DATA gGMapPIShowOffsetTableA[] =
{
    1, 3, 4,
};

s8 CONST_DATA gGMapPIHideOffsetTableA[] =
{
    3, 1, 0,
};

s8 CONST_DATA gGMapPIShowOffsetTableB[] =
{
    3, 7, 9,
};

s8 CONST_DATA gGMapPIHideOffsetTableB[] =
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

extern u16 gUnknown_08A98E2C[];
extern u16 gUnknown_08A98E4C[];
extern u16 gUnknown_08A98E6C[];
extern u16 gUnknown_08A98E8C[];

//! FE8U = 0x080BE56C
void sub_80BE56C(struct GMapPIProc * proc)
{
    proc->unk_57 = 0xff;
    InitTextDb(proc->text, 6);
    proc->showHideCnt = 0;
    proc->unk_56 = 0;
    return;
}

//! FE8U = 0x080BE594
int sub_80BE594(int a, int b)
{
    if (a < 0)
    {
        if (b < 0)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    else if (b < 0)
    {
        return 2;
    }

    return 3;
}

//! FE8U = 0x080BE5B4
void sub_80BE5B4(int faction, int palId)
{
    u16 * src;

    switch (faction)
    {
        case FACTION_BLUE:
            src = gUnknown_08A98E2C;
            break;

        case FACTION_RED:
            src = gUnknown_08A98E4C;
            break;

        case FACTION_GREEN:
            src = gUnknown_08A98E6C;
            break;

        default:
            src = gUnknown_08A98E8C;
            break;
    }

    ApplyPalette(src, palId);

    return;
}

//! FE8U = 0x080BE5F8
void sub_80BE5F8(u16 * src, struct Unit * unit)
{
    int level;

    src[0] = 0x180;
    src[1] = 0x181;

    level = unit->level;

    if (level > 9)
    {
        src[2] = (level / 10) + 0x188;
    }

    src[3] = (level % 10) + 0x188;

    return;
}

//! FE8U = 0x080BE638
void sub_80BE638(struct GMapPIProc * proc, struct Unit * unit)
{
    if ((proc->unk_44 & 0x3f) == 0)
    {
        sub_80BE5F8(proc->unk_40, unit);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    return;
}

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
void PutGMapPINodeName(struct GMapPIProc * proc, int nodeId)
{
    const char * str;

    ClearText(&proc->text[0]);
    str = GetWorldMapNodeName(nodeId);
    Text_InsertDrawString(&proc->text[0], GetStringTextCenteredPos(64, str), 0, str);
    return;
}

//! FE8U = 0x080BE918
void PutGMapPICharName(struct GMapPIProc * proc, int pid)
{
    const char * str;

    ClearText(&proc->text[1]);
    str = GetStringFromIndex(gCharacterData[pid - 1].nameTextId);
    Text_InsertDrawString(&proc->text[1], GetStringTextCenteredPos(68, str), 5, str);
    return;
}

//! FE8U = 0x080BE958
void PutGMapPIFace(struct GMapPIProc * proc)
{
    int fid;

    if (proc->pid != 0)
    {
        fid = GetUnitMiniPortraitId(GetUnitFromCharId(proc->pid));
    }
    else if (proc->jid != 0)
    {
        fid = 0x7F04;
    }

    PutFaceChibi(fid, gUnknown_0201B7DA, 0x220, 4, 0);

    return;
}

//! FE8U = 0x080BE9A0
void PutGMapPIClassName(struct GMapPIProc * proc, int jid)
{
    const char * str;

    ClearText(&proc->text[1]);
    str = GetStringFromIndex(GetClassData(jid)->nameTextId);
    Text_InsertDrawString(&proc->text[1], GetStringTextCenteredPos(68, str), 5, str);
    return;
}

//! FE8U = 0x080BE9D8
void sub_80BE9D8(struct GMapPIProc * param_1, int param_2)
{
    if ((gGMData.nodes[param_2].state & 2) == 0)
    {
        if (param_2[gWMNodeData].armory[0] != 0)
            gUnknown_0201B430[0x15D] = 0x3231;
        else
            gUnknown_0201B430[0x15D] = 0;

        if (param_2[gWMNodeData].vendor[0] != 0)
            gUnknown_0201B430[0x15E] = 0x3232;
        else
            gUnknown_0201B430[0x15E] = 0;
    }
    else
    {
        gUnknown_0201B430[0x15D] = 0;
        gUnknown_0201B430[0x15E] = 0;
    }

    return;
}

//! FE8U = 0x080BEA78
void sub_80BEA78(struct GMapPIProc * proc)
{
    int level;

    if (proc->pid != 0)
    {
        level = GetUnitFromCharId(proc->pid)->level;
    }
    else if (proc->jid != 0)
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
    switch (proc->interfaceKind)
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

            PutText(&proc->text[1], gUnknown_0201B718 + 0x64);

            sub_80BEA78(proc);
            PutGMapPIFace(proc);

            break;
    }

    PutText(&proc->text[0], gUnknown_0201B71C);

    return;
}

//! FE8U = 0x080BEBD4
void sub_80BEBD4(struct GMapPIProc * proc)
{
    proc->showHideCnt = 0;
    proc->unk_55 = 1;

    proc->unk_50 = sub_80C089C(0, 0, 0, 0);
    proc->unk_57 = sub_80BE594(gUnknown_08A3E448[proc->unk_50].unk_02, gUnknown_08A3E448[proc->unk_50].unk_03);

    sub_80BEB2C(proc);

    *&proc->xNew = gGMData.ix >> 8;
    *&proc->yNew = gGMData.iy >> 8;

    proc->xPrev = proc->xNew;
    proc->yPrev = proc->yNew;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080BEC58
void GMapPI_ShowLoop(struct GMapPIProc * proc)
{
    int height;
    int maxCnt;

    switch (proc->interfaceKind)
    {
        case 0:
            height = gGMapPIShowOffsetTableA[proc->showHideCnt];
            maxCnt = ARRAY_COUNT(gGMapPIShowOffsetTableA);
            break;

        case 1:
            height = gGMapPIShowOffsetTableB[proc->showHideCnt];
            maxCnt = ARRAY_COUNT(gGMapPIShowOffsetTableB);
            break;
    }

    sub_80BE65C(proc->unk_50, height, proc->interfaceKind);

    proc->showHideCnt++;

    if (proc->showHideCnt == maxCnt)
    {
        proc->showHideCnt = 0;
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

    proc->xPrev = proc->xNew;
    proc->yPrev = proc->yNew;

    proc->xNew = gGMData.ix >> 8;
    proc->yNew = gGMData.iy >> 8;

    if (proc->xNew == proc->xPrev && proc->yNew == proc->yPrev)
        return;

    height = gGMData.iy >> 8;

    nodeId = GetNodeAtPosition(
        ((struct UnkParentProc *)(proc->proc_parent))->unk_48, gGMData.ix >> 8, gGMData.iy >> 8, 0, 0);

    if (nodeId < 0)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->nodeId != nodeId)
    {
        sub_80BE82C(proc->unk_50);
        sub_80BEF20(proc, nodeId);

        proc->unk_50 = sub_80C089C(0, 0, 0, 0);

        switch (proc->interfaceKind)
        {
            case 0:
                height = gGMapPIShowOffsetTableA[2];
                break;

            case 1:
                height = gGMapPIShowOffsetTableB[2];
                break;
        }

        sub_80BE65C(proc->unk_50, height, proc->interfaceKind);

        proc->nodeId = nodeId;
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
void GMapPI_HideLoop(struct GMapPIProc * proc)
{
    int height;
    int maxCnt;

    proc->unk_55 = 1;

    switch (proc->interfaceKind)
    {
        case 0:
            height = gGMapPIHideOffsetTableA[proc->showHideCnt];
            maxCnt = ARRAY_COUNT(gGMapPIHideOffsetTableA);
            break;

        case 1:
            height = gGMapPIHideOffsetTableB[proc->showHideCnt];
            maxCnt = ARRAY_COUNT(gGMapPIHideOffsetTableB);
            break;
    }

    sub_80BE65C(proc->unk_50, height, proc->interfaceKind);

    proc->showHideCnt++;

    if (proc->showHideCnt == maxCnt)
    {
        proc->showHideCnt = 0;
        proc->unk_55 = 0;
        proc->unk_56 = 0;
        proc->unk_57 = -1;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BEE48
int GMapPI_GetGMapUnitIndexAndFaction(int nodeId, int * faction)
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
void InitGMapPIInterfaceKind(struct GMapPIProc * proc, int nodeId)
{
    int faction;

    int index = GMapPI_GetGMapUnitIndexAndFaction(nodeId, &faction);

    if (index >= 0)
    {
        if (gGMData.units[index].state & 2)
        {
            proc->pid = 0;
            proc->jid = (gGMData.units[index].state & 2) ? gGMData.units[index].id : 0;
        }
        else
        {
            proc->pid = gGMData.units[index].id;
            proc->jid = 0;
        }

        proc->interfaceKind = 1;
    }
    else
    {
        proc->pid = 0;
        proc->jid = 0;
        proc->interfaceKind = 0;
    }

    sub_80BE5B4(faction, 8);

    return;
}

//! FE8U = 0x080BEF20
void sub_80BEF20(struct GMapPIProc * proc, int nodeId)
{
    InitGMapPIInterfaceKind(proc, nodeId);

    sub_80BEB2C(proc);

    PutGMapPINodeName(proc, nodeId);

    if (proc->pid != 0)
    {
        PutGMapPICharName(proc, proc->pid);
    }
    else if (proc->jid != 0)
    {
        PutGMapPIClassName(proc, proc->jid);
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

    *&x = gGMData.ix >> 8;
    *&y = gGMData.iy >> 8;

    nodeId = GetNodeAtPosition(((struct UnkParentProc *)(proc->proc_parent))->unk_48, x, y, 0, 0);

    if (nodeId > -1)
    {
        sub_80BEF20(proc, nodeId);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BEFB8
void GMapPI_Init(struct GMapPIProc * proc)
{
    int nodeId;
    s16 x;
    s16 y;

    proc->showHideCnt = 0;
    proc->unk_56 = 0;
    proc->unk_50 = 0;
    proc->unk_57 = -1;
    proc->nodeId = -1;

    InitText(&proc->text[0], 8);
    InitText(&proc->text[1], 8);

    ClearText(&proc->text[0]);
    ClearText(&proc->text[1]);

    *&x = gGMData.ix >> 8;
    *&y = gGMData.iy >> 8;

    nodeId = GetNodeAtPosition(((struct UnkParentProc *)(proc->proc_parent))->unk_48, x, y, 0, 0);

    if (nodeId > -1)
    {
        proc->nodeId = nodeId;
        sub_80BEF20(proc, nodeId);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GMapPlayerInterface[] =
{
    PROC_NAME("PI"),
    PROC_MARK(PROC_MARK_8),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(GMapPI_Init),

PROC_LABEL(0),
    PROC_REPEAT(sub_80BEF6C),
    PROC_REPEAT(sub_80BEBD4),
    PROC_REPEAT(GMapPI_ShowLoop),
    PROC_REPEAT(sub_80BECB8),

    PROC_CALL(sub_80BEDCC),
    PROC_REPEAT(GMapPI_HideLoop),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BF048
void StartWorldMapPlayerInterface(struct Proc * parent)
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

    Decompress(gGfx_GMapPI_LevelNums, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void *)0x06004660, 13, 2);
    ApplyPalette(gPal_GMapPI_LevelNums, 5);

    Decompress(gGfx_GMapPI_ShopIcons, (void *)0x06004620);
    ApplyPalette(gPal_GMapPI_ShopIcons, 3);

    ResetTextFont();
    Proc_Start(gProcScr_GMapPlayerInterface, parent->proc_parent);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3E4D4[] =
{
    PROC_MARK(PROC_MARK_8),

    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(StartWorldMapPlayerInterface),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BF13C
ProcPtr sub_80BF13C(ProcPtr parent)
{
    ResetText();
    sub_80C09B8();
    return Proc_Start(gUnknown_08A3E4D4, parent);
}

//! FE8U = 0x080BF15C
void sub_80BF15C(void)
{
    Proc_EndEach(gProcScr_GMapPlayerInterface);
    Proc_EndEach(gUnknown_08A3E4D4);

    SetDefaultColorEffects();
    ClearBg0Bg1();

    return;
}
