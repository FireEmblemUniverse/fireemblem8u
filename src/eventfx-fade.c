#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmfx.h"

static struct EventFadeSt sEventFadeSt[0x20];

void EventFadefx_Loop(struct ProcEventFade * proc)
{
    u8 i;
    u16 r, g, b;
    struct EventFadeSt * st;

    proc->timer += proc->tick;
    if (proc->timer >= 0x100)
        Proc_Break(proc);

    st = sEventFadeSt;
    i = 0;
    for (; i < ARRAY_COUNT(sEventFadeSt); st++, i++)
    {
        if (!(proc->mask & (1 << i)))
            continue;

        r = (st->r * (0x100 - proc->timer) + proc->r * proc->timer) / 0x100;

        g = (st->g * (0x100 - proc->timer) + proc->g * proc->timer) / 0x100;

        b = (st->b * (0x100 - proc->timer) + proc->b * proc->timer) / 0x100;

        WriteFadedPaletteFromArchive(r, g, b, 1 << i);

        st->r0 = GetPalFadeStClkEnd1();
        st->g0 = GetPalFadeStClkEnd2();
        st->b0 = GetPalFadeStClkEnd3();
    }
}

void EventStartFade(void)
{
    u8 i;
    struct EventFadeSt * st;

    ArchiveCurrentPalettes();

    st = sEventFadeSt;
    i = 0;
    for (; i < ARRAY_COUNT(sEventFadeSt); st++, i++)
    {
        st->r0 = 0x100;
        st->g0 = 0x100;
        st->b0 = 0x100;
    }
}

void EventEndFade(void)
{
    u8 i;
    struct EventFadeSt * st;

    WriteFadedPaletteFromArchive(0x100, 0x100, 0x100, -1);

    st = sEventFadeSt;
    i = 0;
    for (; i < ARRAY_COUNT(sEventFadeSt); st++, i++)
    {
        st->r0 = 0x100;
        st->g0 = 0x100;
        st->b0 = 0x100;
    }
}

struct ProcCmd CONST_DATA ProcScr_EventFadefx[] = {
    PROC_YIELD,
    PROC_REPEAT(EventFadefx_Loop),
    PROC_END,
};

void NewEventFadefx(u16 speed, u32 mask, u16 r, u16 g, u16 b, ProcPtr parent)
{
    u8 i;
    struct EventFadeSt * st;
    struct ProcEventFade * proc;

    proc = Proc_StartBlocking(ProcScr_EventFadefx, parent);

    if (speed == 0)
        proc->tick = 0x100;
    else
        proc->tick = speed;

    proc->timer = 0;
    proc->mask = mask;
    proc->r = r;
    proc->g = g;
    proc->b = b;

    st = sEventFadeSt;
    i = 0;
    for (; i < ARRAY_COUNT(sEventFadeSt); st++, i++)
    {
        if (!(mask & (1 << i)))
            continue;

        st->r = st->r0;
        st->g = st->g0;
        st->b = st->b0;
    }
}
