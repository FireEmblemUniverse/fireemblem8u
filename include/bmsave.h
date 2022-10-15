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

    /* 0E */ u8 play_through_declared : 1;
             u8 flag0E_1 : 1;
             u8 Eirk_mode_toturial_maybe : 1;
             u8 Eirk_mode_normal : 1;
             u8 Eirk_mode_difficult : 1;
             u8 Ephy_mode_toturial_maybe : 1;
             u8 Ephy_mode_normal : 1;
             u8 Ephy_mode_difficult : 1;

    /* 0F */ u8 unk0F_0 : 1;
             u8 unk0F_1 : 7;

    /* 10 */ u16 unk10;
    /* 10 */ u16 unk12;
    /* 14 */ u8 playthrough_ids[0x20 - 0x14];
    /* 20 */ u8 unk20[0x40 - 0x20];
    /* 40 */ u8 unk40[0x60 - 0x40];
    /* 60 */ u16 sec_sum;
    /* 62 */ u8 slotCur;
    /* 63 */ u8 unk63;
};

struct SramChunk {
    /* 00 */ u32 magic1;
    /* 04 */ u16 magic2;
    /* 06 */ u8 slot_index;
    /* 07 */ s8 _pad_07;
    /* 08 */ u16 sram_offset;
    /* 0A */ u16 unk0A;
    /* 0A */ u8 unk0C;
    /* 0C */ u8 _pad_0D[0x10 - 0x0D];
};

struct SramHeader {
    struct SecureSaveHeader SecHead;
    struct SramChunk chunks[0x7];
};

struct GameRankSaveDataPacks {
    struct GameRankSaveData pack[0x6];
    u16 magic0;
    u16 unk92;
};

struct bmsave_unkstruct0 {
    u8 unk[0x10];
};

struct bmsave_unkstruct0_ {
    struct bmsave_unkstruct0 data;
    u16 magic1;
    u16 magic2;
};

struct bmsave_unkstruct1 {
    u32 unk[0x8];
};

struct bmsave_unkstruct1_ {
    struct bmsave_unkstruct1 data;
    u16 magic1;
    u16 magic2;
};

struct bmsave_unkstruct2 {
    u32 unk[0x4];
};

struct bmsave_unkstruct2_ {
    struct bmsave_unkstruct2 data;
    u16 magic1;
    u16 magic2;
};

struct PackedSaveUnit {
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

    /* End at 0x24 */
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

struct PackedSaveSuUnit {
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

    /* Total 0x34 long */
};


s8 IsSramWorking();
u8 LoadAndVerifySecureHeaderSW(void *buf);
u16 CalcSaveDataMagic(void *src, int size);
void *GetSaveDataLocation(int index);
s8 SaveMetadata_Check(struct SramChunk *buf, int index);
void SaveMetadata_Generate(struct SramChunk *buf, int index);
int GetNextUniquePlayThroughId();

void WriteUnkBmSave2(struct bmsave_unkstruct2_*);
void sub_80A6AA0();
void SaveBWLEntries(void *sram_dest);
void SaveChapterWinData(void *sram_dest);
void CopyGameSave(int index_src, int index_dest);
void SaveConvoyItems(void *sram_dest);
void SaveClearedBWLAndChapterWinData(void *sram_dest);
void SaveGlobalEventIndexes(void *sram_dest);
void sub_80A7074(void *sram_dest);
void SetSecHeader_slotCur(int num);
void PackAndSaveUnit(struct Unit *unit, void *sram_dest);
void SaveRNGState_Maybe(void *sram_dest);
void SaveWMStaff(void *sram_dest, void *src);
void LoadAndUnpackUnit(const void *sram_src, struct Unit *unit);
void LoadGMMonsterRNState(const void *sram_src);
void LoadConvoyItems(const void *sram_src);
void LoadGlobalEventIds(const void *sram_src);
void LoadBWLEntries(void *sram_src);
void LoadChapterWinData(const void *sram_src);
void Load0203EDB4(const void *sram_src);
void LoadWMStaff(const void *sram_src, void *src);

u8 VerifySecHeaderBySomeIndex(int);
void sub_80A5DFC(int);
void LoadChunkBySomeIndex(int index, void *buf);
s8 DoSaveMetaCheck(int);
void GetSaveChunkData(int, struct RAMChapterData*);
int CheckSecHeader_BIT63();
void MakeMetaDataBySlot(int);

void SaveGame(int slot);
void LoadGame(int slot);
void SaveSuspendedGame(int slot);
void LoadSuspendedGame(int slot);

#endif /* BMSAVE_H */
