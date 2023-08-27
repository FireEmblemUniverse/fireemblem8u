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

#include "event.h"

// TODO: Give this a more human name (EventCmd_GiveItem?)

//! FE8U = 0x080105A4
u8 Event37_GiveItem(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * target = GetUnitStructFromEventParameter(proc->pEventCurrent[1]);

    if (!target)
    {
        return EV_RET_ERR;
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

    return EV_RET_2;
}

//! FE8U = 0x08010618
u8 Event38_ChangeActiveUnit(struct EventEngineProc * proc)
{
    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);

    if (!unit)
    {
        return EV_RET_ERR;
    }

    ClearActiveUnit(unit);
    gActiveUnit = unit;

    return EV_RET_DEFAULT;
}

// Event39_ChangeAiScript

//! FE8U = 0x08010644
u8 Event39_(struct EventEngineProc * proc)
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

    return EV_RET_DEFAULT;
}

// Event3A_DisplayPopup

//! FE8U = 0x080106E4
u8 Event3A_(struct EventEngineProc * proc)
{
    s16 textId;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EV_RET_DEFAULT;
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

    return EV_RET_2;
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

extern u16 gUnknown_030004E4[];
extern struct ProcCmd gUnknown_08591F08[];

// Event3B_DisplayCursor

//! FE8U = 0x0801079C
u8 Event3B_(struct EventEngineProc * proc)
{
    struct MapCursorProc * childProc;
    struct Unit * unit;
    u8 subcmd;
    s8 x;
    s8 y;

    if (EVENT_IS_SKIPPING(proc))
    {
        Proc_EndEach(gUnknown_08591F08);
        return EV_RET_DEFAULT;
    }

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    switch (subcmd & 3)
    {
        case 0:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if (x < 0 || y < 0)
            {
                x = gUnknown_030004E4[0];
                y = gUnknown_030004E4[1];
            }

            break;

        case 1:
            unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
            if (!unit)
            {
                return EV_RET_ERR;
            }

            x = unit->xPos;
            y = unit->yPos;

            break;

        case 2:
            Proc_EndEach(gUnknown_08591F08);
            return EV_RET_2;
    }

    childProc = Proc_Start(gUnknown_08591F08, proc);
    childProc->unk_64 = x;
    childProc->unk_66 = y;
    childProc->unk_68 = subcmd;
    childProc->unk_6a = 0;

    return EV_RET_DEFAULT;
}

extern u16 gUnknown_030004E8[];

//! FE8U = 0x08010850
u8 Event3C_(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;

    switch (EVT_SUB_CMD(proc->pEventCurrent))
    {
        case 0:
            gUnknown_030004E8[0] = gBmSt.playerCursor.x;
            gUnknown_030004E8[1] = gBmSt.playerCursor.y;

            break;

        case 1:
            x = EVT_CMD_ARGV(proc->pEventCurrent)[0];
            y = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

            if ((x < 0) || (y < 0))
            {
                x = gUnknown_030004E4[0];
                y = gUnknown_030004E4[1];
            }

            SetCursorMapPosition(x, y);

            break;
    }

    return EV_RET_DEFAULT;
}

extern u8 gUnknown_080D793F[];
extern u8 gUnknown_080D794E[];

int Get8(void);

//! FE8U = 0x080108AC
u8 Event3D_(struct EventEngineProc * proc)
{
    u8 subcmd;
    u8 i;
    u16 bit;
    u16 flags;
    u8 local_30[15];
    u8 local_20[5];

    memcpy(local_30, gUnknown_080D793F, 0xf);
    memcpy(local_20, gUnknown_080D794E, 5);

    subcmd = EVT_SUB_CMD(proc->pEventCurrent);
    flags = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    ResetMenuOverrides();

    bit = 1;

    switch (subcmd)
    {
        case 0:
            for (i = 0; i < 0xf; i++)
            {
                if ((flags & bit) != 0)
                {
                    AddMenuOverride(local_30[i], 1, MenuAlwaysNotShown);
                }

                bit <<= 1;
            }

            break;

        case 1:
            for (i = 0; i < 5; i++)
            {
                if ((flags & bit) != 0)
                {
                    AddMenuOverride(local_20[i], 1, MenuAlwaysDisabled);
                    AddMenuOverride(local_20[i], 2, Get8);
                }

                bit <<= 1;
            }

            break;

        case 2:
            break;
    }

    return EV_RET_DEFAULT;
}

//! FE8U = 0x08010968
u8 Event3E_PrepScreenCall(struct EventEngineProc * proc)
{
    HideAllUnits();
    ClearFlag(0x84);
    Proc_StartBlocking(gProcScr_SALLYCURSOR, proc);

    return EV_RET_2;
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

extern struct ProcCmd gUnknown_08591F18[];

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

            return EV_RET_2;

        case 2:
            SetScriptedBattle(hits);
            return EV_RET_DEFAULT;
    }

    return EV_RET_ERR;
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

extern struct ProcCmd gUnknown_08591F28[];

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

    return EV_RET_2;
}

//! FE8U = 0x08010BEC
u8 Event41_(struct EventEngineProc * proc)
{
    s8 x;
    s8 y;
    u8 subcmd;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EV_RET_DEFAULT;
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
                x = gUnknown_030004E4[0];
                y = gUnknown_030004E4[1];
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
                return EV_RET_3;
            }

            break;
    }

    return EV_RET_2;
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
                return EV_RET_DEFAULT;
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
                    return EV_RET_ERR;
            }

            sub_8012C34(subcmd, a, b);

            break;

        case 0xf:
            sub_8012C88();
            break;
    }

    return EV_RET_DEFAULT;
}

//! FE8U = 0x08010CF0
u8 Event43_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EV_RET_DEFAULT;
    }

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EV_RET_ERR;
    }

    sub_8080E9C(proc, unit);
    return EV_RET_2;
}

//! FE8U = 0x08010D28
u8 Event44_(struct EventEngineProc * proc)
{
    struct Unit * unit;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EV_RET_DEFAULT;
    }

    unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EV_RET_ERR;
    }

    sub_8012CFC(unit, proc);

    return EV_RET_2;
}

//! FE8U = 0x08010D5C
u8 Event45_(struct EventEngineProc * proc)
{
    u8 subcmd = EVT_SUB_CMD(proc->pEventCurrent);

    struct Unit * unit = GetUnitStructFromEventParameter(EVT_CMD_ARGV(proc->pEventCurrent)[0]);
    if (!unit)
    {
        return EV_RET_ERR;
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
                return EV_RET_2;
            }

            sub_8081068();

            break;
    }

    return EV_RET_DEFAULT;
}
