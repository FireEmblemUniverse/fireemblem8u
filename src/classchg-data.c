#include "global.h"
#include "constants/characters.h"
#include "constants/classes.h"

CONST_DATA u8 gPromoJidLut[][2] = {
    [CLASS_EPHRAIM_LORD]    = {CLASS_EPHRAIM_MASTER_LORD},
    [CLASS_EIRIKA_LORD]     = {CLASS_EIRIKA_MASTER_LORD},
    [CLASS_CAVALIER]        = {CLASS_PALADIN,               CLASS_GREAT_KNIGHT},
    [CLASS_CAVALIER_F]      = {CLASS_PALADIN_F,             CLASS_GREAT_KNIGHT_F},
    [CLASS_ARMOR_KNIGHT]    = {CLASS_GENERAL,               CLASS_GREAT_KNIGHT},
    [CLASS_ARMOR_KNIGHT_F]  = {CLASS_GENERAL_F,             CLASS_GREAT_KNIGHT_F},
    [CLASS_THIEF]           = {CLASS_ASSASSIN,              CLASS_ROGUE},
    [CLASS_MERCENARY]       = {CLASS_HERO,                  CLASS_RANGER},
    [CLASS_MERCENARY_F]     = {CLASS_HERO_F,                CLASS_RANGER_F},
    [CLASS_MYRMIDON]        = {CLASS_ASSASSIN,              CLASS_SWORDMASTER},
    [CLASS_MYRMIDON_F]      = {CLASS_ASSASSIN_F,            CLASS_SWORDMASTER_F},
    [CLASS_ARCHER]          = {CLASS_SNIPER,                CLASS_RANGER},
    [CLASS_ARCHER_F]        = {CLASS_SNIPER_F,              CLASS_RANGER_F},
    [CLASS_WYVERN_RIDER]    = {CLASS_WYVERN_LORD,           CLASS_WYVERN_KNIGHT},
    [CLASS_WYVERN_RIDER_F]  = {CLASS_WYVERN_LORD_F,         CLASS_WYVERN_KNIGHT_F},
    [CLASS_MAGE]            = {CLASS_SAGE,                  CLASS_MAGE_KNIGHT},
    [CLASS_MAGE_F]          = {CLASS_SAGE_F,                CLASS_MAGE_KNIGHT_F},
    [CLASS_SHAMAN]          = {CLASS_DRUID,                 CLASS_SUMMONER},
    [CLASS_SHAMAN_F]        = {CLASS_DRUID,                 CLASS_SUMMONER},
    [CLASS_GORGONEGG2]      = {CLASS_GORGON},
    [CLASS_RECRUIT_T1]      = {CLASS_PALADIN_F,             CLASS_RECRUIT_T2},
    [CLASS_JOURNEYMAN]      = {CLASS_FIGHTER,               CLASS_PIRATE},
    [CLASS_PUPIL]           = {CLASS_MAGE,                  CLASS_SHAMAN},
    [CLASS_FIGHTER]         = {CLASS_HERO,                  CLASS_WARRIOR},
    [CLASS_BRIGAND]         = {CLASS_WARRIOR,               CLASS_BERSERKER},
    [CLASS_PIRATE]          = {CLASS_WARRIOR,               CLASS_BERSERKER},
    [CLASS_MONK]            = {CLASS_BISHOP,                CLASS_SAGE},
    [CLASS_PRIEST]          = {CLASS_BISHOP,                CLASS_SAGE},
    [CLASS_RECRUIT]         = {CLASS_ARMOR_KNIGHT_F,        CLASS_CAVALIER_F},
    [CLASS_PEGASUS_KNIGHT]  = {CLASS_FALCON_KNIGHT,         CLASS_WYVERN_KNIGHT_F},
    [CLASS_CLERIC]          = {CLASS_BISHOP_F,              CLASS_VALKYRIE},
    [CLASS_TROUBADOUR]      = {CLASS_VALKYRIE,              CLASS_MAGE_KNIGHT_F},
    [CLASS_REVENANT]        = {CLASS_ENTOUMBED},
    [CLASS_BONEWALKER]      = {CLASS_WIGHT},
    [CLASS_BONEWALKER_BOW]  = {CLASS_WIGHT_BOW},
    [CLASS_BAEL]            = {CLASS_ELDER_BAEL},
    [CLASS_MAUTHEDOOG]      = {CLASS_GWYLLGI},
    [CLASS_TARVOS]          = {CLASS_MAELDUIN},
    [CLASS_MOGALL]          = {CLASS_ARCH_MOGALL},
    [CLASS_GORGONEGG]       = {CLASS_GORGON},
    [CLASS_GARGOYLE]        = {CLASS_DEATHGOYLE},
    [CLASS_JOURNEYMAN_T1]   = {CLASS_HERO,                  CLASS_JOURNEYMAN_T2},
    [CLASS_PUPIL_T1]        = {CLASS_SAGE,                  CLASS_PUPIL_T2},
};

