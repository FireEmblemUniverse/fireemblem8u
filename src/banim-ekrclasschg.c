#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

EWRAM_OVERLAY(banim) struct ProcEkrClasschg * gpProcEkrClasschg = NULL;

bool EkrClasschgFinished(void)
{
    if (gpProcEkrClasschg->done == true)
        return true;

    return false;
}

void EndEkrClasschg(void)
{
    Proc_End(gpProcEkrClasschg);
}

CONST_DATA struct ProcCmd ProcScr_ekrClasschg[] = {
    PROC_NAME("ekrClasschg"),
    PROC_SET_END_CB(EndEfxStatusUnit),
    PROC_REPEAT(EkrClasschgMain),
    PROC_REPEAT(EkrClasschgRegisterDone),
    PROC_END
};

void NewEkrClassChg(struct Anim * anim)
{
    NewEfxSpellCast();
    gpProcEkrClasschg = Proc_Start(ProcScr_ekrClasschg, PROC_TREE_3);
    gpProcEkrClasschg->anim = anim;
    gpProcEkrClasschg->timer = 0;
    gpProcEkrClasschg->done = false;
}

void EkrClasschgMain(struct ProcEkrClasschg * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);
    proc->timer = proc->timer + 1;

    if (0x01 == proc->timer)
    {
        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_3, 0, 0);

        DisableEfxStatusUnits(proc->anim);
        DisableEfxStatusUnits(anim1);

        SetWinEnable(0, 0, 0);

        NewEfxClasschgOBJGain(proc->anim);
        NewEfxClasschgBGSE00(anim1);
    }
    else if (0x28 == proc->timer)
        NewEkrClasschgBG1(anim1);
    else if (0x87 == proc->timer)
        NewEfxALPHA(proc->anim, 0, 0x38, 0x10, 0, 0);
    else if (0x88 == proc->timer)
        NewEfxWhiteInOutUnit(proc->anim, 0xC, 0x0);
    else if (0x94 == proc->timer)
        SetAnimStateHidden(EKR_POS_R);
    else if (0x8C == proc->timer)
    {
        NewEfxFlashBgWhite(proc->anim, 0xA);
        BG_SetPosition(BG_1, 0, 8);
    }
    else if (0x92 == proc->timer)
        NewEfxClasschgOBJDiffusion(proc->anim, 0);
    else if (0xBA == proc->timer)
    {
        proc->anim->oam2Base &= 0xF3FF;
        proc->anim->oam2Base |= 0x400;
    }
    else if (0xD8 == proc->timer)
        NewEfxClasschgOBJDrop(anim1);
    else if (0x100 == proc->timer)
    {
        NewEkrClasschgBG2(proc->anim);
        SetWinEnable(0, 0, 0);
        SetBlendConfig(0x1, 0x0, 0x10, 0x0);
        NewEfxALPHA(proc->anim, 0, 0x38, 0x0, 0x10, 0x0);

        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_3, 0, 0);
    }
    else if (0x11E == proc->timer)
    {
        SetAnimStateUnHidden(EKR_POS_L);
        NewEfxFlashBgWhite(proc->anim, 0x8);
        NewEfxFlashUnit(anim1, 0x0, 0x20, 0x0);
    }
    else if (0x13A == proc->timer)
    {
        anim1->oam2Base &= 0xF3FF;
        anim1->oam2Base |= 0x400;
        RegisterEfxSpellCastEnd();
        NewEfxWhiteIN(anim1, 0xA, 0x46);
    }
    else if (0x144 == proc->timer)
    {
        NewEfxClasschgFIN(anim1, 0x82);
        NewEfxClasschgCLONE(anim1, 0x82);
        NewEfxALPHA(anim1, 0x5A, 0x28, 0xE, 0x0, 0x2);
        NewefxRestRST(anim1, 0x82, 0xA, 0x100, 0x1);
        NewEfxRestWINH_(anim1, 0x82, 0x0);
        PlaySFX(0x13D, 0x100, anim1->xPosition, 0x1);
    } else if (0x14C == proc->timer)
        NewEfxClasschgOBJDiffusion(proc->anim, 1);
    else if (0x23C == proc->timer)
        Proc_Break(proc);

    if (0x28 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x52 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x68 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x72 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x74 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x76 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x78 == proc->timer)
        PlaySFX(0x13B, 0x100, proc->anim->xPosition, 0x1);
    else if (0x100 == proc->timer)
        PlaySFX(0x3E5, 0x100, proc->anim->xPosition, 0x1);
    else if (0x11E == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x120 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x122 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x126 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x12A == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x12E == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x132 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x134 == proc->timer)
        PlaySFX(0x3E6, 0x100, proc->anim->xPosition, 0x1);
}

