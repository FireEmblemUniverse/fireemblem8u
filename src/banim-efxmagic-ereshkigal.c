#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x08065494
void StartSpellAnimEreshkigal_Null(struct Anim * anim)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSuperdruidBG3[] =
{
    PROC_NAME("efxSuperdruidBG3"),
    PROC_REPEAT(efxSuperdruidBG3_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_EreshkigalBg3[] =
{
    Img_Banim_17,
    Img_EreshkigalBg3_0,
    Img_EreshkigalBg3_1,
    Img_EreshkigalBg3_2,
    Img_EreshkigalBg3_3,
    Img_EreshkigalBg3_4,
    Img_EreshkigalBg3_5,
    Img_EreshkigalBg3_6,
    Img_EreshkigalBg3_7,
    Img_EreshkigalBg3_8,
};

u16 * CONST_DATA TsaArray_EreshkigalBg3[] =
{
    Tsa_EreshkigalBg3_0,
    Tsa_EreshkigalBg3_1,
    Tsa_EreshkigalBg3_2,
    Tsa_EreshkigalBg3_3,
    Tsa_EreshkigalBg3_4,
    Tsa_EreshkigalBg3_5,
    Tsa_EreshkigalBg3_6,
    Tsa_EreshkigalBg3_7,
    Tsa_EreshkigalBg3_8,
    Tsa_EreshkigalBg3_9,
};

// clang-format on

//! FE8U = 0x08065498
void StartSubSpell_efxSuperdruidBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 1,
        1, 1,
        2, 1,
        3, 1,
        4, 1,
        5, 1,
        6, 1,
        7, 1,
        8, 1,
        9, 3,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSuperdruidBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EreshkigalBg3;
    proc->tsar = TsaArray_EreshkigalBg3;
    proc->img = ImgArray_EreshkigalBg3;

    proc->pal = NULL;
    SpellFx_RegisterBgPal(Pal_EreshkigalBg3, PLTT_SIZE_4BPP);

    SpellFx_SetSomeColorEffect();
    BG_SetPosition(BG_1, 0, 0);

    return;
}

//! FE8U = 0x080654F8
void efxSuperdruidBG3_Loop(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType == 1)
        {
            if (GetAnimPosition(proc->anim) == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, 0);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }

            BG_EnableSyncByMask(BG1_SYNC_BIT);
        }
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSuperdruidOBJ2[] =
{
    PROC_NAME("efxSuperdruidOBJ2"),

    PROC_SET_END_CB(efxSuperdruidOBJ2_OnEnd),
    PROC_SLEEP(13),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080655C4
void StartSubSpell_efxSuperdruidOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSuperdruidOBJ2, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_efxSuperdruidOBJ;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = anim->xPosition;
    frontAnim->yPosition = anim->yPosition;

    SpellFx_RegisterObjGfx(Img_Banim_18, 32 * 4 * CHR_SIZE);
    SpellFx_RegisterObjPal(Pal_efxSuperdruidOBJ, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08065624
void efxSuperdruidOBJ2_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}
