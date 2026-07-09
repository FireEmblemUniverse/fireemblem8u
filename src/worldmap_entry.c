#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"

#include "worldmap.h"
#include "constants/songs.h"

struct BlendStruct
{
    /* 00 */ struct BlendCnt blendCnt;
    /* 08 */ u8 blendCoeffA;
    /* 09 */ u8 blendCoeffB;
    /* 0A */ u8 blendY;
};

struct GmapBaseEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 30 */ struct BlendStruct unk_30;
};

struct GmapMuEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 flags_0 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ s16 unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
};

extern u8 gWmHblankStatus;

extern u16 gPal_WorldmapMinimap_0[];
extern u8 gImg_WorldmapMinimap_0[];
extern u8 gTsa_WorldmapMinimap_0[];

//! FE8U = 0x080BF7B4
void RememberBlendState(struct BlendStruct * blend)
{
    blend->blendCnt = gLCDControlBuffer.bldcnt;
    blend->blendCoeffA = gLCDControlBuffer.blendCoeffA;
    blend->blendCoeffB = gLCDControlBuffer.blendCoeffB;
    blend->blendY = gLCDControlBuffer.blendY;

    return;
}

//! FE8U = 0x080BF7DC
void RestoreBlendState(struct BlendStruct * blend)
{
    gLCDControlBuffer.bldcnt = blend->blendCnt;
    gLCDControlBuffer.blendCoeffA = blend->blendCoeffA;
    gLCDControlBuffer.blendCoeffB = blend->blendCoeffB;
    gLCDControlBuffer.blendY = blend->blendY;

    return;
}

//! FE8U = 0x080BF804
void GmapBaseEntry_OnEnd(struct GmapBaseEntryProc * proc)
{
    GM_ICON->unk_34[(proc->unk_29 / 0x20)] &= ~(1 << (proc->unk_29 % 0x20));
    EnablePaletteSync();

    gGMData.nodes[proc->unk_29].state |= 1;

    if ((gGMData.nodes[proc->unk_29].state & 2) != 0)
    {
        GM_ICON->nodeId = proc->unk_29;
        GM_ICON->merge_next_node = true;
    }

    EndGmapEffect();
    RestoreBlendState(&proc->unk_30);

    return;
}

//! FE8U = 0x080BF890
void GmapBaseEntry_Init(struct GmapBaseEntryProc * proc)
{
    RememberBlendState(&proc->unk_30);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}

//! FE8U = 0x080BF8CC
void GmapBaseEntry_0(struct GmapBaseEntryProc * proc)
{
    gGMData.nodes[proc->unk_29].state |= 1;

    GM_ICON->unk_34[(proc->unk_29 / 0x20)] |= (1 << (proc->unk_29 % 0x20));

    if ((gGMData.nodes[proc->unk_29].state & 2) != 0)
    {
        GM_ICON->nodeId = proc->unk_29;
        GM_ICON->merge_next_node = true;
    }

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_2b = 2;
            break;

        case 1:
            proc->unk_2b = 1;
            break;
    }

    proc->unk_2c = proc->unk_2b;
    proc->unk_2d = 0;

    return;
}

