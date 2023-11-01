#include "global.h"

#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "worldmap.h"

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 FindGmScrollManage(void);

extern u16 * gUnknown_088B39EC[];
extern u16 * gUnknown_088B3AD8[];

struct Proc8A3DD30
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD38
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD08
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ u8 unk_30;

    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
};

//! FE8U = 0x080B8A18
void WorldMap_Destruct(struct WorldMapMainProc * proc)
{
    Proc_End(proc->unk_50);
    Proc_End(proc->unk_44);
    Proc_End(proc->unk_48);

    SetSecondaryHBlankHandler(NULL);

    sub_80C1D70();

    SetPrimaryHBlankHandler(NULL);

    EndTalk();
    ClearTalkText();

    ResetUnitSprites();
    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

    sub_80BF15C();
    sub_80C3E94();

    gGMData.state.bits.state_6 = 0;
    gGMData.state.bits.state_7 = 0;
    gGMData.state.bits.state_0 = 0;

    return;
}

//! FE8U = 0x080B8A7C
void sub_80B8A7C(struct WorldMapMainProc * proc)
{
    int unk;
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    proc->unk_40 = 0;
    proc->unk_41 = 0;

    proc->unk_29_1 = 1;

    gGMData.unk01 = 0;

    sub_80BE0A4(proc->unk_54, 0, &x1, &y1);
    GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);

    unk = sub_80C0834(gGMData.xCamera, gGMData.yCamera, x2, y2, 2);

    unk = unk >> 2;

    if (unk < 2)
    {
        gGMData.xCamera = x2;
        gGMData.yCamera = y2;
        Proc_Goto(proc, 7);
    }
    else
    {
        if (unk < 16)
        {
            unk = 16;
        }
        else if (unk > 75)
        {
            unk = 75;
        }
        StartGmScroll(-1, -1, x2, y2, unk, 0);
    }

    return;
}

s8 sub_80BF490(void);

