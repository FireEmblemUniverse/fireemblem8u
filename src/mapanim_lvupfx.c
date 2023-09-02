#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ap.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "mapanim.h"
#include "bmlib.h"

void PutManimLevelUpFrame(int actor_id, int x, int y)
{
    int i;

    BG_Fill(gBG1TilemapBuffer, 0);

    Decompress(Img_LevelUpBoxFrame, (void *)VRAM + GetBackgroundTileDataOffset(1) + 0x200 * CHR_SIZE);
    Decompress(Tsa_LevelUpBoxFrame, gGenericBuffer);
    PutTmLinear((void *)gGenericBuffer, (void *)gBG1TilemapBuffer, 0x20 * 0x1C, TILEREF(0x200, BGPAL_MANIM_INFO));
    ApplyPalette(Pal_LevelUpBoxFrame, BGPAL_MANIM_INFO);

    PutString(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + 2, y),
        TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(gManimSt.actor[actor_id].unit->pClassData->nameTextId));

    for (i = 0; gManimLevelUpLabelInfoList[i].x != 0xFF; i++) {
        PutStringCentered(
            TILEMAP_LOCATED(gBG0TilemapBuffer, x + gManimLevelUpLabelInfoList[i].x, y + gManimLevelUpLabelInfoList[i].y),
            TEXT_COLOR_SYSTEM_GOLD, 3,
            GetStringFromIndex(*gManimLevelUpLabelInfoList[i].msg[UnitHasMagicRank(gManimSt.actor[actor_id].unit) == true]));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT + BG1_SYNC_BIT);
}

void PutManimLevelUpStat(int actor_id, int x, int y, int stat_num, bool after_gain)
{
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + gManimLevelUpLabelInfoList[stat_num].x + 4, y + gManimLevelUpLabelInfoList[stat_num].y),
        TEXT_COLOR_SYSTEM_BLUE,
        GetManimLevelUpBaseStat(actor_id, stat_num) + (after_gain ? GetManimLevelUpStatGain(actor_id, stat_num) : 0));
}

int GetManimLevelUpStatGain(int actor_id, int stat_num)
{
    switch (stat_num) {
    case 0:
        return 1;

    case 1:
        return gManimSt.actor[actor_id].bu->changeHP;

    case 2:
        return gManimSt.actor[actor_id].bu->changePow;

    case 3:
        return gManimSt.actor[actor_id].bu->changeSkl;

    case 4:
        return gManimSt.actor[actor_id].bu->changeSpd;

    case 5:
        return gManimSt.actor[actor_id].bu->changeLck;

    case 6:
        return gManimSt.actor[actor_id].bu->changeDef;

    case 7:
        return gManimSt.actor[actor_id].bu->changeRes;

    case 8:
        return gManimSt.actor[actor_id].bu->changeCon;

    default:
        return 0;
    }
}

int GetManimLevelUpBaseStat(int actor_id, int stat_num)
{
    // getting the original unit to ensure we get the base stats
    struct Unit * unit = GetUnit(gManimSt.actor[actor_id].unit->index);

    switch (stat_num) {
        case 0:
            return gManimSt.actor[actor_id].bu->levelPrevious;

        case 1:
            return unit->maxHP;

        case 2:
            return unit->pow;

        case 3:
            return unit->skl;

        case 4:
            return unit->spd;

        case 5:
            return unit->lck;

        case 6:
            return unit->def;

        case 7:
            return unit->res;

        case 8:
            return UNIT_CON_BASE(unit);

        default:
            return 0;
    }
}

void ManimLevelUpStatGainLabel_Finish(struct ManimLevelUpStatGainLabelProc * proc)
{
    APProc_DeleteAll();
}

void StartManimLevelUpStatGainLabels(int chr, int pal, int sprite_layer, ProcPtr parent)
{
    struct ManimLevelUpStatGainLabelProc * proc_a;
    struct ManimLevelUpLabelColorProc * proc_b;

    proc_a = Proc_Start(ProcScr_ManimLevelUpStatGainLabel, parent);

    proc_a->chr = chr;
    proc_a->pal = pal;
    proc_a->sprite_layer = sprite_layer;

    Decompress(Img_ManimLevelUpStatGain, OBJ_VRAM0 + (OAM2_CHR(chr) << 5));
    ApplyPalette(Pal_ManimLevelUp, 0x10 + pal);
    ApplyPalette(Pal_ManimLevelUp, 0x10 + pal + 1);

    proc_b = Proc_Start(ProcScr_ManimLevelUpLabelColor, proc_a);
    proc_b->pal = pal;
}

void EndManimLevelUpStatGainLabels(void)
{
    Proc_EndEach(ProcScr_ManimLevelUpStatGainLabel);
}

