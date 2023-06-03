#include "global.h"

#include "bmlib.h"
#include "sram-layout.h"
#include "bmdifficulty.h"
#include "bonusclaim.h"
#include "bmsave.h"

//! FE8U = 0x080A720C
void sub_80A720C(struct GlobalSaveInfo* src, struct GlobalSaveInfo* dst) {
    CpuCopy32(src, dst, sizeof(struct GlobalSaveInfo));
    CopyString(dst->name, "AGB-FE9");
    dst->magic32 = 0x00040624;
    dst->magic16 = 0x0000200A;

    return;
}

//! FE8U = 0x080A723C
void sub_80A723C(struct SaveBlockInfo* src, struct SaveBlockInfo* dst) {
    *dst = *src;
    dst->magic32 = 0x00040624;
    return;
}

//! FE8U = 0x080A7258
void sub_80A7258(struct PlaySt* src, struct PlaySt* dst) {
    *dst = *src;

    if (dst->chapterIndex > 0x04) {
        dst->chapterIndex++;
    }

    if (dst->chapterIndex > 0x15) {
        dst->chapterIndex++;
    }

    if (dst->chapterIndex > 0x22) {
        dst->chapterIndex++;
    }

    return;
}

struct UnkStruct_SubA7298 {
    u8 unk[0x1d];
};

//! FE8U = 0x080A7298
void sub_80A7298(struct UnkStruct_SubA7298* src, struct UnkStruct_SubA7298* dst) {
    memcpy(dst, src, 0x1d);
}

//! FE8U = 0x080A72B0
void sub_80A72B0(struct SuspendSaveBlock* src, struct SuspendSaveBlock* dst) {
    memcpy((void*)dst + 0x4c, (void*)src + 0x58, 0x00001EC4);
    sub_80A7258(&src->playSt, &dst->playSt);
    sub_80A7298((struct UnkStruct_SubA7298*)(src->menuOverride + 8), (struct UnkStruct_SubA7298*)(dst->menuOverride + 8 + 0x28));

    return;
}

//! FE8U = 0x080A72EC
void sub_80A72EC(struct GameSaveBlock* src, struct GameSaveBlock* dst) {
    memcpy((void*)dst + 0x4c, (void*)src + 0x58, 0x00000D1C);
    sub_80A7258(&src->playSt, &dst->playSt);
    sub_80A7298((struct UnkStruct_SubA7298*)(src->permanentFlags + 8), (struct UnkStruct_SubA7298*)(dst->permanentFlags + 8 + 0x18));
    return;
}

//! FE8U = 0x080A7328
void sub_80A7328(struct BonusClaimEnt* src, struct BonusClaimEnt* dst) {
    memcpy(dst, src, sizeof(struct BonusClaimEnt) * 16 + 4);
    return;
}

//! FE8U = 0x080A733C
void sub_80A733C(struct bmsave_unkstruct2* src, struct bmsave_unkstruct2* dst) {
    *dst = *src;
    return;
}

//! FE8U = 0x080A734C
void sub_80A734C(struct bmsave_unkstruct1* src, struct bmsave_unkstruct1* dst) {
    *dst = *src;
    return;
}

//! FE8U = 0x080A7360
void sub_80A7360(struct GameRankSaveDataPacks* src, struct GameRankSaveDataPacks* dst) {
    *dst = *src;
    return;
}

extern u8 gAnims[];
extern u8 gUnknown_02008000[];

//! FE8U = 0x080A7374
void sub_80A7374(void) {
    int i;
    void* ewram;
    void* sram;
    void* ewram_;

    ewram = gAnims;
    sram = (void*)0xe000000;

    ReadSramFast(sram, ewram, 0x64);

    if (((struct GlobalSaveInfo*)(ewram))->magic32 == 0x00040624) {
        return;
    }

    ewram_ = ewram;

    ReadSramFast(sram, ewram_, 0x8000);

    if (((struct GlobalSaveInfo*)(ewram_))->magic32 != 0x00040603) {
        return;
    }

    CpuFastFill(0, ewram + 0x8000, sizeof(struct GlobalSaveInfo));
    sub_80A720C(ewram_, ewram + 0x8000);
    WriteGlobalSaveInfo((struct GlobalSaveInfo*)(ewram + 0x8000));

    for (i = 0; i < 2; i++) {
        CpuFastFill(0, ewram + 0x8000, sizeof(struct SuspendSaveBlock));
        sub_80A72B0(ewram_ + (i * 0x00001F58 + 0xd4), ewram + 0x8000);
        WriteAndVerifySramFast(ewram + 0x8000, sram + 0xd4 + i * sizeof(struct SuspendSaveBlock), sizeof(struct SuspendSaveBlock));
    }

    for (i = 0; i < 3; i++) {
        CpuFastFill(0, gUnknown_02008000, sizeof(struct GameSaveBlock));
        sub_80A72EC(ewram_ + (i * 0x00000DA4 + 0x00003F84), (struct GameSaveBlock*)gUnknown_02008000);
        WriteAndVerifySramFast(gUnknown_02008000, (sram + 0x00003FC4) + (i * sizeof(struct GameSaveBlock)), sizeof(struct GameSaveBlock));
    }

    // GameRankSaveDataPacks
    CpuFastFill(0, gUnknown_02008000, 0x94);
    sub_80A7360(ewram_ + 0x000070E4, (struct GameRankSaveDataPacks*)gUnknown_02008000);
    SaveRankings(gUnknown_02008000);

    // "bmsave_unkstruct1", flags for sound room data?
    CpuFastFill(0, gUnknown_02008000, sizeof(struct bmsave_unkstruct1));
    sub_80A734C(ewram_ + 0x00007178, (struct bmsave_unkstruct1*)gUnknown_02008000);
    sub_80A3EA4(gUnknown_02008000);

    // "bmsave_unkstruct2", flags for viewing CGs?
    CpuFastFill(0, gUnknown_02008000, sizeof(struct bmsave_unkstruct2));
    sub_80A733C(ewram_ + 0x0000719C, (struct bmsave_unkstruct2*)gUnknown_02008000);
    sub_80A4000((struct bmsave_unkstruct2*)gUnknown_02008000);

    CpuFastFill(0, gUnknown_02008000, sizeof(struct BonusClaimEnt) * 16 + 4);
    sub_80A7328(ewram_ + 0x000071B0, (struct BonusClaimEnt*)gUnknown_02008000);
    SaveBonusContentData(gUnknown_02008000);

    for (i = 0; i < 7; i++) {
        CpuFastFill(0, gUnknown_02008000, sizeof(struct SaveBlockInfo));
        sub_80A723C((ewram_ + 0x64) + i * sizeof(struct SaveBlockInfo), (struct SaveBlockInfo*)gUnknown_02008000);
        WriteSaveBlockInfo((struct SaveBlockInfo *)gUnknown_02008000, i);
    }

    return;
}