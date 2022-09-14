#include "global.h"

#include "hardware.h"

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ u16 unk_4C;
};

void sub_801DD1C(struct BmxfadeProc* proc)
{
    proc->unk_4C = 0x10;

    SetupBackgroundForWeatherMaybe();

    sub_8001ED0(0, 0, 1, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 1);
}

