#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"

extern struct Anim *gAnims[4];

/**
 * Misc banim effects
 */

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
void NewEfxYushaSpinShield(struct Anim *anim, int r1)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxYushaSpinShield, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    NewEfxYushaSpinShieldOBJ(anim, r1);
}

void EfxYushaSpinShieldMain(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxYushaSpinShieldOBJ(struct Anim *anim, int r1)
{
    u32 *scr1, *scr2;
    struct ProcEfxOBJ *proc;
    struct Anim *anim2;

    proc = Proc_Start(ProcScr_efxYushaSpinShieldOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = r1;

    if (r1 == 0) {
        scr1 = gUnknown_085EAB58;
        scr2 = gUnknown_085EBDF8;
    } else {
        scr1 = gUnknown_085ED0C8;
        scr2 = gUnknown_085EE398;
    }

    anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /**
     * oam2_data::chr = 0;
     * oam2_data::pal = 0;
     */
    anim2->oam2Base &= 0xC00;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200; /* oam2_data::chr = 0x7200; */
    else
        anim2->oam2Base |= 0x9300; /* oam2_data::chr = 0x9300; */
}

void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ *proc)
{
    u32 *scr;
    struct Anim *anim2 = proc->anim2;
    if (++proc->timer != 0x45)
        return;
    
    if (proc->unk29 == 0) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EBEFC;
            anim2->pScrCurrent = gUnknown_085EBEFC;
        } else {
            anim2->pScrStart = gUnknown_085EAC5C;
            anim2->pScrCurrent = gUnknown_085EAC5C;
        }
    } else {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EE49C;
            anim2->pScrCurrent = gUnknown_085EE49C;
        } else {
            anim2->pScrStart = gUnknown_085ED1CC;
            anim2->pScrCurrent = gUnknown_085ED1CC;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ *proc)
{
    if (!(proc->anim->state3 & 0x4))
        return;

    if (!(proc->anim->state3 & 0x8))
        return;

    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;

    if (sub_80522CC() != true)
        return;

    if (proc->unk29 == 0) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EBF24;
            anim2->pScrCurrent = gUnknown_085EBF24;
        } else {
            anim2->pScrStart = gUnknown_085EAC84;
            anim2->pScrCurrent = gUnknown_085EAC84;
        }
    } else {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EE4C4;
            anim2->pScrCurrent = gUnknown_085EE4C4;
        } else {
            anim2->pScrStart = gUnknown_085ED1F4;
            anim2->pScrCurrent = gUnknown_085ED1F4;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0x14) {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
void NewEfxHurtmutEff00(struct Anim *anim)
{
    struct ProcEfx *proc;

    if (gEfxBgSemaphore != 0)
        return;
    
    proc = Proc_Start(ProcScr_efxHurtmutEff00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (gEkrDistanceType == EKR_POS_L)
        NewEfxHurtmutEff00OBJ(anim);
    else
        NewEfxHurtmutEff01OBJ(anim);
}

void EfxHurtmutEff00Main(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxHurtmutEff00OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff00OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxAnimCreate(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E15F4;
        anim2->pScrCurrent = gUnknown_085E15F4;
    } else {
        anim2->pScrStart = gUnknown_085E1960;
        anim2->pScrCurrent = gUnknown_085E1960;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DE984, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E1C48;
        anim2->pScrCurrent = gUnknown_085E1C48;
    } else {
        anim2->pScrStart = gUnknown_085E1EA4;
        anim2->pScrCurrent = gUnknown_085E1EA4;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DF224, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ *proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxHurtmutEff01OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff01OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxAnimCreate(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E163C;
        anim2->pScrCurrent = gUnknown_085E163C;
    } else {
        anim2->pScrStart = gUnknown_085E19A8;
        anim2->pScrCurrent = gUnknown_085E19A8;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DE984, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E1C58;
        anim2->pScrCurrent = gUnknown_085E1C58;
    } else {
        anim2->pScrStart = gUnknown_085E1EB4;
        anim2->pScrCurrent = gUnknown_085E1EB4;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DF224, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ *proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}


/**
 * C2E: banim_code_effect_magic_rune_normal
 * C2F: banim_code_effect_magic_rune_critical
 */
void NewEfxMagfcast(struct Anim *anim, int type)
{
    s16 id2;    /* maybe not the class index */
    struct ProcEfx *proc;

    if (gEfxBgSemaphore != 0)
        return;

    ClearBG1Setup();
    proc = Proc_Start(ProcScr_efxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    id2 = gEkrPairBanimID2[GetAISSubjectId(anim)] - 0x6A;
    switch (id2) {
    case 0x0:
    case 0x1:
    case 0x2A:
        NewEfxMagfcastBG(proc->anim, type);
        break;

    /* Just for switch case align */
    case 2:
    case 3:
    case 4:
    case 5:
    default:
        NewEfxMagfcastBG(proc->anim, type + 2);
        break;
    }
}

void EfxMagfcastMain(struct ProcEfx *proc)
{
    if (++proc->timer == 0x14)
        Proc_Break(proc);
}

void NewEfxMagfcastBG(struct Anim *anim, u32 type)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagfcastBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (type) {
    case 0:
        proc->frame_config = gUnknown_080DF386;
        proc->unk4C = gUnknown_085D8FC4;
        proc->unk50 = gUnknown_085D8FC4;
        break;

    case 1:
        proc->frame_config = gUnknown_080DF39C;
        proc->unk4C = gUnknown_085D8FC4;
        proc->unk50 = gUnknown_085D8FC4;
        break;

    case 2:
        proc->frame_config = gUnknown_080DF3A2;
        proc->unk4C = gUnknown_085D8FDC;
        proc->unk50 = gUnknown_085D8FDC;
        break;

    case 3:
        proc->frame_config = gUnknown_080DF3C4;
        proc->unk4C = gUnknown_085D8FDC;
        proc->unk50 = gUnknown_085D8FDC;
        EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
        break;

    default:
        break;
    }

    SomeImageStoringRoutine_SpellAnim2(gUnknown_085EE4F8, 0x2000);
    SomePaletteStoringRoutine_SpellAnim2(gUnknown_085EF24C, 0x20);
    sub_80551B0();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0x0);
        else
            BG_SetPosition(BG_1, 0xE8, 0x0);
    }
}

void EfxMagfcastBGMain(struct ProcEfxBG *proc)
{
    s16 ret;
    ret = EfxGetNextFrameIndex(
        (void *)&proc->timer,
        (void *)&proc->frame,
        proc->frame_config
    );

    if (ret >= 0) {
        u16 **tsa1;
        u16 **tsa2;

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
            if (GetAISSubjectId(proc->anim) == EKR_POS_L)
                BG_SetPosition(BG_1, 0x18, 0x0);
            else
                BG_SetPosition(BG_1, 0xE8, 0x0);
        }

        tsa1 = proc->unk4C;
        tsa2 = proc->unk50;

        sub_8055670(
            proc->anim,
            tsa1[ret],
            tsa2[ret]
        );

        return;
    }

    if (ret == -1) {
        ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }
}

/**
 * C30: banim_code_effect_dirt_kick
 * C31: banim_code_effect_dirt_wave_small
 * C32: banim_code_effect_dirt_wave_medium
 */

void NewEfxSunakemuri(struct Anim *anim, int type)
{
    struct ProcEfx *proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxSunakemuri, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxSunakemuriOBJ(anim, type);
    }
}

