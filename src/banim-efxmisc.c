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

/**
 * Misc banim effects
 */

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
struct ProcCmd CONST_DATA ProcScr_efxYushaSpinShield[] = {
    PROC_NAME("efxYushaSpinShield"),
    PROC_REPEAT(EfxYushaSpinShieldMain),
    PROC_END,
};

void NewEfxYushaSpinShield(struct Anim *anim, int r1)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxYushaSpinShield, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    NewEfxYushaSpinShieldOBJ(anim, r1);
}

void EfxYushaSpinShieldMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_efxYushaSpinShieldOBJ[] = {
    PROC_NAME("efxYushaSpinShieldOBJ"),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CD14),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CD7C),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CDA4),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CE08),
    PROC_END,
};

void NewEfxYushaSpinShieldOBJ(struct Anim *anim, int r1)
{
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;
    struct Anim *anim2;

    proc = Proc_Start(ProcScr_efxYushaSpinShieldOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = r1;

    if (r1 == 0) {
        scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeA;
        scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeA;
    } else {
        scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeB;
        scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeB;
    }

    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /**
     * oam2_data::chr = 0;
     * oam2_data::pal = 0;
     */
    anim2->oam2Base &= 0xC00;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200; /* oam2_data::chr = 0x7200; */
    else
        anim2->oam2Base |= 0x9300; /* oam2_data::chr = 0x9300; */
}

void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ * proc)
{
    u32 *scr;
    struct Anim *anim2 = proc->anim2;
    if (++proc->timer != 0x45)
        return;
    
    if (proc->unk29 == 0) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
        } else {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
        }
    } else {
        if (GetAnimPosition(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
        } else {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ * proc)
{
    if (!(proc->anim->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
        return;

    if (!(proc->anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
        return;

    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;

    if (CheckEkrHitDone() != true)
        return;

    if (proc->unk29 == 0) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
        } else {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
        }
    } else {
        if (GetAnimPosition(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
        } else {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ * proc)
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
    struct ProcEfx * proc;

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

CONST_DATA struct ProcCmd ProcScr_efxHurtmutEff00[] = {
    PROC_NAME("efxHurtmutEff00"),
    PROC_REPEAT(EfxHurtmutEff00Main),
    PROC_END,
};

void EfxHurtmutEff00Main(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_efxHurtmutEff00OBJ[] = {
    PROC_NAME("efxHurtmutEff00OBJ"),
    PROC_REPEAT(efxHurtmutEff00OBJ_806CEC4),
    PROC_SLEEP(26),
    PROC_REPEAT(efxHurtmutEff00OBJ_806CF10),
    PROC_SLEEP(8),
    PROC_REPEAT(efxHurtmutEff00OBJ_806CF5C),
    PROC_END,
};

void NewEfxHurtmutEff00OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff00OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_085DFA08, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DE984, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_085DFA08, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DF224, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_efxHurtmutEff01OBJ[] = {
    PROC_NAME("efxHurtmutEff01OBJ"),
    PROC_REPEAT(efxHurtmutEff01OBJ_806CFC4),
    PROC_SLEEP(58),
    PROC_REPEAT(efxHurtmutEff01OBJ_806D010),
    PROC_SLEEP(21),
    PROC_REPEAT(efxHurtmutEff01OBJ_806D05C),
    PROC_END,
};

void NewEfxHurtmutEff01OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff01OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_085DFA08, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DE984, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_085DFA08, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DF224, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}


/**
 * C2E: banim_code_effect_magic_rune_normal
 * C2F: banim_code_effect_magic_rune_critical
 */
struct ProcCmd CONST_DATA ProcScr_efxMagfcast[] = {
    PROC_NAME("efxMagfcast"),
    PROC_REPEAT(EfxMagfcastMain),
    PROC_END,
};

void NewEfxMagfcast(struct Anim *anim, int type)
{
    s16 id2;    /* maybe not the class index */
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;

    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    id2 = gBanimIdx[GetAnimPosition(anim)] - 0x6A;
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

void EfxMagfcastMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x14)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_efxMagfcastBG[] = {
    PROC_NAME("efxMagfcastBG"),
    PROC_REPEAT(EfxMagfcastBGMain),
    PROC_END,
};

const u16 FrameConfig_EfxMagFcastBg1[] = {
    0, 2,
    1, 3,
    2, 7,
    3, 3,
    4, 2,

    -1
};

const u16 FrameConfig_EfxMagFcastBg2[] = {
    5, 3,

    -1
};

const u16 FrameConfig_EfxMagFcastBg3[] = {
    0, 7,
    1, 7,
    2, 8,
    3, 11,
    4, 2,
    5, 2,
    6, 2,
    7, 2,

    -1
};

const u16 FrameConfig_EfxMagFcastBg4[] = {
    8, 3,
    9, 23,
    10, 4,
    11, 23,
    12, 4,
    13, 26,
    14, 4,
    15, 4,

    -1
};

CONST_DATA u16 * TsaLut1_EfxMagfcastBG[] = {
    Tsa1_EfxMagfcastBG,
    Tsa2_EfxMagfcastBG,
    Tsa3_EfxMagfcastBG,
    Tsa4_EfxMagfcastBG,
    Tsa5_EfxMagfcastBG,
    Tsa6_EfxMagfcastBG,
};

CONST_DATA u16 * TsaLut2_EfxMagfcastBG[] = {
    Tsa7_EfxMagfcastBG,
    Tsa8_EfxMagfcastBG,
    Tsa9_EfxMagfcastBG,
    Tsa10_EfxMagfcastBG,
    Tsa11_EfxMagfcastBG,
    Tsa12_EfxMagfcastBG,
    Tsa13_EfxMagfcastBG,
    Tsa14_EfxMagfcastBG,
    Tsa15_EfxMagfcastBG,
    Tsa16_EfxMagfcastBG,
    Tsa17_EfxMagfcastBG,
    Tsa18_EfxMagfcastBG,
    Tsa19_EfxMagfcastBG,
    Tsa20_EfxMagfcastBG,
    Tsa21_EfxMagfcastBG,
    Tsa22_EfxMagfcastBG,
};

void NewEfxMagfcastBG(struct Anim *anim, u32 type)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagfcastBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (type) {
    case 0:
        proc->frame_config = FrameConfig_EfxMagFcastBg1;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 1:
        proc->frame_config = FrameConfig_EfxMagFcastBg2;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 2:
        proc->frame_config = FrameConfig_EfxMagFcastBg3;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        break;

    case 3:
        proc->frame_config = FrameConfig_EfxMagFcastBg4;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
        break;

    default:
        break;
    }

    SpellFx_RegisterBgGfx(Img_EfxMagfcastBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxMagfcastBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0x0);
        else
            BG_SetPosition(BG_1, 0xE8, 0x0);
    }
}

void EfxMagfcastBGMain(struct ProcEfxBG * proc)
{
    s16 ret;
    ret = EfxAdvanceFrameLut(
        (void *)&proc->timer,
        (void *)&proc->frame,
        proc->frame_config
    );

    if (ret >= 0) {
        u16 **tsa1;
        u16 **tsa2;

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
                BG_SetPosition(BG_1, 0x18, 0x0);
            else
                BG_SetPosition(BG_1, 0xE8, 0x0);
        }

        tsa1 = proc->tsal;
        tsa2 = proc->tsar;

        SpellFx_WriteBgMap(
            proc->anim,
            tsa1[ret],
            tsa2[ret]
        );

        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
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
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxSunakemuri, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxSunakemuriOBJ(anim, type);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxSunakemuri[] = {
    PROC_NAME("efxSunakemuri"),
    PROC_REPEAT(EfxSunakemuriMain),
    PROC_END,
};

void EfxSunakemuriMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxSunakemuriOBJ(struct Anim *anim, int type)
{
    int terrain;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;

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

    proc->anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);

    terrain = gBanimTerrain[GetAnimPosition(proc->anim)];
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
        SpellFx_RegisterObjPal(gUnknown_085F1620, 0x20);
        break;
    
    case TERRAIN_BRIDGE_14:
        if (IsAnimSoundInPositionMaybe(proc->anim) != EKR_POS_L)
            SpellFx_RegisterObjPal(gUnknown_085F1620, 0x20);
        else
            SpellFx_RegisterObjPal(gUnknown_085F1640, 0x20);
        break;

    case TERRAIN_RIVER:
    case TERRAIN_SEA:
    case TERRAIN_LAKE:
    case TERRAIN_DEEPS:
    case TERRAIN_WATER:
        SpellFx_RegisterObjPal(gUnknown_085F1640, 0x20);
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
        SpellFx_RegisterObjPal(gUnknown_085F1660, 0x20);
        break;

    case TERRAIN_TILE_00:
    default:
        break;
    }

    SpellFx_RegisterObjGfx(gUnknown_085F11B0, 0x1000);
}

struct ProcCmd CONST_DATA ProcScr_efxSunakemuriOBJ[] = {
    PROC_NAME("efxSunakemuriOBJ"),
    PROC_REPEAT(EfxSunakemuriOBJMain),
    PROC_END,
};

void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc)
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
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxLokmsuna, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxLokmsunaOBJ(anim);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxLokmsuna[] = {
    PROC_NAME("efxLokmsuna"),
    PROC_REPEAT(EfxLokmsunaMain),
    PROC_END,
};

void EfxLokmsunaMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxLokmsunaOBJ(struct Anim *anim)
{
    u32 *scr1, *scr2;
    struct Anim *anim2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLokmsunaOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxLokmsunaObjLeft;
    scr2 = AnimScr_EfxLokmsunaObjRight;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /* oam2_data::pal = 0 */
    anim2->oam2Base &= 0xFFF;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7000;
    else
        anim2->oam2Base |= 0x9000;
    
    SpellFx_RegisterObjGfx(Img_EfxLokmsunaObj, 0x1000);
}

struct ProcCmd CONST_DATA ProcScr_efxLokmsunaOBJ[] = {
    PROC_NAME("efxLokmsunaOBJ"),
    PROC_REPEAT(EfxLokmsunaIOBJMain),
    PROC_END,
};

void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc)
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
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxKingPika, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

struct ProcCmd CONST_DATA ProcScr_efxKingPika[] = {
    PROC_NAME("efxKingPika"),
    PROC_REPEAT(EfxKingPikaMain),
    PROC_END,
};

void EfxKingPikaMain(struct ProcEfx * proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
        return;
    }

    if (time == 0xA) {
        NewEfxFlashBgWhite(anim, 0x14);
        return;
    }

    if (time == 0x2D) {
        struct Anim *anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim *anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * C51: banim_code_flash_white
 */
void NewEfxFlashFX(struct Anim *anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxFlashFX, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

struct ProcCmd CONST_DATA ProcScr_efxFlashFX[] = {
    PROC_NAME("efxFlashFX"),
    PROC_REPEAT(EfxFlashFXMain),
    PROC_END,
};

void EfxFlashFXMain(struct ProcEfx * proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashBgWhite(anim, 0x5);
        return;
    }

    if (time == 0x6) {
        struct Anim *anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim *anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * Maybe unused banim commands?
 */
void NewEfxSongOBJ2(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);
}

struct ProcCmd CONST_DATA ProcScr_efxSongOBJ2[] = {
    PROC_NAME("efxSongOBJ"),
    PROC_REPEAT(EfxSongOBJ2Main),
    PROC_END,
};

void EfxSongOBJ2Main(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x18)
        PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);

    if (proc->timer > proc->terminator) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxDanceOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x19;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xE1, 0x100, proc->anim->xPosition, 0x1);
}

struct ProcCmd CONST_DATA ProcScr_efxDanceOBJ[] = {
    PROC_NAME("efxDanceOBJ"),
    PROC_REPEAT(EfxDanceOBJMain),
    PROC_END,
};

void EfxDanceOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator) {
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
    struct ProcEfx * proc;
    struct Anim *anim1, *anim2;

    if (gUnknown_02017768[GetAnimPosition(anim)] == false) {
        gUnknown_02017768[GetAnimPosition(anim)] = true;

        if (GetAnimPosition(anim) == EKR_POS_L)
            bu = gpEkrBattleUnitLeft;
        else
            bu = gpEkrBattleUnitRight;

        if (IsWeaponLegency(bu->weaponBefore) == false) {
            anim1 = gAnims[GetAnimPosition(anim) * 2];
            anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

            anim1->state3 |= ANIM_BIT3_BLOCKEND;
            anim2->state3 |= ANIM_BIT3_BLOCKEND;
            return;
        }
    } else {
        anim1 = gAnims[GetAnimPosition(anim) * 2];
        anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        return;
    }

    proc = Proc_Start(ProcScr_efxSpecalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
    PlaySFX(0xF0, 0x100, 0x78, 0x0);
    NewEfxSRankWeaponEffect(anim);
}

struct ProcCmd CONST_DATA ProcScr_efxSpecalEffect[] = {
    PROC_NAME("efxSpecalEffect"),
    PROC_REPEAT(EfxSpecalEffectMain),
    PROC_END,
};

void EfxSpecalEffectMain(ProcPtr proc)
{
    Proc_Break(proc);
}

void NewEfxSRankWeaponEffect(struct Anim *anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxSRankWeaponEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
}

struct ProcCmd CONST_DATA ProcScr_efxSRankWeaponEffect[] = {
    PROC_NAME("efxSRankWeaponEffect"),
    PROC_REPEAT(EfxSRankWeaponEffectMain),
    PROC_END,
};

void EfxSRankWeaponEffectMain(struct ProcEfx * proc)
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

        anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];
        
        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectBG(struct Anim *anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxSRankWeaponEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(gUnknown_085E8C04, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_085E8CC4, 0x20);
    SpellFx_WriteBgMap(proc->anim, gUnknown_085E8CE4, gUnknown_085E8CE4);
    SpellFx_SetSomeColorEffect();
}

