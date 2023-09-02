#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrlevelup.h"
#include "soundwrapper.h"

void NewEkrLvlupFan(void)
{
    struct ProcEkrLvupFan *proc = Proc_Start(ProcScr_ekrLvupFan, PROC_TREE_3);
    proc->timer = 0;
    Sound_SetSEVolume(0x80);
}

void EkrLvupFanMain(struct ProcEkrLvupFan *proc)
{
    int timer = ++proc->timer;
    if (timer == 0x10) {
        EfxPlaySE(0x5B, 0x100);
        M4aPlayWithPostionCtrl(0x5B, 0x78, 0);
    } else if (timer == 0x74) {
        Sound_SetSEVolume(0x100);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_ekrLvupFan[] = {
    PROC_NAME("ekrLvupFan"),
    PROC_REPEAT(EkrLvupFanMain),
    PROC_END
};
