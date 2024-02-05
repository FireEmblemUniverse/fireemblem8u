#include "gbafe.h"

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

void InitEkrDragonStatus(void)
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

#if 0
void EkrDragonQuakeMain(struct ProcEkrDragonQuake * proc)
{
    struct EkrDragonQuakePriv * priv = proc->priv;

    BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(BG_0, gEkrBg0QuakeVec.x + gEkrBg2QuakeVec.x, gEkrBg0QuakeVec.y + gEkrBg2QuakeVec.y);

    EkrGauge_Setxy323A(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(
        POS_L,
        gEkrXPosReal[POS_L] - gEkrBg2QuakeVec.x - gEkrBgPosition,
        gEkrYPosReal[POS_L] - gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(
        POS_R,
        gEkrXPosReal[POS_R] - gEkrBg2QuakeVec.x - gEkrBgPosition,
        gEkrYPosReal[POS_R] - gEkrBg2QuakeVec.y);

    if (priv)
    {
        priv->unk32 = gEkrXPosReal[POS_L] - gEkrBg2QuakeVec.x;
        priv->unk3A = gEkrYPosReal[POS_L] - gEkrBg2QuakeVec.y;
    }
}
#endif
