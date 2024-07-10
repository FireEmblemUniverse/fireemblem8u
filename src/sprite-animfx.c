#include "global.h"
#include "proc.h"
#include "ap.h"
#include "ctc.h"
#include "sysutil.h"
#include "sprite-animfx.h"

struct ProcCmd CONST_DATA ProcScr_EventSpriteAnim[] =
{
    PROC_SLEEP(0),

    PROC_SET_END_CB(EventSpriteAnim_End),

    PROC_CALL(EventSpriteAnim_Init),
    PROC_REPEAT(EventSpriteAnim_Loop),

    PROC_END,
};

void EventSpriteAnim_Init(struct ProcEventSpriteAnim * proc)
{
    int x = proc->x - gBmSt.camera.x + 8;
    int y = proc->y - gBmSt.camera.y + 8;
    const struct EventSpriteAnimConf * priv = proc->priv;

    proc->approc = StartSpriteAnimfx(
        priv->img,
        priv->pal,
        priv->ap_conf,
        OAM1_X(x),
        OAM0_Y(y) + priv->oam0,
        0,
        priv->pal_bank,
        priv->pal_size,
        priv->oam2,
        4
    );
}

void EventSpriteAnim_Loop(struct ProcEventSpriteAnim * proc)
{
    struct Proc * approc = proc->approc;
    if (approc->proc_script != NULL)
    {
        int x = proc->x - gBmSt.camera.x + 8;
        int y = proc->y - gBmSt.camera.y + 8;

        APProc_SetParameters((ProcPtr)approc, OAM1_X(x), OAM0_Y(y), -1);
    }
    else
    {
        Proc_Break(proc);
        proc->approc = NULL;
    }
}

void EventSpriteAnim_End(struct ProcEventSpriteAnim * proc)
{
    if (proc->approc != NULL)
        APProc_Delete(proc->approc);
}
