#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

struct ProcEkrDragon_08758720 {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ u16 * unk34;
    /* 38 */ const u16 * unk38;
    /* 3C */ u8 unk3C;
    /* 3D */ u8 unk3D;
};

void sub_8070710(u16 * a, u16 * paldst, u16 c, u16 d, u16 e);

#if 0
void sub_80707FC(struct ProcEkrDragon_08758720 * proc)
{
    sub_8070710(proc->unk34,
                (void *)gPaletteBuffer + 0xC0 + proc->unk3D,
                proc->unk38[proc->unk30],
                proc->unk3C,
                proc->unk3D);

    sub_8070710(proc->unk34,
                (void *)gPaletteBuffer + 0x2E0 + proc->unk3D,
                proc->unk38[proc->unk30],
                proc->unk3C,
                proc->unk3D);

    EnablePaletteSync();

    proc->unk2C++;
    proc->unk30++;

    if (proc->unk38[proc->unk30] == 0x8000)
        proc->unk30 = 0;
}
#endif

void sub_8070874(void)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
    {
        Proc_EndEach(ProcScr_EkrDragon_08758720);
        SetEkrDragonPaletteFront(POS_L);
        SetEkrDragonPaletteBack(POS_L);
    }
}

void sub_80708A0(void)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
    {
        struct ProcEkrDragon_08758720 * proc;
        proc = Proc_Start(ProcScr_EkrDragon_08758720, PROC_TREE_3);
        proc->unk38 = gUnknown_08758740;
    }
}