//! FE8U = 0x080B8B3C
void sub_80B8B3C(struct WorldMapMainProc * proc)
{
    if (sub_80BF490() == 0)
    {
        proc->unk_41 = 20;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B8B60
s8 sub_80B8B60(int location)
{
    int i;

    if (!(gGMData.nodes[location].state & 2))
    {
        for (i = 4; i < 7; i++)
        {
            if (gGMData.units[i].id == 0)
            {
                continue;
            }

            if (gGMData.units[i].location != location)
            {
                continue;
            }

            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080B8BA4
void sub_80B8BA4(struct WorldMapMainProc * proc)
{
    struct UnknownSub80BDEB4 a;

    if (sub_80BE12C(proc->unk_54, 0) != 0)
    {
        return;
    }

    if (proc->unk_40 < sub_80BD29C() - 1)
    {
#ifdef NONMATCHING
        int var = sub_80BD29C() - proc->unk_40;
#else
        register int var asm("r0") = sub_80BD29C() - proc->unk_40;
#endif
        if (var == 2)
        {
            int location = sub_80BD28C(proc->unk_40 + 1);
            if (gGMData.nodes[location].state & 2 &&
                sub_80BD28C(proc->unk_40 + 1)[gWMNodeData].placementFlag != GMAP_NODE_PLACEMENT_DUNGEON)
            {
                proc->unk_3e = sub_80BD28C(proc->unk_40 + 1);
                Proc_Goto(proc, 14);
            }
        }
        else
        {
            if (sub_80BCA1C(sub_80BD28C(proc->unk_40 + 1)) >= 0)
            {
                Proc_Goto(proc, 17);
                return;
            }
        }

        if (proc->unk_41 < 1)
        {
            int b = sub_80BD28C(proc->unk_40);
            int c = sub_80BD28C(proc->unk_40 + 1);
            GmMu_80BE108(proc->unk_54, 0, 1);

            a.unk_00 = 0;
            a.unk_06 = b;
            a.unk_08 = c;
            a.unk_0c = -1;
            a.unk_01 = proc->unk_29_1;
            a.unk_0a = 0;
            a.unk_02 = 1;
            a.unk_03 = 0xff;
            a.unk_04 = 4;

            sub_80BDEB4(proc->unk_54, &a);
            proc->unk_41 = 8;
            proc->unk_40++;
        }
        else
        {
            if (proc->unk_29_1)
            {
                if (gKeyStatusPtr->heldKeys & A_BUTTON)
                {
                    proc->unk_41 -= 2;
                }
            }
            proc->unk_41--;
        }
    }
    else
    {
        int location;

        proc->unk_29_1 = 0;
        gGMData.units[0].location = sub_80BD28C(proc->unk_40);
        GmMu_80BE108(proc->unk_54, 0, 0);

        location = gGMData.units[0].location;
        if (location[gWMNodeData].placementFlag == GMAP_NODE_PLACEMENT_DUNGEON)
        {
            Proc_Goto(proc, 14);
        }
        else
        {
            if (sub_80B8B60(location) != 0)
            {
                Proc_Goto(proc, 16);
            }
            else
            {
                gGMData.unk01 = 1;
                Proc_Break(proc);
            }
        }
    }
    return;
}

struct FaceVramEntry CONST_DATA gUnknown_08A3D728[] =
{
    [0] =
    {
        .tileOffset = 0x20 * 0x300,
        .paletteId = 7,
    },
    [1] =
    {
        .tileOffset = 0x20 * 0x380,
        .paletteId = 8,
    },
    [2] =
    {
        .tileOffset = 0x20 * 0x180,
        .paletteId = 15,
    },
    [3] =
    {
        .tileOffset = 0x20 * 0x100,
        .paletteId = 14,
    },
};

//! FE8U: 0x080B8D5C
void SetupGraphicSystemsForWorldMap(void)
{
    SetupBackgrounds(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    GetSaveWriteAddr(SAVE_ID_XMAP);

    LoadLegacyUiFrameGraphics();
    ResetText();
    ResetFaces();
    SetupFaceGfxData(gUnknown_08A3D728);
    ResetUnitSprites();
    MU_Init();
    ApplyUnitSpritePalettes();

    gBmSt.camera.x = 0;
    gBmSt.camera.y = 0;

    return;
}

//! FE8U = 0x080B8E14
void sub_80B8E14(void)
{
    ApplyPalettes(gUnknown_08A97A40, 0x13, 2);
    Decompress(gUnknown_08A96308, (void *)0x06011000);
    Decompress(gUnknown_08A97410, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void *)0x06010280, 0xc, 4);

    return;
}

//! FE8U = 0x080B8E60
void sub_80B8E60(struct WorldMapMainProc * proc)
{
    proc->unk_3a = 0;

    SetDefaultColorEffects();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    ApplyPalettes(gPal_MiscUiGraphics, 0x10, 2);
    ApplyPalette(gPal_MiscUiGraphics, 0x1B);
    Decompress(gUnknown_08AA11D0, gGenericBuffer);
    Copy2dChr(gGenericBuffer, (void *)0x06015300, 8, 2);

    sub_80B8E14();

    ApplyPalette(gUnknown_08A97FA4, 0xE);
    Decompress(gUnknown_08A97ED8, (void *)0x06005000);

    LoadUiFrameGraphics();
    ResetText();
    ResetTextFont();

    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    sub_80AE168(0, 0, 0);

    SetSpecialColorEffectsParameters(0, 0, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    sub_80C1D00();

    return;
}

//! FE8U = 0x080B8FA4
void DeployEveryUnit(struct WorldMapMainProc * unused)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        unit->state &= ~(US_NOT_DEPLOYED);
    }

    return;
}

//! FE8U = 0x080B8FD0
void nullsub_22(void)
{
    return;
}

//! FE8U = 0x080B8FD4
void sub_80B8FD4(void)
{
    gGMData.state.bits.state_0 = 1;
    gGMData.state.bits.state_3 = 0;
    return;
}

//! FE8U = 0x080B8FEC
void sub_80B8FEC(struct WorldMapMainProc * proc)
{
    int id = sub_80BD014(&gGMData);

    if (id >= 0)
    {
        proc->unk_48->nodeId = id;
        proc->unk_48->unk_32_1 = 1;
    }
    else
    {
        proc->unk_48->unk_32_1 = 0;
    }

    return;
}

//! FE8U = 0x080B9028
void sub_80B9028(struct WorldMapMainProc * proc)
{
    s16 unk[2];
    int i;
    s16 * a;
    s16 * b;

    for (i = 0; i < 7; i++)
    {
        if (gGMData.units[i].id == 0)
        {
            continue;
        }

        if (gGMData.units[i].state & 2)
        {
            MapMU_SetUnitClass(proc->unk_54, i, gGMData.units[i].id, -1, gGMData.units[i].location);
        }
        else
        {
            MapMU_SetUnitChar(proc->unk_54, i, gGMData.units[i].id, -1, gGMData.units[i].location);
        }

        // TODO: This matches but using a Vec2 does not
        a = &unk[0];
        *a = gGMData.units[i].location[gWMNodeData].x;
        b = &unk[1];
        *b = gGMData.units[i].location[gWMNodeData].y;

        GmMu_SetPosition(proc->unk_54, i, *a, *b);

        GmMu_ShowUnit(proc->unk_54, i);
    }

    return;
}

//! FE8U = 0x080B90CC
void sub_80B90CC(struct WorldMapMainProc * proc)
{
    int i;

    if (!gGMData.state.bits.state_1)
    {

        for (i = 4; i < 7; i++)
        {
            GmMu_RemoveUnit(proc->unk_54, i);
            gGMData.units[i].id = 0;
            gGMData.units[i].state &= ~2;
            gGMData.units[i].state &= ~1;
        }
    }

    sub_80B9028(proc);

    return;
}

//! FE8U = 0x080B9114
void sub_80B9114(struct WorldMapMainProc * proc)
{
    int i;

    for (i = 0; i <= 0x1c; i++)
    {
        if (gGMData.nodes[i].state & 2)
        {
            proc->unk_48->nodeId = i;
            proc->unk_48->unk_32_1 = 1;

            break;
        }
    }

    return;
}

//! FE8U = 0x080B9154
void sub_80B9154(struct WorldMapMainProc * proc)
{
    SetupGraphicSystemsForWorldMap();

    sub_80B8E60(proc);
    DeployEveryUnit(proc);

    proc->unk_44 = NewMapScreen(PROC_TREE_5);
    proc->unk_48 = sub_80BB9A4(PROC_TREE_5, 0, 3, 10, proc->unk_44);
    proc->unk_4c = NewGmapUnitContainer(proc->unk_44, 0x280, 0xc);
    proc->unk_50 = NewGmapCursor(PROC_TREE_5, 0x12c0, 4, proc->unk_44);
    proc->unk_54 = StartGmMu(proc);

    sub_80BCA0C(&gGMData);
    sub_80C368C(proc);
    sub_80B8FEC(proc);
    sub_80B90CC(proc);

    if (gGMData.state.bits.state_1)
    {
        sub_80B9114(proc);
    }

    proc->unk_44->unk_4c->flags |= 3;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
    {
        sub_80BCFB4();
        proc->unk_48->unk_32_1 = 0;
    }

    proc->unk_2a = 0;

    return;
}

//! FE8U = 0x080B9218
void sub_80B9218(ProcPtr proc)
{
    s16 a, b, c, d;
    s16 cough;

    *&a = gGMData.unk08 >> 8;
    *&b = gGMData.unk0C >> 8;
    *&c = gGMData.xCamera;
    *&d = gGMData.yCamera;

    cough = a - c;
    if (cough < 0x20)
    {
        if (a >= 0x20)
            c = a - 0x20;
        else
            c = 0;
    }
    else if (cough > 0xd0)
    {
        if (a < 0x1c0)
            c = a - 0xd0;
        else
            c = 0xf0;
    }

    cough = b - d;
    if (cough < 0x20)
    {
        if (b >= 0x20)
            d = b - 0x20;
        else
            d = 0;
    }
    else if (cough > 0x80)
    {
        if (b < 0x120)
            d = b - 0x80;
        else
            d = 0xa0;
    }

    gGMData.xCamera = c;
    gGMData.yCamera = d;

    return;
}

//! FE8U = 0x080B92D0
s8 sub_80B92D0(struct WorldMapMainProc * param_1, int param_2)
{
    int iVar4;
    int i;

    if (gGMData.units[0].location == param_2)
    {
        if (((gGMData.nodes[param_2].state & 2) == 0) && (param_2[gWMNodeData].placementFlag != 3))
        {
            if (sub_80BCA1C(param_2) >= 0)
                Proc_Goto(param_1, 16);
            else
            {
                iVar4 = sub_80BD014(&gGMData);
                if (!(gPlaySt.chapterStateBits & 4) && !gPlaySt.config.controller && iVar4 == 2)
                    return 0;

                Proc_Goto(param_1, 18);
            }
        }
        else
        {
            param_1->unk_3e = param_2;
            Proc_Goto(param_1, 14);
            return 1; // :/
        }

        return 1;
    }

    if (sub_80BCCFC(gGMData.units[0].location, param_2, 0) != 0)
    {
        if ((sub_80BD29C() == 2))
        {
            if ((gGMData.nodes[param_2].state & 2) != 0)
            {
                param_1->unk_3e = param_2;
                Proc_Goto(param_1, 14);
            }
            else
                goto label;
        }
        else
        {
        label:
            Proc_Goto(param_1, 6);
        }

        return 1;
    }
    else
    {
        i = gGMData.units[0].location;
        if (sub_80BCCFC(i, param_2, 1) != 0)
        {
            if (sub_80BD29C() == 2)
            {
                if (param_2[gWMNodeData].placementFlag != 3)
                {
                    if ((gGMData.nodes[param_2].state & 2) != 0)
                    {
                        param_1->unk_3e = param_2;
                        Proc_Goto(param_1, 14);
                    }
                    else
                        Proc_Goto(param_1, 6);
                }
                else
                    Proc_Goto(param_1, 6);
            }
            else
                Proc_Goto(param_1, 6);

            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080B93E0
void sub_80B93E0(struct WorldMapMainProc * proc)
{
    s16 xCursorPrev;
    s16 yCursorPrev;
    s16 xCursorNew;
    s16 yCursorNew;
    int keys;
    int speedMaybe;
    struct Vec2 pos;

    if (gKeyStatusPtr->heldKeys & B_BUTTON)
    {
        speedMaybe = 2;
        proc->unk_2a = 0;
    }
    else
    {
        speedMaybe = 4;
    }

    if (proc->unk_2a > 0)
    {
        proc->unk_2a--;
        return;
    }

    if (GmMoveCursorExists())
    {
        return;
    }

    do
    {
        if (gKeyStatusPtr->heldKeys & B_BUTTON)
        {
            keys = gKeyStatusPtr->heldKeys & DPAD_ANY;
            proc->unk_2a = 10;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_ANY)
        {
            proc->unk_2a = 10;
            keys = gKeyStatusPtr->newKeys & DPAD_ANY;
        }
        else
        {
            keys = gKeyStatusPtr->heldKeys & DPAD_ANY;
            proc->unk_2a = 0;
        }

        if (keys == 0)
        {
            return;
        }
    } while (0);

    xCursorPrev = ((gGMData.unk08 >> 8) / 16);
    yCursorPrev = ((gGMData.unk0C >> 8) / 16);

    xCursorNew = xCursorPrev;
    yCursorNew = yCursorPrev;

    if (keys & DPAD_RIGHT)
    {
        xCursorNew++;
    }
    else if (keys & DPAD_LEFT)
    {
        xCursorNew--;
    }

    if (keys & DPAD_DOWN)
    {
        yCursorNew++;
    }
    else if (keys & DPAD_UP)
    {
        yCursorNew--;
    }

    if (xCursorNew < 1)
    {
        xCursorNew = 1;
    }
    else if (xCursorNew > 28)
    {
        xCursorNew = 28;
    }

    if (yCursorNew < 1)
    {
        yCursorNew = 1;
    }
    else if (yCursorNew > 18)
    {
        yCursorNew = 18;
    }

    if ((xCursorPrev != xCursorNew) || (yCursorPrev != yCursorNew))
    {
        PlaySoundEffect(0x65);

        pos.x = xCursorNew * 16 + 8;
        pos.y = yCursorNew * 16 + 8;

        StartGmMoveCursor(0, &pos, speedMaybe, 0, proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_WorldMapMain[] =
{
    PROC_SET_END_CB(WorldMap_Destruct),

    PROC_CALL(sub_80B8FD4),
    PROC_CALL(sub_80B9154),

    PROC_CALL_ARG(sub_8014BD0, 1),
    PROC_SLEEP(4),

    PROC_CALL(WorldMap_SetupChapterStuff),
    PROC_SLEEP(1),

PROC_LABEL(0),
PROC_LABEL(1),
    PROC_REPEAT(sub_80B9BA4),
    PROC_CALL(sub_80B9D14),
    PROC_CALL(sub_80B9D04),

    PROC_GOTO(3),

PROC_LABEL(2),
    PROC_CALL(sub_80B9A34),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_80B9DB8),
    PROC_REPEAT(sub_80B9DC4),
    PROC_CALL(sub_80B9D04),

    // fallthrough

PROC_LABEL(3),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B9F54),
    PROC_CALL(sub_80B9A34),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_80BF13C),
    PROC_CALL(sub_80C3E80),
    PROC_SLEEP(1),

    // fallthrough

PROC_LABEL(4),
    PROC_CALL(sub_80B97F8),
    PROC_REPEAT(sub_80B9804),

    PROC_BLOCK,

PROC_LABEL(5),
    PROC_CALL(sub_80BF15C),
    PROC_CALL(sub_80C3E94),
    PROC_SLEEP(1),
    PROC_CALL(StartWMGeneralMenu),

    PROC_GOTO(3),

PROC_LABEL(6),
    PROC_CALL(sub_80BF15C),
    PROC_CALL(sub_80C3E94),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B8A7C),
    PROC_REPEAT(sub_80B8B3C),

    // fallthrough

PROC_LABEL(7),
    PROC_REPEAT(sub_80B8BA4),
    PROC_SLEEP(1),

    PROC_GOTO(3),

PROC_LABEL(8),
    PROC_REPEAT(sub_80B96DC),

    PROC_GOTO(4),

PROC_LABEL(9),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_80B9810),
    PROC_CALL(sub_80B9820),
    PROC_YIELD,
    PROC_CALL(sub_80B9154),

    PROC_GOTO(23),

PROC_LABEL(10),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_80B9810),
    PROC_CALL_2(sub_80B987C),
    PROC_CALL(sub_80B9154),
    PROC_CALL(sub_80B989C),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B98A8),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(3),

PROC_LABEL(11),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_80B9810),
    PROC_CALL_2(sub_80B98F8),
    PROC_CALL(sub_80B9154),
    PROC_CALL(sub_80B9918),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B9924),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(3),

PROC_LABEL(12),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_80B9810),
    PROC_CALL_2(sub_80B9974),
    PROC_CALL(sub_80B9154),
    PROC_CALL(sub_80B9994),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B99A0),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(3),

