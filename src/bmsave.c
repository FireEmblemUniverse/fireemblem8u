#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"

/* variables */
EWRAM_DATA u32 gBonusContentClaimFlags = 0;
EWRAM_DATA u8 gSuspendSaveIdOffset = 0;

u32 GetBonusContentClaimFlags()
{
    return gBonusContentClaimFlags;
}

void SetBonusContentClaimFlags(u32 num)
{
    gBonusContentClaimFlags = num;
}

void WriteBonusContentClaimFlags(struct GameSaveBlock *sram_dest)
{
    WriteAndVerifySramFast(&gBonusContentClaimFlags,
                           &sram_dest->bonusClaimFlags,
                           sizeof(gBonusContentClaimFlags));
}

void ReadBonusContentClaimFlags(const struct GameSaveBlock *sram_src)
{
    ReadSramFast(&sram_src->bonusClaimFlags,
                 &gBonusContentClaimFlags,
                 sizeof(gBonusContentClaimFlags));
}

void WriteLastGameSaveId(int num)
{
    struct GlobalSaveInfo info;

    ReadGlobalSaveInfo(&info);
    info.last_game_save_id = num;
    WriteGlobalSaveInfoNoChecksum(&info);
}

int ReadLastGameSaveId()
{
    int ret;
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;
    
    ret = info.last_game_save_id;

    if (ret > SAVE_ID_GAME2)
        return SAVE_ID_GAME0;
    else if (ret < 0)
        return SAVE_ID_GAME0;
    else
        return ret;
}

void InvalidateGameSave(int index)
{
    struct SaveBlockInfo chunk;
    struct PlaySt play_st;

    if (IsValidSuspendSave(SAVE_ID_SUSPEND)) {
        ReadSuspendSavePlaySt(SAVE_ID_SUSPEND, &play_st);

        if (play_st.gameSaveSlot == index)
            InvalidateSuspendSave(SAVE_ID_SUSPEND);
    }

    chunk.kind = SAVEBLOCK_KIND_INVALID;
    WriteSaveBlockInfo(&chunk, index);
}

void CopyGameSave(int index_src, int index_dest)
{
    struct SaveBlockInfo chunk;
    void *src = GetSaveReadAddr(index_src);
    void *dest = GetSaveWriteAddr(index_dest);

    ReadSramFast(src, gGenericBuffer, sizeof(struct GameSaveBlock));
    WriteAndVerifySramFast(gGenericBuffer, dest, sizeof(struct GameSaveBlock));

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index_dest);
}

void WriteNewGameSave(int index, int isDifficult, int mode, int isTutorial)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GameSavePackedUnit unitp;

    struct GameSaveBlock *dest = GetSaveWriteAddr(index);

    if (0 == mode)
        mode = gPlaySt.chapterModeIndex;

    if (isTutorial < 0)
        isTutorial = gPlaySt.config.controller;

    SetGameTime(0);
    InitPlayConfig(isDifficult, isTutorial);
    InitUnits();
    ClearSupplyItems();
    ResetPermanentFlags();
    InvalidateSuspendSave(SAVE_ID_SUSPEND);
    
    gPlaySt.unk_2C_1 = 0;
    gPlaySt.unk_2C_04 = 0;
    CpuFill16(0, &gPlaySt.unk_30, sizeof(gPlaySt.unk_30));
    gPlaySt.unk_2C_0D = 0;
    gPlaySt.chapterModeIndex = mode;
    gPlaySt.unk_2B_00 = 1;
    gPlaySt.playerName[0] = '\0';
    gPlaySt.chapterIndex = 0;
    gPlaySt.playthroughIdentifier = GetNewPlaythroughId();
    gPlaySt.gameSaveSlot = index;
    gPlaySt.unk_2C_2 = GetGlobalCompletionCount();

    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    SetBonusContentClaimFlags(0);
    WriteBonusContentClaimFlags(dest);
    
    CpuFill16(0, &unitp, sizeof(unitp));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++) {
        WriteAndVerifySramFast(&unitp, &dest->units[i], sizeof(unitp));
    }
    WriteAndVerifySramFast(&unitp, &dest->gmUnit, sizeof(unitp));

    WriteSupplyItems(dest->supplyItems);
    ClearPidChStatsSaveData(dest);
    WritePermanentFlags(dest->permanentFlags);
    ClearWorldMapStuff(&dest->wmStuff);

    {
        struct Dungeon dungeon[2];  
        CpuFill16(0, dungeon, sizeof(dungeon));
        WriteAndVerifySramFast(dungeon, dest->dungeons, sizeof(dungeon));
    }

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index);
    WriteLastGameSaveId(index);
}