CONST_DATA u8 gAnimCharaPalConfig[0x100][7] = {
    [CHARACTER_EIRIKA - 1] = {
        [1] = CLASS_EIRIKA_LORD,
        [3] = CLASS_EIRIKA_MASTER_LORD
    },
    [CHARACTER_SETH - 1] = {
        [3] = CLASS_PALADIN,
    },
    [CHARACTER_GILLIAM - 1] = {
        [1] = CLASS_ARMOR_KNIGHT,
        [3] = CLASS_GENERAL,
        [4] = CLASS_GREAT_KNIGHT
    },
    [CHARACTER_FRANZ - 1] = {
        [1] = CLASS_CAVALIER,
        [3] = CLASS_PALADIN,
        [4] = CLASS_GREAT_KNIGHT
    },
    [CHARACTER_MOULDER - 1] = {
        [1] = CLASS_PRIEST,
        [3] = CLASS_BISHOP,
        [4] = CLASS_SAGE
    },
    [CHARACTER_VANESSA - 1] = {
        [1] = CLASS_PEGASUS_KNIGHT,
        [3] = CLASS_FALCON_KNIGHT,
        [4] = CLASS_WYVERN_KNIGHT_F
    },
    [CHARACTER_ROSS - 1] = {
        [0] = CLASS_JOURNEYMAN,
        [1] = CLASS_FIGHTER,
        [2] = CLASS_PIRATE,
        [3] = CLASS_HERO,
        [4] = CLASS_WARRIOR,
        [5] = CLASS_WARRIOR,
        [6] = CLASS_BERSERKER
    },
    [CHARACTER_NEIMI - 1] = {
        [1] = CLASS_ARCHER_F,
        [3] = CLASS_SNIPER_F,
        [4] = CLASS_RANGER_F
    },
    [CHARACTER_COLM - 1] = {
        [1] = CLASS_THIEF,
        [3] = CLASS_ASSASSIN,
        [4] = CLASS_ROGUE
    },
    [CHARACTER_GARCIA - 1] = {
        [1] = CLASS_FIGHTER,
        [3] = CLASS_HERO,
        [4] = CLASS_WARRIOR
    },
    [CHARACTER_INNES - 1] = {
        [3] = CLASS_SNIPER,
    },
    [CHARACTER_LUTE - 1] = {
        [1] = CLASS_MAGE_F,
        [3] = CLASS_SAGE_F,
        [4] = CLASS_MAGE_KNIGHT_F
    },
    [CHARACTER_NATASHA - 1] = {
        [1] = CLASS_CLERIC,
        [3] = CLASS_BISHOP_F,
        [4] = CLASS_VALKYRIE
    },
    [CHARACTER_CORMAG - 1] = {
        [1] = CLASS_WYVERN_RIDER,
        [3] = CLASS_WYVERN_LORD,
        [4] = CLASS_WYVERN_KNIGHT
    },
    [CHARACTER_EPHRAIM - 1] = {
        [1] = CLASS_EPHRAIM_LORD,
        [3] = CLASS_EPHRAIM_MASTER_LORD,
    },
    [CHARACTER_FORDE - 1] = {
        [1] = CLASS_CAVALIER,
        [3] = CLASS_PALADIN,
        [4] = CLASS_GREAT_KNIGHT
    },
    [CHARACTER_KYLE - 1] = {
        [1] = CLASS_CAVALIER,
        [3] = CLASS_PALADIN,
        [4] = CLASS_GREAT_KNIGHT
    },
    [CHARACTER_AMELIA - 1] = {
        [0] = CLASS_RECRUIT,
        [1] = CLASS_ARMOR_KNIGHT_F,
        [2] = CLASS_CAVALIER_F,
        [3] = CLASS_GENERAL_F,
        [4] = CLASS_GREAT_KNIGHT_F,
        [5] = CLASS_PALADIN_F,
        [6] = CLASS_GREAT_KNIGHT_F
    },
    [CHARACTER_ARTUR - 1] = {
        [1] = CLASS_MONK,
        [3] = CLASS_BISHOP,
        [4] = CLASS_SAGE
    },
    [CHARACTER_GERIK - 1] = {
        [1] = CLASS_MERCENARY,
        [3] = CLASS_HERO,
        [4] = CLASS_RANGER
    },
    [CHARACTER_TETHYS - 1] = {
        [1] = CLASS_DANCER
    },
    [CHARACTER_MARISA - 1] = {
        [1] = CLASS_MYRMIDON_F,
        [3] = CLASS_ASSASSIN_F,
        [4] = CLASS_SWORDMASTER_F
    },
    [CHARACTER_SALEH - 1] = {
        [3] = CLASS_SAGE
    },
    [CHARACTER_EWAN - 1] = {
        [0] = CLASS_PUPIL,
        [1] = CLASS_MAGE,
        [2] = CLASS_SHAMAN,
        [3] = CLASS_SAGE,
        [4] = CLASS_MAGE_KNIGHT,
        [5] = CLASS_DRUID,
        [6] = CLASS_SUMMONER
    },
    [CHARACTER_LARACHEL - 1] = {
        [1] = CLASS_TROUBADOUR,
        [3] = CLASS_VALKYRIE,
        [4] = CLASS_MAGE_KNIGHT_F
    },
    [CHARACTER_DOZLA - 1] = {
        [3] = CLASS_BERSERKER
    },
    [CHARACTER_RENNAC - 1] = {
        [3] = CLASS_ROGUE
    },
    [CHARACTER_DUESSEL - 1] = {
        [3] = CLASS_GREAT_KNIGHT
    },
    [CHARACTER_KNOLL - 1] = {
        [1] = CLASS_SHAMAN,
        [3] = CLASS_DRUID,
        [4] = CLASS_SUMMONER
    },
    [CHARACTER_JOSHUA - 1] = {
        [1] = CLASS_MYRMIDON,
        [3] = CLASS_ASSASSIN,
        [4] = CLASS_SWORDMASTER
    },
    [CHARACTER_SYRENE - 1] = {
        [3] = CLASS_FALCON_KNIGHT
    },
    [CHARACTER_TANA - 1] = {
        [1] = CLASS_PEGASUS_KNIGHT,
        [3] = CLASS_FALCON_KNIGHT,
        [4] = CLASS_WYVERN_KNIGHT_F
    },
    [CHARACTER_ORSON_CC - 1] = {
        [3] = CLASS_PALADIN
    },
    [CHARACTER_GLEN_CC - 1] = {
        [3] = CLASS_WYVERN_LORD
    },
    [CHARACTER_SELENA_CC - 1] = {
        [3] = CLASS_MAGE_KNIGHT_F
    },
    [CHARACTER_VALTER_CC - 1] = {
        [3] = CLASS_WYVERN_KNIGHT
    },
    [CHARACTER_RIEV_CC - 1] = {
        [3] = CLASS_BISHOP
    },
    [CHARACTER_CAELLACH_CC - 1] = {
        [3] = CLASS_HERO
    },
    [CHARACTER_FADO_CC - 1] = {
        [3] = CLASS_GENERAL
    },
    [CHARACTER_ISMAIRE_CC - 1] = {
        [3] = CLASS_SWORDMASTER_F
    },
    [CHARACTER_HAYDEN_CC - 1] = {
        [3] = CLASS_RANGER
    },
    [CHARACTER_ORSON_CH5X - 1] = {
        [3] = CLASS_PALADIN,
    },
    [CHARACTER_VALTER - 1] = {
        [3] = CLASS_WYVERN_KNIGHT,
    },
    [CHARACTER_SELENA - 1] = {
        [3] = CLASS_MAGE_KNIGHT_F,
    },
    [CHARACTER_VALTER_PROLOGUE - 1] = {
        [3] = CLASS_WYVERN_KNIGHT,
    },
    [CHARACTER_BREGUET - 1] = {
        [1] = CLASS_ARMOR_KNIGHT,
    },
    [CHARACTER_BONE - 1] = {
        [1] = CLASS_BRIGAND,
    },
    [CHARACTER_BAZBA - 1] = {
        [1] = CLASS_BRIGAND,
    },
    [CHARACTER_SAAR - 1] = {
        [1] = CLASS_ARMOR_KNIGHT,
    },
    [CHARACTER_NOVALA - 1] = {
        [1] = CLASS_SHAMAN,
    },
    [CHARACTER_MURRAY - 1] = {
        [1] = CLASS_CAVALIER,
    },
    [CHARACTER_TIRADO - 1] = {
        [3] = CLASS_GENERAL,
    },
    [CHARACTER_BINKS - 1] = {
        [3] = CLASS_WARRIOR,
    },
    [CHARACTER_PABLO - 1] = {
        [3] = CLASS_SAGE,
    },
    [CHARACTER_AIAS - 1] = {
        [3] = CLASS_GREAT_KNIGHT,
    },
    [CHARACTER_CARLYLE - 1] = {
        [3] = CLASS_SWORDMASTER,
    },
    [CHARACTER_CAELLACH - 1] = {
        [3] = CLASS_HERO,
    },
    [CHARACTER_PABLO_2 - 1] = {
        [3] = CLASS_SAGE,
    },
    [CHARACTER_RIEV - 1] = {
        [3] = CLASS_BISHOP,
    },
    [CHARACTER_GHEB - 1] = {
        [3] = CLASS_WARRIOR,
    },
    [CHARACTER_BERAN - 1] = {
        [3] = CLASS_RANGER,
    },
    [CHARACTER_ONEILL - 1] = {
        [1] = CLASS_FIGHTER,
    },
    [CHARACTER_GLEN - 1] = {
        [3] = CLASS_WYVERN_LORD,
    },
    [CHARACTER_ZONTA - 1] = {
        [1] = CLASS_MERCENARY,
    },
    [CHARACTER_VIGARDE - 1] = {
        [3] = CLASS_GENERAL,
    },
    [CHARACTER_ORSON - 1] = {
        [3] = CLASS_PALADIN,
    },
    [0xC5 - 1] = {
        [3] = CLASS_GREAT_KNIGHT,
    },
    [0xC7 - 1] = {
        [3] = CLASS_RANGER,
    },
    [0xCB - 1] = {
        [3] = CLASS_SWORDMASTER,
    },
};

