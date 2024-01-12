#include "global.h"
#include "constants/characters.h"

struct DebugPInfo {
    int idx;
    const char * pname;
    const char * jname;
};

CONST_DATA struct DebugPInfo gDebugPInfo[] = {
    {
        .idx = CHARACTER_EIRIKA,
        .pname = "EIRIKR",
        .jname = "LORD",
    },
    {
        .idx = CHARACTER_ROSS,
        .pname = "SETH",
        .jname = "PALADIN",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "GILLIAM",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "FRANZ",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_VALTER_PROLOGUE,
        .pname = "MULDER",
        .jname = "PRIEST",
    },
    {
        .idx = CHARACTER_BAZBA,
        .pname = "VANESSA",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = 0x3d,
        .pname = "ROSS",
        .jname = "PROBATION_SOLDIER",
    },
    {
        .idx = CHARACTER_LARACHEL,
        .pname = "MARY",
        .jname = "ARCHER",
    },
    {
        .idx = CHARACTER_NATASHA,
        .pname = "COMA",
        .jname = "THIEF",
    },
    {
        .idx = CHARACTER_SUMMON_EWAN,
        .pname = "BORBA",
        .jname = "FIGHTER",
    },
    {
        .idx = 0x1b,
        .pname = "HEANIUS",
        .jname = "SNIPER",
    },
    {
        .idx = CHARACTER_GLEN_CC,
        .pname = "LUTE",
        .jname = "MAGE",
    },
    {
        .idx = CHARACTER_SAAR,
        .pname = "NATASHA",
        .jname = "PRIEST_F",
    },
    {
        .idx = CHARACTER_KNOLL,
        .pname = "CUGAR",
        .jname = "DRAGONKNIGHT",
    },
    {
        .idx = CHARACTER_EIRIKA,
        .pname = "IRZARK",
        .jname = "LORD",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "FORDE",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "KYLE",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_BONE,
        .pname = "AMELIA",
        .jname = "PROBATION_FLY_F",
    },
    {
        .idx = CHARACTER_SELENA,
        .pname = "ASSERAY",
        .jname = "MONK",
    },
    {
        .idx = CHARACTER_EPHRAIM,
        .pname = "XYST",
        .jname = "MERCENARY",
    },
    {
        .idx = CHARACTER_TIRADO,
        .pname = "TETHYS",
        .jname = "DANCER_F",
    },
    {
        .idx = CHARACTER_ARTUR,
        .pname = "MARICA",
        .jname = "SWORDFIGHTER",
    },
    {
        .idx = CHARACTER_VALTER_CC,
        .pname = "SALEH",
        .jname = "SAGE",
    },
    {
        .idx = CHARACTER_SUMMON_KNOLL,
        .pname = "EWAN",
        .jname = "PROBATION_MAGE",
    },
    {
        .idx = CHARACTER_NOVALA,
        .pname = "LARCHEL",
        .jname = "TROUBADOUR_F",
    },
    {
        .idx = CHARACTER_VALTER,
        .pname = "DOZZLA",
        .jname = "BERSERKER",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_023",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = 0x33,
        .pname = "RENNAC",
        .jname = "ROGUE",
    },
    {
        .idx = 0x35,
        .pname = "DUSSEL",
        .jname = "GREATKNIGHT",
    },
    {
        .idx = CHARACTER_SUMMON_LYON,
        .pname = "MYRRH",
        .jname = "MAMKUTE",
    },
    {
        .idx = 0x2d,
        .pname = "KNOLL",
        .jname = "SHAMAN",
    },
    {
        .idx = CHARACTER_ARTUR,
        .pname = "JHOSUA",
        .jname = "SWORDFIGHTER",
    },
    {
        .idx = CHARACTER_ENTOUMBED_CH4,
        .pname = "SYRENE",
        .jname = "FALCONKNIGHT_F",
    },
    {
        .idx = CHARACTER_BAZBA,
        .pname = "TURNER",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = CHARACTER_PABLO,
        .pname = "LYON_C",
        .jname = "NECROMANCER",
    },
    {
        .idx = CHARACTER_ROSS,
        .pname = "OLSSON_C",
        .jname = "PALADIN",
    },
    {
        .idx = CHARACTER_SYRENE,
        .pname = "GLEN_C",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = CHARACTER_CAELLACH_CC,
        .pname = "CELINA_C",
        .jname = "MAGEKNIGHT",
    },
    {
        .idx = CHARACTER_LYON_CC,
        .pname = "WALTER_C",
        .jname = "WYVERNKNIGHT",
    },
    {
        .idx = CHARACTER_ISMAIRE_CC,
        .pname = "IRV_C",
        .jname = "BISHOP",
    },
    {
        .idx = CHARACTER_KYLE,
        .pname = "CETHELREDA_C",
        .jname = "HERO",
    },
    {
        .idx = CHARACTER_INNES,
        .pname = "FADO_C",
        .jname = "GENERAL",
    },
    {
        .idx = CHARACTER_TETHYS,
        .pname = "ISHUMARE_C",
        .jname = "SWORDMASTER",
    },
    {
        .idx = CHARACTER_DUESSEL,
        .pname = "HAYDEN_C",
        .jname = "FORRESTKNIGHT",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_041",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_042",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_043",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_044",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_045",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_046",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_047",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_048",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_049",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_050",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_051",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_052",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_053",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_054",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_AIAS,
        .pname = "PHANTOM_FIGHTER03",
        .jname = "PHANTOM",
    },
    {
        .idx = 0x31,
        .pname = "EMPTY_056",
        .jname = "SUMMONER",
    },
    {
        .idx = 0x31,
        .pname = "EMPTY_057",
        .jname = "SUMMONER",
    },
    {
        .idx = CHARACTER_AIAS,
        .pname = "PHANTOM_FIGHTER02",
        .jname = "PHANTOM",
    },
    {
        .idx = CHARACTER_AIAS,
        .pname = "PHANTOM_FIGHTER01",
        .jname = "PHANTOM",
    },
    {
        .idx = CHARACTER_PABLO,
        .pname = "LYON",
        .jname = "NECROMANCER",
    },
    {
        .idx = CHARACTER_SUMMON_LYON,
        .pname = "MORVA",
        .jname = "MAMKUTE",
    },
    {
        .idx = CHARACTER_ROSS,
        .pname = "OLSSON",
        .jname = "PALADIN",
    },
    {
        .idx = CHARACTER_LYON_CC,
        .pname = "WALTER",
        .jname = "WYVERNKNIGHT",
    },
    {
        .idx = CHARACTER_CAELLACH_CC,
        .pname = "CELINA",
        .jname = "MAGEKNIGHT",
    },
    {
        .idx = CHARACTER_LYON_CC,
        .pname = "WALTER_L00",
        .jname = "WYVERNKNIGHT",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "BREGUET",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "BON",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "BAZBA",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_CAELLACH,
        .pname = "MUMMY_L04",
        .jname = "MUMMY",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "SAAR",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = 0x2d,
        .pname = "NOVELA",
        .jname = "SHAMAN",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "MURRAY",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_INNES,
        .pname = "TIRADO",
        .jname = "GENERAL",
    },
    {
        .idx = CHARACTER_LYON,
        .pname = "BINKS",
        .jname = "WARRIOR",
    },
    {
        .idx = CHARACTER_VALTER_CC,
        .pname = "PABLO",
        .jname = "SAGE",
    },
    {
        .idx = CHARACTER_DEATHGOYLE_CHUnk,
        .pname = "MACDAIRE_e11",
        .jname = "MACDAIRE",
    },
    {
        .idx = 0x35,
        .pname = "AIAS",
        .jname = "GREATKNIGHT",
    },
    {
        .idx = CHARACTER_TETHYS,
        .pname = "CARLYLE",
        .jname = "SWORDMASTER",
    },
    {
        .idx = CHARACTER_KYLE,
        .pname = "CETHELREDA",
        .jname = "HERO",
    },
    {
        .idx = CHARACTER_VALTER_CC,
        .pname = "PABLO_E12",
        .jname = "SAGE",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_080",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = 0x61,
        .pname = "DEMI",
        .jname = "GORGON",
    },
    {
        .idx = CHARACTER_ISMAIRE_CC,
        .pname = "IRV",
        .jname = "BISHOP",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_083",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_084",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_LYON,
        .pname = "GEB",
        .jname = "WARRIOR",
    },
    {
        .idx = CHARACTER_DUESSEL,
        .pname = "BERNA",
        .jname = "FORRESTKNIGHT",
    },
    {
        .idx = CHARACTER_GHEB,
        .pname = "CYCLOPS_i11",
        .jname = "CYCLOPS",
    },
    {
        .idx = CHARACTER_GORGON_CHUnk,
        .pname = "MONSTER_E10x",
        .jname = "HELLSKELETON_S",
    },
    {
        .idx = 0x64,
        .pname = "MONSTER_i10x",
        .jname = "DETHGARGOYLE",
    },
    {
        .idx = CHARACTER_CAELLACH,
        .pname = "MOSTER_BOSS",
        .jname = "MUMMY",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_091",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_092",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_093",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_094",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_NATASHA,
        .pname = "TREASUREHUNTER",
        .jname = "THIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "BANDIT3",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "BANDIT1",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "BANDIT2",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_SUMMON_EWAN,
        .pname = "ONEILL",
        .jname = "FIGHTER",
    },
    {
        .idx = CHARACTER_SYRENE,
        .pname = "GLEN",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = CHARACTER_EPHRAIM,
        .pname = "ZONTA",
        .jname = "MERCENARY",
    },
    {
        .idx = CHARACTER_INNES,
        .pname = "VIGARD",
        .jname = "GENERAL",
    },
    {
        .idx = CHARACTER_PABLO,
        .pname = "LYON2",
        .jname = "NECROMANCER",
    },
    {
        .idx = CHARACTER_ROSS,
        .pname = "OLSSON2",
        .jname = "PALADIN",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_105",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_106",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_107",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_108",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_109",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_110",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_111",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_112",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_113",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_114",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_115",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_116",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_117",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_118",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_119",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_120",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_121",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "GRAD_L06",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_SUMMON_EWAN,
        .pname = "GRAD_FIGHTER",
        .jname = "FIGHTER",
    },
    {
        .idx = CHARACTER_LARACHEL,
        .pname = "GRAD_ARCHER",
        .jname = "ARCHER",
    },
    {
        .idx = CHARACTER_SUMMON_EWAN,
        .pname = "GRAD_FIGHTER2",
        .jname = "FIGHTER",
    },
    {
        .idx = CHARACTER_BINKS,
        .pname = "GRAD_01",
        .jname = "SOLDIER",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "GRAD_02",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "GRAD_03",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_ARTUR,
        .pname = "GRAD_04",
        .jname = "SWORDFIGHTER",
    },
    {
        .idx = CHARACTER_EPHRAIM,
        .pname = "GRAD_05",
        .jname = "MERCENARY",
    },
    {
        .idx = CHARACTER_NATASHA,
        .pname = "GRAD_06",
        .jname = "THIEF",
    },
    {
        .idx = CHARACTER_GLEN_CC,
        .pname = "GRAD_07",
        .jname = "MAGE",
    },
    {
        .idx = CHARACTER_SELENA,
        .pname = "GRAD_08",
        .jname = "MONK",
    },
    {
        .idx = 0x2d,
        .pname = "GRAD_09",
        .jname = "SHAMAN",
    },
    {
        .idx = CHARACTER_NOVALA,
        .pname = "GRAD_10",
        .jname = "TROUBADOUR_F",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "GRAD_REMNANTS",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "BANDIT_BAZBA",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "GRAD_REMNANTS2",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = 0x2d,
        .pname = "GRAD_REMNANTS3",
        .jname = "SHAMAN",
    },
    {
        .idx = CHARACTER_GLEN_CC,
        .pname = "GRAD_REMNANTS4",
        .jname = "MAGE",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_139",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_140",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_141",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_142",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_143",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_144",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_145",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_146",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_147",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_148",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_149",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_150",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_151",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_152",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_153",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_154",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_155",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_156",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_157",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_158",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_159",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_EPHRAIM,
        .pname = "MERCENARY",
        .jname = "MERCENARY",
    },
    {
        .idx = CHARACTER_EPHRAIM,
        .pname = "CARCINO_MERCENARY",
        .jname = "MERCENARY",
    },
    {
        .idx = CHARACTER_EPHRAIM,
        .pname = "CARCINO_REMNANTS",
        .jname = "MERCENARY",
    },
    {
        .idx = CHARACTER_CARLYLE,
        .pname = "ZONBIE",
        .jname = "ZOMBIE",
    },
    {
        .idx = CHARACTER_CAELLACH,
        .pname = "MUMMY",
        .jname = "MUMMY",
    },
    {
        .idx = CHARACTER_PABLO_2,
        .pname = "SKELETON_S",
        .jname = "SKELETON_S",
    },
    {
        .idx = 0x55,
        .pname = "SKELETON_A",
        .jname = "SKELETON_A",
    },
    {
        .idx = CHARACTER_GORGON_CHUnk,
        .pname = "HELLSKELETON_S",
        .jname = "HELLSKELETON_S",
    },
    {
        .idx = CHARACTER_RIEV,
        .pname = "HELLSKELETON_A",
        .jname = "HELLSKELETON_A",
    },
    {
        .idx = 0x58,
        .pname = "BAEL",
        .jname = "BAEL",
    },
    {
        .idx = 0x59,
        .pname = "DETHBAEL",
        .jname = "DETHBAEL",
    },
    {
        .idx = CHARACTER_GHEB,
        .pname = "CYCLOPS",
        .jname = "CYCLOPS",
    },
    {
        .idx = CHARACTER_BERAN,
        .pname = "MAUTHEDOOG",
        .jname = "MAUTHEDOOG",
    },
    {
        .idx = CHARACTER_CYCLOPS_CHUnk,
        .pname = "CERBERUS",
        .jname = "CERBERUS",
    },
    {
        .idx = CHARACTER_WIGHT_CHUnk,
        .pname = "TARVOS",
        .jname = "TARVOS",
    },
    {
        .idx = CHARACTER_DEATHGOYLE_CHUnk,
        .pname = "MACDAIRE",
        .jname = "MACDAIRE",
    },
    {
        .idx = 0x5f,
        .pname = "BIGL",
        .jname = "BIGL",
    },
    {
        .idx = 0x60,
        .pname = "DETHBIGL",
        .jname = "DETHBIGL",
    },
    {
        .idx = 0x61,
        .pname = "GORGON",
        .jname = "GORGON",
    },
    {
        .idx = 0x62,
        .pname = "GORGONEGG",
        .jname = "GORGONEGG",
    },
    {
        .idx = 0x63,
        .pname = "GARGOYLE",
        .jname = "GARGOYLE",
    },
    {
        .idx = 0x64,
        .pname = "DETHGARGOYLE",
        .jname = "DETHGARGOYLE",
    },
    {
        .idx = 0x65,
        .pname = "DRAGONZOMBIE",
        .jname = "DRAGONZOMBIE",
    },
    {
        .idx = CHARACTER_BANDIT_CH5,
        .pname = "FODETH",
        .jname = "FODETH",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_182",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_ARTUR,
        .pname = "FRERIA_SWORDFIGHTER",
        .jname = "SWORDFIGHTER",
    },
    {
        .idx = CHARACTER_MOULDER,
        .pname = "FRERIA_SOCIALKNIGHT",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_185",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_186",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_187",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_VALTER_CC,
        .pname = "FADO",
        .jname = "SAGE",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_189",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = 0x73,
        .pname = "HAYDEN",
        .jname = "PEER",
    },
    {
        .idx = 0x7a,
        .pname = "MANSELL",
        .jname = "POPE",
    },
    {
        .idx = CHARACTER_ISMAIRE_CC,
        .pname = "KLIMT",
        .jname = "BISHOP",
    },
    {
        .idx = 0x2f,
        .pname = "DARA",
        .jname = "DRUID",
    },
    {
        .idx = 0x73,
        .pname = "ISHUMARE",
        .jname = "PEER",
    },
    {
        .idx = CHARACTER_BAZBA,
        .pname = "MESSENGER1",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "ROSTON_SOLDIER",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = CHARACTER_COLM,
        .pname = "ROSTON_SOLDIER2",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_215",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_216",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_217",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_218",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_219",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_220",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_221",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_222",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_223",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_224",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_225",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_226",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_227",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_228",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_229",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_230",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_231",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_232",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_233",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_234",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_235",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_236",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_237",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_238",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_239",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_240",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_241",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_242",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_243",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_244",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_245",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_246",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_247",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_248",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_249",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_250",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "EMPTY_251",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_ORSON,
        .pname = "CHILD2",
        .jname = "CHILD",
    },
    {
        .idx = 0x6e,
        .pname = "CHILD2_F",
        .jname = "CHILD_F",
    },
    {
        .idx = 0x6f,
        .pname = "CITIZEN2",
        .jname = "KOIDO_M",
    },
    {
        .idx = 0x70,
        .pname = "CITIZEN2_F",
        .jname = "KOIDO_F",
    },
    {
        .idx = CHARACTER_ORSON,
        .pname = "CHILD",
        .jname = "CHILD",
    },
    {
        .idx = 0x6e,
        .pname = "CHILD_F",
        .jname = "CHILD_F",
    },
    {
        .idx = 0x71,
        .pname = "CITIZEN",
        .jname = "CIVILIAN",
    },
    {
        .idx = 0x71,
        .pname = "CITIZEN_F",
        .jname = "CIVILIAN",
    },
    {
        .idx = 0x71,
        .pname = "NOTATTACK",
        .jname = "CIVILIAN",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "DUELTARGET",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "WALLBREAK",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "LOGBREAK",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = CHARACTER_MORVA,
        .pname = "FE3_DUMMY",
        .jname = "MOUNTAINTHIEF",
    },
};
