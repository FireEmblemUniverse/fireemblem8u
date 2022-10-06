#ifndef GUARD_BMFX_H
#define GUARD_BMFX_H

#include "global.h"
#include "proc.h"

struct VectorBmfx {
    u8 x;
    u8 y;
    u16 _0;
};

struct ProcBmFx {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];

    /* 4C */ s16 counter;
};

void ProcBmFx_CommonEnd(struct ProcBmFx *proc);

#endif /* GUARD_BMFX_H */
