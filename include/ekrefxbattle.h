#pragma once

#include "global.h"
#include "anime.h"

struct ProcEkrDispUP {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;
    /* 2B */ u8 _pad_2B[0x32 - 0x2B];
    /* 32 */ u16 unk32;
    /* 34 */ u8 _pad_32[0x3A - 0x34];
    /* 3A */ u16 unk3A;
    /* 3C */ u8 _pad_3C[0x4C - 0x3C];
    /* 4C */ u32 unk4C;
    /* 50 */ u32 unk50;
};

extern struct ProcEkrDispUP *gpProcEkrDispUP;
void ekrDispUP_Loop(struct ProcEkrDispUP *proc);
