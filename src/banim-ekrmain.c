#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void sub_80598CC(struct Anim *anim)
{
    u32 inst;

    if (sub_805A1D0(anim->currentRoundType) == false)
        return;

    if (anim->pScrCurrent == gUnknown_085B9D5C)
        return;

    while (1) {
        inst = ANINS_GET_TYPE(*anim->pScrCurrent);

        if (inst == 0) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == 5) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == 6)
            anim->pScrCurrent += 3;
    }

}

void NewEkrChienCHR(struct Anim *anim)
{
    struct ProcEkrChienCHR *proc;
    proc = Proc_Start(gProc_ekrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}

void EkrChienCHRMain(struct ProcEkrChienCHR *proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}

void RegisterAISSheetGraphics(struct Anim *anim)
{
    void *mmap;
    mmap = (void *)0x06010000 + (anim->oam2Base & 0x3FF) * 0x20;
    LZ77UnCompWram(anim->pImgSheet, anim->pUnk2C);
    RegisterTileGraphics(anim->pUnk2C, mmap, 0x2000);
}
