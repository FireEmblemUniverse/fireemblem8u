#include "global.h"
#include "proc.h"
#include "bmbattle.h"
#include "constants/items.h"
#include "hardware.h"
#include "uiutils.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void EfxDoDemonKingIntroAnim(struct Anim *anim)
{
    struct EkrSpEff *ekrsp = GetEkrSpEff(anim);
    struct ProcEfxDKIntro *proc = Proc_Start(ProcScr_EkrDemoKingIntro, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrSpEffAttr(anim, 1);
    ekrsp->anim = anim;
    proc->anim5C = anim;
    proc->unk2C = 0;
    gUnknown_03004FA8 = 0;
    gUnknown_03004FB0 = 0;
    sub_8077DB4(0, 0);
    sub_80729A4(0x380, 0x100, 0x78, 0);
}

void sub_8076598(void)
{
    return;
}

int CheckEkrWpnDemonLight(struct Anim *anim)
{
    struct BattleUnit *bu;
    if (GetAISSubjectId(anim) == 0)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    if (bu->weaponBefore == ITEM_DEMONLIGHT)
        return true;
    else
        return false;
}

void EkrDKIntroStartBaseHide(struct ProcEfxDKIntro *proc)
{
    NewEkrDragonBaseHide(proc->anim5C);
    Proc_Break(proc);
}

void sub_80765E4(struct ProcEfxDKIntro *proc)
{
    EkrUpdateSomePalMaybe(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->unk2C, 8));
    if (++proc->unk2C == 0x9) {
        proc->unk2C = 0;
        Proc_Break(proc);
    }
}

void FillMem32_02019790(u32 val)
{
    int i;
    u32 tmp, *buf;

    val = (val << 0x10);
    buf = (u32 *)gUnknown_02019790;
    tmp = val | val >> 0x10;

    for (i = 0; i < 0x400; i++)
        *buf++ = tmp;
}

void sub_8076640(struct ProcEfxDKIntro *proc)
{
    int val1 = Interpolate(INTERPOLATE_RCUBIC, -0x20, 0, proc->unk2E, 0x78);
    int val2 = Interpolate(INTERPOLATE_RCUBIC, -0x50, 0, proc->unk2E, 0x78);

    sub_806FB2C(gUnknown_0201FB0C + val1, val2);
    
    if (proc->unk2E == 0x78) {
        Proc_Break(proc);
    } else
        proc->unk2E++;
}

void sub_807669C(struct ProcEfxDKIntro *proc)
{
    if (CheckEkrWpnDemonLight(proc->anim5C) != false)
        sub_80589E0(proc->anim5C, 0xC2);
    else
        sub_80589E0(proc->anim5C, 0xC1);
    
    sub_805A394(GetAISSubjectId(proc->anim5C));
    gEkrSpellAnimIndexLutMaybe[0] = 0x40;
    AddEkrSpEffAttr(proc->anim5C, 1 << 1);
    Proc_Break(proc);
}

void PrepareDemonKingBGFx(struct ProcEfxDKIntro *proc)
{
    FillMem32_02019790(1);
    sub_80559D0((void *)0x60016001);
    BG_Fill(gBG3TilemapBuffer, 1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    Decompress(Img_DeamonKingBG, (void *)0x06008000);
    Decompress(Tsa_DeamonKingBG, gUnknown_02019790);
    sub_806FBB8();
    sub_806FB2C(gUnknown_0201FB0C - 0x20, -0x50);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;

    sub_8013A84(0x6);
    sub_8013928(Pal_DeamonKingBG, 6, 0x78, proc);
    SetEkrSpEffUnk1(1 << 0);
    proc->unk2E = 0;
}