void EkrClasschgRegisterDone(struct ProcEkrClasschg * proc)
{
    proc->done = true;
}

void EndEfxStatusUnit(void)
{
    Proc_EndEach(ProcScr_efxStatusUnit);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgBG[] = {
    PROC_NAME("efxClasschgBG"),
    PROC_REPEAT(EfxClasschgBgMain),
    PROC_END
};

CONST_DATA u16 * TsaLut_08759000[] = {
    Tsa_87932EC,
    Tsa_8793384,
    Tsa_8793494,
    Tsa_87935B0,
    Tsa_87936C0,
    Tsa_87937D0,
    Tsa_87938EC,
    Tsa_8799818,
    Tsa_8799ABC,
    Tsa_8799D64,
    Tsa_879A008,
    Tsa_879A2A8,
    Tsa_879A444,
    Tsa_879A6A0,
    Tsa_879A87C,
    Tsa_879A9E8,
    Tsa_879AB10,
    Tsa_87A18F0,
    Tsa_87A19EC,
    Tsa_87A1B68,
    Tsa_87A1D74,
    Tsa_87A1F9C,
    Tsa_87A2134,
    Tsa_87A2384,
    Tsa_87A2584,
    Tsa_87A2748,
    Tsa_87A28A8,
    Tsa_87A29DC,
    Tsa_87A2AE8,
    Tsa_87A2BE4,
    Tsa_87A2CCC,
    Tsa_87A2DB8,
    Tsa_87A4A88,
    Tsa_87A4B68,
    Tsa_87A4C44,
    Tsa_87A4D2C,
    Tsa_87A4E0C
};

CONST_DATA u16 * ImgLut_08759094[] = {
    Img_87929B8,
    Img_87929B8,
    Img_87929B8,
    Img_87929B8,
    Img_87929B8,
    Img_87929B8,
    Img_87929B8,
    Img_87939FC,
    Img_8794628,
    Img_87951D8,
    Img_8795DF4,
    Img_87969F4,
    Img_87970DC,
    Img_8797AC4,
    Img_8798394,
    Img_8798B6C,
    Img_8799228,
    Img_879AC08,
    Img_879B168,
    Img_879B8F4,
    Img_879C1E4,
    Img_879CAB4,
    Img_879D1F8,
    Img_879DC10,
    Img_879E5DC,
    Img_879EED0,
    Img_879F698,
    Img_879FD3C,
    Img_87A0338,
    Img_87A090C,
    Img_87A0E78,
    Img_87A13C0,
    Img_87A2EA0,
    Img_87A3400,
    Img_87A39A0,
    Img_87A3F38,
    Img_87A44D8
};

CONST_DATA u16 * PalLut_08759128[] = {
    Pal_87932CC,
    Pal_87932CC,
    Pal_87932CC,
    Pal_87932CC,
    Pal_87932CC,
    Pal_87932CC,
    Pal_87932CC,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87997F8,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A18D0,
    Pal_87A4A68,
    Pal_87A4A68,
    Pal_87A4A68,
    Pal_87A4A68,
    Pal_87A4A68
};

const u16 FrameLut_080E143A[] = {
    0x01, 0x02,
    0x00, 0x28,
    0x02, 0x02,
    0x00, 0x14,
    0x03, 0x02,
    0x00, 0x08,
    0x02, 0x02,
    0x00, 0x02,
    0x01, 0x02,
    0x07, 0x02,
    0x08, 0x02,
    0x09, 0x02,
    0x0A, 0x02,
    0x0B, 0x02,
    0x0C, 0x02,
    0x0D, 0x02,
    0x0E, 0x02,
    0x0F, 0x02,
    0x10, 0x02,
    -1
};

const u16 FrameLut_080E1488[] = {
    0x11, 0x02,
    0x12, 0x02,
    0x13, 0x02,
    0x14, 0x02,
    0x15, 0x02,
    0x16, 0x02,
    0x17, 0x02,
    0x18, 0x02,
    0x19, 0x02,
    0x1A, 0x02,
    0x1B, 0x02,
    0x1C, 0x02,
    0x1D, 0x02,
    0x1E, 0x02,
    0x1F, 0x02,
    0x04, 0x02,
    0x05, 0x02,
    0x06, 0x02,
    0x00, 0x02,
    0x05, 0x02,
    0x00, 0x02,
    0x04, 0x02,
    0x00, 0x02,
    0x05, 0x02,
    0x00, 0x02,
    0x06, 0x02,
    0x20, 0x02,
    0x21, 0x02,
    0x22, 0x02,
    0x23, 0x02,
    0x24, 0x02,
    -1
};

void NewEkrClasschgBG1(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameLut_080E143A;
    proc->tsal = TsaLut_08759000;
    proc->tsar = TsaLut_08759000;
    proc->img = ImgLut_08759094;
    proc->pal = PalLut_08759128;

    SpellFx_SetSomeColorEffect();
}

void NewEkrClasschgBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameLut_080E1488;
    proc->tsal = TsaLut_08759000;
    proc->tsar = TsaLut_08759000;
    proc->img = ImgLut_08759094;
    proc->pal = PalLut_08759128;

    SpellFx_SetSomeColorEffect();
}

