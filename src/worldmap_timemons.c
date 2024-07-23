#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"

/**
 * Generate random monsters on the worldmap
 */

const u8 gWMMonsterSpawnLocations[WM_MON_LOC_MAX] = {
    [WM_MON_LOC_0] = WM_NODE_ZahaWoods,
    [WM_MON_LOC_1] = WM_NODE_AdlasPlains,
    [WM_MON_LOC_2] = WM_NODE_TerazPlateau,
    [WM_MON_LOC_3] = WM_NODE_HamillCanyon,
    [WM_MON_LOC_4] = WM_NODE_Bethroen,
    [WM_MON_LOC_5] = WM_NODE_ZaalbulMarsh,
    [WM_MON_LOC_6] = WM_NODE_NarubeRiver,
    [WM_MON_LOC_7] = WM_NODE_NelerasPeak,
    [WM_MON_LOC_8] = WM_NODE_MelkaenCoast,
};

const u8 gWMMonsterSpawnsSize = WM_MON_LOC_MAX;

int GetWmMonsterGenAmount(int idx)
{
    static const int chance_lut[] = {
        100,   0,   0,
        100,   0,   0,
        100,   0,   0,
        100, 100,   0,
        100, 100,   0,
        100, 100,   0,
        100, 100,   0,
        100, 100, 100,
        100, 100, 100,
        100, 100, 100,
        100, 100, 100,
    };

    int i, ret = 0;

#if !NONMATCHING
    const int * __chance_lut = chance_lut;
    const int * _chance_lut  = &__chance_lut[idx * 3];
#else
    const int * _chance_lut = &chance_lut[idx * 3];
#endif

    for (i = 0; i < 3; i++)
    {
        if (NextRN_100() < _chance_lut[i])
            ret++;
    }
    return ret;
}

int GenerateRandomonsterMergeNode(const u8 * lut, int idx)
{
    int i;
    int ret, rn;

    ret = 0;
    for (i = 0; i < idx; i++)
        ret = ret + lut[i];

    if (ret == 0)
        return -1;

    rn = NextRN_N(ret);

    ret = 0;
    for (i = 0; i < idx; i++)
    {
        ret += lut[i];
        if (rn < ret)
            break;
    }
    return i;
}

const u8 WmMonsterGenerateRatesIdx_EirikaMode[11] = {
    /* chapter idx */
    0x0A,
    0x0B,
    0x3D,
    0x0D,
    0x0E,
    0x0F,
    0x10,
    0x11,
    0x12,
    0x13,
    0x14,
};

const u8 WmMonsterGenerateRatesIdx_EphraimMode[11] = {
    /* chapter idx */
    0x17,
    0x18,
    0x3E,
    0x1A,
    0x1B,
    0x1C,
    0x1D,
    0x1E,
    0x1F,
    0x20,
    0x21,
};

const u8 WmMonsterGenerateRates_EirikaMode[WM_MON_LOC_MAX * 10] = {
    40, 60,  0,  0,  0,  0,  0,  0,  0,
    60, 40,  0,  0,  0,  0,  0,  0,  0,
    55, 35, 10,  0,  0,  0,  0,  0,  0,
    30, 40, 30,  0,  0,  0,  0,  0,  0,
    30, 30, 30, 10,  0,  0,  0,  0,  0,
     5,  5, 10, 20,  0,  0,  0,  0,  0,
     5,  5, 15, 15, 25, 35,  0,  0,  0,
     5,  5, 10, 20, 30, 30,  0,  0,  0,
     5,  5, 15, 20, 15, 20, 10,  0,  0,
     5,  5, 15, 20, 10, 20, 20,  5,  0,
};

const u8 WmMonsterGenerateRates_XmapEirika[WM_MON_LOC_MAX] = {
     5,  5, 15, 10, 15, 15, 15,  5, 15,
};