//! FE8U = 0x080BF988
void GmapBaseEntry_1(struct GmapBaseEntryProc * proc)
{
    proc->unk_2c--;

    if (proc->unk_2c > 0)
    {
        return;
    }

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_2d++;
            break;

        case 1:
            proc->unk_2d += 2;
            break;
    }

    if (proc->unk_2d < 0x10)
    {
        SetBlendConfig(BLEND_EFFECT_NONE, proc->unk_2d, 0x10 - proc->unk_2d, 0);
        proc->unk_2c = proc->unk_2b;
    }
    else
    {
        GM_ICON->unk_34[(proc->unk_29 / 0x20)] &=
            ~(1 << (proc->unk_29 % 0x20));
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080BFA1C
void GmapBaseEntry_2(struct GmapBaseEntryProc * proc)
{
    const struct NodeIcon * nodeIcon;
    struct GmapEffectProc * otherProc;
    int unk;

    if ((gGMData.nodes[proc->unk_29].state & 2) != 0)
    {
        nodeIcon = gWMNodeIconData + proc->unk_29[gWMNodeData].iconPreClear;
    }
    else
    {
        nodeIcon = gWMNodeIconData + proc->unk_29[gWMNodeData].iconPostClear;
    }

    switch (nodeIcon->width)
    {
        case 0:
        default:
            unk = 0;
            break;

        case 0x10:
            unk = 1;
            break;

        case 0x20:
            unk = 2;
            break;
    }

    otherProc = StartGmapEffect(proc, unk);
    otherProc->flags_0 = 1;

    otherProc->unk_2c = proc->unk_29[gWMNodeData].x + (nodeIcon->width / 2 - nodeIcon->xCenter);
    otherProc->unk_2e = proc->unk_29[gWMNodeData].y + (nodeIcon->height / 2 - nodeIcon->yCenter);

    PlaySoundEffect(SONG_311);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapBaseEntry[] =
{
    PROC_NAME("Gmap Base Entry"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmapBaseEntry_OnEnd),

    PROC_CALL(GmapBaseEntry_Init),
    PROC_YIELD,

    PROC_CALL(GmapBaseEntry_2),
    PROC_YIELD,

    PROC_CALL(GmapBaseEntry_0),
    PROC_REPEAT(GmapBaseEntry_1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BFAEC
ProcPtr StartGmBaseEntry(int a, int b, ProcPtr parent)
{
    struct GmapBaseEntryProc * proc;

    if (parent != 0)
    {
        proc = Proc_StartBlocking(gProcScr_GmapBaseEntry, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapBaseEntry, PROC_TREE_3);
    }

    proc->unk_29 = a;
    proc->unk_2a = b;

    // return proc; // BUG
}

//! FE8U = 0x080BFB24
void EndGmBaseEntry(void)
{
    Proc_EndEach(gProcScr_GmapBaseEntry);
    return;
}

//! FE8U = 0x080BFB34
s8 GmBaseEntryExists(void)
{
    return Proc_Find(gProcScr_GmapBaseEntry) ? 1 : 0;
}

//! FE8U = 0x080BFB4C
void GmapMuEntry_OnEnd(struct GmapBaseEntryProc * proc)
{
    GmMu_SetBlendEnabled(GM_MU, proc->unk_29, 0);

    gGMData.units[proc->unk_29].state |= 1;

    EndGmapEffect();
    RestoreBlendState(&proc->unk_30);

    return;
}

//! FE8U = 0x080BFB90
void GmapMuEntry_Init(struct GmapBaseEntryProc * proc)
{
    RememberBlendState(&proc->unk_30);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}

//! FE8U = 0x080BFBCC
void GmapMuEntry_0(struct GmapBaseEntryProc * proc)
{
    gGMData.units[proc->unk_29].state |= 1;

    GmMu_SetBlendEnabled(GM_MU, proc->unk_29, 1);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_2b = 2;
            break;

        case 1:
            proc->unk_2b = 1;
            break;
    }

    proc->unk_2c = proc->unk_2b;
    proc->unk_2d = 0;

    return;
}

//! FE8U = 0x080BFC44
void GmapMuEntry_1(struct GmapBaseEntryProc * proc)
{
    proc->unk_2c--;

    if (proc->unk_2c > 0)
    {
        return;
    }

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_2d++;
            break;

        case 1:
            proc->unk_2d += 2;
            break;
    }

    if (proc->unk_2d < 0x10)
    {
        SetBlendConfig(BLEND_EFFECT_NONE, proc->unk_2d, 0x10 - proc->unk_2d, 0);
        proc->unk_2c = proc->unk_2b;
    }
    else
    {
        GmMu_SetBlendEnabled(GM_MU, proc->unk_29, 0);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapMuEntry1[] =
{
    PROC_NAME("Gmap Mu Entry"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmapMuEntry_OnEnd),

    PROC_CALL(GmapMuEntry_Init),
    PROC_SLEEP(0),

    PROC_CALL(GmapMuEntry_0),
    PROC_REPEAT(GmapMuEntry_1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BFCC8
ProcPtr StartGmapMuEntry1(int a, int b, ProcPtr parent)
{
    struct GmapBaseEntryProc * proc;

    if (parent)
    {
        proc = Proc_StartBlocking(gProcScr_GmapMuEntry1, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapMuEntry1, PROC_TREE_3);
    }

    proc->unk_29 = a;
    proc->unk_2a = b;

    // return proc; // BUG
}

//! FE8U = 0x080BFD00
void EndGmapMuEntry1(void)
{
    Proc_EndEach(gProcScr_GmapMuEntry1);
    return;
}

//! FE8U = 0x080BFD10
s8 GmapMuEntry1Exists(void)
{
    return Proc_Find(gProcScr_GmapMuEntry1) ? 1 : 0;
}

//! FE8U = 0x080BFD28
void LoadWorldmapMinimap(void)
{
    ApplyPalette(gPal_WorldmapMinimap_0, 2);
    EnablePaletteSync();

    Decompress(gImg_WorldmapMinimap_0, (void *)0x06004C00);
    Decompress(gTsa_WorldmapMinimap_0, gGenericBuffer);
    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x2260);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x080BFD7C
void GmMuEntry_OnEnd_Null(void)
{
    return;
}

//! FE8U = 0x080BFD80
void GmMuEntry_Init(struct GmapMuEntryProc * proc)
{
    proc->flags_0 = 0;
    proc->unk_2b = 0;
    proc->unk_2a = 0;

    return;
}

//! FE8U = 0x080BFDA0
void GmMuEntry_SetupHblankGradient(struct GmapMuEntryProc * proc, int unused)
{
    int r;
    int g;
    int b;

    int i;
    int j;

    u16 * palA = GetWorldMapHblankBuffer(0, 1);
    u16 * palB = GetWorldMapHblankBuffer(1, 1);

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        palA[i] = (0x40 - i) & 0x1FF;
        palB[i] = 0;
    }

    for (i = 0; i < proc->unk_2a; i++)
    {
        palA[i] = 0x10 - proc->unk_2a;

        r = ((proc->unk_2a - i) * -6 / proc->unk_2a) + 13;
        g = ((proc->unk_2a - i) * -10 / proc->unk_2a) + 17;
        b = ((proc->unk_2a - i) * -7 / proc->unk_2a) + 23;
        palB[i] = (b << 10) + (g << 5) + r;
    }

    for (i = 0; i < proc->unk_2b; i++)
    {
        j = DISPLAY_HEIGHT - (proc->unk_2b - i);
        palA[j] = proc->unk_2b + 200;

        r = (i * -6 / proc->unk_2b) + 13;
        g = (i * -10 / proc->unk_2b) + 17;
        b = (i * -7 / proc->unk_2b) + 23;
        palB[j] = (b << 10) + (g << 5) + r;
    }

    FlipWorldMapHblankBuffer();

    return;
}

//! FE8U = 0x080BFEF8
void GmMuEntry_0(struct GmapMuEntryProc * proc)
{
    u16 * buf;
    LoadWorldmapMinimap();

    proc->unk_38 = 0;
    proc->unk_2a = proc->unk_2c;
    proc->unk_2b = proc->unk_2e;
    proc->unk_3c = proc->unk_2d - proc->unk_2c;
    proc->unk_40 = proc->unk_2f - proc->unk_2e;

    buf = GetWorldMapHblankBuffer(0, 1);
    CpuFill16(0x10, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(0, 0x04000012);
    ClearWorldMapHblankChannelFlags(0);

    buf = GetWorldMapHblankBuffer(1, 1);
    CpuFill16(0, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(1, 0x05000054);
    ClearWorldMapHblankChannelFlags(1);

    gWmHblankStatus |= 4;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    SetBlendAlpha(0, 0x10);

    return;
}

//! FE8U = 0x080BFFD0
void GmMuEntry_1(struct GmapMuEntryProc * proc)
{
    u16 * buf;
    LoadWorldmapMinimap();

    proc->unk_38 = 0;

    proc->unk_2a = proc->unk_2c;
    proc->unk_2b = proc->unk_2e;
    proc->unk_3c = proc->unk_2d - proc->unk_2c;
    proc->unk_40 = proc->unk_2f - proc->unk_2e;

    buf = GetWorldMapHblankBuffer(0, 1);
    CpuFill16(0x10, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(0, 0x04000012);
    ClearWorldMapHblankChannelFlags(0);

    buf = GetWorldMapHblankBuffer(1, 1);
    CpuFill16(0, buf, DISPLAY_HEIGHT * 2);
    SetWorldMapHblankDest(1, 0x05000054);
    ClearWorldMapHblankChannelFlags(1);

    gWmHblankStatus |= 4;

    return;
}

//! FE8U = 0x080C0080
void GmMuEntry_2(struct GmapMuEntryProc * proc)
{
    int unk;

    proc->unk_38 += 0x1000;

    if (proc->unk_38 < proc->unk_34)
    {
        unk = _DivArm1(proc->unk_38, proc->unk_34, proc->unk_30);

        proc->unk_2a = proc->unk_2c + DivArm(0x1000, proc->unk_3c * unk);
        proc->unk_2b = proc->unk_2e + DivArm(0x1000, proc->unk_40 * unk);

        SetBlendAlpha(unk / 256, 0x10 - (unk / 256));
    }
    else
    {
        SetWorldMapHblankDest(0, 0);
        unk = 0x1000;
        SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
        proc->unk_2a = proc->unk_2d;
        proc->unk_2b = proc->unk_2f;
        proc->flags_0 = 0;

        Proc_Goto(proc, 0);
    }

    GmMuEntry_SetupHblankGradient(proc, unk);

    return;
}

//! FE8U = 0x080C0144
void GmMuEntry_3(struct GmapMuEntryProc * proc)
{
    int unk;

    proc->unk_38 += 0x1000;

    if (proc->unk_38 < proc->unk_34)
    {
        unk = _DivArm1(proc->unk_38, proc->unk_34, proc->unk_30);
        proc->unk_2a = proc->unk_2c + DivArm(0x1000, proc->unk_3c * unk);
        proc->unk_2b = proc->unk_2e + DivArm(0x1000, proc->unk_40 * unk);
    }
    else
    {
        SetWorldMapHblankDest(0, 0);
        unk = 0x1000;
        proc->unk_2a = proc->unk_2d;
        proc->unk_2b = proc->unk_2f;

        proc->flags_0 = 0;

        Proc_Goto(proc, 0);
    }

    GmMuEntry_SetupHblankGradient(proc, unk);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapMuEntry2[] =
{
    PROC_NAME("Gmap Mu Entry"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmMuEntry_OnEnd_Null),

    PROC_CALL(GmMuEntry_Init),
    PROC_YIELD,

PROC_LABEL(0),
    PROC_BLOCK,

PROC_LABEL(1),
    PROC_CALL(GmMuEntry_0),
    PROC_REPEAT(GmMuEntry_2),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_CALL(GmMuEntry_1),
    PROC_REPEAT(GmMuEntry_3),

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080C01DC
ProcPtr StartGmapMuEntry(ProcPtr parent)
{
    struct GmapMuEntryProc * proc;
    if (parent)
    {
        proc = Proc_StartBlocking(gProcScr_GmapMuEntry2, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapMuEntry2, PROC_TREE_3);
    }

    // return proc; // BUG
}

//! FE8U = 0x080C0200
void EndGmMuEntry(void)
{
    Proc_EndEach(gProcScr_GmapMuEntry2);
    return;
}

//! FE8U = 0x080C0210
s8 GmMuEntryExists(void)
{
    return Proc_Find(gProcScr_GmapMuEntry2) ? 1 : 0;
}

//! FE8U = 0x080C0228
s8 GetGmMuEntryFlag(void)
{
    struct GmapMuEntryProc * proc = Proc_Find(gProcScr_GmapMuEntry2);
    return proc->flags_0;
}

//! FE8U = 0x080C0240
s8 GmMuEntryStartShow(int speed, int blend)
{
    struct GmapMuEntryProc * proc = Proc_Find(gProcScr_GmapMuEntry2);

    if (proc->flags_0)
    {
        return 1;
    }

    proc->unk_2c = 0;
    proc->unk_2d = 16;
    proc->unk_2e = 0;
    proc->unk_2f = 56;
    proc->unk_30 = blend;
    proc->unk_34 = speed << 12;
    proc->flags_0 = 1;

    Proc_Goto(proc, 1);

    return 0;
}

//! FE8U = 0x080C02A4
s8 GmMuEntryStartHide(int a, int b)
{
    struct GmapMuEntryProc * proc = Proc_Find(gProcScr_GmapMuEntry2);

    if (proc->flags_0)
    {
        return 1;
    }

    proc->unk_2c = 16;
    proc->unk_2d = 0;
    proc->unk_2e = 56;
    proc->unk_2f = 0;
    proc->unk_30 = b;
    proc->unk_34 = a << 12;
    proc->flags_0 = 1;

    Proc_Goto(proc, 2);

    return 0;
}
