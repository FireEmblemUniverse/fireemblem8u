#include "global.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmmap.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon *proc);

void Fill16_EkrTsaBuffer(u32 val)
{
    int i;
    u32 tmp, *buf;

    val = (val << 0x10);
    buf = (u32 *)gEkrTsaBuffer;
    tmp = val | val >> 0x10;

    for (i = 0; i < 0x400; i++)
        *buf++ = tmp;
}

void EkrDZ_CustomBgFadeIn(struct ProcEkrDragon *proc)
{
    EkrUpdateSomePalMaybe(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxDracoZombiePrepareTSA(int x, int y, s8 pos)
{
    if (pos == EKR_BATTLE_RIGHT)
        LZ77UnCompVram(Tsa_EfxDracoZombieBaseRight, gEkrTsaBuffer);
    else
        LZ77UnCompVram(Tsa_EfxDracoZombieBaseLeft, gEkrTsaBuffer);
    
    sub_806FBB8();

    x += gEkrBgXOffset;
    EkrDragonBgSetPostion(x, y);
}

void EfxDracoZombiePrepareImg(struct ProcEkrDragon *proc)
{
    Fill16_EkrTsaBuffer(0);
    sub_80559D0(0);
    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    LZ77UnCompVram(Img_EfxDracoZombie, (void *)0x06008000);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;

    CpuFastCopy(Pal_EfxDracoZombie, PAL_BG(6), 0x20);
    EnablePaletteSync();

    CpuFastCopy(PAL_BG(4), gEkrDragonPalBackup, 0x40);
    SetEkrDragonStatusUnk1(1);
    proc->tcounter = 0;
}

void EkrDZ_MonsterFlyIntoScreen(struct ProcEkrDragon *proc)
{
    int x, y;

    if (gEkrDistanceType == EKR_DISTANCE_FARFAR) {
        EkrDZ_PrepareBanimfx(proc);
        Proc_Goto(proc, 0);
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0) {

        /* Something related to monster's bark */
        switch (gEkrDracoZombiTsaSetLut[proc->tcounter].type) {
        case 1:
            EkrSoundSomeBark(0xE6, 0x100, 0x78, 0);
            break;

        case 2:
            EkrSoundSomeBark(0x2E0, 0x100, 0x78, 0);
            break;

        default:
            break;
        }

        if (gEkrDracoZombiTsaSetLut[proc->tcounter].tsa == NULL) {
            proc->timer = 0;
            StartSpellBG_FLASH(proc->anim, 0x10);
            NewEkrDragonQuakeTree3(NULL, 0x2D, 0xB);
            Proc_Break(proc);
            return;
        }

        LZ77UnCompVram(gEkrDracoZombiTsaSetLut[proc->tcounter].tsa, gEkrTsaBuffer);
        sub_806FBB8();
    }

    x = Interpolate(INTERPOLATE_LINEAR, gEkrDracoZombiTsaSetLut[proc->tcounter].lox, gEkrDracoZombiTsaSetLut[proc->tcounter + 1].lox, proc->timer, gEkrDracoZombiTsaSetLut[proc->tcounter].time);
    y = Interpolate(INTERPOLATE_LINEAR, gEkrDracoZombiTsaSetLut[proc->tcounter].loy, gEkrDracoZombiTsaSetLut[proc->tcounter + 1].loy, proc->timer, gEkrDracoZombiTsaSetLut[proc->tcounter].time);

    EkrDragonBgSetPostion(x + gEkrBgXOffset, y);

    proc->timer++;
    if (proc->timer == gEkrDracoZombiTsaSetLut[proc->tcounter].time) {
        proc->timer = 0;
        proc->tcounter++;
    }
}

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon *proc)
{
    EfxDracoZombiePrepareTSA(0, 0, 0);

    /* banim index for Draco Zombie */
    EkrPrepareBanimfx(proc->anim, 0xC0);

    SetAnimStateUnHidden(GetAISSubjectId(proc->anim));

    /* spell anim index maybe */
    gEkrSpellAnimIndexLutMaybe[0] = 0x15;
}

void EkrDZ_TriggerPreparedFlag(struct ProcEkrDragon *proc)
{
    if (GetEkrDragonStatusAttr(GetCoreAIStruct(proc->anim)) != EKRDRGON_ATTR_START) {
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
        Proc_Break(proc);
    }
}

void EkrDZ_IdleInBattle(struct ProcEkrDragon *proc)
{
    u16 attr = GetEkrDragonStatusAttr(proc->anim);
    if (attr & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;

        if (CheckEkrDragonStatusAttrBit13(proc->anim) == false) {
            SetAnimStateHidden(GetAISSubjectId(proc->anim));
            EfxDracoZombiePrepareTSA(0, 0, 1);
        }

        Proc_Break(proc);
    }
}

void EkrDZ_ReloadCustomBg(struct ProcEkrDragon *proc)
{
    int val;

    if (CheckEkrDragonStatusAttrBit13(proc->anim) == true) {
        BG_Fill(gBG3TilemapBuffer, 0x6000);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EkrMaybePalFadeWithVal(PAL_BG(0), 6, 1, 0x10);
        EnablePaletteSync();
        SetEkrDragonStatusUnk1(0);

        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        Proc_Break(proc);
        return;
    }

    val = Interpolate(INTERPOLATE_RSQUARE, 0, 0x10, proc->timer, 8);
    CpuFastCopy(Pal_EfxDracoZombie, PAL_BG(6), 0x20);
    EkrMaybePalFadeWithVal(PAL_BG(0), 6, 1, val);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x40);
        EkrMaybePalFadeWithVal(PAL_BG(0), 4, 2, val);
        break;

    case EKR_DISTANCE_FAR:
        CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x20);
        EkrMaybePalFadeWithVal(PAL_BG(0), 4, 1, val);
        break;

    default:
        break;
    }

    EnablePaletteSync();
    
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        gEkrPairSideVaild[GetAISSubjectId(proc->anim)] = false;
        BG_Fill(gBG3TilemapBuffer, 0x6000);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        SetEkrDragonStatusUnk1(0);

        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        Proc_Break(proc);
    }
}

