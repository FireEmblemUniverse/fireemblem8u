#include "global.h"
#include "proc.h"
#include "ctc.h"

struct CtCProc
{
    PROC_HEADER;

    u8 filler29[0x2C-0x29];
    u32 unk2C;
    u32 unk30;
    u8 filler34[0x50-0x34];
    s16 unk50;
    u16 unk52;
    void *unk54;
};

void sub_8005370(int id, int pa, int pb, int pc, int pd)
{
    gUnknown_03003140[id*0x10 + 0x03] = pa;
    gUnknown_03003140[id*0x10 + 0x07] = pb;
    gUnknown_03003140[id*0x10 + 0x0B] = pc;
    gUnknown_03003140[id*0x10 + 0x0F] = pd;
}

void ClearIntermediateOAMBuffers(void)
{
    int i;

    for (i = 15; i >= 0; i--)
    {
        gUnknown_0202A58C[i].unk0 = &gUnknown_0202A58C[i + 1];
        gUnknown_0202A58C[i].unkC = NULL;
    }
    gUnknown_0202A58C[15].unk0 = NULL;
    gUnknown_0202A58C[12].unk0 = NULL;
    gUnknown_03004970 = gUnknown_02029D8C;
}

void RegisterObjectAttributes_SafeMaybe(int a, int b, int c, const void *d, int e)
{
    gUnknown_03004970->unk0 = gUnknown_0202A58C[a].unk0;
    gUnknown_03004970->unk4 = b & 0x1FF;
    gUnknown_03004970->unk6 = c & 0xFF;
    gUnknown_03004970->unk8 = e;
    gUnknown_03004970->unkC = d;
    gUnknown_0202A58C[a].unk0 = gUnknown_03004970;
    gUnknown_03004970++;
}

void RegisterObjectAttributes(int nodeIndex, int xBase, int yBase, const void *pObjData, int tileBase)
{
    gUnknown_03004970->unk0 = gUnknown_0202A58C[nodeIndex].unk0;
    gUnknown_03004970->unk4 = xBase;
    gUnknown_03004970->unk6 = yBase;
    gUnknown_03004970->unk8 = tileBase;
    gUnknown_03004970->unkC = pObjData;
    gUnknown_0202A58C[nodeIndex].unk0 = gUnknown_03004970;
    gUnknown_03004970++;
}

void FlushIntermediateOAMBuffer(int a)
{
    struct UnknownStructCTC *r4 = &gUnknown_0202A58C[a];

    while (r4 != NULL)
    {
        if (r4->unkC != NULL)
            CallARM_PushToSecondaryOAM(r4->unk4, r4->unk6, r4->unkC, r4->unk8);
        r4 = r4->unk0;
    }
}

void sub_8005488(struct CtCProc *proc)
{
    RegisterObjectAttributes_SafeMaybe(proc->unk50, proc->unk2C, proc->unk30, proc->unk54, proc->unk52);
}

struct CtCProc *sub_80054B0(struct Proc *parent, int b, int c, int d, void *e, int f)
{
    struct CtCProc *proc;

    if (parent != NULL)
        proc = (struct CtCProc *)Proc_Create(gUnknown_08590FDC, parent);
    else
        proc = (struct CtCProc *)Proc_Create(gUnknown_08590FDC, ROOT_PROC_3);
    proc->unk2C = c;
    proc->unk30 = d;
    proc->unk50 = b;
    proc->unk54 = e;
    proc->unk52 = f;
    return proc;
}

void sub_80054F4(struct CtCProc *proc, int b, int c)
{
    if (proc == NULL)
        proc = (struct CtCProc *)Proc_Find(gUnknown_08590FDC);
    proc->unk2C = b;
    proc->unk30 = c;
}
