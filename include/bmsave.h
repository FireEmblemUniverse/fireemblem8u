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
    /* 0C */ u8 _pad_0C[0x10 - 0xC];
};

struct SramHeader {
    struct SecureSaveHeader SecHead;
    struct SramChunk chunks[0x7];
};

/* used in sub_80A341C */
struct bmsave_unkstruct0 {
    u8 unk[0x14];
};

struct bmsave_unkstruct1 {
    /* 00 */ u32 unk00_00 : 0x01;
             u32 unk00_01 : 0x03;
             u32 unk00_04 : 0x03; 
             u32 unk00_07 : 0x03; 
             u32 unk00_0A : 0x03;
             u32 unk00_0D : 0x03;
             u32 unk00_10 : 0x03;

             u32 unk00_13 : 0x02;
             u32 unk00_15 : 0x01;
             u32 unk00_16 : 0x01;
             u32 unk00_17 : 0x08;
             u32 unk00_1F : 0x08;

             u32 unk04_07 : 0x0A;
             u32 unk04_11 : 0x06;
             u32 unk04_17 : 0x06;
             u32 unk04_1D : 0x18;

    /* 08 */ u32 unk08_15 : 0x06;
             u32 unk08_1F : 0x01;

    /* 0C */ char unk0C[0xB];

    /* 17 */ u8 best_unit;
};

struct bmsave_unkstruct2 {
    struct bmsave_unkstruct1 unk0[0x6];
    int unk90;
};


s8 IsSramWorking();

#endif /* BMSAVE_H */