void EkrDZ_ReloadCustomBgAndFadeOut(struct ProcEkrDragon *proc)
{
    int val;

    if (proc->timer == 0) {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderBmMap();
    }

    val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8);
    EkrUpdateSomePalMaybe(val);

    if (CheckEkrDragonStatusAttrBit13(proc->anim) == false) {
        val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0, proc->timer, 8);

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
            CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x40);
            EkrMaybePalFadeWithVal(PAL_BG(0), 4, 2, val);
            break;

        case EKR_DISTANCE_FAR:
            CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x20);
            EkrMaybePalFadeWithVal(PAL_BG(0), 4, 1, val);
            break;

        default:
            break;
        }
    }

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrDZ_SetDragonStatAttrEndBit(struct ProcEkrDragon *proc)
{
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);
    Proc_Break(proc);
}

void NewEkrDragonDracoZombie(struct Anim *anim)
{
    struct EkrDragonStatus *ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon *proc = Proc_Start(ProcScr_EkrDracoZombie, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}

void SetEkrDragonStatusAttrFinished(struct Anim *anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_BANIMFINISH);
}

void SetEkrDragonStatusAttrBit12(struct Anim *anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_B12);
}

void SetEkrDragonStatusAttrBit13(struct Anim *anim)
{
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_B13);
}

bool CheckEkrDragonDeadEffectMaybe(struct Anim *anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);
    if (attr & EKRDRGON_ATTR_B12)
        return true;
    else
        return false;
}

bool CheckEkrDragonStatusAttrBit13(struct Anim *anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);
    if (attr & EKRDRGON_ATTR_B13)
        return true;
    else
        return false;
}

void SetAnimStateHiddenForDragon(void)
{
    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
        SetAnimStateHidden(EKR_BATTLE_LEFT);
        break;

    case EKRDRGON_TYPE_DEMON_KING:
        SetAnimStateHidden(EKR_BATTLE_LEFT);
        break;

    case EKRDRGON_TYPE_NORMAL:
    case EKRDRGON_TYPE_MYRRH:
    default:
        break;
    }
}

void sub_807027C(struct Anim *anim)
{
    u16 *pal;
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

    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
        CpuFastCopy(pal, PAL_BG(6), 0x20);
    else
        CpuFastCopy(pal, PAL_BG(7), 0x20);

    EnablePaletteSync();
}

u16 *sub_80702D0(void)
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

