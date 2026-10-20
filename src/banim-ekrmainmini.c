#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

//! FE8U = 0x0805A3DC
void EkrMainMini_ExecCommands(struct EkrMainMiniDesc * desc, struct Anim * anim)
{
    int _tmp;
    int r0;
#if NONMATCHING
    register int animState2 asm("r5");
#else
    int animState2;
#endif

    if (anim == NULL)
    {
        return;
    }

    _tmp = anim->state2;
    animState2 = _tmp & 0xf000;
    animState2 &= anim->state2;

    if (animState2 == 0)
    {
        return;
    }

    if (animState2 & 0x1000)
    {
    _loop:
    {
        if (anim->commandQueueSize == 0)
        {
            goto _exit;
        }

        // FIXME: I really have no idea what is going on here...
        r0 = ((struct Anim *)((anim->commandQueueSize + (u8 *)(anim))))->commandQueueSize;

        switch (r0)
        {
            case 1:
            case 2:
                // _0805A4F0
                EkrMainMini_C01_Blocking(anim);
                break;

            case 5:
                // _0805A4F8
                if (GetAISLayerId(anim) == 0)
                {
                    StartClassReelSpellAnim(anim);
                }

                // fallthrough

            case 3:
            case 4:
                anim->pScrCurrent++;

                break;

            case 13:
                // _0805A510
                EkrMainMini_C0D_ExecNextRoundAfterAttack(anim);
                break;

            case 14:
                // _0805A518
                StartClassReelSpellAnim(anim);
                break;

            case 24:
                // _0805A520
                EkrMainMini_C01_Blocking(anim);
                break;

            case 0:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 43:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            default:
                // _0805A526
                break;
        }

        anim->commandQueueSize--;
        goto _loop;
    }

    _exit:
        anim->state2 &= 0xe700;
    }

    if (animState2 & 0x2000)
    {
        if ((GetAISLayerId(anim) == 0) && (desc->img_sheet != anim->pImgSheet))
        {
            RegisterAISSheetGraphics(anim);
            desc->img_sheet = anim->pImgSheet;
        }

        anim->state2 &= 0xd700;
    }

    animState2 &= 0x4000;

    if (animState2 != 0)
    {
        anim->nextRoundId = -1;
    }

    return;
}

//! FE8U = 0x0805A580
void EkrMainMini_C01_Blocking(struct Anim * anim)
{
    anim->nextRoundId = -2;

    if (anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED)
    {
        anim->state3 &= ANIM_BIT3_HIT_EFFECT_APPLIED;
        anim->nextRoundId = 0;
        anim->pScrCurrent++;
    }

    return;
}

//! FE8U = 0x0805A5A8
void EkrMainMini_C0D_ExecNextRoundAfterAttack(struct Anim * anim)
{
    struct EkrMainMiniDesc * desc = anim->pUnk44;
    struct BattleAnim * banim = banim_data;
    void * pool;

    if (GetAISLayerId(anim) == 0)
    {
        int mode = BanimDefaultModeConfig[0x18];
        int * whoKnows = banim[desc->bid].modes;

        struct Anim * anim1 = desc->anim1;
        struct Anim * anim2 = desc->anim2;

        const void * unk28 = desc->scr_buf;
#ifndef NONMATCHING
        register struct BanimModeData * frameData asm("r1") = (void *)unk28 + whoKnows[mode];
        register u32 r1 asm("r1");

        anim1->pImgSheet = frameData->img;
        unk28 = anim1->pSpriteDataPool;
        anim1->pSpriteData = unk28 += r1 = frameData->unk2;

        unk28 = anim2->pSpriteDataPool;
        anim2->pSpriteData = unk28 += 0x000057F0;
#else
        struct BanimModeData * frameData = (void *)unk28 + whoKnows[mode];

        anim1->pImgSheet = frameData->img;
        anim1->pSpriteData = anim1->pSpriteDataPool + frameData->unk2;

        anim2->pSpriteData = anim2->pSpriteDataPool + 0x000057F0;
#endif

        if (desc->img_sheet != anim->pImgSheet)
        {
            NewEkrChienCHR(anim);
            desc->img_sheet = anim->pImgSheet;
        }
    }

    return;
}

