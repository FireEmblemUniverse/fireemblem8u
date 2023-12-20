#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x08065494
void nullsub_53(struct Anim * anim)
{
    return;
}

extern struct ProcCmd gUnknown_085D75E8[];

extern u16 * gUnknown_085D7600[];
extern u16 * gUnknown_085D7628[];
extern u16 gUnknown_08750268[];

extern u16 gUnknown_080DE47E[];

//! FE8U = 0x08065498
void sub_8065498(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D75E8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE47E;

    proc->tsal = gUnknown_085D7628;
    proc->tsar = gUnknown_085D7628;
    proc->img = gUnknown_085D7600;

    proc->pal = NULL;
    SpellFx_RegisterBgPal(gUnknown_08750268, 0x20);

    SpellFx_SetSomeColorEffect();
    BG_SetPosition(BG_1, 0, 0);

    return;
}

//! FE8U = 0x080654F8
void sub_80654F8(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType == 1)
        {
            if (GetAnimPosition(proc->anim) == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, 0);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }

            BG_EnableSyncByMask(BG1_SYNC_BIT);
        }
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D7650[];

extern u32 gUnknown_08752020[];

extern u16 gUnknown_08751808[];
extern u16 gUnknown_08751DB4[];

//! FE8U = 0x080655C4
void sub_80655C4(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7650, PROC_TREE_3);
    proc->anim = anim;

    scr = gUnknown_08752020;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = anim->xPosition;
    frontAnim->yPosition = anim->yPosition;

    SpellFx_RegisterObjGfx(gUnknown_08751808, 0x1000);
    SpellFx_RegisterObjPal(gUnknown_08751DB4, 0x20);

    return;
}

//! FE8U = 0x08065624
void sub_8065624(void)
{
    gEfxBgSemaphore--;
    return;
}