const u8 WmMonsterGenerateRates_EphraimMode[WM_MON_LOC_MAX * 10] = {
    40, 60,  0,  0,  0,  0,  0,  0,  0,
    60, 40,  0,  0,  0,  0,  0,  0,  0,
    55, 35,  0,  0, 10,  0,  0,  0,  0,
    35, 45,  0,  0, 20,  0,  0,  0,  0,
    30, 30,  0,  0, 30, 10,  0,  0,  0,
     5,  5,  0,  0, 35, 25,  0,  0,  0,
     5,  5, 15, 15, 25, 35,  0,  0,  0,
     5,  5, 10, 20, 30, 30,  0,  0,  0,
     5,  5, 15, 20, 15, 20, 10,  0,  0,
     5,  5, 15, 20, 10, 20, 20,  5,  0,
};

const u8 WmMonsterGenerateRates_XmapEphraim[WM_MON_LOC_MAX] = {
     5,  5, 15, 10, 15, 15, 15,  5, 15,
};

int GenerateRandomonsterMergeConf(int chapter, struct GmapTimeMonsConf * out)
{
    int r0, cnt, rn;
#ifdef NONMATCHING
    int node;
    u16 * ptr;
    u8 * zeromus;
#else
    register int node asm("r5");
    register u16 * ptr asm("r5");
    register u8 * zeromus asm("r0");
#endif
    int i;
    u32 idx;
    u8 array[WM_MON_LOC_MAX];
    u8 list[WM_MONS_AMT];
    u16 seeds[WM_MONS_AMT];
    const u8 * lut1;

    if (chapter >= 0)
    {
        if (chapter < 10 || chapter == 0x38)
            return 0;

        if (chapter < 0)
            goto handle_xmap;

        switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_EIRIKA:
        default:
            for (idx = 0; idx < 11; ++idx)
            {
                if (WmMonsterGenerateRatesIdx_EirikaMode[idx] == chapter)
                    break;
            }
            lut1 = WmMonsterGenerateRates_EirikaMode + idx * WM_MON_LOC_MAX;
            break;

        case CHAPTER_MODE_EPHRAIM:
            for (idx = 0; idx < 11; ++idx) {
                if (WmMonsterGenerateRatesIdx_EphraimMode[idx] == chapter)
                    break;
            }
            lut1 = WmMonsterGenerateRates_EphraimMode + idx * WM_MON_LOC_MAX;
            break;
        }
        cnt = GetWmMonsterGenAmount(idx);
        if (cnt <= 0)
            return 0;
    }
    else
    {
    /* xmap? */
    handle_xmap:

        switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_EIRIKA:
        default:
            lut1 = WmMonsterGenerateRates_XmapEirika;
            break;

        case CHAPTER_MODE_EPHRAIM:
            lut1 = WmMonsterGenerateRates_XmapEphraim;
            break;
        }
        cnt = 3;
    }

    memcpy(array, lut1, sizeof(array));
    for (i = 0; i < (u32)WM_MON_LOC_MAX; i++)
    {
        /* Monster will not generate at unit location */
        if (gWMMonsterSpawnLocations[i] == gGMData.units[0].location)
            array[i] = 0;
    }
    StoreRNState(seeds);
    ptr = gGmMonsterRnState;
    LoadRNState(ptr);

    for (i = 0; i < cnt; i++)
    {
        node = GenerateRandomonsterMergeNode(array, WM_MON_LOC_MAX);
        if (node < 0)
            return i;
        out[i].node = gWMMonsterSpawnLocations[node];
        GetChapterSkirmishLeaderClasses(WMLoc_GetChapterId(out[i].node), list);
        rn = NextRN_N(sizeof(list));
        out[i].jid = list[rn];
        out[i].unk2 = 0;
        gGMData.unk_c9[i] = rn;
        zeromus = array + node;
        *zeromus = 0;
    }
    StoreRNState(gGmMonsterRnState);
    LoadRNState(seeds);
    return cnt;
}

void nullsub_72(void) {}

void GmapTimeMons_Init(struct ProcGmapTimeMons * proc)
{
    int ret;
    proc->trigger = false;
    ret = GenerateRandomonsterMergeConf(GetNextUnclearedChapter(), proc->confs);
    proc->monster_amt = ret;

    if (!(u8)ret)
        Proc_Goto(proc, 0);
}

