#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

//! FE8U = 0x080BB5B0
int WMLoc_GetChapterId(int idx)
{
    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            return idx[gWMNodeData].chapteridx_eirika;

        case CHAPTER_MODE_EPHRAIM:
            return idx[gWMNodeData].chapteridx_ephram;
    }
}

//! FE8U = 0x080BB5E4
int WMLoc_GetNextLocId(int idx)
{
    const s8 * unk_08;

    const struct GMapNodeData * node = &idx[gWMNodeData];

    if (CheckFlag(node->unk_06))
    {
        unk_08 = node->unk_08 + 2;
    }
    else
    {
        unk_08 = node->unk_08;
    }

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            return unk_08[0];

        case CHAPTER_MODE_EPHRAIM:
            return unk_08[1];
    }
}

//! FE8U = 0x080BB628
int GetNodeAtPosition(void * unused, int x_point, int y_point, int x_range, int y_range)
{
    const struct NodeIcon * icon;
    int i;
    const struct GMapNodeData * node;

    for (i = 0, node = gWMNodeData; i < 0x1d; node++, i++)
    {
        int xNode;
        int iconWidth;
        int xIconCenter;
        int yNode;
        int yIconCenter;
        int iconHeight;
        int x1, x2;
        int y1, y2;

        if (!(gGMData.nodes[i].state & GM_NODE_STATE_VALID))
            continue;

        if (gGMData.nodes[i].state & GM_NODE_STATE_CLEARED)
            icon = &gWMNodeIconData[node->iconPreClear];
        else
            icon = &gWMNodeIconData[node->iconPostClear];

        xNode = node->x;
        iconWidth = icon->width;
        xIconCenter = icon->xCenter;

        x1 = xNode - xIconCenter - x_range;

        yNode = node->y;
        iconHeight = icon->height;
        yIconCenter = icon->yCenter;

        y1 = yNode - yIconCenter - y_range;

        x2 = xNode + iconWidth - xIconCenter + x_range;
        y2 = yNode + iconHeight - yIconCenter + y_range;

        if (x_point < x1)
            continue;

        if (x_point >= x2)
            continue;

        if (y_point < y1)
            continue;

        if (y_point >= y2)
            continue;

        return i;
    }

    return -1;
}

//! FE8U = 0x080BB6FC
void SkipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc)
{
    proc->skip = 1;
    return;
}

//! FE8U = 0x080BB708
void UnskipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc)
{
    proc->skip = 0;
    return;
}

//! FE8U = 0x080BB718
void GmapScreen2_Destruct(struct GmNodeIconDisplayProc * proc)
{
    AP_Delete(proc->ap);
    return;
}

//! FE8U = 0x080BB724
void GmapScreen2_Init(struct GmNodeIconDisplayProc * proc)
{
    int i;

    u32 * ptr = proc->unk_34;

    for (i = 0; i == 0; i++)
    {
        ptr[i] = 0;
    }

    proc->skip = 1;

    return;
}

