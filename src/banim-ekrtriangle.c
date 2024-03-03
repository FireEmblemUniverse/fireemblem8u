#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

EWRAM_OVERLAY(banim) int gEkrTriangleInvalid = 0;

bool CheckEkrTriangleInvalid(void)
{
    if (gEkrTriangleInvalid == true)
        return true;

    return false;
}

void nullsub_18(void)
{
    return;
}

CONST_DATA struct ProcCmd ProcScr_ekrTriangle[] = {
    PROC_NAME("ekrTriangle"),
    PROC_REPEAT(EkrTriangleMain),
    PROC_END
};

void NewEkrTriangle(struct Anim * anim)
{
    struct ProcEkrTriangle *proc;
    proc = Proc_Start(ProcScr_ekrTriangle, PROC_TREE_3);
    proc->anim = anim;
    gEkrTriangleInvalid = false;
}

void EkrTriangleMain(struct ProcEkrTriangle * proc)
{
    int jid, jid1, jid2, wpn_type;
    int etype2;
    int ewtype1;
    int ewtype2;
    int etype1;
    struct Unit *unit;
    u16 wpn;
    s32 nine = 9;

    etype1 = 0;
    etype2 = 0;
    ewtype1 = 0;
    ewtype2 = 0;

    jid = (GetAnimPosition(proc->anim) == EKR_POS_L) 
        ? gpEkrBattleUnitLeft->unit.pClassData->number
        : gpEkrBattleUnitRight->unit.pClassData->number; 

    if (jid >= nine) {
        if (jid <= 0xC) {
            unit = gpEkrTriangleUnits[0];
            jid1 = unit->pClassData->number;
            if (jid1 == CLASS_ARMOR_KNIGHT)
                etype1 = EKR_TRI_JTYPE_DEFAULT;
            if (jid1 == CLASS_ARMOR_KNIGHT_F)
                etype1 = EKR_TRI_JTYPE_DEFAULT;
            if (jid1 == CLASS_GENERAL)
                etype1 = EKR_TRI_JTYPE_PROMOTED;
            if (jid1 == CLASS_GENERAL_F)
                etype1 = EKR_TRI_JTYPE_PROMOTED;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = ITYPE_LANCE;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case ITYPE_LANCE:
                ewtype1 = EKR_TRI_WTYPE_DEFAULT;
                break;

            case ITYPE_AXE:
                ewtype1 = GetItemIndex(wpn) == ITEM_AXE_HANDAXE
                            ? EKR_TRI_WTYPE_ALTERNATIVE2
                            : EKR_TRI_WTYPE_ALTERNATIVE;

            default:
                break;
            }

            unit = gpEkrTriangleUnits[1];
            jid2 = unit->pClassData->number;
            if (jid2 == CLASS_ARMOR_KNIGHT)
                etype2 = EKR_TRI_JTYPE_DEFAULT;
            if (jid2 == CLASS_ARMOR_KNIGHT_F)
                etype2 = EKR_TRI_JTYPE_DEFAULT;
            if (jid2 == CLASS_GENERAL)
                etype2 = EKR_TRI_JTYPE_PROMOTED;
            if (jid2 == CLASS_GENERAL_F)
                etype2 = EKR_TRI_JTYPE_PROMOTED;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = ITYPE_LANCE;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case ITYPE_LANCE:
                ewtype2 = EKR_TRI_WTYPE_DEFAULT;
                break;

            case ITYPE_AXE:
                ewtype2 = GetItemIndex(wpn) == ITEM_AXE_HANDAXE
                            ? EKR_TRI_WTYPE_ALTERNATIVE2
                            : EKR_TRI_WTYPE_ALTERNATIVE;
                break;

            default:
                break;
            }

            NewEkrTriArmorKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

            if (GetItemIndex(gpEkrBattleUnitRight->weaponBefore) == ITEM_AXE_HANDAXE)
                gEkrTriangleInvalid = false;
            else
                gEkrTriangleInvalid = true;
            goto proc_break;
        }
    }

    unit = gpEkrTriangleUnits[0];
    jid1 = unit->pClassData->number;
    if (jid1 == CLASS_PEGASUS_KNIGHT)
        etype1 = EKR_TRI_JTYPE_DEFAULT;
    if (jid1 == CLASS_FALCON_KNIGHT)
        etype1 = EKR_TRI_JTYPE_PROMOTED;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = ITYPE_LANCE;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case ITYPE_LANCE:
        ewtype1 = EKR_TRI_WTYPE_DEFAULT;
        break;

    case ITYPE_SWORD:
        ewtype1 = EKR_TRI_WTYPE_ALTERNATIVE;
        break;

    default:
        break;
    }

    unit = gpEkrTriangleUnits[1];
    jid2 = unit->pClassData->number;
    if (jid2 == CLASS_PEGASUS_KNIGHT)
        etype2 = 0;
    if (jid2 == CLASS_FALCON_KNIGHT)
        etype2 = 1;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = ITYPE_LANCE;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case ITYPE_LANCE:
        ewtype2 = 0;
        break;

    case ITYPE_SWORD:
        ewtype2 = 1;
        break;
    }

    NewEkrTriPegasusKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

    if (jid == CLASS_PEGASUS_KNIGHT)
        gEkrTriangleInvalid = false;
    else
        gEkrTriangleInvalid = true;