CONST_DATA u8 gAnimCharaPalConfigUnused[0x100][7] = {0};

 CONST_DATA u8 gAnimCharaPalIt[0x100][7] = {
    /* Data is index in character_battle_animation_palette_table */
    [CHARACTER_EIRIKA - 1] = {
        [1] = 0,
        [3] = 0
    },
    [CHARACTER_SETH - 1] = {
        [3] = 0x3C,
    },
    [CHARACTER_GILLIAM - 1] = {
        [1] = 0x03,
        [3] = 0x25,
        [4] = 0x2A
    },
    [CHARACTER_FRANZ - 1] = {
        [1] = 0x55,
        [3] = 0x3D,
        [4] = 0x29
    },
    [CHARACTER_MOULDER - 1] = {
        [1] = 0x45,
        [3] = 0x0D,
        [4] = 0x4B,
    },
    [CHARACTER_VANESSA - 1] = {
        [1] = 0x40,
        [3] = 0x1C,
        [4] = 0x67
    },
    [CHARACTER_ROSS - 1] = {
        [0] = 0x00,
        [1] = 0x1F,
        [2] = 0x11,
        [3] = 0x42,
        [4] = 0x64,
        [5] = 0x64,
        [6] = 0x14
    },
    [CHARACTER_NEIMI - 1] = {
        [1] = 0x01,
        [3] = 0x53,
        [4] = 0x22
    },
    [CHARACTER_COLM - 1] = {
        [1] = 0x5E,
        [3] = 0x07,
        [4] = 0x44
    },
    [CHARACTER_GARCIA - 1] = {
        [1] = 0x1E,
        [3] = 0x10,
        [4] = 0x63
    },
    [CHARACTER_INNES - 1] = {
        [3] = 0x52,
    },
    [CHARACTER_LUTE - 1] = {
        [1] = 0x2F,
        [3] = 0x47,
        [4] = 0x35
    },
    [CHARACTER_NATASHA - 1] = {
        [1] = 0x43,
        [3] = 0x0C,
        [4] = 0x61
    },
    [CHARACTER_CORMAG - 1] = {
        [1] = 0x16,
        [3] = 0x17,
        [4] = 0x68
    },
    [CHARACTER_EPHRAIM - 1] = {
        [1] = 0x00,
        [3] = 0x00,
    },
    [CHARACTER_FORDE - 1] = {
        [1] = 0x57,
        [3] = 0x3B,
        [4] = 0x28
    },
    [CHARACTER_KYLE - 1] = {
        [1] = 0x56,
        [3] = 0x3E,
        [4] = 0x2B
    },
    [CHARACTER_AMELIA - 1] = {
        [0] = 0x00,
        [1] = 0x02,
        [2] = 0x54,
        [3] = 0x24,
        [4] = 0x2C,
        [5] = 0x3A,
        [6] = 0x2C
    },
    [CHARACTER_ARTUR - 1] = {
        [1] = 0x37,
        [3] = 0x0B,
        [4] = 0x48
    },
    [CHARACTER_GERIK - 1] = {
        [1] = 0x31,
        [3] = 0x12,
        [4] = 0x21
    },
    [CHARACTER_TETHYS - 1] = {
        [1] = 0x15
    },
    [CHARACTER_MARISA - 1] = {
        [1] = 0x39,
        [3] = 0x06,
        [4] = 0x5D
    },
    [CHARACTER_SALEH - 1] = {
        [3] = 0x4C
    },
    [CHARACTER_EWAN - 1] = {
        [0] = 0x00,
        [1] = 0x30,
        [2] = 0x4D,
        [3] = 0x49,
        [4] = 0x33,
        [5] = 0x1A,
        [6] = 0x50
    },
    [CHARACTER_LARACHEL - 1] = {
        [1] = 0x62,
        [3] = 0x60,
        [4] = 0x34
    },
    [CHARACTER_DOZLA - 1] = {
        [3] = 0x13
    },
    [CHARACTER_RENNAC - 1] = {
        [3] = 0x46
    },
    [CHARACTER_DUESSEL - 1] = {
        [3] = 0x2D
    },
    [CHARACTER_KNOLL - 1] = {
        [1] = 0x4E,
        [3] = 0x19,
        [4] = 0x51
    },
    [CHARACTER_JOSHUA - 1] = {
        [1] = 0x38,
        [3] = 0x08,
        [4] = 0x5C
    },
    [CHARACTER_SYRENE - 1] = {
        [3] = 0x1D,
    },
    [CHARACTER_TANA - 1] = {
        [1] = 0x41,
        [3] = 0x1B,
        [4] = 0x66
    },
    [CHARACTER_ORSON_CC - 1] = {
        [3] = 0x3F
    },
    [CHARACTER_GLEN_CC - 1] = {
        [3] = 0x18
    },
    [CHARACTER_SELENA_CC - 1] = {
        [3] = 0x36
    },
    [CHARACTER_VALTER_CC - 1] = {
        [3] = 0x69
    },
    [CHARACTER_RIEV_CC - 1] = {
        [3] = 0x0E
    },
    [CHARACTER_CAELLACH_CC - 1] = {
        [3] = 0x6C
    },
    [CHARACTER_FADO_CC - 1] = {
        [3] = 0x5B
    },
    [CHARACTER_ISMAIRE_CC - 1] = {
        [3] = 0x59
    },
    [CHARACTER_HAYDEN_CC - 1] = {
        [3] = 0x5A
    },
    [CHARACTER_ORSON_CH5X - 1] = {
        [3] = 0x3F,
    },
    [CHARACTER_VALTER - 1] = {
        [3] = 0x69,
    },
    [CHARACTER_SELENA - 1] = {
        [3] = 0x36,
    },
    [CHARACTER_VALTER_PROLOGUE - 1] = {
        [3] = 0x69,
    },
    [CHARACTER_BREGUET - 1] = {
        [1] = 0x04,
    },
    [CHARACTER_BONE - 1] = {
        [1] = 0x09,
    },
    [CHARACTER_BAZBA - 1] = {
        [1] = 0x0A,
    },
    [CHARACTER_SAAR - 1] = {
        [1] = 0x05,
    },
    [CHARACTER_NOVALA - 1] = {
        [1] = 0x4F,
    },
    [CHARACTER_MURRAY - 1] = {
        [1] = 0x58,
    },
    [CHARACTER_TIRADO - 1] = {
        [3] = 0x27,
    },
    [CHARACTER_BINKS - 1] = {
        [3] = 0x65,
    },
    [CHARACTER_PABLO - 1] = {
        [3] = 0x6B,
    },
    [CHARACTER_AIAS - 1] = {
        [3] = 0x2E,
    },
    [CHARACTER_CARLYLE - 1] = {
        [3] = 0x5F,
    },
    [CHARACTER_CAELLACH - 1] = {
        [3] = 0x6C,
    },
    [CHARACTER_PABLO_2 - 1] = {
        [3] = 0x6A,
    },
    [CHARACTER_RIEV - 1] = {
        [3] = 0x0E,
    },
    [CHARACTER_GHEB - 1] = {
        [3] = 0x6A,
    },
    [CHARACTER_BERAN - 1] = {
        [3] = 0x23,
    },
    [CHARACTER_ONEILL - 1] = {
        [1] = 0x20,
    },
    [CHARACTER_GLEN - 1] = {
        [3] = 0x18,
    },
    [CHARACTER_ZONTA - 1] = {
        [1] = 0x32,
    },
    [CHARACTER_VIGARDE - 1] = {
        [3] = 0x26,
    },
    [CHARACTER_ORSON - 1] = {
        [3] = 0x3F,
    },
    [0xC5 - 1] = {
        [3] = 0x5B,
    },
    [0xC7 - 1] = {
        [3] = 0x5A,
    },
    [0xCB - 1] = {
        [3] = 0x59,
    },
};

CONST_DATA u8 gSummonConfig[4][2] = {
    {
        CHARACTER_EWAN, CHARACTER_SUMMON_EWAN
    },
    {
        CHARACTER_KNOLL, CHARACTER_SUMMON_KNOLL
    },
    {
        CHARACTER_LYON_CC, CHARACTER_SUMMON_LYON
    },
    {0}
};