PROC_LABEL(13),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_80B9FD4),
    PROC_CALL(sub_80B9810),
    PROC_CALL(Make6C_SaveMenuPostChapter),
    PROC_YIELD,
    PROC_CALL(sub_80B9154),

    PROC_GOTO(23),

PROC_LABEL(14),
    PROC_CALL(sub_80BF15C),
    PROC_CALL(sub_80C3E94),

    // fallthrough

PROC_LABEL(15),
    PROC_CALL(WorldMap_InitChapterTransition),
    PROC_REPEAT(WorldMap_WaitForChapterIntroEvents),
    PROC_CALL(WorldMap_HideEverything),

    PROC_GOTO(25),

PROC_LABEL(16),
    PROC_CALL(sub_80BF15C),
    PROC_CALL(sub_80C3E94),
    PROC_SLEEP(30),
    PROC_CALL(sub_80B9A58),
    PROC_REPEAT(sub_80B9A94),
    PROC_SLEEP(20),
    PROC_CALL(sub_80B9AB0),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_80B9AEC),

    PROC_GOTO(25),

PROC_LABEL(17),
    PROC_CALL(sub_80B9DE0),
    PROC_REPEAT(sub_80B9E40),
    PROC_SLEEP(8),

    PROC_GOTO(3),

PROC_LABEL(18),
    PROC_CALL(sub_80BF15C),
    PROC_CALL(sub_80C3E94),
    PROC_SLEEP(1),
    PROC_CALL(StartWMNodeMenu),
    PROC_SLEEP(6),

    PROC_GOTO(3),

