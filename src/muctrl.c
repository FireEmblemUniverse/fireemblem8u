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

/**
* "MuCtr" proc and related functions
* Handles REDA Interpretation
*/

struct REDABuffer
{
    u8 usedBuffers;
    struct REDA buf[4][0x10];
};

struct REDABuffer gUnknown_03001A30;

struct MuCtrlProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MUProc * muProc;
    /* 34 */ const struct REDA * redas;
    /* 38 */ u16 redaCount;
    /* 3A */ u16 unk_3a;
    /* 3C */ s16 delayFrames;
    /* 3E */ u16 flags;
    /* 40 */ s8 unk_40;
    /* 41 */ s8 unk_41;
    /* 42 */ s8 unk_42;
    /* 43 */ s8 unk_43;
    /* 44 */ struct REDA unk_44;
};

extern struct ProcCmd gUnknown_089A2DB0[];

void MuCtr_SetupWithEventMoveBuffer(struct MuCtrlProc * proc, struct Unit * unit, const struct REDA * redas, s16 count, u16 flags);
void GetAdjustedPositionForNewUnit(struct Unit *, struct Vec2 *, u16);

void sub_8079FA8(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags);

s8 sub_807A294(u8 pid, u16 b);
void sub_807A358(struct MuCtrlProc *);

void sub_807A300(struct MuCtrlProc *);
void sub_807A324(struct MuCtrlProc *);
u8 * sub_807A644(struct Unit * unit, struct Vec2 * pos, s8 flag);

extern s8 gUnknown_03001C34;
extern u8 gUnknown_03001C35;
extern u16 gUnknown_03001C36;

//! FE8U = 0x08079CD8
struct REDA * CopyEventMoveToBuffer(const struct REDA * redas, u8 count)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (((gUnknown_03001A30.usedBuffers >> i) & 1) == 0)
        {
            struct REDA * buffer = gUnknown_03001A30.buf[i];

            while (count != 0)
            {
                *buffer++ = *redas++;
                count--;
            }

            gUnknown_03001A30.usedBuffers |= (1 << i);
            return gUnknown_03001A30.buf[i];
        }
    }
}

//! FE8U = 0x08079D40
void ClearEventMoveBuffer(const struct REDA * redas)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gUnknown_03001A30.buf[i] == redas)
        {
            gUnknown_03001A30.usedBuffers &= ~(1 << i);
            return;
        }
    }

    return;
}

//! FE8U = 0x08079D74
void sub_8079D74(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct MuCtrlProc * proc = Proc_Start(gUnknown_089A2DB0, PROC_TREE_5);

    switch (count)
    {
        case 0:
            redas = NULL;
            break;

        case 1:
            proc->unk_44 = *redas;
            redas = &proc->unk_44;
            break;

        default:
            redas = CopyEventMoveToBuffer(redas, count);
            break;
    }

    MuCtr_SetupWithEventMoveBuffer(proc, unit, redas, count, flags);

    return;
}

//! FE8U = 0x08079DDC
void sub_8079DDC(struct Unit * unit, s8 x, s8 y, u8 flagsA, u16 flagsB)
{
    struct REDA * reda;
    int x_;
    int y_;

    struct MuCtrlProc * proc = Proc_Start(gUnknown_089A2DB0, PROC_TREE_5);

    reda = &proc->unk_44;

    x_ = x;
    reda->x = x_;
    y_ = y;
    reda->y = y_;

    reda->flags = flagsA;

    reda->a = 0;
    reda->b = 0;
    reda->delayFrames = 0;

    MuCtr_SetupWithEventMoveBuffer(proc, unit, reda, 1, flagsB);

    return;
}

//! FE8U = 0x08079E78
void MuCtr_SetupWithEventMoveBuffer(struct MuCtrlProc * proc, struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
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

    GetAdjustedPositionForNewUnit(unit, &pos, flags);

    proc->unit = unit;
    proc->muProc = MU_Create(unit);
    proc->redas = redas;
    proc->redaCount = count;
    proc->unk_3a = 0;
    proc->delayFrames = redas->delayFrames;
    proc->flags = flags;
    proc->unk_40 = pos.x;
    proc->unk_41 = pos.y;
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

    MU_Hide(proc->muProc);

    return;
}