void EfxClasschgBgMain(struct ProcEfxBG * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsal = proc->tsal;
        u16 ** tsar = proc->tsar;
        u16 ** img  = proc->img;
        u16 ** pal  = proc->pal;

        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        SpellFx_RegisterBgPal(pal[ret], 0x20);
        SpellFx_WriteBgMap(anim1, tsal[ret], tsar[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_End(proc);
        return;
    }
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgBGSE00[] = {
    PROC_NAME("efxClasschgBGSE00"),
    PROC_REPEAT(EfxClasschgBGSE00Main),
    PROC_END
};

void NewEfxClasschgBGSE00(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBGSE00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxClasschgBGSE00Main(struct ProcEfxBG * proc)
{
    proc->timer = proc->timer + 1;
    if (0x28 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x52 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x68 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x72 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x74 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x76 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x78 == proc->timer)
        PlaySFX(0x13B, 0x100, proc->anim->xPosition, 0x1);

    /* ? */
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgBGSE01[] = {
    PROC_NAME("efxClasschgBGSE01"),
    PROC_REPEAT(EfxClasschgBGSE01Main),
    PROC_END
};

void NewEfxClasschgBGSE01(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBGSE01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxClasschgBGSE01Main(struct ProcEfxBG * proc)
{
    proc->timer = proc->timer + 1;
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJGain[] = {
    PROC_NAME("efxClasschgOBJGain"),
    PROC_SLEEP(0x64),
    PROC_REPEAT(EfxClasschgOBJGainMain),
    PROC_END
};

void NewEfxClasschgOBJGain(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    proc = Proc_Start(ProcScr_efxClasschgOBJGain, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, BanimScr_08792928, BanimScr_08792928, BanimScr_08792928, BanimScr_08792928);

    SpellFx_RegisterObjPal(Pal_08792194, 0x20);
    SpellFx_RegisterObjGfx(Img_08791D9C, 0x1000);
}

void EfxClasschgOBJGainMain(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJDrop[] = {
    PROC_NAME("efxClasschgOBJDrop"),
    PROC_SLEEP(0x64),
    PROC_REPEAT(EfxClasschgOBJDropMain),
    PROC_END
};

void NewEfxClasschgOBJDrop(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    proc = Proc_Start(ProcScr_efxClasschgOBJDrop, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, BanimScr_08792958, BanimScr_08792958, BanimScr_08792958, BanimScr_08792958);

    SpellFx_RegisterObjPal(Pal_08792194, 0x20);
    SpellFx_RegisterObjGfx(Img_08791D9C, 0x1000);
}

void EfxClasschgOBJDropMain(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgOBJDiffusion[] = {
    PROC_NAME("efxClasschgOBJDiffusion"),
    PROC_SLEEP(0x64),
    PROC_REPEAT(EfxClasschgOBJDiffusionMain),
    PROC_END
};

void NewEfxClasschgOBJDiffusion(struct Anim * anim, u8 pos)
{
    struct ProcEfxOBJ * proc;
    proc = Proc_Start(ProcScr_efxClasschgOBJDiffusion, PROC_TREE_3);

    if (pos == EKR_POS_L)
        proc->anim = anim;
    else
        proc->anim = GetAnimAnotherSide(anim);

{
    u32 * scr = BanimScr_08792988;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
}

    SpellFx_RegisterObjPal(Pal_08792194, 0x20);
    SpellFx_RegisterObjGfx(Img_08791D9C, 0x1000);
}

void EfxClasschgOBJDiffusionMain(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgFIN[] = {
    PROC_NAME("efxClasschgFIN"),
    PROC_REPEAT(EfxClasschgFinMain),
    PROC_END
};

void NewEfxClasschgFIN(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgFIN, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    SpellFx_RegisterBgPal(Pal_08791D7C, 0x20);
    SpellFx_RegisterBgGfx(Img_086849B8, 0x2000);

    EfxTmCpyBG(gUnknown_08684AB8, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();
    SetBlendConfig(0x1, 0xE, 0x8, 0x0);

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    gLCDControlBuffer.bldcnt.target2_bd_on = true;

    anim->oamBase  |= 0x0800;
    anim->oam2Base &= 0xF3FF;
    anim->oam2Base |= 0x0400;
}

void EfxClasschgFinMain(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;
    gLCDControlBuffer.bgoffset[1].y--;
    
    if (++proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        anim->oamBase  &= ~0x800;
        anim->oam2Base &= 0xF3FF;
        anim->oam2Base |= 0x0800;
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgCLONE[] = {
    PROC_NAME("efxClasschgCLONE"),
    PROC_SET_END_CB(EfxClasschgCloneCallBack),
    PROC_REPEAT(EfxClasschgCloneMain),
    PROC_END
};

void NewEfxClasschgCLONE(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;
}

void EfxClasschgCloneMain(struct ProcEfxBG * proc)
{
    struct Anim _anim;
    struct Anim * anim = proc->anim;

    _anim.xPosition = anim->xPosition;
    _anim.yPosition = anim->yPosition;
    _anim.pSpriteData = anim->pSpriteData;
    _anim.oamBase = anim->oamBase & ~0x0800;
    _anim.oam2Base = anim->oam2Base;
    
    _anim.oam2Base &= 0xF3FF;
    _anim.oam2Base |= 0x0800;

    AnimDisplay(&_anim);

    if (++proc->timer == proc->terminator)
        Proc_Break(proc);
}

void EfxClasschgCloneCallBack(void)
{
    return;
}

CONST_DATA struct ProcCmd ProcScr_efxBlackInOutUnit[] = {
    PROC_NAME("efxBlackInOutUnit"),
    PROC_REPEAT(EfxBlackInOutUnitMain),
    PROC_END
};

void NewEfxBlackInOutUnit(struct Anim * anim, int duration, int arg)
{
    struct ProcEfxClasschgInOutUnit * proc;
    proc = Proc_Start(ProcScr_efxBlackInOutUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    if (arg == 0)
    {
        proc->start = 0;
        proc->end = 0x10;
    }
    else
    {
        proc->start = 0x10;
        proc->end = 0;
    }
}

void EfxBlackInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, proc->start, proc->end, proc->timer, proc->terminator);
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(0x7), 0x20);
        EfxPalBlackInOut(PAL_BG(0x0), 0x17, 0x1, ret);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(0x9), 0x20);
        EfxPalBlackInOut(PAL_BG(0x0), 0x19, 0x1, ret);
    }

    EnablePaletteSync();

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxWhiteInOutUnit[] = {
    PROC_NAME("efxWhiteInOutUnit"),
    PROC_REPEAT(EfxWhiteInOutUnitMain),
    PROC_END
};

void NewEfxWhiteInOutUnit(struct Anim * anim, int duration, int arg)
{
    struct ProcEfxClasschgInOutUnit * proc;
    proc = Proc_Start(ProcScr_efxWhiteInOutUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    if (arg == 0)
    {
        proc->start = 0;
        proc->end = 0x10;
    }
    else
    {
        proc->start = 0x10;
        proc->end = 0;
    }
}

void EfxWhiteInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, proc->start, proc->end, proc->timer, proc->terminator);
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(0x7), 0x20);
        EfxPalWhiteInOut(PAL_BG(0x0), 0x17, 0x1, ret);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(0x9), 0x20);
        EfxPalWhiteInOut(PAL_BG(0x0), 0x19, 0x1, ret);
    }

    EnablePaletteSync();

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxClasschgRST[] = {
    PROC_NAME("efxClasschgRST"),
    PROC_REPEAT(EfxClasschgRSTMain),
    PROC_END
};

void NewEfxClasschgRST(struct Anim * anim, struct ProcSubEkrClasschgRST * subproc, int duration, int start, int end)
{
    struct ProcEkrClasschgRST * proc;
    gEfxBgSemaphore = gEfxBgSemaphore + 1;
    proc = Proc_Start(ProcScr_efxClasschgRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;
    proc->start = start;
    proc->end = end;
    proc->subproc = subproc;
}

void EfxClasschgRSTMain(struct ProcEkrClasschgRST * proc)
{
    struct ProcSubEkrClasschgRST * subproc = proc->subproc;
    int ret = Interpolate(INTERPOLATE_RSQUARE, proc->start, proc->end, proc->timer, proc->terminator);
    subproc->unk4C = ret;

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
