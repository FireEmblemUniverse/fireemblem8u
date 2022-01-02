#include "global.h"

#include "proc.h"
struct PromoProc
{
    PROC_HEADER;
    s8 u29;
    s8 u2a;
    s8 u2b;
    ProcPtr u2c;
    s8 u30;
    s8 u31;
    s8 u32;
    s8 u33;
    s8 u34;
    s8 u35;
    s8 u36;
    s8 u37;
    s8 u38;
    s8 u39;
    s8 u40;
    s8 u41[20];
    s8 u42[20];
};

extern const struct ProcCmd gUnknown_08B12614[];

ProcPtr Make6C_PromotionMain(ProcPtr proc);

void MakePromotionScreen(struct PromoProc *proc, u8 a, u8 b) {
    u8 * res;
    proc->u30 = 0;
    res = Make6C_PromotionMain(proc);
    proc->u2c = res;
    res[0x38] = a;
    res[0x39] = b;
}

ProcPtr Make6C_PromotionMain(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08B12614, proc);
}