PROC_LABEL(19),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_80B9810),
    PROC_CALL(sub_80B9F14),
    PROC_YIELD,
    PROC_CALL(sub_80B9154),

    PROC_GOTO(24),

PROC_LABEL(20),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_80B9810),
    PROC_CALL(sub_80B9F24),
    PROC_YIELD,
    PROC_CALL(sub_80B9154),

    PROC_GOTO(24),

PROC_LABEL(21),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_80B9810),
    PROC_CALL(sub_80B9F34),
    PROC_YIELD,
    PROC_CALL(sub_80B9154),

    PROC_GOTO(24),

PROC_LABEL(22),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_80B9810),
    PROC_CALL(sub_80B9F44),
    PROC_YIELD,
    PROC_CALL(sub_80B9154),

    PROC_GOTO(24),

PROC_LABEL(24),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B982C),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(18),

PROC_LABEL(23),
    PROC_SLEEP(1),
    PROC_CALL(sub_80B982C),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(3),

PROC_LABEL(25),
    PROC_SLEEP(16),
    PROC_CALL(sub_80B9EA4),

    PROC_CALL(DoNothing),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B955C
int sub_80B955C(ProcPtr proc, int unk)
{
    int idx;
    int i;
    int j;

    for (i = 0; i < 0x1d; i++)
    {
        if (sub_80BBA4C(i) == unk)
        {
            break;
        }
    }

    for (j = 1; j < 0x1d; j++)
    {
        idx = sub_80BBA4C((i + j) < 0x1d ? i + j : i + j - 0x1d);

        if (gGMData.nodes[idx].state & 1)
        {
            return idx;
        }
    }

    return -1;
}