struct ProcCmd CONST_DATA ProcScr_efxSRankWeaponEffectBG[] = {
    PROC_NAME("efxSRankWeaponEffectBG"),
    PROC_REPEAT(EfxSRankWeaponEffectBGMain),
    PROC_END,
};

void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x3C) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectSCR(void)
{
    struct ProcEfx * proc;
    proc = Proc_Start(efxSRankWeaponEffectSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;
    NewEfxSRankWeaponEffectSCR2(proc);
}

struct ProcCmd CONST_DATA efxSRankWeaponEffectSCR[] = {
    PROC_NAME("efxSRankWeaponEffectSCR"),
    PROC_REPEAT(EfxSRankWeaponEffectSCRMain),
    PROC_END,
};

struct ProcCmd CONST_DATA efxSRankWeaponEffectSCR2[] = {
    PROC_NAME("efxSRankWeaponEffectSCR2"),
    PROC_REPEAT(EfxSRankWeaponEffectSCR2Main),
    PROC_END,
};

CONST_DATA s16 gUnknown_085D9154[] = {
    0xFF00, 0xFF05, 0xFF09, 0xFF0E, 0xFF12, 0xFF16, 0xFF1B, 0xFF1F,
    0xFF23, 0xFF28, 0xFF2C, 0xFF30, 0xFF35, 0xFF39, 0xFF3D, 0xFF42,
    0xFF46, 0xFF4A, 0xFF4F, 0xFF53, 0xFF57, 0xFF5C, 0xFF60, 0xFF64,
    0xFF69, 0xFF6D, 0xFF71, 0xFF76, 0xFF7A, 0xFF7E, 0xFF83, 0xFF87,
    0xFF8B, 0xFF90, 0xFF94, 0xFF98, 0xFF9D, 0xFFA1, 0xFFA5, 0xFFAA,
    0xFFAE, 0xFFB2, 0xFFB7, 0xFFBB, 0xFFBF, 0xFFC4, 0xFFC8, 0xFFCC,
    0xFFD1, 0xFFD5, 0xFFD9, 0xFFDE, 0xFFE2, 0xFFE6, 0xFFEB, 0xFFEF,
    0xFFF3, 0xFFF8, 0xFFFC, 0x0000, 0x0000, 0x0004, 0x0008, 0x000D,
    0x0011, 0x0015, 0x001A, 0x001E, 0x0022, 0x0027, 0x002B, 0x002F,
    0x0034, 0x0038, 0x003C, 0x0041, 0x0045, 0x0049, 0x004E, 0x0052,
    0x0056, 0x005B, 0x005F, 0x0063, 0x0068, 0x006C, 0x0070, 0x0075,
    0x0079, 0x007D, 0x0082, 0x0086, 0x008A, 0x008F, 0x0093, 0x0097,
    0x009C, 0x00A0, 0x00A4, 0x00A9, 0x00AD, 0x00B1, 0x00B6, 0x00BA,
    0x00BE, 0x00C3, 0x00C7, 0x00CB, 0x00D0, 0x00D4, 0x00D8, 0x00DD,
    0x00E1, 0x00E5, 0x00EA, 0x00EE, 0x00F2, 0x00F7, 0x00FB, 0x0100,
};

 void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc)
{
    u32 i;
    u16 *dst = !gEkrBg1ScrollFlip
        ? gpBg1ScrollOffsetList2
        : gpBg1ScrollOffsetList1;

    for (i = 0; i < 160; dst++, i++) {
        if (i < 120) {
            s16 ref = gUnknown_085D9154[i] * proc->unk44 >> 0xC;

            if (ref) {
                if (i < 60) {
                    if (ref < i - 0x88)
                        ref = i + -0x88; // required for matching
                } else {
                    if (ref > 0x88 - i)
                        ref = 0x88 - i;
                }
            }
            *dst = ref;
        } else {
            *dst = 0;
        }
    }
}

