//
// Created by laqieer on 2020/3/3.
//

#ifndef GUARD_BMDEBUG_H
#define GUARD_BMDEBUG_H

#include "functions.h"
#include "variables.h"
#include "gba/io_reg.h"
#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "uimenu.h"

struct DebugPrintProc
{
    PROC_HEADER
    int x; // unit: tile
    int y; // unit: tile
    int unk_34;
    int unk_38;
    int unk_3C;
    int unk_40;
    int unk_44;
    int unk_48;
    int unk_4C;
    short unk_50;
    unsigned short width; // unit: tile
    const char * text; // string
    int unk_58;
    int unk_5C;
    int unk_60;
    int unk_64;
    int unk_68;
};

void DebugMenuInit();
u8 EndMenuAndClear(struct MenuProc*, struct MenuItemProc*);

extern const struct MenuDef DebugMenuDef;

#endif //GUARD_BMDEBUG_H
