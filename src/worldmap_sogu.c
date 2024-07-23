#include "global.h"
#include "proc.h"
#include "ap.h"
#include "bmlib.h"
#include "hardware.h"
#include "mapanim.h"
#include "soundwrapper.h"
#include "worldmap.h"

bool GmapSugoAdvance(s16 x, s16 y, s16 * outx, s16 * outy)
{
    short _x, _y;
    *&_x = GM_SCREEN->x;
    *&_y = GM_SCREEN->y;

    *outx = x - _x;
    *outy = y - _y;

    if ((u16)((y - _y) + 0x20) < 0xE0 && (u16)(*outx + 0x20) < 0x130)
        return true;

    return false;
}

void GmapSogu_End(struct ProcGmapSogu * proc)
{
    if (proc->ap)
        AP_Delete(proc->ap);
}

void GmapSogu_Init(struct ProcGmapSogu * proc)
{
    PlaySoundEffect(0x77);
    proc->ap = NULL;
    proc->timer = 0;

    SetObjAffine(
        0,
        Div(COS(0)  * 0x10, 0x200),
        Div(-SIN(0) * 0x10, 0x200),
        Div(SIN(0)  * 0x10, 0x200),
        Div(COS(0)  * 0x10, 0x200));
}

void GmapSogu_Loop1(struct ProcGmapSogu * proc)
{
    int ret;
    s16 outx, outy;
    if (proc->timer++ > 7)
        Proc_Break(proc);

    ret = Interpolate(INTERPOLATE_RCUBIC, 0x200, 0x100, proc->timer, 8);

    SetObjAffine(
        0,
        Div(COS(0)  * 0x10, ret),
        Div(-SIN(0) * 0x10, ret),
        Div(SIN(0)  * 0x10, ret),
        Div(COS(0)  * 0x10, ret));

    if (GmapSugoAdvance(proc->x - 8, proc->y - 8, &outx, &outy))
        AP_Update(proc->ap, outx, outy | 0x300);
    else
        AP_Update(proc->ap, 0x100, 0x3B0);
}

void GmapSogu_Loop2(struct ProcGmapSogu * proc)
{
    s16 outx, outy;
    if (proc->timer++ > 0x27)
        Proc_Break(proc);

    if (GmapSugoAdvance(proc->x, proc->y, &outx, &outy))
        AP_Update(proc->ap, outx, outy | 0x100);
    else
        AP_Update(proc->ap, 0x100, 0x3B0);
}

CONST_DATA struct ProcCmd ProcScr_GmapSogu[] = {
    PROC_NAME("Gmap Sogu"),
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_SET_END_CB(GmapSogu_End),
    PROC_CALL(GmapSogu_Init),
    PROC_REPEAT(GmapSogu_Loop1),
    PROC_REPEAT(GmapSogu_Loop2),
    PROC_END
};

void NewGmapSogu(int x, int y)
{
    struct APHandle * ap;
    struct ProcGmapSogu * proc;

    Decompress(Img_GmapSoguSprites, OBJ_VRAM0 + 0x3000);
    ap = AP_Create(ApHandle_GmapSoguSprites, 7);
    ap->tileBase = 0x1180;
    AP_SwitchAnimation(ap, 0);

    proc = Proc_Start(ProcScr_GmapSogu, PROC_TREE_3);
    proc->ap = ap;
    proc->x = x + 8;
    proc->y = y - 8;
}

bool GmapSoguExists(void)
{
    return Proc_Find(ProcScr_GmapSogu) != NULL;
}