void NewEfxSRankWeaponEffectSCR2(struct ProcEfx *seff_scr)
{
    struct ProcEfxSRankSCR2 * proc;
    proc = Proc_Start(efxSRankWeaponEffectSCR2, PROC_TREE_3);
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->seff_scr1 = seff_scr;
}

void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc)
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
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxMagdhisEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

struct ProcCmd CONST_DATA ProcScr_efxMagdhisEffect[] = {
    PROC_NAME("efxMagdhisEffect"),
    PROC_REPEAT(EfxMagdhisEffectMain),
    PROC_END,
};

void EfxMagdhisEffectMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x11) {
        NewEfxMagdhisEffectBG(proc->anim, 0x49);
        EfxPlaySE(0x140, 0x100);
        M4aPlayWithPostionCtrl(0x140, proc->anim->xPosition, 1);
    }

    if (proc->timer == 0x64)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_efxMagdhisEffectBG[] = {
    PROC_NAME("efxMagdhisEffectBG"),
    PROC_REPEAT(EfxMagdhisEffectBGMain),
    PROC_END,
};

CONST_DATA u16 * TsaLut_EfxMagdhisEffectBG[] = {
    Tsa1_EfxMagdhisEffectBG,
    Tsa2_EfxMagdhisEffectBG,
    Tsa3_EfxMagdhisEffectBG,
    Tsa4_EfxMagdhisEffectBG
};

