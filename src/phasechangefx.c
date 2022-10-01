#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "constants/video-global.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

struct PhaseIntroTextProc {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 unk4C;
};

struct PhaseIntroSquaresProc {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 unk4C;
    /* 4E */ s16 unk4E;
};

struct PhaseIntroBlendBoxProc {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 unk4C;
    /* 4E */ s16 unk4E;
};

void PhaseIntroVMatchHi(void);
void PhaseIntroVMatchMid(void);
void PhaseIntroVMatchLo(void);

void PhaseIntroVMatchHi()
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gGameState.altBlendBCa;
    REG_BLDCB = gGameState.altBlendBCb;

    SetNextVCount(72);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchMid);
}

void PhaseIntroVMatchMid()
{
    REG_BLDCNT = BLDCNT_TGT1_BG0
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gGameState.altBlendACa;
    REG_BLDCB = gGameState.altBlendACb;

    SetNextVCount(96);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchLo);
}

void PhaseIntroVMatchLo()
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gGameState.altBlendBCa;
    REG_BLDCB = gGameState.altBlendBCb;

    SetNextVCount(0);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchHi);
}

void PhaseIntroText_PutText(ProcPtr proc)
{
    u16 *tm = TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 9);
    int i;

    for (i = 0; i < 0x60; ++i)
        *tm++ = TILEREF(BGCHR_PHASE_CHANGE_NAME + i, BGPAL_PHASE_CHANGE);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PhaseIntroText_Init(struct PhaseIntroTextProc *proc)
{
    if (Sound_GetCurrentSong() != GetCurrentMapMusicIndex())
        Sound_FadeOutBGM(4);

    PlaySoundEffect(0x73);

    proc->unk4C = 15;
}

void PhaseIntroText_InLoop(struct PhaseIntroTextProc *proc)
{
    int lo, hi;

    if (0 != CheckSomethingSomewhere()) {
        hi = 0;
        lo = -0x14;
    } else {
        hi = -8;
        lo = -0x1C;
    }

    BG_SetPosition(0, Interpolate(INTERPOLATE_RCUBIC, lo, hi, proc->unk4C, 0x10), 0);

    gGameState.altBlendACa++;
    gGameState.altBlendACb--;

    proc->unk4C--;

    if (proc->unk4C < 0)
    {
        proc->unk4C = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroText_OutLoop(struct PhaseIntroTextProc *proc)
{
    int lo, hi;

    if (0 != CheckSomethingSomewhere()) {
        hi = -0x14;
        lo = -0x30;
    } else {
        hi = -0x1C;
        lo = -0x38;
    }

    BG_SetPosition(0, Interpolate(INTERPOLATE_CUBIC, lo, hi, proc->unk4C, 0x10), 0);

    gGameState.altBlendACa--;
    gGameState.altBlendACb++;

    proc->unk4C--;

    if (proc->unk4C < 0)
    {
        proc->unk4C = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroText_Clear(struct PhaseIntroTextProc *proc)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PhaseIntroSquares_Init(struct PhaseIntroSquaresProc *proc)
{
    proc->unk4C = 0;
    proc->unk4E = 0;
}

void PhaseIntroSquares_InLoop(struct PhaseIntroSquaresProc *proc)
{
    int val;

    switch (proc->unk4E) {
    case 0:
        val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0x100, proc->unk4C, 0xF);
        
        if (proc->unk4C > 0xE) {
            proc->unk4C = 0;
            proc->unk4E++;
        } else {
            proc->unk4C++;
        }
        break;

    case 1:
        val = 0x100;

        if (proc->unk4C <= 0x1D) {
            proc->unk4C++;
        } else {
            proc->unk4C = 0;
            proc->unk4E++;
        }
        break;

    case 2:
        val = Interpolate(INTERPOLATE_CUBIC, 0x100, 0x10, proc->unk4C, 0xF);

        if (proc->unk4C <= 0xE)
            proc->unk4C++;
        else
            Proc_Break(proc);
        break;
    
    default:
        break;
    }

    WriteOAMRotScaleData(
        0,
        Div(COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, val),
        Div(SIN(0) * 0x10, 0x100),
        Div(COS(0) * 0x10, val)
    );

    PutSpriteExt(
        2, 0, 0x44,
        gUnknown_0859AEC8,
        0x2600
    );
}

void PhaseIntroBlendBox_Init(struct PhaseIntroBlendBoxProc *proc)
{
    proc->unk4C = 0x4;
}

