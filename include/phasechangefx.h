#ifndef GUARD_PHASECHANGEFX_H
#define GUARD_PHASECHANGEFX_H

#include "global.h"

/* struct definitions */

struct PhaseIntroSubProc
{
    PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ s16 stat_index;
};

/* function declarations */

void PhaseIntroVMatchHi(void);
void PhaseIntroVMatchMid(void);
void PhaseIntroVMatchLo(void);
void PhaseIntroUnk_Init(struct PhaseIntroSubProc * proc);
void PhaseIntroUnk_Loop(struct PhaseIntroSubProc * proc);
void PhaseIntroInitText(struct PhaseIntroSubProc * proc);
void PhaseIntroText_PutText(struct PhaseIntroSubProc * proc);
void PhaseIntroText_InLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroText_OutLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroClearText(struct PhaseIntroSubProc * proc);
void PhaseIntroSquares_Init(struct PhaseIntroSubProc * proc);
void PhaseIntroSquares_InLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroSquares_OutLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroBlendBox_Init(struct PhaseIntroSubProc * proc);
void PhaseIntroBlendBox_InLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroBlendBox_OutLoop(struct PhaseIntroSubProc * proc);
void PhaseIntro_EndIfNoUnits(ProcPtr proc);
void PhaseIntro_InitGraphics(ProcPtr proc);
void PhaseIntro_InitDisp(ProcPtr proc);
void PhaseIntro_WaitForEnd(ProcPtr proc);

extern struct ProcCmd gProcScr_PhaseIntroText[];
extern struct ProcCmd gProcScr_PhaseIntroSquares[];
extern struct ProcCmd gProcScr_PhaseIntroBlendBox[];

extern u8 Img_PhaseChangeUnk[];
extern u8 Img_PhaseChangePlayer[];
extern u16 Pal_PhaseChangePlayer[];
extern u8 Img_PhaseChangeEnemy[];
extern u16 Pal_PhaseChangeEnemy[];
extern u8 Img_PhaseChangeOther[];
extern u16 Pal_PhaseChangeOther[];
extern u16 Pal_085A06B8[];
extern u8 Img_PhaseChangeSquares[];

#endif // GUARD_PHASECHANGEFX_H