void WriteGameSave(int slot)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GlobalSaveInfo info;
    struct Dungeon dungeon[2];

    struct GameSaveBlock *dest = GetSaveWriteAddr(slot);
    InvalidateSuspendSave(SAVE_ID_SUSPEND);
    gPlaySt.gameSaveSlot = slot;
    gPlaySt.time_saved = GetGameClock();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteGameSavePackedUnit(&gUnitArrayBlue[i], &dest->units[i]);

    ReadGlobalSaveInfo(&info);
    
    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        SGM_SetCharacterKnown(UNIT_CHAR_ID(&gUnitArrayBlue[i]), &info);

    WriteGlobalSaveInfo(&info);
    WriteGMMonsterRnState(&dest->gmUnit);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteBonusContentClaimFlags(dest);
    WritePermanentFlags(dest->permanentFlags);
    WriteWorldMapStuff(&dest->wmStuff, &gGMData);
    SaveDungeonRecords(dungeon);
    WriteAndVerifySramFast(dungeon, dest->dungeons, sizeof(dungeon));

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_GAME;
    WriteSaveBlockInfo(&chunk, slot);
    WriteLastGameSaveId(slot);
}

void ReadGameSave(int slot)
{
    int i;
    struct Dungeon dungeon[2];
    struct GameSaveBlock *src = GetSaveReadAddr(slot);

    if (!(PLAY_FLAG_HARD & gBmSt.gameStateBits))
        InvalidateSuspendSave(SAVE_ID_SUSPEND);

    ReadSramFast(src, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);
    gPlaySt.gameSaveSlot = slot;

    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        LoadSavedUnit(src->units + i, &gUnitArrayBlue[i]);

    ReadGMMonsterRnState(&src->gmUnit);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadBonusContentClaimFlags(src);
    ReadWorldMapStuff(&src->wmStuff, &gGMData);
    ReadSramFast(src->dungeons, dungeon, sizeof(dungeon));
    LoadDungeonRecords(dungeon);
    WriteLastGameSaveId(slot);
}

bool IsSaveValid(int index)
{
    return ReadSaveBlockInfo(NULL, index);
}

void ReadGameSavePlaySt(int slot, struct PlaySt *buf)
{
    const struct GameSaveBlock *src = GetSaveReadAddr(slot);
    ReadSramFast(&src->playSt, buf, sizeof(struct PlaySt));
}

u32 LoadSavedBonusClaimFlags(int slot)
{
    u32 buf;
    const struct GameSaveBlock *src = GetSaveReadAddr(slot);
    ReadSramFast(&src->bonusClaimFlags, &buf, sizeof(buf));
    return buf;
}

void LoadSavedWMStuff(int slot, struct GMapData *dest)
{
    const struct GameSaveBlock *src = GetSaveReadAddr(slot);
    ReadWorldMapStuff(&src->wmStuff, dest);
}

s8 LoadSavedEid8A(int slot)
{
    const struct GameSaveBlock *sram_base = GetSaveReadAddr(slot);
    ReadPermanentFlags_ret(sram_base->permanentFlags, gGenericBuffer);
    return CheckPermanentFlagFrom(0x8A, gGenericBuffer);
}