const u16 FrameConf_EfxMagdhisEffectBG[] = {
    0, 2,
    1, 2,
    2, 2,
    3, 2,
    2, 2,
    1, 2,
    0, 2,

    -2
};

void NewEfxMagdhisEffectBG(struct Anim *anim, int arg1)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMagdhisEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = arg1;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxMagdhisEffectBG;
    proc->tsal = TsaLut_EfxMagdhisEffectBG;
    proc->tsar = TsaLut_EfxMagdhisEffectBG;

    SpellFx_RegisterBgPal(Pal_EfxMagdhisEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxMagdhisEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_SetPosition(BG_1, 0x10, 0x0);
}

void EfxMagdhisEffectBGMain(struct ProcEfxBG * proc)
{
    s16 ret;
    ret = EfxAdvanceFrameLut(
        (void *)&proc->timer,
        (void *)&proc->frame,
        proc->frame_config
    );

    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
    }

    if (++proc->terminator == proc->unk30) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 3;
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

/**
 * C47: banim_code_cape_flowing
 */
struct ProcCmd CONST_DATA ProcScr_efxMantBatabata[] = {
    PROC_NAME("efxMantBatabata"),
    PROC_REPEAT(EfxMantBatabata_Loop1),
    PROC_REPEAT(EfxMantBatabata_Loop2),
    PROC_END,
};