//! FE8U = 0x080BB744
s8 sub_80BB744(struct GmScreenProc * proc, s16 xIn, s16 yIn, s16 * xOut, s16 * yOut)
{
    s16 x;
    s16 y;

    *&x = proc->x;
    *&y = proc->y;

    *xOut = xIn - x;
    *yOut = yIn - y;

    if ((*yOut >= -0x20 && *yOut < 0xC0) && (*xOut >= -0x20 && *xOut < 0x110))
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080BB798
void GmapScreen2_Loop(struct GmNodeIconDisplayProc * proc)
{
    int chr;
    int i;
    s16 local_2c;
    s16 local_2a;
    s16 local_28;
    s16 local_26;
    const struct GMapNodeData * node;
    const struct NodeIcon * icon;

    if (!proc->skip)
    {
        return;
    }

    chr = proc->chr / CHR_SIZE;

    for (i = 0; i < 0x1d; i++)
    {
        s16 x1, y1;
        if (!(gGMData.nodes[i].state & 1))
        {
            continue;
        }

        node = &i[gWMNodeData];

        icon = gWMNodeIconData + ((gGMData.nodes[i].state & 2) ? node->iconPreClear : node->iconPostClear);

        x1 = node->x - icon->xCenter;
        y1 = node->y - icon->yCenter;

        if (sub_80BB744(proc->pScreenProc, x1, y1, &local_2c, &local_2a))
        {
            local_2c = OAM1_X(local_2c);
            local_2a = OAM0_Y(local_2a);

            if ((proc->unk_34[i / 0x20]) & (1 << (i & 0x1f)))
            {
                local_2a |= OAM0_BLEND;
            }

            PutSpriteExt(
                0xc,
                local_2c,
                local_2a,
                icon->pSpriteData,
                icon->sheetTileId + (chr) + OAM2_PAL(proc->pal) + OAM2_LAYER(2)
            );
        }
    }

    if (proc->unk_32_1)
    {
        node = &(proc->nodeId[gWMNodeData]);

        icon = gWMNodeIconData + ((gGMData.nodes[proc->nodeId].state & 2) ? node->iconPreClear : node->iconPostClear);

        *&local_28 = proc->pScreenProc->x;
        *&local_26 = proc->pScreenProc->y;

        local_2c = ((node->x - icon->xCenter) + icon->xFlagOrigin) - local_28;
        local_2a = ((node->y - icon->yCenter) + icon->yFlagOrigin) - local_26;

        if ((local_2a >= -0x20 && local_2a < 0xC0) && (local_2c >= -0x20 && local_2c < 0x110))
        {
            s16 xOam1;
            s16 yOam0;
#ifndef NONMATCHING
            asm("":::"memory");
#endif
            if (gGMData.nodes[proc->nodeId].state & 2)
                xOam1 = OAM1_X(local_2c);
            else
                xOam1 = OAM1_X(local_2c);
            yOam0 = OAM0_Y(local_2a);

            if (((proc->unk_34[(proc->nodeId / 0x20)])) & (1 << (proc->nodeId & 0x1f)))
                yOam0 |= OAM0_BLEND;
            yOam0++; yOam0--;
            AP_Update(proc->ap, xOam1, yOam0);
        }
    }

    return;
}

ProcPtr sub_80BB9A4(ProcPtr parent, int chr, int palId, int unk, ProcPtr pScreenProc)
{
    struct GmNodeIconDisplayProc * proc = Proc_Start(gProcScr_GmNodeIconDisplay, parent);

    proc->chr = chr;
    proc->pal = palId;
    proc->unk_31 = unk;
    proc->pScreenProc = pScreenProc;
    proc->unk_32_1 = 0;
    proc->nodeId = 0;

    proc->ap = AP_Create(Sprite_08A97AEC, 11);
    AP_SwitchAnimation(proc->ap, 1);
    proc->ap->tileBase = ((proc->chr + 0x1000) / CHR_SIZE) + OAM2_PAL(proc->pal) + OAM2_LAYER(2);
    return proc;
}

//! FE8U = 0x080BBA28
const char * GetWorldMapNodeName(u32 nodeId)
{
    if (nodeId < 0x1d)
    {
        return GetStringFromIndex(nodeId[gWMNodeData].nameTextId);
    }

    return GetStringFromIndex(0x066D); // TODO: msgid "[DashedLine][DashedLine][DashedLine][DashedLine][DashedLine]"
}

const u8 gUnknown_08206450[2][0x1d] =
{
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x1A, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x13,
        0x14, 0x15, 0x16, 0x17, 0x1B, 0x1C, 0x18, 0x19,
        0x0E, 0x0F, 0x10, 0x11, 0x12
    },
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x1A, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x0D,
        0x13, 0x14, 0x15, 0x16, 0x17, 0x1B, 0x1C, 0x18,
        0x19, 0x09, 0x0A, 0x0B, 0x0C
    },
};

//! FE8U = 0x080BBA4C
int sub_80BBA4C(int nodeId)
{
    int set;

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            set = 0;
            break;

        case CHAPTER_MODE_EPHRAIM:
            set = 1;
            break;
    }

    return gUnknown_08206450[set][nodeId];
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmNodeIconDisplay[] =
{
    PROC_NAME("GmapScreen"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmapScreen2_Destruct),

    PROC_CALL(GmapScreen2_Init),
    PROC_REPEAT(GmapScreen2_Loop),

    PROC_END,
};

// clang-format on
