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

struct UnkProc80855A0 {
    u8 _pad_[0x4D];
    u8 unk4D;
};

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
