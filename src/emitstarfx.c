#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "ctc.h"
#include "bmfx.h"

/**
 * Some effect proc emitting little white stars. Seems unused
 */

struct ProcEmitSingleStarFx {
    PROC_HEADER;

    /* 2C */ int star_loc;
    /* 30 */ int unk30;
    /* 34 */ int unk34;
    /* 38 */ int unk38;
    /* 3C */ int unk3C;
    /* 40 */ int unk40;
};

struct ProcEmitStars {
    PROC_HEADER;

    /* 2C */ int star_loc;
    /* 30 */ int unk30;
    /* 34 */ int unk34;
    /* 38 */ int unk38;
    /* 3C */ int unk3C;
    /* 40 */ int unk40;
    /* 44 */ int unk44;
    /* 48 */ int unk48;

    /* 4C */ s16 counter;

    /* 4E */ u8 _pad_4E[0x64 - 0x4E];

    /* 64 */ s16 stars;
    /* 66 */ s16 move_star_ctr;
};



/* function declarations */

void ProcEmitSingleStar_Init(struct ProcEmitSingleStarFx *proc);
void ProcEmitSingleStar_Loop(struct ProcEmitSingleStarFx *proc);

void LetsEmitStars(struct ProcEmitStars *proc);
void StarsBlinking(struct ProcEmitStars *proc);


/* section.data */

struct ProcCmd CONST_DATA ProcScr_EmitSingleStar[] = {
    PROC_CALL(ProcEmitSingleStar_Init),
    PROC_REPEAT(ProcEmitSingleStar_Loop),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_EmitStars[] = {
    PROC_REPEAT(LetsEmitStars),
    PROC_REPEAT(StarsBlinking),
    PROC_END
};

u8 CONST_DATA Img_EmitedStar[0x20] = {
    0xE0, 0x00, 0x00, 0x00, 0xEE, 0x0E, 0x00, 0x00,
    0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};



/* section.text */

void ProcEmitSingleStar_Init(struct ProcEmitSingleStarFx *proc)
{
    int val, tmp1, tmp2;

    proc->unk34 = 0;
    proc->unk38 = 0;
    proc->unk3C = 0;
    
    tmp1 = AdvanceGetLCGRNValue() % 0x400;
    tmp2 = ((struct ProcEmitStars*)proc->proc_parent)->stars * 0x10;
    tmp2 += 0xC00;
    val = tmp1 + tmp2;

    proc->unk40 = -val;
}

void ProcEmitSingleStar_Loop(struct ProcEmitSingleStarFx *proc)
{
    int val0, val1;

    struct ProcEmitStars *parent = proc->proc_parent;
    if (0 == parent->move_star_ctr || 0 == GetGameClock() % 4) {
        val0 = proc->unk34 + proc->unk3C;
        proc->unk34 = val0;

        val1 = proc->unk38 + proc->unk40;
        proc->unk38 = val1;
        proc->star_loc += val0;
        proc->unk30 += val1;
    }

    if (proc->unk30 < 0) {
        Proc_Break(proc);
        ((struct ProcEmitStars*)proc->proc_parent)->counter--;
    } else {
        struct Vec2 *vec = (struct Vec2*)(&proc->star_loc);
        PutSprite(0xA,
                vec->y, /* wtf?? */
                proc->unk30 >> 0x10,
                gObject_8x8, 0xA00);
    }
}

void Calcs_Interpolate(int *buf1, int *buf2, int r2, int r3, int r4)
{
    *buf1 = Interpolate(0, *buf1, r2, r4, 0x100);
    *buf2 = Interpolate(0, *buf2, r3, r4, 0x100);
}

void LetsEmitStars(struct ProcEmitStars *proc)
{
    int val, val1;
    struct ProcEmitSingleStarFx * child;
    
    if (0 == GetGameClock() % 4)
        return;

    val = 0;
    
    if (proc->counter > 0x28)
        return;

    while (1) {
        child = Proc_Start(ProcScr_EmitSingleStar, proc);
        child->star_loc = (proc->unk34 * 0x10000)
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x10;
        child->unk30 = (proc->unk38 + 8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x8;

        Calcs_Interpolate(
            &child->star_loc,
            &child->unk30,
            proc->unk3C,
            proc->unk40,
            proc->stars <= 0x100 ? proc->stars : 0x100
        );

        proc->counter++;
        val++;
    
        if (val > 0)
            break;

        if (proc->counter > 0x28)
            break;
    }

    if (proc->counter > 0x28)
        return;

    child = Proc_Start(ProcScr_EmitSingleStar, proc);
    child->star_loc = (proc->unk34 - 0x8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x20;
    child->unk30 = (proc->unk38 + 8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x8;

    Calcs_Interpolate(
            &child->star_loc,
            &child->unk30,
            proc->unk3C,
            proc->unk40,
            proc->stars <= 0x100 ? proc->stars : 0x100
        );

    proc->counter++;

    if (proc->stars >= 0)
        proc->stars = proc->stars + 8;
    
    if (proc->stars > 0x140) {
        Proc_Break(proc);
        proc->stars = 0;
        proc->move_star_ctr = 1;
    }
}

void StarsBlinking(struct ProcEmitStars *proc)
{
    int blend = 0x10 - proc->stars < 0 ? 0 : 0x10 - proc->stars;

    SetSpecialColorEffectsParameters(2, 0, 0, blend);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);

    proc->stars++;
}

void StartEmitStarsAnim(ProcPtr parent, int r1, int r2, int r3, int r4)
{
    struct ProcEmitStars *proc;

    RegisterTileGraphics(
        Img_EmitedStar,
        OBJ_CHR_ADDR(OBJCHR_EMITSTARTS),
        0x20
    );

    proc = Proc_Start(ProcScr_EmitStars, parent);

    proc->unk34 = r1;
    proc->unk38 = r2;
    proc->unk3C = r3 << 0x10;
    proc->unk40 = r4 << 0x10;
    proc->counter = 0;
    proc->stars = -1;
    proc->move_star_ctr = 0;
}

void ClearEmitedStars()
{
    struct ProcEmitStars *proc = Proc_Find(ProcScr_EmitStars);
    proc->stars = 0;
}

void EndEmitStars()
{
    Proc_EndEach(ProcScr_EmitStars);
}
