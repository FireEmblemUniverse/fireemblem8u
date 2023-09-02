#include "global.h"

#include "proc.h"
#include "bmunit.h"
#include "popup.h"
#include "bmmap.h"
#include "bm.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "ev_triggercheck.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "mu.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "event.h"

// temp rodata (TODO: move directly into the various functions that use those)
const u8 gUnknown_080D793C[3] = { 0x00, 0x40, 0x80 };

extern struct Unit * gUnknown_03000434;

//! FE8U = 0x0800FD28
u8 Event2E_CheckAt(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    u8 x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    struct Unit * unit;

    switch (subcode)
    {
        case 0:
            if (gBmMapUnit[y][x] != 0)
            {
                unit = GetUnit(gBmMapUnit[y][x]);
            }
            else
            {
                goto _0800FD68;
            }

            break;

        case 1:
            unit = gActiveUnit;
            break;
    }

    if (!unit)
    {
    _0800FD68:
        gEventSlots[0xC] = 0;
    }
    else
    {
        gEventSlots[0xC] = unit->pCharacterData->number;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FD8C
u8 Event2F_MoveUnit(struct EventEngineProc * proc)
{
    s8 xIn;
    s8 yIn;
    u8 subcmd;
    s8 subHi;
    s16 speed;
    u16 direction;
    u16 flags;
    struct Unit * unit;
    struct Unit * targetUnit;
    s16 targetPid;
    s8 xOut;
    s8 yOut;
    void * queue;

    subcmd = EVT_SUB_CMD_LO(proc->pEventCurrent);
    subHi = EVT_SUB_CMD_HI(proc->pEventCurrent);

    speed = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[1]);
    if (!unit)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    xIn = unit->xPos;
    yIn = unit->yPos;

    if (!(unit->state & US_BIT22))
    {
        if (unit->state & US_DEAD)
        {
            return EVC_ADVANCE_CONTINUE;
        }
    }

    switch (subcmd)
    {
        case 0:
            xOut = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            yOut = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;

            queue = NULL;

            break;

        case 1:
            targetPid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            if (targetPid < 0)
            {
                targetPid = 0;
            }

            targetUnit = GetUnitStructFromEventParameter(targetPid);
            if (!targetUnit)
            {
                return EVC_ERROR;
            }

            xOut = targetUnit->xPos;
            yOut = targetUnit->yPos;

            queue = NULL;

            break;

        case 2:
            direction = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            xOut = xIn;
            yOut = yIn;

            switch (direction)
            {
                case 3:
                    yOut--;
                    break;

                case 2:
                    yOut++;
                    break;

                case 0:
                    xOut--;
                    break;

                case 1:
                    xOut++;
                    break;
            }

            queue = NULL;

            break;

        case 3:
            queue = gEventSlotQueue;
            break;
    }

    flags = GetSomeEventEngineMoveRelatedBitfield(proc, subHi);

    BmMapFill(gBmMapOther, 0);

    if (EVENT_IS_SKIPPING(proc) || (speed < 0))
    {
        MoveUnit_(unit, xOut, yOut, flags);
        return EVC_ADVANCE_CONTINUE;
    }

    if (!TryPrepareEventUnitMovement(proc, xIn, yIn))
    {
        return EVC_STOP_YIELD;
    }

    if (queue == NULL)
    {
        sub_8079DDC(unit, xOut, yOut, speed, flags);
    }
    else
    {
        sub_8079D74(unit, queue, gEventSlots[0xD] / 2, flags);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800FF24
u8 Event30_ENUN(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        SetAllMOVEUNITField44To1_();
    }

    if (MuCtrExists() == 1)
    {
        return EVC_STOP_YIELD;
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();
    BmMapFill(gBmMapOther, 0);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800FF68
u8 Event31_DisplayEffectRange(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    switch (EVT_SUB_CMD(proc->pEventCurrent))
    {
        case 0:
            unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
            if (!unit)
            {
                return EVC_ERROR;
            }

            PlaySoundEffect(0x68);

            gUnknown_03000434 = gActiveUnit;
            gActiveUnit = unit;

            HideMoveRangeGraphics();
            DisplayUnitEffectRange(unit);

            break;

        case 1:
            HideMoveRangeGraphics();
            if (gUnknown_03000434 != 0)
            {
                gActiveUnit = gUnknown_03000434;
                gUnknown_03000434 = NULL;
            }

            break;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800FFF8
u8 Event32_SpawnSingleUnit(struct EventEngineProc * proc)
{
    struct UnitDefinition unitDef;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    s8 x = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s8 y = EVT_CMD_ARGV(proc->pEventCurrent)[1] >> 8;

    if (pid == -3)
    {
        pid = gEventSlots[2];
    }

    if ((x < 0) || (y < 0))
    {
        x = ((s16 *)(gEventSlots + 0xB))[0];
        y = ((s16 *)(gEventSlots + 0xB))[1];
    }

    unitDef.charIndex = pid;
    unitDef.classIndex = gCharacterData[pid - 1].defaultClass;
    unitDef.leaderCharIndex = 0;

    unitDef.autolevel = 0;
    unitDef.allegiance = subcmd == 0xF ? 0 : subcmd;
    unitDef.level = gCharacterData[pid - 1].baseLevel;

    unitDef.xPosition = x;
    unitDef.yPosition = y;

    unitDef.genMonster = 0;

    unitDef.itemDrop = 1;
    unitDef.sumFlag = 0;
    unitDef.unk_05_7 = 0;
    unitDef.extraData = 0;

    unitDef.redaCount = 0;

    unitDef.redas = NULL;

    unitDef.items[0] = 0;
    unitDef.items[1] = 0;
    unitDef.items[2] = 0;
    unitDef.items[3] = 0;

    unitDef.ai[0] = 0;
    unitDef.ai[1] = 0;
    unitDef.ai[2] = 0;
    unitDef.ai[3] = 0;

    LoadUnit_800F704(&unitDef, 0, 0, subcmd == 0xf);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010110
u8 Event33_CheckUnitVarious(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    struct Unit * unit = GetUnitStructFromEventParameter(pid);

    switch (subcmd)
    {
        case 0:
            if (unit)
            {
                gEventSlots[0xC] = 1;
            }
            else
            {
                gEventSlots[0xC] = 0;
            }

            break;

        case 1:
            if (!unit)
            {
                return EVC_ERROR;
            }

            gEventSlots[0xC] = unit->pCharacterData->visit_group;

            break;

        case 2:
            if (!unit)
            {
                gEventSlots[0xC] = 0;
                break;
            }

            if (unit->state & US_DEAD)
            {
                gEventSlots[0xC] = 0;
            }
            else
            {
                gEventSlots[0xC] = 1;
            }

            break;

        case 3:
            if (!unit)
            {
                return EVC_ERROR;
            }

            if (unit->state & US_NOT_DEPLOYED)
            {
                gEventSlots[0xC] = 0;
            }
            else
            {
                if (unit->xPos >= 0)
                {
                    gEventSlots[0xC] = 1;
                }
                else
                {
                    gEventSlots[0xC] = 0;
                }
            }

            break;

        case 4:
            if (!unit)
            {
                return EVC_ERROR;
            }

            if (gActiveUnit->pCharacterData->number != pid)
            {
                gEventSlots[0xC] = 0;
            }
            else
            {
                gEventSlots[0xC] = 1;
            }

            break;

        case 5:
            if (!unit)
            {
                return EVC_ERROR;
            }

            switch (UNIT_FACTION(unit))
            {
                case FACTION_BLUE:
                    gEventSlots[0xC] = FACTION_ID_BLUE;
                    break;

                case FACTION_RED:
                    gEventSlots[0xC] = FACTION_ID_RED;
                    break;

                default:
                    gEventSlots[0xC] = FACTION_ID_GREEN;
                    break;
            }

            break;

        case 6:
            if (!unit)
            {
                return EVC_ERROR;
            }

            ((u16 *)(gEventSlots + 0xC))[0] = unit->xPos;
            ((u16 *)(gEventSlots + 0xC))[1] = unit->yPos;

            break;

        case 7:
            if (!unit)
            {
                return EVC_ERROR;
            }

            gEventSlots[0xC] = unit->pClassData->number;

            break;

        case 8:
            if (!unit)
            {
                return EVC_ERROR;
            }

            gEventSlots[0xC] = GetUnitLuck(unit);

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010298
u8 Event34_MessWithUnitState(struct EventEngineProc * proc)
{
    struct Unit * unit;
    u8 subcmd;
    int i;

    // TODO: rodata
    u8 hack[3];
    memcpy(hack, gUnknown_080D793C, 3);

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);

    switch (subcmd)
    {
        case 0xa:
        case 0xb:
        case 0xc:
            break;

        case 0xd:
        case 0xe:
        case 0xf:
            if (!unit)
            {
                return EVC_ADVANCE_CONTINUE;
            }
            break;

        default:
            if (!unit)
            {
                return EVC_ERROR;
            }
            break;
    }

    switch (subcmd)
    {
        case 0:
            unit->state |= (US_HIDDEN | US_BIT16 | US_BIT26);
            break;

        case 1:
            unit->state &= ~(US_HIDDEN | US_BIT16 | US_BIT26);
            break;

        case 2:
        case 3:
        case 4:
            UnitChangeFaction(unit, hack[subcmd - 2]);
            break;

        case 5:
            SetUnitHp(unit, gEventSlots[1]);
            if (gEventSlots[1] == 0)
            {
                unit->state |= US_DEAD;
            }

            break;

        case 6:
            unit->state |= US_UNSELECTABLE;
            break;

        case 7:
            unit->state |= US_HAS_MOVED;
            break;

        case 8:
            switch (gEventSlots[1])
            {
                case 1:
                    unit->state &= ~US_NOT_DEPLOYED;
                    break;

                case 0:
                    unit->state |= US_NOT_DEPLOYED;
                    break;

                case -1:
                    if (unit->state & US_BIT21)
                    {
                        unit->state |= US_NOT_DEPLOYED;
                    }
                    else
                    {
                        unit->state &= ~US_NOT_DEPLOYED;
                    }

                    break;
            }

            break;

        case 9:
            break;

        case 0xa:
            MU_EndAll();

            for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
            {
                struct Unit * it = GetUnit(i);

                if (!UNIT_IS_VALID(it))
                {
                    continue;
                }

                it->state |= US_HIDDEN;
                it->state &= ~US_UNSELECTABLE;
                it->state &= ~(US_RESCUING | US_RESCUED);
            }

            ClearCutsceneUnits();

            break;

        case 0xb:
            MU_EndAll();

            for (i = FACTION_GREEN + 1; i < FACTION_RED; i++)
            {
                struct Unit * it = GetUnit(i);

                if (!UNIT_IS_VALID(it))
                {
                    continue;
                }

                ClearUnit(it);
            }

            break;

        case 0xc:
            MU_EndAll();

            for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
            {
                struct Unit * it = GetUnit(i);

                if (!UNIT_IS_VALID(it))
                {
                    continue;
                }

                ClearUnit(it);
            }

            break;

        case 0xd:
            if (!EVENT_IS_SKIPPING(proc))
            {
                struct MUProc * muProc;

                HideUnitSprite(unit);
                unit->state |= US_HIDDEN;
                muProc = MU_Create(unit);
                MU_SetDefaultFacing_Auto();
                MU_StartDeathFade(muProc);

                return EVC_ADVANCE_YIELD;
            }

            return EVC_ADVANCE_CONTINUE;

        case 0xe:
        {
            s8 a = Proc_Find(gProcScr_MUDeathFade) != 0;
            if (-a | a)
            {
                return EVC_STOP_YIELD;
            }

            // fallthrough
        }

        case 0xf:
            ClearUnit(unit);
            break;
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x080104B0
u8 Event35_UnitClassChanging(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    switch (subcmd)
    {
        case 0:
            if (jid == 0)
            {
                jid = gCharacterData[pid - 1].defaultClass;
            }

            unit->pClassData = GetClassData(jid);

            break;

        case 1:
        {
            s16 r4 = jid;
            jid = unit->pClassData->number;

            unit->pClassData = GetClassData(gCharacterData[r4 - 1].defaultClass);

            unit = GetUnitFromCharId(r4);
            if (!unit)
            {
                return EVC_ADVANCE_CONTINUE;
            };

            unit->pClassData = GetClassData(jid);

            break;
        }
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0801053C
u8 Event36_CheckInArea(struct EventEngineProc * param_1)
{
    u16 pid;
    s8 x1, y1, x2, y2;
    u8 ret;
    struct Unit * unit;

    pid = EVT_CMD_ARGV(param_1->pEventCurrent)[0];

    x1 = EVT_CMD_ARGV(param_1->pEventCurrent)[1];
    y1 = EVT_CMD_ARGV(param_1->pEventCurrent)[1] >> 8;

    x2 = x1 + ((u16 *)EVT_CMD_ARGV(param_1->pEventCurrent))[2] - 1;
    y2 = y1 + (((u16 *)EVT_CMD_ARGV(param_1->pEventCurrent))[2] >> 8) - 1;

    unit = GetUnitStructFromEventParameter(pid);

    gEventSlots[0xc] = ret = 0;
    if (unit->xPos < x1) return ret;
    if (x2 >= unit->xPos && unit->yPos >= y1 && y2 >= unit->yPos)
        gEventSlots[0xc] = 1;

    ret = 0;
    return ret;
}

// TODO: Give this a more human name (EventCmd_GiveItem?)

//! FE8U = 0x080105A4
u8 Event37_GiveItem(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * target = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

    if (!target)
    {
        return EVC_ERROR;
    }

    switch (subcmd)
    {
        case 0:
            NewPopup_ItemGot(proc, target, gEventSlots[3]);

            break;

        case 1:
            NewPopup_GoldGot(proc, target, gEventSlots[3]);

            break;

        case 2:
        {
            s32 gold = GetPartyGoldAmount() - gEventSlots[3];
            if (gold < 0)
            {
                gold = 0;
            }
            SetPartyGoldAmount(gold);

            break;
        }
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010618
u8 Event38_ChangeActiveUnit(struct EventEngineProc * proc)
{
    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);

    if (!unit)
    {
        return EVC_ERROR;
    }

    ClearActiveUnit(unit);
    gActiveUnit = unit;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010644
u8 Event39_ChangeAiScript(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    u8 r7 = gEventSlots[1];

    u8 ai1 = (gEventSlots[1] >> 8);
    u8 ai2 = (gEventSlots[1] >> 16);

    switch (subcmd)
    {
        case 0:
        {
            u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

            if (EVT_CMD_ARGV(proc->pEventCurrent)[0] < 0)
            {
                unitId = gEventSlots[2];
            }

            sub_8011D10(unitId, r7, ai1, ai2);

            break;
        }
        case 1:
        {
            struct Unit * unit;

            s8 x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            s8 y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if (x < 0 || y < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            if (gBmMapUnit[y][x] != 0)
            {
                unit = GetUnit(gBmMapUnit[y][x]);
            }
            else
            {
                unit = NULL;
            }

            sub_8011CCC(unit, r7, ai1, ai2);

            break;
        }
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x080106E4
u8 Event3A_DisplayPopup(struct EventEngineProc * proc)
{
    s16 textId;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    textId = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (textId < 0)
    {
        textId = gEventSlots[2];
    }

    switch (subcmd)
    {
        case 0:
        {
            u16 songId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
            NewPopup_VerySimple(textId, songId, proc);
            break;
        }

        case 1:
        {
            u8 x = EVT_CMD_ARGV(proc->pEventCurrent)[2];
            u8 y = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;
            sub_8011C94(textId, x, y, proc);
            break;
        }
    }

    return EVC_ADVANCE_YIELD;
}

struct MapCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ u16 unk_68;
    /* 6A */ u16 unk_6a;
};

// Implicit?
u16 sub_8010E6C(int x, int y, int counter);

//! FE8U = 0x08010748
void sub_8010748(struct MapCursorProc * proc)
{
    switch (proc->unk_68 & 0xc)
    {
        case 0:
            PutMapCursor(proc->unk_64 * 16, proc->unk_66 * 16, 0);
            break;

        case 4:
            proc->unk_6a = sub_8010E6C(proc->unk_64, proc->unk_66, proc->unk_6a);
            break;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591F08[] =
{
    PROC_REPEAT(sub_8010748),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0801079C
u8 Event3B_DisplayCursor(struct EventEngineProc * proc)
{
    struct MapCursorProc * childProc;
    struct Unit * unit;
    u8 subcmd;
    s8 x;
    s8 y;

    if (EVENT_IS_SKIPPING(proc))
    {
        Proc_EndEach(gUnknown_08591F08);
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd & 3)
    {
        case 0:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if (x < 0 || y < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            break;

        case 1:
            unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
            if (!unit)
            {
                return EVC_ERROR;
            }

            x = unit->xPos;
            y = unit->yPos;

            break;

        case 2:
            Proc_EndEach(gUnknown_08591F08);
            return EVC_ADVANCE_YIELD;
    }

    childProc = Proc_Start(gUnknown_08591F08, proc);
    childProc->unk_64 = x;
    childProc->unk_66 = y;
    childProc->unk_68 = subcmd;
    childProc->unk_6a = 0;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010850
u8 Event3C_(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;

    switch (EVT_SUB_CMD(proc->pEventCurrent))
    {
        case 0:
            ((u16 *)(gEventSlots + 0xC))[0] = gBmSt.playerCursor.x;
            ((u16 *)(gEventSlots + 0xC))[1] = gBmSt.playerCursor.y;

            break;

        case 1:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if ((x < 0) || (y < 0))
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            SetCursorMapPosition(x, y);

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

int Get8(void);

//! FE8U = 0x080108AC
u8 Event3D_(struct EventEngineProc * proc)
{
    u8 i;
    u16 bit;

    // clang-format off

    u8 gUnknown_080D793F[15] =
    {
        0x4F, 0x51, 0x6B, 0x63, 0x64,
        0x5C, 0x5A, 0x67, 0x37, 0x68,
        0x69, 0x5B, 0x5F, 0x71, 0x78,
    };

    u8 gUnknown_080D794E[5] =
    {
        0x49, 0x4A, 0x4B, 0x4C, 0x4D,
    };

    // clang-format on

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u16 flags = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    ResetMenuOverrides();

    bit = 1;

    switch (subcmd)
    {
        case 0:
            for (i = 0; i < ARRAY_COUNT(gUnknown_080D793F); i++)
            {
                if (flags & bit)
                {
                    AddMenuOverride(gUnknown_080D793F[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysNotShown);
                }

                bit <<= 1;
            }

            break;

        case 1:
            for (i = 0; i < ARRAY_COUNT(gUnknown_080D794E); i++)
            {
                if (flags & bit)
                {
                    AddMenuOverride(gUnknown_080D794E[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysDisabled);
                    AddMenuOverride(gUnknown_080D794E[i], MENU_OVERRIDE_ONSELECT, Get8);
                }

                bit <<= 1;
            }

            break;

        case 2:
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010968
u8 Event3E_PrepScreenCall(struct EventEngineProc * proc)
{
    HideAllUnits();
    ClearFlag(0x84);
    Proc_StartBlocking(gProcScr_SALLYCURSOR, proc);

    return EVC_ADVANCE_YIELD;
}

extern struct BattleHit gUnknown_0203A974[];

//! FE8U = 0x0801098C
struct BattleHit * sub_801098C(void)
{
    u8 i;

    u32 * queueIt = gEventSlotQueue;
    struct BattleHit * bhIt = gUnknown_0203A974;

    for (i = 0; i < gEventSlots[0xd] && ((u8 *)(queueIt))[0] != 0xff; bhIt++, queueIt++, i++)
    {
        bhIt->attributes = ((u16 *)(queueIt))[1];

        bhIt->info = 0;

        if (i == 0)
        {
            bhIt->info |= BATTLE_HIT_INFO_BEGIN;
        }

        if (((u8 *)(queueIt))[0] == 1)
        {
            bhIt->info |= BATTLE_HIT_INFO_RETALIATION;
        }

        bhIt->hpChange = ((u8 *)(queueIt))[1];
    }

    bhIt->info = BATTLE_HIT_INFO_END;

    return gUnknown_0203A974;
}

struct ScriptedBattleProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * unk_58;
    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 unk_64;
};

//! FE8U = 0x08010A28
void sub_8010A28(struct ScriptedBattleProc * proc)
{
    if (proc->unk_64 == GetGameLock())
    {
        sub_80121D4();
        Proc_SetMark(proc->unk_58, PROC_MARK_6);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591F18[] =
{
    PROC_REPEAT(sub_8010A28),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08010A58
u8 Event3F_(struct EventEngineProc * proc)
{
    struct BattleHit * hits;
    struct ScriptedBattleProc * childProc;
    struct Unit * unitA;
    struct Unit * unitB;
    s8 unkA;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    s16 charIdA = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 charIdB = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u8 unkB = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u8 unkC = EVT_CMD_ARGV(proc->pEventCurrent)[2] >> 8;

    if (gEventSlots[0xd] == 0)
    {
        hits = NULL;
    }
    else
    {
        hits = sub_801098C();
    }

    switch (subcmd)
    {
        case 0:
        case 1:
            if (charIdA < 0)
            {
                charIdA = -2;
            }

            if (charIdB < 0)
            {
                charIdB = -2;
            }

            unitA = GetUnitStructFromEventParameter(charIdA);
            unitB = GetUnitStructFromEventParameter(charIdB);

            if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            {
                unkA = 0;
            }
            else
            {
                unkA = 1;
                childProc = Proc_StartBlocking(gUnknown_08591F18, proc);
                childProc->unk_58 = proc;
                childProc->unk_64 = GetGameLock();
                Proc_SetMark(proc, PROC_MARK_7);
            }

            sub_8011F5C(unitA, unitB, unkC, unkA, unkB, hits, -subcmd || subcmd);

            return EVC_ADVANCE_YIELD;

        case 2:
            SetScriptedBattle(hits);
            return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ERROR;
}

struct Event40Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * unk_58;
    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 unk_64;
};

//! FE8U = 0x08010B48
void sub_8010B48(struct Event40Proc * proc)
{
    if (proc->unk_64 == GetGameLock())
    {
        sub_8012324();
        Proc_SetMark(proc->unk_58, PROC_MARK_6);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08591F28[] =
{
    PROC_REPEAT(sub_8010B48),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08010B78
u8 Event40_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    s16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 itemId = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    struct Event40Proc * childProc = Proc_StartBlocking(gUnknown_08591F28, proc);
    childProc->unk_58 = proc;
    childProc->unk_64 = GetGameLock();

    Proc_SetMark(proc, PROC_MARK_7);

    unit = GetUnitStructFromEventParameter(pid);
    SetUnitStatus(unit, 0);
    sub_8012270(unit, jid, itemId);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010BEC
u8 Event41_(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd)
    {
        case 0:
        case 1:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0];

            if (x < 0)
            {
                x = ((u16 *)(gEventSlots + 0xB))[0];
                y = ((u16 *)(gEventSlots + 0xB))[1];
            }

            if (!(proc->evStateBits & EV_STATE_0040))
            {
                StartEventWarpAnim_ret(proc, x, y, subcmd, 1);
            }
            else
            {
                StartEventWarpAnim_ret(proc, x, y, subcmd, 0);
            }

            break;

        case 0xf:
            if (EventWarpAnimExists_ret() == 1)
            {
                return EVC_STOP_YIELD;
            }

            break;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010C70
u8 Event42_(struct EventEngineProc * proc)
{
    u8 c;

    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    u8 a = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u8 b = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    switch (subcmd)
    {
        case 0:
            if (EVENT_IS_SKIPPING(proc))
            {
                return EVC_ADVANCE_CONTINUE;
            }

            switch (proc->activeTextType)
            {
                case 0:
                case 3:
                case 4:
                    subcmd = 0;
                    break;

                case 1:
                    subcmd = 1;
                    break;

                case 2:
                case 5:
                    return EVC_ERROR;
            }

            sub_8012C34(subcmd, a, b);

            break;

        case 0xf:
            sub_8012C88();
            break;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x08010CF0
u8 Event43_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    sub_8080E9C(proc, unit);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010D28
u8 Event44_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    sub_8012CFC(unit, proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x08010D5C
u8 Event45_(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EVC_ERROR;
    }

    switch (subcmd)
    {
        case 0:
            if (!EVENT_IS_SKIPPING(proc))
            {
                sub_8081020(proc, unit);
            }

            break;

        case 0xf:
            if (!EVENT_IS_SKIPPING(proc))
            {
                sub_80811D0(proc, 0x78);
                return EVC_ADVANCE_YIELD;
            }

            sub_8081068();

            break;
    }

    return EVC_ADVANCE_CONTINUE;
}