void GmapTimeMons_ExecMonsterMergeMu(struct ProcGmapTimeMons * proc)
{
    int i, wm_uid;
    if (proc->trigger != false)
    {
        PlaySoundEffect(0x312);
        for (i = 0; i < proc->monster_amt; i++)
        {
            s16 x, y;
            s16 x1, y1, x2, y2;

            *&x1 = proc->confs[i].node[gWMNodeData].x;
            *&y1 = proc->confs[i].node[gWMNodeData].y;

            *&x2 = GM_SCREEN->x;
            *&y2 = GM_SCREEN->y;
        
            x = x1 - x2;
            y = y1 - y2 + 8;

            if ((y >= 0 && y < 0xB0) && (x >= 0 && x < 0xF0))
                proc->ap_procs[i] = APProc_Create(Sprite_08A97AEC, (s16)x, (s16)y, 0x3880, 0, 7);

            wm_uid = i + 4;
            SetGmClassUnit(wm_uid, proc->confs[i].jid, WM_FACTION_RED, proc->confs[i].node);
            gGMData.units[wm_uid].state |= GM_UNIT_STATE_B0;
            GmShowMuUnit(GM_MU, wm_uid);
        }
        Proc_Break(proc);
    }
}

void GmapTimeMons_WaitSpriteDone(struct ProcGmapTimeMons * proc)
{
    if (!APProc_Exists())
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_GmapTimeMons[] = {
    PROC_NAME("Gmap Time Mons"),
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_SET_END_CB(nullsub_72),
    PROC_CALL(GmapTimeMons_Init),
    PROC_REPEAT(GmapTimeMons_ExecMonsterMergeMu),
    PROC_SLEEP(60),
    PROC_REPEAT(GmapTimeMons_WaitSpriteDone),
PROC_LABEL(0x0),
    PROC_END
};

ProcPtr NewGmapTimeMons(ProcPtr parent, int * out)
{
    struct ProcGmapTimeMons * proc;
    if (!parent)
        proc = Proc_Start(ProcScr_GmapTimeMons, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(ProcScr_GmapTimeMons, parent);

    if (out)
        *out = proc->monster_amt;

    return proc;
}

void WmRemoveRandomMonsters(void)
{
    int i;

    Proc_EndEach(ProcScr_GmapTimeMons);

    for (i = 0; i < WM_MONS_AMT; i++)
        GmMu_RemoveUnit(GM_MU, i + WM_MONS_UID_ENTRY);
}

void WmMergeMonsters(void)
{
    struct ProcGmapTimeMons * proc;
    proc = Proc_Find(ProcScr_GmapTimeMons);
    if (proc)
        proc->trigger = true;
}

void WmShowMonsters(void)
{
    int i;

    s16 x, y;

    for (i = WM_MONS_UID_ENTRY; i < WM_MONS_UID_ENTRY + WM_MONS_AMT; i++)
    {
        if (gGMData.units[i].id == 0)
            continue;

        if (gGMData.units[i].state & GM_UNIT_STATE_B1)
        {
            MapMU_SetUnitClass(
                GM_MU,
                i,
                !(gGMData.units[i].state & GM_UNIT_STATE_B1) ? 0 : gGMData.units[i].id,
                -1,
                gGMData.units[i].location);
        }
        else
        {
            MapMU_SetUnitChar(
                GM_MU,
                i,
                (gGMData.units[i].state & GM_UNIT_STATE_B1) ? 0 : gGMData.units[i].id,
                -1,
                gGMData.units[i].location);
        }

        *&x = gWMNodeData[gGMData.units[i].location].x;
        *&y = gWMNodeData[gGMData.units[i].location].y;

        GmMu_SetPosition(GM_MU, i, x, y);
        GmShowMuUnit(GM_MU, i);
    }
}

bool GmapTimeMonsExists(void)
{
    return Proc_Find(ProcScr_GmapTimeMons) != NULL;
}
