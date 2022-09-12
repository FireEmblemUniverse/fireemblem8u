#include "global.h"

#include "constants/classes.h"

#include "bmmap.h"
#include "bmunit.h"
#include "mu.h"
#include "functions.h"

struct KoidoProc {
    PROC_HEADER;

    /* 2C */ int direction;
    /* 30 */ struct Unit* unit;
    /* 34 */ struct MUProc* proc_mu;
    /* 38 */ u8 mu_commands[0x03];
    /* 3B */ u8 unk_3B;
    /* 3C */ s8 config;
};

void Loop6C_KOIDO(struct KoidoProc* proc);

struct ProcCmd CONST_DATA sProcScr_KOIDO[] = {
    PROC_NAME("KOIDO"),
    PROC_REPEAT(Loop6C_KOIDO),
    PROC_END
};

struct ProcCmd CONST_DATA sProcScr_KOIDOAMM[] = {
    PROC_NAME("KOIDOAMM"),
    PROC_CALL(AddSkipThread2),
    PROC_REPEAT(Loop6C_KOIDO),
    PROC_CALL(SubSkipThread2),
    PROC_END
};

int GetSomeFacingDirection(int x0, int y0, int x1, int y1)
{
    if (x0 == x1) {
        if (y0 < y1)
            return FACING_UP;
        else if (y0 > y1)
            return FACING_DOWN;
    }

    if (y0 != y1)
        return FACING_LEFT;
    
    if (x0 < x1)
        return FACING_LEFT;
    
    if (x0 <= x1)
        return FACING_LEFT;
    
    return FACING_RIGHT;
}

struct MUProc* Make6CMOVEUNITForUnitBeingRescued(struct Unit* unit)
{
    const u32 attributes = UNIT_CATTRIBUTES(unit);

    if (!(CA_MOUNTEDAID & attributes))
        return MU_Create(unit);
    else
        return (CA_FEMALE & attributes)
            ? MU_CreateExt(unit, CLASS_CIVILIAN_F2,0xC)
            : MU_CreateExt(unit, CLASS_CIVILIAN_M2,0xC);
}

void Loop6C_KOIDO(struct KoidoProc* proc)
{
    if (MU_IsAnyActive())
        return;
    
    if (2 != proc->config)
        MU_End(proc->proc_mu);
    
    Proc_Break(proc);

    if (1 == proc->config) {
        RefreshEntityBmMaps();
        SMS_UpdateFromGameData();
        SMS_FlushIndirect();
    }
}

static inline void Make6CKOIDO_common(struct Unit* unit, int config, struct KoidoProc *proc)
{
    struct MUProc *proc_mu;
    proc->config = config;

    proc_mu = Make6CMOVEUNITForUnitBeingRescued(unit);
    proc->proc_mu = proc_mu;
    MU_StartMoveScript(proc_mu, proc->mu_commands);
}

void Make6CKOIDO(struct Unit* unit, int direction, int config, ProcPtr parent)
{
    struct KoidoProc *proc = Proc_StartBlocking(sProcScr_KOIDO, parent);

    proc->unit = unit;
    proc->direction = direction;
    proc->mu_commands[0] = MU_COMMAND_CAMERA_OFF;
    proc->mu_commands[1] = direction;
    proc->mu_commands[2] = MU_COMMAND_HALT;

    Make6CKOIDO_common(unit, config, proc);
}

void Make6CKOIDOAMM(struct Unit* unit, int direction)
{
    struct KoidoProc *proc = Proc_Start(sProcScr_KOIDOAMM, PROC_TREE_3);

    proc->unit = unit;
    proc->direction = direction;
    proc->mu_commands[0] = MU_COMMAND_CAMERA_OFF;
    proc->mu_commands[1] = direction;
    proc->mu_commands[2] = MU_COMMAND_HALT;

    Make6CKOIDO_common(unit, 0, proc);
}
