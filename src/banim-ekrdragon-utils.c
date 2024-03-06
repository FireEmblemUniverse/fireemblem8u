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

/* https://decomp.me/scratch/kpj5y */
#if NONMATCHING
void EkrDragonQuakeMain(struct ProcEkrDragonQuake * proc)
{
    s16 x1, y1;
    s16 x2, y2;

    struct EkrDragonQuakePriv * priv = proc->priv;

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

#else

NAKEDFUNC
void EkrDragonQuakeMain(struct ProcEkrDragonQuake * proc)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    mov sl, r0\n\
    ldr r0, [r0, #0x5c]\n\
    mov r9, r0\n\
    ldr r4, _08070554  @ gEkrBg2QuakeVec\n\
    ldrh r1, [r4]\n\
    ldrh r2, [r4, #2]\n\
    movs r0, #2\n\
    bl BG_SetPosition\n\
    ldr r6, _08070558  @ gEkrBg0QuakeVec\n\
    ldrh r1, [r6]\n\
    ldrh r2, [r4]\n\
    adds r1, r1, r2\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0x10\n\
    ldrh r2, [r6, #2]\n\
    ldrh r3, [r4, #2]\n\
    adds r2, r2, r3\n\
    lsls r2, r2, #0x10\n\
    lsrs r2, r2, #0x10\n\
    movs r0, #0\n\
    bl BG_SetPosition\n\
    ldrh r0, [r6]\n\
    ldrh r7, [r4]\n\
    adds r0, r0, r7\n\
    negs r0, r0\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    ldrh r1, [r6, #2]\n\
    ldrh r2, [r4, #2]\n\
    adds r1, r1, r2\n\
    negs r1, r1\n\
    lsls r1, r1, #0x10\n\
    asrs r1, r1, #0x10\n\
    bl EkrGauge_Setxy323A\n\
    ldrh r0, [r6]\n\
    ldrh r3, [r4]\n\
    adds r0, r0, r3\n\
    negs r0, r0\n\
    lsls r0, r0, #0x10\n\
    lsrs r0, r0, #0x10\n\
    ldrh r1, [r6, #2]\n\
    ldrh r7, [r4, #2]\n\
    adds r1, r1, r7\n\
    negs r1, r1\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0x10\n\
    bl EkrDispUP_SetPositionSync\n\
    ldrh r1, [r4]\n\
    ldrh r2, [r4, #2]\n\
    movs r0, #3\n\
    bl BG_SetPosition\n\
    ldr r0, _0807055C  @ gEkrXPosReal\n\
    ldrh r1, [r0]\n\
    ldrh r0, [r4]\n\
    subs r1, r1, r0\n\
    ldr r2, _08070560  @ gEkrBgPosition\n\
    ldr r5, [r2]\n\
    subs r1, r1, r5\n\
    lsls r1, r1, #0x10\n\
    ldr r3, _08070564  @ gEkrYPosReal\n\
    ldrh r2, [r3]\n\
    ldrh r3, [r4, #2]\n\
    subs r2, r2, r3\n\
    lsls r2, r2, #0x10\n\
    ldr r4, _0807055C  @ gEkrXPosReal\n\
    ldrh r4, [r4, #2]\n\
    adds r0, r0, r4\n\
    subs r0, r0, r5\n\
    lsls r0, r0, #0x10\n\
    lsrs r5, r0, #0x10\n\
    ldr r7, _08070564  @ gEkrYPosReal\n\
    ldrh r0, [r7, #2]\n\
    subs r0, r0, r3\n\
    lsls r0, r0, #0x10\n\
    lsrs r4, r0, #0x10\n\
    lsrs r0, r1, #0x10\n\
    mov r8, r0\n\
    asrs r1, r1, #0x10\n\
    lsrs r7, r2, #0x10\n\
    asrs r2, r2, #0x10\n\
    movs r0, #0\n\
    bl SetEkrFrontAnimPostion\n\
    lsls r1, r5, #0x10\n\
    asrs r1, r1, #0x10\n\
    lsls r2, r4, #0x10\n\
    asrs r2, r2, #0x10\n\
    movs r0, #1\n\
    bl SetEkrFrontAnimPostion\n\
    mov r1, r9\n\
    cmp r1, #0\n\
    beq _08070498\n\
    mov r2, r8\n\
    strh r2, [r1, #0x32]\n\
    strh r7, [r1, #0x3a]\n\
_08070498:\n\
    mov r3, sl\n\
    ldrh r0, [r3, #0x2c]\n\
    adds r0, #1\n\
    strh r0, [r3, #0x2c]\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    movs r4, #0x2e\n\
    ldrsh r1, [r3, r4]\n\
    cmp r0, r1\n\
    ble _08070544\n\
    movs r0, #2\n\
    movs r1, #0\n\
    movs r2, #0\n\
    bl BG_SetPosition\n\
    ldrh r1, [r6]\n\
    ldrh r2, [r6, #2]\n\
    movs r0, #0\n\
    bl BG_SetPosition\n\
    ldrh r0, [r6]\n\
    negs r0, r0\n\
    lsls r0, r0, #0x10\n\
    asrs r0, r0, #0x10\n\
    ldrh r1, [r6, #2]\n\
    negs r1, r1\n\
    lsls r1, r1, #0x10\n\
    asrs r1, r1, #0x10\n\
    bl EkrGauge_Setxy323A\n\
    ldrh r0, [r6]\n\
    negs r0, r0\n\
    lsls r0, r0, #0x10\n\
    lsrs r0, r0, #0x10\n\
    ldrh r1, [r6, #2]\n\
    negs r1, r1\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0x10\n\
    bl EkrDispUP_SetPositionSync\n\
    movs r0, #3\n\
    movs r1, #0\n\
    movs r2, #0\n\
    bl BG_SetPosition\n\
    ldr r7, _08070560  @ gEkrBgPosition\n\
    ldr r2, [r7]\n\
    ldr r0, _0807055C  @ gEkrXPosReal\n\
    ldrh r1, [r0]\n\
    subs r1, r1, r2\n\
    lsls r1, r1, #0x10\n\
    ldrh r0, [r0, #2]\n\
    subs r0, r0, r2\n\
    lsls r0, r0, #0x10\n\
    lsrs r5, r0, #0x10\n\
    ldr r2, _08070564  @ gEkrYPosReal\n\
    ldrh r4, [r2, #2]\n\
    lsrs r3, r1, #0x10\n\
    mov r8, r3\n\
    asrs r1, r1, #0x10\n\
    ldrh r7, [r2]\n\
    movs r0, #0\n\
    ldrsh r2, [r2, r0]\n\
    movs r0, #0\n\
    bl SetEkrFrontAnimPostion\n\
    lsls r1, r5, #0x10\n\
    asrs r1, r1, #0x10\n\
    lsls r2, r4, #0x10\n\
    asrs r2, r2, #0x10\n\
    movs r0, #1\n\
    bl SetEkrFrontAnimPostion\n\
    mov r1, r9\n\
    cmp r1, #0\n\
    beq _08070536\n\
    mov r2, r8\n\
    strh r2, [r1, #0x32]\n\
    strh r7, [r1, #0x3a]\n\
_08070536:\n\
    mov r3, sl\n\
    ldr r0, [r3, #0x60]\n\
    bl Proc_End\n\
    mov r0, sl\n\
    bl Proc_Break\n\
_08070544:\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08070554: .4byte gEkrBg2QuakeVec\n\
_08070558: .4byte gEkrBg0QuakeVec\n\
_0807055C: .4byte gEkrXPosReal\n\
_08070560: .4byte gEkrBgPosition\n\
_08070564: .4byte gEkrYPosReal\n\
    .syntax divided\n\
");
}
#endif

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
