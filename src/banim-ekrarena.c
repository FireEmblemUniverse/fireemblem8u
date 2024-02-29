#include "global.h"

#include "hardware.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "bm.h"

#include "ekrbattle.h"

EWRAM_DATA int gBaArenaFlag = 0;

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
    EfxTmCpyExt(gTmB_Banim + 8 + x1, 66, gBG3TilemapBuffer, 32, 32, 22, -1, -1);

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

    PROC_REPEAT(ekrTogiInit_Init),
    PROC_REPEAT(ekrTogiInit_LoadGfx),
    PROC_REPEAT(ekrTogiInit_Loop),
    PROC_REPEAT(ekrTogiInit_End),

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
void ekrTogiInit_Init(ProcPtr proc)
{
    InitOam(0);

    gEkrInitPosReal = gEkrInitialHitSide;

    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    CpuFastCopy(Pal_ArenaBattleBg_A, gPaletteBuffer + 0x60, 0x80);
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);
    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);
    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, 0x10);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B18C
void ekrTogiInit_LoadGfx(struct ProcEkrTogi * proc)
{
    LZ77UnCompVram(Img_ArenaBattleBg, (void *)0x06008000);
    LZ77UnCompWram(Tsa_ArenaBattleBg, gEkrTsaBuffer);
    EfxTmCpyExt(gEkrTsaBuffer, -1, gTmB_Banim, 66, 46, 20, 6, 0);
    sub_805B034(0);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    EfxPlaySE(0x8e, 0x100);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B200
void ekrTogiInit_Loop(struct ProcEkrTogi * proc)
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
void ekrTogiInit_End(ProcPtr proc)
{
    NewEkrTogiColor();
    Proc_Break(proc);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProc_ekrTogiEnd[] =
{
    PROC_NAME("ekrTogiEndPROC"),

    PROC_REPEAT(ekrTogiEnd_Init),
    PROC_REPEAT(ekrTogiEnd_Loop),
    PROC_REPEAT(ekrTogiEnd_End),

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
void ekrTogiEnd_Init(struct ProcEkrTogi * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B2BC
void ekrTogiEnd_Loop(struct ProcEkrTogi * proc)
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
void ekrTogiEnd_End(ProcPtr proc)
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
    PROC_REPEAT(ekrTogiColor_Loop),
    PROC_END,
};

u16 * CONST_DATA PalArray_ArenaBattleBg[] =
{
    Pal_ArenaBattleBg_A,
    Pal_ArenaBattleBg_B,
    Pal_ArenaBattleBg_C,
};

// clang-format on

//! FE8U = 0x0805B34C
void NewEkrTogiColor(void)
{
    // clang-format off
    const static u16 frames[] =
    {
        0, 10,
        1, 10,
        2, 10,
        -2,
    };
    // clang-format on

    gpProcEkrTogiColor = Proc_Start(gProc_ekrTogiColor, PROC_TREE_3);

    gpProcEkrTogiColor->timer = 0;

    gpProcEkrTogiColor->frame = 0;
    gpProcEkrTogiColor->frame_config = frames;
    gpProcEkrTogiColor->pal = PalArray_ArenaBattleBg;

    return;
}

//! FE8U = 0x0805B380
void EndEkrTogiColor(void)
{
    Proc_End(gpProcEkrTogiColor);
    return;
}

//! FE8U = 0x0805B394
void ekrTogiColor_Loop(struct ProcEfxBGCOL * proc)
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
