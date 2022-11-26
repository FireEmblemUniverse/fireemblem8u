#ifndef BMSAVE_H
#define BMSAVE_H

#define InterruptEnableRegister ((u16*)0x4000200)

enum save_chunk_index {
    SAVE_CHUNK_0,
    SAVE_CHUNK_1,
    SAVE_CHUNK_2,
    SAVE_CHUNK_3,
    SAVE_CHUNK_4,
    SAVE_CHUNK_5,
    SAVE_CHUNK_6,
    SAVE_CHUNK_MAX
};

struct SecureSaveHeader {
    /* 00 */ u8 magic[0x6];
    /* 06 */ u8 _pad[0x8 - 0x6];
    /* 08 */ u32 _00040624;
    /* 0C */ u16 _200A;

    /* 0E */ u8 flag0E_0 : 1;
             u8 flag0E_1 : 1;
             u8 flag0E_2 : 1;
             u8 flag0E_3 : 1;
             u8 flag0E_4 : 1;
             u8 flag0E_5 : 1;
             u8 flag0E_6 : 1;
             u8 flag0E_7 : 1;

    /* 0F */ u8 unk0F_0 : 1;
             u8 unk0F_1 : 7;

    /* 10 */ u16 unk10;
    /* 10 */ u16 unk12;
    /* 14 */ u8 unk14[0x20 - 0x14];
    /* 20 */ u8 unk20[0x40 - 0x20];
    /* 40 */ u8 charKnownFlags[0x60 - 0x40];
    /* 60 */ u16 sec_sum;
    /* 62 */ u8 unk62;
    /* 63 */ u8 unk63;
};

struct SramChunk {
    /* 00 */ u32 unk00;
    /* 04 */ u16 unk04;
    /* 06 */ u8 unk06;
    /* 07 */ s8 _pad_07;
    /* 08 */ u16 sram_offset;
    /* 0A */ u16 unk0A;
    /* 0C */ u32 unk0C;
};

struct SramHeader {
    struct SecureSaveHeader SecHead;
    struct SramChunk chunks[0x7];
};

/* used in sub_80A341C */
struct bmsave_unkstruct0 {
    u8 unk[0x14];
};

struct GameRankSaveData {
    /* 00 */ u32 unk00_00 : 0x01;
             u32 unk00_01 : 0x03;
             u32 unk00_04 : 0x03; 
             u32 unk00_07 : 0x03; 
             u32 unk00_0A : 0x03;
             u32 unk00_0D : 0x03;
             u32 unk00_10 : 0x03;

             u32 chapter_mode : 0x02;
             u32 chapter_stat : 0x01;
             u32 unk00_16 : 0x01;
             u32 unk00_17 : 0x08;
             u32 cuteguy : 0x08;

             u32 hours : 0x0A;
             u32 minutes : 0x06;
             u32 seconds : 0x06;
             u32 gold : 0x18;

    /* 08 */ u32 unk08_15 : 0x06;
             u32 unk08_1F : 0x01;

    /* 0C */ char tactician_name[0xB];

    /* 17 */ u8 luckydog;
};

struct GameRankSaveDataPacks {
    struct GameRankSaveData pack[0x6];
    u16 magic0;
    u16 unk92;
};

struct bmsave_unkstruct1 {
    u32 unk[0x8];
    u16 magic1;
    u16 magic2;
};

struct bmsave_unkstruct2 {
    u32 unk[0x4];
    u16 magic1;
    u16 magic2;
};

struct UnitSavePack {       /* Save Data */
    /* 00 */ u32 class      : 7;
             u32 level      : 5;
             u32 exp        : 7;
             u32 xPos       : 6;
             u32 yPos       : 6;

             u32 flag       : 13;

             u32 max_hp     : 6;
             u32 pow        : 5;
             u32 skl        : 5;
             u32 spd        : 5;
             u32 def        : 5;
             u32 res        : 5;
             u32 lck        : 5;
             u32 con_bonus  : 5;
             u32 mov_bonus  : 5;
             u32 item1      : 14;
             u32 item2      : 14;
             u32 item3      : 14;
             u32 item4      : 14;
             u32 item5      : 14;
    
    /* 14 */ u8 char_index;
    /* 15 */ u8 wpnRanks[0x8];
    /* 1D */ u8 supports[UNIT_SUPPORT_MAX_COUNT];
    /* 24 */
};

enum packed_unit_state_bits {
    PACKED_US_DEAD       = 1 << 0,
    PACKED_US_UNDEPLOYED = 1 << 1,
    PACKED_US_SOLO_ANIM1 = 1 << 2,
    PACKED_US_SOLO_ANIM2 = 1 << 3,
    PACKED_US_METIS_TOME = 1 << 4,
    PACKED_US_B4         = 1 << 5,
    PACKED_US_B5         = 1 << 6,
    PACKED_US_NEW_FRIEND = 1 << 7,
};

struct UnitSaveSuPack {     /* Suspend Data */
    /* 00 */ u8 char_id;
    /* 01 */ u8 class;
    /* 02 */ u8 ai1;
    /* 03 */ u8 rescueOtherUnit;
    /* 04 */ u32 state;

    /* 08 */ u16 item1;
    /* 0A */ u16 item2;
    /* 0C */ u16 item3;
    
    /* 0E */ s8 maxHP;
    /* 0F */ s8 curHP;
    /* 10 */ u8 exp;
    /* 11 */ u8 aiFlags;
    /* 12 */ u8 ranks[8];
    /* 1A */ u8 supports[UNIT_SUPPORT_MAX_COUNT];
    /* 21 */ u8 ai1data;
    /* 22 */ u8 ai2;
    /* 23 */ u8 ai2data;

    /* 24 */ u32 level      : 5;
             u32 xPos       : 6;
             u32 yPos       : 6;
             u32 pow        : 5;
             u32 skl        : 5;
             u32 spd        : 5;
    /* 28 */ u32 def        : 5;
             u32 res        : 5;
             u32 lck        : 5;
             u32 conBonus   : 5;

             u32 statusIndex_l      : 3;
             u32 statusDuration     : 3;
             u32 torchDuration      : 3;
             u32 barrierDuration    : 3;
    
    /* 2C */ u32 movBonus   : 4;
             u16 item4      : 14;
             u16 item5      : 14;
    
    /* 30 */ u8 ballistaIndex;
    
    /* 31 */ u8 _u46;
    /* 32 */ u16 ai3And4;
    /* 34 */
};

s8 IsSramWorking();

#endif /* BMSAVE_H */
