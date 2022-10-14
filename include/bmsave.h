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
    /* 14 */ u8 unk14[0x20 - 0x14];
    /* 20 */ u8 unk20[0x40 - 0x20];
    /* 40 */ u8 unk40[0x60 - 0x40];
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
void SetSecHeader_unk62(int num);
void SaveUnit(struct Unit *unit, void *sram_dest);
void SaveRNGState_Maybe(void *sram_dest);
void SaveWMStaff(void *sram_dest, void *src);
void SaveDungeonState(void *ram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void LoadGMMonsterRNState(const void *sram_src);
void LoadConvoyItems(const void *sram_src);
void LoadGlobalEventIds(const void *sram_src);
void LoadBWLEntries(void *sram_src);
void LoadChapterWinData(const void *sram_src);
void Load0203EDB4(const void *sram_src);
void LoadWMStaff(const void *sram_src, void *src);
void LoadDungeonState(const void *sram_src);

u8 VerifySecHeaderBySomeIndex(int);
void sub_80A5DFC(int);
void LoadChunkBySomeIndex(int index, void *buf);
s8 DoSaveMetaCheck(int);
void GetSaveChunkData(int, struct RAMChapterData*);
int CheckSecHeader_BIT63();
void MakeMetaDataBySomeIndex(int);

#endif /* BMSAVE_H */
