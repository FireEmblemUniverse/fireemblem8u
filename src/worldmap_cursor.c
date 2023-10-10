#include "global.h"

#include "ctc.h"
#include "hardware.h"

#include "worldmap.h"

struct Unknown08206498
{
    /* 00 */ u16 unk_00;
    /* 02 */ STRUCT_PAD(0x02, 0x04);
    /* 04 */ u16 * pSpriteData;
    /* 08 */ s8 x;
    /* 09 */ s8 y;
    /* 0A */ STRUCT_PAD(0x0A, 0x0C);
};

extern u16 gPal_08A97ACC[];

//! FE8U = 0x080BBA80
void nullsub_59(void)
{
    return;
}

//! FE8U = 0x080BBA84
void GmapCursor_Init(struct GmapCursorProc * proc)
{
    proc->unk_31 = 0;
    proc->unk_32 = 0;
    proc->frameIdx = 0;
    proc->unk_3c = 0;
    proc->unk_38 = 0;
    proc->unk_44 = 0;
    proc->unk_40 = 0;

    proc->unk_48 = 0x300;

    proc->unk_34 = 0;
    proc->unk_35 = 4;

    PAL_OBJ_COLOR(4, 14) = *(gPal_08A97ACC + 0);

    EnablePaletteSync();

    return;
}

const struct Unknown08206498 gUnknown_08206498[] =
{
    {
        .unk_00 = 0,
        .pSpriteData = gObject_16x16,
        .x = 0,
        .y = 16,
    },
    {
        .unk_00 = 2,
        .pSpriteData = gObject_16x16,
        .x = 0,
        .y = 16,
    },
};

//! FE8U = 0x080BBAD4
void GmapCursor_Loop(struct GmapCursorProc * proc)
{
    proc->unk_32 = gGMData.unk01;

    proc->unk_38 = gGMData.unk08;
    proc->unk_3c = gGMData.unk0C;

    if (proc->unk_32 > 0)
    {
        u32 chr = proc->chr;
        const struct Unknown08206498 * ptr = &gUnknown_08206498[proc->frameIdx];

        s16 x;
        s16 y;
        *&x = proc->pScreenProc->unk_34;
        *&y = proc->pScreenProc->unk_36;

        PutSprite(
            4,
            (gGMData.unk08 >> 8) - x - ptr->x,
            (gGMData.unk0C >> 8) - y - ptr->y,
            ptr->pSpriteData,
            (chr / CHR_SIZE) + ptr->unk_00 + OAM2_PAL(proc->pal) + OAM2_LAYER(2)
        );

        proc->unk_35--;

        if (proc->unk_35 == 0)
        {
            proc->unk_34++;

            if (proc->unk_34 > 15)
            {
                proc->unk_34 = 0;
            }

            PAL_OBJ_COLOR(4, 14) = *(gPal_08A97ACC + proc->unk_34);

            EnablePaletteSync();

            proc->unk_35 = 4;
        }

        proc->unk_40 = proc->unk_38;
        proc->unk_44 = proc->unk_3c;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapCursor[] =
{
    PROC_NAME("GmapCursor"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(nullsub_59),

    PROC_CALL(GmapCursor_Init),
    PROC_REPEAT(GmapCursor_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BBBC4
ProcPtr NewGmapCursor(ProcPtr parent, int chr, int pal, ProcPtr pScreenProc)
{
    struct GmapCursorProc * proc = Proc_Start(gProcScr_GmapCursor, parent);

    proc->chr = chr;
    proc->pal = pal;
    proc->pScreenProc = pScreenProc;

    return proc;
}
