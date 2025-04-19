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

    /* 29 */ u8 type;
    /* 2A */ u8 position;

    STRUCT_PAD(0x2B, 0x4C);

    /* 4C */ s16 counter;

    STRUCT_PAD(0x4E, 0x64);

    /* 64 */ s16 xPos;
    /* 66 */ s16 yPos;
};

struct ChapterIntroFxProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int xLight;
    /* 30 */ int yLight;

    STRUCT_PAD(0x34, 0x4C);

    /* 4C */ s16 timer;
    /* 4E */ s16 unk_4E;
    /* 50 */ s16 skipTarget;
    /* 52 */ u16 isSkipping;

    STRUCT_PAD(0x54, 0x64);

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

/* Fadefx */
struct ProcEventFade {
    PROC_HEADER;

    /* 2C */ u32 mask;
    /* 30 */ u16 tick, timer;
    /* 34 */ u16 r, g, b;
};

struct EventFadeSt {
    u32 r0 : 10;
    u32 g0 : 10;
    u32 b0 : 10;
    u32 _pad_0 : 2;

    u32 r : 10;
    u32 g : 10;
    u32 b : 10;
    u32 _pad_1 : 2;
} BITPACKED;

void EventFadefx_Loop(struct ProcEventFade * proc);
void EventStartFade(void);
void EventEndFade(void);
void NewEventFadefx(u16 speed, u32 mask, u16 r, u16 g, u16 b, ProcPtr parent);
void StartEventWarpAnim_ret(ProcPtr parent, s16 x, s16 y, s8 kind, s8 flag);
s8 EventWarpAnimExists_ret(void);

/* Shinning stone */
struct ProcShinningStonefx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x30);

    /* 30 */ int x, y;

    STRUCT_PAD(0x38, 0x48);

    /* 48 */ s16 timer;
};

void Eventfx_SetScreenConfig(void);
void ShinningStonefx_InitGfx(struct ProcShinningStonefx * proc);
void ShinningStonefx_CreateSpriteAnim(struct ProcShinningStonefx * proc);
void ShinningStonefx_Delay(struct ProcShinningStonefx * proc);
// ??? NewShinningStonefx(???);
// ??? CheckShinningStonefxExists(???);

/* Boom fog */
// ??? NewBoomFogFx(???);
// ??? CheckBoomFogFxExists(???);
void EventEarthQuakeMain(struct ProcBmFx * proc);
void StartEventEarthQuake(u8 type, u8 direction, s8 play_sound);
void EndEventEarthQuake(void);
// ??? StoneShatterEvent_OnEnd(???);
void StartStoneShatterAnim(struct Unit *, ProcPtr);

void ChapterIntro_Bg2Scroll_Loop(void);
void ChapterIntro_KeyListen_Init(struct ChapterIntroFxProc * proc);
void ChapterIntro_KeyListen_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_Bg1And3Scroll_Init(struct ChapterIntroFxProc * proc);
void ChapterIntro_Bg1And3Scroll_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_LightBurst_Init(struct ChapterIntroFxProc * proc);
void ChapterIntro_LightBurst_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_RevealDecalSprite_Init(struct ChapterIntroFxProc * proc);
void ChapterIntro_RevealDecalSprite_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_Init(struct ChapterIntroFxProc * proc);
void ChapterIntro_SetSkipTarget(s16 arg, struct ChapterIntroFxProc * proc);
void ChapterIntro_TwinLights_InitAndPlaySe(struct ChapterIntroFxProc * proc);
void ChapterIntro_TwinLights_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_InitBLDCNT(void);
void ChapterIntro_DrawChapterTitle(void);
void ChapterIntro_LightExplosion_Init(struct ChapterIntroFxProc * proc);
void ChapterIntro_LightExplosion_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_SetBG_802009C(void);
void ChapterIntro_InitFogGfx(struct ChapterIntroFxProc * proc);
void ChapterIntro_BlendFogAlpha_Loop(struct ChapterIntroFxProc * proc);
void ChapterIntro_SetTimer(s16 arg, struct ChapterIntroFxProc * proc);
void ChapterIntro_TickTimerMaybe(struct ChapterIntroFxProc * proc);
void ChapterIntro_8020A40(struct ChapterIntroFxProc * proc);
void ChapterIntro_8020A8C(struct ChapterIntroFxProc * proc);
void ChapterIntro_InitCameraYPos(void);
void ChapterIntro_InitMapDisplay(void);
void ChapterIntro_BeginFadeToMap(struct ChapterIntroFxProc * proc);
void ChapterIntro_LoopFadeToMap(struct ChapterIntroFxProc * proc);
void ChapterIntro_BeginFadeOut(struct ChapterIntroFxProc * proc);
void ChapterIntro_LoopFadeOut(struct ChapterIntroFxProc * proc);
void ChapterIntro_BeginFastFadeToMap(struct ChapterIntroFxProc * proc);
void ChapterIntro_LoopFastFadeToMap(struct ChapterIntroFxProc * proc);
void ChapterIntro_End(void);
void ChapterIntro_8020AF8(void);
void ChapterIntro_8021188(struct ChapterIntroFxProc * proc);

void ChapterIntro_PutDecalSprite_Loop(void);
extern struct ProcCmd ProcScr_ChapterIntro_RevealDecalSprite[];
extern struct ProcCmd ProcScr_ChapterIntro_KeyListen[];
extern u8 Img_CommGameBgScreen[];
extern u8 Img_ChapterIntro_LensFlare[];
extern u8 Tsa_08B18D68[];
extern u8 Img_ChapterIntro_Sprites[];
extern u8 Pal_ChapterIntro_Sprites[];
extern u16 Img_ChapterIntro_Fog[];
extern u16 Pal_ChapterIntro_Fog[];
extern u16 Tsa_ChapterIntro_Fog[];

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