void EfxSunakemuriMain(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxSunakemuriOBJ(struct Anim *anim, int type)
{
    int terrain;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSunakemuriOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = gUnknown_085F1710;
    if (type != 0) {
        scr1 = gUnknown_085F19A0;
        if (type == 1)
            scr1 = gUnknown_085F1858;
    }

    scr2 = gUnknown_085F17B4;
    if (type != 0) {
        scr2 = gUnknown_085F1A44;
        if (type == 1)
            scr2 = gUnknown_085F18FC;
    }

    proc->anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);

    terrain = gEkrPairTerrainID[GetAISSubjectId(proc->anim)];
    switch (terrain) {
    case TERRAIN_PLAINS:
    case TERRAIN_ROAD:
    case TERRAIN_VILLAGE_03:
    case TERRAIN_VILLAGE_04:
    case TERRIAN_HOUSE:
    case TERRAIN_FORT:
    case TERRAIN_FOREST:
    case TERRAIN_THICKET:
    case TERRAIN_SAND:
    case TERRAIN_DESERT:
    case TERRAIN_MOUNTAIN:
    case TERRAIN_PEAK:
    case TERRAIN_BRIDGE_13:
    case TERRAIN_FENCE_19:
    case TERRAIN_WALL_1A:
    case TERRAIN_WALL_1B:
    case TERRAIN_RUBBLE:
    case TERRAIN_ROOF:
    case TERRAIN_GATE_23:
    case TERRAIN_RUINS_25:
    case TERRAIN_CLIFF:
    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
    case TERRAIN_SHIP_FLAT:
    case TERRAIN_SHIP_WRECK:
    case TERRAIN_GLACIER:
    case TERRAIN_SNAG:
    case TERRAIN_INN:
    case TERRAIN_BARREL:
    case TERRAIN_BONE:
    case TERRAIN_DARK:
    case TERRAIN_GUNNELS:
    case TERRAIN_BRACE:
    case TERRAIN_MAST:
        SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1620, 0x20);
        break;
    
    case TERRAIN_BRIDGE_14:
        if (sub_80723A4(proc->anim) != EKR_POS_L)
            SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1620, 0x20);
        else
            SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1640, 0x20);
        break;

    case TERRAIN_RIVER:
    case TERRAIN_SEA:
    case TERRAIN_LAKE:
    case TERRAIN_DEEPS:
    case TERRAIN_WATER:
        SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1640, 0x20);
        break;

    case TERRAIN_ARMORY:
    case TERRAIN_VENDOR:
    case TERRAIN_ARENA_08:
    case TERRAIN_C_ROOM_09:
    case TERRAIN_GATE_0B:
    case TERRAIN_FLOOR_17:
    case TERRAIN_FLOOR_18:
    case TERRAIN_PILLAR:
    case TERRAIN_DOOR:
    case TERRAIN_THRONE:
    case TERRAIN_CHEST_20:
    case TERRAIN_CHEST_21:
    case TERRAIN_CHURCH:
    case TERRAIN_STAIRS:
    case TERRAIN_ARENA_30:
    case TERRAIN_VALLEY:
    case TERRAIN_FENCE_32:
    case TERRAIN_RUINS_37:
    case TERRAIN_DECK:
        SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1660, 0x20);
        break;

    case TERRAIN_TILE_00:
    default:
        break;
    }

    SomeImageStoringRoutine_SpellAnim(gUnknown_085F11B0, 0x1000);
}

