#ifndef GUARD_BMFX_H
#define GUARD_BMFX_H

#include "global.h"
#include "proc.h"

struct VectorBmfx {
    u8 x;
    u8 y;
    u16 _0;
};

struct ProcBmFx {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];

    /* 4C */ s16 counter;

    /* 4E */ u8 _pad_4E[0x64 - 0x4E];

    /* 64 */ s16 xPos;
    /* 66 */ s16 yPos;
};

struct ChapterIntroFXProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;

    u8 _pad1[0x4C-0x34];

    /* 4C */ s16 unk_4C;
    /* 4E */ s16 unk_4E;
    /* 50 */ s16 unk_50;
    /* 52 */ u16 unk_52;

    u8 _pad2[0x64-0x54];

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

void ChapterIntro_Bg3Scroll_Loop(void);
void ChapterIntro_KeyListen_Init(struct ChapterIntroFXProc * proc);
void ChapterIntro_KeyListen_Loop(struct ChapterIntroFXProc * proc);
void ChapterIntro_801FFD0(struct ChapterIntroFXProc * proc);
void ChapterIntro_801FFD8_Loop(struct ChapterIntroFXProc * proc);
void ChapterIntro_LightBurst_Init(struct ChapterIntroFXProc * proc);
void ChapterIntro_LightBurst_Loop(struct ChapterIntroFXProc * proc);
void ChapterIntro_BeginCloseTextMaybe(struct ChapterIntroFXProc * proc);
void ChapterIntro_LoopCloseTextMaybe(struct ChapterIntroFXProc * proc);
void ChapterIntro_Init(struct ChapterIntroFXProc * proc);
void ChapterIntro_SetSkipTarget(s16 arg, struct ChapterIntroFXProc * proc);
void ChapterIntro_Init_PlaySound316(struct ChapterIntroFXProc * proc);
void ChapterIntro_DrawingLights(struct ChapterIntroFXProc * proc);
void ChapterIntro_InitBLDCNT(void);
void ChapterIntro_DrawChapterTitleMaybe(void);
void ChapterIntro_80204AC(struct ChapterIntroFXProc * proc);
void ChapterIntro_UnknownFX8020578(struct ChapterIntroFXProc * proc);
void ChapterIntro_SetBG_802009C(void);
void ChapterIntro_8020944(struct ChapterIntroFXProc * proc);
void ChapterIntro_80209D8(struct ChapterIntroFXProc * proc);
void ChapterIntro_SetTimerMaybe(s16 arg, struct ChapterIntroFXProc * proc);
void ChapterIntro_TickTimerMaybe(struct ChapterIntroFXProc * proc);
void ChapterIntro_8020A40(struct ChapterIntroFXProc * proc);
void ChapterIntro_8020A8C(struct ChapterIntroFXProc * proc);
void ChapterIntro_8020B20(void);
void ChapterIntro_InitMapDisplay(void);
void ChapterIntro_BeginFadeToMap(struct ChapterIntroFXProc * proc);
void ChapterIntro_LoopFadeToMap(struct ChapterIntroFXProc * proc);
void ChapterIntro_BeginFadeOut(struct ChapterIntroFXProc * proc);
void ChapterIntro_LoopFadeOut(struct ChapterIntroFXProc * proc);
void ChapterIntro_BeginFastFadeToMap(struct ChapterIntroFXProc * proc);
void ChapterIntro_LoopFastFadeToMap(struct ChapterIntroFXProc * proc);
void ChapterIntro_80210C8(void);
void ChapterIntro_8020AF8(void);
void ChapterIntro_8021188(struct ChapterIntroFXProc * proc);

void ChapterIntro_80207C8(void);
extern struct ProcCmd sProcScr_ChapterIntro_0859B198[];
extern u8 Img_CommGameBgScreen[];
extern u8 gUnknown_08B17B64[];
extern u8 gUnknown_08B18D68[];
extern u8 gUnknown_08B19874[];
extern u8 gUnknown_08B19DEC[];
extern u16 gUnknown_08B18F34[];
extern u16 gUnknown_08B19854[];
extern u16 gUnknown_08B196D8[];

void ProcBmFx_CommonEnd(struct ProcBmFx *proc);

void StartPrepUnitSwap(ProcPtr parent, struct Unit *unit, int x_dest, int y_dest);
int PrepUnitSwapProcExits();
void NewPopup2_DropItem(ProcPtr, int);
void NewPopup2_SendItem(ProcPtr, int);
void StartGameOverScreen(ProcPtr parent);
void StartLightRuneAnim(ProcPtr parent, int x, int y);
void StartLightRuneAnim2(ProcPtr parent, int x, int y);
void StartLightRuneAnim3(ProcPtr parent, int x, int y);
void StartDanceringAnim(ProcPtr parent);
void StartEventWarpAnim(ProcPtr parent, int xCamera, int yCamera, s8 xWarp, s8 yWarp);
void StartEventWarpAnim_unused(ProcPtr parent, int xCamera, int yCamera, s8 xWarp);
int EventWarpAnimExists();
void StartEmitStarsAnim(ProcPtr parent, int xloc, int yloc, int xdiff, int ydiff);
void ClearEmitedStars();
void EndEmitStars();
#endif /* GUARD_BMFX_H */