//! FE8U = 0x08079F84
s8 MuCtrExists(void)
{
    return Proc_Find(gUnknown_089A2DB0) ? 1 : 0;
}

//! FE8U = 0x08079F9C
void SetAllMOVEUNITField44To1_(void)
{
    MU_AllForceSetMaxMoveSpeed();
    return;
}

//! FE8U = 0x08079FA8
void sub_8079FA8(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct Vec2 pos;

    const struct REDA * reda = redas - 1 + count;

    pos.x = reda->x;
    pos.y = reda->y;

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    GetAdjustedPositionForNewUnit(unit, &pos, flags);

    unit->xPos = pos.x;
    unit->yPos = pos.y;

    UnitFinalizeMovement(unit);

    if (!(unit->state & US_UNDER_A_ROOF))
    {
        unit->state &= ~US_HIDDEN;
        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }

    return;
}

#if NONMATCHING

//! FE8U = 0x0807A014
void MoveUnit_(struct Unit * unit, s8 x, s8 y, u16 flags)
{
    struct REDA local_18;

    local_18.x = x;
    local_18.y = y;

    sub_8079FA8(unit, &local_18, 1, flags);

    return;
}

#else

NAKEDFUNC
void MoveUnit_(struct Unit * unit, s8 x, s8 y, u16 flags)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        sub sp, #8\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        lsls r1, r1, #0x18\n\
        asrs r1, r1, #0x18\n\
        movs r6, #0x3f\n\
        ands r1, r6\n\
        movs r5, #0x40\n\
        negs r5, r5\n\
        ldr r4, [sp]\n\
        ands r4, r5\n\
        orrs r4, r1\n\
        lsls r2, r2, #0x18\n\
        asrs r2, r2, #0x18\n\
        ands r2, r6\n\
        lsls r2, r2, #6\n\
        ldr r1, _0807A050  @ 0xFFFFF03F\n\
        ands r4, r1\n\
        orrs r4, r2\n\
        str r4, [sp]\n\
        mov r1, sp\n\
        movs r2, #1\n\
        bl sub_8079FA8\n\
        add sp, #8\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0807A050: .4byte 0xFFFFF03F\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x0807A054
void GetPreferredPositionForUNIT(const struct UnitDefinition * def, u8 * xOut, u8 * yOut, s8 findNearest)
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

        GetAdjustedPositionForNewUnit(unit, &pos, flags);
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
    const struct REDA * reda = proc->redas + proc->unk_3a;

    MU_SortObjLayers();

    if (proc->muProc->boolForceMaxSpeed != 0)
    {
        Proc_Goto(proc, 1);
        return 0;
    }

    if (sub_807A294(reda->a, reda->b) == 1)
    {
        if (gKeyStatusPtr->heldKeys & A_BUTTON)
        {
            proc->delayFrames -= 4;
        }
        else
        {
            proc->delayFrames--;
        }

        if (proc->delayFrames < 1)
        {
            sub_807A358(proc);
            return 0;
        }
    }

    if (proc->unk_3a != 0)
    {
        struct Unit * unit = proc->unit;

        ShowUnitSprite(unit);
        unit->state &= ~US_HIDDEN;
        MU_Hide(proc->muProc);
        gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
        RefreshUnitSprites();
    }

    return 1;
}

//! FE8U = 0x0807A194
s8 sub_807A194(struct MuCtrlProc * proc)
{
    struct MUProc * muProc = proc->muProc;

    MU_SortObjLayers();

    if (!MU_IsActive(muProc))
    {
        struct Unit * unit = proc->unit;
        unit->xPos = proc->unk_42;
        unit->yPos = proc->unk_43;

        proc->unk_3a++;

        if ((proc->unk_3a < proc->redaCount && muProc->boolForceMaxSpeed == 0))
        {
            proc->delayFrames = (proc->unk_3a + proc->redas)->delayFrames;
            return 0;
        }

        Proc_Goto(proc, 1);
        return 0;
    }

    return 1;
}