void StartManimLevelUpStatGainLabelAnim(int x, int y, int stat_num, int stat_gain)
{
    int stat_loss;
    int chr_common, chr_this_stat;
    struct ManimLevelUpStatGainLabelProc * proc;
    u8 *digits_chr = Img_ManimLevelUpStatGainDigits;

    proc = Proc_Find(ProcScr_ManimLevelUpStatGainLabel);
    chr_common = proc->chr;
    chr_this_stat = proc->chr + (stat_num - 1) * 2;

    if (stat_num == 0) {
        APProc_Create(SpriteAnim_ManimStatGain,
            x - 18, y - 4,
            OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
            0, 2);
    } else {
        if (stat_gain > 0)
            stat_loss = 0;
        else
            stat_loss = 1;

        APProc_Create(SpriteAnim_ManimStatGain,
            x, y,
            OAM2_PAL(proc->pal + stat_loss) + chr_common + OAM2_LAYER(proc->sprite_layer),
            1 + stat_loss, 2);

        APProc_Create(SpriteAnim_ManimStatGain,
            x - 3, y,
            OAM2_PAL(proc->pal) + chr_this_stat + OAM2_LAYER(proc->sprite_layer),
            3 + stat_loss, 2);

        if (stat_gain > 0) {
            APProc_Create(SpriteAnim_ManimStatGain,
                x - 18, y - 4,
                OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
                0, 2);
        }

        if (stat_gain < 0) {
            VramCopy(digits_chr + 0x20 * CHR_SIZE,
                OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4C) << 5), CHR_SIZE);
        }

        VramCopy(digits_chr + (OAM2_CHR(ABS(stat_gain)) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x2D) << 5), CHR_SIZE);

        VramCopy(digits_chr + (OAM2_CHR(ABS(stat_gain) + 0x20) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4D) << 5), CHR_SIZE);
    }
}

void StartPrepItemBoostStatGainLabelAnim(int x, int y, int stat_gain)
{
    int chr_common, chr_this_stat, stat_abs, stat_loss;
    struct ManimLevelUpStatGainLabelProc * proc;
    u8 *digits_chr = Img_ManimLevelUpStatGainDigits;

    stat_abs = ABS(stat_gain);
    proc = Proc_Find(ProcScr_ManimLevelUpStatGainLabel);
    chr_common = proc->chr;

    if (stat_gain >= 0) {
        chr_this_stat = chr_common + 2 * (stat_abs - 1);
        stat_loss = 5;
    } else {
        chr_this_stat = chr_common +16;
        stat_loss = 6;
    }

    APProc_Create(SpriteAnim_ManimStatGain,
        x, y,
        chr_common + OAM2_PAL(proc->pal) + OAM2_LAYER(proc->sprite_layer),
        stat_loss, 2);

    APProc_Create(SpriteAnim_ManimStatGain,
        x - 3, y,
        chr_this_stat + OAM2_PAL(proc->pal) + OAM2_LAYER(proc->sprite_layer),
        3, 2);


    APProc_Create(SpriteAnim_ManimStatGain,
        x - 18, y - 4,
        chr_common + OAM2_PAL(proc->pal) + OAM2_LAYER(proc->sprite_layer),
        0, 2);

    VramCopy(digits_chr + (OAM2_CHR(stat_abs) << 5),
        OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x2D) << 5), CHR_SIZE);

    VramCopy(digits_chr + (OAM2_CHR(stat_abs + 0x20) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4D) << 5), CHR_SIZE);
}

struct ManimLevelUpLabelInfo CONST_DATA gManimLevelUpLabelInfoList[] = {
    {
        .x = 9, .y = 0,
        .msg = { &gMid_Lv, &gMid_Lv },
    },
    {
        .x = 1, .y = 4,
        .msg = { &gMid_Hp, &gMid_Hp },
    },
    {
        .x = 1, .y = 6,
        .msg = { &gMid_Str, &gMid_Mag },
    },
    {
        .x = 1, .y = 8,
        .msg = { &gMid_Skl, &gMid_Skl },
    },
    {
        .x = 1, .y = 10,
        .msg = { &gMid_Spd, &gMid_Spd },
    },
    {
        .x = 9, .y = 4,
        .msg = { &gMid_Lck, &gMid_Lck },
    },
    {
        .x = 9, .y = 6,
        .msg = { &gMid_Def, &gMid_Def },
    },
    {
        .x = 9, .y = 8,
        .msg = { &gMid_Res, &gMid_Res },
    },
    {
        .x = 9, .y = 10,
        .msg = { &gMid_Con, &gMid_Con },
    },
    {
        .x = -1, .y = -1
    }
};

CONST_DATA struct ProcCmd ProcScr_ManimLevelUpStatGainLabel[] =
{
    PROC_SET_END_CB(ManimLevelUpStatGainLabel_Finish),
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_ManimLevelUpLabelColor[] = {
    PROC_CALL(ManimLevelUpLabelColor_Init),
    PROC_REPEAT(ManimLevelUpLabelColor_Loop),
    PROC_END
};
