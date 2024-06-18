#include "global.h"

#include "bmlib.h"
#include "sram-layout.h"
#include "bmdifficulty.h"
#include "bonusclaim.h"
#include "bmsave.h"

//! FE8U = 0x080A720C
void CopyGlobalSaveInfo(struct GlobalSaveInfo * src, struct GlobalSaveInfo * dst)
{
    CpuCopy32(src, dst, sizeof(struct GlobalSaveInfo));
    CopyString(dst->name, "AGB-FE9");
    dst->magic32 = SAVEMAGIC32;
    dst->magic16 = SAVEMAGIC16;

    return;
}

//! FE8U = 0x080A723C
void SetGlobalSaveInfoPtr(struct SaveBlockInfo* src, struct SaveBlockInfo* dst)
{
    *dst = *src;
    dst->magic32 = SAVEMAGIC32;
    return;
}

//! FE8U = 0x080A7258
void SetPlayStPtrWithChIndexModify(struct PlaySt * src, struct PlaySt * dst)
{
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

//! FE8U = 0x080A7298
void sub_80A7298(const u32* src, u32* dst)
{
    memcpy(dst, src, 0x1d); // TODO: where does the 0x1D come from?
}

//! FE8U = 0x080A72B0
void sub_80A72B0(struct SuspendSaveBlockEwram * src, struct SuspendSaveBlock * dst)
{
    memcpy(&dst->action, src->buffer_58, sizeof(src->buffer_58));
    SetPlayStPtrWithChIndexModify(&src->playSt, &dst->playSt);
    sub_80A7298(src->buffer_1F1C, (void*)&dst->wmStuff);

    return;
}

//! FE8U = 0x080A72EC
void sub_80A72EC(struct GameSaveBlockEwram* src, struct GameSaveBlock* dst) {
    memcpy(dst->units, src->buffer_58, sizeof(src->buffer_58));
    SetPlayStPtrWithChIndexModify(&src->playSt, &dst->playSt);
    sub_80A7298(src->buffer_D74, (void*)&dst->wmStuff);
    return;
}

//! FE8U = 0x080A7328
void sub_80A7328(struct BonusClaimSaveData* src, struct BonusClaimSaveData* dst) {
    *dst = *src;
    return;
}

//! FE8U = 0x080A733C
void sub_80A733C(struct bmsave_unkstruct2* src, struct bmsave_unkstruct2* dst) {
    *dst = *src;
    return;
}

//! FE8U = 0x080A734C
void sub_80A734C(struct SoundRoomSaveData * src, struct SoundRoomSaveData * dst)
{
    *dst = *src;
    return;
}

//! FE8U = 0x080A7360
void sub_80A7360(struct GameRankSaveDataPacks* src, struct GameRankSaveDataPacks* dst) {
    *dst = *src;
    return;
}

extern u8 gUnknown_02008000[];

//! FE8U = 0x080A7374
void EraseInvalidSaveData(void)
{
    int i;
    struct SaveBlocksEwram * ewram;
    struct SaveBlocks * sram;
    struct SaveBlocksEwram * ewram_;

    ewram = (void *)EWRAM_ENTRY;
    sram = (void *)CART_SRAM;

    ReadSramFast(&sram->globalSaveInfo, ewram, sizeof(struct GlobalSaveInfo));

    /* Yeah this is FE8U's magic! */
    if (ewram->globalSaveInfo.magic32 == SAVEMAGIC32)
        return;

    ewram_ = ewram;

    ReadSramFast(sram, ewram_, 0x8000);

    /* Which game holds magic32 = 0x040603? */
    if (ewram_->globalSaveInfo.magic32 != 0x00040603)
        return;

    /* Erase the GlobalSaveInfo */
    CpuFastFill(0, (void *)ewram + 0x8000, sizeof(struct GlobalSaveInfo));
    CopyGlobalSaveInfo(&ewram_->globalSaveInfo, &((struct SaveBlocksEwram*)((void *)ewram + 0x8000))->globalSaveInfo);
    WriteGlobalSaveInfo(&((struct SaveBlocksEwram*)((void *)ewram + 0x8000))->globalSaveInfo);

    /* Erase the suspand data */
    for (i = 0; i < 2; i++) {
        CpuFastFill(0, (void *)ewram + 0x8000, sizeof(struct SuspendSaveBlock));
        sub_80A72B0(&ewram_->suspendSaveBlocks[i], (void *)ewram + 0x8000);
        WriteAndVerifySramFast((void *)ewram + 0x8000, &sram->suspendSaveBlocks[i], sizeof(struct SuspendSaveBlock));
    }

    /* Erase the save data */
    for (i = 0; i < 3; i++) {
        CpuFastFill(0, gUnknown_02008000, sizeof(struct GameSaveBlock));
        sub_80A72EC(&ewram_->gameSaveBlocks[i], (struct GameSaveBlock*)gUnknown_02008000);
        WriteAndVerifySramFast(gUnknown_02008000, &sram->gameSaveBlocks[i], sizeof(struct GameSaveBlock));
    }

    // GameRankSaveDataPacks
    CpuFastFill(0, gUnknown_02008000, sizeof(struct GameRankSaveDataPacks));
    sub_80A7360(&ewram_->gameRankSave, (struct GameRankSaveDataPacks*)gUnknown_02008000);
    SaveRankings(gUnknown_02008000);

    CpuFastFill(0, gUnknown_02008000, sizeof(struct SoundRoomSaveData));
    sub_80A734C(&ewram_->soundRoomSave, (struct SoundRoomSaveData*)gUnknown_02008000);
    WriteSoundRoomSaveData((struct SoundRoomSaveData *)gUnknown_02008000);

    // "bmsave_unkstruct2", flags for viewing CGs?
    CpuFastFill(0, gUnknown_02008000, sizeof(struct bmsave_unkstruct2));
    sub_80A733C(&ewram_->unkstruct2, (struct bmsave_unkstruct2*)gUnknown_02008000);
    WriteLinkArenaStruct2((struct bmsave_unkstruct2*)gUnknown_02008000);

    CpuFastFill(0, gUnknown_02008000, sizeof(struct BonusClaimSaveData));
    sub_80A7328(&ewram_->bonusClaim, (struct BonusClaimSaveData*)gUnknown_02008000);
    SaveBonusContentData(gUnknown_02008000);

    for (i = 0; i < SAVE_ID_MAX; i++) {
        CpuFastFill(0, gUnknown_02008000, sizeof(struct SaveBlockInfo));
        SetGlobalSaveInfoPtr(&ewram_->saveBlockInfo[i], (struct SaveBlockInfo*)gUnknown_02008000);
        WriteSaveBlockInfo((struct SaveBlockInfo *)gUnknown_02008000, i);
    }

    return;
}