//! FE8U = 0x080B95B0
int sub_80B95B0(void)
{
    int i;

    int x = gGMData.unk08 >> 8;
    int y = gGMData.unk0C >> 8;

    int best = 0x7800;
    int idx = 0;

    for (i = 0; i < 0x1d; i++)
    {
        if (gGMData.nodes[i].state & 1)
        {
            int unk = sub_80C0834(x, y, i[gWMNodeData].x, i[gWMNodeData].y, 5);

            if (unk < best)
            {
                idx = i;
                best = unk;
            }
        }
    }

    return idx;
}

void sub_80B961C(ProcPtr proc, int nodeId)
{
    s16 x;
    s16 y;
    int unk;
    s16 xOut;
    s16 yOut;
    s16 xCamera;
    s16 yCamera;

    *&x = nodeId[gWMNodeData].x;
    *&y = nodeId[gWMNodeData].y;

    gGMData.unk08 = x << 8;
    gGMData.unk0C = y << 8;

    GetWMCenteredCameraPosition(x, y, &xOut, &yOut);

    *&xCamera = gGMData.xCamera;
    *&yCamera = gGMData.yCamera;

    unk = sub_80C0834(xCamera, yCamera, xOut, yOut, 4);
    if (unk < 0)
    {
        unk = unk + 0x1FF;
    }

    unk = (unk >> 9) + 6;
    if (unk > 10)
    {
        unk = 10;
    }

    StartGmScroll(-1, -1, xOut, yOut, unk, 0);

    gGMData.unk01 = 0;

    Proc_Goto(proc, 8);

    return;
}

