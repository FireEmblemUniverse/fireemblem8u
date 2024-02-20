#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "ctc.h"
#include "bmfx.h"
#include "bmlib.h"

/**
 * Some effect proc emitting little white stars. Seems unused
 */

struct ProcEmitSingleStarFx {
    PROC_HEADER;

    /* 2C */ int loc_x;
    /* 30 */ int loc_y;
    /* 34 */ int xdiff_cur;
    /* 38 */ int ydiff_cur;
    /* 3C */ int xdiff_const;
    /* 40 */ int ydiff_const;
};

struct ProcEmitStars {
    PROC_HEADER;

    /* 44 */ u8 _pad_29[0x34 - 0x29];

    /* 34 */ int xloc;
    /* 38 */ int yloc;
    /* 3C */ int xdiff_const;
    /* 40 */ int ydiff_const;

    /* 44 */ u8 _pad_44[0x4C - 0x44];

    /* 4C */ s16 counter;

    /* 4E */ u8 _pad_4E[0x64 - 0x4E];

    /* 64 */ s16 stars;
    /* 66 */ s16 star_cannot_move;
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
    int ydiff, ydiff_tmp;

    proc->xdiff_cur = 0;
    proc->ydiff_cur = 0;
    proc->xdiff_const = 0;
    
    ydiff_tmp = AdvanceGetLCGRNValue() % 0x400;
    ydiff = ydiff_tmp + 0xC00 + ((struct ProcEmitStars*)proc->proc_parent)->stars * 0x10;

    proc->ydiff_const = -ydiff;
}

void ProcEmitSingleStar_Loop(struct ProcEmitSingleStarFx *proc)
{
    int xdiff, ydiff;

    struct ProcEmitStars *parent = proc->proc_parent;
    if (0 == parent->star_cannot_move || 0 == GetGameClock() % 4) {
        xdiff = proc->xdiff_cur + proc->xdiff_const;
        proc->xdiff_cur = xdiff;

        ydiff = proc->ydiff_cur + proc->ydiff_const;
        proc->ydiff_cur = ydiff;
        proc->loc_x += xdiff;
        proc->loc_y += ydiff;
    }

    if (proc->loc_y < 0) {
        Proc_Break(proc);
        ((struct ProcEmitStars*)proc->proc_parent)->counter--;
    } else {
        PutSprite(0xA,
                proc->loc_x >> 0x10,
                proc->loc_y >> 0x10,
                gObject_8x8,
                OAM2_PAL(0) + OAM2_LAYER(2) + OAM2_CHR(OBJCHR_EMITSTARTS));
    }
}

void Calcs_Interpolate(int *buf1, int *buf2, int r2, int r3, int r4)
{
    *buf1 = Interpolate(0, *buf1, r2, r4, 0x100);
    *buf2 = Interpolate(0, *buf2, r3, r4, 0x100);
}

void LetsEmitStars(struct ProcEmitStars *proc)
{
    int val;
    struct ProcEmitSingleStarFx * child;
    
    if (0 == GetGameClock() % 4)
        return;

    val = 0;
    
    if (proc->counter > 0x28)
        return;

    while (1) {
        child = Proc_Start(ProcScr_EmitSingleStar, proc);
        child->loc_x = (proc->xloc * 0x10000)
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x10;
        child->loc_y = (proc->yloc + 8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x8;

        Calcs_Interpolate(
            &child->loc_x,
            &child->loc_y,
            proc->xdiff_const,
            proc->ydiff_const,
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
    child->loc_x = (proc->xloc - 0x8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x20;
    child->loc_y = (proc->yloc + 8) * 0x10000
                     + (AdvanceGetLCGRNValue() % 0x10000) * 0x8;

    Calcs_Interpolate(
            &child->loc_x,
            &child->loc_y,
            proc->xdiff_const,
            proc->ydiff_const,
            proc->stars <= 0x100 ? proc->stars : 0x100
        );

    proc->counter++;

    if (proc->stars >= 0)
        proc->stars = proc->stars + 8;
    
    if (proc->stars > 0x140) {
        Proc_Break(proc);
        proc->stars = 0;
        proc->star_cannot_move = 1;
    }
}

void StarsBlinking(struct ProcEmitStars *proc)
{
    int blend = 0x10 - proc->stars < 0 ? 0 : 0x10 - proc->stars;

    SetBlendConfig(2, 0, 0, blend);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);

    proc->stars++;
}

void StartEmitStarsAnim(ProcPtr parent, int xloc, int yloc, int xdiff, int ydiff)
{
    struct ProcEmitStars *proc;

    RegisterDataMove(
        Img_EmitedStar,
        OBJ_CHR_ADDR(OBJCHR_EMITSTARTS),
        0x20
    );

    proc = Proc_Start(ProcScr_EmitStars, parent);

    proc->xloc = xloc;
    proc->yloc = yloc;
    proc->xdiff_const = xdiff << 0x10;
    proc->ydiff_const = ydiff << 0x10;
    proc->counter = 0;
    proc->stars = -1;
    proc->star_cannot_move = 0;
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
