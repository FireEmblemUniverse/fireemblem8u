#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

EWRAM_DATA int gEkrTriangleInvalid = false;

struct ProcEkrTriangle {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ struct Anim *anim;
};

bool CheckEkrTriangleInvalid(void)
{
    if (gEkrTriangleInvalid == true)
        return true;

    return false;
}

void nullsub_18(void)
{
    return;
}

void EkrTriangleMain(struct ProcEkrTriangle *proc);

CONST_DATA struct ProcCmd ProcScr_ekrTriangle[] = {
    PROC_NAME("ekrTriangle"),
    PROC_REPEAT(EkrTriangleMain),
    PROC_END
};

void NewEkrTriangle(struct Anim *anim)
{
    struct ProcEkrTriangle *proc;
    proc = Proc_Start(ProcScr_ekrTriangle, PROC_TREE_3);
    proc->anim = anim;
    gEkrTriangleInvalid = false;
}