void EfxSunakemuriOBJMain(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0x9) {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C4E: banim_code_effect_dirt_wave
 */
void NewEfxLokmsuna(struct Anim *anim)
{
    struct ProcEfx *proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxLokmsuna, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxLokmsunaOBJ(anim);
    }
}

void EfxLokmsunaMain(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxLokmsunaOBJ(struct Anim *anim)
{
    u32 *scr1, *scr2;
    struct Anim *anim2;
    struct ProcEfxOBJ *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLokmsunaOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = gUnknown_087584B8;
    scr2 = gUnknown_087585DC;
    anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /* oam2_data::pal = 0 */
    anim2->oam2Base &= 0xFFF;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7000;
    else
        anim2->oam2Base |= 0x9000;
    
    SomeImageStoringRoutine_SpellAnim(gUnknown_08758218, 0x1000);
}

void EfxLokmsunaIOBJMain(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0xF) {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C39: banim_code_hit_fake
 */
void NewEfxKingPika(struct Anim *anim)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxKingPika, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxKingPikaMain(struct ProcEfx *proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
        return;
    }

    if (time == 0xA) {
        StartSpellBG_FLASH(anim, 0x14);
        return;
    }

    if (time == 0x2D) {
        struct Anim *anim1 = gAnims[GetAISSubjectId(anim) * 2];
        struct Anim *anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

        anim1->state3 |= 0x40;
        anim2->state3 |= 0x40;
        Proc_Break(proc);
    }
}

/**
 * C51: banim_code_flash_white
 */
void NewEfxFlashFX(struct Anim *anim)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxFlashFX, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxFlashFXMain(struct ProcEfx *proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        StartSpellBG_FLASH(anim, 0x5);
        return;
    }

    if (time == 0x6) {
        struct Anim *anim1 = gAnims[GetAISSubjectId(anim) * 2];
        struct Anim *anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

        anim1->state3 |= 0x40;
        anim2->state3 |= 0x40;
        Proc_Break(proc);
    }
}