//! FE8U = 0x080B96DC
void sub_80B96DC(ProcPtr proc)
{
    if (!FindGmScrollManage())
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B96F8
void sub_80B96F8(struct WorldMapMainProc * proc)
{
    int nodeId;

    int x = gGMData.unk08;
    int y = gGMData.unk0C;

    if (gKeyStatusPtr->newKeys & SELECT_BUTTON)
    {
        if (gGMData.state.bits.state_2)
        {
            gGMData.state.bits.state_2 = 0;
        }
        else
        {
            gGMData.state.bits.state_2 = 1;
        }
    }

    nodeId = sub_80BB628(proc->unk_48, x >> 8, y >> 8, 0, 0);
    if (nodeId >= 0)
    {
        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            if (sub_80B92D0(proc, nodeId) != 0)
            {
                PlaySoundEffect(0x6a);
                return;
            }
        }
        else if (gKeyStatusPtr->newKeys & L_BUTTON)
        {
            nodeId = sub_80B955C(proc, nodeId);
            if (nodeId >= 0)
            {
                sub_80B961C(proc, nodeId);
                return;
            }
        }
    }
    else
    {
        if (gKeyStatusPtr->newKeys & L_BUTTON)
        {
            sub_80B961C(proc, sub_80B95B0());
            return;
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        Proc_Goto(proc, 5);
    }
    else
    {
        sub_80B93E0(proc);
        gGMData.unk08 = x;
        gGMData.unk0C = y;
        sub_80B9218(proc);
    }
    return;
}

//! FE8U = 0x080B97F8
void sub_80B97F8(void)
{
    gGMData.unk01 = 1;
    return;
}

//! FE8U = 0x080B9804
void sub_80B9804(ProcPtr proc)
{
    sub_80B96F8(proc);
    return;
}

//! FE8U = 0x080B9810
void sub_80B9810(ProcPtr unused)
{
    sub_80C1D70();
    Proc_EndEachMarked(PROC_MARK_8);
    return;
}

//! FE8U = 0x080B9820
void sub_80B9820(ProcPtr proc)
{
    sub_8092194(proc);
    return;
}

//! FE8U = 0x080B982C
void sub_80B982C(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->unk_44;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->unk_4c->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->unk_4c, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B987C
s8 sub_80B987C(ProcPtr proc)
{
    Proc_BlockEachMarked(PROC_MARK_8);
    Proc_StartBlocking(ProcScr_E_Guide2, proc);
    return 0;
}

//! FE8U = 0x080B989C
void sub_80B989C(void)
{
    Proc_UnblockEachMarked(PROC_MARK_8);
    return;
}

//! FE8U = 0x080B98A8
void sub_80B98A8(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->unk_44;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->unk_4c->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->unk_4c, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B98F8
s8 sub_80B98F8(ProcPtr proc)
{
    Proc_BlockEachMarked(PROC_MARK_8);
    Proc_StartBlocking(gProcScr_Config3, proc);
    return 0;
}

//! FE8U = 0x080B9918
void sub_80B9918(void)
{
    Proc_UnblockEachMarked(PROC_MARK_8);
    return;
}

//! FE8U = 0x080B9924
void sub_80B9924(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->unk_44;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->unk_4c->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->unk_4c, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B9974
s8 sub_80B9974(ProcPtr proc)
{
    Proc_BlockEachMarked(PROC_MARK_8);
    Proc_StartBlocking(gUnknown_08A3E8B8, proc);
    return 0;
}

//! FE8U = 0x080B9994
void sub_80B9994(void)
{
    Proc_UnblockEachMarked(PROC_MARK_8);
    return;
}

//! FE8U = 0x080B99A0
void sub_80B99A0(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->unk_44;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->unk_4c->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->unk_4c, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B99F0
void sub_80B99F0(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x080B9A10
void WorldMap_HideEverything(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    return;
}

//! FE8U = 0x080B9A34
void sub_80B9A34(struct WorldMapMainProc * proc)
{

    if (proc->unk_2c & 4)
    {
        proc->unk_2c &= ~0x44;
        NewFadeIn(4, 0);
    }

    return;
}

//! FE8U = 0x080B9A58
void sub_80B9A58(struct WorldMapMainProc * proc)
{
    GmMu_80BE108(proc->unk_54, 0, 0);
    gPlaySt.chapterIndex = WMLoc_GetChapterId(gGMData.units[0].location);
    gGMData.unk01 = 0;
    sub_80C07D4(0, sub_80BCA1C(gGMData.units[0].location), proc);
    return;
}

//! FE8U = 0x080B9A94
void sub_80B9A94(ProcPtr proc)
{
    if (!sub_80C081C())
    {
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x080B9AB0
void sub_80B9AB0(void)
{
    Sound_FadeOutBGM(4);
    SetDispEnable(0, 0, 0, 0, 0);
    sub_80B895C();
    sub_80C3660();
    EndWMFaceCtrl();
    return;
}

//! FE8U = 0x080B9AEC
void sub_80B9AEC(struct WorldMapMainProc * proc)
{
    int i;

    for (i = 4; i < 7; i++)
    {
        if (gGMData.units[i].id == 0)
        {
            continue;
        }

        if (gGMData.units[0].location != gGMData.units[i].location)
        {
            continue;
        }

        gGMData.unk_cc = i - 4;
        GmMu_RemoveUnit(proc->unk_54, i);
    }

    return;
}

//! FE8U = 0x080B9B38
void WorldMap_InitChapterTransition(struct WorldMapMainProc * proc)
{
    GmMu_80BE108(proc->unk_54, 0, 0);

    if (gGMData.units[0].location[gWMNodeData].placementFlag != GMAP_NODE_PLACEMENT_DUNGEON)
    {
        gPlaySt.chapterIndex = WMLoc_GetChapterId(proc->unk_3e);
        gGMData.state.bits.state_1 = 0;
    }
    else
    {
        gPlaySt.chapterIndex = WMLoc_GetChapterId(gGMData.units[0].location);
    }

    CallChapterWMIntroEvents(proc);

    gGMData.unk01 = 0;

    sub_80C1AB0();

    return;
}

//! FE8U = 0x080B9BA4
void sub_80B9BA4(struct WorldMapMainProc * proc)
{
    if (EventEngineExists())
    {
        return;
    }

    MapRoute_80BC2DC(proc->unk_44->unk_4c);
    if (!(gGMData.state.raw & 0x80))
    {
        SetSpecialColorEffectsParameters(0, 0, 0, 0);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 0, 0);
        SetBlendBackdropA(0);
        SetBlendBackdropB(0);
    }
    else
    {
        SetDispEnable(0, 0, 0, 0, 0);
    }

    sub_80B895C();
    sub_80C3660();
    EndWMFaceCtrl();
    EndGmMuEntry();
    sub_80C2460();
    sub_80C1F5C();

    if (gGMData.state.raw & 0xc0)
    {
        Sound_FadeOutBGM(1);
        Sound_FadeOutSE(1);

        proc->unk_3e = gGMData.units[0].location;

        Proc_Goto(proc, 15);
    }
    else
    {
        s16 xCamera;
        s16 yCamera;

        int x = gGMData.units[0].location[gWMNodeData].x;
        int y = gGMData.units[0].location[gWMNodeData].y;

        gGMData.unk08 = x << 8;
        gGMData.unk0C = y << 8;

        GetWMCenteredCameraPosition(x, y, &xCamera, &yCamera);

        gGMData.xCamera = xCamera;
        gGMData.yCamera = yCamera;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B9CB0
void WorldMap_WaitForChapterIntroEvents(ProcPtr proc)
{
    if (EventEngineExists())
    {
        return;
    }

    SetDispEnable(0, 0, 0, 0, 0);
    sub_80B895C();
    sub_80C3660();
    EndWMFaceCtrl();
    EndGmMuEntry();
    sub_80C2460();
    sub_80C1F5C();
    Proc_Break(proc);

    return;
}

//! FE8U = 0x080B9D04
void sub_80B9D04(void)
{
    gGMData.state.bits.state_1 = 1;
    return;
}

//! FE8U = 0x080B9D14
void sub_80B9D14(ProcPtr proc)
{
    int i;
    int unk;

    s8 flag = 0;

    if (!(gGMData.state.bits.state_1))
    {
        flag = 1;
    }
    else
    {
        if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
        {
            for (i = 4; i < 7; i++)
            {
                if (gGMData.units[i].id != 0)
                {
                    break;
                }
            }

            if (i == 7)
            {
                flag = 1;
            }
        }
        else
        {
            if (gGMData.units[0].location[gWMNodeData].placementFlag == GMAP_NODE_PLACEMENT_DUNGEON)
            {
                for (i = 4; i < 7; i++)
                {
                    if (gGMData.units[i].id != 0)
                    {
                        break;
                    }
                }

                if (i == 7)
                {
                    flag = 1;
                }
            }
        }
    }

    if (flag)
    {
        sub_80C1A74(0, &unk);
        if (unk > 0)
        {
            Proc_Goto(proc, 2);
        }
    }

    sub_80C1AF8();

    return;
}

//! FE8U = 0x080B9DB8
void sub_80B9DB8(void)
{
    sub_80C1ADC();
    return;
}

//! FE8U = 0x080B9DC4
void sub_80B9DC4(ProcPtr proc)
{
    if (!sub_80C1BE0())
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B9DE0
void sub_80B9DE0(struct WorldMapMainProc * proc)
{
    s16 x;
    s16 y;

    GmMu_GetPosition(proc->unk_54, 0, &x, &y);
    sub_80C168C(x, y);

    *&x = gGMData.units[0].location[gWMNodeData].x;
    *&y = gGMData.units[0].location[gWMNodeData].y;

    gGMData.unk08 = x << 8;
    gGMData.unk0C = y << 8;

    return;
}

//! FE8U = 0x080B9E40
void sub_80B9E40(ProcPtr proc)
{
    if (!sub_80C16DC())
    {
        gGMData.unk01 = 1;
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x080B9E64
void sub_80B9E64(void)
{
    s16 x;
    s16 y;

    sub_80B895C();
    sub_80C3660();
    EndWMFaceCtrl();

    *&x = (gGMData.xCamera);
    *&y = (gGMData.yCamera);

    gGMData.unk08 = (x + 120) << 8;
    gGMData.unk0C = (y + 80) << 8;

    return;
}

//! FE8U = 0x080B9EA4
void sub_80B9EA4(void)
{
    SetDispEnable(0, 0, 0, 0, 0);

    SetSpecialColorEffectsParameters(0, 0, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    Sound_FadeOutBGM(1);
    Sound_FadeOutSE(1);

    return;
}

//! FE8U = 0x080B9F08
void DoNothing(void)
{
    nullsub_22();
    return;
}

//! FE8U = 0x080B9F14
void sub_80B9F14(ProcPtr proc)
{
    sub_80C400C(0, proc);
    return;
}

//! FE8U = 0x080B9F24
void sub_80B9F24(ProcPtr proc)
{
    sub_80C400C(1, proc);
    return;
}

//! FE8U = 0x080B9F34
void sub_80B9F34(ProcPtr proc)
{
    sub_80C400C(2, proc);
    return;
}

//! FE8U = 0x080B9F44
void sub_80B9F44(ProcPtr proc)
{
    sub_80C400C(3, proc);
    return;
}

//! FE8U = 0x080B9F54
void sub_80B9F54(ProcPtr unused)
{
    int mapLocation;
    int songId;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
    {
        songId = 8;
    }
    else
    {
        mapLocation = sub_80BD014(&gGMData);

        if (mapLocation >= 0)
        {
            switch (gPlaySt.chapterModeIndex)
            {
                case CHAPTER_MODE_COMMON:
                case CHAPTER_MODE_EIRIKA:
                default:
                    songId = gWMSongTable[mapLocation].eirika;
                    break;

                case CHAPTER_MODE_EPHRAIM:
                    songId = gWMSongTable[mapLocation].ephraim;
                    break;
            }
        }
        else
        {
            songId = 4;
        }
    }

    if (GetCurrentBgmSong() != songId)
    {
        OverrideBgm(songId);
    }

    return;
}

//! FE8U = 0x080B9FC0
void sub_80B9FC0(void)
{
    sub_80B9F54(Proc_Find(gProcScr_WorldMapMain));
    return;
}

//! FE8U = 0x080B9FD4
void sub_80B9FD4(ProcPtr unused)
{
    int mapLocation = sub_80BD014(&gGMData);

    if (mapLocation < 0)
    {
        mapLocation = 0;
    }

    gPlaySt.chapterIndex = WMLoc_GetChapterId(mapLocation);
    gPlaySt.unk4A_2 = 1;

    return;
}

//! FE8U = 0x080BA008
void sub_80BA008(int unk)
{
    struct WorldMapMainProc * proc = Proc_Find(gProcScr_WorldMapMain);
    proc->unk_2c = unk;
    Proc_Goto(proc, 0);

    return;
}

//! FE8U = 0x080BA024
void EndWM(ProcPtr unused)
{
    Proc_End(Proc_Find(gUnknown_08A20DA4));
    Proc_End(Proc_Find(gProcScr_WorldMapMain));
    ResetDialogueScreen();
    APProc_DeleteAll();
    SetupBackgrounds(NULL);
    return;
}

//! FE8U = 0x080BA054
s8 sub_80BA054(void)
{
    return (Proc_Find(gProcScr_WorldMapMain) != 0) ? 1 : 0;
}

//! FE8U = 0x080BA06C
void sub_80BA06C(struct Proc8A3DD08 * proc)
{
    if (proc->unk_2c > 0)
    {
        proc->unk_2c--;
        return;
    }

    switch (proc->unk_30)
    {
        case 6:
            sub_80B86CC(proc->unk_34, proc->unk_40, proc->unk_44);
            break;

        case 7:
            sub_80B8844(proc->unk_34, proc->unk_44);
            break;
    }

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_08A3DD08[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_80BA06C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BA0B4
void sub_80BA0B4(int timerMaybe, u8 b, int faceSlot, int fid, int e, int f, int config)
{
    struct WorldMapMainProc * parent = Proc_Find(gProcScr_WorldMapMain);

    struct Proc8A3DD08 * proc = Proc_Start(gProcScr_08A3DD08, parent);
    proc->unk_2c = timerMaybe; // timer?
    proc->unk_30 = b;
    proc->unk_34 = faceSlot; // face slot
    proc->unk_40 = fid;      // fid
    proc->unk_38 = e;
    proc->unk_3c = f;
    proc->unk_44 = config; // face config

    return;
}

//! FE8U = 0x080BA100
void sub_80BA100(struct Proc8A3DD30 * proc)
{
    int i;

    u16 * palIt = &PAL_COLOR(proc->unk_30, 1);
    u16 * it = proc->unk_34;

    proc->unk_2c++;

    for (i = 1; i < 0x10; i++)
    {
        *palIt = ((((*it & 0x1f) * (0x20 - proc->unk_2c)) >> 5) & 0x1f) +
            ((((0x20 - proc->unk_2c) * (*it & 0x3e0)) >> 5) & 0x3e0) +
            ((((0x20 - proc->unk_2c) * (*it & 0x7c00)) >> 5) & 0x7c00);
        it++;
        palIt++;
    }

    EnablePaletteSync();

    if (proc->unk_2c == 0x20)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_08A3DD20[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_80BA100),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BA198
void sub_80BA198(int color)
{
    int i;

    struct WorldMapMainProc * parent = Proc_Find(gProcScr_WorldMapMain);
    struct Proc8A3DD30 * proc = Proc_Start(gProcScr_08A3DD20, parent);

    proc->unk_30 = color & 0x1f;
    proc->unk_2c = 0;

    ApplyPalettes(gPal_MapSprite, 0x1C, 4);

    for (i = 1; i < 0x10; i++)
    {
        proc->unk_34[i - 1] = PAL_COLOR(color & 0x1f, i);
    }

    return;
}

//! FE8U = 0x080BA1F4
void sub_80BA1F4(struct Proc8A3DD38 * proc)
{
    int i;

    u16 * palIt = &PAL_COLOR(proc->unk_30, 1);
    u16 * it = proc->unk_34;

    proc->unk_2c++;

    for (i = 1; i < 0x10; i++)
    {
        *palIt = ((((*it & 0x1f) * proc->unk_2c) >> 5) & 0x1f) + (((proc->unk_2c * (*it & 0x3e0)) >> 5) & 0x3e0) +
            (((proc->unk_2c * (*it & 0x7c00)) >> 5) & 0x7c00);
        it++;
        palIt++;
    }

    EnablePaletteSync();

    if (proc->unk_2c == 0x20)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_08A3DD38[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_80BA1F4),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BA288
void sub_80BA288(int color)
{
    int i;

    struct WorldMapMainProc * parent = Proc_Find(gProcScr_WorldMapMain);
    struct Proc8A3DD38 * proc = Proc_Start(gProcScr_08A3DD38, parent);

    proc->unk_30 = color & 0x1f;
    proc->unk_2c = 0;

    ApplyPalettes(gPal_MapSprite, 0x1C, 4);

    for (i = 1; i < 0x10; i++)
    {
        proc->unk_34[i - 1] = PAL_COLOR(color & 0x1f, i);
    }

    return;
}

//! FE8U = 0x080BA2E4
void NewWorldMap(void)
{
    struct WorldMapMainProc * proc = Proc_Start(gProcScr_WorldMapMain, PROC_TREE_3);

    proc->unk_29_1 = 0;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
    {
        proc->unk_2c = 4;
    }
    else
    {
        if (gGMData.state.bits.state_1)
        {
            proc->unk_2c = 12;
        }
        else
        {
            proc->unk_2c = 16;
        }
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_WorldMapWrapper[] =
{
    PROC_SLEEP(1),
    PROC_CALL(NewWorldMap),
    PROC_YIELD,

    PROC_WHILE_EXISTS(gProcScr_WorldMapMain),
    PROC_END_EACH(gUnknown_08A20DA4),
    PROC_YIELD,

    PROC_END,
};

//! FE8U = 0x080BA334
void WorldMap_SetupChapterStuff(struct WorldMapMainProc * proc)
{
    int chIndex;
    int iVar2;

    Sound_FadeOutBGM(4);

    if ((gGMData.state.bits.state_1) || (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
    {
        sub_80BA008(proc->unk_2c);
    }
    else
    {
        int loc = gGMData.units[0].location;

        gGMData.unk_c8 = loc;
        iVar2 = WMLoc_GetNextLocId(loc);

        if (iVar2 > -1)
        {
            chIndex = WMLoc_GetChapterId(iVar2);

            gPlaySt.chapterIndex = chIndex;

            if (gUnknown_088B39EC[GetROMChapterStruct(chIndex)->gmapEventId] == 0)
            {
                return;
            }

            sub_80BCFB4();
            proc->unk_48->unk_32_1 = 0;
            CallEvent(gUnknown_088B39EC[GetROMChapterStruct(chIndex)->gmapEventId], 0);
        }
    }

    StartWMFaceCtrl(proc);
    StartGmapMuEntry(NULL);

    return;
}

//! FE8U = 0x080BA3D4
void CallChapterWMIntroEvents(ProcPtr proc)
{
    if (gUnknown_088B3AD8[GetROMChapterStruct(gPlaySt.chapterIndex)->gmapEventId] != 0)
    {
        CallEvent(gUnknown_088B3AD8[GetROMChapterStruct(gPlaySt.chapterIndex)->gmapEventId], 0);
        StartWMFaceCtrl(proc);
        StartGmapMuEntry(NULL);
    }

    return;
}

struct WMSongTableEnt CONST_DATA gWMSongTable[] =
{
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x04, 0x04, },
    { 0x05, 0x05, },
    { 0x05, 0x05, },
    { 0x05, 0x05, },
    { 0x05, 0x05, },
    { 0x05, 0x05, },
    { 0x06, 0x06, },
    { 0x06, 0x06, },
    { 0x06, 0x06, },
    { 0x06, 0x06, },
    { 0x06, 0x06, },
    { 0x04, 0x06, },
    { 0x05, 0x06, },
    { 0x07, 0x07, },
    { 0x07, 0x07, },
    { 0x07, 0x07, },
    { 0x07, 0x07, },
    { 0x2F, 0x2F, },
    { 0x04, 0x04, },
};
