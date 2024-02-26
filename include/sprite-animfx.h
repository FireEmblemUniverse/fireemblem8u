#pragma once

#include "global.h"
#include "proc.h"

struct EventSpriteAnimConf {
    /* 00 */ const u16 * pal;
    /* 04 */ const u8  * img;
    /* 08 */ const u8  * ap_conf;
    /* 0C */ u16 oam0, oam2;
    /* 10 */ u8 pal_bank, pal_size;

    /* 12 */ u8 _pad_[2];
};

struct ProcEventSpriteAnim {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ ProcPtr approc;
    /* 38 */ const struct EventSpriteAnimConf * priv;
};

void EventSpriteAnim_Init(struct ProcEventSpriteAnim * proc);
void EventSpriteAnim_Loop(struct ProcEventSpriteAnim * proc);
void EventSpriteAnim_End(struct ProcEventSpriteAnim * proc);

extern struct ProcCmd CONST_DATA ProcScr_EventSpriteAnim[];