/**
 * Maybe unused banim commands?
 */
void NewEfxSongOBJ2(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0x28;
    proc->anim2 = EfxAnimCreate(anim, gUnknown_085DD4B4, gUnknown_085DD4B4, gUnknown_085DD4B4, gUnknown_085DD4B4);
    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DCC84, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DCB10, 0x1000);
    EkrSoundSomeBark(0xEE, 0x100, proc->anim->xPosition, 0x1);
}

void EfxSongOBJ2Main(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0x18)
        EkrSoundSomeBark(0xEE, 0x100, proc->anim->xPosition, 0x1);

    if (proc->timer > proc->unk2E) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxDanceOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0x19;
    proc->anim2 = EfxAnimCreate(anim, gUnknown_085DD484, gUnknown_085DD484, gUnknown_085DD484, gUnknown_085DD484);
    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DCC84, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DCB10, 0x1000);
    EkrSoundSomeBark(0xE1, 0x100, proc->anim->xPosition, 0x1);
}

void EfxDanceOBJMain(struct ProcEfxOBJ *proc)
{
    if (++proc->timer > proc->unk2E) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Shinning effect for legend weapon
 */
void NewEfxSpecalEffect(struct Anim *anim)
{
    struct BattleUnit *bu;
    struct ProcEfx *proc;
    struct Anim *anim1, *anim2;

    if (gUnknown_02017768[GetAISSubjectId(anim)] == false) {
        gUnknown_02017768[GetAISSubjectId(anim)] = true;

        if (GetAISSubjectId(anim) == EKR_POS_L)
            bu = gpEkrBattleUnitLeft;
        else
            bu = gpEkrBattleUnitRight;

        if (IsWeaponLegency(bu->weaponBefore) == false) {
            anim1 = gAnims[GetAISSubjectId(anim) * 2];
            anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

            anim1->state3 |= 0x40;
            anim2->state3 |= 0x40;
            return;
        }
    } else {
        anim1 = gAnims[GetAISSubjectId(anim) * 2];
        anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

        anim1->state3 |= 0x40;
        anim2->state3 |= 0x40;
        return;
    }

    proc = Proc_Start(ProcScr_efxSpecalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
    EkrSoundSomeBark(0xF0, 0x100, 0x78, 0x0);
    NewEfxSRankWeaponEffect(anim);
}

void sub_806D980(ProcPtr proc)
{
    Proc_Break(proc);
}

void NewEfxSRankWeaponEffect(struct Anim *anim)
{
    struct ProcEfx *proc;
    ClearBG1Setup();
    proc = Proc_Start(ProcScr_efxSRankWeaponEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
}

void EfxSRankWeaponEffectMain(struct ProcEfx *proc)
{
    int time = ++proc->timer;

    if (time == 1) {
        NewEfxSRankWeaponEffectBG(proc->anim);
        return;
    }

    if (time == 0x15) {
        NewEfxRestWINH_(proc->anim, 0x2D, 0x1);
        NewEfxSRankWeaponEffectSCR();
        return;
    }

    if (time == 0x46) {
        struct Anim *anim1, *anim2;

        anim1 = gAnims[GetAISSubjectId(proc->anim) * 2];
        anim2 = gAnims[GetAISSubjectId(proc->anim) * 2 + 1];
        
        anim1->state3 |= 0x40;
        anim2->state3 |= 0x40;
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    proc = Proc_Start(ProcScr_efxSRankWeaponEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SomeImageStoringRoutine_SpellAnim2(gUnknown_085E8C04, 0x2000);
    SomePaletteStoringRoutine_SpellAnim2(gUnknown_085E8CC4, 0x20);
    sub_8055670(proc->anim, gUnknown_085E8CE4, gUnknown_085E8CE4);
    sub_80551B0();
}

void EfxSRankWeaponEffectBGMain(struct ProcEfxBG *proc)
{
    if (++proc->timer == 0x3C) {
        ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectSCR(void)
{
    struct ProcEfx *proc;
    proc = Proc_Start(efxSRankWeaponEffectSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = 0;
    NewEfxSRankWeaponEffectSCR2(proc);
}

#if NONMATCHING
void EfxSRankWeaponEffectSCRMain(struct ProcEfx *proc)
{
    u32 i;
    u16 *dst = gUnknown_0201FDB8 != 0
        ? gUnknown_0201FDC4
        : gUnknown_0201FF04;

    for (i = 0; i < 0x9F; i++) {
        s16 val;
        u32 ref;

        if (i < 0x77) {
            ref = (gUnknown_085D9154[i] * proc->unk44 * 0x10) << 0x10;
            val = ref >> 0x10;
    
            if (val == 0) {
                dst[i] = ref;
                continue;
            }
    
            if (i < 0x3B) {
                if (val < (i - 0x88)) {
                    dst[i] = ref;
                } else {
                    u16 tmp = i + 0xFF78;
                    dst[i] = tmp;
                }
            } else {
                if (val < 0x88) {
                    dst[i] = ref;
                } else {
                    u32 tmp = (0x880000 + 0xFFFF0000 * i) << 0x10;
                    dst[i] = tmp;
                }
            }
        } else {
            dst[i] = 0;
        }
    }
}
#else

__attribute__((naked))
void EfxSRankWeaponEffectSCRMain(struct ProcEfx *proc)
{
    asm(".syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov ip, r0\n\
        ldr r0, _0806DAF8  @ gUnknown_0201FDB8\n\
        ldr r0, [r0]\n\
        ldr r4, _0806DAFC  @ gUnknown_0201FDC4\n\
        cmp r0, #0\n\
        bne _0806DAC0\n\
        ldr r4, _0806DB00  @ gUnknown_0201FF04\n\
    _0806DAC0:\n\
        movs r3, #0\n\
        movs r7, #0x88\n\
        lsls r7, r7, #0x10	/* 8800000 */\n\
        movs r6, #0x88\n\
        ldr r5, _0806DB04  @ gUnknown_085D9154\n\
    _0806DACA:\n\
        cmp r3, #0x77\n\
        bhi _0806DB16\n\
        movs r0, #0\n\
        ldrsh r1, [r5, r0]\n\
        mov r2, ip\n\
        ldr r0, [r2, #0x44]\n\
        muls r0, r1, r0\n\
        lsls r0, r0, #4\n\
        lsrs r2, r0, #0x10\n\
        asrs r1, r0, #0x10\n\
        cmp r1, #0\n\
        beq _0806DB12\n\
        cmp r3, #0x3b\n\
        bhi _0806DB0C\n\
        adds r0, r3, #0\n\
        subs r0, #0x88\n\
        cmp r1, r0\n\
        bcs _0806DB12\n\
        ldr r1, _0806DB08  @ 0x0000FF78\n\
        adds r0, r3, r1\n\
        lsls r0, r0, #0x10\n\
        lsrs r2, r0, #0x10\n\
        b _0806DB12\n\
        .align 2, 0\n\
    _0806DAF8: .4byte gUnknown_0201FDB8\n\
    _0806DAFC: .4byte gUnknown_0201FDC4\n\
    _0806DB00: .4byte gUnknown_0201FF04\n\
    _0806DB04: .4byte gUnknown_085D9154\n\
    _0806DB08: .4byte 0x0000FF78\n\
    _0806DB0C:\n\
        cmp r1, r6\n\
        bls _0806DB12\n\
        lsrs r2, r7, #0x10\n\
    _0806DB12:\n\
        strh r2, [r4]\n\
        b _0806DB1A\n\
    _0806DB16:\n\
        movs r0, #0\n\
        strh r0, [r4]\n\
    _0806DB1A:\n\
        adds r4, #2\n\
        ldr r2, _0806DB30  @ 0xFFFF0000\n\
        adds r7, r7, r2\n\
        subs r6, #1\n\
        adds r5, #2\n\
        adds r3, #1\n\
        cmp r3, #0x9f\n\
        bls _0806DACA\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0806DB30: .4byte 0xFFFF0000\n\
        .syntax divided");
}
#endif

void NewEfxSRankWeaponEffectSCR2(struct ProcEfx *seff_scr)
{
    struct ProcEfxSRankSCR2 *proc;
    proc = Proc_Start(efxSRankWeaponEffectSCR2, PROC_TREE_3);
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->seff_scr1 = seff_scr;
}

void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 *proc)
{
    struct ProcEfx *seff_scr = proc->seff_scr1;
    seff_scr->unk44 = 
        Interpolate(INTERPOLATE_LINEAR, 0, 0x40000, proc->timer, proc->terminator);

    if (++proc->timer > proc->terminator) {
        Proc_End(seff_scr);
        Proc_Break(proc);
    }
}

void NewEfxMagdhisEffect(struct Anim *anim)
{
    struct ProcEfx *proc;
    ClearBG1Setup();
    proc = Proc_Start(ProcScr_efxMagdhisEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxMagdhisEffectMain(struct ProcEfx *proc)
{
    if (++proc->timer == 0x11) {
        NewEfxMagdhisEffectBG(proc->anim, 0x49);
        EfxPlaySE(0x140, 0x100);
        M4aPlayWithPostionCtrl(0x140, proc->anim->xPosition, 1);
    }

    if (proc->timer == 0x64)
        Proc_Break(proc);
}

void NewEfxMagdhisEffectBG(struct Anim *anim, int arg1)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMagdhisEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = arg1;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF4F4;
    proc->unk4C = gUnknown_085D9274;
    proc->unk50 = gUnknown_085D9274;

    SomePaletteStoringRoutine_SpellAnim2(gUnknown_085F0E04, 0x20);
    SomeImageStoringRoutine_SpellAnim2(gUnknown_085F0190, 0x2000);
    sub_80551B0();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_SetPosition(BG_1, 0x10, 0x0);
}

void EfxMagdhisEffectBGMain(struct ProcEfxBG *proc)
{
    s16 ret;
    ret = EfxGetNextFrameIndex(
        (void *)&proc->timer,
        (void *)&proc->frame,
        proc->frame_config
    );

    if (ret >= 0) {
        u16 **buf1 = proc->unk4C;
        u16 **buf2 = proc->unk50;
        sub_8055670(proc->anim, buf1[ret], buf2[ret]);
    }

    if (++proc->terminator == proc->unk30) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
        ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

/**
 * C47: banim_code_cape_flowing
 */

void NewEfxMantBatabata(struct Anim *anim)
{
    s16 banim_index;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ *proc;
    struct Anim *anim2;

    banim_index = gEkrPairBanimID2[GetAISSubjectId(anim)] - 0x6A;
    switch (banim_index) {
    case 0x2:
    case 0x4:
        scr1 = gUnknown_085F1F18;
        scr2 = gUnknown_085F20C4;
        break;

    case 0xA:
    case 0xB:
        scr1 = gUnknown_085F2270;
        scr2 = gUnknown_085F2418;
        break;

    case 0x2A:
        scr1 = gUnknown_085F24F4;
        scr2 = gUnknown_085F25D8;
        break;

    case 0x32:
    case 0x33:
        scr1 = gUnknown_085F26E0;
        scr2 = gUnknown_085F27E4;
        break;

    case 0x4F:
    case 0x50:
        scr1 = gUnknown_085F29C0;
        scr2 = gUnknown_085F2C3C;
        break;

    case 0x51:
        scr1 = gUnknown_085F2D44;
        scr2 = gUnknown_085F2DAC;
        break;

    case 0x0:
    case 0x1:
    default:
        scr1 = gUnknown_085F1BD8;
        scr2 = gUnknown_085F1D6C;
        break;
    }

    proc = Proc_Start(ProcScr_efxMantBatabata, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gUnknown_02000010[GetAISSubjectId(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
    
    SetAnimStateHidden(GetAISSubjectId(proc->anim));
}

void sub_806DFA4(struct ProcEfxOBJ *proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (!(proc->anim->state3 & 0x4))
        return;

    if (!(proc->anim->state3 & 0x8))
        return;

    Proc_Break(proc);
}

void sub_806DFD0(struct ProcEfxOBJ *proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (sub_80522CC() == 0x1) {
        SetAnimStateUnHidden(GetAISSubjectId(proc->anim));
        AnimDelete(proc->anim2);
        gUnknown_02000010[GetAISSubjectId(proc->anim)] = NULL;
        Proc_Break(proc);
    }
}

/**
 * Some critical atk effect?
 */
void NewEfxChillEffect(struct Anim *anim)
{
    struct ProcEfx *proc;
    ClearBG1Setup();
    proc = Proc_Start(ProcScr_efxChillEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxChillEffectMain(struct ProcEfx *proc)
{
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxChillEffectBG(proc->anim);
        NewEfxChillEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x3) {
        NewEfxFlashBG(proc->anim, 0x5);
        return;
    }

    if (time == 0x11) {
        NewEfxFlashBG(proc->anim, 0x5);
        return;
    }

    if (time == 0x24) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxChillEffectBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxChillEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF546;
    proc->unk4C = gUnknown_085D92D4;
    proc->unk50 = gUnknown_085D92D4;
    SomeImageStoringRoutine_SpellAnim2(gUnknown_0872E998, 0x2000);
    BG_SetPosition(BG_1, 0x0, 0x0);
}

void EfxChillEffectBGMain(struct ProcEfxBG *proc)
{
    int ret;
    ret = EfxGetNextFrameIndex((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->unk4C;
        u16 **buf2 = proc->unk50;
        sub_8055670(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxChillEffectBGCOL(struct Anim *anim)
{
    struct ProcEfxBGCOL *proc;
    proc = Proc_Start(ProcScr_efxChillEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF568;
    proc->unk4C = gUnknown_087456E8;
}

#if NONMATCHING

void sub_806E158(struct ProcEfxBGCOL *proc)
{
    int ret;
    u16 i;
    u16 pal[0x10];

    ret = EfxGetNextFrameIndex((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 *src = proc->unk4C;
        CpuFastCopy(&PAL_BUF_COLOR(src, ret, 0), pal, 0x20);

        for (i = 0; i < 0x10; i++) {
            s8 green = GREEN_VALUE(pal[i]);
            s8 red = green - 0xC;
            s8 blue = green + 0x4;

            if (red < 0)
                red = 0;

            if (blue < 0)
                blue = 0;

            pal[i] = RGB(red, green, blue);
        }

        SomePaletteStoringRoutine_SpellAnim2(pal, 0x20);
        return;
    }

    if (ret == -1) {
        Proc_Break(proc);
        return;
    }
}

#else

__attribute__((naked))

void sub_806E158(struct ProcEfxBGCOL *proc)
{
    asm(".syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        sub sp, #0x20\n\
        adds r4, r0, #0\n\
        adds r0, #0x2c\n\
        adds r1, r4, #0\n\
        adds r1, #0x44\n\
        ldr r2, [r4, #0x48]\n\
        bl EfxGetNextFrameIndex\n\
        lsls r0, r0, #0x10\n\
        asrs r1, r0, #0x10\n\
        cmp r1, #0\n\
        blt _0806E1D8\n\
        ldr r0, [r4, #0x4c]\n\
        mov r7, sp\n\
        lsls r1, r1, #5\n\
        adds r0, r0, r1\n\
        mov r1, sp\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        movs r6, #0\n\
        movs r0, #0x1f\n\
        mov ip, r0\n\
    _0806E188:\n\
        lsls r0, r6, #1\n\
        adds r5, r0, r7\n\
        ldrh r1, [r5]\n\
        lsrs r3, r1, #5\n\
        mov r2, ip\n\
        ands r3, r2\n\
        mov r0, ip\n\
        ands r0, r1\n\
        subs r0, #0xc\n\
        lsls r0, r0, #0x18\n\
        lsrs r4, r0, #0x18\n\
        movs r2, #0x80\n\
        lsls r2, r2, #0x13\n\
        adds r1, r0, r2\n\
        lsrs r2, r1, #0x18\n\
        cmp r0, #0\n\
        bge _0806E1AC\n\
        movs r4, #0\n\
    _0806E1AC:\n\
        lsls r0, r2, #0x18\n\
        cmp r0, #0\n\
        bge _0806E1B4\n\
        movs r2, #0\n\
    _0806E1B4:\n\
        lsls r1, r4, #0x18\n\
        asrs r1, r1, #0x18\n\
        lsls r0, r3, #5\n\
        orrs r1, r0\n\
        lsls r0, r2, #0x18\n\
        asrs r0, r0, #0xe\n\
        orrs r1, r0\n\
        strh r1, [r5]\n\
        adds r0, r6, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r6, r0, #0x10\n\
        cmp r6, #0xf\n\
        bls _0806E188\n\
        adds r0, r7, #0\n\
        movs r1, #0x20\n\
        bl SomePaletteStoringRoutine_SpellAnim2\n\
        b _0806E1E6\n\
    _0806E1D8:\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        bne _0806E1E6\n\
        adds r0, r4, #0\n\
        bl Proc_Break\n\
    _0806E1E6:\n\
        add sp, #0x20\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided");
}

#endif

void NewEfxChillAnime(struct Anim *anim, int arg1)
{
    u32 *scr1, *scr2;
    struct ProcEfxOBJ *proc;
    struct Anim *anim2;

    if (arg1 == 0) {
        scr1 = gUnknown_08746508;
        scr2 = gUnknown_0874670C;
    }

    proc = Proc_Start(ProcScr_efxChillAnime, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gUnknown_02000010[GetAISSubjectId(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
    
    SetAnimStateHidden(GetAISSubjectId(proc->anim));
}

void sub_806E290(struct ProcEfxOBJ *proc)
{
    struct Anim *_anim1, *_anim2;
    proc->anim2->xPosition = proc->anim->xPosition;

    if (++proc->timer == 0x14) {
        SetAnimStateUnHidden(GetAISSubjectId(proc->anim));
        AnimDelete(proc->anim2);
        gUnknown_02000010[GetAISSubjectId(proc->anim)] = NULL;
        
        _anim1 = gAnims[GetAISSubjectId(proc->anim) * 2];
        _anim2 = gAnims[GetAISSubjectId(proc->anim) * 2 + 1];

        _anim1->state3 |= 0x40;
        _anim2->state3 |= 0x40;
        Proc_Break(proc);
    }
}

void nullsub_17(void)
{
    return;
}