proc_break:
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnight[] = {
    PROC_NAME("ekrTriPegasusKnight"),
    PROC_REPEAT(EkrTriPegasusKnightMain),
    PROC_END
};

ProcPtr NewEkrTriPegasusKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2)
{
    struct ProcEkrTriClass * proc;
    proc = Proc_Start(ProcScr_ekrTriPegasusKnight, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->etype1 = ekr1;
    proc->etype2 = ekr2;
    proc->ewtype1 = banim1;
    proc->ewtype2 = ewtype2;
    return proc;
}

void EkrTriPegasusKnightMain(struct ProcEkrTriClass * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 0xA)
        NewEkrTriPegasusKnightOBJ(proc->anim, EKR_POS_L, proc->etype1, proc->ewtype1);

    if (proc->timer == 0x1C)
        NewEfxFlashBgWhite(anim1, 0x6);

    if (proc->timer == 0x22)
    {
        NewEkrTriPegasusKnightBG(anim1, EKR_POS_L, proc->etype1, proc->ewtype1);
        NewEkrTriPegasusKnightOBJ(proc->anim, EKR_POS_R, proc->etype2, proc->ewtype2);
        PlaySFX(0x268, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x33)
        NewEfxFlashBgWhite(anim1, 0x6);

    if (proc->timer == 0x39)
    {
        NewEkrTriPegasusKnightBG(anim1, EKR_POS_R, proc->etype2, proc->ewtype2);
        PlaySFX(0x268, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x43)
    {
        gEkrTriangleInvalid = true;
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnightBG[] = {
    PROC_NAME("efxTriPegasusKnightBG"),
    PROC_REPEAT(EkrTriPegasusKnightBgMain),
    PROC_END
};

const s16 FrameLut_EkrTriPegagusBGLeft[0x7] = {
    0x03, 0x02,
    0x04, 0x02,
    0x05, 0x01,
    -1
};

const s16 FrameLut_EkrTriPegagusBGRight[0x7] = {
    0x00, 0x02,
    0x01, 0x02,
    0x02, 0x01,
    -1
};

CONST_DATA const u16 * TsaLut_EkrTriPegagusBG[] = {
    Tsa_EkrTriPegagusRightBG1,
    Tsa_EkrTriPegagusRightBG2,
    Tsa_EkrTriPegagusRightBG3,
    Tsa_EkrTriPegagusLeftBG1,
    Tsa_EkrTriPegagusLeftBG2,
    Tsa_EkrTriPegagusLeftBG3,
};

void NewEkrTriPegasusKnightBG(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    char * pal;
    const u16 * img;
    struct ProcEkrTriPegasusKnightBG * proc;
    proc = Proc_Start(ProcScr_ekrTriPegasusKnightBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (pos == EKR_POS_L)
    {
        pal = gBanimTriAtkPalettes[EKR_POS_L];
        proc->frame_config = FrameLut_EkrTriPegagusBGLeft;
    }
    else
    {
        pal = gBanimTriAtkPalettes[EKR_POS_R];
        proc->frame_config = FrameLut_EkrTriPegagusBGRight;
    }

    proc->tsalut_left = TsaLut_EkrTriPegagusBG;
    proc->tsalut_right = TsaLut_EkrTriPegagusBG;

    LZ77UnCompWram(pal, gSpellAnimBgfx);
    SpellFx_RegisterBgPal((u16 *)gSpellAnimBgfx, 0x20);

    img = Img_TriPegasusKnightBG;
    if (etype != EKR_TRI_JTYPE_DEFAULT)
    {
        img = Img_TriFalconKnightSwordBG;

        if (ewtype == EKR_TRI_WTYPE_DEFAULT)
            img = Img_TriFalconKnightLanceBG;
    }

    SpellFx_RegisterBgGfx(img, 0x2000);
}

void EkrTriPegasusKnightBgMain(struct ProcEkrTriPegasusKnightBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        const u16 **buf1 = proc->tsalut_left;
        const u16 **buf2 = proc->tsalut_right;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_EkrTriPegasusKnightOBJ[] = {
    PROC_NAME("ekrTriPegasusKnightOBJ"),
    PROC_REPEAT(EkrTriPegasusKnightObjMain),
    PROC_END
};

void NewEkrTriPegasusKnightOBJ(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    struct ProcEfxOBJ * proc;
    char * pal;
    u32 * scr;
    const u16 * img;

    proc = Proc_Start(ProcScr_EkrTriPegasusKnightOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (pos == EKR_POS_L)
    {
        proc->terminator = 0x12;
        pal = gBanimTriAtkPalettes[EKR_POS_L];
        scr = AnimScr_TriAtkLeft;
    }
    else
    {
        proc->terminator = 0x11;
        pal = gBanimTriAtkPalettes[EKR_POS_R];
        scr = AnimScr_TriAtkRight;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    LZ77UnCompWram(pal, gBuf_Banim);
    SpellFx_RegisterObjPal((u16 *)gBuf_Banim, 0x20);

    img = Img_TriPegasusKnightOBJ;
    if (etype != EKR_TRI_JTYPE_DEFAULT)
    {
        img = Img_TriFalconKnightSwordOBJ;

        if (ewtype == EKR_TRI_WTYPE_DEFAULT)
            img = Img_TriFalconKnightLanceOBJ;
    }

    SpellFx_RegisterObjGfx(img, 0x1000);
}

void EkrTriPegasusKnightObjMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnight[] = {
    PROC_NAME("ekrTriArmorKnight"),
    PROC_REPEAT(EkrTriArmorKnightMain),
    PROC_END
};

ProcPtr NewEkrTriArmorKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2)
{
    struct ProcEkrTriClass * proc;
    proc = Proc_Start(ProcScr_EkrTriArmorKnight, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->etype1 = ekr1;
    proc->etype2 = ekr2;
    proc->ewtype1 = banim1;
    proc->ewtype2 = ewtype2;
    return proc;
}

void EkrTriArmorKnightMain(struct ProcEkrTriClass * proc)
{
    if (++proc->timer == 0x1)
    {
        NewEkrTriArmorKnightOBJ(proc->anim, proc->etype1, proc->etype2, proc->ewtype1, proc->ewtype2);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x30)
    {
        NewEkrTriArmorKnightOBJ2(proc->anim, 0, proc->etype1, proc->ewtype1);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x3C)
    {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        NewEfxTriangleQUAKE(proc->anim, 0xA);
    }

    if (proc->timer == 0x4F)
    {
        NewEkrTriArmorKnightOBJ2(proc->anim, 1, proc->etype2, proc->ewtype2);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x5B)
        gEkrTriangleInvalid = true;

    if (proc->timer == 0x60)
    {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        NewEfxTriangleQUAKE(proc->anim, 0xA);
    }

    if (proc->timer == 0x78)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ[] = {
    PROC_NAME("ekrTriArmorKnightOBJ"),
    PROC_REPEAT(EkrTriArmorKnightObjMain),
    PROC_END
};

void NewEkrTriArmorKnightOBJ(struct Anim *anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2, * anim3;
    char * pal;
    u32 * scr;
    const u16 * img;

    proc = Proc_Start(ProcScr_EkrTriArmorKnightOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x14;
    pal = gBanimTriAtkPalettes[0];

    if (etype1 == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightOBJ;
        img = Img_TriKnightOBJ;
    }
    else
    {
        switch (ewtype1)
        {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceOBJ;
            img = Img_TriGenerialLanceOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeOBJ;
            img = Img_TriGenerialAxeOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeOBJ;
            img = Img_TriGenerialHandAxeOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_PAL(0x8) + OAM2_LAYER(0x2) + OAM2_CHR(0x0800 / 0x20);

    LZ77UnCompWram(pal, gBuf_Banim);
    CpuFastCopy(gBuf_Banim, PAL_OBJ(0x8), 0x20);
    LZ77UnCompWram(img, gBuf_Banim);

    pal = gBanimTriAtkPalettes[1];
    if (etype2 == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightOBJ;
        img = Img_TriKnightOBJ;
    }
    else
    {
        switch (ewtype2)
        {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceOBJ;
            img = Img_TriGenerialLanceOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeOBJ;
            img = Img_TriGenerialAxeOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeOBJ;
            img = Img_TriGenerialHandAxeOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim3 = anim2;
    anim2->oam2Base = OAM2_PAL(0xA) + OAM2_LAYER(0x2) + OAM2_CHR(0x1000 / 0x20);

    LZ77UnCompWram(pal, &gBuf_Banim[0x800]);
    CpuFastCopy(&gBuf_Banim[0x800], PAL_OBJ(0xA), 0x20);
    LZ77UnCompWram(img, &gBuf_Banim[0x800]);

{
    u16 * dst = OBJ_VRAM0 + 0x800;
    RegisterDataMove(gBuf_Banim, dst, 0x1000);
}
    EnablePaletteSync();

    proc->anim2->xPosition = proc->anim->xPosition + 0x20;
    proc->anim3->xPosition = proc->anim->xPosition - 0x20;
}

void EkrTriArmorKnightObjMain(struct ProcEfxOBJ * proc)
{
    int ret;
    ret = Interpolate(INTERPOLATE_LINEAR, 0x20, 0x0, proc->timer, proc->terminator);
    proc->anim2->xPosition = proc->anim->xPosition + ret;
    proc->anim3->xPosition = proc->anim->xPosition - ret;

    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        AnimDelete(proc->anim3);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ2[] = {
    PROC_NAME("ekrTriArmorKnightOBJ2"),
    PROC_REPEAT(EkrTriArmorKnightObj2Main1),
    PROC_REPEAT(EkrTriArmorKnightObj2Main2),
    PROC_END
};

void NewEkrTriArmorKnightOBJ2(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    struct ProcEkrTriArmorKnightOBJ2 * proc;
    struct Anim * anim2, *_anim;
    char * pal;
    u32 * scr;
    const u16 * buf;
    int off;

    proc = Proc_Start(ProcScr_EkrTriArmorKnightOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x5;
    proc->unk29 = pos;
    proc->unk2A = etype;

    if (pos == 0)
        pal = gBanimTriAtkPalettes[EKR_POS_L];
    else
        pal = gBanimTriAtkPalettes[EKR_POS_R];

    if (etype == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightAtkOBJ;
        buf = Img_TriKnightAtkOBJ;
    }
    else
    {
        switch (ewtype)
        {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceAtkOBJ;
            buf = Img_TriGenerialLanceAtkOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeAtkOBJ;
            buf = Img_TriGenerialAxeAtkOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeAtkOBJ;
            buf = Img_TriGenerialHandAxeAtkOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = anim2;

    if (pos == 0)
    {
        anim2->yPosition += 0xA;
        proc->anim2->drawLayerPriority = 0x78;
        AnimSort();

        _anim = proc->anim;
        proc->unk32 = _anim->xPosition + 0x10;
        proc->unk34 = _anim->xPosition - 0x10;
        proc->anim2->xPosition = proc->unk32;
    }
    else
    {
        anim2->yPosition += 0x2;
        proc->anim2->drawLayerPriority = 0x14;
        AnimSort();

        _anim = proc->anim;
        proc->unk32 = _anim->xPosition - 0x0C;
        proc->unk34 = _anim->xPosition - 0x10;
        proc->anim2->xPosition = proc->unk32;
    }

    LZ77UnCompWram(pal, gBuf_Banim);
    SpellFx_RegisterObjPal((u16 *)gBuf_Banim, 0x20);
    SpellFx_RegisterObjGfx(buf, 0x1000);
}

void EkrTriArmorKnightObj2Main1(struct ProcEkrTriArmorKnightOBJ2 * proc)
{
    int ret;
    ret = Interpolate(INTERPOLATE_SQUARE, proc->unk32, proc->unk34, proc->timer, proc->terminator);
    proc->anim2->xPosition = ret;

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 0x14;
        Proc_Break(proc);
    }
}

void EkrTriArmorKnightObj2Main2(struct ProcEkrTriArmorKnightOBJ2 * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_EfxTriangleQUAKE[] = {
    PROC_NAME("efxTriangleQUAKE"),
    PROC_REPEAT(EfxTriangleQUAKEMain),
    PROC_END
};

void NewEfxTriangleQUAKE(struct Anim * anim, int duration)
{
    struct ProcEfxTriagnleQUAKE * proc;

    gEfxBgSemaphore = gEfxBgSemaphore + 1;
    proc = Proc_Start(ProcScr_EfxTriangleQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->qproc = NewEfxQuakePure(0, 0);
    proc->timer = 0;
    proc->terminator = duration;
}

void EfxTriangleQUAKEMain(struct ProcEfxTriagnleQUAKE * proc)
{
    s16 ix1, iy1;
    s16 ix2, iy2;

    BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    ix1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    iy1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
    ix2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    iy2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

    SetEkrFrontAnimPostion(0, ix1, iy1);
    SetEkrFrontAnimPostion(1, ix2, iy2);

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore = gEfxBgSemaphore - 1;
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        ix1 = gEkrXPosReal[0] - gEkrBgPosition;
        iy1 = gEkrYPosReal[0];
        ix2 = gEkrXPosReal[1] - gEkrBgPosition;
        iy2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, ix1, iy1);
        SetEkrFrontAnimPostion(1, ix2, iy2);

        Proc_End(proc->qproc);
        Proc_Break(proc);
    }
}
