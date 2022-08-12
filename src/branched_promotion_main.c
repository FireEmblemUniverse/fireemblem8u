#include "branched_promotion.h"
#include "proc.h"

void sub_80CC4AC(struct PromoProc2 *proc);
void sub_80CC5B4(struct PromoProc2 *proc);
int sub_80CDA2C(struct PromoProc2 *proc);
u32 sub_80CDA38(struct PromoProc2 *proc);
void sub_80CC628(struct PromoProc2 *proc);
u32 sub_80CD2F8(struct PromoProc2 *proc);
u32 sub_80CD330(struct PromoProc2 *proc);
void sub_80CDEA8(struct PromoProc2 *proc);
void sub_80CC66C(struct PromoProc2 *proc);
void sub_80CC698(struct PromoProc2 *proc);

CONST_DATA
struct ProcCmd gUnknown_08B12614[] =
{
	PROC_NAME("ccramify"),
	PROC_LABEL(0),
    PROC_CALL(sub_80CC4AC),
    PROC_SLEEP(3),
	PROC_LABEL(1),
    PROC_CALL(sub_80CC5B4),
    PROC_LABEL(2),
    PROC_WHILE(sub_80CDA2C),
    PROC_WHILE(sub_80CDA38),
    PROC_CALL(sub_80CC628),
    PROC_LABEL(4),
    PROC_WHILE(sub_80CD2F8),
    PROC_SLEEP(5),
    PROC_REPEAT(sub_80CD330),
    PROC_LABEL(5),
    PROC_CALL(sub_80CDEA8),
    PROC_SLEEP(2),
    PROC_LABEL(6),
    PROC_CALL(sub_80CC66C),
    PROC_LABEL(7),
    PROC_LABEL(8),
    PROC_CALL(sub_80CC698),
    PROC_END,
};

