#include "global.h"

#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "hardware.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "rng.h"
#include "bmtrick.h"

#include "muctrl.h"

/**
* "MuCtr" proc and related functions
* Handles REDA Interpretation
*/

//! FE8U = 0x08079CD8
struct REDA * CopyEventMoveREDAs(const struct REDA * redas, u8 count)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (((gEventREDAs.usedBuffers >> i) & 1) == 0)
        {
            struct REDA * buffer = gEventREDAs.buf[i];

            while (count != 0)
            {
                *buffer++ = *redas++;
                count--;
            }

            gEventREDAs.usedBuffers |= (1 << i);
            return gEventREDAs.buf[i];
        }
    }
}

//! FE8U = 0x08079D40
void ClearEventMoveBuffer(const struct REDA * redas)
{
    u8 i;
    for (i = 0; i < 4; i++)
    {
        if (gEventREDAs.buf[i] == redas)
        {
            gEventREDAs.usedBuffers &= ~(1 << i);
            return;
        }
    }
}

//! FE8U = 0x08079D74
void MuCtr_StartDefinedMove(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct MuCtrlProc * proc = Proc_Start(ProcScr_MuCtrl, PROC_TREE_5);
    switch (count) {
    case 0:
        redas = NULL;
        break;

    case 1:
        proc->reda_cur = *redas;
        redas = &proc->reda_cur;
        break;

    default:
        redas = CopyEventMoveREDAs(redas, count);
        break;
    }

    MuCtr_InitDefinedMove(proc, unit, redas, count, flags);
}

//! FE8U = 0x08079DDC
void MuCtr_StartMoveTowards(struct Unit * unit, s8 x, s8 y, u8 flagsA, u16 flagsB)
{
    struct REDA * reda;
    int x_;
    int y_;

    struct MuCtrlProc * proc = Proc_Start(ProcScr_MuCtrl, PROC_TREE_5);

    reda = &proc->reda_cur;

    x_ = x;
    reda->x = x_;
    y_ = y;
    reda->y = y_;

    reda->flags = flagsA;

    reda->a = 0;
    reda->b = 0;
    reda->delayFrames = 0;

    MuCtr_InitDefinedMove(proc, unit, reda, 1, flagsB);
}

//! FE8U = 0x08079E78
void MuCtr_InitDefinedMove(struct MuCtrlProc * proc, struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct Vec2 pos;
    const struct REDA * reda;
    s8 x = unit->xPos;
    s8 y = unit->yPos;

    // ????
    reda = &redas[count + 1];
    reda -= 2;

    pos.x = reda->x;
    pos.y = reda->y;

    AdjustNewUnitPosition(unit, &pos, flags);

    proc->unit = unit;
    proc->muProc = StartMu(unit);
    proc->redas = redas;
    proc->redaCount = count;
    proc->timer = 0;
    proc->delayFrames = redas->delayFrames;
    proc->flags = flags;
    proc->x = pos.x;
    proc->y = pos.y;
    proc->unk_42 = x;
    proc->unk_43 = y;

    HideUnitSprite(unit);

    unit->state |= US_HIDDEN;

    if (gBmMapUnit[unit->yPos][unit->xPos] == (u8)unit->index)
    {
        gBmMapUnit[unit->yPos][unit->xPos] = 0;
    }

    gBmMapOther[y][x] = 0;
    gBmMapOther[pos.y][pos.x] = unit->pCharacterData->number;

    HideMu(proc->muProc);
}

//! FE8U = 0x08079F84
s8 MuCtrExists(void)
{
    return Proc_Find(ProcScr_MuCtrl) ? 1 : 0;
}

//! FE8U = 0x08079F9C
void SetMuMaxWalkSpeed_(void)
{
    SetMuMaxWalkSpeed();
}

//! FE8U = 0x08079FA8
void MoveUnitExt(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct Vec2 pos;

    const struct REDA * reda = redas - 1 + count;

    pos.x = reda->x;
    pos.y = reda->y;

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    AdjustNewUnitPosition(unit, &pos, flags);

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    UnitFinalizeMovement(unit);

    if (!(unit->state & US_UNDER_A_ROOF))
    {
        unit->state &= ~US_HIDDEN;
        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }
}

//! FE8U = 0x0807A014
void MoveUnit_(struct Unit * unit, s8 x, s8 y, u16 flags)
{
    struct REDA reda;

    reda.x = x;
    reda.y = y;

    MoveUnitExt(unit, &reda, 1, flags);
}