bool IsGameNotFirstChapter(struct PlaySt *chapter_data)
{
    if (PLAY_FLAG_COMPLETE & chapter_data->chapterStateBits)
        return true;
    else if (0 != chapter_data->chapterIndex)
        return true;
    else
        return false;
}

bool IsGameSaveNotFirstChapter(int slot)
{
    struct PlaySt chapter_data;

    if (!IsSaveValid(slot))
        return false;

    ReadGameSavePlaySt(slot, &chapter_data);
    return IsGameNotFirstChapter(&chapter_data);
}

bool IsGameSaveComplete(int slot)
{
    struct PlaySt chapter_data;

    if (!IsSaveValid(slot))
        return false;

    ReadGameSavePlaySt(slot, &chapter_data);

    return (PLAY_FLAG_COMPLETE & chapter_data.chapterStateBits);
}

void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest)
{
    int i;
    struct GameSavePackedUnit unitp;


    unitp.pid = UNIT_CHAR_ID(unit);
    unitp.jid = unit->pClassData->number;

    if (NULL == unit->pCharacterData) {
        struct Unit tmp_unit;
        unit = &tmp_unit;
        ClearUnit(&tmp_unit);
        unitp.pid = 0;
        unitp.jid = 0;
    }
#if BUGFIX
    else {
        unitp.pid = unit->pinfo->id;
        unitp.jid = unit->jinfo->id;
    }
#endif

    unitp.level = unit->level;
    unitp.exp = unit->exp;
    unitp.xPos = unit->xPos;
    unitp.yPos = unit->yPos;

    unitp.max_hp = unit->maxHP;
    unitp.pow = unit->pow;
    unitp.skl = unit->skl;
    unitp.spd = unit->spd;
    unitp.def = unit->def;
    unitp.res = unit->res;
    unitp.lck = unit->lck;
    unitp.con_bonus = unit->conBonus;
    unitp.mov_bonus = unit->movBonus;

    unitp.item1 = unit->items[0];
    unitp.item2 = unit->items[1];
    unitp.item3 = unit->items[2];
    unitp.item4 = unit->items[3];
    unitp.item5 = unit->items[4];

    unitp.flag = 0;

    if (US_DEAD & unit->state)
        unitp.flag |= PACKED_US_DEAD;

    if (US_NOT_DEPLOYED & unit->state) 
        unitp.flag |= PACKED_US_UNDEPLOYED;

    if (US_SOLOANIM_1 & unit->state)
        unitp.flag |= PACKED_US_SOLO_ANIM1;

    if (US_SOLOANIM_2 & unit->state)
        unitp.flag |= PACKED_US_SOLO_ANIM2;

    if (US_GROWTH_BOOST & unit->state)
        unitp.flag |= PACKED_US_METIS_TOME;

    if (US_BIT16 & unit->state)
        unitp.flag |= PACKED_US_B4;

    if (US_BIT25 & unit->state)
        unitp.flag |= PACKED_US_B5;

    if (US_BIT21 & unit->state)
        unitp.flag |= PACKED_US_NEW_FRIEND;

    for (i = 0; i < 8; i++)
        unitp.wpnRanks[i] = unit->ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unitp.supports[i] = unit->supports[i];

    WriteAndVerifySramFast(&unitp, sram_dest, sizeof(unitp));
}

