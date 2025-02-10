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

enum spellassoc_efxmagic_idx {
    SASSOC_EFX_Dummy = 0,
    SASSOC_EFX_HandAxe,
    SASSOC_EFX_Arrow,
    SASSOC_EFX_Javelin,
    SASSOC_EFX_JavelinCavalier,
    SASSOC_EFX_JavelinSoldier,
    SASSOC_EFX_JavelinPaladin,
    SASSOC_EFX_JavelinPragasus,
    SASSOC_EFX_JavlinFalcon,
    SASSOC_EFX_JavlinWyvernRider,
    SASSOC_EFX_JavlinWyvernLord,
};

struct SpellAssoc {
    /* 00 */ u16 item;
    /* 02 */ u8 count;
    /* 04 */ s16 efx;
    /* 08 */ struct ProcCmd *pcmd_manim;
    /* 0C */ u8 stat;
    /* 0D */ u8 facing;
    /* 0E */ u8 flash_color;
};

extern struct SpellAssoc gSpellAssocData[];

struct SpellAssoc *GetSpellAssocStructPtr(u16 item);
u8 GetSpellAssocCharCount(u16 item);
u16 GetSpellAssocEfxIndex(u16 item);
struct ProcCmd *GetSpellAssocMapAnimProcScript(u16 item);
u8 GetSpellAssocReturnBool(int item);
u8 GetSpellAssocFacing(u16 item);
u8 GetSpellAssocFlashColor(u16 item);