void sub_80702FC(int pos)
{
    if (pos == EKR_BATTLE_LEFT)
        CpuFastCopy(sub_80702D0(), PAL_OBJ(0x7), 0x20);
    else
        CpuFastCopy(sub_80702D0(), PAL_OBJ(0x9), 0x20);

    EnablePaletteSync();
}

void sub_807032C(int pos)
{
    if (pos == EKR_BATTLE_LEFT)
        CpuFastCopy(sub_80702D0(), PAL_BG(0x6), 0x20);
    else
        CpuFastCopy(sub_80702D0(), PAL_BG(0x7), 0x20);

    EnablePaletteSync();
}

void sub_807035C(struct Anim *anim)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
        sub_807032C(GetAISSubjectId(anim));
}

void NewEkrDragonQuakeTree3(struct EkrDragonQuakePriv *priv, int b, int c)
{
    NewEkrDragonQuake(priv, b, c, PROC_TREE_3);
}

void NewEkrDragonQuake(struct EkrDragonQuakePriv *priv, int b, int c, ProcPtr parent)
{
    struct ProcEkrDragonQuake *proc;
    
    proc = Proc_Start(ProcScr_ekrDragonQuake, parent);
    proc->priv = priv;
    proc->subproc = NewEfxQuakePure(c, 0);
    proc->unk2C = 0;
    proc->unk2E = b;
}

void EkrDragonQuakeMain(struct ProcEkrDragonQuake *proc);

CONST_DATA struct EkrDracoZombiTsaSet gEkrDracoZombiTsaSetLut[] = {
    { Tsa_EfxDracoZombie1,  3,  97, 0x8F, 0 },
    { Tsa_EfxDracoZombie2,  3,  73, 0x5E, 0 },
    { Tsa_EfxDracoZombie3,  3,  48, 0x46, 0 },
    { Tsa_EfxDracoZombie3,  3,  28, 0x36, 0 },
    { Tsa_EfxDracoZombie4,  3,  19, 0x30, 1 },
    { Tsa_EfxDracoZombie4,  3,   9, 0x2C, 0 },
    { Tsa_EfxDracoZombie5,  3,   5, 0x2B, 0 },
    { Tsa_EfxDracoZombie5,  3,   1, 0x2A, 0 },
    { Tsa_EfxDracoZombie5,  3,  -4, 0x29, 0 },
    { Tsa_EfxDracoZombie5,  3,  -8, 0x29, 0 },
    { Tsa_EfxDracoZombie5,  3, -12, 0x2A, 0 },
    { Tsa_EfxDracoZombie5,  3, -14, 0x2B, 0 },
    { Tsa_EfxDracoZombie5, 10, -16, 0x2C, 0 },
    { Tsa_EfxDracoZombie5,  3, -16, 0x2A, 0 },
    { NULL,                 0, -16, 0x28, 2 },
};

CONST_DATA struct ProcCmd ProcScr_EkrDracoZombie[] = {
    PROC_YIELD,

    /* Make the background and terrain fade into darkness */
    PROC_REPEAT(EkrDZ_CustomBgFadeIn),
    PROC_CALL(EfxDracoZombiePrepareImg),

    /* Apply TSA sets and other ctrl to intro DZ to screen */
    PROC_REPEAT(EkrDZ_MonsterFlyIntoScreen),

    /* Decompress spell and ekr banimfx */
    PROC_CALL(EkrDZ_PrepareBanimfx),
    PROC_SLEEP(0x2D),

PROC_LABEL(0x0),
    /* Communicate to ekrbattle to trigger battle start */
    PROC_REPEAT(EkrDZ_TriggerPreparedFlag),

    /* Wait until battle finished */
    PROC_REPEAT(EkrDZ_IdleInBattle),

    PROC_REPEAT(EkrDZ_ReloadCustomBg),

    /* Gradullay fade out the normal battle background */
    PROC_REPEAT(EkrDZ_ReloadCustomBgAndFadeOut),

    /* Communicate to ekrbattle to trigger battle ending */
    PROC_REPEAT(EkrDZ_SetDragonStatAttrEndBit),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_ekrDragonQuake[] = {
    PROC_NAME((void *)0x80dfa0c),
    PROC_REPEAT(EkrDragonQuakeMain),
    PROC_END
};