void LoadSavedUnit(const void *sram_src, struct Unit *unit)
{
    int i;
    struct GameSavePackedUnit unitp;

    ReadSramFast(sram_src, &unitp, sizeof(unitp));

    unit->pCharacterData = GetCharacterData(unitp.pid);
    unit->pClassData = GetClassData(unitp.jid);
    unit->level = unitp.level;
    unit->exp = unitp.exp;
    unit->xPos = unitp.xPos;
    unit->yPos = unitp.yPos;

    unit->maxHP = unitp.max_hp;
    unit->pow = unitp.pow;
    unit->skl = unitp.skl;
    unit->spd = unitp.spd;
    unit->def = unitp.def;
    unit->res = unitp.res;
    unit->lck = unitp.lck;
    unit->conBonus = unitp.con_bonus;
    unit->movBonus = unitp.mov_bonus;

    unit->items[0] = unitp.item1;
    unit->items[1] = unitp.item2;
    unit->items[2] = unitp.item3;
    unit->items[3] = unitp.item4;
    unit->items[4] = unitp.item5;

    if (unit->exp > 99)
        unit->exp = -1;

    unit->state = 0;

    if (PACKED_US_DEAD & unitp.flag)
        unit->state  = US_HIDDEN | US_DEAD;

    if (PACKED_US_UNDEPLOYED & unitp.flag)
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    if (PACKED_US_SOLO_ANIM1 & unitp.flag)
        unit->state |= US_SOLOANIM_1;

    if (PACKED_US_SOLO_ANIM2 & unitp.flag)
        unit->state |= US_SOLOANIM_2;

    if (PACKED_US_METIS_TOME & unitp.flag)
        unit->state |= US_GROWTH_BOOST;

    if (PACKED_US_B4 & unitp.flag)
        unit->state |= US_BIT16;

    if (PACKED_US_B5 & unitp.flag)
        unit->state |= US_BIT25;

    if (PACKED_US_NEW_FRIEND & unitp.flag)
        unit->state |= US_BIT21;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unitp.wpnRanks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unitp.supports[i];

    SetUnitHp(unit, GetUnitMaxHp(unit));
    unit->supportBits = 0;

    /* mins zero */
    if (0x7F == unit->exp)
        unit->exp = -1;

    if (0x3F == unit->xPos)
        unit->xPos = -1;

    if (0x3F == unit->yPos)
        unit->yPos = -1;
}

void WriteGMMonsterRnState(void *sram_dest)
{
    u32 buf[2];
    sub_80A71E4(buf);
    WriteAndVerifySramFast(buf, sram_dest, sizeof(buf));
}

void ReadGMMonsterRnState(const void *sram_src)
{
    u32 buf[2];
    ReadSramFast(sram_src, buf, sizeof(buf));
    sub_80A71F8(buf);
}

void InvalidateSuspendSave(int slot)
{
    struct SaveBlockInfo chunk;
    chunk.kind = SAVEBLOCK_KIND_INVALID;

    WriteSaveBlockInfo(&chunk, slot);

    if (SAVE_ID_SUSPEND == slot)
        WriteSaveBlockInfo(&chunk, SAVE_ID_SUSPEND_ALT);
}

void WriteSuspendSave(int slot)
{
    struct SuspendSaveBlock *dest;
    struct SaveBlockInfo chunk;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    int i, val;
    struct SuspendSavePackedUnit *buf;

    if (PLAY_FLAG_TUTORIAL & gPlaySt.chapterStateBits)
        return;

    if (!IsSramWorking())
        return;

    slot += GetNextSuspendSaveId();
    dest = GetSaveWriteAddr(slot);
    gPlaySt.time_saved = GetGameClock();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    StoreRNStateToActionStruct();
    WriteAndVerifySramFast(&gActionData, &dest->action, sizeof(struct ActionData));

    buf = (struct SuspendSavePackedUnit *)gGenericBuffer;
    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayBlue[i], buf++);

    WriteSramFast(gGenericBuffer, (u8 *)dest->blueUnits, UNIT_SAVE_AMOUNT_BLUE * sizeof(struct SuspendSavePackedUnit));

    buf = (struct SuspendSavePackedUnit *)gGenericBuffer;
    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayRed[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayGreen[i], buf++);

    WriteSramFast(gGenericBuffer, (u8 *)dest->redUnits, (UNIT_SAVE_AMOUNT_RED + UNIT_SAVE_AMOUNT_GREEN) * sizeof(struct SuspendSavePackedUnit)); // TODO: maybe pack them into a single struct?

    WritePermanentFlags(dest->permanentFlags);
    WriteChapterFlags(dest->chapterFlags);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteTraps(dest->traps);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest->menuOverride, sizeof(list));

    WriteWorldMapStuff(&dest->wmStuff, &gGMData);

    /**
     * I think this maybe a coincidence that I$ find that gm-generated-monster does not require the suspend save space
     */
    SaveDungeonRecords(dungeon);
    WriteAndVerifySramFast(dungeon, &dest->wmMonsterUnit, sizeof(dungeon));

    SaveDungeonState(dungeon);
    WriteAndVerifySramFast(dungeon, &dest->dungeon, sizeof(struct Dungeon));

    val = GetEventSlotCounter();
    WriteAndVerifySramFast(&val, &dest->eventSlotCnt, sizeof(int));

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_SUSPEND;
    WriteSaveBlockInfo(&chunk, slot);

    gBmSt.just_resumed = false;
    WriteSwappedSuspendSaveId();
}

