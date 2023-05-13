#pragma once

#include "global.h"
#include "proc.h"

struct ProcEkrPopup {
    PROC_HEADER;

    /* 2E */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;
    /* 50 */ int unk50;
    /* 54 */ STRUCT_PAD(0x54, 0x60);
    /* 60 */ struct Anim *anim;
};

extern struct ProcEkrPopup *gpProcEkrPopup;
extern int gEkrPopupEnded;

bool CheckEkrPopupEnded(void);
void DeleteAnimsOnPopup(void);
void EfxPlaySound5AVol100(void);
// ??? EfxPlaySound5CVol100(???);
void MakeBattlePopupTileMapFromTSA(u16 *tm, u16 width);
void DrawBattlePopup(struct ProcEkrPopup *proc, int type, u32 priv);
void NewEkrPopup(void);
void BattlePopup_Wait16Frames(struct ProcEkrPopup *proc);
void ekrPopup_DrawWRankUp(struct ProcEkrPopup *proc);
void ekrPopup_WaitWRankUp(struct ProcEkrPopup *proc);
void ekrPopup_DrawWRankUp2(struct ProcEkrPopup *proc);
void ekrPopup_WaitWRankUp2(struct ProcEkrPopup *proc);
void ekrPopup_DrawWpnBroke(struct ProcEkrPopup *proc);
void ekrPopup_WaitWpnBroke(struct ProcEkrPopup *proc);
void ekrPopup_DrawWpnBroke2(struct ProcEkrPopup *proc);
void ekrPopup_WaitWpnBroke2(struct ProcEkrPopup *proc);
void ekrPopup_MarkEnd(struct ProcEkrPopup *proc);
void nullsub_68(struct ProcEkrPopup *proc);
void sub_8076250(struct ProcEkrPopup *proc);
void sub_8076290(struct ProcEkrPopup *proc);
void sub_80762D0(struct ProcEkrPopup *proc);