//! FE8U = 0x0807A054
void GenUnitDefinitionFinalPosition(const struct UnitDefinition * def, s8 * xOut, s8 * yOut, s8 findNearest)
{
    struct Unit * unit;
    const struct REDA * reda;
    struct Vec2 pos;

    if (def->redaCount != 0)
    {
        u32 tmp = (-findNearest | findNearest);
        u16 flags = tmp >> 0x1f;

        if (def->sumFlag != 0)
        {
            flags |= 2;
        }

        unit = GetUnit(def->charIndex);

        reda = (struct REDA *)(def->redas) - 1 + def->redaCount;

        pos.x = reda->x;
        pos.y = reda->y;

        AdjustNewUnitPosition(unit, &pos, flags);
        *xOut = pos.x;
        *yOut = pos.y;
    }
    else
    {
        *xOut = def->xPosition;
        *yOut = def->yPosition;
    }

    return;
}

//! FE8U = 0x0807A0E4
s8 sub_807A0E4(struct MuCtrlProc * proc)
{
    const struct REDA * reda = proc->redas + proc->timer;

    SortMus();

    if (proc->muProc->fast_walk_b != 0)
    {
        Proc_Goto(proc, 1);
        return false;
    }

    if (sub_807A294(reda->a, reda->b) == 1)
    {
        if (gKeyStatusPtr->heldKeys & A_BUTTON)
            proc->delayFrames -= 4;
        else
            proc->delayFrames--;

        if (proc->delayFrames < 1)
        {
            MuCtr_ExecREDA_807A358(proc);
            return false;
        }
    }

    if (proc->timer != 0)
    {
        struct Unit * unit = proc->unit;

        ShowUnitSprite(unit);
        unit->state &= ~US_HIDDEN;
        HideMu(proc->muProc);
        gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
        RefreshUnitSprites();
    }

    return true;
}

//! FE8U = 0x0807A194
bool sub_807A194(struct MuCtrlProc * proc)
{
    struct MuProc * muProc = proc->muProc;

    SortMus();

    if (!IsMuActive(muProc))
    {
        struct Unit * unit = proc->unit;
        unit->xPos = proc->unk_42;
        unit->yPos = proc->unk_43;

        proc->timer++;

        if ((proc->timer < proc->redaCount && muProc->fast_walk_b == 0))
        {
            proc->delayFrames = (proc->timer + proc->redas)->delayFrames;
            return false;
        }

        Proc_Goto(proc, 1);
        return false;
    }

    return true;
}