//! FE8U = 0x0805A60C
void EkrMainMini_InitAnim(struct EkrMainMiniDesc * desc)
{
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[desc->round_type * 4];
    configA = BanimDefaultModeConfig[desc->round_type * 4 + 1];
    modeB = BanimDefaultModeConfig[desc->round_type * 4 + 2];
    configB = BanimDefaultModeConfig[desc->round_type * 4 + 3];

    LZ77UnCompWram(ba[desc->bid].script, (void *)desc->scr_buf);

    ba2 = ba + desc->bid;
    modes = ba2->modes;
    scr = (u32 *)desc->scr_buf;

    scrA = BanimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = BanimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (desc->pos == 0)
    {
        int * p;
        puVar8 = desc->oam_buf;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = desc->oam_buf;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = AnimCreate(scrA, configA);

    anim->pSpriteDataPool = desc->oam_buf;

    anim->xPosition = desc->x;
    anim->yPosition = desc->y;

    anim->oam2Base = (desc->oam2_pal << 0xc) | 0x800 | desc->oam2_chr;
    anim->state2 = (desc->pos << 9) | 0x400 | anim->state2;
    anim->nextRoundId = 0;
    anim->currentRoundType = desc->round_type;
    anim->pImgSheetBuf = desc->img_buf;

    desc->anim1 = anim;
    anim->pUnk44 = desc;

    if (desc->bid == 0xc4)
    {
        desc->anim2 = 0;
    }
    else
    {
        anim = AnimCreate(scrB, configB);

        anim->pSpriteDataPool = desc->oam_buf;

        anim->xPosition = desc->x;
        anim->yPosition = desc->y;

        anim->oam2Base = (desc->oam2_pal << 0xc) | 0x800 | desc->oam2_chr;
        anim->state2 = (desc->pos << 9) | 0x500 | anim->state2;

        anim->nextRoundId = 0;
        anim->currentRoundType = desc->round_type;
        anim->pImgSheetBuf = desc->img_buf;

        desc->anim2 = anim;
        anim->pUnk44 = desc;
    }

    LZ77UnCompWram(ba[desc->bid].pal, desc->pal_buf);

    if (desc->char_pal != -1)
    {
        struct BattleAnimCharaPal * cbap = &character_battle_animation_palette_table[desc->char_pal];
        LZ77UnCompWram(cbap->pal, desc->pal_buf);
    }

    CpuFastSet(desc->pal_buf + desc->faction_pal * 0x20, desc->oam2_pal * 0x10 + gPaletteBuffer + 0x100, 8);

    EnablePaletteSync();

    desc->img_sheet = 0;
}

//! FE8U = 0x0805A7B4
void EkrMainMini_UpdateAnim(struct EkrMainMiniDesc * desc)
{
    struct BattleAnimCharaPal * cbapt = character_battle_animation_palette_table;
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[desc->round_type * 4];
    modeB = BanimDefaultModeConfig[desc->round_type * 4 + 2];

    LZ77UnCompWram(ba[desc->bid].script, (void *)desc->scr_buf);

    ba2 = ba + desc->bid;
    modes = ba2->modes;
    scr = (u32 *)desc->scr_buf;

    scrA = BanimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = BanimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (desc->pos == 0)
    {
        int * p;
        puVar8 = desc->oam_buf;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = desc->oam_buf;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = desc->anim1;

    anim->pScrStart = scrA;
    anim->pScrCurrent = scrA;

    anim->pSpriteDataPool = desc->oam_buf;

    anim->xPosition = desc->x;
    anim->yPosition = desc->y;

    anim->oam2Base = (desc->oam2_pal << 0xc) | 0x800 | desc->oam2_chr;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = desc->round_type;
    anim->pImgSheetBuf = desc->img_buf;

    anim->commandQueueSize = 0;
    desc->anim1 = anim;

    anim = desc->anim2;

    anim->pScrStart = scrB;
    anim->pScrCurrent = scrB;

    anim->pSpriteDataPool = desc->oam_buf;

    anim->xPosition = desc->x;
    anim->yPosition = desc->y;

    anim->oam2Base = (desc->oam2_pal << 0xc) | 0x800 | desc->oam2_chr;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = desc->round_type;
    anim->pImgSheetBuf = desc->img_buf;

    anim->commandQueueSize = 0;
    desc->anim2 = anim;

    LZ77UnCompWram(ba[desc->bid].pal, desc->pal_buf);

    if (desc->char_pal != -1)
        LZ77UnCompWram(cbapt[desc->char_pal].pal, desc->pal_buf);

    CpuFastCopy(desc->pal_buf + desc->faction_pal * 0x20, desc->oam2_pal * 0x10 + gPaletteBuffer + 0x100, 0x20);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x0805A930
void EkrMainMini_ChangeAnim(struct EkrMainMiniDesc * desc, int bid, int char_pal)
{
    desc->bid = bid;
    desc->char_pal = char_pal;

    EkrMainMini_UpdateAnim(desc);

    return;
}

//! FE8U = 0x0805A940
void EkrMainMini_SetAnimPosition(struct EkrMainMiniDesc * desc, u16 x, u16 y)
{
    struct Anim * anim;

    desc->x = x;
    desc->y = y;

    anim = desc->anim1;
    anim->xPosition = desc->x;
    anim->yPosition = desc->y;

    anim = desc->anim2;
    anim->xPosition = desc->x;
    anim->yPosition = desc->y;

    return;
}

//! FE8U = 0x0805A95C
void EkrMainMini_SetAnimLayer(struct EkrMainMiniDesc * desc, u16 layer)
{
    struct Anim * anim;

    anim = desc->anim1;
    anim->oam2Base = layer << 10;

    anim = desc->anim2;
    anim->oam2Base = layer << 10;

    return;
}

//! FE8U = 0x0805A96C
bool EkrMainMini_CheckBlocking(struct EkrMainMiniDesc * desc)
{
    struct Anim * anim1 = desc->anim1;
    struct Anim * anim2 = desc->anim2;

    if (anim1->nextRoundId == (u16)-2)
    {
        return true;
    }

    if (anim2->nextRoundId == (u16)-2)
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0805A990
void EkrMainMini_EndBlock(struct EkrMainMiniDesc * desc)
{
    struct Anim * anim;

    anim = desc->anim1;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    anim = desc->anim2;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    return;
}

//! FE8U = 0x0805A9A4
bool EkrMainMini_CheckDone(struct EkrMainMiniDesc * desc)
{
    struct Anim * anim = desc->anim1;

    if (anim->nextRoundId != (u16)-1)
    {
        return false;
    }

    return true;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EfxAnimeDrv[] =
{
    PROC_NAME("ekrAnimeDrvProc"),
    PROC_REPEAT(EkrAnimeDrv_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805A9C0
void NewEfxAnimeDrvProc(void)
{
    void ** ptr = &gpProcEfxAnimeDrv;
    *ptr = Proc_Start(ProcScr_EfxAnimeDrv, PROC_TREE_4);

    AnimClearAll();

    return;
}

//! FE8U = 0x0805A9E0
void EndEfxAnimeDrvProc(void)
{
    Proc_End(gpProcEfxAnimeDrv);
    return;
}

//! FE8U = 0x0805A9F4
void EkrAnimeDrv_Loop(void)
{
    AnimUpdateAll();
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EkrUnitMainMini[] =
{
    PROC_NAME("ekrUnitMainMini"),
    PROC_REPEAT(EkrMainMini_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805AA00
void NewEkrUnitMainMini(struct EkrMainMiniDesc * desc)
{
    struct ProcEkrUnitMainMini * proc = Proc_Start(ProcScr_EkrUnitMainMini, PROC_TREE_4);
    EkrMainMini_InitAnim(desc);

    proc->desc = desc;

    desc->proc = proc;
    desc->valid = 1;

    return;
}

//! FE8U = 0x0805AA28
void EndEkrMainMini(struct EkrMainMiniDesc * desc)
{
    AnimDelete(desc->anim1);
    AnimDelete(desc->anim2);

    desc->anim1 = 0;
    desc->anim2 = 0;

    Proc_End(desc->proc);

    return;
}

//! FE8U = 0x0805AA4C
void EkrMainMini_Loop(struct ProcEkrUnitMainMini * proc)
{
    struct EkrMainMiniDesc * desc = proc->desc;

    EkrMainMini_ExecCommands(desc, desc->anim1);
    EkrMainMini_ExecCommands(desc, desc->anim2);

    return;
}

//! FE8U = 0x0805AA68
void NewEkrTerrainfx(struct EkrTerrainfxDesc * desc)
{
    struct BattleAnimTerrain * a;
    struct BattleAnimTerrain * b;
    void * vramA;
    void * vramB;
    void * palA;
    void * palB;
    s16 oam2Pal;
    u16 oam2;

    a = &battle_terrain_table[desc->terrain_l];
    b = &battle_terrain_table[desc->terrain_r];

    if (desc->terrain_l != -1)
    {
        LZ77UnCompWram(a->tileset, desc->img_buf);
    }

    if (desc->terrain_r != -1)
    {
        LZ77UnCompWram(b->tileset, desc->img_buf + 0x1000);
    }

    switch (desc->distance) {
    case 0:
    case 4:
        vramA = desc->img_buf;
        vramB = desc->img_buf + 0x1000;
        break;

    case 1:
    case 2:
    case 3:
    default:
        vramA = desc->img_buf + 0x800;
        vramB = desc->img_buf + 0x1800;
        break;
    }

    palA = a->palette;
    palB = b->palette;

    switch (desc->bg_index) {
    case -1:
    case 0:
    case 1:
    case 2:
    case 3:
        break;

    default:
        break;
    }

    if (desc->bg_index != -1)
    {
        if (desc->bg_index >= -1)
        {
            if (desc->bg_index < 4)
            {
                int vram = ((desc->chr_l + 0x40) * 0x20 + VRAM);
                RegisterDataMove(vramA, (void *)(desc->vram_offset + vram), 0x800);
                vram = (desc->chr_r * 0x20 + VRAM);
                RegisterDataMove(vramB, (void *)(desc->vram_offset + vram), 0x800);

                CpuFastCopy(palA, gPaletteBuffer + desc->pal_l * 0x10, 0x20);
                CpuFastCopy(palB, gPaletteBuffer + desc->pal_r * 0x10, 0x20);

                EnablePaletteSync();
                EkrTerrainfx_PutTiles(desc);
            }
        }
    }
    else
    {
        if (desc->terrain_l != -1)
        {
            RegisterDataMove(vramA, (void *)(desc->vram_offset + desc->chr_l * 0x20), 0x800);
            CpuFastCopy(palA, desc->pal_l * 0x10 + gPaletteBuffer + 0x100, 0x20);
        }

        if (desc->terrain_r != -1)
        {
            RegisterDataMove(vramB, (void *)(desc->vram_offset + desc->chr_r * 0x20), 0x800);
            CpuFastCopy(palB, desc->pal_r * 0x10 + gPaletteBuffer + 0x100, 0x20);
        }

        EnablePaletteSync();
    }

    switch (desc->bg_index) {
    case 0:
        BG_EnableSyncByMask(BG0_SYNC_BIT);
        return;

    case 1:
        BG_EnableSyncByMask(BG1_SYNC_BIT);
        return;

    case 2:
        BG_EnableSyncByMask(BG2_SYNC_BIT);
        return;

    case 3:
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        return;

    case -1:
        desc->proc1 = NULL;
        desc->proc2 = NULL;

        if (desc->terrain_r != -1)
        {
            switch (desc->distance) {
            case 0:
            case 4:
                oam2Pal = desc->pal_r;
                oam2 = (oam2Pal << 0xc) | desc->chr_r | OAM2_LAYER(3);
                desc->proc2 = NewEkrsubAnimeEmulator(0xa8, 0x68, AnimScr_EkrMainMini_L_Close, 2, oam2, 0, PROC_TREE_4);
                break;

            case 1:
                oam2Pal = desc->pal_r;
                oam2 = (oam2Pal << 0xc) | desc->chr_r | OAM2_LAYER(3);
                desc->proc2 = NewEkrsubAnimeEmulator(0xb0, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 2:
                oam2Pal = desc->pal_r;
                oam2 = (oam2Pal << 0xc) | desc->chr_r | OAM2_LAYER(3);
                desc->proc2 = NewEkrsubAnimeEmulator(0xb0, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 3:
                oam2Pal = desc->pal_r;
                oam2 = (oam2Pal << 0xc) | desc->chr_r | OAM2_LAYER(3);
                desc->proc2 = NewEkrsubAnimeEmulator(0x80, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;
            }
        }

        if ((desc->terrain_l != -1))
        {
            switch (desc->distance) {
            case 0:
            case 4:
                oam2Pal = desc->pal_l;
                oam2 = (oam2Pal << 0xc) | desc->chr_l | OAM2_LAYER(3);
                desc->proc1 = NewEkrsubAnimeEmulator(0x48, 0x68, AnimScr_EkrMainMini_R_Close, 2, oam2, 0, PROC_TREE_4);
                break;

            case 1:
                oam2Pal = desc->pal_l;
                oam2 = (oam2Pal << 0xc) | desc->chr_l | OAM2_LAYER(3);
                desc->proc1 = NewEkrsubAnimeEmulator(0x20, 0x68, AnimScr_EkrMainMini_R_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 2:
                oam2Pal = desc->pal_l;
                oam2 = (oam2Pal << 0xc) | desc->chr_l | OAM2_LAYER(3);
                desc->proc1 = NewEkrsubAnimeEmulator(0x40, 0x68, AnimScr_EkrMainMini_R_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 3:
                oam2Pal = desc->pal_l;
                oam2 = (oam2Pal << 0xc) | desc->chr_l | OAM2_LAYER(3);
                desc->proc1 = NewEkrsubAnimeEmulator(0x78, 0x68, AnimScr_EkrMainMini_R_Close, 2, oam2, 0, PROC_TREE_4);
                break;
            }
        }

        break;
    }
}

//! FE8U = 0x0805AE14
void EndEkrTerrainfx(struct EkrTerrainfxDesc * desc)
{
    if (desc->bg_index == -1)
    {
        if (desc->proc1)
            Proc_End(desc->proc1);

        if (desc->proc2)
            Proc_End(desc->proc2);
    }
}

//! FE8U = 0x0805AE40
void EkrTerrainfx_SetPosition(struct EkrTerrainfxDesc * desc, s16 x1, s16 y1, s16 x2, s16 y2)
{
    struct ProcEkrSubAnimeEmulator * proc;

    proc = desc->proc1;
    proc->x1 = x1;
    proc->y1 = y1;

    proc = desc->proc2;
    proc->x1 = x2;
    proc->y1 = y2;
}

//! FE8U = 0x0805AE58
void EkrTerrainfx_PutTiles(struct EkrTerrainfxDesc * desc)
{
    int tmp;
    int offsetC;

    int offsetA = 0;
    int offsetB = 0;

    u16 * tmA = TsaConfs_BanimTmA[desc->distance * 2 + 0];
    u16 * tmB = TsaConfs_BanimTmA[desc->distance * 2 + 1];

    sub_80559B0(0);

    switch (desc->distance)
    {
        case 0:
        case 4:
            offsetA = 33;
            offsetB = 48;

            offsetC = 0;

            break;

        case 1:
            offsetA = 29;
            offsetB = 48;

            if (gEkrInitPosReal == 1)
            {
                offsetC = 0;
            }
            else
            {
                offsetC = -4;
            }

            break;

        case 2:
            offsetA = 3;
            offsetB = 48;

            if (gEkrInitPosReal == 1)
            {
                offsetC = 0;
            }
            else
            {
                offsetC = -30;
            }

            break;

        case 3:
        default:
            if (desc->terrain_l != -1)
            {
                offsetA = 39;
                offsetB = 3;
            }

            if (desc->terrain_r != -1)
            {
                offsetA = 3;
                offsetB = 42;
            }

            offsetC = 0;

            break;
    }

    tmp = 0x35A;

    EfxTmCpyExt(tmA, -1, gTmA_Banim + 0x35A + offsetA, 0x42, 0xf, 5, desc->pal_l, desc->chr_l);
    EfxTmCpyExt(tmB, -1, gTmA_Banim + 0x35A + offsetB, 0x42, 0xf, 5, desc->pal_r, desc->chr_r);

    EfxTmCpyExt((gTmA_Banim + tmp + offsetC) - 0x2B5, 0x42, gBG2TilemapBuffer, 0x20, 0x20, 0x14, -1, -1);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x0805AFA0
void BanimCopyBgTM(s16 distance, s16 position)
{
    int offset;

    switch (distance)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_PROMOTION:
            offset = 48;
            if (position == 0)
            {
                offset = 33;
            }

            break;

        case EKR_DISTANCE_FAR:
            offset = 48;
            if (position == 0)
            {
                offset = 29;
            }

            break;

        case EKR_DISTANCE_FARFAR:
        case EKR_DISTANCE_MONOCOMBAT:
        default:
            offset = 48;
            if (position == 0)
            {
                offset = 3;
            }

            break;
    }

    EfxTmCpyExt(gUnknown_080DAF60, -1, gTmA_Banim + 0x35A + offset, 0x42, 0xf, 5, -1, -1);

    return;
}