void NewEfxMantBatabata(struct Anim *anim)
{
    s16 banim_index;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;
    struct Anim *anim2;

    banim_index = gBanimIdx[GetAnimPosition(anim)] - 0x6A;
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
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gUnknown_02000010[GetAnimPosition(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
    
    SetAnimStateHidden(GetAnimPosition(proc->anim));
}

void EfxMantBatabata_Loop1(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (!(proc->anim->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
        return;

    if (!(proc->anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
        return;

    Proc_Break(proc);
}

void EfxMantBatabata_Loop2(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (CheckEkrHitDone() == 0x1) {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        AnimDelete(proc->anim2);
        gUnknown_02000010[GetAnimPosition(proc->anim)] = NULL;
        Proc_Break(proc);
    }
}

/**
 * Some critical atk effect?
 */
void NewEfxChillEffect(struct Anim *anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxChillEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

struct ProcCmd CONST_DATA ProcScr_efxChillEffect[] = {
    PROC_NAME("efxChillEffect"),
    PROC_REPEAT(EfxChillEffectMain),
    PROC_END,
};

void EfxChillEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxChillEffectBG(proc->anim);
        NewEfxChillEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x3) {
        NewEfxFlashBgBlack(proc->anim, 0x5);
        return;
    }

    if (time == 0x11) {
        NewEfxFlashBgBlack(proc->anim, 0x5);
        return;
    }

    if (time == 0x24) {
        Proc_Break(proc);
        return;
    }
}

struct ProcCmd CONST_DATA ProcScr_efxChillEffectBG[] = {
    PROC_NAME("efxChillEffectBG"),
    PROC_REPEAT(EfxChillEffectBGMain),
    PROC_END,
};

const u16 FrameConf_EfxChillEffectBG[] = {
    0, 11,
    1, 11,
    2, 11,

    -1
};

u16 * TsaLut_EfxChillEffectBG[] = {
    Tsa1_EfxChillEffectBG,
    Tsa2_EfxChillEffectBG,
    Tsa3_EfxChillEffectBG
};

void NewEfxChillEffectBG(struct Anim *anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxChillEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxChillEffectBG;
    proc->tsal = TsaLut_EfxChillEffectBG;
    proc->tsar = TsaLut_EfxChillEffectBG;
    SpellFx_RegisterBgGfx(Img_ExcaliburBg2, 0x2000);
    BG_SetPosition(BG_1, 0x0, 0x0);
}

void EfxChillEffectBGMain(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxChillEffectBGCOL[] = {
    PROC_NAME("efxChillEffectBGCOL"),
    PROC_MARK(10),
    PROC_REPEAT(EfxChillEffectBGCOL_Loop),
    PROC_END,
};

const u16 FrameConf_EfxChillEffectBGCOL[] = {
    0, 1,
    1, 2,
    2, 2,
    3, 2,
    4, 2,
    5, 2,
    0, 1,
    1, 2,
    2, 2,
    3, 2,
    4, 2,
    5, 2,
    0, 1,
    1, 2,
    2, 2,
    3, 2,
    4, 2,
    5, 2,

    -1
};

struct ProcCmd CONST_DATA ProcScr_efxChillAnime[] = {
    PROC_NAME("efxChillAnime"),
    PROC_REPEAT(EfxChillAnime_Loop),
    PROC_END,
};

void NewEfxChillEffectBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;
    proc = Proc_Start(ProcScr_efxChillEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxChillEffectBGCOL;
    proc->pal = Pal_EfxChillEffectBG;
}

void EfxChillEffectBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret;
    u16 i;
    u16 pal[0x10];

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * src = proc->pal;
        u16 * ptr = pal;
        CpuFastCopy(&PAL_BUF_COLOR(src, ret, 0), ptr, 0x20);

        for (i = 0; i < 0x10; i++) {
            s8 green = GREEN_VALUE(ptr[i]);
            s8 red = RED_VALUE(ptr[i]) - 0xC;
            s8 blue = red + 0x4;

            if (red < 0)
                red = 0;

            if (blue < 0)
                blue = 0;

            ptr[i] = RGB(red, green, blue);
        }

        SpellFx_RegisterBgPal(ptr, 0x20);
        return;
    }

    if (ret == -1) {
        Proc_Break(proc);
        return;
    }
}


void NewEfxChillAnime(struct Anim *anim, int arg1)
{
    u32 *scr1, *scr2;
    struct ProcEfxOBJ * proc;
    struct Anim *anim2;

    if (arg1 == 0) {
        scr1 = gUnknown_08746508;
        scr2 = gUnknown_0874670C;
    }

    proc = Proc_Start(ProcScr_efxChillAnime, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gUnknown_02000010[GetAnimPosition(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
    
    SetAnimStateHidden(GetAnimPosition(proc->anim));
}

void EfxChillAnime_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim *_anim1, *_anim2;
    proc->anim2->xPosition = proc->anim->xPosition;

    if (++proc->timer == 0x14) {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        AnimDelete(proc->anim2);
        gUnknown_02000010[GetAnimPosition(proc->anim)] = NULL;
        
        _anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        _anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        _anim1->state3 |= ANIM_BIT3_BLOCKEND;
        _anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

void nullsub_17(struct Anim *anim)
{
    return;
}
