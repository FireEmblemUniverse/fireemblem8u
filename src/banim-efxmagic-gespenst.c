#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

/**
 * Spell anim effect for Gespenst. Most of the spell has
 * been removed in FE8, but part of the effect remains.
 */

//! FE8U = 0x08064CFC
void nullsub_51(struct Anim * anim)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7450[] =
{
    PROC_NAME("efxGespenstBG4"),

    PROC_SET_END_CB(sub_8064DA8),
    PROC_REPEAT(sub_8064DC4),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08064D00
void sub_8064D00(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7450, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgGfx(gUnknown_087313C8, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_08732228, PLTT_SIZE_4BPP);
    SpellFx_ClearBG1();

    LZ77UnCompWram(gUnknown_08732368, gEkrTsaBuffer);
    EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08064DA8
void sub_8064DA8(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x08064DC4
void sub_8064DC4(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxGespenstBGCOL2[] =
{
    PROC_NAME("efxGespenstBGCOL2"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(sub_8064E2C),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08064DE4
void sub_8064DE4(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE2E2[] =
    {
         0, 1,
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 1,
         6, 1,
         7, 1,
         8, 1,
         9, 1,
         0, 2,
         1, 2,
         2, 2,
         3, 2,
         4, 2,
         5, 2,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE2E2;

    proc->pal = gUnknown_08732228;
    SpellFx_RegisterBgPal(gUnknown_08731348, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08064E2C
void sub_8064E2C(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}
