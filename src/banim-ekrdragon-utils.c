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

void EfxBgFlashingForDragon(struct Anim * anim)
{
    u16 * pal;
    switch (GetBanimDragonStatusType())
    {
        case EKRDRGON_TYPE_NORMAL:
        case EKRDRGON_TYPE_MYRRH:
            return;
        
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            pal = Pal_BanimUnitFlashing;
            break;
    
        case EKRDRGON_TYPE_DEMON_KING:
            pal = Pal_BanimUnitFlashing;
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
    PROC_NAME("ekrDragonQuake"),
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

void EkrDragonQuakeMain(struct ProcEkrDragonQuake * proc)
{
    s16 x1, y1;
    s16 x2, y2;

    struct EkrDragonQuakePriv * priv = proc->priv;

    do {
        BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        BG_SetPosition(
            BG_0,
            gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
            gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);
    
        EkrGauge_Setxy323A(
            -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
            -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    
        EkrDispUP_SetPositionSync(
            -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
            -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    
        BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    } while (0);

    x1 = (gEkrXPosReal[POS_L] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
    y1 = gEkrYPosReal[POS_L] - gEkrBg2QuakeVec.y;

    x2 = (gEkrXPosReal[POS_R] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    y2 = gEkrYPosReal[POS_R] - gEkrBg2QuakeVec.y;

    SetEkrFrontAnimPostion(POS_L, x1, y1);
    SetEkrFrontAnimPostion(POS_R, x2, y2);

    if (priv)
    {
        priv->unk32 = x1;
        priv->unk3A = y1;
    }

    if (++proc->unk2C > proc->unk2E)
    {
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        BG_SetPosition(BG_3, 0, 0);

        x1 = gEkrXPosReal[POS_L] - gEkrBgPosition;
        x2 = gEkrXPosReal[POS_R] - gEkrBgPosition;

        y1 = gEkrYPosReal[POS_L];
        y2 = gEkrYPosReal[POS_R];

        SetEkrFrontAnimPostion(POS_L, x1, y1);
        SetEkrFrontAnimPostion(POS_R, x2, y2);

        if (priv)
        {
            priv->unk32 = x1;
            priv->unk3A = y1;
        }

        Proc_End(proc->subproc);
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_ekrWhiteINOUT[] = {
    PROC_NAME("ekrWhiteINOUT"),
    PROC_REPEAT(EkrWhiteINOUT_Loop1),
    PROC_REPEAT(EkrWhiteINOUT_Loop2),
    PROC_REPEAT(EkrWhiteINOUT_Loop3),
    PROC_REPEAT(EkrWhiteINOUT_RefrainPalette),
    PROC_END,
};

void NewEkrWhiteINOUT(int dura1, int dura2, int dura3)
{
    struct ProcEkrDragonScreenFlashing * proc;
    proc = Proc_Start(ProcScr_ekrWhiteINOUT, PROC_TREE_VSYNC);

    proc->timer = 0;
    proc->dura1 = dura1;
    proc->dura2 = dura2;
    proc->dura3 = dura3;

    gLCDControlBuffer.bldcnt.target1_bd_on = false;
    gLCDControlBuffer.bldcnt.target2_bd_on = false;
}

void EkrWhiteINOUT_Loop1(struct ProcEkrDragonScreenFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->dura1);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->dura1)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteINOUT_Loop2(struct ProcEkrDragonScreenFlashing * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->dura2)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteINOUT_Loop3(struct ProcEkrDragonScreenFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->dura3);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->dura3)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrWhiteINOUT_RefrainPalette(struct ProcEkrDragonScreenFlashing * proc)
{
    gLCDControlBuffer.bldcnt.target1_bd_on = true;
    gLCDControlBuffer.bldcnt.target2_bd_on = true;
    EnablePaletteSync();
    Proc_Break(proc);
}
