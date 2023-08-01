#include "global.h"

#include "ctc.h"
#include "hardware.h"

#include "worldmap.h"

struct GmapCursorProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ u32 unk_2c;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ s8 unk_32;
    /* 33 */ s8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 unk_36;

    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u16 unk_48;

    /* 4C */ struct GmScreenProc * unk_4c;
};

struct Unknown08206498
{
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ void * unk_04;
    /* 08 */ s8 unk_08;
    /* 09 */ s8 unk_09;
    /* 0A */ STRUCT_PAD(0x0A, 0x0C);
};

extern u8 gUnknown_08206450[2][0x1d];
extern struct Unknown08206498 gUnknown_08206498[];
extern u16 gUnknown_08A97ACC[];

//! FE8U = 0x080BBA28
const char * sub_80BBA28(u32 nodeId)
{
    if (nodeId < 0x1d)
    {
        return GetStringFromIndex(nodeId[gUnknown_082060B0].nameTextId);
    }

    return GetStringFromIndex(0x066D);
}

//! FE8U = 0x080BBA4C
int sub_80BBA4C(int nodeId)
{
    int set;

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_EIRIKA:
        default:
            set = 0;
            break;

        case CHAPTER_MODE_EPHRAIM:
            set = 1;
            break;
    }

    return gUnknown_08206450[set][nodeId];
}

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
    proc->unk_33 = 0;
    proc->unk_3c = 0;
    proc->unk_38 = 0;
    proc->unk_44 = 0;
    proc->unk_40 = 0;

    proc->unk_48 = 0x300;

    proc->unk_34 = 0;
    proc->unk_35 = 4;

    gPaletteBuffer[0x14e] = *(gUnknown_08A97ACC + 0);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080BBAD4
void GmapCursor_Destruct(struct GmapCursorProc * proc)
{
    proc->unk_32 = gGMData.unk01;

    proc->unk_38 = gGMData.unk08;
    proc->unk_3c = gGMData.unk0C;

    if (proc->unk_32 > 0)
    {
        u32 chr = proc->unk_2c;
        struct Unknown08206498 * ptr = &gUnknown_08206498[proc->unk_33];

        s16 x;
        s16 y;
        *&x = proc->unk_4c->unk_34;
        *&y = proc->unk_4c->unk_36;

        PutSprite(4,
            (gGMData.unk08 >> 8) - x - ptr->unk_08,
            (gGMData.unk0C >> 8) - y - ptr->unk_09,
            ptr->unk_04,
            (chr / CHR_SIZE) + ptr->unk_00 + OAM2_PAL(proc->unk_30) + OAM2_LAYER(2)
        );

        proc->unk_35--;

        if (proc->unk_35 == 0)
        {
            proc->unk_34++;

            if (proc->unk_34 > 0xf)
            {
                proc->unk_34 = 0;
            }

            gPaletteBuffer[0x14e] = *(gUnknown_08A97ACC + proc->unk_34);

            EnablePaletteSync();

            proc->unk_35 = 4;
        }

        proc->unk_40 = proc->unk_38;
        proc->unk_44 = proc->unk_3c;
    }

    return;
}

extern struct ProcCmd gUnknown_08A3DF94[];

//! FE8U = 0x080BBBC4
ProcPtr NewGmapCursor(ProcPtr parent, int chr, int pal, ProcPtr pScreenProc)
{
    struct GmapCursorProc * proc = Proc_Start(gUnknown_08A3DF94, parent);
    proc->unk_2c = chr;
    proc->unk_30 = pal;
    proc->unk_4c = pScreenProc;
    return proc;
}
