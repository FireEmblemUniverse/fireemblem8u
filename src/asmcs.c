/**
 * Most "ASMCs" are here (functions called through chapter events)
 * Exceptions include the Suspend effect function and probably other
 * system (non-chapter) functions called through events
 */

#include "global.h"
#include "variables.h"
#include "functions.h"

#include "proc.h"
#include "event.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmio.h"
#include "hardware.h"
#include "sallycursor.h"
#include "bmunit.h"
#include "bmmap.h"
#include "mu.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "bmdifficulty.h"

struct UnkProc80855A0 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4D - 0x29];
    /* 4D */ u8 unk4D;
};

struct Proc8085618 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s8 unk4C;
};

struct Proc89EE068 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x54 - 0x29];
    /* 54 */ ProcPtr unk_proc;
};

struct Proc89EE088 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x2C - 0x29];
    /* 2C */ u32 count;
};


void sub_8085374(struct EventEngineProc *proc)
{
    Proc_StartBlocking(gUnknown_089EDF78, proc);
}

void sub_8085388(struct EventEngineProc *proc)
{
    if ((CHAPTER_FLAG_3 & gRAMChapterData.chapterStateBits) || 0 == gRAMChapterData.unk41_1)
        Sound_FadeOutBGM(4);
}

void sub_80853B0(struct EventEngineProc *proc)
{
    if ((CHAPTER_FLAG_3 | CHAPTER_FLAG_7) & gRAMChapterData.chapterStateBits)
        Proc_Goto(proc, 0);
}

void sub_80853D0(struct EventEngineProc *proc)
{
    SetNextGameActionId(GAME_ACTION_0);
    EndBMapMain();
    DeleteEventEngines();
}

int sub_80853E4()
{
    return UNIT_ACTION_WAIT == gActionData.unitActionType;
}

void sub_80853FC()
{
    SetKeyStatus_IgnoreMask(0);
}

void sub_8085408()
{
    NewKeyStatusSetter(2);
}

void sub_8085414(struct EventEngineProc *proc)
{
    Proc_Start(gUnknown_089EDFD8, PROC_TREE_4);
}

