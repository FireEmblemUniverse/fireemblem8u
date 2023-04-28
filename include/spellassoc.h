#pragma once

#include "global.h"
#include "proc.h"

enum wpn_manim_flash_color {
    SPELL_ASSOC_MCOLOR_NORMAL,
    SPELL_ASSOC_MCOLOR_DARK,
    SPELL_ASSOC_MCOLOR_FIRE,
    SPELL_ASSOC_MCOLOR_ICE,
    SPELL_ASSOC_MCOLOR_WIND,
    SPELL_ASSOC_MCOLOR_LIGHT,
};

struct SpellAssoc {
    /* 00 */ u16 item;
    /* 02 */ u8 count;
    /* 04 */ u16 type;
    /* 08 */ struct ProcCmd *pcmd_manim;
    /* 0C */ u8 stat;
    /* 0D */ u8 facing;
    /* 0E */ u8 flash_color;
};

extern struct SpellAssoc gSpellAssocData[];

struct SpellAssoc *GetSpellAssocStructPtr(u16 item);
u8 GetSpellAssocCharCount(u16 item);
u16 GetSpellAssocType(u16 item);
struct ProcCmd *GetSpellAssocAlt6CPointer(u16 item);
u8 GetSpellAssocReturnBool(int item);
u8 GetSpellAssocFacing(u16 item);
u8 GetSpellAssocFlashColor(u16 item);
