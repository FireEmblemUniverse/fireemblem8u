#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "ev_triggercheck.h"

#include "worldmap.h"

//! FE8U = 0x080BB5B0
int WMLoc_GetChapterId(int idx)
{
    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            return idx[gWMNodeData].unk_04;

        case CHAPTER_MODE_EPHRAIM:
            return idx[gWMNodeData].unk_05;
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
int sub_80BB628(int unused, int arg1, int arg2, int arg3, int arg4)
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

        if (!(gGMData.nodes[i].state & 1))
        {
            continue;
        }

        if (gGMData.nodes[i].state & 2)
        {
            icon = &gWMNodeIconData[node->iconPreClear];
        }
        else
        {
            icon = &gWMNodeIconData[node->iconPostClear];
        }

        xNode = node->x;
        iconWidth = icon->width;
        xIconCenter = icon->xCenter;

        x1 = xNode - xIconCenter - arg3;

        yNode = node->y;
        iconHeight = icon->height;
        yIconCenter = icon->yCenter;

        y1 = yNode - yIconCenter - arg4;

        x2 = xNode + iconWidth - xIconCenter + arg3;
        y2 = yNode + iconHeight - yIconCenter + arg4;

        if (arg1 < x1)
        {
            continue;
        }

        if (arg1 >= x2)
        {
            continue;
        }

        if (arg2 < y1)
        {
            continue;
        }

        if (arg2 >= y2)
        {
            continue;
        }

        return i;
    }

    return -1;
}

//! FE8U = 0x080BB6FC
void sub_80BB6FC(struct GmNodeIconDisplayProc * proc)
{
    proc->unk_32_0 = 1;
    return;
}

//! FE8U = 0x080BB708
void sub_80BB708(struct GmNodeIconDisplayProc * proc)
{
    proc->unk_32_0 = 0;
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

    proc->unk_32_0 = 1;

    return;
}

//! FE8U = 0x080BB744
s8 sub_80BB744(struct GmScreenProc * proc, s16 xIn, s16 yIn, s16 * xOut, s16 * yOut)
{
    s16 x;
    s16 y;

    *&x = proc->unk_34;
    *&y = proc->unk_36;

    *xOut = xIn - x;
    *yOut = yIn - y;

    if (((u16)(*yOut + 0x20) < 0xe0) && ((u16)(*xOut + 0x20) < 0x130))
    {
        return 1;
    }

    return 0;
}

#if NONMATCHING

/* https://decomp.me/scratch/jYvd0 */

//! FE8U = 0x080BB798
void GmapScreen2_Loop(struct GmNodeIconDisplayProc * proc)
{
    int unk;
    int chr;
    int i;
    s16 local_2c;
    s16 local_2a;
    s16 local_28;
    s16 local_26;
    const struct GMapNodeData * node;
    const struct NodeIcon * icon;
    u32 * unk_34;

    if (!proc->unk_32_0)
    {
        return;
    }

    chr = proc->chr / CHR_SIZE;

    for (i = 0; i < 0x1d; i++)
    {
        int x1, x2;
        int y1, y2;
        if (!(gGMData.nodes[i].state & 1))
        {
            continue;
        }

        node = &i[gWMNodeData];

        icon = gWMNodeIconData + ((gGMData.nodes[i].state & 2) ? node->iconPreClear : node->iconPostClear);

        x2 = icon->xCenter;
        x1 = (u16)node->x - x2;
        y2 = icon->yCenter;
        y1 = (u16)node->y - y2;

        unk = sub_80BB744(proc->pScreenProc, x1, y1, &local_2c, &local_2a);

        if (unk != 0)
        {
            local_2c = local_2c & 0x1FF;
            local_2a = local_2a & 0xff;

            if ((proc->unk_34[i / 0x20]) & (1 << (i & 0x1f)))
            {
                local_2a |= 0x400;
            }

            PutSpriteExt(
                0xc,
                local_2c,
                local_2a,
                icon->pSpriteData,
                icon->sheetTileId + (chr) + ((proc->pal & 0xf) << 0xc) + 0x800
            );
        }
    }

    if (proc->unk_32_1)
    {
        node = &(proc->nodeId[gWMNodeData]);

        icon = gWMNodeIconData + ((gGMData.nodes[proc->nodeId].state & 2) ? node->iconPreClear : node->iconPostClear);

        *&local_28 = proc->pScreenProc->unk_34;
        *&local_26 = proc->pScreenProc->unk_36;

        local_2c = ((node->x - icon->xCenter) + icon->xFlagOrigin) - local_28;
        local_2a = ((node->y - icon->yCenter) + icon->yFlagOrigin) - local_26;

        if (((u16)(local_2a + 0x20) < 0xe0) && ((u16)(local_2c + 0x20) < 0x130))
        {
            int xOam1;
            int yOam0;

            int state = (gGMData.nodes[proc->nodeId].state);
            xOam1 = ((state & 2) + (u16)local_2c) & 0x1ff;

            yOam0 = (u16)local_2a;
            yOam0 &= 0xff;

            if (((proc->unk_34[(proc->nodeId / 0x20)])) & (1 << (proc->nodeId & 0x1f)))
            {
                yOam0 = (yOam0) | 0x400;
            }

            AP_Update(proc->ap, xOam1, yOam0);
        }
    }

    return;
}