#if NONMATCHING
void sub_8085428(struct EventEngineProc *proc)
{
    struct Unit *leader = GetUnitFromCharId(GetPlayerLeaderUnitId());
    s8 x, y;
    int i;

    x = leader->xPos;
    y = leader->yPos;

    i = 1;

    for (i = 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit == leader)
            continue;

        if (unit->xPos != x || unit->yPos != y)
            continue;
        
        if ((US_RESCUING | US_RESCUED) & unit->state)
            continue;
        
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
    }

    SMS_UpdateFromGameData();
}
#else
__attribute__((naked))
void sub_8085428(struct EventEngineProc *proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        bl GetPlayerLeaderUnitId\n\
        bl GetUnitFromCharId\n\
        adds r5, r0, #0\n\
        movs r7, #0x10\n\
        ldrsb r7, [r5, r7]\n\
        movs r6, #0x11\n\
        ldrsb r6, [r5, r6]\n\
        movs r4, #1\n\
    _0808543E:\n\
        adds r0, r4, #0\n\
        bl GetUnit\n\
        adds r2, r0, #0\n\
        cmp r2, #0\n\
        beq _08085474\n\
        ldr r0, [r2]\n\
        cmp r0, #0\n\
        beq _08085474\n\
        cmp r2, r5\n\
        beq _08085474\n\
        movs r0, #0x10\n\
        ldrsb r0, [r2, r0]\n\
        cmp r0, r7\n\
        bne _08085474\n\
        movs r0, #0x11\n\
        ldrsb r0, [r2, r0]\n\
        cmp r0, r6\n\
        bne _08085474\n\
        ldr r1, [r2, #0xc]\n\
        movs r0, #0x30\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        bne _08085474\n\
        movs r0, #9\n\
        orrs r1, r0\n\
        str r1, [r2, #0xc]\n\
    _08085474:\n\
        adds r4, #1\n\
        cmp r4, #0x3f\n\
        ble _0808543E\n\
        bl SMS_UpdateFromGameData\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}
#endif /* NONMATCHING */

void ResetAllPlayerUnitState(void)
{
    int i;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        SetUnitHp(unit, GetUnitMaxHp(unit));
        SetUnitStatus(unit, US_NONE);
        unit->torchDuration = 0;
        unit->barrierDuration = 0;
        unit->state &=
            US_DEAD | US_NOT_DEPLOYED | US_GROWTH_BOOST |
            US_SOLOANIM_1 | US_SOLOANIM_2 | US_BIT16 |
            US_BIT20 | US_BIT21 | US_BIT22 |
            US_BIT25 | US_BIT26;

        unit->xPos = -1;

        unit->state |= US_HIDDEN;
        unit->rescueOtherUnit = 0;
    }

    RefreshEntityBmMaps();
    MU_EndAll();
}

void sub_80854E4(struct EventEngineProc *proc)
{
    sub_8097D54(proc->proc_parent);
}

void sub_80854F0(struct EventEngineProc *proc)
{
    sub_8097D68(proc->proc_parent);
}

void sub_80854FC(struct EventEngineProc *proc)
{
    SetupBackgrounds(NULL);
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_808552C(struct EventEngineProc *proc)
{
    SwapUnitStats(GetUnitFromCharId(0x100), GetUnitFromCharId(0x100));
}

void sub_8085550(struct EventEngineProc *proc)
{
    sub_800915C(-1, 2, 0x20, 4, 0x180, 0x180, 0x180, proc);
}

void sub_8085578(struct EventEngineProc *proc)
{
    sub_800915C(-1, 2, 0x20, 4, 0x200, 0x140, 0x140, proc);
}

void sub_80855A0(struct UnkProc80855A0 *proc)
{
    proc->unk4D = 1;
    SetSpecialColorEffectsParameters(3, 0, 0, 16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    sub_8001F48(1);
}

void sub_80855D4(struct EventEngineProc *proc)
{
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_80855F8(struct EventEngineProc *proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void sub_8085618(struct EventEngineProc *proc)
{
    struct Proc8085618 *parent = proc->proc_parent;

    if (-1 == parent->unk4C) {
        if (GetGameClock() % 2)
            gGameState.camera.x ^= 2;
    } else {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetGameClock() & 2, 0);
    }
}

void sub_8085670(struct EventEngineProc *proc)
{
    struct Proc8085618 *parent = proc->proc_parent;

    if (-1 == parent->unk4C) {
        if (GetGameClock() % 2) {
            (u16)gGameState.camera.x &= 0xFFFD;
            gGameState.camera.x ^= 1;
        }
    } else {
        if (GetGameClock() % 2)
            BG_SetPosition(3, sub_80AEA24(3) ^ 1, 0);
    }
}

void sub_80856D0(struct EventEngineProc *proc)
{
    struct Proc8085618 *parent = proc->proc_parent;

    if (0x36 == parent->unk4C) {
        if (GetGameClock() % 2) {
            BG_SetPosition(3, GetGameClock() & 1, 0);
        }
    } else {
        if (GetGameClock() % 2) {
            (u16)gGameState.camera.y &= 0xFFFD;
            gGameState.camera.y ^= 1;
        }
    }
}

void sub_8085728(struct EventEngineProc *parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE030);
    if (!proc)
        proc = Proc_Start(gUnknown_089EE030, parent);

    Proc_Goto(proc, 0);
    PlaySoundEffect(0x26A);
}

void sub_808576C(struct EventEngineProc *parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc) {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(gUnknown_089EE000, parent);
    }
    Proc_Goto(proc, 0);
}

void sub_80857B0(struct EventEngineProc *parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc) {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(gUnknown_089EE000, parent);
    }
    Proc_Goto(proc, 1);
}

void sub_80857F4(struct EventEngineProc *parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc)
        proc = Proc_Start(gUnknown_089EE000, parent);
    Proc_Goto(proc, 0);
}

void sub_808581C(struct EventEngineProc *parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc)
        proc = Proc_Start(gUnknown_089EE000, parent);
    Proc_Goto(proc, 1);
}

void sub_8085844(struct EventEngineProc *parent)
{
    (u16)gGameState.camera.x &= 0xFFFC;
    Proc_EndEach(gUnknown_089EE000);
    Sound_FadeOutSE(4);
}

void sub_808586C(struct EventEngineProc *parent)
{
    (u16)gGameState.camera.y &= 0xFFFC;
    Proc_EndEach(gUnknown_089EE030);
    Sound_FadeOutSE(4);
}

void sub_8085894(struct EventEngineProc *proc)
{
    proc->unitLoadCount = 0;
}

void sub_808589C(struct EventEngineProc *proc)
{
    struct Proc8085618 *parent = proc->proc_parent;

    if (-1 == parent->unk4C) {
        if (GetGameClock() % 2) {
            (u16)gGameState.camera.x &= 0xFFFD;
            gGameState.camera.x ^= 1;
        }
    } else {
        if (GetGameClock() % 2)
            BG_SetPosition(3, sub_80AEA24(3) ^ 1, 0);
    }

    if (0x10 == ++proc->unitLoadCount) {
        Proc_Break(proc);
        Sound_FadeOutSE(4);
    }
}

