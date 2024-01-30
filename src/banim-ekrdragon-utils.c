#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void SetEkrDragonExit(struct Anim * anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_BANIMFINISH);
}

void SetEkrDragonDead(struct Anim * anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_DEAD);
}

void SetEkrDragonRefrain(struct Anim * anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_REFRAIN);
}

bool CheckEkrDragonDead(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);
    if (attr & EKRDRGON_ATTR_DEAD)
        return true;
    else
        return false;
}

bool CheckEkrDragonRefrain(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);
    if (attr & EKRDRGON_ATTR_REFRAIN)
        return true;
    else
        return false;
}

void SetAnimStateHiddenForDragon(void)
{
    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
        SetAnimStateHidden(EKR_POS_L);
        break;

    case EKRDRGON_TYPE_DEMON_KING:
        SetAnimStateHidden(EKR_POS_L);
        break;

    case EKRDRGON_TYPE_NORMAL:
    case EKRDRGON_TYPE_MYRRH:
    default:
        break;
    }
}

void sub_807027C(struct Anim * anim)
{
    u16 * pal;
    switch (GetBanimDragonStatusType())
    {
        case EKRDRGON_TYPE_NORMAL:
        case EKRDRGON_TYPE_MYRRH:
            return;
        
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            pal = gUnknown_08802D24;
            break;
    
        case EKRDRGON_TYPE_DEMON_KING:
            pal = gUnknown_08802D24;
            break;
    }

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(pal, PAL_BG(6), 0x20);
    else
        CpuFastCopy(pal, PAL_BG(7), 0x20);

    EnablePaletteSync();
}

u16 * GetEkrDragonPalette(void)
{
    u32 type = GetBanimDragonStatusType();
    switch (type) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
        return Pal_EfxDracoZombie;

    case EKRDRGON_TYPE_DEMON_KING:
        return Pal_DemonKingBG;

    case EKRDRGON_TYPE_NORMAL:
    case EKRDRGON_TYPE_MYRRH:
        break;
    }

    /**
     * return NULL;
     */
}

void SetEkrDragonPaletteBack(int pos)
{
    if (pos == EKR_POS_L)
        CpuFastCopy(GetEkrDragonPalette(), PAL_OBJ(0x7), 0x20);
    else
        CpuFastCopy(GetEkrDragonPalette(), PAL_OBJ(0x9), 0x20);

    EnablePaletteSync();
}

void SetEkrDragonPaletteFront(int pos)
{
    if (pos == EKR_POS_L)
        CpuFastCopy(GetEkrDragonPalette(), PAL_BG(0x6), 0x20);
    else
        CpuFastCopy(GetEkrDragonPalette(), PAL_BG(0x7), 0x20);

    EnablePaletteSync();
}

void BanimSetFrontPaletteForDragon(struct Anim * anim)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
        SetEkrDragonPaletteFront(GetAnimPosition(anim));
}

void NewEkrDragonQuakeTree3(struct EkrDragonQuakePriv *priv, int b, int c)
{
    NewEkrDragonQuake(priv, b, c, PROC_TREE_3);
}

CONST_DATA struct ProcCmd ProcScr_ekrDragonQuake[] = {
    PROC_NAME((void *)0x80dfa0c),
    PROC_REPEAT(EkrDragonQuakeMain),
    PROC_END
};

void NewEkrDragonQuake(struct EkrDragonQuakePriv *priv, int b, int c, ProcPtr parent)
{
    struct ProcEkrDragonQuake * proc;
    
    proc = Proc_Start(ProcScr_ekrDragonQuake, parent);
    proc->priv = priv;
    proc->subproc = NewEfxQuakePure(c, 0);
    proc->unk2C = 0;
    proc->unk2E = b;
}
