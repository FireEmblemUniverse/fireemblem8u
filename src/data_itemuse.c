#include "global.h"
#include "bmitem.h"
#include "constants/classes.h"

CONST_DATA u8 ItemEffectiveness_088ADEB0[] = {
    CLASS_CAVALIER,
    CLASS_CAVALIER_F,
    CLASS_PALADIN,
    CLASS_PALADIN_F,
    CLASS_RANGER,
    CLASS_RANGER_F,
    CLASS_EPHRAIM_MASTER_LORD,
    CLASS_EIRIKA_MASTER_LORD,
    CLASS_GREAT_KNIGHT,
    CLASS_GREAT_KNIGHT_F,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_Armor[] = {
    CLASS_ARMOR_KNIGHT,
    CLASS_ARMOR_KNIGHT_F,
    CLASS_GENERAL,
    CLASS_GENERAL_F,
    CLASS_GREAT_KNIGHT,
    CLASS_GREAT_KNIGHT_F,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_088ADEC2[] = {
    CLASS_CAVALIER,
    CLASS_CAVALIER_F,
    CLASS_PALADIN,
    CLASS_PALADIN_F,
    CLASS_ARMOR_KNIGHT,
    CLASS_ARMOR_KNIGHT_F,
    CLASS_GENERAL,
    CLASS_GENERAL_F,
    CLASS_TROUBADOUR,
    CLASS_VALKYRIE,
    CLASS_GREAT_KNIGHT,
    CLASS_GREAT_KNIGHT_F,
    CLASS_RANGER,
    CLASS_RANGER_F,
    CLASS_EPHRAIM_MASTER_LORD,
    CLASS_EIRIKA_MASTER_LORD,
    CLASS_MAGE_KNIGHT,
    CLASS_MAGE_KNIGHT_F,
    CLASS_TARVOS,
    CLASS_MAELDUIN,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_088ADED7[] = {
    CLASS_MYRMIDON,
    CLASS_MYRMIDON_F,
    CLASS_SWORDMASTER,
    CLASS_SWORDMASTER_F,
    CLASS_MERCENARY,
    CLASS_MERCENARY_F,
    CLASS_HERO,
    CLASS_HERO_F,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_088ADEE0[] = {
    CLASS_TROUBADOUR,
    CLASS_VALKYRIE,
    CLASS_CAVALIER,
    CLASS_CAVALIER_F,
    CLASS_PALADIN,
    CLASS_PALADIN_F,
    CLASS_RANGER,
    CLASS_RANGER_F,
    CLASS_MAGE_KNIGHT,
    CLASS_MAGE_KNIGHT_F,
    CLASS_GREAT_KNIGHT,
    CLASS_GREAT_KNIGHT_F,
    CLASS_TARVOS,
    CLASS_MAELDUIN,
    CLASS_EPHRAIM_MASTER_LORD,
    CLASS_EIRIKA_MASTER_LORD,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_088ADEF1[] = {
    CLASS_REVENANT,
    CLASS_ENTOUMBED,
    CLASS_BONEWALKER,
    CLASS_BONEWALKER_BOW,
    CLASS_WIGHT,
    CLASS_WIGHT_BOW,
    CLASS_BAEL,
    CLASS_ELDER_BAEL,
    CLASS_CYCLOPS,
    CLASS_MAUTHEDOOG,
    CLASS_GWYLLGI,
    CLASS_TARVOS,
    CLASS_MAELDUIN,
    CLASS_MOGALL,
    CLASS_ARCH_MOGALL,
    CLASS_GORGON,
    CLASS_GORGONEGG,
    CLASS_GARGOYLE,
    CLASS_DEATHGOYLE,
    CLASS_DRACO_ZOMBIE,
    CLASS_DEMON_KING,
    CLASS_PEGASUS_KNIGHT,
    CLASS_FALCON_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_RIDER_F,
    CLASS_WYVERN_LORD,
    CLASS_WYVERN_LORD_F,
    CLASS_WYVERN_KNIGHT,
    CLASS_WYVERN_KNIGHT_F,
    CLASS_MANAKETE_2,
    CLASS_CYCLOPS_2,
    CLASS_ELDER_BAEL_2,
    CLASS_PHANTOM,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_Dragon[] = {
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_RIDER_F,
    CLASS_WYVERN_LORD,
    CLASS_WYVERN_LORD_F,
    CLASS_WYVERN_KNIGHT,
    CLASS_WYVERN_KNIGHT_F,
    CLASS_MANAKETE_2,
    CLASS_MANAKETE_MYRRH,
    CLASS_DRACO_ZOMBIE,
    CLASS_MANAKETE_2,
    CLASS_MANAKETE_MYRRH,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_088ADF1F[] = {
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_RIDER_F,
    CLASS_WYVERN_LORD,
    CLASS_WYVERN_LORD_F,
    CLASS_WYVERN_KNIGHT,
    CLASS_WYVERN_KNIGHT_F,
    CLASS_SUMMONER,
    CLASS_SUMMONER_F,
    CLASS_NECROMANCER,
    CLASS_DRACO_ZOMBIE,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_088ADF2A[] = {
    CLASS_PEGASUS_KNIGHT,
    CLASS_FALCON_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_RIDER_F,
    CLASS_WYVERN_LORD,
    CLASS_WYVERN_LORD_F,
    CLASS_WYVERN_KNIGHT,
    CLASS_WYVERN_KNIGHT_F,
    CLASS_GARGOYLE,
    CLASS_DEATHGOYLE,
    CLASS_DEATHGOYLE,
    CLASS_MANAKETE_2,
    CLASS_MANAKETE_MYRRH,
    CLASS_DRACO_ZOMBIE,
    CLASS_NONE,
};

CONST_DATA u8 ItemEffectiveness_Monsters[] = {
    CLASS_REVENANT,
    CLASS_ENTOUMBED,
    CLASS_BONEWALKER,
    CLASS_BONEWALKER_BOW,
    CLASS_WIGHT,
    CLASS_WIGHT_BOW,
    CLASS_BAEL,
    CLASS_ELDER_BAEL,
    CLASS_CYCLOPS,
    CLASS_MAUTHEDOOG,
    CLASS_GWYLLGI,
    CLASS_TARVOS,
    CLASS_MAELDUIN,
    CLASS_MOGALL,
    CLASS_ARCH_MOGALL,
    CLASS_GORGON,
    CLASS_GORGONEGG,
    CLASS_GARGOYLE,
    CLASS_DEATHGOYLE,
    CLASS_DRACO_ZOMBIE,
    CLASS_DEMON_KING,
    CLASS_MANAKETE_2,
    CLASS_CYCLOPS_2,
    CLASS_ELDER_BAEL_2,
    CLASS_PHANTOM,
    CLASS_NONE,
};

CONST_DATA u8 JidLutUnk_Tier0[] = {
    CLASS_JOURNEYMAN,
    CLASS_PUPIL,
    CLASS_RECRUIT,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_HeroCrest[] = {
    CLASS_MERCENARY,
    CLASS_MERCENARY_F,
    CLASS_MYRMIDON,
    CLASS_MYRMIDON_F,
    CLASS_FIGHTER,
    CLASS_JOURNEYMAN_T1,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_KnightCrest[] = {
    CLASS_CAVALIER,
    CLASS_CAVALIER_F,
    CLASS_ARMOR_KNIGHT,
    CLASS_ARMOR_KNIGHT_F,
    CLASS_RECRUIT_T1,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_OrionsBolt[] = {
    CLASS_ARCHER,
    CLASS_ARCHER_F,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_ElysianWhip[] = {
    CLASS_PEGASUS_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_RIDER_F,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_GuidRing[] = {
    CLASS_PRIEST,
    CLASS_CLERIC,
    CLASS_MAGE,
    CLASS_MAGE_F,
    CLASS_MONK,
    CLASS_SHAMAN,
    CLASS_SHAMAN_F,
    CLASS_TROUBADOUR,
    CLASS_PUPIL_T1,
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADF75[] = {
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_MasterSeal[] = {
    CLASS_MERCENARY,
    CLASS_MERCENARY_F,
    CLASS_MYRMIDON,
    CLASS_MYRMIDON_F,
    CLASS_FIGHTER,
    CLASS_PIRATE,
    CLASS_BRIGAND,
    CLASS_CAVALIER,
    CLASS_CAVALIER_F,
    CLASS_ARMOR_KNIGHT,
    CLASS_ARMOR_KNIGHT_F,
    CLASS_ARCHER,
    CLASS_ARCHER_F,
    CLASS_PEGASUS_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_RIDER_F,
    CLASS_PRIEST,
    CLASS_CLERIC,
    CLASS_MAGE,
    CLASS_MAGE_F,
    CLASS_SHAMAN,
    CLASS_SHAMAN_F,
    CLASS_TROUBADOUR,
    CLASS_THIEF,
    CLASS_JOURNEYMAN,
    CLASS_PUPIL,
    CLASS_RECRUIT,
    CLASS_JOURNEYMAN_T1,
    CLASS_PUPIL_T1,
    CLASS_RECRUIT_T1,
    CLASS_MONK,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_HeavenSeal[] = {
    CLASS_EPHRAIM_LORD,
    CLASS_EIRIKA_LORD,
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADF99[] = {
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADF9A[] = {
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADF9B[] = {
    CLASS_EPHRAIM_LORD,
    CLASS_EIRIKA_LORD,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_OceanSeal[] = {
    CLASS_BRIGAND,
    CLASS_PIRATE,
    CLASS_THIEF,
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADFA2[] = {
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_C1[] = {
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_LunarBrace[] = {
    CLASS_EIRIKA_LORD,
    CLASS_NONE,
};

CONST_DATA u8 gItemUseJidList_SolarBrace[] = {
    CLASS_EPHRAIM_LORD,
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADFA8[] = {
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADFA9[] = {
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADFAA[] = {
    CLASS_NONE,
};

CONST_DATA u8 Unk_088ADFAB[] = {
    CLASS_NONE,
};