void sub_808591C(struct EventEngineProc *proc)
{
    Proc_Start(gUnknown_089EE048, proc);
    PlaySoundEffect(0x26A);
}

void sub_8085948(struct EventEngineProc *proc)
{
    (u16)gGameState.camera.y &= 0xFFFC;
    Sound_FadeOutSE(4);
    Proc_EndEach(gUnknown_089EE048);
}

void SetEventId_0x84(struct EventEngineProc *proc)
{
    SetEventId(0x84);
}

void UnsetEventId_0x84(struct EventEngineProc *proc)
{
    UnsetEventId(0x84);
}

void sub_8085988(struct EventEngineProc *proc)
{
    proc->unitLoadCount = 0;
}

void sub_8085990(struct EventEngineProc *proc)
{
    struct Unit *unit = proc->unit;
    int count = proc->unitLoadCount;
    sub_8026C1C(unit, count);
    
    if (63 == proc->unitLoadCount++) {
        unit->state |= CA_MOUNTEDAID | CA_THIEF;
        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();
        Proc_Break(proc);
    }    
}

void sub_80859D0(ProcPtr *proc, ProcPtr parent)
{
    struct Proc89EE068 *_proc;
    _proc = Proc_Start(gUnknown_089EE068, parent);
    _proc->unk_proc = proc;
}

void nullsub_20()
{
    return;
}

void sub_80859EC(struct Proc89EE088 *proc)
{
    proc->count = 0;
    sub_8081E78();
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWinEnable(1, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetSpecialColorEffectsParameters(2, 0, 0, 0);
    SetPrimaryHBlankHandler(sub_808285C);
    PlaySoundEffect(0x269);
}

void sub_8085ACC(struct Proc89EE088 *proc)
{
    int val0, val1, val2, val3, count, max_count;
    
    val2 = 0x40;
    val1 = 0xF0;

    proc->count += 1;

    val1 = val1 * proc->count * proc->count;
    val0 = 0x1000;
    val1 = val1 / val0;

    val2 = val2 - proc->count;
    val2 = (0x10 * val2 * val2) / val0;
    val3 = 0x10 - val2;

    sub_8082730(0x78, 0x68, val1);
    SetSpecialColorEffectsParameters(2, 0, 0, val3);

    count = proc->count;
    max_count = 0x40;
    if (count >= max_count)
        Proc_Break(proc);
}

void sub_8085B30(struct Proc89EE088 *proc)
{
    ApplyMapChangesById(1);
    EnableMapChange(1);
    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();
    proc->count = 0;
}

/* https://decomp.me/scratch/sgFDG */
void sub_8085B58(struct Proc89EE088 *proc)
{
    int val0, val1, val3, val4, val5, count, max_count;
    register int val2 asm("r5");
    
    val1 = 0x80;
    val2 = 0xF0;

    proc->count += 1;

    val1 = val1 - proc->count;
    val5 = val1 * val2;
    val5 = val5 * val1;
    val4 = 0x4000;
    val2 = val5 / val4;

    val3 = (int)((proc->count *  0x10) *proc->count) / val4;
    val0 = 0x10 - val3;

    sub_8082730(0x78, 0x30, val2);
    SetSpecialColorEffectsParameters(2, 0, 0, val0);

    count = proc->count;
    max_count = 0x80;
    if (count >= max_count)
        Proc_Break(proc);
}

void sub_8085BB4(struct Proc89EE088 *proc)
{
    SetPrimaryHBlankHandler(0);
    SetSpecialColorEffectsParameters(0, 0, 0, 0);
    
    SetWinEnable(0, 0, 0);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
}

void sub_8085BFC(struct EventEngineProc *proc)
{
    Proc_StartBlocking(gUnknown_089EE088, proc);
}

void sub_8085C10()
{
    sub_80A3724(0x100, 0x100, 1);
}

void sub_8085C24()
{
    sub_80A3724(0x100, 0x100, 2);
}

void sub_8085C38()
{
    sub_80A3724(0x100, 0x100, 3);
}

void sub_8085C4C()
{
    InitDungeon(0);
}

void sub_8085C58()
{
    InitDungeon(1);
}

void sub_8085C64(ProcPtr proc)
{
    sub_8085C7C(proc, 1);
}

void sub_8085C70(ProcPtr proc)
{
    sub_8085C7C(proc, 0);
}