#else

__attribute__((naked))
void GmapScreen2_Loop(struct GmNodeIconDisplayProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x10\n\
        mov r8, r0\n\
        mov r2, r8\n\
        adds r2, #0x32\n\
        ldrb r1, [r2]\n\
        movs r0, #1\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        bne _080BB7B6\n\
        b _080BB988\n\
    _080BB7B6:\n\
        mov r1, r8\n\
        ldr r0, [r1, #0x2c]\n\
        lsrs r0, r0, #5\n\
        mov sl, r0\n\
        movs r7, #0\n\
        str r2, [sp, #0xc]\n\
        add r2, sp, #4\n\
        mov r9, r2\n\
    _080BB7C6:\n\
        ldr r0, _080BB7EC  @ gGMData\n\
        lsls r1, r7, #2\n\
        adds r1, r1, r0\n\
        adds r1, #0x30\n\
        ldrb r2, [r1]\n\
        movs r0, #1\n\
        ands r0, r2\n\
        cmp r0, #0\n\
        beq _080BB894\n\
        lsls r1, r7, #5\n\
        ldr r0, _080BB7F0  @ gWMNodeData\n\
        adds r6, r1, r0\n\
        movs r0, #2\n\
        ands r0, r2\n\
        cmp r0, #0\n\
        beq _080BB7F4\n\
        ldrb r0, [r6, #2]\n\
        b _080BB7F6\n\
        .align 2, 0\n\
    _080BB7EC: .4byte gGMData\n\
    _080BB7F0: .4byte gWMNodeData\n\
    _080BB7F4:\n\
        ldrb r0, [r6, #3]\n\
    _080BB7F6:\n\
        lsls r0, r0, #4\n\
        ldr r1, _080BB8D0  @ gWMNodeIconData\n\
        adds r5, r0, r1\n\
        movs r0, #8\n\
        ldrsb r0, [r5, r0]\n\
        ldrh r1, [r6, #0x18]\n\
        subs r1, r1, r0\n\
        movs r0, #9\n\
        ldrsb r0, [r5, r0]\n\
        ldrh r2, [r6, #0x1a]\n\
        subs r2, r2, r0\n\
        mov r3, r8\n\
        ldr r0, [r3, #0x3c]\n\
        lsls r1, r1, #0x10\n\
        asrs r1, r1, #0x10\n\
        lsls r2, r2, #0x10\n\
        asrs r2, r2, #0x10\n\
        mov r4, sp\n\
        adds r4, #6\n\
        str r4, [sp]\n\
        add r3, sp, #4\n\
        bl sub_80BB744\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        beq _080BB894\n\
        mov r1, r9\n\
        ldrh r0, [r1]\n\
        ldr r2, _080BB8D4  @ 0x000001FF\n\
        adds r1, r2, #0\n\
        ands r0, r1\n\
        mov r3, r9\n\
        strh r0, [r3]\n\
        ldrb r3, [r4]\n\
        strh r3, [r4]\n\
        adds r0, r7, #0\n\
        cmp r7, #0\n\
        bge _080BB844\n\
        adds r0, #0x1f\n\
    _080BB844:\n\
        asrs r0, r0, #5\n\
        lsls r0, r0, #2\n\
        mov r2, r8\n\
        adds r2, #0x34\n\
        adds r2, r2, r0\n\
        movs r0, #0x1f\n\
        ands r0, r7\n\
        movs r1, #1\n\
        lsls r1, r0\n\
        ldr r0, [r2]\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080BB868\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        adds r0, r1, #0\n\
        orrs r3, r0\n\
        strh r3, [r4]\n\
    _080BB868:\n\
        mov r2, r9\n\
        movs r3, #0\n\
        ldrsh r1, [r2, r3]\n\
        movs r0, #0\n\
        ldrsh r2, [r4, r0]\n\
        ldr r3, [r5, #4]\n\
        ldrh r4, [r5]\n\
        add r4, sl\n\
        mov r0, r8\n\
        adds r0, #0x30\n\
        ldrb r5, [r0]\n\
        movs r0, #0xf\n\
        ands r0, r5\n\
        lsls r0, r0, #0xc\n\
        adds r4, r4, r0\n\
        movs r0, #0x80\n\
        lsls r0, r0, #4\n\
        adds r4, r4, r0\n\
        str r4, [sp]\n\
        movs r0, #0xc\n\
        bl PutSpriteExt\n\
    _080BB894:\n\
        adds r7, #1\n\
        cmp r7, #0x1c\n\
        ble _080BB7C6\n\
        ldr r2, [sp, #0xc]\n\
        ldrb r1, [r2]\n\
        movs r4, #2\n\
        adds r0, r4, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080BB988\n\
        mov r3, r8\n\
        adds r3, #0x33\n\
        ldrb r0, [r3]\n\
        lsls r2, r0, #5\n\
        ldr r1, _080BB8D8  @ gWMNodeData\n\
        adds r6, r2, r1\n\
        ldr r2, _080BB8DC  @ gGMData\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r2\n\
        adds r0, #0x30\n\
        ldrb r1, [r0]\n\
        adds r0, r4, #0\n\
        ands r0, r1\n\
        mov r9, r2\n\
        adds r7, r3, #0\n\
        cmp r0, #0\n\
        beq _080BB8E0\n\
        ldrb r0, [r6, #2]\n\
        b _080BB8E2\n\
        .align 2, 0\n\
    _080BB8D0: .4byte gWMNodeIconData\n\
    _080BB8D4: .4byte 0x000001FF\n\
    _080BB8D8: .4byte gWMNodeData\n\
    _080BB8DC: .4byte gGMData\n\
    _080BB8E0:\n\
        ldrb r0, [r6, #3]\n\
    _080BB8E2:\n\
        lsls r0, r0, #4\n\
        ldr r1, _080BB998  @ gWMNodeIconData\n\
        adds r5, r0, r1\n\
        add r3, sp, #8\n\
        mov r0, r8\n\
        ldr r1, [r0, #0x3c]\n\
        ldrh r0, [r1, #0x34]\n\
        strh r0, [r3]\n\
        mov r4, sp\n\
        adds r4, #0xa\n\
        ldrh r0, [r1, #0x36]\n\
        strh r0, [r4]\n\
        add r2, sp, #4\n\
        movs r0, #8\n\
        ldrsb r0, [r5, r0]\n\
        ldrh r1, [r6, #0x18]\n\
        subs r1, r1, r0\n\
        movs r0, #0xc\n\
        ldrsb r0, [r5, r0]\n\
        adds r0, r0, r1\n\
        ldrh r1, [r3]\n\
        subs r0, r0, r1\n\
        strh r0, [r2]\n\
        adds r2, #2\n\
        movs r0, #9\n\
        ldrsb r0, [r5, r0]\n\
        ldrh r1, [r6, #0x1a]\n\
        subs r1, r1, r0\n\
        movs r0, #0xd\n\
        ldrsb r0, [r5, r0]\n\
        adds r0, r0, r1\n\
        ldrh r1, [r4]\n\
        subs r0, r0, r1\n\
        strh r0, [r2]\n\
        adds r0, #0x20\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        cmp r0, #0xdf\n\
        bhi _080BB988\n\
        add r0, sp, #4\n\
        ldrh r0, [r0]\n\
        adds r0, #0x20\n\
        lsls r0, r0, #0x10\n\
        ldr r1, _080BB99C  @ 0x012F0000\n\
        cmp r0, r1\n\
        bhi _080BB988\n\
        ldrb r0, [r7]\n\
        lsls r0, r0, #2\n\
        add r0, r9\n\
        adds r0, #0x30\n\
        ldrb r1, [r0]\n\
        movs r0, #2\n\
        ands r0, r1\n\
        add r0, sp, #4\n\
        ldrh r0, [r0]\n\
        ldr r5, _080BB9A0  @ 0x000001FF\n\
        ands r5, r0\n\
        ldrb r4, [r2]\n\
        ldrb r3, [r7]\n\
        lsrs r0, r3, #5\n\
        lsls r0, r0, #2\n\
        mov r2, r8\n\
        adds r2, #0x34\n\
        adds r2, r2, r0\n\
        movs r0, #0x1f\n\
        ands r3, r0\n\
        movs r1, #1\n\
        lsls r1, r3\n\
        ldr r0, [r2]\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080BB97A\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        adds r0, r1, #0\n\
        orrs r4, r0\n\
    _080BB97A:\n\
        mov r2, r8\n\
        ldr r0, [r2, #0x38]\n\
        adds r1, r5, #0\n\
        lsls r2, r4, #0x10\n\
        asrs r2, r2, #0x10\n\
        bl AP_Update\n\
    _080BB988:\n\
        add sp, #0x10\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080BB998: .4byte gWMNodeIconData\n\
    _080BB99C: .4byte 0x012F0000\n\
    _080BB9A0: .4byte 0x000001FF\n\
        .syntax divided\n\
    ");
}

#endif

extern struct ProcCmd gProcScr_GmNodeIconDisplay[];
extern u16 gUnknown_08A97AEC[]; // ap

ProcPtr sub_80BB9A4(ProcPtr parent, int chr, int palId, int unk, ProcPtr pScreenProc)
{
    struct GmNodeIconDisplayProc * proc = Proc_Start(gProcScr_GmNodeIconDisplay, parent);

    proc->chr = chr;
    proc->pal = palId;
    proc->unk_31 = unk;
    proc->pScreenProc = pScreenProc;
    proc->unk_32_1 = 0;
    proc->nodeId = 0;

    proc->ap = AP_Create(gUnknown_08A97AEC, 11);
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