void ReadSuspendSave(int slot)
{
    int i, val;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    struct SuspendSaveBlock *src = GetSaveReadAddr(slot + gSuspendSaveIdOffset);

    ReadSramFast(&src->playSt, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);

    ReadSramFast(&src->action, &gActionData, sizeof(struct ActionData));
    LoadRNStateFromActionStruct();
    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        ReadSuspendSavePackedUnit(&src->blueUnits[i], &gUnitArrayBlue[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        ReadSuspendSavePackedUnit(&src->redUnits[i], &gUnitArrayRed[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        ReadSuspendSavePackedUnit(&src->greenUnits[i], &gUnitArrayGreen[i]);

    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadChapterFlags(src->chapterFlags);
    ReadTraps(src->traps);

    ReadSramFast(src->menuOverride, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    ReadWorldMapStuff(&src->wmStuff, &gGMData);

    ReadSramFast(&src->wmMonsterUnit, dungeon, sizeof(dungeon));
    LoadDungeonRecords(dungeon);

    ReadSramFast(&src->dungeon, dungeon, sizeof(struct Dungeon));
    LoadDungeonState(dungeon);

    ReadSramFast(&src->eventSlotCnt, &val, sizeof(int));
    SetEventSlotCounter(val);

    SetBonusContentClaimFlags(LoadSavedBonusClaimFlags(gPlaySt.gameSaveSlot));
}

u8 IsValidSuspendSave(int slot)
{
    if (!IsSramWorking())
        return false;

    if (SAVE_ID_SUSPEND != slot)
        return false;

    gSuspendSaveIdOffset = GetLastSuspendSaveId();
    if (ReadSaveBlockInfo(NULL, gSuspendSaveIdOffset + 3))
        return true;

    gSuspendSaveIdOffset = GetNextSuspendSaveId();
    if (ReadSaveBlockInfo(NULL, gSuspendSaveIdOffset + 3))
        return true;
    
    gSuspendSaveIdOffset = 0x7F;
    return false;
}

void ReadSuspendSavePlaySt(int slot, struct PlaySt *buf)
{
    ReadGameSavePlaySt(slot + gSuspendSaveIdOffset, buf);
}

void EncodeSuspendSavePackedUnit(struct Unit *unit, void *buf)
{
    u8 ai1_byte;
    int i;
    struct SuspendSavePackedUnit *unit_su = buf;

    if (NULL == unit->pCharacterData) {
        unit_su->pid = 0;
        return;
    }
    
    unit_su->pid = UNIT_CHAR_ID(unit);
    unit_su->jid = unit->pClassData->number;
    unit_su->level = unit->level;
    unit_su->exp = unit->exp;
    unit_su->state = unit->state;
    unit_su->xPos = unit->xPos;
    unit_su->yPos = unit->yPos;
    unit_su->maxHP = unit->maxHP;
    unit_su->curHP = unit->curHP;
    unit_su->pow = unit->pow;
    unit_su->skl = unit->skl;
    unit_su->spd = unit->spd;
    unit_su->def = unit->def;
    unit_su->res = unit->res;
    unit_su->lck = unit->lck;
    unit_su->conBonus = unit->conBonus;
    unit_su->statusIndex_l = unit->statusIndex;
    unit_su->statusDuration = unit->statusDuration;
    unit_su->torchDuration = unit->torchDuration;
    unit_su->barrierDuration = unit->barrierDuration;
    unit_su->rescue = unit->rescue;
    unit_su->movBonus = unit->movBonus;

    unit_su->ballistaIndex = 
                  (0x7F & unit->ballistaIndex) | (0x01 & unit->supportBits) << 0x07;
    unit_su->item1 = (0x3FFF & unit->items[0]) | (0x06 & unit->supportBits) << 0x0D;
    unit_su->item2 = (0x3FFF & unit->items[1]) | (0x18 & unit->supportBits) << 0x0B;
    unit_su->item3 = (0x3FFF & unit->items[2]) | (0x60 & unit->supportBits) << 0x09;
    unit_su->item4 = unit->items[3];
    unit_su->item5 = unit->items[4];

    for (i = 0; i < 8; i++)
        unit_su->ranks[i] = unit->ranks[i];
    
    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit_su->supports[i] = unit->supports[i];

    unit_su->ai1 =  unit->ai1;

    ai1_byte = unit->ai1 & 0x7F;
    if (unit->statusIndex & 8)
        ai1_byte |= 0x80;

    unit_su->ai1 = ai1_byte;
    unit_su->ai_a_pc = unit->ai_a_pc;
    unit_su->ai2 = unit->ai2;
    unit_su->ai_b_pc = unit->ai_b_pc;
    unit_su->ai_config = unit->ai_config;
    unit_su->ai_counter = unit->ai_counter;
    unit_su->aiFlags = unit->aiFlags; 
}

void ReadSuspendSavePackedUnit(const void *sram_src, struct Unit *unit)
{
    int i;

    struct SuspendSavePackedUnit unit_su;

    ReadSramFast(sram_src, &unit_su, sizeof(unit_su));

    unit->pCharacterData = GetCharacterData(unit_su.pid);
    unit->pClassData = GetClassData(unit_su.jid);
    unit->level = unit_su.level;
    unit->exp = unit_su.exp;
    unit->state = unit_su.state;
    unit->xPos = unit_su.xPos;
    unit->yPos = unit_su.yPos;

    unit->maxHP = unit_su.maxHP;
    unit->curHP = unit_su.curHP;
    unit->pow = unit_su.pow;
    unit->skl = unit_su.skl;
    unit->spd = unit_su.spd;
    unit->def = unit_su.def;
    unit->res = unit_su.res;
    unit->lck = unit_su.lck;
    unit->conBonus = unit_su.conBonus;

    unit->statusIndex = unit_su.statusIndex_l;
    unit->statusIndex |= (unit_su.ai1 & 0x80) ? 8 : 0;
    unit->statusDuration = unit_su.statusDuration;
    unit->torchDuration = unit_su.torchDuration;
    unit->barrierDuration = unit_su.barrierDuration;

    unit->rescue = unit_su.rescue;
    unit->movBonus = unit_su.movBonus;
    unit->ballistaIndex = unit_su.ballistaIndex & 0x7F;

    unit->items[0] = unit_su.item1 & 0x3FFF;
    unit->items[1] = unit_su.item2 & 0x3FFF;
    unit->items[2] = unit_su.item3 & 0x3FFF;
    unit->items[3] = unit_su.item4;
    unit->items[4] = unit_su.item5;

    unit->supportBits = (unit_su.ballistaIndex & 0x80) >> 7 |
                        (unit_su.item1 & 0xC000) >> 0x0D |
                        (unit_su.item2 & 0xC000) >> 0x0B |
                        (unit_su.item3 & 0xC000) >> 0x09;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unit_su.ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unit_su.supports[i];

    unit->ai1 = unit_su.ai1 & 0x7F;
    unit->ai_a_pc = unit_su.ai_a_pc;
    unit->ai2 = unit_su.ai2;
    unit->ai_b_pc = unit_su.ai_b_pc;
    unit->ai_config = unit_su.ai_config;
    unit->ai_counter = unit_su.ai_counter;
    unit->aiFlags = unit_su.aiFlags;

    if (0x7F == unit->exp)
        unit->exp = -1;

    if (0x3F == unit->xPos)
        unit->xPos = -1;

    if (0x3F == unit->yPos)
        unit->yPos = -1;
}

void WriteTraps(void *sram_dest)
{
    WriteAndVerifySramFast(GetTrap(0), sram_dest, TRAP_MAX_COUNT * sizeof(struct Trap));
}

void ReadTraps(void *sram_dest)
{
    ReadSramFast(sram_dest, GetTrap(0), TRAP_MAX_COUNT * sizeof(struct Trap));
}

int GetLastSuspendSaveId()
{
    struct GlobalSaveInfo header;
    ReadGlobalSaveInfo(&header);

    if (1 == header.last_suspend_slot)
        return 1;
    else
        return 0;
}

int GetNextSuspendSaveId()
{
    return 1 - GetLastSuspendSaveId();
}

void WriteSwappedSuspendSaveId()
{
    struct GlobalSaveInfo header;   
    ReadGlobalSaveInfo(&header);
    header.last_suspend_slot = 0 == header.last_suspend_slot;
    WriteGlobalSaveInfoNoChecksum(&header);
}

int SramChecksum32(void *sram_src, int size)
{
    ReadSramFast(sram_src, gGenericBuffer, size);
    return ComputeChecksum32((const u32*)gGenericBuffer, size);
}

bool VerifySaveBlockChecksum(struct SaveBlockInfo *buf)
{
    int size = buf->size;
    void *sram_dest = SramOffsetToAddr(buf->offset);
    int check_sum = SramChecksum32(sram_dest, size);

    if (buf->checksum32 != check_sum)
        return false;
    else
        return true;
}

void PopulateSaveBlockChecksum(struct SaveBlockInfo* buf)
{
    int size = buf->size;
    void *sram_dest = SramOffsetToAddr(buf->offset);
    buf->checksum32 = SramChecksum32(sram_dest, size);
}

u16 GetGameStateChecksum_Unused()
{
    int i;
    u16 ret = 0;

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++) {
        if (0 == gUnitArrayBlue[i].pCharacterData)
            continue;

        gUnitArrayBlue[i].pMapSpriteHandle = 0;
        ret += SramChecksum32(&gUnitArrayBlue[i], sizeof(struct GameSavePackedUnit));
    }

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++) {
        if (0 == gUnitArrayRed[i].pCharacterData)
            continue;

        gUnitArrayRed[i].pMapSpriteHandle = 0;
        ret += SramChecksum32(&gUnitArrayRed[i], sizeof(struct GameSavePackedUnit));
    }

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++) {
        if (0 == gUnitArrayGreen[i].pCharacterData)
            continue;

        gUnitArrayGreen[i].pMapSpriteHandle = 0;
        ret += SramChecksum32(&gUnitArrayGreen[i], sizeof(struct GameSavePackedUnit));
    }

    ret += SramChecksum32(GetPermanentFlagBits(), GetPermanentFlagBitsSize() / 2);

    ret += SramChecksum32(GetChapterFlagBits(), GetChapterFlagBitsSize() / 2);

    ret += SramChecksum32(GetTrap(0), (TRAP_MAX_COUNT * sizeof(struct Trap)) / 2);

    return ret;
}

void sub_80A6544()
{
    u8 buf[8];
}

bool IsMultiArenaSaveValid(int index)
{
    return ReadSaveBlockInfo(NULL, index);
}
