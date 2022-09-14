#include "global.h"

#include "hardware.h"

void SetAllUnitNotBackSprite();

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ s16 unk_4C;
    /* 4E */ s16 unk_4E;
};

extern struct ProcCmd CONST_DATA gUnknown_0859ADC8[];

void sub_801DD1C(struct BmxfadeProc *proc)
{
    proc->unk_4C = 0x10;

    SetupBackgroundForWeatherMaybe();

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 1);
}

void sub_801DD54(struct BmxfadeProc *proc)
{
    SetSpecialColorEffectsParameters(1, proc->unk_4C, 0x10 - proc->unk_4C, 0);

    if (--proc->unk_4C >= 0)
        return;

    Proc_Break(proc);
    SetDefaultColorEffects();
    SetBackgroundTileDataOffset(2, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(4);
}

void Destruct6CBMXFADE(struct BmxfadeProc *proc)
{
    SetAllUnitNotBackSprite();

    if (0 != proc->unk_4E)
        SubSkipThread2();
}

void NewBMXFADE(s8 lock_game)
{
    struct BmxfadeProc *proc = Proc_Start(gUnknown_0859ADC8, PROC_TREE_3);
    proc->unk_4E = lock_game;

    if (0 != lock_game)
        AddSkipThread2();
}

void MakeNew6CBMXFADE2(s8 lock_game, ProcPtr parent)
{
    struct BmxfadeProc *proc = 
        Proc_StartBlocking(gUnknown_0859ADC8, parent);
    
    proc->unk_4E = lock_game;
    
    if (0 != lock_game)
        SubSkipThread2();
}
