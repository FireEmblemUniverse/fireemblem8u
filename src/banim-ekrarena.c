#include "global.h"

#include "hardware.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "bm.h"

#include "ekrbattle.h"

extern u16 gUnknown_0201D438[];
extern int gBaArenaFlag;
extern struct ProcEfxBGCOL * gUnknown_0201FB24;

//! FE8U = 0x0805B01C
void SetBanimArenaFlag(int flag)
{
    gBaArenaFlag = flag;
    return;
}

//! FE8U = 0x0805B028
int GetBattleAnimArenaFlag(void)
{
    return gBaArenaFlag;
}

//! FE8U = 0x0805B034
void sub_805B034(int x)
{
    int x1 = x >> 3;
    int x2 = x & 7;

    BG_SetPosition(BG_3, x2, 0);
    EfxTmCpyExt(gUnknown_0201D438 + x1, 66, gBG3TilemapBuffer, 32, 32, 22, -1, -1);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x0805B07C
void PlaySound8FForArenaMaybe(void)
{
    if (GetBattleAnimArenaFlag() != 0)
    {
        EfxPlaySE(0x8f, 0x100);
    }

    return;
}

//! FE8U = 0x0805B094
void sub_805B094(void)
{
    if (GetBattleAnimArenaFlag() != 0)
    {
        DoM4aSongNumStop(0x8e);
    }

    return;
}

//! FE8U = 0x0805B0A8
void BeginAnimsOnBattle_Arena(void)
{
    u32 pos;

    NewEkrBattleDeamon();
    AnimClearAll();

    pos = GetBanimInitPosReal();
    gEkrInitPosReal = pos;

    NewEkrTogiInitPROC();
    SetPrimaryHBlankHandler(NULL);

    return;
}

//! FE8U = 0x0805B0CC
void ExecBattleAnimArenaExit(void)
{
    AnimClearAll();
    NewEkrTogiEndPROC();

    SetMainUpdateRoutine(MainUpdate_8055C68);
    Proc_EndEach(ProcScr_efxStatusUnit);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProc_ekrTogiInit[] =
{
    PROC_NAME("ekrTogiInitPROC"),

    PROC_REPEAT(sub_805B104),
    PROC_REPEAT(sub_805B18C),
    PROC_REPEAT(sub_805B200),
    PROC_REPEAT(sub_805B264),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805B0F0
void NewEkrTogiInitPROC(void)
{
    Proc_Start(gProc_ekrTogiInit, PROC_TREE_3);
    return;
}

//! FE8U = 0x0805B104
void sub_805B104(ProcPtr proc)
{
    InitOam(0);

    gEkrInitPosReal = gEkrInitialHitSide;

    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    CpuFastCopy(gUnknown_085BEF94, gPaletteBuffer + 0x60, 0x80);
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);
    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);
    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, 0x10);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B18C
void sub_805B18C(struct ProcEkrTogi * proc)
{
    LZ77UnCompVram(gUnknown_085BC188, (void *)0x06008000);
    LZ77UnCompWram(gUnknown_085BE7F4, gEkrTsaBuffer);
    EfxTmCpyExt(gEkrTsaBuffer, -1, gEfxFrameTmap, 66, 46, 20, 6, 0);
    sub_805B034(0);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    EfxPlaySE(0x8e, 0x100);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B200
void sub_805B200(struct ProcEkrTogi * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->unk_2c, proc->unk_2e);

    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);

    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, ret);
    EnablePaletteSync();

    if (++proc->unk_2c == proc->unk_2e + 1)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805B264
void sub_805B264(ProcPtr proc)
{
    NewEkrTogiColor();
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProc_ekrTogiEnd[] =
{
    PROC_NAME("ekrTogiEndPROC"),

    PROC_REPEAT(sub_805B290),
    PROC_REPEAT(sub_805B2BC),
    PROC_REPEAT(sub_805B320),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805B278
void NewEkrTogiEndPROC(void)
{
    Proc_Start(gProc_ekrTogiEnd, PROC_TREE_3);
    EndEkrTogiColor();
    return;
}

//! FE8U = 0x0805B290
void sub_805B290(struct ProcEkrTogi * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B2BC
void sub_805B2BC(struct ProcEkrTogi * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->unk_2c, proc->unk_2e);

    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);
    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, ret);

    EnablePaletteSync();

    if (++proc->unk_2c == proc->unk_2e + 1)
    {
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x0805B320
void sub_805B320(ProcPtr proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();

    SetMainUpdateRoutine(OnGameLoopMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProc_ekrTogiColor[] =
{
    PROC_NAME("ekrTogiColor"),
    PROC_REPEAT(sub_805B394),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085B9E4C[] =
{
    gUnknown_085BEF94,
    gUnknown_085BF014,
    gUnknown_085BF094,
};

// clang-format on

//! FE8U = 0x0805B34C
void NewEkrTogiColor(void)
{
    // clang-format off
    const static u16 gUnknown_080DB026[] =
    {
        0, 10,
        1, 10,
        2, 10,
        -2,
    };
    // clang-format on

    gUnknown_0201FB24 = Proc_Start(gProc_ekrTogiColor, PROC_TREE_3);

    gUnknown_0201FB24->timer = 0;

    gUnknown_0201FB24->frame = 0;
    gUnknown_0201FB24->frame_config = gUnknown_080DB026;
    gUnknown_0201FB24->pal = gUnknown_085B9E4C;

    return;
}

//! FE8U = 0x0805B380
void EndEkrTogiColor(void)
{
    Proc_End(gUnknown_0201FB24);
    return;
}

//! FE8U = 0x0805B394
void sub_805B394(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret > -1)
    {
        u16 ** pal = proc->pal;
        CpuFastCopy(*(pal + ret), gPaletteBuffer + 0x60, 0x80);
        EnablePaletteSync();
    }

    return;
}
