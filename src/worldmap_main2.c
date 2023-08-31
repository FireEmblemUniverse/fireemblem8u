#include "global.h"

#include "event.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ap.h"
#include "uiconfig.h"

#include "worldmap.h"

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

struct WMSongTableEnt
{
    /* 00 */ u16 eirika;
    /* 02 */ u16 ephraim;
};

extern struct WMSongTableEnt gWMSongTable[];

int sub_80BB628(void * unused, int arg1, int arg2, int arg3, int arg4);

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

    sub_80BF404(-1, -1, xOut, yOut, unk, 0);

    gGMData.unk01 = 0;

    Proc_Goto(proc, 8);

    return;
}

//! FE8U = 0x080B96DC
void sub_80B96DC(ProcPtr proc)
{
    if (!sub_80BF3F4())
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
            if (sub_80B92D0(proc) != 0)
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
void sub_80B9810(void)
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
    MapMU_80BE108(proc->unk_54, 0, 0);
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
        MapMU_RemoveUnit(proc->unk_54, i);
    }

    return;
}

//! FE8U = 0x080B9B38
void WorldMap_InitChapterTransition(struct WorldMapMainProc * proc)
{
    MapMU_80BE108(proc->unk_54, 0, 0);

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
    sub_80C0200();
    sub_80C2460();
    sub_80C1F5C();

    if (gGMData.state.raw & 0xc0)
    {
        Sound_FadeOutBGM(1);
        Sound_FadeOutSE(1);

        proc->unk_3e = gGMData.units[0].location;

        Proc_Goto(proc, 0xf);
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
    sub_80C0200();
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

    sub_80BE3A0(proc->unk_54, 0, &x, &y);
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

    if (Sound_GetCurrentSong() != songId)
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
void sub_80B9FD4(void)
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

struct ProcCmd CONST_DATA gProcScr_08A3DD08[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_80BA06C),

    PROC_END,
};

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

struct ProcCmd CONST_DATA gProcScr_08A3DD20[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_80BA100),

    PROC_END,
};

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

struct ProcCmd CONST_DATA gProcScr_08A3DD38[] =
{
    PROC_YIELD,
    PROC_REPEAT(sub_80BA1F4),

    PROC_END,
};

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

    NewMapMuEntry(0);

    return;
}

//! FE8U = 0x080BA3D4
void CallChapterWMIntroEvents(ProcPtr proc)
{
    if (gUnknown_088B3AD8[GetROMChapterStruct(gPlaySt.chapterIndex)->gmapEventId] != 0)
    {
        CallEvent(gUnknown_088B3AD8[GetROMChapterStruct(gPlaySt.chapterIndex)->gmapEventId], 0);
        StartWMFaceCtrl(proc);
        NewMapMuEntry(0);
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