//! FE8U = 0x0807A1FC
void sub_807A1FC(struct MuCtrlProc * proc)
{
    struct MUProc * muProc = proc->muProc;
    struct Unit * unit = proc->unit;

    if ((muProc->boolForceMaxSpeed != 0) && (proc->redaCount != 0))
    {
        MoveUnit_(unit, proc->unk_40, proc->unk_41, proc->flags & 0xFFFE);
    }
    else
    {
        unit->xPos = proc->unk_40;
        unit->yPos = proc->unk_41;
        UnitFinalizeMovement(unit);

        ShowUnitSprite(unit);
        unit->state &= ~US_HIDDEN;

        gBmMapUnit[unit->yPos][unit->xPos] = unit->index;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }

    MU_End(muProc);
    MU_SortObjLayers();

    ClearEventMoveBuffer(proc->redas);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_089A2DB0[] =
{
    PROC_NAME("E_MuCtr"),
    PROC_SET_END_CB(sub_807A1FC),
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
        return 1;
    }

    gUnknown_03001C35 = pid;
    gUnknown_03001C34 = 1;

    Proc_ForEach(gUnknown_089A2DB0, (ProcFunc)sub_807A300);

    if ((gUnknown_03001C34 == 0) && (b != 0xFFFF))
    {
        gUnknown_03001C36 = b;
        gUnknown_03001C34 = 0;
        Proc_ForEach(gUnknown_089A2DB0, (ProcFunc)sub_807A324);
    }

    return gUnknown_03001C34;
}

//! FE8U = 0x0807A300
void sub_807A300(struct MuCtrlProc * proc)
{
    if (proc->unit->pCharacterData->number == gUnknown_03001C35)
    {
        gUnknown_03001C34 = 0;
    }

    return;
}

//! FE8U = 0x0807A324
void sub_807A324(struct MuCtrlProc * proc)
{
    if (proc->unit->pCharacterData->number == gUnknown_03001C35 && gUnknown_03001C36 < proc->unk_3a)
    {
        gUnknown_03001C34 = 1;
    }
    return;
}

//! FE8U = 0x0807A358
void sub_807A358(struct MuCtrlProc * proc)
{
    u8 * commands;
    u8 config;
    struct Vec2 pos;

    struct Unit * unit = proc->unit;
    const struct REDA * reda = proc->redas + proc->unk_3a;
    u16 flagsA = proc->flags;
    int flagsB = flagsA;

    gBmMapOther[proc->unk_41][proc->unk_40] = 0;

    if (proc->unk_3a < (proc->redaCount - 1))
    {
        pos.x = reda->x;
        pos.y = reda->y;
        flagsB &= 0xfffe;
    }
    else
    {
        pos.x = proc->unk_40;
        pos.y = proc->unk_41;

        if ((flagsA & 2) != 0)
        {
            flagsB &= 0xfffe;
        }
    }

    commands = sub_807A644(unit, &pos, flagsB & 1);

    gBmMapOther[proc->unk_41][proc->unk_40] = unit->pCharacterData->number;

    if ((proc->unk_42 != pos.x) || (proc->unk_43 != pos.y))
    {
        struct MUProc * muProc = proc->muProc;

        MU_Show(muProc);
        MU_StartMoveScript(muProc, commands);

        config = reda->flags;

        if ((flagsB & 8) != 0)
        {
            config |= 0x40;
        }

        MU_SetMoveConfig(muProc, config);

        if ((flagsB & 4) != 0)
        {
            MU_EnableAttractCamera(muProc);
        }
        else
        {
            MU_DisableAttractCamera(muProc);
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
void GetAdjustedPositionForNewUnit(struct Unit * unit, struct Vec2 * pos, u16 flags)
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
                {
                    continue;
                }

                if (gBmMapUnit[yCur][xCur] != 0)
                {
                    continue;
                }

                if (gBmMapOther[yCur][xCur] != 0)
                {
                    continue;
                }

                if (gBmMapHidden[yCur][xCur] != 0)
                {
                    continue;
                }

                if (((s8 **)gBmMapRange)[yCur][xCur] < 0)
                {
                    continue;
                }

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