//! FE8U = 0x0807A1FC
void MuCtr_OnEnd(struct MuCtrlProc * proc)
{
    struct MuProc * muProc = proc->muProc;
    struct Unit * unit = proc->unit;

    if ((muProc->fast_walk_b != 0) && (proc->redaCount != 0))
    {
        MoveUnit_(unit, proc->x, proc->y, proc->flags & 0xFFFE);
    }
    else
    {
        unit->xPos = proc->x;
        unit->yPos = proc->y;
        UnitFinalizeMovement(unit);

        ShowUnitSprite(unit);
        unit->state &= ~US_HIDDEN;

        gBmMapUnit[unit->yPos][unit->xPos] = unit->index;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }

    MU_End(muProc);
    SortMus();

    ClearEventMoveBuffer(proc->redas);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_MuCtrl[] =
{
    PROC_NAME("E_MuCtr"),
    PROC_SET_END_CB(MuCtr_OnEnd),
    PROC_YIELD,

    PROC_WHILE(sub_807A0E4),

PROC_LABEL(0),
    PROC_WHILE(sub_807A194),
    PROC_WHILE(sub_807A0E4),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0807A294
s8 sub_807A294(u8 pid, u16 b)
{
    if (pid == 0)
    {
        return true;
    }

    gUnknown_03001C35 = pid;
    gUnknown_03001C34 = true;

    Proc_ForEach(ProcScr_MuCtrl, (ProcFunc)sub_807A300);

    if ((gUnknown_03001C34 == 0) && (b != 0xFFFF))
    {
        gUnknown_03001C36 = b;
        gUnknown_03001C34 = 0;
        Proc_ForEach(ProcScr_MuCtrl, (ProcFunc)sub_807A324);
    }

    return gUnknown_03001C34;
}

//! FE8U = 0x0807A300
void sub_807A300(struct MuCtrlProc * proc)
{
    if (proc->unit->pCharacterData->number == gUnknown_03001C35)
        gUnknown_03001C34 = 0;
}

//! FE8U = 0x0807A324
void sub_807A324(struct MuCtrlProc * proc)
{
    if (proc->unit->pCharacterData->number == gUnknown_03001C35 && gUnknown_03001C36 < proc->timer)
        gUnknown_03001C34 = true;
}

//! FE8U = 0x0807A358
void MuCtr_ExecREDA_807A358(struct MuCtrlProc * proc)
{
    u8 * commands;
    u8 config;
    struct Vec2 pos;

    struct Unit * unit = proc->unit;
    const struct REDA * reda = proc->redas + proc->timer;
    u16 flagsA = proc->flags;
    int flagsB = flagsA;

    gBmMapOther[proc->y][proc->x] = 0;

    if (proc->timer < (proc->redaCount - 1))
    {
        pos.x = reda->x;
        pos.y = reda->y;
        flagsB &= 0xfffe;
    }
    else
    {
        pos.x = proc->x;
        pos.y = proc->y;

        if ((flagsA & 2) != 0)
        {
            flagsB &= 0xfffe;
        }
    }

    commands = sub_807A644(unit, &pos, flagsB & 1);

    gBmMapOther[proc->y][proc->x] = unit->pCharacterData->number;

    if ((proc->unk_42 != pos.x) || (proc->unk_43 != pos.y))
    {
        struct MuProc * muProc = proc->muProc;

        ShowMu(muProc);
        SetMuMoveScript(muProc, commands);

        config = reda->flags;

        if ((flagsB & 8) != 0)
        {
            config |= 0x40;
        }

        SetMuConfig(muProc, config);

        if ((flagsB & 4) != 0)
        {
            EnableMuCamera(muProc);
        }
        else
        {
            DisableMuCamera(muProc);
        }

        HideUnitSprite(unit);
        unit->state |= US_HIDDEN;

        if (gBmMapUnit[unit->yPos][unit->xPos] == (u8)unit->index)
        {
            gBmMapUnit[unit->yPos][unit->xPos] = 0;
        }

        RefreshUnitSprites();

        proc->unk_42 = pos.x;
        proc->unk_43 = pos.y;
    }

    return;
}

//! FE8U = 0x0807A4E8
void AdjustNewUnitPosition(struct Unit * unit, struct Vec2 * pos, u16 flags)
{
    struct Vec2 buf[8];

    if ((flags & 2) != 0)
    {
        s8 ix;
        s8 iy;

        u8 idx = 0;

        GenerateExtendedMovementMapOnRange(pos->x, pos->y, GetUnitMovementCost(unit));

        for (iy = -1; iy <= 1; iy++)
        {
            for (ix = -1; ix <= 1; ix++)
            {
                s8 xCur = pos->x + ix;
                s8 yCur = pos->y + iy;

                if ((ix == 0) && (iy == 0))
                    continue;

                if (gBmMapUnit[yCur][xCur] != 0)
                    continue;

                if (gBmMapOther[yCur][xCur] != 0)
                    continue;

                if (gBmMapHidden[yCur][xCur] != 0)
                    continue;

                if (gMapRangeSigned[yCur][xCur] < 0)
                    continue;

                buf[idx].x = xCur;
                buf[idx].y = yCur;

                idx++;
            }
        }

        if (idx != 0)
        {
            u8 random = NextRN_N(idx);
            pos->x = buf[random].x;
            pos->y = buf[random].y;
        }
    }
    else
    {
        if ((flags & 1) != 0)
        {
            if (gBmMapTerrain[(s8)pos->y][(s8)pos->x] != 0)
            {
                AiGetUnitClosestValidPosition(unit, (s8)pos->x, (s8)pos->y, pos);
            }
        }
    }

    return;
}

//! FE8U = 0x0807A644
u8 * sub_807A644(struct Unit * unit, struct Vec2 * pos, s8 flag)
{
    s8 terrainFlag;

    s8 x = pos->x;
    s8 y = pos->y;

    if (flag == 0)
    {
        GenerateExtendedMovementMapOnRange(unit->xPos, unit->yPos, unit->pClassData->pMovCostTable[0]);
        GenerateBestMovementScript(x, y, gWorkingMovementScript);
    }
    else
    {
        DisableAllLightRunes();

        if (gBmMapTerrain[y][x] == 0)
        {
            gBmMapTerrain[y][x] = 1;
            terrainFlag = 1;
        }
        else
        {
            AiGetUnitClosestValidPosition(unit, x, y, pos);
            x = pos->x;
            y = pos->y;
            terrainFlag = 0;
        }

        GenerateExtendedMovementMapOnRange(unit->xPos, unit->yPos, unit->pClassData->pMovCostTable[0]);
        GenerateBestMovementScript(x, y, gWorkingMovementScript);

        if (terrainFlag != 0)
        {
            gBmMapTerrain[y][x] = 0;
        }

        EnableAllLightRunes();
    }

    return gWorkingMovementScript;
}
